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
.sub "_block11"  :anon :subid("10_1258904213.70809")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
    $P1217 = $P14()
.annotate "line", 1
    .return ($P1217)
.end


.namespace []
.sub "" :load :init :subid("post312") :outer("10_1258904213.70809")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258904213.70809" 
    .local pmc block
    set block, $P12
    $P1218 = get_root_global ["parrot"], "P6metaclass"
    $P1218."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1258904213.70809") :outer("10_1258904213.70809")
.annotate "line", 4
    get_hll_global $P1161, ["NQP";"Regex"], "_block1160" 
    capture_lex $P1161
    .const 'Sub' $P1154 = "297_1258904213.70809" 
    capture_lex $P1154
    .const 'Sub' $P1148 = "295_1258904213.70809" 
    capture_lex $P1148
    .const 'Sub' $P1141 = "293_1258904213.70809" 
    capture_lex $P1141
    .const 'Sub' $P1134 = "291_1258904213.70809" 
    capture_lex $P1134
    .const 'Sub' $P1127 = "289_1258904213.70809" 
    capture_lex $P1127
    .const 'Sub' $P1120 = "287_1258904213.70809" 
    capture_lex $P1120
    .const 'Sub' $P1114 = "285_1258904213.70809" 
    capture_lex $P1114
    .const 'Sub' $P1107 = "283_1258904213.70809" 
    capture_lex $P1107
    .const 'Sub' $P1100 = "281_1258904213.70809" 
    capture_lex $P1100
    .const 'Sub' $P1093 = "279_1258904213.70809" 
    capture_lex $P1093
    .const 'Sub' $P1086 = "277_1258904213.70809" 
    capture_lex $P1086
    .const 'Sub' $P1079 = "275_1258904213.70809" 
    capture_lex $P1079
    .const 'Sub' $P1072 = "273_1258904213.70809" 
    capture_lex $P1072
    .const 'Sub' $P1065 = "271_1258904213.70809" 
    capture_lex $P1065
    .const 'Sub' $P1058 = "269_1258904213.70809" 
    capture_lex $P1058
    .const 'Sub' $P1051 = "267_1258904213.70809" 
    capture_lex $P1051
    .const 'Sub' $P1044 = "265_1258904213.70809" 
    capture_lex $P1044
    .const 'Sub' $P1037 = "263_1258904213.70809" 
    capture_lex $P1037
    .const 'Sub' $P1030 = "261_1258904213.70809" 
    capture_lex $P1030
    .const 'Sub' $P1023 = "259_1258904213.70809" 
    capture_lex $P1023
    .const 'Sub' $P1016 = "257_1258904213.70809" 
    capture_lex $P1016
    .const 'Sub' $P1009 = "255_1258904213.70809" 
    capture_lex $P1009
    .const 'Sub' $P1002 = "253_1258904213.70809" 
    capture_lex $P1002
    .const 'Sub' $P995 = "251_1258904213.70809" 
    capture_lex $P995
    .const 'Sub' $P988 = "249_1258904213.70809" 
    capture_lex $P988
    .const 'Sub' $P981 = "247_1258904213.70809" 
    capture_lex $P981
    .const 'Sub' $P974 = "245_1258904213.70809" 
    capture_lex $P974
    .const 'Sub' $P967 = "243_1258904213.70809" 
    capture_lex $P967
    .const 'Sub' $P960 = "241_1258904213.70809" 
    capture_lex $P960
    .const 'Sub' $P953 = "239_1258904213.70809" 
    capture_lex $P953
    .const 'Sub' $P946 = "237_1258904213.70809" 
    capture_lex $P946
    .const 'Sub' $P939 = "235_1258904213.70809" 
    capture_lex $P939
    .const 'Sub' $P932 = "233_1258904213.70809" 
    capture_lex $P932
    .const 'Sub' $P925 = "231_1258904213.70809" 
    capture_lex $P925
    .const 'Sub' $P918 = "229_1258904213.70809" 
    capture_lex $P918
    .const 'Sub' $P911 = "227_1258904213.70809" 
    capture_lex $P911
    .const 'Sub' $P904 = "225_1258904213.70809" 
    capture_lex $P904
    .const 'Sub' $P897 = "223_1258904213.70809" 
    capture_lex $P897
    .const 'Sub' $P890 = "221_1258904213.70809" 
    capture_lex $P890
    .const 'Sub' $P883 = "219_1258904213.70809" 
    capture_lex $P883
    .const 'Sub' $P877 = "217_1258904213.70809" 
    capture_lex $P877
    .const 'Sub' $P871 = "215_1258904213.70809" 
    capture_lex $P871
    .const 'Sub' $P866 = "213_1258904213.70809" 
    capture_lex $P866
    .const 'Sub' $P860 = "211_1258904213.70809" 
    capture_lex $P860
    .const 'Sub' $P854 = "209_1258904213.70809" 
    capture_lex $P854
    .const 'Sub' $P849 = "207_1258904213.70809" 
    capture_lex $P849
    .const 'Sub' $P844 = "205_1258904213.70809" 
    capture_lex $P844
    .const 'Sub' $P837 = "203_1258904213.70809" 
    capture_lex $P837
    .const 'Sub' $P829 = "201_1258904213.70809" 
    capture_lex $P829
    .const 'Sub' $P824 = "199_1258904213.70809" 
    capture_lex $P824
    .const 'Sub' $P819 = "197_1258904213.70809" 
    capture_lex $P819
    .const 'Sub' $P811 = "195_1258904213.70809" 
    capture_lex $P811
    .const 'Sub' $P803 = "193_1258904213.70809" 
    capture_lex $P803
    .const 'Sub' $P798 = "191_1258904213.70809" 
    capture_lex $P798
    .const 'Sub' $P793 = "189_1258904213.70809" 
    capture_lex $P793
    .const 'Sub' $P787 = "187_1258904213.70809" 
    capture_lex $P787
    .const 'Sub' $P781 = "185_1258904213.70809" 
    capture_lex $P781
    .const 'Sub' $P775 = "183_1258904213.70809" 
    capture_lex $P775
    .const 'Sub' $P769 = "181_1258904213.70809" 
    capture_lex $P769
    .const 'Sub' $P764 = "179_1258904213.70809" 
    capture_lex $P764
    .const 'Sub' $P759 = "177_1258904213.70809" 
    capture_lex $P759
    .const 'Sub' $P746 = "173_1258904213.70809" 
    capture_lex $P746
    .const 'Sub' $P740 = "171_1258904213.70809" 
    capture_lex $P740
    .const 'Sub' $P733 = "169_1258904213.70809" 
    capture_lex $P733
    .const 'Sub' $P727 = "167_1258904213.70809" 
    capture_lex $P727
    .const 'Sub' $P719 = "165_1258904213.70809" 
    capture_lex $P719
    .const 'Sub' $P711 = "163_1258904213.70809" 
    capture_lex $P711
    .const 'Sub' $P705 = "161_1258904213.70809" 
    capture_lex $P705
    .const 'Sub' $P699 = "159_1258904213.70809" 
    capture_lex $P699
    .const 'Sub' $P684 = "155_1258904213.70809" 
    capture_lex $P684
    .const 'Sub' $P652 = "153_1258904213.70809" 
    capture_lex $P652
    .const 'Sub' $P644 = "151_1258904213.70809" 
    capture_lex $P644
    .const 'Sub' $P638 = "149_1258904213.70809" 
    capture_lex $P638
    .const 'Sub' $P628 = "147_1258904213.70809" 
    capture_lex $P628
    .const 'Sub' $P613 = "145_1258904213.70809" 
    capture_lex $P613
    .const 'Sub' $P604 = "143_1258904213.70809" 
    capture_lex $P604
    .const 'Sub' $P585 = "141_1258904213.70809" 
    capture_lex $P585
    .const 'Sub' $P566 = "139_1258904213.70809" 
    capture_lex $P566
    .const 'Sub' $P559 = "137_1258904213.70809" 
    capture_lex $P559
    .const 'Sub' $P552 = "135_1258904213.70809" 
    capture_lex $P552
    .const 'Sub' $P542 = "131_1258904213.70809" 
    capture_lex $P542
    .const 'Sub' $P531 = "129_1258904213.70809" 
    capture_lex $P531
    .const 'Sub' $P524 = "127_1258904213.70809" 
    capture_lex $P524
    .const 'Sub' $P517 = "125_1258904213.70809" 
    capture_lex $P517
    .const 'Sub' $P510 = "123_1258904213.70809" 
    capture_lex $P510
    .const 'Sub' $P483 = "119_1258904213.70809" 
    capture_lex $P483
    .const 'Sub' $P474 = "117_1258904213.70809" 
    capture_lex $P474
    .const 'Sub' $P467 = "115_1258904213.70809" 
    capture_lex $P467
    .const 'Sub' $P458 = "111_1258904213.70809" 
    capture_lex $P458
    .const 'Sub' $P453 = "109_1258904213.70809" 
    capture_lex $P453
    .const 'Sub' $P441 = "107_1258904213.70809" 
    capture_lex $P441
    .const 'Sub' $P430 = "105_1258904213.70809" 
    capture_lex $P430
    .const 'Sub' $P425 = "103_1258904213.70809" 
    capture_lex $P425
    .const 'Sub' $P419 = "101_1258904213.70809" 
    capture_lex $P419
    .const 'Sub' $P413 = "99_1258904213.70809" 
    capture_lex $P413
    .const 'Sub' $P407 = "97_1258904213.70809" 
    capture_lex $P407
    .const 'Sub' $P401 = "95_1258904213.70809" 
    capture_lex $P401
    .const 'Sub' $P395 = "93_1258904213.70809" 
    capture_lex $P395
    .const 'Sub' $P389 = "91_1258904213.70809" 
    capture_lex $P389
    .const 'Sub' $P383 = "89_1258904213.70809" 
    capture_lex $P383
    .const 'Sub' $P375 = "87_1258904213.70809" 
    capture_lex $P375
    .const 'Sub' $P367 = "85_1258904213.70809" 
    capture_lex $P367
    .const 'Sub' $P355 = "81_1258904213.70809" 
    capture_lex $P355
    .const 'Sub' $P347 = "79_1258904213.70809" 
    capture_lex $P347
    .const 'Sub' $P337 = "75_1258904213.70809" 
    capture_lex $P337
    .const 'Sub' $P330 = "73_1258904213.70809" 
    capture_lex $P330
    .const 'Sub' $P318 = "69_1258904213.70809" 
    capture_lex $P318
    .const 'Sub' $P298 = "67_1258904213.70809" 
    capture_lex $P298
    .const 'Sub' $P289 = "65_1258904213.70809" 
    capture_lex $P289
    .const 'Sub' $P271 = "62_1258904213.70809" 
    capture_lex $P271
    .const 'Sub' $P251 = "60_1258904213.70809" 
    capture_lex $P251
    .const 'Sub' $P242 = "56_1258904213.70809" 
    capture_lex $P242
    .const 'Sub' $P237 = "54_1258904213.70809" 
    capture_lex $P237
    .const 'Sub' $P228 = "50_1258904213.70809" 
    capture_lex $P228
    .const 'Sub' $P223 = "48_1258904213.70809" 
    capture_lex $P223
    .const 'Sub' $P215 = "46_1258904213.70809" 
    capture_lex $P215
    .const 'Sub' $P208 = "44_1258904213.70809" 
    capture_lex $P208
    .const 'Sub' $P202 = "42_1258904213.70809" 
    capture_lex $P202
    .const 'Sub' $P194 = "40_1258904213.70809" 
    capture_lex $P194
    .const 'Sub' $P188 = "38_1258904213.70809" 
    capture_lex $P188
    .const 'Sub' $P182 = "36_1258904213.70809" 
    capture_lex $P182
    .const 'Sub' $P166 = "33_1258904213.70809" 
    capture_lex $P166
    .const 'Sub' $P153 = "31_1258904213.70809" 
    capture_lex $P153
    .const 'Sub' $P146 = "29_1258904213.70809" 
    capture_lex $P146
    .const 'Sub' $P103 = "26_1258904213.70809" 
    capture_lex $P103
    .const 'Sub' $P85 = "23_1258904213.70809" 
    capture_lex $P85
    .const 'Sub' $P75 = "21_1258904213.70809" 
    capture_lex $P75
    .const 'Sub' $P61 = "19_1258904213.70809" 
    capture_lex $P61
    .const 'Sub' $P46 = "17_1258904213.70809" 
    capture_lex $P46
    .const 'Sub' $P39 = "15_1258904213.70809" 
    capture_lex $P39
    .const 'Sub' $P33 = "13_1258904213.70809" 
    capture_lex $P33
    .const 'Sub' $P15 = "12_1258904213.70809" 
    capture_lex $P15
.annotate "line", 489
    get_hll_global $P1161, ["NQP";"Regex"], "_block1160" 
    capture_lex $P1161
    $P1200 = $P1161()
.annotate "line", 4
    .return ($P1200)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post313") :outer("11_1258904213.70809")
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 382
    get_hll_global $P1201, ["NQP"], "Grammar"
    $P1201."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate "line", 383
    get_hll_global $P1202, ["NQP"], "Grammar"
    $P1202."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate "line", 384
    get_hll_global $P1203, ["NQP"], "Grammar"
    $P1203."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate "line", 385
    get_hll_global $P1204, ["NQP"], "Grammar"
    $P1204."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate "line", 386
    get_hll_global $P1205, ["NQP"], "Grammar"
    $P1205."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate "line", 387
    get_hll_global $P1206, ["NQP"], "Grammar"
    $P1206."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate "line", 388
    get_hll_global $P1207, ["NQP"], "Grammar"
    $P1207."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate "line", 389
    get_hll_global $P1208, ["NQP"], "Grammar"
    $P1208."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate "line", 390
    get_hll_global $P1209, ["NQP"], "Grammar"
    $P1209."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate "line", 391
    get_hll_global $P1210, ["NQP"], "Grammar"
    $P1210."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate "line", 392
    get_hll_global $P1211, ["NQP"], "Grammar"
    $P1211."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate "line", 393
    get_hll_global $P1212, ["NQP"], "Grammar"
    $P1212."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate "line", 394
    get_hll_global $P1213, ["NQP"], "Grammar"
    $P1213."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate "line", 395
    get_hll_global $P1214, ["NQP"], "Grammar"
    $P1214."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate "line", 396
    get_hll_global $P1215, ["NQP"], "Grammar"
    $P1215."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate "line", 381
    $P1216 = get_root_global ["parrot"], "P6metaclass"
    $P1216."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "TOP"  :subid("12_1258904213.70809") :method :outer("11_1258904213.70809")
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
    unless_null $P20, vivify_314
    get_hll_global $P20, "%LANG"
    unless_null $P20, vivify_315
    die "Contextual %*LANG not found"
  vivify_315:
  vivify_314:
.annotate "line", 6
    get_hll_global $P21, ["NQP"], "Regex"
    find_lex $P22, "%*LANG"
    unless_null $P22, vivify_316
    get_hll_global $P22, "%LANG"
    unless_null $P22, vivify_317
    die "Contextual %*LANG not found"
  vivify_317:
    store_lex "%*LANG", $P22
  vivify_316:
    set $P22["Regex"], $P21
.annotate "line", 7
    get_hll_global $P23, ["NQP"], "RegexActions"
    find_lex $P24, "%*LANG"
    unless_null $P24, vivify_318
    get_hll_global $P24, "%LANG"
    unless_null $P24, vivify_319
    die "Contextual %*LANG not found"
  vivify_319:
    store_lex "%*LANG", $P24
  vivify_318:
    set $P24["Regex-actions"], $P23
.annotate "line", 8
    get_hll_global $P25, ["NQP"], "Grammar"
    find_lex $P26, "%*LANG"
    unless_null $P26, vivify_320
    get_hll_global $P26, "%LANG"
    unless_null $P26, vivify_321
    die "Contextual %*LANG not found"
  vivify_321:
    store_lex "%*LANG", $P26
  vivify_320:
    set $P26["MAIN"], $P25
.annotate "line", 9
    get_hll_global $P27, ["NQP"], "Actions"
    find_lex $P28, "%*LANG"
    unless_null $P28, vivify_322
    get_hll_global $P28, "%LANG"
    unless_null $P28, vivify_323
    die "Contextual %*LANG not found"
  vivify_323:
    store_lex "%*LANG", $P28
  vivify_322:
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
.sub "identifier"  :subid("13_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx34_tgt
    .local int rx34_pos
    .local int rx34_off
    .local int rx34_eos
    .local int rx34_rep
    .local pmc rx34_cur
    (rx34_cur, rx34_pos, rx34_tgt, $I10) = self."!cursor_start"()
    rx34_cur."!cursor_debug"("START ", "identifier")
    .lex unicode:"$\x{a2}", rx34_cur
    .local pmc match
    .lex "$/", match
    length rx34_eos, rx34_tgt
    set rx34_off, 0
    lt $I10, 2, rx34_start
    sub rx34_off, $I10, 1
    substr rx34_tgt, rx34_tgt, rx34_off
  rx34_start:
    ge rx34_pos, 0, rxscan38_done
  rxscan38_loop:
    ($P10) = rx34_cur."from"()
    inc $P10
    set rx34_pos, $P10
    ge rx34_pos, rx34_eos, rxscan38_done
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
.sub "!PREFIX__identifier"  :subid("14_1258904213.70809") :method
.annotate "line", 4
    $P36 = self."!PREFIX__!subrule"("ident", "")
    new $P37, "ResizablePMCArray"
    push $P37, $P36
    .return ($P37)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx40_tgt
    .local int rx40_pos
    .local int rx40_off
    .local int rx40_eos
    .local int rx40_rep
    .local pmc rx40_cur
    (rx40_cur, rx40_pos, rx40_tgt, $I10) = self."!cursor_start"()
    rx40_cur."!cursor_debug"("START ", "name")
    rx40_cur."!cursor_caparray"("identifier")
    .lex unicode:"$\x{a2}", rx40_cur
    .local pmc match
    .lex "$/", match
    length rx40_eos, rx40_tgt
    set rx40_off, 0
    lt $I10, 2, rx40_start
    sub rx40_off, $I10, 1
    substr rx40_tgt, rx40_tgt, rx40_off
  rx40_start:
    ge rx40_pos, 0, rxscan43_done
  rxscan43_loop:
    ($P10) = rx40_cur."from"()
    inc $P10
    set rx40_pos, $P10
    ge rx40_pos, rx40_eos, rxscan43_done
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
.sub "!PREFIX__name"  :subid("16_1258904213.70809") :method
.annotate "line", 4
    new $P42, "ResizablePMCArray"
    push $P42, ""
    .return ($P42)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx47_tgt
    .local int rx47_pos
    .local int rx47_off
    .local int rx47_eos
    .local int rx47_rep
    .local pmc rx47_cur
    (rx47_cur, rx47_pos, rx47_tgt, $I10) = self."!cursor_start"()
    rx47_cur."!cursor_debug"("START ", "deflongname")
    rx47_cur."!cursor_caparray"("sym")
    .lex unicode:"$\x{a2}", rx47_cur
    .local pmc match
    .lex "$/", match
    length rx47_eos, rx47_tgt
    set rx47_off, 0
    lt $I10, 2, rx47_start
    sub rx47_off, $I10, 1
    substr rx47_tgt, rx47_tgt, rx47_off
  rx47_start:
    ge rx47_pos, 0, rxscan51_done
  rxscan51_loop:
    ($P10) = rx47_cur."from"()
    inc $P10
    set rx47_pos, $P10
    ge rx47_pos, rx47_eos, rxscan51_done
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
.sub "!PREFIX__deflongname"  :subid("18_1258904213.70809") :method
.annotate "line", 4
    $P49 = self."!PREFIX__!subrule"("identifier", "")
    new $P50, "ResizablePMCArray"
    push $P50, $P49
    .return ($P50)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx62_tgt
    .local int rx62_pos
    .local int rx62_off
    .local int rx62_eos
    .local int rx62_rep
    .local pmc rx62_cur
    (rx62_cur, rx62_pos, rx62_tgt, $I10) = self."!cursor_start"()
    rx62_cur."!cursor_debug"("START ", "ENDSTMT")
    .lex unicode:"$\x{a2}", rx62_cur
    .local pmc match
    .lex "$/", match
    length rx62_eos, rx62_tgt
    set rx62_off, 0
    lt $I10, 2, rx62_start
    sub rx62_off, $I10, 1
    substr rx62_tgt, rx62_tgt, rx62_off
  rx62_start:
    ge rx62_pos, 0, rxscan65_done
  rxscan65_loop:
    ($P10) = rx62_cur."from"()
    inc $P10
    set rx62_pos, $P10
    ge rx62_pos, rx62_eos, rxscan65_done
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
.sub "!PREFIX__ENDSTMT"  :subid("20_1258904213.70809") :method
.annotate "line", 4
    new $P64, "ResizablePMCArray"
    push $P64, ""
    .return ($P64)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx76_tgt
    .local int rx76_pos
    .local int rx76_off
    .local int rx76_eos
    .local int rx76_rep
    .local pmc rx76_cur
    (rx76_cur, rx76_pos, rx76_tgt, $I10) = self."!cursor_start"()
    rx76_cur."!cursor_debug"("START ", "ws")
    .lex unicode:"$\x{a2}", rx76_cur
    .local pmc match
    .lex "$/", match
    length rx76_eos, rx76_tgt
    set rx76_off, 0
    lt $I10, 2, rx76_start
    sub rx76_off, $I10, 1
    substr rx76_tgt, rx76_tgt, rx76_off
  rx76_start:
    ge rx76_pos, 0, rxscan79_done
  rxscan79_loop:
    ($P10) = rx76_cur."from"()
    inc $P10
    set rx76_pos, $P10
    ge rx76_pos, rx76_eos, rxscan79_done
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
.sub "!PREFIX__ws"  :subid("22_1258904213.70809") :method
.annotate "line", 4
    new $P78, "ResizablePMCArray"
    push $P78, ""
    push $P78, ""
    .return ($P78)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .const 'Sub' $P93 = "25_1258904213.70809" 
    capture_lex $P93
    .local string rx86_tgt
    .local int rx86_pos
    .local int rx86_off
    .local int rx86_eos
    .local int rx86_rep
    .local pmc rx86_cur
    (rx86_cur, rx86_pos, rx86_tgt, $I10) = self."!cursor_start"()
    rx86_cur."!cursor_debug"("START ", "unv")
    .lex unicode:"$\x{a2}", rx86_cur
    .local pmc match
    .lex "$/", match
    length rx86_eos, rx86_tgt
    set rx86_off, 0
    lt $I10, 2, rx86_start
    sub rx86_off, $I10, 1
    substr rx86_tgt, rx86_tgt, rx86_off
  rx86_start:
    ge rx86_pos, 0, rxscan89_done
  rxscan89_loop:
    ($P10) = rx86_cur."from"()
    inc $P10
    set rx86_pos, $P10
    ge rx86_pos, rx86_eos, rxscan89_done
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
    .const 'Sub' $P93 = "25_1258904213.70809" 
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
.sub "!PREFIX__unv"  :subid("24_1258904213.70809") :method
.annotate "line", 4
    new $P88, "ResizablePMCArray"
    push $P88, ""
    push $P88, ""
    push $P88, ""
    .return ($P88)
.end


.namespace ["NQP";"Grammar"]
.sub "_block92"  :anon :subid("25_1258904213.70809") :method :outer("23_1258904213.70809")
.annotate "line", 45
    .local string rx94_tgt
    .local int rx94_pos
    .local int rx94_off
    .local int rx94_eos
    .local int rx94_rep
    .local pmc rx94_cur
    (rx94_cur, rx94_pos, rx94_tgt, $I10) = self."!cursor_start"()
    rx94_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx94_cur
    .local pmc match
    .lex "$/", match
    length rx94_eos, rx94_tgt
    set rx94_off, 0
    lt $I10, 2, rx94_start
    sub rx94_off, $I10, 1
    substr rx94_tgt, rx94_tgt, rx94_off
  rx94_start:
    ge rx94_pos, 0, rxscan95_done
  rxscan95_loop:
    ($P10) = rx94_cur."from"()
    inc $P10
    set rx94_pos, $P10
    ge rx94_pos, rx94_eos, rxscan95_done
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
.sub "pod_comment"  :subid("26_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .const 'Sub' $P138 = "28_1258904213.70809" 
    capture_lex $P138
    .local string rx104_tgt
    .local int rx104_pos
    .local int rx104_off
    .local int rx104_eos
    .local int rx104_rep
    .local pmc rx104_cur
    (rx104_cur, rx104_pos, rx104_tgt, $I10) = self."!cursor_start"()
    rx104_cur."!cursor_debug"("START ", "pod_comment")
    .lex unicode:"$\x{a2}", rx104_cur
    .local pmc match
    .lex "$/", match
    length rx104_eos, rx104_tgt
    set rx104_off, 0
    lt $I10, 2, rx104_start
    sub rx104_off, $I10, 1
    substr rx104_tgt, rx104_tgt, rx104_off
  rx104_start:
    ge rx104_pos, 0, rxscan107_done
  rxscan107_loop:
    ($P10) = rx104_cur."from"()
    inc $P10
    set rx104_pos, $P10
    ge rx104_pos, rx104_eos, rxscan107_done
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
    .const 'Sub' $P138 = "28_1258904213.70809" 
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
.sub "!PREFIX__pod_comment"  :subid("27_1258904213.70809") :method
.annotate "line", 4
    new $P106, "ResizablePMCArray"
    push $P106, ""
    .return ($P106)
.end


.namespace ["NQP";"Grammar"]
.sub "_block137"  :anon :subid("28_1258904213.70809") :method :outer("26_1258904213.70809")
.annotate "line", 68
    .local string rx139_tgt
    .local int rx139_pos
    .local int rx139_off
    .local int rx139_eos
    .local int rx139_rep
    .local pmc rx139_cur
    (rx139_cur, rx139_pos, rx139_tgt, $I10) = self."!cursor_start"()
    rx139_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx139_cur
    .local pmc match
    .lex "$/", match
    length rx139_eos, rx139_tgt
    set rx139_off, 0
    lt $I10, 2, rx139_start
    sub rx139_off, $I10, 1
    substr rx139_tgt, rx139_tgt, rx139_off
  rx139_start:
    ge rx139_pos, 0, rxscan140_done
  rxscan140_loop:
    ($P10) = rx139_cur."from"()
    inc $P10
    set rx139_pos, $P10
    ge rx139_pos, rx139_eos, rxscan140_done
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
.sub "comp_unit"  :subid("29_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx147_tgt
    .local int rx147_pos
    .local int rx147_off
    .local int rx147_eos
    .local int rx147_rep
    .local pmc rx147_cur
    (rx147_cur, rx147_pos, rx147_tgt, $I10) = self."!cursor_start"()
    rx147_cur."!cursor_debug"("START ", "comp_unit")
    .lex unicode:"$\x{a2}", rx147_cur
    .local pmc match
    .lex "$/", match
    length rx147_eos, rx147_tgt
    set rx147_off, 0
    lt $I10, 2, rx147_start
    sub rx147_off, $I10, 1
    substr rx147_tgt, rx147_tgt, rx147_off
  rx147_start:
    ge rx147_pos, 0, rxscan151_done
  rxscan151_loop:
    ($P10) = rx147_cur."from"()
    inc $P10
    set rx147_pos, $P10
    ge rx147_pos, rx147_eos, rxscan151_done
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
.sub "!PREFIX__comp_unit"  :subid("30_1258904213.70809") :method
.annotate "line", 4
    $P149 = self."!PREFIX__!subrule"("", "")
    new $P150, "ResizablePMCArray"
    push $P150, $P149
    .return ($P150)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx154_tgt
    .local int rx154_pos
    .local int rx154_off
    .local int rx154_eos
    .local int rx154_rep
    .local pmc rx154_cur
    (rx154_cur, rx154_pos, rx154_tgt, $I10) = self."!cursor_start"()
    rx154_cur."!cursor_debug"("START ", "statementlist")
    rx154_cur."!cursor_caparray"("statement")
    .lex unicode:"$\x{a2}", rx154_cur
    .local pmc match
    .lex "$/", match
    length rx154_eos, rx154_tgt
    set rx154_off, 0
    lt $I10, 2, rx154_start
    sub rx154_off, $I10, 1
    substr rx154_tgt, rx154_tgt, rx154_off
  rx154_start:
    ge rx154_pos, 0, rxscan157_done
  rxscan157_loop:
    ($P10) = rx154_cur."from"()
    inc $P10
    set rx154_pos, $P10
    ge rx154_pos, rx154_eos, rxscan157_done
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
.sub "!PREFIX__statementlist"  :subid("32_1258904213.70809") :method
.annotate "line", 4
    new $P156, "ResizablePMCArray"
    push $P156, ""
    push $P156, ""
    .return ($P156)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .const 'Sub' $P172 = "35_1258904213.70809" 
    capture_lex $P172
    .local string rx167_tgt
    .local int rx167_pos
    .local int rx167_off
    .local int rx167_eos
    .local int rx167_rep
    .local pmc rx167_cur
    (rx167_cur, rx167_pos, rx167_tgt, $I10) = self."!cursor_start"()
    rx167_cur."!cursor_debug"("START ", "statement")
    rx167_cur."!cursor_caparray"("statement_mod_cond", "statement_mod_loop")
    .lex unicode:"$\x{a2}", rx167_cur
    .local pmc match
    .lex "$/", match
    length rx167_eos, rx167_tgt
    set rx167_off, 0
    lt $I10, 2, rx167_start
    sub rx167_off, $I10, 1
    substr rx167_tgt, rx167_tgt, rx167_off
  rx167_start:
    ge rx167_pos, 0, rxscan170_done
  rxscan170_loop:
    ($P10) = rx167_cur."from"()
    inc $P10
    set rx167_pos, $P10
    ge rx167_pos, rx167_eos, rxscan170_done
    set_addr $I10, rxscan170_loop
    rx167_cur."!mark_push"(0, rx167_pos, $I10)
  rxscan170_done:
.annotate "line", 90
  # rx subrule "before" subtype=zerowidth negate=1
    rx167_cur."!cursor_pos"(rx167_pos)
    .const 'Sub' $P172 = "35_1258904213.70809" 
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
.sub "!PREFIX__statement"  :subid("34_1258904213.70809") :method
.annotate "line", 4
    new $P169, "ResizablePMCArray"
    push $P169, ""
    .return ($P169)
.end


.namespace ["NQP";"Grammar"]
.sub "_block171"  :anon :subid("35_1258904213.70809") :method :outer("33_1258904213.70809")
.annotate "line", 90
    .local string rx173_tgt
    .local int rx173_pos
    .local int rx173_off
    .local int rx173_eos
    .local int rx173_rep
    .local pmc rx173_cur
    (rx173_cur, rx173_pos, rx173_tgt, $I10) = self."!cursor_start"()
    rx173_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx173_cur
    .local pmc match
    .lex "$/", match
    length rx173_eos, rx173_tgt
    set rx173_off, 0
    lt $I10, 2, rx173_start
    sub rx173_off, $I10, 1
    substr rx173_tgt, rx173_tgt, rx173_off
  rx173_start:
    ge rx173_pos, 0, rxscan174_done
  rxscan174_loop:
    ($P10) = rx173_cur."from"()
    inc $P10
    set rx173_pos, $P10
    ge rx173_pos, rx173_eos, rxscan174_done
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
.sub "eat_terminator"  :subid("36_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx183_tgt
    .local int rx183_pos
    .local int rx183_off
    .local int rx183_eos
    .local int rx183_rep
    .local pmc rx183_cur
    (rx183_cur, rx183_pos, rx183_tgt, $I10) = self."!cursor_start"()
    rx183_cur."!cursor_debug"("START ", "eat_terminator")
    .lex unicode:"$\x{a2}", rx183_cur
    .local pmc match
    .lex "$/", match
    length rx183_eos, rx183_tgt
    set rx183_off, 0
    lt $I10, 2, rx183_start
    sub rx183_off, $I10, 1
    substr rx183_tgt, rx183_tgt, rx183_off
  rx183_start:
    ge rx183_pos, 0, rxscan186_done
  rxscan186_loop:
    ($P10) = rx183_cur."from"()
    inc $P10
    set rx183_pos, $P10
    ge rx183_pos, rx183_eos, rxscan186_done
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
.sub "!PREFIX__eat_terminator"  :subid("37_1258904213.70809") :method
.annotate "line", 4
    new $P185, "ResizablePMCArray"
    push $P185, ""
    push $P185, ""
    push $P185, ""
    push $P185, ";"
    .return ($P185)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx189_tgt
    .local int rx189_pos
    .local int rx189_off
    .local int rx189_eos
    .local int rx189_rep
    .local pmc rx189_cur
    (rx189_cur, rx189_pos, rx189_tgt, $I10) = self."!cursor_start"()
    rx189_cur."!cursor_debug"("START ", "xblock")
    .lex unicode:"$\x{a2}", rx189_cur
    .local pmc match
    .lex "$/", match
    length rx189_eos, rx189_tgt
    set rx189_off, 0
    lt $I10, 2, rx189_start
    sub rx189_off, $I10, 1
    substr rx189_tgt, rx189_tgt, rx189_off
  rx189_start:
    ge rx189_pos, 0, rxscan193_done
  rxscan193_loop:
    ($P10) = rx189_cur."from"()
    inc $P10
    set rx189_pos, $P10
    ge rx189_pos, rx189_eos, rxscan193_done
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
.sub "!PREFIX__xblock"  :subid("39_1258904213.70809") :method
.annotate "line", 4
    $P191 = self."!PREFIX__!subrule"("EXPR", "")
    new $P192, "ResizablePMCArray"
    push $P192, $P191
    .return ($P192)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx195_tgt
    .local int rx195_pos
    .local int rx195_off
    .local int rx195_eos
    .local int rx195_rep
    .local pmc rx195_cur
    (rx195_cur, rx195_pos, rx195_tgt, $I10) = self."!cursor_start"()
    rx195_cur."!cursor_debug"("START ", "pblock")
    .lex unicode:"$\x{a2}", rx195_cur
    .local pmc match
    .lex "$/", match
    length rx195_eos, rx195_tgt
    set rx195_off, 0
    lt $I10, 2, rx195_start
    sub rx195_off, $I10, 1
    substr rx195_tgt, rx195_tgt, rx195_off
  rx195_start:
    ge rx195_pos, 0, rxscan200_done
  rxscan200_loop:
    ($P10) = rx195_cur."from"()
    inc $P10
    set rx195_pos, $P10
    ge rx195_pos, rx195_eos, rxscan200_done
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
.sub "!PREFIX__pblock"  :subid("41_1258904213.70809") :method
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
.sub "lambda"  :subid("42_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx203_tgt
    .local int rx203_pos
    .local int rx203_off
    .local int rx203_eos
    .local int rx203_rep
    .local pmc rx203_cur
    (rx203_cur, rx203_pos, rx203_tgt, $I10) = self."!cursor_start"()
    rx203_cur."!cursor_debug"("START ", "lambda")
    .lex unicode:"$\x{a2}", rx203_cur
    .local pmc match
    .lex "$/", match
    length rx203_eos, rx203_tgt
    set rx203_off, 0
    lt $I10, 2, rx203_start
    sub rx203_off, $I10, 1
    substr rx203_tgt, rx203_tgt, rx203_off
  rx203_start:
    ge rx203_pos, 0, rxscan206_done
  rxscan206_loop:
    ($P10) = rx203_cur."from"()
    inc $P10
    set rx203_pos, $P10
    ge rx203_pos, rx203_eos, rxscan206_done
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
.sub "!PREFIX__lambda"  :subid("43_1258904213.70809") :method
.annotate "line", 4
    new $P205, "ResizablePMCArray"
    push $P205, "<->"
    push $P205, "->"
    .return ($P205)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx209_tgt
    .local int rx209_pos
    .local int rx209_off
    .local int rx209_eos
    .local int rx209_rep
    .local pmc rx209_cur
    (rx209_cur, rx209_pos, rx209_tgt, $I10) = self."!cursor_start"()
    rx209_cur."!cursor_debug"("START ", "block")
    .lex unicode:"$\x{a2}", rx209_cur
    .local pmc match
    .lex "$/", match
    length rx209_eos, rx209_tgt
    set rx209_off, 0
    lt $I10, 2, rx209_start
    sub rx209_off, $I10, 1
    substr rx209_tgt, rx209_tgt, rx209_off
  rx209_start:
    ge rx209_pos, 0, rxscan213_done
  rxscan213_loop:
    ($P10) = rx209_cur."from"()
    inc $P10
    set rx209_pos, $P10
    ge rx209_pos, rx209_eos, rxscan213_done
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
.sub "!PREFIX__block"  :subid("45_1258904213.70809") :method
.annotate "line", 4
    $P211 = self."!PREFIX__!subrule"("", "")
    new $P212, "ResizablePMCArray"
    push $P212, $P211
    push $P212, "{"
    .return ($P212)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx216_tgt
    .local int rx216_pos
    .local int rx216_off
    .local int rx216_eos
    .local int rx216_rep
    .local pmc rx216_cur
    (rx216_cur, rx216_pos, rx216_tgt, $I10) = self."!cursor_start"()
    rx216_cur."!cursor_debug"("START ", "blockoid")
    .lex unicode:"$\x{a2}", rx216_cur
    .local pmc match
    .lex "$/", match
    length rx216_eos, rx216_tgt
    set rx216_off, 0
    lt $I10, 2, rx216_start
    sub rx216_off, $I10, 1
    substr rx216_tgt, rx216_tgt, rx216_off
  rx216_start:
    ge rx216_pos, 0, rxscan220_done
  rxscan220_loop:
    ($P10) = rx216_cur."from"()
    inc $P10
    set rx216_pos, $P10
    ge rx216_pos, rx216_eos, rxscan220_done
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
.sub "!PREFIX__blockoid"  :subid("47_1258904213.70809") :method
.annotate "line", 4
    $P218 = self."!PREFIX__!subrule"("", "")
    new $P219, "ResizablePMCArray"
    push $P219, $P218
    .return ($P219)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx224_tgt
    .local int rx224_pos
    .local int rx224_off
    .local int rx224_eos
    .local int rx224_rep
    .local pmc rx224_cur
    (rx224_cur, rx224_pos, rx224_tgt, $I10) = self."!cursor_start"()
    rx224_cur."!cursor_debug"("START ", "newpad")
    .lex unicode:"$\x{a2}", rx224_cur
    .local pmc match
    .lex "$/", match
    length rx224_eos, rx224_tgt
    set rx224_off, 0
    lt $I10, 2, rx224_start
    sub rx224_off, $I10, 1
    substr rx224_tgt, rx224_tgt, rx224_off
  rx224_start:
    ge rx224_pos, 0, rxscan227_done
  rxscan227_loop:
    ($P10) = rx224_cur."from"()
    inc $P10
    set rx224_pos, $P10
    ge rx224_pos, rx224_eos, rxscan227_done
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
.sub "!PREFIX__newpad"  :subid("49_1258904213.70809") :method
.annotate "line", 4
    new $P226, "ResizablePMCArray"
    push $P226, ""
    .return ($P226)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("50_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx229_tgt
    .local int rx229_pos
    .local int rx229_off
    .local int rx229_eos
    .local int rx229_rep
    .local pmc rx229_cur
    (rx229_cur, rx229_pos, rx229_tgt, $I10) = self."!cursor_start"()
    rx229_cur."!cursor_debug"("START ", "finishpad")
    .lex unicode:"$\x{a2}", rx229_cur
    .local pmc match
    .lex "$/", match
    length rx229_eos, rx229_tgt
    set rx229_off, 0
    lt $I10, 2, rx229_start
    sub rx229_off, $I10, 1
    substr rx229_tgt, rx229_tgt, rx229_off
  rx229_start:
    ge rx229_pos, 0, rxscan232_done
  rxscan232_loop:
    ($P10) = rx229_cur."from"()
    inc $P10
    set rx229_pos, $P10
    ge rx229_pos, rx229_eos, rxscan232_done
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
.sub "!PREFIX__finishpad"  :subid("51_1258904213.70809") :method
.annotate "line", 4
    new $P231, "ResizablePMCArray"
    push $P231, ""
    .return ($P231)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("52_1258904213.70809") :method
.annotate "line", 140
    $P234 = self."!protoregex"("terminator")
    .return ($P234)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("53_1258904213.70809") :method
.annotate "line", 140
    $P236 = self."!PREFIX__!protoregex"("terminator")
    .return ($P236)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("54_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx238_tgt
    .local int rx238_pos
    .local int rx238_off
    .local int rx238_eos
    .local int rx238_rep
    .local pmc rx238_cur
    (rx238_cur, rx238_pos, rx238_tgt, $I10) = self."!cursor_start"()
    rx238_cur."!cursor_debug"("START ", "terminator:sym<;>")
    .lex unicode:"$\x{a2}", rx238_cur
    .local pmc match
    .lex "$/", match
    length rx238_eos, rx238_tgt
    set rx238_off, 0
    lt $I10, 2, rx238_start
    sub rx238_off, $I10, 1
    substr rx238_tgt, rx238_tgt, rx238_off
  rx238_start:
    ge rx238_pos, 0, rxscan241_done
  rxscan241_loop:
    ($P10) = rx238_cur."from"()
    inc $P10
    set rx238_pos, $P10
    ge rx238_pos, rx238_eos, rxscan241_done
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
.sub "!PREFIX__terminator:sym<;>"  :subid("55_1258904213.70809") :method
.annotate "line", 4
    new $P240, "ResizablePMCArray"
    push $P240, ";"
    .return ($P240)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("56_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx243_tgt
    .local int rx243_pos
    .local int rx243_off
    .local int rx243_eos
    .local int rx243_rep
    .local pmc rx243_cur
    (rx243_cur, rx243_pos, rx243_tgt, $I10) = self."!cursor_start"()
    rx243_cur."!cursor_debug"("START ", "terminator:sym<}>")
    .lex unicode:"$\x{a2}", rx243_cur
    .local pmc match
    .lex "$/", match
    length rx243_eos, rx243_tgt
    set rx243_off, 0
    lt $I10, 2, rx243_start
    sub rx243_off, $I10, 1
    substr rx243_tgt, rx243_tgt, rx243_off
  rx243_start:
    ge rx243_pos, 0, rxscan246_done
  rxscan246_loop:
    ($P10) = rx243_cur."from"()
    inc $P10
    set rx243_pos, $P10
    ge rx243_pos, rx243_eos, rxscan246_done
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
.sub "!PREFIX__terminator:sym<}>"  :subid("57_1258904213.70809") :method
.annotate "line", 4
    new $P245, "ResizablePMCArray"
    push $P245, "}"
    .return ($P245)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("58_1258904213.70809") :method
.annotate "line", 147
    $P248 = self."!protoregex"("statement_control")
    .return ($P248)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("59_1258904213.70809") :method
.annotate "line", 147
    $P250 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P250)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("60_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx252_tgt
    .local int rx252_pos
    .local int rx252_off
    .local int rx252_eos
    .local int rx252_rep
    .local pmc rx252_cur
    (rx252_cur, rx252_pos, rx252_tgt, $I10) = self."!cursor_start"()
    rx252_cur."!cursor_debug"("START ", "statement_control:sym<if>")
    rx252_cur."!cursor_caparray"("else", "xblock")
    .lex unicode:"$\x{a2}", rx252_cur
    .local pmc match
    .lex "$/", match
    length rx252_eos, rx252_tgt
    set rx252_off, 0
    lt $I10, 2, rx252_start
    sub rx252_off, $I10, 1
    substr rx252_tgt, rx252_tgt, rx252_off
  rx252_start:
    ge rx252_pos, 0, rxscan255_done
  rxscan255_loop:
    ($P10) = rx252_cur."from"()
    inc $P10
    set rx252_pos, $P10
    ge rx252_pos, rx252_eos, rxscan255_done
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
.sub "!PREFIX__statement_control:sym<if>"  :subid("61_1258904213.70809") :method
.annotate "line", 4
    new $P254, "ResizablePMCArray"
    push $P254, "if"
    .return ($P254)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("62_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .const 'Sub' $P282 = "64_1258904213.70809" 
    capture_lex $P282
    .local string rx272_tgt
    .local int rx272_pos
    .local int rx272_off
    .local int rx272_eos
    .local int rx272_rep
    .local pmc rx272_cur
    (rx272_cur, rx272_pos, rx272_tgt, $I10) = self."!cursor_start"()
    rx272_cur."!cursor_debug"("START ", "statement_control:sym<unless>")
    .lex unicode:"$\x{a2}", rx272_cur
    .local pmc match
    .lex "$/", match
    length rx272_eos, rx272_tgt
    set rx272_off, 0
    lt $I10, 2, rx272_start
    sub rx272_off, $I10, 1
    substr rx272_tgt, rx272_tgt, rx272_off
  rx272_start:
    ge rx272_pos, 0, rxscan275_done
  rxscan275_loop:
    ($P10) = rx272_cur."from"()
    inc $P10
    set rx272_pos, $P10
    ge rx272_pos, rx272_eos, rxscan275_done
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
    .const 'Sub' $P282 = "64_1258904213.70809" 
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
.sub "!PREFIX__statement_control:sym<unless>"  :subid("63_1258904213.70809") :method
.annotate "line", 4
    new $P274, "ResizablePMCArray"
    push $P274, "unless"
    .return ($P274)
.end


.namespace ["NQP";"Grammar"]
.sub "_block281"  :anon :subid("64_1258904213.70809") :method :outer("62_1258904213.70809")
.annotate "line", 159
    .local string rx283_tgt
    .local int rx283_pos
    .local int rx283_off
    .local int rx283_eos
    .local int rx283_rep
    .local pmc rx283_cur
    (rx283_cur, rx283_pos, rx283_tgt, $I10) = self."!cursor_start"()
    rx283_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx283_cur
    .local pmc match
    .lex "$/", match
    length rx283_eos, rx283_tgt
    set rx283_off, 0
    lt $I10, 2, rx283_start
    sub rx283_off, $I10, 1
    substr rx283_tgt, rx283_tgt, rx283_off
  rx283_start:
    ge rx283_pos, 0, rxscan284_done
  rxscan284_loop:
    ($P10) = rx283_cur."from"()
    inc $P10
    set rx283_pos, $P10
    ge rx283_pos, rx283_eos, rxscan284_done
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
.sub "statement_control:sym<while>"  :subid("65_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx290_tgt
    .local int rx290_pos
    .local int rx290_off
    .local int rx290_eos
    .local int rx290_rep
    .local pmc rx290_cur
    (rx290_cur, rx290_pos, rx290_tgt, $I10) = self."!cursor_start"()
    rx290_cur."!cursor_debug"("START ", "statement_control:sym<while>")
    .lex unicode:"$\x{a2}", rx290_cur
    .local pmc match
    .lex "$/", match
    length rx290_eos, rx290_tgt
    set rx290_off, 0
    lt $I10, 2, rx290_start
    sub rx290_off, $I10, 1
    substr rx290_tgt, rx290_tgt, rx290_off
  rx290_start:
    ge rx290_pos, 0, rxscan293_done
  rxscan293_loop:
    ($P10) = rx290_cur."from"()
    inc $P10
    set rx290_pos, $P10
    ge rx290_pos, rx290_eos, rxscan293_done
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
.sub "!PREFIX__statement_control:sym<while>"  :subid("66_1258904213.70809") :method
.annotate "line", 4
    new $P292, "ResizablePMCArray"
    push $P292, "until"
    push $P292, "while"
    .return ($P292)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("67_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx299_tgt
    .local int rx299_pos
    .local int rx299_off
    .local int rx299_eos
    .local int rx299_rep
    .local pmc rx299_cur
    (rx299_cur, rx299_pos, rx299_tgt, $I10) = self."!cursor_start"()
    rx299_cur."!cursor_debug"("START ", "statement_control:sym<repeat>")
    .lex unicode:"$\x{a2}", rx299_cur
    .local pmc match
    .lex "$/", match
    length rx299_eos, rx299_tgt
    set rx299_off, 0
    lt $I10, 2, rx299_start
    sub rx299_off, $I10, 1
    substr rx299_tgt, rx299_tgt, rx299_off
  rx299_start:
    ge rx299_pos, 0, rxscan302_done
  rxscan302_loop:
    ($P10) = rx299_cur."from"()
    inc $P10
    set rx299_pos, $P10
    ge rx299_pos, rx299_eos, rxscan302_done
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
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("68_1258904213.70809") :method
.annotate "line", 4
    new $P301, "ResizablePMCArray"
    push $P301, "repeat"
    .return ($P301)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("69_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx319_tgt
    .local int rx319_pos
    .local int rx319_off
    .local int rx319_eos
    .local int rx319_rep
    .local pmc rx319_cur
    (rx319_cur, rx319_pos, rx319_tgt, $I10) = self."!cursor_start"()
    rx319_cur."!cursor_debug"("START ", "statement_control:sym<for>")
    .lex unicode:"$\x{a2}", rx319_cur
    .local pmc match
    .lex "$/", match
    length rx319_eos, rx319_tgt
    set rx319_off, 0
    lt $I10, 2, rx319_start
    sub rx319_off, $I10, 1
    substr rx319_tgt, rx319_tgt, rx319_off
  rx319_start:
    ge rx319_pos, 0, rxscan322_done
  rxscan322_loop:
    ($P10) = rx319_cur."from"()
    inc $P10
    set rx319_pos, $P10
    ge rx319_pos, rx319_eos, rxscan322_done
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
.sub "!PREFIX__statement_control:sym<for>"  :subid("70_1258904213.70809") :method
.annotate "line", 4
    new $P321, "ResizablePMCArray"
    push $P321, "for"
    .return ($P321)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("71_1258904213.70809") :method
.annotate "line", 180
    $P327 = self."!protoregex"("statement_prefix")
    .return ($P327)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("72_1258904213.70809") :method
.annotate "line", 180
    $P329 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P329)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("73_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx331_tgt
    .local int rx331_pos
    .local int rx331_off
    .local int rx331_eos
    .local int rx331_rep
    .local pmc rx331_cur
    (rx331_cur, rx331_pos, rx331_tgt, $I10) = self."!cursor_start"()
    rx331_cur."!cursor_debug"("START ", "statement_prefix:sym<INIT>")
    .lex unicode:"$\x{a2}", rx331_cur
    .local pmc match
    .lex "$/", match
    length rx331_eos, rx331_tgt
    set rx331_off, 0
    lt $I10, 2, rx331_start
    sub rx331_off, $I10, 1
    substr rx331_tgt, rx331_tgt, rx331_off
  rx331_start:
    ge rx331_pos, 0, rxscan335_done
  rxscan335_loop:
    ($P10) = rx331_cur."from"()
    inc $P10
    set rx331_pos, $P10
    ge rx331_pos, rx331_eos, rxscan335_done
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
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("74_1258904213.70809") :method
.annotate "line", 4
    $P333 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P334, "ResizablePMCArray"
    push $P334, $P333
    .return ($P334)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("75_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx338_tgt
    .local int rx338_pos
    .local int rx338_off
    .local int rx338_eos
    .local int rx338_rep
    .local pmc rx338_cur
    (rx338_cur, rx338_pos, rx338_tgt, $I10) = self."!cursor_start"()
    rx338_cur."!cursor_debug"("START ", "blorst")
    .lex unicode:"$\x{a2}", rx338_cur
    .local pmc match
    .lex "$/", match
    length rx338_eos, rx338_tgt
    set rx338_off, 0
    lt $I10, 2, rx338_start
    sub rx338_off, $I10, 1
    substr rx338_tgt, rx338_tgt, rx338_off
  rx338_start:
    ge rx338_pos, 0, rxscan341_done
  rxscan341_loop:
    ($P10) = rx338_cur."from"()
    inc $P10
    set rx338_pos, $P10
    ge rx338_pos, rx338_eos, rxscan341_done
    set_addr $I10, rxscan341_loop
    rx338_cur."!mark_push"(0, rx338_pos, $I10)
  rxscan341_done:
.annotate "line", 184
  # rx charclass s
    ge rx338_pos, rx338_eos, rx338_fail
    sub $I10, rx338_pos, rx338_off
    is_cclass $I11, 32, rx338_tgt, $I10
    unless $I11, rx338_fail
    inc rx338_pos
  # rx subrule "ws" subtype=method negate=
    rx338_cur."!cursor_pos"(rx338_pos)
    $P10 = rx338_cur."ws"()
    unless $P10, rx338_fail
    rx338_pos = $P10."pos"()
  alt342_0:
    set_addr $I10, alt342_1
    rx338_cur."!mark_push"(0, rx338_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx338_pos, rx338_eos, rx338_fail
    sub $I10, rx338_pos, rx338_off
    substr $S10, rx338_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx338_fail
  # rx subrule "block" subtype=capture negate=
    rx338_cur."!cursor_pos"(rx338_pos)
    $P10 = rx338_cur."block"()
    unless $P10, rx338_fail
    rx338_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx338_pos = $P10."pos"()
    goto alt342_end
  alt342_1:
  # rx subrule "statement" subtype=capture negate=
    rx338_cur."!cursor_pos"(rx338_pos)
    $P10 = rx338_cur."statement"()
    unless $P10, rx338_fail
    rx338_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx338_pos = $P10."pos"()
  alt342_end:
.annotate "line", 183
  # rx pass
    rx338_cur."!cursor_pass"(rx338_pos, "blorst")
    rx338_cur."!cursor_debug"("PASS  ", "blorst", " at pos=", rx338_pos)
    .return (rx338_cur)
  rx338_fail:
.annotate "line", 4
    (rx338_rep, rx338_pos, $I10, $P10) = rx338_cur."!mark_fail"(0)
    lt rx338_pos, -1, rx338_done
    eq rx338_pos, -1, rx338_fail
    jump $I10
  rx338_done:
    rx338_cur."!cursor_fail"()
    rx338_cur."!cursor_debug"("FAIL  ", "blorst")
    .return (rx338_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blorst"  :subid("76_1258904213.70809") :method
.annotate "line", 4
    new $P340, "ResizablePMCArray"
    push $P340, ""
    .return ($P340)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("77_1258904213.70809") :method
.annotate "line", 189
    $P344 = self."!protoregex"("statement_mod_cond")
    .return ($P344)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("78_1258904213.70809") :method
.annotate "line", 189
    $P346 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P346)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("79_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx348_tgt
    .local int rx348_pos
    .local int rx348_off
    .local int rx348_eos
    .local int rx348_rep
    .local pmc rx348_cur
    (rx348_cur, rx348_pos, rx348_tgt, $I10) = self."!cursor_start"()
    rx348_cur."!cursor_debug"("START ", "statement_mod_cond:sym<if>")
    .lex unicode:"$\x{a2}", rx348_cur
    .local pmc match
    .lex "$/", match
    length rx348_eos, rx348_tgt
    set rx348_off, 0
    lt $I10, 2, rx348_start
    sub rx348_off, $I10, 1
    substr rx348_tgt, rx348_tgt, rx348_off
  rx348_start:
    ge rx348_pos, 0, rxscan351_done
  rxscan351_loop:
    ($P10) = rx348_cur."from"()
    inc $P10
    set rx348_pos, $P10
    ge rx348_pos, rx348_eos, rxscan351_done
    set_addr $I10, rxscan351_loop
    rx348_cur."!mark_push"(0, rx348_pos, $I10)
  rxscan351_done:
.annotate "line", 191
  # rx subcapture "sym"
    set_addr $I10, rxcap_352_fail
    rx348_cur."!mark_push"(0, rx348_pos, $I10)
  # rx literal  "if"
    add $I11, rx348_pos, 2
    gt $I11, rx348_eos, rx348_fail
    sub $I11, rx348_pos, rx348_off
    substr $S10, rx348_tgt, $I11, 2
    ne $S10, "if", rx348_fail
    add rx348_pos, 2
    set_addr $I10, rxcap_352_fail
    ($I12, $I11) = rx348_cur."!mark_peek"($I10)
    rx348_cur."!cursor_pos"($I11)
    ($P10) = rx348_cur."!cursor_start"()
    $P10."!cursor_pass"(rx348_pos, "")
    rx348_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_352_done
  rxcap_352_fail:
    goto rx348_fail
  rxcap_352_done:
  # rx subrule "ws" subtype=method negate=
    rx348_cur."!cursor_pos"(rx348_pos)
    $P10 = rx348_cur."ws"()
    unless $P10, rx348_fail
    rx348_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx348_cur."!cursor_pos"(rx348_pos)
    $P10 = rx348_cur."EXPR"()
    unless $P10, rx348_fail
    rx348_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx348_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx348_cur."!cursor_pos"(rx348_pos)
    $P10 = rx348_cur."ws"()
    unless $P10, rx348_fail
    rx348_pos = $P10."pos"()
  # rx pass
    rx348_cur."!cursor_pass"(rx348_pos, "statement_mod_cond:sym<if>")
    rx348_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<if>", " at pos=", rx348_pos)
    .return (rx348_cur)
  rx348_fail:
.annotate "line", 4
    (rx348_rep, rx348_pos, $I10, $P10) = rx348_cur."!mark_fail"(0)
    lt rx348_pos, -1, rx348_done
    eq rx348_pos, -1, rx348_fail
    jump $I10
  rx348_done:
    rx348_cur."!cursor_fail"()
    rx348_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<if>")
    .return (rx348_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("80_1258904213.70809") :method
.annotate "line", 4
    new $P350, "ResizablePMCArray"
    push $P350, "if"
    .return ($P350)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("81_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx356_tgt
    .local int rx356_pos
    .local int rx356_off
    .local int rx356_eos
    .local int rx356_rep
    .local pmc rx356_cur
    (rx356_cur, rx356_pos, rx356_tgt, $I10) = self."!cursor_start"()
    rx356_cur."!cursor_debug"("START ", "statement_mod_cond:sym<unless>")
    .lex unicode:"$\x{a2}", rx356_cur
    .local pmc match
    .lex "$/", match
    length rx356_eos, rx356_tgt
    set rx356_off, 0
    lt $I10, 2, rx356_start
    sub rx356_off, $I10, 1
    substr rx356_tgt, rx356_tgt, rx356_off
  rx356_start:
    ge rx356_pos, 0, rxscan359_done
  rxscan359_loop:
    ($P10) = rx356_cur."from"()
    inc $P10
    set rx356_pos, $P10
    ge rx356_pos, rx356_eos, rxscan359_done
    set_addr $I10, rxscan359_loop
    rx356_cur."!mark_push"(0, rx356_pos, $I10)
  rxscan359_done:
.annotate "line", 192
  # rx subcapture "sym"
    set_addr $I10, rxcap_360_fail
    rx356_cur."!mark_push"(0, rx356_pos, $I10)
  # rx literal  "unless"
    add $I11, rx356_pos, 6
    gt $I11, rx356_eos, rx356_fail
    sub $I11, rx356_pos, rx356_off
    substr $S10, rx356_tgt, $I11, 6
    ne $S10, "unless", rx356_fail
    add rx356_pos, 6
    set_addr $I10, rxcap_360_fail
    ($I12, $I11) = rx356_cur."!mark_peek"($I10)
    rx356_cur."!cursor_pos"($I11)
    ($P10) = rx356_cur."!cursor_start"()
    $P10."!cursor_pass"(rx356_pos, "")
    rx356_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_360_done
  rxcap_360_fail:
    goto rx356_fail
  rxcap_360_done:
  # rx subrule "ws" subtype=method negate=
    rx356_cur."!cursor_pos"(rx356_pos)
    $P10 = rx356_cur."ws"()
    unless $P10, rx356_fail
    rx356_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx356_cur."!cursor_pos"(rx356_pos)
    $P10 = rx356_cur."EXPR"()
    unless $P10, rx356_fail
    rx356_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx356_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx356_cur."!cursor_pos"(rx356_pos)
    $P10 = rx356_cur."ws"()
    unless $P10, rx356_fail
    rx356_pos = $P10."pos"()
  # rx pass
    rx356_cur."!cursor_pass"(rx356_pos, "statement_mod_cond:sym<unless>")
    rx356_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<unless>", " at pos=", rx356_pos)
    .return (rx356_cur)
  rx356_fail:
.annotate "line", 4
    (rx356_rep, rx356_pos, $I10, $P10) = rx356_cur."!mark_fail"(0)
    lt rx356_pos, -1, rx356_done
    eq rx356_pos, -1, rx356_fail
    jump $I10
  rx356_done:
    rx356_cur."!cursor_fail"()
    rx356_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<unless>")
    .return (rx356_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("82_1258904213.70809") :method
.annotate "line", 4
    new $P358, "ResizablePMCArray"
    push $P358, "unless"
    .return ($P358)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("83_1258904213.70809") :method
.annotate "line", 194
    $P364 = self."!protoregex"("statement_mod_loop")
    .return ($P364)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("84_1258904213.70809") :method
.annotate "line", 194
    $P366 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P366)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("85_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx368_tgt
    .local int rx368_pos
    .local int rx368_off
    .local int rx368_eos
    .local int rx368_rep
    .local pmc rx368_cur
    (rx368_cur, rx368_pos, rx368_tgt, $I10) = self."!cursor_start"()
    rx368_cur."!cursor_debug"("START ", "statement_mod_loop:sym<while>")
    .lex unicode:"$\x{a2}", rx368_cur
    .local pmc match
    .lex "$/", match
    length rx368_eos, rx368_tgt
    set rx368_off, 0
    lt $I10, 2, rx368_start
    sub rx368_off, $I10, 1
    substr rx368_tgt, rx368_tgt, rx368_off
  rx368_start:
    ge rx368_pos, 0, rxscan371_done
  rxscan371_loop:
    ($P10) = rx368_cur."from"()
    inc $P10
    set rx368_pos, $P10
    ge rx368_pos, rx368_eos, rxscan371_done
    set_addr $I10, rxscan371_loop
    rx368_cur."!mark_push"(0, rx368_pos, $I10)
  rxscan371_done:
.annotate "line", 196
  # rx subcapture "sym"
    set_addr $I10, rxcap_372_fail
    rx368_cur."!mark_push"(0, rx368_pos, $I10)
  # rx literal  "while"
    add $I11, rx368_pos, 5
    gt $I11, rx368_eos, rx368_fail
    sub $I11, rx368_pos, rx368_off
    substr $S10, rx368_tgt, $I11, 5
    ne $S10, "while", rx368_fail
    add rx368_pos, 5
    set_addr $I10, rxcap_372_fail
    ($I12, $I11) = rx368_cur."!mark_peek"($I10)
    rx368_cur."!cursor_pos"($I11)
    ($P10) = rx368_cur."!cursor_start"()
    $P10."!cursor_pass"(rx368_pos, "")
    rx368_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_372_done
  rxcap_372_fail:
    goto rx368_fail
  rxcap_372_done:
  # rx subrule "ws" subtype=method negate=
    rx368_cur."!cursor_pos"(rx368_pos)
    $P10 = rx368_cur."ws"()
    unless $P10, rx368_fail
    rx368_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx368_cur."!cursor_pos"(rx368_pos)
    $P10 = rx368_cur."EXPR"()
    unless $P10, rx368_fail
    rx368_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx368_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx368_cur."!cursor_pos"(rx368_pos)
    $P10 = rx368_cur."ws"()
    unless $P10, rx368_fail
    rx368_pos = $P10."pos"()
  # rx pass
    rx368_cur."!cursor_pass"(rx368_pos, "statement_mod_loop:sym<while>")
    rx368_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<while>", " at pos=", rx368_pos)
    .return (rx368_cur)
  rx368_fail:
.annotate "line", 4
    (rx368_rep, rx368_pos, $I10, $P10) = rx368_cur."!mark_fail"(0)
    lt rx368_pos, -1, rx368_done
    eq rx368_pos, -1, rx368_fail
    jump $I10
  rx368_done:
    rx368_cur."!cursor_fail"()
    rx368_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<while>")
    .return (rx368_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("86_1258904213.70809") :method
.annotate "line", 4
    new $P370, "ResizablePMCArray"
    push $P370, "while"
    .return ($P370)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("87_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx376_tgt
    .local int rx376_pos
    .local int rx376_off
    .local int rx376_eos
    .local int rx376_rep
    .local pmc rx376_cur
    (rx376_cur, rx376_pos, rx376_tgt, $I10) = self."!cursor_start"()
    rx376_cur."!cursor_debug"("START ", "statement_mod_loop:sym<until>")
    .lex unicode:"$\x{a2}", rx376_cur
    .local pmc match
    .lex "$/", match
    length rx376_eos, rx376_tgt
    set rx376_off, 0
    lt $I10, 2, rx376_start
    sub rx376_off, $I10, 1
    substr rx376_tgt, rx376_tgt, rx376_off
  rx376_start:
    ge rx376_pos, 0, rxscan379_done
  rxscan379_loop:
    ($P10) = rx376_cur."from"()
    inc $P10
    set rx376_pos, $P10
    ge rx376_pos, rx376_eos, rxscan379_done
    set_addr $I10, rxscan379_loop
    rx376_cur."!mark_push"(0, rx376_pos, $I10)
  rxscan379_done:
.annotate "line", 197
  # rx subcapture "sym"
    set_addr $I10, rxcap_380_fail
    rx376_cur."!mark_push"(0, rx376_pos, $I10)
  # rx literal  "until"
    add $I11, rx376_pos, 5
    gt $I11, rx376_eos, rx376_fail
    sub $I11, rx376_pos, rx376_off
    substr $S10, rx376_tgt, $I11, 5
    ne $S10, "until", rx376_fail
    add rx376_pos, 5
    set_addr $I10, rxcap_380_fail
    ($I12, $I11) = rx376_cur."!mark_peek"($I10)
    rx376_cur."!cursor_pos"($I11)
    ($P10) = rx376_cur."!cursor_start"()
    $P10."!cursor_pass"(rx376_pos, "")
    rx376_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_380_done
  rxcap_380_fail:
    goto rx376_fail
  rxcap_380_done:
  # rx subrule "ws" subtype=method negate=
    rx376_cur."!cursor_pos"(rx376_pos)
    $P10 = rx376_cur."ws"()
    unless $P10, rx376_fail
    rx376_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx376_cur."!cursor_pos"(rx376_pos)
    $P10 = rx376_cur."EXPR"()
    unless $P10, rx376_fail
    rx376_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx376_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx376_cur."!cursor_pos"(rx376_pos)
    $P10 = rx376_cur."ws"()
    unless $P10, rx376_fail
    rx376_pos = $P10."pos"()
  # rx pass
    rx376_cur."!cursor_pass"(rx376_pos, "statement_mod_loop:sym<until>")
    rx376_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<until>", " at pos=", rx376_pos)
    .return (rx376_cur)
  rx376_fail:
.annotate "line", 4
    (rx376_rep, rx376_pos, $I10, $P10) = rx376_cur."!mark_fail"(0)
    lt rx376_pos, -1, rx376_done
    eq rx376_pos, -1, rx376_fail
    jump $I10
  rx376_done:
    rx376_cur."!cursor_fail"()
    rx376_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<until>")
    .return (rx376_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("88_1258904213.70809") :method
.annotate "line", 4
    new $P378, "ResizablePMCArray"
    push $P378, "until"
    .return ($P378)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("89_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx384_tgt
    .local int rx384_pos
    .local int rx384_off
    .local int rx384_eos
    .local int rx384_rep
    .local pmc rx384_cur
    (rx384_cur, rx384_pos, rx384_tgt, $I10) = self."!cursor_start"()
    rx384_cur."!cursor_debug"("START ", "term:sym<colonpair>")
    .lex unicode:"$\x{a2}", rx384_cur
    .local pmc match
    .lex "$/", match
    length rx384_eos, rx384_tgt
    set rx384_off, 0
    lt $I10, 2, rx384_start
    sub rx384_off, $I10, 1
    substr rx384_tgt, rx384_tgt, rx384_off
  rx384_start:
    ge rx384_pos, 0, rxscan388_done
  rxscan388_loop:
    ($P10) = rx384_cur."from"()
    inc $P10
    set rx384_pos, $P10
    ge rx384_pos, rx384_eos, rxscan388_done
    set_addr $I10, rxscan388_loop
    rx384_cur."!mark_push"(0, rx384_pos, $I10)
  rxscan388_done:
.annotate "line", 201
  # rx subrule "colonpair" subtype=capture negate=
    rx384_cur."!cursor_pos"(rx384_pos)
    $P10 = rx384_cur."colonpair"()
    unless $P10, rx384_fail
    rx384_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx384_pos = $P10."pos"()
  # rx pass
    rx384_cur."!cursor_pass"(rx384_pos, "term:sym<colonpair>")
    rx384_cur."!cursor_debug"("PASS  ", "term:sym<colonpair>", " at pos=", rx384_pos)
    .return (rx384_cur)
  rx384_fail:
.annotate "line", 4
    (rx384_rep, rx384_pos, $I10, $P10) = rx384_cur."!mark_fail"(0)
    lt rx384_pos, -1, rx384_done
    eq rx384_pos, -1, rx384_fail
    jump $I10
  rx384_done:
    rx384_cur."!cursor_fail"()
    rx384_cur."!cursor_debug"("FAIL  ", "term:sym<colonpair>")
    .return (rx384_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("90_1258904213.70809") :method
.annotate "line", 4
    $P386 = self."!PREFIX__!subrule"("colonpair", "")
    new $P387, "ResizablePMCArray"
    push $P387, $P386
    .return ($P387)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("91_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx390_tgt
    .local int rx390_pos
    .local int rx390_off
    .local int rx390_eos
    .local int rx390_rep
    .local pmc rx390_cur
    (rx390_cur, rx390_pos, rx390_tgt, $I10) = self."!cursor_start"()
    rx390_cur."!cursor_debug"("START ", "term:sym<variable>")
    .lex unicode:"$\x{a2}", rx390_cur
    .local pmc match
    .lex "$/", match
    length rx390_eos, rx390_tgt
    set rx390_off, 0
    lt $I10, 2, rx390_start
    sub rx390_off, $I10, 1
    substr rx390_tgt, rx390_tgt, rx390_off
  rx390_start:
    ge rx390_pos, 0, rxscan394_done
  rxscan394_loop:
    ($P10) = rx390_cur."from"()
    inc $P10
    set rx390_pos, $P10
    ge rx390_pos, rx390_eos, rxscan394_done
    set_addr $I10, rxscan394_loop
    rx390_cur."!mark_push"(0, rx390_pos, $I10)
  rxscan394_done:
.annotate "line", 202
  # rx subrule "variable" subtype=capture negate=
    rx390_cur."!cursor_pos"(rx390_pos)
    $P10 = rx390_cur."variable"()
    unless $P10, rx390_fail
    rx390_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx390_pos = $P10."pos"()
  # rx pass
    rx390_cur."!cursor_pass"(rx390_pos, "term:sym<variable>")
    rx390_cur."!cursor_debug"("PASS  ", "term:sym<variable>", " at pos=", rx390_pos)
    .return (rx390_cur)
  rx390_fail:
.annotate "line", 4
    (rx390_rep, rx390_pos, $I10, $P10) = rx390_cur."!mark_fail"(0)
    lt rx390_pos, -1, rx390_done
    eq rx390_pos, -1, rx390_fail
    jump $I10
  rx390_done:
    rx390_cur."!cursor_fail"()
    rx390_cur."!cursor_debug"("FAIL  ", "term:sym<variable>")
    .return (rx390_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("92_1258904213.70809") :method
.annotate "line", 4
    $P392 = self."!PREFIX__!subrule"("variable", "")
    new $P393, "ResizablePMCArray"
    push $P393, $P392
    .return ($P393)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("93_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx396_tgt
    .local int rx396_pos
    .local int rx396_off
    .local int rx396_eos
    .local int rx396_rep
    .local pmc rx396_cur
    (rx396_cur, rx396_pos, rx396_tgt, $I10) = self."!cursor_start"()
    rx396_cur."!cursor_debug"("START ", "term:sym<package_declarator>")
    .lex unicode:"$\x{a2}", rx396_cur
    .local pmc match
    .lex "$/", match
    length rx396_eos, rx396_tgt
    set rx396_off, 0
    lt $I10, 2, rx396_start
    sub rx396_off, $I10, 1
    substr rx396_tgt, rx396_tgt, rx396_off
  rx396_start:
    ge rx396_pos, 0, rxscan400_done
  rxscan400_loop:
    ($P10) = rx396_cur."from"()
    inc $P10
    set rx396_pos, $P10
    ge rx396_pos, rx396_eos, rxscan400_done
    set_addr $I10, rxscan400_loop
    rx396_cur."!mark_push"(0, rx396_pos, $I10)
  rxscan400_done:
.annotate "line", 203
  # rx subrule "package_declarator" subtype=capture negate=
    rx396_cur."!cursor_pos"(rx396_pos)
    $P10 = rx396_cur."package_declarator"()
    unless $P10, rx396_fail
    rx396_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx396_pos = $P10."pos"()
  # rx pass
    rx396_cur."!cursor_pass"(rx396_pos, "term:sym<package_declarator>")
    rx396_cur."!cursor_debug"("PASS  ", "term:sym<package_declarator>", " at pos=", rx396_pos)
    .return (rx396_cur)
  rx396_fail:
.annotate "line", 4
    (rx396_rep, rx396_pos, $I10, $P10) = rx396_cur."!mark_fail"(0)
    lt rx396_pos, -1, rx396_done
    eq rx396_pos, -1, rx396_fail
    jump $I10
  rx396_done:
    rx396_cur."!cursor_fail"()
    rx396_cur."!cursor_debug"("FAIL  ", "term:sym<package_declarator>")
    .return (rx396_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("94_1258904213.70809") :method
.annotate "line", 4
    $P398 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P399, "ResizablePMCArray"
    push $P399, $P398
    .return ($P399)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("95_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx402_tgt
    .local int rx402_pos
    .local int rx402_off
    .local int rx402_eos
    .local int rx402_rep
    .local pmc rx402_cur
    (rx402_cur, rx402_pos, rx402_tgt, $I10) = self."!cursor_start"()
    rx402_cur."!cursor_debug"("START ", "term:sym<scope_declarator>")
    .lex unicode:"$\x{a2}", rx402_cur
    .local pmc match
    .lex "$/", match
    length rx402_eos, rx402_tgt
    set rx402_off, 0
    lt $I10, 2, rx402_start
    sub rx402_off, $I10, 1
    substr rx402_tgt, rx402_tgt, rx402_off
  rx402_start:
    ge rx402_pos, 0, rxscan406_done
  rxscan406_loop:
    ($P10) = rx402_cur."from"()
    inc $P10
    set rx402_pos, $P10
    ge rx402_pos, rx402_eos, rxscan406_done
    set_addr $I10, rxscan406_loop
    rx402_cur."!mark_push"(0, rx402_pos, $I10)
  rxscan406_done:
.annotate "line", 204
  # rx subrule "scope_declarator" subtype=capture negate=
    rx402_cur."!cursor_pos"(rx402_pos)
    $P10 = rx402_cur."scope_declarator"()
    unless $P10, rx402_fail
    rx402_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx402_pos = $P10."pos"()
  # rx pass
    rx402_cur."!cursor_pass"(rx402_pos, "term:sym<scope_declarator>")
    rx402_cur."!cursor_debug"("PASS  ", "term:sym<scope_declarator>", " at pos=", rx402_pos)
    .return (rx402_cur)
  rx402_fail:
.annotate "line", 4
    (rx402_rep, rx402_pos, $I10, $P10) = rx402_cur."!mark_fail"(0)
    lt rx402_pos, -1, rx402_done
    eq rx402_pos, -1, rx402_fail
    jump $I10
  rx402_done:
    rx402_cur."!cursor_fail"()
    rx402_cur."!cursor_debug"("FAIL  ", "term:sym<scope_declarator>")
    .return (rx402_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("96_1258904213.70809") :method
.annotate "line", 4
    $P404 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P405, "ResizablePMCArray"
    push $P405, $P404
    .return ($P405)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("97_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx408_tgt
    .local int rx408_pos
    .local int rx408_off
    .local int rx408_eos
    .local int rx408_rep
    .local pmc rx408_cur
    (rx408_cur, rx408_pos, rx408_tgt, $I10) = self."!cursor_start"()
    rx408_cur."!cursor_debug"("START ", "term:sym<routine_declarator>")
    .lex unicode:"$\x{a2}", rx408_cur
    .local pmc match
    .lex "$/", match
    length rx408_eos, rx408_tgt
    set rx408_off, 0
    lt $I10, 2, rx408_start
    sub rx408_off, $I10, 1
    substr rx408_tgt, rx408_tgt, rx408_off
  rx408_start:
    ge rx408_pos, 0, rxscan412_done
  rxscan412_loop:
    ($P10) = rx408_cur."from"()
    inc $P10
    set rx408_pos, $P10
    ge rx408_pos, rx408_eos, rxscan412_done
    set_addr $I10, rxscan412_loop
    rx408_cur."!mark_push"(0, rx408_pos, $I10)
  rxscan412_done:
.annotate "line", 205
  # rx subrule "routine_declarator" subtype=capture negate=
    rx408_cur."!cursor_pos"(rx408_pos)
    $P10 = rx408_cur."routine_declarator"()
    unless $P10, rx408_fail
    rx408_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx408_pos = $P10."pos"()
  # rx pass
    rx408_cur."!cursor_pass"(rx408_pos, "term:sym<routine_declarator>")
    rx408_cur."!cursor_debug"("PASS  ", "term:sym<routine_declarator>", " at pos=", rx408_pos)
    .return (rx408_cur)
  rx408_fail:
.annotate "line", 4
    (rx408_rep, rx408_pos, $I10, $P10) = rx408_cur."!mark_fail"(0)
    lt rx408_pos, -1, rx408_done
    eq rx408_pos, -1, rx408_fail
    jump $I10
  rx408_done:
    rx408_cur."!cursor_fail"()
    rx408_cur."!cursor_debug"("FAIL  ", "term:sym<routine_declarator>")
    .return (rx408_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("98_1258904213.70809") :method
.annotate "line", 4
    $P410 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P411, "ResizablePMCArray"
    push $P411, $P410
    .return ($P411)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("99_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx414_tgt
    .local int rx414_pos
    .local int rx414_off
    .local int rx414_eos
    .local int rx414_rep
    .local pmc rx414_cur
    (rx414_cur, rx414_pos, rx414_tgt, $I10) = self."!cursor_start"()
    rx414_cur."!cursor_debug"("START ", "term:sym<regex_declarator>")
    .lex unicode:"$\x{a2}", rx414_cur
    .local pmc match
    .lex "$/", match
    length rx414_eos, rx414_tgt
    set rx414_off, 0
    lt $I10, 2, rx414_start
    sub rx414_off, $I10, 1
    substr rx414_tgt, rx414_tgt, rx414_off
  rx414_start:
    ge rx414_pos, 0, rxscan418_done
  rxscan418_loop:
    ($P10) = rx414_cur."from"()
    inc $P10
    set rx414_pos, $P10
    ge rx414_pos, rx414_eos, rxscan418_done
    set_addr $I10, rxscan418_loop
    rx414_cur."!mark_push"(0, rx414_pos, $I10)
  rxscan418_done:
.annotate "line", 206
  # rx subrule "regex_declarator" subtype=capture negate=
    rx414_cur."!cursor_pos"(rx414_pos)
    $P10 = rx414_cur."regex_declarator"()
    unless $P10, rx414_fail
    rx414_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx414_pos = $P10."pos"()
  # rx pass
    rx414_cur."!cursor_pass"(rx414_pos, "term:sym<regex_declarator>")
    rx414_cur."!cursor_debug"("PASS  ", "term:sym<regex_declarator>", " at pos=", rx414_pos)
    .return (rx414_cur)
  rx414_fail:
.annotate "line", 4
    (rx414_rep, rx414_pos, $I10, $P10) = rx414_cur."!mark_fail"(0)
    lt rx414_pos, -1, rx414_done
    eq rx414_pos, -1, rx414_fail
    jump $I10
  rx414_done:
    rx414_cur."!cursor_fail"()
    rx414_cur."!cursor_debug"("FAIL  ", "term:sym<regex_declarator>")
    .return (rx414_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("100_1258904213.70809") :method
.annotate "line", 4
    $P416 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P417, "ResizablePMCArray"
    push $P417, $P416
    .return ($P417)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("101_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx420_tgt
    .local int rx420_pos
    .local int rx420_off
    .local int rx420_eos
    .local int rx420_rep
    .local pmc rx420_cur
    (rx420_cur, rx420_pos, rx420_tgt, $I10) = self."!cursor_start"()
    rx420_cur."!cursor_debug"("START ", "term:sym<statement_prefix>")
    .lex unicode:"$\x{a2}", rx420_cur
    .local pmc match
    .lex "$/", match
    length rx420_eos, rx420_tgt
    set rx420_off, 0
    lt $I10, 2, rx420_start
    sub rx420_off, $I10, 1
    substr rx420_tgt, rx420_tgt, rx420_off
  rx420_start:
    ge rx420_pos, 0, rxscan424_done
  rxscan424_loop:
    ($P10) = rx420_cur."from"()
    inc $P10
    set rx420_pos, $P10
    ge rx420_pos, rx420_eos, rxscan424_done
    set_addr $I10, rxscan424_loop
    rx420_cur."!mark_push"(0, rx420_pos, $I10)
  rxscan424_done:
.annotate "line", 207
  # rx subrule "statement_prefix" subtype=capture negate=
    rx420_cur."!cursor_pos"(rx420_pos)
    $P10 = rx420_cur."statement_prefix"()
    unless $P10, rx420_fail
    rx420_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx420_pos = $P10."pos"()
  # rx pass
    rx420_cur."!cursor_pass"(rx420_pos, "term:sym<statement_prefix>")
    rx420_cur."!cursor_debug"("PASS  ", "term:sym<statement_prefix>", " at pos=", rx420_pos)
    .return (rx420_cur)
  rx420_fail:
.annotate "line", 4
    (rx420_rep, rx420_pos, $I10, $P10) = rx420_cur."!mark_fail"(0)
    lt rx420_pos, -1, rx420_done
    eq rx420_pos, -1, rx420_fail
    jump $I10
  rx420_done:
    rx420_cur."!cursor_fail"()
    rx420_cur."!cursor_debug"("FAIL  ", "term:sym<statement_prefix>")
    .return (rx420_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("102_1258904213.70809") :method
.annotate "line", 4
    $P422 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P423, "ResizablePMCArray"
    push $P423, $P422
    .return ($P423)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("103_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx426_tgt
    .local int rx426_pos
    .local int rx426_off
    .local int rx426_eos
    .local int rx426_rep
    .local pmc rx426_cur
    (rx426_cur, rx426_pos, rx426_tgt, $I10) = self."!cursor_start"()
    rx426_cur."!cursor_debug"("START ", "term:sym<lambda>")
    .lex unicode:"$\x{a2}", rx426_cur
    .local pmc match
    .lex "$/", match
    length rx426_eos, rx426_tgt
    set rx426_off, 0
    lt $I10, 2, rx426_start
    sub rx426_off, $I10, 1
    substr rx426_tgt, rx426_tgt, rx426_off
  rx426_start:
    ge rx426_pos, 0, rxscan429_done
  rxscan429_loop:
    ($P10) = rx426_cur."from"()
    inc $P10
    set rx426_pos, $P10
    ge rx426_pos, rx426_eos, rxscan429_done
    set_addr $I10, rxscan429_loop
    rx426_cur."!mark_push"(0, rx426_pos, $I10)
  rxscan429_done:
.annotate "line", 208
  # rx subrule "lambda" subtype=zerowidth negate=
    rx426_cur."!cursor_pos"(rx426_pos)
    $P10 = rx426_cur."lambda"()
    unless $P10, rx426_fail
  # rx subrule "pblock" subtype=capture negate=
    rx426_cur."!cursor_pos"(rx426_pos)
    $P10 = rx426_cur."pblock"()
    unless $P10, rx426_fail
    rx426_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx426_pos = $P10."pos"()
  # rx pass
    rx426_cur."!cursor_pass"(rx426_pos, "term:sym<lambda>")
    rx426_cur."!cursor_debug"("PASS  ", "term:sym<lambda>", " at pos=", rx426_pos)
    .return (rx426_cur)
  rx426_fail:
.annotate "line", 4
    (rx426_rep, rx426_pos, $I10, $P10) = rx426_cur."!mark_fail"(0)
    lt rx426_pos, -1, rx426_done
    eq rx426_pos, -1, rx426_fail
    jump $I10
  rx426_done:
    rx426_cur."!cursor_fail"()
    rx426_cur."!cursor_debug"("FAIL  ", "term:sym<lambda>")
    .return (rx426_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("104_1258904213.70809") :method
.annotate "line", 4
    new $P428, "ResizablePMCArray"
    push $P428, ""
    .return ($P428)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("105_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx431_tgt
    .local int rx431_pos
    .local int rx431_off
    .local int rx431_eos
    .local int rx431_rep
    .local pmc rx431_cur
    (rx431_cur, rx431_pos, rx431_tgt, $I10) = self."!cursor_start"()
    rx431_cur."!cursor_debug"("START ", "colonpair")
    rx431_cur."!cursor_caparray"("circumfix")
    .lex unicode:"$\x{a2}", rx431_cur
    .local pmc match
    .lex "$/", match
    length rx431_eos, rx431_tgt
    set rx431_off, 0
    lt $I10, 2, rx431_start
    sub rx431_off, $I10, 1
    substr rx431_tgt, rx431_tgt, rx431_off
  rx431_start:
    ge rx431_pos, 0, rxscan436_done
  rxscan436_loop:
    ($P10) = rx431_cur."from"()
    inc $P10
    set rx431_pos, $P10
    ge rx431_pos, rx431_eos, rxscan436_done
    set_addr $I10, rxscan436_loop
    rx431_cur."!mark_push"(0, rx431_pos, $I10)
  rxscan436_done:
.annotate "line", 211
  # rx literal  ":"
    add $I11, rx431_pos, 1
    gt $I11, rx431_eos, rx431_fail
    sub $I11, rx431_pos, rx431_off
    substr $S10, rx431_tgt, $I11, 1
    ne $S10, ":", rx431_fail
    add rx431_pos, 1
  alt437_0:
.annotate "line", 212
    set_addr $I10, alt437_1
    rx431_cur."!mark_push"(0, rx431_pos, $I10)
.annotate "line", 213
  # rx subcapture "not"
    set_addr $I10, rxcap_438_fail
    rx431_cur."!mark_push"(0, rx431_pos, $I10)
  # rx literal  "!"
    add $I11, rx431_pos, 1
    gt $I11, rx431_eos, rx431_fail
    sub $I11, rx431_pos, rx431_off
    substr $S10, rx431_tgt, $I11, 1
    ne $S10, "!", rx431_fail
    add rx431_pos, 1
    set_addr $I10, rxcap_438_fail
    ($I12, $I11) = rx431_cur."!mark_peek"($I10)
    rx431_cur."!cursor_pos"($I11)
    ($P10) = rx431_cur."!cursor_start"()
    $P10."!cursor_pass"(rx431_pos, "")
    rx431_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_438_done
  rxcap_438_fail:
    goto rx431_fail
  rxcap_438_done:
  # rx subrule "identifier" subtype=capture negate=
    rx431_cur."!cursor_pos"(rx431_pos)
    $P10 = rx431_cur."identifier"()
    unless $P10, rx431_fail
    rx431_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx431_pos = $P10."pos"()
    goto alt437_end
  alt437_1:
.annotate "line", 214
  # rx subrule "identifier" subtype=capture negate=
    rx431_cur."!cursor_pos"(rx431_pos)
    $P10 = rx431_cur."identifier"()
    unless $P10, rx431_fail
    rx431_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx431_pos = $P10."pos"()
  # rx rxquantr439 ** 0..1
    set_addr $I440, rxquantr439_done
    rx431_cur."!mark_push"(0, rx431_pos, $I440)
  rxquantr439_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx431_cur."!cursor_pos"(rx431_pos)
    $P10 = rx431_cur."circumfix"()
    unless $P10, rx431_fail
    rx431_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx431_pos = $P10."pos"()
    (rx431_rep) = rx431_cur."!mark_commit"($I440)
  rxquantr439_done:
  alt437_end:
.annotate "line", 210
  # rx pass
    rx431_cur."!cursor_pass"(rx431_pos, "colonpair")
    rx431_cur."!cursor_debug"("PASS  ", "colonpair", " at pos=", rx431_pos)
    .return (rx431_cur)
  rx431_fail:
.annotate "line", 4
    (rx431_rep, rx431_pos, $I10, $P10) = rx431_cur."!mark_fail"(0)
    lt rx431_pos, -1, rx431_done
    eq rx431_pos, -1, rx431_fail
    jump $I10
  rx431_done:
    rx431_cur."!cursor_fail"()
    rx431_cur."!cursor_debug"("FAIL  ", "colonpair")
    .return (rx431_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("106_1258904213.70809") :method
.annotate "line", 4
    $P433 = self."!PREFIX__!subrule"("identifier", ":")
    $P434 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P435, "ResizablePMCArray"
    push $P435, $P433
    push $P435, $P434
    .return ($P435)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("107_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx442_tgt
    .local int rx442_pos
    .local int rx442_off
    .local int rx442_eos
    .local int rx442_rep
    .local pmc rx442_cur
    (rx442_cur, rx442_pos, rx442_tgt, $I10) = self."!cursor_start"()
    rx442_cur."!cursor_debug"("START ", "variable")
    rx442_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx442_cur
    .local pmc match
    .lex "$/", match
    length rx442_eos, rx442_tgt
    set rx442_off, 0
    lt $I10, 2, rx442_start
    sub rx442_off, $I10, 1
    substr rx442_tgt, rx442_tgt, rx442_off
  rx442_start:
    ge rx442_pos, 0, rxscan447_done
  rxscan447_loop:
    ($P10) = rx442_cur."from"()
    inc $P10
    set rx442_pos, $P10
    ge rx442_pos, rx442_eos, rxscan447_done
    set_addr $I10, rxscan447_loop
    rx442_cur."!mark_push"(0, rx442_pos, $I10)
  rxscan447_done:
  alt448_0:
.annotate "line", 218
    set_addr $I10, alt448_1
    rx442_cur."!mark_push"(0, rx442_pos, $I10)
.annotate "line", 219
  # rx subrule "sigil" subtype=capture negate=
    rx442_cur."!cursor_pos"(rx442_pos)
    $P10 = rx442_cur."sigil"()
    unless $P10, rx442_fail
    rx442_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx442_pos = $P10."pos"()
  # rx rxquantr449 ** 0..1
    set_addr $I450, rxquantr449_done
    rx442_cur."!mark_push"(0, rx442_pos, $I450)
  rxquantr449_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx442_cur."!cursor_pos"(rx442_pos)
    $P10 = rx442_cur."twigil"()
    unless $P10, rx442_fail
    rx442_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx442_pos = $P10."pos"()
    (rx442_rep) = rx442_cur."!mark_commit"($I450)
  rxquantr449_done:
  # rx subrule "name" subtype=capture negate=
    rx442_cur."!cursor_pos"(rx442_pos)
    $P10 = rx442_cur."name"()
    unless $P10, rx442_fail
    rx442_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx442_pos = $P10."pos"()
    goto alt448_end
  alt448_1:
    set_addr $I10, alt448_2
    rx442_cur."!mark_push"(0, rx442_pos, $I10)
.annotate "line", 220
  # rx subrule "sigil" subtype=capture negate=
    rx442_cur."!cursor_pos"(rx442_pos)
    $P10 = rx442_cur."sigil"()
    unless $P10, rx442_fail
    rx442_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx442_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx442_pos, rx442_eos, rx442_fail
    sub $I10, rx442_pos, rx442_off
    substr $S10, rx442_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx442_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx442_cur."!cursor_pos"(rx442_pos)
    $P10 = rx442_cur."postcircumfix"()
    unless $P10, rx442_fail
    rx442_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx442_pos = $P10."pos"()
    goto alt448_end
  alt448_2:
.annotate "line", 221
  # rx subcapture "sigil"
    set_addr $I10, rxcap_451_fail
    rx442_cur."!mark_push"(0, rx442_pos, $I10)
  # rx literal  "$"
    add $I11, rx442_pos, 1
    gt $I11, rx442_eos, rx442_fail
    sub $I11, rx442_pos, rx442_off
    substr $S10, rx442_tgt, $I11, 1
    ne $S10, "$", rx442_fail
    add rx442_pos, 1
    set_addr $I10, rxcap_451_fail
    ($I12, $I11) = rx442_cur."!mark_peek"($I10)
    rx442_cur."!cursor_pos"($I11)
    ($P10) = rx442_cur."!cursor_start"()
    $P10."!cursor_pass"(rx442_pos, "")
    rx442_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_451_done
  rxcap_451_fail:
    goto rx442_fail
  rxcap_451_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_452_fail
    rx442_cur."!mark_push"(0, rx442_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx442_pos, rx442_eos, rx442_fail
    sub $I10, rx442_pos, rx442_off
    substr $S10, rx442_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx442_fail
    inc rx442_pos
    set_addr $I10, rxcap_452_fail
    ($I12, $I11) = rx442_cur."!mark_peek"($I10)
    rx442_cur."!cursor_pos"($I11)
    ($P10) = rx442_cur."!cursor_start"()
    $P10."!cursor_pass"(rx442_pos, "")
    rx442_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_452_done
  rxcap_452_fail:
    goto rx442_fail
  rxcap_452_done:
  alt448_end:
.annotate "line", 218
  # rx pass
    rx442_cur."!cursor_pass"(rx442_pos, "variable")
    rx442_cur."!cursor_debug"("PASS  ", "variable", " at pos=", rx442_pos)
    .return (rx442_cur)
  rx442_fail:
.annotate "line", 4
    (rx442_rep, rx442_pos, $I10, $P10) = rx442_cur."!mark_fail"(0)
    lt rx442_pos, -1, rx442_done
    eq rx442_pos, -1, rx442_fail
    jump $I10
  rx442_done:
    rx442_cur."!cursor_fail"()
    rx442_cur."!cursor_debug"("FAIL  ", "variable")
    .return (rx442_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("108_1258904213.70809") :method
.annotate "line", 4
    $P444 = self."!PREFIX__!subrule"("sigil", "")
    $P445 = self."!PREFIX__!subrule"("sigil", "")
    new $P446, "ResizablePMCArray"
    push $P446, "$!"
    push $P446, "$_"
    push $P446, "$/"
    push $P446, $P444
    push $P446, $P445
    .return ($P446)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("109_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx454_tgt
    .local int rx454_pos
    .local int rx454_off
    .local int rx454_eos
    .local int rx454_rep
    .local pmc rx454_cur
    (rx454_cur, rx454_pos, rx454_tgt, $I10) = self."!cursor_start"()
    rx454_cur."!cursor_debug"("START ", "sigil")
    .lex unicode:"$\x{a2}", rx454_cur
    .local pmc match
    .lex "$/", match
    length rx454_eos, rx454_tgt
    set rx454_off, 0
    lt $I10, 2, rx454_start
    sub rx454_off, $I10, 1
    substr rx454_tgt, rx454_tgt, rx454_off
  rx454_start:
    ge rx454_pos, 0, rxscan457_done
  rxscan457_loop:
    ($P10) = rx454_cur."from"()
    inc $P10
    set rx454_pos, $P10
    ge rx454_pos, rx454_eos, rxscan457_done
    set_addr $I10, rxscan457_loop
    rx454_cur."!mark_push"(0, rx454_pos, $I10)
  rxscan457_done:
.annotate "line", 224
  # rx enumcharlist negate=0 
    ge rx454_pos, rx454_eos, rx454_fail
    sub $I10, rx454_pos, rx454_off
    substr $S10, rx454_tgt, $I10, 1
    index $I11, "$@%&", $S10
    lt $I11, 0, rx454_fail
    inc rx454_pos
  # rx pass
    rx454_cur."!cursor_pass"(rx454_pos, "sigil")
    rx454_cur."!cursor_debug"("PASS  ", "sigil", " at pos=", rx454_pos)
    .return (rx454_cur)
  rx454_fail:
.annotate "line", 4
    (rx454_rep, rx454_pos, $I10, $P10) = rx454_cur."!mark_fail"(0)
    lt rx454_pos, -1, rx454_done
    eq rx454_pos, -1, rx454_fail
    jump $I10
  rx454_done:
    rx454_cur."!cursor_fail"()
    rx454_cur."!cursor_debug"("FAIL  ", "sigil")
    .return (rx454_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("110_1258904213.70809") :method
.annotate "line", 4
    new $P456, "ResizablePMCArray"
    push $P456, "&"
    push $P456, "%"
    push $P456, "@"
    push $P456, "$"
    .return ($P456)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("111_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx459_tgt
    .local int rx459_pos
    .local int rx459_off
    .local int rx459_eos
    .local int rx459_rep
    .local pmc rx459_cur
    (rx459_cur, rx459_pos, rx459_tgt, $I10) = self."!cursor_start"()
    rx459_cur."!cursor_debug"("START ", "twigil")
    .lex unicode:"$\x{a2}", rx459_cur
    .local pmc match
    .lex "$/", match
    length rx459_eos, rx459_tgt
    set rx459_off, 0
    lt $I10, 2, rx459_start
    sub rx459_off, $I10, 1
    substr rx459_tgt, rx459_tgt, rx459_off
  rx459_start:
    ge rx459_pos, 0, rxscan462_done
  rxscan462_loop:
    ($P10) = rx459_cur."from"()
    inc $P10
    set rx459_pos, $P10
    ge rx459_pos, rx459_eos, rxscan462_done
    set_addr $I10, rxscan462_loop
    rx459_cur."!mark_push"(0, rx459_pos, $I10)
  rxscan462_done:
.annotate "line", 226
  # rx enumcharlist negate=0 
    ge rx459_pos, rx459_eos, rx459_fail
    sub $I10, rx459_pos, rx459_off
    substr $S10, rx459_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx459_fail
    inc rx459_pos
  # rx pass
    rx459_cur."!cursor_pass"(rx459_pos, "twigil")
    rx459_cur."!cursor_debug"("PASS  ", "twigil", " at pos=", rx459_pos)
    .return (rx459_cur)
  rx459_fail:
.annotate "line", 4
    (rx459_rep, rx459_pos, $I10, $P10) = rx459_cur."!mark_fail"(0)
    lt rx459_pos, -1, rx459_done
    eq rx459_pos, -1, rx459_fail
    jump $I10
  rx459_done:
    rx459_cur."!cursor_fail"()
    rx459_cur."!cursor_debug"("FAIL  ", "twigil")
    .return (rx459_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("112_1258904213.70809") :method
.annotate "line", 4
    new $P461, "ResizablePMCArray"
    push $P461, "?"
    push $P461, "!"
    push $P461, "*"
    .return ($P461)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("113_1258904213.70809") :method
.annotate "line", 228
    $P464 = self."!protoregex"("package_declarator")
    .return ($P464)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("114_1258904213.70809") :method
.annotate "line", 228
    $P466 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P466)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("115_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx468_tgt
    .local int rx468_pos
    .local int rx468_off
    .local int rx468_eos
    .local int rx468_rep
    .local pmc rx468_cur
    (rx468_cur, rx468_pos, rx468_tgt, $I10) = self."!cursor_start"()
    rx468_cur."!cursor_debug"("START ", "package_declarator:sym<module>")
    .lex unicode:"$\x{a2}", rx468_cur
    .local pmc match
    .lex "$/", match
    length rx468_eos, rx468_tgt
    set rx468_off, 0
    lt $I10, 2, rx468_start
    sub rx468_off, $I10, 1
    substr rx468_tgt, rx468_tgt, rx468_off
  rx468_start:
    ge rx468_pos, 0, rxscan472_done
  rxscan472_loop:
    ($P10) = rx468_cur."from"()
    inc $P10
    set rx468_pos, $P10
    ge rx468_pos, rx468_eos, rxscan472_done
    set_addr $I10, rxscan472_loop
    rx468_cur."!mark_push"(0, rx468_pos, $I10)
  rxscan472_done:
.annotate "line", 229
  # rx subcapture "sym"
    set_addr $I10, rxcap_473_fail
    rx468_cur."!mark_push"(0, rx468_pos, $I10)
  # rx literal  "module"
    add $I11, rx468_pos, 6
    gt $I11, rx468_eos, rx468_fail
    sub $I11, rx468_pos, rx468_off
    substr $S10, rx468_tgt, $I11, 6
    ne $S10, "module", rx468_fail
    add rx468_pos, 6
    set_addr $I10, rxcap_473_fail
    ($I12, $I11) = rx468_cur."!mark_peek"($I10)
    rx468_cur."!cursor_pos"($I11)
    ($P10) = rx468_cur."!cursor_start"()
    $P10."!cursor_pass"(rx468_pos, "")
    rx468_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_473_done
  rxcap_473_fail:
    goto rx468_fail
  rxcap_473_done:
  # rx subrule "package_def" subtype=capture negate=
    rx468_cur."!cursor_pos"(rx468_pos)
    $P10 = rx468_cur."package_def"()
    unless $P10, rx468_fail
    rx468_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx468_pos = $P10."pos"()
  # rx pass
    rx468_cur."!cursor_pass"(rx468_pos, "package_declarator:sym<module>")
    rx468_cur."!cursor_debug"("PASS  ", "package_declarator:sym<module>", " at pos=", rx468_pos)
    .return (rx468_cur)
  rx468_fail:
.annotate "line", 4
    (rx468_rep, rx468_pos, $I10, $P10) = rx468_cur."!mark_fail"(0)
    lt rx468_pos, -1, rx468_done
    eq rx468_pos, -1, rx468_fail
    jump $I10
  rx468_done:
    rx468_cur."!cursor_fail"()
    rx468_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<module>")
    .return (rx468_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("116_1258904213.70809") :method
.annotate "line", 4
    $P470 = self."!PREFIX__!subrule"("package_def", "module")
    new $P471, "ResizablePMCArray"
    push $P471, $P470
    .return ($P471)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("117_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx475_tgt
    .local int rx475_pos
    .local int rx475_off
    .local int rx475_eos
    .local int rx475_rep
    .local pmc rx475_cur
    (rx475_cur, rx475_pos, rx475_tgt, $I10) = self."!cursor_start"()
    rx475_cur."!cursor_debug"("START ", "package_declarator:sym<class>")
    .lex unicode:"$\x{a2}", rx475_cur
    .local pmc match
    .lex "$/", match
    length rx475_eos, rx475_tgt
    set rx475_off, 0
    lt $I10, 2, rx475_start
    sub rx475_off, $I10, 1
    substr rx475_tgt, rx475_tgt, rx475_off
  rx475_start:
    ge rx475_pos, 0, rxscan480_done
  rxscan480_loop:
    ($P10) = rx475_cur."from"()
    inc $P10
    set rx475_pos, $P10
    ge rx475_pos, rx475_eos, rxscan480_done
    set_addr $I10, rxscan480_loop
    rx475_cur."!mark_push"(0, rx475_pos, $I10)
  rxscan480_done:
.annotate "line", 230
  # rx subcapture "sym"
    set_addr $I10, rxcap_482_fail
    rx475_cur."!mark_push"(0, rx475_pos, $I10)
  alt481_0:
    set_addr $I10, alt481_1
    rx475_cur."!mark_push"(0, rx475_pos, $I10)
  # rx literal  "class"
    add $I11, rx475_pos, 5
    gt $I11, rx475_eos, rx475_fail
    sub $I11, rx475_pos, rx475_off
    substr $S10, rx475_tgt, $I11, 5
    ne $S10, "class", rx475_fail
    add rx475_pos, 5
    goto alt481_end
  alt481_1:
  # rx literal  "grammar"
    add $I11, rx475_pos, 7
    gt $I11, rx475_eos, rx475_fail
    sub $I11, rx475_pos, rx475_off
    substr $S10, rx475_tgt, $I11, 7
    ne $S10, "grammar", rx475_fail
    add rx475_pos, 7
  alt481_end:
    set_addr $I10, rxcap_482_fail
    ($I12, $I11) = rx475_cur."!mark_peek"($I10)
    rx475_cur."!cursor_pos"($I11)
    ($P10) = rx475_cur."!cursor_start"()
    $P10."!cursor_pass"(rx475_pos, "")
    rx475_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_482_done
  rxcap_482_fail:
    goto rx475_fail
  rxcap_482_done:
  # rx subrule "package_def" subtype=capture negate=
    rx475_cur."!cursor_pos"(rx475_pos)
    $P10 = rx475_cur."package_def"()
    unless $P10, rx475_fail
    rx475_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx475_pos = $P10."pos"()
  # rx pass
    rx475_cur."!cursor_pass"(rx475_pos, "package_declarator:sym<class>")
    rx475_cur."!cursor_debug"("PASS  ", "package_declarator:sym<class>", " at pos=", rx475_pos)
    .return (rx475_cur)
  rx475_fail:
.annotate "line", 4
    (rx475_rep, rx475_pos, $I10, $P10) = rx475_cur."!mark_fail"(0)
    lt rx475_pos, -1, rx475_done
    eq rx475_pos, -1, rx475_fail
    jump $I10
  rx475_done:
    rx475_cur."!cursor_fail"()
    rx475_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<class>")
    .return (rx475_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("118_1258904213.70809") :method
.annotate "line", 4
    $P477 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P478 = self."!PREFIX__!subrule"("package_def", "class")
    new $P479, "ResizablePMCArray"
    push $P479, $P477
    push $P479, $P478
    .return ($P479)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("119_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx484_tgt
    .local int rx484_pos
    .local int rx484_off
    .local int rx484_eos
    .local int rx484_rep
    .local pmc rx484_cur
    (rx484_cur, rx484_pos, rx484_tgt, $I10) = self."!cursor_start"()
    rx484_cur."!cursor_debug"("START ", "package_def")
    rx484_cur."!cursor_caparray"("parent")
    .lex unicode:"$\x{a2}", rx484_cur
    .local pmc match
    .lex "$/", match
    length rx484_eos, rx484_tgt
    set rx484_off, 0
    lt $I10, 2, rx484_start
    sub rx484_off, $I10, 1
    substr rx484_tgt, rx484_tgt, rx484_off
  rx484_start:
    ge rx484_pos, 0, rxscan487_done
  rxscan487_loop:
    ($P10) = rx484_cur."from"()
    inc $P10
    set rx484_pos, $P10
    ge rx484_pos, rx484_eos, rxscan487_done
    set_addr $I10, rxscan487_loop
    rx484_cur."!mark_push"(0, rx484_pos, $I10)
  rxscan487_done:
.annotate "line", 232
  # rx subrule "ws" subtype=method negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."ws"()
    unless $P10, rx484_fail
    rx484_pos = $P10."pos"()
.annotate "line", 233
  # rx subrule "name" subtype=capture negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."name"()
    unless $P10, rx484_fail
    rx484_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx484_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."ws"()
    unless $P10, rx484_fail
    rx484_pos = $P10."pos"()
.annotate "line", 234
  # rx rxquantr490 ** 0..1
    set_addr $I494, rxquantr490_done
    rx484_cur."!mark_push"(0, rx484_pos, $I494)
  rxquantr490_loop:
  # rx subrule "ws" subtype=method negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."ws"()
    unless $P10, rx484_fail
    rx484_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx484_pos, 2
    gt $I11, rx484_eos, rx484_fail
    sub $I11, rx484_pos, rx484_off
    substr $S10, rx484_tgt, $I11, 2
    ne $S10, "is", rx484_fail
    add rx484_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."ws"()
    unless $P10, rx484_fail
    rx484_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."name"()
    unless $P10, rx484_fail
    rx484_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx484_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."ws"()
    unless $P10, rx484_fail
    rx484_pos = $P10."pos"()
    (rx484_rep) = rx484_cur."!mark_commit"($I494)
  rxquantr490_done:
  # rx subrule "ws" subtype=method negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."ws"()
    unless $P10, rx484_fail
    rx484_pos = $P10."pos"()
  alt496_0:
.annotate "line", 235
    set_addr $I10, alt496_1
    rx484_cur."!mark_push"(0, rx484_pos, $I10)
.annotate "line", 236
  # rx subrule "ws" subtype=method negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."ws"()
    unless $P10, rx484_fail
    rx484_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx484_pos, 1
    gt $I11, rx484_eos, rx484_fail
    sub $I11, rx484_pos, rx484_off
    substr $S10, rx484_tgt, $I11, 1
    ne $S10, ";", rx484_fail
    add rx484_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."ws"()
    unless $P10, rx484_fail
    rx484_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."comp_unit"()
    unless $P10, rx484_fail
    rx484_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx484_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."ws"()
    unless $P10, rx484_fail
    rx484_pos = $P10."pos"()
    goto alt496_end
  alt496_1:
    set_addr $I10, alt496_2
    rx484_cur."!mark_push"(0, rx484_pos, $I10)
.annotate "line", 237
  # rx subrule "ws" subtype=method negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."ws"()
    unless $P10, rx484_fail
    rx484_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx484_pos, rx484_eos, rx484_fail
    sub $I10, rx484_pos, rx484_off
    substr $S10, rx484_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx484_fail
  # rx subrule "ws" subtype=method negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."ws"()
    unless $P10, rx484_fail
    rx484_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."block"()
    unless $P10, rx484_fail
    rx484_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx484_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."ws"()
    unless $P10, rx484_fail
    rx484_pos = $P10."pos"()
    goto alt496_end
  alt496_2:
.annotate "line", 238
  # rx subrule "ws" subtype=method negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."ws"()
    unless $P10, rx484_fail
    rx484_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."panic"("Malformed package declaration")
    unless $P10, rx484_fail
    rx484_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."ws"()
    unless $P10, rx484_fail
    rx484_pos = $P10."pos"()
  alt496_end:
.annotate "line", 239
  # rx subrule "ws" subtype=method negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."ws"()
    unless $P10, rx484_fail
    rx484_pos = $P10."pos"()
.annotate "line", 232
  # rx pass
    rx484_cur."!cursor_pass"(rx484_pos, "package_def")
    rx484_cur."!cursor_debug"("PASS  ", "package_def", " at pos=", rx484_pos)
    .return (rx484_cur)
  rx484_fail:
.annotate "line", 4
    (rx484_rep, rx484_pos, $I10, $P10) = rx484_cur."!mark_fail"(0)
    lt rx484_pos, -1, rx484_done
    eq rx484_pos, -1, rx484_fail
    jump $I10
  rx484_done:
    rx484_cur."!cursor_fail"()
    rx484_cur."!cursor_debug"("FAIL  ", "package_def")
    .return (rx484_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("120_1258904213.70809") :method
.annotate "line", 4
    new $P486, "ResizablePMCArray"
    push $P486, ""
    .return ($P486)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("121_1258904213.70809") :method
.annotate "line", 242
    $P507 = self."!protoregex"("scope_declarator")
    .return ($P507)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("122_1258904213.70809") :method
.annotate "line", 242
    $P509 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P509)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("123_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx511_tgt
    .local int rx511_pos
    .local int rx511_off
    .local int rx511_eos
    .local int rx511_rep
    .local pmc rx511_cur
    (rx511_cur, rx511_pos, rx511_tgt, $I10) = self."!cursor_start"()
    rx511_cur."!cursor_debug"("START ", "scope_declarator:sym<my>")
    .lex unicode:"$\x{a2}", rx511_cur
    .local pmc match
    .lex "$/", match
    length rx511_eos, rx511_tgt
    set rx511_off, 0
    lt $I10, 2, rx511_start
    sub rx511_off, $I10, 1
    substr rx511_tgt, rx511_tgt, rx511_off
  rx511_start:
    ge rx511_pos, 0, rxscan515_done
  rxscan515_loop:
    ($P10) = rx511_cur."from"()
    inc $P10
    set rx511_pos, $P10
    ge rx511_pos, rx511_eos, rxscan515_done
    set_addr $I10, rxscan515_loop
    rx511_cur."!mark_push"(0, rx511_pos, $I10)
  rxscan515_done:
.annotate "line", 243
  # rx subcapture "sym"
    set_addr $I10, rxcap_516_fail
    rx511_cur."!mark_push"(0, rx511_pos, $I10)
  # rx literal  "my"
    add $I11, rx511_pos, 2
    gt $I11, rx511_eos, rx511_fail
    sub $I11, rx511_pos, rx511_off
    substr $S10, rx511_tgt, $I11, 2
    ne $S10, "my", rx511_fail
    add rx511_pos, 2
    set_addr $I10, rxcap_516_fail
    ($I12, $I11) = rx511_cur."!mark_peek"($I10)
    rx511_cur."!cursor_pos"($I11)
    ($P10) = rx511_cur."!cursor_start"()
    $P10."!cursor_pass"(rx511_pos, "")
    rx511_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_516_done
  rxcap_516_fail:
    goto rx511_fail
  rxcap_516_done:
  # rx subrule "scoped" subtype=capture negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."scoped"("my")
    unless $P10, rx511_fail
    rx511_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx511_pos = $P10."pos"()
  # rx pass
    rx511_cur."!cursor_pass"(rx511_pos, "scope_declarator:sym<my>")
    rx511_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<my>", " at pos=", rx511_pos)
    .return (rx511_cur)
  rx511_fail:
.annotate "line", 4
    (rx511_rep, rx511_pos, $I10, $P10) = rx511_cur."!mark_fail"(0)
    lt rx511_pos, -1, rx511_done
    eq rx511_pos, -1, rx511_fail
    jump $I10
  rx511_done:
    rx511_cur."!cursor_fail"()
    rx511_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<my>")
    .return (rx511_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("124_1258904213.70809") :method
.annotate "line", 4
    $P513 = self."!PREFIX__!subrule"("scoped", "my")
    new $P514, "ResizablePMCArray"
    push $P514, $P513
    .return ($P514)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("125_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx518_tgt
    .local int rx518_pos
    .local int rx518_off
    .local int rx518_eos
    .local int rx518_rep
    .local pmc rx518_cur
    (rx518_cur, rx518_pos, rx518_tgt, $I10) = self."!cursor_start"()
    rx518_cur."!cursor_debug"("START ", "scope_declarator:sym<our>")
    .lex unicode:"$\x{a2}", rx518_cur
    .local pmc match
    .lex "$/", match
    length rx518_eos, rx518_tgt
    set rx518_off, 0
    lt $I10, 2, rx518_start
    sub rx518_off, $I10, 1
    substr rx518_tgt, rx518_tgt, rx518_off
  rx518_start:
    ge rx518_pos, 0, rxscan522_done
  rxscan522_loop:
    ($P10) = rx518_cur."from"()
    inc $P10
    set rx518_pos, $P10
    ge rx518_pos, rx518_eos, rxscan522_done
    set_addr $I10, rxscan522_loop
    rx518_cur."!mark_push"(0, rx518_pos, $I10)
  rxscan522_done:
.annotate "line", 244
  # rx subcapture "sym"
    set_addr $I10, rxcap_523_fail
    rx518_cur."!mark_push"(0, rx518_pos, $I10)
  # rx literal  "our"
    add $I11, rx518_pos, 3
    gt $I11, rx518_eos, rx518_fail
    sub $I11, rx518_pos, rx518_off
    substr $S10, rx518_tgt, $I11, 3
    ne $S10, "our", rx518_fail
    add rx518_pos, 3
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
    $P10 = rx518_cur."scoped"("our")
    unless $P10, rx518_fail
    rx518_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx518_pos = $P10."pos"()
  # rx pass
    rx518_cur."!cursor_pass"(rx518_pos, "scope_declarator:sym<our>")
    rx518_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<our>", " at pos=", rx518_pos)
    .return (rx518_cur)
  rx518_fail:
.annotate "line", 4
    (rx518_rep, rx518_pos, $I10, $P10) = rx518_cur."!mark_fail"(0)
    lt rx518_pos, -1, rx518_done
    eq rx518_pos, -1, rx518_fail
    jump $I10
  rx518_done:
    rx518_cur."!cursor_fail"()
    rx518_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<our>")
    .return (rx518_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("126_1258904213.70809") :method
.annotate "line", 4
    $P520 = self."!PREFIX__!subrule"("scoped", "our")
    new $P521, "ResizablePMCArray"
    push $P521, $P520
    .return ($P521)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("127_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx525_tgt
    .local int rx525_pos
    .local int rx525_off
    .local int rx525_eos
    .local int rx525_rep
    .local pmc rx525_cur
    (rx525_cur, rx525_pos, rx525_tgt, $I10) = self."!cursor_start"()
    rx525_cur."!cursor_debug"("START ", "scope_declarator:sym<has>")
    .lex unicode:"$\x{a2}", rx525_cur
    .local pmc match
    .lex "$/", match
    length rx525_eos, rx525_tgt
    set rx525_off, 0
    lt $I10, 2, rx525_start
    sub rx525_off, $I10, 1
    substr rx525_tgt, rx525_tgt, rx525_off
  rx525_start:
    ge rx525_pos, 0, rxscan529_done
  rxscan529_loop:
    ($P10) = rx525_cur."from"()
    inc $P10
    set rx525_pos, $P10
    ge rx525_pos, rx525_eos, rxscan529_done
    set_addr $I10, rxscan529_loop
    rx525_cur."!mark_push"(0, rx525_pos, $I10)
  rxscan529_done:
.annotate "line", 245
  # rx subcapture "sym"
    set_addr $I10, rxcap_530_fail
    rx525_cur."!mark_push"(0, rx525_pos, $I10)
  # rx literal  "has"
    add $I11, rx525_pos, 3
    gt $I11, rx525_eos, rx525_fail
    sub $I11, rx525_pos, rx525_off
    substr $S10, rx525_tgt, $I11, 3
    ne $S10, "has", rx525_fail
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
    $P10 = rx525_cur."scoped"("has")
    unless $P10, rx525_fail
    rx525_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx525_pos = $P10."pos"()
  # rx pass
    rx525_cur."!cursor_pass"(rx525_pos, "scope_declarator:sym<has>")
    rx525_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<has>", " at pos=", rx525_pos)
    .return (rx525_cur)
  rx525_fail:
.annotate "line", 4
    (rx525_rep, rx525_pos, $I10, $P10) = rx525_cur."!mark_fail"(0)
    lt rx525_pos, -1, rx525_done
    eq rx525_pos, -1, rx525_fail
    jump $I10
  rx525_done:
    rx525_cur."!cursor_fail"()
    rx525_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<has>")
    .return (rx525_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("128_1258904213.70809") :method
.annotate "line", 4
    $P527 = self."!PREFIX__!subrule"("scoped", "has")
    new $P528, "ResizablePMCArray"
    push $P528, $P527
    .return ($P528)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("129_1258904213.70809") :method :outer("11_1258904213.70809")
    .param pmc param_532
.annotate "line", 247
    .lex "$*SCOPE", param_532
.annotate "line", 4
    .local string rx533_tgt
    .local int rx533_pos
    .local int rx533_off
    .local int rx533_eos
    .local int rx533_rep
    .local pmc rx533_cur
    (rx533_cur, rx533_pos, rx533_tgt, $I10) = self."!cursor_start"()
    rx533_cur."!cursor_debug"("START ", "scoped")
    .lex unicode:"$\x{a2}", rx533_cur
    .local pmc match
    .lex "$/", match
    length rx533_eos, rx533_tgt
    set rx533_off, 0
    lt $I10, 2, rx533_start
    sub rx533_off, $I10, 1
    substr rx533_tgt, rx533_tgt, rx533_off
  rx533_start:
    ge rx533_pos, 0, rxscan536_done
  rxscan536_loop:
    ($P10) = rx533_cur."from"()
    inc $P10
    set rx533_pos, $P10
    ge rx533_pos, rx533_eos, rxscan536_done
    set_addr $I10, rxscan536_loop
    rx533_cur."!mark_push"(0, rx533_pos, $I10)
  rxscan536_done:
  alt537_0:
.annotate "line", 247
    set_addr $I10, alt537_1
    rx533_cur."!mark_push"(0, rx533_pos, $I10)
.annotate "line", 248
  # rx subrule "ws" subtype=method negate=
    rx533_cur."!cursor_pos"(rx533_pos)
    $P10 = rx533_cur."ws"()
    unless $P10, rx533_fail
    rx533_pos = $P10."pos"()
  # rx subrule "variable_declarator" subtype=capture negate=
    rx533_cur."!cursor_pos"(rx533_pos)
    $P10 = rx533_cur."variable_declarator"()
    unless $P10, rx533_fail
    rx533_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx533_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx533_cur."!cursor_pos"(rx533_pos)
    $P10 = rx533_cur."ws"()
    unless $P10, rx533_fail
    rx533_pos = $P10."pos"()
    goto alt537_end
  alt537_1:
.annotate "line", 249
  # rx subrule "ws" subtype=method negate=
    rx533_cur."!cursor_pos"(rx533_pos)
    $P10 = rx533_cur."ws"()
    unless $P10, rx533_fail
    rx533_pos = $P10."pos"()
  # rx subrule "routine_declarator" subtype=capture negate=
    rx533_cur."!cursor_pos"(rx533_pos)
    $P10 = rx533_cur."routine_declarator"()
    unless $P10, rx533_fail
    rx533_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx533_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx533_cur."!cursor_pos"(rx533_pos)
    $P10 = rx533_cur."ws"()
    unless $P10, rx533_fail
    rx533_pos = $P10."pos"()
  alt537_end:
.annotate "line", 247
  # rx pass
    rx533_cur."!cursor_pass"(rx533_pos, "scoped")
    rx533_cur."!cursor_debug"("PASS  ", "scoped", " at pos=", rx533_pos)
    .return (rx533_cur)
  rx533_fail:
.annotate "line", 4
    (rx533_rep, rx533_pos, $I10, $P10) = rx533_cur."!mark_fail"(0)
    lt rx533_pos, -1, rx533_done
    eq rx533_pos, -1, rx533_fail
    jump $I10
  rx533_done:
    rx533_cur."!cursor_fail"()
    rx533_cur."!cursor_debug"("FAIL  ", "scoped")
    .return (rx533_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("130_1258904213.70809") :method
.annotate "line", 4
    new $P535, "ResizablePMCArray"
    push $P535, ""
    push $P535, ""
    .return ($P535)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("131_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx543_tgt
    .local int rx543_pos
    .local int rx543_off
    .local int rx543_eos
    .local int rx543_rep
    .local pmc rx543_cur
    (rx543_cur, rx543_pos, rx543_tgt, $I10) = self."!cursor_start"()
    rx543_cur."!cursor_debug"("START ", "variable_declarator")
    .lex unicode:"$\x{a2}", rx543_cur
    .local pmc match
    .lex "$/", match
    length rx543_eos, rx543_tgt
    set rx543_off, 0
    lt $I10, 2, rx543_start
    sub rx543_off, $I10, 1
    substr rx543_tgt, rx543_tgt, rx543_off
  rx543_start:
    ge rx543_pos, 0, rxscan547_done
  rxscan547_loop:
    ($P10) = rx543_cur."from"()
    inc $P10
    set rx543_pos, $P10
    ge rx543_pos, rx543_eos, rxscan547_done
    set_addr $I10, rxscan547_loop
    rx543_cur."!mark_push"(0, rx543_pos, $I10)
  rxscan547_done:
.annotate "line", 252
  # rx subrule "variable" subtype=capture negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."variable"()
    unless $P10, rx543_fail
    rx543_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx543_pos = $P10."pos"()
  # rx pass
    rx543_cur."!cursor_pass"(rx543_pos, "variable_declarator")
    rx543_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx543_pos)
    .return (rx543_cur)
  rx543_fail:
.annotate "line", 4
    (rx543_rep, rx543_pos, $I10, $P10) = rx543_cur."!mark_fail"(0)
    lt rx543_pos, -1, rx543_done
    eq rx543_pos, -1, rx543_fail
    jump $I10
  rx543_done:
    rx543_cur."!cursor_fail"()
    rx543_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx543_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("132_1258904213.70809") :method
.annotate "line", 4
    $P545 = self."!PREFIX__!subrule"("variable", "")
    new $P546, "ResizablePMCArray"
    push $P546, $P545
    .return ($P546)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("133_1258904213.70809") :method
.annotate "line", 254
    $P549 = self."!protoregex"("routine_declarator")
    .return ($P549)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("134_1258904213.70809") :method
.annotate "line", 254
    $P551 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P551)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("135_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx553_tgt
    .local int rx553_pos
    .local int rx553_off
    .local int rx553_eos
    .local int rx553_rep
    .local pmc rx553_cur
    (rx553_cur, rx553_pos, rx553_tgt, $I10) = self."!cursor_start"()
    rx553_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
    .lex unicode:"$\x{a2}", rx553_cur
    .local pmc match
    .lex "$/", match
    length rx553_eos, rx553_tgt
    set rx553_off, 0
    lt $I10, 2, rx553_start
    sub rx553_off, $I10, 1
    substr rx553_tgt, rx553_tgt, rx553_off
  rx553_start:
    ge rx553_pos, 0, rxscan557_done
  rxscan557_loop:
    ($P10) = rx553_cur."from"()
    inc $P10
    set rx553_pos, $P10
    ge rx553_pos, rx553_eos, rxscan557_done
    set_addr $I10, rxscan557_loop
    rx553_cur."!mark_push"(0, rx553_pos, $I10)
  rxscan557_done:
.annotate "line", 255
  # rx subcapture "sym"
    set_addr $I10, rxcap_558_fail
    rx553_cur."!mark_push"(0, rx553_pos, $I10)
  # rx literal  "sub"
    add $I11, rx553_pos, 3
    gt $I11, rx553_eos, rx553_fail
    sub $I11, rx553_pos, rx553_off
    substr $S10, rx553_tgt, $I11, 3
    ne $S10, "sub", rx553_fail
    add rx553_pos, 3
    set_addr $I10, rxcap_558_fail
    ($I12, $I11) = rx553_cur."!mark_peek"($I10)
    rx553_cur."!cursor_pos"($I11)
    ($P10) = rx553_cur."!cursor_start"()
    $P10."!cursor_pass"(rx553_pos, "")
    rx553_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_558_done
  rxcap_558_fail:
    goto rx553_fail
  rxcap_558_done:
  # rx subrule "routine_def" subtype=capture negate=
    rx553_cur."!cursor_pos"(rx553_pos)
    $P10 = rx553_cur."routine_def"()
    unless $P10, rx553_fail
    rx553_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx553_pos = $P10."pos"()
  # rx pass
    rx553_cur."!cursor_pass"(rx553_pos, "routine_declarator:sym<sub>")
    rx553_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx553_pos)
    .return (rx553_cur)
  rx553_fail:
.annotate "line", 4
    (rx553_rep, rx553_pos, $I10, $P10) = rx553_cur."!mark_fail"(0)
    lt rx553_pos, -1, rx553_done
    eq rx553_pos, -1, rx553_fail
    jump $I10
  rx553_done:
    rx553_cur."!cursor_fail"()
    rx553_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx553_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("136_1258904213.70809") :method
.annotate "line", 4
    $P555 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P556, "ResizablePMCArray"
    push $P556, $P555
    .return ($P556)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("137_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx560_tgt
    .local int rx560_pos
    .local int rx560_off
    .local int rx560_eos
    .local int rx560_rep
    .local pmc rx560_cur
    (rx560_cur, rx560_pos, rx560_tgt, $I10) = self."!cursor_start"()
    rx560_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
    .lex unicode:"$\x{a2}", rx560_cur
    .local pmc match
    .lex "$/", match
    length rx560_eos, rx560_tgt
    set rx560_off, 0
    lt $I10, 2, rx560_start
    sub rx560_off, $I10, 1
    substr rx560_tgt, rx560_tgt, rx560_off
  rx560_start:
    ge rx560_pos, 0, rxscan564_done
  rxscan564_loop:
    ($P10) = rx560_cur."from"()
    inc $P10
    set rx560_pos, $P10
    ge rx560_pos, rx560_eos, rxscan564_done
    set_addr $I10, rxscan564_loop
    rx560_cur."!mark_push"(0, rx560_pos, $I10)
  rxscan564_done:
.annotate "line", 256
  # rx subcapture "sym"
    set_addr $I10, rxcap_565_fail
    rx560_cur."!mark_push"(0, rx560_pos, $I10)
  # rx literal  "method"
    add $I11, rx560_pos, 6
    gt $I11, rx560_eos, rx560_fail
    sub $I11, rx560_pos, rx560_off
    substr $S10, rx560_tgt, $I11, 6
    ne $S10, "method", rx560_fail
    add rx560_pos, 6
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
  # rx subrule "method_def" subtype=capture negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."method_def"()
    unless $P10, rx560_fail
    rx560_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx560_pos = $P10."pos"()
  # rx pass
    rx560_cur."!cursor_pass"(rx560_pos, "routine_declarator:sym<method>")
    rx560_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx560_pos)
    .return (rx560_cur)
  rx560_fail:
.annotate "line", 4
    (rx560_rep, rx560_pos, $I10, $P10) = rx560_cur."!mark_fail"(0)
    lt rx560_pos, -1, rx560_done
    eq rx560_pos, -1, rx560_fail
    jump $I10
  rx560_done:
    rx560_cur."!cursor_fail"()
    rx560_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx560_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("138_1258904213.70809") :method
.annotate "line", 4
    $P562 = self."!PREFIX__!subrule"("method_def", "method")
    new $P563, "ResizablePMCArray"
    push $P563, $P562
    .return ($P563)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("139_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx567_tgt
    .local int rx567_pos
    .local int rx567_off
    .local int rx567_eos
    .local int rx567_rep
    .local pmc rx567_cur
    (rx567_cur, rx567_pos, rx567_tgt, $I10) = self."!cursor_start"()
    rx567_cur."!cursor_debug"("START ", "routine_def")
    rx567_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx567_cur
    .local pmc match
    .lex "$/", match
    length rx567_eos, rx567_tgt
    set rx567_off, 0
    lt $I10, 2, rx567_start
    sub rx567_off, $I10, 1
    substr rx567_tgt, rx567_tgt, rx567_off
  rx567_start:
    ge rx567_pos, 0, rxscan570_done
  rxscan570_loop:
    ($P10) = rx567_cur."from"()
    inc $P10
    set rx567_pos, $P10
    ge rx567_pos, rx567_eos, rxscan570_done
    set_addr $I10, rxscan570_loop
    rx567_cur."!mark_push"(0, rx567_pos, $I10)
  rxscan570_done:
.annotate "line", 258
  # rx subrule "ws" subtype=method negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."ws"()
    unless $P10, rx567_fail
    rx567_pos = $P10."pos"()
.annotate "line", 259
  # rx rxquantr572 ** 0..1
    set_addr $I573, rxquantr572_done
    rx567_cur."!mark_push"(0, rx567_pos, $I573)
  rxquantr572_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."deflongname"()
    unless $P10, rx567_fail
    rx567_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx567_pos = $P10."pos"()
    (rx567_rep) = rx567_cur."!mark_commit"($I573)
  rxquantr572_done:
  # rx subrule "ws" subtype=method negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."ws"()
    unless $P10, rx567_fail
    rx567_pos = $P10."pos"()
.annotate "line", 260
  # rx subrule "newpad" subtype=method negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."newpad"()
    unless $P10, rx567_fail
    rx567_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."ws"()
    unless $P10, rx567_fail
    rx567_pos = $P10."pos"()
  alt576_0:
.annotate "line", 261
    set_addr $I10, alt576_1
    rx567_cur."!mark_push"(0, rx567_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."ws"()
    unless $P10, rx567_fail
    rx567_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx567_pos, 1
    gt $I11, rx567_eos, rx567_fail
    sub $I11, rx567_pos, rx567_off
    substr $S10, rx567_tgt, $I11, 1
    ne $S10, "(", rx567_fail
    add rx567_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."ws"()
    unless $P10, rx567_fail
    rx567_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."signature"()
    unless $P10, rx567_fail
    rx567_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx567_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."ws"()
    unless $P10, rx567_fail
    rx567_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx567_pos, 1
    gt $I11, rx567_eos, rx567_fail
    sub $I11, rx567_pos, rx567_off
    substr $S10, rx567_tgt, $I11, 1
    ne $S10, ")", rx567_fail
    add rx567_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."ws"()
    unless $P10, rx567_fail
    rx567_pos = $P10."pos"()
    goto alt576_end
  alt576_1:
.annotate "line", 262
  # rx subrule "ws" subtype=method negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."ws"()
    unless $P10, rx567_fail
    rx567_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx567_fail
    rx567_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."ws"()
    unless $P10, rx567_fail
    rx567_pos = $P10."pos"()
  alt576_end:
  # rx subrule "ws" subtype=method negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."ws"()
    unless $P10, rx567_fail
    rx567_pos = $P10."pos"()
.annotate "line", 263
  # rx subrule "blockoid" subtype=capture negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."blockoid"()
    unless $P10, rx567_fail
    rx567_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx567_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."ws"()
    unless $P10, rx567_fail
    rx567_pos = $P10."pos"()
.annotate "line", 258
  # rx pass
    rx567_cur."!cursor_pass"(rx567_pos, "routine_def")
    rx567_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx567_pos)
    .return (rx567_cur)
  rx567_fail:
.annotate "line", 4
    (rx567_rep, rx567_pos, $I10, $P10) = rx567_cur."!mark_fail"(0)
    lt rx567_pos, -1, rx567_done
    eq rx567_pos, -1, rx567_fail
    jump $I10
  rx567_done:
    rx567_cur."!cursor_fail"()
    rx567_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx567_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("140_1258904213.70809") :method
.annotate "line", 4
    new $P569, "ResizablePMCArray"
    push $P569, ""
    .return ($P569)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("141_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx586_tgt
    .local int rx586_pos
    .local int rx586_off
    .local int rx586_eos
    .local int rx586_rep
    .local pmc rx586_cur
    (rx586_cur, rx586_pos, rx586_tgt, $I10) = self."!cursor_start"()
    rx586_cur."!cursor_debug"("START ", "method_def")
    rx586_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx586_cur
    .local pmc match
    .lex "$/", match
    length rx586_eos, rx586_tgt
    set rx586_off, 0
    lt $I10, 2, rx586_start
    sub rx586_off, $I10, 1
    substr rx586_tgt, rx586_tgt, rx586_off
  rx586_start:
    ge rx586_pos, 0, rxscan589_done
  rxscan589_loop:
    ($P10) = rx586_cur."from"()
    inc $P10
    set rx586_pos, $P10
    ge rx586_pos, rx586_eos, rxscan589_done
    set_addr $I10, rxscan589_loop
    rx586_cur."!mark_push"(0, rx586_pos, $I10)
  rxscan589_done:
.annotate "line", 266
  # rx subrule "ws" subtype=method negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."ws"()
    unless $P10, rx586_fail
    rx586_pos = $P10."pos"()
.annotate "line", 267
  # rx rxquantr591 ** 0..1
    set_addr $I592, rxquantr591_done
    rx586_cur."!mark_push"(0, rx586_pos, $I592)
  rxquantr591_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."deflongname"()
    unless $P10, rx586_fail
    rx586_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx586_pos = $P10."pos"()
    (rx586_rep) = rx586_cur."!mark_commit"($I592)
  rxquantr591_done:
  # rx subrule "ws" subtype=method negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."ws"()
    unless $P10, rx586_fail
    rx586_pos = $P10."pos"()
.annotate "line", 268
  # rx subrule "newpad" subtype=method negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."newpad"()
    unless $P10, rx586_fail
    rx586_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."ws"()
    unless $P10, rx586_fail
    rx586_pos = $P10."pos"()
  alt595_0:
.annotate "line", 269
    set_addr $I10, alt595_1
    rx586_cur."!mark_push"(0, rx586_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."ws"()
    unless $P10, rx586_fail
    rx586_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx586_pos, 1
    gt $I11, rx586_eos, rx586_fail
    sub $I11, rx586_pos, rx586_off
    substr $S10, rx586_tgt, $I11, 1
    ne $S10, "(", rx586_fail
    add rx586_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."ws"()
    unless $P10, rx586_fail
    rx586_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."signature"()
    unless $P10, rx586_fail
    rx586_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx586_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."ws"()
    unless $P10, rx586_fail
    rx586_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx586_pos, 1
    gt $I11, rx586_eos, rx586_fail
    sub $I11, rx586_pos, rx586_off
    substr $S10, rx586_tgt, $I11, 1
    ne $S10, ")", rx586_fail
    add rx586_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."ws"()
    unless $P10, rx586_fail
    rx586_pos = $P10."pos"()
    goto alt595_end
  alt595_1:
.annotate "line", 270
  # rx subrule "ws" subtype=method negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."ws"()
    unless $P10, rx586_fail
    rx586_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx586_fail
    rx586_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."ws"()
    unless $P10, rx586_fail
    rx586_pos = $P10."pos"()
  alt595_end:
  # rx subrule "ws" subtype=method negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."ws"()
    unless $P10, rx586_fail
    rx586_pos = $P10."pos"()
.annotate "line", 271
  # rx subrule "blockoid" subtype=capture negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."blockoid"()
    unless $P10, rx586_fail
    rx586_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx586_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."ws"()
    unless $P10, rx586_fail
    rx586_pos = $P10."pos"()
.annotate "line", 266
  # rx pass
    rx586_cur."!cursor_pass"(rx586_pos, "method_def")
    rx586_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx586_pos)
    .return (rx586_cur)
  rx586_fail:
.annotate "line", 4
    (rx586_rep, rx586_pos, $I10, $P10) = rx586_cur."!mark_fail"(0)
    lt rx586_pos, -1, rx586_done
    eq rx586_pos, -1, rx586_fail
    jump $I10
  rx586_done:
    rx586_cur."!cursor_fail"()
    rx586_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx586_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("142_1258904213.70809") :method
.annotate "line", 4
    new $P588, "ResizablePMCArray"
    push $P588, ""
    .return ($P588)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("143_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx605_tgt
    .local int rx605_pos
    .local int rx605_off
    .local int rx605_eos
    .local int rx605_rep
    .local pmc rx605_cur
    (rx605_cur, rx605_pos, rx605_tgt, $I10) = self."!cursor_start"()
    rx605_cur."!cursor_debug"("START ", "signature")
    rx605_cur."!cursor_caparray"("parameter")
    .lex unicode:"$\x{a2}", rx605_cur
    .local pmc match
    .lex "$/", match
    length rx605_eos, rx605_tgt
    set rx605_off, 0
    lt $I10, 2, rx605_start
    sub rx605_off, $I10, 1
    substr rx605_tgt, rx605_tgt, rx605_off
  rx605_start:
    ge rx605_pos, 0, rxscan608_done
  rxscan608_loop:
    ($P10) = rx605_cur."from"()
    inc $P10
    set rx605_pos, $P10
    ge rx605_pos, rx605_eos, rxscan608_done
    set_addr $I10, rxscan608_loop
    rx605_cur."!mark_push"(0, rx605_pos, $I10)
  rxscan608_done:
.annotate "line", 274
  # rx rxquantr609 ** 0..1
    set_addr $I612, rxquantr609_done
    rx605_cur."!mark_push"(0, rx605_pos, $I612)
  rxquantr609_loop:
  # rx rxquantr610 ** 1..*
    set_addr $I611, rxquantr610_done
    rx605_cur."!mark_push"(0, -1, $I611)
  rxquantr610_loop:
  # rx subrule "ws" subtype=method negate=
    rx605_cur."!cursor_pos"(rx605_pos)
    $P10 = rx605_cur."ws"()
    unless $P10, rx605_fail
    rx605_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx605_cur."!cursor_pos"(rx605_pos)
    $P10 = rx605_cur."parameter"()
    unless $P10, rx605_fail
    rx605_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx605_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx605_cur."!cursor_pos"(rx605_pos)
    $P10 = rx605_cur."ws"()
    unless $P10, rx605_fail
    rx605_pos = $P10."pos"()
    (rx605_rep) = rx605_cur."!mark_commit"($I611)
    rx605_cur."!mark_push"(rx605_rep, rx605_pos, $I611)
  # rx literal  ","
    add $I11, rx605_pos, 1
    gt $I11, rx605_eos, rx605_fail
    sub $I11, rx605_pos, rx605_off
    substr $S10, rx605_tgt, $I11, 1
    ne $S10, ",", rx605_fail
    add rx605_pos, 1
    goto rxquantr610_loop
  rxquantr610_done:
    (rx605_rep) = rx605_cur."!mark_commit"($I612)
  rxquantr609_done:
  # rx pass
    rx605_cur."!cursor_pass"(rx605_pos, "signature")
    rx605_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx605_pos)
    .return (rx605_cur)
  rx605_fail:
.annotate "line", 4
    (rx605_rep, rx605_pos, $I10, $P10) = rx605_cur."!mark_fail"(0)
    lt rx605_pos, -1, rx605_done
    eq rx605_pos, -1, rx605_fail
    jump $I10
  rx605_done:
    rx605_cur."!cursor_fail"()
    rx605_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx605_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("144_1258904213.70809") :method
.annotate "line", 4
    new $P607, "ResizablePMCArray"
    push $P607, ""
    .return ($P607)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("145_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx614_tgt
    .local int rx614_pos
    .local int rx614_off
    .local int rx614_eos
    .local int rx614_rep
    .local pmc rx614_cur
    (rx614_cur, rx614_pos, rx614_tgt, $I10) = self."!cursor_start"()
    rx614_cur."!cursor_debug"("START ", "parameter")
    rx614_cur."!cursor_caparray"("default_value")
    .lex unicode:"$\x{a2}", rx614_cur
    .local pmc match
    .lex "$/", match
    length rx614_eos, rx614_tgt
    set rx614_off, 0
    lt $I10, 2, rx614_start
    sub rx614_off, $I10, 1
    substr rx614_tgt, rx614_tgt, rx614_off
  rx614_start:
    ge rx614_pos, 0, rxscan620_done
  rxscan620_loop:
    ($P10) = rx614_cur."from"()
    inc $P10
    set rx614_pos, $P10
    ge rx614_pos, rx614_eos, rxscan620_done
    set_addr $I10, rxscan620_loop
    rx614_cur."!mark_push"(0, rx614_pos, $I10)
  rxscan620_done:
  alt621_0:
.annotate "line", 277
    set_addr $I10, alt621_1
    rx614_cur."!mark_push"(0, rx614_pos, $I10)
.annotate "line", 278
  # rx subcapture "quant"
    set_addr $I10, rxcap_622_fail
    rx614_cur."!mark_push"(0, rx614_pos, $I10)
  # rx literal  "*"
    add $I11, rx614_pos, 1
    gt $I11, rx614_eos, rx614_fail
    sub $I11, rx614_pos, rx614_off
    substr $S10, rx614_tgt, $I11, 1
    ne $S10, "*", rx614_fail
    add rx614_pos, 1
    set_addr $I10, rxcap_622_fail
    ($I12, $I11) = rx614_cur."!mark_peek"($I10)
    rx614_cur."!cursor_pos"($I11)
    ($P10) = rx614_cur."!cursor_start"()
    $P10."!cursor_pass"(rx614_pos, "")
    rx614_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_622_done
  rxcap_622_fail:
    goto rx614_fail
  rxcap_622_done:
  # rx subrule "param_var" subtype=capture negate=
    rx614_cur."!cursor_pos"(rx614_pos)
    $P10 = rx614_cur."param_var"()
    unless $P10, rx614_fail
    rx614_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx614_pos = $P10."pos"()
    goto alt621_end
  alt621_1:
  alt623_0:
.annotate "line", 279
    set_addr $I10, alt623_1
    rx614_cur."!mark_push"(0, rx614_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx614_cur."!cursor_pos"(rx614_pos)
    $P10 = rx614_cur."param_var"()
    unless $P10, rx614_fail
    rx614_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx614_pos = $P10."pos"()
    goto alt623_end
  alt623_1:
  # rx subrule "named_param" subtype=capture negate=
    rx614_cur."!cursor_pos"(rx614_pos)
    $P10 = rx614_cur."named_param"()
    unless $P10, rx614_fail
    rx614_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx614_pos = $P10."pos"()
  alt623_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_625_fail
    rx614_cur."!mark_push"(0, rx614_pos, $I10)
  alt624_0:
    set_addr $I10, alt624_1
    rx614_cur."!mark_push"(0, rx614_pos, $I10)
  # rx literal  "?"
    add $I11, rx614_pos, 1
    gt $I11, rx614_eos, rx614_fail
    sub $I11, rx614_pos, rx614_off
    substr $S10, rx614_tgt, $I11, 1
    ne $S10, "?", rx614_fail
    add rx614_pos, 1
    goto alt624_end
  alt624_1:
    set_addr $I10, alt624_2
    rx614_cur."!mark_push"(0, rx614_pos, $I10)
  # rx literal  "!"
    add $I11, rx614_pos, 1
    gt $I11, rx614_eos, rx614_fail
    sub $I11, rx614_pos, rx614_off
    substr $S10, rx614_tgt, $I11, 1
    ne $S10, "!", rx614_fail
    add rx614_pos, 1
    goto alt624_end
  alt624_2:
  alt624_end:
    set_addr $I10, rxcap_625_fail
    ($I12, $I11) = rx614_cur."!mark_peek"($I10)
    rx614_cur."!cursor_pos"($I11)
    ($P10) = rx614_cur."!cursor_start"()
    $P10."!cursor_pass"(rx614_pos, "")
    rx614_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_625_done
  rxcap_625_fail:
    goto rx614_fail
  rxcap_625_done:
  alt621_end:
.annotate "line", 281
  # rx rxquantr626 ** 0..1
    set_addr $I627, rxquantr626_done
    rx614_cur."!mark_push"(0, rx614_pos, $I627)
  rxquantr626_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx614_cur."!cursor_pos"(rx614_pos)
    $P10 = rx614_cur."default_value"()
    unless $P10, rx614_fail
    rx614_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("default_value")
    rx614_pos = $P10."pos"()
    (rx614_rep) = rx614_cur."!mark_commit"($I627)
  rxquantr626_done:
.annotate "line", 276
  # rx pass
    rx614_cur."!cursor_pass"(rx614_pos, "parameter")
    rx614_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx614_pos)
    .return (rx614_cur)
  rx614_fail:
.annotate "line", 4
    (rx614_rep, rx614_pos, $I10, $P10) = rx614_cur."!mark_fail"(0)
    lt rx614_pos, -1, rx614_done
    eq rx614_pos, -1, rx614_fail
    jump $I10
  rx614_done:
    rx614_cur."!cursor_fail"()
    rx614_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx614_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("146_1258904213.70809") :method
.annotate "line", 4
    $P616 = self."!PREFIX__!subrule"("named_param", "")
    $P617 = self."!PREFIX__!subrule"("param_var", "")
    $P618 = self."!PREFIX__!subrule"("param_var", "*")
    new $P619, "ResizablePMCArray"
    push $P619, $P616
    push $P619, $P617
    push $P619, $P618
    .return ($P619)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("147_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx629_tgt
    .local int rx629_pos
    .local int rx629_off
    .local int rx629_eos
    .local int rx629_rep
    .local pmc rx629_cur
    (rx629_cur, rx629_pos, rx629_tgt, $I10) = self."!cursor_start"()
    rx629_cur."!cursor_debug"("START ", "param_var")
    rx629_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx629_cur
    .local pmc match
    .lex "$/", match
    length rx629_eos, rx629_tgt
    set rx629_off, 0
    lt $I10, 2, rx629_start
    sub rx629_off, $I10, 1
    substr rx629_tgt, rx629_tgt, rx629_off
  rx629_start:
    ge rx629_pos, 0, rxscan633_done
  rxscan633_loop:
    ($P10) = rx629_cur."from"()
    inc $P10
    set rx629_pos, $P10
    ge rx629_pos, rx629_eos, rxscan633_done
    set_addr $I10, rxscan633_loop
    rx629_cur."!mark_push"(0, rx629_pos, $I10)
  rxscan633_done:
.annotate "line", 285
  # rx subrule "sigil" subtype=capture negate=
    rx629_cur."!cursor_pos"(rx629_pos)
    $P10 = rx629_cur."sigil"()
    unless $P10, rx629_fail
    rx629_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx629_pos = $P10."pos"()
  # rx rxquantr634 ** 0..1
    set_addr $I635, rxquantr634_done
    rx629_cur."!mark_push"(0, rx629_pos, $I635)
  rxquantr634_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx629_cur."!cursor_pos"(rx629_pos)
    $P10 = rx629_cur."twigil"()
    unless $P10, rx629_fail
    rx629_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx629_pos = $P10."pos"()
    (rx629_rep) = rx629_cur."!mark_commit"($I635)
  rxquantr634_done:
  alt636_0:
.annotate "line", 286
    set_addr $I10, alt636_1
    rx629_cur."!mark_push"(0, rx629_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx629_cur."!cursor_pos"(rx629_pos)
    $P10 = rx629_cur."ident"()
    unless $P10, rx629_fail
    rx629_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx629_pos = $P10."pos"()
    goto alt636_end
  alt636_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_637_fail
    rx629_cur."!mark_push"(0, rx629_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx629_pos, rx629_eos, rx629_fail
    sub $I10, rx629_pos, rx629_off
    substr $S10, rx629_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx629_fail
    inc rx629_pos
    set_addr $I10, rxcap_637_fail
    ($I12, $I11) = rx629_cur."!mark_peek"($I10)
    rx629_cur."!cursor_pos"($I11)
    ($P10) = rx629_cur."!cursor_start"()
    $P10."!cursor_pass"(rx629_pos, "")
    rx629_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_637_done
  rxcap_637_fail:
    goto rx629_fail
  rxcap_637_done:
  alt636_end:
.annotate "line", 284
  # rx pass
    rx629_cur."!cursor_pass"(rx629_pos, "param_var")
    rx629_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx629_pos)
    .return (rx629_cur)
  rx629_fail:
.annotate "line", 4
    (rx629_rep, rx629_pos, $I10, $P10) = rx629_cur."!mark_fail"(0)
    lt rx629_pos, -1, rx629_done
    eq rx629_pos, -1, rx629_fail
    jump $I10
  rx629_done:
    rx629_cur."!cursor_fail"()
    rx629_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx629_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("148_1258904213.70809") :method
.annotate "line", 4
    $P631 = self."!PREFIX__!subrule"("sigil", "")
    new $P632, "ResizablePMCArray"
    push $P632, $P631
    .return ($P632)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("149_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx639_tgt
    .local int rx639_pos
    .local int rx639_off
    .local int rx639_eos
    .local int rx639_rep
    .local pmc rx639_cur
    (rx639_cur, rx639_pos, rx639_tgt, $I10) = self."!cursor_start"()
    rx639_cur."!cursor_debug"("START ", "named_param")
    .lex unicode:"$\x{a2}", rx639_cur
    .local pmc match
    .lex "$/", match
    length rx639_eos, rx639_tgt
    set rx639_off, 0
    lt $I10, 2, rx639_start
    sub rx639_off, $I10, 1
    substr rx639_tgt, rx639_tgt, rx639_off
  rx639_start:
    ge rx639_pos, 0, rxscan643_done
  rxscan643_loop:
    ($P10) = rx639_cur."from"()
    inc $P10
    set rx639_pos, $P10
    ge rx639_pos, rx639_eos, rxscan643_done
    set_addr $I10, rxscan643_loop
    rx639_cur."!mark_push"(0, rx639_pos, $I10)
  rxscan643_done:
.annotate "line", 290
  # rx literal  ":"
    add $I11, rx639_pos, 1
    gt $I11, rx639_eos, rx639_fail
    sub $I11, rx639_pos, rx639_off
    substr $S10, rx639_tgt, $I11, 1
    ne $S10, ":", rx639_fail
    add rx639_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx639_cur."!cursor_pos"(rx639_pos)
    $P10 = rx639_cur."param_var"()
    unless $P10, rx639_fail
    rx639_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx639_pos = $P10."pos"()
.annotate "line", 289
  # rx pass
    rx639_cur."!cursor_pass"(rx639_pos, "named_param")
    rx639_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx639_pos)
    .return (rx639_cur)
  rx639_fail:
.annotate "line", 4
    (rx639_rep, rx639_pos, $I10, $P10) = rx639_cur."!mark_fail"(0)
    lt rx639_pos, -1, rx639_done
    eq rx639_pos, -1, rx639_fail
    jump $I10
  rx639_done:
    rx639_cur."!cursor_fail"()
    rx639_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx639_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("150_1258904213.70809") :method
.annotate "line", 4
    $P641 = self."!PREFIX__!subrule"("param_var", ":")
    new $P642, "ResizablePMCArray"
    push $P642, $P641
    .return ($P642)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("151_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx645_tgt
    .local int rx645_pos
    .local int rx645_off
    .local int rx645_eos
    .local int rx645_rep
    .local pmc rx645_cur
    (rx645_cur, rx645_pos, rx645_tgt, $I10) = self."!cursor_start"()
    rx645_cur."!cursor_debug"("START ", "default_value")
    .lex unicode:"$\x{a2}", rx645_cur
    .local pmc match
    .lex "$/", match
    length rx645_eos, rx645_tgt
    set rx645_off, 0
    lt $I10, 2, rx645_start
    sub rx645_off, $I10, 1
    substr rx645_tgt, rx645_tgt, rx645_off
  rx645_start:
    ge rx645_pos, 0, rxscan648_done
  rxscan648_loop:
    ($P10) = rx645_cur."from"()
    inc $P10
    set rx645_pos, $P10
    ge rx645_pos, rx645_eos, rxscan648_done
    set_addr $I10, rxscan648_loop
    rx645_cur."!mark_push"(0, rx645_pos, $I10)
  rxscan648_done:
.annotate "line", 293
  # rx subrule "ws" subtype=method negate=
    rx645_cur."!cursor_pos"(rx645_pos)
    $P10 = rx645_cur."ws"()
    unless $P10, rx645_fail
    rx645_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx645_pos, 1
    gt $I11, rx645_eos, rx645_fail
    sub $I11, rx645_pos, rx645_off
    substr $S10, rx645_tgt, $I11, 1
    ne $S10, "=", rx645_fail
    add rx645_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx645_cur."!cursor_pos"(rx645_pos)
    $P10 = rx645_cur."ws"()
    unless $P10, rx645_fail
    rx645_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx645_cur."!cursor_pos"(rx645_pos)
    $P10 = rx645_cur."EXPR"("i=")
    unless $P10, rx645_fail
    rx645_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx645_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx645_cur."!cursor_pos"(rx645_pos)
    $P10 = rx645_cur."ws"()
    unless $P10, rx645_fail
    rx645_pos = $P10."pos"()
  # rx pass
    rx645_cur."!cursor_pass"(rx645_pos, "default_value")
    rx645_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx645_pos)
    .return (rx645_cur)
  rx645_fail:
.annotate "line", 4
    (rx645_rep, rx645_pos, $I10, $P10) = rx645_cur."!mark_fail"(0)
    lt rx645_pos, -1, rx645_done
    eq rx645_pos, -1, rx645_fail
    jump $I10
  rx645_done:
    rx645_cur."!cursor_fail"()
    rx645_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx645_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("152_1258904213.70809") :method
.annotate "line", 4
    new $P647, "ResizablePMCArray"
    push $P647, ""
    .return ($P647)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("153_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx653_tgt
    .local int rx653_pos
    .local int rx653_off
    .local int rx653_eos
    .local int rx653_rep
    .local pmc rx653_cur
    (rx653_cur, rx653_pos, rx653_tgt, $I10) = self."!cursor_start"()
    rx653_cur."!cursor_debug"("START ", "regex_declarator")
    rx653_cur."!cursor_caparray"("signature")
    .lex unicode:"$\x{a2}", rx653_cur
    .local pmc match
    .lex "$/", match
    length rx653_eos, rx653_tgt
    set rx653_off, 0
    lt $I10, 2, rx653_start
    sub rx653_off, $I10, 1
    substr rx653_tgt, rx653_tgt, rx653_off
  rx653_start:
    ge rx653_pos, 0, rxscan656_done
  rxscan656_loop:
    ($P10) = rx653_cur."from"()
    inc $P10
    set rx653_pos, $P10
    ge rx653_pos, rx653_eos, rxscan656_done
    set_addr $I10, rxscan656_loop
    rx653_cur."!mark_push"(0, rx653_pos, $I10)
  rxscan656_done:
.annotate "line", 295
  # rx subrule "ws" subtype=method negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ws"()
    unless $P10, rx653_fail
    rx653_pos = $P10."pos"()
  alt658_0:
.annotate "line", 296
    set_addr $I10, alt658_1
    rx653_cur."!mark_push"(0, rx653_pos, $I10)
.annotate "line", 297
  # rx subrule "ws" subtype=method negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ws"()
    unless $P10, rx653_fail
    rx653_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_660_fail
    rx653_cur."!mark_push"(0, rx653_pos, $I10)
  # rx literal  "proto"
    add $I11, rx653_pos, 5
    gt $I11, rx653_eos, rx653_fail
    sub $I11, rx653_pos, rx653_off
    substr $S10, rx653_tgt, $I11, 5
    ne $S10, "proto", rx653_fail
    add rx653_pos, 5
    set_addr $I10, rxcap_660_fail
    ($I12, $I11) = rx653_cur."!mark_peek"($I10)
    rx653_cur."!cursor_pos"($I11)
    ($P10) = rx653_cur."!cursor_start"()
    $P10."!cursor_pass"(rx653_pos, "")
    rx653_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_660_done
  rxcap_660_fail:
    goto rx653_fail
  rxcap_660_done:
  # rx subrule "ws" subtype=method negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ws"()
    unless $P10, rx653_fail
    rx653_pos = $P10."pos"()
  alt662_0:
    set_addr $I10, alt662_1
    rx653_cur."!mark_push"(0, rx653_pos, $I10)
  # rx literal  "regex"
    add $I11, rx653_pos, 5
    gt $I11, rx653_eos, rx653_fail
    sub $I11, rx653_pos, rx653_off
    substr $S10, rx653_tgt, $I11, 5
    ne $S10, "regex", rx653_fail
    add rx653_pos, 5
    goto alt662_end
  alt662_1:
    set_addr $I10, alt662_2
    rx653_cur."!mark_push"(0, rx653_pos, $I10)
  # rx literal  "token"
    add $I11, rx653_pos, 5
    gt $I11, rx653_eos, rx653_fail
    sub $I11, rx653_pos, rx653_off
    substr $S10, rx653_tgt, $I11, 5
    ne $S10, "token", rx653_fail
    add rx653_pos, 5
    goto alt662_end
  alt662_2:
  # rx literal  "rule"
    add $I11, rx653_pos, 4
    gt $I11, rx653_eos, rx653_fail
    sub $I11, rx653_pos, rx653_off
    substr $S10, rx653_tgt, $I11, 4
    ne $S10, "rule", rx653_fail
    add rx653_pos, 4
  alt662_end:
  # rx subrule "ws" subtype=method negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ws"()
    unless $P10, rx653_fail
    rx653_pos = $P10."pos"()
.annotate "line", 298
  # rx subrule "deflongname" subtype=capture negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."deflongname"()
    unless $P10, rx653_fail
    rx653_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx653_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ws"()
    unless $P10, rx653_fail
    rx653_pos = $P10."pos"()
.annotate "line", 299
  # rx literal  "{"
    add $I11, rx653_pos, 1
    gt $I11, rx653_eos, rx653_fail
    sub $I11, rx653_pos, rx653_off
    substr $S10, rx653_tgt, $I11, 1
    ne $S10, "{", rx653_fail
    add rx653_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ws"()
    unless $P10, rx653_fail
    rx653_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx653_pos, 5
    gt $I11, rx653_eos, rx653_fail
    sub $I11, rx653_pos, rx653_off
    substr $S10, rx653_tgt, $I11, 5
    ne $S10, "<...>", rx653_fail
    add rx653_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ws"()
    unless $P10, rx653_fail
    rx653_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx653_pos, 1
    gt $I11, rx653_eos, rx653_fail
    sub $I11, rx653_pos, rx653_off
    substr $S10, rx653_tgt, $I11, 1
    ne $S10, "}", rx653_fail
    add rx653_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ENDSTMT"()
    unless $P10, rx653_fail
  # rx subrule "ws" subtype=method negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ws"()
    unless $P10, rx653_fail
    rx653_pos = $P10."pos"()
.annotate "line", 297
    goto alt658_end
  alt658_1:
.annotate "line", 300
  # rx subrule "ws" subtype=method negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ws"()
    unless $P10, rx653_fail
    rx653_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_670_fail
    rx653_cur."!mark_push"(0, rx653_pos, $I10)
  alt669_0:
    set_addr $I10, alt669_1
    rx653_cur."!mark_push"(0, rx653_pos, $I10)
  # rx literal  "regex"
    add $I11, rx653_pos, 5
    gt $I11, rx653_eos, rx653_fail
    sub $I11, rx653_pos, rx653_off
    substr $S10, rx653_tgt, $I11, 5
    ne $S10, "regex", rx653_fail
    add rx653_pos, 5
    goto alt669_end
  alt669_1:
    set_addr $I10, alt669_2
    rx653_cur."!mark_push"(0, rx653_pos, $I10)
  # rx literal  "token"
    add $I11, rx653_pos, 5
    gt $I11, rx653_eos, rx653_fail
    sub $I11, rx653_pos, rx653_off
    substr $S10, rx653_tgt, $I11, 5
    ne $S10, "token", rx653_fail
    add rx653_pos, 5
    goto alt669_end
  alt669_2:
  # rx literal  "rule"
    add $I11, rx653_pos, 4
    gt $I11, rx653_eos, rx653_fail
    sub $I11, rx653_pos, rx653_off
    substr $S10, rx653_tgt, $I11, 4
    ne $S10, "rule", rx653_fail
    add rx653_pos, 4
  alt669_end:
    set_addr $I10, rxcap_670_fail
    ($I12, $I11) = rx653_cur."!mark_peek"($I10)
    rx653_cur."!cursor_pos"($I11)
    ($P10) = rx653_cur."!cursor_start"()
    $P10."!cursor_pass"(rx653_pos, "")
    rx653_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_670_done
  rxcap_670_fail:
    goto rx653_fail
  rxcap_670_done:
  # rx subrule "ws" subtype=method negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ws"()
    unless $P10, rx653_fail
    rx653_pos = $P10."pos"()
.annotate "line", 301
  # rx subrule "deflongname" subtype=capture negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."deflongname"()
    unless $P10, rx653_fail
    rx653_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx653_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ws"()
    unless $P10, rx653_fail
    rx653_pos = $P10."pos"()
.annotate "line", 302
  # rx subrule "newpad" subtype=method negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."newpad"()
    unless $P10, rx653_fail
    rx653_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ws"()
    unless $P10, rx653_fail
    rx653_pos = $P10."pos"()
.annotate "line", 303
  # rx rxquantr674 ** 0..1
    set_addr $I679, rxquantr674_done
    rx653_cur."!mark_push"(0, rx653_pos, $I679)
  rxquantr674_loop:
  # rx subrule "ws" subtype=method negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ws"()
    unless $P10, rx653_fail
    rx653_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx653_pos, 1
    gt $I11, rx653_eos, rx653_fail
    sub $I11, rx653_pos, rx653_off
    substr $S10, rx653_tgt, $I11, 1
    ne $S10, "(", rx653_fail
    add rx653_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ws"()
    unless $P10, rx653_fail
    rx653_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."signature"()
    unless $P10, rx653_fail
    rx653_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx653_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ws"()
    unless $P10, rx653_fail
    rx653_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx653_pos, 1
    gt $I11, rx653_eos, rx653_fail
    sub $I11, rx653_pos, rx653_off
    substr $S10, rx653_tgt, $I11, 1
    ne $S10, ")", rx653_fail
    add rx653_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ws"()
    unless $P10, rx653_fail
    rx653_pos = $P10."pos"()
    (rx653_rep) = rx653_cur."!mark_commit"($I679)
  rxquantr674_done:
  # rx subrule "ws" subtype=method negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ws"()
    unless $P10, rx653_fail
    rx653_pos = $P10."pos"()
.annotate "line", 304
  # rx reduce name="regex_declarator" key="open"
    rx653_cur."!cursor_pos"(rx653_pos)
    rx653_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ws"()
    unless $P10, rx653_fail
    rx653_pos = $P10."pos"()
.annotate "line", 305
  # rx literal  "{"
    add $I11, rx653_pos, 1
    gt $I11, rx653_eos, rx653_fail
    sub $I11, rx653_pos, rx653_off
    substr $S10, rx653_tgt, $I11, 1
    ne $S10, "{", rx653_fail
    add rx653_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."LANG"("Regex", "nibbler")
    unless $P10, rx653_fail
    rx653_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx653_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx653_pos, 1
    gt $I11, rx653_eos, rx653_fail
    sub $I11, rx653_pos, rx653_off
    substr $S10, rx653_tgt, $I11, 1
    ne $S10, "}", rx653_fail
    add rx653_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ENDSTMT"()
    unless $P10, rx653_fail
  # rx subrule "ws" subtype=method negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ws"()
    unless $P10, rx653_fail
    rx653_pos = $P10."pos"()
  alt658_end:
.annotate "line", 306
  # rx subrule "ws" subtype=method negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."ws"()
    unless $P10, rx653_fail
    rx653_pos = $P10."pos"()
.annotate "line", 295
  # rx pass
    rx653_cur."!cursor_pass"(rx653_pos, "regex_declarator")
    rx653_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx653_pos)
    .return (rx653_cur)
  rx653_fail:
.annotate "line", 4
    (rx653_rep, rx653_pos, $I10, $P10) = rx653_cur."!mark_fail"(0)
    lt rx653_pos, -1, rx653_done
    eq rx653_pos, -1, rx653_fail
    jump $I10
  rx653_done:
    rx653_cur."!cursor_fail"()
    rx653_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx653_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("154_1258904213.70809") :method
.annotate "line", 4
    new $P655, "ResizablePMCArray"
    push $P655, ""
    .return ($P655)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("155_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx685_tgt
    .local int rx685_pos
    .local int rx685_off
    .local int rx685_eos
    .local int rx685_rep
    .local pmc rx685_cur
    (rx685_cur, rx685_pos, rx685_tgt, $I10) = self."!cursor_start"()
    rx685_cur."!cursor_debug"("START ", "dotty")
    rx685_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx685_cur
    .local pmc match
    .lex "$/", match
    length rx685_eos, rx685_tgt
    set rx685_off, 0
    lt $I10, 2, rx685_start
    sub rx685_off, $I10, 1
    substr rx685_tgt, rx685_tgt, rx685_off
  rx685_start:
    ge rx685_pos, 0, rxscan689_done
  rxscan689_loop:
    ($P10) = rx685_cur."from"()
    inc $P10
    set rx685_pos, $P10
    ge rx685_pos, rx685_eos, rxscan689_done
    set_addr $I10, rxscan689_loop
    rx685_cur."!mark_push"(0, rx685_pos, $I10)
  rxscan689_done:
.annotate "line", 310
  # rx literal  "."
    add $I11, rx685_pos, 1
    gt $I11, rx685_eos, rx685_fail
    sub $I11, rx685_pos, rx685_off
    substr $S10, rx685_tgt, $I11, 1
    ne $S10, ".", rx685_fail
    add rx685_pos, 1
  alt690_0:
.annotate "line", 311
    set_addr $I10, alt690_1
    rx685_cur."!mark_push"(0, rx685_pos, $I10)
  # rx subrule "identifier" subtype=capture negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."identifier"()
    unless $P10, rx685_fail
    rx685_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=identifier")
    rx685_pos = $P10."pos"()
    goto alt690_end
  alt690_1:
.annotate "line", 312
  # rx enumcharlist negate=0 zerowidth
    ge rx685_pos, rx685_eos, rx685_fail
    sub $I10, rx685_pos, rx685_off
    substr $S10, rx685_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx685_fail
  # rx subrule "quote" subtype=capture negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."quote"()
    unless $P10, rx685_fail
    rx685_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx685_pos = $P10."pos"()
  alt691_0:
.annotate "line", 313
    set_addr $I10, alt691_1
    rx685_cur."!mark_push"(0, rx685_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx685_pos, rx685_eos, rx685_fail
    sub $I10, rx685_pos, rx685_off
    substr $S10, rx685_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx685_fail
    goto alt691_end
  alt691_1:
  # rx subrule "panic" subtype=method negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx685_fail
    rx685_pos = $P10."pos"()
  alt691_end:
  alt690_end:
.annotate "line", 319
  # rx rxquantr692 ** 0..1
    set_addr $I694, rxquantr692_done
    rx685_cur."!mark_push"(0, rx685_pos, $I694)
  rxquantr692_loop:
  alt693_0:
.annotate "line", 316
    set_addr $I10, alt693_1
    rx685_cur."!mark_push"(0, rx685_pos, $I10)
.annotate "line", 317
  # rx enumcharlist negate=0 zerowidth
    ge rx685_pos, rx685_eos, rx685_fail
    sub $I10, rx685_pos, rx685_off
    substr $S10, rx685_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx685_fail
  # rx subrule "args" subtype=capture negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."args"()
    unless $P10, rx685_fail
    rx685_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx685_pos = $P10."pos"()
    goto alt693_end
  alt693_1:
.annotate "line", 318
  # rx literal  ":"
    add $I11, rx685_pos, 1
    gt $I11, rx685_eos, rx685_fail
    sub $I11, rx685_pos, rx685_off
    substr $S10, rx685_tgt, $I11, 1
    ne $S10, ":", rx685_fail
    add rx685_pos, 1
  # rx charclass s
    ge rx685_pos, rx685_eos, rx685_fail
    sub $I10, rx685_pos, rx685_off
    is_cclass $I11, 32, rx685_tgt, $I10
    unless $I11, rx685_fail
    inc rx685_pos
  # rx subrule "arglist" subtype=capture negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."arglist"()
    unless $P10, rx685_fail
    rx685_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx685_pos = $P10."pos"()
  alt693_end:
.annotate "line", 319
    (rx685_rep) = rx685_cur."!mark_commit"($I694)
  rxquantr692_done:
.annotate "line", 309
  # rx pass
    rx685_cur."!cursor_pass"(rx685_pos, "dotty")
    rx685_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx685_pos)
    .return (rx685_cur)
  rx685_fail:
.annotate "line", 4
    (rx685_rep, rx685_pos, $I10, $P10) = rx685_cur."!mark_fail"(0)
    lt rx685_pos, -1, rx685_done
    eq rx685_pos, -1, rx685_fail
    jump $I10
  rx685_done:
    rx685_cur."!cursor_fail"()
    rx685_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx685_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("156_1258904213.70809") :method
.annotate "line", 4
    $P687 = self."!PREFIX__!subrule"("longname=identifier", ".")
    new $P688, "ResizablePMCArray"
    push $P688, "'"
    push $P688, "\""
    push $P688, $P687
    .return ($P688)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("157_1258904213.70809") :method
.annotate "line", 323
    $P696 = self."!protoregex"("term")
    .return ($P696)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("158_1258904213.70809") :method
.annotate "line", 323
    $P698 = self."!PREFIX__!protoregex"("term")
    .return ($P698)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("159_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx700_tgt
    .local int rx700_pos
    .local int rx700_off
    .local int rx700_eos
    .local int rx700_rep
    .local pmc rx700_cur
    (rx700_cur, rx700_pos, rx700_tgt, $I10) = self."!cursor_start"()
    rx700_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx700_cur
    .local pmc match
    .lex "$/", match
    length rx700_eos, rx700_tgt
    set rx700_off, 0
    lt $I10, 2, rx700_start
    sub rx700_off, $I10, 1
    substr rx700_tgt, rx700_tgt, rx700_off
  rx700_start:
    ge rx700_pos, 0, rxscan703_done
  rxscan703_loop:
    ($P10) = rx700_cur."from"()
    inc $P10
    set rx700_pos, $P10
    ge rx700_pos, rx700_eos, rxscan703_done
    set_addr $I10, rxscan703_loop
    rx700_cur."!mark_push"(0, rx700_pos, $I10)
  rxscan703_done:
.annotate "line", 325
  # rx subcapture "sym"
    set_addr $I10, rxcap_704_fail
    rx700_cur."!mark_push"(0, rx700_pos, $I10)
  # rx literal  "self"
    add $I11, rx700_pos, 4
    gt $I11, rx700_eos, rx700_fail
    sub $I11, rx700_pos, rx700_off
    substr $S10, rx700_tgt, $I11, 4
    ne $S10, "self", rx700_fail
    add rx700_pos, 4
    set_addr $I10, rxcap_704_fail
    ($I12, $I11) = rx700_cur."!mark_peek"($I10)
    rx700_cur."!cursor_pos"($I11)
    ($P10) = rx700_cur."!cursor_start"()
    $P10."!cursor_pass"(rx700_pos, "")
    rx700_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_704_done
  rxcap_704_fail:
    goto rx700_fail
  rxcap_704_done:
  # rxanchor rwb
    le rx700_pos, 0, rx700_fail
    sub $I10, rx700_pos, rx700_off
    is_cclass $I11, 8192, rx700_tgt, $I10
    if $I11, rx700_fail
    dec $I10
    is_cclass $I11, 8192, rx700_tgt, $I10
    unless $I11, rx700_fail
  # rx pass
    rx700_cur."!cursor_pass"(rx700_pos, "term:sym<self>")
    rx700_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx700_pos)
    .return (rx700_cur)
  rx700_fail:
.annotate "line", 4
    (rx700_rep, rx700_pos, $I10, $P10) = rx700_cur."!mark_fail"(0)
    lt rx700_pos, -1, rx700_done
    eq rx700_pos, -1, rx700_fail
    jump $I10
  rx700_done:
    rx700_cur."!cursor_fail"()
    rx700_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx700_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("160_1258904213.70809") :method
.annotate "line", 4
    new $P702, "ResizablePMCArray"
    push $P702, "self"
    .return ($P702)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("161_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx706_tgt
    .local int rx706_pos
    .local int rx706_off
    .local int rx706_eos
    .local int rx706_rep
    .local pmc rx706_cur
    (rx706_cur, rx706_pos, rx706_tgt, $I10) = self."!cursor_start"()
    rx706_cur."!cursor_debug"("START ", "term:sym<identifier>")
    .lex unicode:"$\x{a2}", rx706_cur
    .local pmc match
    .lex "$/", match
    length rx706_eos, rx706_tgt
    set rx706_off, 0
    lt $I10, 2, rx706_start
    sub rx706_off, $I10, 1
    substr rx706_tgt, rx706_tgt, rx706_off
  rx706_start:
    ge rx706_pos, 0, rxscan710_done
  rxscan710_loop:
    ($P10) = rx706_cur."from"()
    inc $P10
    set rx706_pos, $P10
    ge rx706_pos, rx706_eos, rxscan710_done
    set_addr $I10, rxscan710_loop
    rx706_cur."!mark_push"(0, rx706_pos, $I10)
  rxscan710_done:
.annotate "line", 328
  # rx subrule "identifier" subtype=capture negate=
    rx706_cur."!cursor_pos"(rx706_pos)
    $P10 = rx706_cur."identifier"()
    unless $P10, rx706_fail
    rx706_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx706_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx706_pos, rx706_eos, rx706_fail
    sub $I10, rx706_pos, rx706_off
    substr $S10, rx706_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx706_fail
  # rx subrule "args" subtype=capture negate=
    rx706_cur."!cursor_pos"(rx706_pos)
    $P10 = rx706_cur."args"()
    unless $P10, rx706_fail
    rx706_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx706_pos = $P10."pos"()
.annotate "line", 327
  # rx pass
    rx706_cur."!cursor_pass"(rx706_pos, "term:sym<identifier>")
    rx706_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx706_pos)
    .return (rx706_cur)
  rx706_fail:
.annotate "line", 4
    (rx706_rep, rx706_pos, $I10, $P10) = rx706_cur."!mark_fail"(0)
    lt rx706_pos, -1, rx706_done
    eq rx706_pos, -1, rx706_fail
    jump $I10
  rx706_done:
    rx706_cur."!cursor_fail"()
    rx706_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx706_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("162_1258904213.70809") :method
.annotate "line", 4
    $P708 = self."!PREFIX__!subrule"("identifier", "")
    new $P709, "ResizablePMCArray"
    push $P709, $P708
    .return ($P709)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("163_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx712_tgt
    .local int rx712_pos
    .local int rx712_off
    .local int rx712_eos
    .local int rx712_rep
    .local pmc rx712_cur
    (rx712_cur, rx712_pos, rx712_tgt, $I10) = self."!cursor_start"()
    rx712_cur."!cursor_debug"("START ", "term:sym<name>")
    rx712_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx712_cur
    .local pmc match
    .lex "$/", match
    length rx712_eos, rx712_tgt
    set rx712_off, 0
    lt $I10, 2, rx712_start
    sub rx712_off, $I10, 1
    substr rx712_tgt, rx712_tgt, rx712_off
  rx712_start:
    ge rx712_pos, 0, rxscan716_done
  rxscan716_loop:
    ($P10) = rx712_cur."from"()
    inc $P10
    set rx712_pos, $P10
    ge rx712_pos, rx712_eos, rxscan716_done
    set_addr $I10, rxscan716_loop
    rx712_cur."!mark_push"(0, rx712_pos, $I10)
  rxscan716_done:
.annotate "line", 332
  # rx subrule "name" subtype=capture negate=
    rx712_cur."!cursor_pos"(rx712_pos)
    $P10 = rx712_cur."name"()
    unless $P10, rx712_fail
    rx712_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx712_pos = $P10."pos"()
  # rx rxquantr717 ** 0..1
    set_addr $I718, rxquantr717_done
    rx712_cur."!mark_push"(0, rx712_pos, $I718)
  rxquantr717_loop:
  # rx subrule "args" subtype=capture negate=
    rx712_cur."!cursor_pos"(rx712_pos)
    $P10 = rx712_cur."args"()
    unless $P10, rx712_fail
    rx712_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx712_pos = $P10."pos"()
    (rx712_rep) = rx712_cur."!mark_commit"($I718)
  rxquantr717_done:
.annotate "line", 331
  # rx pass
    rx712_cur."!cursor_pass"(rx712_pos, "term:sym<name>")
    rx712_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx712_pos)
    .return (rx712_cur)
  rx712_fail:
.annotate "line", 4
    (rx712_rep, rx712_pos, $I10, $P10) = rx712_cur."!mark_fail"(0)
    lt rx712_pos, -1, rx712_done
    eq rx712_pos, -1, rx712_fail
    jump $I10
  rx712_done:
    rx712_cur."!cursor_fail"()
    rx712_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx712_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("164_1258904213.70809") :method
.annotate "line", 4
    $P714 = self."!PREFIX__!subrule"("name", "")
    new $P715, "ResizablePMCArray"
    push $P715, $P714
    .return ($P715)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("165_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx720_tgt
    .local int rx720_pos
    .local int rx720_off
    .local int rx720_eos
    .local int rx720_rep
    .local pmc rx720_cur
    (rx720_cur, rx720_pos, rx720_tgt, $I10) = self."!cursor_start"()
    rx720_cur."!cursor_debug"("START ", "term:sym<pir::op>")
    rx720_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx720_cur
    .local pmc match
    .lex "$/", match
    length rx720_eos, rx720_tgt
    set rx720_off, 0
    lt $I10, 2, rx720_start
    sub rx720_off, $I10, 1
    substr rx720_tgt, rx720_tgt, rx720_off
  rx720_start:
    ge rx720_pos, 0, rxscan723_done
  rxscan723_loop:
    ($P10) = rx720_cur."from"()
    inc $P10
    set rx720_pos, $P10
    ge rx720_pos, rx720_eos, rxscan723_done
    set_addr $I10, rxscan723_loop
    rx720_cur."!mark_push"(0, rx720_pos, $I10)
  rxscan723_done:
.annotate "line", 336
  # rx literal  "pir::"
    add $I11, rx720_pos, 5
    gt $I11, rx720_eos, rx720_fail
    sub $I11, rx720_pos, rx720_off
    substr $S10, rx720_tgt, $I11, 5
    ne $S10, "pir::", rx720_fail
    add rx720_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_724_fail
    rx720_cur."!mark_push"(0, rx720_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx720_pos, rx720_off
    find_not_cclass $I11, 8192, rx720_tgt, $I10, rx720_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx720_fail
    add rx720_pos, rx720_off, $I11
    set_addr $I10, rxcap_724_fail
    ($I12, $I11) = rx720_cur."!mark_peek"($I10)
    rx720_cur."!cursor_pos"($I11)
    ($P10) = rx720_cur."!cursor_start"()
    $P10."!cursor_pass"(rx720_pos, "")
    rx720_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_724_done
  rxcap_724_fail:
    goto rx720_fail
  rxcap_724_done:
  # rx rxquantr725 ** 0..1
    set_addr $I726, rxquantr725_done
    rx720_cur."!mark_push"(0, rx720_pos, $I726)
  rxquantr725_loop:
  # rx subrule "args" subtype=capture negate=
    rx720_cur."!cursor_pos"(rx720_pos)
    $P10 = rx720_cur."args"()
    unless $P10, rx720_fail
    rx720_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx720_pos = $P10."pos"()
    (rx720_rep) = rx720_cur."!mark_commit"($I726)
  rxquantr725_done:
.annotate "line", 335
  # rx pass
    rx720_cur."!cursor_pass"(rx720_pos, "term:sym<pir::op>")
    rx720_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx720_pos)
    .return (rx720_cur)
  rx720_fail:
.annotate "line", 4
    (rx720_rep, rx720_pos, $I10, $P10) = rx720_cur."!mark_fail"(0)
    lt rx720_pos, -1, rx720_done
    eq rx720_pos, -1, rx720_fail
    jump $I10
  rx720_done:
    rx720_cur."!cursor_fail"()
    rx720_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx720_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("166_1258904213.70809") :method
.annotate "line", 4
    new $P722, "ResizablePMCArray"
    push $P722, "pir::"
    .return ($P722)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("167_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx728_tgt
    .local int rx728_pos
    .local int rx728_off
    .local int rx728_eos
    .local int rx728_rep
    .local pmc rx728_cur
    (rx728_cur, rx728_pos, rx728_tgt, $I10) = self."!cursor_start"()
    rx728_cur."!cursor_debug"("START ", "args")
    .lex unicode:"$\x{a2}", rx728_cur
    .local pmc match
    .lex "$/", match
    length rx728_eos, rx728_tgt
    set rx728_off, 0
    lt $I10, 2, rx728_start
    sub rx728_off, $I10, 1
    substr rx728_tgt, rx728_tgt, rx728_off
  rx728_start:
    ge rx728_pos, 0, rxscan732_done
  rxscan732_loop:
    ($P10) = rx728_cur."from"()
    inc $P10
    set rx728_pos, $P10
    ge rx728_pos, rx728_eos, rxscan732_done
    set_addr $I10, rxscan732_loop
    rx728_cur."!mark_push"(0, rx728_pos, $I10)
  rxscan732_done:
.annotate "line", 340
  # rx literal  "("
    add $I11, rx728_pos, 1
    gt $I11, rx728_eos, rx728_fail
    sub $I11, rx728_pos, rx728_off
    substr $S10, rx728_tgt, $I11, 1
    ne $S10, "(", rx728_fail
    add rx728_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx728_cur."!cursor_pos"(rx728_pos)
    $P10 = rx728_cur."arglist"()
    unless $P10, rx728_fail
    rx728_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx728_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx728_pos, 1
    gt $I11, rx728_eos, rx728_fail
    sub $I11, rx728_pos, rx728_off
    substr $S10, rx728_tgt, $I11, 1
    ne $S10, ")", rx728_fail
    add rx728_pos, 1
  # rx pass
    rx728_cur."!cursor_pass"(rx728_pos, "args")
    rx728_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx728_pos)
    .return (rx728_cur)
  rx728_fail:
.annotate "line", 4
    (rx728_rep, rx728_pos, $I10, $P10) = rx728_cur."!mark_fail"(0)
    lt rx728_pos, -1, rx728_done
    eq rx728_pos, -1, rx728_fail
    jump $I10
  rx728_done:
    rx728_cur."!cursor_fail"()
    rx728_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx728_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("168_1258904213.70809") :method
.annotate "line", 4
    $P730 = self."!PREFIX__!subrule"("arglist", "(")
    new $P731, "ResizablePMCArray"
    push $P731, $P730
    .return ($P731)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("169_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx734_tgt
    .local int rx734_pos
    .local int rx734_off
    .local int rx734_eos
    .local int rx734_rep
    .local pmc rx734_cur
    (rx734_cur, rx734_pos, rx734_tgt, $I10) = self."!cursor_start"()
    rx734_cur."!cursor_debug"("START ", "arglist")
    .lex unicode:"$\x{a2}", rx734_cur
    .local pmc match
    .lex "$/", match
    length rx734_eos, rx734_tgt
    set rx734_off, 0
    lt $I10, 2, rx734_start
    sub rx734_off, $I10, 1
    substr rx734_tgt, rx734_tgt, rx734_off
  rx734_start:
    ge rx734_pos, 0, rxscan738_done
  rxscan738_loop:
    ($P10) = rx734_cur."from"()
    inc $P10
    set rx734_pos, $P10
    ge rx734_pos, rx734_eos, rxscan738_done
    set_addr $I10, rxscan738_loop
    rx734_cur."!mark_push"(0, rx734_pos, $I10)
  rxscan738_done:
.annotate "line", 344
  # rx subrule "ws" subtype=method negate=
    rx734_cur."!cursor_pos"(rx734_pos)
    $P10 = rx734_cur."ws"()
    unless $P10, rx734_fail
    rx734_pos = $P10."pos"()
  alt739_0:
.annotate "line", 345
    set_addr $I10, alt739_1
    rx734_cur."!mark_push"(0, rx734_pos, $I10)
.annotate "line", 346
  # rx subrule "EXPR" subtype=capture negate=
    rx734_cur."!cursor_pos"(rx734_pos)
    $P10 = rx734_cur."EXPR"("f=")
    unless $P10, rx734_fail
    rx734_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx734_pos = $P10."pos"()
    goto alt739_end
  alt739_1:
  alt739_end:
.annotate "line", 343
  # rx pass
    rx734_cur."!cursor_pass"(rx734_pos, "arglist")
    rx734_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx734_pos)
    .return (rx734_cur)
  rx734_fail:
.annotate "line", 4
    (rx734_rep, rx734_pos, $I10, $P10) = rx734_cur."!mark_fail"(0)
    lt rx734_pos, -1, rx734_done
    eq rx734_pos, -1, rx734_fail
    jump $I10
  rx734_done:
    rx734_cur."!cursor_fail"()
    rx734_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx734_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("170_1258904213.70809") :method
.annotate "line", 4
    $P736 = self."!PREFIX__!subrule"("", "")
    new $P737, "ResizablePMCArray"
    push $P737, $P736
    .return ($P737)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("171_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx741_tgt
    .local int rx741_pos
    .local int rx741_off
    .local int rx741_eos
    .local int rx741_rep
    .local pmc rx741_cur
    (rx741_cur, rx741_pos, rx741_tgt, $I10) = self."!cursor_start"()
    rx741_cur."!cursor_debug"("START ", "term:sym<value>")
    .lex unicode:"$\x{a2}", rx741_cur
    .local pmc match
    .lex "$/", match
    length rx741_eos, rx741_tgt
    set rx741_off, 0
    lt $I10, 2, rx741_start
    sub rx741_off, $I10, 1
    substr rx741_tgt, rx741_tgt, rx741_off
  rx741_start:
    ge rx741_pos, 0, rxscan745_done
  rxscan745_loop:
    ($P10) = rx741_cur."from"()
    inc $P10
    set rx741_pos, $P10
    ge rx741_pos, rx741_eos, rxscan745_done
    set_addr $I10, rxscan745_loop
    rx741_cur."!mark_push"(0, rx741_pos, $I10)
  rxscan745_done:
.annotate "line", 352
  # rx subrule "value" subtype=capture negate=
    rx741_cur."!cursor_pos"(rx741_pos)
    $P10 = rx741_cur."value"()
    unless $P10, rx741_fail
    rx741_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx741_pos = $P10."pos"()
  # rx pass
    rx741_cur."!cursor_pass"(rx741_pos, "term:sym<value>")
    rx741_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx741_pos)
    .return (rx741_cur)
  rx741_fail:
.annotate "line", 4
    (rx741_rep, rx741_pos, $I10, $P10) = rx741_cur."!mark_fail"(0)
    lt rx741_pos, -1, rx741_done
    eq rx741_pos, -1, rx741_fail
    jump $I10
  rx741_done:
    rx741_cur."!cursor_fail"()
    rx741_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx741_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("172_1258904213.70809") :method
.annotate "line", 4
    $P743 = self."!PREFIX__!subrule"("value", "")
    new $P744, "ResizablePMCArray"
    push $P744, $P743
    .return ($P744)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("173_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx747_tgt
    .local int rx747_pos
    .local int rx747_off
    .local int rx747_eos
    .local int rx747_rep
    .local pmc rx747_cur
    (rx747_cur, rx747_pos, rx747_tgt, $I10) = self."!cursor_start"()
    rx747_cur."!cursor_debug"("START ", "value")
    .lex unicode:"$\x{a2}", rx747_cur
    .local pmc match
    .lex "$/", match
    length rx747_eos, rx747_tgt
    set rx747_off, 0
    lt $I10, 2, rx747_start
    sub rx747_off, $I10, 1
    substr rx747_tgt, rx747_tgt, rx747_off
  rx747_start:
    ge rx747_pos, 0, rxscan753_done
  rxscan753_loop:
    ($P10) = rx747_cur."from"()
    inc $P10
    set rx747_pos, $P10
    ge rx747_pos, rx747_eos, rxscan753_done
    set_addr $I10, rxscan753_loop
    rx747_cur."!mark_push"(0, rx747_pos, $I10)
  rxscan753_done:
  alt754_0:
.annotate "line", 354
    set_addr $I10, alt754_1
    rx747_cur."!mark_push"(0, rx747_pos, $I10)
.annotate "line", 355
  # rx subrule "dec_number" subtype=capture negate=
    rx747_cur."!cursor_pos"(rx747_pos)
    $P10 = rx747_cur."dec_number"()
    unless $P10, rx747_fail
    rx747_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx747_pos = $P10."pos"()
    goto alt754_end
  alt754_1:
    set_addr $I10, alt754_2
    rx747_cur."!mark_push"(0, rx747_pos, $I10)
.annotate "line", 356
  # rx subrule "quote" subtype=capture negate=
    rx747_cur."!cursor_pos"(rx747_pos)
    $P10 = rx747_cur."quote"()
    unless $P10, rx747_fail
    rx747_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx747_pos = $P10."pos"()
    goto alt754_end
  alt754_2:
.annotate "line", 357
  # rx subrule "integer" subtype=capture negate=
    rx747_cur."!cursor_pos"(rx747_pos)
    $P10 = rx747_cur."integer"()
    unless $P10, rx747_fail
    rx747_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx747_pos = $P10."pos"()
  alt754_end:
.annotate "line", 354
  # rx pass
    rx747_cur."!cursor_pass"(rx747_pos, "value")
    rx747_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx747_pos)
    .return (rx747_cur)
  rx747_fail:
.annotate "line", 4
    (rx747_rep, rx747_pos, $I10, $P10) = rx747_cur."!mark_fail"(0)
    lt rx747_pos, -1, rx747_done
    eq rx747_pos, -1, rx747_fail
    jump $I10
  rx747_done:
    rx747_cur."!cursor_fail"()
    rx747_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx747_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("174_1258904213.70809") :method
.annotate "line", 4
    $P749 = self."!PREFIX__!subrule"("integer", "")
    $P750 = self."!PREFIX__!subrule"("quote", "")
    $P751 = self."!PREFIX__!subrule"("dec_number", "")
    new $P752, "ResizablePMCArray"
    push $P752, $P749
    push $P752, $P750
    push $P752, $P751
    .return ($P752)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("175_1258904213.70809") :method
.annotate "line", 360
    $P756 = self."!protoregex"("quote")
    .return ($P756)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("176_1258904213.70809") :method
.annotate "line", 360
    $P758 = self."!PREFIX__!protoregex"("quote")
    .return ($P758)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("177_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx760_tgt
    .local int rx760_pos
    .local int rx760_off
    .local int rx760_eos
    .local int rx760_rep
    .local pmc rx760_cur
    (rx760_cur, rx760_pos, rx760_tgt, $I10) = self."!cursor_start"()
    rx760_cur."!cursor_debug"("START ", "quote:sym<apos>")
    .lex unicode:"$\x{a2}", rx760_cur
    .local pmc match
    .lex "$/", match
    length rx760_eos, rx760_tgt
    set rx760_off, 0
    lt $I10, 2, rx760_start
    sub rx760_off, $I10, 1
    substr rx760_tgt, rx760_tgt, rx760_off
  rx760_start:
    ge rx760_pos, 0, rxscan763_done
  rxscan763_loop:
    ($P10) = rx760_cur."from"()
    inc $P10
    set rx760_pos, $P10
    ge rx760_pos, rx760_eos, rxscan763_done
    set_addr $I10, rxscan763_loop
    rx760_cur."!mark_push"(0, rx760_pos, $I10)
  rxscan763_done:
.annotate "line", 361
  # rx enumcharlist negate=0 zerowidth
    ge rx760_pos, rx760_eos, rx760_fail
    sub $I10, rx760_pos, rx760_off
    substr $S10, rx760_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx760_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx760_cur."!cursor_pos"(rx760_pos)
    $P10 = rx760_cur."quote_EXPR"(":q")
    unless $P10, rx760_fail
    rx760_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx760_pos = $P10."pos"()
  # rx pass
    rx760_cur."!cursor_pass"(rx760_pos, "quote:sym<apos>")
    rx760_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx760_pos)
    .return (rx760_cur)
  rx760_fail:
.annotate "line", 4
    (rx760_rep, rx760_pos, $I10, $P10) = rx760_cur."!mark_fail"(0)
    lt rx760_pos, -1, rx760_done
    eq rx760_pos, -1, rx760_fail
    jump $I10
  rx760_done:
    rx760_cur."!cursor_fail"()
    rx760_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx760_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("178_1258904213.70809") :method
.annotate "line", 4
    new $P762, "ResizablePMCArray"
    push $P762, "'"
    .return ($P762)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("179_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx765_tgt
    .local int rx765_pos
    .local int rx765_off
    .local int rx765_eos
    .local int rx765_rep
    .local pmc rx765_cur
    (rx765_cur, rx765_pos, rx765_tgt, $I10) = self."!cursor_start"()
    rx765_cur."!cursor_debug"("START ", "quote:sym<dblq>")
    .lex unicode:"$\x{a2}", rx765_cur
    .local pmc match
    .lex "$/", match
    length rx765_eos, rx765_tgt
    set rx765_off, 0
    lt $I10, 2, rx765_start
    sub rx765_off, $I10, 1
    substr rx765_tgt, rx765_tgt, rx765_off
  rx765_start:
    ge rx765_pos, 0, rxscan768_done
  rxscan768_loop:
    ($P10) = rx765_cur."from"()
    inc $P10
    set rx765_pos, $P10
    ge rx765_pos, rx765_eos, rxscan768_done
    set_addr $I10, rxscan768_loop
    rx765_cur."!mark_push"(0, rx765_pos, $I10)
  rxscan768_done:
.annotate "line", 362
  # rx enumcharlist negate=0 zerowidth
    ge rx765_pos, rx765_eos, rx765_fail
    sub $I10, rx765_pos, rx765_off
    substr $S10, rx765_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx765_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx765_cur."!cursor_pos"(rx765_pos)
    $P10 = rx765_cur."quote_EXPR"(":qq")
    unless $P10, rx765_fail
    rx765_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx765_pos = $P10."pos"()
  # rx pass
    rx765_cur."!cursor_pass"(rx765_pos, "quote:sym<dblq>")
    rx765_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx765_pos)
    .return (rx765_cur)
  rx765_fail:
.annotate "line", 4
    (rx765_rep, rx765_pos, $I10, $P10) = rx765_cur."!mark_fail"(0)
    lt rx765_pos, -1, rx765_done
    eq rx765_pos, -1, rx765_fail
    jump $I10
  rx765_done:
    rx765_cur."!cursor_fail"()
    rx765_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx765_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("180_1258904213.70809") :method
.annotate "line", 4
    new $P767, "ResizablePMCArray"
    push $P767, "\""
    .return ($P767)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("181_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx770_tgt
    .local int rx770_pos
    .local int rx770_off
    .local int rx770_eos
    .local int rx770_rep
    .local pmc rx770_cur
    (rx770_cur, rx770_pos, rx770_tgt, $I10) = self."!cursor_start"()
    rx770_cur."!cursor_debug"("START ", "quote:sym<q>")
    .lex unicode:"$\x{a2}", rx770_cur
    .local pmc match
    .lex "$/", match
    length rx770_eos, rx770_tgt
    set rx770_off, 0
    lt $I10, 2, rx770_start
    sub rx770_off, $I10, 1
    substr rx770_tgt, rx770_tgt, rx770_off
  rx770_start:
    ge rx770_pos, 0, rxscan774_done
  rxscan774_loop:
    ($P10) = rx770_cur."from"()
    inc $P10
    set rx770_pos, $P10
    ge rx770_pos, rx770_eos, rxscan774_done
    set_addr $I10, rxscan774_loop
    rx770_cur."!mark_push"(0, rx770_pos, $I10)
  rxscan774_done:
.annotate "line", 363
  # rx literal  "q"
    add $I11, rx770_pos, 1
    gt $I11, rx770_eos, rx770_fail
    sub $I11, rx770_pos, rx770_off
    substr $S10, rx770_tgt, $I11, 1
    ne $S10, "q", rx770_fail
    add rx770_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx770_pos, rx770_eos, rx770_fail
    sub $I10, rx770_pos, rx770_off
    substr $S10, rx770_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx770_fail
  # rx subrule "ws" subtype=method negate=
    rx770_cur."!cursor_pos"(rx770_pos)
    $P10 = rx770_cur."ws"()
    unless $P10, rx770_fail
    rx770_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx770_cur."!cursor_pos"(rx770_pos)
    $P10 = rx770_cur."quote_EXPR"(":q")
    unless $P10, rx770_fail
    rx770_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx770_pos = $P10."pos"()
  # rx pass
    rx770_cur."!cursor_pass"(rx770_pos, "quote:sym<q>")
    rx770_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx770_pos)
    .return (rx770_cur)
  rx770_fail:
.annotate "line", 4
    (rx770_rep, rx770_pos, $I10, $P10) = rx770_cur."!mark_fail"(0)
    lt rx770_pos, -1, rx770_done
    eq rx770_pos, -1, rx770_fail
    jump $I10
  rx770_done:
    rx770_cur."!cursor_fail"()
    rx770_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx770_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("182_1258904213.70809") :method
.annotate "line", 4
    $P772 = self."!PREFIX__!subrule"("", "q")
    new $P773, "ResizablePMCArray"
    push $P773, $P772
    .return ($P773)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("183_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx776_tgt
    .local int rx776_pos
    .local int rx776_off
    .local int rx776_eos
    .local int rx776_rep
    .local pmc rx776_cur
    (rx776_cur, rx776_pos, rx776_tgt, $I10) = self."!cursor_start"()
    rx776_cur."!cursor_debug"("START ", "quote:sym<qq>")
    .lex unicode:"$\x{a2}", rx776_cur
    .local pmc match
    .lex "$/", match
    length rx776_eos, rx776_tgt
    set rx776_off, 0
    lt $I10, 2, rx776_start
    sub rx776_off, $I10, 1
    substr rx776_tgt, rx776_tgt, rx776_off
  rx776_start:
    ge rx776_pos, 0, rxscan780_done
  rxscan780_loop:
    ($P10) = rx776_cur."from"()
    inc $P10
    set rx776_pos, $P10
    ge rx776_pos, rx776_eos, rxscan780_done
    set_addr $I10, rxscan780_loop
    rx776_cur."!mark_push"(0, rx776_pos, $I10)
  rxscan780_done:
.annotate "line", 364
  # rx literal  "qq"
    add $I11, rx776_pos, 2
    gt $I11, rx776_eos, rx776_fail
    sub $I11, rx776_pos, rx776_off
    substr $S10, rx776_tgt, $I11, 2
    ne $S10, "qq", rx776_fail
    add rx776_pos, 2
  # rx enumcharlist negate=1 zerowidth
    ge rx776_pos, rx776_eos, rx776_fail
    sub $I10, rx776_pos, rx776_off
    substr $S10, rx776_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx776_fail
  # rx subrule "ws" subtype=method negate=
    rx776_cur."!cursor_pos"(rx776_pos)
    $P10 = rx776_cur."ws"()
    unless $P10, rx776_fail
    rx776_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx776_cur."!cursor_pos"(rx776_pos)
    $P10 = rx776_cur."quote_EXPR"(":qq")
    unless $P10, rx776_fail
    rx776_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx776_pos = $P10."pos"()
  # rx pass
    rx776_cur."!cursor_pass"(rx776_pos, "quote:sym<qq>")
    rx776_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx776_pos)
    .return (rx776_cur)
  rx776_fail:
.annotate "line", 4
    (rx776_rep, rx776_pos, $I10, $P10) = rx776_cur."!mark_fail"(0)
    lt rx776_pos, -1, rx776_done
    eq rx776_pos, -1, rx776_fail
    jump $I10
  rx776_done:
    rx776_cur."!cursor_fail"()
    rx776_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx776_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("184_1258904213.70809") :method
.annotate "line", 4
    $P778 = self."!PREFIX__!subrule"("", "qq")
    new $P779, "ResizablePMCArray"
    push $P779, $P778
    .return ($P779)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("185_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx782_tgt
    .local int rx782_pos
    .local int rx782_off
    .local int rx782_eos
    .local int rx782_rep
    .local pmc rx782_cur
    (rx782_cur, rx782_pos, rx782_tgt, $I10) = self."!cursor_start"()
    rx782_cur."!cursor_debug"("START ", "quote:sym<Q>")
    .lex unicode:"$\x{a2}", rx782_cur
    .local pmc match
    .lex "$/", match
    length rx782_eos, rx782_tgt
    set rx782_off, 0
    lt $I10, 2, rx782_start
    sub rx782_off, $I10, 1
    substr rx782_tgt, rx782_tgt, rx782_off
  rx782_start:
    ge rx782_pos, 0, rxscan786_done
  rxscan786_loop:
    ($P10) = rx782_cur."from"()
    inc $P10
    set rx782_pos, $P10
    ge rx782_pos, rx782_eos, rxscan786_done
    set_addr $I10, rxscan786_loop
    rx782_cur."!mark_push"(0, rx782_pos, $I10)
  rxscan786_done:
.annotate "line", 365
  # rx literal  "Q"
    add $I11, rx782_pos, 1
    gt $I11, rx782_eos, rx782_fail
    sub $I11, rx782_pos, rx782_off
    substr $S10, rx782_tgt, $I11, 1
    ne $S10, "Q", rx782_fail
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
    $P10 = rx782_cur."quote_EXPR"()
    unless $P10, rx782_fail
    rx782_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx782_pos = $P10."pos"()
  # rx pass
    rx782_cur."!cursor_pass"(rx782_pos, "quote:sym<Q>")
    rx782_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx782_pos)
    .return (rx782_cur)
  rx782_fail:
.annotate "line", 4
    (rx782_rep, rx782_pos, $I10, $P10) = rx782_cur."!mark_fail"(0)
    lt rx782_pos, -1, rx782_done
    eq rx782_pos, -1, rx782_fail
    jump $I10
  rx782_done:
    rx782_cur."!cursor_fail"()
    rx782_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx782_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("186_1258904213.70809") :method
.annotate "line", 4
    $P784 = self."!PREFIX__!subrule"("", "Q")
    new $P785, "ResizablePMCArray"
    push $P785, $P784
    .return ($P785)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("187_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx788_tgt
    .local int rx788_pos
    .local int rx788_off
    .local int rx788_eos
    .local int rx788_rep
    .local pmc rx788_cur
    (rx788_cur, rx788_pos, rx788_tgt, $I10) = self."!cursor_start"()
    rx788_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
    .lex unicode:"$\x{a2}", rx788_cur
    .local pmc match
    .lex "$/", match
    length rx788_eos, rx788_tgt
    set rx788_off, 0
    lt $I10, 2, rx788_start
    sub rx788_off, $I10, 1
    substr rx788_tgt, rx788_tgt, rx788_off
  rx788_start:
    ge rx788_pos, 0, rxscan792_done
  rxscan792_loop:
    ($P10) = rx788_cur."from"()
    inc $P10
    set rx788_pos, $P10
    ge rx788_pos, rx788_eos, rxscan792_done
    set_addr $I10, rxscan792_loop
    rx788_cur."!mark_push"(0, rx788_pos, $I10)
  rxscan792_done:
.annotate "line", 366
  # rx literal  "Q:PIR"
    add $I11, rx788_pos, 5
    gt $I11, rx788_eos, rx788_fail
    sub $I11, rx788_pos, rx788_off
    substr $S10, rx788_tgt, $I11, 5
    ne $S10, "Q:PIR", rx788_fail
    add rx788_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx788_cur."!cursor_pos"(rx788_pos)
    $P10 = rx788_cur."ws"()
    unless $P10, rx788_fail
    rx788_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx788_cur."!cursor_pos"(rx788_pos)
    $P10 = rx788_cur."quote_EXPR"()
    unless $P10, rx788_fail
    rx788_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx788_pos = $P10."pos"()
  # rx pass
    rx788_cur."!cursor_pass"(rx788_pos, "quote:sym<Q:PIR>")
    rx788_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx788_pos)
    .return (rx788_cur)
  rx788_fail:
.annotate "line", 4
    (rx788_rep, rx788_pos, $I10, $P10) = rx788_cur."!mark_fail"(0)
    lt rx788_pos, -1, rx788_done
    eq rx788_pos, -1, rx788_fail
    jump $I10
  rx788_done:
    rx788_cur."!cursor_fail"()
    rx788_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx788_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("188_1258904213.70809") :method
.annotate "line", 4
    $P790 = self."!PREFIX__!subrule"("", "Q:PIR")
    new $P791, "ResizablePMCArray"
    push $P791, $P790
    .return ($P791)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("189_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx794_tgt
    .local int rx794_pos
    .local int rx794_off
    .local int rx794_eos
    .local int rx794_rep
    .local pmc rx794_cur
    (rx794_cur, rx794_pos, rx794_tgt, $I10) = self."!cursor_start"()
    rx794_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
    .lex unicode:"$\x{a2}", rx794_cur
    .local pmc match
    .lex "$/", match
    length rx794_eos, rx794_tgt
    set rx794_off, 0
    lt $I10, 2, rx794_start
    sub rx794_off, $I10, 1
    substr rx794_tgt, rx794_tgt, rx794_off
  rx794_start:
    ge rx794_pos, 0, rxscan797_done
  rxscan797_loop:
    ($P10) = rx794_cur."from"()
    inc $P10
    set rx794_pos, $P10
    ge rx794_pos, rx794_eos, rxscan797_done
    set_addr $I10, rxscan797_loop
    rx794_cur."!mark_push"(0, rx794_pos, $I10)
  rxscan797_done:
.annotate "line", 368
  # rx enumcharlist negate=0 zerowidth
    ge rx794_pos, rx794_eos, rx794_fail
    sub $I10, rx794_pos, rx794_off
    substr $S10, rx794_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx794_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx794_cur."!cursor_pos"(rx794_pos)
    $P10 = rx794_cur."quotemod_check"("s")
    unless $P10, rx794_fail
  # rx subrule "variable" subtype=capture negate=
    rx794_cur."!cursor_pos"(rx794_pos)
    $P10 = rx794_cur."variable"()
    unless $P10, rx794_fail
    rx794_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx794_pos = $P10."pos"()
  # rx pass
    rx794_cur."!cursor_pass"(rx794_pos, "quote_escape:sym<$>")
    rx794_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx794_pos)
    .return (rx794_cur)
  rx794_fail:
.annotate "line", 4
    (rx794_rep, rx794_pos, $I10, $P10) = rx794_cur."!mark_fail"(0)
    lt rx794_pos, -1, rx794_done
    eq rx794_pos, -1, rx794_fail
    jump $I10
  rx794_done:
    rx794_cur."!cursor_fail"()
    rx794_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx794_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("190_1258904213.70809") :method
.annotate "line", 4
    new $P796, "ResizablePMCArray"
    push $P796, "$"
    .return ($P796)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("191_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx799_tgt
    .local int rx799_pos
    .local int rx799_off
    .local int rx799_eos
    .local int rx799_rep
    .local pmc rx799_cur
    (rx799_cur, rx799_pos, rx799_tgt, $I10) = self."!cursor_start"()
    rx799_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
    .lex unicode:"$\x{a2}", rx799_cur
    .local pmc match
    .lex "$/", match
    length rx799_eos, rx799_tgt
    set rx799_off, 0
    lt $I10, 2, rx799_start
    sub rx799_off, $I10, 1
    substr rx799_tgt, rx799_tgt, rx799_off
  rx799_start:
    ge rx799_pos, 0, rxscan802_done
  rxscan802_loop:
    ($P10) = rx799_cur."from"()
    inc $P10
    set rx799_pos, $P10
    ge rx799_pos, rx799_eos, rxscan802_done
    set_addr $I10, rxscan802_loop
    rx799_cur."!mark_push"(0, rx799_pos, $I10)
  rxscan802_done:
.annotate "line", 369
  # rx enumcharlist negate=0 zerowidth
    ge rx799_pos, rx799_eos, rx799_fail
    sub $I10, rx799_pos, rx799_off
    substr $S10, rx799_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx799_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx799_cur."!cursor_pos"(rx799_pos)
    $P10 = rx799_cur."quotemod_check"("c")
    unless $P10, rx799_fail
  # rx subrule "block" subtype=capture negate=
    rx799_cur."!cursor_pos"(rx799_pos)
    $P10 = rx799_cur."block"()
    unless $P10, rx799_fail
    rx799_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx799_pos = $P10."pos"()
  # rx pass
    rx799_cur."!cursor_pass"(rx799_pos, "quote_escape:sym<{ }>")
    rx799_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx799_pos)
    .return (rx799_cur)
  rx799_fail:
.annotate "line", 4
    (rx799_rep, rx799_pos, $I10, $P10) = rx799_cur."!mark_fail"(0)
    lt rx799_pos, -1, rx799_done
    eq rx799_pos, -1, rx799_fail
    jump $I10
  rx799_done:
    rx799_cur."!cursor_fail"()
    rx799_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx799_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("192_1258904213.70809") :method
.annotate "line", 4
    new $P801, "ResizablePMCArray"
    push $P801, "{"
    .return ($P801)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("193_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx804_tgt
    .local int rx804_pos
    .local int rx804_off
    .local int rx804_eos
    .local int rx804_rep
    .local pmc rx804_cur
    (rx804_cur, rx804_pos, rx804_tgt, $I10) = self."!cursor_start"()
    rx804_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx804_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx804_cur
    .local pmc match
    .lex "$/", match
    length rx804_eos, rx804_tgt
    set rx804_off, 0
    lt $I10, 2, rx804_start
    sub rx804_off, $I10, 1
    substr rx804_tgt, rx804_tgt, rx804_off
  rx804_start:
    ge rx804_pos, 0, rxscan808_done
  rxscan808_loop:
    ($P10) = rx804_cur."from"()
    inc $P10
    set rx804_pos, $P10
    ge rx804_pos, rx804_eos, rxscan808_done
    set_addr $I10, rxscan808_loop
    rx804_cur."!mark_push"(0, rx804_pos, $I10)
  rxscan808_done:
.annotate "line", 371
  # rx literal  "("
    add $I11, rx804_pos, 1
    gt $I11, rx804_eos, rx804_fail
    sub $I11, rx804_pos, rx804_off
    substr $S10, rx804_tgt, $I11, 1
    ne $S10, "(", rx804_fail
    add rx804_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx804_cur."!cursor_pos"(rx804_pos)
    $P10 = rx804_cur."ws"()
    unless $P10, rx804_fail
    rx804_pos = $P10."pos"()
  # rx rxquantr809 ** 0..1
    set_addr $I810, rxquantr809_done
    rx804_cur."!mark_push"(0, rx804_pos, $I810)
  rxquantr809_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx804_cur."!cursor_pos"(rx804_pos)
    $P10 = rx804_cur."EXPR"()
    unless $P10, rx804_fail
    rx804_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx804_pos = $P10."pos"()
    (rx804_rep) = rx804_cur."!mark_commit"($I810)
  rxquantr809_done:
  # rx literal  ")"
    add $I11, rx804_pos, 1
    gt $I11, rx804_eos, rx804_fail
    sub $I11, rx804_pos, rx804_off
    substr $S10, rx804_tgt, $I11, 1
    ne $S10, ")", rx804_fail
    add rx804_pos, 1
  # rx pass
    rx804_cur."!cursor_pass"(rx804_pos, "circumfix:sym<( )>")
    rx804_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx804_pos)
    .return (rx804_cur)
  rx804_fail:
.annotate "line", 4
    (rx804_rep, rx804_pos, $I10, $P10) = rx804_cur."!mark_fail"(0)
    lt rx804_pos, -1, rx804_done
    eq rx804_pos, -1, rx804_fail
    jump $I10
  rx804_done:
    rx804_cur."!cursor_fail"()
    rx804_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx804_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("194_1258904213.70809") :method
.annotate "line", 4
    $P806 = self."!PREFIX__!subrule"("", "(")
    new $P807, "ResizablePMCArray"
    push $P807, $P806
    .return ($P807)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("195_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx812_tgt
    .local int rx812_pos
    .local int rx812_off
    .local int rx812_eos
    .local int rx812_rep
    .local pmc rx812_cur
    (rx812_cur, rx812_pos, rx812_tgt, $I10) = self."!cursor_start"()
    rx812_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
    rx812_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx812_cur
    .local pmc match
    .lex "$/", match
    length rx812_eos, rx812_tgt
    set rx812_off, 0
    lt $I10, 2, rx812_start
    sub rx812_off, $I10, 1
    substr rx812_tgt, rx812_tgt, rx812_off
  rx812_start:
    ge rx812_pos, 0, rxscan816_done
  rxscan816_loop:
    ($P10) = rx812_cur."from"()
    inc $P10
    set rx812_pos, $P10
    ge rx812_pos, rx812_eos, rxscan816_done
    set_addr $I10, rxscan816_loop
    rx812_cur."!mark_push"(0, rx812_pos, $I10)
  rxscan816_done:
.annotate "line", 372
  # rx literal  "["
    add $I11, rx812_pos, 1
    gt $I11, rx812_eos, rx812_fail
    sub $I11, rx812_pos, rx812_off
    substr $S10, rx812_tgt, $I11, 1
    ne $S10, "[", rx812_fail
    add rx812_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx812_cur."!cursor_pos"(rx812_pos)
    $P10 = rx812_cur."ws"()
    unless $P10, rx812_fail
    rx812_pos = $P10."pos"()
  # rx rxquantr817 ** 0..1
    set_addr $I818, rxquantr817_done
    rx812_cur."!mark_push"(0, rx812_pos, $I818)
  rxquantr817_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx812_cur."!cursor_pos"(rx812_pos)
    $P10 = rx812_cur."EXPR"()
    unless $P10, rx812_fail
    rx812_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx812_pos = $P10."pos"()
    (rx812_rep) = rx812_cur."!mark_commit"($I818)
  rxquantr817_done:
  # rx literal  "]"
    add $I11, rx812_pos, 1
    gt $I11, rx812_eos, rx812_fail
    sub $I11, rx812_pos, rx812_off
    substr $S10, rx812_tgt, $I11, 1
    ne $S10, "]", rx812_fail
    add rx812_pos, 1
  # rx pass
    rx812_cur."!cursor_pass"(rx812_pos, "circumfix:sym<[ ]>")
    rx812_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx812_pos)
    .return (rx812_cur)
  rx812_fail:
.annotate "line", 4
    (rx812_rep, rx812_pos, $I10, $P10) = rx812_cur."!mark_fail"(0)
    lt rx812_pos, -1, rx812_done
    eq rx812_pos, -1, rx812_fail
    jump $I10
  rx812_done:
    rx812_cur."!cursor_fail"()
    rx812_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx812_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("196_1258904213.70809") :method
.annotate "line", 4
    $P814 = self."!PREFIX__!subrule"("", "[")
    new $P815, "ResizablePMCArray"
    push $P815, $P814
    .return ($P815)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("197_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx820_tgt
    .local int rx820_pos
    .local int rx820_off
    .local int rx820_eos
    .local int rx820_rep
    .local pmc rx820_cur
    (rx820_cur, rx820_pos, rx820_tgt, $I10) = self."!cursor_start"()
    rx820_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx820_cur
    .local pmc match
    .lex "$/", match
    length rx820_eos, rx820_tgt
    set rx820_off, 0
    lt $I10, 2, rx820_start
    sub rx820_off, $I10, 1
    substr rx820_tgt, rx820_tgt, rx820_off
  rx820_start:
    ge rx820_pos, 0, rxscan823_done
  rxscan823_loop:
    ($P10) = rx820_cur."from"()
    inc $P10
    set rx820_pos, $P10
    ge rx820_pos, rx820_eos, rxscan823_done
    set_addr $I10, rxscan823_loop
    rx820_cur."!mark_push"(0, rx820_pos, $I10)
  rxscan823_done:
.annotate "line", 373
  # rx enumcharlist negate=0 zerowidth
    ge rx820_pos, rx820_eos, rx820_fail
    sub $I10, rx820_pos, rx820_off
    substr $S10, rx820_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx820_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx820_cur."!cursor_pos"(rx820_pos)
    $P10 = rx820_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx820_fail
    rx820_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx820_pos = $P10."pos"()
  # rx pass
    rx820_cur."!cursor_pass"(rx820_pos, "circumfix:sym<ang>")
    rx820_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx820_pos)
    .return (rx820_cur)
  rx820_fail:
.annotate "line", 4
    (rx820_rep, rx820_pos, $I10, $P10) = rx820_cur."!mark_fail"(0)
    lt rx820_pos, -1, rx820_done
    eq rx820_pos, -1, rx820_fail
    jump $I10
  rx820_done:
    rx820_cur."!cursor_fail"()
    rx820_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx820_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("198_1258904213.70809") :method
.annotate "line", 4
    new $P822, "ResizablePMCArray"
    push $P822, "<"
    .return ($P822)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("199_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx825_tgt
    .local int rx825_pos
    .local int rx825_off
    .local int rx825_eos
    .local int rx825_rep
    .local pmc rx825_cur
    (rx825_cur, rx825_pos, rx825_tgt, $I10) = self."!cursor_start"()
    rx825_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx825_cur
    .local pmc match
    .lex "$/", match
    length rx825_eos, rx825_tgt
    set rx825_off, 0
    lt $I10, 2, rx825_start
    sub rx825_off, $I10, 1
    substr rx825_tgt, rx825_tgt, rx825_off
  rx825_start:
    ge rx825_pos, 0, rxscan828_done
  rxscan828_loop:
    ($P10) = rx825_cur."from"()
    inc $P10
    set rx825_pos, $P10
    ge rx825_pos, rx825_eos, rxscan828_done
    set_addr $I10, rxscan828_loop
    rx825_cur."!mark_push"(0, rx825_pos, $I10)
  rxscan828_done:
.annotate "line", 374
  # rx enumcharlist negate=0 zerowidth
    ge rx825_pos, rx825_eos, rx825_fail
    sub $I10, rx825_pos, rx825_off
    substr $S10, rx825_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx825_fail
  # rx subrule "pblock" subtype=capture negate=
    rx825_cur."!cursor_pos"(rx825_pos)
    $P10 = rx825_cur."pblock"()
    unless $P10, rx825_fail
    rx825_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx825_pos = $P10."pos"()
  # rx pass
    rx825_cur."!cursor_pass"(rx825_pos, "circumfix:sym<{ }>")
    rx825_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx825_pos)
    .return (rx825_cur)
  rx825_fail:
.annotate "line", 4
    (rx825_rep, rx825_pos, $I10, $P10) = rx825_cur."!mark_fail"(0)
    lt rx825_pos, -1, rx825_done
    eq rx825_pos, -1, rx825_fail
    jump $I10
  rx825_done:
    rx825_cur."!cursor_fail"()
    rx825_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx825_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("200_1258904213.70809") :method
.annotate "line", 4
    new $P827, "ResizablePMCArray"
    push $P827, "{"
    .return ($P827)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("201_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx830_tgt
    .local int rx830_pos
    .local int rx830_off
    .local int rx830_eos
    .local int rx830_rep
    .local pmc rx830_cur
    (rx830_cur, rx830_pos, rx830_tgt, $I10) = self."!cursor_start"()
    rx830_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
    .lex unicode:"$\x{a2}", rx830_cur
    .local pmc match
    .lex "$/", match
    length rx830_eos, rx830_tgt
    set rx830_off, 0
    lt $I10, 2, rx830_start
    sub rx830_off, $I10, 1
    substr rx830_tgt, rx830_tgt, rx830_off
  rx830_start:
    ge rx830_pos, 0, rxscan834_done
  rxscan834_loop:
    ($P10) = rx830_cur."from"()
    inc $P10
    set rx830_pos, $P10
    ge rx830_pos, rx830_eos, rxscan834_done
    set_addr $I10, rxscan834_loop
    rx830_cur."!mark_push"(0, rx830_pos, $I10)
  rxscan834_done:
.annotate "line", 375
  # rx subrule "sigil" subtype=capture negate=
    rx830_cur."!cursor_pos"(rx830_pos)
    $P10 = rx830_cur."sigil"()
    unless $P10, rx830_fail
    rx830_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx830_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx830_pos, 1
    gt $I11, rx830_eos, rx830_fail
    sub $I11, rx830_pos, rx830_off
    substr $S10, rx830_tgt, $I11, 1
    ne $S10, "(", rx830_fail
    add rx830_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx830_cur."!cursor_pos"(rx830_pos)
    $P10 = rx830_cur."semilist"()
    unless $P10, rx830_fail
    rx830_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx830_pos = $P10."pos"()
  alt835_0:
    set_addr $I10, alt835_1
    rx830_cur."!mark_push"(0, rx830_pos, $I10)
  # rx literal  ")"
    add $I11, rx830_pos, 1
    gt $I11, rx830_eos, rx830_fail
    sub $I11, rx830_pos, rx830_off
    substr $S10, rx830_tgt, $I11, 1
    ne $S10, ")", rx830_fail
    add rx830_pos, 1
    goto alt835_end
  alt835_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx830_cur."!cursor_pos"(rx830_pos)
    $P10 = rx830_cur."FAILGOAL"("')'")
    unless $P10, rx830_fail
    rx830_pos = $P10."pos"()
  alt835_end:
  # rx pass
    rx830_cur."!cursor_pass"(rx830_pos, "circumfix:sym<sigil>")
    rx830_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx830_pos)
    .return (rx830_cur)
  rx830_fail:
.annotate "line", 4
    (rx830_rep, rx830_pos, $I10, $P10) = rx830_cur."!mark_fail"(0)
    lt rx830_pos, -1, rx830_done
    eq rx830_pos, -1, rx830_fail
    jump $I10
  rx830_done:
    rx830_cur."!cursor_fail"()
    rx830_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx830_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("202_1258904213.70809") :method
.annotate "line", 4
    $P832 = self."!PREFIX__!subrule"("sigil", "")
    new $P833, "ResizablePMCArray"
    push $P833, $P832
    .return ($P833)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("203_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 4
    .local string rx838_tgt
    .local int rx838_pos
    .local int rx838_off
    .local int rx838_eos
    .local int rx838_rep
    .local pmc rx838_cur
    (rx838_cur, rx838_pos, rx838_tgt, $I10) = self."!cursor_start"()
    rx838_cur."!cursor_debug"("START ", "semilist")
    .lex unicode:"$\x{a2}", rx838_cur
    .local pmc match
    .lex "$/", match
    length rx838_eos, rx838_tgt
    set rx838_off, 0
    lt $I10, 2, rx838_start
    sub rx838_off, $I10, 1
    substr rx838_tgt, rx838_tgt, rx838_off
  rx838_start:
    ge rx838_pos, 0, rxscan841_done
  rxscan841_loop:
    ($P10) = rx838_cur."from"()
    inc $P10
    set rx838_pos, $P10
    ge rx838_pos, rx838_eos, rxscan841_done
    set_addr $I10, rxscan841_loop
    rx838_cur."!mark_push"(0, rx838_pos, $I10)
  rxscan841_done:
.annotate "line", 377
  # rx subrule "ws" subtype=method negate=
    rx838_cur."!cursor_pos"(rx838_pos)
    $P10 = rx838_cur."ws"()
    unless $P10, rx838_fail
    rx838_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx838_cur."!cursor_pos"(rx838_pos)
    $P10 = rx838_cur."statement"()
    unless $P10, rx838_fail
    rx838_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx838_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx838_cur."!cursor_pos"(rx838_pos)
    $P10 = rx838_cur."ws"()
    unless $P10, rx838_fail
    rx838_pos = $P10."pos"()
  # rx pass
    rx838_cur."!cursor_pass"(rx838_pos, "semilist")
    rx838_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx838_pos)
    .return (rx838_cur)
  rx838_fail:
.annotate "line", 4
    (rx838_rep, rx838_pos, $I10, $P10) = rx838_cur."!mark_fail"(0)
    lt rx838_pos, -1, rx838_done
    eq rx838_pos, -1, rx838_fail
    jump $I10
  rx838_done:
    rx838_cur."!cursor_fail"()
    rx838_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx838_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("204_1258904213.70809") :method
.annotate "line", 4
    new $P840, "ResizablePMCArray"
    push $P840, ""
    .return ($P840)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("205_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx845_tgt
    .local int rx845_pos
    .local int rx845_off
    .local int rx845_eos
    .local int rx845_rep
    .local pmc rx845_cur
    (rx845_cur, rx845_pos, rx845_tgt, $I10) = self."!cursor_start"()
    rx845_cur."!cursor_debug"("START ", "infixish")
    .lex unicode:"$\x{a2}", rx845_cur
    .local pmc match
    .lex "$/", match
    length rx845_eos, rx845_tgt
    set rx845_off, 0
    lt $I10, 2, rx845_start
    sub rx845_off, $I10, 1
    substr rx845_tgt, rx845_tgt, rx845_off
  rx845_start:
    ge rx845_pos, 0, rxscan848_done
  rxscan848_loop:
    ($P10) = rx845_cur."from"()
    inc $P10
    set rx845_pos, $P10
    ge rx845_pos, rx845_eos, rxscan848_done
    set_addr $I10, rxscan848_loop
    rx845_cur."!mark_push"(0, rx845_pos, $I10)
  rxscan848_done:
.annotate "line", 400
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx845_cur."!cursor_pos"(rx845_pos)
    $P10 = rx845_cur."infixstopper"()
    if $P10, rx845_fail
  # rx subrule "infix" subtype=capture negate=
    rx845_cur."!cursor_pos"(rx845_pos)
    $P10 = rx845_cur."infix"()
    unless $P10, rx845_fail
    rx845_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx845_pos = $P10."pos"()
  # rx pass
    rx845_cur."!cursor_pass"(rx845_pos, "infixish")
    rx845_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx845_pos)
    .return (rx845_cur)
  rx845_fail:
.annotate "line", 381
    (rx845_rep, rx845_pos, $I10, $P10) = rx845_cur."!mark_fail"(0)
    lt rx845_pos, -1, rx845_done
    eq rx845_pos, -1, rx845_fail
    jump $I10
  rx845_done:
    rx845_cur."!cursor_fail"()
    rx845_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx845_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("206_1258904213.70809") :method
.annotate "line", 381
    new $P847, "ResizablePMCArray"
    push $P847, ""
    .return ($P847)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("207_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx850_tgt
    .local int rx850_pos
    .local int rx850_off
    .local int rx850_eos
    .local int rx850_rep
    .local pmc rx850_cur
    (rx850_cur, rx850_pos, rx850_tgt, $I10) = self."!cursor_start"()
    rx850_cur."!cursor_debug"("START ", "infixstopper")
    .lex unicode:"$\x{a2}", rx850_cur
    .local pmc match
    .lex "$/", match
    length rx850_eos, rx850_tgt
    set rx850_off, 0
    lt $I10, 2, rx850_start
    sub rx850_off, $I10, 1
    substr rx850_tgt, rx850_tgt, rx850_off
  rx850_start:
    ge rx850_pos, 0, rxscan853_done
  rxscan853_loop:
    ($P10) = rx850_cur."from"()
    inc $P10
    set rx850_pos, $P10
    ge rx850_pos, rx850_eos, rxscan853_done
    set_addr $I10, rxscan853_loop
    rx850_cur."!mark_push"(0, rx850_pos, $I10)
  rxscan853_done:
.annotate "line", 401
  # rx subrule "lambda" subtype=zerowidth negate=
    rx850_cur."!cursor_pos"(rx850_pos)
    $P10 = rx850_cur."lambda"()
    unless $P10, rx850_fail
  # rx pass
    rx850_cur."!cursor_pass"(rx850_pos, "infixstopper")
    rx850_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx850_pos)
    .return (rx850_cur)
  rx850_fail:
.annotate "line", 381
    (rx850_rep, rx850_pos, $I10, $P10) = rx850_cur."!mark_fail"(0)
    lt rx850_pos, -1, rx850_done
    eq rx850_pos, -1, rx850_fail
    jump $I10
  rx850_done:
    rx850_cur."!cursor_fail"()
    rx850_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx850_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("208_1258904213.70809") :method
.annotate "line", 381
    new $P852, "ResizablePMCArray"
    push $P852, ""
    .return ($P852)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("209_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx855_tgt
    .local int rx855_pos
    .local int rx855_off
    .local int rx855_eos
    .local int rx855_rep
    .local pmc rx855_cur
    (rx855_cur, rx855_pos, rx855_tgt, $I10) = self."!cursor_start"()
    rx855_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
    .lex unicode:"$\x{a2}", rx855_cur
    .local pmc match
    .lex "$/", match
    length rx855_eos, rx855_tgt
    set rx855_off, 0
    lt $I10, 2, rx855_start
    sub rx855_off, $I10, 1
    substr rx855_tgt, rx855_tgt, rx855_off
  rx855_start:
    ge rx855_pos, 0, rxscan859_done
  rxscan859_loop:
    ($P10) = rx855_cur."from"()
    inc $P10
    set rx855_pos, $P10
    ge rx855_pos, rx855_eos, rxscan859_done
    set_addr $I10, rxscan859_loop
    rx855_cur."!mark_push"(0, rx855_pos, $I10)
  rxscan859_done:
.annotate "line", 404
  # rx literal  "["
    add $I11, rx855_pos, 1
    gt $I11, rx855_eos, rx855_fail
    sub $I11, rx855_pos, rx855_off
    substr $S10, rx855_tgt, $I11, 1
    ne $S10, "[", rx855_fail
    add rx855_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx855_cur."!cursor_pos"(rx855_pos)
    $P10 = rx855_cur."ws"()
    unless $P10, rx855_fail
    rx855_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx855_cur."!cursor_pos"(rx855_pos)
    $P10 = rx855_cur."EXPR"()
    unless $P10, rx855_fail
    rx855_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx855_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx855_pos, 1
    gt $I11, rx855_eos, rx855_fail
    sub $I11, rx855_pos, rx855_off
    substr $S10, rx855_tgt, $I11, 1
    ne $S10, "]", rx855_fail
    add rx855_pos, 1
.annotate "line", 405
  # rx subrule "O" subtype=capture negate=
    rx855_cur."!cursor_pos"(rx855_pos)
    $P10 = rx855_cur."O"("%methodop")
    unless $P10, rx855_fail
    rx855_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx855_pos = $P10."pos"()
.annotate "line", 403
  # rx pass
    rx855_cur."!cursor_pass"(rx855_pos, "postcircumfix:sym<[ ]>")
    rx855_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx855_pos)
    .return (rx855_cur)
  rx855_fail:
.annotate "line", 381
    (rx855_rep, rx855_pos, $I10, $P10) = rx855_cur."!mark_fail"(0)
    lt rx855_pos, -1, rx855_done
    eq rx855_pos, -1, rx855_fail
    jump $I10
  rx855_done:
    rx855_cur."!cursor_fail"()
    rx855_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx855_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("210_1258904213.70809") :method
.annotate "line", 381
    $P857 = self."!PREFIX__!subrule"("", "[")
    new $P858, "ResizablePMCArray"
    push $P858, $P857
    .return ($P858)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("211_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx861_tgt
    .local int rx861_pos
    .local int rx861_off
    .local int rx861_eos
    .local int rx861_rep
    .local pmc rx861_cur
    (rx861_cur, rx861_pos, rx861_tgt, $I10) = self."!cursor_start"()
    rx861_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx861_cur
    .local pmc match
    .lex "$/", match
    length rx861_eos, rx861_tgt
    set rx861_off, 0
    lt $I10, 2, rx861_start
    sub rx861_off, $I10, 1
    substr rx861_tgt, rx861_tgt, rx861_off
  rx861_start:
    ge rx861_pos, 0, rxscan865_done
  rxscan865_loop:
    ($P10) = rx861_cur."from"()
    inc $P10
    set rx861_pos, $P10
    ge rx861_pos, rx861_eos, rxscan865_done
    set_addr $I10, rxscan865_loop
    rx861_cur."!mark_push"(0, rx861_pos, $I10)
  rxscan865_done:
.annotate "line", 409
  # rx literal  "{"
    add $I11, rx861_pos, 1
    gt $I11, rx861_eos, rx861_fail
    sub $I11, rx861_pos, rx861_off
    substr $S10, rx861_tgt, $I11, 1
    ne $S10, "{", rx861_fail
    add rx861_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx861_cur."!cursor_pos"(rx861_pos)
    $P10 = rx861_cur."ws"()
    unless $P10, rx861_fail
    rx861_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx861_cur."!cursor_pos"(rx861_pos)
    $P10 = rx861_cur."EXPR"()
    unless $P10, rx861_fail
    rx861_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx861_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx861_pos, 1
    gt $I11, rx861_eos, rx861_fail
    sub $I11, rx861_pos, rx861_off
    substr $S10, rx861_tgt, $I11, 1
    ne $S10, "}", rx861_fail
    add rx861_pos, 1
.annotate "line", 410
  # rx subrule "O" subtype=capture negate=
    rx861_cur."!cursor_pos"(rx861_pos)
    $P10 = rx861_cur."O"("%methodop")
    unless $P10, rx861_fail
    rx861_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx861_pos = $P10."pos"()
.annotate "line", 408
  # rx pass
    rx861_cur."!cursor_pass"(rx861_pos, "postcircumfix:sym<{ }>")
    rx861_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx861_pos)
    .return (rx861_cur)
  rx861_fail:
.annotate "line", 381
    (rx861_rep, rx861_pos, $I10, $P10) = rx861_cur."!mark_fail"(0)
    lt rx861_pos, -1, rx861_done
    eq rx861_pos, -1, rx861_fail
    jump $I10
  rx861_done:
    rx861_cur."!cursor_fail"()
    rx861_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx861_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("212_1258904213.70809") :method
.annotate "line", 381
    $P863 = self."!PREFIX__!subrule"("", "{")
    new $P864, "ResizablePMCArray"
    push $P864, $P863
    .return ($P864)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("213_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx867_tgt
    .local int rx867_pos
    .local int rx867_off
    .local int rx867_eos
    .local int rx867_rep
    .local pmc rx867_cur
    (rx867_cur, rx867_pos, rx867_tgt, $I10) = self."!cursor_start"()
    rx867_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx867_cur
    .local pmc match
    .lex "$/", match
    length rx867_eos, rx867_tgt
    set rx867_off, 0
    lt $I10, 2, rx867_start
    sub rx867_off, $I10, 1
    substr rx867_tgt, rx867_tgt, rx867_off
  rx867_start:
    ge rx867_pos, 0, rxscan870_done
  rxscan870_loop:
    ($P10) = rx867_cur."from"()
    inc $P10
    set rx867_pos, $P10
    ge rx867_pos, rx867_eos, rxscan870_done
    set_addr $I10, rxscan870_loop
    rx867_cur."!mark_push"(0, rx867_pos, $I10)
  rxscan870_done:
.annotate "line", 414
  # rx enumcharlist negate=0 zerowidth
    ge rx867_pos, rx867_eos, rx867_fail
    sub $I10, rx867_pos, rx867_off
    substr $S10, rx867_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx867_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx867_cur."!cursor_pos"(rx867_pos)
    $P10 = rx867_cur."quote_EXPR"(":q")
    unless $P10, rx867_fail
    rx867_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx867_pos = $P10."pos"()
.annotate "line", 415
  # rx subrule "O" subtype=capture negate=
    rx867_cur."!cursor_pos"(rx867_pos)
    $P10 = rx867_cur."O"("%methodop")
    unless $P10, rx867_fail
    rx867_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx867_pos = $P10."pos"()
.annotate "line", 413
  # rx pass
    rx867_cur."!cursor_pass"(rx867_pos, "postcircumfix:sym<ang>")
    rx867_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx867_pos)
    .return (rx867_cur)
  rx867_fail:
.annotate "line", 381
    (rx867_rep, rx867_pos, $I10, $P10) = rx867_cur."!mark_fail"(0)
    lt rx867_pos, -1, rx867_done
    eq rx867_pos, -1, rx867_fail
    jump $I10
  rx867_done:
    rx867_cur."!cursor_fail"()
    rx867_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx867_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("214_1258904213.70809") :method
.annotate "line", 381
    new $P869, "ResizablePMCArray"
    push $P869, "<"
    .return ($P869)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("215_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx872_tgt
    .local int rx872_pos
    .local int rx872_off
    .local int rx872_eos
    .local int rx872_rep
    .local pmc rx872_cur
    (rx872_cur, rx872_pos, rx872_tgt, $I10) = self."!cursor_start"()
    rx872_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
    .lex unicode:"$\x{a2}", rx872_cur
    .local pmc match
    .lex "$/", match
    length rx872_eos, rx872_tgt
    set rx872_off, 0
    lt $I10, 2, rx872_start
    sub rx872_off, $I10, 1
    substr rx872_tgt, rx872_tgt, rx872_off
  rx872_start:
    ge rx872_pos, 0, rxscan876_done
  rxscan876_loop:
    ($P10) = rx872_cur."from"()
    inc $P10
    set rx872_pos, $P10
    ge rx872_pos, rx872_eos, rxscan876_done
    set_addr $I10, rxscan876_loop
    rx872_cur."!mark_push"(0, rx872_pos, $I10)
  rxscan876_done:
.annotate "line", 419
  # rx literal  "("
    add $I11, rx872_pos, 1
    gt $I11, rx872_eos, rx872_fail
    sub $I11, rx872_pos, rx872_off
    substr $S10, rx872_tgt, $I11, 1
    ne $S10, "(", rx872_fail
    add rx872_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx872_cur."!cursor_pos"(rx872_pos)
    $P10 = rx872_cur."ws"()
    unless $P10, rx872_fail
    rx872_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx872_cur."!cursor_pos"(rx872_pos)
    $P10 = rx872_cur."arglist"()
    unless $P10, rx872_fail
    rx872_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx872_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx872_pos, 1
    gt $I11, rx872_eos, rx872_fail
    sub $I11, rx872_pos, rx872_off
    substr $S10, rx872_tgt, $I11, 1
    ne $S10, ")", rx872_fail
    add rx872_pos, 1
.annotate "line", 420
  # rx subrule "O" subtype=capture negate=
    rx872_cur."!cursor_pos"(rx872_pos)
    $P10 = rx872_cur."O"("%methodop")
    unless $P10, rx872_fail
    rx872_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx872_pos = $P10."pos"()
.annotate "line", 418
  # rx pass
    rx872_cur."!cursor_pass"(rx872_pos, "postcircumfix:sym<( )>")
    rx872_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx872_pos)
    .return (rx872_cur)
  rx872_fail:
.annotate "line", 381
    (rx872_rep, rx872_pos, $I10, $P10) = rx872_cur."!mark_fail"(0)
    lt rx872_pos, -1, rx872_done
    eq rx872_pos, -1, rx872_fail
    jump $I10
  rx872_done:
    rx872_cur."!cursor_fail"()
    rx872_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx872_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("216_1258904213.70809") :method
.annotate "line", 381
    $P874 = self."!PREFIX__!subrule"("", "(")
    new $P875, "ResizablePMCArray"
    push $P875, $P874
    .return ($P875)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("217_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx878_tgt
    .local int rx878_pos
    .local int rx878_off
    .local int rx878_eos
    .local int rx878_rep
    .local pmc rx878_cur
    (rx878_cur, rx878_pos, rx878_tgt, $I10) = self."!cursor_start"()
    rx878_cur."!cursor_debug"("START ", "postfix:sym<.>")
    .lex unicode:"$\x{a2}", rx878_cur
    .local pmc match
    .lex "$/", match
    length rx878_eos, rx878_tgt
    set rx878_off, 0
    lt $I10, 2, rx878_start
    sub rx878_off, $I10, 1
    substr rx878_tgt, rx878_tgt, rx878_off
  rx878_start:
    ge rx878_pos, 0, rxscan882_done
  rxscan882_loop:
    ($P10) = rx878_cur."from"()
    inc $P10
    set rx878_pos, $P10
    ge rx878_pos, rx878_eos, rxscan882_done
    set_addr $I10, rxscan882_loop
    rx878_cur."!mark_push"(0, rx878_pos, $I10)
  rxscan882_done:
.annotate "line", 423
  # rx subrule "dotty" subtype=capture negate=
    rx878_cur."!cursor_pos"(rx878_pos)
    $P10 = rx878_cur."dotty"()
    unless $P10, rx878_fail
    rx878_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx878_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx878_cur."!cursor_pos"(rx878_pos)
    $P10 = rx878_cur."O"("%methodop")
    unless $P10, rx878_fail
    rx878_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx878_pos = $P10."pos"()
  # rx pass
    rx878_cur."!cursor_pass"(rx878_pos, "postfix:sym<.>")
    rx878_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx878_pos)
    .return (rx878_cur)
  rx878_fail:
.annotate "line", 381
    (rx878_rep, rx878_pos, $I10, $P10) = rx878_cur."!mark_fail"(0)
    lt rx878_pos, -1, rx878_done
    eq rx878_pos, -1, rx878_fail
    jump $I10
  rx878_done:
    rx878_cur."!cursor_fail"()
    rx878_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx878_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("218_1258904213.70809") :method
.annotate "line", 381
    $P880 = self."!PREFIX__!subrule"("dotty", "")
    new $P881, "ResizablePMCArray"
    push $P881, $P880
    .return ($P881)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("219_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx884_tgt
    .local int rx884_pos
    .local int rx884_off
    .local int rx884_eos
    .local int rx884_rep
    .local pmc rx884_cur
    (rx884_cur, rx884_pos, rx884_tgt, $I10) = self."!cursor_start"()
    rx884_cur."!cursor_debug"("START ", "prefix:sym<++>")
    .lex unicode:"$\x{a2}", rx884_cur
    .local pmc match
    .lex "$/", match
    length rx884_eos, rx884_tgt
    set rx884_off, 0
    lt $I10, 2, rx884_start
    sub rx884_off, $I10, 1
    substr rx884_tgt, rx884_tgt, rx884_off
  rx884_start:
    ge rx884_pos, 0, rxscan888_done
  rxscan888_loop:
    ($P10) = rx884_cur."from"()
    inc $P10
    set rx884_pos, $P10
    ge rx884_pos, rx884_eos, rxscan888_done
    set_addr $I10, rxscan888_loop
    rx884_cur."!mark_push"(0, rx884_pos, $I10)
  rxscan888_done:
.annotate "line", 425
  # rx subcapture "sym"
    set_addr $I10, rxcap_889_fail
    rx884_cur."!mark_push"(0, rx884_pos, $I10)
  # rx literal  "++"
    add $I11, rx884_pos, 2
    gt $I11, rx884_eos, rx884_fail
    sub $I11, rx884_pos, rx884_off
    substr $S10, rx884_tgt, $I11, 2
    ne $S10, "++", rx884_fail
    add rx884_pos, 2
    set_addr $I10, rxcap_889_fail
    ($I12, $I11) = rx884_cur."!mark_peek"($I10)
    rx884_cur."!cursor_pos"($I11)
    ($P10) = rx884_cur."!cursor_start"()
    $P10."!cursor_pass"(rx884_pos, "")
    rx884_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_889_done
  rxcap_889_fail:
    goto rx884_fail
  rxcap_889_done:
  # rx subrule "O" subtype=capture negate=
    rx884_cur."!cursor_pos"(rx884_pos)
    $P10 = rx884_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx884_fail
    rx884_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx884_pos = $P10."pos"()
  # rx pass
    rx884_cur."!cursor_pass"(rx884_pos, "prefix:sym<++>")
    rx884_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx884_pos)
    .return (rx884_cur)
  rx884_fail:
.annotate "line", 381
    (rx884_rep, rx884_pos, $I10, $P10) = rx884_cur."!mark_fail"(0)
    lt rx884_pos, -1, rx884_done
    eq rx884_pos, -1, rx884_fail
    jump $I10
  rx884_done:
    rx884_cur."!cursor_fail"()
    rx884_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx884_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("220_1258904213.70809") :method
.annotate "line", 381
    $P886 = self."!PREFIX__!subrule"("O", "++")
    new $P887, "ResizablePMCArray"
    push $P887, $P886
    .return ($P887)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("221_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx891_tgt
    .local int rx891_pos
    .local int rx891_off
    .local int rx891_eos
    .local int rx891_rep
    .local pmc rx891_cur
    (rx891_cur, rx891_pos, rx891_tgt, $I10) = self."!cursor_start"()
    rx891_cur."!cursor_debug"("START ", "prefix:sym<-->")
    .lex unicode:"$\x{a2}", rx891_cur
    .local pmc match
    .lex "$/", match
    length rx891_eos, rx891_tgt
    set rx891_off, 0
    lt $I10, 2, rx891_start
    sub rx891_off, $I10, 1
    substr rx891_tgt, rx891_tgt, rx891_off
  rx891_start:
    ge rx891_pos, 0, rxscan895_done
  rxscan895_loop:
    ($P10) = rx891_cur."from"()
    inc $P10
    set rx891_pos, $P10
    ge rx891_pos, rx891_eos, rxscan895_done
    set_addr $I10, rxscan895_loop
    rx891_cur."!mark_push"(0, rx891_pos, $I10)
  rxscan895_done:
.annotate "line", 426
  # rx subcapture "sym"
    set_addr $I10, rxcap_896_fail
    rx891_cur."!mark_push"(0, rx891_pos, $I10)
  # rx literal  "--"
    add $I11, rx891_pos, 2
    gt $I11, rx891_eos, rx891_fail
    sub $I11, rx891_pos, rx891_off
    substr $S10, rx891_tgt, $I11, 2
    ne $S10, "--", rx891_fail
    add rx891_pos, 2
    set_addr $I10, rxcap_896_fail
    ($I12, $I11) = rx891_cur."!mark_peek"($I10)
    rx891_cur."!cursor_pos"($I11)
    ($P10) = rx891_cur."!cursor_start"()
    $P10."!cursor_pass"(rx891_pos, "")
    rx891_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_896_done
  rxcap_896_fail:
    goto rx891_fail
  rxcap_896_done:
  # rx subrule "O" subtype=capture negate=
    rx891_cur."!cursor_pos"(rx891_pos)
    $P10 = rx891_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx891_fail
    rx891_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx891_pos = $P10."pos"()
  # rx pass
    rx891_cur."!cursor_pass"(rx891_pos, "prefix:sym<-->")
    rx891_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx891_pos)
    .return (rx891_cur)
  rx891_fail:
.annotate "line", 381
    (rx891_rep, rx891_pos, $I10, $P10) = rx891_cur."!mark_fail"(0)
    lt rx891_pos, -1, rx891_done
    eq rx891_pos, -1, rx891_fail
    jump $I10
  rx891_done:
    rx891_cur."!cursor_fail"()
    rx891_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx891_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("222_1258904213.70809") :method
.annotate "line", 381
    $P893 = self."!PREFIX__!subrule"("O", "--")
    new $P894, "ResizablePMCArray"
    push $P894, $P893
    .return ($P894)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("223_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx898_tgt
    .local int rx898_pos
    .local int rx898_off
    .local int rx898_eos
    .local int rx898_rep
    .local pmc rx898_cur
    (rx898_cur, rx898_pos, rx898_tgt, $I10) = self."!cursor_start"()
    rx898_cur."!cursor_debug"("START ", "postfix:sym<++>")
    .lex unicode:"$\x{a2}", rx898_cur
    .local pmc match
    .lex "$/", match
    length rx898_eos, rx898_tgt
    set rx898_off, 0
    lt $I10, 2, rx898_start
    sub rx898_off, $I10, 1
    substr rx898_tgt, rx898_tgt, rx898_off
  rx898_start:
    ge rx898_pos, 0, rxscan902_done
  rxscan902_loop:
    ($P10) = rx898_cur."from"()
    inc $P10
    set rx898_pos, $P10
    ge rx898_pos, rx898_eos, rxscan902_done
    set_addr $I10, rxscan902_loop
    rx898_cur."!mark_push"(0, rx898_pos, $I10)
  rxscan902_done:
.annotate "line", 429
  # rx subcapture "sym"
    set_addr $I10, rxcap_903_fail
    rx898_cur."!mark_push"(0, rx898_pos, $I10)
  # rx literal  "++"
    add $I11, rx898_pos, 2
    gt $I11, rx898_eos, rx898_fail
    sub $I11, rx898_pos, rx898_off
    substr $S10, rx898_tgt, $I11, 2
    ne $S10, "++", rx898_fail
    add rx898_pos, 2
    set_addr $I10, rxcap_903_fail
    ($I12, $I11) = rx898_cur."!mark_peek"($I10)
    rx898_cur."!cursor_pos"($I11)
    ($P10) = rx898_cur."!cursor_start"()
    $P10."!cursor_pass"(rx898_pos, "")
    rx898_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_903_done
  rxcap_903_fail:
    goto rx898_fail
  rxcap_903_done:
  # rx subrule "O" subtype=capture negate=
    rx898_cur."!cursor_pos"(rx898_pos)
    $P10 = rx898_cur."O"("%autoincrement")
    unless $P10, rx898_fail
    rx898_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx898_pos = $P10."pos"()
  # rx pass
    rx898_cur."!cursor_pass"(rx898_pos, "postfix:sym<++>")
    rx898_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx898_pos)
    .return (rx898_cur)
  rx898_fail:
.annotate "line", 381
    (rx898_rep, rx898_pos, $I10, $P10) = rx898_cur."!mark_fail"(0)
    lt rx898_pos, -1, rx898_done
    eq rx898_pos, -1, rx898_fail
    jump $I10
  rx898_done:
    rx898_cur."!cursor_fail"()
    rx898_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx898_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("224_1258904213.70809") :method
.annotate "line", 381
    $P900 = self."!PREFIX__!subrule"("O", "++")
    new $P901, "ResizablePMCArray"
    push $P901, $P900
    .return ($P901)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("225_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx905_tgt
    .local int rx905_pos
    .local int rx905_off
    .local int rx905_eos
    .local int rx905_rep
    .local pmc rx905_cur
    (rx905_cur, rx905_pos, rx905_tgt, $I10) = self."!cursor_start"()
    rx905_cur."!cursor_debug"("START ", "postfix:sym<-->")
    .lex unicode:"$\x{a2}", rx905_cur
    .local pmc match
    .lex "$/", match
    length rx905_eos, rx905_tgt
    set rx905_off, 0
    lt $I10, 2, rx905_start
    sub rx905_off, $I10, 1
    substr rx905_tgt, rx905_tgt, rx905_off
  rx905_start:
    ge rx905_pos, 0, rxscan909_done
  rxscan909_loop:
    ($P10) = rx905_cur."from"()
    inc $P10
    set rx905_pos, $P10
    ge rx905_pos, rx905_eos, rxscan909_done
    set_addr $I10, rxscan909_loop
    rx905_cur."!mark_push"(0, rx905_pos, $I10)
  rxscan909_done:
.annotate "line", 430
  # rx subcapture "sym"
    set_addr $I10, rxcap_910_fail
    rx905_cur."!mark_push"(0, rx905_pos, $I10)
  # rx literal  "--"
    add $I11, rx905_pos, 2
    gt $I11, rx905_eos, rx905_fail
    sub $I11, rx905_pos, rx905_off
    substr $S10, rx905_tgt, $I11, 2
    ne $S10, "--", rx905_fail
    add rx905_pos, 2
    set_addr $I10, rxcap_910_fail
    ($I12, $I11) = rx905_cur."!mark_peek"($I10)
    rx905_cur."!cursor_pos"($I11)
    ($P10) = rx905_cur."!cursor_start"()
    $P10."!cursor_pass"(rx905_pos, "")
    rx905_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_910_done
  rxcap_910_fail:
    goto rx905_fail
  rxcap_910_done:
  # rx subrule "O" subtype=capture negate=
    rx905_cur."!cursor_pos"(rx905_pos)
    $P10 = rx905_cur."O"("%autoincrement")
    unless $P10, rx905_fail
    rx905_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx905_pos = $P10."pos"()
  # rx pass
    rx905_cur."!cursor_pass"(rx905_pos, "postfix:sym<-->")
    rx905_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx905_pos)
    .return (rx905_cur)
  rx905_fail:
.annotate "line", 381
    (rx905_rep, rx905_pos, $I10, $P10) = rx905_cur."!mark_fail"(0)
    lt rx905_pos, -1, rx905_done
    eq rx905_pos, -1, rx905_fail
    jump $I10
  rx905_done:
    rx905_cur."!cursor_fail"()
    rx905_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx905_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("226_1258904213.70809") :method
.annotate "line", 381
    $P907 = self."!PREFIX__!subrule"("O", "--")
    new $P908, "ResizablePMCArray"
    push $P908, $P907
    .return ($P908)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("227_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx912_tgt
    .local int rx912_pos
    .local int rx912_off
    .local int rx912_eos
    .local int rx912_rep
    .local pmc rx912_cur
    (rx912_cur, rx912_pos, rx912_tgt, $I10) = self."!cursor_start"()
    rx912_cur."!cursor_debug"("START ", "infix:sym<**>")
    .lex unicode:"$\x{a2}", rx912_cur
    .local pmc match
    .lex "$/", match
    length rx912_eos, rx912_tgt
    set rx912_off, 0
    lt $I10, 2, rx912_start
    sub rx912_off, $I10, 1
    substr rx912_tgt, rx912_tgt, rx912_off
  rx912_start:
    ge rx912_pos, 0, rxscan916_done
  rxscan916_loop:
    ($P10) = rx912_cur."from"()
    inc $P10
    set rx912_pos, $P10
    ge rx912_pos, rx912_eos, rxscan916_done
    set_addr $I10, rxscan916_loop
    rx912_cur."!mark_push"(0, rx912_pos, $I10)
  rxscan916_done:
.annotate "line", 432
  # rx subcapture "sym"
    set_addr $I10, rxcap_917_fail
    rx912_cur."!mark_push"(0, rx912_pos, $I10)
  # rx literal  "**"
    add $I11, rx912_pos, 2
    gt $I11, rx912_eos, rx912_fail
    sub $I11, rx912_pos, rx912_off
    substr $S10, rx912_tgt, $I11, 2
    ne $S10, "**", rx912_fail
    add rx912_pos, 2
    set_addr $I10, rxcap_917_fail
    ($I12, $I11) = rx912_cur."!mark_peek"($I10)
    rx912_cur."!cursor_pos"($I11)
    ($P10) = rx912_cur."!cursor_start"()
    $P10."!cursor_pass"(rx912_pos, "")
    rx912_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_917_done
  rxcap_917_fail:
    goto rx912_fail
  rxcap_917_done:
  # rx subrule "O" subtype=capture negate=
    rx912_cur."!cursor_pos"(rx912_pos)
    $P10 = rx912_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx912_fail
    rx912_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx912_pos = $P10."pos"()
  # rx pass
    rx912_cur."!cursor_pass"(rx912_pos, "infix:sym<**>")
    rx912_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx912_pos)
    .return (rx912_cur)
  rx912_fail:
.annotate "line", 381
    (rx912_rep, rx912_pos, $I10, $P10) = rx912_cur."!mark_fail"(0)
    lt rx912_pos, -1, rx912_done
    eq rx912_pos, -1, rx912_fail
    jump $I10
  rx912_done:
    rx912_cur."!cursor_fail"()
    rx912_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx912_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("228_1258904213.70809") :method
.annotate "line", 381
    $P914 = self."!PREFIX__!subrule"("O", "**")
    new $P915, "ResizablePMCArray"
    push $P915, $P914
    .return ($P915)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("229_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx919_tgt
    .local int rx919_pos
    .local int rx919_off
    .local int rx919_eos
    .local int rx919_rep
    .local pmc rx919_cur
    (rx919_cur, rx919_pos, rx919_tgt, $I10) = self."!cursor_start"()
    rx919_cur."!cursor_debug"("START ", "prefix:sym<+>")
    .lex unicode:"$\x{a2}", rx919_cur
    .local pmc match
    .lex "$/", match
    length rx919_eos, rx919_tgt
    set rx919_off, 0
    lt $I10, 2, rx919_start
    sub rx919_off, $I10, 1
    substr rx919_tgt, rx919_tgt, rx919_off
  rx919_start:
    ge rx919_pos, 0, rxscan923_done
  rxscan923_loop:
    ($P10) = rx919_cur."from"()
    inc $P10
    set rx919_pos, $P10
    ge rx919_pos, rx919_eos, rxscan923_done
    set_addr $I10, rxscan923_loop
    rx919_cur."!mark_push"(0, rx919_pos, $I10)
  rxscan923_done:
.annotate "line", 434
  # rx subcapture "sym"
    set_addr $I10, rxcap_924_fail
    rx919_cur."!mark_push"(0, rx919_pos, $I10)
  # rx literal  "+"
    add $I11, rx919_pos, 1
    gt $I11, rx919_eos, rx919_fail
    sub $I11, rx919_pos, rx919_off
    substr $S10, rx919_tgt, $I11, 1
    ne $S10, "+", rx919_fail
    add rx919_pos, 1
    set_addr $I10, rxcap_924_fail
    ($I12, $I11) = rx919_cur."!mark_peek"($I10)
    rx919_cur."!cursor_pos"($I11)
    ($P10) = rx919_cur."!cursor_start"()
    $P10."!cursor_pass"(rx919_pos, "")
    rx919_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_924_done
  rxcap_924_fail:
    goto rx919_fail
  rxcap_924_done:
  # rx subrule "O" subtype=capture negate=
    rx919_cur."!cursor_pos"(rx919_pos)
    $P10 = rx919_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx919_fail
    rx919_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx919_pos = $P10."pos"()
  # rx pass
    rx919_cur."!cursor_pass"(rx919_pos, "prefix:sym<+>")
    rx919_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx919_pos)
    .return (rx919_cur)
  rx919_fail:
.annotate "line", 381
    (rx919_rep, rx919_pos, $I10, $P10) = rx919_cur."!mark_fail"(0)
    lt rx919_pos, -1, rx919_done
    eq rx919_pos, -1, rx919_fail
    jump $I10
  rx919_done:
    rx919_cur."!cursor_fail"()
    rx919_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx919_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("230_1258904213.70809") :method
.annotate "line", 381
    $P921 = self."!PREFIX__!subrule"("O", "+")
    new $P922, "ResizablePMCArray"
    push $P922, $P921
    .return ($P922)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("231_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx926_tgt
    .local int rx926_pos
    .local int rx926_off
    .local int rx926_eos
    .local int rx926_rep
    .local pmc rx926_cur
    (rx926_cur, rx926_pos, rx926_tgt, $I10) = self."!cursor_start"()
    rx926_cur."!cursor_debug"("START ", "prefix:sym<~>")
    .lex unicode:"$\x{a2}", rx926_cur
    .local pmc match
    .lex "$/", match
    length rx926_eos, rx926_tgt
    set rx926_off, 0
    lt $I10, 2, rx926_start
    sub rx926_off, $I10, 1
    substr rx926_tgt, rx926_tgt, rx926_off
  rx926_start:
    ge rx926_pos, 0, rxscan930_done
  rxscan930_loop:
    ($P10) = rx926_cur."from"()
    inc $P10
    set rx926_pos, $P10
    ge rx926_pos, rx926_eos, rxscan930_done
    set_addr $I10, rxscan930_loop
    rx926_cur."!mark_push"(0, rx926_pos, $I10)
  rxscan930_done:
.annotate "line", 435
  # rx subcapture "sym"
    set_addr $I10, rxcap_931_fail
    rx926_cur."!mark_push"(0, rx926_pos, $I10)
  # rx literal  "~"
    add $I11, rx926_pos, 1
    gt $I11, rx926_eos, rx926_fail
    sub $I11, rx926_pos, rx926_off
    substr $S10, rx926_tgt, $I11, 1
    ne $S10, "~", rx926_fail
    add rx926_pos, 1
    set_addr $I10, rxcap_931_fail
    ($I12, $I11) = rx926_cur."!mark_peek"($I10)
    rx926_cur."!cursor_pos"($I11)
    ($P10) = rx926_cur."!cursor_start"()
    $P10."!cursor_pass"(rx926_pos, "")
    rx926_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_931_done
  rxcap_931_fail:
    goto rx926_fail
  rxcap_931_done:
  # rx subrule "O" subtype=capture negate=
    rx926_cur."!cursor_pos"(rx926_pos)
    $P10 = rx926_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx926_fail
    rx926_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx926_pos = $P10."pos"()
  # rx pass
    rx926_cur."!cursor_pass"(rx926_pos, "prefix:sym<~>")
    rx926_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx926_pos)
    .return (rx926_cur)
  rx926_fail:
.annotate "line", 381
    (rx926_rep, rx926_pos, $I10, $P10) = rx926_cur."!mark_fail"(0)
    lt rx926_pos, -1, rx926_done
    eq rx926_pos, -1, rx926_fail
    jump $I10
  rx926_done:
    rx926_cur."!cursor_fail"()
    rx926_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx926_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("232_1258904213.70809") :method
.annotate "line", 381
    $P928 = self."!PREFIX__!subrule"("O", "~")
    new $P929, "ResizablePMCArray"
    push $P929, $P928
    .return ($P929)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("233_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx933_tgt
    .local int rx933_pos
    .local int rx933_off
    .local int rx933_eos
    .local int rx933_rep
    .local pmc rx933_cur
    (rx933_cur, rx933_pos, rx933_tgt, $I10) = self."!cursor_start"()
    rx933_cur."!cursor_debug"("START ", "prefix:sym<->")
    .lex unicode:"$\x{a2}", rx933_cur
    .local pmc match
    .lex "$/", match
    length rx933_eos, rx933_tgt
    set rx933_off, 0
    lt $I10, 2, rx933_start
    sub rx933_off, $I10, 1
    substr rx933_tgt, rx933_tgt, rx933_off
  rx933_start:
    ge rx933_pos, 0, rxscan937_done
  rxscan937_loop:
    ($P10) = rx933_cur."from"()
    inc $P10
    set rx933_pos, $P10
    ge rx933_pos, rx933_eos, rxscan937_done
    set_addr $I10, rxscan937_loop
    rx933_cur."!mark_push"(0, rx933_pos, $I10)
  rxscan937_done:
.annotate "line", 436
  # rx subcapture "sym"
    set_addr $I10, rxcap_938_fail
    rx933_cur."!mark_push"(0, rx933_pos, $I10)
  # rx literal  "-"
    add $I11, rx933_pos, 1
    gt $I11, rx933_eos, rx933_fail
    sub $I11, rx933_pos, rx933_off
    substr $S10, rx933_tgt, $I11, 1
    ne $S10, "-", rx933_fail
    add rx933_pos, 1
    set_addr $I10, rxcap_938_fail
    ($I12, $I11) = rx933_cur."!mark_peek"($I10)
    rx933_cur."!cursor_pos"($I11)
    ($P10) = rx933_cur."!cursor_start"()
    $P10."!cursor_pass"(rx933_pos, "")
    rx933_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_938_done
  rxcap_938_fail:
    goto rx933_fail
  rxcap_938_done:
  # rx enumcharlist negate=1 zerowidth
    ge rx933_pos, rx933_eos, rx933_fail
    sub $I10, rx933_pos, rx933_off
    substr $S10, rx933_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx933_fail
  # rx subrule "O" subtype=capture negate=
    rx933_cur."!cursor_pos"(rx933_pos)
    $P10 = rx933_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx933_fail
    rx933_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx933_pos = $P10."pos"()
  # rx pass
    rx933_cur."!cursor_pass"(rx933_pos, "prefix:sym<->")
    rx933_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx933_pos)
    .return (rx933_cur)
  rx933_fail:
.annotate "line", 381
    (rx933_rep, rx933_pos, $I10, $P10) = rx933_cur."!mark_fail"(0)
    lt rx933_pos, -1, rx933_done
    eq rx933_pos, -1, rx933_fail
    jump $I10
  rx933_done:
    rx933_cur."!cursor_fail"()
    rx933_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx933_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("234_1258904213.70809") :method
.annotate "line", 381
    $P935 = self."!PREFIX__!subrule"("O", "-")
    new $P936, "ResizablePMCArray"
    push $P936, $P935
    .return ($P936)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("235_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx940_tgt
    .local int rx940_pos
    .local int rx940_off
    .local int rx940_eos
    .local int rx940_rep
    .local pmc rx940_cur
    (rx940_cur, rx940_pos, rx940_tgt, $I10) = self."!cursor_start"()
    rx940_cur."!cursor_debug"("START ", "prefix:sym<?>")
    .lex unicode:"$\x{a2}", rx940_cur
    .local pmc match
    .lex "$/", match
    length rx940_eos, rx940_tgt
    set rx940_off, 0
    lt $I10, 2, rx940_start
    sub rx940_off, $I10, 1
    substr rx940_tgt, rx940_tgt, rx940_off
  rx940_start:
    ge rx940_pos, 0, rxscan944_done
  rxscan944_loop:
    ($P10) = rx940_cur."from"()
    inc $P10
    set rx940_pos, $P10
    ge rx940_pos, rx940_eos, rxscan944_done
    set_addr $I10, rxscan944_loop
    rx940_cur."!mark_push"(0, rx940_pos, $I10)
  rxscan944_done:
.annotate "line", 437
  # rx subcapture "sym"
    set_addr $I10, rxcap_945_fail
    rx940_cur."!mark_push"(0, rx940_pos, $I10)
  # rx literal  "?"
    add $I11, rx940_pos, 1
    gt $I11, rx940_eos, rx940_fail
    sub $I11, rx940_pos, rx940_off
    substr $S10, rx940_tgt, $I11, 1
    ne $S10, "?", rx940_fail
    add rx940_pos, 1
    set_addr $I10, rxcap_945_fail
    ($I12, $I11) = rx940_cur."!mark_peek"($I10)
    rx940_cur."!cursor_pos"($I11)
    ($P10) = rx940_cur."!cursor_start"()
    $P10."!cursor_pass"(rx940_pos, "")
    rx940_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_945_done
  rxcap_945_fail:
    goto rx940_fail
  rxcap_945_done:
  # rx subrule "O" subtype=capture negate=
    rx940_cur."!cursor_pos"(rx940_pos)
    $P10 = rx940_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx940_fail
    rx940_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx940_pos = $P10."pos"()
  # rx pass
    rx940_cur."!cursor_pass"(rx940_pos, "prefix:sym<?>")
    rx940_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx940_pos)
    .return (rx940_cur)
  rx940_fail:
.annotate "line", 381
    (rx940_rep, rx940_pos, $I10, $P10) = rx940_cur."!mark_fail"(0)
    lt rx940_pos, -1, rx940_done
    eq rx940_pos, -1, rx940_fail
    jump $I10
  rx940_done:
    rx940_cur."!cursor_fail"()
    rx940_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx940_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("236_1258904213.70809") :method
.annotate "line", 381
    $P942 = self."!PREFIX__!subrule"("O", "?")
    new $P943, "ResizablePMCArray"
    push $P943, $P942
    .return ($P943)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("237_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx947_tgt
    .local int rx947_pos
    .local int rx947_off
    .local int rx947_eos
    .local int rx947_rep
    .local pmc rx947_cur
    (rx947_cur, rx947_pos, rx947_tgt, $I10) = self."!cursor_start"()
    rx947_cur."!cursor_debug"("START ", "prefix:sym<!>")
    .lex unicode:"$\x{a2}", rx947_cur
    .local pmc match
    .lex "$/", match
    length rx947_eos, rx947_tgt
    set rx947_off, 0
    lt $I10, 2, rx947_start
    sub rx947_off, $I10, 1
    substr rx947_tgt, rx947_tgt, rx947_off
  rx947_start:
    ge rx947_pos, 0, rxscan951_done
  rxscan951_loop:
    ($P10) = rx947_cur."from"()
    inc $P10
    set rx947_pos, $P10
    ge rx947_pos, rx947_eos, rxscan951_done
    set_addr $I10, rxscan951_loop
    rx947_cur."!mark_push"(0, rx947_pos, $I10)
  rxscan951_done:
.annotate "line", 438
  # rx subcapture "sym"
    set_addr $I10, rxcap_952_fail
    rx947_cur."!mark_push"(0, rx947_pos, $I10)
  # rx literal  "!"
    add $I11, rx947_pos, 1
    gt $I11, rx947_eos, rx947_fail
    sub $I11, rx947_pos, rx947_off
    substr $S10, rx947_tgt, $I11, 1
    ne $S10, "!", rx947_fail
    add rx947_pos, 1
    set_addr $I10, rxcap_952_fail
    ($I12, $I11) = rx947_cur."!mark_peek"($I10)
    rx947_cur."!cursor_pos"($I11)
    ($P10) = rx947_cur."!cursor_start"()
    $P10."!cursor_pass"(rx947_pos, "")
    rx947_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_952_done
  rxcap_952_fail:
    goto rx947_fail
  rxcap_952_done:
  # rx subrule "O" subtype=capture negate=
    rx947_cur."!cursor_pos"(rx947_pos)
    $P10 = rx947_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx947_fail
    rx947_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx947_pos = $P10."pos"()
  # rx pass
    rx947_cur."!cursor_pass"(rx947_pos, "prefix:sym<!>")
    rx947_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx947_pos)
    .return (rx947_cur)
  rx947_fail:
.annotate "line", 381
    (rx947_rep, rx947_pos, $I10, $P10) = rx947_cur."!mark_fail"(0)
    lt rx947_pos, -1, rx947_done
    eq rx947_pos, -1, rx947_fail
    jump $I10
  rx947_done:
    rx947_cur."!cursor_fail"()
    rx947_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx947_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("238_1258904213.70809") :method
.annotate "line", 381
    $P949 = self."!PREFIX__!subrule"("O", "!")
    new $P950, "ResizablePMCArray"
    push $P950, $P949
    .return ($P950)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("239_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx954_tgt
    .local int rx954_pos
    .local int rx954_off
    .local int rx954_eos
    .local int rx954_rep
    .local pmc rx954_cur
    (rx954_cur, rx954_pos, rx954_tgt, $I10) = self."!cursor_start"()
    rx954_cur."!cursor_debug"("START ", "prefix:sym<|>")
    .lex unicode:"$\x{a2}", rx954_cur
    .local pmc match
    .lex "$/", match
    length rx954_eos, rx954_tgt
    set rx954_off, 0
    lt $I10, 2, rx954_start
    sub rx954_off, $I10, 1
    substr rx954_tgt, rx954_tgt, rx954_off
  rx954_start:
    ge rx954_pos, 0, rxscan958_done
  rxscan958_loop:
    ($P10) = rx954_cur."from"()
    inc $P10
    set rx954_pos, $P10
    ge rx954_pos, rx954_eos, rxscan958_done
    set_addr $I10, rxscan958_loop
    rx954_cur."!mark_push"(0, rx954_pos, $I10)
  rxscan958_done:
.annotate "line", 439
  # rx subcapture "sym"
    set_addr $I10, rxcap_959_fail
    rx954_cur."!mark_push"(0, rx954_pos, $I10)
  # rx literal  "|"
    add $I11, rx954_pos, 1
    gt $I11, rx954_eos, rx954_fail
    sub $I11, rx954_pos, rx954_off
    substr $S10, rx954_tgt, $I11, 1
    ne $S10, "|", rx954_fail
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
    $P10 = rx954_cur."O"("%symbolic_unary")
    unless $P10, rx954_fail
    rx954_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx954_pos = $P10."pos"()
  # rx pass
    rx954_cur."!cursor_pass"(rx954_pos, "prefix:sym<|>")
    rx954_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx954_pos)
    .return (rx954_cur)
  rx954_fail:
.annotate "line", 381
    (rx954_rep, rx954_pos, $I10, $P10) = rx954_cur."!mark_fail"(0)
    lt rx954_pos, -1, rx954_done
    eq rx954_pos, -1, rx954_fail
    jump $I10
  rx954_done:
    rx954_cur."!cursor_fail"()
    rx954_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx954_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("240_1258904213.70809") :method
.annotate "line", 381
    $P956 = self."!PREFIX__!subrule"("O", "|")
    new $P957, "ResizablePMCArray"
    push $P957, $P956
    .return ($P957)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("241_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx961_tgt
    .local int rx961_pos
    .local int rx961_off
    .local int rx961_eos
    .local int rx961_rep
    .local pmc rx961_cur
    (rx961_cur, rx961_pos, rx961_tgt, $I10) = self."!cursor_start"()
    rx961_cur."!cursor_debug"("START ", "infix:sym<*>")
    .lex unicode:"$\x{a2}", rx961_cur
    .local pmc match
    .lex "$/", match
    length rx961_eos, rx961_tgt
    set rx961_off, 0
    lt $I10, 2, rx961_start
    sub rx961_off, $I10, 1
    substr rx961_tgt, rx961_tgt, rx961_off
  rx961_start:
    ge rx961_pos, 0, rxscan965_done
  rxscan965_loop:
    ($P10) = rx961_cur."from"()
    inc $P10
    set rx961_pos, $P10
    ge rx961_pos, rx961_eos, rxscan965_done
    set_addr $I10, rxscan965_loop
    rx961_cur."!mark_push"(0, rx961_pos, $I10)
  rxscan965_done:
.annotate "line", 441
  # rx subcapture "sym"
    set_addr $I10, rxcap_966_fail
    rx961_cur."!mark_push"(0, rx961_pos, $I10)
  # rx literal  "*"
    add $I11, rx961_pos, 1
    gt $I11, rx961_eos, rx961_fail
    sub $I11, rx961_pos, rx961_off
    substr $S10, rx961_tgt, $I11, 1
    ne $S10, "*", rx961_fail
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
    $P10 = rx961_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx961_fail
    rx961_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx961_pos = $P10."pos"()
  # rx pass
    rx961_cur."!cursor_pass"(rx961_pos, "infix:sym<*>")
    rx961_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx961_pos)
    .return (rx961_cur)
  rx961_fail:
.annotate "line", 381
    (rx961_rep, rx961_pos, $I10, $P10) = rx961_cur."!mark_fail"(0)
    lt rx961_pos, -1, rx961_done
    eq rx961_pos, -1, rx961_fail
    jump $I10
  rx961_done:
    rx961_cur."!cursor_fail"()
    rx961_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx961_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("242_1258904213.70809") :method
.annotate "line", 381
    $P963 = self."!PREFIX__!subrule"("O", "*")
    new $P964, "ResizablePMCArray"
    push $P964, $P963
    .return ($P964)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("243_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx968_tgt
    .local int rx968_pos
    .local int rx968_off
    .local int rx968_eos
    .local int rx968_rep
    .local pmc rx968_cur
    (rx968_cur, rx968_pos, rx968_tgt, $I10) = self."!cursor_start"()
    rx968_cur."!cursor_debug"("START ", "infix:sym</>")
    .lex unicode:"$\x{a2}", rx968_cur
    .local pmc match
    .lex "$/", match
    length rx968_eos, rx968_tgt
    set rx968_off, 0
    lt $I10, 2, rx968_start
    sub rx968_off, $I10, 1
    substr rx968_tgt, rx968_tgt, rx968_off
  rx968_start:
    ge rx968_pos, 0, rxscan972_done
  rxscan972_loop:
    ($P10) = rx968_cur."from"()
    inc $P10
    set rx968_pos, $P10
    ge rx968_pos, rx968_eos, rxscan972_done
    set_addr $I10, rxscan972_loop
    rx968_cur."!mark_push"(0, rx968_pos, $I10)
  rxscan972_done:
.annotate "line", 442
  # rx subcapture "sym"
    set_addr $I10, rxcap_973_fail
    rx968_cur."!mark_push"(0, rx968_pos, $I10)
  # rx literal  "/"
    add $I11, rx968_pos, 1
    gt $I11, rx968_eos, rx968_fail
    sub $I11, rx968_pos, rx968_off
    substr $S10, rx968_tgt, $I11, 1
    ne $S10, "/", rx968_fail
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
    $P10 = rx968_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx968_fail
    rx968_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx968_pos = $P10."pos"()
  # rx pass
    rx968_cur."!cursor_pass"(rx968_pos, "infix:sym</>")
    rx968_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx968_pos)
    .return (rx968_cur)
  rx968_fail:
.annotate "line", 381
    (rx968_rep, rx968_pos, $I10, $P10) = rx968_cur."!mark_fail"(0)
    lt rx968_pos, -1, rx968_done
    eq rx968_pos, -1, rx968_fail
    jump $I10
  rx968_done:
    rx968_cur."!cursor_fail"()
    rx968_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx968_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("244_1258904213.70809") :method
.annotate "line", 381
    $P970 = self."!PREFIX__!subrule"("O", "/")
    new $P971, "ResizablePMCArray"
    push $P971, $P970
    .return ($P971)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("245_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx975_tgt
    .local int rx975_pos
    .local int rx975_off
    .local int rx975_eos
    .local int rx975_rep
    .local pmc rx975_cur
    (rx975_cur, rx975_pos, rx975_tgt, $I10) = self."!cursor_start"()
    rx975_cur."!cursor_debug"("START ", "infix:sym<%>")
    .lex unicode:"$\x{a2}", rx975_cur
    .local pmc match
    .lex "$/", match
    length rx975_eos, rx975_tgt
    set rx975_off, 0
    lt $I10, 2, rx975_start
    sub rx975_off, $I10, 1
    substr rx975_tgt, rx975_tgt, rx975_off
  rx975_start:
    ge rx975_pos, 0, rxscan979_done
  rxscan979_loop:
    ($P10) = rx975_cur."from"()
    inc $P10
    set rx975_pos, $P10
    ge rx975_pos, rx975_eos, rxscan979_done
    set_addr $I10, rxscan979_loop
    rx975_cur."!mark_push"(0, rx975_pos, $I10)
  rxscan979_done:
.annotate "line", 443
  # rx subcapture "sym"
    set_addr $I10, rxcap_980_fail
    rx975_cur."!mark_push"(0, rx975_pos, $I10)
  # rx literal  "%"
    add $I11, rx975_pos, 1
    gt $I11, rx975_eos, rx975_fail
    sub $I11, rx975_pos, rx975_off
    substr $S10, rx975_tgt, $I11, 1
    ne $S10, "%", rx975_fail
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
    $P10 = rx975_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx975_fail
    rx975_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx975_pos = $P10."pos"()
  # rx pass
    rx975_cur."!cursor_pass"(rx975_pos, "infix:sym<%>")
    rx975_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx975_pos)
    .return (rx975_cur)
  rx975_fail:
.annotate "line", 381
    (rx975_rep, rx975_pos, $I10, $P10) = rx975_cur."!mark_fail"(0)
    lt rx975_pos, -1, rx975_done
    eq rx975_pos, -1, rx975_fail
    jump $I10
  rx975_done:
    rx975_cur."!cursor_fail"()
    rx975_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx975_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("246_1258904213.70809") :method
.annotate "line", 381
    $P977 = self."!PREFIX__!subrule"("O", "%")
    new $P978, "ResizablePMCArray"
    push $P978, $P977
    .return ($P978)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("247_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx982_tgt
    .local int rx982_pos
    .local int rx982_off
    .local int rx982_eos
    .local int rx982_rep
    .local pmc rx982_cur
    (rx982_cur, rx982_pos, rx982_tgt, $I10) = self."!cursor_start"()
    rx982_cur."!cursor_debug"("START ", "infix:sym<+>")
    .lex unicode:"$\x{a2}", rx982_cur
    .local pmc match
    .lex "$/", match
    length rx982_eos, rx982_tgt
    set rx982_off, 0
    lt $I10, 2, rx982_start
    sub rx982_off, $I10, 1
    substr rx982_tgt, rx982_tgt, rx982_off
  rx982_start:
    ge rx982_pos, 0, rxscan986_done
  rxscan986_loop:
    ($P10) = rx982_cur."from"()
    inc $P10
    set rx982_pos, $P10
    ge rx982_pos, rx982_eos, rxscan986_done
    set_addr $I10, rxscan986_loop
    rx982_cur."!mark_push"(0, rx982_pos, $I10)
  rxscan986_done:
.annotate "line", 445
  # rx subcapture "sym"
    set_addr $I10, rxcap_987_fail
    rx982_cur."!mark_push"(0, rx982_pos, $I10)
  # rx literal  "+"
    add $I11, rx982_pos, 1
    gt $I11, rx982_eos, rx982_fail
    sub $I11, rx982_pos, rx982_off
    substr $S10, rx982_tgt, $I11, 1
    ne $S10, "+", rx982_fail
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
    $P10 = rx982_cur."O"("%additive, :pirop<add>")
    unless $P10, rx982_fail
    rx982_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx982_pos = $P10."pos"()
  # rx pass
    rx982_cur."!cursor_pass"(rx982_pos, "infix:sym<+>")
    rx982_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx982_pos)
    .return (rx982_cur)
  rx982_fail:
.annotate "line", 381
    (rx982_rep, rx982_pos, $I10, $P10) = rx982_cur."!mark_fail"(0)
    lt rx982_pos, -1, rx982_done
    eq rx982_pos, -1, rx982_fail
    jump $I10
  rx982_done:
    rx982_cur."!cursor_fail"()
    rx982_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx982_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("248_1258904213.70809") :method
.annotate "line", 381
    $P984 = self."!PREFIX__!subrule"("O", "+")
    new $P985, "ResizablePMCArray"
    push $P985, $P984
    .return ($P985)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("249_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx989_tgt
    .local int rx989_pos
    .local int rx989_off
    .local int rx989_eos
    .local int rx989_rep
    .local pmc rx989_cur
    (rx989_cur, rx989_pos, rx989_tgt, $I10) = self."!cursor_start"()
    rx989_cur."!cursor_debug"("START ", "infix:sym<->")
    .lex unicode:"$\x{a2}", rx989_cur
    .local pmc match
    .lex "$/", match
    length rx989_eos, rx989_tgt
    set rx989_off, 0
    lt $I10, 2, rx989_start
    sub rx989_off, $I10, 1
    substr rx989_tgt, rx989_tgt, rx989_off
  rx989_start:
    ge rx989_pos, 0, rxscan993_done
  rxscan993_loop:
    ($P10) = rx989_cur."from"()
    inc $P10
    set rx989_pos, $P10
    ge rx989_pos, rx989_eos, rxscan993_done
    set_addr $I10, rxscan993_loop
    rx989_cur."!mark_push"(0, rx989_pos, $I10)
  rxscan993_done:
.annotate "line", 446
  # rx subcapture "sym"
    set_addr $I10, rxcap_994_fail
    rx989_cur."!mark_push"(0, rx989_pos, $I10)
  # rx literal  "-"
    add $I11, rx989_pos, 1
    gt $I11, rx989_eos, rx989_fail
    sub $I11, rx989_pos, rx989_off
    substr $S10, rx989_tgt, $I11, 1
    ne $S10, "-", rx989_fail
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
    $P10 = rx989_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx989_fail
    rx989_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx989_pos = $P10."pos"()
  # rx pass
    rx989_cur."!cursor_pass"(rx989_pos, "infix:sym<->")
    rx989_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx989_pos)
    .return (rx989_cur)
  rx989_fail:
.annotate "line", 381
    (rx989_rep, rx989_pos, $I10, $P10) = rx989_cur."!mark_fail"(0)
    lt rx989_pos, -1, rx989_done
    eq rx989_pos, -1, rx989_fail
    jump $I10
  rx989_done:
    rx989_cur."!cursor_fail"()
    rx989_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx989_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("250_1258904213.70809") :method
.annotate "line", 381
    $P991 = self."!PREFIX__!subrule"("O", "-")
    new $P992, "ResizablePMCArray"
    push $P992, $P991
    .return ($P992)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("251_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx996_tgt
    .local int rx996_pos
    .local int rx996_off
    .local int rx996_eos
    .local int rx996_rep
    .local pmc rx996_cur
    (rx996_cur, rx996_pos, rx996_tgt, $I10) = self."!cursor_start"()
    rx996_cur."!cursor_debug"("START ", "infix:sym<~>")
    .lex unicode:"$\x{a2}", rx996_cur
    .local pmc match
    .lex "$/", match
    length rx996_eos, rx996_tgt
    set rx996_off, 0
    lt $I10, 2, rx996_start
    sub rx996_off, $I10, 1
    substr rx996_tgt, rx996_tgt, rx996_off
  rx996_start:
    ge rx996_pos, 0, rxscan1000_done
  rxscan1000_loop:
    ($P10) = rx996_cur."from"()
    inc $P10
    set rx996_pos, $P10
    ge rx996_pos, rx996_eos, rxscan1000_done
    set_addr $I10, rxscan1000_loop
    rx996_cur."!mark_push"(0, rx996_pos, $I10)
  rxscan1000_done:
.annotate "line", 448
  # rx subcapture "sym"
    set_addr $I10, rxcap_1001_fail
    rx996_cur."!mark_push"(0, rx996_pos, $I10)
  # rx literal  "~"
    add $I11, rx996_pos, 1
    gt $I11, rx996_eos, rx996_fail
    sub $I11, rx996_pos, rx996_off
    substr $S10, rx996_tgt, $I11, 1
    ne $S10, "~", rx996_fail
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
    $P10 = rx996_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx996_fail
    rx996_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx996_pos = $P10."pos"()
  # rx pass
    rx996_cur."!cursor_pass"(rx996_pos, "infix:sym<~>")
    rx996_cur."!cursor_debug"("PASS  ", "infix:sym<~>", " at pos=", rx996_pos)
    .return (rx996_cur)
  rx996_fail:
.annotate "line", 381
    (rx996_rep, rx996_pos, $I10, $P10) = rx996_cur."!mark_fail"(0)
    lt rx996_pos, -1, rx996_done
    eq rx996_pos, -1, rx996_fail
    jump $I10
  rx996_done:
    rx996_cur."!cursor_fail"()
    rx996_cur."!cursor_debug"("FAIL  ", "infix:sym<~>")
    .return (rx996_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("252_1258904213.70809") :method
.annotate "line", 381
    $P998 = self."!PREFIX__!subrule"("O", "~")
    new $P999, "ResizablePMCArray"
    push $P999, $P998
    .return ($P999)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("253_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1003_tgt
    .local int rx1003_pos
    .local int rx1003_off
    .local int rx1003_eos
    .local int rx1003_rep
    .local pmc rx1003_cur
    (rx1003_cur, rx1003_pos, rx1003_tgt, $I10) = self."!cursor_start"()
    rx1003_cur."!cursor_debug"("START ", "infix:sym<==>")
    .lex unicode:"$\x{a2}", rx1003_cur
    .local pmc match
    .lex "$/", match
    length rx1003_eos, rx1003_tgt
    set rx1003_off, 0
    lt $I10, 2, rx1003_start
    sub rx1003_off, $I10, 1
    substr rx1003_tgt, rx1003_tgt, rx1003_off
  rx1003_start:
    ge rx1003_pos, 0, rxscan1007_done
  rxscan1007_loop:
    ($P10) = rx1003_cur."from"()
    inc $P10
    set rx1003_pos, $P10
    ge rx1003_pos, rx1003_eos, rxscan1007_done
    set_addr $I10, rxscan1007_loop
    rx1003_cur."!mark_push"(0, rx1003_pos, $I10)
  rxscan1007_done:
.annotate "line", 450
  # rx subcapture "sym"
    set_addr $I10, rxcap_1008_fail
    rx1003_cur."!mark_push"(0, rx1003_pos, $I10)
  # rx literal  "=="
    add $I11, rx1003_pos, 2
    gt $I11, rx1003_eos, rx1003_fail
    sub $I11, rx1003_pos, rx1003_off
    substr $S10, rx1003_tgt, $I11, 2
    ne $S10, "==", rx1003_fail
    add rx1003_pos, 2
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
    $P10 = rx1003_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx1003_fail
    rx1003_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1003_pos = $P10."pos"()
  # rx pass
    rx1003_cur."!cursor_pass"(rx1003_pos, "infix:sym<==>")
    rx1003_cur."!cursor_debug"("PASS  ", "infix:sym<==>", " at pos=", rx1003_pos)
    .return (rx1003_cur)
  rx1003_fail:
.annotate "line", 381
    (rx1003_rep, rx1003_pos, $I10, $P10) = rx1003_cur."!mark_fail"(0)
    lt rx1003_pos, -1, rx1003_done
    eq rx1003_pos, -1, rx1003_fail
    jump $I10
  rx1003_done:
    rx1003_cur."!cursor_fail"()
    rx1003_cur."!cursor_debug"("FAIL  ", "infix:sym<==>")
    .return (rx1003_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("254_1258904213.70809") :method
.annotate "line", 381
    $P1005 = self."!PREFIX__!subrule"("O", "==")
    new $P1006, "ResizablePMCArray"
    push $P1006, $P1005
    .return ($P1006)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("255_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1010_tgt
    .local int rx1010_pos
    .local int rx1010_off
    .local int rx1010_eos
    .local int rx1010_rep
    .local pmc rx1010_cur
    (rx1010_cur, rx1010_pos, rx1010_tgt, $I10) = self."!cursor_start"()
    rx1010_cur."!cursor_debug"("START ", "infix:sym<!=>")
    .lex unicode:"$\x{a2}", rx1010_cur
    .local pmc match
    .lex "$/", match
    length rx1010_eos, rx1010_tgt
    set rx1010_off, 0
    lt $I10, 2, rx1010_start
    sub rx1010_off, $I10, 1
    substr rx1010_tgt, rx1010_tgt, rx1010_off
  rx1010_start:
    ge rx1010_pos, 0, rxscan1014_done
  rxscan1014_loop:
    ($P10) = rx1010_cur."from"()
    inc $P10
    set rx1010_pos, $P10
    ge rx1010_pos, rx1010_eos, rxscan1014_done
    set_addr $I10, rxscan1014_loop
    rx1010_cur."!mark_push"(0, rx1010_pos, $I10)
  rxscan1014_done:
.annotate "line", 451
  # rx subcapture "sym"
    set_addr $I10, rxcap_1015_fail
    rx1010_cur."!mark_push"(0, rx1010_pos, $I10)
  # rx literal  "!="
    add $I11, rx1010_pos, 2
    gt $I11, rx1010_eos, rx1010_fail
    sub $I11, rx1010_pos, rx1010_off
    substr $S10, rx1010_tgt, $I11, 2
    ne $S10, "!=", rx1010_fail
    add rx1010_pos, 2
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
    $P10 = rx1010_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx1010_fail
    rx1010_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1010_pos = $P10."pos"()
  # rx pass
    rx1010_cur."!cursor_pass"(rx1010_pos, "infix:sym<!=>")
    rx1010_cur."!cursor_debug"("PASS  ", "infix:sym<!=>", " at pos=", rx1010_pos)
    .return (rx1010_cur)
  rx1010_fail:
.annotate "line", 381
    (rx1010_rep, rx1010_pos, $I10, $P10) = rx1010_cur."!mark_fail"(0)
    lt rx1010_pos, -1, rx1010_done
    eq rx1010_pos, -1, rx1010_fail
    jump $I10
  rx1010_done:
    rx1010_cur."!cursor_fail"()
    rx1010_cur."!cursor_debug"("FAIL  ", "infix:sym<!=>")
    .return (rx1010_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("256_1258904213.70809") :method
.annotate "line", 381
    $P1012 = self."!PREFIX__!subrule"("O", "!=")
    new $P1013, "ResizablePMCArray"
    push $P1013, $P1012
    .return ($P1013)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("257_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1017_tgt
    .local int rx1017_pos
    .local int rx1017_off
    .local int rx1017_eos
    .local int rx1017_rep
    .local pmc rx1017_cur
    (rx1017_cur, rx1017_pos, rx1017_tgt, $I10) = self."!cursor_start"()
    rx1017_cur."!cursor_debug"("START ", "infix:sym<<=>")
    .lex unicode:"$\x{a2}", rx1017_cur
    .local pmc match
    .lex "$/", match
    length rx1017_eos, rx1017_tgt
    set rx1017_off, 0
    lt $I10, 2, rx1017_start
    sub rx1017_off, $I10, 1
    substr rx1017_tgt, rx1017_tgt, rx1017_off
  rx1017_start:
    ge rx1017_pos, 0, rxscan1021_done
  rxscan1021_loop:
    ($P10) = rx1017_cur."from"()
    inc $P10
    set rx1017_pos, $P10
    ge rx1017_pos, rx1017_eos, rxscan1021_done
    set_addr $I10, rxscan1021_loop
    rx1017_cur."!mark_push"(0, rx1017_pos, $I10)
  rxscan1021_done:
.annotate "line", 452
  # rx subcapture "sym"
    set_addr $I10, rxcap_1022_fail
    rx1017_cur."!mark_push"(0, rx1017_pos, $I10)
  # rx literal  "<="
    add $I11, rx1017_pos, 2
    gt $I11, rx1017_eos, rx1017_fail
    sub $I11, rx1017_pos, rx1017_off
    substr $S10, rx1017_tgt, $I11, 2
    ne $S10, "<=", rx1017_fail
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
    $P10 = rx1017_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx1017_fail
    rx1017_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1017_pos = $P10."pos"()
  # rx pass
    rx1017_cur."!cursor_pass"(rx1017_pos, "infix:sym<<=>")
    rx1017_cur."!cursor_debug"("PASS  ", "infix:sym<<=>", " at pos=", rx1017_pos)
    .return (rx1017_cur)
  rx1017_fail:
.annotate "line", 381
    (rx1017_rep, rx1017_pos, $I10, $P10) = rx1017_cur."!mark_fail"(0)
    lt rx1017_pos, -1, rx1017_done
    eq rx1017_pos, -1, rx1017_fail
    jump $I10
  rx1017_done:
    rx1017_cur."!cursor_fail"()
    rx1017_cur."!cursor_debug"("FAIL  ", "infix:sym<<=>")
    .return (rx1017_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("258_1258904213.70809") :method
.annotate "line", 381
    $P1019 = self."!PREFIX__!subrule"("O", "<=")
    new $P1020, "ResizablePMCArray"
    push $P1020, $P1019
    .return ($P1020)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("259_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1024_tgt
    .local int rx1024_pos
    .local int rx1024_off
    .local int rx1024_eos
    .local int rx1024_rep
    .local pmc rx1024_cur
    (rx1024_cur, rx1024_pos, rx1024_tgt, $I10) = self."!cursor_start"()
    rx1024_cur."!cursor_debug"("START ", "infix:sym<>=>")
    .lex unicode:"$\x{a2}", rx1024_cur
    .local pmc match
    .lex "$/", match
    length rx1024_eos, rx1024_tgt
    set rx1024_off, 0
    lt $I10, 2, rx1024_start
    sub rx1024_off, $I10, 1
    substr rx1024_tgt, rx1024_tgt, rx1024_off
  rx1024_start:
    ge rx1024_pos, 0, rxscan1028_done
  rxscan1028_loop:
    ($P10) = rx1024_cur."from"()
    inc $P10
    set rx1024_pos, $P10
    ge rx1024_pos, rx1024_eos, rxscan1028_done
    set_addr $I10, rxscan1028_loop
    rx1024_cur."!mark_push"(0, rx1024_pos, $I10)
  rxscan1028_done:
.annotate "line", 453
  # rx subcapture "sym"
    set_addr $I10, rxcap_1029_fail
    rx1024_cur."!mark_push"(0, rx1024_pos, $I10)
  # rx literal  ">="
    add $I11, rx1024_pos, 2
    gt $I11, rx1024_eos, rx1024_fail
    sub $I11, rx1024_pos, rx1024_off
    substr $S10, rx1024_tgt, $I11, 2
    ne $S10, ">=", rx1024_fail
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
    $P10 = rx1024_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx1024_fail
    rx1024_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1024_pos = $P10."pos"()
  # rx pass
    rx1024_cur."!cursor_pass"(rx1024_pos, "infix:sym<>=>")
    rx1024_cur."!cursor_debug"("PASS  ", "infix:sym<>=>", " at pos=", rx1024_pos)
    .return (rx1024_cur)
  rx1024_fail:
.annotate "line", 381
    (rx1024_rep, rx1024_pos, $I10, $P10) = rx1024_cur."!mark_fail"(0)
    lt rx1024_pos, -1, rx1024_done
    eq rx1024_pos, -1, rx1024_fail
    jump $I10
  rx1024_done:
    rx1024_cur."!cursor_fail"()
    rx1024_cur."!cursor_debug"("FAIL  ", "infix:sym<>=>")
    .return (rx1024_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("260_1258904213.70809") :method
.annotate "line", 381
    $P1026 = self."!PREFIX__!subrule"("O", ">=")
    new $P1027, "ResizablePMCArray"
    push $P1027, $P1026
    .return ($P1027)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("261_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1031_tgt
    .local int rx1031_pos
    .local int rx1031_off
    .local int rx1031_eos
    .local int rx1031_rep
    .local pmc rx1031_cur
    (rx1031_cur, rx1031_pos, rx1031_tgt, $I10) = self."!cursor_start"()
    rx1031_cur."!cursor_debug"("START ", "infix:sym<<>")
    .lex unicode:"$\x{a2}", rx1031_cur
    .local pmc match
    .lex "$/", match
    length rx1031_eos, rx1031_tgt
    set rx1031_off, 0
    lt $I10, 2, rx1031_start
    sub rx1031_off, $I10, 1
    substr rx1031_tgt, rx1031_tgt, rx1031_off
  rx1031_start:
    ge rx1031_pos, 0, rxscan1035_done
  rxscan1035_loop:
    ($P10) = rx1031_cur."from"()
    inc $P10
    set rx1031_pos, $P10
    ge rx1031_pos, rx1031_eos, rxscan1035_done
    set_addr $I10, rxscan1035_loop
    rx1031_cur."!mark_push"(0, rx1031_pos, $I10)
  rxscan1035_done:
.annotate "line", 454
  # rx subcapture "sym"
    set_addr $I10, rxcap_1036_fail
    rx1031_cur."!mark_push"(0, rx1031_pos, $I10)
  # rx literal  "<"
    add $I11, rx1031_pos, 1
    gt $I11, rx1031_eos, rx1031_fail
    sub $I11, rx1031_pos, rx1031_off
    substr $S10, rx1031_tgt, $I11, 1
    ne $S10, "<", rx1031_fail
    add rx1031_pos, 1
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
    $P10 = rx1031_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx1031_fail
    rx1031_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1031_pos = $P10."pos"()
  # rx pass
    rx1031_cur."!cursor_pass"(rx1031_pos, "infix:sym<<>")
    rx1031_cur."!cursor_debug"("PASS  ", "infix:sym<<>", " at pos=", rx1031_pos)
    .return (rx1031_cur)
  rx1031_fail:
.annotate "line", 381
    (rx1031_rep, rx1031_pos, $I10, $P10) = rx1031_cur."!mark_fail"(0)
    lt rx1031_pos, -1, rx1031_done
    eq rx1031_pos, -1, rx1031_fail
    jump $I10
  rx1031_done:
    rx1031_cur."!cursor_fail"()
    rx1031_cur."!cursor_debug"("FAIL  ", "infix:sym<<>")
    .return (rx1031_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("262_1258904213.70809") :method
.annotate "line", 381
    $P1033 = self."!PREFIX__!subrule"("O", "<")
    new $P1034, "ResizablePMCArray"
    push $P1034, $P1033
    .return ($P1034)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("263_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1038_tgt
    .local int rx1038_pos
    .local int rx1038_off
    .local int rx1038_eos
    .local int rx1038_rep
    .local pmc rx1038_cur
    (rx1038_cur, rx1038_pos, rx1038_tgt, $I10) = self."!cursor_start"()
    rx1038_cur."!cursor_debug"("START ", "infix:sym<>>")
    .lex unicode:"$\x{a2}", rx1038_cur
    .local pmc match
    .lex "$/", match
    length rx1038_eos, rx1038_tgt
    set rx1038_off, 0
    lt $I10, 2, rx1038_start
    sub rx1038_off, $I10, 1
    substr rx1038_tgt, rx1038_tgt, rx1038_off
  rx1038_start:
    ge rx1038_pos, 0, rxscan1042_done
  rxscan1042_loop:
    ($P10) = rx1038_cur."from"()
    inc $P10
    set rx1038_pos, $P10
    ge rx1038_pos, rx1038_eos, rxscan1042_done
    set_addr $I10, rxscan1042_loop
    rx1038_cur."!mark_push"(0, rx1038_pos, $I10)
  rxscan1042_done:
.annotate "line", 455
  # rx subcapture "sym"
    set_addr $I10, rxcap_1043_fail
    rx1038_cur."!mark_push"(0, rx1038_pos, $I10)
  # rx literal  ">"
    add $I11, rx1038_pos, 1
    gt $I11, rx1038_eos, rx1038_fail
    sub $I11, rx1038_pos, rx1038_off
    substr $S10, rx1038_tgt, $I11, 1
    ne $S10, ">", rx1038_fail
    add rx1038_pos, 1
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
    $P10 = rx1038_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx1038_fail
    rx1038_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1038_pos = $P10."pos"()
  # rx pass
    rx1038_cur."!cursor_pass"(rx1038_pos, "infix:sym<>>")
    rx1038_cur."!cursor_debug"("PASS  ", "infix:sym<>>", " at pos=", rx1038_pos)
    .return (rx1038_cur)
  rx1038_fail:
.annotate "line", 381
    (rx1038_rep, rx1038_pos, $I10, $P10) = rx1038_cur."!mark_fail"(0)
    lt rx1038_pos, -1, rx1038_done
    eq rx1038_pos, -1, rx1038_fail
    jump $I10
  rx1038_done:
    rx1038_cur."!cursor_fail"()
    rx1038_cur."!cursor_debug"("FAIL  ", "infix:sym<>>")
    .return (rx1038_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("264_1258904213.70809") :method
.annotate "line", 381
    $P1040 = self."!PREFIX__!subrule"("O", ">")
    new $P1041, "ResizablePMCArray"
    push $P1041, $P1040
    .return ($P1041)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("265_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1045_tgt
    .local int rx1045_pos
    .local int rx1045_off
    .local int rx1045_eos
    .local int rx1045_rep
    .local pmc rx1045_cur
    (rx1045_cur, rx1045_pos, rx1045_tgt, $I10) = self."!cursor_start"()
    rx1045_cur."!cursor_debug"("START ", "infix:sym<eq>")
    .lex unicode:"$\x{a2}", rx1045_cur
    .local pmc match
    .lex "$/", match
    length rx1045_eos, rx1045_tgt
    set rx1045_off, 0
    lt $I10, 2, rx1045_start
    sub rx1045_off, $I10, 1
    substr rx1045_tgt, rx1045_tgt, rx1045_off
  rx1045_start:
    ge rx1045_pos, 0, rxscan1049_done
  rxscan1049_loop:
    ($P10) = rx1045_cur."from"()
    inc $P10
    set rx1045_pos, $P10
    ge rx1045_pos, rx1045_eos, rxscan1049_done
    set_addr $I10, rxscan1049_loop
    rx1045_cur."!mark_push"(0, rx1045_pos, $I10)
  rxscan1049_done:
.annotate "line", 456
  # rx subcapture "sym"
    set_addr $I10, rxcap_1050_fail
    rx1045_cur."!mark_push"(0, rx1045_pos, $I10)
  # rx literal  "eq"
    add $I11, rx1045_pos, 2
    gt $I11, rx1045_eos, rx1045_fail
    sub $I11, rx1045_pos, rx1045_off
    substr $S10, rx1045_tgt, $I11, 2
    ne $S10, "eq", rx1045_fail
    add rx1045_pos, 2
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
    $P10 = rx1045_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx1045_fail
    rx1045_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1045_pos = $P10."pos"()
  # rx pass
    rx1045_cur."!cursor_pass"(rx1045_pos, "infix:sym<eq>")
    rx1045_cur."!cursor_debug"("PASS  ", "infix:sym<eq>", " at pos=", rx1045_pos)
    .return (rx1045_cur)
  rx1045_fail:
.annotate "line", 381
    (rx1045_rep, rx1045_pos, $I10, $P10) = rx1045_cur."!mark_fail"(0)
    lt rx1045_pos, -1, rx1045_done
    eq rx1045_pos, -1, rx1045_fail
    jump $I10
  rx1045_done:
    rx1045_cur."!cursor_fail"()
    rx1045_cur."!cursor_debug"("FAIL  ", "infix:sym<eq>")
    .return (rx1045_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("266_1258904213.70809") :method
.annotate "line", 381
    $P1047 = self."!PREFIX__!subrule"("O", "eq")
    new $P1048, "ResizablePMCArray"
    push $P1048, $P1047
    .return ($P1048)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("267_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1052_tgt
    .local int rx1052_pos
    .local int rx1052_off
    .local int rx1052_eos
    .local int rx1052_rep
    .local pmc rx1052_cur
    (rx1052_cur, rx1052_pos, rx1052_tgt, $I10) = self."!cursor_start"()
    rx1052_cur."!cursor_debug"("START ", "infix:sym<ne>")
    .lex unicode:"$\x{a2}", rx1052_cur
    .local pmc match
    .lex "$/", match
    length rx1052_eos, rx1052_tgt
    set rx1052_off, 0
    lt $I10, 2, rx1052_start
    sub rx1052_off, $I10, 1
    substr rx1052_tgt, rx1052_tgt, rx1052_off
  rx1052_start:
    ge rx1052_pos, 0, rxscan1056_done
  rxscan1056_loop:
    ($P10) = rx1052_cur."from"()
    inc $P10
    set rx1052_pos, $P10
    ge rx1052_pos, rx1052_eos, rxscan1056_done
    set_addr $I10, rxscan1056_loop
    rx1052_cur."!mark_push"(0, rx1052_pos, $I10)
  rxscan1056_done:
.annotate "line", 457
  # rx subcapture "sym"
    set_addr $I10, rxcap_1057_fail
    rx1052_cur."!mark_push"(0, rx1052_pos, $I10)
  # rx literal  "ne"
    add $I11, rx1052_pos, 2
    gt $I11, rx1052_eos, rx1052_fail
    sub $I11, rx1052_pos, rx1052_off
    substr $S10, rx1052_tgt, $I11, 2
    ne $S10, "ne", rx1052_fail
    add rx1052_pos, 2
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
    $P10 = rx1052_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx1052_fail
    rx1052_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1052_pos = $P10."pos"()
  # rx pass
    rx1052_cur."!cursor_pass"(rx1052_pos, "infix:sym<ne>")
    rx1052_cur."!cursor_debug"("PASS  ", "infix:sym<ne>", " at pos=", rx1052_pos)
    .return (rx1052_cur)
  rx1052_fail:
.annotate "line", 381
    (rx1052_rep, rx1052_pos, $I10, $P10) = rx1052_cur."!mark_fail"(0)
    lt rx1052_pos, -1, rx1052_done
    eq rx1052_pos, -1, rx1052_fail
    jump $I10
  rx1052_done:
    rx1052_cur."!cursor_fail"()
    rx1052_cur."!cursor_debug"("FAIL  ", "infix:sym<ne>")
    .return (rx1052_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("268_1258904213.70809") :method
.annotate "line", 381
    $P1054 = self."!PREFIX__!subrule"("O", "ne")
    new $P1055, "ResizablePMCArray"
    push $P1055, $P1054
    .return ($P1055)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("269_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1059_tgt
    .local int rx1059_pos
    .local int rx1059_off
    .local int rx1059_eos
    .local int rx1059_rep
    .local pmc rx1059_cur
    (rx1059_cur, rx1059_pos, rx1059_tgt, $I10) = self."!cursor_start"()
    rx1059_cur."!cursor_debug"("START ", "infix:sym<le>")
    .lex unicode:"$\x{a2}", rx1059_cur
    .local pmc match
    .lex "$/", match
    length rx1059_eos, rx1059_tgt
    set rx1059_off, 0
    lt $I10, 2, rx1059_start
    sub rx1059_off, $I10, 1
    substr rx1059_tgt, rx1059_tgt, rx1059_off
  rx1059_start:
    ge rx1059_pos, 0, rxscan1063_done
  rxscan1063_loop:
    ($P10) = rx1059_cur."from"()
    inc $P10
    set rx1059_pos, $P10
    ge rx1059_pos, rx1059_eos, rxscan1063_done
    set_addr $I10, rxscan1063_loop
    rx1059_cur."!mark_push"(0, rx1059_pos, $I10)
  rxscan1063_done:
.annotate "line", 458
  # rx subcapture "sym"
    set_addr $I10, rxcap_1064_fail
    rx1059_cur."!mark_push"(0, rx1059_pos, $I10)
  # rx literal  "le"
    add $I11, rx1059_pos, 2
    gt $I11, rx1059_eos, rx1059_fail
    sub $I11, rx1059_pos, rx1059_off
    substr $S10, rx1059_tgt, $I11, 2
    ne $S10, "le", rx1059_fail
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
    $P10 = rx1059_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx1059_fail
    rx1059_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1059_pos = $P10."pos"()
  # rx pass
    rx1059_cur."!cursor_pass"(rx1059_pos, "infix:sym<le>")
    rx1059_cur."!cursor_debug"("PASS  ", "infix:sym<le>", " at pos=", rx1059_pos)
    .return (rx1059_cur)
  rx1059_fail:
.annotate "line", 381
    (rx1059_rep, rx1059_pos, $I10, $P10) = rx1059_cur."!mark_fail"(0)
    lt rx1059_pos, -1, rx1059_done
    eq rx1059_pos, -1, rx1059_fail
    jump $I10
  rx1059_done:
    rx1059_cur."!cursor_fail"()
    rx1059_cur."!cursor_debug"("FAIL  ", "infix:sym<le>")
    .return (rx1059_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("270_1258904213.70809") :method
.annotate "line", 381
    $P1061 = self."!PREFIX__!subrule"("O", "le")
    new $P1062, "ResizablePMCArray"
    push $P1062, $P1061
    .return ($P1062)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("271_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1066_tgt
    .local int rx1066_pos
    .local int rx1066_off
    .local int rx1066_eos
    .local int rx1066_rep
    .local pmc rx1066_cur
    (rx1066_cur, rx1066_pos, rx1066_tgt, $I10) = self."!cursor_start"()
    rx1066_cur."!cursor_debug"("START ", "infix:sym<ge>")
    .lex unicode:"$\x{a2}", rx1066_cur
    .local pmc match
    .lex "$/", match
    length rx1066_eos, rx1066_tgt
    set rx1066_off, 0
    lt $I10, 2, rx1066_start
    sub rx1066_off, $I10, 1
    substr rx1066_tgt, rx1066_tgt, rx1066_off
  rx1066_start:
    ge rx1066_pos, 0, rxscan1070_done
  rxscan1070_loop:
    ($P10) = rx1066_cur."from"()
    inc $P10
    set rx1066_pos, $P10
    ge rx1066_pos, rx1066_eos, rxscan1070_done
    set_addr $I10, rxscan1070_loop
    rx1066_cur."!mark_push"(0, rx1066_pos, $I10)
  rxscan1070_done:
.annotate "line", 459
  # rx subcapture "sym"
    set_addr $I10, rxcap_1071_fail
    rx1066_cur."!mark_push"(0, rx1066_pos, $I10)
  # rx literal  "ge"
    add $I11, rx1066_pos, 2
    gt $I11, rx1066_eos, rx1066_fail
    sub $I11, rx1066_pos, rx1066_off
    substr $S10, rx1066_tgt, $I11, 2
    ne $S10, "ge", rx1066_fail
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
    $P10 = rx1066_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx1066_fail
    rx1066_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1066_pos = $P10."pos"()
  # rx pass
    rx1066_cur."!cursor_pass"(rx1066_pos, "infix:sym<ge>")
    rx1066_cur."!cursor_debug"("PASS  ", "infix:sym<ge>", " at pos=", rx1066_pos)
    .return (rx1066_cur)
  rx1066_fail:
.annotate "line", 381
    (rx1066_rep, rx1066_pos, $I10, $P10) = rx1066_cur."!mark_fail"(0)
    lt rx1066_pos, -1, rx1066_done
    eq rx1066_pos, -1, rx1066_fail
    jump $I10
  rx1066_done:
    rx1066_cur."!cursor_fail"()
    rx1066_cur."!cursor_debug"("FAIL  ", "infix:sym<ge>")
    .return (rx1066_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("272_1258904213.70809") :method
.annotate "line", 381
    $P1068 = self."!PREFIX__!subrule"("O", "ge")
    new $P1069, "ResizablePMCArray"
    push $P1069, $P1068
    .return ($P1069)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("273_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1073_tgt
    .local int rx1073_pos
    .local int rx1073_off
    .local int rx1073_eos
    .local int rx1073_rep
    .local pmc rx1073_cur
    (rx1073_cur, rx1073_pos, rx1073_tgt, $I10) = self."!cursor_start"()
    rx1073_cur."!cursor_debug"("START ", "infix:sym<lt>")
    .lex unicode:"$\x{a2}", rx1073_cur
    .local pmc match
    .lex "$/", match
    length rx1073_eos, rx1073_tgt
    set rx1073_off, 0
    lt $I10, 2, rx1073_start
    sub rx1073_off, $I10, 1
    substr rx1073_tgt, rx1073_tgt, rx1073_off
  rx1073_start:
    ge rx1073_pos, 0, rxscan1077_done
  rxscan1077_loop:
    ($P10) = rx1073_cur."from"()
    inc $P10
    set rx1073_pos, $P10
    ge rx1073_pos, rx1073_eos, rxscan1077_done
    set_addr $I10, rxscan1077_loop
    rx1073_cur."!mark_push"(0, rx1073_pos, $I10)
  rxscan1077_done:
.annotate "line", 460
  # rx subcapture "sym"
    set_addr $I10, rxcap_1078_fail
    rx1073_cur."!mark_push"(0, rx1073_pos, $I10)
  # rx literal  "lt"
    add $I11, rx1073_pos, 2
    gt $I11, rx1073_eos, rx1073_fail
    sub $I11, rx1073_pos, rx1073_off
    substr $S10, rx1073_tgt, $I11, 2
    ne $S10, "lt", rx1073_fail
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
    $P10 = rx1073_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx1073_fail
    rx1073_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1073_pos = $P10."pos"()
  # rx pass
    rx1073_cur."!cursor_pass"(rx1073_pos, "infix:sym<lt>")
    rx1073_cur."!cursor_debug"("PASS  ", "infix:sym<lt>", " at pos=", rx1073_pos)
    .return (rx1073_cur)
  rx1073_fail:
.annotate "line", 381
    (rx1073_rep, rx1073_pos, $I10, $P10) = rx1073_cur."!mark_fail"(0)
    lt rx1073_pos, -1, rx1073_done
    eq rx1073_pos, -1, rx1073_fail
    jump $I10
  rx1073_done:
    rx1073_cur."!cursor_fail"()
    rx1073_cur."!cursor_debug"("FAIL  ", "infix:sym<lt>")
    .return (rx1073_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("274_1258904213.70809") :method
.annotate "line", 381
    $P1075 = self."!PREFIX__!subrule"("O", "lt")
    new $P1076, "ResizablePMCArray"
    push $P1076, $P1075
    .return ($P1076)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("275_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1080_tgt
    .local int rx1080_pos
    .local int rx1080_off
    .local int rx1080_eos
    .local int rx1080_rep
    .local pmc rx1080_cur
    (rx1080_cur, rx1080_pos, rx1080_tgt, $I10) = self."!cursor_start"()
    rx1080_cur."!cursor_debug"("START ", "infix:sym<gt>")
    .lex unicode:"$\x{a2}", rx1080_cur
    .local pmc match
    .lex "$/", match
    length rx1080_eos, rx1080_tgt
    set rx1080_off, 0
    lt $I10, 2, rx1080_start
    sub rx1080_off, $I10, 1
    substr rx1080_tgt, rx1080_tgt, rx1080_off
  rx1080_start:
    ge rx1080_pos, 0, rxscan1084_done
  rxscan1084_loop:
    ($P10) = rx1080_cur."from"()
    inc $P10
    set rx1080_pos, $P10
    ge rx1080_pos, rx1080_eos, rxscan1084_done
    set_addr $I10, rxscan1084_loop
    rx1080_cur."!mark_push"(0, rx1080_pos, $I10)
  rxscan1084_done:
.annotate "line", 461
  # rx subcapture "sym"
    set_addr $I10, rxcap_1085_fail
    rx1080_cur."!mark_push"(0, rx1080_pos, $I10)
  # rx literal  "gt"
    add $I11, rx1080_pos, 2
    gt $I11, rx1080_eos, rx1080_fail
    sub $I11, rx1080_pos, rx1080_off
    substr $S10, rx1080_tgt, $I11, 2
    ne $S10, "gt", rx1080_fail
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
    $P10 = rx1080_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx1080_fail
    rx1080_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1080_pos = $P10."pos"()
  # rx pass
    rx1080_cur."!cursor_pass"(rx1080_pos, "infix:sym<gt>")
    rx1080_cur."!cursor_debug"("PASS  ", "infix:sym<gt>", " at pos=", rx1080_pos)
    .return (rx1080_cur)
  rx1080_fail:
.annotate "line", 381
    (rx1080_rep, rx1080_pos, $I10, $P10) = rx1080_cur."!mark_fail"(0)
    lt rx1080_pos, -1, rx1080_done
    eq rx1080_pos, -1, rx1080_fail
    jump $I10
  rx1080_done:
    rx1080_cur."!cursor_fail"()
    rx1080_cur."!cursor_debug"("FAIL  ", "infix:sym<gt>")
    .return (rx1080_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("276_1258904213.70809") :method
.annotate "line", 381
    $P1082 = self."!PREFIX__!subrule"("O", "gt")
    new $P1083, "ResizablePMCArray"
    push $P1083, $P1082
    .return ($P1083)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("277_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1087_tgt
    .local int rx1087_pos
    .local int rx1087_off
    .local int rx1087_eos
    .local int rx1087_rep
    .local pmc rx1087_cur
    (rx1087_cur, rx1087_pos, rx1087_tgt, $I10) = self."!cursor_start"()
    rx1087_cur."!cursor_debug"("START ", "infix:sym<=:=>")
    .lex unicode:"$\x{a2}", rx1087_cur
    .local pmc match
    .lex "$/", match
    length rx1087_eos, rx1087_tgt
    set rx1087_off, 0
    lt $I10, 2, rx1087_start
    sub rx1087_off, $I10, 1
    substr rx1087_tgt, rx1087_tgt, rx1087_off
  rx1087_start:
    ge rx1087_pos, 0, rxscan1091_done
  rxscan1091_loop:
    ($P10) = rx1087_cur."from"()
    inc $P10
    set rx1087_pos, $P10
    ge rx1087_pos, rx1087_eos, rxscan1091_done
    set_addr $I10, rxscan1091_loop
    rx1087_cur."!mark_push"(0, rx1087_pos, $I10)
  rxscan1091_done:
.annotate "line", 462
  # rx subcapture "sym"
    set_addr $I10, rxcap_1092_fail
    rx1087_cur."!mark_push"(0, rx1087_pos, $I10)
  # rx literal  "=:="
    add $I11, rx1087_pos, 3
    gt $I11, rx1087_eos, rx1087_fail
    sub $I11, rx1087_pos, rx1087_off
    substr $S10, rx1087_tgt, $I11, 3
    ne $S10, "=:=", rx1087_fail
    add rx1087_pos, 3
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
    $P10 = rx1087_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx1087_fail
    rx1087_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1087_pos = $P10."pos"()
  # rx pass
    rx1087_cur."!cursor_pass"(rx1087_pos, "infix:sym<=:=>")
    rx1087_cur."!cursor_debug"("PASS  ", "infix:sym<=:=>", " at pos=", rx1087_pos)
    .return (rx1087_cur)
  rx1087_fail:
.annotate "line", 381
    (rx1087_rep, rx1087_pos, $I10, $P10) = rx1087_cur."!mark_fail"(0)
    lt rx1087_pos, -1, rx1087_done
    eq rx1087_pos, -1, rx1087_fail
    jump $I10
  rx1087_done:
    rx1087_cur."!cursor_fail"()
    rx1087_cur."!cursor_debug"("FAIL  ", "infix:sym<=:=>")
    .return (rx1087_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("278_1258904213.70809") :method
.annotate "line", 381
    $P1089 = self."!PREFIX__!subrule"("O", "=:=")
    new $P1090, "ResizablePMCArray"
    push $P1090, $P1089
    .return ($P1090)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("279_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1094_tgt
    .local int rx1094_pos
    .local int rx1094_off
    .local int rx1094_eos
    .local int rx1094_rep
    .local pmc rx1094_cur
    (rx1094_cur, rx1094_pos, rx1094_tgt, $I10) = self."!cursor_start"()
    rx1094_cur."!cursor_debug"("START ", "infix:sym<&&>")
    .lex unicode:"$\x{a2}", rx1094_cur
    .local pmc match
    .lex "$/", match
    length rx1094_eos, rx1094_tgt
    set rx1094_off, 0
    lt $I10, 2, rx1094_start
    sub rx1094_off, $I10, 1
    substr rx1094_tgt, rx1094_tgt, rx1094_off
  rx1094_start:
    ge rx1094_pos, 0, rxscan1098_done
  rxscan1098_loop:
    ($P10) = rx1094_cur."from"()
    inc $P10
    set rx1094_pos, $P10
    ge rx1094_pos, rx1094_eos, rxscan1098_done
    set_addr $I10, rxscan1098_loop
    rx1094_cur."!mark_push"(0, rx1094_pos, $I10)
  rxscan1098_done:
.annotate "line", 464
  # rx subcapture "sym"
    set_addr $I10, rxcap_1099_fail
    rx1094_cur."!mark_push"(0, rx1094_pos, $I10)
  # rx literal  "&&"
    add $I11, rx1094_pos, 2
    gt $I11, rx1094_eos, rx1094_fail
    sub $I11, rx1094_pos, rx1094_off
    substr $S10, rx1094_tgt, $I11, 2
    ne $S10, "&&", rx1094_fail
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
    $P10 = rx1094_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx1094_fail
    rx1094_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1094_pos = $P10."pos"()
  # rx pass
    rx1094_cur."!cursor_pass"(rx1094_pos, "infix:sym<&&>")
    rx1094_cur."!cursor_debug"("PASS  ", "infix:sym<&&>", " at pos=", rx1094_pos)
    .return (rx1094_cur)
  rx1094_fail:
.annotate "line", 381
    (rx1094_rep, rx1094_pos, $I10, $P10) = rx1094_cur."!mark_fail"(0)
    lt rx1094_pos, -1, rx1094_done
    eq rx1094_pos, -1, rx1094_fail
    jump $I10
  rx1094_done:
    rx1094_cur."!cursor_fail"()
    rx1094_cur."!cursor_debug"("FAIL  ", "infix:sym<&&>")
    .return (rx1094_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("280_1258904213.70809") :method
.annotate "line", 381
    $P1096 = self."!PREFIX__!subrule"("O", "&&")
    new $P1097, "ResizablePMCArray"
    push $P1097, $P1096
    .return ($P1097)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("281_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1101_tgt
    .local int rx1101_pos
    .local int rx1101_off
    .local int rx1101_eos
    .local int rx1101_rep
    .local pmc rx1101_cur
    (rx1101_cur, rx1101_pos, rx1101_tgt, $I10) = self."!cursor_start"()
    rx1101_cur."!cursor_debug"("START ", "infix:sym<||>")
    .lex unicode:"$\x{a2}", rx1101_cur
    .local pmc match
    .lex "$/", match
    length rx1101_eos, rx1101_tgt
    set rx1101_off, 0
    lt $I10, 2, rx1101_start
    sub rx1101_off, $I10, 1
    substr rx1101_tgt, rx1101_tgt, rx1101_off
  rx1101_start:
    ge rx1101_pos, 0, rxscan1105_done
  rxscan1105_loop:
    ($P10) = rx1101_cur."from"()
    inc $P10
    set rx1101_pos, $P10
    ge rx1101_pos, rx1101_eos, rxscan1105_done
    set_addr $I10, rxscan1105_loop
    rx1101_cur."!mark_push"(0, rx1101_pos, $I10)
  rxscan1105_done:
.annotate "line", 466
  # rx subcapture "sym"
    set_addr $I10, rxcap_1106_fail
    rx1101_cur."!mark_push"(0, rx1101_pos, $I10)
  # rx literal  "||"
    add $I11, rx1101_pos, 2
    gt $I11, rx1101_eos, rx1101_fail
    sub $I11, rx1101_pos, rx1101_off
    substr $S10, rx1101_tgt, $I11, 2
    ne $S10, "||", rx1101_fail
    add rx1101_pos, 2
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
    $P10 = rx1101_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx1101_fail
    rx1101_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1101_pos = $P10."pos"()
  # rx pass
    rx1101_cur."!cursor_pass"(rx1101_pos, "infix:sym<||>")
    rx1101_cur."!cursor_debug"("PASS  ", "infix:sym<||>", " at pos=", rx1101_pos)
    .return (rx1101_cur)
  rx1101_fail:
.annotate "line", 381
    (rx1101_rep, rx1101_pos, $I10, $P10) = rx1101_cur."!mark_fail"(0)
    lt rx1101_pos, -1, rx1101_done
    eq rx1101_pos, -1, rx1101_fail
    jump $I10
  rx1101_done:
    rx1101_cur."!cursor_fail"()
    rx1101_cur."!cursor_debug"("FAIL  ", "infix:sym<||>")
    .return (rx1101_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("282_1258904213.70809") :method
.annotate "line", 381
    $P1103 = self."!PREFIX__!subrule"("O", "||")
    new $P1104, "ResizablePMCArray"
    push $P1104, $P1103
    .return ($P1104)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("283_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1108_tgt
    .local int rx1108_pos
    .local int rx1108_off
    .local int rx1108_eos
    .local int rx1108_rep
    .local pmc rx1108_cur
    (rx1108_cur, rx1108_pos, rx1108_tgt, $I10) = self."!cursor_start"()
    rx1108_cur."!cursor_debug"("START ", "infix:sym<//>")
    .lex unicode:"$\x{a2}", rx1108_cur
    .local pmc match
    .lex "$/", match
    length rx1108_eos, rx1108_tgt
    set rx1108_off, 0
    lt $I10, 2, rx1108_start
    sub rx1108_off, $I10, 1
    substr rx1108_tgt, rx1108_tgt, rx1108_off
  rx1108_start:
    ge rx1108_pos, 0, rxscan1112_done
  rxscan1112_loop:
    ($P10) = rx1108_cur."from"()
    inc $P10
    set rx1108_pos, $P10
    ge rx1108_pos, rx1108_eos, rxscan1112_done
    set_addr $I10, rxscan1112_loop
    rx1108_cur."!mark_push"(0, rx1108_pos, $I10)
  rxscan1112_done:
.annotate "line", 467
  # rx subcapture "sym"
    set_addr $I10, rxcap_1113_fail
    rx1108_cur."!mark_push"(0, rx1108_pos, $I10)
  # rx literal  "//"
    add $I11, rx1108_pos, 2
    gt $I11, rx1108_eos, rx1108_fail
    sub $I11, rx1108_pos, rx1108_off
    substr $S10, rx1108_tgt, $I11, 2
    ne $S10, "//", rx1108_fail
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
    $P10 = rx1108_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx1108_fail
    rx1108_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1108_pos = $P10."pos"()
  # rx pass
    rx1108_cur."!cursor_pass"(rx1108_pos, "infix:sym<//>")
    rx1108_cur."!cursor_debug"("PASS  ", "infix:sym<//>", " at pos=", rx1108_pos)
    .return (rx1108_cur)
  rx1108_fail:
.annotate "line", 381
    (rx1108_rep, rx1108_pos, $I10, $P10) = rx1108_cur."!mark_fail"(0)
    lt rx1108_pos, -1, rx1108_done
    eq rx1108_pos, -1, rx1108_fail
    jump $I10
  rx1108_done:
    rx1108_cur."!cursor_fail"()
    rx1108_cur."!cursor_debug"("FAIL  ", "infix:sym<//>")
    .return (rx1108_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("284_1258904213.70809") :method
.annotate "line", 381
    $P1110 = self."!PREFIX__!subrule"("O", "//")
    new $P1111, "ResizablePMCArray"
    push $P1111, $P1110
    .return ($P1111)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("285_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1115_tgt
    .local int rx1115_pos
    .local int rx1115_off
    .local int rx1115_eos
    .local int rx1115_rep
    .local pmc rx1115_cur
    (rx1115_cur, rx1115_pos, rx1115_tgt, $I10) = self."!cursor_start"()
    rx1115_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
    .lex unicode:"$\x{a2}", rx1115_cur
    .local pmc match
    .lex "$/", match
    length rx1115_eos, rx1115_tgt
    set rx1115_off, 0
    lt $I10, 2, rx1115_start
    sub rx1115_off, $I10, 1
    substr rx1115_tgt, rx1115_tgt, rx1115_off
  rx1115_start:
    ge rx1115_pos, 0, rxscan1119_done
  rxscan1119_loop:
    ($P10) = rx1115_cur."from"()
    inc $P10
    set rx1115_pos, $P10
    ge rx1115_pos, rx1115_eos, rxscan1119_done
    set_addr $I10, rxscan1119_loop
    rx1115_cur."!mark_push"(0, rx1115_pos, $I10)
  rxscan1119_done:
.annotate "line", 470
  # rx literal  "??"
    add $I11, rx1115_pos, 2
    gt $I11, rx1115_eos, rx1115_fail
    sub $I11, rx1115_pos, rx1115_off
    substr $S10, rx1115_tgt, $I11, 2
    ne $S10, "??", rx1115_fail
    add rx1115_pos, 2
.annotate "line", 471
  # rx subrule "ws" subtype=method negate=
    rx1115_cur."!cursor_pos"(rx1115_pos)
    $P10 = rx1115_cur."ws"()
    unless $P10, rx1115_fail
    rx1115_pos = $P10."pos"()
.annotate "line", 472
  # rx subrule "EXPR" subtype=capture negate=
    rx1115_cur."!cursor_pos"(rx1115_pos)
    $P10 = rx1115_cur."EXPR"("i=")
    unless $P10, rx1115_fail
    rx1115_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1115_pos = $P10."pos"()
.annotate "line", 473
  # rx literal  "!!"
    add $I11, rx1115_pos, 2
    gt $I11, rx1115_eos, rx1115_fail
    sub $I11, rx1115_pos, rx1115_off
    substr $S10, rx1115_tgt, $I11, 2
    ne $S10, "!!", rx1115_fail
    add rx1115_pos, 2
.annotate "line", 474
  # rx subrule "O" subtype=capture negate=
    rx1115_cur."!cursor_pos"(rx1115_pos)
    $P10 = rx1115_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx1115_fail
    rx1115_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1115_pos = $P10."pos"()
.annotate "line", 469
  # rx pass
    rx1115_cur."!cursor_pass"(rx1115_pos, "infix:sym<?? !!>")
    rx1115_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx1115_pos)
    .return (rx1115_cur)
  rx1115_fail:
.annotate "line", 381
    (rx1115_rep, rx1115_pos, $I10, $P10) = rx1115_cur."!mark_fail"(0)
    lt rx1115_pos, -1, rx1115_done
    eq rx1115_pos, -1, rx1115_fail
    jump $I10
  rx1115_done:
    rx1115_cur."!cursor_fail"()
    rx1115_cur."!cursor_debug"("FAIL  ", "infix:sym<?? !!>")
    .return (rx1115_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("286_1258904213.70809") :method
.annotate "line", 381
    $P1117 = self."!PREFIX__!subrule"("", "??")
    new $P1118, "ResizablePMCArray"
    push $P1118, $P1117
    .return ($P1118)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("287_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1121_tgt
    .local int rx1121_pos
    .local int rx1121_off
    .local int rx1121_eos
    .local int rx1121_rep
    .local pmc rx1121_cur
    (rx1121_cur, rx1121_pos, rx1121_tgt, $I10) = self."!cursor_start"()
    rx1121_cur."!cursor_debug"("START ", "infix:sym<=>")
    .lex unicode:"$\x{a2}", rx1121_cur
    .local pmc match
    .lex "$/", match
    length rx1121_eos, rx1121_tgt
    set rx1121_off, 0
    lt $I10, 2, rx1121_start
    sub rx1121_off, $I10, 1
    substr rx1121_tgt, rx1121_tgt, rx1121_off
  rx1121_start:
    ge rx1121_pos, 0, rxscan1125_done
  rxscan1125_loop:
    ($P10) = rx1121_cur."from"()
    inc $P10
    set rx1121_pos, $P10
    ge rx1121_pos, rx1121_eos, rxscan1125_done
    set_addr $I10, rxscan1125_loop
    rx1121_cur."!mark_push"(0, rx1121_pos, $I10)
  rxscan1125_done:
.annotate "line", 478
  # rx subcapture "sym"
    set_addr $I10, rxcap_1126_fail
    rx1121_cur."!mark_push"(0, rx1121_pos, $I10)
  # rx literal  "="
    add $I11, rx1121_pos, 1
    gt $I11, rx1121_eos, rx1121_fail
    sub $I11, rx1121_pos, rx1121_off
    substr $S10, rx1121_tgt, $I11, 1
    ne $S10, "=", rx1121_fail
    add rx1121_pos, 1
    set_addr $I10, rxcap_1126_fail
    ($I12, $I11) = rx1121_cur."!mark_peek"($I10)
    rx1121_cur."!cursor_pos"($I11)
    ($P10) = rx1121_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1121_pos, "")
    rx1121_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1126_done
  rxcap_1126_fail:
    goto rx1121_fail
  rxcap_1126_done:
  # rx subrule "panic" subtype=method negate=
    rx1121_cur."!cursor_pos"(rx1121_pos)
    $P10 = rx1121_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx1121_fail
    rx1121_pos = $P10."pos"()
.annotate "line", 477
  # rx pass
    rx1121_cur."!cursor_pass"(rx1121_pos, "infix:sym<=>")
    rx1121_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx1121_pos)
    .return (rx1121_cur)
  rx1121_fail:
.annotate "line", 381
    (rx1121_rep, rx1121_pos, $I10, $P10) = rx1121_cur."!mark_fail"(0)
    lt rx1121_pos, -1, rx1121_done
    eq rx1121_pos, -1, rx1121_fail
    jump $I10
  rx1121_done:
    rx1121_cur."!cursor_fail"()
    rx1121_cur."!cursor_debug"("FAIL  ", "infix:sym<=>")
    .return (rx1121_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("288_1258904213.70809") :method
.annotate "line", 381
    $P1123 = self."!PREFIX__!subrule"("", "=")
    new $P1124, "ResizablePMCArray"
    push $P1124, $P1123
    .return ($P1124)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("289_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1128_tgt
    .local int rx1128_pos
    .local int rx1128_off
    .local int rx1128_eos
    .local int rx1128_rep
    .local pmc rx1128_cur
    (rx1128_cur, rx1128_pos, rx1128_tgt, $I10) = self."!cursor_start"()
    rx1128_cur."!cursor_debug"("START ", "infix:sym<:=>")
    .lex unicode:"$\x{a2}", rx1128_cur
    .local pmc match
    .lex "$/", match
    length rx1128_eos, rx1128_tgt
    set rx1128_off, 0
    lt $I10, 2, rx1128_start
    sub rx1128_off, $I10, 1
    substr rx1128_tgt, rx1128_tgt, rx1128_off
  rx1128_start:
    ge rx1128_pos, 0, rxscan1132_done
  rxscan1132_loop:
    ($P10) = rx1128_cur."from"()
    inc $P10
    set rx1128_pos, $P10
    ge rx1128_pos, rx1128_eos, rxscan1132_done
    set_addr $I10, rxscan1132_loop
    rx1128_cur."!mark_push"(0, rx1128_pos, $I10)
  rxscan1132_done:
.annotate "line", 480
  # rx subcapture "sym"
    set_addr $I10, rxcap_1133_fail
    rx1128_cur."!mark_push"(0, rx1128_pos, $I10)
  # rx literal  ":="
    add $I11, rx1128_pos, 2
    gt $I11, rx1128_eos, rx1128_fail
    sub $I11, rx1128_pos, rx1128_off
    substr $S10, rx1128_tgt, $I11, 2
    ne $S10, ":=", rx1128_fail
    add rx1128_pos, 2
    set_addr $I10, rxcap_1133_fail
    ($I12, $I11) = rx1128_cur."!mark_peek"($I10)
    rx1128_cur."!cursor_pos"($I11)
    ($P10) = rx1128_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1128_pos, "")
    rx1128_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1133_done
  rxcap_1133_fail:
    goto rx1128_fail
  rxcap_1133_done:
  # rx subrule "O" subtype=capture negate=
    rx1128_cur."!cursor_pos"(rx1128_pos)
    $P10 = rx1128_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1128_fail
    rx1128_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1128_pos = $P10."pos"()
  # rx pass
    rx1128_cur."!cursor_pass"(rx1128_pos, "infix:sym<:=>")
    rx1128_cur."!cursor_debug"("PASS  ", "infix:sym<:=>", " at pos=", rx1128_pos)
    .return (rx1128_cur)
  rx1128_fail:
.annotate "line", 381
    (rx1128_rep, rx1128_pos, $I10, $P10) = rx1128_cur."!mark_fail"(0)
    lt rx1128_pos, -1, rx1128_done
    eq rx1128_pos, -1, rx1128_fail
    jump $I10
  rx1128_done:
    rx1128_cur."!cursor_fail"()
    rx1128_cur."!cursor_debug"("FAIL  ", "infix:sym<:=>")
    .return (rx1128_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("290_1258904213.70809") :method
.annotate "line", 381
    $P1130 = self."!PREFIX__!subrule"("O", ":=")
    new $P1131, "ResizablePMCArray"
    push $P1131, $P1130
    .return ($P1131)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("291_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1135_tgt
    .local int rx1135_pos
    .local int rx1135_off
    .local int rx1135_eos
    .local int rx1135_rep
    .local pmc rx1135_cur
    (rx1135_cur, rx1135_pos, rx1135_tgt, $I10) = self."!cursor_start"()
    rx1135_cur."!cursor_debug"("START ", "infix:sym<::=>")
    .lex unicode:"$\x{a2}", rx1135_cur
    .local pmc match
    .lex "$/", match
    length rx1135_eos, rx1135_tgt
    set rx1135_off, 0
    lt $I10, 2, rx1135_start
    sub rx1135_off, $I10, 1
    substr rx1135_tgt, rx1135_tgt, rx1135_off
  rx1135_start:
    ge rx1135_pos, 0, rxscan1139_done
  rxscan1139_loop:
    ($P10) = rx1135_cur."from"()
    inc $P10
    set rx1135_pos, $P10
    ge rx1135_pos, rx1135_eos, rxscan1139_done
    set_addr $I10, rxscan1139_loop
    rx1135_cur."!mark_push"(0, rx1135_pos, $I10)
  rxscan1139_done:
.annotate "line", 481
  # rx subcapture "sym"
    set_addr $I10, rxcap_1140_fail
    rx1135_cur."!mark_push"(0, rx1135_pos, $I10)
  # rx literal  "::="
    add $I11, rx1135_pos, 3
    gt $I11, rx1135_eos, rx1135_fail
    sub $I11, rx1135_pos, rx1135_off
    substr $S10, rx1135_tgt, $I11, 3
    ne $S10, "::=", rx1135_fail
    add rx1135_pos, 3
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
  # rx subrule "O" subtype=capture negate=
    rx1135_cur."!cursor_pos"(rx1135_pos)
    $P10 = rx1135_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1135_fail
    rx1135_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1135_pos = $P10."pos"()
  # rx pass
    rx1135_cur."!cursor_pass"(rx1135_pos, "infix:sym<::=>")
    rx1135_cur."!cursor_debug"("PASS  ", "infix:sym<::=>", " at pos=", rx1135_pos)
    .return (rx1135_cur)
  rx1135_fail:
.annotate "line", 381
    (rx1135_rep, rx1135_pos, $I10, $P10) = rx1135_cur."!mark_fail"(0)
    lt rx1135_pos, -1, rx1135_done
    eq rx1135_pos, -1, rx1135_fail
    jump $I10
  rx1135_done:
    rx1135_cur."!cursor_fail"()
    rx1135_cur."!cursor_debug"("FAIL  ", "infix:sym<::=>")
    .return (rx1135_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("292_1258904213.70809") :method
.annotate "line", 381
    $P1137 = self."!PREFIX__!subrule"("O", "::=")
    new $P1138, "ResizablePMCArray"
    push $P1138, $P1137
    .return ($P1138)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("293_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1142_tgt
    .local int rx1142_pos
    .local int rx1142_off
    .local int rx1142_eos
    .local int rx1142_rep
    .local pmc rx1142_cur
    (rx1142_cur, rx1142_pos, rx1142_tgt, $I10) = self."!cursor_start"()
    rx1142_cur."!cursor_debug"("START ", "infix:sym<,>")
    .lex unicode:"$\x{a2}", rx1142_cur
    .local pmc match
    .lex "$/", match
    length rx1142_eos, rx1142_tgt
    set rx1142_off, 0
    lt $I10, 2, rx1142_start
    sub rx1142_off, $I10, 1
    substr rx1142_tgt, rx1142_tgt, rx1142_off
  rx1142_start:
    ge rx1142_pos, 0, rxscan1146_done
  rxscan1146_loop:
    ($P10) = rx1142_cur."from"()
    inc $P10
    set rx1142_pos, $P10
    ge rx1142_pos, rx1142_eos, rxscan1146_done
    set_addr $I10, rxscan1146_loop
    rx1142_cur."!mark_push"(0, rx1142_pos, $I10)
  rxscan1146_done:
.annotate "line", 483
  # rx subcapture "sym"
    set_addr $I10, rxcap_1147_fail
    rx1142_cur."!mark_push"(0, rx1142_pos, $I10)
  # rx literal  ","
    add $I11, rx1142_pos, 1
    gt $I11, rx1142_eos, rx1142_fail
    sub $I11, rx1142_pos, rx1142_off
    substr $S10, rx1142_tgt, $I11, 1
    ne $S10, ",", rx1142_fail
    add rx1142_pos, 1
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
    $P10 = rx1142_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1142_fail
    rx1142_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1142_pos = $P10."pos"()
  # rx pass
    rx1142_cur."!cursor_pass"(rx1142_pos, "infix:sym<,>")
    rx1142_cur."!cursor_debug"("PASS  ", "infix:sym<,>", " at pos=", rx1142_pos)
    .return (rx1142_cur)
  rx1142_fail:
.annotate "line", 381
    (rx1142_rep, rx1142_pos, $I10, $P10) = rx1142_cur."!mark_fail"(0)
    lt rx1142_pos, -1, rx1142_done
    eq rx1142_pos, -1, rx1142_fail
    jump $I10
  rx1142_done:
    rx1142_cur."!cursor_fail"()
    rx1142_cur."!cursor_debug"("FAIL  ", "infix:sym<,>")
    .return (rx1142_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("294_1258904213.70809") :method
.annotate "line", 381
    $P1144 = self."!PREFIX__!subrule"("O", ",")
    new $P1145, "ResizablePMCArray"
    push $P1145, $P1144
    .return ($P1145)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("295_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1149_tgt
    .local int rx1149_pos
    .local int rx1149_off
    .local int rx1149_eos
    .local int rx1149_rep
    .local pmc rx1149_cur
    (rx1149_cur, rx1149_pos, rx1149_tgt, $I10) = self."!cursor_start"()
    rx1149_cur."!cursor_debug"("START ", "prefix:sym<return>")
    .lex unicode:"$\x{a2}", rx1149_cur
    .local pmc match
    .lex "$/", match
    length rx1149_eos, rx1149_tgt
    set rx1149_off, 0
    lt $I10, 2, rx1149_start
    sub rx1149_off, $I10, 1
    substr rx1149_tgt, rx1149_tgt, rx1149_off
  rx1149_start:
    ge rx1149_pos, 0, rxscan1152_done
  rxscan1152_loop:
    ($P10) = rx1149_cur."from"()
    inc $P10
    set rx1149_pos, $P10
    ge rx1149_pos, rx1149_eos, rxscan1152_done
    set_addr $I10, rxscan1152_loop
    rx1149_cur."!mark_push"(0, rx1149_pos, $I10)
  rxscan1152_done:
.annotate "line", 485
  # rx subcapture "sym"
    set_addr $I10, rxcap_1153_fail
    rx1149_cur."!mark_push"(0, rx1149_pos, $I10)
  # rx literal  "return"
    add $I11, rx1149_pos, 6
    gt $I11, rx1149_eos, rx1149_fail
    sub $I11, rx1149_pos, rx1149_off
    substr $S10, rx1149_tgt, $I11, 6
    ne $S10, "return", rx1149_fail
    add rx1149_pos, 6
    set_addr $I10, rxcap_1153_fail
    ($I12, $I11) = rx1149_cur."!mark_peek"($I10)
    rx1149_cur."!cursor_pos"($I11)
    ($P10) = rx1149_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1149_pos, "")
    rx1149_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1153_done
  rxcap_1153_fail:
    goto rx1149_fail
  rxcap_1153_done:
  # rx charclass s
    ge rx1149_pos, rx1149_eos, rx1149_fail
    sub $I10, rx1149_pos, rx1149_off
    is_cclass $I11, 32, rx1149_tgt, $I10
    unless $I11, rx1149_fail
    inc rx1149_pos
  # rx subrule "O" subtype=capture negate=
    rx1149_cur."!cursor_pos"(rx1149_pos)
    $P10 = rx1149_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1149_fail
    rx1149_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1149_pos = $P10."pos"()
  # rx pass
    rx1149_cur."!cursor_pass"(rx1149_pos, "prefix:sym<return>")
    rx1149_cur."!cursor_debug"("PASS  ", "prefix:sym<return>", " at pos=", rx1149_pos)
    .return (rx1149_cur)
  rx1149_fail:
.annotate "line", 381
    (rx1149_rep, rx1149_pos, $I10, $P10) = rx1149_cur."!mark_fail"(0)
    lt rx1149_pos, -1, rx1149_done
    eq rx1149_pos, -1, rx1149_fail
    jump $I10
  rx1149_done:
    rx1149_cur."!cursor_fail"()
    rx1149_cur."!cursor_debug"("FAIL  ", "prefix:sym<return>")
    .return (rx1149_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("296_1258904213.70809") :method
.annotate "line", 381
    new $P1151, "ResizablePMCArray"
    push $P1151, "return"
    .return ($P1151)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("297_1258904213.70809") :method :outer("11_1258904213.70809")
.annotate "line", 381
    .local string rx1155_tgt
    .local int rx1155_pos
    .local int rx1155_off
    .local int rx1155_eos
    .local int rx1155_rep
    .local pmc rx1155_cur
    (rx1155_cur, rx1155_pos, rx1155_tgt, $I10) = self."!cursor_start"()
    rx1155_cur."!cursor_debug"("START ", "prefix:sym<make>")
    .lex unicode:"$\x{a2}", rx1155_cur
    .local pmc match
    .lex "$/", match
    length rx1155_eos, rx1155_tgt
    set rx1155_off, 0
    lt $I10, 2, rx1155_start
    sub rx1155_off, $I10, 1
    substr rx1155_tgt, rx1155_tgt, rx1155_off
  rx1155_start:
    ge rx1155_pos, 0, rxscan1158_done
  rxscan1158_loop:
    ($P10) = rx1155_cur."from"()
    inc $P10
    set rx1155_pos, $P10
    ge rx1155_pos, rx1155_eos, rxscan1158_done
    set_addr $I10, rxscan1158_loop
    rx1155_cur."!mark_push"(0, rx1155_pos, $I10)
  rxscan1158_done:
.annotate "line", 486
  # rx subcapture "sym"
    set_addr $I10, rxcap_1159_fail
    rx1155_cur."!mark_push"(0, rx1155_pos, $I10)
  # rx literal  "make"
    add $I11, rx1155_pos, 4
    gt $I11, rx1155_eos, rx1155_fail
    sub $I11, rx1155_pos, rx1155_off
    substr $S10, rx1155_tgt, $I11, 4
    ne $S10, "make", rx1155_fail
    add rx1155_pos, 4
    set_addr $I10, rxcap_1159_fail
    ($I12, $I11) = rx1155_cur."!mark_peek"($I10)
    rx1155_cur."!cursor_pos"($I11)
    ($P10) = rx1155_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1155_pos, "")
    rx1155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1159_done
  rxcap_1159_fail:
    goto rx1155_fail
  rxcap_1159_done:
  # rx charclass s
    ge rx1155_pos, rx1155_eos, rx1155_fail
    sub $I10, rx1155_pos, rx1155_off
    is_cclass $I11, 32, rx1155_tgt, $I10
    unless $I11, rx1155_fail
    inc rx1155_pos
  # rx subrule "O" subtype=capture negate=
    rx1155_cur."!cursor_pos"(rx1155_pos)
    $P10 = rx1155_cur."O"("%list_prefix")
    unless $P10, rx1155_fail
    rx1155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1155_pos = $P10."pos"()
  # rx pass
    rx1155_cur."!cursor_pass"(rx1155_pos, "prefix:sym<make>")
    rx1155_cur."!cursor_debug"("PASS  ", "prefix:sym<make>", " at pos=", rx1155_pos)
    .return (rx1155_cur)
  rx1155_fail:
.annotate "line", 381
    (rx1155_rep, rx1155_pos, $I10, $P10) = rx1155_cur."!mark_fail"(0)
    lt rx1155_pos, -1, rx1155_done
    eq rx1155_pos, -1, rx1155_fail
    jump $I10
  rx1155_done:
    rx1155_cur."!cursor_fail"()
    rx1155_cur."!cursor_debug"("FAIL  ", "prefix:sym<make>")
    .return (rx1155_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("298_1258904213.70809") :method
.annotate "line", 381
    new $P1157, "ResizablePMCArray"
    push $P1157, "make"
    .return ($P1157)
.end


.namespace ["NQP";"Regex"]
.sub "_block1160"  :subid("299_1258904213.70809") :outer("11_1258904213.70809")
.annotate "line", 489
    .const 'Sub' $P1194 = "310_1258904213.70809" 
    capture_lex $P1194
    .const 'Sub' $P1181 = "307_1258904213.70809" 
    capture_lex $P1181
    .const 'Sub' $P1176 = "305_1258904213.70809" 
    capture_lex $P1176
    .const 'Sub' $P1171 = "303_1258904213.70809" 
    capture_lex $P1171
    .const 'Sub' $P1162 = "300_1258904213.70809" 
    capture_lex $P1162
    .const 'Sub' $P1194 = "310_1258904213.70809" 
    capture_lex $P1194
    .return ($P1194)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("300_1258904213.70809") :method :outer("299_1258904213.70809")
.annotate "line", 489
    .const 'Sub' $P1168 = "302_1258904213.70809" 
    capture_lex $P1168
    .local string rx1163_tgt
    .local int rx1163_pos
    .local int rx1163_off
    .local int rx1163_eos
    .local int rx1163_rep
    .local pmc rx1163_cur
    (rx1163_cur, rx1163_pos, rx1163_tgt, $I10) = self."!cursor_start"()
    rx1163_cur."!cursor_debug"("START ", "metachar:sym<:my>")
    .lex unicode:"$\x{a2}", rx1163_cur
    .local pmc match
    .lex "$/", match
    length rx1163_eos, rx1163_tgt
    set rx1163_off, 0
    lt $I10, 2, rx1163_start
    sub rx1163_off, $I10, 1
    substr rx1163_tgt, rx1163_tgt, rx1163_off
  rx1163_start:
    ge rx1163_pos, 0, rxscan1166_done
  rxscan1166_loop:
    ($P10) = rx1163_cur."from"()
    inc $P10
    set rx1163_pos, $P10
    ge rx1163_pos, rx1163_eos, rxscan1166_done
    set_addr $I10, rxscan1166_loop
    rx1163_cur."!mark_push"(0, rx1163_pos, $I10)
  rxscan1166_done:
.annotate "line", 491
  # rx literal  ":"
    add $I11, rx1163_pos, 1
    gt $I11, rx1163_eos, rx1163_fail
    sub $I11, rx1163_pos, rx1163_off
    substr $S10, rx1163_tgt, $I11, 1
    ne $S10, ":", rx1163_fail
    add rx1163_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1163_cur."!cursor_pos"(rx1163_pos)
    .const 'Sub' $P1168 = "302_1258904213.70809" 
    capture_lex $P1168
    $P10 = rx1163_cur."before"($P1168)
    unless $P10, rx1163_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1163_cur."!cursor_pos"(rx1163_pos)
    $P10 = rx1163_cur."LANG"("MAIN", "statement")
    unless $P10, rx1163_fail
    rx1163_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1163_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1163_cur."!cursor_pos"(rx1163_pos)
    $P10 = rx1163_cur."ws"()
    unless $P10, rx1163_fail
    rx1163_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1163_pos, 1
    gt $I11, rx1163_eos, rx1163_fail
    sub $I11, rx1163_pos, rx1163_off
    substr $S10, rx1163_tgt, $I11, 1
    ne $S10, ";", rx1163_fail
    add rx1163_pos, 1
.annotate "line", 490
  # rx pass
    rx1163_cur."!cursor_pass"(rx1163_pos, "metachar:sym<:my>")
    rx1163_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1163_pos)
    .return (rx1163_cur)
  rx1163_fail:
.annotate "line", 489
    (rx1163_rep, rx1163_pos, $I10, $P10) = rx1163_cur."!mark_fail"(0)
    lt rx1163_pos, -1, rx1163_done
    eq rx1163_pos, -1, rx1163_fail
    jump $I10
  rx1163_done:
    rx1163_cur."!cursor_fail"()
    rx1163_cur."!cursor_debug"("FAIL  ", "metachar:sym<:my>")
    .return (rx1163_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("301_1258904213.70809") :method
.annotate "line", 489
    new $P1165, "ResizablePMCArray"
    push $P1165, ":"
    .return ($P1165)
.end


.namespace ["NQP";"Regex"]
.sub "_block1167"  :anon :subid("302_1258904213.70809") :method :outer("300_1258904213.70809")
.annotate "line", 491
    .local string rx1169_tgt
    .local int rx1169_pos
    .local int rx1169_off
    .local int rx1169_eos
    .local int rx1169_rep
    .local pmc rx1169_cur
    (rx1169_cur, rx1169_pos, rx1169_tgt, $I10) = self."!cursor_start"()
    rx1169_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1169_cur
    .local pmc match
    .lex "$/", match
    length rx1169_eos, rx1169_tgt
    set rx1169_off, 0
    lt $I10, 2, rx1169_start
    sub rx1169_off, $I10, 1
    substr rx1169_tgt, rx1169_tgt, rx1169_off
  rx1169_start:
    ge rx1169_pos, 0, rxscan1170_done
  rxscan1170_loop:
    ($P10) = rx1169_cur."from"()
    inc $P10
    set rx1169_pos, $P10
    ge rx1169_pos, rx1169_eos, rxscan1170_done
    set_addr $I10, rxscan1170_loop
    rx1169_cur."!mark_push"(0, rx1169_pos, $I10)
  rxscan1170_done:
  # rx literal  "my"
    add $I11, rx1169_pos, 2
    gt $I11, rx1169_eos, rx1169_fail
    sub $I11, rx1169_pos, rx1169_off
    substr $S10, rx1169_tgt, $I11, 2
    ne $S10, "my", rx1169_fail
    add rx1169_pos, 2
  # rx pass
    rx1169_cur."!cursor_pass"(rx1169_pos, "")
    rx1169_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1169_pos)
    .return (rx1169_cur)
  rx1169_fail:
    (rx1169_rep, rx1169_pos, $I10, $P10) = rx1169_cur."!mark_fail"(0)
    lt rx1169_pos, -1, rx1169_done
    eq rx1169_pos, -1, rx1169_fail
    jump $I10
  rx1169_done:
    rx1169_cur."!cursor_fail"()
    rx1169_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1169_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("303_1258904213.70809") :method :outer("299_1258904213.70809")
.annotate "line", 489
    .local string rx1172_tgt
    .local int rx1172_pos
    .local int rx1172_off
    .local int rx1172_eos
    .local int rx1172_rep
    .local pmc rx1172_cur
    (rx1172_cur, rx1172_pos, rx1172_tgt, $I10) = self."!cursor_start"()
    rx1172_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1172_cur
    .local pmc match
    .lex "$/", match
    length rx1172_eos, rx1172_tgt
    set rx1172_off, 0
    lt $I10, 2, rx1172_start
    sub rx1172_off, $I10, 1
    substr rx1172_tgt, rx1172_tgt, rx1172_off
  rx1172_start:
    ge rx1172_pos, 0, rxscan1175_done
  rxscan1175_loop:
    ($P10) = rx1172_cur."from"()
    inc $P10
    set rx1172_pos, $P10
    ge rx1172_pos, rx1172_eos, rxscan1175_done
    set_addr $I10, rxscan1175_loop
    rx1172_cur."!mark_push"(0, rx1172_pos, $I10)
  rxscan1175_done:
.annotate "line", 495
  # rx enumcharlist negate=0 zerowidth
    ge rx1172_pos, rx1172_eos, rx1172_fail
    sub $I10, rx1172_pos, rx1172_off
    substr $S10, rx1172_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1172_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1172_cur."!cursor_pos"(rx1172_pos)
    $P10 = rx1172_cur."codeblock"()
    unless $P10, rx1172_fail
    rx1172_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1172_pos = $P10."pos"()
.annotate "line", 494
  # rx pass
    rx1172_cur."!cursor_pass"(rx1172_pos, "metachar:sym<{ }>")
    rx1172_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1172_pos)
    .return (rx1172_cur)
  rx1172_fail:
.annotate "line", 489
    (rx1172_rep, rx1172_pos, $I10, $P10) = rx1172_cur."!mark_fail"(0)
    lt rx1172_pos, -1, rx1172_done
    eq rx1172_pos, -1, rx1172_fail
    jump $I10
  rx1172_done:
    rx1172_cur."!cursor_fail"()
    rx1172_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx1172_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("304_1258904213.70809") :method
.annotate "line", 489
    new $P1174, "ResizablePMCArray"
    push $P1174, "{"
    .return ($P1174)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("305_1258904213.70809") :method :outer("299_1258904213.70809")
.annotate "line", 489
    .local string rx1177_tgt
    .local int rx1177_pos
    .local int rx1177_off
    .local int rx1177_eos
    .local int rx1177_rep
    .local pmc rx1177_cur
    (rx1177_cur, rx1177_pos, rx1177_tgt, $I10) = self."!cursor_start"()
    rx1177_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1177_cur
    .local pmc match
    .lex "$/", match
    length rx1177_eos, rx1177_tgt
    set rx1177_off, 0
    lt $I10, 2, rx1177_start
    sub rx1177_off, $I10, 1
    substr rx1177_tgt, rx1177_tgt, rx1177_off
  rx1177_start:
    ge rx1177_pos, 0, rxscan1180_done
  rxscan1180_loop:
    ($P10) = rx1177_cur."from"()
    inc $P10
    set rx1177_pos, $P10
    ge rx1177_pos, rx1177_eos, rxscan1180_done
    set_addr $I10, rxscan1180_loop
    rx1177_cur."!mark_push"(0, rx1177_pos, $I10)
  rxscan1180_done:
.annotate "line", 499
  # rx enumcharlist negate=0 zerowidth
    ge rx1177_pos, rx1177_eos, rx1177_fail
    sub $I10, rx1177_pos, rx1177_off
    substr $S10, rx1177_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1177_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1177_cur."!cursor_pos"(rx1177_pos)
    $P10 = rx1177_cur."codeblock"()
    unless $P10, rx1177_fail
    rx1177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1177_pos = $P10."pos"()
.annotate "line", 498
  # rx pass
    rx1177_cur."!cursor_pass"(rx1177_pos, "assertion:sym<{ }>")
    rx1177_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1177_pos)
    .return (rx1177_cur)
  rx1177_fail:
.annotate "line", 489
    (rx1177_rep, rx1177_pos, $I10, $P10) = rx1177_cur."!mark_fail"(0)
    lt rx1177_pos, -1, rx1177_done
    eq rx1177_pos, -1, rx1177_fail
    jump $I10
  rx1177_done:
    rx1177_cur."!cursor_fail"()
    rx1177_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1177_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("306_1258904213.70809") :method
.annotate "line", 489
    new $P1179, "ResizablePMCArray"
    push $P1179, "{"
    .return ($P1179)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("307_1258904213.70809") :method :outer("299_1258904213.70809")
.annotate "line", 489
    .const 'Sub' $P1190 = "309_1258904213.70809" 
    capture_lex $P1190
    .local string rx1182_tgt
    .local int rx1182_pos
    .local int rx1182_off
    .local int rx1182_eos
    .local int rx1182_rep
    .local pmc rx1182_cur
    (rx1182_cur, rx1182_pos, rx1182_tgt, $I10) = self."!cursor_start"()
    rx1182_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1182_cur."!cursor_caparray"("assertion", "nibbler", "arglist")
    .lex unicode:"$\x{a2}", rx1182_cur
    .local pmc match
    .lex "$/", match
    length rx1182_eos, rx1182_tgt
    set rx1182_off, 0
    lt $I10, 2, rx1182_start
    sub rx1182_off, $I10, 1
    substr rx1182_tgt, rx1182_tgt, rx1182_off
  rx1182_start:
    ge rx1182_pos, 0, rxscan1185_done
  rxscan1185_loop:
    ($P10) = rx1182_cur."from"()
    inc $P10
    set rx1182_pos, $P10
    ge rx1182_pos, rx1182_eos, rxscan1185_done
    set_addr $I10, rxscan1185_loop
    rx1182_cur."!mark_push"(0, rx1182_pos, $I10)
  rxscan1185_done:
.annotate "line", 503
  # rx subcapture "longname"
    set_addr $I10, rxcap_1186_fail
    rx1182_cur."!mark_push"(0, rx1182_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1182_pos, rx1182_off
    find_not_cclass $I11, 8192, rx1182_tgt, $I10, rx1182_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1182_fail
    add rx1182_pos, rx1182_off, $I11
    set_addr $I10, rxcap_1186_fail
    ($I12, $I11) = rx1182_cur."!mark_peek"($I10)
    rx1182_cur."!cursor_pos"($I11)
    ($P10) = rx1182_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1182_pos, "")
    rx1182_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_1186_done
  rxcap_1186_fail:
    goto rx1182_fail
  rxcap_1186_done:
.annotate "line", 510
  # rx rxquantr1187 ** 0..1
    set_addr $I1193, rxquantr1187_done
    rx1182_cur."!mark_push"(0, rx1182_pos, $I1193)
  rxquantr1187_loop:
  alt1188_0:
.annotate "line", 504
    set_addr $I10, alt1188_1
    rx1182_cur."!mark_push"(0, rx1182_pos, $I10)
.annotate "line", 505
  # rx subrule "before" subtype=zerowidth negate=
    rx1182_cur."!cursor_pos"(rx1182_pos)
    .const 'Sub' $P1190 = "309_1258904213.70809" 
    capture_lex $P1190
    $P10 = rx1182_cur."before"($P1190)
    unless $P10, rx1182_fail
    goto alt1188_end
  alt1188_1:
    set_addr $I10, alt1188_2
    rx1182_cur."!mark_push"(0, rx1182_pos, $I10)
.annotate "line", 506
  # rx literal  "="
    add $I11, rx1182_pos, 1
    gt $I11, rx1182_eos, rx1182_fail
    sub $I11, rx1182_pos, rx1182_off
    substr $S10, rx1182_tgt, $I11, 1
    ne $S10, "=", rx1182_fail
    add rx1182_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1182_cur."!cursor_pos"(rx1182_pos)
    $P10 = rx1182_cur."assertion"()
    unless $P10, rx1182_fail
    rx1182_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1182_pos = $P10."pos"()
    goto alt1188_end
  alt1188_2:
    set_addr $I10, alt1188_3
    rx1182_cur."!mark_push"(0, rx1182_pos, $I10)
.annotate "line", 507
  # rx literal  ":"
    add $I11, rx1182_pos, 1
    gt $I11, rx1182_eos, rx1182_fail
    sub $I11, rx1182_pos, rx1182_off
    substr $S10, rx1182_tgt, $I11, 1
    ne $S10, ":", rx1182_fail
    add rx1182_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1182_cur."!cursor_pos"(rx1182_pos)
    $P10 = rx1182_cur."arglist"()
    unless $P10, rx1182_fail
    rx1182_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1182_pos = $P10."pos"()
    goto alt1188_end
  alt1188_3:
    set_addr $I10, alt1188_4
    rx1182_cur."!mark_push"(0, rx1182_pos, $I10)
.annotate "line", 508
  # rx literal  "("
    add $I11, rx1182_pos, 1
    gt $I11, rx1182_eos, rx1182_fail
    sub $I11, rx1182_pos, rx1182_off
    substr $S10, rx1182_tgt, $I11, 1
    ne $S10, "(", rx1182_fail
    add rx1182_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1182_cur."!cursor_pos"(rx1182_pos)
    $P10 = rx1182_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1182_fail
    rx1182_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1182_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1182_pos, 1
    gt $I11, rx1182_eos, rx1182_fail
    sub $I11, rx1182_pos, rx1182_off
    substr $S10, rx1182_tgt, $I11, 1
    ne $S10, ")", rx1182_fail
    add rx1182_pos, 1
    goto alt1188_end
  alt1188_4:
.annotate "line", 509
  # rx subrule "normspace" subtype=method negate=
    rx1182_cur."!cursor_pos"(rx1182_pos)
    $P10 = rx1182_cur."normspace"()
    unless $P10, rx1182_fail
    rx1182_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1182_cur."!cursor_pos"(rx1182_pos)
    $P10 = rx1182_cur."nibbler"()
    unless $P10, rx1182_fail
    rx1182_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1182_pos = $P10."pos"()
  alt1188_end:
.annotate "line", 510
    (rx1182_rep) = rx1182_cur."!mark_commit"($I1193)
  rxquantr1187_done:
.annotate "line", 502
  # rx pass
    rx1182_cur."!cursor_pass"(rx1182_pos, "assertion:sym<name>")
    rx1182_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1182_pos)
    .return (rx1182_cur)
  rx1182_fail:
.annotate "line", 489
    (rx1182_rep, rx1182_pos, $I10, $P10) = rx1182_cur."!mark_fail"(0)
    lt rx1182_pos, -1, rx1182_done
    eq rx1182_pos, -1, rx1182_fail
    jump $I10
  rx1182_done:
    rx1182_cur."!cursor_fail"()
    rx1182_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1182_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("308_1258904213.70809") :method
.annotate "line", 489
    new $P1184, "ResizablePMCArray"
    push $P1184, ""
    .return ($P1184)
.end


.namespace ["NQP";"Regex"]
.sub "_block1189"  :anon :subid("309_1258904213.70809") :method :outer("307_1258904213.70809")
.annotate "line", 505
    .local string rx1191_tgt
    .local int rx1191_pos
    .local int rx1191_off
    .local int rx1191_eos
    .local int rx1191_rep
    .local pmc rx1191_cur
    (rx1191_cur, rx1191_pos, rx1191_tgt, $I10) = self."!cursor_start"()
    rx1191_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1191_cur
    .local pmc match
    .lex "$/", match
    length rx1191_eos, rx1191_tgt
    set rx1191_off, 0
    lt $I10, 2, rx1191_start
    sub rx1191_off, $I10, 1
    substr rx1191_tgt, rx1191_tgt, rx1191_off
  rx1191_start:
    ge rx1191_pos, 0, rxscan1192_done
  rxscan1192_loop:
    ($P10) = rx1191_cur."from"()
    inc $P10
    set rx1191_pos, $P10
    ge rx1191_pos, rx1191_eos, rxscan1192_done
    set_addr $I10, rxscan1192_loop
    rx1191_cur."!mark_push"(0, rx1191_pos, $I10)
  rxscan1192_done:
  # rx literal  ">"
    add $I11, rx1191_pos, 1
    gt $I11, rx1191_eos, rx1191_fail
    sub $I11, rx1191_pos, rx1191_off
    substr $S10, rx1191_tgt, $I11, 1
    ne $S10, ">", rx1191_fail
    add rx1191_pos, 1
  # rx pass
    rx1191_cur."!cursor_pass"(rx1191_pos, "")
    rx1191_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1191_pos)
    .return (rx1191_cur)
  rx1191_fail:
    (rx1191_rep, rx1191_pos, $I10, $P10) = rx1191_cur."!mark_fail"(0)
    lt rx1191_pos, -1, rx1191_done
    eq rx1191_pos, -1, rx1191_fail
    jump $I10
  rx1191_done:
    rx1191_cur."!cursor_fail"()
    rx1191_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1191_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("310_1258904213.70809") :method :outer("299_1258904213.70809")
.annotate "line", 489
    .local string rx1195_tgt
    .local int rx1195_pos
    .local int rx1195_off
    .local int rx1195_eos
    .local int rx1195_rep
    .local pmc rx1195_cur
    (rx1195_cur, rx1195_pos, rx1195_tgt, $I10) = self."!cursor_start"()
    rx1195_cur."!cursor_debug"("START ", "codeblock")
    .lex unicode:"$\x{a2}", rx1195_cur
    .local pmc match
    .lex "$/", match
    length rx1195_eos, rx1195_tgt
    set rx1195_off, 0
    lt $I10, 2, rx1195_start
    sub rx1195_off, $I10, 1
    substr rx1195_tgt, rx1195_tgt, rx1195_off
  rx1195_start:
    ge rx1195_pos, 0, rxscan1199_done
  rxscan1199_loop:
    ($P10) = rx1195_cur."from"()
    inc $P10
    set rx1195_pos, $P10
    ge rx1195_pos, rx1195_eos, rxscan1199_done
    set_addr $I10, rxscan1199_loop
    rx1195_cur."!mark_push"(0, rx1195_pos, $I10)
  rxscan1199_done:
.annotate "line", 515
  # rx subrule "LANG" subtype=capture negate=
    rx1195_cur."!cursor_pos"(rx1195_pos)
    $P10 = rx1195_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1195_fail
    rx1195_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1195_pos = $P10."pos"()
.annotate "line", 514
  # rx pass
    rx1195_cur."!cursor_pass"(rx1195_pos, "codeblock")
    rx1195_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1195_pos)
    .return (rx1195_cur)
  rx1195_fail:
.annotate "line", 489
    (rx1195_rep, rx1195_pos, $I10, $P10) = rx1195_cur."!mark_fail"(0)
    lt rx1195_pos, -1, rx1195_done
    eq rx1195_pos, -1, rx1195_fail
    jump $I10
  rx1195_done:
    rx1195_cur."!cursor_fail"()
    rx1195_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1195_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("311_1258904213.70809") :method
.annotate "line", 489
    $P1197 = self."!PREFIX__!subrule"("block", "")
    new $P1198, "ResizablePMCArray"
    push $P1198, $P1197
    .return ($P1198)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1258904224.56063")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
    $P1909 = $P14()
.annotate "line", 1
    .return ($P1909)
.end


.namespace []
.sub "" :load :init :subid("post114") :outer("10_1258904224.56063")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258904224.56063" 
    .local pmc block
    set block, $P12
    $P1910 = get_root_global ["parrot"], "P6metaclass"
    $P1910."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1258904224.56063") :outer("10_1258904224.56063")
.annotate "line", 3
    .const 'Sub' $P1905 = "113_1258904224.56063" 
    capture_lex $P1905
    get_hll_global $P1841, ["NQP";"RegexActions"], "_block1840" 
    capture_lex $P1841
    .const 'Sub' $P1828 = "107_1258904224.56063" 
    capture_lex $P1828
    .const 'Sub' $P1818 = "106_1258904224.56063" 
    capture_lex $P1818
    .const 'Sub' $P1808 = "105_1258904224.56063" 
    capture_lex $P1808
    .const 'Sub' $P1798 = "104_1258904224.56063" 
    capture_lex $P1798
    .const 'Sub' $P1784 = "103_1258904224.56063" 
    capture_lex $P1784
    .const 'Sub' $P1774 = "102_1258904224.56063" 
    capture_lex $P1774
    .const 'Sub' $P1760 = "101_1258904224.56063" 
    capture_lex $P1760
    .const 'Sub' $P1750 = "100_1258904224.56063" 
    capture_lex $P1750
    .const 'Sub' $P1740 = "99_1258904224.56063" 
    capture_lex $P1740
    .const 'Sub' $P1730 = "98_1258904224.56063" 
    capture_lex $P1730
    .const 'Sub' $P1720 = "97_1258904224.56063" 
    capture_lex $P1720
    .const 'Sub' $P1710 = "96_1258904224.56063" 
    capture_lex $P1710
    .const 'Sub' $P1682 = "95_1258904224.56063" 
    capture_lex $P1682
    .const 'Sub' $P1672 = "94_1258904224.56063" 
    capture_lex $P1672
    .const 'Sub' $P1660 = "93_1258904224.56063" 
    capture_lex $P1660
    .const 'Sub' $P1648 = "92_1258904224.56063" 
    capture_lex $P1648
    .const 'Sub' $P1636 = "91_1258904224.56063" 
    capture_lex $P1636
    .const 'Sub' $P1626 = "90_1258904224.56063" 
    capture_lex $P1626
    .const 'Sub' $P1597 = "89_1258904224.56063" 
    capture_lex $P1597
    .const 'Sub' $P1573 = "88_1258904224.56063" 
    capture_lex $P1573
    .const 'Sub' $P1563 = "87_1258904224.56063" 
    capture_lex $P1563
    .const 'Sub' $P1536 = "86_1258904224.56063" 
    capture_lex $P1536
    .const 'Sub' $P1518 = "85_1258904224.56063" 
    capture_lex $P1518
    .const 'Sub' $P1508 = "84_1258904224.56063" 
    capture_lex $P1508
    .const 'Sub' $P1424 = "81_1258904224.56063" 
    capture_lex $P1424
    .const 'Sub' $P1414 = "80_1258904224.56063" 
    capture_lex $P1414
    .const 'Sub' $P1385 = "79_1258904224.56063" 
    capture_lex $P1385
    .const 'Sub' $P1343 = "78_1258904224.56063" 
    capture_lex $P1343
    .const 'Sub' $P1327 = "77_1258904224.56063" 
    capture_lex $P1327
    .const 'Sub' $P1318 = "76_1258904224.56063" 
    capture_lex $P1318
    .const 'Sub' $P1286 = "75_1258904224.56063" 
    capture_lex $P1286
    .const 'Sub' $P1199 = "73_1258904224.56063" 
    capture_lex $P1199
    .const 'Sub' $P1182 = "72_1258904224.56063" 
    capture_lex $P1182
    .const 'Sub' $P1162 = "71_1258904224.56063" 
    capture_lex $P1162
    .const 'Sub' $P1078 = "70_1258904224.56063" 
    capture_lex $P1078
    .const 'Sub' $P1054 = "68_1258904224.56063" 
    capture_lex $P1054
    .const 'Sub' $P1020 = "66_1258904224.56063" 
    capture_lex $P1020
    .const 'Sub' $P974 = "64_1258904224.56063" 
    capture_lex $P974
    .const 'Sub' $P964 = "63_1258904224.56063" 
    capture_lex $P964
    .const 'Sub' $P954 = "62_1258904224.56063" 
    capture_lex $P954
    .const 'Sub' $P883 = "60_1258904224.56063" 
    capture_lex $P883
    .const 'Sub' $P866 = "59_1258904224.56063" 
    capture_lex $P866
    .const 'Sub' $P856 = "58_1258904224.56063" 
    capture_lex $P856
    .const 'Sub' $P846 = "57_1258904224.56063" 
    capture_lex $P846
    .const 'Sub' $P836 = "56_1258904224.56063" 
    capture_lex $P836
    .const 'Sub' $P812 = "55_1258904224.56063" 
    capture_lex $P812
    .const 'Sub' $P759 = "54_1258904224.56063" 
    capture_lex $P759
    .const 'Sub' $P749 = "53_1258904224.56063" 
    capture_lex $P749
    .const 'Sub' $P660 = "51_1258904224.56063" 
    capture_lex $P660
    .const 'Sub' $P634 = "50_1258904224.56063" 
    capture_lex $P634
    .const 'Sub' $P624 = "49_1258904224.56063" 
    capture_lex $P624
    .const 'Sub' $P614 = "48_1258904224.56063" 
    capture_lex $P614
    .const 'Sub' $P604 = "47_1258904224.56063" 
    capture_lex $P604
    .const 'Sub' $P594 = "46_1258904224.56063" 
    capture_lex $P594
    .const 'Sub' $P584 = "45_1258904224.56063" 
    capture_lex $P584
    .const 'Sub' $P574 = "44_1258904224.56063" 
    capture_lex $P574
    .const 'Sub' $P564 = "43_1258904224.56063" 
    capture_lex $P564
    .const 'Sub' $P554 = "42_1258904224.56063" 
    capture_lex $P554
    .const 'Sub' $P544 = "41_1258904224.56063" 
    capture_lex $P544
    .const 'Sub' $P534 = "40_1258904224.56063" 
    capture_lex $P534
    .const 'Sub' $P524 = "39_1258904224.56063" 
    capture_lex $P524
    .const 'Sub' $P514 = "38_1258904224.56063" 
    capture_lex $P514
    .const 'Sub' $P496 = "37_1258904224.56063" 
    capture_lex $P496
    .const 'Sub' $P480 = "36_1258904224.56063" 
    capture_lex $P480
    .const 'Sub' $P467 = "35_1258904224.56063" 
    capture_lex $P467
    .const 'Sub' $P441 = "34_1258904224.56063" 
    capture_lex $P441
    .const 'Sub' $P405 = "33_1258904224.56063" 
    capture_lex $P405
    .const 'Sub' $P388 = "32_1258904224.56063" 
    capture_lex $P388
    .const 'Sub' $P374 = "31_1258904224.56063" 
    capture_lex $P374
    .const 'Sub' $P319 = "29_1258904224.56063" 
    capture_lex $P319
    .const 'Sub' $P306 = "28_1258904224.56063" 
    capture_lex $P306
    .const 'Sub' $P287 = "27_1258904224.56063" 
    capture_lex $P287
    .const 'Sub' $P277 = "26_1258904224.56063" 
    capture_lex $P277
    .const 'Sub' $P267 = "25_1258904224.56063" 
    capture_lex $P267
    .const 'Sub' $P251 = "24_1258904224.56063" 
    capture_lex $P251
    .const 'Sub' $P173 = "22_1258904224.56063" 
    capture_lex $P173
    .const 'Sub' $P130 = "20_1258904224.56063" 
    capture_lex $P130
    .const 'Sub' $P111 = "19_1258904224.56063" 
    capture_lex $P111
    .const 'Sub' $P89 = "18_1258904224.56063" 
    capture_lex $P89
    .const 'Sub' $P79 = "17_1258904224.56063" 
    capture_lex $P79
    .const 'Sub' $P57 = "16_1258904224.56063" 
    capture_lex $P57
    .const 'Sub' $P26 = "13_1258904224.56063" 
    capture_lex $P26
    .const 'Sub' $P16 = "12_1258904224.56063" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_117
    new $P15, "ResizablePMCArray"
    set_global "@BLOCK", $P15
  vivify_117:
.annotate "line", 9
    .const 'Sub' $P16 = "12_1258904224.56063" 
    capture_lex $P16
    .lex "xblock_immediate", $P16
.annotate "line", 14
    .const 'Sub' $P26 = "13_1258904224.56063" 
    capture_lex $P26
    .lex "block_immediate", $P26
.annotate "line", 24
    .const 'Sub' $P57 = "16_1258904224.56063" 
    capture_lex $P57
    .lex "sigiltype", $P57
.annotate "line", 3
    get_global $P75, "@BLOCK"
.annotate "line", 5
    find_lex $P76, "xblock_immediate"
    find_lex $P77, "block_immediate"
    find_lex $P78, "sigiltype"
.annotate "line", 641
    get_hll_global $P1841, ["NQP";"RegexActions"], "_block1840" 
    capture_lex $P1841
    $P1903 = $P1841()
.annotate "line", 3
    .return ($P1903)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post115") :outer("11_1258904224.56063")
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 5
    .const 'Sub' $P1905 = "113_1258904224.56063" 
    capture_lex $P1905
    $P1905()
    $P1908 = get_root_global ["parrot"], "P6metaclass"
    $P1908."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block1904"  :anon :subid("113_1258904224.56063") :outer("11_1258904224.56063")
.annotate "line", 6
    get_global $P1906, "@BLOCK"
    unless_null $P1906, vivify_116
    new $P1906, "ResizablePMCArray"
    set_global "@BLOCK", $P1906
  vivify_116:
 $P1907 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P1907
.annotate "line", 5
    .return ($P1907)
.end


.namespace ["NQP";"Actions"]
.sub "xblock_immediate"  :subid("12_1258904224.56063") :outer("11_1258904224.56063")
    .param pmc param_19
.annotate "line", 9
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(58)
    push_eh $P18
    .lex "$xblock", param_19
.annotate "line", 10
    find_lex $P20, "$xblock"
    unless_null $P20, vivify_118
    new $P20, "ResizablePMCArray"
  vivify_118:
    set $P21, $P20[1]
    unless_null $P21, vivify_119
    new $P21, "Undef"
  vivify_119:
    $P22 = "block_immediate"($P21)
    find_lex $P23, "$xblock"
    unless_null $P23, vivify_120
    new $P23, "ResizablePMCArray"
    store_lex "$xblock", $P23
  vivify_120:
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
.sub "block_immediate"  :subid("13_1258904224.56063") :outer("11_1258904224.56063")
    .param pmc param_29
.annotate "line", 14
    .const 'Sub' $P35 = "14_1258904224.56063" 
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
    .const 'Sub' $P35 = "14_1258904224.56063" 
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
.sub "_block34"  :anon :subid("14_1258904224.56063") :outer("13_1258904224.56063")
.annotate "line", 16
    .const 'Sub' $P46 = "15_1258904224.56063" 
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
    unless $I43, for_undef_121
    iter $P40, $P42
    new $P52, 'ExceptionHandler'
    set_addr $P52, loop51_handler
    $P52."handle_types"(65, 67, 66)
    push_eh $P52
  loop51_test:
    unless $P40, loop51_done
    shift $P44, $P40
  loop51_redo:
    .const 'Sub' $P46 = "15_1258904224.56063" 
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
  for_undef_121:
.annotate "line", 19
    find_lex $P54, "$stmts"
    store_lex "$block", $P54
.annotate "line", 16
    .return ($P54)
.end


.namespace ["NQP";"Actions"]
.sub "_block45"  :anon :subid("15_1258904224.56063") :outer("14_1258904224.56063")
    .param pmc param_47
.annotate "line", 18
    .lex "$_", param_47
    find_lex $P48, "$stmts"
    find_lex $P49, "$_"
    $P50 = $P48."push"($P49)
    .return ($P50)
.end


.namespace ["NQP";"Actions"]
.sub "sigiltype"  :subid("16_1258904224.56063") :outer("11_1258904224.56063")
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
.sub "TOP"  :subid("17_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P84, vivify_122
    new $P84, "Hash"
  vivify_122:
    set $P85, $P84["comp_unit"]
    unless_null $P85, vivify_123
    new $P85, "Undef"
  vivify_123:
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
.sub "deflongname"  :subid("18_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P95, vivify_124
    new $P95, "Hash"
  vivify_124:
    set $P96, $P95["sym"]
    unless_null $P96, vivify_125
    new $P96, "Undef"
  vivify_125:
    if $P96, if_94
    set $P93, $P96
    goto if_94_end
  if_94:
    find_lex $P97, "$/"
    find_lex $P98, "$/"
    unless_null $P98, vivify_126
    new $P98, "Hash"
  vivify_126:
    set $P99, $P98["identifier"]
    unless_null $P99, vivify_127
    new $P99, "Undef"
  vivify_127:
    set $S100, $P99
    new $P101, 'String'
    set $P101, $S100
    concat $P102, $P101, ":sym<"
    find_lex $P103, "$/"
    unless_null $P103, vivify_128
    new $P103, "Hash"
  vivify_128:
    set $P104, $P103["sym"]
    unless_null $P104, vivify_129
    new $P104, "ResizablePMCArray"
  vivify_129:
    set $P105, $P104[0]
    unless_null $P105, vivify_130
    new $P105, "Undef"
  vivify_130:
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
.sub "comp_unit"  :subid("19_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P117, vivify_131
    new $P117, "Hash"
  vivify_131:
    set $P118, $P117["statementlist"]
    unless_null $P118, vivify_132
    new $P118, "Undef"
  vivify_132:
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
.sub "statementlist"  :subid("20_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_133
.annotate "line", 44
    .const 'Sub' $P147 = "21_1258904224.56063" 
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
    unless_null $P139, vivify_133
    new $P139, "Hash"
  vivify_133:
    set $P140, $P139["statement"]
    unless_null $P140, vivify_134
    new $P140, "Undef"
  vivify_134:
    unless $P140, if_138_end
.annotate "line", 47
    find_lex $P142, "$/"
    unless_null $P142, vivify_135
    new $P142, "Hash"
  vivify_135:
    set $P143, $P142["statement"]
    unless_null $P143, vivify_136
    new $P143, "Undef"
  vivify_136:
    defined $I144, $P143
    unless $I144, for_undef_137
    iter $P141, $P143
    new $P167, 'ExceptionHandler'
    set_addr $P167, loop166_handler
    $P167."handle_types"(65, 67, 66)
    push_eh $P167
  loop166_test:
    unless $P141, loop166_done
    shift $P145, $P141
  loop166_redo:
    .const 'Sub' $P147 = "21_1258904224.56063" 
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
  for_undef_137:
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
.sub "_block146"  :anon :subid("21_1258904224.56063") :outer("20_1258904224.56063")
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
.sub "statement"  :subid("22_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_176
    .param pmc param_177 :optional
    .param int has_param_177 :opt_flag
.annotate "line", 58
    .const 'Sub' $P185 = "23_1258904224.56063" 
    capture_lex $P185
    new $P175, 'ExceptionHandler'
    set_addr $P175, control_174
    $P175."handle_types"(58)
    push_eh $P175
    .lex "self", self
    .lex "$/", param_176
    if has_param_177, optparam_138
    new $P178, "Undef"
    set param_177, $P178
  optparam_138:
    .lex "$key", param_177
.annotate "line", 59
    new $P179, "Undef"
    .lex "$past", $P179
.annotate "line", 58
    find_lex $P180, "$past"
.annotate "line", 60
    find_lex $P182, "$/"
    unless_null $P182, vivify_139
    new $P182, "Hash"
  vivify_139:
    set $P183, $P182["EXPR"]
    unless_null $P183, vivify_140
    new $P183, "Undef"
  vivify_140:
    if $P183, if_181
.annotate "line", 74
    find_lex $P241, "$/"
    unless_null $P241, vivify_141
    new $P241, "Hash"
  vivify_141:
    set $P242, $P241["statement_control"]
    unless_null $P242, vivify_142
    new $P242, "Undef"
  vivify_142:
    if $P242, if_240
.annotate "line", 75
    new $P246, "Integer"
    assign $P246, 0
    store_lex "$past", $P246
    goto if_240_end
  if_240:
.annotate "line", 74
    find_lex $P243, "$/"
    unless_null $P243, vivify_143
    new $P243, "Hash"
  vivify_143:
    set $P244, $P243["statement_control"]
    unless_null $P244, vivify_144
    new $P244, "Undef"
  vivify_144:
    $P245 = $P244."ast"()
    store_lex "$past", $P245
  if_240_end:
    goto if_181_end
  if_181:
.annotate "line", 60
    .const 'Sub' $P185 = "23_1258904224.56063" 
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
.sub "_block184"  :anon :subid("23_1258904224.56063") :outer("22_1258904224.56063")
.annotate "line", 61
    new $P186, "Undef"
    .lex "$mc", $P186
.annotate "line", 62
    new $P187, "Undef"
    .lex "$ml", $P187
.annotate "line", 61
    find_lex $P188, "$/"
    unless_null $P188, vivify_145
    new $P188, "Hash"
  vivify_145:
    set $P189, $P188["statement_mod_cond"]
    unless_null $P189, vivify_146
    new $P189, "ResizablePMCArray"
  vivify_146:
    set $P190, $P189[0]
    unless_null $P190, vivify_147
    new $P190, "Undef"
  vivify_147:
    store_lex "$mc", $P190
.annotate "line", 62
    find_lex $P191, "$/"
    unless_null $P191, vivify_148
    new $P191, "Hash"
  vivify_148:
    set $P192, $P191["statement_mod_loop"]
    unless_null $P192, vivify_149
    new $P192, "ResizablePMCArray"
  vivify_149:
    set $P193, $P192[0]
    unless_null $P193, vivify_150
    new $P193, "Undef"
  vivify_150:
    store_lex "$ml", $P193
.annotate "line", 63
    find_lex $P196, "$mc"
    if $P196, if_195
.annotate "line", 68
    find_lex $P224, "$ml"
    if $P224, if_223
.annotate "line", 71
    find_lex $P237, "$/"
    unless_null $P237, vivify_151
    new $P237, "Hash"
  vivify_151:
    set $P238, $P237["EXPR"]
    unless_null $P238, vivify_152
    new $P238, "Undef"
  vivify_152:
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
    unless_null $P226, vivify_153
    new $P226, "Hash"
  vivify_153:
    set $P227, $P226["cond"]
    unless_null $P227, vivify_154
    new $P227, "Undef"
  vivify_154:
    $P228 = $P227."ast"()
    find_lex $P229, "$/"
    unless_null $P229, vivify_155
    new $P229, "Hash"
  vivify_155:
    set $P230, $P229["EXPR"]
    unless_null $P230, vivify_156
    new $P230, "Undef"
  vivify_156:
    $P231 = $P230."ast"()
    find_lex $P232, "$ml"
    unless_null $P232, vivify_157
    new $P232, "Hash"
  vivify_157:
    set $P233, $P232["sym"]
    unless_null $P233, vivify_158
    new $P233, "Undef"
  vivify_158:
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
    unless_null $P198, vivify_159
    new $P198, "Hash"
  vivify_159:
    set $P199, $P198["cond"]
    unless_null $P199, vivify_160
    new $P199, "Undef"
  vivify_160:
    $P200 = $P199."ast"()
    find_lex $P201, "$/"
    unless_null $P201, vivify_161
    new $P201, "Hash"
  vivify_161:
    set $P202, $P201["EXPR"]
    unless_null $P202, vivify_162
    new $P202, "Undef"
  vivify_162:
    $P203 = $P202."ast"()
    find_lex $P204, "$mc"
    unless_null $P204, vivify_163
    new $P204, "Hash"
  vivify_163:
    set $P205, $P204["sym"]
    unless_null $P205, vivify_164
    new $P205, "Undef"
  vivify_164:
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
    unless_null $P213, vivify_165
    new $P213, "Hash"
  vivify_165:
    set $P214, $P213["cond"]
    unless_null $P214, vivify_166
    new $P214, "Undef"
  vivify_166:
    $P215 = $P214."ast"()
    find_lex $P216, "$past"
    find_lex $P217, "$ml"
    unless_null $P217, vivify_167
    new $P217, "Hash"
  vivify_167:
    set $P218, $P217["sym"]
    unless_null $P218, vivify_168
    new $P218, "Undef"
  vivify_168:
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
.sub "xblock"  :subid("24_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P257, vivify_169
    new $P257, "Hash"
  vivify_169:
    set $P258, $P257["EXPR"]
    unless_null $P258, vivify_170
    new $P258, "Undef"
  vivify_170:
    $P259 = $P258."ast"()
    find_lex $P260, "$/"
    unless_null $P260, vivify_171
    new $P260, "Hash"
  vivify_171:
    set $P261, $P260["pblock"]
    unless_null $P261, vivify_172
    new $P261, "Undef"
  vivify_172:
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
.sub "pblock"  :subid("25_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P272, vivify_173
    new $P272, "Hash"
  vivify_173:
    set $P273, $P272["blockoid"]
    unless_null $P273, vivify_174
    new $P273, "Undef"
  vivify_174:
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
.sub "block"  :subid("26_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P282, vivify_175
    new $P282, "Hash"
  vivify_175:
    set $P283, $P282["blockoid"]
    unless_null $P283, vivify_176
    new $P283, "Undef"
  vivify_176:
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
.sub "blockoid"  :subid("27_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P293, vivify_177
    new $P293, "Hash"
  vivify_177:
    set $P294, $P293["statementlist"]
    unless_null $P294, vivify_178
    new $P294, "Undef"
  vivify_178:
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
.sub "newpad"  :subid("28_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P310, vivify_179
    new $P310, "ResizablePMCArray"
    set_global "@BLOCK", $P310
  vivify_179:
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
.sub "statement_control:sym<if>"  :subid("29_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_322
.annotate "line", 106
    .const 'Sub' $P352 = "30_1258904224.56063" 
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
    unless_null $P325, vivify_180
    new $P325, "Hash"
  vivify_180:
    set $P326, $P325["xblock"]
    unless_null $P326, vivify_181
    new $P326, "Undef"
  vivify_181:
    set $N327, $P326
    new $P328, 'Float'
    set $P328, $N327
    sub $P329, $P328, 1
    store_lex "$count", $P329
.annotate "line", 108
    find_lex $P330, "$count"
    set $I331, $P330
    find_lex $P332, "$/"
    unless_null $P332, vivify_182
    new $P332, "Hash"
  vivify_182:
    set $P333, $P332["xblock"]
    unless_null $P333, vivify_183
    new $P333, "ResizablePMCArray"
  vivify_183:
    set $P334, $P333[$I331]
    unless_null $P334, vivify_184
    new $P334, "Undef"
  vivify_184:
    $P335 = $P334."ast"()
    $P336 = "xblock_immediate"($P335)
    store_lex "$past", $P336
.annotate "line", 109
    find_lex $P338, "$/"
    unless_null $P338, vivify_185
    new $P338, "Hash"
  vivify_185:
    set $P339, $P338["else"]
    unless_null $P339, vivify_186
    new $P339, "Undef"
  vivify_186:
    unless $P339, if_337_end
.annotate "line", 110
    find_lex $P340, "$past"
    find_lex $P341, "$/"
    unless_null $P341, vivify_187
    new $P341, "Hash"
  vivify_187:
    set $P342, $P341["else"]
    unless_null $P342, vivify_188
    new $P342, "ResizablePMCArray"
  vivify_188:
    set $P343, $P342[0]
    unless_null $P343, vivify_189
    new $P343, "Undef"
  vivify_189:
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
    .const 'Sub' $P352 = "30_1258904224.56063" 
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
.sub "_block351"  :anon :subid("30_1258904224.56063") :outer("29_1258904224.56063")
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
    unless_null $P359, vivify_190
    new $P359, "Hash"
  vivify_190:
    set $P360, $P359["xblock"]
    unless_null $P360, vivify_191
    new $P360, "ResizablePMCArray"
  vivify_191:
    set $P361, $P360[$I358]
    unless_null $P361, vivify_192
    new $P361, "Undef"
  vivify_192:
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
.sub "statement_control:sym<unless>"  :subid("31_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P379, vivify_193
    new $P379, "Hash"
  vivify_193:
    set $P380, $P379["xblock"]
    unless_null $P380, vivify_194
    new $P380, "Undef"
  vivify_194:
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
.sub "statement_control:sym<while>"  :subid("32_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P393, vivify_195
    new $P393, "Hash"
  vivify_195:
    set $P394, $P393["xblock"]
    unless_null $P394, vivify_196
    new $P394, "Undef"
  vivify_196:
    $P395 = $P394."ast"()
    $P396 = "xblock_immediate"($P395)
    store_lex "$past", $P396
.annotate "line", 130
    find_lex $P397, "$past"
    find_lex $P398, "$/"
    unless_null $P398, vivify_197
    new $P398, "Hash"
  vivify_197:
    set $P399, $P398["sym"]
    unless_null $P399, vivify_198
    new $P399, "Undef"
  vivify_198:
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
.sub "statement_control:sym<repeat>"  :subid("33_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P412, vivify_199
    new $P412, "Hash"
  vivify_199:
    set $P413, $P412["wu"]
    unless_null $P413, vivify_200
    new $P413, "Undef"
  vivify_200:
    set $S414, $P413
    concat $P415, $P411, $S414
    store_lex "$pasttype", $P415
    find_lex $P416, "$past"
.annotate "line", 137
    find_lex $P418, "$/"
    unless_null $P418, vivify_201
    new $P418, "Hash"
  vivify_201:
    set $P419, $P418["xblock"]
    unless_null $P419, vivify_202
    new $P419, "Undef"
  vivify_202:
    if $P419, if_417
.annotate "line", 142
    get_hll_global $P426, ["PAST"], "Op"
    find_lex $P427, "$/"
    unless_null $P427, vivify_203
    new $P427, "Hash"
  vivify_203:
    set $P428, $P427["EXPR"]
    unless_null $P428, vivify_204
    new $P428, "Undef"
  vivify_204:
    $P429 = $P428."ast"()
    find_lex $P430, "$/"
    unless_null $P430, vivify_205
    new $P430, "Hash"
  vivify_205:
    set $P431, $P430["pblock"]
    unless_null $P431, vivify_206
    new $P431, "Undef"
  vivify_206:
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
    unless_null $P420, vivify_207
    new $P420, "Hash"
  vivify_207:
    set $P421, $P420["xblock"]
    unless_null $P421, vivify_208
    new $P421, "Undef"
  vivify_208:
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
.sub "statement_control:sym<for>"  :subid("34_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P447, vivify_209
    new $P447, "Hash"
  vivify_209:
    set $P448, $P447["xblock"]
    unless_null $P448, vivify_210
    new $P448, "Undef"
  vivify_210:
    $P449 = $P448."ast"()
    store_lex "$past", $P449
.annotate "line", 150
    find_lex $P450, "$past"
    $P450."pasttype"("for")
.annotate "line", 151
    find_lex $P451, "$past"
    unless_null $P451, vivify_211
    new $P451, "ResizablePMCArray"
  vivify_211:
    set $P452, $P451[1]
    unless_null $P452, vivify_212
    new $P452, "Undef"
  vivify_212:
    store_lex "$block", $P452
.annotate "line", 152
    find_lex $P454, "$block"
    $P455 = $P454."arity"()
    if $P455, unless_453_end
.annotate "line", 153
    find_lex $P456, "$block"
    unless_null $P456, vivify_213
    new $P456, "ResizablePMCArray"
  vivify_213:
    set $P457, $P456[0]
    unless_null $P457, vivify_214
    new $P457, "Undef"
  vivify_214:
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
.sub "statement_control:sym<return>"  :subid("35_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P473, vivify_215
    new $P473, "Hash"
  vivify_215:
    set $P474, $P473["EXPR"]
    unless_null $P474, vivify_216
    new $P474, "Undef"
  vivify_216:
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
.sub "statement_prefix:sym<INIT>"  :subid("36_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P484, vivify_217
    new $P484, "ResizablePMCArray"
  vivify_217:
    set $P485, $P484[0]
    unless_null $P485, vivify_218
    new $P485, "Undef"
  vivify_218:
    $P486 = $P485."loadinit"()
    find_lex $P487, "$/"
    unless_null $P487, vivify_219
    new $P487, "Hash"
  vivify_219:
    set $P488, $P487["blorst"]
    unless_null $P488, vivify_220
    new $P488, "Undef"
  vivify_220:
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
.sub "blorst"  :subid("37_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P503, vivify_221
    new $P503, "Hash"
  vivify_221:
    set $P504, $P503["block"]
    unless_null $P504, vivify_222
    new $P504, "Undef"
  vivify_222:
    if $P504, if_502
.annotate "line", 173
    find_lex $P509, "$/"
    unless_null $P509, vivify_223
    new $P509, "Hash"
  vivify_223:
    set $P510, $P509["statement"]
    unless_null $P510, vivify_224
    new $P510, "Undef"
  vivify_224:
    $P511 = $P510."ast"()
    set $P501, $P511
.annotate "line", 172
    goto if_502_end
  if_502:
    find_lex $P505, "$/"
    unless_null $P505, vivify_225
    new $P505, "Hash"
  vivify_225:
    set $P506, $P505["block"]
    unless_null $P506, vivify_226
    new $P506, "Undef"
  vivify_226:
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
.sub "statement_mod_cond:sym<if>"  :subid("38_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P519, vivify_227
    new $P519, "Hash"
  vivify_227:
    set $P520, $P519["cond"]
    unless_null $P520, vivify_228
    new $P520, "Undef"
  vivify_228:
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
.sub "statement_mod_cond:sym<unless>"  :subid("39_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P529, vivify_229
    new $P529, "Hash"
  vivify_229:
    set $P530, $P529["cond"]
    unless_null $P530, vivify_230
    new $P530, "Undef"
  vivify_230:
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
.sub "statement_mod_loop:sym<while>"  :subid("40_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P539, vivify_231
    new $P539, "Hash"
  vivify_231:
    set $P540, $P539["cond"]
    unless_null $P540, vivify_232
    new $P540, "Undef"
  vivify_232:
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
.sub "statement_mod_loop:sym<until>"  :subid("41_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P549, vivify_233
    new $P549, "Hash"
  vivify_233:
    set $P550, $P549["cond"]
    unless_null $P550, vivify_234
    new $P550, "Undef"
  vivify_234:
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
.sub "term:sym<colonpair>"  :subid("42_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P559, vivify_235
    new $P559, "Hash"
  vivify_235:
    set $P560, $P559["colonpair"]
    unless_null $P560, vivify_236
    new $P560, "Undef"
  vivify_236:
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
.sub "term:sym<variable>"  :subid("43_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P569, vivify_237
    new $P569, "Hash"
  vivify_237:
    set $P570, $P569["variable"]
    unless_null $P570, vivify_238
    new $P570, "Undef"
  vivify_238:
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
.sub "term:sym<package_declarator>"  :subid("44_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P579, vivify_239
    new $P579, "Hash"
  vivify_239:
    set $P580, $P579["package_declarator"]
    unless_null $P580, vivify_240
    new $P580, "Undef"
  vivify_240:
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
.sub "term:sym<scope_declarator>"  :subid("45_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P589, vivify_241
    new $P589, "Hash"
  vivify_241:
    set $P590, $P589["scope_declarator"]
    unless_null $P590, vivify_242
    new $P590, "Undef"
  vivify_242:
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
.sub "term:sym<routine_declarator>"  :subid("46_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P599, vivify_243
    new $P599, "Hash"
  vivify_243:
    set $P600, $P599["routine_declarator"]
    unless_null $P600, vivify_244
    new $P600, "Undef"
  vivify_244:
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
.sub "term:sym<regex_declarator>"  :subid("47_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P609, vivify_245
    new $P609, "Hash"
  vivify_245:
    set $P610, $P609["regex_declarator"]
    unless_null $P610, vivify_246
    new $P610, "Undef"
  vivify_246:
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
.sub "term:sym<statement_prefix>"  :subid("48_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P619, vivify_247
    new $P619, "Hash"
  vivify_247:
    set $P620, $P619["statement_prefix"]
    unless_null $P620, vivify_248
    new $P620, "Undef"
  vivify_248:
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
.sub "term:sym<lambda>"  :subid("49_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P629, vivify_249
    new $P629, "Hash"
  vivify_249:
    set $P630, $P629["pblock"]
    unless_null $P630, vivify_250
    new $P630, "Undef"
  vivify_250:
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
.sub "colonpair"  :subid("50_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P641, vivify_251
    new $P641, "Hash"
  vivify_251:
    set $P642, $P641["circumfix"]
    unless_null $P642, vivify_252
    new $P642, "Undef"
  vivify_252:
    if $P642, if_640
.annotate "line", 198
    get_hll_global $P647, ["PAST"], "Val"
    find_lex $P648, "$/"
    unless_null $P648, vivify_253
    new $P648, "Hash"
  vivify_253:
    set $P649, $P648["not"]
    unless_null $P649, vivify_254
    new $P649, "Undef"
  vivify_254:
    isfalse $I650, $P649
    $P651 = $P647."new"($I650 :named("value"))
    set $P639, $P651
.annotate "line", 197
    goto if_640_end
  if_640:
    find_lex $P643, "$/"
    unless_null $P643, vivify_255
    new $P643, "Hash"
  vivify_255:
    set $P644, $P643["circumfix"]
    unless_null $P644, vivify_256
    new $P644, "ResizablePMCArray"
  vivify_256:
    set $P645, $P644[0]
    unless_null $P645, vivify_257
    new $P645, "Undef"
  vivify_257:
    $P646 = $P645."ast"()
    set $P639, $P646
  if_640_end:
    store_lex "$past", $P639
.annotate "line", 199
    find_lex $P652, "$past"
    find_lex $P653, "$/"
    unless_null $P653, vivify_258
    new $P653, "Hash"
  vivify_258:
    set $P654, $P653["identifier"]
    unless_null $P654, vivify_259
    new $P654, "Undef"
  vivify_259:
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
.sub "variable"  :subid("51_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_663
.annotate "line", 203
    .const 'Sub' $P676 = "52_1258904224.56063" 
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
    unless_null $P667, vivify_260
    new $P667, "Hash"
  vivify_260:
    set $P668, $P667["postcircumfix"]
    unless_null $P668, vivify_261
    new $P668, "Undef"
  vivify_261:
    if $P668, if_666
.annotate "line", 209
    .const 'Sub' $P676 = "52_1258904224.56063" 
    capture_lex $P676
    $P676()
    goto if_666_end
  if_666:
.annotate "line", 206
    find_lex $P669, "$/"
    unless_null $P669, vivify_278
    new $P669, "Hash"
  vivify_278:
    set $P670, $P669["postcircumfix"]
    unless_null $P670, vivify_279
    new $P670, "Undef"
  vivify_279:
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
.sub "_block675"  :anon :subid("52_1258904224.56063") :outer("51_1258904224.56063")
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
    unless_null $P690, vivify_262
    new $P690, "ResizablePMCArray"
  vivify_262:
    set $P691, $P690[0]
    unless_null $P691, vivify_263
    new $P691, "Undef"
  vivify_263:
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
    unless_null $P699, vivify_264
    new $P699, "Hash"
  vivify_264:
    set $P700, $P699["sigil"]
    unless_null $P700, vivify_265
    new $P700, "Undef"
  vivify_265:
    $P701 = "sigiltype"($P700)
    $P698."viviself"($P701)
.annotate "line", 217
    find_lex $P702, "$past"
    $P702."lvalue"(1)
  if_687_end:
.annotate "line", 219
    find_lex $P705, "$/"
    unless_null $P705, vivify_266
    new $P705, "Hash"
  vivify_266:
    set $P706, $P705["twigil"]
    unless_null $P706, vivify_267
    new $P706, "ResizablePMCArray"
  vivify_267:
    set $P707, $P706[0]
    unless_null $P707, vivify_268
    new $P707, "Undef"
  vivify_268:
    set $S708, $P707
    iseq $I709, $S708, "*"
    if $I709, if_704
.annotate "line", 232
    find_lex $P731, "$/"
    unless_null $P731, vivify_269
    new $P731, "Hash"
  vivify_269:
    set $P732, $P731["twigil"]
    unless_null $P732, vivify_270
    new $P732, "ResizablePMCArray"
  vivify_270:
    set $P733, $P732[0]
    unless_null $P733, vivify_271
    new $P733, "Undef"
  vivify_271:
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
    unless_null $P741, vivify_272
    new $P741, "Hash"
  vivify_272:
    set $P742, $P741["sigil"]
    unless_null $P742, vivify_273
    new $P742, "Undef"
  vivify_273:
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
    unless_null $P713, vivify_274
    new $P713, "Hash"
  vivify_274:
    set $P714, $P713["sigil"]
    unless_null $P714, vivify_275
    new $P714, "Undef"
  vivify_275:
    set $S715, $P714
    new $P716, 'String'
    set $P716, $S715
    find_lex $P717, "$/"
    unless_null $P717, vivify_276
    new $P717, "Hash"
  vivify_276:
    set $P718, $P717["desigilname"]
    unless_null $P718, vivify_277
    new $P718, "Undef"
  vivify_277:
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
.sub "package_declarator:sym<module>"  :subid("53_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P754, vivify_280
    new $P754, "Hash"
  vivify_280:
    set $P755, $P754["package_def"]
    unless_null $P755, vivify_281
    new $P755, "Undef"
  vivify_281:
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
.sub "package_declarator:sym<class>"  :subid("54_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P766, vivify_282
    new $P766, "Hash"
  vivify_282:
    set $P767, $P766["package_def"]
    unless_null $P767, vivify_283
    new $P767, "Undef"
  vivify_283:
    $P768 = $P767."ast"()
    store_lex "$past", $P768
.annotate "line", 245
    get_hll_global $P769, ["PAST"], "Op"
.annotate "line", 246
    get_hll_global $P770, ["PAST"], "Op"
    $P771 = $P770."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate "line", 249
    find_lex $P772, "$/"
    unless_null $P772, vivify_284
    new $P772, "Hash"
  vivify_284:
    set $P773, $P772["package_def"]
    unless_null $P773, vivify_285
    new $P773, "Hash"
  vivify_285:
    set $P774, $P773["name"]
    unless_null $P774, vivify_286
    new $P774, "Undef"
  vivify_286:
    set $S775, $P774
    $P776 = $P769."new"($P771, $S775, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 245
    store_lex "$classinit", $P776
.annotate "line", 253
    find_lex $P779, "$/"
    unless_null $P779, vivify_287
    new $P779, "Hash"
  vivify_287:
    set $P780, $P779["package_def"]
    unless_null $P780, vivify_288
    new $P780, "Hash"
  vivify_288:
    set $P781, $P780["parent"]
    unless_null $P781, vivify_289
    new $P781, "ResizablePMCArray"
  vivify_289:
    set $P782, $P781[0]
    unless_null $P782, vivify_290
    new $P782, "Undef"
  vivify_290:
    set $S783, $P782
    unless $S783, unless_778
    new $P777, 'String'
    set $P777, $S783
    goto unless_778_end
  unless_778:
.annotate "line", 254
    find_lex $P786, "$/"
    unless_null $P786, vivify_291
    new $P786, "Hash"
  vivify_291:
    set $P787, $P786["sym"]
    unless_null $P787, vivify_292
    new $P787, "Undef"
  vivify_292:
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
    unless_null $P799, vivify_293
    new $P799, "Hash"
  vivify_293:
    set $P800, $P799["attributes"]
    unless_null $P800, vivify_294
    new $P800, "Undef"
  vivify_294:
    unless $P800, if_798_end
.annotate "line", 259
    find_lex $P801, "$classinit"
    find_lex $P802, "$past"
    unless_null $P802, vivify_295
    new $P802, "Hash"
  vivify_295:
    set $P803, $P802["attributes"]
    unless_null $P803, vivify_296
    new $P803, "Undef"
  vivify_296:
    $P801."push"($P803)
  if_798_end:
.annotate "line", 261
    get_global $P804, "@BLOCK"
    unless_null $P804, vivify_297
    new $P804, "ResizablePMCArray"
  vivify_297:
    set $P805, $P804[0]
    unless_null $P805, vivify_298
    new $P805, "Undef"
  vivify_298:
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
.sub "package_def"  :subid("55_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P819, vivify_299
    new $P819, "Hash"
  vivify_299:
    set $P820, $P819["block"]
    unless_null $P820, vivify_300
    new $P820, "Undef"
  vivify_300:
    if $P820, if_818
    find_lex $P824, "$/"
    unless_null $P824, vivify_301
    new $P824, "Hash"
  vivify_301:
    set $P825, $P824["comp_unit"]
    unless_null $P825, vivify_302
    new $P825, "Undef"
  vivify_302:
    $P826 = $P825."ast"()
    set $P817, $P826
    goto if_818_end
  if_818:
    find_lex $P821, "$/"
    unless_null $P821, vivify_303
    new $P821, "Hash"
  vivify_303:
    set $P822, $P821["block"]
    unless_null $P822, vivify_304
    new $P822, "Undef"
  vivify_304:
    $P823 = $P822."ast"()
    set $P817, $P823
  if_818_end:
    store_lex "$past", $P817
.annotate "line", 267
    find_lex $P827, "$past"
    find_lex $P828, "$/"
    unless_null $P828, vivify_305
    new $P828, "Hash"
  vivify_305:
    set $P829, $P828["name"]
    unless_null $P829, vivify_306
    new $P829, "Hash"
  vivify_306:
    set $P830, $P829["identifier"]
    unless_null $P830, vivify_307
    new $P830, "Undef"
  vivify_307:
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
.sub "scope_declarator:sym<my>"  :subid("56_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P841, vivify_308
    new $P841, "Hash"
  vivify_308:
    set $P842, $P841["scoped"]
    unless_null $P842, vivify_309
    new $P842, "Undef"
  vivify_309:
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
.sub "scope_declarator:sym<our>"  :subid("57_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P851, vivify_310
    new $P851, "Hash"
  vivify_310:
    set $P852, $P851["scoped"]
    unless_null $P852, vivify_311
    new $P852, "Undef"
  vivify_311:
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
.sub "scope_declarator:sym<has>"  :subid("58_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P861, vivify_312
    new $P861, "Hash"
  vivify_312:
    set $P862, $P861["scoped"]
    unless_null $P862, vivify_313
    new $P862, "Undef"
  vivify_313:
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
.sub "scoped"  :subid("59_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P873, vivify_314
    new $P873, "Hash"
  vivify_314:
    set $P874, $P873["routine_declarator"]
    unless_null $P874, vivify_315
    new $P874, "Undef"
  vivify_315:
    if $P874, if_872
.annotate "line", 279
    find_lex $P878, "$/"
    unless_null $P878, vivify_316
    new $P878, "Hash"
  vivify_316:
    set $P879, $P878["variable_declarator"]
    unless_null $P879, vivify_317
    new $P879, "Undef"
  vivify_317:
    $P880 = $P879."ast"()
    set $P871, $P880
.annotate "line", 278
    goto if_872_end
  if_872:
    find_lex $P875, "$/"
    unless_null $P875, vivify_318
    new $P875, "Hash"
  vivify_318:
    set $P876, $P875["routine_declarator"]
    unless_null $P876, vivify_319
    new $P876, "Undef"
  vivify_319:
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
.sub "variable_declarator"  :subid("60_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_886
.annotate "line", 282
    .const 'Sub' $P926 = "61_1258904224.56063" 
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
    unless_null $P891, vivify_320
    new $P891, "Hash"
  vivify_320:
    set $P892, $P891["variable"]
    unless_null $P892, vivify_321
    new $P892, "Undef"
  vivify_321:
    $P893 = $P892."ast"()
    store_lex "$past", $P893
.annotate "line", 284
    find_lex $P894, "$/"
    unless_null $P894, vivify_322
    new $P894, "Hash"
  vivify_322:
    set $P895, $P894["variable"]
    unless_null $P895, vivify_323
    new $P895, "Hash"
  vivify_323:
    set $P896, $P895["sigil"]
    unless_null $P896, vivify_324
    new $P896, "Undef"
  vivify_324:
    store_lex "$sigil", $P896
.annotate "line", 285
    find_lex $P897, "$past"
    $P898 = $P897."name"()
    store_lex "$name", $P898
.annotate "line", 286
    get_global $P899, "@BLOCK"
    unless_null $P899, vivify_325
    new $P899, "ResizablePMCArray"
  vivify_325:
    set $P900, $P899[0]
    unless_null $P900, vivify_326
    new $P900, "Undef"
  vivify_326:
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
    unless_null $P909, vivify_327
    get_hll_global $P909, "$SCOPE"
    unless_null $P909, vivify_328
    die "Contextual $*SCOPE not found"
  vivify_328:
  vivify_327:
    set $S910, $P909
    iseq $I911, $S910, "has"
    if $I911, if_908
.annotate "line", 299
    .const 'Sub' $P926 = "61_1258904224.56063" 
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
    unless_null $P915, vivify_333
    new $P915, "Hash"
  vivify_333:
    set $P916, $P915["attributes"]
    unless_null $P916, vivify_334
    new $P916, "Undef"
  vivify_334:
    if $P916, unless_914_end
.annotate "line", 294
    get_hll_global $P917, ["PAST"], "Op"
    $P918 = $P917."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P919, "$BLOCK"
    unless_null $P919, vivify_335
    new $P919, "Hash"
    store_lex "$BLOCK", $P919
  vivify_335:
    set $P919["attributes"], $P918
  unless_914_end:
.annotate "line", 296
    find_lex $P920, "$BLOCK"
    unless_null $P920, vivify_336
    new $P920, "Hash"
  vivify_336:
    set $P921, $P920["attributes"]
    unless_null $P921, vivify_337
    new $P921, "Undef"
  vivify_337:
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
.sub "_block925"  :anon :subid("61_1258904224.56063") :outer("60_1258904224.56063")
.annotate "line", 300
    new $P927, "Undef"
    .lex "$scope", $P927
.annotate "line", 301
    new $P928, "Undef"
    .lex "$decl", $P928
.annotate "line", 300
    find_dynamic_lex $P931, "$*SCOPE"
    unless_null $P931, vivify_329
    get_hll_global $P931, "$SCOPE"
    unless_null $P931, vivify_330
    die "Contextual $*SCOPE not found"
  vivify_330:
  vivify_329:
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
    unless_null $P946, vivify_331
    new $P946, "ResizablePMCArray"
  vivify_331:
    set $P947, $P946[0]
    unless_null $P947, vivify_332
    new $P947, "Undef"
  vivify_332:
    find_lex $P948, "$decl"
    $P949 = $P947."push"($P948)
.annotate "line", 299
    .return ($P949)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<sub>"  :subid("62_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P959, vivify_338
    new $P959, "Hash"
  vivify_338:
    set $P960, $P959["routine_def"]
    unless_null $P960, vivify_339
    new $P960, "Undef"
  vivify_339:
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
.sub "routine_declarator:sym<method>"  :subid("63_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P969, vivify_340
    new $P969, "Hash"
  vivify_340:
    set $P970, $P969["method_def"]
    unless_null $P970, vivify_341
    new $P970, "Undef"
  vivify_341:
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
.sub "routine_def"  :subid("64_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_977
.annotate "line", 313
    .const 'Sub' $P988 = "65_1258904224.56063" 
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
    unless_null $P979, vivify_342
    new $P979, "Hash"
  vivify_342:
    set $P980, $P979["blockoid"]
    unless_null $P980, vivify_343
    new $P980, "Undef"
  vivify_343:
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
    unless_null $P985, vivify_344
    new $P985, "Hash"
  vivify_344:
    set $P986, $P985["deflongname"]
    unless_null $P986, vivify_345
    new $P986, "Undef"
  vivify_345:
    unless $P986, if_984_end
    .const 'Sub' $P988 = "65_1258904224.56063" 
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
.sub "_block987"  :anon :subid("65_1258904224.56063") :outer("64_1258904224.56063")
.annotate "line", 318
    new $P989, "Undef"
    .lex "$name", $P989
    find_lex $P990, "$/"
    unless_null $P990, vivify_346
    new $P990, "Hash"
  vivify_346:
    set $P991, $P990["deflongname"]
    unless_null $P991, vivify_347
    new $P991, "ResizablePMCArray"
  vivify_347:
    set $P992, $P991[0]
    unless_null $P992, vivify_348
    new $P992, "Undef"
  vivify_348:
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
    unless_null $P1000, vivify_349
    get_hll_global $P1000, "$SCOPE"
    unless_null $P1000, vivify_350
    die "Contextual $*SCOPE not found"
  vivify_350:
  vivify_349:
    set $S1001, $P1000
    isne $I1002, $S1001, "our"
    if $I1002, if_999
    new $P998, 'Integer'
    set $P998, $I1002
    goto if_999_end
  if_999:
.annotate "line", 321
    get_global $P1003, "@BLOCK"
    unless_null $P1003, vivify_351
    new $P1003, "ResizablePMCArray"
  vivify_351:
    set $P1004, $P1003[0]
    unless_null $P1004, vivify_352
    new $P1004, "ResizablePMCArray"
  vivify_352:
    set $P1005, $P1004[0]
    unless_null $P1005, vivify_353
    new $P1005, "Undef"
  vivify_353:
    get_hll_global $P1006, ["PAST"], "Var"
    find_lex $P1007, "$name"
    find_lex $P1008, "$past"
    $P1009 = $P1006."new"($P1007 :named("name"), 1 :named("isdecl"), $P1008 :named("viviself"), "lexical" :named("scope"))
    $P1005."push"($P1009)
.annotate "line", 323
    get_global $P1010, "@BLOCK"
    unless_null $P1010, vivify_354
    new $P1010, "ResizablePMCArray"
  vivify_354:
    set $P1011, $P1010[0]
    unless_null $P1011, vivify_355
    new $P1011, "Undef"
  vivify_355:
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
.sub "method_def"  :subid("66_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_1023
.annotate "line", 331
    .const 'Sub' $P1039 = "67_1258904224.56063" 
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
    unless_null $P1025, vivify_356
    new $P1025, "Hash"
  vivify_356:
    set $P1026, $P1025["blockoid"]
    unless_null $P1026, vivify_357
    new $P1026, "Undef"
  vivify_357:
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
    unless_null $P1030, vivify_358
    new $P1030, "ResizablePMCArray"
  vivify_358:
    set $P1031, $P1030[0]
    unless_null $P1031, vivify_359
    new $P1031, "Undef"
  vivify_359:
    get_hll_global $P1032, ["PAST"], "Op"
    $P1033 = $P1032."new"("    .lex \"self\", self" :named("inline"))
    $P1031."unshift"($P1033)
.annotate "line", 336
    find_lex $P1034, "$past"
    $P1034."symbol"("self", "lexical" :named("scope"))
.annotate "line", 337
    find_lex $P1036, "$/"
    unless_null $P1036, vivify_360
    new $P1036, "Hash"
  vivify_360:
    set $P1037, $P1036["deflongname"]
    unless_null $P1037, vivify_361
    new $P1037, "Undef"
  vivify_361:
    unless $P1037, if_1035_end
    .const 'Sub' $P1039 = "67_1258904224.56063" 
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
.sub "_block1038"  :anon :subid("67_1258904224.56063") :outer("66_1258904224.56063")
.annotate "line", 338
    new $P1040, "Undef"
    .lex "$name", $P1040
    find_lex $P1041, "$/"
    unless_null $P1041, vivify_362
    new $P1041, "Hash"
  vivify_362:
    set $P1042, $P1041["deflongname"]
    unless_null $P1042, vivify_363
    new $P1042, "ResizablePMCArray"
  vivify_363:
    set $P1043, $P1042[0]
    unless_null $P1043, vivify_364
    new $P1043, "Undef"
  vivify_364:
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
.sub "signature"  :subid("68_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_1057
.annotate "line", 345
    .const 'Sub' $P1068 = "69_1258904224.56063" 
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
    unless_null $P1059, vivify_365
    new $P1059, "ResizablePMCArray"
  vivify_365:
    set $P1060, $P1059[0]
    unless_null $P1060, vivify_366
    new $P1060, "ResizablePMCArray"
  vivify_366:
    set $P1061, $P1060[0]
    unless_null $P1061, vivify_367
    new $P1061, "Undef"
  vivify_367:
    store_lex "$BLOCKINIT", $P1061
.annotate "line", 347
    find_lex $P1063, "$/"
    unless_null $P1063, vivify_368
    new $P1063, "Hash"
  vivify_368:
    set $P1064, $P1063["parameter"]
    unless_null $P1064, vivify_369
    new $P1064, "Undef"
  vivify_369:
    defined $I1065, $P1064
    unless $I1065, for_undef_370
    iter $P1062, $P1064
    new $P1075, 'ExceptionHandler'
    set_addr $P1075, loop1074_handler
    $P1075."handle_types"(65, 67, 66)
    push_eh $P1075
  loop1074_test:
    unless $P1062, loop1074_done
    shift $P1066, $P1062
  loop1074_redo:
    .const 'Sub' $P1068 = "69_1258904224.56063" 
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
  for_undef_370:
.annotate "line", 345
    .return ($P1062)
  control_1055:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1077, exception, "payload"
    .return ($P1077)
.end


.namespace ["NQP";"Actions"]
.sub "_block1067"  :anon :subid("69_1258904224.56063") :outer("68_1258904224.56063")
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
.sub "parameter"  :subid("70_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P1084, vivify_371
    new $P1084, "Hash"
  vivify_371:
    set $P1085, $P1084["quant"]
    unless_null $P1085, vivify_372
    new $P1085, "Undef"
  vivify_372:
    store_lex "$quant", $P1085
    find_lex $P1086, "$past"
.annotate "line", 353
    find_lex $P1088, "$/"
    unless_null $P1088, vivify_373
    new $P1088, "Hash"
  vivify_373:
    set $P1089, $P1088["named_param"]
    unless_null $P1089, vivify_374
    new $P1089, "Undef"
  vivify_374:
    if $P1089, if_1087
.annotate "line", 360
    find_lex $P1103, "$/"
    unless_null $P1103, vivify_375
    new $P1103, "Hash"
  vivify_375:
    set $P1104, $P1103["param_var"]
    unless_null $P1104, vivify_376
    new $P1104, "Undef"
  vivify_376:
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
    unless_null $P1122, vivify_377
    new $P1122, "Hash"
  vivify_377:
    set $P1123, $P1122["param_var"]
    unless_null $P1123, vivify_378
    new $P1123, "Hash"
  vivify_378:
    set $P1124, $P1123["sigil"]
    unless_null $P1124, vivify_379
    new $P1124, "Undef"
  vivify_379:
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
    unless_null $P1112, vivify_380
    new $P1112, "Hash"
  vivify_380:
    set $P1113, $P1112["param_var"]
    unless_null $P1113, vivify_381
    new $P1113, "Hash"
  vivify_381:
    set $P1114, $P1113["sigil"]
    unless_null $P1114, vivify_382
    new $P1114, "Undef"
  vivify_382:
    set $S1115, $P1114
    iseq $I1116, $S1115, "%"
    $P1111."named"($I1116)
  if_1106_end:
.annotate "line", 359
    goto if_1087_end
  if_1087:
.annotate "line", 354
    find_lex $P1090, "$/"
    unless_null $P1090, vivify_383
    new $P1090, "Hash"
  vivify_383:
    set $P1091, $P1090["named_param"]
    unless_null $P1091, vivify_384
    new $P1091, "Undef"
  vivify_384:
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
    unless_null $P1098, vivify_385
    new $P1098, "Hash"
  vivify_385:
    set $P1099, $P1098["named_param"]
    unless_null $P1099, vivify_386
    new $P1099, "Hash"
  vivify_386:
    set $P1100, $P1099["param_var"]
    unless_null $P1100, vivify_387
    new $P1100, "Hash"
  vivify_387:
    set $P1101, $P1100["sigil"]
    unless_null $P1101, vivify_388
    new $P1101, "Undef"
  vivify_388:
    $P1102 = "sigiltype"($P1101)
    $P1097."viviself"($P1102)
  if_1093_end:
  if_1087_end:
.annotate "line", 369
    find_lex $P1127, "$/"
    unless_null $P1127, vivify_389
    new $P1127, "Hash"
  vivify_389:
    set $P1128, $P1127["default_value"]
    unless_null $P1128, vivify_390
    new $P1128, "Undef"
  vivify_390:
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
    unless_null $P1142, vivify_391
    new $P1142, "Hash"
  vivify_391:
    set $P1143, $P1142["default_value"]
    unless_null $P1143, vivify_392
    new $P1143, "ResizablePMCArray"
  vivify_392:
    set $P1144, $P1143[0]
    unless_null $P1144, vivify_393
    new $P1144, "Hash"
  vivify_393:
    set $P1145, $P1144["EXPR"]
    unless_null $P1145, vivify_394
    new $P1145, "Undef"
  vivify_394:
    $P1146 = $P1145."ast"()
    $P1141."viviself"($P1146)
  if_1126_end:
.annotate "line", 378
    find_lex $P1148, "$past"
    $P1149 = $P1148."viviself"()
    if $P1149, unless_1147_end
    get_global $P1150, "@BLOCK"
    unless_null $P1150, vivify_395
    new $P1150, "ResizablePMCArray"
  vivify_395:
    set $P1151, $P1150[0]
    unless_null $P1151, vivify_396
    new $P1151, "Undef"
  vivify_396:
    get_global $P1152, "@BLOCK"
    unless_null $P1152, vivify_397
    new $P1152, "ResizablePMCArray"
  vivify_397:
    set $P1153, $P1152[0]
    unless_null $P1153, vivify_398
    new $P1153, "Undef"
  vivify_398:
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
.sub "param_var"  :subid("71_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P1175, vivify_399
    new $P1175, "ResizablePMCArray"
  vivify_399:
    set $P1176, $P1175[0]
    unless_null $P1176, vivify_400
    new $P1176, "Undef"
  vivify_400:
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
.sub "named_param"  :subid("72_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P1187, vivify_401
    new $P1187, "Hash"
  vivify_401:
    set $P1188, $P1187["param_var"]
    unless_null $P1188, vivify_402
    new $P1188, "Undef"
  vivify_402:
    $P1189 = $P1188."ast"()
    store_lex "$past", $P1189
.annotate "line", 392
    find_lex $P1190, "$past"
    find_lex $P1191, "$/"
    unless_null $P1191, vivify_403
    new $P1191, "Hash"
  vivify_403:
    set $P1192, $P1191["param_var"]
    unless_null $P1192, vivify_404
    new $P1192, "Hash"
  vivify_404:
    set $P1193, $P1192["name"]
    unless_null $P1193, vivify_405
    new $P1193, "Undef"
  vivify_405:
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
.sub "regex_declarator"  :subid("73_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_1202
    .param pmc param_1203 :optional
    .param int has_param_1203 :opt_flag
.annotate "line", 396
    .const 'Sub' $P1220 = "74_1258904224.56063" 
    capture_lex $P1220
    new $P1201, 'ExceptionHandler'
    set_addr $P1201, control_1200
    $P1201."handle_types"(58)
    push_eh $P1201
    .lex "self", self
    .lex "$/", param_1202
    if has_param_1203, optparam_406
    new $P1204, "Undef"
    set param_1203, $P1204
  optparam_406:
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
    unless_null $P1209, vivify_407
    new $P1209, "Hash"
  vivify_407:
    set $P1210, $P1209["deflongname"]
    unless_null $P1210, vivify_408
    new $P1210, "Undef"
  vivify_408:
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
    unless_null $P1248, vivify_409
    new $P1248, "Hash"
  vivify_409:
    set $P1249, $P1248["proto"]
    unless_null $P1249, vivify_410
    new $P1249, "Undef"
  vivify_410:
    if $P1249, if_1247
.annotate "line", 444
    get_hll_global $P1272, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1273, "$/"
    unless_null $P1273, vivify_411
    new $P1273, "Hash"
  vivify_411:
    set $P1274, $P1273["p6regex"]
    unless_null $P1274, vivify_412
    new $P1274, "Undef"
  vivify_412:
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
    .const 'Sub' $P1220 = "74_1258904224.56063" 
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
.sub "_block1219"  :anon :subid("74_1258904224.56063") :outer("73_1258904224.56063")
.annotate "line", 403
    new $P1221, "Hash"
    .lex "%h", $P1221
.annotate "line", 402
    find_lex $P1222, "%h"
.annotate "line", 404
    find_lex $P1224, "$/"
    unless_null $P1224, vivify_413
    new $P1224, "Hash"
  vivify_413:
    set $P1225, $P1224["sym"]
    unless_null $P1225, vivify_414
    new $P1225, "Undef"
  vivify_414:
    set $S1226, $P1225
    iseq $I1227, $S1226, "token"
    unless $I1227, if_1223_end
    new $P1228, "Integer"
    assign $P1228, 1
    find_lex $P1229, "%h"
    unless_null $P1229, vivify_415
    new $P1229, "Hash"
    store_lex "%h", $P1229
  vivify_415:
    set $P1229["r"], $P1228
  if_1223_end:
.annotate "line", 405
    find_lex $P1231, "$/"
    unless_null $P1231, vivify_416
    new $P1231, "Hash"
  vivify_416:
    set $P1232, $P1231["sym"]
    unless_null $P1232, vivify_417
    new $P1232, "Undef"
  vivify_417:
    set $S1233, $P1232
    iseq $I1234, $S1233, "rule"
    unless $I1234, if_1230_end
    new $P1235, "Integer"
    assign $P1235, 1
    find_lex $P1236, "%h"
    unless_null $P1236, vivify_418
    new $P1236, "Hash"
    store_lex "%h", $P1236
  vivify_418:
    set $P1236["r"], $P1235
    new $P1237, "Integer"
    assign $P1237, 1
    find_lex $P1238, "%h"
    unless_null $P1238, vivify_419
    new $P1238, "Hash"
    store_lex "%h", $P1238
  vivify_419:
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
    unless_null $P1241, vivify_420
    new $P1241, "ResizablePMCArray"
  vivify_420:
    set $P1242, $P1241[0]
    unless_null $P1242, vivify_421
    new $P1242, "Undef"
  vivify_421:
    $P1242."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate "line", 412
    get_global $P1243, "@BLOCK"
    unless_null $P1243, vivify_422
    new $P1243, "ResizablePMCArray"
  vivify_422:
    set $P1244, $P1243[0]
    unless_null $P1244, vivify_423
    new $P1244, "Undef"
  vivify_423:
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
.sub "dotty"  :subid("75_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P1293, vivify_424
    new $P1293, "Hash"
  vivify_424:
    set $P1294, $P1293["args"]
    unless_null $P1294, vivify_425
    new $P1294, "Undef"
  vivify_425:
    if $P1294, if_1292
    get_hll_global $P1299, ["PAST"], "Op"
    find_lex $P1300, "$/"
    $P1301 = $P1299."new"($P1300 :named("node"))
    set $P1291, $P1301
    goto if_1292_end
  if_1292:
    find_lex $P1295, "$/"
    unless_null $P1295, vivify_426
    new $P1295, "Hash"
  vivify_426:
    set $P1296, $P1295["args"]
    unless_null $P1296, vivify_427
    new $P1296, "ResizablePMCArray"
  vivify_427:
    set $P1297, $P1296[0]
    unless_null $P1297, vivify_428
    new $P1297, "Undef"
  vivify_428:
    $P1298 = $P1297."ast"()
    set $P1291, $P1298
  if_1292_end:
    store_lex "$past", $P1291
.annotate "line", 454
    find_lex $P1302, "$past"
    find_lex $P1305, "$/"
    unless_null $P1305, vivify_429
    new $P1305, "Hash"
  vivify_429:
    set $P1306, $P1305["quote"]
    unless_null $P1306, vivify_430
    new $P1306, "Undef"
  vivify_430:
    if $P1306, if_1304
    find_lex $P1310, "$/"
    unless_null $P1310, vivify_431
    new $P1310, "Hash"
  vivify_431:
    set $P1311, $P1310["longname"]
    unless_null $P1311, vivify_432
    new $P1311, "Undef"
  vivify_432:
    set $S1312, $P1311
    new $P1303, 'String'
    set $P1303, $S1312
    goto if_1304_end
  if_1304:
    find_lex $P1307, "$/"
    unless_null $P1307, vivify_433
    new $P1307, "Hash"
  vivify_433:
    set $P1308, $P1307["quote"]
    unless_null $P1308, vivify_434
    new $P1308, "Undef"
  vivify_434:
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
.sub "term:sym<self>"  :subid("76_1258904224.56063") :method :outer("11_1258904224.56063")
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
.sub "term:sym<identifier>"  :subid("77_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P1332, vivify_435
    new $P1332, "Hash"
  vivify_435:
    set $P1333, $P1332["args"]
    unless_null $P1333, vivify_436
    new $P1333, "Undef"
  vivify_436:
    $P1334 = $P1333."ast"()
    store_lex "$past", $P1334
.annotate "line", 467
    find_lex $P1335, "$past"
    find_lex $P1336, "$/"
    unless_null $P1336, vivify_437
    new $P1336, "Hash"
  vivify_437:
    set $P1337, $P1336["identifier"]
    unless_null $P1337, vivify_438
    new $P1337, "Undef"
  vivify_438:
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
.sub "term:sym<name>"  :subid("78_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P1351, vivify_439
    new $P1351, "Hash"
  vivify_439:
    set $P1352, $P1351["name"]
    unless_null $P1352, vivify_440
    new $P1352, "Hash"
  vivify_440:
    set $P1353, $P1352["identifier"]
    unless_null $P1353, vivify_441
    new $P1353, "Undef"
  vivify_441:
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
    unless_null $P1361, vivify_442
    new $P1361, "ResizablePMCArray"
  vivify_442:
    set $P1362, $P1361[0]
    unless_null $P1362, vivify_443
    new $P1362, "Undef"
  vivify_443:
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
    unless_null $P1373, vivify_444
    new $P1373, "Hash"
  vivify_444:
    set $P1374, $P1373["args"]
    unless_null $P1374, vivify_445
    new $P1374, "Undef"
  vivify_445:
    unless $P1374, if_1372_end
.annotate "line", 479
    find_lex $P1375, "$/"
    unless_null $P1375, vivify_446
    new $P1375, "Hash"
  vivify_446:
    set $P1376, $P1375["args"]
    unless_null $P1376, vivify_447
    new $P1376, "ResizablePMCArray"
  vivify_447:
    set $P1377, $P1376[0]
    unless_null $P1377, vivify_448
    new $P1377, "Undef"
  vivify_448:
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
.sub "term:sym<pir::op>"  :subid("79_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P1393, vivify_449
    new $P1393, "Hash"
  vivify_449:
    set $P1394, $P1393["args"]
    unless_null $P1394, vivify_450
    new $P1394, "Undef"
  vivify_450:
    if $P1394, if_1392
    get_hll_global $P1399, ["PAST"], "Op"
    find_lex $P1400, "$/"
    $P1401 = $P1399."new"($P1400 :named("node"))
    set $P1391, $P1401
    goto if_1392_end
  if_1392:
    find_lex $P1395, "$/"
    unless_null $P1395, vivify_451
    new $P1395, "Hash"
  vivify_451:
    set $P1396, $P1395["args"]
    unless_null $P1396, vivify_452
    new $P1396, "ResizablePMCArray"
  vivify_452:
    set $P1397, $P1396[0]
    unless_null $P1397, vivify_453
    new $P1397, "Undef"
  vivify_453:
    $P1398 = $P1397."ast"()
    set $P1391, $P1398
  if_1392_end:
    store_lex "$past", $P1391
.annotate "line", 487
    find_lex $P1402, "$/"
    unless_null $P1402, vivify_454
    new $P1402, "Hash"
  vivify_454:
    set $P1403, $P1402["op"]
    unless_null $P1403, vivify_455
    new $P1403, "Undef"
  vivify_455:
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
.sub "args"  :subid("80_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P1419, vivify_456
    new $P1419, "Hash"
  vivify_456:
    set $P1420, $P1419["arglist"]
    unless_null $P1420, vivify_457
    new $P1420, "Undef"
  vivify_457:
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
.sub "arglist"  :subid("81_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_1427
.annotate "line", 502
    .const 'Sub' $P1438 = "82_1258904224.56063" 
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
    unless_null $P1435, vivify_458
    new $P1435, "Hash"
  vivify_458:
    set $P1436, $P1435["EXPR"]
    unless_null $P1436, vivify_459
    new $P1436, "Undef"
  vivify_459:
    unless $P1436, if_1434_end
    .const 'Sub' $P1438 = "82_1258904224.56063" 
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
    unless_null $P1483, vivify_463
    new $P1483, "ResizablePMCArray"
  vivify_463:
    set $P1484, $P1483[$I1482]
    unless_null $P1484, vivify_464
    new $P1484, "Undef"
  vivify_464:
    $S1485 = $P1484."name"()
    iseq $I1486, $S1485, "&prefix:<|>"
    unless $I1486, if_1480_end
.annotate "line", 515
    find_lex $P1487, "$i"
    set $I1488, $P1487
    find_lex $P1489, "$past"
    unless_null $P1489, vivify_465
    new $P1489, "ResizablePMCArray"
  vivify_465:
    set $P1490, $P1489[$I1488]
    unless_null $P1490, vivify_466
    new $P1490, "ResizablePMCArray"
  vivify_466:
    set $P1491, $P1490[0]
    unless_null $P1491, vivify_467
    new $P1491, "Undef"
  vivify_467:
    find_lex $P1492, "$i"
    set $I1493, $P1492
    find_lex $P1494, "$past"
    unless_null $P1494, vivify_468
    new $P1494, "ResizablePMCArray"
    store_lex "$past", $P1494
  vivify_468:
    set $P1494[$I1493], $P1491
.annotate "line", 516
    find_lex $P1495, "$i"
    set $I1496, $P1495
    find_lex $P1497, "$past"
    unless_null $P1497, vivify_469
    new $P1497, "ResizablePMCArray"
  vivify_469:
    set $P1498, $P1497[$I1496]
    unless_null $P1498, vivify_470
    new $P1498, "Undef"
  vivify_470:
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
.sub "_block1437"  :anon :subid("82_1258904224.56063") :outer("81_1258904224.56063")
.annotate "line", 504
    .const 'Sub' $P1459 = "83_1258904224.56063" 
    capture_lex $P1459
.annotate "line", 505
    new $P1439, "Undef"
    .lex "$expr", $P1439
    find_lex $P1440, "$/"
    unless_null $P1440, vivify_460
    new $P1440, "Hash"
  vivify_460:
    set $P1441, $P1440["EXPR"]
    unless_null $P1441, vivify_461
    new $P1441, "Undef"
  vivify_461:
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
    unless $I1456, for_undef_462
    iter $P1453, $P1455
    new $P1465, 'ExceptionHandler'
    set_addr $P1465, loop1464_handler
    $P1465."handle_types"(65, 67, 66)
    push_eh $P1465
  loop1464_test:
    unless $P1453, loop1464_done
    shift $P1457, $P1453
  loop1464_redo:
    .const 'Sub' $P1459 = "83_1258904224.56063" 
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
  for_undef_462:
.annotate "line", 506
    set $P1443, $P1453
  if_1444_end:
.annotate "line", 504
    .return ($P1443)
.end


.namespace ["NQP";"Actions"]
.sub "_block1458"  :anon :subid("83_1258904224.56063") :outer("82_1258904224.56063")
    .param pmc param_1460
.annotate "line", 507
    .lex "$_", param_1460
    find_lex $P1461, "$past"
    find_lex $P1462, "$_"
    $P1463 = $P1461."push"($P1462)
    .return ($P1463)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<value>"  :subid("84_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P1513, vivify_471
    new $P1513, "Hash"
  vivify_471:
    set $P1514, $P1513["value"]
    unless_null $P1514, vivify_472
    new $P1514, "Undef"
  vivify_472:
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
.sub "circumfix:sym<( )>"  :subid("85_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P1525, vivify_473
    new $P1525, "Hash"
  vivify_473:
    set $P1526, $P1525["EXPR"]
    unless_null $P1526, vivify_474
    new $P1526, "Undef"
  vivify_474:
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
    unless_null $P1527, vivify_475
    new $P1527, "Hash"
  vivify_475:
    set $P1528, $P1527["EXPR"]
    unless_null $P1528, vivify_476
    new $P1528, "ResizablePMCArray"
  vivify_476:
    set $P1529, $P1528[0]
    unless_null $P1529, vivify_477
    new $P1529, "Undef"
  vivify_477:
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
.sub "circumfix:sym<[ ]>"  :subid("86_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P1543, vivify_478
    new $P1543, "Hash"
  vivify_478:
    set $P1544, $P1543["EXPR"]
    unless_null $P1544, vivify_479
    new $P1544, "Undef"
  vivify_479:
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
    unless_null $P1545, vivify_480
    new $P1545, "Hash"
  vivify_480:
    set $P1546, $P1545["EXPR"]
    unless_null $P1546, vivify_481
    new $P1546, "ResizablePMCArray"
  vivify_481:
    set $P1547, $P1546[0]
    unless_null $P1547, vivify_482
    new $P1547, "Undef"
  vivify_482:
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
.sub "circumfix:sym<ang>"  :subid("87_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P1568, vivify_483
    new $P1568, "Hash"
  vivify_483:
    set $P1569, $P1568["quote_EXPR"]
    unless_null $P1569, vivify_484
    new $P1569, "Undef"
  vivify_484:
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
.sub "circumfix:sym<{ }>"  :subid("88_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P1580, vivify_485
    new $P1580, "Hash"
  vivify_485:
    set $P1581, $P1580["pblock"]
    unless_null $P1581, vivify_486
    new $P1581, "Hash"
  vivify_486:
    set $P1582, $P1581["blockoid"]
    unless_null $P1582, vivify_487
    new $P1582, "Hash"
  vivify_487:
    set $P1583, $P1582["statementlist"]
    unless_null $P1583, vivify_488
    new $P1583, "Hash"
  vivify_488:
    set $P1584, $P1583["statement"]
    unless_null $P1584, vivify_489
    new $P1584, "Undef"
  vivify_489:
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
    unless_null $P1589, vivify_490
    new $P1589, "Hash"
  vivify_490:
    set $P1590, $P1589["pblock"]
    unless_null $P1590, vivify_491
    new $P1590, "Undef"
  vivify_491:
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
.sub "circumfix:sym<sigil>"  :subid("89_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P1604, vivify_492
    new $P1604, "Hash"
  vivify_492:
    set $P1605, $P1604["sigil"]
    unless_null $P1605, vivify_493
    new $P1605, "Undef"
  vivify_493:
    set $S1606, $P1605
    iseq $I1607, $S1606, "@"
    if $I1607, if_1603
.annotate "line", 557
    find_lex $P1611, "$/"
    unless_null $P1611, vivify_494
    new $P1611, "Hash"
  vivify_494:
    set $P1612, $P1611["sigil"]
    unless_null $P1612, vivify_495
    new $P1612, "Undef"
  vivify_495:
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
    unless_null $P1620, vivify_496
    new $P1620, "Hash"
  vivify_496:
    set $P1621, $P1620["semilist"]
    unless_null $P1621, vivify_497
    new $P1621, "Undef"
  vivify_497:
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
.sub "semilist"  :subid("90_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P1631, vivify_498
    new $P1631, "Hash"
  vivify_498:
    set $P1632, $P1631["statement"]
    unless_null $P1632, vivify_499
    new $P1632, "Undef"
  vivify_499:
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
.sub "postcircumfix:sym<[ ]>"  :subid("91_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P1642, vivify_500
    new $P1642, "Hash"
  vivify_500:
    set $P1643, $P1642["EXPR"]
    unless_null $P1643, vivify_501
    new $P1643, "Undef"
  vivify_501:
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
.sub "postcircumfix:sym<{ }>"  :subid("92_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P1654, vivify_502
    new $P1654, "Hash"
  vivify_502:
    set $P1655, $P1654["EXPR"]
    unless_null $P1655, vivify_503
    new $P1655, "Undef"
  vivify_503:
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
.sub "postcircumfix:sym<ang>"  :subid("93_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P1666, vivify_504
    new $P1666, "Hash"
  vivify_504:
    set $P1667, $P1666["quote_EXPR"]
    unless_null $P1667, vivify_505
    new $P1667, "Undef"
  vivify_505:
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
.sub "postcircumfix:sym<( )>"  :subid("94_1258904224.56063") :method :outer("11_1258904224.56063")
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
    unless_null $P1677, vivify_506
    new $P1677, "Hash"
  vivify_506:
    set $P1678, $P1677["arglist"]
    unless_null $P1678, vivify_507
    new $P1678, "Undef"
  vivify_507:
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
.sub "value"  :subid("95_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_1685
.annotate "line", 586
    new $P1684, 'ExceptionHandler'
    set_addr $P1684, control_1683
    $P1684."handle_types"(58)
    push_eh $P1684
    .lex "self", self
    .lex "$/", param_1685
.annotate "line", 587
    new $P1686, "Undef"
    .lex "$past", $P1686
.annotate "line", 588
    find_lex $P1689, "$/"
    unless_null $P1689, vivify_508
    new $P1689, "Hash"
  vivify_508:
    set $P1690, $P1689["quote"]
    unless_null $P1690, vivify_509
    new $P1690, "Undef"
  vivify_509:
    if $P1690, if_1688
.annotate "line", 589
    get_hll_global $P1694, ["PAST"], "Val"
.annotate "line", 591
    find_lex $P1697, "$/"
    unless_null $P1697, vivify_510
    new $P1697, "Hash"
  vivify_510:
    set $P1698, $P1697["dec_number"]
    unless_null $P1698, vivify_511
    new $P1698, "Undef"
  vivify_511:
    if $P1698, if_1696
.annotate "line", 592
    find_lex $P1702, "$/"
    unless_null $P1702, vivify_512
    new $P1702, "Hash"
  vivify_512:
    set $P1703, $P1702["integer"]
    unless_null $P1703, vivify_513
    new $P1703, "Undef"
  vivify_513:
    $P1704 = $P1703."ast"()
    set $P1695, $P1704
.annotate "line", 591
    goto if_1696_end
  if_1696:
    find_lex $P1699, "$/"
    unless_null $P1699, vivify_514
    new $P1699, "Hash"
  vivify_514:
    set $P1700, $P1699["dec_number"]
    unless_null $P1700, vivify_515
    new $P1700, "Undef"
  vivify_515:
    $P1701 = $P1700."ast"()
    set $P1695, $P1701
  if_1696_end:
    $P1705 = $P1694."new"($P1695 :named("value"))
.annotate "line", 589
    set $P1687, $P1705
.annotate "line", 588
    goto if_1688_end
  if_1688:
    find_lex $P1691, "$/"
    unless_null $P1691, vivify_516
    new $P1691, "Hash"
  vivify_516:
    set $P1692, $P1691["quote"]
    unless_null $P1692, vivify_517
    new $P1692, "Undef"
  vivify_517:
    $P1693 = $P1692."ast"()
    set $P1687, $P1693
  if_1688_end:
    store_lex "$past", $P1687
.annotate "line", 594
    find_lex $P1706, "$/"
    find_lex $P1707, "$past"
    $P1708 = $P1706."!make"($P1707)
.annotate "line", 586
    .return ($P1708)
  control_1683:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1709, exception, "payload"
    .return ($P1709)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<apos>"  :subid("96_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_1713
.annotate "line", 597
    new $P1712, 'ExceptionHandler'
    set_addr $P1712, control_1711
    $P1712."handle_types"(58)
    push_eh $P1712
    .lex "self", self
    .lex "$/", param_1713
    find_lex $P1714, "$/"
    find_lex $P1715, "$/"
    unless_null $P1715, vivify_518
    new $P1715, "Hash"
  vivify_518:
    set $P1716, $P1715["quote_EXPR"]
    unless_null $P1716, vivify_519
    new $P1716, "Undef"
  vivify_519:
    $P1717 = $P1716."ast"()
    $P1718 = $P1714."!make"($P1717)
    .return ($P1718)
  control_1711:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1719, exception, "payload"
    .return ($P1719)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<dblq>"  :subid("97_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_1723
.annotate "line", 598
    new $P1722, 'ExceptionHandler'
    set_addr $P1722, control_1721
    $P1722."handle_types"(58)
    push_eh $P1722
    .lex "self", self
    .lex "$/", param_1723
    find_lex $P1724, "$/"
    find_lex $P1725, "$/"
    unless_null $P1725, vivify_520
    new $P1725, "Hash"
  vivify_520:
    set $P1726, $P1725["quote_EXPR"]
    unless_null $P1726, vivify_521
    new $P1726, "Undef"
  vivify_521:
    $P1727 = $P1726."ast"()
    $P1728 = $P1724."!make"($P1727)
    .return ($P1728)
  control_1721:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1729, exception, "payload"
    .return ($P1729)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<qq>"  :subid("98_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_1733
.annotate "line", 599
    new $P1732, 'ExceptionHandler'
    set_addr $P1732, control_1731
    $P1732."handle_types"(58)
    push_eh $P1732
    .lex "self", self
    .lex "$/", param_1733
    find_lex $P1734, "$/"
    find_lex $P1735, "$/"
    unless_null $P1735, vivify_522
    new $P1735, "Hash"
  vivify_522:
    set $P1736, $P1735["quote_EXPR"]
    unless_null $P1736, vivify_523
    new $P1736, "Undef"
  vivify_523:
    $P1737 = $P1736."ast"()
    $P1738 = $P1734."!make"($P1737)
    .return ($P1738)
  control_1731:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1739, exception, "payload"
    .return ($P1739)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<q>"  :subid("99_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_1743
.annotate "line", 600
    new $P1742, 'ExceptionHandler'
    set_addr $P1742, control_1741
    $P1742."handle_types"(58)
    push_eh $P1742
    .lex "self", self
    .lex "$/", param_1743
    find_lex $P1744, "$/"
    find_lex $P1745, "$/"
    unless_null $P1745, vivify_524
    new $P1745, "Hash"
  vivify_524:
    set $P1746, $P1745["quote_EXPR"]
    unless_null $P1746, vivify_525
    new $P1746, "Undef"
  vivify_525:
    $P1747 = $P1746."ast"()
    $P1748 = $P1744."!make"($P1747)
    .return ($P1748)
  control_1741:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1749, exception, "payload"
    .return ($P1749)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q>"  :subid("100_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_1753
.annotate "line", 601
    new $P1752, 'ExceptionHandler'
    set_addr $P1752, control_1751
    $P1752."handle_types"(58)
    push_eh $P1752
    .lex "self", self
    .lex "$/", param_1753
    find_lex $P1754, "$/"
    find_lex $P1755, "$/"
    unless_null $P1755, vivify_526
    new $P1755, "Hash"
  vivify_526:
    set $P1756, $P1755["quote_EXPR"]
    unless_null $P1756, vivify_527
    new $P1756, "Undef"
  vivify_527:
    $P1757 = $P1756."ast"()
    $P1758 = $P1754."!make"($P1757)
    .return ($P1758)
  control_1751:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1759, exception, "payload"
    .return ($P1759)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q:PIR>"  :subid("101_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_1763
.annotate "line", 602
    new $P1762, 'ExceptionHandler'
    set_addr $P1762, control_1761
    $P1762."handle_types"(58)
    push_eh $P1762
    .lex "self", self
    .lex "$/", param_1763
.annotate "line", 603
    find_lex $P1764, "$/"
    get_hll_global $P1765, ["PAST"], "Op"
    find_lex $P1766, "$/"
    unless_null $P1766, vivify_528
    new $P1766, "Hash"
  vivify_528:
    set $P1767, $P1766["quote_EXPR"]
    unless_null $P1767, vivify_529
    new $P1767, "Undef"
  vivify_529:
    $P1768 = $P1767."ast"()
    $P1769 = $P1768."value"()
    find_lex $P1770, "$/"
    $P1771 = $P1765."new"($P1769 :named("inline"), "inline" :named("pasttype"), $P1770 :named("node"))
    $P1772 = $P1764."!make"($P1771)
.annotate "line", 602
    .return ($P1772)
  control_1761:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1773, exception, "payload"
    .return ($P1773)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<$>"  :subid("102_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_1777
.annotate "line", 608
    new $P1776, 'ExceptionHandler'
    set_addr $P1776, control_1775
    $P1776."handle_types"(58)
    push_eh $P1776
    .lex "self", self
    .lex "$/", param_1777
    find_lex $P1778, "$/"
    find_lex $P1779, "$/"
    unless_null $P1779, vivify_530
    new $P1779, "Hash"
  vivify_530:
    set $P1780, $P1779["variable"]
    unless_null $P1780, vivify_531
    new $P1780, "Undef"
  vivify_531:
    $P1781 = $P1780."ast"()
    $P1782 = $P1778."!make"($P1781)
    .return ($P1782)
  control_1775:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1783, exception, "payload"
    .return ($P1783)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<{ }>"  :subid("103_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_1787
.annotate "line", 609
    new $P1786, 'ExceptionHandler'
    set_addr $P1786, control_1785
    $P1786."handle_types"(58)
    push_eh $P1786
    .lex "self", self
    .lex "$/", param_1787
.annotate "line", 610
    find_lex $P1788, "$/"
    get_hll_global $P1789, ["PAST"], "Op"
.annotate "line", 611
    find_lex $P1790, "$/"
    unless_null $P1790, vivify_532
    new $P1790, "Hash"
  vivify_532:
    set $P1791, $P1790["block"]
    unless_null $P1791, vivify_533
    new $P1791, "Undef"
  vivify_533:
    $P1792 = $P1791."ast"()
    $P1793 = "block_immediate"($P1792)
    find_lex $P1794, "$/"
    $P1795 = $P1789."new"($P1793, "set S*" :named("pirop"), $P1794 :named("node"))
.annotate "line", 610
    $P1796 = $P1788."!make"($P1795)
.annotate "line", 609
    .return ($P1796)
  control_1785:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1797, exception, "payload"
    .return ($P1797)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<.>"  :subid("104_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_1801
.annotate "line", 617
    new $P1800, 'ExceptionHandler'
    set_addr $P1800, control_1799
    $P1800."handle_types"(58)
    push_eh $P1800
    .lex "self", self
    .lex "$/", param_1801
    find_lex $P1802, "$/"
    find_lex $P1803, "$/"
    unless_null $P1803, vivify_534
    new $P1803, "Hash"
  vivify_534:
    set $P1804, $P1803["dotty"]
    unless_null $P1804, vivify_535
    new $P1804, "Undef"
  vivify_535:
    $P1805 = $P1804."ast"()
    $P1806 = $P1802."!make"($P1805)
    .return ($P1806)
  control_1799:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1807, exception, "payload"
    .return ($P1807)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<++>"  :subid("105_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_1811
.annotate "line", 619
    new $P1810, 'ExceptionHandler'
    set_addr $P1810, control_1809
    $P1810."handle_types"(58)
    push_eh $P1810
    .lex "self", self
    .lex "$/", param_1811
.annotate "line", 620
    find_lex $P1812, "$/"
    get_hll_global $P1813, ["PAST"], "Op"
.annotate "line", 621
    new $P1814, "ResizablePMCArray"
    push $P1814, "    clone %r, %0"
    push $P1814, "    inc %0"
    $P1815 = $P1813."new"("postfix:<++>" :named("name"), $P1814 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 620
    $P1816 = $P1812."!make"($P1815)
.annotate "line", 619
    .return ($P1816)
  control_1809:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1817, exception, "payload"
    .return ($P1817)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<-->"  :subid("106_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_1821
.annotate "line", 625
    new $P1820, 'ExceptionHandler'
    set_addr $P1820, control_1819
    $P1820."handle_types"(58)
    push_eh $P1820
    .lex "self", self
    .lex "$/", param_1821
.annotate "line", 626
    find_lex $P1822, "$/"
    get_hll_global $P1823, ["PAST"], "Op"
.annotate "line", 627
    new $P1824, "ResizablePMCArray"
    push $P1824, "    clone %r, %0"
    push $P1824, "    dec %0"
    $P1825 = $P1823."new"("postfix:<-->" :named("name"), $P1824 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 626
    $P1826 = $P1822."!make"($P1825)
.annotate "line", 625
    .return ($P1826)
  control_1819:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1827, exception, "payload"
    .return ($P1827)
.end


.namespace ["NQP";"Actions"]
.sub "prefix:sym<make>"  :subid("107_1258904224.56063") :method :outer("11_1258904224.56063")
    .param pmc param_1831
.annotate "line", 631
    new $P1830, 'ExceptionHandler'
    set_addr $P1830, control_1829
    $P1830."handle_types"(58)
    push_eh $P1830
    .lex "self", self
    .lex "$/", param_1831
.annotate "line", 632
    find_lex $P1832, "$/"
    get_hll_global $P1833, ["PAST"], "Op"
.annotate "line", 633
    get_hll_global $P1834, ["PAST"], "Var"
    $P1835 = $P1834."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P1836, "$/"
    $P1837 = $P1833."new"($P1835, "callmethod" :named("pasttype"), "!make" :named("name"), $P1836 :named("node"))
.annotate "line", 632
    $P1838 = $P1832."!make"($P1837)
.annotate "line", 631
    .return ($P1838)
  control_1829:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1839, exception, "payload"
    .return ($P1839)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block1840"  :subid("108_1258904224.56063") :outer("11_1258904224.56063")
.annotate "line", 641
    .const 'Sub' $P1876 = "112_1258904224.56063" 
    capture_lex $P1876
    .const 'Sub' $P1866 = "111_1258904224.56063" 
    capture_lex $P1866
    .const 'Sub' $P1856 = "110_1258904224.56063" 
    capture_lex $P1856
    .const 'Sub' $P1842 = "109_1258904224.56063" 
    capture_lex $P1842
.annotate "line", 652
    .const 'Sub' $P1876 = "112_1258904224.56063" 
    capture_lex $P1876
.annotate "line", 641
    .return ($P1876)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<:my>"  :subid("109_1258904224.56063") :method :outer("108_1258904224.56063")
    .param pmc param_1845
.annotate "line", 643
    new $P1844, 'ExceptionHandler'
    set_addr $P1844, control_1843
    $P1844."handle_types"(58)
    push_eh $P1844
    .lex "self", self
    .lex "$/", param_1845
.annotate "line", 644
    new $P1846, "Undef"
    .lex "$past", $P1846
    find_lex $P1847, "$/"
    unless_null $P1847, vivify_536
    new $P1847, "Hash"
  vivify_536:
    set $P1848, $P1847["statement"]
    unless_null $P1848, vivify_537
    new $P1848, "Undef"
  vivify_537:
    $P1849 = $P1848."ast"()
    store_lex "$past", $P1849
.annotate "line", 645
    find_lex $P1850, "$/"
    get_hll_global $P1851, ["PAST"], "Regex"
    find_lex $P1852, "$past"
    $P1853 = $P1851."new"($P1852, "pastnode" :named("pasttype"))
    $P1854 = $P1850."!make"($P1853)
.annotate "line", 643
    .return ($P1854)
  control_1843:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1855, exception, "payload"
    .return ($P1855)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<{ }>"  :subid("110_1258904224.56063") :method :outer("108_1258904224.56063")
    .param pmc param_1859
.annotate "line", 648
    new $P1858, 'ExceptionHandler'
    set_addr $P1858, control_1857
    $P1858."handle_types"(58)
    push_eh $P1858
    .lex "self", self
    .lex "$/", param_1859
    find_lex $P1860, "$/"
    find_lex $P1861, "$/"
    unless_null $P1861, vivify_538
    new $P1861, "Hash"
  vivify_538:
    set $P1862, $P1861["codeblock"]
    unless_null $P1862, vivify_539
    new $P1862, "Undef"
  vivify_539:
    $P1863 = $P1862."ast"()
    $P1864 = $P1860."!make"($P1863)
    .return ($P1864)
  control_1857:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1865, exception, "payload"
    .return ($P1865)
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<{ }>"  :subid("111_1258904224.56063") :method :outer("108_1258904224.56063")
    .param pmc param_1869
.annotate "line", 650
    new $P1868, 'ExceptionHandler'
    set_addr $P1868, control_1867
    $P1868."handle_types"(58)
    push_eh $P1868
    .lex "self", self
    .lex "$/", param_1869
    find_lex $P1870, "$/"
    find_lex $P1871, "$/"
    unless_null $P1871, vivify_540
    new $P1871, "Hash"
  vivify_540:
    set $P1872, $P1871["codeblock"]
    unless_null $P1872, vivify_541
    new $P1872, "Undef"
  vivify_541:
    $P1873 = $P1872."ast"()
    $P1874 = $P1870."!make"($P1873)
    .return ($P1874)
  control_1867:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1875, exception, "payload"
    .return ($P1875)
.end


.namespace ["NQP";"RegexActions"]
.sub "codeblock"  :subid("112_1258904224.56063") :method :outer("108_1258904224.56063")
    .param pmc param_1879
.annotate "line", 652
    new $P1878, 'ExceptionHandler'
    set_addr $P1878, control_1877
    $P1878."handle_types"(58)
    push_eh $P1878
    .lex "self", self
    .lex "$/", param_1879
.annotate "line", 653
    new $P1880, "Undef"
    .lex "$block", $P1880
.annotate "line", 655
    new $P1881, "Undef"
    .lex "$past", $P1881
.annotate "line", 653
    find_lex $P1882, "$/"
    unless_null $P1882, vivify_542
    new $P1882, "Hash"
  vivify_542:
    set $P1883, $P1882["block"]
    unless_null $P1883, vivify_543
    new $P1883, "Undef"
  vivify_543:
    $P1884 = $P1883."ast"()
    store_lex "$block", $P1884
.annotate "line", 654
    find_lex $P1885, "$block"
    $P1885."blocktype"("immediate")
.annotate "line", 656
    get_hll_global $P1886, ["PAST"], "Regex"
.annotate "line", 657
    get_hll_global $P1887, ["PAST"], "Stmts"
.annotate "line", 658
    get_hll_global $P1888, ["PAST"], "Op"
.annotate "line", 659
    get_hll_global $P1889, ["PAST"], "Var"
    $P1890 = $P1889."new"("$/" :named("name"))
.annotate "line", 660
    get_hll_global $P1891, ["PAST"], "Op"
.annotate "line", 661
    get_hll_global $P1892, ["PAST"], "Var"
    $P1893 = $P1892."new"(unicode:"$\x{a2}" :named("name"))
    $P1894 = $P1891."new"($P1893, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 660
    $P1895 = $P1888."new"($P1890, $P1894, "bind" :named("pasttype"))
.annotate "line", 658
    find_lex $P1896, "$block"
    $P1897 = $P1887."new"($P1895, $P1896)
.annotate "line", 657
    $P1898 = $P1886."new"($P1897, "pastnode" :named("pasttype"))
.annotate "line", 656
    store_lex "$past", $P1898
.annotate "line", 671
    find_lex $P1899, "$/"
    find_lex $P1900, "$past"
    $P1901 = $P1899."!make"($P1900)
.annotate "line", 652
    .return ($P1901)
  control_1877:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1902, exception, "payload"
    .return ($P1902)
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
