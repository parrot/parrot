# Copyright (C) 2009, The Perl Foundation.

=head1 NAME

NQP::Compiler - NQP compiler

=head1 DESCRIPTION

=cut

.sub '' :anon :load :init
    load_bytecode 'P6Regex.pbc'
.end

### .include 'gen/nqp-grammar.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1271336396.90314")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
    $P1299 = $P14()
.annotate "line", 1
    .return ($P1299)
.end


.namespace []
.sub "" :load :init :subid("post331") :outer("10_1271336396.90314")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1271336396.90314" 
    .local pmc block
    set block, $P12
    $P1300 = get_root_global ["parrot"], "P6metaclass"
    $P1300."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1271336396.90314") :outer("10_1271336396.90314")
.annotate "line", 4
    get_hll_global $P1243, ["NQP";"Regex"], "_block1242" 
    capture_lex $P1243
    .const 'Sub' $P1229 = "317_1271336396.90314" 
    capture_lex $P1229
    .const 'Sub' $P1223 = "315_1271336396.90314" 
    capture_lex $P1223
    .const 'Sub' $P1217 = "313_1271336396.90314" 
    capture_lex $P1217
    .const 'Sub' $P1210 = "311_1271336396.90314" 
    capture_lex $P1210
    .const 'Sub' $P1203 = "309_1271336396.90314" 
    capture_lex $P1203
    .const 'Sub' $P1196 = "307_1271336396.90314" 
    capture_lex $P1196
    .const 'Sub' $P1189 = "305_1271336396.90314" 
    capture_lex $P1189
    .const 'Sub' $P1183 = "303_1271336396.90314" 
    capture_lex $P1183
    .const 'Sub' $P1176 = "301_1271336396.90314" 
    capture_lex $P1176
    .const 'Sub' $P1169 = "299_1271336396.90314" 
    capture_lex $P1169
    .const 'Sub' $P1162 = "297_1271336396.90314" 
    capture_lex $P1162
    .const 'Sub' $P1155 = "295_1271336396.90314" 
    capture_lex $P1155
    .const 'Sub' $P1148 = "293_1271336396.90314" 
    capture_lex $P1148
    .const 'Sub' $P1141 = "291_1271336396.90314" 
    capture_lex $P1141
    .const 'Sub' $P1134 = "289_1271336396.90314" 
    capture_lex $P1134
    .const 'Sub' $P1127 = "287_1271336396.90314" 
    capture_lex $P1127
    .const 'Sub' $P1120 = "285_1271336396.90314" 
    capture_lex $P1120
    .const 'Sub' $P1113 = "283_1271336396.90314" 
    capture_lex $P1113
    .const 'Sub' $P1106 = "281_1271336396.90314" 
    capture_lex $P1106
    .const 'Sub' $P1099 = "279_1271336396.90314" 
    capture_lex $P1099
    .const 'Sub' $P1092 = "277_1271336396.90314" 
    capture_lex $P1092
    .const 'Sub' $P1085 = "275_1271336396.90314" 
    capture_lex $P1085
    .const 'Sub' $P1078 = "273_1271336396.90314" 
    capture_lex $P1078
    .const 'Sub' $P1071 = "271_1271336396.90314" 
    capture_lex $P1071
    .const 'Sub' $P1064 = "269_1271336396.90314" 
    capture_lex $P1064
    .const 'Sub' $P1057 = "267_1271336396.90314" 
    capture_lex $P1057
    .const 'Sub' $P1050 = "265_1271336396.90314" 
    capture_lex $P1050
    .const 'Sub' $P1043 = "263_1271336396.90314" 
    capture_lex $P1043
    .const 'Sub' $P1036 = "261_1271336396.90314" 
    capture_lex $P1036
    .const 'Sub' $P1029 = "259_1271336396.90314" 
    capture_lex $P1029
    .const 'Sub' $P1022 = "257_1271336396.90314" 
    capture_lex $P1022
    .const 'Sub' $P1015 = "255_1271336396.90314" 
    capture_lex $P1015
    .const 'Sub' $P1008 = "253_1271336396.90314" 
    capture_lex $P1008
    .const 'Sub' $P1001 = "251_1271336396.90314" 
    capture_lex $P1001
    .const 'Sub' $P995 = "249_1271336396.90314" 
    capture_lex $P995
    .const 'Sub' $P988 = "247_1271336396.90314" 
    capture_lex $P988
    .const 'Sub' $P981 = "245_1271336396.90314" 
    capture_lex $P981
    .const 'Sub' $P974 = "243_1271336396.90314" 
    capture_lex $P974
    .const 'Sub' $P967 = "241_1271336396.90314" 
    capture_lex $P967
    .const 'Sub' $P960 = "239_1271336396.90314" 
    capture_lex $P960
    .const 'Sub' $P953 = "237_1271336396.90314" 
    capture_lex $P953
    .const 'Sub' $P946 = "235_1271336396.90314" 
    capture_lex $P946
    .const 'Sub' $P940 = "233_1271336396.90314" 
    capture_lex $P940
    .const 'Sub' $P934 = "231_1271336396.90314" 
    capture_lex $P934
    .const 'Sub' $P929 = "229_1271336396.90314" 
    capture_lex $P929
    .const 'Sub' $P923 = "227_1271336396.90314" 
    capture_lex $P923
    .const 'Sub' $P917 = "225_1271336396.90314" 
    capture_lex $P917
    .const 'Sub' $P912 = "223_1271336396.90314" 
    capture_lex $P912
    .const 'Sub' $P907 = "221_1271336396.90314" 
    capture_lex $P907
    .const 'Sub' $P900 = "219_1271336396.90314" 
    capture_lex $P900
    .const 'Sub' $P892 = "217_1271336396.90314" 
    capture_lex $P892
    .const 'Sub' $P887 = "215_1271336396.90314" 
    capture_lex $P887
    .const 'Sub' $P882 = "213_1271336396.90314" 
    capture_lex $P882
    .const 'Sub' $P877 = "211_1271336396.90314" 
    capture_lex $P877
    .const 'Sub' $P869 = "209_1271336396.90314" 
    capture_lex $P869
    .const 'Sub' $P861 = "207_1271336396.90314" 
    capture_lex $P861
    .const 'Sub' $P856 = "205_1271336396.90314" 
    capture_lex $P856
    .const 'Sub' $P851 = "203_1271336396.90314" 
    capture_lex $P851
    .const 'Sub' $P845 = "201_1271336396.90314" 
    capture_lex $P845
    .const 'Sub' $P839 = "199_1271336396.90314" 
    capture_lex $P839
    .const 'Sub' $P833 = "197_1271336396.90314" 
    capture_lex $P833
    .const 'Sub' $P827 = "195_1271336396.90314" 
    capture_lex $P827
    .const 'Sub' $P821 = "193_1271336396.90314" 
    capture_lex $P821
    .const 'Sub' $P816 = "191_1271336396.90314" 
    capture_lex $P816
    .const 'Sub' $P811 = "189_1271336396.90314" 
    capture_lex $P811
    .const 'Sub' $P798 = "185_1271336396.90314" 
    capture_lex $P798
    .const 'Sub' $P790 = "183_1271336396.90314" 
    capture_lex $P790
    .const 'Sub' $P784 = "181_1271336396.90314" 
    capture_lex $P784
    .const 'Sub' $P777 = "179_1271336396.90314" 
    capture_lex $P777
    .const 'Sub' $P771 = "177_1271336396.90314" 
    capture_lex $P771
    .const 'Sub' $P763 = "175_1271336396.90314" 
    capture_lex $P763
    .const 'Sub' $P755 = "173_1271336396.90314" 
    capture_lex $P755
    .const 'Sub' $P749 = "171_1271336396.90314" 
    capture_lex $P749
    .const 'Sub' $P743 = "169_1271336396.90314" 
    capture_lex $P743
    .const 'Sub' $P728 = "165_1271336396.90314" 
    capture_lex $P728
    .const 'Sub' $P691 = "163_1271336396.90314" 
    capture_lex $P691
    .const 'Sub' $P683 = "161_1271336396.90314" 
    capture_lex $P683
    .const 'Sub' $P677 = "159_1271336396.90314" 
    capture_lex $P677
    .const 'Sub' $P667 = "157_1271336396.90314" 
    capture_lex $P667
    .const 'Sub' $P652 = "155_1271336396.90314" 
    capture_lex $P652
    .const 'Sub' $P643 = "153_1271336396.90314" 
    capture_lex $P643
    .const 'Sub' $P624 = "151_1271336396.90314" 
    capture_lex $P624
    .const 'Sub' $P600 = "149_1271336396.90314" 
    capture_lex $P600
    .const 'Sub' $P593 = "147_1271336396.90314" 
    capture_lex $P593
    .const 'Sub' $P586 = "145_1271336396.90314" 
    capture_lex $P586
    .const 'Sub' $P576 = "141_1271336396.90314" 
    capture_lex $P576
    .const 'Sub' $P565 = "139_1271336396.90314" 
    capture_lex $P565
    .const 'Sub' $P558 = "137_1271336396.90314" 
    capture_lex $P558
    .const 'Sub' $P551 = "135_1271336396.90314" 
    capture_lex $P551
    .const 'Sub' $P544 = "133_1271336396.90314" 
    capture_lex $P544
    .const 'Sub' $P517 = "129_1271336396.90314" 
    capture_lex $P517
    .const 'Sub' $P508 = "127_1271336396.90314" 
    capture_lex $P508
    .const 'Sub' $P501 = "125_1271336396.90314" 
    capture_lex $P501
    .const 'Sub' $P492 = "121_1271336396.90314" 
    capture_lex $P492
    .const 'Sub' $P487 = "119_1271336396.90314" 
    capture_lex $P487
    .const 'Sub' $P475 = "117_1271336396.90314" 
    capture_lex $P475
    .const 'Sub' $P463 = "115_1271336396.90314" 
    capture_lex $P463
    .const 'Sub' $P455 = "113_1271336396.90314" 
    capture_lex $P455
    .const 'Sub' $P450 = "111_1271336396.90314" 
    capture_lex $P450
    .const 'Sub' $P444 = "109_1271336396.90314" 
    capture_lex $P444
    .const 'Sub' $P438 = "107_1271336396.90314" 
    capture_lex $P438
    .const 'Sub' $P432 = "105_1271336396.90314" 
    capture_lex $P432
    .const 'Sub' $P426 = "103_1271336396.90314" 
    capture_lex $P426
    .const 'Sub' $P420 = "101_1271336396.90314" 
    capture_lex $P420
    .const 'Sub' $P414 = "99_1271336396.90314" 
    capture_lex $P414
    .const 'Sub' $P408 = "97_1271336396.90314" 
    capture_lex $P408
    .const 'Sub' $P402 = "95_1271336396.90314" 
    capture_lex $P402
    .const 'Sub' $P394 = "93_1271336396.90314" 
    capture_lex $P394
    .const 'Sub' $P386 = "91_1271336396.90314" 
    capture_lex $P386
    .const 'Sub' $P374 = "87_1271336396.90314" 
    capture_lex $P374
    .const 'Sub' $P366 = "85_1271336396.90314" 
    capture_lex $P366
    .const 'Sub' $P356 = "81_1271336396.90314" 
    capture_lex $P356
    .const 'Sub' $P349 = "79_1271336396.90314" 
    capture_lex $P349
    .const 'Sub' $P342 = "77_1271336396.90314" 
    capture_lex $P342
    .const 'Sub' $P330 = "73_1271336396.90314" 
    capture_lex $P330
    .const 'Sub' $P322 = "71_1271336396.90314" 
    capture_lex $P322
    .const 'Sub' $P314 = "69_1271336396.90314" 
    capture_lex $P314
    .const 'Sub' $P294 = "67_1271336396.90314" 
    capture_lex $P294
    .const 'Sub' $P285 = "65_1271336396.90314" 
    capture_lex $P285
    .const 'Sub' $P267 = "62_1271336396.90314" 
    capture_lex $P267
    .const 'Sub' $P247 = "60_1271336396.90314" 
    capture_lex $P247
    .const 'Sub' $P238 = "56_1271336396.90314" 
    capture_lex $P238
    .const 'Sub' $P233 = "54_1271336396.90314" 
    capture_lex $P233
    .const 'Sub' $P224 = "50_1271336396.90314" 
    capture_lex $P224
    .const 'Sub' $P219 = "48_1271336396.90314" 
    capture_lex $P219
    .const 'Sub' $P211 = "46_1271336396.90314" 
    capture_lex $P211
    .const 'Sub' $P204 = "44_1271336396.90314" 
    capture_lex $P204
    .const 'Sub' $P198 = "42_1271336396.90314" 
    capture_lex $P198
    .const 'Sub' $P190 = "40_1271336396.90314" 
    capture_lex $P190
    .const 'Sub' $P184 = "38_1271336396.90314" 
    capture_lex $P184
    .const 'Sub' $P178 = "36_1271336396.90314" 
    capture_lex $P178
    .const 'Sub' $P162 = "33_1271336396.90314" 
    capture_lex $P162
    .const 'Sub' $P149 = "31_1271336396.90314" 
    capture_lex $P149
    .const 'Sub' $P142 = "29_1271336396.90314" 
    capture_lex $P142
    .const 'Sub' $P96 = "26_1271336396.90314" 
    capture_lex $P96
    .const 'Sub' $P78 = "23_1271336396.90314" 
    capture_lex $P78
    .const 'Sub' $P68 = "21_1271336396.90314" 
    capture_lex $P68
    .const 'Sub' $P54 = "19_1271336396.90314" 
    capture_lex $P54
    .const 'Sub' $P46 = "17_1271336396.90314" 
    capture_lex $P46
    .const 'Sub' $P39 = "15_1271336396.90314" 
    capture_lex $P39
    .const 'Sub' $P33 = "13_1271336396.90314" 
    capture_lex $P33
    .const 'Sub' $P15 = "12_1271336396.90314" 
    capture_lex $P15
.annotate "line", 535
    get_hll_global $P1243, ["NQP";"Regex"], "_block1242" 
    capture_lex $P1243
    $P1282 = $P1243()
.annotate "line", 4
    .return ($P1282)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post332") :outer("11_1271336396.90314")
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 422
    get_hll_global $P1283, ["NQP"], "Grammar"
    $P1283."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate "line", 423
    get_hll_global $P1284, ["NQP"], "Grammar"
    $P1284."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate "line", 424
    get_hll_global $P1285, ["NQP"], "Grammar"
    $P1285."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate "line", 425
    get_hll_global $P1286, ["NQP"], "Grammar"
    $P1286."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate "line", 426
    get_hll_global $P1287, ["NQP"], "Grammar"
    $P1287."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate "line", 427
    get_hll_global $P1288, ["NQP"], "Grammar"
    $P1288."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate "line", 428
    get_hll_global $P1289, ["NQP"], "Grammar"
    $P1289."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate "line", 429
    get_hll_global $P1290, ["NQP"], "Grammar"
    $P1290."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate "line", 430
    get_hll_global $P1291, ["NQP"], "Grammar"
    $P1291."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate "line", 431
    get_hll_global $P1292, ["NQP"], "Grammar"
    $P1292."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate "line", 432
    get_hll_global $P1293, ["NQP"], "Grammar"
    $P1293."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate "line", 433
    get_hll_global $P1294, ["NQP"], "Grammar"
    $P1294."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate "line", 434
    get_hll_global $P1295, ["NQP"], "Grammar"
    $P1295."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate "line", 435
    get_hll_global $P1296, ["NQP"], "Grammar"
    $P1296."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate "line", 436
    get_hll_global $P1297, ["NQP"], "Grammar"
    $P1297."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate "line", 421
    $P1298 = get_root_global ["parrot"], "P6metaclass"
    $P1298."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "TOP"  :subid("12_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
.annotate "line", 5
    $P18 = root_new ['parrot';'Hash']
    .lex "%*LANG", $P18
.annotate "line", 10
    new $P19, "Undef"
    .lex "$*SCOPE", $P19
.annotate "line", 4
    find_lex $P20, "%*LANG"
    unless_null $P20, vivify_333
    get_hll_global $P20, "%LANG"
    unless_null $P20, vivify_334
    die "Contextual %*LANG not found"
  vivify_334:
  vivify_333:
.annotate "line", 6
    get_hll_global $P21, ["NQP"], "Regex"
    find_lex $P22, "%*LANG"
    unless_null $P22, vivify_335
    get_hll_global $P22, "%LANG"
    unless_null $P22, vivify_336
    die "Contextual %*LANG not found"
  vivify_336:
    store_lex "%*LANG", $P22
  vivify_335:
    set $P22["Regex"], $P21
.annotate "line", 7
    get_hll_global $P23, ["NQP"], "RegexActions"
    find_lex $P24, "%*LANG"
    unless_null $P24, vivify_337
    get_hll_global $P24, "%LANG"
    unless_null $P24, vivify_338
    die "Contextual %*LANG not found"
  vivify_338:
    store_lex "%*LANG", $P24
  vivify_337:
    set $P24["Regex-actions"], $P23
.annotate "line", 8
    get_hll_global $P25, ["NQP"], "Grammar"
    find_lex $P26, "%*LANG"
    unless_null $P26, vivify_339
    get_hll_global $P26, "%LANG"
    unless_null $P26, vivify_340
    die "Contextual %*LANG not found"
  vivify_340:
    store_lex "%*LANG", $P26
  vivify_339:
    set $P26["MAIN"], $P25
.annotate "line", 9
    get_hll_global $P27, ["NQP"], "Actions"
    find_lex $P28, "%*LANG"
    unless_null $P28, vivify_341
    get_hll_global $P28, "%LANG"
    unless_null $P28, vivify_342
    die "Contextual %*LANG not found"
  vivify_342:
    store_lex "%*LANG", $P28
  vivify_341:
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
.sub "identifier"  :subid("13_1271336396.90314") :method :outer("11_1271336396.90314")
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
.sub "!PREFIX__identifier"  :subid("14_1271336396.90314") :method
.annotate "line", 4
    $P36 = self."!PREFIX__!subrule"("ident", "")
    new $P37, "ResizablePMCArray"
    push $P37, $P36
    .return ($P37)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1271336396.90314") :method :outer("11_1271336396.90314")
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
.sub "!PREFIX__name"  :subid("16_1271336396.90314") :method
.annotate "line", 4
    new $P42, "ResizablePMCArray"
    push $P42, ""
    .return ($P42)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx47_tgt
    .local int rx47_pos
    .local int rx47_off
    .local int rx47_eos
    .local int rx47_rep
    .local pmc rx47_cur
    (rx47_cur, rx47_pos, rx47_tgt) = self."!cursor_start"()
    rx47_cur."!cursor_debug"("START ", "deflongname")
    rx47_cur."!cursor_caparray"("colonpair")
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
  # rx rxquantr52 ** 0..1
    set_addr $I53, rxquantr52_done
    rx47_cur."!mark_push"(0, rx47_pos, $I53)
  rxquantr52_loop:
  # rx subrule "colonpair" subtype=capture negate=
    rx47_cur."!cursor_pos"(rx47_pos)
    $P10 = rx47_cur."colonpair"()
    unless $P10, rx47_fail
    rx47_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx47_pos = $P10."pos"()
    (rx47_rep) = rx47_cur."!mark_commit"($I53)
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
.sub "!PREFIX__deflongname"  :subid("18_1271336396.90314") :method
.annotate "line", 4
    $P49 = self."!PREFIX__!subrule"("identifier", "")
    new $P50, "ResizablePMCArray"
    push $P50, $P49
    .return ($P50)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx55_tgt
    .local int rx55_pos
    .local int rx55_off
    .local int rx55_eos
    .local int rx55_rep
    .local pmc rx55_cur
    (rx55_cur, rx55_pos, rx55_tgt) = self."!cursor_start"()
    rx55_cur."!cursor_debug"("START ", "ENDSTMT")
    .lex unicode:"$\x{a2}", rx55_cur
    .local pmc match
    .lex "$/", match
    length rx55_eos, rx55_tgt
    set rx55_off, 0
    lt rx55_pos, 2, rx55_start
    sub rx55_off, rx55_pos, 1
    substr rx55_tgt, rx55_tgt, rx55_off
  rx55_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan58_done
    goto rxscan58_scan
  rxscan58_loop:
    ($P10) = rx55_cur."from"()
    inc $P10
    set rx55_pos, $P10
    ge rx55_pos, rx55_eos, rxscan58_done
  rxscan58_scan:
    set_addr $I10, rxscan58_loop
    rx55_cur."!mark_push"(0, rx55_pos, $I10)
  rxscan58_done:
.annotate "line", 28
  # rx rxquantr59 ** 0..1
    set_addr $I67, rxquantr59_done
    rx55_cur."!mark_push"(0, rx55_pos, $I67)
  rxquantr59_loop:
  alt60_0:
.annotate "line", 25
    set_addr $I10, alt60_1
    rx55_cur."!mark_push"(0, rx55_pos, $I10)
.annotate "line", 26
  # rx rxquantr61 ** 0..*
    set_addr $I62, rxquantr61_done
    rx55_cur."!mark_push"(0, rx55_pos, $I62)
  rxquantr61_loop:
  # rx enumcharlist negate=0 
    ge rx55_pos, rx55_eos, rx55_fail
    sub $I10, rx55_pos, rx55_off
    substr $S10, rx55_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx55_fail
    inc rx55_pos
    (rx55_rep) = rx55_cur."!mark_commit"($I62)
    rx55_cur."!mark_push"(rx55_rep, rx55_pos, $I62)
    goto rxquantr61_loop
  rxquantr61_done:
  # rxanchor eol
    sub $I10, rx55_pos, rx55_off
    is_cclass $I11, 4096, rx55_tgt, $I10
    if $I11, rxanchor63_done
    ne rx55_pos, rx55_eos, rx55_fail
    eq rx55_pos, 0, rxanchor63_done
    dec $I10
    is_cclass $I11, 4096, rx55_tgt, $I10
    if $I11, rx55_fail
  rxanchor63_done:
  # rx subrule "ws" subtype=method negate=
    rx55_cur."!cursor_pos"(rx55_pos)
    $P10 = rx55_cur."ws"()
    unless $P10, rx55_fail
    rx55_pos = $P10."pos"()
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx55_cur."!cursor_pos"(rx55_pos)
    $P10 = rx55_cur."MARKER"("endstmt")
    unless $P10, rx55_fail
    goto alt60_end
  alt60_1:
.annotate "line", 27
  # rx rxquantr64 ** 0..1
    set_addr $I65, rxquantr64_done
    rx55_cur."!mark_push"(0, rx55_pos, $I65)
  rxquantr64_loop:
  # rx subrule "unv" subtype=method negate=
    rx55_cur."!cursor_pos"(rx55_pos)
    $P10 = rx55_cur."unv"()
    unless $P10, rx55_fail
    rx55_pos = $P10."pos"()
    (rx55_rep) = rx55_cur."!mark_commit"($I65)
  rxquantr64_done:
  # rxanchor eol
    sub $I10, rx55_pos, rx55_off
    is_cclass $I11, 4096, rx55_tgt, $I10
    if $I11, rxanchor66_done
    ne rx55_pos, rx55_eos, rx55_fail
    eq rx55_pos, 0, rxanchor66_done
    dec $I10
    is_cclass $I11, 4096, rx55_tgt, $I10
    if $I11, rx55_fail
  rxanchor66_done:
  # rx subrule "ws" subtype=method negate=
    rx55_cur."!cursor_pos"(rx55_pos)
    $P10 = rx55_cur."ws"()
    unless $P10, rx55_fail
    rx55_pos = $P10."pos"()
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx55_cur."!cursor_pos"(rx55_pos)
    $P10 = rx55_cur."MARKER"("endstmt")
    unless $P10, rx55_fail
  alt60_end:
.annotate "line", 28
    (rx55_rep) = rx55_cur."!mark_commit"($I67)
  rxquantr59_done:
.annotate "line", 24
  # rx pass
    rx55_cur."!cursor_pass"(rx55_pos, "ENDSTMT")
    rx55_cur."!cursor_debug"("PASS  ", "ENDSTMT", " at pos=", rx55_pos)
    .return (rx55_cur)
  rx55_fail:
.annotate "line", 4
    (rx55_rep, rx55_pos, $I10, $P10) = rx55_cur."!mark_fail"(0)
    lt rx55_pos, -1, rx55_done
    eq rx55_pos, -1, rx55_fail
    jump $I10
  rx55_done:
    rx55_cur."!cursor_fail"()
    rx55_cur."!cursor_debug"("FAIL  ", "ENDSTMT")
    .return (rx55_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__ENDSTMT"  :subid("20_1271336396.90314") :method
.annotate "line", 4
    new $P57, "ResizablePMCArray"
    push $P57, ""
    .return ($P57)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx69_tgt
    .local int rx69_pos
    .local int rx69_off
    .local int rx69_eos
    .local int rx69_rep
    .local pmc rx69_cur
    (rx69_cur, rx69_pos, rx69_tgt) = self."!cursor_start"()
    rx69_cur."!cursor_debug"("START ", "ws")
    .lex unicode:"$\x{a2}", rx69_cur
    .local pmc match
    .lex "$/", match
    length rx69_eos, rx69_tgt
    set rx69_off, 0
    lt rx69_pos, 2, rx69_start
    sub rx69_off, rx69_pos, 1
    substr rx69_tgt, rx69_tgt, rx69_off
  rx69_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan72_done
    goto rxscan72_scan
  rxscan72_loop:
    ($P10) = rx69_cur."from"()
    inc $P10
    set rx69_pos, $P10
    ge rx69_pos, rx69_eos, rxscan72_done
  rxscan72_scan:
    set_addr $I10, rxscan72_loop
    rx69_cur."!mark_push"(0, rx69_pos, $I10)
  rxscan72_done:
  alt73_0:
.annotate "line", 31
    set_addr $I10, alt73_1
    rx69_cur."!mark_push"(0, rx69_pos, $I10)
.annotate "line", 32
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."MARKED"("ws")
    unless $P10, rx69_fail
    goto alt73_end
  alt73_1:
.annotate "line", 33
  # rx subrule "ww" subtype=zerowidth negate=1
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."ww"()
    if $P10, rx69_fail
.annotate "line", 37
  # rx rxquantr74 ** 0..*
    set_addr $I77, rxquantr74_done
    rx69_cur."!mark_push"(0, rx69_pos, $I77)
  rxquantr74_loop:
  alt75_0:
.annotate "line", 34
    set_addr $I10, alt75_1
    rx69_cur."!mark_push"(0, rx69_pos, $I10)
  # rx charclass_q s r 1..-1
    sub $I10, rx69_pos, rx69_off
    find_not_cclass $I11, 32, rx69_tgt, $I10, rx69_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx69_fail
    add rx69_pos, rx69_off, $I11
    goto alt75_end
  alt75_1:
    set_addr $I10, alt75_2
    rx69_cur."!mark_push"(0, rx69_pos, $I10)
.annotate "line", 35
  # rx literal  "#"
    add $I11, rx69_pos, 1
    gt $I11, rx69_eos, rx69_fail
    sub $I11, rx69_pos, rx69_off
    substr $S10, rx69_tgt, $I11, 1
    ne $S10, "#", rx69_fail
    add rx69_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx69_pos, rx69_off
    find_cclass $I11, 4096, rx69_tgt, $I10, rx69_eos
    add rx69_pos, rx69_off, $I11
    goto alt75_end
  alt75_2:
.annotate "line", 36
  # rxanchor bol
    eq rx69_pos, 0, rxanchor76_done
    ge rx69_pos, rx69_eos, rx69_fail
    sub $I10, rx69_pos, rx69_off
    dec $I10
    is_cclass $I11, 4096, rx69_tgt, $I10
    unless $I11, rx69_fail
  rxanchor76_done:
  # rx subrule "pod_comment" subtype=method negate=
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."pod_comment"()
    unless $P10, rx69_fail
    rx69_pos = $P10."pos"()
  alt75_end:
.annotate "line", 37
    (rx69_rep) = rx69_cur."!mark_commit"($I77)
    rx69_cur."!mark_push"(rx69_rep, rx69_pos, $I77)
    goto rxquantr74_loop
  rxquantr74_done:
.annotate "line", 38
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."MARKER"("ws")
    unless $P10, rx69_fail
  alt73_end:
.annotate "line", 31
  # rx pass
    rx69_cur."!cursor_pass"(rx69_pos, "ws")
    rx69_cur."!cursor_debug"("PASS  ", "ws", " at pos=", rx69_pos)
    .return (rx69_cur)
  rx69_fail:
.annotate "line", 4
    (rx69_rep, rx69_pos, $I10, $P10) = rx69_cur."!mark_fail"(0)
    lt rx69_pos, -1, rx69_done
    eq rx69_pos, -1, rx69_fail
    jump $I10
  rx69_done:
    rx69_cur."!cursor_fail"()
    rx69_cur."!cursor_debug"("FAIL  ", "ws")
    .return (rx69_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__ws"  :subid("22_1271336396.90314") :method
.annotate "line", 4
    new $P71, "ResizablePMCArray"
    push $P71, ""
    push $P71, ""
    .return ($P71)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .const 'Sub' $P86 = "25_1271336396.90314" 
    capture_lex $P86
    .local string rx79_tgt
    .local int rx79_pos
    .local int rx79_off
    .local int rx79_eos
    .local int rx79_rep
    .local pmc rx79_cur
    (rx79_cur, rx79_pos, rx79_tgt) = self."!cursor_start"()
    rx79_cur."!cursor_debug"("START ", "unv")
    .lex unicode:"$\x{a2}", rx79_cur
    .local pmc match
    .lex "$/", match
    length rx79_eos, rx79_tgt
    set rx79_off, 0
    lt rx79_pos, 2, rx79_start
    sub rx79_off, rx79_pos, 1
    substr rx79_tgt, rx79_tgt, rx79_off
  rx79_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan82_done
    goto rxscan82_scan
  rxscan82_loop:
    ($P10) = rx79_cur."from"()
    inc $P10
    set rx79_pos, $P10
    ge rx79_pos, rx79_eos, rxscan82_done
  rxscan82_scan:
    set_addr $I10, rxscan82_loop
    rx79_cur."!mark_push"(0, rx79_pos, $I10)
  rxscan82_done:
  alt83_0:
.annotate "line", 43
    set_addr $I10, alt83_1
    rx79_cur."!mark_push"(0, rx79_pos, $I10)
.annotate "line", 44
  # rxanchor bol
    eq rx79_pos, 0, rxanchor84_done
    ge rx79_pos, rx79_eos, rx79_fail
    sub $I10, rx79_pos, rx79_off
    dec $I10
    is_cclass $I11, 4096, rx79_tgt, $I10
    unless $I11, rx79_fail
  rxanchor84_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx79_cur."!cursor_pos"(rx79_pos)
    .const 'Sub' $P86 = "25_1271336396.90314" 
    capture_lex $P86
    $P10 = rx79_cur."before"($P86)
    unless $P10, rx79_fail
  # rx subrule "pod_comment" subtype=method negate=
    rx79_cur."!cursor_pos"(rx79_pos)
    $P10 = rx79_cur."pod_comment"()
    unless $P10, rx79_fail
    rx79_pos = $P10."pos"()
    goto alt83_end
  alt83_1:
    set_addr $I10, alt83_2
    rx79_cur."!mark_push"(0, rx79_pos, $I10)
.annotate "line", 45
  # rx rxquantr92 ** 0..*
    set_addr $I93, rxquantr92_done
    rx79_cur."!mark_push"(0, rx79_pos, $I93)
  rxquantr92_loop:
  # rx enumcharlist negate=0 
    ge rx79_pos, rx79_eos, rx79_fail
    sub $I10, rx79_pos, rx79_off
    substr $S10, rx79_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx79_fail
    inc rx79_pos
    (rx79_rep) = rx79_cur."!mark_commit"($I93)
    rx79_cur."!mark_push"(rx79_rep, rx79_pos, $I93)
    goto rxquantr92_loop
  rxquantr92_done:
  # rx literal  "#"
    add $I11, rx79_pos, 1
    gt $I11, rx79_eos, rx79_fail
    sub $I11, rx79_pos, rx79_off
    substr $S10, rx79_tgt, $I11, 1
    ne $S10, "#", rx79_fail
    add rx79_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx79_pos, rx79_off
    find_cclass $I11, 4096, rx79_tgt, $I10, rx79_eos
    add rx79_pos, rx79_off, $I11
    goto alt83_end
  alt83_2:
.annotate "line", 46
  # rx rxquantr94 ** 1..*
    set_addr $I95, rxquantr94_done
    rx79_cur."!mark_push"(0, -1, $I95)
  rxquantr94_loop:
  # rx enumcharlist negate=0 
    ge rx79_pos, rx79_eos, rx79_fail
    sub $I10, rx79_pos, rx79_off
    substr $S10, rx79_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx79_fail
    inc rx79_pos
    (rx79_rep) = rx79_cur."!mark_commit"($I95)
    rx79_cur."!mark_push"(rx79_rep, rx79_pos, $I95)
    goto rxquantr94_loop
  rxquantr94_done:
  alt83_end:
.annotate "line", 41
  # rx pass
    rx79_cur."!cursor_pass"(rx79_pos, "unv")
    rx79_cur."!cursor_debug"("PASS  ", "unv", " at pos=", rx79_pos)
    .return (rx79_cur)
  rx79_fail:
.annotate "line", 4
    (rx79_rep, rx79_pos, $I10, $P10) = rx79_cur."!mark_fail"(0)
    lt rx79_pos, -1, rx79_done
    eq rx79_pos, -1, rx79_fail
    jump $I10
  rx79_done:
    rx79_cur."!cursor_fail"()
    rx79_cur."!cursor_debug"("FAIL  ", "unv")
    .return (rx79_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__unv"  :subid("24_1271336396.90314") :method
.annotate "line", 4
    new $P81, "ResizablePMCArray"
    push $P81, ""
    push $P81, ""
    push $P81, ""
    .return ($P81)
.end


.namespace ["NQP";"Grammar"]
.sub "_block85"  :anon :subid("25_1271336396.90314") :method :outer("23_1271336396.90314")
.annotate "line", 44
    .local string rx87_tgt
    .local int rx87_pos
    .local int rx87_off
    .local int rx87_eos
    .local int rx87_rep
    .local pmc rx87_cur
    (rx87_cur, rx87_pos, rx87_tgt) = self."!cursor_start"()
    rx87_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx87_cur
    .local pmc match
    .lex "$/", match
    length rx87_eos, rx87_tgt
    set rx87_off, 0
    lt rx87_pos, 2, rx87_start
    sub rx87_off, rx87_pos, 1
    substr rx87_tgt, rx87_tgt, rx87_off
  rx87_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan88_done
    goto rxscan88_scan
  rxscan88_loop:
    ($P10) = rx87_cur."from"()
    inc $P10
    set rx87_pos, $P10
    ge rx87_pos, rx87_eos, rxscan88_done
  rxscan88_scan:
    set_addr $I10, rxscan88_loop
    rx87_cur."!mark_push"(0, rx87_pos, $I10)
  rxscan88_done:
  # rx rxquantr89 ** 0..*
    set_addr $I90, rxquantr89_done
    rx87_cur."!mark_push"(0, rx87_pos, $I90)
  rxquantr89_loop:
  # rx enumcharlist negate=0 
    ge rx87_pos, rx87_eos, rx87_fail
    sub $I10, rx87_pos, rx87_off
    substr $S10, rx87_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx87_fail
    inc rx87_pos
    (rx87_rep) = rx87_cur."!mark_commit"($I90)
    rx87_cur."!mark_push"(rx87_rep, rx87_pos, $I90)
    goto rxquantr89_loop
  rxquantr89_done:
  # rx literal  "="
    add $I11, rx87_pos, 1
    gt $I11, rx87_eos, rx87_fail
    sub $I11, rx87_pos, rx87_off
    substr $S10, rx87_tgt, $I11, 1
    ne $S10, "=", rx87_fail
    add rx87_pos, 1
  alt91_0:
    set_addr $I10, alt91_1
    rx87_cur."!mark_push"(0, rx87_pos, $I10)
  # rx charclass w
    ge rx87_pos, rx87_eos, rx87_fail
    sub $I10, rx87_pos, rx87_off
    is_cclass $I11, 8192, rx87_tgt, $I10
    unless $I11, rx87_fail
    inc rx87_pos
    goto alt91_end
  alt91_1:
  # rx literal  "\\"
    add $I11, rx87_pos, 1
    gt $I11, rx87_eos, rx87_fail
    sub $I11, rx87_pos, rx87_off
    substr $S10, rx87_tgt, $I11, 1
    ne $S10, "\\", rx87_fail
    add rx87_pos, 1
  alt91_end:
  # rx pass
    rx87_cur."!cursor_pass"(rx87_pos, "")
    rx87_cur."!cursor_debug"("PASS  ", "", " at pos=", rx87_pos)
    .return (rx87_cur)
  rx87_fail:
    (rx87_rep, rx87_pos, $I10, $P10) = rx87_cur."!mark_fail"(0)
    lt rx87_pos, -1, rx87_done
    eq rx87_pos, -1, rx87_fail
    jump $I10
  rx87_done:
    rx87_cur."!cursor_fail"()
    rx87_cur."!cursor_debug"("FAIL  ", "")
    .return (rx87_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "pod_comment"  :subid("26_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .const 'Sub' $P133 = "28_1271336396.90314" 
    capture_lex $P133
    .local string rx97_tgt
    .local int rx97_pos
    .local int rx97_off
    .local int rx97_eos
    .local int rx97_rep
    .local pmc rx97_cur
    (rx97_cur, rx97_pos, rx97_tgt) = self."!cursor_start"()
    rx97_cur."!cursor_debug"("START ", "pod_comment")
    .lex unicode:"$\x{a2}", rx97_cur
    .local pmc match
    .lex "$/", match
    length rx97_eos, rx97_tgt
    set rx97_off, 0
    lt rx97_pos, 2, rx97_start
    sub rx97_off, rx97_pos, 1
    substr rx97_tgt, rx97_tgt, rx97_off
  rx97_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan100_done
    goto rxscan100_scan
  rxscan100_loop:
    ($P10) = rx97_cur."from"()
    inc $P10
    set rx97_pos, $P10
    ge rx97_pos, rx97_eos, rxscan100_done
  rxscan100_scan:
    set_addr $I10, rxscan100_loop
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
  rxscan100_done:
.annotate "line", 51
  # rxanchor bol
    eq rx97_pos, 0, rxanchor101_done
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    dec $I10
    is_cclass $I11, 4096, rx97_tgt, $I10
    unless $I11, rx97_fail
  rxanchor101_done:
  # rx rxquantr102 ** 0..*
    set_addr $I103, rxquantr102_done
    rx97_cur."!mark_push"(0, rx97_pos, $I103)
  rxquantr102_loop:
  # rx enumcharlist negate=0 
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx97_fail
    inc rx97_pos
    (rx97_rep) = rx97_cur."!mark_commit"($I103)
    rx97_cur."!mark_push"(rx97_rep, rx97_pos, $I103)
    goto rxquantr102_loop
  rxquantr102_done:
  # rx literal  "="
    add $I11, rx97_pos, 1
    gt $I11, rx97_eos, rx97_fail
    sub $I11, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I11, 1
    ne $S10, "=", rx97_fail
    add rx97_pos, 1
  alt104_0:
.annotate "line", 52
    set_addr $I10, alt104_1
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
.annotate "line", 53
  # rx literal  "begin"
    add $I11, rx97_pos, 5
    gt $I11, rx97_eos, rx97_fail
    sub $I11, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I11, 5
    ne $S10, "begin", rx97_fail
    add rx97_pos, 5
  # rx rxquantr105 ** 1..*
    set_addr $I106, rxquantr105_done
    rx97_cur."!mark_push"(0, -1, $I106)
  rxquantr105_loop:
  # rx enumcharlist negate=0 
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx97_fail
    inc rx97_pos
    (rx97_rep) = rx97_cur."!mark_commit"($I106)
    rx97_cur."!mark_push"(rx97_rep, rx97_pos, $I106)
    goto rxquantr105_loop
  rxquantr105_done:
  # rx literal  "END"
    add $I11, rx97_pos, 3
    gt $I11, rx97_eos, rx97_fail
    sub $I11, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I11, 3
    ne $S10, "END", rx97_fail
    add rx97_pos, 3
  # rxanchor rwb
    le rx97_pos, 0, rx97_fail
    sub $I10, rx97_pos, rx97_off
    is_cclass $I11, 8192, rx97_tgt, $I10
    if $I11, rx97_fail
    dec $I10
    is_cclass $I11, 8192, rx97_tgt, $I10
    unless $I11, rx97_fail
  alt107_0:
.annotate "line", 54
    set_addr $I10, alt107_1
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
  # rx rxquantf108 ** 0..*
    set_addr $I10, rxquantf108_loop
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
    goto rxquantf108_done
  rxquantf108_loop:
  # rx charclass .
    ge rx97_pos, rx97_eos, rx97_fail
    inc rx97_pos
    set_addr $I10, rxquantf108_loop
    rx97_cur."!mark_push"($I109, rx97_pos, $I10)
  rxquantf108_done:
  # rx charclass nl
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    is_cclass $I11, 4096, rx97_tgt, $I10
    unless $I11, rx97_fail
    substr $S10, rx97_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx97_pos, $I11
    inc rx97_pos
  # rx literal  "=end"
    add $I11, rx97_pos, 4
    gt $I11, rx97_eos, rx97_fail
    sub $I11, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I11, 4
    ne $S10, "=end", rx97_fail
    add rx97_pos, 4
  # rx rxquantr110 ** 1..*
    set_addr $I111, rxquantr110_done
    rx97_cur."!mark_push"(0, -1, $I111)
  rxquantr110_loop:
  # rx enumcharlist negate=0 
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx97_fail
    inc rx97_pos
    (rx97_rep) = rx97_cur."!mark_commit"($I111)
    rx97_cur."!mark_push"(rx97_rep, rx97_pos, $I111)
    goto rxquantr110_loop
  rxquantr110_done:
  # rx literal  "END"
    add $I11, rx97_pos, 3
    gt $I11, rx97_eos, rx97_fail
    sub $I11, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I11, 3
    ne $S10, "END", rx97_fail
    add rx97_pos, 3
  # rxanchor rwb
    le rx97_pos, 0, rx97_fail
    sub $I10, rx97_pos, rx97_off
    is_cclass $I11, 8192, rx97_tgt, $I10
    if $I11, rx97_fail
    dec $I10
    is_cclass $I11, 8192, rx97_tgt, $I10
    unless $I11, rx97_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx97_pos, rx97_off
    find_cclass $I11, 4096, rx97_tgt, $I10, rx97_eos
    add rx97_pos, rx97_off, $I11
    goto alt107_end
  alt107_1:
  # rx charclass_q . r 0..-1
    sub $I10, rx97_pos, rx97_off
    find_not_cclass $I11, 65535, rx97_tgt, $I10, rx97_eos
    add rx97_pos, rx97_off, $I11
  alt107_end:
.annotate "line", 53
    goto alt104_end
  alt104_1:
    set_addr $I10, alt104_2
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
.annotate "line", 55
  # rx literal  "begin"
    add $I11, rx97_pos, 5
    gt $I11, rx97_eos, rx97_fail
    sub $I11, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I11, 5
    ne $S10, "begin", rx97_fail
    add rx97_pos, 5
  # rx rxquantr112 ** 1..*
    set_addr $I113, rxquantr112_done
    rx97_cur."!mark_push"(0, -1, $I113)
  rxquantr112_loop:
  # rx enumcharlist negate=0 
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx97_fail
    inc rx97_pos
    (rx97_rep) = rx97_cur."!mark_commit"($I113)
    rx97_cur."!mark_push"(rx97_rep, rx97_pos, $I113)
    goto rxquantr112_loop
  rxquantr112_done:
  # rx subrule "identifier" subtype=capture negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    $P10 = rx97_cur."identifier"()
    unless $P10, rx97_fail
    rx97_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx97_pos = $P10."pos"()
  alt114_0:
.annotate "line", 56
    set_addr $I10, alt114_1
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
.annotate "line", 57
  # rx rxquantf115 ** 0..*
    set_addr $I10, rxquantf115_loop
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
    goto rxquantf115_done
  rxquantf115_loop:
  # rx charclass .
    ge rx97_pos, rx97_eos, rx97_fail
    inc rx97_pos
    set_addr $I10, rxquantf115_loop
    rx97_cur."!mark_push"($I116, rx97_pos, $I10)
  rxquantf115_done:
  # rx charclass nl
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    is_cclass $I11, 4096, rx97_tgt, $I10
    unless $I11, rx97_fail
    substr $S10, rx97_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx97_pos, $I11
    inc rx97_pos
  # rx literal  "=end"
    add $I11, rx97_pos, 4
    gt $I11, rx97_eos, rx97_fail
    sub $I11, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I11, 4
    ne $S10, "=end", rx97_fail
    add rx97_pos, 4
  # rx rxquantr117 ** 1..*
    set_addr $I118, rxquantr117_done
    rx97_cur."!mark_push"(0, -1, $I118)
  rxquantr117_loop:
  # rx enumcharlist negate=0 
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx97_fail
    inc rx97_pos
    (rx97_rep) = rx97_cur."!mark_commit"($I118)
    rx97_cur."!mark_push"(rx97_rep, rx97_pos, $I118)
    goto rxquantr117_loop
  rxquantr117_done:
  # rx subrule "!BACKREF" subtype=method negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    $P10 = rx97_cur."!BACKREF"("identifier")
    unless $P10, rx97_fail
    rx97_pos = $P10."pos"()
  # rxanchor rwb
    le rx97_pos, 0, rx97_fail
    sub $I10, rx97_pos, rx97_off
    is_cclass $I11, 8192, rx97_tgt, $I10
    if $I11, rx97_fail
    dec $I10
    is_cclass $I11, 8192, rx97_tgt, $I10
    unless $I11, rx97_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx97_pos, rx97_off
    find_cclass $I11, 4096, rx97_tgt, $I10, rx97_eos
    add rx97_pos, rx97_off, $I11
    goto alt114_end
  alt114_1:
.annotate "line", 58
  # rx subrule "panic" subtype=method negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    $P10 = rx97_cur."panic"("=begin without matching =end")
    unless $P10, rx97_fail
    rx97_pos = $P10."pos"()
  alt114_end:
.annotate "line", 55
    goto alt104_end
  alt104_2:
    set_addr $I10, alt104_3
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
.annotate "line", 60
  # rx literal  "begin"
    add $I11, rx97_pos, 5
    gt $I11, rx97_eos, rx97_fail
    sub $I11, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I11, 5
    ne $S10, "begin", rx97_fail
    add rx97_pos, 5
  # rxanchor rwb
    le rx97_pos, 0, rx97_fail
    sub $I10, rx97_pos, rx97_off
    is_cclass $I11, 8192, rx97_tgt, $I10
    if $I11, rx97_fail
    dec $I10
    is_cclass $I11, 8192, rx97_tgt, $I10
    unless $I11, rx97_fail
  # rx rxquantr120 ** 0..*
    set_addr $I121, rxquantr120_done
    rx97_cur."!mark_push"(0, rx97_pos, $I121)
  rxquantr120_loop:
  # rx enumcharlist negate=0 
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx97_fail
    inc rx97_pos
    (rx97_rep) = rx97_cur."!mark_commit"($I121)
    rx97_cur."!mark_push"(rx97_rep, rx97_pos, $I121)
    goto rxquantr120_loop
  rxquantr120_done:
  alt122_0:
.annotate "line", 61
    set_addr $I10, alt122_1
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
  # rxanchor eol
    sub $I10, rx97_pos, rx97_off
    is_cclass $I11, 4096, rx97_tgt, $I10
    if $I11, rxanchor123_done
    ne rx97_pos, rx97_eos, rx97_fail
    eq rx97_pos, 0, rxanchor123_done
    dec $I10
    is_cclass $I11, 4096, rx97_tgt, $I10
    if $I11, rx97_fail
  rxanchor123_done:
    goto alt122_end
  alt122_1:
    set_addr $I10, alt122_2
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
  # rx literal  "#"
    add $I11, rx97_pos, 1
    gt $I11, rx97_eos, rx97_fail
    sub $I11, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I11, 1
    ne $S10, "#", rx97_fail
    add rx97_pos, 1
    goto alt122_end
  alt122_2:
  # rx subrule "panic" subtype=method negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    $P10 = rx97_cur."panic"("Unrecognized token after =begin")
    unless $P10, rx97_fail
    rx97_pos = $P10."pos"()
  alt122_end:
  alt124_0:
.annotate "line", 62
    set_addr $I10, alt124_1
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
.annotate "line", 63
  # rx rxquantf125 ** 0..*
    set_addr $I10, rxquantf125_loop
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
    goto rxquantf125_done
  rxquantf125_loop:
  # rx charclass .
    ge rx97_pos, rx97_eos, rx97_fail
    inc rx97_pos
    set_addr $I10, rxquantf125_loop
    rx97_cur."!mark_push"($I126, rx97_pos, $I10)
  rxquantf125_done:
  # rx charclass nl
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    is_cclass $I11, 4096, rx97_tgt, $I10
    unless $I11, rx97_fail
    substr $S10, rx97_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx97_pos, $I11
    inc rx97_pos
  # rx rxquantr127 ** 0..*
    set_addr $I128, rxquantr127_done
    rx97_cur."!mark_push"(0, rx97_pos, $I128)
  rxquantr127_loop:
  # rx enumcharlist negate=0 
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx97_fail
    inc rx97_pos
    (rx97_rep) = rx97_cur."!mark_commit"($I128)
    rx97_cur."!mark_push"(rx97_rep, rx97_pos, $I128)
    goto rxquantr127_loop
  rxquantr127_done:
  # rx literal  "=end"
    add $I11, rx97_pos, 4
    gt $I11, rx97_eos, rx97_fail
    sub $I11, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I11, 4
    ne $S10, "=end", rx97_fail
    add rx97_pos, 4
  # rxanchor rwb
    le rx97_pos, 0, rx97_fail
    sub $I10, rx97_pos, rx97_off
    is_cclass $I11, 8192, rx97_tgt, $I10
    if $I11, rx97_fail
    dec $I10
    is_cclass $I11, 8192, rx97_tgt, $I10
    unless $I11, rx97_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx97_pos, rx97_off
    find_cclass $I11, 4096, rx97_tgt, $I10, rx97_eos
    add rx97_pos, rx97_off, $I11
    goto alt124_end
  alt124_1:
.annotate "line", 64
  # rx subrule "panic" subtype=method negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    $P10 = rx97_cur."panic"("=begin without matching =end")
    unless $P10, rx97_fail
    rx97_pos = $P10."pos"()
  alt124_end:
.annotate "line", 60
    goto alt104_end
  alt104_3:
    set_addr $I10, alt104_4
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
.annotate "line", 66
  # rx subrule "identifier" subtype=capture negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    $P10 = rx97_cur."identifier"()
    unless $P10, rx97_fail
    rx97_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx97_pos = $P10."pos"()
.annotate "line", 67
  # rx rxquantf129 ** 0..*
    set_addr $I10, rxquantf129_loop
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
    goto rxquantf129_done
  rxquantf129_loop:
  # rx charclass .
    ge rx97_pos, rx97_eos, rx97_fail
    inc rx97_pos
    set_addr $I10, rxquantf129_loop
    rx97_cur."!mark_push"($I130, rx97_pos, $I10)
  rxquantf129_done:
  # rxanchor bol
    eq rx97_pos, 0, rxanchor131_done
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    dec $I10
    is_cclass $I11, 4096, rx97_tgt, $I10
    unless $I11, rx97_fail
  rxanchor131_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    .const 'Sub' $P133 = "28_1271336396.90314" 
    capture_lex $P133
    $P10 = rx97_cur."before"($P133)
    unless $P10, rx97_fail
.annotate "line", 66
    goto alt104_end
  alt104_4:
  alt141_0:
.annotate "line", 73
    set_addr $I10, alt141_1
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
  # rx charclass s
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    is_cclass $I11, 32, rx97_tgt, $I10
    unless $I11, rx97_fail
    inc rx97_pos
    goto alt141_end
  alt141_1:
  # rx subrule "panic" subtype=method negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    $P10 = rx97_cur."panic"("Illegal pod directive")
    unless $P10, rx97_fail
    rx97_pos = $P10."pos"()
  alt141_end:
.annotate "line", 74
  # rx charclass_q N r 0..-1
    sub $I10, rx97_pos, rx97_off
    find_cclass $I11, 4096, rx97_tgt, $I10, rx97_eos
    add rx97_pos, rx97_off, $I11
  alt104_end:
.annotate "line", 50
  # rx pass
    rx97_cur."!cursor_pass"(rx97_pos, "pod_comment")
    rx97_cur."!cursor_debug"("PASS  ", "pod_comment", " at pos=", rx97_pos)
    .return (rx97_cur)
  rx97_fail:
.annotate "line", 4
    (rx97_rep, rx97_pos, $I10, $P10) = rx97_cur."!mark_fail"(0)
    lt rx97_pos, -1, rx97_done
    eq rx97_pos, -1, rx97_fail
    jump $I10
  rx97_done:
    rx97_cur."!cursor_fail"()
    rx97_cur."!cursor_debug"("FAIL  ", "pod_comment")
    .return (rx97_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pod_comment"  :subid("27_1271336396.90314") :method
.annotate "line", 4
    new $P99, "ResizablePMCArray"
    push $P99, ""
    .return ($P99)
.end


.namespace ["NQP";"Grammar"]
.sub "_block132"  :anon :subid("28_1271336396.90314") :method :outer("26_1271336396.90314")
.annotate "line", 67
    .local string rx134_tgt
    .local int rx134_pos
    .local int rx134_off
    .local int rx134_eos
    .local int rx134_rep
    .local pmc rx134_cur
    (rx134_cur, rx134_pos, rx134_tgt) = self."!cursor_start"()
    rx134_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx134_cur
    .local pmc match
    .lex "$/", match
    length rx134_eos, rx134_tgt
    set rx134_off, 0
    lt rx134_pos, 2, rx134_start
    sub rx134_off, rx134_pos, 1
    substr rx134_tgt, rx134_tgt, rx134_off
  rx134_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan135_done
    goto rxscan135_scan
  rxscan135_loop:
    ($P10) = rx134_cur."from"()
    inc $P10
    set rx134_pos, $P10
    ge rx134_pos, rx134_eos, rxscan135_done
  rxscan135_scan:
    set_addr $I10, rxscan135_loop
    rx134_cur."!mark_push"(0, rx134_pos, $I10)
  rxscan135_done:
  # rx rxquantr136 ** 0..*
    set_addr $I137, rxquantr136_done
    rx134_cur."!mark_push"(0, rx134_pos, $I137)
  rxquantr136_loop:
  # rx enumcharlist negate=0 
    ge rx134_pos, rx134_eos, rx134_fail
    sub $I10, rx134_pos, rx134_off
    substr $S10, rx134_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx134_fail
    inc rx134_pos
    (rx134_rep) = rx134_cur."!mark_commit"($I137)
    rx134_cur."!mark_push"(rx134_rep, rx134_pos, $I137)
    goto rxquantr136_loop
  rxquantr136_done:
  alt138_0:
    set_addr $I10, alt138_1
    rx134_cur."!mark_push"(0, rx134_pos, $I10)
.annotate "line", 68
  # rx literal  "="
    add $I11, rx134_pos, 1
    gt $I11, rx134_eos, rx134_fail
    sub $I11, rx134_pos, rx134_off
    substr $S10, rx134_tgt, $I11, 1
    ne $S10, "=", rx134_fail
    add rx134_pos, 1
.annotate "line", 70
  # rx rxquantr139 ** 0..1
    set_addr $I140, rxquantr139_done
    rx134_cur."!mark_push"(0, rx134_pos, $I140)
  rxquantr139_loop:
.annotate "line", 69
  # rx literal  "cut"
    add $I11, rx134_pos, 3
    gt $I11, rx134_eos, rx134_fail
    sub $I11, rx134_pos, rx134_off
    substr $S10, rx134_tgt, $I11, 3
    ne $S10, "cut", rx134_fail
    add rx134_pos, 3
  # rxanchor rwb
    le rx134_pos, 0, rx134_fail
    sub $I10, rx134_pos, rx134_off
    is_cclass $I11, 8192, rx134_tgt, $I10
    if $I11, rx134_fail
    dec $I10
    is_cclass $I11, 8192, rx134_tgt, $I10
    unless $I11, rx134_fail
.annotate "line", 70
  # rx subrule "panic" subtype=method negate=
    rx134_cur."!cursor_pos"(rx134_pos)
    $P10 = rx134_cur."panic"("Obsolete pod format, please use =begin/=end instead")
    unless $P10, rx134_fail
    rx134_pos = $P10."pos"()
    (rx134_rep) = rx134_cur."!mark_commit"($I140)
  rxquantr139_done:
.annotate "line", 67
    goto alt138_end
  alt138_1:
.annotate "line", 71
  # rx charclass nl
    ge rx134_pos, rx134_eos, rx134_fail
    sub $I10, rx134_pos, rx134_off
    is_cclass $I11, 4096, rx134_tgt, $I10
    unless $I11, rx134_fail
    substr $S10, rx134_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx134_pos, $I11
    inc rx134_pos
  alt138_end:
.annotate "line", 67
  # rx pass
    rx134_cur."!cursor_pass"(rx134_pos, "")
    rx134_cur."!cursor_debug"("PASS  ", "", " at pos=", rx134_pos)
    .return (rx134_cur)
  rx134_fail:
    (rx134_rep, rx134_pos, $I10, $P10) = rx134_cur."!mark_fail"(0)
    lt rx134_pos, -1, rx134_done
    eq rx134_pos, -1, rx134_fail
    jump $I10
  rx134_done:
    rx134_cur."!cursor_fail"()
    rx134_cur."!cursor_debug"("FAIL  ", "")
    .return (rx134_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "comp_unit"  :subid("29_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx143_tgt
    .local int rx143_pos
    .local int rx143_off
    .local int rx143_eos
    .local int rx143_rep
    .local pmc rx143_cur
    (rx143_cur, rx143_pos, rx143_tgt) = self."!cursor_start"()
    rx143_cur."!cursor_debug"("START ", "comp_unit")
    .lex unicode:"$\x{a2}", rx143_cur
    .local pmc match
    .lex "$/", match
    length rx143_eos, rx143_tgt
    set rx143_off, 0
    lt rx143_pos, 2, rx143_start
    sub rx143_off, rx143_pos, 1
    substr rx143_tgt, rx143_tgt, rx143_off
  rx143_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan147_done
    goto rxscan147_scan
  rxscan147_loop:
    ($P10) = rx143_cur."from"()
    inc $P10
    set rx143_pos, $P10
    ge rx143_pos, rx143_eos, rxscan147_done
  rxscan147_scan:
    set_addr $I10, rxscan147_loop
    rx143_cur."!mark_push"(0, rx143_pos, $I10)
  rxscan147_done:
.annotate "line", 82
  # rx subrule "newpad" subtype=method negate=
    rx143_cur."!cursor_pos"(rx143_pos)
    $P10 = rx143_cur."newpad"()
    unless $P10, rx143_fail
    rx143_pos = $P10."pos"()
.annotate "line", 83
  # rx subrule "statementlist" subtype=capture negate=
    rx143_cur."!cursor_pos"(rx143_pos)
    $P10 = rx143_cur."statementlist"()
    unless $P10, rx143_fail
    rx143_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx143_pos = $P10."pos"()
  alt148_0:
.annotate "line", 84
    set_addr $I10, alt148_1
    rx143_cur."!mark_push"(0, rx143_pos, $I10)
  # rxanchor eos
    ne rx143_pos, rx143_eos, rx143_fail
    goto alt148_end
  alt148_1:
  # rx subrule "panic" subtype=method negate=
    rx143_cur."!cursor_pos"(rx143_pos)
    $P10 = rx143_cur."panic"("Confused")
    unless $P10, rx143_fail
    rx143_pos = $P10."pos"()
  alt148_end:
.annotate "line", 81
  # rx pass
    rx143_cur."!cursor_pass"(rx143_pos, "comp_unit")
    rx143_cur."!cursor_debug"("PASS  ", "comp_unit", " at pos=", rx143_pos)
    .return (rx143_cur)
  rx143_fail:
.annotate "line", 4
    (rx143_rep, rx143_pos, $I10, $P10) = rx143_cur."!mark_fail"(0)
    lt rx143_pos, -1, rx143_done
    eq rx143_pos, -1, rx143_fail
    jump $I10
  rx143_done:
    rx143_cur."!cursor_fail"()
    rx143_cur."!cursor_debug"("FAIL  ", "comp_unit")
    .return (rx143_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__comp_unit"  :subid("30_1271336396.90314") :method
.annotate "line", 4
    $P145 = self."!PREFIX__!subrule"("", "")
    new $P146, "ResizablePMCArray"
    push $P146, $P145
    .return ($P146)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx150_tgt
    .local int rx150_pos
    .local int rx150_off
    .local int rx150_eos
    .local int rx150_rep
    .local pmc rx150_cur
    (rx150_cur, rx150_pos, rx150_tgt) = self."!cursor_start"()
    rx150_cur."!cursor_debug"("START ", "statementlist")
    rx150_cur."!cursor_caparray"("statement")
    .lex unicode:"$\x{a2}", rx150_cur
    .local pmc match
    .lex "$/", match
    length rx150_eos, rx150_tgt
    set rx150_off, 0
    lt rx150_pos, 2, rx150_start
    sub rx150_off, rx150_pos, 1
    substr rx150_tgt, rx150_tgt, rx150_off
  rx150_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan153_done
    goto rxscan153_scan
  rxscan153_loop:
    ($P10) = rx150_cur."from"()
    inc $P10
    set rx150_pos, $P10
    ge rx150_pos, rx150_eos, rxscan153_done
  rxscan153_scan:
    set_addr $I10, rxscan153_loop
    rx150_cur."!mark_push"(0, rx150_pos, $I10)
  rxscan153_done:
  alt154_0:
.annotate "line", 87
    set_addr $I10, alt154_1
    rx150_cur."!mark_push"(0, rx150_pos, $I10)
.annotate "line", 88
  # rx subrule "ws" subtype=method negate=
    rx150_cur."!cursor_pos"(rx150_pos)
    $P10 = rx150_cur."ws"()
    unless $P10, rx150_fail
    rx150_pos = $P10."pos"()
  # rxanchor eos
    ne rx150_pos, rx150_eos, rx150_fail
  # rx subrule "ws" subtype=method negate=
    rx150_cur."!cursor_pos"(rx150_pos)
    $P10 = rx150_cur."ws"()
    unless $P10, rx150_fail
    rx150_pos = $P10."pos"()
    goto alt154_end
  alt154_1:
.annotate "line", 89
  # rx subrule "ws" subtype=method negate=
    rx150_cur."!cursor_pos"(rx150_pos)
    $P10 = rx150_cur."ws"()
    unless $P10, rx150_fail
    rx150_pos = $P10."pos"()
  # rx rxquantr158 ** 0..*
    set_addr $I160, rxquantr158_done
    rx150_cur."!mark_push"(0, rx150_pos, $I160)
  rxquantr158_loop:
  # rx subrule "statement" subtype=capture negate=
    rx150_cur."!cursor_pos"(rx150_pos)
    $P10 = rx150_cur."statement"()
    unless $P10, rx150_fail
    rx150_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx150_pos = $P10."pos"()
  # rx subrule "eat_terminator" subtype=method negate=
    rx150_cur."!cursor_pos"(rx150_pos)
    $P10 = rx150_cur."eat_terminator"()
    unless $P10, rx150_fail
    rx150_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx150_cur."!cursor_pos"(rx150_pos)
    $P10 = rx150_cur."ws"()
    unless $P10, rx150_fail
    rx150_pos = $P10."pos"()
    (rx150_rep) = rx150_cur."!mark_commit"($I160)
    rx150_cur."!mark_push"(rx150_rep, rx150_pos, $I160)
    goto rxquantr158_loop
  rxquantr158_done:
  # rx subrule "ws" subtype=method negate=
    rx150_cur."!cursor_pos"(rx150_pos)
    $P10 = rx150_cur."ws"()
    unless $P10, rx150_fail
    rx150_pos = $P10."pos"()
  alt154_end:
.annotate "line", 87
  # rx pass
    rx150_cur."!cursor_pass"(rx150_pos, "statementlist")
    rx150_cur."!cursor_debug"("PASS  ", "statementlist", " at pos=", rx150_pos)
    .return (rx150_cur)
  rx150_fail:
.annotate "line", 4
    (rx150_rep, rx150_pos, $I10, $P10) = rx150_cur."!mark_fail"(0)
    lt rx150_pos, -1, rx150_done
    eq rx150_pos, -1, rx150_fail
    jump $I10
  rx150_done:
    rx150_cur."!cursor_fail"()
    rx150_cur."!cursor_debug"("FAIL  ", "statementlist")
    .return (rx150_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statementlist"  :subid("32_1271336396.90314") :method
.annotate "line", 4
    new $P152, "ResizablePMCArray"
    push $P152, ""
    push $P152, ""
    .return ($P152)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .const 'Sub' $P168 = "35_1271336396.90314" 
    capture_lex $P168
    .local string rx163_tgt
    .local int rx163_pos
    .local int rx163_off
    .local int rx163_eos
    .local int rx163_rep
    .local pmc rx163_cur
    (rx163_cur, rx163_pos, rx163_tgt) = self."!cursor_start"()
    rx163_cur."!cursor_debug"("START ", "statement")
    rx163_cur."!cursor_caparray"("statement_mod_loop", "statement_mod_cond")
    .lex unicode:"$\x{a2}", rx163_cur
    .local pmc match
    .lex "$/", match
    length rx163_eos, rx163_tgt
    set rx163_off, 0
    lt rx163_pos, 2, rx163_start
    sub rx163_off, rx163_pos, 1
    substr rx163_tgt, rx163_tgt, rx163_off
  rx163_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan166_done
    goto rxscan166_scan
  rxscan166_loop:
    ($P10) = rx163_cur."from"()
    inc $P10
    set rx163_pos, $P10
    ge rx163_pos, rx163_eos, rxscan166_done
  rxscan166_scan:
    set_addr $I10, rxscan166_loop
    rx163_cur."!mark_push"(0, rx163_pos, $I10)
  rxscan166_done:
.annotate "line", 93
  # rx subrule "before" subtype=zerowidth negate=1
    rx163_cur."!cursor_pos"(rx163_pos)
    .const 'Sub' $P168 = "35_1271336396.90314" 
    capture_lex $P168
    $P10 = rx163_cur."before"($P168)
    if $P10, rx163_fail
  alt172_0:
.annotate "line", 94
    set_addr $I10, alt172_1
    rx163_cur."!mark_push"(0, rx163_pos, $I10)
.annotate "line", 95
  # rx subrule "statement_control" subtype=capture negate=
    rx163_cur."!cursor_pos"(rx163_pos)
    $P10 = rx163_cur."statement_control"()
    unless $P10, rx163_fail
    rx163_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_control")
    rx163_pos = $P10."pos"()
    goto alt172_end
  alt172_1:
.annotate "line", 96
  # rx subrule "EXPR" subtype=capture negate=
    rx163_cur."!cursor_pos"(rx163_pos)
    $P10 = rx163_cur."EXPR"()
    unless $P10, rx163_fail
    rx163_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx163_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx163_cur."!cursor_pos"(rx163_pos)
    $P10 = rx163_cur."ws"()
    unless $P10, rx163_fail
    rx163_pos = $P10."pos"()
.annotate "line", 101
  # rx rxquantr173 ** 0..1
    set_addr $I177, rxquantr173_done
    rx163_cur."!mark_push"(0, rx163_pos, $I177)
  rxquantr173_loop:
  alt174_0:
.annotate "line", 97
    set_addr $I10, alt174_1
    rx163_cur."!mark_push"(0, rx163_pos, $I10)
.annotate "line", 98
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx163_cur."!cursor_pos"(rx163_pos)
    $P10 = rx163_cur."MARKED"("endstmt")
    unless $P10, rx163_fail
    goto alt174_end
  alt174_1:
    set_addr $I10, alt174_2
    rx163_cur."!mark_push"(0, rx163_pos, $I10)
.annotate "line", 99
  # rx subrule "statement_mod_cond" subtype=capture negate=
    rx163_cur."!cursor_pos"(rx163_pos)
    $P10 = rx163_cur."statement_mod_cond"()
    unless $P10, rx163_fail
    rx163_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_cond")
    rx163_pos = $P10."pos"()
  # rx rxquantr175 ** 0..1
    set_addr $I176, rxquantr175_done
    rx163_cur."!mark_push"(0, rx163_pos, $I176)
  rxquantr175_loop:
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx163_cur."!cursor_pos"(rx163_pos)
    $P10 = rx163_cur."statement_mod_loop"()
    unless $P10, rx163_fail
    rx163_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx163_pos = $P10."pos"()
    (rx163_rep) = rx163_cur."!mark_commit"($I176)
  rxquantr175_done:
    goto alt174_end
  alt174_2:
.annotate "line", 100
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx163_cur."!cursor_pos"(rx163_pos)
    $P10 = rx163_cur."statement_mod_loop"()
    unless $P10, rx163_fail
    rx163_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx163_pos = $P10."pos"()
  alt174_end:
.annotate "line", 101
    (rx163_rep) = rx163_cur."!mark_commit"($I177)
  rxquantr173_done:
  alt172_end:
.annotate "line", 92
  # rx pass
    rx163_cur."!cursor_pass"(rx163_pos, "statement")
    rx163_cur."!cursor_debug"("PASS  ", "statement", " at pos=", rx163_pos)
    .return (rx163_cur)
  rx163_fail:
.annotate "line", 4
    (rx163_rep, rx163_pos, $I10, $P10) = rx163_cur."!mark_fail"(0)
    lt rx163_pos, -1, rx163_done
    eq rx163_pos, -1, rx163_fail
    jump $I10
  rx163_done:
    rx163_cur."!cursor_fail"()
    rx163_cur."!cursor_debug"("FAIL  ", "statement")
    .return (rx163_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement"  :subid("34_1271336396.90314") :method
.annotate "line", 4
    new $P165, "ResizablePMCArray"
    push $P165, ""
    .return ($P165)
.end


.namespace ["NQP";"Grammar"]
.sub "_block167"  :anon :subid("35_1271336396.90314") :method :outer("33_1271336396.90314")
.annotate "line", 93
    .local string rx169_tgt
    .local int rx169_pos
    .local int rx169_off
    .local int rx169_eos
    .local int rx169_rep
    .local pmc rx169_cur
    (rx169_cur, rx169_pos, rx169_tgt) = self."!cursor_start"()
    rx169_cur."!cursor_debug"("START ", "")
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
    ne $I10, -1, rxscan170_done
    goto rxscan170_scan
  rxscan170_loop:
    ($P10) = rx169_cur."from"()
    inc $P10
    set rx169_pos, $P10
    ge rx169_pos, rx169_eos, rxscan170_done
  rxscan170_scan:
    set_addr $I10, rxscan170_loop
    rx169_cur."!mark_push"(0, rx169_pos, $I10)
  rxscan170_done:
  alt171_0:
    set_addr $I10, alt171_1
    rx169_cur."!mark_push"(0, rx169_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx169_pos, rx169_eos, rx169_fail
    sub $I10, rx169_pos, rx169_off
    substr $S10, rx169_tgt, $I10, 1
    index $I11, "])}", $S10
    lt $I11, 0, rx169_fail
    inc rx169_pos
    goto alt171_end
  alt171_1:
  # rxanchor eos
    ne rx169_pos, rx169_eos, rx169_fail
  alt171_end:
  # rx pass
    rx169_cur."!cursor_pass"(rx169_pos, "")
    rx169_cur."!cursor_debug"("PASS  ", "", " at pos=", rx169_pos)
    .return (rx169_cur)
  rx169_fail:
    (rx169_rep, rx169_pos, $I10, $P10) = rx169_cur."!mark_fail"(0)
    lt rx169_pos, -1, rx169_done
    eq rx169_pos, -1, rx169_fail
    jump $I10
  rx169_done:
    rx169_cur."!cursor_fail"()
    rx169_cur."!cursor_debug"("FAIL  ", "")
    .return (rx169_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "eat_terminator"  :subid("36_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx179_tgt
    .local int rx179_pos
    .local int rx179_off
    .local int rx179_eos
    .local int rx179_rep
    .local pmc rx179_cur
    (rx179_cur, rx179_pos, rx179_tgt) = self."!cursor_start"()
    rx179_cur."!cursor_debug"("START ", "eat_terminator")
    .lex unicode:"$\x{a2}", rx179_cur
    .local pmc match
    .lex "$/", match
    length rx179_eos, rx179_tgt
    set rx179_off, 0
    lt rx179_pos, 2, rx179_start
    sub rx179_off, rx179_pos, 1
    substr rx179_tgt, rx179_tgt, rx179_off
  rx179_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan182_done
    goto rxscan182_scan
  rxscan182_loop:
    ($P10) = rx179_cur."from"()
    inc $P10
    set rx179_pos, $P10
    ge rx179_pos, rx179_eos, rxscan182_done
  rxscan182_scan:
    set_addr $I10, rxscan182_loop
    rx179_cur."!mark_push"(0, rx179_pos, $I10)
  rxscan182_done:
  alt183_0:
.annotate "line", 105
    set_addr $I10, alt183_1
    rx179_cur."!mark_push"(0, rx179_pos, $I10)
.annotate "line", 106
  # rx literal  ";"
    add $I11, rx179_pos, 1
    gt $I11, rx179_eos, rx179_fail
    sub $I11, rx179_pos, rx179_off
    substr $S10, rx179_tgt, $I11, 1
    ne $S10, ";", rx179_fail
    add rx179_pos, 1
    goto alt183_end
  alt183_1:
    set_addr $I10, alt183_2
    rx179_cur."!mark_push"(0, rx179_pos, $I10)
.annotate "line", 107
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx179_cur."!cursor_pos"(rx179_pos)
    $P10 = rx179_cur."MARKED"("endstmt")
    unless $P10, rx179_fail
    goto alt183_end
  alt183_2:
    set_addr $I10, alt183_3
    rx179_cur."!mark_push"(0, rx179_pos, $I10)
.annotate "line", 108
  # rx subrule "terminator" subtype=zerowidth negate=
    rx179_cur."!cursor_pos"(rx179_pos)
    $P10 = rx179_cur."terminator"()
    unless $P10, rx179_fail
    goto alt183_end
  alt183_3:
.annotate "line", 109
  # rxanchor eos
    ne rx179_pos, rx179_eos, rx179_fail
  alt183_end:
.annotate "line", 105
  # rx pass
    rx179_cur."!cursor_pass"(rx179_pos, "eat_terminator")
    rx179_cur."!cursor_debug"("PASS  ", "eat_terminator", " at pos=", rx179_pos)
    .return (rx179_cur)
  rx179_fail:
.annotate "line", 4
    (rx179_rep, rx179_pos, $I10, $P10) = rx179_cur."!mark_fail"(0)
    lt rx179_pos, -1, rx179_done
    eq rx179_pos, -1, rx179_fail
    jump $I10
  rx179_done:
    rx179_cur."!cursor_fail"()
    rx179_cur."!cursor_debug"("FAIL  ", "eat_terminator")
    .return (rx179_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__eat_terminator"  :subid("37_1271336396.90314") :method
.annotate "line", 4
    new $P181, "ResizablePMCArray"
    push $P181, ""
    push $P181, ""
    push $P181, ""
    push $P181, ";"
    .return ($P181)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx185_tgt
    .local int rx185_pos
    .local int rx185_off
    .local int rx185_eos
    .local int rx185_rep
    .local pmc rx185_cur
    (rx185_cur, rx185_pos, rx185_tgt) = self."!cursor_start"()
    rx185_cur."!cursor_debug"("START ", "xblock")
    .lex unicode:"$\x{a2}", rx185_cur
    .local pmc match
    .lex "$/", match
    length rx185_eos, rx185_tgt
    set rx185_off, 0
    lt rx185_pos, 2, rx185_start
    sub rx185_off, rx185_pos, 1
    substr rx185_tgt, rx185_tgt, rx185_off
  rx185_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan189_done
    goto rxscan189_scan
  rxscan189_loop:
    ($P10) = rx185_cur."from"()
    inc $P10
    set rx185_pos, $P10
    ge rx185_pos, rx185_eos, rxscan189_done
  rxscan189_scan:
    set_addr $I10, rxscan189_loop
    rx185_cur."!mark_push"(0, rx185_pos, $I10)
  rxscan189_done:
.annotate "line", 113
  # rx subrule "EXPR" subtype=capture negate=
    rx185_cur."!cursor_pos"(rx185_pos)
    $P10 = rx185_cur."EXPR"()
    unless $P10, rx185_fail
    rx185_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx185_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx185_cur."!cursor_pos"(rx185_pos)
    $P10 = rx185_cur."ws"()
    unless $P10, rx185_fail
    rx185_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx185_cur."!cursor_pos"(rx185_pos)
    $P10 = rx185_cur."pblock"()
    unless $P10, rx185_fail
    rx185_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx185_pos = $P10."pos"()
.annotate "line", 112
  # rx pass
    rx185_cur."!cursor_pass"(rx185_pos, "xblock")
    rx185_cur."!cursor_debug"("PASS  ", "xblock", " at pos=", rx185_pos)
    .return (rx185_cur)
  rx185_fail:
.annotate "line", 4
    (rx185_rep, rx185_pos, $I10, $P10) = rx185_cur."!mark_fail"(0)
    lt rx185_pos, -1, rx185_done
    eq rx185_pos, -1, rx185_fail
    jump $I10
  rx185_done:
    rx185_cur."!cursor_fail"()
    rx185_cur."!cursor_debug"("FAIL  ", "xblock")
    .return (rx185_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__xblock"  :subid("39_1271336396.90314") :method
.annotate "line", 4
    $P187 = self."!PREFIX__!subrule"("EXPR", "")
    new $P188, "ResizablePMCArray"
    push $P188, $P187
    .return ($P188)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx191_tgt
    .local int rx191_pos
    .local int rx191_off
    .local int rx191_eos
    .local int rx191_rep
    .local pmc rx191_cur
    (rx191_cur, rx191_pos, rx191_tgt) = self."!cursor_start"()
    rx191_cur."!cursor_debug"("START ", "pblock")
    .lex unicode:"$\x{a2}", rx191_cur
    .local pmc match
    .lex "$/", match
    length rx191_eos, rx191_tgt
    set rx191_off, 0
    lt rx191_pos, 2, rx191_start
    sub rx191_off, rx191_pos, 1
    substr rx191_tgt, rx191_tgt, rx191_off
  rx191_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan196_done
    goto rxscan196_scan
  rxscan196_loop:
    ($P10) = rx191_cur."from"()
    inc $P10
    set rx191_pos, $P10
    ge rx191_pos, rx191_eos, rxscan196_done
  rxscan196_scan:
    set_addr $I10, rxscan196_loop
    rx191_cur."!mark_push"(0, rx191_pos, $I10)
  rxscan196_done:
  alt197_0:
.annotate "line", 116
    set_addr $I10, alt197_1
    rx191_cur."!mark_push"(0, rx191_pos, $I10)
.annotate "line", 117
  # rx subrule "lambda" subtype=method negate=
    rx191_cur."!cursor_pos"(rx191_pos)
    $P10 = rx191_cur."lambda"()
    unless $P10, rx191_fail
    rx191_pos = $P10."pos"()
.annotate "line", 118
  # rx subrule "newpad" subtype=method negate=
    rx191_cur."!cursor_pos"(rx191_pos)
    $P10 = rx191_cur."newpad"()
    unless $P10, rx191_fail
    rx191_pos = $P10."pos"()
.annotate "line", 119
  # rx subrule "signature" subtype=capture negate=
    rx191_cur."!cursor_pos"(rx191_pos)
    $P10 = rx191_cur."signature"()
    unless $P10, rx191_fail
    rx191_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx191_pos = $P10."pos"()
.annotate "line", 120
  # rx subrule "blockoid" subtype=capture negate=
    rx191_cur."!cursor_pos"(rx191_pos)
    $P10 = rx191_cur."blockoid"()
    unless $P10, rx191_fail
    rx191_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx191_pos = $P10."pos"()
.annotate "line", 117
    goto alt197_end
  alt197_1:
    set_addr $I10, alt197_2
    rx191_cur."!mark_push"(0, rx191_pos, $I10)
.annotate "line", 121
  # rx enumcharlist negate=0 zerowidth
    ge rx191_pos, rx191_eos, rx191_fail
    sub $I10, rx191_pos, rx191_off
    substr $S10, rx191_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx191_fail
.annotate "line", 122
  # rx subrule "newpad" subtype=method negate=
    rx191_cur."!cursor_pos"(rx191_pos)
    $P10 = rx191_cur."newpad"()
    unless $P10, rx191_fail
    rx191_pos = $P10."pos"()
.annotate "line", 123
  # rx subrule "blockoid" subtype=capture negate=
    rx191_cur."!cursor_pos"(rx191_pos)
    $P10 = rx191_cur."blockoid"()
    unless $P10, rx191_fail
    rx191_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx191_pos = $P10."pos"()
.annotate "line", 121
    goto alt197_end
  alt197_2:
.annotate "line", 124
  # rx subrule "panic" subtype=method negate=
    rx191_cur."!cursor_pos"(rx191_pos)
    $P10 = rx191_cur."panic"("Missing block")
    unless $P10, rx191_fail
    rx191_pos = $P10."pos"()
  alt197_end:
.annotate "line", 116
  # rx pass
    rx191_cur."!cursor_pass"(rx191_pos, "pblock")
    rx191_cur."!cursor_debug"("PASS  ", "pblock", " at pos=", rx191_pos)
    .return (rx191_cur)
  rx191_fail:
.annotate "line", 4
    (rx191_rep, rx191_pos, $I10, $P10) = rx191_cur."!mark_fail"(0)
    lt rx191_pos, -1, rx191_done
    eq rx191_pos, -1, rx191_fail
    jump $I10
  rx191_done:
    rx191_cur."!cursor_fail"()
    rx191_cur."!cursor_debug"("FAIL  ", "pblock")
    .return (rx191_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pblock"  :subid("41_1271336396.90314") :method
.annotate "line", 4
    $P193 = self."!PREFIX__!subrule"("", "")
    $P194 = self."!PREFIX__!subrule"("", "")
    new $P195, "ResizablePMCArray"
    push $P195, $P193
    push $P195, "{"
    push $P195, $P194
    .return ($P195)
.end


.namespace ["NQP";"Grammar"]
.sub "lambda"  :subid("42_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx199_tgt
    .local int rx199_pos
    .local int rx199_off
    .local int rx199_eos
    .local int rx199_rep
    .local pmc rx199_cur
    (rx199_cur, rx199_pos, rx199_tgt) = self."!cursor_start"()
    rx199_cur."!cursor_debug"("START ", "lambda")
    .lex unicode:"$\x{a2}", rx199_cur
    .local pmc match
    .lex "$/", match
    length rx199_eos, rx199_tgt
    set rx199_off, 0
    lt rx199_pos, 2, rx199_start
    sub rx199_off, rx199_pos, 1
    substr rx199_tgt, rx199_tgt, rx199_off
  rx199_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan202_done
    goto rxscan202_scan
  rxscan202_loop:
    ($P10) = rx199_cur."from"()
    inc $P10
    set rx199_pos, $P10
    ge rx199_pos, rx199_eos, rxscan202_done
  rxscan202_scan:
    set_addr $I10, rxscan202_loop
    rx199_cur."!mark_push"(0, rx199_pos, $I10)
  rxscan202_done:
  alt203_0:
.annotate "line", 127
    set_addr $I10, alt203_1
    rx199_cur."!mark_push"(0, rx199_pos, $I10)
  # rx literal  "->"
    add $I11, rx199_pos, 2
    gt $I11, rx199_eos, rx199_fail
    sub $I11, rx199_pos, rx199_off
    substr $S10, rx199_tgt, $I11, 2
    ne $S10, "->", rx199_fail
    add rx199_pos, 2
    goto alt203_end
  alt203_1:
  # rx literal  "<->"
    add $I11, rx199_pos, 3
    gt $I11, rx199_eos, rx199_fail
    sub $I11, rx199_pos, rx199_off
    substr $S10, rx199_tgt, $I11, 3
    ne $S10, "<->", rx199_fail
    add rx199_pos, 3
  alt203_end:
  # rx pass
    rx199_cur."!cursor_pass"(rx199_pos, "lambda")
    rx199_cur."!cursor_debug"("PASS  ", "lambda", " at pos=", rx199_pos)
    .return (rx199_cur)
  rx199_fail:
.annotate "line", 4
    (rx199_rep, rx199_pos, $I10, $P10) = rx199_cur."!mark_fail"(0)
    lt rx199_pos, -1, rx199_done
    eq rx199_pos, -1, rx199_fail
    jump $I10
  rx199_done:
    rx199_cur."!cursor_fail"()
    rx199_cur."!cursor_debug"("FAIL  ", "lambda")
    .return (rx199_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__lambda"  :subid("43_1271336396.90314") :method
.annotate "line", 4
    new $P201, "ResizablePMCArray"
    push $P201, "<->"
    push $P201, "->"
    .return ($P201)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx205_tgt
    .local int rx205_pos
    .local int rx205_off
    .local int rx205_eos
    .local int rx205_rep
    .local pmc rx205_cur
    (rx205_cur, rx205_pos, rx205_tgt) = self."!cursor_start"()
    rx205_cur."!cursor_debug"("START ", "block")
    .lex unicode:"$\x{a2}", rx205_cur
    .local pmc match
    .lex "$/", match
    length rx205_eos, rx205_tgt
    set rx205_off, 0
    lt rx205_pos, 2, rx205_start
    sub rx205_off, rx205_pos, 1
    substr rx205_tgt, rx205_tgt, rx205_off
  rx205_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan209_done
    goto rxscan209_scan
  rxscan209_loop:
    ($P10) = rx205_cur."from"()
    inc $P10
    set rx205_pos, $P10
    ge rx205_pos, rx205_eos, rxscan209_done
  rxscan209_scan:
    set_addr $I10, rxscan209_loop
    rx205_cur."!mark_push"(0, rx205_pos, $I10)
  rxscan209_done:
  alt210_0:
.annotate "line", 130
    set_addr $I10, alt210_1
    rx205_cur."!mark_push"(0, rx205_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx205_pos, rx205_eos, rx205_fail
    sub $I10, rx205_pos, rx205_off
    substr $S10, rx205_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx205_fail
    goto alt210_end
  alt210_1:
  # rx subrule "panic" subtype=method negate=
    rx205_cur."!cursor_pos"(rx205_pos)
    $P10 = rx205_cur."panic"("Missing block")
    unless $P10, rx205_fail
    rx205_pos = $P10."pos"()
  alt210_end:
.annotate "line", 131
  # rx subrule "newpad" subtype=method negate=
    rx205_cur."!cursor_pos"(rx205_pos)
    $P10 = rx205_cur."newpad"()
    unless $P10, rx205_fail
    rx205_pos = $P10."pos"()
.annotate "line", 132
  # rx subrule "blockoid" subtype=capture negate=
    rx205_cur."!cursor_pos"(rx205_pos)
    $P10 = rx205_cur."blockoid"()
    unless $P10, rx205_fail
    rx205_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx205_pos = $P10."pos"()
.annotate "line", 129
  # rx pass
    rx205_cur."!cursor_pass"(rx205_pos, "block")
    rx205_cur."!cursor_debug"("PASS  ", "block", " at pos=", rx205_pos)
    .return (rx205_cur)
  rx205_fail:
.annotate "line", 4
    (rx205_rep, rx205_pos, $I10, $P10) = rx205_cur."!mark_fail"(0)
    lt rx205_pos, -1, rx205_done
    eq rx205_pos, -1, rx205_fail
    jump $I10
  rx205_done:
    rx205_cur."!cursor_fail"()
    rx205_cur."!cursor_debug"("FAIL  ", "block")
    .return (rx205_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__block"  :subid("45_1271336396.90314") :method
.annotate "line", 4
    $P207 = self."!PREFIX__!subrule"("", "")
    new $P208, "ResizablePMCArray"
    push $P208, $P207
    push $P208, "{"
    .return ($P208)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx212_tgt
    .local int rx212_pos
    .local int rx212_off
    .local int rx212_eos
    .local int rx212_rep
    .local pmc rx212_cur
    (rx212_cur, rx212_pos, rx212_tgt) = self."!cursor_start"()
    rx212_cur."!cursor_debug"("START ", "blockoid")
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
.annotate "line", 136
  # rx subrule "finishpad" subtype=method negate=
    rx212_cur."!cursor_pos"(rx212_pos)
    $P10 = rx212_cur."finishpad"()
    unless $P10, rx212_fail
    rx212_pos = $P10."pos"()
.annotate "line", 137
  # rx literal  "{"
    add $I11, rx212_pos, 1
    gt $I11, rx212_eos, rx212_fail
    sub $I11, rx212_pos, rx212_off
    substr $S10, rx212_tgt, $I11, 1
    ne $S10, "{", rx212_fail
    add rx212_pos, 1
  # rx subrule "statementlist" subtype=capture negate=
    rx212_cur."!cursor_pos"(rx212_pos)
    $P10 = rx212_cur."statementlist"()
    unless $P10, rx212_fail
    rx212_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx212_pos = $P10."pos"()
  alt217_0:
    set_addr $I10, alt217_1
    rx212_cur."!mark_push"(0, rx212_pos, $I10)
  # rx literal  "}"
    add $I11, rx212_pos, 1
    gt $I11, rx212_eos, rx212_fail
    sub $I11, rx212_pos, rx212_off
    substr $S10, rx212_tgt, $I11, 1
    ne $S10, "}", rx212_fail
    add rx212_pos, 1
    goto alt217_end
  alt217_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx212_cur."!cursor_pos"(rx212_pos)
    $P10 = rx212_cur."FAILGOAL"("'}'")
    unless $P10, rx212_fail
    rx212_pos = $P10."pos"()
  alt217_end:
.annotate "line", 138
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx212_cur."!cursor_pos"(rx212_pos)
    $P10 = rx212_cur."ENDSTMT"()
    unless $P10, rx212_fail
.annotate "line", 135
  # rx pass
    rx212_cur."!cursor_pass"(rx212_pos, "blockoid")
    rx212_cur."!cursor_debug"("PASS  ", "blockoid", " at pos=", rx212_pos)
    .return (rx212_cur)
  rx212_fail:
.annotate "line", 4
    (rx212_rep, rx212_pos, $I10, $P10) = rx212_cur."!mark_fail"(0)
    lt rx212_pos, -1, rx212_done
    eq rx212_pos, -1, rx212_fail
    jump $I10
  rx212_done:
    rx212_cur."!cursor_fail"()
    rx212_cur."!cursor_debug"("FAIL  ", "blockoid")
    .return (rx212_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blockoid"  :subid("47_1271336396.90314") :method
.annotate "line", 4
    $P214 = self."!PREFIX__!subrule"("", "")
    new $P215, "ResizablePMCArray"
    push $P215, $P214
    .return ($P215)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx220_tgt
    .local int rx220_pos
    .local int rx220_off
    .local int rx220_eos
    .local int rx220_rep
    .local pmc rx220_cur
    (rx220_cur, rx220_pos, rx220_tgt) = self."!cursor_start"()
    rx220_cur."!cursor_debug"("START ", "newpad")
    .lex unicode:"$\x{a2}", rx220_cur
    .local pmc match
    .lex "$/", match
    length rx220_eos, rx220_tgt
    set rx220_off, 0
    lt rx220_pos, 2, rx220_start
    sub rx220_off, rx220_pos, 1
    substr rx220_tgt, rx220_tgt, rx220_off
  rx220_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan223_done
    goto rxscan223_scan
  rxscan223_loop:
    ($P10) = rx220_cur."from"()
    inc $P10
    set rx220_pos, $P10
    ge rx220_pos, rx220_eos, rxscan223_done
  rxscan223_scan:
    set_addr $I10, rxscan223_loop
    rx220_cur."!mark_push"(0, rx220_pos, $I10)
  rxscan223_done:
.annotate "line", 141
  # rx pass
    rx220_cur."!cursor_pass"(rx220_pos, "newpad")
    rx220_cur."!cursor_debug"("PASS  ", "newpad", " at pos=", rx220_pos)
    .return (rx220_cur)
  rx220_fail:
.annotate "line", 4
    (rx220_rep, rx220_pos, $I10, $P10) = rx220_cur."!mark_fail"(0)
    lt rx220_pos, -1, rx220_done
    eq rx220_pos, -1, rx220_fail
    jump $I10
  rx220_done:
    rx220_cur."!cursor_fail"()
    rx220_cur."!cursor_debug"("FAIL  ", "newpad")
    .return (rx220_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__newpad"  :subid("49_1271336396.90314") :method
.annotate "line", 4
    new $P222, "ResizablePMCArray"
    push $P222, ""
    .return ($P222)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("50_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx225_tgt
    .local int rx225_pos
    .local int rx225_off
    .local int rx225_eos
    .local int rx225_rep
    .local pmc rx225_cur
    (rx225_cur, rx225_pos, rx225_tgt) = self."!cursor_start"()
    rx225_cur."!cursor_debug"("START ", "finishpad")
    .lex unicode:"$\x{a2}", rx225_cur
    .local pmc match
    .lex "$/", match
    length rx225_eos, rx225_tgt
    set rx225_off, 0
    lt rx225_pos, 2, rx225_start
    sub rx225_off, rx225_pos, 1
    substr rx225_tgt, rx225_tgt, rx225_off
  rx225_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan228_done
    goto rxscan228_scan
  rxscan228_loop:
    ($P10) = rx225_cur."from"()
    inc $P10
    set rx225_pos, $P10
    ge rx225_pos, rx225_eos, rxscan228_done
  rxscan228_scan:
    set_addr $I10, rxscan228_loop
    rx225_cur."!mark_push"(0, rx225_pos, $I10)
  rxscan228_done:
.annotate "line", 142
  # rx pass
    rx225_cur."!cursor_pass"(rx225_pos, "finishpad")
    rx225_cur."!cursor_debug"("PASS  ", "finishpad", " at pos=", rx225_pos)
    .return (rx225_cur)
  rx225_fail:
.annotate "line", 4
    (rx225_rep, rx225_pos, $I10, $P10) = rx225_cur."!mark_fail"(0)
    lt rx225_pos, -1, rx225_done
    eq rx225_pos, -1, rx225_fail
    jump $I10
  rx225_done:
    rx225_cur."!cursor_fail"()
    rx225_cur."!cursor_debug"("FAIL  ", "finishpad")
    .return (rx225_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__finishpad"  :subid("51_1271336396.90314") :method
.annotate "line", 4
    new $P227, "ResizablePMCArray"
    push $P227, ""
    .return ($P227)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("52_1271336396.90314") :method
.annotate "line", 144
    $P230 = self."!protoregex"("terminator")
    .return ($P230)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("53_1271336396.90314") :method
.annotate "line", 144
    $P232 = self."!PREFIX__!protoregex"("terminator")
    .return ($P232)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("54_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx234_tgt
    .local int rx234_pos
    .local int rx234_off
    .local int rx234_eos
    .local int rx234_rep
    .local pmc rx234_cur
    (rx234_cur, rx234_pos, rx234_tgt) = self."!cursor_start"()
    rx234_cur."!cursor_debug"("START ", "terminator:sym<;>")
    .lex unicode:"$\x{a2}", rx234_cur
    .local pmc match
    .lex "$/", match
    length rx234_eos, rx234_tgt
    set rx234_off, 0
    lt rx234_pos, 2, rx234_start
    sub rx234_off, rx234_pos, 1
    substr rx234_tgt, rx234_tgt, rx234_off
  rx234_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan237_done
    goto rxscan237_scan
  rxscan237_loop:
    ($P10) = rx234_cur."from"()
    inc $P10
    set rx234_pos, $P10
    ge rx234_pos, rx234_eos, rxscan237_done
  rxscan237_scan:
    set_addr $I10, rxscan237_loop
    rx234_cur."!mark_push"(0, rx234_pos, $I10)
  rxscan237_done:
.annotate "line", 146
  # rx enumcharlist negate=0 zerowidth
    ge rx234_pos, rx234_eos, rx234_fail
    sub $I10, rx234_pos, rx234_off
    substr $S10, rx234_tgt, $I10, 1
    index $I11, ";", $S10
    lt $I11, 0, rx234_fail
  # rx pass
    rx234_cur."!cursor_pass"(rx234_pos, "terminator:sym<;>")
    rx234_cur."!cursor_debug"("PASS  ", "terminator:sym<;>", " at pos=", rx234_pos)
    .return (rx234_cur)
  rx234_fail:
.annotate "line", 4
    (rx234_rep, rx234_pos, $I10, $P10) = rx234_cur."!mark_fail"(0)
    lt rx234_pos, -1, rx234_done
    eq rx234_pos, -1, rx234_fail
    jump $I10
  rx234_done:
    rx234_cur."!cursor_fail"()
    rx234_cur."!cursor_debug"("FAIL  ", "terminator:sym<;>")
    .return (rx234_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<;>"  :subid("55_1271336396.90314") :method
.annotate "line", 4
    new $P236, "ResizablePMCArray"
    push $P236, ";"
    .return ($P236)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("56_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx239_tgt
    .local int rx239_pos
    .local int rx239_off
    .local int rx239_eos
    .local int rx239_rep
    .local pmc rx239_cur
    (rx239_cur, rx239_pos, rx239_tgt) = self."!cursor_start"()
    rx239_cur."!cursor_debug"("START ", "terminator:sym<}>")
    .lex unicode:"$\x{a2}", rx239_cur
    .local pmc match
    .lex "$/", match
    length rx239_eos, rx239_tgt
    set rx239_off, 0
    lt rx239_pos, 2, rx239_start
    sub rx239_off, rx239_pos, 1
    substr rx239_tgt, rx239_tgt, rx239_off
  rx239_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan242_done
    goto rxscan242_scan
  rxscan242_loop:
    ($P10) = rx239_cur."from"()
    inc $P10
    set rx239_pos, $P10
    ge rx239_pos, rx239_eos, rxscan242_done
  rxscan242_scan:
    set_addr $I10, rxscan242_loop
    rx239_cur."!mark_push"(0, rx239_pos, $I10)
  rxscan242_done:
.annotate "line", 147
  # rx enumcharlist negate=0 zerowidth
    ge rx239_pos, rx239_eos, rx239_fail
    sub $I10, rx239_pos, rx239_off
    substr $S10, rx239_tgt, $I10, 1
    index $I11, "}", $S10
    lt $I11, 0, rx239_fail
  # rx pass
    rx239_cur."!cursor_pass"(rx239_pos, "terminator:sym<}>")
    rx239_cur."!cursor_debug"("PASS  ", "terminator:sym<}>", " at pos=", rx239_pos)
    .return (rx239_cur)
  rx239_fail:
.annotate "line", 4
    (rx239_rep, rx239_pos, $I10, $P10) = rx239_cur."!mark_fail"(0)
    lt rx239_pos, -1, rx239_done
    eq rx239_pos, -1, rx239_fail
    jump $I10
  rx239_done:
    rx239_cur."!cursor_fail"()
    rx239_cur."!cursor_debug"("FAIL  ", "terminator:sym<}>")
    .return (rx239_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<}>"  :subid("57_1271336396.90314") :method
.annotate "line", 4
    new $P241, "ResizablePMCArray"
    push $P241, "}"
    .return ($P241)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("58_1271336396.90314") :method
.annotate "line", 151
    $P244 = self."!protoregex"("statement_control")
    .return ($P244)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("59_1271336396.90314") :method
.annotate "line", 151
    $P246 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P246)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("60_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx248_tgt
    .local int rx248_pos
    .local int rx248_off
    .local int rx248_eos
    .local int rx248_rep
    .local pmc rx248_cur
    (rx248_cur, rx248_pos, rx248_tgt) = self."!cursor_start"()
    rx248_cur."!cursor_debug"("START ", "statement_control:sym<if>")
    rx248_cur."!cursor_caparray"("else", "xblock")
    .lex unicode:"$\x{a2}", rx248_cur
    .local pmc match
    .lex "$/", match
    length rx248_eos, rx248_tgt
    set rx248_off, 0
    lt rx248_pos, 2, rx248_start
    sub rx248_off, rx248_pos, 1
    substr rx248_tgt, rx248_tgt, rx248_off
  rx248_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan251_done
    goto rxscan251_scan
  rxscan251_loop:
    ($P10) = rx248_cur."from"()
    inc $P10
    set rx248_pos, $P10
    ge rx248_pos, rx248_eos, rxscan251_done
  rxscan251_scan:
    set_addr $I10, rxscan251_loop
    rx248_cur."!mark_push"(0, rx248_pos, $I10)
  rxscan251_done:
.annotate "line", 154
  # rx subcapture "sym"
    set_addr $I10, rxcap_252_fail
    rx248_cur."!mark_push"(0, rx248_pos, $I10)
  # rx literal  "if"
    add $I11, rx248_pos, 2
    gt $I11, rx248_eos, rx248_fail
    sub $I11, rx248_pos, rx248_off
    substr $S10, rx248_tgt, $I11, 2
    ne $S10, "if", rx248_fail
    add rx248_pos, 2
    set_addr $I10, rxcap_252_fail
    ($I12, $I11) = rx248_cur."!mark_peek"($I10)
    rx248_cur."!cursor_pos"($I11)
    ($P10) = rx248_cur."!cursor_start"()
    $P10."!cursor_pass"(rx248_pos, "")
    rx248_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_252_done
  rxcap_252_fail:
    goto rx248_fail
  rxcap_252_done:
  # rx charclass s
    ge rx248_pos, rx248_eos, rx248_fail
    sub $I10, rx248_pos, rx248_off
    is_cclass $I11, 32, rx248_tgt, $I10
    unless $I11, rx248_fail
    inc rx248_pos
  # rx subrule "ws" subtype=method negate=
    rx248_cur."!cursor_pos"(rx248_pos)
    $P10 = rx248_cur."ws"()
    unless $P10, rx248_fail
    rx248_pos = $P10."pos"()
.annotate "line", 155
  # rx subrule "xblock" subtype=capture negate=
    rx248_cur."!cursor_pos"(rx248_pos)
    $P10 = rx248_cur."xblock"()
    unless $P10, rx248_fail
    rx248_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx248_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx248_cur."!cursor_pos"(rx248_pos)
    $P10 = rx248_cur."ws"()
    unless $P10, rx248_fail
    rx248_pos = $P10."pos"()
.annotate "line", 156
  # rx rxquantr255 ** 0..*
    set_addr $I259, rxquantr255_done
    rx248_cur."!mark_push"(0, rx248_pos, $I259)
  rxquantr255_loop:
  # rx subrule "ws" subtype=method negate=
    rx248_cur."!cursor_pos"(rx248_pos)
    $P10 = rx248_cur."ws"()
    unless $P10, rx248_fail
    rx248_pos = $P10."pos"()
  # rx literal  "elsif"
    add $I11, rx248_pos, 5
    gt $I11, rx248_eos, rx248_fail
    sub $I11, rx248_pos, rx248_off
    substr $S10, rx248_tgt, $I11, 5
    ne $S10, "elsif", rx248_fail
    add rx248_pos, 5
  # rx charclass s
    ge rx248_pos, rx248_eos, rx248_fail
    sub $I10, rx248_pos, rx248_off
    is_cclass $I11, 32, rx248_tgt, $I10
    unless $I11, rx248_fail
    inc rx248_pos
  # rx subrule "ws" subtype=method negate=
    rx248_cur."!cursor_pos"(rx248_pos)
    $P10 = rx248_cur."ws"()
    unless $P10, rx248_fail
    rx248_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx248_cur."!cursor_pos"(rx248_pos)
    $P10 = rx248_cur."xblock"()
    unless $P10, rx248_fail
    rx248_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx248_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx248_cur."!cursor_pos"(rx248_pos)
    $P10 = rx248_cur."ws"()
    unless $P10, rx248_fail
    rx248_pos = $P10."pos"()
    (rx248_rep) = rx248_cur."!mark_commit"($I259)
    rx248_cur."!mark_push"(rx248_rep, rx248_pos, $I259)
    goto rxquantr255_loop
  rxquantr255_done:
  # rx subrule "ws" subtype=method negate=
    rx248_cur."!cursor_pos"(rx248_pos)
    $P10 = rx248_cur."ws"()
    unless $P10, rx248_fail
    rx248_pos = $P10."pos"()
.annotate "line", 157
  # rx rxquantr261 ** 0..1
    set_addr $I265, rxquantr261_done
    rx248_cur."!mark_push"(0, rx248_pos, $I265)
  rxquantr261_loop:
  # rx subrule "ws" subtype=method negate=
    rx248_cur."!cursor_pos"(rx248_pos)
    $P10 = rx248_cur."ws"()
    unless $P10, rx248_fail
    rx248_pos = $P10."pos"()
  # rx literal  "else"
    add $I11, rx248_pos, 4
    gt $I11, rx248_eos, rx248_fail
    sub $I11, rx248_pos, rx248_off
    substr $S10, rx248_tgt, $I11, 4
    ne $S10, "else", rx248_fail
    add rx248_pos, 4
  # rx charclass s
    ge rx248_pos, rx248_eos, rx248_fail
    sub $I10, rx248_pos, rx248_off
    is_cclass $I11, 32, rx248_tgt, $I10
    unless $I11, rx248_fail
    inc rx248_pos
  # rx subrule "ws" subtype=method negate=
    rx248_cur."!cursor_pos"(rx248_pos)
    $P10 = rx248_cur."ws"()
    unless $P10, rx248_fail
    rx248_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx248_cur."!cursor_pos"(rx248_pos)
    $P10 = rx248_cur."pblock"()
    unless $P10, rx248_fail
    rx248_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("else")
    rx248_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx248_cur."!cursor_pos"(rx248_pos)
    $P10 = rx248_cur."ws"()
    unless $P10, rx248_fail
    rx248_pos = $P10."pos"()
    (rx248_rep) = rx248_cur."!mark_commit"($I265)
  rxquantr261_done:
  # rx subrule "ws" subtype=method negate=
    rx248_cur."!cursor_pos"(rx248_pos)
    $P10 = rx248_cur."ws"()
    unless $P10, rx248_fail
    rx248_pos = $P10."pos"()
.annotate "line", 153
  # rx pass
    rx248_cur."!cursor_pass"(rx248_pos, "statement_control:sym<if>")
    rx248_cur."!cursor_debug"("PASS  ", "statement_control:sym<if>", " at pos=", rx248_pos)
    .return (rx248_cur)
  rx248_fail:
.annotate "line", 4
    (rx248_rep, rx248_pos, $I10, $P10) = rx248_cur."!mark_fail"(0)
    lt rx248_pos, -1, rx248_done
    eq rx248_pos, -1, rx248_fail
    jump $I10
  rx248_done:
    rx248_cur."!cursor_fail"()
    rx248_cur."!cursor_debug"("FAIL  ", "statement_control:sym<if>")
    .return (rx248_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<if>"  :subid("61_1271336396.90314") :method
.annotate "line", 4
    new $P250, "ResizablePMCArray"
    push $P250, "if"
    .return ($P250)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("62_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .const 'Sub' $P278 = "64_1271336396.90314" 
    capture_lex $P278
    .local string rx268_tgt
    .local int rx268_pos
    .local int rx268_off
    .local int rx268_eos
    .local int rx268_rep
    .local pmc rx268_cur
    (rx268_cur, rx268_pos, rx268_tgt) = self."!cursor_start"()
    rx268_cur."!cursor_debug"("START ", "statement_control:sym<unless>")
    .lex unicode:"$\x{a2}", rx268_cur
    .local pmc match
    .lex "$/", match
    length rx268_eos, rx268_tgt
    set rx268_off, 0
    lt rx268_pos, 2, rx268_start
    sub rx268_off, rx268_pos, 1
    substr rx268_tgt, rx268_tgt, rx268_off
  rx268_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan271_done
    goto rxscan271_scan
  rxscan271_loop:
    ($P10) = rx268_cur."from"()
    inc $P10
    set rx268_pos, $P10
    ge rx268_pos, rx268_eos, rxscan271_done
  rxscan271_scan:
    set_addr $I10, rxscan271_loop
    rx268_cur."!mark_push"(0, rx268_pos, $I10)
  rxscan271_done:
.annotate "line", 161
  # rx subcapture "sym"
    set_addr $I10, rxcap_272_fail
    rx268_cur."!mark_push"(0, rx268_pos, $I10)
  # rx literal  "unless"
    add $I11, rx268_pos, 6
    gt $I11, rx268_eos, rx268_fail
    sub $I11, rx268_pos, rx268_off
    substr $S10, rx268_tgt, $I11, 6
    ne $S10, "unless", rx268_fail
    add rx268_pos, 6
    set_addr $I10, rxcap_272_fail
    ($I12, $I11) = rx268_cur."!mark_peek"($I10)
    rx268_cur."!cursor_pos"($I11)
    ($P10) = rx268_cur."!cursor_start"()
    $P10."!cursor_pass"(rx268_pos, "")
    rx268_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_272_done
  rxcap_272_fail:
    goto rx268_fail
  rxcap_272_done:
  # rx charclass s
    ge rx268_pos, rx268_eos, rx268_fail
    sub $I10, rx268_pos, rx268_off
    is_cclass $I11, 32, rx268_tgt, $I10
    unless $I11, rx268_fail
    inc rx268_pos
  # rx subrule "ws" subtype=method negate=
    rx268_cur."!cursor_pos"(rx268_pos)
    $P10 = rx268_cur."ws"()
    unless $P10, rx268_fail
    rx268_pos = $P10."pos"()
.annotate "line", 162
  # rx subrule "xblock" subtype=capture negate=
    rx268_cur."!cursor_pos"(rx268_pos)
    $P10 = rx268_cur."xblock"()
    unless $P10, rx268_fail
    rx268_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx268_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx268_cur."!cursor_pos"(rx268_pos)
    $P10 = rx268_cur."ws"()
    unless $P10, rx268_fail
    rx268_pos = $P10."pos"()
  alt275_0:
.annotate "line", 163
    set_addr $I10, alt275_1
    rx268_cur."!mark_push"(0, rx268_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx268_cur."!cursor_pos"(rx268_pos)
    $P10 = rx268_cur."ws"()
    unless $P10, rx268_fail
    rx268_pos = $P10."pos"()
  # rx subrule "before" subtype=zerowidth negate=1
    rx268_cur."!cursor_pos"(rx268_pos)
    .const 'Sub' $P278 = "64_1271336396.90314" 
    capture_lex $P278
    $P10 = rx268_cur."before"($P278)
    if $P10, rx268_fail
  # rx subrule "ws" subtype=method negate=
    rx268_cur."!cursor_pos"(rx268_pos)
    $P10 = rx268_cur."ws"()
    unless $P10, rx268_fail
    rx268_pos = $P10."pos"()
    goto alt275_end
  alt275_1:
  # rx subrule "ws" subtype=method negate=
    rx268_cur."!cursor_pos"(rx268_pos)
    $P10 = rx268_cur."ws"()
    unless $P10, rx268_fail
    rx268_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx268_cur."!cursor_pos"(rx268_pos)
    $P10 = rx268_cur."panic"("unless does not take \"else\", please rewrite using \"if\"")
    unless $P10, rx268_fail
    rx268_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx268_cur."!cursor_pos"(rx268_pos)
    $P10 = rx268_cur."ws"()
    unless $P10, rx268_fail
    rx268_pos = $P10."pos"()
  alt275_end:
  # rx subrule "ws" subtype=method negate=
    rx268_cur."!cursor_pos"(rx268_pos)
    $P10 = rx268_cur."ws"()
    unless $P10, rx268_fail
    rx268_pos = $P10."pos"()
.annotate "line", 160
  # rx pass
    rx268_cur."!cursor_pass"(rx268_pos, "statement_control:sym<unless>")
    rx268_cur."!cursor_debug"("PASS  ", "statement_control:sym<unless>", " at pos=", rx268_pos)
    .return (rx268_cur)
  rx268_fail:
.annotate "line", 4
    (rx268_rep, rx268_pos, $I10, $P10) = rx268_cur."!mark_fail"(0)
    lt rx268_pos, -1, rx268_done
    eq rx268_pos, -1, rx268_fail
    jump $I10
  rx268_done:
    rx268_cur."!cursor_fail"()
    rx268_cur."!cursor_debug"("FAIL  ", "statement_control:sym<unless>")
    .return (rx268_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<unless>"  :subid("63_1271336396.90314") :method
.annotate "line", 4
    new $P270, "ResizablePMCArray"
    push $P270, "unless"
    .return ($P270)
.end


.namespace ["NQP";"Grammar"]
.sub "_block277"  :anon :subid("64_1271336396.90314") :method :outer("62_1271336396.90314")
.annotate "line", 163
    .local string rx279_tgt
    .local int rx279_pos
    .local int rx279_off
    .local int rx279_eos
    .local int rx279_rep
    .local pmc rx279_cur
    (rx279_cur, rx279_pos, rx279_tgt) = self."!cursor_start"()
    rx279_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx279_cur
    .local pmc match
    .lex "$/", match
    length rx279_eos, rx279_tgt
    set rx279_off, 0
    lt rx279_pos, 2, rx279_start
    sub rx279_off, rx279_pos, 1
    substr rx279_tgt, rx279_tgt, rx279_off
  rx279_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan280_done
    goto rxscan280_scan
  rxscan280_loop:
    ($P10) = rx279_cur."from"()
    inc $P10
    set rx279_pos, $P10
    ge rx279_pos, rx279_eos, rxscan280_done
  rxscan280_scan:
    set_addr $I10, rxscan280_loop
    rx279_cur."!mark_push"(0, rx279_pos, $I10)
  rxscan280_done:
  # rx literal  "else"
    add $I11, rx279_pos, 4
    gt $I11, rx279_eos, rx279_fail
    sub $I11, rx279_pos, rx279_off
    substr $S10, rx279_tgt, $I11, 4
    ne $S10, "else", rx279_fail
    add rx279_pos, 4
  # rx pass
    rx279_cur."!cursor_pass"(rx279_pos, "")
    rx279_cur."!cursor_debug"("PASS  ", "", " at pos=", rx279_pos)
    .return (rx279_cur)
  rx279_fail:
    (rx279_rep, rx279_pos, $I10, $P10) = rx279_cur."!mark_fail"(0)
    lt rx279_pos, -1, rx279_done
    eq rx279_pos, -1, rx279_fail
    jump $I10
  rx279_done:
    rx279_cur."!cursor_fail"()
    rx279_cur."!cursor_debug"("FAIL  ", "")
    .return (rx279_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<while>"  :subid("65_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx286_tgt
    .local int rx286_pos
    .local int rx286_off
    .local int rx286_eos
    .local int rx286_rep
    .local pmc rx286_cur
    (rx286_cur, rx286_pos, rx286_tgt) = self."!cursor_start"()
    rx286_cur."!cursor_debug"("START ", "statement_control:sym<while>")
    .lex unicode:"$\x{a2}", rx286_cur
    .local pmc match
    .lex "$/", match
    length rx286_eos, rx286_tgt
    set rx286_off, 0
    lt rx286_pos, 2, rx286_start
    sub rx286_off, rx286_pos, 1
    substr rx286_tgt, rx286_tgt, rx286_off
  rx286_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan289_done
    goto rxscan289_scan
  rxscan289_loop:
    ($P10) = rx286_cur."from"()
    inc $P10
    set rx286_pos, $P10
    ge rx286_pos, rx286_eos, rxscan289_done
  rxscan289_scan:
    set_addr $I10, rxscan289_loop
    rx286_cur."!mark_push"(0, rx286_pos, $I10)
  rxscan289_done:
.annotate "line", 167
  # rx subcapture "sym"
    set_addr $I10, rxcap_291_fail
    rx286_cur."!mark_push"(0, rx286_pos, $I10)
  alt290_0:
    set_addr $I10, alt290_1
    rx286_cur."!mark_push"(0, rx286_pos, $I10)
  # rx literal  "while"
    add $I11, rx286_pos, 5
    gt $I11, rx286_eos, rx286_fail
    sub $I11, rx286_pos, rx286_off
    substr $S10, rx286_tgt, $I11, 5
    ne $S10, "while", rx286_fail
    add rx286_pos, 5
    goto alt290_end
  alt290_1:
  # rx literal  "until"
    add $I11, rx286_pos, 5
    gt $I11, rx286_eos, rx286_fail
    sub $I11, rx286_pos, rx286_off
    substr $S10, rx286_tgt, $I11, 5
    ne $S10, "until", rx286_fail
    add rx286_pos, 5
  alt290_end:
    set_addr $I10, rxcap_291_fail
    ($I12, $I11) = rx286_cur."!mark_peek"($I10)
    rx286_cur."!cursor_pos"($I11)
    ($P10) = rx286_cur."!cursor_start"()
    $P10."!cursor_pass"(rx286_pos, "")
    rx286_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_291_done
  rxcap_291_fail:
    goto rx286_fail
  rxcap_291_done:
  # rx charclass s
    ge rx286_pos, rx286_eos, rx286_fail
    sub $I10, rx286_pos, rx286_off
    is_cclass $I11, 32, rx286_tgt, $I10
    unless $I11, rx286_fail
    inc rx286_pos
  # rx subrule "ws" subtype=method negate=
    rx286_cur."!cursor_pos"(rx286_pos)
    $P10 = rx286_cur."ws"()
    unless $P10, rx286_fail
    rx286_pos = $P10."pos"()
.annotate "line", 168
  # rx subrule "xblock" subtype=capture negate=
    rx286_cur."!cursor_pos"(rx286_pos)
    $P10 = rx286_cur."xblock"()
    unless $P10, rx286_fail
    rx286_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx286_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx286_cur."!cursor_pos"(rx286_pos)
    $P10 = rx286_cur."ws"()
    unless $P10, rx286_fail
    rx286_pos = $P10."pos"()
.annotate "line", 166
  # rx pass
    rx286_cur."!cursor_pass"(rx286_pos, "statement_control:sym<while>")
    rx286_cur."!cursor_debug"("PASS  ", "statement_control:sym<while>", " at pos=", rx286_pos)
    .return (rx286_cur)
  rx286_fail:
.annotate "line", 4
    (rx286_rep, rx286_pos, $I10, $P10) = rx286_cur."!mark_fail"(0)
    lt rx286_pos, -1, rx286_done
    eq rx286_pos, -1, rx286_fail
    jump $I10
  rx286_done:
    rx286_cur."!cursor_fail"()
    rx286_cur."!cursor_debug"("FAIL  ", "statement_control:sym<while>")
    .return (rx286_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<while>"  :subid("66_1271336396.90314") :method
.annotate "line", 4
    new $P288, "ResizablePMCArray"
    push $P288, "until"
    push $P288, "while"
    .return ($P288)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("67_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx295_tgt
    .local int rx295_pos
    .local int rx295_off
    .local int rx295_eos
    .local int rx295_rep
    .local pmc rx295_cur
    (rx295_cur, rx295_pos, rx295_tgt) = self."!cursor_start"()
    rx295_cur."!cursor_debug"("START ", "statement_control:sym<repeat>")
    .lex unicode:"$\x{a2}", rx295_cur
    .local pmc match
    .lex "$/", match
    length rx295_eos, rx295_tgt
    set rx295_off, 0
    lt rx295_pos, 2, rx295_start
    sub rx295_off, rx295_pos, 1
    substr rx295_tgt, rx295_tgt, rx295_off
  rx295_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan298_done
    goto rxscan298_scan
  rxscan298_loop:
    ($P10) = rx295_cur."from"()
    inc $P10
    set rx295_pos, $P10
    ge rx295_pos, rx295_eos, rxscan298_done
  rxscan298_scan:
    set_addr $I10, rxscan298_loop
    rx295_cur."!mark_push"(0, rx295_pos, $I10)
  rxscan298_done:
.annotate "line", 172
  # rx subcapture "sym"
    set_addr $I10, rxcap_299_fail
    rx295_cur."!mark_push"(0, rx295_pos, $I10)
  # rx literal  "repeat"
    add $I11, rx295_pos, 6
    gt $I11, rx295_eos, rx295_fail
    sub $I11, rx295_pos, rx295_off
    substr $S10, rx295_tgt, $I11, 6
    ne $S10, "repeat", rx295_fail
    add rx295_pos, 6
    set_addr $I10, rxcap_299_fail
    ($I12, $I11) = rx295_cur."!mark_peek"($I10)
    rx295_cur."!cursor_pos"($I11)
    ($P10) = rx295_cur."!cursor_start"()
    $P10."!cursor_pass"(rx295_pos, "")
    rx295_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_299_done
  rxcap_299_fail:
    goto rx295_fail
  rxcap_299_done:
  # rx charclass s
    ge rx295_pos, rx295_eos, rx295_fail
    sub $I10, rx295_pos, rx295_off
    is_cclass $I11, 32, rx295_tgt, $I10
    unless $I11, rx295_fail
    inc rx295_pos
  # rx subrule "ws" subtype=method negate=
    rx295_cur."!cursor_pos"(rx295_pos)
    $P10 = rx295_cur."ws"()
    unless $P10, rx295_fail
    rx295_pos = $P10."pos"()
  alt301_0:
.annotate "line", 173
    set_addr $I10, alt301_1
    rx295_cur."!mark_push"(0, rx295_pos, $I10)
.annotate "line", 174
  # rx subrule "ws" subtype=method negate=
    rx295_cur."!cursor_pos"(rx295_pos)
    $P10 = rx295_cur."ws"()
    unless $P10, rx295_fail
    rx295_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_304_fail
    rx295_cur."!mark_push"(0, rx295_pos, $I10)
  alt303_0:
    set_addr $I10, alt303_1
    rx295_cur."!mark_push"(0, rx295_pos, $I10)
  # rx literal  "while"
    add $I11, rx295_pos, 5
    gt $I11, rx295_eos, rx295_fail
    sub $I11, rx295_pos, rx295_off
    substr $S10, rx295_tgt, $I11, 5
    ne $S10, "while", rx295_fail
    add rx295_pos, 5
    goto alt303_end
  alt303_1:
  # rx literal  "until"
    add $I11, rx295_pos, 5
    gt $I11, rx295_eos, rx295_fail
    sub $I11, rx295_pos, rx295_off
    substr $S10, rx295_tgt, $I11, 5
    ne $S10, "until", rx295_fail
    add rx295_pos, 5
  alt303_end:
    set_addr $I10, rxcap_304_fail
    ($I12, $I11) = rx295_cur."!mark_peek"($I10)
    rx295_cur."!cursor_pos"($I11)
    ($P10) = rx295_cur."!cursor_start"()
    $P10."!cursor_pass"(rx295_pos, "")
    rx295_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_304_done
  rxcap_304_fail:
    goto rx295_fail
  rxcap_304_done:
  # rx charclass s
    ge rx295_pos, rx295_eos, rx295_fail
    sub $I10, rx295_pos, rx295_off
    is_cclass $I11, 32, rx295_tgt, $I10
    unless $I11, rx295_fail
    inc rx295_pos
  # rx subrule "ws" subtype=method negate=
    rx295_cur."!cursor_pos"(rx295_pos)
    $P10 = rx295_cur."ws"()
    unless $P10, rx295_fail
    rx295_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx295_cur."!cursor_pos"(rx295_pos)
    $P10 = rx295_cur."xblock"()
    unless $P10, rx295_fail
    rx295_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx295_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx295_cur."!cursor_pos"(rx295_pos)
    $P10 = rx295_cur."ws"()
    unless $P10, rx295_fail
    rx295_pos = $P10."pos"()
    goto alt301_end
  alt301_1:
.annotate "line", 175
  # rx subrule "ws" subtype=method negate=
    rx295_cur."!cursor_pos"(rx295_pos)
    $P10 = rx295_cur."ws"()
    unless $P10, rx295_fail
    rx295_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx295_cur."!cursor_pos"(rx295_pos)
    $P10 = rx295_cur."pblock"()
    unless $P10, rx295_fail
    rx295_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx295_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx295_cur."!cursor_pos"(rx295_pos)
    $P10 = rx295_cur."ws"()
    unless $P10, rx295_fail
    rx295_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_310_fail
    rx295_cur."!mark_push"(0, rx295_pos, $I10)
  alt309_0:
    set_addr $I10, alt309_1
    rx295_cur."!mark_push"(0, rx295_pos, $I10)
  # rx literal  "while"
    add $I11, rx295_pos, 5
    gt $I11, rx295_eos, rx295_fail
    sub $I11, rx295_pos, rx295_off
    substr $S10, rx295_tgt, $I11, 5
    ne $S10, "while", rx295_fail
    add rx295_pos, 5
    goto alt309_end
  alt309_1:
  # rx literal  "until"
    add $I11, rx295_pos, 5
    gt $I11, rx295_eos, rx295_fail
    sub $I11, rx295_pos, rx295_off
    substr $S10, rx295_tgt, $I11, 5
    ne $S10, "until", rx295_fail
    add rx295_pos, 5
  alt309_end:
    set_addr $I10, rxcap_310_fail
    ($I12, $I11) = rx295_cur."!mark_peek"($I10)
    rx295_cur."!cursor_pos"($I11)
    ($P10) = rx295_cur."!cursor_start"()
    $P10."!cursor_pass"(rx295_pos, "")
    rx295_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_310_done
  rxcap_310_fail:
    goto rx295_fail
  rxcap_310_done:
  # rx charclass s
    ge rx295_pos, rx295_eos, rx295_fail
    sub $I10, rx295_pos, rx295_off
    is_cclass $I11, 32, rx295_tgt, $I10
    unless $I11, rx295_fail
    inc rx295_pos
  # rx subrule "ws" subtype=method negate=
    rx295_cur."!cursor_pos"(rx295_pos)
    $P10 = rx295_cur."ws"()
    unless $P10, rx295_fail
    rx295_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx295_cur."!cursor_pos"(rx295_pos)
    $P10 = rx295_cur."EXPR"()
    unless $P10, rx295_fail
    rx295_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx295_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx295_cur."!cursor_pos"(rx295_pos)
    $P10 = rx295_cur."ws"()
    unless $P10, rx295_fail
    rx295_pos = $P10."pos"()
  alt301_end:
.annotate "line", 176
  # rx subrule "ws" subtype=method negate=
    rx295_cur."!cursor_pos"(rx295_pos)
    $P10 = rx295_cur."ws"()
    unless $P10, rx295_fail
    rx295_pos = $P10."pos"()
.annotate "line", 171
  # rx pass
    rx295_cur."!cursor_pass"(rx295_pos, "statement_control:sym<repeat>")
    rx295_cur."!cursor_debug"("PASS  ", "statement_control:sym<repeat>", " at pos=", rx295_pos)
    .return (rx295_cur)
  rx295_fail:
.annotate "line", 4
    (rx295_rep, rx295_pos, $I10, $P10) = rx295_cur."!mark_fail"(0)
    lt rx295_pos, -1, rx295_done
    eq rx295_pos, -1, rx295_fail
    jump $I10
  rx295_done:
    rx295_cur."!cursor_fail"()
    rx295_cur."!cursor_debug"("FAIL  ", "statement_control:sym<repeat>")
    .return (rx295_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("68_1271336396.90314") :method
.annotate "line", 4
    new $P297, "ResizablePMCArray"
    push $P297, "repeat"
    .return ($P297)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("69_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx315_tgt
    .local int rx315_pos
    .local int rx315_off
    .local int rx315_eos
    .local int rx315_rep
    .local pmc rx315_cur
    (rx315_cur, rx315_pos, rx315_tgt) = self."!cursor_start"()
    rx315_cur."!cursor_debug"("START ", "statement_control:sym<for>")
    .lex unicode:"$\x{a2}", rx315_cur
    .local pmc match
    .lex "$/", match
    length rx315_eos, rx315_tgt
    set rx315_off, 0
    lt rx315_pos, 2, rx315_start
    sub rx315_off, rx315_pos, 1
    substr rx315_tgt, rx315_tgt, rx315_off
  rx315_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan318_done
    goto rxscan318_scan
  rxscan318_loop:
    ($P10) = rx315_cur."from"()
    inc $P10
    set rx315_pos, $P10
    ge rx315_pos, rx315_eos, rxscan318_done
  rxscan318_scan:
    set_addr $I10, rxscan318_loop
    rx315_cur."!mark_push"(0, rx315_pos, $I10)
  rxscan318_done:
.annotate "line", 180
  # rx subcapture "sym"
    set_addr $I10, rxcap_319_fail
    rx315_cur."!mark_push"(0, rx315_pos, $I10)
  # rx literal  "for"
    add $I11, rx315_pos, 3
    gt $I11, rx315_eos, rx315_fail
    sub $I11, rx315_pos, rx315_off
    substr $S10, rx315_tgt, $I11, 3
    ne $S10, "for", rx315_fail
    add rx315_pos, 3
    set_addr $I10, rxcap_319_fail
    ($I12, $I11) = rx315_cur."!mark_peek"($I10)
    rx315_cur."!cursor_pos"($I11)
    ($P10) = rx315_cur."!cursor_start"()
    $P10."!cursor_pass"(rx315_pos, "")
    rx315_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_319_done
  rxcap_319_fail:
    goto rx315_fail
  rxcap_319_done:
  # rx charclass s
    ge rx315_pos, rx315_eos, rx315_fail
    sub $I10, rx315_pos, rx315_off
    is_cclass $I11, 32, rx315_tgt, $I10
    unless $I11, rx315_fail
    inc rx315_pos
  # rx subrule "ws" subtype=method negate=
    rx315_cur."!cursor_pos"(rx315_pos)
    $P10 = rx315_cur."ws"()
    unless $P10, rx315_fail
    rx315_pos = $P10."pos"()
.annotate "line", 181
  # rx subrule "xblock" subtype=capture negate=
    rx315_cur."!cursor_pos"(rx315_pos)
    $P10 = rx315_cur."xblock"()
    unless $P10, rx315_fail
    rx315_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx315_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx315_cur."!cursor_pos"(rx315_pos)
    $P10 = rx315_cur."ws"()
    unless $P10, rx315_fail
    rx315_pos = $P10."pos"()
.annotate "line", 179
  # rx pass
    rx315_cur."!cursor_pass"(rx315_pos, "statement_control:sym<for>")
    rx315_cur."!cursor_debug"("PASS  ", "statement_control:sym<for>", " at pos=", rx315_pos)
    .return (rx315_cur)
  rx315_fail:
.annotate "line", 4
    (rx315_rep, rx315_pos, $I10, $P10) = rx315_cur."!mark_fail"(0)
    lt rx315_pos, -1, rx315_done
    eq rx315_pos, -1, rx315_fail
    jump $I10
  rx315_done:
    rx315_cur."!cursor_fail"()
    rx315_cur."!cursor_debug"("FAIL  ", "statement_control:sym<for>")
    .return (rx315_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<for>"  :subid("70_1271336396.90314") :method
.annotate "line", 4
    new $P317, "ResizablePMCArray"
    push $P317, "for"
    .return ($P317)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CATCH>"  :subid("71_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx323_tgt
    .local int rx323_pos
    .local int rx323_off
    .local int rx323_eos
    .local int rx323_rep
    .local pmc rx323_cur
    (rx323_cur, rx323_pos, rx323_tgt) = self."!cursor_start"()
    rx323_cur."!cursor_debug"("START ", "statement_control:sym<CATCH>")
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
.annotate "line", 185
  # rx subcapture "sym"
    set_addr $I10, rxcap_327_fail
    rx323_cur."!mark_push"(0, rx323_pos, $I10)
  # rx literal  "CATCH"
    add $I11, rx323_pos, 5
    gt $I11, rx323_eos, rx323_fail
    sub $I11, rx323_pos, rx323_off
    substr $S10, rx323_tgt, $I11, 5
    ne $S10, "CATCH", rx323_fail
    add rx323_pos, 5
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
.annotate "line", 186
  # rx subrule "block" subtype=capture negate=
    rx323_cur."!cursor_pos"(rx323_pos)
    $P10 = rx323_cur."block"()
    unless $P10, rx323_fail
    rx323_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx323_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx323_cur."!cursor_pos"(rx323_pos)
    $P10 = rx323_cur."ws"()
    unless $P10, rx323_fail
    rx323_pos = $P10."pos"()
.annotate "line", 184
  # rx pass
    rx323_cur."!cursor_pass"(rx323_pos, "statement_control:sym<CATCH>")
    rx323_cur."!cursor_debug"("PASS  ", "statement_control:sym<CATCH>", " at pos=", rx323_pos)
    .return (rx323_cur)
  rx323_fail:
.annotate "line", 4
    (rx323_rep, rx323_pos, $I10, $P10) = rx323_cur."!mark_fail"(0)
    lt rx323_pos, -1, rx323_done
    eq rx323_pos, -1, rx323_fail
    jump $I10
  rx323_done:
    rx323_cur."!cursor_fail"()
    rx323_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CATCH>")
    .return (rx323_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CATCH>"  :subid("72_1271336396.90314") :method
.annotate "line", 4
    new $P325, "ResizablePMCArray"
    push $P325, "CATCH"
    .return ($P325)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CONTROL>"  :subid("73_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx331_tgt
    .local int rx331_pos
    .local int rx331_off
    .local int rx331_eos
    .local int rx331_rep
    .local pmc rx331_cur
    (rx331_cur, rx331_pos, rx331_tgt) = self."!cursor_start"()
    rx331_cur."!cursor_debug"("START ", "statement_control:sym<CONTROL>")
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
    ne $I10, -1, rxscan334_done
    goto rxscan334_scan
  rxscan334_loop:
    ($P10) = rx331_cur."from"()
    inc $P10
    set rx331_pos, $P10
    ge rx331_pos, rx331_eos, rxscan334_done
  rxscan334_scan:
    set_addr $I10, rxscan334_loop
    rx331_cur."!mark_push"(0, rx331_pos, $I10)
  rxscan334_done:
.annotate "line", 190
  # rx subcapture "sym"
    set_addr $I10, rxcap_335_fail
    rx331_cur."!mark_push"(0, rx331_pos, $I10)
  # rx literal  "CONTROL"
    add $I11, rx331_pos, 7
    gt $I11, rx331_eos, rx331_fail
    sub $I11, rx331_pos, rx331_off
    substr $S10, rx331_tgt, $I11, 7
    ne $S10, "CONTROL", rx331_fail
    add rx331_pos, 7
    set_addr $I10, rxcap_335_fail
    ($I12, $I11) = rx331_cur."!mark_peek"($I10)
    rx331_cur."!cursor_pos"($I11)
    ($P10) = rx331_cur."!cursor_start"()
    $P10."!cursor_pass"(rx331_pos, "")
    rx331_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_335_done
  rxcap_335_fail:
    goto rx331_fail
  rxcap_335_done:
  # rx charclass s
    ge rx331_pos, rx331_eos, rx331_fail
    sub $I10, rx331_pos, rx331_off
    is_cclass $I11, 32, rx331_tgt, $I10
    unless $I11, rx331_fail
    inc rx331_pos
  # rx subrule "ws" subtype=method negate=
    rx331_cur."!cursor_pos"(rx331_pos)
    $P10 = rx331_cur."ws"()
    unless $P10, rx331_fail
    rx331_pos = $P10."pos"()
.annotate "line", 191
  # rx subrule "block" subtype=capture negate=
    rx331_cur."!cursor_pos"(rx331_pos)
    $P10 = rx331_cur."block"()
    unless $P10, rx331_fail
    rx331_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx331_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx331_cur."!cursor_pos"(rx331_pos)
    $P10 = rx331_cur."ws"()
    unless $P10, rx331_fail
    rx331_pos = $P10."pos"()
.annotate "line", 189
  # rx pass
    rx331_cur."!cursor_pass"(rx331_pos, "statement_control:sym<CONTROL>")
    rx331_cur."!cursor_debug"("PASS  ", "statement_control:sym<CONTROL>", " at pos=", rx331_pos)
    .return (rx331_cur)
  rx331_fail:
.annotate "line", 4
    (rx331_rep, rx331_pos, $I10, $P10) = rx331_cur."!mark_fail"(0)
    lt rx331_pos, -1, rx331_done
    eq rx331_pos, -1, rx331_fail
    jump $I10
  rx331_done:
    rx331_cur."!cursor_fail"()
    rx331_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CONTROL>")
    .return (rx331_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CONTROL>"  :subid("74_1271336396.90314") :method
.annotate "line", 4
    new $P333, "ResizablePMCArray"
    push $P333, "CONTROL"
    .return ($P333)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("75_1271336396.90314") :method
.annotate "line", 194
    $P339 = self."!protoregex"("statement_prefix")
    .return ($P339)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("76_1271336396.90314") :method
.annotate "line", 194
    $P341 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P341)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("77_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx343_tgt
    .local int rx343_pos
    .local int rx343_off
    .local int rx343_eos
    .local int rx343_rep
    .local pmc rx343_cur
    (rx343_cur, rx343_pos, rx343_tgt) = self."!cursor_start"()
    rx343_cur."!cursor_debug"("START ", "statement_prefix:sym<INIT>")
    .lex unicode:"$\x{a2}", rx343_cur
    .local pmc match
    .lex "$/", match
    length rx343_eos, rx343_tgt
    set rx343_off, 0
    lt rx343_pos, 2, rx343_start
    sub rx343_off, rx343_pos, 1
    substr rx343_tgt, rx343_tgt, rx343_off
  rx343_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan347_done
    goto rxscan347_scan
  rxscan347_loop:
    ($P10) = rx343_cur."from"()
    inc $P10
    set rx343_pos, $P10
    ge rx343_pos, rx343_eos, rxscan347_done
  rxscan347_scan:
    set_addr $I10, rxscan347_loop
    rx343_cur."!mark_push"(0, rx343_pos, $I10)
  rxscan347_done:
.annotate "line", 195
  # rx subcapture "sym"
    set_addr $I10, rxcap_348_fail
    rx343_cur."!mark_push"(0, rx343_pos, $I10)
  # rx literal  "INIT"
    add $I11, rx343_pos, 4
    gt $I11, rx343_eos, rx343_fail
    sub $I11, rx343_pos, rx343_off
    substr $S10, rx343_tgt, $I11, 4
    ne $S10, "INIT", rx343_fail
    add rx343_pos, 4
    set_addr $I10, rxcap_348_fail
    ($I12, $I11) = rx343_cur."!mark_peek"($I10)
    rx343_cur."!cursor_pos"($I11)
    ($P10) = rx343_cur."!cursor_start"()
    $P10."!cursor_pass"(rx343_pos, "")
    rx343_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_348_done
  rxcap_348_fail:
    goto rx343_fail
  rxcap_348_done:
  # rx subrule "blorst" subtype=capture negate=
    rx343_cur."!cursor_pos"(rx343_pos)
    $P10 = rx343_cur."blorst"()
    unless $P10, rx343_fail
    rx343_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx343_pos = $P10."pos"()
  # rx pass
    rx343_cur."!cursor_pass"(rx343_pos, "statement_prefix:sym<INIT>")
    rx343_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<INIT>", " at pos=", rx343_pos)
    .return (rx343_cur)
  rx343_fail:
.annotate "line", 4
    (rx343_rep, rx343_pos, $I10, $P10) = rx343_cur."!mark_fail"(0)
    lt rx343_pos, -1, rx343_done
    eq rx343_pos, -1, rx343_fail
    jump $I10
  rx343_done:
    rx343_cur."!cursor_fail"()
    rx343_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<INIT>")
    .return (rx343_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("78_1271336396.90314") :method
.annotate "line", 4
    $P345 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P346, "ResizablePMCArray"
    push $P346, $P345
    .return ($P346)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<try>"  :subid("79_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx350_tgt
    .local int rx350_pos
    .local int rx350_off
    .local int rx350_eos
    .local int rx350_rep
    .local pmc rx350_cur
    (rx350_cur, rx350_pos, rx350_tgt) = self."!cursor_start"()
    rx350_cur."!cursor_debug"("START ", "statement_prefix:sym<try>")
    .lex unicode:"$\x{a2}", rx350_cur
    .local pmc match
    .lex "$/", match
    length rx350_eos, rx350_tgt
    set rx350_off, 0
    lt rx350_pos, 2, rx350_start
    sub rx350_off, rx350_pos, 1
    substr rx350_tgt, rx350_tgt, rx350_off
  rx350_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan354_done
    goto rxscan354_scan
  rxscan354_loop:
    ($P10) = rx350_cur."from"()
    inc $P10
    set rx350_pos, $P10
    ge rx350_pos, rx350_eos, rxscan354_done
  rxscan354_scan:
    set_addr $I10, rxscan354_loop
    rx350_cur."!mark_push"(0, rx350_pos, $I10)
  rxscan354_done:
.annotate "line", 198
  # rx subcapture "sym"
    set_addr $I10, rxcap_355_fail
    rx350_cur."!mark_push"(0, rx350_pos, $I10)
  # rx literal  "try"
    add $I11, rx350_pos, 3
    gt $I11, rx350_eos, rx350_fail
    sub $I11, rx350_pos, rx350_off
    substr $S10, rx350_tgt, $I11, 3
    ne $S10, "try", rx350_fail
    add rx350_pos, 3
    set_addr $I10, rxcap_355_fail
    ($I12, $I11) = rx350_cur."!mark_peek"($I10)
    rx350_cur."!cursor_pos"($I11)
    ($P10) = rx350_cur."!cursor_start"()
    $P10."!cursor_pass"(rx350_pos, "")
    rx350_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_355_done
  rxcap_355_fail:
    goto rx350_fail
  rxcap_355_done:
.annotate "line", 199
  # rx subrule "blorst" subtype=capture negate=
    rx350_cur."!cursor_pos"(rx350_pos)
    $P10 = rx350_cur."blorst"()
    unless $P10, rx350_fail
    rx350_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx350_pos = $P10."pos"()
.annotate "line", 197
  # rx pass
    rx350_cur."!cursor_pass"(rx350_pos, "statement_prefix:sym<try>")
    rx350_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<try>", " at pos=", rx350_pos)
    .return (rx350_cur)
  rx350_fail:
.annotate "line", 4
    (rx350_rep, rx350_pos, $I10, $P10) = rx350_cur."!mark_fail"(0)
    lt rx350_pos, -1, rx350_done
    eq rx350_pos, -1, rx350_fail
    jump $I10
  rx350_done:
    rx350_cur."!cursor_fail"()
    rx350_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<try>")
    .return (rx350_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<try>"  :subid("80_1271336396.90314") :method
.annotate "line", 4
    $P352 = self."!PREFIX__!subrule"("blorst", "try")
    new $P353, "ResizablePMCArray"
    push $P353, $P352
    .return ($P353)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("81_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx357_tgt
    .local int rx357_pos
    .local int rx357_off
    .local int rx357_eos
    .local int rx357_rep
    .local pmc rx357_cur
    (rx357_cur, rx357_pos, rx357_tgt) = self."!cursor_start"()
    rx357_cur."!cursor_debug"("START ", "blorst")
    .lex unicode:"$\x{a2}", rx357_cur
    .local pmc match
    .lex "$/", match
    length rx357_eos, rx357_tgt
    set rx357_off, 0
    lt rx357_pos, 2, rx357_start
    sub rx357_off, rx357_pos, 1
    substr rx357_tgt, rx357_tgt, rx357_off
  rx357_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan360_done
    goto rxscan360_scan
  rxscan360_loop:
    ($P10) = rx357_cur."from"()
    inc $P10
    set rx357_pos, $P10
    ge rx357_pos, rx357_eos, rxscan360_done
  rxscan360_scan:
    set_addr $I10, rxscan360_loop
    rx357_cur."!mark_push"(0, rx357_pos, $I10)
  rxscan360_done:
.annotate "line", 203
  # rx charclass s
    ge rx357_pos, rx357_eos, rx357_fail
    sub $I10, rx357_pos, rx357_off
    is_cclass $I11, 32, rx357_tgt, $I10
    unless $I11, rx357_fail
    inc rx357_pos
  # rx subrule "ws" subtype=method negate=
    rx357_cur."!cursor_pos"(rx357_pos)
    $P10 = rx357_cur."ws"()
    unless $P10, rx357_fail
    rx357_pos = $P10."pos"()
  alt361_0:
    set_addr $I10, alt361_1
    rx357_cur."!mark_push"(0, rx357_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx357_pos, rx357_eos, rx357_fail
    sub $I10, rx357_pos, rx357_off
    substr $S10, rx357_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx357_fail
  # rx subrule "block" subtype=capture negate=
    rx357_cur."!cursor_pos"(rx357_pos)
    $P10 = rx357_cur."block"()
    unless $P10, rx357_fail
    rx357_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx357_pos = $P10."pos"()
    goto alt361_end
  alt361_1:
  # rx subrule "statement" subtype=capture negate=
    rx357_cur."!cursor_pos"(rx357_pos)
    $P10 = rx357_cur."statement"()
    unless $P10, rx357_fail
    rx357_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx357_pos = $P10."pos"()
  alt361_end:
.annotate "line", 202
  # rx pass
    rx357_cur."!cursor_pass"(rx357_pos, "blorst")
    rx357_cur."!cursor_debug"("PASS  ", "blorst", " at pos=", rx357_pos)
    .return (rx357_cur)
  rx357_fail:
.annotate "line", 4
    (rx357_rep, rx357_pos, $I10, $P10) = rx357_cur."!mark_fail"(0)
    lt rx357_pos, -1, rx357_done
    eq rx357_pos, -1, rx357_fail
    jump $I10
  rx357_done:
    rx357_cur."!cursor_fail"()
    rx357_cur."!cursor_debug"("FAIL  ", "blorst")
    .return (rx357_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blorst"  :subid("82_1271336396.90314") :method
.annotate "line", 4
    new $P359, "ResizablePMCArray"
    push $P359, ""
    .return ($P359)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("83_1271336396.90314") :method
.annotate "line", 208
    $P363 = self."!protoregex"("statement_mod_cond")
    .return ($P363)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("84_1271336396.90314") :method
.annotate "line", 208
    $P365 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P365)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("85_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx367_tgt
    .local int rx367_pos
    .local int rx367_off
    .local int rx367_eos
    .local int rx367_rep
    .local pmc rx367_cur
    (rx367_cur, rx367_pos, rx367_tgt) = self."!cursor_start"()
    rx367_cur."!cursor_debug"("START ", "statement_mod_cond:sym<if>")
    .lex unicode:"$\x{a2}", rx367_cur
    .local pmc match
    .lex "$/", match
    length rx367_eos, rx367_tgt
    set rx367_off, 0
    lt rx367_pos, 2, rx367_start
    sub rx367_off, rx367_pos, 1
    substr rx367_tgt, rx367_tgt, rx367_off
  rx367_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan370_done
    goto rxscan370_scan
  rxscan370_loop:
    ($P10) = rx367_cur."from"()
    inc $P10
    set rx367_pos, $P10
    ge rx367_pos, rx367_eos, rxscan370_done
  rxscan370_scan:
    set_addr $I10, rxscan370_loop
    rx367_cur."!mark_push"(0, rx367_pos, $I10)
  rxscan370_done:
.annotate "line", 210
  # rx subcapture "sym"
    set_addr $I10, rxcap_371_fail
    rx367_cur."!mark_push"(0, rx367_pos, $I10)
  # rx literal  "if"
    add $I11, rx367_pos, 2
    gt $I11, rx367_eos, rx367_fail
    sub $I11, rx367_pos, rx367_off
    substr $S10, rx367_tgt, $I11, 2
    ne $S10, "if", rx367_fail
    add rx367_pos, 2
    set_addr $I10, rxcap_371_fail
    ($I12, $I11) = rx367_cur."!mark_peek"($I10)
    rx367_cur."!cursor_pos"($I11)
    ($P10) = rx367_cur."!cursor_start"()
    $P10."!cursor_pass"(rx367_pos, "")
    rx367_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_371_done
  rxcap_371_fail:
    goto rx367_fail
  rxcap_371_done:
  # rx subrule "ws" subtype=method negate=
    rx367_cur."!cursor_pos"(rx367_pos)
    $P10 = rx367_cur."ws"()
    unless $P10, rx367_fail
    rx367_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx367_cur."!cursor_pos"(rx367_pos)
    $P10 = rx367_cur."EXPR"()
    unless $P10, rx367_fail
    rx367_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx367_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx367_cur."!cursor_pos"(rx367_pos)
    $P10 = rx367_cur."ws"()
    unless $P10, rx367_fail
    rx367_pos = $P10."pos"()
  # rx pass
    rx367_cur."!cursor_pass"(rx367_pos, "statement_mod_cond:sym<if>")
    rx367_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<if>", " at pos=", rx367_pos)
    .return (rx367_cur)
  rx367_fail:
.annotate "line", 4
    (rx367_rep, rx367_pos, $I10, $P10) = rx367_cur."!mark_fail"(0)
    lt rx367_pos, -1, rx367_done
    eq rx367_pos, -1, rx367_fail
    jump $I10
  rx367_done:
    rx367_cur."!cursor_fail"()
    rx367_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<if>")
    .return (rx367_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("86_1271336396.90314") :method
.annotate "line", 4
    new $P369, "ResizablePMCArray"
    push $P369, "if"
    .return ($P369)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("87_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx375_tgt
    .local int rx375_pos
    .local int rx375_off
    .local int rx375_eos
    .local int rx375_rep
    .local pmc rx375_cur
    (rx375_cur, rx375_pos, rx375_tgt) = self."!cursor_start"()
    rx375_cur."!cursor_debug"("START ", "statement_mod_cond:sym<unless>")
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
.annotate "line", 211
  # rx subcapture "sym"
    set_addr $I10, rxcap_379_fail
    rx375_cur."!mark_push"(0, rx375_pos, $I10)
  # rx literal  "unless"
    add $I11, rx375_pos, 6
    gt $I11, rx375_eos, rx375_fail
    sub $I11, rx375_pos, rx375_off
    substr $S10, rx375_tgt, $I11, 6
    ne $S10, "unless", rx375_fail
    add rx375_pos, 6
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
    rx375_cur."!cursor_pass"(rx375_pos, "statement_mod_cond:sym<unless>")
    rx375_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<unless>", " at pos=", rx375_pos)
    .return (rx375_cur)
  rx375_fail:
.annotate "line", 4
    (rx375_rep, rx375_pos, $I10, $P10) = rx375_cur."!mark_fail"(0)
    lt rx375_pos, -1, rx375_done
    eq rx375_pos, -1, rx375_fail
    jump $I10
  rx375_done:
    rx375_cur."!cursor_fail"()
    rx375_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<unless>")
    .return (rx375_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("88_1271336396.90314") :method
.annotate "line", 4
    new $P377, "ResizablePMCArray"
    push $P377, "unless"
    .return ($P377)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("89_1271336396.90314") :method
.annotate "line", 213
    $P383 = self."!protoregex"("statement_mod_loop")
    .return ($P383)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("90_1271336396.90314") :method
.annotate "line", 213
    $P385 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P385)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("91_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx387_tgt
    .local int rx387_pos
    .local int rx387_off
    .local int rx387_eos
    .local int rx387_rep
    .local pmc rx387_cur
    (rx387_cur, rx387_pos, rx387_tgt) = self."!cursor_start"()
    rx387_cur."!cursor_debug"("START ", "statement_mod_loop:sym<while>")
    .lex unicode:"$\x{a2}", rx387_cur
    .local pmc match
    .lex "$/", match
    length rx387_eos, rx387_tgt
    set rx387_off, 0
    lt rx387_pos, 2, rx387_start
    sub rx387_off, rx387_pos, 1
    substr rx387_tgt, rx387_tgt, rx387_off
  rx387_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan390_done
    goto rxscan390_scan
  rxscan390_loop:
    ($P10) = rx387_cur."from"()
    inc $P10
    set rx387_pos, $P10
    ge rx387_pos, rx387_eos, rxscan390_done
  rxscan390_scan:
    set_addr $I10, rxscan390_loop
    rx387_cur."!mark_push"(0, rx387_pos, $I10)
  rxscan390_done:
.annotate "line", 215
  # rx subcapture "sym"
    set_addr $I10, rxcap_391_fail
    rx387_cur."!mark_push"(0, rx387_pos, $I10)
  # rx literal  "while"
    add $I11, rx387_pos, 5
    gt $I11, rx387_eos, rx387_fail
    sub $I11, rx387_pos, rx387_off
    substr $S10, rx387_tgt, $I11, 5
    ne $S10, "while", rx387_fail
    add rx387_pos, 5
    set_addr $I10, rxcap_391_fail
    ($I12, $I11) = rx387_cur."!mark_peek"($I10)
    rx387_cur."!cursor_pos"($I11)
    ($P10) = rx387_cur."!cursor_start"()
    $P10."!cursor_pass"(rx387_pos, "")
    rx387_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_391_done
  rxcap_391_fail:
    goto rx387_fail
  rxcap_391_done:
  # rx subrule "ws" subtype=method negate=
    rx387_cur."!cursor_pos"(rx387_pos)
    $P10 = rx387_cur."ws"()
    unless $P10, rx387_fail
    rx387_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx387_cur."!cursor_pos"(rx387_pos)
    $P10 = rx387_cur."EXPR"()
    unless $P10, rx387_fail
    rx387_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx387_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx387_cur."!cursor_pos"(rx387_pos)
    $P10 = rx387_cur."ws"()
    unless $P10, rx387_fail
    rx387_pos = $P10."pos"()
  # rx pass
    rx387_cur."!cursor_pass"(rx387_pos, "statement_mod_loop:sym<while>")
    rx387_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<while>", " at pos=", rx387_pos)
    .return (rx387_cur)
  rx387_fail:
.annotate "line", 4
    (rx387_rep, rx387_pos, $I10, $P10) = rx387_cur."!mark_fail"(0)
    lt rx387_pos, -1, rx387_done
    eq rx387_pos, -1, rx387_fail
    jump $I10
  rx387_done:
    rx387_cur."!cursor_fail"()
    rx387_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<while>")
    .return (rx387_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("92_1271336396.90314") :method
.annotate "line", 4
    new $P389, "ResizablePMCArray"
    push $P389, "while"
    .return ($P389)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("93_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx395_tgt
    .local int rx395_pos
    .local int rx395_off
    .local int rx395_eos
    .local int rx395_rep
    .local pmc rx395_cur
    (rx395_cur, rx395_pos, rx395_tgt) = self."!cursor_start"()
    rx395_cur."!cursor_debug"("START ", "statement_mod_loop:sym<until>")
    .lex unicode:"$\x{a2}", rx395_cur
    .local pmc match
    .lex "$/", match
    length rx395_eos, rx395_tgt
    set rx395_off, 0
    lt rx395_pos, 2, rx395_start
    sub rx395_off, rx395_pos, 1
    substr rx395_tgt, rx395_tgt, rx395_off
  rx395_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan398_done
    goto rxscan398_scan
  rxscan398_loop:
    ($P10) = rx395_cur."from"()
    inc $P10
    set rx395_pos, $P10
    ge rx395_pos, rx395_eos, rxscan398_done
  rxscan398_scan:
    set_addr $I10, rxscan398_loop
    rx395_cur."!mark_push"(0, rx395_pos, $I10)
  rxscan398_done:
.annotate "line", 216
  # rx subcapture "sym"
    set_addr $I10, rxcap_399_fail
    rx395_cur."!mark_push"(0, rx395_pos, $I10)
  # rx literal  "until"
    add $I11, rx395_pos, 5
    gt $I11, rx395_eos, rx395_fail
    sub $I11, rx395_pos, rx395_off
    substr $S10, rx395_tgt, $I11, 5
    ne $S10, "until", rx395_fail
    add rx395_pos, 5
    set_addr $I10, rxcap_399_fail
    ($I12, $I11) = rx395_cur."!mark_peek"($I10)
    rx395_cur."!cursor_pos"($I11)
    ($P10) = rx395_cur."!cursor_start"()
    $P10."!cursor_pass"(rx395_pos, "")
    rx395_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_399_done
  rxcap_399_fail:
    goto rx395_fail
  rxcap_399_done:
  # rx subrule "ws" subtype=method negate=
    rx395_cur."!cursor_pos"(rx395_pos)
    $P10 = rx395_cur."ws"()
    unless $P10, rx395_fail
    rx395_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx395_cur."!cursor_pos"(rx395_pos)
    $P10 = rx395_cur."EXPR"()
    unless $P10, rx395_fail
    rx395_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx395_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx395_cur."!cursor_pos"(rx395_pos)
    $P10 = rx395_cur."ws"()
    unless $P10, rx395_fail
    rx395_pos = $P10."pos"()
  # rx pass
    rx395_cur."!cursor_pass"(rx395_pos, "statement_mod_loop:sym<until>")
    rx395_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<until>", " at pos=", rx395_pos)
    .return (rx395_cur)
  rx395_fail:
.annotate "line", 4
    (rx395_rep, rx395_pos, $I10, $P10) = rx395_cur."!mark_fail"(0)
    lt rx395_pos, -1, rx395_done
    eq rx395_pos, -1, rx395_fail
    jump $I10
  rx395_done:
    rx395_cur."!cursor_fail"()
    rx395_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<until>")
    .return (rx395_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("94_1271336396.90314") :method
.annotate "line", 4
    new $P397, "ResizablePMCArray"
    push $P397, "until"
    .return ($P397)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<fatarrow>"  :subid("95_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx403_tgt
    .local int rx403_pos
    .local int rx403_off
    .local int rx403_eos
    .local int rx403_rep
    .local pmc rx403_cur
    (rx403_cur, rx403_pos, rx403_tgt) = self."!cursor_start"()
    rx403_cur."!cursor_debug"("START ", "term:sym<fatarrow>")
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
.annotate "line", 220
  # rx subrule "fatarrow" subtype=capture negate=
    rx403_cur."!cursor_pos"(rx403_pos)
    $P10 = rx403_cur."fatarrow"()
    unless $P10, rx403_fail
    rx403_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("fatarrow")
    rx403_pos = $P10."pos"()
  # rx pass
    rx403_cur."!cursor_pass"(rx403_pos, "term:sym<fatarrow>")
    rx403_cur."!cursor_debug"("PASS  ", "term:sym<fatarrow>", " at pos=", rx403_pos)
    .return (rx403_cur)
  rx403_fail:
.annotate "line", 4
    (rx403_rep, rx403_pos, $I10, $P10) = rx403_cur."!mark_fail"(0)
    lt rx403_pos, -1, rx403_done
    eq rx403_pos, -1, rx403_fail
    jump $I10
  rx403_done:
    rx403_cur."!cursor_fail"()
    rx403_cur."!cursor_debug"("FAIL  ", "term:sym<fatarrow>")
    .return (rx403_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<fatarrow>"  :subid("96_1271336396.90314") :method
.annotate "line", 4
    $P405 = self."!PREFIX__!subrule"("fatarrow", "")
    new $P406, "ResizablePMCArray"
    push $P406, $P405
    .return ($P406)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("97_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx409_tgt
    .local int rx409_pos
    .local int rx409_off
    .local int rx409_eos
    .local int rx409_rep
    .local pmc rx409_cur
    (rx409_cur, rx409_pos, rx409_tgt) = self."!cursor_start"()
    rx409_cur."!cursor_debug"("START ", "term:sym<colonpair>")
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
.annotate "line", 221
  # rx subrule "colonpair" subtype=capture negate=
    rx409_cur."!cursor_pos"(rx409_pos)
    $P10 = rx409_cur."colonpair"()
    unless $P10, rx409_fail
    rx409_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx409_pos = $P10."pos"()
  # rx pass
    rx409_cur."!cursor_pass"(rx409_pos, "term:sym<colonpair>")
    rx409_cur."!cursor_debug"("PASS  ", "term:sym<colonpair>", " at pos=", rx409_pos)
    .return (rx409_cur)
  rx409_fail:
.annotate "line", 4
    (rx409_rep, rx409_pos, $I10, $P10) = rx409_cur."!mark_fail"(0)
    lt rx409_pos, -1, rx409_done
    eq rx409_pos, -1, rx409_fail
    jump $I10
  rx409_done:
    rx409_cur."!cursor_fail"()
    rx409_cur."!cursor_debug"("FAIL  ", "term:sym<colonpair>")
    .return (rx409_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("98_1271336396.90314") :method
.annotate "line", 4
    $P411 = self."!PREFIX__!subrule"("colonpair", "")
    new $P412, "ResizablePMCArray"
    push $P412, $P411
    .return ($P412)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("99_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx415_tgt
    .local int rx415_pos
    .local int rx415_off
    .local int rx415_eos
    .local int rx415_rep
    .local pmc rx415_cur
    (rx415_cur, rx415_pos, rx415_tgt) = self."!cursor_start"()
    rx415_cur."!cursor_debug"("START ", "term:sym<variable>")
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
.annotate "line", 222
  # rx subrule "variable" subtype=capture negate=
    rx415_cur."!cursor_pos"(rx415_pos)
    $P10 = rx415_cur."variable"()
    unless $P10, rx415_fail
    rx415_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx415_pos = $P10."pos"()
  # rx pass
    rx415_cur."!cursor_pass"(rx415_pos, "term:sym<variable>")
    rx415_cur."!cursor_debug"("PASS  ", "term:sym<variable>", " at pos=", rx415_pos)
    .return (rx415_cur)
  rx415_fail:
.annotate "line", 4
    (rx415_rep, rx415_pos, $I10, $P10) = rx415_cur."!mark_fail"(0)
    lt rx415_pos, -1, rx415_done
    eq rx415_pos, -1, rx415_fail
    jump $I10
  rx415_done:
    rx415_cur."!cursor_fail"()
    rx415_cur."!cursor_debug"("FAIL  ", "term:sym<variable>")
    .return (rx415_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("100_1271336396.90314") :method
.annotate "line", 4
    $P417 = self."!PREFIX__!subrule"("variable", "")
    new $P418, "ResizablePMCArray"
    push $P418, $P417
    .return ($P418)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("101_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx421_tgt
    .local int rx421_pos
    .local int rx421_off
    .local int rx421_eos
    .local int rx421_rep
    .local pmc rx421_cur
    (rx421_cur, rx421_pos, rx421_tgt) = self."!cursor_start"()
    rx421_cur."!cursor_debug"("START ", "term:sym<package_declarator>")
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
.annotate "line", 223
  # rx subrule "package_declarator" subtype=capture negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."package_declarator"()
    unless $P10, rx421_fail
    rx421_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx421_pos = $P10."pos"()
  # rx pass
    rx421_cur."!cursor_pass"(rx421_pos, "term:sym<package_declarator>")
    rx421_cur."!cursor_debug"("PASS  ", "term:sym<package_declarator>", " at pos=", rx421_pos)
    .return (rx421_cur)
  rx421_fail:
.annotate "line", 4
    (rx421_rep, rx421_pos, $I10, $P10) = rx421_cur."!mark_fail"(0)
    lt rx421_pos, -1, rx421_done
    eq rx421_pos, -1, rx421_fail
    jump $I10
  rx421_done:
    rx421_cur."!cursor_fail"()
    rx421_cur."!cursor_debug"("FAIL  ", "term:sym<package_declarator>")
    .return (rx421_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("102_1271336396.90314") :method
.annotate "line", 4
    $P423 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P424, "ResizablePMCArray"
    push $P424, $P423
    .return ($P424)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("103_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx427_tgt
    .local int rx427_pos
    .local int rx427_off
    .local int rx427_eos
    .local int rx427_rep
    .local pmc rx427_cur
    (rx427_cur, rx427_pos, rx427_tgt) = self."!cursor_start"()
    rx427_cur."!cursor_debug"("START ", "term:sym<scope_declarator>")
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
.annotate "line", 224
  # rx subrule "scope_declarator" subtype=capture negate=
    rx427_cur."!cursor_pos"(rx427_pos)
    $P10 = rx427_cur."scope_declarator"()
    unless $P10, rx427_fail
    rx427_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx427_pos = $P10."pos"()
  # rx pass
    rx427_cur."!cursor_pass"(rx427_pos, "term:sym<scope_declarator>")
    rx427_cur."!cursor_debug"("PASS  ", "term:sym<scope_declarator>", " at pos=", rx427_pos)
    .return (rx427_cur)
  rx427_fail:
.annotate "line", 4
    (rx427_rep, rx427_pos, $I10, $P10) = rx427_cur."!mark_fail"(0)
    lt rx427_pos, -1, rx427_done
    eq rx427_pos, -1, rx427_fail
    jump $I10
  rx427_done:
    rx427_cur."!cursor_fail"()
    rx427_cur."!cursor_debug"("FAIL  ", "term:sym<scope_declarator>")
    .return (rx427_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("104_1271336396.90314") :method
.annotate "line", 4
    $P429 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P430, "ResizablePMCArray"
    push $P430, $P429
    .return ($P430)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("105_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx433_tgt
    .local int rx433_pos
    .local int rx433_off
    .local int rx433_eos
    .local int rx433_rep
    .local pmc rx433_cur
    (rx433_cur, rx433_pos, rx433_tgt) = self."!cursor_start"()
    rx433_cur."!cursor_debug"("START ", "term:sym<routine_declarator>")
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
    ne $I10, -1, rxscan437_done
    goto rxscan437_scan
  rxscan437_loop:
    ($P10) = rx433_cur."from"()
    inc $P10
    set rx433_pos, $P10
    ge rx433_pos, rx433_eos, rxscan437_done
  rxscan437_scan:
    set_addr $I10, rxscan437_loop
    rx433_cur."!mark_push"(0, rx433_pos, $I10)
  rxscan437_done:
.annotate "line", 225
  # rx subrule "routine_declarator" subtype=capture negate=
    rx433_cur."!cursor_pos"(rx433_pos)
    $P10 = rx433_cur."routine_declarator"()
    unless $P10, rx433_fail
    rx433_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx433_pos = $P10."pos"()
  # rx pass
    rx433_cur."!cursor_pass"(rx433_pos, "term:sym<routine_declarator>")
    rx433_cur."!cursor_debug"("PASS  ", "term:sym<routine_declarator>", " at pos=", rx433_pos)
    .return (rx433_cur)
  rx433_fail:
.annotate "line", 4
    (rx433_rep, rx433_pos, $I10, $P10) = rx433_cur."!mark_fail"(0)
    lt rx433_pos, -1, rx433_done
    eq rx433_pos, -1, rx433_fail
    jump $I10
  rx433_done:
    rx433_cur."!cursor_fail"()
    rx433_cur."!cursor_debug"("FAIL  ", "term:sym<routine_declarator>")
    .return (rx433_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("106_1271336396.90314") :method
.annotate "line", 4
    $P435 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P436, "ResizablePMCArray"
    push $P436, $P435
    .return ($P436)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("107_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx439_tgt
    .local int rx439_pos
    .local int rx439_off
    .local int rx439_eos
    .local int rx439_rep
    .local pmc rx439_cur
    (rx439_cur, rx439_pos, rx439_tgt) = self."!cursor_start"()
    rx439_cur."!cursor_debug"("START ", "term:sym<regex_declarator>")
    .lex unicode:"$\x{a2}", rx439_cur
    .local pmc match
    .lex "$/", match
    length rx439_eos, rx439_tgt
    set rx439_off, 0
    lt rx439_pos, 2, rx439_start
    sub rx439_off, rx439_pos, 1
    substr rx439_tgt, rx439_tgt, rx439_off
  rx439_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan443_done
    goto rxscan443_scan
  rxscan443_loop:
    ($P10) = rx439_cur."from"()
    inc $P10
    set rx439_pos, $P10
    ge rx439_pos, rx439_eos, rxscan443_done
  rxscan443_scan:
    set_addr $I10, rxscan443_loop
    rx439_cur."!mark_push"(0, rx439_pos, $I10)
  rxscan443_done:
.annotate "line", 226
  # rx subrule "regex_declarator" subtype=capture negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."regex_declarator"()
    unless $P10, rx439_fail
    rx439_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx439_pos = $P10."pos"()
  # rx pass
    rx439_cur."!cursor_pass"(rx439_pos, "term:sym<regex_declarator>")
    rx439_cur."!cursor_debug"("PASS  ", "term:sym<regex_declarator>", " at pos=", rx439_pos)
    .return (rx439_cur)
  rx439_fail:
.annotate "line", 4
    (rx439_rep, rx439_pos, $I10, $P10) = rx439_cur."!mark_fail"(0)
    lt rx439_pos, -1, rx439_done
    eq rx439_pos, -1, rx439_fail
    jump $I10
  rx439_done:
    rx439_cur."!cursor_fail"()
    rx439_cur."!cursor_debug"("FAIL  ", "term:sym<regex_declarator>")
    .return (rx439_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("108_1271336396.90314") :method
.annotate "line", 4
    $P441 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P442, "ResizablePMCArray"
    push $P442, $P441
    .return ($P442)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("109_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx445_tgt
    .local int rx445_pos
    .local int rx445_off
    .local int rx445_eos
    .local int rx445_rep
    .local pmc rx445_cur
    (rx445_cur, rx445_pos, rx445_tgt) = self."!cursor_start"()
    rx445_cur."!cursor_debug"("START ", "term:sym<statement_prefix>")
    .lex unicode:"$\x{a2}", rx445_cur
    .local pmc match
    .lex "$/", match
    length rx445_eos, rx445_tgt
    set rx445_off, 0
    lt rx445_pos, 2, rx445_start
    sub rx445_off, rx445_pos, 1
    substr rx445_tgt, rx445_tgt, rx445_off
  rx445_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan449_done
    goto rxscan449_scan
  rxscan449_loop:
    ($P10) = rx445_cur."from"()
    inc $P10
    set rx445_pos, $P10
    ge rx445_pos, rx445_eos, rxscan449_done
  rxscan449_scan:
    set_addr $I10, rxscan449_loop
    rx445_cur."!mark_push"(0, rx445_pos, $I10)
  rxscan449_done:
.annotate "line", 227
  # rx subrule "statement_prefix" subtype=capture negate=
    rx445_cur."!cursor_pos"(rx445_pos)
    $P10 = rx445_cur."statement_prefix"()
    unless $P10, rx445_fail
    rx445_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx445_pos = $P10."pos"()
  # rx pass
    rx445_cur."!cursor_pass"(rx445_pos, "term:sym<statement_prefix>")
    rx445_cur."!cursor_debug"("PASS  ", "term:sym<statement_prefix>", " at pos=", rx445_pos)
    .return (rx445_cur)
  rx445_fail:
.annotate "line", 4
    (rx445_rep, rx445_pos, $I10, $P10) = rx445_cur."!mark_fail"(0)
    lt rx445_pos, -1, rx445_done
    eq rx445_pos, -1, rx445_fail
    jump $I10
  rx445_done:
    rx445_cur."!cursor_fail"()
    rx445_cur."!cursor_debug"("FAIL  ", "term:sym<statement_prefix>")
    .return (rx445_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("110_1271336396.90314") :method
.annotate "line", 4
    $P447 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P448, "ResizablePMCArray"
    push $P448, $P447
    .return ($P448)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("111_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx451_tgt
    .local int rx451_pos
    .local int rx451_off
    .local int rx451_eos
    .local int rx451_rep
    .local pmc rx451_cur
    (rx451_cur, rx451_pos, rx451_tgt) = self."!cursor_start"()
    rx451_cur."!cursor_debug"("START ", "term:sym<lambda>")
    .lex unicode:"$\x{a2}", rx451_cur
    .local pmc match
    .lex "$/", match
    length rx451_eos, rx451_tgt
    set rx451_off, 0
    lt rx451_pos, 2, rx451_start
    sub rx451_off, rx451_pos, 1
    substr rx451_tgt, rx451_tgt, rx451_off
  rx451_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan454_done
    goto rxscan454_scan
  rxscan454_loop:
    ($P10) = rx451_cur."from"()
    inc $P10
    set rx451_pos, $P10
    ge rx451_pos, rx451_eos, rxscan454_done
  rxscan454_scan:
    set_addr $I10, rxscan454_loop
    rx451_cur."!mark_push"(0, rx451_pos, $I10)
  rxscan454_done:
.annotate "line", 228
  # rx subrule "lambda" subtype=zerowidth negate=
    rx451_cur."!cursor_pos"(rx451_pos)
    $P10 = rx451_cur."lambda"()
    unless $P10, rx451_fail
  # rx subrule "pblock" subtype=capture negate=
    rx451_cur."!cursor_pos"(rx451_pos)
    $P10 = rx451_cur."pblock"()
    unless $P10, rx451_fail
    rx451_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx451_pos = $P10."pos"()
  # rx pass
    rx451_cur."!cursor_pass"(rx451_pos, "term:sym<lambda>")
    rx451_cur."!cursor_debug"("PASS  ", "term:sym<lambda>", " at pos=", rx451_pos)
    .return (rx451_cur)
  rx451_fail:
.annotate "line", 4
    (rx451_rep, rx451_pos, $I10, $P10) = rx451_cur."!mark_fail"(0)
    lt rx451_pos, -1, rx451_done
    eq rx451_pos, -1, rx451_fail
    jump $I10
  rx451_done:
    rx451_cur."!cursor_fail"()
    rx451_cur."!cursor_debug"("FAIL  ", "term:sym<lambda>")
    .return (rx451_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("112_1271336396.90314") :method
.annotate "line", 4
    new $P453, "ResizablePMCArray"
    push $P453, ""
    .return ($P453)
.end


.namespace ["NQP";"Grammar"]
.sub "fatarrow"  :subid("113_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx456_tgt
    .local int rx456_pos
    .local int rx456_off
    .local int rx456_eos
    .local int rx456_rep
    .local pmc rx456_cur
    (rx456_cur, rx456_pos, rx456_tgt) = self."!cursor_start"()
    rx456_cur."!cursor_debug"("START ", "fatarrow")
    .lex unicode:"$\x{a2}", rx456_cur
    .local pmc match
    .lex "$/", match
    length rx456_eos, rx456_tgt
    set rx456_off, 0
    lt rx456_pos, 2, rx456_start
    sub rx456_off, rx456_pos, 1
    substr rx456_tgt, rx456_tgt, rx456_off
  rx456_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan460_done
    goto rxscan460_scan
  rxscan460_loop:
    ($P10) = rx456_cur."from"()
    inc $P10
    set rx456_pos, $P10
    ge rx456_pos, rx456_eos, rxscan460_done
  rxscan460_scan:
    set_addr $I10, rxscan460_loop
    rx456_cur."!mark_push"(0, rx456_pos, $I10)
  rxscan460_done:
.annotate "line", 231
  # rx subrule "identifier" subtype=capture negate=
    rx456_cur."!cursor_pos"(rx456_pos)
    $P10 = rx456_cur."identifier"()
    unless $P10, rx456_fail
    rx456_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    rx456_pos = $P10."pos"()
  # rx rxquantr461 ** 0..*
    set_addr $I462, rxquantr461_done
    rx456_cur."!mark_push"(0, rx456_pos, $I462)
  rxquantr461_loop:
  # rx enumcharlist negate=0 
    ge rx456_pos, rx456_eos, rx456_fail
    sub $I10, rx456_pos, rx456_off
    substr $S10, rx456_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx456_fail
    inc rx456_pos
    (rx456_rep) = rx456_cur."!mark_commit"($I462)
    rx456_cur."!mark_push"(rx456_rep, rx456_pos, $I462)
    goto rxquantr461_loop
  rxquantr461_done:
  # rx literal  "=>"
    add $I11, rx456_pos, 2
    gt $I11, rx456_eos, rx456_fail
    sub $I11, rx456_pos, rx456_off
    substr $S10, rx456_tgt, $I11, 2
    ne $S10, "=>", rx456_fail
    add rx456_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx456_cur."!cursor_pos"(rx456_pos)
    $P10 = rx456_cur."ws"()
    unless $P10, rx456_fail
    rx456_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx456_cur."!cursor_pos"(rx456_pos)
    $P10 = rx456_cur."EXPR"("i=")
    unless $P10, rx456_fail
    rx456_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("val")
    rx456_pos = $P10."pos"()
.annotate "line", 230
  # rx pass
    rx456_cur."!cursor_pass"(rx456_pos, "fatarrow")
    rx456_cur."!cursor_debug"("PASS  ", "fatarrow", " at pos=", rx456_pos)
    .return (rx456_cur)
  rx456_fail:
.annotate "line", 4
    (rx456_rep, rx456_pos, $I10, $P10) = rx456_cur."!mark_fail"(0)
    lt rx456_pos, -1, rx456_done
    eq rx456_pos, -1, rx456_fail
    jump $I10
  rx456_done:
    rx456_cur."!cursor_fail"()
    rx456_cur."!cursor_debug"("FAIL  ", "fatarrow")
    .return (rx456_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__fatarrow"  :subid("114_1271336396.90314") :method
.annotate "line", 4
    $P458 = self."!PREFIX__!subrule"("key", "")
    new $P459, "ResizablePMCArray"
    push $P459, $P458
    .return ($P459)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("115_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx464_tgt
    .local int rx464_pos
    .local int rx464_off
    .local int rx464_eos
    .local int rx464_rep
    .local pmc rx464_cur
    (rx464_cur, rx464_pos, rx464_tgt) = self."!cursor_start"()
    rx464_cur."!cursor_debug"("START ", "colonpair")
    rx464_cur."!cursor_caparray"("circumfix")
    .lex unicode:"$\x{a2}", rx464_cur
    .local pmc match
    .lex "$/", match
    length rx464_eos, rx464_tgt
    set rx464_off, 0
    lt rx464_pos, 2, rx464_start
    sub rx464_off, rx464_pos, 1
    substr rx464_tgt, rx464_tgt, rx464_off
  rx464_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan470_done
    goto rxscan470_scan
  rxscan470_loop:
    ($P10) = rx464_cur."from"()
    inc $P10
    set rx464_pos, $P10
    ge rx464_pos, rx464_eos, rxscan470_done
  rxscan470_scan:
    set_addr $I10, rxscan470_loop
    rx464_cur."!mark_push"(0, rx464_pos, $I10)
  rxscan470_done:
.annotate "line", 235
  # rx literal  ":"
    add $I11, rx464_pos, 1
    gt $I11, rx464_eos, rx464_fail
    sub $I11, rx464_pos, rx464_off
    substr $S10, rx464_tgt, $I11, 1
    ne $S10, ":", rx464_fail
    add rx464_pos, 1
  alt471_0:
.annotate "line", 236
    set_addr $I10, alt471_1
    rx464_cur."!mark_push"(0, rx464_pos, $I10)
.annotate "line", 237
  # rx subcapture "not"
    set_addr $I10, rxcap_472_fail
    rx464_cur."!mark_push"(0, rx464_pos, $I10)
  # rx literal  "!"
    add $I11, rx464_pos, 1
    gt $I11, rx464_eos, rx464_fail
    sub $I11, rx464_pos, rx464_off
    substr $S10, rx464_tgt, $I11, 1
    ne $S10, "!", rx464_fail
    add rx464_pos, 1
    set_addr $I10, rxcap_472_fail
    ($I12, $I11) = rx464_cur."!mark_peek"($I10)
    rx464_cur."!cursor_pos"($I11)
    ($P10) = rx464_cur."!cursor_start"()
    $P10."!cursor_pass"(rx464_pos, "")
    rx464_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_472_done
  rxcap_472_fail:
    goto rx464_fail
  rxcap_472_done:
  # rx subrule "identifier" subtype=capture negate=
    rx464_cur."!cursor_pos"(rx464_pos)
    $P10 = rx464_cur."identifier"()
    unless $P10, rx464_fail
    rx464_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx464_pos = $P10."pos"()
    goto alt471_end
  alt471_1:
    set_addr $I10, alt471_2
    rx464_cur."!mark_push"(0, rx464_pos, $I10)
.annotate "line", 238
  # rx subrule "identifier" subtype=capture negate=
    rx464_cur."!cursor_pos"(rx464_pos)
    $P10 = rx464_cur."identifier"()
    unless $P10, rx464_fail
    rx464_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx464_pos = $P10."pos"()
  # rx rxquantr473 ** 0..1
    set_addr $I474, rxquantr473_done
    rx464_cur."!mark_push"(0, rx464_pos, $I474)
  rxquantr473_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx464_cur."!cursor_pos"(rx464_pos)
    $P10 = rx464_cur."circumfix"()
    unless $P10, rx464_fail
    rx464_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx464_pos = $P10."pos"()
    (rx464_rep) = rx464_cur."!mark_commit"($I474)
  rxquantr473_done:
    goto alt471_end
  alt471_2:
.annotate "line", 239
  # rx subrule "circumfix" subtype=capture negate=
    rx464_cur."!cursor_pos"(rx464_pos)
    $P10 = rx464_cur."circumfix"()
    unless $P10, rx464_fail
    rx464_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx464_pos = $P10."pos"()
  alt471_end:
.annotate "line", 234
  # rx pass
    rx464_cur."!cursor_pass"(rx464_pos, "colonpair")
    rx464_cur."!cursor_debug"("PASS  ", "colonpair", " at pos=", rx464_pos)
    .return (rx464_cur)
  rx464_fail:
.annotate "line", 4
    (rx464_rep, rx464_pos, $I10, $P10) = rx464_cur."!mark_fail"(0)
    lt rx464_pos, -1, rx464_done
    eq rx464_pos, -1, rx464_fail
    jump $I10
  rx464_done:
    rx464_cur."!cursor_fail"()
    rx464_cur."!cursor_debug"("FAIL  ", "colonpair")
    .return (rx464_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("116_1271336396.90314") :method
.annotate "line", 4
    $P466 = self."!PREFIX__!subrule"("circumfix", ":")
    $P467 = self."!PREFIX__!subrule"("identifier", ":")
    $P468 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P469, "ResizablePMCArray"
    push $P469, $P466
    push $P469, $P467
    push $P469, $P468
    .return ($P469)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("117_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx476_tgt
    .local int rx476_pos
    .local int rx476_off
    .local int rx476_eos
    .local int rx476_rep
    .local pmc rx476_cur
    (rx476_cur, rx476_pos, rx476_tgt) = self."!cursor_start"()
    rx476_cur."!cursor_debug"("START ", "variable")
    rx476_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx476_cur
    .local pmc match
    .lex "$/", match
    length rx476_eos, rx476_tgt
    set rx476_off, 0
    lt rx476_pos, 2, rx476_start
    sub rx476_off, rx476_pos, 1
    substr rx476_tgt, rx476_tgt, rx476_off
  rx476_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan481_done
    goto rxscan481_scan
  rxscan481_loop:
    ($P10) = rx476_cur."from"()
    inc $P10
    set rx476_pos, $P10
    ge rx476_pos, rx476_eos, rxscan481_done
  rxscan481_scan:
    set_addr $I10, rxscan481_loop
    rx476_cur."!mark_push"(0, rx476_pos, $I10)
  rxscan481_done:
  alt482_0:
.annotate "line", 243
    set_addr $I10, alt482_1
    rx476_cur."!mark_push"(0, rx476_pos, $I10)
.annotate "line", 244
  # rx subrule "sigil" subtype=capture negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."sigil"()
    unless $P10, rx476_fail
    rx476_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx476_pos = $P10."pos"()
  # rx rxquantr483 ** 0..1
    set_addr $I484, rxquantr483_done
    rx476_cur."!mark_push"(0, rx476_pos, $I484)
  rxquantr483_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."twigil"()
    unless $P10, rx476_fail
    rx476_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx476_pos = $P10."pos"()
    (rx476_rep) = rx476_cur."!mark_commit"($I484)
  rxquantr483_done:
  # rx subrule "name" subtype=capture negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."name"()
    unless $P10, rx476_fail
    rx476_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx476_pos = $P10."pos"()
    goto alt482_end
  alt482_1:
    set_addr $I10, alt482_2
    rx476_cur."!mark_push"(0, rx476_pos, $I10)
.annotate "line", 245
  # rx subrule "sigil" subtype=capture negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."sigil"()
    unless $P10, rx476_fail
    rx476_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx476_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx476_pos, rx476_eos, rx476_fail
    sub $I10, rx476_pos, rx476_off
    substr $S10, rx476_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx476_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."postcircumfix"()
    unless $P10, rx476_fail
    rx476_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx476_pos = $P10."pos"()
    goto alt482_end
  alt482_2:
.annotate "line", 246
  # rx subcapture "sigil"
    set_addr $I10, rxcap_485_fail
    rx476_cur."!mark_push"(0, rx476_pos, $I10)
  # rx literal  "$"
    add $I11, rx476_pos, 1
    gt $I11, rx476_eos, rx476_fail
    sub $I11, rx476_pos, rx476_off
    substr $S10, rx476_tgt, $I11, 1
    ne $S10, "$", rx476_fail
    add rx476_pos, 1
    set_addr $I10, rxcap_485_fail
    ($I12, $I11) = rx476_cur."!mark_peek"($I10)
    rx476_cur."!cursor_pos"($I11)
    ($P10) = rx476_cur."!cursor_start"()
    $P10."!cursor_pass"(rx476_pos, "")
    rx476_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_485_done
  rxcap_485_fail:
    goto rx476_fail
  rxcap_485_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_486_fail
    rx476_cur."!mark_push"(0, rx476_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx476_pos, rx476_eos, rx476_fail
    sub $I10, rx476_pos, rx476_off
    substr $S10, rx476_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx476_fail
    inc rx476_pos
    set_addr $I10, rxcap_486_fail
    ($I12, $I11) = rx476_cur."!mark_peek"($I10)
    rx476_cur."!cursor_pos"($I11)
    ($P10) = rx476_cur."!cursor_start"()
    $P10."!cursor_pass"(rx476_pos, "")
    rx476_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_486_done
  rxcap_486_fail:
    goto rx476_fail
  rxcap_486_done:
  alt482_end:
.annotate "line", 243
  # rx pass
    rx476_cur."!cursor_pass"(rx476_pos, "variable")
    rx476_cur."!cursor_debug"("PASS  ", "variable", " at pos=", rx476_pos)
    .return (rx476_cur)
  rx476_fail:
.annotate "line", 4
    (rx476_rep, rx476_pos, $I10, $P10) = rx476_cur."!mark_fail"(0)
    lt rx476_pos, -1, rx476_done
    eq rx476_pos, -1, rx476_fail
    jump $I10
  rx476_done:
    rx476_cur."!cursor_fail"()
    rx476_cur."!cursor_debug"("FAIL  ", "variable")
    .return (rx476_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("118_1271336396.90314") :method
.annotate "line", 4
    $P478 = self."!PREFIX__!subrule"("sigil", "")
    $P479 = self."!PREFIX__!subrule"("sigil", "")
    new $P480, "ResizablePMCArray"
    push $P480, "$!"
    push $P480, "$_"
    push $P480, "$/"
    push $P480, $P478
    push $P480, $P479
    .return ($P480)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("119_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx488_tgt
    .local int rx488_pos
    .local int rx488_off
    .local int rx488_eos
    .local int rx488_rep
    .local pmc rx488_cur
    (rx488_cur, rx488_pos, rx488_tgt) = self."!cursor_start"()
    rx488_cur."!cursor_debug"("START ", "sigil")
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
.annotate "line", 249
  # rx enumcharlist negate=0 
    ge rx488_pos, rx488_eos, rx488_fail
    sub $I10, rx488_pos, rx488_off
    substr $S10, rx488_tgt, $I10, 1
    index $I11, "$@%&", $S10
    lt $I11, 0, rx488_fail
    inc rx488_pos
  # rx pass
    rx488_cur."!cursor_pass"(rx488_pos, "sigil")
    rx488_cur."!cursor_debug"("PASS  ", "sigil", " at pos=", rx488_pos)
    .return (rx488_cur)
  rx488_fail:
.annotate "line", 4
    (rx488_rep, rx488_pos, $I10, $P10) = rx488_cur."!mark_fail"(0)
    lt rx488_pos, -1, rx488_done
    eq rx488_pos, -1, rx488_fail
    jump $I10
  rx488_done:
    rx488_cur."!cursor_fail"()
    rx488_cur."!cursor_debug"("FAIL  ", "sigil")
    .return (rx488_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("120_1271336396.90314") :method
.annotate "line", 4
    new $P490, "ResizablePMCArray"
    push $P490, "&"
    push $P490, "%"
    push $P490, "@"
    push $P490, "$"
    .return ($P490)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("121_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx493_tgt
    .local int rx493_pos
    .local int rx493_off
    .local int rx493_eos
    .local int rx493_rep
    .local pmc rx493_cur
    (rx493_cur, rx493_pos, rx493_tgt) = self."!cursor_start"()
    rx493_cur."!cursor_debug"("START ", "twigil")
    .lex unicode:"$\x{a2}", rx493_cur
    .local pmc match
    .lex "$/", match
    length rx493_eos, rx493_tgt
    set rx493_off, 0
    lt rx493_pos, 2, rx493_start
    sub rx493_off, rx493_pos, 1
    substr rx493_tgt, rx493_tgt, rx493_off
  rx493_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan496_done
    goto rxscan496_scan
  rxscan496_loop:
    ($P10) = rx493_cur."from"()
    inc $P10
    set rx493_pos, $P10
    ge rx493_pos, rx493_eos, rxscan496_done
  rxscan496_scan:
    set_addr $I10, rxscan496_loop
    rx493_cur."!mark_push"(0, rx493_pos, $I10)
  rxscan496_done:
.annotate "line", 251
  # rx enumcharlist negate=0 
    ge rx493_pos, rx493_eos, rx493_fail
    sub $I10, rx493_pos, rx493_off
    substr $S10, rx493_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx493_fail
    inc rx493_pos
  # rx pass
    rx493_cur."!cursor_pass"(rx493_pos, "twigil")
    rx493_cur."!cursor_debug"("PASS  ", "twigil", " at pos=", rx493_pos)
    .return (rx493_cur)
  rx493_fail:
.annotate "line", 4
    (rx493_rep, rx493_pos, $I10, $P10) = rx493_cur."!mark_fail"(0)
    lt rx493_pos, -1, rx493_done
    eq rx493_pos, -1, rx493_fail
    jump $I10
  rx493_done:
    rx493_cur."!cursor_fail"()
    rx493_cur."!cursor_debug"("FAIL  ", "twigil")
    .return (rx493_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("122_1271336396.90314") :method
.annotate "line", 4
    new $P495, "ResizablePMCArray"
    push $P495, "?"
    push $P495, "!"
    push $P495, "*"
    .return ($P495)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("123_1271336396.90314") :method
.annotate "line", 253
    $P498 = self."!protoregex"("package_declarator")
    .return ($P498)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("124_1271336396.90314") :method
.annotate "line", 253
    $P500 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P500)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("125_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx502_tgt
    .local int rx502_pos
    .local int rx502_off
    .local int rx502_eos
    .local int rx502_rep
    .local pmc rx502_cur
    (rx502_cur, rx502_pos, rx502_tgt) = self."!cursor_start"()
    rx502_cur."!cursor_debug"("START ", "package_declarator:sym<module>")
    .lex unicode:"$\x{a2}", rx502_cur
    .local pmc match
    .lex "$/", match
    length rx502_eos, rx502_tgt
    set rx502_off, 0
    lt rx502_pos, 2, rx502_start
    sub rx502_off, rx502_pos, 1
    substr rx502_tgt, rx502_tgt, rx502_off
  rx502_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan506_done
    goto rxscan506_scan
  rxscan506_loop:
    ($P10) = rx502_cur."from"()
    inc $P10
    set rx502_pos, $P10
    ge rx502_pos, rx502_eos, rxscan506_done
  rxscan506_scan:
    set_addr $I10, rxscan506_loop
    rx502_cur."!mark_push"(0, rx502_pos, $I10)
  rxscan506_done:
.annotate "line", 254
  # rx subcapture "sym"
    set_addr $I10, rxcap_507_fail
    rx502_cur."!mark_push"(0, rx502_pos, $I10)
  # rx literal  "module"
    add $I11, rx502_pos, 6
    gt $I11, rx502_eos, rx502_fail
    sub $I11, rx502_pos, rx502_off
    substr $S10, rx502_tgt, $I11, 6
    ne $S10, "module", rx502_fail
    add rx502_pos, 6
    set_addr $I10, rxcap_507_fail
    ($I12, $I11) = rx502_cur."!mark_peek"($I10)
    rx502_cur."!cursor_pos"($I11)
    ($P10) = rx502_cur."!cursor_start"()
    $P10."!cursor_pass"(rx502_pos, "")
    rx502_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_507_done
  rxcap_507_fail:
    goto rx502_fail
  rxcap_507_done:
  # rx subrule "package_def" subtype=capture negate=
    rx502_cur."!cursor_pos"(rx502_pos)
    $P10 = rx502_cur."package_def"()
    unless $P10, rx502_fail
    rx502_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx502_pos = $P10."pos"()
  # rx pass
    rx502_cur."!cursor_pass"(rx502_pos, "package_declarator:sym<module>")
    rx502_cur."!cursor_debug"("PASS  ", "package_declarator:sym<module>", " at pos=", rx502_pos)
    .return (rx502_cur)
  rx502_fail:
.annotate "line", 4
    (rx502_rep, rx502_pos, $I10, $P10) = rx502_cur."!mark_fail"(0)
    lt rx502_pos, -1, rx502_done
    eq rx502_pos, -1, rx502_fail
    jump $I10
  rx502_done:
    rx502_cur."!cursor_fail"()
    rx502_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<module>")
    .return (rx502_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("126_1271336396.90314") :method
.annotate "line", 4
    $P504 = self."!PREFIX__!subrule"("package_def", "module")
    new $P505, "ResizablePMCArray"
    push $P505, $P504
    .return ($P505)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("127_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx509_tgt
    .local int rx509_pos
    .local int rx509_off
    .local int rx509_eos
    .local int rx509_rep
    .local pmc rx509_cur
    (rx509_cur, rx509_pos, rx509_tgt) = self."!cursor_start"()
    rx509_cur."!cursor_debug"("START ", "package_declarator:sym<class>")
    .lex unicode:"$\x{a2}", rx509_cur
    .local pmc match
    .lex "$/", match
    length rx509_eos, rx509_tgt
    set rx509_off, 0
    lt rx509_pos, 2, rx509_start
    sub rx509_off, rx509_pos, 1
    substr rx509_tgt, rx509_tgt, rx509_off
  rx509_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan514_done
    goto rxscan514_scan
  rxscan514_loop:
    ($P10) = rx509_cur."from"()
    inc $P10
    set rx509_pos, $P10
    ge rx509_pos, rx509_eos, rxscan514_done
  rxscan514_scan:
    set_addr $I10, rxscan514_loop
    rx509_cur."!mark_push"(0, rx509_pos, $I10)
  rxscan514_done:
.annotate "line", 255
  # rx subcapture "sym"
    set_addr $I10, rxcap_516_fail
    rx509_cur."!mark_push"(0, rx509_pos, $I10)
  alt515_0:
    set_addr $I10, alt515_1
    rx509_cur."!mark_push"(0, rx509_pos, $I10)
  # rx literal  "class"
    add $I11, rx509_pos, 5
    gt $I11, rx509_eos, rx509_fail
    sub $I11, rx509_pos, rx509_off
    substr $S10, rx509_tgt, $I11, 5
    ne $S10, "class", rx509_fail
    add rx509_pos, 5
    goto alt515_end
  alt515_1:
  # rx literal  "grammar"
    add $I11, rx509_pos, 7
    gt $I11, rx509_eos, rx509_fail
    sub $I11, rx509_pos, rx509_off
    substr $S10, rx509_tgt, $I11, 7
    ne $S10, "grammar", rx509_fail
    add rx509_pos, 7
  alt515_end:
    set_addr $I10, rxcap_516_fail
    ($I12, $I11) = rx509_cur."!mark_peek"($I10)
    rx509_cur."!cursor_pos"($I11)
    ($P10) = rx509_cur."!cursor_start"()
    $P10."!cursor_pass"(rx509_pos, "")
    rx509_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_516_done
  rxcap_516_fail:
    goto rx509_fail
  rxcap_516_done:
  # rx subrule "package_def" subtype=capture negate=
    rx509_cur."!cursor_pos"(rx509_pos)
    $P10 = rx509_cur."package_def"()
    unless $P10, rx509_fail
    rx509_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx509_pos = $P10."pos"()
  # rx pass
    rx509_cur."!cursor_pass"(rx509_pos, "package_declarator:sym<class>")
    rx509_cur."!cursor_debug"("PASS  ", "package_declarator:sym<class>", " at pos=", rx509_pos)
    .return (rx509_cur)
  rx509_fail:
.annotate "line", 4
    (rx509_rep, rx509_pos, $I10, $P10) = rx509_cur."!mark_fail"(0)
    lt rx509_pos, -1, rx509_done
    eq rx509_pos, -1, rx509_fail
    jump $I10
  rx509_done:
    rx509_cur."!cursor_fail"()
    rx509_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<class>")
    .return (rx509_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("128_1271336396.90314") :method
.annotate "line", 4
    $P511 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P512 = self."!PREFIX__!subrule"("package_def", "class")
    new $P513, "ResizablePMCArray"
    push $P513, $P511
    push $P513, $P512
    .return ($P513)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("129_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx518_tgt
    .local int rx518_pos
    .local int rx518_off
    .local int rx518_eos
    .local int rx518_rep
    .local pmc rx518_cur
    (rx518_cur, rx518_pos, rx518_tgt) = self."!cursor_start"()
    rx518_cur."!cursor_debug"("START ", "package_def")
    rx518_cur."!cursor_caparray"("parent")
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
    ne $I10, -1, rxscan521_done
    goto rxscan521_scan
  rxscan521_loop:
    ($P10) = rx518_cur."from"()
    inc $P10
    set rx518_pos, $P10
    ge rx518_pos, rx518_eos, rxscan521_done
  rxscan521_scan:
    set_addr $I10, rxscan521_loop
    rx518_cur."!mark_push"(0, rx518_pos, $I10)
  rxscan521_done:
.annotate "line", 257
  # rx subrule "ws" subtype=method negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."ws"()
    unless $P10, rx518_fail
    rx518_pos = $P10."pos"()
.annotate "line", 258
  # rx subrule "name" subtype=capture negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."name"()
    unless $P10, rx518_fail
    rx518_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx518_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."ws"()
    unless $P10, rx518_fail
    rx518_pos = $P10."pos"()
.annotate "line", 259
  # rx rxquantr524 ** 0..1
    set_addr $I528, rxquantr524_done
    rx518_cur."!mark_push"(0, rx518_pos, $I528)
  rxquantr524_loop:
  # rx subrule "ws" subtype=method negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."ws"()
    unless $P10, rx518_fail
    rx518_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx518_pos, 2
    gt $I11, rx518_eos, rx518_fail
    sub $I11, rx518_pos, rx518_off
    substr $S10, rx518_tgt, $I11, 2
    ne $S10, "is", rx518_fail
    add rx518_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."ws"()
    unless $P10, rx518_fail
    rx518_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."name"()
    unless $P10, rx518_fail
    rx518_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx518_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."ws"()
    unless $P10, rx518_fail
    rx518_pos = $P10."pos"()
    (rx518_rep) = rx518_cur."!mark_commit"($I528)
  rxquantr524_done:
  # rx subrule "ws" subtype=method negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."ws"()
    unless $P10, rx518_fail
    rx518_pos = $P10."pos"()
  alt530_0:
.annotate "line", 260
    set_addr $I10, alt530_1
    rx518_cur."!mark_push"(0, rx518_pos, $I10)
.annotate "line", 261
  # rx subrule "ws" subtype=method negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."ws"()
    unless $P10, rx518_fail
    rx518_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx518_pos, 1
    gt $I11, rx518_eos, rx518_fail
    sub $I11, rx518_pos, rx518_off
    substr $S10, rx518_tgt, $I11, 1
    ne $S10, ";", rx518_fail
    add rx518_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."ws"()
    unless $P10, rx518_fail
    rx518_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."comp_unit"()
    unless $P10, rx518_fail
    rx518_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx518_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."ws"()
    unless $P10, rx518_fail
    rx518_pos = $P10."pos"()
    goto alt530_end
  alt530_1:
    set_addr $I10, alt530_2
    rx518_cur."!mark_push"(0, rx518_pos, $I10)
.annotate "line", 262
  # rx subrule "ws" subtype=method negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."ws"()
    unless $P10, rx518_fail
    rx518_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx518_pos, rx518_eos, rx518_fail
    sub $I10, rx518_pos, rx518_off
    substr $S10, rx518_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx518_fail
  # rx subrule "ws" subtype=method negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."ws"()
    unless $P10, rx518_fail
    rx518_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."block"()
    unless $P10, rx518_fail
    rx518_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx518_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."ws"()
    unless $P10, rx518_fail
    rx518_pos = $P10."pos"()
    goto alt530_end
  alt530_2:
.annotate "line", 263
  # rx subrule "ws" subtype=method negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."ws"()
    unless $P10, rx518_fail
    rx518_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."panic"("Malformed package declaration")
    unless $P10, rx518_fail
    rx518_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."ws"()
    unless $P10, rx518_fail
    rx518_pos = $P10."pos"()
  alt530_end:
.annotate "line", 264
  # rx subrule "ws" subtype=method negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."ws"()
    unless $P10, rx518_fail
    rx518_pos = $P10."pos"()
.annotate "line", 257
  # rx pass
    rx518_cur."!cursor_pass"(rx518_pos, "package_def")
    rx518_cur."!cursor_debug"("PASS  ", "package_def", " at pos=", rx518_pos)
    .return (rx518_cur)
  rx518_fail:
.annotate "line", 4
    (rx518_rep, rx518_pos, $I10, $P10) = rx518_cur."!mark_fail"(0)
    lt rx518_pos, -1, rx518_done
    eq rx518_pos, -1, rx518_fail
    jump $I10
  rx518_done:
    rx518_cur."!cursor_fail"()
    rx518_cur."!cursor_debug"("FAIL  ", "package_def")
    .return (rx518_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("130_1271336396.90314") :method
.annotate "line", 4
    new $P520, "ResizablePMCArray"
    push $P520, ""
    .return ($P520)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("131_1271336396.90314") :method
.annotate "line", 267
    $P541 = self."!protoregex"("scope_declarator")
    .return ($P541)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("132_1271336396.90314") :method
.annotate "line", 267
    $P543 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P543)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("133_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx545_tgt
    .local int rx545_pos
    .local int rx545_off
    .local int rx545_eos
    .local int rx545_rep
    .local pmc rx545_cur
    (rx545_cur, rx545_pos, rx545_tgt) = self."!cursor_start"()
    rx545_cur."!cursor_debug"("START ", "scope_declarator:sym<my>")
    .lex unicode:"$\x{a2}", rx545_cur
    .local pmc match
    .lex "$/", match
    length rx545_eos, rx545_tgt
    set rx545_off, 0
    lt rx545_pos, 2, rx545_start
    sub rx545_off, rx545_pos, 1
    substr rx545_tgt, rx545_tgt, rx545_off
  rx545_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan549_done
    goto rxscan549_scan
  rxscan549_loop:
    ($P10) = rx545_cur."from"()
    inc $P10
    set rx545_pos, $P10
    ge rx545_pos, rx545_eos, rxscan549_done
  rxscan549_scan:
    set_addr $I10, rxscan549_loop
    rx545_cur."!mark_push"(0, rx545_pos, $I10)
  rxscan549_done:
.annotate "line", 268
  # rx subcapture "sym"
    set_addr $I10, rxcap_550_fail
    rx545_cur."!mark_push"(0, rx545_pos, $I10)
  # rx literal  "my"
    add $I11, rx545_pos, 2
    gt $I11, rx545_eos, rx545_fail
    sub $I11, rx545_pos, rx545_off
    substr $S10, rx545_tgt, $I11, 2
    ne $S10, "my", rx545_fail
    add rx545_pos, 2
    set_addr $I10, rxcap_550_fail
    ($I12, $I11) = rx545_cur."!mark_peek"($I10)
    rx545_cur."!cursor_pos"($I11)
    ($P10) = rx545_cur."!cursor_start"()
    $P10."!cursor_pass"(rx545_pos, "")
    rx545_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_550_done
  rxcap_550_fail:
    goto rx545_fail
  rxcap_550_done:
  # rx subrule "scoped" subtype=capture negate=
    rx545_cur."!cursor_pos"(rx545_pos)
    $P10 = rx545_cur."scoped"("my")
    unless $P10, rx545_fail
    rx545_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx545_pos = $P10."pos"()
  # rx pass
    rx545_cur."!cursor_pass"(rx545_pos, "scope_declarator:sym<my>")
    rx545_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<my>", " at pos=", rx545_pos)
    .return (rx545_cur)
  rx545_fail:
.annotate "line", 4
    (rx545_rep, rx545_pos, $I10, $P10) = rx545_cur."!mark_fail"(0)
    lt rx545_pos, -1, rx545_done
    eq rx545_pos, -1, rx545_fail
    jump $I10
  rx545_done:
    rx545_cur."!cursor_fail"()
    rx545_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<my>")
    .return (rx545_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("134_1271336396.90314") :method
.annotate "line", 4
    $P547 = self."!PREFIX__!subrule"("scoped", "my")
    new $P548, "ResizablePMCArray"
    push $P548, $P547
    .return ($P548)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("135_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx552_tgt
    .local int rx552_pos
    .local int rx552_off
    .local int rx552_eos
    .local int rx552_rep
    .local pmc rx552_cur
    (rx552_cur, rx552_pos, rx552_tgt) = self."!cursor_start"()
    rx552_cur."!cursor_debug"("START ", "scope_declarator:sym<our>")
    .lex unicode:"$\x{a2}", rx552_cur
    .local pmc match
    .lex "$/", match
    length rx552_eos, rx552_tgt
    set rx552_off, 0
    lt rx552_pos, 2, rx552_start
    sub rx552_off, rx552_pos, 1
    substr rx552_tgt, rx552_tgt, rx552_off
  rx552_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan556_done
    goto rxscan556_scan
  rxscan556_loop:
    ($P10) = rx552_cur."from"()
    inc $P10
    set rx552_pos, $P10
    ge rx552_pos, rx552_eos, rxscan556_done
  rxscan556_scan:
    set_addr $I10, rxscan556_loop
    rx552_cur."!mark_push"(0, rx552_pos, $I10)
  rxscan556_done:
.annotate "line", 269
  # rx subcapture "sym"
    set_addr $I10, rxcap_557_fail
    rx552_cur."!mark_push"(0, rx552_pos, $I10)
  # rx literal  "our"
    add $I11, rx552_pos, 3
    gt $I11, rx552_eos, rx552_fail
    sub $I11, rx552_pos, rx552_off
    substr $S10, rx552_tgt, $I11, 3
    ne $S10, "our", rx552_fail
    add rx552_pos, 3
    set_addr $I10, rxcap_557_fail
    ($I12, $I11) = rx552_cur."!mark_peek"($I10)
    rx552_cur."!cursor_pos"($I11)
    ($P10) = rx552_cur."!cursor_start"()
    $P10."!cursor_pass"(rx552_pos, "")
    rx552_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_557_done
  rxcap_557_fail:
    goto rx552_fail
  rxcap_557_done:
  # rx subrule "scoped" subtype=capture negate=
    rx552_cur."!cursor_pos"(rx552_pos)
    $P10 = rx552_cur."scoped"("our")
    unless $P10, rx552_fail
    rx552_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx552_pos = $P10."pos"()
  # rx pass
    rx552_cur."!cursor_pass"(rx552_pos, "scope_declarator:sym<our>")
    rx552_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<our>", " at pos=", rx552_pos)
    .return (rx552_cur)
  rx552_fail:
.annotate "line", 4
    (rx552_rep, rx552_pos, $I10, $P10) = rx552_cur."!mark_fail"(0)
    lt rx552_pos, -1, rx552_done
    eq rx552_pos, -1, rx552_fail
    jump $I10
  rx552_done:
    rx552_cur."!cursor_fail"()
    rx552_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<our>")
    .return (rx552_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("136_1271336396.90314") :method
.annotate "line", 4
    $P554 = self."!PREFIX__!subrule"("scoped", "our")
    new $P555, "ResizablePMCArray"
    push $P555, $P554
    .return ($P555)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("137_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx559_tgt
    .local int rx559_pos
    .local int rx559_off
    .local int rx559_eos
    .local int rx559_rep
    .local pmc rx559_cur
    (rx559_cur, rx559_pos, rx559_tgt) = self."!cursor_start"()
    rx559_cur."!cursor_debug"("START ", "scope_declarator:sym<has>")
    .lex unicode:"$\x{a2}", rx559_cur
    .local pmc match
    .lex "$/", match
    length rx559_eos, rx559_tgt
    set rx559_off, 0
    lt rx559_pos, 2, rx559_start
    sub rx559_off, rx559_pos, 1
    substr rx559_tgt, rx559_tgt, rx559_off
  rx559_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan563_done
    goto rxscan563_scan
  rxscan563_loop:
    ($P10) = rx559_cur."from"()
    inc $P10
    set rx559_pos, $P10
    ge rx559_pos, rx559_eos, rxscan563_done
  rxscan563_scan:
    set_addr $I10, rxscan563_loop
    rx559_cur."!mark_push"(0, rx559_pos, $I10)
  rxscan563_done:
.annotate "line", 270
  # rx subcapture "sym"
    set_addr $I10, rxcap_564_fail
    rx559_cur."!mark_push"(0, rx559_pos, $I10)
  # rx literal  "has"
    add $I11, rx559_pos, 3
    gt $I11, rx559_eos, rx559_fail
    sub $I11, rx559_pos, rx559_off
    substr $S10, rx559_tgt, $I11, 3
    ne $S10, "has", rx559_fail
    add rx559_pos, 3
    set_addr $I10, rxcap_564_fail
    ($I12, $I11) = rx559_cur."!mark_peek"($I10)
    rx559_cur."!cursor_pos"($I11)
    ($P10) = rx559_cur."!cursor_start"()
    $P10."!cursor_pass"(rx559_pos, "")
    rx559_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_564_done
  rxcap_564_fail:
    goto rx559_fail
  rxcap_564_done:
  # rx subrule "scoped" subtype=capture negate=
    rx559_cur."!cursor_pos"(rx559_pos)
    $P10 = rx559_cur."scoped"("has")
    unless $P10, rx559_fail
    rx559_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx559_pos = $P10."pos"()
  # rx pass
    rx559_cur."!cursor_pass"(rx559_pos, "scope_declarator:sym<has>")
    rx559_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<has>", " at pos=", rx559_pos)
    .return (rx559_cur)
  rx559_fail:
.annotate "line", 4
    (rx559_rep, rx559_pos, $I10, $P10) = rx559_cur."!mark_fail"(0)
    lt rx559_pos, -1, rx559_done
    eq rx559_pos, -1, rx559_fail
    jump $I10
  rx559_done:
    rx559_cur."!cursor_fail"()
    rx559_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<has>")
    .return (rx559_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("138_1271336396.90314") :method
.annotate "line", 4
    $P561 = self."!PREFIX__!subrule"("scoped", "has")
    new $P562, "ResizablePMCArray"
    push $P562, $P561
    .return ($P562)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("139_1271336396.90314") :method :outer("11_1271336396.90314")
    .param pmc param_566
.annotate "line", 272
    .lex "$*SCOPE", param_566
.annotate "line", 4
    .local string rx567_tgt
    .local int rx567_pos
    .local int rx567_off
    .local int rx567_eos
    .local int rx567_rep
    .local pmc rx567_cur
    (rx567_cur, rx567_pos, rx567_tgt) = self."!cursor_start"()
    rx567_cur."!cursor_debug"("START ", "scoped")
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
    ne $I10, -1, rxscan570_done
    goto rxscan570_scan
  rxscan570_loop:
    ($P10) = rx567_cur."from"()
    inc $P10
    set rx567_pos, $P10
    ge rx567_pos, rx567_eos, rxscan570_done
  rxscan570_scan:
    set_addr $I10, rxscan570_loop
    rx567_cur."!mark_push"(0, rx567_pos, $I10)
  rxscan570_done:
  alt571_0:
.annotate "line", 272
    set_addr $I10, alt571_1
    rx567_cur."!mark_push"(0, rx567_pos, $I10)
.annotate "line", 273
  # rx subrule "ws" subtype=method negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."ws"()
    unless $P10, rx567_fail
    rx567_pos = $P10."pos"()
  # rx subrule "variable_declarator" subtype=capture negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."variable_declarator"()
    unless $P10, rx567_fail
    rx567_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx567_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."ws"()
    unless $P10, rx567_fail
    rx567_pos = $P10."pos"()
    goto alt571_end
  alt571_1:
.annotate "line", 274
  # rx subrule "ws" subtype=method negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."ws"()
    unless $P10, rx567_fail
    rx567_pos = $P10."pos"()
  # rx subrule "routine_declarator" subtype=capture negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."routine_declarator"()
    unless $P10, rx567_fail
    rx567_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx567_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."ws"()
    unless $P10, rx567_fail
    rx567_pos = $P10."pos"()
  alt571_end:
.annotate "line", 272
  # rx pass
    rx567_cur."!cursor_pass"(rx567_pos, "scoped")
    rx567_cur."!cursor_debug"("PASS  ", "scoped", " at pos=", rx567_pos)
    .return (rx567_cur)
  rx567_fail:
.annotate "line", 4
    (rx567_rep, rx567_pos, $I10, $P10) = rx567_cur."!mark_fail"(0)
    lt rx567_pos, -1, rx567_done
    eq rx567_pos, -1, rx567_fail
    jump $I10
  rx567_done:
    rx567_cur."!cursor_fail"()
    rx567_cur."!cursor_debug"("FAIL  ", "scoped")
    .return (rx567_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("140_1271336396.90314") :method
.annotate "line", 4
    new $P569, "ResizablePMCArray"
    push $P569, ""
    push $P569, ""
    .return ($P569)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("141_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx577_tgt
    .local int rx577_pos
    .local int rx577_off
    .local int rx577_eos
    .local int rx577_rep
    .local pmc rx577_cur
    (rx577_cur, rx577_pos, rx577_tgt) = self."!cursor_start"()
    rx577_cur."!cursor_debug"("START ", "variable_declarator")
    .lex unicode:"$\x{a2}", rx577_cur
    .local pmc match
    .lex "$/", match
    length rx577_eos, rx577_tgt
    set rx577_off, 0
    lt rx577_pos, 2, rx577_start
    sub rx577_off, rx577_pos, 1
    substr rx577_tgt, rx577_tgt, rx577_off
  rx577_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan581_done
    goto rxscan581_scan
  rxscan581_loop:
    ($P10) = rx577_cur."from"()
    inc $P10
    set rx577_pos, $P10
    ge rx577_pos, rx577_eos, rxscan581_done
  rxscan581_scan:
    set_addr $I10, rxscan581_loop
    rx577_cur."!mark_push"(0, rx577_pos, $I10)
  rxscan581_done:
.annotate "line", 277
  # rx subrule "variable" subtype=capture negate=
    rx577_cur."!cursor_pos"(rx577_pos)
    $P10 = rx577_cur."variable"()
    unless $P10, rx577_fail
    rx577_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx577_pos = $P10."pos"()
  # rx pass
    rx577_cur."!cursor_pass"(rx577_pos, "variable_declarator")
    rx577_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx577_pos)
    .return (rx577_cur)
  rx577_fail:
.annotate "line", 4
    (rx577_rep, rx577_pos, $I10, $P10) = rx577_cur."!mark_fail"(0)
    lt rx577_pos, -1, rx577_done
    eq rx577_pos, -1, rx577_fail
    jump $I10
  rx577_done:
    rx577_cur."!cursor_fail"()
    rx577_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx577_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("142_1271336396.90314") :method
.annotate "line", 4
    $P579 = self."!PREFIX__!subrule"("variable", "")
    new $P580, "ResizablePMCArray"
    push $P580, $P579
    .return ($P580)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("143_1271336396.90314") :method
.annotate "line", 279
    $P583 = self."!protoregex"("routine_declarator")
    .return ($P583)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("144_1271336396.90314") :method
.annotate "line", 279
    $P585 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P585)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("145_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx587_tgt
    .local int rx587_pos
    .local int rx587_off
    .local int rx587_eos
    .local int rx587_rep
    .local pmc rx587_cur
    (rx587_cur, rx587_pos, rx587_tgt) = self."!cursor_start"()
    rx587_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
    .lex unicode:"$\x{a2}", rx587_cur
    .local pmc match
    .lex "$/", match
    length rx587_eos, rx587_tgt
    set rx587_off, 0
    lt rx587_pos, 2, rx587_start
    sub rx587_off, rx587_pos, 1
    substr rx587_tgt, rx587_tgt, rx587_off
  rx587_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan591_done
    goto rxscan591_scan
  rxscan591_loop:
    ($P10) = rx587_cur."from"()
    inc $P10
    set rx587_pos, $P10
    ge rx587_pos, rx587_eos, rxscan591_done
  rxscan591_scan:
    set_addr $I10, rxscan591_loop
    rx587_cur."!mark_push"(0, rx587_pos, $I10)
  rxscan591_done:
.annotate "line", 280
  # rx subcapture "sym"
    set_addr $I10, rxcap_592_fail
    rx587_cur."!mark_push"(0, rx587_pos, $I10)
  # rx literal  "sub"
    add $I11, rx587_pos, 3
    gt $I11, rx587_eos, rx587_fail
    sub $I11, rx587_pos, rx587_off
    substr $S10, rx587_tgt, $I11, 3
    ne $S10, "sub", rx587_fail
    add rx587_pos, 3
    set_addr $I10, rxcap_592_fail
    ($I12, $I11) = rx587_cur."!mark_peek"($I10)
    rx587_cur."!cursor_pos"($I11)
    ($P10) = rx587_cur."!cursor_start"()
    $P10."!cursor_pass"(rx587_pos, "")
    rx587_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_592_done
  rxcap_592_fail:
    goto rx587_fail
  rxcap_592_done:
  # rx subrule "routine_def" subtype=capture negate=
    rx587_cur."!cursor_pos"(rx587_pos)
    $P10 = rx587_cur."routine_def"()
    unless $P10, rx587_fail
    rx587_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx587_pos = $P10."pos"()
  # rx pass
    rx587_cur."!cursor_pass"(rx587_pos, "routine_declarator:sym<sub>")
    rx587_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx587_pos)
    .return (rx587_cur)
  rx587_fail:
.annotate "line", 4
    (rx587_rep, rx587_pos, $I10, $P10) = rx587_cur."!mark_fail"(0)
    lt rx587_pos, -1, rx587_done
    eq rx587_pos, -1, rx587_fail
    jump $I10
  rx587_done:
    rx587_cur."!cursor_fail"()
    rx587_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx587_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("146_1271336396.90314") :method
.annotate "line", 4
    $P589 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P590, "ResizablePMCArray"
    push $P590, $P589
    .return ($P590)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("147_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx594_tgt
    .local int rx594_pos
    .local int rx594_off
    .local int rx594_eos
    .local int rx594_rep
    .local pmc rx594_cur
    (rx594_cur, rx594_pos, rx594_tgt) = self."!cursor_start"()
    rx594_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
    .lex unicode:"$\x{a2}", rx594_cur
    .local pmc match
    .lex "$/", match
    length rx594_eos, rx594_tgt
    set rx594_off, 0
    lt rx594_pos, 2, rx594_start
    sub rx594_off, rx594_pos, 1
    substr rx594_tgt, rx594_tgt, rx594_off
  rx594_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan598_done
    goto rxscan598_scan
  rxscan598_loop:
    ($P10) = rx594_cur."from"()
    inc $P10
    set rx594_pos, $P10
    ge rx594_pos, rx594_eos, rxscan598_done
  rxscan598_scan:
    set_addr $I10, rxscan598_loop
    rx594_cur."!mark_push"(0, rx594_pos, $I10)
  rxscan598_done:
.annotate "line", 281
  # rx subcapture "sym"
    set_addr $I10, rxcap_599_fail
    rx594_cur."!mark_push"(0, rx594_pos, $I10)
  # rx literal  "method"
    add $I11, rx594_pos, 6
    gt $I11, rx594_eos, rx594_fail
    sub $I11, rx594_pos, rx594_off
    substr $S10, rx594_tgt, $I11, 6
    ne $S10, "method", rx594_fail
    add rx594_pos, 6
    set_addr $I10, rxcap_599_fail
    ($I12, $I11) = rx594_cur."!mark_peek"($I10)
    rx594_cur."!cursor_pos"($I11)
    ($P10) = rx594_cur."!cursor_start"()
    $P10."!cursor_pass"(rx594_pos, "")
    rx594_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_599_done
  rxcap_599_fail:
    goto rx594_fail
  rxcap_599_done:
  # rx subrule "method_def" subtype=capture negate=
    rx594_cur."!cursor_pos"(rx594_pos)
    $P10 = rx594_cur."method_def"()
    unless $P10, rx594_fail
    rx594_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx594_pos = $P10."pos"()
  # rx pass
    rx594_cur."!cursor_pass"(rx594_pos, "routine_declarator:sym<method>")
    rx594_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx594_pos)
    .return (rx594_cur)
  rx594_fail:
.annotate "line", 4
    (rx594_rep, rx594_pos, $I10, $P10) = rx594_cur."!mark_fail"(0)
    lt rx594_pos, -1, rx594_done
    eq rx594_pos, -1, rx594_fail
    jump $I10
  rx594_done:
    rx594_cur."!cursor_fail"()
    rx594_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx594_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("148_1271336396.90314") :method
.annotate "line", 4
    $P596 = self."!PREFIX__!subrule"("method_def", "method")
    new $P597, "ResizablePMCArray"
    push $P597, $P596
    .return ($P597)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("149_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx601_tgt
    .local int rx601_pos
    .local int rx601_off
    .local int rx601_eos
    .local int rx601_rep
    .local pmc rx601_cur
    (rx601_cur, rx601_pos, rx601_tgt) = self."!cursor_start"()
    rx601_cur."!cursor_debug"("START ", "routine_def")
    rx601_cur."!cursor_caparray"("sigil", "deflongname")
    .lex unicode:"$\x{a2}", rx601_cur
    .local pmc match
    .lex "$/", match
    length rx601_eos, rx601_tgt
    set rx601_off, 0
    lt rx601_pos, 2, rx601_start
    sub rx601_off, rx601_pos, 1
    substr rx601_tgt, rx601_tgt, rx601_off
  rx601_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan604_done
    goto rxscan604_scan
  rxscan604_loop:
    ($P10) = rx601_cur."from"()
    inc $P10
    set rx601_pos, $P10
    ge rx601_pos, rx601_eos, rxscan604_done
  rxscan604_scan:
    set_addr $I10, rxscan604_loop
    rx601_cur."!mark_push"(0, rx601_pos, $I10)
  rxscan604_done:
.annotate "line", 283
  # rx subrule "ws" subtype=method negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."ws"()
    unless $P10, rx601_fail
    rx601_pos = $P10."pos"()
.annotate "line", 284
  # rx rxquantr606 ** 0..1
    set_addr $I612, rxquantr606_done
    rx601_cur."!mark_push"(0, rx601_pos, $I612)
  rxquantr606_loop:
  # rx subrule "ws" subtype=method negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."ws"()
    unless $P10, rx601_fail
    rx601_pos = $P10."pos"()
  # rx subcapture "sigil"
    set_addr $I10, rxcap_610_fail
    rx601_cur."!mark_push"(0, rx601_pos, $I10)
  # rx rxquantr608 ** 0..1
    set_addr $I609, rxquantr608_done
    rx601_cur."!mark_push"(0, rx601_pos, $I609)
  rxquantr608_loop:
  # rx literal  "&"
    add $I11, rx601_pos, 1
    gt $I11, rx601_eos, rx601_fail
    sub $I11, rx601_pos, rx601_off
    substr $S10, rx601_tgt, $I11, 1
    ne $S10, "&", rx601_fail
    add rx601_pos, 1
    (rx601_rep) = rx601_cur."!mark_commit"($I609)
  rxquantr608_done:
    set_addr $I10, rxcap_610_fail
    ($I12, $I11) = rx601_cur."!mark_peek"($I10)
    rx601_cur."!cursor_pos"($I11)
    ($P10) = rx601_cur."!cursor_start"()
    $P10."!cursor_pass"(rx601_pos, "")
    rx601_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_610_done
  rxcap_610_fail:
    goto rx601_fail
  rxcap_610_done:
  # rx subrule "deflongname" subtype=capture negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."deflongname"()
    unless $P10, rx601_fail
    rx601_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx601_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."ws"()
    unless $P10, rx601_fail
    rx601_pos = $P10."pos"()
    (rx601_rep) = rx601_cur."!mark_commit"($I612)
  rxquantr606_done:
  # rx subrule "ws" subtype=method negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."ws"()
    unless $P10, rx601_fail
    rx601_pos = $P10."pos"()
.annotate "line", 285
  # rx subrule "newpad" subtype=method negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."newpad"()
    unless $P10, rx601_fail
    rx601_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."ws"()
    unless $P10, rx601_fail
    rx601_pos = $P10."pos"()
  alt615_0:
.annotate "line", 286
    set_addr $I10, alt615_1
    rx601_cur."!mark_push"(0, rx601_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."ws"()
    unless $P10, rx601_fail
    rx601_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx601_pos, 1
    gt $I11, rx601_eos, rx601_fail
    sub $I11, rx601_pos, rx601_off
    substr $S10, rx601_tgt, $I11, 1
    ne $S10, "(", rx601_fail
    add rx601_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."ws"()
    unless $P10, rx601_fail
    rx601_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."signature"()
    unless $P10, rx601_fail
    rx601_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx601_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."ws"()
    unless $P10, rx601_fail
    rx601_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx601_pos, 1
    gt $I11, rx601_eos, rx601_fail
    sub $I11, rx601_pos, rx601_off
    substr $S10, rx601_tgt, $I11, 1
    ne $S10, ")", rx601_fail
    add rx601_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."ws"()
    unless $P10, rx601_fail
    rx601_pos = $P10."pos"()
    goto alt615_end
  alt615_1:
.annotate "line", 287
  # rx subrule "ws" subtype=method negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."ws"()
    unless $P10, rx601_fail
    rx601_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx601_fail
    rx601_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."ws"()
    unless $P10, rx601_fail
    rx601_pos = $P10."pos"()
  alt615_end:
  # rx subrule "ws" subtype=method negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."ws"()
    unless $P10, rx601_fail
    rx601_pos = $P10."pos"()
.annotate "line", 288
  # rx subrule "blockoid" subtype=capture negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."blockoid"()
    unless $P10, rx601_fail
    rx601_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx601_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."ws"()
    unless $P10, rx601_fail
    rx601_pos = $P10."pos"()
.annotate "line", 283
  # rx pass
    rx601_cur."!cursor_pass"(rx601_pos, "routine_def")
    rx601_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx601_pos)
    .return (rx601_cur)
  rx601_fail:
.annotate "line", 4
    (rx601_rep, rx601_pos, $I10, $P10) = rx601_cur."!mark_fail"(0)
    lt rx601_pos, -1, rx601_done
    eq rx601_pos, -1, rx601_fail
    jump $I10
  rx601_done:
    rx601_cur."!cursor_fail"()
    rx601_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx601_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("150_1271336396.90314") :method
.annotate "line", 4
    new $P603, "ResizablePMCArray"
    push $P603, ""
    .return ($P603)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("151_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx625_tgt
    .local int rx625_pos
    .local int rx625_off
    .local int rx625_eos
    .local int rx625_rep
    .local pmc rx625_cur
    (rx625_cur, rx625_pos, rx625_tgt) = self."!cursor_start"()
    rx625_cur."!cursor_debug"("START ", "method_def")
    rx625_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx625_cur
    .local pmc match
    .lex "$/", match
    length rx625_eos, rx625_tgt
    set rx625_off, 0
    lt rx625_pos, 2, rx625_start
    sub rx625_off, rx625_pos, 1
    substr rx625_tgt, rx625_tgt, rx625_off
  rx625_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan628_done
    goto rxscan628_scan
  rxscan628_loop:
    ($P10) = rx625_cur."from"()
    inc $P10
    set rx625_pos, $P10
    ge rx625_pos, rx625_eos, rxscan628_done
  rxscan628_scan:
    set_addr $I10, rxscan628_loop
    rx625_cur."!mark_push"(0, rx625_pos, $I10)
  rxscan628_done:
.annotate "line", 291
  # rx subrule "ws" subtype=method negate=
    rx625_cur."!cursor_pos"(rx625_pos)
    $P10 = rx625_cur."ws"()
    unless $P10, rx625_fail
    rx625_pos = $P10."pos"()
.annotate "line", 292
  # rx rxquantr630 ** 0..1
    set_addr $I631, rxquantr630_done
    rx625_cur."!mark_push"(0, rx625_pos, $I631)
  rxquantr630_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx625_cur."!cursor_pos"(rx625_pos)
    $P10 = rx625_cur."deflongname"()
    unless $P10, rx625_fail
    rx625_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx625_pos = $P10."pos"()
    (rx625_rep) = rx625_cur."!mark_commit"($I631)
  rxquantr630_done:
  # rx subrule "ws" subtype=method negate=
    rx625_cur."!cursor_pos"(rx625_pos)
    $P10 = rx625_cur."ws"()
    unless $P10, rx625_fail
    rx625_pos = $P10."pos"()
.annotate "line", 293
  # rx subrule "newpad" subtype=method negate=
    rx625_cur."!cursor_pos"(rx625_pos)
    $P10 = rx625_cur."newpad"()
    unless $P10, rx625_fail
    rx625_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx625_cur."!cursor_pos"(rx625_pos)
    $P10 = rx625_cur."ws"()
    unless $P10, rx625_fail
    rx625_pos = $P10."pos"()
  alt634_0:
.annotate "line", 294
    set_addr $I10, alt634_1
    rx625_cur."!mark_push"(0, rx625_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx625_cur."!cursor_pos"(rx625_pos)
    $P10 = rx625_cur."ws"()
    unless $P10, rx625_fail
    rx625_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx625_pos, 1
    gt $I11, rx625_eos, rx625_fail
    sub $I11, rx625_pos, rx625_off
    substr $S10, rx625_tgt, $I11, 1
    ne $S10, "(", rx625_fail
    add rx625_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx625_cur."!cursor_pos"(rx625_pos)
    $P10 = rx625_cur."ws"()
    unless $P10, rx625_fail
    rx625_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx625_cur."!cursor_pos"(rx625_pos)
    $P10 = rx625_cur."signature"()
    unless $P10, rx625_fail
    rx625_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx625_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx625_cur."!cursor_pos"(rx625_pos)
    $P10 = rx625_cur."ws"()
    unless $P10, rx625_fail
    rx625_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx625_pos, 1
    gt $I11, rx625_eos, rx625_fail
    sub $I11, rx625_pos, rx625_off
    substr $S10, rx625_tgt, $I11, 1
    ne $S10, ")", rx625_fail
    add rx625_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx625_cur."!cursor_pos"(rx625_pos)
    $P10 = rx625_cur."ws"()
    unless $P10, rx625_fail
    rx625_pos = $P10."pos"()
    goto alt634_end
  alt634_1:
.annotate "line", 295
  # rx subrule "ws" subtype=method negate=
    rx625_cur."!cursor_pos"(rx625_pos)
    $P10 = rx625_cur."ws"()
    unless $P10, rx625_fail
    rx625_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx625_cur."!cursor_pos"(rx625_pos)
    $P10 = rx625_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx625_fail
    rx625_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx625_cur."!cursor_pos"(rx625_pos)
    $P10 = rx625_cur."ws"()
    unless $P10, rx625_fail
    rx625_pos = $P10."pos"()
  alt634_end:
  # rx subrule "ws" subtype=method negate=
    rx625_cur."!cursor_pos"(rx625_pos)
    $P10 = rx625_cur."ws"()
    unless $P10, rx625_fail
    rx625_pos = $P10."pos"()
.annotate "line", 296
  # rx subrule "blockoid" subtype=capture negate=
    rx625_cur."!cursor_pos"(rx625_pos)
    $P10 = rx625_cur."blockoid"()
    unless $P10, rx625_fail
    rx625_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx625_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx625_cur."!cursor_pos"(rx625_pos)
    $P10 = rx625_cur."ws"()
    unless $P10, rx625_fail
    rx625_pos = $P10."pos"()
.annotate "line", 291
  # rx pass
    rx625_cur."!cursor_pass"(rx625_pos, "method_def")
    rx625_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx625_pos)
    .return (rx625_cur)
  rx625_fail:
.annotate "line", 4
    (rx625_rep, rx625_pos, $I10, $P10) = rx625_cur."!mark_fail"(0)
    lt rx625_pos, -1, rx625_done
    eq rx625_pos, -1, rx625_fail
    jump $I10
  rx625_done:
    rx625_cur."!cursor_fail"()
    rx625_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx625_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("152_1271336396.90314") :method
.annotate "line", 4
    new $P627, "ResizablePMCArray"
    push $P627, ""
    .return ($P627)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("153_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx644_tgt
    .local int rx644_pos
    .local int rx644_off
    .local int rx644_eos
    .local int rx644_rep
    .local pmc rx644_cur
    (rx644_cur, rx644_pos, rx644_tgt) = self."!cursor_start"()
    rx644_cur."!cursor_debug"("START ", "signature")
    rx644_cur."!cursor_caparray"("parameter")
    .lex unicode:"$\x{a2}", rx644_cur
    .local pmc match
    .lex "$/", match
    length rx644_eos, rx644_tgt
    set rx644_off, 0
    lt rx644_pos, 2, rx644_start
    sub rx644_off, rx644_pos, 1
    substr rx644_tgt, rx644_tgt, rx644_off
  rx644_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan647_done
    goto rxscan647_scan
  rxscan647_loop:
    ($P10) = rx644_cur."from"()
    inc $P10
    set rx644_pos, $P10
    ge rx644_pos, rx644_eos, rxscan647_done
  rxscan647_scan:
    set_addr $I10, rxscan647_loop
    rx644_cur."!mark_push"(0, rx644_pos, $I10)
  rxscan647_done:
.annotate "line", 299
  # rx rxquantr648 ** 0..1
    set_addr $I651, rxquantr648_done
    rx644_cur."!mark_push"(0, rx644_pos, $I651)
  rxquantr648_loop:
  # rx rxquantr649 ** 1..*
    set_addr $I650, rxquantr649_done
    rx644_cur."!mark_push"(0, -1, $I650)
  rxquantr649_loop:
  # rx subrule "ws" subtype=method negate=
    rx644_cur."!cursor_pos"(rx644_pos)
    $P10 = rx644_cur."ws"()
    unless $P10, rx644_fail
    rx644_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx644_cur."!cursor_pos"(rx644_pos)
    $P10 = rx644_cur."parameter"()
    unless $P10, rx644_fail
    rx644_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx644_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx644_cur."!cursor_pos"(rx644_pos)
    $P10 = rx644_cur."ws"()
    unless $P10, rx644_fail
    rx644_pos = $P10."pos"()
    (rx644_rep) = rx644_cur."!mark_commit"($I650)
    rx644_cur."!mark_push"(rx644_rep, rx644_pos, $I650)
  # rx literal  ","
    add $I11, rx644_pos, 1
    gt $I11, rx644_eos, rx644_fail
    sub $I11, rx644_pos, rx644_off
    substr $S10, rx644_tgt, $I11, 1
    ne $S10, ",", rx644_fail
    add rx644_pos, 1
    goto rxquantr649_loop
  rxquantr649_done:
    (rx644_rep) = rx644_cur."!mark_commit"($I651)
  rxquantr648_done:
  # rx pass
    rx644_cur."!cursor_pass"(rx644_pos, "signature")
    rx644_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx644_pos)
    .return (rx644_cur)
  rx644_fail:
.annotate "line", 4
    (rx644_rep, rx644_pos, $I10, $P10) = rx644_cur."!mark_fail"(0)
    lt rx644_pos, -1, rx644_done
    eq rx644_pos, -1, rx644_fail
    jump $I10
  rx644_done:
    rx644_cur."!cursor_fail"()
    rx644_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx644_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("154_1271336396.90314") :method
.annotate "line", 4
    new $P646, "ResizablePMCArray"
    push $P646, ""
    .return ($P646)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("155_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx653_tgt
    .local int rx653_pos
    .local int rx653_off
    .local int rx653_eos
    .local int rx653_rep
    .local pmc rx653_cur
    (rx653_cur, rx653_pos, rx653_tgt) = self."!cursor_start"()
    rx653_cur."!cursor_debug"("START ", "parameter")
    rx653_cur."!cursor_caparray"("default_value")
    .lex unicode:"$\x{a2}", rx653_cur
    .local pmc match
    .lex "$/", match
    length rx653_eos, rx653_tgt
    set rx653_off, 0
    lt rx653_pos, 2, rx653_start
    sub rx653_off, rx653_pos, 1
    substr rx653_tgt, rx653_tgt, rx653_off
  rx653_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan659_done
    goto rxscan659_scan
  rxscan659_loop:
    ($P10) = rx653_cur."from"()
    inc $P10
    set rx653_pos, $P10
    ge rx653_pos, rx653_eos, rxscan659_done
  rxscan659_scan:
    set_addr $I10, rxscan659_loop
    rx653_cur."!mark_push"(0, rx653_pos, $I10)
  rxscan659_done:
  alt660_0:
.annotate "line", 302
    set_addr $I10, alt660_1
    rx653_cur."!mark_push"(0, rx653_pos, $I10)
.annotate "line", 303
  # rx subcapture "quant"
    set_addr $I10, rxcap_661_fail
    rx653_cur."!mark_push"(0, rx653_pos, $I10)
  # rx literal  "*"
    add $I11, rx653_pos, 1
    gt $I11, rx653_eos, rx653_fail
    sub $I11, rx653_pos, rx653_off
    substr $S10, rx653_tgt, $I11, 1
    ne $S10, "*", rx653_fail
    add rx653_pos, 1
    set_addr $I10, rxcap_661_fail
    ($I12, $I11) = rx653_cur."!mark_peek"($I10)
    rx653_cur."!cursor_pos"($I11)
    ($P10) = rx653_cur."!cursor_start"()
    $P10."!cursor_pass"(rx653_pos, "")
    rx653_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_661_done
  rxcap_661_fail:
    goto rx653_fail
  rxcap_661_done:
  # rx subrule "param_var" subtype=capture negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."param_var"()
    unless $P10, rx653_fail
    rx653_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx653_pos = $P10."pos"()
    goto alt660_end
  alt660_1:
  alt662_0:
.annotate "line", 304
    set_addr $I10, alt662_1
    rx653_cur."!mark_push"(0, rx653_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."param_var"()
    unless $P10, rx653_fail
    rx653_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx653_pos = $P10."pos"()
    goto alt662_end
  alt662_1:
  # rx subrule "named_param" subtype=capture negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."named_param"()
    unless $P10, rx653_fail
    rx653_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx653_pos = $P10."pos"()
  alt662_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_664_fail
    rx653_cur."!mark_push"(0, rx653_pos, $I10)
  alt663_0:
    set_addr $I10, alt663_1
    rx653_cur."!mark_push"(0, rx653_pos, $I10)
  # rx literal  "?"
    add $I11, rx653_pos, 1
    gt $I11, rx653_eos, rx653_fail
    sub $I11, rx653_pos, rx653_off
    substr $S10, rx653_tgt, $I11, 1
    ne $S10, "?", rx653_fail
    add rx653_pos, 1
    goto alt663_end
  alt663_1:
    set_addr $I10, alt663_2
    rx653_cur."!mark_push"(0, rx653_pos, $I10)
  # rx literal  "!"
    add $I11, rx653_pos, 1
    gt $I11, rx653_eos, rx653_fail
    sub $I11, rx653_pos, rx653_off
    substr $S10, rx653_tgt, $I11, 1
    ne $S10, "!", rx653_fail
    add rx653_pos, 1
    goto alt663_end
  alt663_2:
  alt663_end:
    set_addr $I10, rxcap_664_fail
    ($I12, $I11) = rx653_cur."!mark_peek"($I10)
    rx653_cur."!cursor_pos"($I11)
    ($P10) = rx653_cur."!cursor_start"()
    $P10."!cursor_pass"(rx653_pos, "")
    rx653_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_664_done
  rxcap_664_fail:
    goto rx653_fail
  rxcap_664_done:
  alt660_end:
.annotate "line", 306
  # rx rxquantr665 ** 0..1
    set_addr $I666, rxquantr665_done
    rx653_cur."!mark_push"(0, rx653_pos, $I666)
  rxquantr665_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."default_value"()
    unless $P10, rx653_fail
    rx653_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("default_value")
    rx653_pos = $P10."pos"()
    (rx653_rep) = rx653_cur."!mark_commit"($I666)
  rxquantr665_done:
.annotate "line", 301
  # rx pass
    rx653_cur."!cursor_pass"(rx653_pos, "parameter")
    rx653_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx653_pos)
    .return (rx653_cur)
  rx653_fail:
.annotate "line", 4
    (rx653_rep, rx653_pos, $I10, $P10) = rx653_cur."!mark_fail"(0)
    lt rx653_pos, -1, rx653_done
    eq rx653_pos, -1, rx653_fail
    jump $I10
  rx653_done:
    rx653_cur."!cursor_fail"()
    rx653_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx653_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("156_1271336396.90314") :method
.annotate "line", 4
    $P655 = self."!PREFIX__!subrule"("named_param", "")
    $P656 = self."!PREFIX__!subrule"("param_var", "")
    $P657 = self."!PREFIX__!subrule"("param_var", "*")
    new $P658, "ResizablePMCArray"
    push $P658, $P655
    push $P658, $P656
    push $P658, $P657
    .return ($P658)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("157_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx668_tgt
    .local int rx668_pos
    .local int rx668_off
    .local int rx668_eos
    .local int rx668_rep
    .local pmc rx668_cur
    (rx668_cur, rx668_pos, rx668_tgt) = self."!cursor_start"()
    rx668_cur."!cursor_debug"("START ", "param_var")
    rx668_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx668_cur
    .local pmc match
    .lex "$/", match
    length rx668_eos, rx668_tgt
    set rx668_off, 0
    lt rx668_pos, 2, rx668_start
    sub rx668_off, rx668_pos, 1
    substr rx668_tgt, rx668_tgt, rx668_off
  rx668_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan672_done
    goto rxscan672_scan
  rxscan672_loop:
    ($P10) = rx668_cur."from"()
    inc $P10
    set rx668_pos, $P10
    ge rx668_pos, rx668_eos, rxscan672_done
  rxscan672_scan:
    set_addr $I10, rxscan672_loop
    rx668_cur."!mark_push"(0, rx668_pos, $I10)
  rxscan672_done:
.annotate "line", 310
  # rx subrule "sigil" subtype=capture negate=
    rx668_cur."!cursor_pos"(rx668_pos)
    $P10 = rx668_cur."sigil"()
    unless $P10, rx668_fail
    rx668_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx668_pos = $P10."pos"()
  # rx rxquantr673 ** 0..1
    set_addr $I674, rxquantr673_done
    rx668_cur."!mark_push"(0, rx668_pos, $I674)
  rxquantr673_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx668_cur."!cursor_pos"(rx668_pos)
    $P10 = rx668_cur."twigil"()
    unless $P10, rx668_fail
    rx668_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx668_pos = $P10."pos"()
    (rx668_rep) = rx668_cur."!mark_commit"($I674)
  rxquantr673_done:
  alt675_0:
.annotate "line", 311
    set_addr $I10, alt675_1
    rx668_cur."!mark_push"(0, rx668_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx668_cur."!cursor_pos"(rx668_pos)
    $P10 = rx668_cur."ident"()
    unless $P10, rx668_fail
    rx668_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx668_pos = $P10."pos"()
    goto alt675_end
  alt675_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_676_fail
    rx668_cur."!mark_push"(0, rx668_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx668_pos, rx668_eos, rx668_fail
    sub $I10, rx668_pos, rx668_off
    substr $S10, rx668_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx668_fail
    inc rx668_pos
    set_addr $I10, rxcap_676_fail
    ($I12, $I11) = rx668_cur."!mark_peek"($I10)
    rx668_cur."!cursor_pos"($I11)
    ($P10) = rx668_cur."!cursor_start"()
    $P10."!cursor_pass"(rx668_pos, "")
    rx668_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_676_done
  rxcap_676_fail:
    goto rx668_fail
  rxcap_676_done:
  alt675_end:
.annotate "line", 309
  # rx pass
    rx668_cur."!cursor_pass"(rx668_pos, "param_var")
    rx668_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx668_pos)
    .return (rx668_cur)
  rx668_fail:
.annotate "line", 4
    (rx668_rep, rx668_pos, $I10, $P10) = rx668_cur."!mark_fail"(0)
    lt rx668_pos, -1, rx668_done
    eq rx668_pos, -1, rx668_fail
    jump $I10
  rx668_done:
    rx668_cur."!cursor_fail"()
    rx668_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx668_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("158_1271336396.90314") :method
.annotate "line", 4
    $P670 = self."!PREFIX__!subrule"("sigil", "")
    new $P671, "ResizablePMCArray"
    push $P671, $P670
    .return ($P671)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("159_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx678_tgt
    .local int rx678_pos
    .local int rx678_off
    .local int rx678_eos
    .local int rx678_rep
    .local pmc rx678_cur
    (rx678_cur, rx678_pos, rx678_tgt) = self."!cursor_start"()
    rx678_cur."!cursor_debug"("START ", "named_param")
    .lex unicode:"$\x{a2}", rx678_cur
    .local pmc match
    .lex "$/", match
    length rx678_eos, rx678_tgt
    set rx678_off, 0
    lt rx678_pos, 2, rx678_start
    sub rx678_off, rx678_pos, 1
    substr rx678_tgt, rx678_tgt, rx678_off
  rx678_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan682_done
    goto rxscan682_scan
  rxscan682_loop:
    ($P10) = rx678_cur."from"()
    inc $P10
    set rx678_pos, $P10
    ge rx678_pos, rx678_eos, rxscan682_done
  rxscan682_scan:
    set_addr $I10, rxscan682_loop
    rx678_cur."!mark_push"(0, rx678_pos, $I10)
  rxscan682_done:
.annotate "line", 315
  # rx literal  ":"
    add $I11, rx678_pos, 1
    gt $I11, rx678_eos, rx678_fail
    sub $I11, rx678_pos, rx678_off
    substr $S10, rx678_tgt, $I11, 1
    ne $S10, ":", rx678_fail
    add rx678_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx678_cur."!cursor_pos"(rx678_pos)
    $P10 = rx678_cur."param_var"()
    unless $P10, rx678_fail
    rx678_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx678_pos = $P10."pos"()
.annotate "line", 314
  # rx pass
    rx678_cur."!cursor_pass"(rx678_pos, "named_param")
    rx678_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx678_pos)
    .return (rx678_cur)
  rx678_fail:
.annotate "line", 4
    (rx678_rep, rx678_pos, $I10, $P10) = rx678_cur."!mark_fail"(0)
    lt rx678_pos, -1, rx678_done
    eq rx678_pos, -1, rx678_fail
    jump $I10
  rx678_done:
    rx678_cur."!cursor_fail"()
    rx678_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx678_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("160_1271336396.90314") :method
.annotate "line", 4
    $P680 = self."!PREFIX__!subrule"("param_var", ":")
    new $P681, "ResizablePMCArray"
    push $P681, $P680
    .return ($P681)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("161_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx684_tgt
    .local int rx684_pos
    .local int rx684_off
    .local int rx684_eos
    .local int rx684_rep
    .local pmc rx684_cur
    (rx684_cur, rx684_pos, rx684_tgt) = self."!cursor_start"()
    rx684_cur."!cursor_debug"("START ", "default_value")
    .lex unicode:"$\x{a2}", rx684_cur
    .local pmc match
    .lex "$/", match
    length rx684_eos, rx684_tgt
    set rx684_off, 0
    lt rx684_pos, 2, rx684_start
    sub rx684_off, rx684_pos, 1
    substr rx684_tgt, rx684_tgt, rx684_off
  rx684_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan687_done
    goto rxscan687_scan
  rxscan687_loop:
    ($P10) = rx684_cur."from"()
    inc $P10
    set rx684_pos, $P10
    ge rx684_pos, rx684_eos, rxscan687_done
  rxscan687_scan:
    set_addr $I10, rxscan687_loop
    rx684_cur."!mark_push"(0, rx684_pos, $I10)
  rxscan687_done:
.annotate "line", 318
  # rx subrule "ws" subtype=method negate=
    rx684_cur."!cursor_pos"(rx684_pos)
    $P10 = rx684_cur."ws"()
    unless $P10, rx684_fail
    rx684_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx684_pos, 1
    gt $I11, rx684_eos, rx684_fail
    sub $I11, rx684_pos, rx684_off
    substr $S10, rx684_tgt, $I11, 1
    ne $S10, "=", rx684_fail
    add rx684_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx684_cur."!cursor_pos"(rx684_pos)
    $P10 = rx684_cur."ws"()
    unless $P10, rx684_fail
    rx684_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx684_cur."!cursor_pos"(rx684_pos)
    $P10 = rx684_cur."EXPR"("i=")
    unless $P10, rx684_fail
    rx684_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx684_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx684_cur."!cursor_pos"(rx684_pos)
    $P10 = rx684_cur."ws"()
    unless $P10, rx684_fail
    rx684_pos = $P10."pos"()
  # rx pass
    rx684_cur."!cursor_pass"(rx684_pos, "default_value")
    rx684_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx684_pos)
    .return (rx684_cur)
  rx684_fail:
.annotate "line", 4
    (rx684_rep, rx684_pos, $I10, $P10) = rx684_cur."!mark_fail"(0)
    lt rx684_pos, -1, rx684_done
    eq rx684_pos, -1, rx684_fail
    jump $I10
  rx684_done:
    rx684_cur."!cursor_fail"()
    rx684_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx684_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("162_1271336396.90314") :method
.annotate "line", 4
    new $P686, "ResizablePMCArray"
    push $P686, ""
    .return ($P686)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("163_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx692_tgt
    .local int rx692_pos
    .local int rx692_off
    .local int rx692_eos
    .local int rx692_rep
    .local pmc rx692_cur
    (rx692_cur, rx692_pos, rx692_tgt) = self."!cursor_start"()
    rx692_cur."!cursor_debug"("START ", "regex_declarator")
    rx692_cur."!cursor_caparray"("signature")
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
    ne $I10, -1, rxscan695_done
    goto rxscan695_scan
  rxscan695_loop:
    ($P10) = rx692_cur."from"()
    inc $P10
    set rx692_pos, $P10
    ge rx692_pos, rx692_eos, rxscan695_done
  rxscan695_scan:
    set_addr $I10, rxscan695_loop
    rx692_cur."!mark_push"(0, rx692_pos, $I10)
  rxscan695_done:
.annotate "line", 320
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
  alt697_0:
.annotate "line", 321
    set_addr $I10, alt697_1
    rx692_cur."!mark_push"(0, rx692_pos, $I10)
.annotate "line", 322
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_699_fail
    rx692_cur."!mark_push"(0, rx692_pos, $I10)
  # rx literal  "proto"
    add $I11, rx692_pos, 5
    gt $I11, rx692_eos, rx692_fail
    sub $I11, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I11, 5
    ne $S10, "proto", rx692_fail
    add rx692_pos, 5
    set_addr $I10, rxcap_699_fail
    ($I12, $I11) = rx692_cur."!mark_peek"($I10)
    rx692_cur."!cursor_pos"($I11)
    ($P10) = rx692_cur."!cursor_start"()
    $P10."!cursor_pass"(rx692_pos, "")
    rx692_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_699_done
  rxcap_699_fail:
    goto rx692_fail
  rxcap_699_done:
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
  alt701_0:
    set_addr $I10, alt701_1
    rx692_cur."!mark_push"(0, rx692_pos, $I10)
  # rx literal  "regex"
    add $I11, rx692_pos, 5
    gt $I11, rx692_eos, rx692_fail
    sub $I11, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I11, 5
    ne $S10, "regex", rx692_fail
    add rx692_pos, 5
    goto alt701_end
  alt701_1:
    set_addr $I10, alt701_2
    rx692_cur."!mark_push"(0, rx692_pos, $I10)
  # rx literal  "token"
    add $I11, rx692_pos, 5
    gt $I11, rx692_eos, rx692_fail
    sub $I11, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I11, 5
    ne $S10, "token", rx692_fail
    add rx692_pos, 5
    goto alt701_end
  alt701_2:
  # rx literal  "rule"
    add $I11, rx692_pos, 4
    gt $I11, rx692_eos, rx692_fail
    sub $I11, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I11, 4
    ne $S10, "rule", rx692_fail
    add rx692_pos, 4
  alt701_end:
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
.annotate "line", 323
  # rx subrule "deflongname" subtype=capture negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."deflongname"()
    unless $P10, rx692_fail
    rx692_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx692_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
  alt704_0:
.annotate "line", 324
    set_addr $I10, alt704_1
    rx692_cur."!mark_push"(0, rx692_pos, $I10)
.annotate "line", 325
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
  # rx literal  "{"
    add $I11, rx692_pos, 1
    gt $I11, rx692_eos, rx692_fail
    sub $I11, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I11, 1
    ne $S10, "{", rx692_fail
    add rx692_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx692_pos, 5
    gt $I11, rx692_eos, rx692_fail
    sub $I11, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I11, 5
    ne $S10, "<...>", rx692_fail
    add rx692_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx692_pos, 1
    gt $I11, rx692_eos, rx692_fail
    sub $I11, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I11, 1
    ne $S10, "}", rx692_fail
    add rx692_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ENDSTMT"()
    unless $P10, rx692_fail
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
    goto alt704_end
  alt704_1:
.annotate "line", 326
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."panic"("Proto regex body must be <...>")
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
  alt704_end:
.annotate "line", 327
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
.annotate "line", 322
    goto alt697_end
  alt697_1:
.annotate "line", 328
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_714_fail
    rx692_cur."!mark_push"(0, rx692_pos, $I10)
  alt713_0:
    set_addr $I10, alt713_1
    rx692_cur."!mark_push"(0, rx692_pos, $I10)
  # rx literal  "regex"
    add $I11, rx692_pos, 5
    gt $I11, rx692_eos, rx692_fail
    sub $I11, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I11, 5
    ne $S10, "regex", rx692_fail
    add rx692_pos, 5
    goto alt713_end
  alt713_1:
    set_addr $I10, alt713_2
    rx692_cur."!mark_push"(0, rx692_pos, $I10)
  # rx literal  "token"
    add $I11, rx692_pos, 5
    gt $I11, rx692_eos, rx692_fail
    sub $I11, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I11, 5
    ne $S10, "token", rx692_fail
    add rx692_pos, 5
    goto alt713_end
  alt713_2:
  # rx literal  "rule"
    add $I11, rx692_pos, 4
    gt $I11, rx692_eos, rx692_fail
    sub $I11, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I11, 4
    ne $S10, "rule", rx692_fail
    add rx692_pos, 4
  alt713_end:
    set_addr $I10, rxcap_714_fail
    ($I12, $I11) = rx692_cur."!mark_peek"($I10)
    rx692_cur."!cursor_pos"($I11)
    ($P10) = rx692_cur."!cursor_start"()
    $P10."!cursor_pass"(rx692_pos, "")
    rx692_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_714_done
  rxcap_714_fail:
    goto rx692_fail
  rxcap_714_done:
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
.annotate "line", 329
  # rx subrule "deflongname" subtype=capture negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."deflongname"()
    unless $P10, rx692_fail
    rx692_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx692_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
.annotate "line", 330
  # rx subrule "newpad" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."newpad"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
.annotate "line", 331
  # rx rxquantr718 ** 0..1
    set_addr $I723, rxquantr718_done
    rx692_cur."!mark_push"(0, rx692_pos, $I723)
  rxquantr718_loop:
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx692_pos, 1
    gt $I11, rx692_eos, rx692_fail
    sub $I11, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I11, 1
    ne $S10, "(", rx692_fail
    add rx692_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."signature"()
    unless $P10, rx692_fail
    rx692_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx692_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx692_pos, 1
    gt $I11, rx692_eos, rx692_fail
    sub $I11, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I11, 1
    ne $S10, ")", rx692_fail
    add rx692_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
    (rx692_rep) = rx692_cur."!mark_commit"($I723)
  rxquantr718_done:
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
.annotate "line", 332
  # rx reduce name="regex_declarator" key="open"
    rx692_cur."!cursor_pos"(rx692_pos)
    rx692_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
.annotate "line", 333
  # rx literal  "{"
    add $I11, rx692_pos, 1
    gt $I11, rx692_eos, rx692_fail
    sub $I11, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I11, 1
    ne $S10, "{", rx692_fail
    add rx692_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."LANG"("Regex", "nibbler")
    unless $P10, rx692_fail
    rx692_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx692_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx692_pos, 1
    gt $I11, rx692_eos, rx692_fail
    sub $I11, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I11, 1
    ne $S10, "}", rx692_fail
    add rx692_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ENDSTMT"()
    unless $P10, rx692_fail
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
  alt697_end:
.annotate "line", 334
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
.annotate "line", 320
  # rx pass
    rx692_cur."!cursor_pass"(rx692_pos, "regex_declarator")
    rx692_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx692_pos)
    .return (rx692_cur)
  rx692_fail:
.annotate "line", 4
    (rx692_rep, rx692_pos, $I10, $P10) = rx692_cur."!mark_fail"(0)
    lt rx692_pos, -1, rx692_done
    eq rx692_pos, -1, rx692_fail
    jump $I10
  rx692_done:
    rx692_cur."!cursor_fail"()
    rx692_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx692_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("164_1271336396.90314") :method
.annotate "line", 4
    new $P694, "ResizablePMCArray"
    push $P694, ""
    .return ($P694)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("165_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx729_tgt
    .local int rx729_pos
    .local int rx729_off
    .local int rx729_eos
    .local int rx729_rep
    .local pmc rx729_cur
    (rx729_cur, rx729_pos, rx729_tgt) = self."!cursor_start"()
    rx729_cur."!cursor_debug"("START ", "dotty")
    rx729_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx729_cur
    .local pmc match
    .lex "$/", match
    length rx729_eos, rx729_tgt
    set rx729_off, 0
    lt rx729_pos, 2, rx729_start
    sub rx729_off, rx729_pos, 1
    substr rx729_tgt, rx729_tgt, rx729_off
  rx729_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan733_done
    goto rxscan733_scan
  rxscan733_loop:
    ($P10) = rx729_cur."from"()
    inc $P10
    set rx729_pos, $P10
    ge rx729_pos, rx729_eos, rxscan733_done
  rxscan733_scan:
    set_addr $I10, rxscan733_loop
    rx729_cur."!mark_push"(0, rx729_pos, $I10)
  rxscan733_done:
.annotate "line", 338
  # rx literal  "."
    add $I11, rx729_pos, 1
    gt $I11, rx729_eos, rx729_fail
    sub $I11, rx729_pos, rx729_off
    substr $S10, rx729_tgt, $I11, 1
    ne $S10, ".", rx729_fail
    add rx729_pos, 1
  alt734_0:
.annotate "line", 339
    set_addr $I10, alt734_1
    rx729_cur."!mark_push"(0, rx729_pos, $I10)
  # rx subrule "identifier" subtype=capture negate=
    rx729_cur."!cursor_pos"(rx729_pos)
    $P10 = rx729_cur."identifier"()
    unless $P10, rx729_fail
    rx729_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=identifier")
    rx729_pos = $P10."pos"()
    goto alt734_end
  alt734_1:
.annotate "line", 340
  # rx enumcharlist negate=0 zerowidth
    ge rx729_pos, rx729_eos, rx729_fail
    sub $I10, rx729_pos, rx729_off
    substr $S10, rx729_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx729_fail
  # rx subrule "quote" subtype=capture negate=
    rx729_cur."!cursor_pos"(rx729_pos)
    $P10 = rx729_cur."quote"()
    unless $P10, rx729_fail
    rx729_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx729_pos = $P10."pos"()
  alt735_0:
.annotate "line", 341
    set_addr $I10, alt735_1
    rx729_cur."!mark_push"(0, rx729_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx729_pos, rx729_eos, rx729_fail
    sub $I10, rx729_pos, rx729_off
    substr $S10, rx729_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx729_fail
    goto alt735_end
  alt735_1:
  # rx subrule "panic" subtype=method negate=
    rx729_cur."!cursor_pos"(rx729_pos)
    $P10 = rx729_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx729_fail
    rx729_pos = $P10."pos"()
  alt735_end:
  alt734_end:
.annotate "line", 347
  # rx rxquantr736 ** 0..1
    set_addr $I738, rxquantr736_done
    rx729_cur."!mark_push"(0, rx729_pos, $I738)
  rxquantr736_loop:
  alt737_0:
.annotate "line", 344
    set_addr $I10, alt737_1
    rx729_cur."!mark_push"(0, rx729_pos, $I10)
.annotate "line", 345
  # rx enumcharlist negate=0 zerowidth
    ge rx729_pos, rx729_eos, rx729_fail
    sub $I10, rx729_pos, rx729_off
    substr $S10, rx729_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx729_fail
  # rx subrule "args" subtype=capture negate=
    rx729_cur."!cursor_pos"(rx729_pos)
    $P10 = rx729_cur."args"()
    unless $P10, rx729_fail
    rx729_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx729_pos = $P10."pos"()
    goto alt737_end
  alt737_1:
.annotate "line", 346
  # rx literal  ":"
    add $I11, rx729_pos, 1
    gt $I11, rx729_eos, rx729_fail
    sub $I11, rx729_pos, rx729_off
    substr $S10, rx729_tgt, $I11, 1
    ne $S10, ":", rx729_fail
    add rx729_pos, 1
  # rx charclass s
    ge rx729_pos, rx729_eos, rx729_fail
    sub $I10, rx729_pos, rx729_off
    is_cclass $I11, 32, rx729_tgt, $I10
    unless $I11, rx729_fail
    inc rx729_pos
  # rx subrule "arglist" subtype=capture negate=
    rx729_cur."!cursor_pos"(rx729_pos)
    $P10 = rx729_cur."arglist"()
    unless $P10, rx729_fail
    rx729_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx729_pos = $P10."pos"()
  alt737_end:
.annotate "line", 347
    (rx729_rep) = rx729_cur."!mark_commit"($I738)
  rxquantr736_done:
.annotate "line", 337
  # rx pass
    rx729_cur."!cursor_pass"(rx729_pos, "dotty")
    rx729_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx729_pos)
    .return (rx729_cur)
  rx729_fail:
.annotate "line", 4
    (rx729_rep, rx729_pos, $I10, $P10) = rx729_cur."!mark_fail"(0)
    lt rx729_pos, -1, rx729_done
    eq rx729_pos, -1, rx729_fail
    jump $I10
  rx729_done:
    rx729_cur."!cursor_fail"()
    rx729_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx729_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("166_1271336396.90314") :method
.annotate "line", 4
    $P731 = self."!PREFIX__!subrule"("longname=identifier", ".")
    new $P732, "ResizablePMCArray"
    push $P732, "'"
    push $P732, "\""
    push $P732, $P731
    .return ($P732)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("167_1271336396.90314") :method
.annotate "line", 351
    $P740 = self."!protoregex"("term")
    .return ($P740)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("168_1271336396.90314") :method
.annotate "line", 351
    $P742 = self."!PREFIX__!protoregex"("term")
    .return ($P742)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("169_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx744_tgt
    .local int rx744_pos
    .local int rx744_off
    .local int rx744_eos
    .local int rx744_rep
    .local pmc rx744_cur
    (rx744_cur, rx744_pos, rx744_tgt) = self."!cursor_start"()
    rx744_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx744_cur
    .local pmc match
    .lex "$/", match
    length rx744_eos, rx744_tgt
    set rx744_off, 0
    lt rx744_pos, 2, rx744_start
    sub rx744_off, rx744_pos, 1
    substr rx744_tgt, rx744_tgt, rx744_off
  rx744_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan747_done
    goto rxscan747_scan
  rxscan747_loop:
    ($P10) = rx744_cur."from"()
    inc $P10
    set rx744_pos, $P10
    ge rx744_pos, rx744_eos, rxscan747_done
  rxscan747_scan:
    set_addr $I10, rxscan747_loop
    rx744_cur."!mark_push"(0, rx744_pos, $I10)
  rxscan747_done:
.annotate "line", 353
  # rx subcapture "sym"
    set_addr $I10, rxcap_748_fail
    rx744_cur."!mark_push"(0, rx744_pos, $I10)
  # rx literal  "self"
    add $I11, rx744_pos, 4
    gt $I11, rx744_eos, rx744_fail
    sub $I11, rx744_pos, rx744_off
    substr $S10, rx744_tgt, $I11, 4
    ne $S10, "self", rx744_fail
    add rx744_pos, 4
    set_addr $I10, rxcap_748_fail
    ($I12, $I11) = rx744_cur."!mark_peek"($I10)
    rx744_cur."!cursor_pos"($I11)
    ($P10) = rx744_cur."!cursor_start"()
    $P10."!cursor_pass"(rx744_pos, "")
    rx744_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_748_done
  rxcap_748_fail:
    goto rx744_fail
  rxcap_748_done:
  # rxanchor rwb
    le rx744_pos, 0, rx744_fail
    sub $I10, rx744_pos, rx744_off
    is_cclass $I11, 8192, rx744_tgt, $I10
    if $I11, rx744_fail
    dec $I10
    is_cclass $I11, 8192, rx744_tgt, $I10
    unless $I11, rx744_fail
  # rx pass
    rx744_cur."!cursor_pass"(rx744_pos, "term:sym<self>")
    rx744_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx744_pos)
    .return (rx744_cur)
  rx744_fail:
.annotate "line", 4
    (rx744_rep, rx744_pos, $I10, $P10) = rx744_cur."!mark_fail"(0)
    lt rx744_pos, -1, rx744_done
    eq rx744_pos, -1, rx744_fail
    jump $I10
  rx744_done:
    rx744_cur."!cursor_fail"()
    rx744_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx744_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("170_1271336396.90314") :method
.annotate "line", 4
    new $P746, "ResizablePMCArray"
    push $P746, "self"
    .return ($P746)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("171_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx750_tgt
    .local int rx750_pos
    .local int rx750_off
    .local int rx750_eos
    .local int rx750_rep
    .local pmc rx750_cur
    (rx750_cur, rx750_pos, rx750_tgt) = self."!cursor_start"()
    rx750_cur."!cursor_debug"("START ", "term:sym<identifier>")
    .lex unicode:"$\x{a2}", rx750_cur
    .local pmc match
    .lex "$/", match
    length rx750_eos, rx750_tgt
    set rx750_off, 0
    lt rx750_pos, 2, rx750_start
    sub rx750_off, rx750_pos, 1
    substr rx750_tgt, rx750_tgt, rx750_off
  rx750_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan754_done
    goto rxscan754_scan
  rxscan754_loop:
    ($P10) = rx750_cur."from"()
    inc $P10
    set rx750_pos, $P10
    ge rx750_pos, rx750_eos, rxscan754_done
  rxscan754_scan:
    set_addr $I10, rxscan754_loop
    rx750_cur."!mark_push"(0, rx750_pos, $I10)
  rxscan754_done:
.annotate "line", 356
  # rx subrule "identifier" subtype=capture negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."identifier"()
    unless $P10, rx750_fail
    rx750_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx750_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx750_pos, rx750_eos, rx750_fail
    sub $I10, rx750_pos, rx750_off
    substr $S10, rx750_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx750_fail
  # rx subrule "args" subtype=capture negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."args"()
    unless $P10, rx750_fail
    rx750_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx750_pos = $P10."pos"()
.annotate "line", 355
  # rx pass
    rx750_cur."!cursor_pass"(rx750_pos, "term:sym<identifier>")
    rx750_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx750_pos)
    .return (rx750_cur)
  rx750_fail:
.annotate "line", 4
    (rx750_rep, rx750_pos, $I10, $P10) = rx750_cur."!mark_fail"(0)
    lt rx750_pos, -1, rx750_done
    eq rx750_pos, -1, rx750_fail
    jump $I10
  rx750_done:
    rx750_cur."!cursor_fail"()
    rx750_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx750_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("172_1271336396.90314") :method
.annotate "line", 4
    $P752 = self."!PREFIX__!subrule"("identifier", "")
    new $P753, "ResizablePMCArray"
    push $P753, $P752
    .return ($P753)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("173_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx756_tgt
    .local int rx756_pos
    .local int rx756_off
    .local int rx756_eos
    .local int rx756_rep
    .local pmc rx756_cur
    (rx756_cur, rx756_pos, rx756_tgt) = self."!cursor_start"()
    rx756_cur."!cursor_debug"("START ", "term:sym<name>")
    rx756_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx756_cur
    .local pmc match
    .lex "$/", match
    length rx756_eos, rx756_tgt
    set rx756_off, 0
    lt rx756_pos, 2, rx756_start
    sub rx756_off, rx756_pos, 1
    substr rx756_tgt, rx756_tgt, rx756_off
  rx756_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan760_done
    goto rxscan760_scan
  rxscan760_loop:
    ($P10) = rx756_cur."from"()
    inc $P10
    set rx756_pos, $P10
    ge rx756_pos, rx756_eos, rxscan760_done
  rxscan760_scan:
    set_addr $I10, rxscan760_loop
    rx756_cur."!mark_push"(0, rx756_pos, $I10)
  rxscan760_done:
.annotate "line", 360
  # rx subrule "name" subtype=capture negate=
    rx756_cur."!cursor_pos"(rx756_pos)
    $P10 = rx756_cur."name"()
    unless $P10, rx756_fail
    rx756_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx756_pos = $P10."pos"()
  # rx rxquantr761 ** 0..1
    set_addr $I762, rxquantr761_done
    rx756_cur."!mark_push"(0, rx756_pos, $I762)
  rxquantr761_loop:
  # rx subrule "args" subtype=capture negate=
    rx756_cur."!cursor_pos"(rx756_pos)
    $P10 = rx756_cur."args"()
    unless $P10, rx756_fail
    rx756_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx756_pos = $P10."pos"()
    (rx756_rep) = rx756_cur."!mark_commit"($I762)
  rxquantr761_done:
.annotate "line", 359
  # rx pass
    rx756_cur."!cursor_pass"(rx756_pos, "term:sym<name>")
    rx756_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx756_pos)
    .return (rx756_cur)
  rx756_fail:
.annotate "line", 4
    (rx756_rep, rx756_pos, $I10, $P10) = rx756_cur."!mark_fail"(0)
    lt rx756_pos, -1, rx756_done
    eq rx756_pos, -1, rx756_fail
    jump $I10
  rx756_done:
    rx756_cur."!cursor_fail"()
    rx756_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx756_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("174_1271336396.90314") :method
.annotate "line", 4
    $P758 = self."!PREFIX__!subrule"("name", "")
    new $P759, "ResizablePMCArray"
    push $P759, $P758
    .return ($P759)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("175_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx764_tgt
    .local int rx764_pos
    .local int rx764_off
    .local int rx764_eos
    .local int rx764_rep
    .local pmc rx764_cur
    (rx764_cur, rx764_pos, rx764_tgt) = self."!cursor_start"()
    rx764_cur."!cursor_debug"("START ", "term:sym<pir::op>")
    rx764_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx764_cur
    .local pmc match
    .lex "$/", match
    length rx764_eos, rx764_tgt
    set rx764_off, 0
    lt rx764_pos, 2, rx764_start
    sub rx764_off, rx764_pos, 1
    substr rx764_tgt, rx764_tgt, rx764_off
  rx764_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan767_done
    goto rxscan767_scan
  rxscan767_loop:
    ($P10) = rx764_cur."from"()
    inc $P10
    set rx764_pos, $P10
    ge rx764_pos, rx764_eos, rxscan767_done
  rxscan767_scan:
    set_addr $I10, rxscan767_loop
    rx764_cur."!mark_push"(0, rx764_pos, $I10)
  rxscan767_done:
.annotate "line", 364
  # rx literal  "pir::"
    add $I11, rx764_pos, 5
    gt $I11, rx764_eos, rx764_fail
    sub $I11, rx764_pos, rx764_off
    substr $S10, rx764_tgt, $I11, 5
    ne $S10, "pir::", rx764_fail
    add rx764_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_768_fail
    rx764_cur."!mark_push"(0, rx764_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx764_pos, rx764_off
    find_not_cclass $I11, 8192, rx764_tgt, $I10, rx764_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx764_fail
    add rx764_pos, rx764_off, $I11
    set_addr $I10, rxcap_768_fail
    ($I12, $I11) = rx764_cur."!mark_peek"($I10)
    rx764_cur."!cursor_pos"($I11)
    ($P10) = rx764_cur."!cursor_start"()
    $P10."!cursor_pass"(rx764_pos, "")
    rx764_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_768_done
  rxcap_768_fail:
    goto rx764_fail
  rxcap_768_done:
  # rx rxquantr769 ** 0..1
    set_addr $I770, rxquantr769_done
    rx764_cur."!mark_push"(0, rx764_pos, $I770)
  rxquantr769_loop:
  # rx subrule "args" subtype=capture negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."args"()
    unless $P10, rx764_fail
    rx764_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx764_pos = $P10."pos"()
    (rx764_rep) = rx764_cur."!mark_commit"($I770)
  rxquantr769_done:
.annotate "line", 363
  # rx pass
    rx764_cur."!cursor_pass"(rx764_pos, "term:sym<pir::op>")
    rx764_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx764_pos)
    .return (rx764_cur)
  rx764_fail:
.annotate "line", 4
    (rx764_rep, rx764_pos, $I10, $P10) = rx764_cur."!mark_fail"(0)
    lt rx764_pos, -1, rx764_done
    eq rx764_pos, -1, rx764_fail
    jump $I10
  rx764_done:
    rx764_cur."!cursor_fail"()
    rx764_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx764_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("176_1271336396.90314") :method
.annotate "line", 4
    new $P766, "ResizablePMCArray"
    push $P766, "pir::"
    .return ($P766)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("177_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx772_tgt
    .local int rx772_pos
    .local int rx772_off
    .local int rx772_eos
    .local int rx772_rep
    .local pmc rx772_cur
    (rx772_cur, rx772_pos, rx772_tgt) = self."!cursor_start"()
    rx772_cur."!cursor_debug"("START ", "args")
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
    ne $I10, -1, rxscan776_done
    goto rxscan776_scan
  rxscan776_loop:
    ($P10) = rx772_cur."from"()
    inc $P10
    set rx772_pos, $P10
    ge rx772_pos, rx772_eos, rxscan776_done
  rxscan776_scan:
    set_addr $I10, rxscan776_loop
    rx772_cur."!mark_push"(0, rx772_pos, $I10)
  rxscan776_done:
.annotate "line", 368
  # rx literal  "("
    add $I11, rx772_pos, 1
    gt $I11, rx772_eos, rx772_fail
    sub $I11, rx772_pos, rx772_off
    substr $S10, rx772_tgt, $I11, 1
    ne $S10, "(", rx772_fail
    add rx772_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx772_cur."!cursor_pos"(rx772_pos)
    $P10 = rx772_cur."arglist"()
    unless $P10, rx772_fail
    rx772_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx772_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx772_pos, 1
    gt $I11, rx772_eos, rx772_fail
    sub $I11, rx772_pos, rx772_off
    substr $S10, rx772_tgt, $I11, 1
    ne $S10, ")", rx772_fail
    add rx772_pos, 1
  # rx pass
    rx772_cur."!cursor_pass"(rx772_pos, "args")
    rx772_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx772_pos)
    .return (rx772_cur)
  rx772_fail:
.annotate "line", 4
    (rx772_rep, rx772_pos, $I10, $P10) = rx772_cur."!mark_fail"(0)
    lt rx772_pos, -1, rx772_done
    eq rx772_pos, -1, rx772_fail
    jump $I10
  rx772_done:
    rx772_cur."!cursor_fail"()
    rx772_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx772_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("178_1271336396.90314") :method
.annotate "line", 4
    $P774 = self."!PREFIX__!subrule"("arglist", "(")
    new $P775, "ResizablePMCArray"
    push $P775, $P774
    .return ($P775)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("179_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx778_tgt
    .local int rx778_pos
    .local int rx778_off
    .local int rx778_eos
    .local int rx778_rep
    .local pmc rx778_cur
    (rx778_cur, rx778_pos, rx778_tgt) = self."!cursor_start"()
    rx778_cur."!cursor_debug"("START ", "arglist")
    .lex unicode:"$\x{a2}", rx778_cur
    .local pmc match
    .lex "$/", match
    length rx778_eos, rx778_tgt
    set rx778_off, 0
    lt rx778_pos, 2, rx778_start
    sub rx778_off, rx778_pos, 1
    substr rx778_tgt, rx778_tgt, rx778_off
  rx778_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan782_done
    goto rxscan782_scan
  rxscan782_loop:
    ($P10) = rx778_cur."from"()
    inc $P10
    set rx778_pos, $P10
    ge rx778_pos, rx778_eos, rxscan782_done
  rxscan782_scan:
    set_addr $I10, rxscan782_loop
    rx778_cur."!mark_push"(0, rx778_pos, $I10)
  rxscan782_done:
.annotate "line", 372
  # rx subrule "ws" subtype=method negate=
    rx778_cur."!cursor_pos"(rx778_pos)
    $P10 = rx778_cur."ws"()
    unless $P10, rx778_fail
    rx778_pos = $P10."pos"()
  alt783_0:
.annotate "line", 373
    set_addr $I10, alt783_1
    rx778_cur."!mark_push"(0, rx778_pos, $I10)
.annotate "line", 374
  # rx subrule "EXPR" subtype=capture negate=
    rx778_cur."!cursor_pos"(rx778_pos)
    $P10 = rx778_cur."EXPR"("f=")
    unless $P10, rx778_fail
    rx778_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx778_pos = $P10."pos"()
    goto alt783_end
  alt783_1:
  alt783_end:
.annotate "line", 371
  # rx pass
    rx778_cur."!cursor_pass"(rx778_pos, "arglist")
    rx778_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx778_pos)
    .return (rx778_cur)
  rx778_fail:
.annotate "line", 4
    (rx778_rep, rx778_pos, $I10, $P10) = rx778_cur."!mark_fail"(0)
    lt rx778_pos, -1, rx778_done
    eq rx778_pos, -1, rx778_fail
    jump $I10
  rx778_done:
    rx778_cur."!cursor_fail"()
    rx778_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx778_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("180_1271336396.90314") :method
.annotate "line", 4
    $P780 = self."!PREFIX__!subrule"("", "")
    new $P781, "ResizablePMCArray"
    push $P781, $P780
    .return ($P781)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("181_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx785_tgt
    .local int rx785_pos
    .local int rx785_off
    .local int rx785_eos
    .local int rx785_rep
    .local pmc rx785_cur
    (rx785_cur, rx785_pos, rx785_tgt) = self."!cursor_start"()
    rx785_cur."!cursor_debug"("START ", "term:sym<value>")
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
.annotate "line", 380
  # rx subrule "value" subtype=capture negate=
    rx785_cur."!cursor_pos"(rx785_pos)
    $P10 = rx785_cur."value"()
    unless $P10, rx785_fail
    rx785_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx785_pos = $P10."pos"()
  # rx pass
    rx785_cur."!cursor_pass"(rx785_pos, "term:sym<value>")
    rx785_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx785_pos)
    .return (rx785_cur)
  rx785_fail:
.annotate "line", 4
    (rx785_rep, rx785_pos, $I10, $P10) = rx785_cur."!mark_fail"(0)
    lt rx785_pos, -1, rx785_done
    eq rx785_pos, -1, rx785_fail
    jump $I10
  rx785_done:
    rx785_cur."!cursor_fail"()
    rx785_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx785_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("182_1271336396.90314") :method
.annotate "line", 4
    $P787 = self."!PREFIX__!subrule"("value", "")
    new $P788, "ResizablePMCArray"
    push $P788, $P787
    .return ($P788)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("183_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx791_tgt
    .local int rx791_pos
    .local int rx791_off
    .local int rx791_eos
    .local int rx791_rep
    .local pmc rx791_cur
    (rx791_cur, rx791_pos, rx791_tgt) = self."!cursor_start"()
    rx791_cur."!cursor_debug"("START ", "value")
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
    ne $I10, -1, rxscan796_done
    goto rxscan796_scan
  rxscan796_loop:
    ($P10) = rx791_cur."from"()
    inc $P10
    set rx791_pos, $P10
    ge rx791_pos, rx791_eos, rxscan796_done
  rxscan796_scan:
    set_addr $I10, rxscan796_loop
    rx791_cur."!mark_push"(0, rx791_pos, $I10)
  rxscan796_done:
  alt797_0:
.annotate "line", 382
    set_addr $I10, alt797_1
    rx791_cur."!mark_push"(0, rx791_pos, $I10)
.annotate "line", 383
  # rx subrule "quote" subtype=capture negate=
    rx791_cur."!cursor_pos"(rx791_pos)
    $P10 = rx791_cur."quote"()
    unless $P10, rx791_fail
    rx791_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx791_pos = $P10."pos"()
    goto alt797_end
  alt797_1:
.annotate "line", 384
  # rx subrule "number" subtype=capture negate=
    rx791_cur."!cursor_pos"(rx791_pos)
    $P10 = rx791_cur."number"()
    unless $P10, rx791_fail
    rx791_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("number")
    rx791_pos = $P10."pos"()
  alt797_end:
.annotate "line", 382
  # rx pass
    rx791_cur."!cursor_pass"(rx791_pos, "value")
    rx791_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx791_pos)
    .return (rx791_cur)
  rx791_fail:
.annotate "line", 4
    (rx791_rep, rx791_pos, $I10, $P10) = rx791_cur."!mark_fail"(0)
    lt rx791_pos, -1, rx791_done
    eq rx791_pos, -1, rx791_fail
    jump $I10
  rx791_done:
    rx791_cur."!cursor_fail"()
    rx791_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx791_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("184_1271336396.90314") :method
.annotate "line", 4
    $P793 = self."!PREFIX__!subrule"("number", "")
    $P794 = self."!PREFIX__!subrule"("quote", "")
    new $P795, "ResizablePMCArray"
    push $P795, $P793
    push $P795, $P794
    .return ($P795)
.end


.namespace ["NQP";"Grammar"]
.sub "number"  :subid("185_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx799_tgt
    .local int rx799_pos
    .local int rx799_off
    .local int rx799_eos
    .local int rx799_rep
    .local pmc rx799_cur
    (rx799_cur, rx799_pos, rx799_tgt) = self."!cursor_start"()
    rx799_cur."!cursor_debug"("START ", "number")
    .lex unicode:"$\x{a2}", rx799_cur
    .local pmc match
    .lex "$/", match
    length rx799_eos, rx799_tgt
    set rx799_off, 0
    lt rx799_pos, 2, rx799_start
    sub rx799_off, rx799_pos, 1
    substr rx799_tgt, rx799_tgt, rx799_off
  rx799_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan802_done
    goto rxscan802_scan
  rxscan802_loop:
    ($P10) = rx799_cur."from"()
    inc $P10
    set rx799_pos, $P10
    ge rx799_pos, rx799_eos, rxscan802_done
  rxscan802_scan:
    set_addr $I10, rxscan802_loop
    rx799_cur."!mark_push"(0, rx799_pos, $I10)
  rxscan802_done:
.annotate "line", 388
  # rx subcapture "sign"
    set_addr $I10, rxcap_805_fail
    rx799_cur."!mark_push"(0, rx799_pos, $I10)
  # rx rxquantr803 ** 0..1
    set_addr $I804, rxquantr803_done
    rx799_cur."!mark_push"(0, rx799_pos, $I804)
  rxquantr803_loop:
  # rx enumcharlist negate=0 
    ge rx799_pos, rx799_eos, rx799_fail
    sub $I10, rx799_pos, rx799_off
    substr $S10, rx799_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rx799_fail
    inc rx799_pos
    (rx799_rep) = rx799_cur."!mark_commit"($I804)
  rxquantr803_done:
    set_addr $I10, rxcap_805_fail
    ($I12, $I11) = rx799_cur."!mark_peek"($I10)
    rx799_cur."!cursor_pos"($I11)
    ($P10) = rx799_cur."!cursor_start"()
    $P10."!cursor_pass"(rx799_pos, "")
    rx799_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_805_done
  rxcap_805_fail:
    goto rx799_fail
  rxcap_805_done:
  alt806_0:
.annotate "line", 389
    set_addr $I10, alt806_1
    rx799_cur."!mark_push"(0, rx799_pos, $I10)
  # rx subrule "dec_number" subtype=capture negate=
    rx799_cur."!cursor_pos"(rx799_pos)
    $P10 = rx799_cur."dec_number"()
    unless $P10, rx799_fail
    rx799_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx799_pos = $P10."pos"()
    goto alt806_end
  alt806_1:
  # rx subrule "integer" subtype=capture negate=
    rx799_cur."!cursor_pos"(rx799_pos)
    $P10 = rx799_cur."integer"()
    unless $P10, rx799_fail
    rx799_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx799_pos = $P10."pos"()
  alt806_end:
.annotate "line", 387
  # rx pass
    rx799_cur."!cursor_pass"(rx799_pos, "number")
    rx799_cur."!cursor_debug"("PASS  ", "number", " at pos=", rx799_pos)
    .return (rx799_cur)
  rx799_fail:
.annotate "line", 4
    (rx799_rep, rx799_pos, $I10, $P10) = rx799_cur."!mark_fail"(0)
    lt rx799_pos, -1, rx799_done
    eq rx799_pos, -1, rx799_fail
    jump $I10
  rx799_done:
    rx799_cur."!cursor_fail"()
    rx799_cur."!cursor_debug"("FAIL  ", "number")
    .return (rx799_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__number"  :subid("186_1271336396.90314") :method
.annotate "line", 4
    new $P801, "ResizablePMCArray"
    push $P801, ""
    .return ($P801)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("187_1271336396.90314") :method
.annotate "line", 392
    $P808 = self."!protoregex"("quote")
    .return ($P808)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("188_1271336396.90314") :method
.annotate "line", 392
    $P810 = self."!PREFIX__!protoregex"("quote")
    .return ($P810)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("189_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx812_tgt
    .local int rx812_pos
    .local int rx812_off
    .local int rx812_eos
    .local int rx812_rep
    .local pmc rx812_cur
    (rx812_cur, rx812_pos, rx812_tgt) = self."!cursor_start"()
    rx812_cur."!cursor_debug"("START ", "quote:sym<apos>")
    .lex unicode:"$\x{a2}", rx812_cur
    .local pmc match
    .lex "$/", match
    length rx812_eos, rx812_tgt
    set rx812_off, 0
    lt rx812_pos, 2, rx812_start
    sub rx812_off, rx812_pos, 1
    substr rx812_tgt, rx812_tgt, rx812_off
  rx812_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan815_done
    goto rxscan815_scan
  rxscan815_loop:
    ($P10) = rx812_cur."from"()
    inc $P10
    set rx812_pos, $P10
    ge rx812_pos, rx812_eos, rxscan815_done
  rxscan815_scan:
    set_addr $I10, rxscan815_loop
    rx812_cur."!mark_push"(0, rx812_pos, $I10)
  rxscan815_done:
.annotate "line", 393
  # rx enumcharlist negate=0 zerowidth
    ge rx812_pos, rx812_eos, rx812_fail
    sub $I10, rx812_pos, rx812_off
    substr $S10, rx812_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx812_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx812_cur."!cursor_pos"(rx812_pos)
    $P10 = rx812_cur."quote_EXPR"(":q")
    unless $P10, rx812_fail
    rx812_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx812_pos = $P10."pos"()
  # rx pass
    rx812_cur."!cursor_pass"(rx812_pos, "quote:sym<apos>")
    rx812_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx812_pos)
    .return (rx812_cur)
  rx812_fail:
.annotate "line", 4
    (rx812_rep, rx812_pos, $I10, $P10) = rx812_cur."!mark_fail"(0)
    lt rx812_pos, -1, rx812_done
    eq rx812_pos, -1, rx812_fail
    jump $I10
  rx812_done:
    rx812_cur."!cursor_fail"()
    rx812_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx812_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("190_1271336396.90314") :method
.annotate "line", 4
    new $P814, "ResizablePMCArray"
    push $P814, "'"
    .return ($P814)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("191_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx817_tgt
    .local int rx817_pos
    .local int rx817_off
    .local int rx817_eos
    .local int rx817_rep
    .local pmc rx817_cur
    (rx817_cur, rx817_pos, rx817_tgt) = self."!cursor_start"()
    rx817_cur."!cursor_debug"("START ", "quote:sym<dblq>")
    .lex unicode:"$\x{a2}", rx817_cur
    .local pmc match
    .lex "$/", match
    length rx817_eos, rx817_tgt
    set rx817_off, 0
    lt rx817_pos, 2, rx817_start
    sub rx817_off, rx817_pos, 1
    substr rx817_tgt, rx817_tgt, rx817_off
  rx817_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan820_done
    goto rxscan820_scan
  rxscan820_loop:
    ($P10) = rx817_cur."from"()
    inc $P10
    set rx817_pos, $P10
    ge rx817_pos, rx817_eos, rxscan820_done
  rxscan820_scan:
    set_addr $I10, rxscan820_loop
    rx817_cur."!mark_push"(0, rx817_pos, $I10)
  rxscan820_done:
.annotate "line", 394
  # rx enumcharlist negate=0 zerowidth
    ge rx817_pos, rx817_eos, rx817_fail
    sub $I10, rx817_pos, rx817_off
    substr $S10, rx817_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx817_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx817_cur."!cursor_pos"(rx817_pos)
    $P10 = rx817_cur."quote_EXPR"(":qq")
    unless $P10, rx817_fail
    rx817_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx817_pos = $P10."pos"()
  # rx pass
    rx817_cur."!cursor_pass"(rx817_pos, "quote:sym<dblq>")
    rx817_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx817_pos)
    .return (rx817_cur)
  rx817_fail:
.annotate "line", 4
    (rx817_rep, rx817_pos, $I10, $P10) = rx817_cur."!mark_fail"(0)
    lt rx817_pos, -1, rx817_done
    eq rx817_pos, -1, rx817_fail
    jump $I10
  rx817_done:
    rx817_cur."!cursor_fail"()
    rx817_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx817_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("192_1271336396.90314") :method
.annotate "line", 4
    new $P819, "ResizablePMCArray"
    push $P819, "\""
    .return ($P819)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("193_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx822_tgt
    .local int rx822_pos
    .local int rx822_off
    .local int rx822_eos
    .local int rx822_rep
    .local pmc rx822_cur
    (rx822_cur, rx822_pos, rx822_tgt) = self."!cursor_start"()
    rx822_cur."!cursor_debug"("START ", "quote:sym<q>")
    .lex unicode:"$\x{a2}", rx822_cur
    .local pmc match
    .lex "$/", match
    length rx822_eos, rx822_tgt
    set rx822_off, 0
    lt rx822_pos, 2, rx822_start
    sub rx822_off, rx822_pos, 1
    substr rx822_tgt, rx822_tgt, rx822_off
  rx822_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan826_done
    goto rxscan826_scan
  rxscan826_loop:
    ($P10) = rx822_cur."from"()
    inc $P10
    set rx822_pos, $P10
    ge rx822_pos, rx822_eos, rxscan826_done
  rxscan826_scan:
    set_addr $I10, rxscan826_loop
    rx822_cur."!mark_push"(0, rx822_pos, $I10)
  rxscan826_done:
.annotate "line", 395
  # rx literal  "q"
    add $I11, rx822_pos, 1
    gt $I11, rx822_eos, rx822_fail
    sub $I11, rx822_pos, rx822_off
    substr $S10, rx822_tgt, $I11, 1
    ne $S10, "q", rx822_fail
    add rx822_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx822_pos, rx822_eos, rx822_fail
    sub $I10, rx822_pos, rx822_off
    substr $S10, rx822_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx822_fail
  # rx subrule "ws" subtype=method negate=
    rx822_cur."!cursor_pos"(rx822_pos)
    $P10 = rx822_cur."ws"()
    unless $P10, rx822_fail
    rx822_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx822_cur."!cursor_pos"(rx822_pos)
    $P10 = rx822_cur."quote_EXPR"(":q")
    unless $P10, rx822_fail
    rx822_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx822_pos = $P10."pos"()
  # rx pass
    rx822_cur."!cursor_pass"(rx822_pos, "quote:sym<q>")
    rx822_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx822_pos)
    .return (rx822_cur)
  rx822_fail:
.annotate "line", 4
    (rx822_rep, rx822_pos, $I10, $P10) = rx822_cur."!mark_fail"(0)
    lt rx822_pos, -1, rx822_done
    eq rx822_pos, -1, rx822_fail
    jump $I10
  rx822_done:
    rx822_cur."!cursor_fail"()
    rx822_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx822_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("194_1271336396.90314") :method
.annotate "line", 4
    $P824 = self."!PREFIX__!subrule"("", "q")
    new $P825, "ResizablePMCArray"
    push $P825, $P824
    .return ($P825)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("195_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx828_tgt
    .local int rx828_pos
    .local int rx828_off
    .local int rx828_eos
    .local int rx828_rep
    .local pmc rx828_cur
    (rx828_cur, rx828_pos, rx828_tgt) = self."!cursor_start"()
    rx828_cur."!cursor_debug"("START ", "quote:sym<qq>")
    .lex unicode:"$\x{a2}", rx828_cur
    .local pmc match
    .lex "$/", match
    length rx828_eos, rx828_tgt
    set rx828_off, 0
    lt rx828_pos, 2, rx828_start
    sub rx828_off, rx828_pos, 1
    substr rx828_tgt, rx828_tgt, rx828_off
  rx828_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan832_done
    goto rxscan832_scan
  rxscan832_loop:
    ($P10) = rx828_cur."from"()
    inc $P10
    set rx828_pos, $P10
    ge rx828_pos, rx828_eos, rxscan832_done
  rxscan832_scan:
    set_addr $I10, rxscan832_loop
    rx828_cur."!mark_push"(0, rx828_pos, $I10)
  rxscan832_done:
.annotate "line", 396
  # rx literal  "qq"
    add $I11, rx828_pos, 2
    gt $I11, rx828_eos, rx828_fail
    sub $I11, rx828_pos, rx828_off
    substr $S10, rx828_tgt, $I11, 2
    ne $S10, "qq", rx828_fail
    add rx828_pos, 2
  # rx enumcharlist negate=1 zerowidth
    ge rx828_pos, rx828_eos, rx828_fail
    sub $I10, rx828_pos, rx828_off
    substr $S10, rx828_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx828_fail
  # rx subrule "ws" subtype=method negate=
    rx828_cur."!cursor_pos"(rx828_pos)
    $P10 = rx828_cur."ws"()
    unless $P10, rx828_fail
    rx828_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx828_cur."!cursor_pos"(rx828_pos)
    $P10 = rx828_cur."quote_EXPR"(":qq")
    unless $P10, rx828_fail
    rx828_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx828_pos = $P10."pos"()
  # rx pass
    rx828_cur."!cursor_pass"(rx828_pos, "quote:sym<qq>")
    rx828_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx828_pos)
    .return (rx828_cur)
  rx828_fail:
.annotate "line", 4
    (rx828_rep, rx828_pos, $I10, $P10) = rx828_cur."!mark_fail"(0)
    lt rx828_pos, -1, rx828_done
    eq rx828_pos, -1, rx828_fail
    jump $I10
  rx828_done:
    rx828_cur."!cursor_fail"()
    rx828_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx828_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("196_1271336396.90314") :method
.annotate "line", 4
    $P830 = self."!PREFIX__!subrule"("", "qq")
    new $P831, "ResizablePMCArray"
    push $P831, $P830
    .return ($P831)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("197_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx834_tgt
    .local int rx834_pos
    .local int rx834_off
    .local int rx834_eos
    .local int rx834_rep
    .local pmc rx834_cur
    (rx834_cur, rx834_pos, rx834_tgt) = self."!cursor_start"()
    rx834_cur."!cursor_debug"("START ", "quote:sym<Q>")
    .lex unicode:"$\x{a2}", rx834_cur
    .local pmc match
    .lex "$/", match
    length rx834_eos, rx834_tgt
    set rx834_off, 0
    lt rx834_pos, 2, rx834_start
    sub rx834_off, rx834_pos, 1
    substr rx834_tgt, rx834_tgt, rx834_off
  rx834_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan838_done
    goto rxscan838_scan
  rxscan838_loop:
    ($P10) = rx834_cur."from"()
    inc $P10
    set rx834_pos, $P10
    ge rx834_pos, rx834_eos, rxscan838_done
  rxscan838_scan:
    set_addr $I10, rxscan838_loop
    rx834_cur."!mark_push"(0, rx834_pos, $I10)
  rxscan838_done:
.annotate "line", 397
  # rx literal  "Q"
    add $I11, rx834_pos, 1
    gt $I11, rx834_eos, rx834_fail
    sub $I11, rx834_pos, rx834_off
    substr $S10, rx834_tgt, $I11, 1
    ne $S10, "Q", rx834_fail
    add rx834_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx834_pos, rx834_eos, rx834_fail
    sub $I10, rx834_pos, rx834_off
    substr $S10, rx834_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx834_fail
  # rx subrule "ws" subtype=method negate=
    rx834_cur."!cursor_pos"(rx834_pos)
    $P10 = rx834_cur."ws"()
    unless $P10, rx834_fail
    rx834_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx834_cur."!cursor_pos"(rx834_pos)
    $P10 = rx834_cur."quote_EXPR"()
    unless $P10, rx834_fail
    rx834_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx834_pos = $P10."pos"()
  # rx pass
    rx834_cur."!cursor_pass"(rx834_pos, "quote:sym<Q>")
    rx834_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx834_pos)
    .return (rx834_cur)
  rx834_fail:
.annotate "line", 4
    (rx834_rep, rx834_pos, $I10, $P10) = rx834_cur."!mark_fail"(0)
    lt rx834_pos, -1, rx834_done
    eq rx834_pos, -1, rx834_fail
    jump $I10
  rx834_done:
    rx834_cur."!cursor_fail"()
    rx834_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx834_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("198_1271336396.90314") :method
.annotate "line", 4
    $P836 = self."!PREFIX__!subrule"("", "Q")
    new $P837, "ResizablePMCArray"
    push $P837, $P836
    .return ($P837)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("199_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx840_tgt
    .local int rx840_pos
    .local int rx840_off
    .local int rx840_eos
    .local int rx840_rep
    .local pmc rx840_cur
    (rx840_cur, rx840_pos, rx840_tgt) = self."!cursor_start"()
    rx840_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
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
    ne $I10, -1, rxscan844_done
    goto rxscan844_scan
  rxscan844_loop:
    ($P10) = rx840_cur."from"()
    inc $P10
    set rx840_pos, $P10
    ge rx840_pos, rx840_eos, rxscan844_done
  rxscan844_scan:
    set_addr $I10, rxscan844_loop
    rx840_cur."!mark_push"(0, rx840_pos, $I10)
  rxscan844_done:
.annotate "line", 398
  # rx literal  "Q:PIR"
    add $I11, rx840_pos, 5
    gt $I11, rx840_eos, rx840_fail
    sub $I11, rx840_pos, rx840_off
    substr $S10, rx840_tgt, $I11, 5
    ne $S10, "Q:PIR", rx840_fail
    add rx840_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx840_cur."!cursor_pos"(rx840_pos)
    $P10 = rx840_cur."ws"()
    unless $P10, rx840_fail
    rx840_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx840_cur."!cursor_pos"(rx840_pos)
    $P10 = rx840_cur."quote_EXPR"()
    unless $P10, rx840_fail
    rx840_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx840_pos = $P10."pos"()
  # rx pass
    rx840_cur."!cursor_pass"(rx840_pos, "quote:sym<Q:PIR>")
    rx840_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx840_pos)
    .return (rx840_cur)
  rx840_fail:
.annotate "line", 4
    (rx840_rep, rx840_pos, $I10, $P10) = rx840_cur."!mark_fail"(0)
    lt rx840_pos, -1, rx840_done
    eq rx840_pos, -1, rx840_fail
    jump $I10
  rx840_done:
    rx840_cur."!cursor_fail"()
    rx840_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx840_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("200_1271336396.90314") :method
.annotate "line", 4
    $P842 = self."!PREFIX__!subrule"("", "Q:PIR")
    new $P843, "ResizablePMCArray"
    push $P843, $P842
    .return ($P843)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym</ />"  :subid("201_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx846_tgt
    .local int rx846_pos
    .local int rx846_off
    .local int rx846_eos
    .local int rx846_rep
    .local pmc rx846_cur
    (rx846_cur, rx846_pos, rx846_tgt) = self."!cursor_start"()
    rx846_cur."!cursor_debug"("START ", "quote:sym</ />")
    .lex unicode:"$\x{a2}", rx846_cur
    .local pmc match
    .lex "$/", match
    length rx846_eos, rx846_tgt
    set rx846_off, 0
    lt rx846_pos, 2, rx846_start
    sub rx846_off, rx846_pos, 1
    substr rx846_tgt, rx846_tgt, rx846_off
  rx846_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan850_done
    goto rxscan850_scan
  rxscan850_loop:
    ($P10) = rx846_cur."from"()
    inc $P10
    set rx846_pos, $P10
    ge rx846_pos, rx846_eos, rxscan850_done
  rxscan850_scan:
    set_addr $I10, rxscan850_loop
    rx846_cur."!mark_push"(0, rx846_pos, $I10)
  rxscan850_done:
.annotate "line", 400
  # rx literal  "/"
    add $I11, rx846_pos, 1
    gt $I11, rx846_eos, rx846_fail
    sub $I11, rx846_pos, rx846_off
    substr $S10, rx846_tgt, $I11, 1
    ne $S10, "/", rx846_fail
    add rx846_pos, 1
.annotate "line", 401
  # rx subrule "newpad" subtype=method negate=
    rx846_cur."!cursor_pos"(rx846_pos)
    $P10 = rx846_cur."newpad"()
    unless $P10, rx846_fail
    rx846_pos = $P10."pos"()
.annotate "line", 402
  # rx reduce name="quote:sym</ />" key="open"
    rx846_cur."!cursor_pos"(rx846_pos)
    rx846_cur."!reduce"("quote:sym</ />", "open")
.annotate "line", 403
  # rx subrule "LANG" subtype=capture negate=
    rx846_cur."!cursor_pos"(rx846_pos)
    $P10 = rx846_cur."LANG"("Regex", "nibbler")
    unless $P10, rx846_fail
    rx846_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx846_pos = $P10."pos"()
.annotate "line", 404
  # rx literal  "/"
    add $I11, rx846_pos, 1
    gt $I11, rx846_eos, rx846_fail
    sub $I11, rx846_pos, rx846_off
    substr $S10, rx846_tgt, $I11, 1
    ne $S10, "/", rx846_fail
    add rx846_pos, 1
.annotate "line", 399
  # rx pass
    rx846_cur."!cursor_pass"(rx846_pos, "quote:sym</ />")
    rx846_cur."!cursor_debug"("PASS  ", "quote:sym</ />", " at pos=", rx846_pos)
    .return (rx846_cur)
  rx846_fail:
.annotate "line", 4
    (rx846_rep, rx846_pos, $I10, $P10) = rx846_cur."!mark_fail"(0)
    lt rx846_pos, -1, rx846_done
    eq rx846_pos, -1, rx846_fail
    jump $I10
  rx846_done:
    rx846_cur."!cursor_fail"()
    rx846_cur."!cursor_debug"("FAIL  ", "quote:sym</ />")
    .return (rx846_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym</ />"  :subid("202_1271336396.90314") :method
.annotate "line", 4
    $P848 = self."!PREFIX__!subrule"("", "/")
    new $P849, "ResizablePMCArray"
    push $P849, $P848
    .return ($P849)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("203_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx852_tgt
    .local int rx852_pos
    .local int rx852_off
    .local int rx852_eos
    .local int rx852_rep
    .local pmc rx852_cur
    (rx852_cur, rx852_pos, rx852_tgt) = self."!cursor_start"()
    rx852_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
    .lex unicode:"$\x{a2}", rx852_cur
    .local pmc match
    .lex "$/", match
    length rx852_eos, rx852_tgt
    set rx852_off, 0
    lt rx852_pos, 2, rx852_start
    sub rx852_off, rx852_pos, 1
    substr rx852_tgt, rx852_tgt, rx852_off
  rx852_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan855_done
    goto rxscan855_scan
  rxscan855_loop:
    ($P10) = rx852_cur."from"()
    inc $P10
    set rx852_pos, $P10
    ge rx852_pos, rx852_eos, rxscan855_done
  rxscan855_scan:
    set_addr $I10, rxscan855_loop
    rx852_cur."!mark_push"(0, rx852_pos, $I10)
  rxscan855_done:
.annotate "line", 407
  # rx enumcharlist negate=0 zerowidth
    ge rx852_pos, rx852_eos, rx852_fail
    sub $I10, rx852_pos, rx852_off
    substr $S10, rx852_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx852_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx852_cur."!cursor_pos"(rx852_pos)
    $P10 = rx852_cur."quotemod_check"("s")
    unless $P10, rx852_fail
  # rx subrule "variable" subtype=capture negate=
    rx852_cur."!cursor_pos"(rx852_pos)
    $P10 = rx852_cur."variable"()
    unless $P10, rx852_fail
    rx852_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx852_pos = $P10."pos"()
  # rx pass
    rx852_cur."!cursor_pass"(rx852_pos, "quote_escape:sym<$>")
    rx852_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx852_pos)
    .return (rx852_cur)
  rx852_fail:
.annotate "line", 4
    (rx852_rep, rx852_pos, $I10, $P10) = rx852_cur."!mark_fail"(0)
    lt rx852_pos, -1, rx852_done
    eq rx852_pos, -1, rx852_fail
    jump $I10
  rx852_done:
    rx852_cur."!cursor_fail"()
    rx852_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx852_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("204_1271336396.90314") :method
.annotate "line", 4
    new $P854, "ResizablePMCArray"
    push $P854, "$"
    .return ($P854)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("205_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx857_tgt
    .local int rx857_pos
    .local int rx857_off
    .local int rx857_eos
    .local int rx857_rep
    .local pmc rx857_cur
    (rx857_cur, rx857_pos, rx857_tgt) = self."!cursor_start"()
    rx857_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
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
.annotate "line", 408
  # rx enumcharlist negate=0 zerowidth
    ge rx857_pos, rx857_eos, rx857_fail
    sub $I10, rx857_pos, rx857_off
    substr $S10, rx857_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx857_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx857_cur."!cursor_pos"(rx857_pos)
    $P10 = rx857_cur."quotemod_check"("c")
    unless $P10, rx857_fail
  # rx subrule "block" subtype=capture negate=
    rx857_cur."!cursor_pos"(rx857_pos)
    $P10 = rx857_cur."block"()
    unless $P10, rx857_fail
    rx857_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx857_pos = $P10."pos"()
  # rx pass
    rx857_cur."!cursor_pass"(rx857_pos, "quote_escape:sym<{ }>")
    rx857_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx857_pos)
    .return (rx857_cur)
  rx857_fail:
.annotate "line", 4
    (rx857_rep, rx857_pos, $I10, $P10) = rx857_cur."!mark_fail"(0)
    lt rx857_pos, -1, rx857_done
    eq rx857_pos, -1, rx857_fail
    jump $I10
  rx857_done:
    rx857_cur."!cursor_fail"()
    rx857_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx857_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("206_1271336396.90314") :method
.annotate "line", 4
    new $P859, "ResizablePMCArray"
    push $P859, "{"
    .return ($P859)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("207_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx862_tgt
    .local int rx862_pos
    .local int rx862_off
    .local int rx862_eos
    .local int rx862_rep
    .local pmc rx862_cur
    (rx862_cur, rx862_pos, rx862_tgt) = self."!cursor_start"()
    rx862_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx862_cur."!cursor_caparray"("EXPR")
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
    ne $I10, -1, rxscan866_done
    goto rxscan866_scan
  rxscan866_loop:
    ($P10) = rx862_cur."from"()
    inc $P10
    set rx862_pos, $P10
    ge rx862_pos, rx862_eos, rxscan866_done
  rxscan866_scan:
    set_addr $I10, rxscan866_loop
    rx862_cur."!mark_push"(0, rx862_pos, $I10)
  rxscan866_done:
.annotate "line", 410
  # rx literal  "("
    add $I11, rx862_pos, 1
    gt $I11, rx862_eos, rx862_fail
    sub $I11, rx862_pos, rx862_off
    substr $S10, rx862_tgt, $I11, 1
    ne $S10, "(", rx862_fail
    add rx862_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx862_cur."!cursor_pos"(rx862_pos)
    $P10 = rx862_cur."ws"()
    unless $P10, rx862_fail
    rx862_pos = $P10."pos"()
  # rx rxquantr867 ** 0..1
    set_addr $I868, rxquantr867_done
    rx862_cur."!mark_push"(0, rx862_pos, $I868)
  rxquantr867_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx862_cur."!cursor_pos"(rx862_pos)
    $P10 = rx862_cur."EXPR"()
    unless $P10, rx862_fail
    rx862_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx862_pos = $P10."pos"()
    (rx862_rep) = rx862_cur."!mark_commit"($I868)
  rxquantr867_done:
  # rx literal  ")"
    add $I11, rx862_pos, 1
    gt $I11, rx862_eos, rx862_fail
    sub $I11, rx862_pos, rx862_off
    substr $S10, rx862_tgt, $I11, 1
    ne $S10, ")", rx862_fail
    add rx862_pos, 1
  # rx pass
    rx862_cur."!cursor_pass"(rx862_pos, "circumfix:sym<( )>")
    rx862_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx862_pos)
    .return (rx862_cur)
  rx862_fail:
.annotate "line", 4
    (rx862_rep, rx862_pos, $I10, $P10) = rx862_cur."!mark_fail"(0)
    lt rx862_pos, -1, rx862_done
    eq rx862_pos, -1, rx862_fail
    jump $I10
  rx862_done:
    rx862_cur."!cursor_fail"()
    rx862_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx862_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("208_1271336396.90314") :method
.annotate "line", 4
    $P864 = self."!PREFIX__!subrule"("", "(")
    new $P865, "ResizablePMCArray"
    push $P865, $P864
    .return ($P865)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("209_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx870_tgt
    .local int rx870_pos
    .local int rx870_off
    .local int rx870_eos
    .local int rx870_rep
    .local pmc rx870_cur
    (rx870_cur, rx870_pos, rx870_tgt) = self."!cursor_start"()
    rx870_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
    rx870_cur."!cursor_caparray"("EXPR")
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
.annotate "line", 411
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
  # rx rxquantr875 ** 0..1
    set_addr $I876, rxquantr875_done
    rx870_cur."!mark_push"(0, rx870_pos, $I876)
  rxquantr875_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx870_cur."!cursor_pos"(rx870_pos)
    $P10 = rx870_cur."EXPR"()
    unless $P10, rx870_fail
    rx870_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx870_pos = $P10."pos"()
    (rx870_rep) = rx870_cur."!mark_commit"($I876)
  rxquantr875_done:
  # rx literal  "]"
    add $I11, rx870_pos, 1
    gt $I11, rx870_eos, rx870_fail
    sub $I11, rx870_pos, rx870_off
    substr $S10, rx870_tgt, $I11, 1
    ne $S10, "]", rx870_fail
    add rx870_pos, 1
  # rx pass
    rx870_cur."!cursor_pass"(rx870_pos, "circumfix:sym<[ ]>")
    rx870_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx870_pos)
    .return (rx870_cur)
  rx870_fail:
.annotate "line", 4
    (rx870_rep, rx870_pos, $I10, $P10) = rx870_cur."!mark_fail"(0)
    lt rx870_pos, -1, rx870_done
    eq rx870_pos, -1, rx870_fail
    jump $I10
  rx870_done:
    rx870_cur."!cursor_fail"()
    rx870_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx870_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("210_1271336396.90314") :method
.annotate "line", 4
    $P872 = self."!PREFIX__!subrule"("", "[")
    new $P873, "ResizablePMCArray"
    push $P873, $P872
    .return ($P873)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("211_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx878_tgt
    .local int rx878_pos
    .local int rx878_off
    .local int rx878_eos
    .local int rx878_rep
    .local pmc rx878_cur
    (rx878_cur, rx878_pos, rx878_tgt) = self."!cursor_start"()
    rx878_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx878_cur
    .local pmc match
    .lex "$/", match
    length rx878_eos, rx878_tgt
    set rx878_off, 0
    lt rx878_pos, 2, rx878_start
    sub rx878_off, rx878_pos, 1
    substr rx878_tgt, rx878_tgt, rx878_off
  rx878_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan881_done
    goto rxscan881_scan
  rxscan881_loop:
    ($P10) = rx878_cur."from"()
    inc $P10
    set rx878_pos, $P10
    ge rx878_pos, rx878_eos, rxscan881_done
  rxscan881_scan:
    set_addr $I10, rxscan881_loop
    rx878_cur."!mark_push"(0, rx878_pos, $I10)
  rxscan881_done:
.annotate "line", 412
  # rx enumcharlist negate=0 zerowidth
    ge rx878_pos, rx878_eos, rx878_fail
    sub $I10, rx878_pos, rx878_off
    substr $S10, rx878_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx878_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx878_cur."!cursor_pos"(rx878_pos)
    $P10 = rx878_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx878_fail
    rx878_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx878_pos = $P10."pos"()
  # rx pass
    rx878_cur."!cursor_pass"(rx878_pos, "circumfix:sym<ang>")
    rx878_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx878_pos)
    .return (rx878_cur)
  rx878_fail:
.annotate "line", 4
    (rx878_rep, rx878_pos, $I10, $P10) = rx878_cur."!mark_fail"(0)
    lt rx878_pos, -1, rx878_done
    eq rx878_pos, -1, rx878_fail
    jump $I10
  rx878_done:
    rx878_cur."!cursor_fail"()
    rx878_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx878_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("212_1271336396.90314") :method
.annotate "line", 4
    new $P880, "ResizablePMCArray"
    push $P880, "<"
    .return ($P880)
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("213_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx883_tgt
    .local int rx883_pos
    .local int rx883_off
    .local int rx883_eos
    .local int rx883_rep
    .local pmc rx883_cur
    (rx883_cur, rx883_pos, rx883_tgt) = self."!cursor_start"()
    rx883_cur."!cursor_debug"("START ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
    .lex unicode:"$\x{a2}", rx883_cur
    .local pmc match
    .lex "$/", match
    length rx883_eos, rx883_tgt
    set rx883_off, 0
    lt rx883_pos, 2, rx883_start
    sub rx883_off, rx883_pos, 1
    substr rx883_tgt, rx883_tgt, rx883_off
  rx883_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan886_done
    goto rxscan886_scan
  rxscan886_loop:
    ($P10) = rx883_cur."from"()
    inc $P10
    set rx883_pos, $P10
    ge rx883_pos, rx883_eos, rxscan886_done
  rxscan886_scan:
    set_addr $I10, rxscan886_loop
    rx883_cur."!mark_push"(0, rx883_pos, $I10)
  rxscan886_done:
.annotate "line", 413
  # rx enumcharlist negate=0 zerowidth
    ge rx883_pos, rx883_eos, rx883_fail
    sub $I10, rx883_pos, rx883_off
    substr $S10, rx883_tgt, $I10, 1
    index $I11, unicode:"\x{ab}", $S10
    lt $I11, 0, rx883_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx883_cur."!cursor_pos"(rx883_pos)
    $P10 = rx883_cur."quote_EXPR"(":qq", ":w")
    unless $P10, rx883_fail
    rx883_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx883_pos = $P10."pos"()
  # rx pass
    rx883_cur."!cursor_pass"(rx883_pos, unicode:"circumfix:sym<\x{ab} \x{bb}>")
    rx883_cur."!cursor_debug"("PASS  ", unicode:"circumfix:sym<\x{ab} \x{bb}>", " at pos=", rx883_pos)
    .return (rx883_cur)
  rx883_fail:
.annotate "line", 4
    (rx883_rep, rx883_pos, $I10, $P10) = rx883_cur."!mark_fail"(0)
    lt rx883_pos, -1, rx883_done
    eq rx883_pos, -1, rx883_fail
    jump $I10
  rx883_done:
    rx883_cur."!cursor_fail"()
    rx883_cur."!cursor_debug"("FAIL  ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
    .return (rx883_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"!PREFIX__circumfix:sym<\x{ab} \x{bb}>"  :subid("214_1271336396.90314") :method
.annotate "line", 4
    new $P885, "ResizablePMCArray"
    push $P885, unicode:"\x{ab}"
    .return ($P885)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("215_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx888_tgt
    .local int rx888_pos
    .local int rx888_off
    .local int rx888_eos
    .local int rx888_rep
    .local pmc rx888_cur
    (rx888_cur, rx888_pos, rx888_tgt) = self."!cursor_start"()
    rx888_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx888_cur
    .local pmc match
    .lex "$/", match
    length rx888_eos, rx888_tgt
    set rx888_off, 0
    lt rx888_pos, 2, rx888_start
    sub rx888_off, rx888_pos, 1
    substr rx888_tgt, rx888_tgt, rx888_off
  rx888_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan891_done
    goto rxscan891_scan
  rxscan891_loop:
    ($P10) = rx888_cur."from"()
    inc $P10
    set rx888_pos, $P10
    ge rx888_pos, rx888_eos, rxscan891_done
  rxscan891_scan:
    set_addr $I10, rxscan891_loop
    rx888_cur."!mark_push"(0, rx888_pos, $I10)
  rxscan891_done:
.annotate "line", 414
  # rx enumcharlist negate=0 zerowidth
    ge rx888_pos, rx888_eos, rx888_fail
    sub $I10, rx888_pos, rx888_off
    substr $S10, rx888_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx888_fail
  # rx subrule "pblock" subtype=capture negate=
    rx888_cur."!cursor_pos"(rx888_pos)
    $P10 = rx888_cur."pblock"()
    unless $P10, rx888_fail
    rx888_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx888_pos = $P10."pos"()
  # rx pass
    rx888_cur."!cursor_pass"(rx888_pos, "circumfix:sym<{ }>")
    rx888_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx888_pos)
    .return (rx888_cur)
  rx888_fail:
.annotate "line", 4
    (rx888_rep, rx888_pos, $I10, $P10) = rx888_cur."!mark_fail"(0)
    lt rx888_pos, -1, rx888_done
    eq rx888_pos, -1, rx888_fail
    jump $I10
  rx888_done:
    rx888_cur."!cursor_fail"()
    rx888_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx888_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("216_1271336396.90314") :method
.annotate "line", 4
    new $P890, "ResizablePMCArray"
    push $P890, "{"
    .return ($P890)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("217_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx893_tgt
    .local int rx893_pos
    .local int rx893_off
    .local int rx893_eos
    .local int rx893_rep
    .local pmc rx893_cur
    (rx893_cur, rx893_pos, rx893_tgt) = self."!cursor_start"()
    rx893_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
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
.annotate "line", 415
  # rx subrule "sigil" subtype=capture negate=
    rx893_cur."!cursor_pos"(rx893_pos)
    $P10 = rx893_cur."sigil"()
    unless $P10, rx893_fail
    rx893_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx893_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx893_pos, 1
    gt $I11, rx893_eos, rx893_fail
    sub $I11, rx893_pos, rx893_off
    substr $S10, rx893_tgt, $I11, 1
    ne $S10, "(", rx893_fail
    add rx893_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx893_cur."!cursor_pos"(rx893_pos)
    $P10 = rx893_cur."semilist"()
    unless $P10, rx893_fail
    rx893_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx893_pos = $P10."pos"()
  alt898_0:
    set_addr $I10, alt898_1
    rx893_cur."!mark_push"(0, rx893_pos, $I10)
  # rx literal  ")"
    add $I11, rx893_pos, 1
    gt $I11, rx893_eos, rx893_fail
    sub $I11, rx893_pos, rx893_off
    substr $S10, rx893_tgt, $I11, 1
    ne $S10, ")", rx893_fail
    add rx893_pos, 1
    goto alt898_end
  alt898_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx893_cur."!cursor_pos"(rx893_pos)
    $P10 = rx893_cur."FAILGOAL"("')'")
    unless $P10, rx893_fail
    rx893_pos = $P10."pos"()
  alt898_end:
  # rx pass
    rx893_cur."!cursor_pass"(rx893_pos, "circumfix:sym<sigil>")
    rx893_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx893_pos)
    .return (rx893_cur)
  rx893_fail:
.annotate "line", 4
    (rx893_rep, rx893_pos, $I10, $P10) = rx893_cur."!mark_fail"(0)
    lt rx893_pos, -1, rx893_done
    eq rx893_pos, -1, rx893_fail
    jump $I10
  rx893_done:
    rx893_cur."!cursor_fail"()
    rx893_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx893_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("218_1271336396.90314") :method
.annotate "line", 4
    $P895 = self."!PREFIX__!subrule"("sigil", "")
    new $P896, "ResizablePMCArray"
    push $P896, $P895
    .return ($P896)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("219_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 4
    .local string rx901_tgt
    .local int rx901_pos
    .local int rx901_off
    .local int rx901_eos
    .local int rx901_rep
    .local pmc rx901_cur
    (rx901_cur, rx901_pos, rx901_tgt) = self."!cursor_start"()
    rx901_cur."!cursor_debug"("START ", "semilist")
    .lex unicode:"$\x{a2}", rx901_cur
    .local pmc match
    .lex "$/", match
    length rx901_eos, rx901_tgt
    set rx901_off, 0
    lt rx901_pos, 2, rx901_start
    sub rx901_off, rx901_pos, 1
    substr rx901_tgt, rx901_tgt, rx901_off
  rx901_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan904_done
    goto rxscan904_scan
  rxscan904_loop:
    ($P10) = rx901_cur."from"()
    inc $P10
    set rx901_pos, $P10
    ge rx901_pos, rx901_eos, rxscan904_done
  rxscan904_scan:
    set_addr $I10, rxscan904_loop
    rx901_cur."!mark_push"(0, rx901_pos, $I10)
  rxscan904_done:
.annotate "line", 417
  # rx subrule "ws" subtype=method negate=
    rx901_cur."!cursor_pos"(rx901_pos)
    $P10 = rx901_cur."ws"()
    unless $P10, rx901_fail
    rx901_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx901_cur."!cursor_pos"(rx901_pos)
    $P10 = rx901_cur."statement"()
    unless $P10, rx901_fail
    rx901_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx901_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx901_cur."!cursor_pos"(rx901_pos)
    $P10 = rx901_cur."ws"()
    unless $P10, rx901_fail
    rx901_pos = $P10."pos"()
  # rx pass
    rx901_cur."!cursor_pass"(rx901_pos, "semilist")
    rx901_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx901_pos)
    .return (rx901_cur)
  rx901_fail:
.annotate "line", 4
    (rx901_rep, rx901_pos, $I10, $P10) = rx901_cur."!mark_fail"(0)
    lt rx901_pos, -1, rx901_done
    eq rx901_pos, -1, rx901_fail
    jump $I10
  rx901_done:
    rx901_cur."!cursor_fail"()
    rx901_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx901_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("220_1271336396.90314") :method
.annotate "line", 4
    new $P903, "ResizablePMCArray"
    push $P903, ""
    .return ($P903)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("221_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx908_tgt
    .local int rx908_pos
    .local int rx908_off
    .local int rx908_eos
    .local int rx908_rep
    .local pmc rx908_cur
    (rx908_cur, rx908_pos, rx908_tgt) = self."!cursor_start"()
    rx908_cur."!cursor_debug"("START ", "infixish")
    .lex unicode:"$\x{a2}", rx908_cur
    .local pmc match
    .lex "$/", match
    length rx908_eos, rx908_tgt
    set rx908_off, 0
    lt rx908_pos, 2, rx908_start
    sub rx908_off, rx908_pos, 1
    substr rx908_tgt, rx908_tgt, rx908_off
  rx908_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan911_done
    goto rxscan911_scan
  rxscan911_loop:
    ($P10) = rx908_cur."from"()
    inc $P10
    set rx908_pos, $P10
    ge rx908_pos, rx908_eos, rxscan911_done
  rxscan911_scan:
    set_addr $I10, rxscan911_loop
    rx908_cur."!mark_push"(0, rx908_pos, $I10)
  rxscan911_done:
.annotate "line", 440
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx908_cur."!cursor_pos"(rx908_pos)
    $P10 = rx908_cur."infixstopper"()
    if $P10, rx908_fail
  # rx subrule "infix" subtype=capture negate=
    rx908_cur."!cursor_pos"(rx908_pos)
    $P10 = rx908_cur."infix"()
    unless $P10, rx908_fail
    rx908_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx908_pos = $P10."pos"()
  # rx pass
    rx908_cur."!cursor_pass"(rx908_pos, "infixish")
    rx908_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx908_pos)
    .return (rx908_cur)
  rx908_fail:
.annotate "line", 421
    (rx908_rep, rx908_pos, $I10, $P10) = rx908_cur."!mark_fail"(0)
    lt rx908_pos, -1, rx908_done
    eq rx908_pos, -1, rx908_fail
    jump $I10
  rx908_done:
    rx908_cur."!cursor_fail"()
    rx908_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx908_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("222_1271336396.90314") :method
.annotate "line", 421
    new $P910, "ResizablePMCArray"
    push $P910, ""
    .return ($P910)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("223_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx913_tgt
    .local int rx913_pos
    .local int rx913_off
    .local int rx913_eos
    .local int rx913_rep
    .local pmc rx913_cur
    (rx913_cur, rx913_pos, rx913_tgt) = self."!cursor_start"()
    rx913_cur."!cursor_debug"("START ", "infixstopper")
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
    ne $I10, -1, rxscan916_done
    goto rxscan916_scan
  rxscan916_loop:
    ($P10) = rx913_cur."from"()
    inc $P10
    set rx913_pos, $P10
    ge rx913_pos, rx913_eos, rxscan916_done
  rxscan916_scan:
    set_addr $I10, rxscan916_loop
    rx913_cur."!mark_push"(0, rx913_pos, $I10)
  rxscan916_done:
.annotate "line", 441
  # rx subrule "lambda" subtype=zerowidth negate=
    rx913_cur."!cursor_pos"(rx913_pos)
    $P10 = rx913_cur."lambda"()
    unless $P10, rx913_fail
  # rx pass
    rx913_cur."!cursor_pass"(rx913_pos, "infixstopper")
    rx913_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx913_pos)
    .return (rx913_cur)
  rx913_fail:
.annotate "line", 421
    (rx913_rep, rx913_pos, $I10, $P10) = rx913_cur."!mark_fail"(0)
    lt rx913_pos, -1, rx913_done
    eq rx913_pos, -1, rx913_fail
    jump $I10
  rx913_done:
    rx913_cur."!cursor_fail"()
    rx913_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx913_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("224_1271336396.90314") :method
.annotate "line", 421
    new $P915, "ResizablePMCArray"
    push $P915, ""
    .return ($P915)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("225_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx918_tgt
    .local int rx918_pos
    .local int rx918_off
    .local int rx918_eos
    .local int rx918_rep
    .local pmc rx918_cur
    (rx918_cur, rx918_pos, rx918_tgt) = self."!cursor_start"()
    rx918_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
    .lex unicode:"$\x{a2}", rx918_cur
    .local pmc match
    .lex "$/", match
    length rx918_eos, rx918_tgt
    set rx918_off, 0
    lt rx918_pos, 2, rx918_start
    sub rx918_off, rx918_pos, 1
    substr rx918_tgt, rx918_tgt, rx918_off
  rx918_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan922_done
    goto rxscan922_scan
  rxscan922_loop:
    ($P10) = rx918_cur."from"()
    inc $P10
    set rx918_pos, $P10
    ge rx918_pos, rx918_eos, rxscan922_done
  rxscan922_scan:
    set_addr $I10, rxscan922_loop
    rx918_cur."!mark_push"(0, rx918_pos, $I10)
  rxscan922_done:
.annotate "line", 444
  # rx literal  "["
    add $I11, rx918_pos, 1
    gt $I11, rx918_eos, rx918_fail
    sub $I11, rx918_pos, rx918_off
    substr $S10, rx918_tgt, $I11, 1
    ne $S10, "[", rx918_fail
    add rx918_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx918_cur."!cursor_pos"(rx918_pos)
    $P10 = rx918_cur."ws"()
    unless $P10, rx918_fail
    rx918_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx918_cur."!cursor_pos"(rx918_pos)
    $P10 = rx918_cur."EXPR"()
    unless $P10, rx918_fail
    rx918_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx918_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx918_pos, 1
    gt $I11, rx918_eos, rx918_fail
    sub $I11, rx918_pos, rx918_off
    substr $S10, rx918_tgt, $I11, 1
    ne $S10, "]", rx918_fail
    add rx918_pos, 1
.annotate "line", 445
  # rx subrule "O" subtype=capture negate=
    rx918_cur."!cursor_pos"(rx918_pos)
    $P10 = rx918_cur."O"("%methodop")
    unless $P10, rx918_fail
    rx918_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx918_pos = $P10."pos"()
.annotate "line", 443
  # rx pass
    rx918_cur."!cursor_pass"(rx918_pos, "postcircumfix:sym<[ ]>")
    rx918_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx918_pos)
    .return (rx918_cur)
  rx918_fail:
.annotate "line", 421
    (rx918_rep, rx918_pos, $I10, $P10) = rx918_cur."!mark_fail"(0)
    lt rx918_pos, -1, rx918_done
    eq rx918_pos, -1, rx918_fail
    jump $I10
  rx918_done:
    rx918_cur."!cursor_fail"()
    rx918_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx918_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("226_1271336396.90314") :method
.annotate "line", 421
    $P920 = self."!PREFIX__!subrule"("", "[")
    new $P921, "ResizablePMCArray"
    push $P921, $P920
    .return ($P921)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("227_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx924_tgt
    .local int rx924_pos
    .local int rx924_off
    .local int rx924_eos
    .local int rx924_rep
    .local pmc rx924_cur
    (rx924_cur, rx924_pos, rx924_tgt) = self."!cursor_start"()
    rx924_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
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
.annotate "line", 449
  # rx literal  "{"
    add $I11, rx924_pos, 1
    gt $I11, rx924_eos, rx924_fail
    sub $I11, rx924_pos, rx924_off
    substr $S10, rx924_tgt, $I11, 1
    ne $S10, "{", rx924_fail
    add rx924_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx924_cur."!cursor_pos"(rx924_pos)
    $P10 = rx924_cur."ws"()
    unless $P10, rx924_fail
    rx924_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx924_cur."!cursor_pos"(rx924_pos)
    $P10 = rx924_cur."EXPR"()
    unless $P10, rx924_fail
    rx924_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx924_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx924_pos, 1
    gt $I11, rx924_eos, rx924_fail
    sub $I11, rx924_pos, rx924_off
    substr $S10, rx924_tgt, $I11, 1
    ne $S10, "}", rx924_fail
    add rx924_pos, 1
.annotate "line", 450
  # rx subrule "O" subtype=capture negate=
    rx924_cur."!cursor_pos"(rx924_pos)
    $P10 = rx924_cur."O"("%methodop")
    unless $P10, rx924_fail
    rx924_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx924_pos = $P10."pos"()
.annotate "line", 448
  # rx pass
    rx924_cur."!cursor_pass"(rx924_pos, "postcircumfix:sym<{ }>")
    rx924_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx924_pos)
    .return (rx924_cur)
  rx924_fail:
.annotate "line", 421
    (rx924_rep, rx924_pos, $I10, $P10) = rx924_cur."!mark_fail"(0)
    lt rx924_pos, -1, rx924_done
    eq rx924_pos, -1, rx924_fail
    jump $I10
  rx924_done:
    rx924_cur."!cursor_fail"()
    rx924_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx924_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("228_1271336396.90314") :method
.annotate "line", 421
    $P926 = self."!PREFIX__!subrule"("", "{")
    new $P927, "ResizablePMCArray"
    push $P927, $P926
    .return ($P927)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("229_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx930_tgt
    .local int rx930_pos
    .local int rx930_off
    .local int rx930_eos
    .local int rx930_rep
    .local pmc rx930_cur
    (rx930_cur, rx930_pos, rx930_tgt) = self."!cursor_start"()
    rx930_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx930_cur
    .local pmc match
    .lex "$/", match
    length rx930_eos, rx930_tgt
    set rx930_off, 0
    lt rx930_pos, 2, rx930_start
    sub rx930_off, rx930_pos, 1
    substr rx930_tgt, rx930_tgt, rx930_off
  rx930_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan933_done
    goto rxscan933_scan
  rxscan933_loop:
    ($P10) = rx930_cur."from"()
    inc $P10
    set rx930_pos, $P10
    ge rx930_pos, rx930_eos, rxscan933_done
  rxscan933_scan:
    set_addr $I10, rxscan933_loop
    rx930_cur."!mark_push"(0, rx930_pos, $I10)
  rxscan933_done:
.annotate "line", 454
  # rx enumcharlist negate=0 zerowidth
    ge rx930_pos, rx930_eos, rx930_fail
    sub $I10, rx930_pos, rx930_off
    substr $S10, rx930_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx930_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx930_cur."!cursor_pos"(rx930_pos)
    $P10 = rx930_cur."quote_EXPR"(":q")
    unless $P10, rx930_fail
    rx930_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx930_pos = $P10."pos"()
.annotate "line", 455
  # rx subrule "O" subtype=capture negate=
    rx930_cur."!cursor_pos"(rx930_pos)
    $P10 = rx930_cur."O"("%methodop")
    unless $P10, rx930_fail
    rx930_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx930_pos = $P10."pos"()
.annotate "line", 453
  # rx pass
    rx930_cur."!cursor_pass"(rx930_pos, "postcircumfix:sym<ang>")
    rx930_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx930_pos)
    .return (rx930_cur)
  rx930_fail:
.annotate "line", 421
    (rx930_rep, rx930_pos, $I10, $P10) = rx930_cur."!mark_fail"(0)
    lt rx930_pos, -1, rx930_done
    eq rx930_pos, -1, rx930_fail
    jump $I10
  rx930_done:
    rx930_cur."!cursor_fail"()
    rx930_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx930_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("230_1271336396.90314") :method
.annotate "line", 421
    new $P932, "ResizablePMCArray"
    push $P932, "<"
    .return ($P932)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("231_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx935_tgt
    .local int rx935_pos
    .local int rx935_off
    .local int rx935_eos
    .local int rx935_rep
    .local pmc rx935_cur
    (rx935_cur, rx935_pos, rx935_tgt) = self."!cursor_start"()
    rx935_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
    .lex unicode:"$\x{a2}", rx935_cur
    .local pmc match
    .lex "$/", match
    length rx935_eos, rx935_tgt
    set rx935_off, 0
    lt rx935_pos, 2, rx935_start
    sub rx935_off, rx935_pos, 1
    substr rx935_tgt, rx935_tgt, rx935_off
  rx935_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan939_done
    goto rxscan939_scan
  rxscan939_loop:
    ($P10) = rx935_cur."from"()
    inc $P10
    set rx935_pos, $P10
    ge rx935_pos, rx935_eos, rxscan939_done
  rxscan939_scan:
    set_addr $I10, rxscan939_loop
    rx935_cur."!mark_push"(0, rx935_pos, $I10)
  rxscan939_done:
.annotate "line", 459
  # rx literal  "("
    add $I11, rx935_pos, 1
    gt $I11, rx935_eos, rx935_fail
    sub $I11, rx935_pos, rx935_off
    substr $S10, rx935_tgt, $I11, 1
    ne $S10, "(", rx935_fail
    add rx935_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx935_cur."!cursor_pos"(rx935_pos)
    $P10 = rx935_cur."ws"()
    unless $P10, rx935_fail
    rx935_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx935_cur."!cursor_pos"(rx935_pos)
    $P10 = rx935_cur."arglist"()
    unless $P10, rx935_fail
    rx935_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx935_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx935_pos, 1
    gt $I11, rx935_eos, rx935_fail
    sub $I11, rx935_pos, rx935_off
    substr $S10, rx935_tgt, $I11, 1
    ne $S10, ")", rx935_fail
    add rx935_pos, 1
.annotate "line", 460
  # rx subrule "O" subtype=capture negate=
    rx935_cur."!cursor_pos"(rx935_pos)
    $P10 = rx935_cur."O"("%methodop")
    unless $P10, rx935_fail
    rx935_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx935_pos = $P10."pos"()
.annotate "line", 458
  # rx pass
    rx935_cur."!cursor_pass"(rx935_pos, "postcircumfix:sym<( )>")
    rx935_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx935_pos)
    .return (rx935_cur)
  rx935_fail:
.annotate "line", 421
    (rx935_rep, rx935_pos, $I10, $P10) = rx935_cur."!mark_fail"(0)
    lt rx935_pos, -1, rx935_done
    eq rx935_pos, -1, rx935_fail
    jump $I10
  rx935_done:
    rx935_cur."!cursor_fail"()
    rx935_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx935_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("232_1271336396.90314") :method
.annotate "line", 421
    $P937 = self."!PREFIX__!subrule"("", "(")
    new $P938, "ResizablePMCArray"
    push $P938, $P937
    .return ($P938)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("233_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx941_tgt
    .local int rx941_pos
    .local int rx941_off
    .local int rx941_eos
    .local int rx941_rep
    .local pmc rx941_cur
    (rx941_cur, rx941_pos, rx941_tgt) = self."!cursor_start"()
    rx941_cur."!cursor_debug"("START ", "postfix:sym<.>")
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
.annotate "line", 463
  # rx subrule "dotty" subtype=capture negate=
    rx941_cur."!cursor_pos"(rx941_pos)
    $P10 = rx941_cur."dotty"()
    unless $P10, rx941_fail
    rx941_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx941_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx941_cur."!cursor_pos"(rx941_pos)
    $P10 = rx941_cur."O"("%methodop")
    unless $P10, rx941_fail
    rx941_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx941_pos = $P10."pos"()
  # rx pass
    rx941_cur."!cursor_pass"(rx941_pos, "postfix:sym<.>")
    rx941_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx941_pos)
    .return (rx941_cur)
  rx941_fail:
.annotate "line", 421
    (rx941_rep, rx941_pos, $I10, $P10) = rx941_cur."!mark_fail"(0)
    lt rx941_pos, -1, rx941_done
    eq rx941_pos, -1, rx941_fail
    jump $I10
  rx941_done:
    rx941_cur."!cursor_fail"()
    rx941_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx941_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("234_1271336396.90314") :method
.annotate "line", 421
    $P943 = self."!PREFIX__!subrule"("dotty", "")
    new $P944, "ResizablePMCArray"
    push $P944, $P943
    .return ($P944)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("235_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx947_tgt
    .local int rx947_pos
    .local int rx947_off
    .local int rx947_eos
    .local int rx947_rep
    .local pmc rx947_cur
    (rx947_cur, rx947_pos, rx947_tgt) = self."!cursor_start"()
    rx947_cur."!cursor_debug"("START ", "prefix:sym<++>")
    .lex unicode:"$\x{a2}", rx947_cur
    .local pmc match
    .lex "$/", match
    length rx947_eos, rx947_tgt
    set rx947_off, 0
    lt rx947_pos, 2, rx947_start
    sub rx947_off, rx947_pos, 1
    substr rx947_tgt, rx947_tgt, rx947_off
  rx947_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan951_done
    goto rxscan951_scan
  rxscan951_loop:
    ($P10) = rx947_cur."from"()
    inc $P10
    set rx947_pos, $P10
    ge rx947_pos, rx947_eos, rxscan951_done
  rxscan951_scan:
    set_addr $I10, rxscan951_loop
    rx947_cur."!mark_push"(0, rx947_pos, $I10)
  rxscan951_done:
.annotate "line", 465
  # rx subcapture "sym"
    set_addr $I10, rxcap_952_fail
    rx947_cur."!mark_push"(0, rx947_pos, $I10)
  # rx literal  "++"
    add $I11, rx947_pos, 2
    gt $I11, rx947_eos, rx947_fail
    sub $I11, rx947_pos, rx947_off
    substr $S10, rx947_tgt, $I11, 2
    ne $S10, "++", rx947_fail
    add rx947_pos, 2
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
    $P10 = rx947_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx947_fail
    rx947_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx947_pos = $P10."pos"()
  # rx pass
    rx947_cur."!cursor_pass"(rx947_pos, "prefix:sym<++>")
    rx947_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx947_pos)
    .return (rx947_cur)
  rx947_fail:
.annotate "line", 421
    (rx947_rep, rx947_pos, $I10, $P10) = rx947_cur."!mark_fail"(0)
    lt rx947_pos, -1, rx947_done
    eq rx947_pos, -1, rx947_fail
    jump $I10
  rx947_done:
    rx947_cur."!cursor_fail"()
    rx947_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx947_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("236_1271336396.90314") :method
.annotate "line", 421
    $P949 = self."!PREFIX__!subrule"("O", "++")
    new $P950, "ResizablePMCArray"
    push $P950, $P949
    .return ($P950)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("237_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx954_tgt
    .local int rx954_pos
    .local int rx954_off
    .local int rx954_eos
    .local int rx954_rep
    .local pmc rx954_cur
    (rx954_cur, rx954_pos, rx954_tgt) = self."!cursor_start"()
    rx954_cur."!cursor_debug"("START ", "prefix:sym<-->")
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
.annotate "line", 466
  # rx subcapture "sym"
    set_addr $I10, rxcap_959_fail
    rx954_cur."!mark_push"(0, rx954_pos, $I10)
  # rx literal  "--"
    add $I11, rx954_pos, 2
    gt $I11, rx954_eos, rx954_fail
    sub $I11, rx954_pos, rx954_off
    substr $S10, rx954_tgt, $I11, 2
    ne $S10, "--", rx954_fail
    add rx954_pos, 2
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
    $P10 = rx954_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx954_fail
    rx954_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx954_pos = $P10."pos"()
  # rx pass
    rx954_cur."!cursor_pass"(rx954_pos, "prefix:sym<-->")
    rx954_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx954_pos)
    .return (rx954_cur)
  rx954_fail:
.annotate "line", 421
    (rx954_rep, rx954_pos, $I10, $P10) = rx954_cur."!mark_fail"(0)
    lt rx954_pos, -1, rx954_done
    eq rx954_pos, -1, rx954_fail
    jump $I10
  rx954_done:
    rx954_cur."!cursor_fail"()
    rx954_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx954_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("238_1271336396.90314") :method
.annotate "line", 421
    $P956 = self."!PREFIX__!subrule"("O", "--")
    new $P957, "ResizablePMCArray"
    push $P957, $P956
    .return ($P957)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("239_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx961_tgt
    .local int rx961_pos
    .local int rx961_off
    .local int rx961_eos
    .local int rx961_rep
    .local pmc rx961_cur
    (rx961_cur, rx961_pos, rx961_tgt) = self."!cursor_start"()
    rx961_cur."!cursor_debug"("START ", "postfix:sym<++>")
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
.annotate "line", 469
  # rx subcapture "sym"
    set_addr $I10, rxcap_966_fail
    rx961_cur."!mark_push"(0, rx961_pos, $I10)
  # rx literal  "++"
    add $I11, rx961_pos, 2
    gt $I11, rx961_eos, rx961_fail
    sub $I11, rx961_pos, rx961_off
    substr $S10, rx961_tgt, $I11, 2
    ne $S10, "++", rx961_fail
    add rx961_pos, 2
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
    $P10 = rx961_cur."O"("%autoincrement")
    unless $P10, rx961_fail
    rx961_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx961_pos = $P10."pos"()
  # rx pass
    rx961_cur."!cursor_pass"(rx961_pos, "postfix:sym<++>")
    rx961_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx961_pos)
    .return (rx961_cur)
  rx961_fail:
.annotate "line", 421
    (rx961_rep, rx961_pos, $I10, $P10) = rx961_cur."!mark_fail"(0)
    lt rx961_pos, -1, rx961_done
    eq rx961_pos, -1, rx961_fail
    jump $I10
  rx961_done:
    rx961_cur."!cursor_fail"()
    rx961_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx961_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("240_1271336396.90314") :method
.annotate "line", 421
    $P963 = self."!PREFIX__!subrule"("O", "++")
    new $P964, "ResizablePMCArray"
    push $P964, $P963
    .return ($P964)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("241_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx968_tgt
    .local int rx968_pos
    .local int rx968_off
    .local int rx968_eos
    .local int rx968_rep
    .local pmc rx968_cur
    (rx968_cur, rx968_pos, rx968_tgt) = self."!cursor_start"()
    rx968_cur."!cursor_debug"("START ", "postfix:sym<-->")
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
.annotate "line", 470
  # rx subcapture "sym"
    set_addr $I10, rxcap_973_fail
    rx968_cur."!mark_push"(0, rx968_pos, $I10)
  # rx literal  "--"
    add $I11, rx968_pos, 2
    gt $I11, rx968_eos, rx968_fail
    sub $I11, rx968_pos, rx968_off
    substr $S10, rx968_tgt, $I11, 2
    ne $S10, "--", rx968_fail
    add rx968_pos, 2
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
    $P10 = rx968_cur."O"("%autoincrement")
    unless $P10, rx968_fail
    rx968_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx968_pos = $P10."pos"()
  # rx pass
    rx968_cur."!cursor_pass"(rx968_pos, "postfix:sym<-->")
    rx968_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx968_pos)
    .return (rx968_cur)
  rx968_fail:
.annotate "line", 421
    (rx968_rep, rx968_pos, $I10, $P10) = rx968_cur."!mark_fail"(0)
    lt rx968_pos, -1, rx968_done
    eq rx968_pos, -1, rx968_fail
    jump $I10
  rx968_done:
    rx968_cur."!cursor_fail"()
    rx968_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx968_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("242_1271336396.90314") :method
.annotate "line", 421
    $P970 = self."!PREFIX__!subrule"("O", "--")
    new $P971, "ResizablePMCArray"
    push $P971, $P970
    .return ($P971)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("243_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx975_tgt
    .local int rx975_pos
    .local int rx975_off
    .local int rx975_eos
    .local int rx975_rep
    .local pmc rx975_cur
    (rx975_cur, rx975_pos, rx975_tgt) = self."!cursor_start"()
    rx975_cur."!cursor_debug"("START ", "infix:sym<**>")
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
.annotate "line", 472
  # rx subcapture "sym"
    set_addr $I10, rxcap_980_fail
    rx975_cur."!mark_push"(0, rx975_pos, $I10)
  # rx literal  "**"
    add $I11, rx975_pos, 2
    gt $I11, rx975_eos, rx975_fail
    sub $I11, rx975_pos, rx975_off
    substr $S10, rx975_tgt, $I11, 2
    ne $S10, "**", rx975_fail
    add rx975_pos, 2
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
    $P10 = rx975_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx975_fail
    rx975_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx975_pos = $P10."pos"()
  # rx pass
    rx975_cur."!cursor_pass"(rx975_pos, "infix:sym<**>")
    rx975_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx975_pos)
    .return (rx975_cur)
  rx975_fail:
.annotate "line", 421
    (rx975_rep, rx975_pos, $I10, $P10) = rx975_cur."!mark_fail"(0)
    lt rx975_pos, -1, rx975_done
    eq rx975_pos, -1, rx975_fail
    jump $I10
  rx975_done:
    rx975_cur."!cursor_fail"()
    rx975_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx975_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("244_1271336396.90314") :method
.annotate "line", 421
    $P977 = self."!PREFIX__!subrule"("O", "**")
    new $P978, "ResizablePMCArray"
    push $P978, $P977
    .return ($P978)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("245_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx982_tgt
    .local int rx982_pos
    .local int rx982_off
    .local int rx982_eos
    .local int rx982_rep
    .local pmc rx982_cur
    (rx982_cur, rx982_pos, rx982_tgt) = self."!cursor_start"()
    rx982_cur."!cursor_debug"("START ", "prefix:sym<+>")
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
.annotate "line", 474
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
    $P10 = rx982_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx982_fail
    rx982_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx982_pos = $P10."pos"()
  # rx pass
    rx982_cur."!cursor_pass"(rx982_pos, "prefix:sym<+>")
    rx982_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx982_pos)
    .return (rx982_cur)
  rx982_fail:
.annotate "line", 421
    (rx982_rep, rx982_pos, $I10, $P10) = rx982_cur."!mark_fail"(0)
    lt rx982_pos, -1, rx982_done
    eq rx982_pos, -1, rx982_fail
    jump $I10
  rx982_done:
    rx982_cur."!cursor_fail"()
    rx982_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx982_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("246_1271336396.90314") :method
.annotate "line", 421
    $P984 = self."!PREFIX__!subrule"("O", "+")
    new $P985, "ResizablePMCArray"
    push $P985, $P984
    .return ($P985)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("247_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx989_tgt
    .local int rx989_pos
    .local int rx989_off
    .local int rx989_eos
    .local int rx989_rep
    .local pmc rx989_cur
    (rx989_cur, rx989_pos, rx989_tgt) = self."!cursor_start"()
    rx989_cur."!cursor_debug"("START ", "prefix:sym<~>")
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
.annotate "line", 475
  # rx subcapture "sym"
    set_addr $I10, rxcap_994_fail
    rx989_cur."!mark_push"(0, rx989_pos, $I10)
  # rx literal  "~"
    add $I11, rx989_pos, 1
    gt $I11, rx989_eos, rx989_fail
    sub $I11, rx989_pos, rx989_off
    substr $S10, rx989_tgt, $I11, 1
    ne $S10, "~", rx989_fail
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
    $P10 = rx989_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx989_fail
    rx989_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx989_pos = $P10."pos"()
  # rx pass
    rx989_cur."!cursor_pass"(rx989_pos, "prefix:sym<~>")
    rx989_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx989_pos)
    .return (rx989_cur)
  rx989_fail:
.annotate "line", 421
    (rx989_rep, rx989_pos, $I10, $P10) = rx989_cur."!mark_fail"(0)
    lt rx989_pos, -1, rx989_done
    eq rx989_pos, -1, rx989_fail
    jump $I10
  rx989_done:
    rx989_cur."!cursor_fail"()
    rx989_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx989_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("248_1271336396.90314") :method
.annotate "line", 421
    $P991 = self."!PREFIX__!subrule"("O", "~")
    new $P992, "ResizablePMCArray"
    push $P992, $P991
    .return ($P992)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("249_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx996_tgt
    .local int rx996_pos
    .local int rx996_off
    .local int rx996_eos
    .local int rx996_rep
    .local pmc rx996_cur
    (rx996_cur, rx996_pos, rx996_tgt) = self."!cursor_start"()
    rx996_cur."!cursor_debug"("START ", "prefix:sym<->")
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
    ne $I10, -1, rxscan999_done
    goto rxscan999_scan
  rxscan999_loop:
    ($P10) = rx996_cur."from"()
    inc $P10
    set rx996_pos, $P10
    ge rx996_pos, rx996_eos, rxscan999_done
  rxscan999_scan:
    set_addr $I10, rxscan999_loop
    rx996_cur."!mark_push"(0, rx996_pos, $I10)
  rxscan999_done:
.annotate "line", 476
  # rx subcapture "sym"
    set_addr $I10, rxcap_1000_fail
    rx996_cur."!mark_push"(0, rx996_pos, $I10)
  # rx literal  "-"
    add $I11, rx996_pos, 1
    gt $I11, rx996_eos, rx996_fail
    sub $I11, rx996_pos, rx996_off
    substr $S10, rx996_tgt, $I11, 1
    ne $S10, "-", rx996_fail
    add rx996_pos, 1
    set_addr $I10, rxcap_1000_fail
    ($I12, $I11) = rx996_cur."!mark_peek"($I10)
    rx996_cur."!cursor_pos"($I11)
    ($P10) = rx996_cur."!cursor_start"()
    $P10."!cursor_pass"(rx996_pos, "")
    rx996_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1000_done
  rxcap_1000_fail:
    goto rx996_fail
  rxcap_1000_done:
  # rx enumcharlist negate=1 zerowidth
    ge rx996_pos, rx996_eos, rx996_fail
    sub $I10, rx996_pos, rx996_off
    substr $S10, rx996_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx996_fail
  # rx subrule "number" subtype=zerowidth negate=1
    rx996_cur."!cursor_pos"(rx996_pos)
    $P10 = rx996_cur."number"()
    if $P10, rx996_fail
  # rx subrule "O" subtype=capture negate=
    rx996_cur."!cursor_pos"(rx996_pos)
    $P10 = rx996_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx996_fail
    rx996_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx996_pos = $P10."pos"()
  # rx pass
    rx996_cur."!cursor_pass"(rx996_pos, "prefix:sym<->")
    rx996_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx996_pos)
    .return (rx996_cur)
  rx996_fail:
.annotate "line", 421
    (rx996_rep, rx996_pos, $I10, $P10) = rx996_cur."!mark_fail"(0)
    lt rx996_pos, -1, rx996_done
    eq rx996_pos, -1, rx996_fail
    jump $I10
  rx996_done:
    rx996_cur."!cursor_fail"()
    rx996_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx996_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("250_1271336396.90314") :method
.annotate "line", 421
    new $P998, "ResizablePMCArray"
    push $P998, "-"
    .return ($P998)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("251_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1002_tgt
    .local int rx1002_pos
    .local int rx1002_off
    .local int rx1002_eos
    .local int rx1002_rep
    .local pmc rx1002_cur
    (rx1002_cur, rx1002_pos, rx1002_tgt) = self."!cursor_start"()
    rx1002_cur."!cursor_debug"("START ", "prefix:sym<?>")
    .lex unicode:"$\x{a2}", rx1002_cur
    .local pmc match
    .lex "$/", match
    length rx1002_eos, rx1002_tgt
    set rx1002_off, 0
    lt rx1002_pos, 2, rx1002_start
    sub rx1002_off, rx1002_pos, 1
    substr rx1002_tgt, rx1002_tgt, rx1002_off
  rx1002_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1006_done
    goto rxscan1006_scan
  rxscan1006_loop:
    ($P10) = rx1002_cur."from"()
    inc $P10
    set rx1002_pos, $P10
    ge rx1002_pos, rx1002_eos, rxscan1006_done
  rxscan1006_scan:
    set_addr $I10, rxscan1006_loop
    rx1002_cur."!mark_push"(0, rx1002_pos, $I10)
  rxscan1006_done:
.annotate "line", 477
  # rx subcapture "sym"
    set_addr $I10, rxcap_1007_fail
    rx1002_cur."!mark_push"(0, rx1002_pos, $I10)
  # rx literal  "?"
    add $I11, rx1002_pos, 1
    gt $I11, rx1002_eos, rx1002_fail
    sub $I11, rx1002_pos, rx1002_off
    substr $S10, rx1002_tgt, $I11, 1
    ne $S10, "?", rx1002_fail
    add rx1002_pos, 1
    set_addr $I10, rxcap_1007_fail
    ($I12, $I11) = rx1002_cur."!mark_peek"($I10)
    rx1002_cur."!cursor_pos"($I11)
    ($P10) = rx1002_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1002_pos, "")
    rx1002_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1007_done
  rxcap_1007_fail:
    goto rx1002_fail
  rxcap_1007_done:
  # rx subrule "O" subtype=capture negate=
    rx1002_cur."!cursor_pos"(rx1002_pos)
    $P10 = rx1002_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx1002_fail
    rx1002_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1002_pos = $P10."pos"()
  # rx pass
    rx1002_cur."!cursor_pass"(rx1002_pos, "prefix:sym<?>")
    rx1002_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx1002_pos)
    .return (rx1002_cur)
  rx1002_fail:
.annotate "line", 421
    (rx1002_rep, rx1002_pos, $I10, $P10) = rx1002_cur."!mark_fail"(0)
    lt rx1002_pos, -1, rx1002_done
    eq rx1002_pos, -1, rx1002_fail
    jump $I10
  rx1002_done:
    rx1002_cur."!cursor_fail"()
    rx1002_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx1002_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("252_1271336396.90314") :method
.annotate "line", 421
    $P1004 = self."!PREFIX__!subrule"("O", "?")
    new $P1005, "ResizablePMCArray"
    push $P1005, $P1004
    .return ($P1005)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("253_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1009_tgt
    .local int rx1009_pos
    .local int rx1009_off
    .local int rx1009_eos
    .local int rx1009_rep
    .local pmc rx1009_cur
    (rx1009_cur, rx1009_pos, rx1009_tgt) = self."!cursor_start"()
    rx1009_cur."!cursor_debug"("START ", "prefix:sym<!>")
    .lex unicode:"$\x{a2}", rx1009_cur
    .local pmc match
    .lex "$/", match
    length rx1009_eos, rx1009_tgt
    set rx1009_off, 0
    lt rx1009_pos, 2, rx1009_start
    sub rx1009_off, rx1009_pos, 1
    substr rx1009_tgt, rx1009_tgt, rx1009_off
  rx1009_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1013_done
    goto rxscan1013_scan
  rxscan1013_loop:
    ($P10) = rx1009_cur."from"()
    inc $P10
    set rx1009_pos, $P10
    ge rx1009_pos, rx1009_eos, rxscan1013_done
  rxscan1013_scan:
    set_addr $I10, rxscan1013_loop
    rx1009_cur."!mark_push"(0, rx1009_pos, $I10)
  rxscan1013_done:
.annotate "line", 478
  # rx subcapture "sym"
    set_addr $I10, rxcap_1014_fail
    rx1009_cur."!mark_push"(0, rx1009_pos, $I10)
  # rx literal  "!"
    add $I11, rx1009_pos, 1
    gt $I11, rx1009_eos, rx1009_fail
    sub $I11, rx1009_pos, rx1009_off
    substr $S10, rx1009_tgt, $I11, 1
    ne $S10, "!", rx1009_fail
    add rx1009_pos, 1
    set_addr $I10, rxcap_1014_fail
    ($I12, $I11) = rx1009_cur."!mark_peek"($I10)
    rx1009_cur."!cursor_pos"($I11)
    ($P10) = rx1009_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1009_pos, "")
    rx1009_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1014_done
  rxcap_1014_fail:
    goto rx1009_fail
  rxcap_1014_done:
  # rx subrule "O" subtype=capture negate=
    rx1009_cur."!cursor_pos"(rx1009_pos)
    $P10 = rx1009_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx1009_fail
    rx1009_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1009_pos = $P10."pos"()
  # rx pass
    rx1009_cur."!cursor_pass"(rx1009_pos, "prefix:sym<!>")
    rx1009_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx1009_pos)
    .return (rx1009_cur)
  rx1009_fail:
.annotate "line", 421
    (rx1009_rep, rx1009_pos, $I10, $P10) = rx1009_cur."!mark_fail"(0)
    lt rx1009_pos, -1, rx1009_done
    eq rx1009_pos, -1, rx1009_fail
    jump $I10
  rx1009_done:
    rx1009_cur."!cursor_fail"()
    rx1009_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx1009_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("254_1271336396.90314") :method
.annotate "line", 421
    $P1011 = self."!PREFIX__!subrule"("O", "!")
    new $P1012, "ResizablePMCArray"
    push $P1012, $P1011
    .return ($P1012)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("255_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1016_tgt
    .local int rx1016_pos
    .local int rx1016_off
    .local int rx1016_eos
    .local int rx1016_rep
    .local pmc rx1016_cur
    (rx1016_cur, rx1016_pos, rx1016_tgt) = self."!cursor_start"()
    rx1016_cur."!cursor_debug"("START ", "prefix:sym<|>")
    .lex unicode:"$\x{a2}", rx1016_cur
    .local pmc match
    .lex "$/", match
    length rx1016_eos, rx1016_tgt
    set rx1016_off, 0
    lt rx1016_pos, 2, rx1016_start
    sub rx1016_off, rx1016_pos, 1
    substr rx1016_tgt, rx1016_tgt, rx1016_off
  rx1016_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1020_done
    goto rxscan1020_scan
  rxscan1020_loop:
    ($P10) = rx1016_cur."from"()
    inc $P10
    set rx1016_pos, $P10
    ge rx1016_pos, rx1016_eos, rxscan1020_done
  rxscan1020_scan:
    set_addr $I10, rxscan1020_loop
    rx1016_cur."!mark_push"(0, rx1016_pos, $I10)
  rxscan1020_done:
.annotate "line", 479
  # rx subcapture "sym"
    set_addr $I10, rxcap_1021_fail
    rx1016_cur."!mark_push"(0, rx1016_pos, $I10)
  # rx literal  "|"
    add $I11, rx1016_pos, 1
    gt $I11, rx1016_eos, rx1016_fail
    sub $I11, rx1016_pos, rx1016_off
    substr $S10, rx1016_tgt, $I11, 1
    ne $S10, "|", rx1016_fail
    add rx1016_pos, 1
    set_addr $I10, rxcap_1021_fail
    ($I12, $I11) = rx1016_cur."!mark_peek"($I10)
    rx1016_cur."!cursor_pos"($I11)
    ($P10) = rx1016_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1016_pos, "")
    rx1016_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1021_done
  rxcap_1021_fail:
    goto rx1016_fail
  rxcap_1021_done:
  # rx subrule "O" subtype=capture negate=
    rx1016_cur."!cursor_pos"(rx1016_pos)
    $P10 = rx1016_cur."O"("%symbolic_unary")
    unless $P10, rx1016_fail
    rx1016_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1016_pos = $P10."pos"()
  # rx pass
    rx1016_cur."!cursor_pass"(rx1016_pos, "prefix:sym<|>")
    rx1016_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx1016_pos)
    .return (rx1016_cur)
  rx1016_fail:
.annotate "line", 421
    (rx1016_rep, rx1016_pos, $I10, $P10) = rx1016_cur."!mark_fail"(0)
    lt rx1016_pos, -1, rx1016_done
    eq rx1016_pos, -1, rx1016_fail
    jump $I10
  rx1016_done:
    rx1016_cur."!cursor_fail"()
    rx1016_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx1016_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("256_1271336396.90314") :method
.annotate "line", 421
    $P1018 = self."!PREFIX__!subrule"("O", "|")
    new $P1019, "ResizablePMCArray"
    push $P1019, $P1018
    .return ($P1019)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("257_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1023_tgt
    .local int rx1023_pos
    .local int rx1023_off
    .local int rx1023_eos
    .local int rx1023_rep
    .local pmc rx1023_cur
    (rx1023_cur, rx1023_pos, rx1023_tgt) = self."!cursor_start"()
    rx1023_cur."!cursor_debug"("START ", "infix:sym<*>")
    .lex unicode:"$\x{a2}", rx1023_cur
    .local pmc match
    .lex "$/", match
    length rx1023_eos, rx1023_tgt
    set rx1023_off, 0
    lt rx1023_pos, 2, rx1023_start
    sub rx1023_off, rx1023_pos, 1
    substr rx1023_tgt, rx1023_tgt, rx1023_off
  rx1023_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1027_done
    goto rxscan1027_scan
  rxscan1027_loop:
    ($P10) = rx1023_cur."from"()
    inc $P10
    set rx1023_pos, $P10
    ge rx1023_pos, rx1023_eos, rxscan1027_done
  rxscan1027_scan:
    set_addr $I10, rxscan1027_loop
    rx1023_cur."!mark_push"(0, rx1023_pos, $I10)
  rxscan1027_done:
.annotate "line", 481
  # rx subcapture "sym"
    set_addr $I10, rxcap_1028_fail
    rx1023_cur."!mark_push"(0, rx1023_pos, $I10)
  # rx literal  "*"
    add $I11, rx1023_pos, 1
    gt $I11, rx1023_eos, rx1023_fail
    sub $I11, rx1023_pos, rx1023_off
    substr $S10, rx1023_tgt, $I11, 1
    ne $S10, "*", rx1023_fail
    add rx1023_pos, 1
    set_addr $I10, rxcap_1028_fail
    ($I12, $I11) = rx1023_cur."!mark_peek"($I10)
    rx1023_cur."!cursor_pos"($I11)
    ($P10) = rx1023_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1023_pos, "")
    rx1023_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1028_done
  rxcap_1028_fail:
    goto rx1023_fail
  rxcap_1028_done:
  # rx subrule "O" subtype=capture negate=
    rx1023_cur."!cursor_pos"(rx1023_pos)
    $P10 = rx1023_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx1023_fail
    rx1023_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1023_pos = $P10."pos"()
  # rx pass
    rx1023_cur."!cursor_pass"(rx1023_pos, "infix:sym<*>")
    rx1023_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx1023_pos)
    .return (rx1023_cur)
  rx1023_fail:
.annotate "line", 421
    (rx1023_rep, rx1023_pos, $I10, $P10) = rx1023_cur."!mark_fail"(0)
    lt rx1023_pos, -1, rx1023_done
    eq rx1023_pos, -1, rx1023_fail
    jump $I10
  rx1023_done:
    rx1023_cur."!cursor_fail"()
    rx1023_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx1023_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("258_1271336396.90314") :method
.annotate "line", 421
    $P1025 = self."!PREFIX__!subrule"("O", "*")
    new $P1026, "ResizablePMCArray"
    push $P1026, $P1025
    .return ($P1026)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("259_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1030_tgt
    .local int rx1030_pos
    .local int rx1030_off
    .local int rx1030_eos
    .local int rx1030_rep
    .local pmc rx1030_cur
    (rx1030_cur, rx1030_pos, rx1030_tgt) = self."!cursor_start"()
    rx1030_cur."!cursor_debug"("START ", "infix:sym</>")
    .lex unicode:"$\x{a2}", rx1030_cur
    .local pmc match
    .lex "$/", match
    length rx1030_eos, rx1030_tgt
    set rx1030_off, 0
    lt rx1030_pos, 2, rx1030_start
    sub rx1030_off, rx1030_pos, 1
    substr rx1030_tgt, rx1030_tgt, rx1030_off
  rx1030_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1034_done
    goto rxscan1034_scan
  rxscan1034_loop:
    ($P10) = rx1030_cur."from"()
    inc $P10
    set rx1030_pos, $P10
    ge rx1030_pos, rx1030_eos, rxscan1034_done
  rxscan1034_scan:
    set_addr $I10, rxscan1034_loop
    rx1030_cur."!mark_push"(0, rx1030_pos, $I10)
  rxscan1034_done:
.annotate "line", 482
  # rx subcapture "sym"
    set_addr $I10, rxcap_1035_fail
    rx1030_cur."!mark_push"(0, rx1030_pos, $I10)
  # rx literal  "/"
    add $I11, rx1030_pos, 1
    gt $I11, rx1030_eos, rx1030_fail
    sub $I11, rx1030_pos, rx1030_off
    substr $S10, rx1030_tgt, $I11, 1
    ne $S10, "/", rx1030_fail
    add rx1030_pos, 1
    set_addr $I10, rxcap_1035_fail
    ($I12, $I11) = rx1030_cur."!mark_peek"($I10)
    rx1030_cur."!cursor_pos"($I11)
    ($P10) = rx1030_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1030_pos, "")
    rx1030_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1035_done
  rxcap_1035_fail:
    goto rx1030_fail
  rxcap_1035_done:
  # rx subrule "O" subtype=capture negate=
    rx1030_cur."!cursor_pos"(rx1030_pos)
    $P10 = rx1030_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx1030_fail
    rx1030_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1030_pos = $P10."pos"()
  # rx pass
    rx1030_cur."!cursor_pass"(rx1030_pos, "infix:sym</>")
    rx1030_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx1030_pos)
    .return (rx1030_cur)
  rx1030_fail:
.annotate "line", 421
    (rx1030_rep, rx1030_pos, $I10, $P10) = rx1030_cur."!mark_fail"(0)
    lt rx1030_pos, -1, rx1030_done
    eq rx1030_pos, -1, rx1030_fail
    jump $I10
  rx1030_done:
    rx1030_cur."!cursor_fail"()
    rx1030_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx1030_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("260_1271336396.90314") :method
.annotate "line", 421
    $P1032 = self."!PREFIX__!subrule"("O", "/")
    new $P1033, "ResizablePMCArray"
    push $P1033, $P1032
    .return ($P1033)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("261_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1037_tgt
    .local int rx1037_pos
    .local int rx1037_off
    .local int rx1037_eos
    .local int rx1037_rep
    .local pmc rx1037_cur
    (rx1037_cur, rx1037_pos, rx1037_tgt) = self."!cursor_start"()
    rx1037_cur."!cursor_debug"("START ", "infix:sym<%>")
    .lex unicode:"$\x{a2}", rx1037_cur
    .local pmc match
    .lex "$/", match
    length rx1037_eos, rx1037_tgt
    set rx1037_off, 0
    lt rx1037_pos, 2, rx1037_start
    sub rx1037_off, rx1037_pos, 1
    substr rx1037_tgt, rx1037_tgt, rx1037_off
  rx1037_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1041_done
    goto rxscan1041_scan
  rxscan1041_loop:
    ($P10) = rx1037_cur."from"()
    inc $P10
    set rx1037_pos, $P10
    ge rx1037_pos, rx1037_eos, rxscan1041_done
  rxscan1041_scan:
    set_addr $I10, rxscan1041_loop
    rx1037_cur."!mark_push"(0, rx1037_pos, $I10)
  rxscan1041_done:
.annotate "line", 483
  # rx subcapture "sym"
    set_addr $I10, rxcap_1042_fail
    rx1037_cur."!mark_push"(0, rx1037_pos, $I10)
  # rx literal  "%"
    add $I11, rx1037_pos, 1
    gt $I11, rx1037_eos, rx1037_fail
    sub $I11, rx1037_pos, rx1037_off
    substr $S10, rx1037_tgt, $I11, 1
    ne $S10, "%", rx1037_fail
    add rx1037_pos, 1
    set_addr $I10, rxcap_1042_fail
    ($I12, $I11) = rx1037_cur."!mark_peek"($I10)
    rx1037_cur."!cursor_pos"($I11)
    ($P10) = rx1037_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1037_pos, "")
    rx1037_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1042_done
  rxcap_1042_fail:
    goto rx1037_fail
  rxcap_1042_done:
  # rx subrule "O" subtype=capture negate=
    rx1037_cur."!cursor_pos"(rx1037_pos)
    $P10 = rx1037_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx1037_fail
    rx1037_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1037_pos = $P10."pos"()
  # rx pass
    rx1037_cur."!cursor_pass"(rx1037_pos, "infix:sym<%>")
    rx1037_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx1037_pos)
    .return (rx1037_cur)
  rx1037_fail:
.annotate "line", 421
    (rx1037_rep, rx1037_pos, $I10, $P10) = rx1037_cur."!mark_fail"(0)
    lt rx1037_pos, -1, rx1037_done
    eq rx1037_pos, -1, rx1037_fail
    jump $I10
  rx1037_done:
    rx1037_cur."!cursor_fail"()
    rx1037_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx1037_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("262_1271336396.90314") :method
.annotate "line", 421
    $P1039 = self."!PREFIX__!subrule"("O", "%")
    new $P1040, "ResizablePMCArray"
    push $P1040, $P1039
    .return ($P1040)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("263_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1044_tgt
    .local int rx1044_pos
    .local int rx1044_off
    .local int rx1044_eos
    .local int rx1044_rep
    .local pmc rx1044_cur
    (rx1044_cur, rx1044_pos, rx1044_tgt) = self."!cursor_start"()
    rx1044_cur."!cursor_debug"("START ", "infix:sym<+>")
    .lex unicode:"$\x{a2}", rx1044_cur
    .local pmc match
    .lex "$/", match
    length rx1044_eos, rx1044_tgt
    set rx1044_off, 0
    lt rx1044_pos, 2, rx1044_start
    sub rx1044_off, rx1044_pos, 1
    substr rx1044_tgt, rx1044_tgt, rx1044_off
  rx1044_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1048_done
    goto rxscan1048_scan
  rxscan1048_loop:
    ($P10) = rx1044_cur."from"()
    inc $P10
    set rx1044_pos, $P10
    ge rx1044_pos, rx1044_eos, rxscan1048_done
  rxscan1048_scan:
    set_addr $I10, rxscan1048_loop
    rx1044_cur."!mark_push"(0, rx1044_pos, $I10)
  rxscan1048_done:
.annotate "line", 485
  # rx subcapture "sym"
    set_addr $I10, rxcap_1049_fail
    rx1044_cur."!mark_push"(0, rx1044_pos, $I10)
  # rx literal  "+"
    add $I11, rx1044_pos, 1
    gt $I11, rx1044_eos, rx1044_fail
    sub $I11, rx1044_pos, rx1044_off
    substr $S10, rx1044_tgt, $I11, 1
    ne $S10, "+", rx1044_fail
    add rx1044_pos, 1
    set_addr $I10, rxcap_1049_fail
    ($I12, $I11) = rx1044_cur."!mark_peek"($I10)
    rx1044_cur."!cursor_pos"($I11)
    ($P10) = rx1044_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1044_pos, "")
    rx1044_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1049_done
  rxcap_1049_fail:
    goto rx1044_fail
  rxcap_1049_done:
  # rx subrule "O" subtype=capture negate=
    rx1044_cur."!cursor_pos"(rx1044_pos)
    $P10 = rx1044_cur."O"("%additive, :pirop<add>")
    unless $P10, rx1044_fail
    rx1044_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1044_pos = $P10."pos"()
  # rx pass
    rx1044_cur."!cursor_pass"(rx1044_pos, "infix:sym<+>")
    rx1044_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx1044_pos)
    .return (rx1044_cur)
  rx1044_fail:
.annotate "line", 421
    (rx1044_rep, rx1044_pos, $I10, $P10) = rx1044_cur."!mark_fail"(0)
    lt rx1044_pos, -1, rx1044_done
    eq rx1044_pos, -1, rx1044_fail
    jump $I10
  rx1044_done:
    rx1044_cur."!cursor_fail"()
    rx1044_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx1044_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("264_1271336396.90314") :method
.annotate "line", 421
    $P1046 = self."!PREFIX__!subrule"("O", "+")
    new $P1047, "ResizablePMCArray"
    push $P1047, $P1046
    .return ($P1047)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("265_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1051_tgt
    .local int rx1051_pos
    .local int rx1051_off
    .local int rx1051_eos
    .local int rx1051_rep
    .local pmc rx1051_cur
    (rx1051_cur, rx1051_pos, rx1051_tgt) = self."!cursor_start"()
    rx1051_cur."!cursor_debug"("START ", "infix:sym<->")
    .lex unicode:"$\x{a2}", rx1051_cur
    .local pmc match
    .lex "$/", match
    length rx1051_eos, rx1051_tgt
    set rx1051_off, 0
    lt rx1051_pos, 2, rx1051_start
    sub rx1051_off, rx1051_pos, 1
    substr rx1051_tgt, rx1051_tgt, rx1051_off
  rx1051_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1055_done
    goto rxscan1055_scan
  rxscan1055_loop:
    ($P10) = rx1051_cur."from"()
    inc $P10
    set rx1051_pos, $P10
    ge rx1051_pos, rx1051_eos, rxscan1055_done
  rxscan1055_scan:
    set_addr $I10, rxscan1055_loop
    rx1051_cur."!mark_push"(0, rx1051_pos, $I10)
  rxscan1055_done:
.annotate "line", 486
  # rx subcapture "sym"
    set_addr $I10, rxcap_1056_fail
    rx1051_cur."!mark_push"(0, rx1051_pos, $I10)
  # rx literal  "-"
    add $I11, rx1051_pos, 1
    gt $I11, rx1051_eos, rx1051_fail
    sub $I11, rx1051_pos, rx1051_off
    substr $S10, rx1051_tgt, $I11, 1
    ne $S10, "-", rx1051_fail
    add rx1051_pos, 1
    set_addr $I10, rxcap_1056_fail
    ($I12, $I11) = rx1051_cur."!mark_peek"($I10)
    rx1051_cur."!cursor_pos"($I11)
    ($P10) = rx1051_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1051_pos, "")
    rx1051_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1056_done
  rxcap_1056_fail:
    goto rx1051_fail
  rxcap_1056_done:
  # rx subrule "O" subtype=capture negate=
    rx1051_cur."!cursor_pos"(rx1051_pos)
    $P10 = rx1051_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx1051_fail
    rx1051_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1051_pos = $P10."pos"()
  # rx pass
    rx1051_cur."!cursor_pass"(rx1051_pos, "infix:sym<->")
    rx1051_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx1051_pos)
    .return (rx1051_cur)
  rx1051_fail:
.annotate "line", 421
    (rx1051_rep, rx1051_pos, $I10, $P10) = rx1051_cur."!mark_fail"(0)
    lt rx1051_pos, -1, rx1051_done
    eq rx1051_pos, -1, rx1051_fail
    jump $I10
  rx1051_done:
    rx1051_cur."!cursor_fail"()
    rx1051_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx1051_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("266_1271336396.90314") :method
.annotate "line", 421
    $P1053 = self."!PREFIX__!subrule"("O", "-")
    new $P1054, "ResizablePMCArray"
    push $P1054, $P1053
    .return ($P1054)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("267_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1058_tgt
    .local int rx1058_pos
    .local int rx1058_off
    .local int rx1058_eos
    .local int rx1058_rep
    .local pmc rx1058_cur
    (rx1058_cur, rx1058_pos, rx1058_tgt) = self."!cursor_start"()
    rx1058_cur."!cursor_debug"("START ", "infix:sym<~>")
    .lex unicode:"$\x{a2}", rx1058_cur
    .local pmc match
    .lex "$/", match
    length rx1058_eos, rx1058_tgt
    set rx1058_off, 0
    lt rx1058_pos, 2, rx1058_start
    sub rx1058_off, rx1058_pos, 1
    substr rx1058_tgt, rx1058_tgt, rx1058_off
  rx1058_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1062_done
    goto rxscan1062_scan
  rxscan1062_loop:
    ($P10) = rx1058_cur."from"()
    inc $P10
    set rx1058_pos, $P10
    ge rx1058_pos, rx1058_eos, rxscan1062_done
  rxscan1062_scan:
    set_addr $I10, rxscan1062_loop
    rx1058_cur."!mark_push"(0, rx1058_pos, $I10)
  rxscan1062_done:
.annotate "line", 488
  # rx subcapture "sym"
    set_addr $I10, rxcap_1063_fail
    rx1058_cur."!mark_push"(0, rx1058_pos, $I10)
  # rx literal  "~"
    add $I11, rx1058_pos, 1
    gt $I11, rx1058_eos, rx1058_fail
    sub $I11, rx1058_pos, rx1058_off
    substr $S10, rx1058_tgt, $I11, 1
    ne $S10, "~", rx1058_fail
    add rx1058_pos, 1
    set_addr $I10, rxcap_1063_fail
    ($I12, $I11) = rx1058_cur."!mark_peek"($I10)
    rx1058_cur."!cursor_pos"($I11)
    ($P10) = rx1058_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1058_pos, "")
    rx1058_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1063_done
  rxcap_1063_fail:
    goto rx1058_fail
  rxcap_1063_done:
  # rx subrule "O" subtype=capture negate=
    rx1058_cur."!cursor_pos"(rx1058_pos)
    $P10 = rx1058_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx1058_fail
    rx1058_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1058_pos = $P10."pos"()
  # rx pass
    rx1058_cur."!cursor_pass"(rx1058_pos, "infix:sym<~>")
    rx1058_cur."!cursor_debug"("PASS  ", "infix:sym<~>", " at pos=", rx1058_pos)
    .return (rx1058_cur)
  rx1058_fail:
.annotate "line", 421
    (rx1058_rep, rx1058_pos, $I10, $P10) = rx1058_cur."!mark_fail"(0)
    lt rx1058_pos, -1, rx1058_done
    eq rx1058_pos, -1, rx1058_fail
    jump $I10
  rx1058_done:
    rx1058_cur."!cursor_fail"()
    rx1058_cur."!cursor_debug"("FAIL  ", "infix:sym<~>")
    .return (rx1058_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("268_1271336396.90314") :method
.annotate "line", 421
    $P1060 = self."!PREFIX__!subrule"("O", "~")
    new $P1061, "ResizablePMCArray"
    push $P1061, $P1060
    .return ($P1061)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("269_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1065_tgt
    .local int rx1065_pos
    .local int rx1065_off
    .local int rx1065_eos
    .local int rx1065_rep
    .local pmc rx1065_cur
    (rx1065_cur, rx1065_pos, rx1065_tgt) = self."!cursor_start"()
    rx1065_cur."!cursor_debug"("START ", "infix:sym<==>")
    .lex unicode:"$\x{a2}", rx1065_cur
    .local pmc match
    .lex "$/", match
    length rx1065_eos, rx1065_tgt
    set rx1065_off, 0
    lt rx1065_pos, 2, rx1065_start
    sub rx1065_off, rx1065_pos, 1
    substr rx1065_tgt, rx1065_tgt, rx1065_off
  rx1065_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1069_done
    goto rxscan1069_scan
  rxscan1069_loop:
    ($P10) = rx1065_cur."from"()
    inc $P10
    set rx1065_pos, $P10
    ge rx1065_pos, rx1065_eos, rxscan1069_done
  rxscan1069_scan:
    set_addr $I10, rxscan1069_loop
    rx1065_cur."!mark_push"(0, rx1065_pos, $I10)
  rxscan1069_done:
.annotate "line", 490
  # rx subcapture "sym"
    set_addr $I10, rxcap_1070_fail
    rx1065_cur."!mark_push"(0, rx1065_pos, $I10)
  # rx literal  "=="
    add $I11, rx1065_pos, 2
    gt $I11, rx1065_eos, rx1065_fail
    sub $I11, rx1065_pos, rx1065_off
    substr $S10, rx1065_tgt, $I11, 2
    ne $S10, "==", rx1065_fail
    add rx1065_pos, 2
    set_addr $I10, rxcap_1070_fail
    ($I12, $I11) = rx1065_cur."!mark_peek"($I10)
    rx1065_cur."!cursor_pos"($I11)
    ($P10) = rx1065_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1065_pos, "")
    rx1065_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1070_done
  rxcap_1070_fail:
    goto rx1065_fail
  rxcap_1070_done:
  # rx subrule "O" subtype=capture negate=
    rx1065_cur."!cursor_pos"(rx1065_pos)
    $P10 = rx1065_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx1065_fail
    rx1065_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1065_pos = $P10."pos"()
  # rx pass
    rx1065_cur."!cursor_pass"(rx1065_pos, "infix:sym<==>")
    rx1065_cur."!cursor_debug"("PASS  ", "infix:sym<==>", " at pos=", rx1065_pos)
    .return (rx1065_cur)
  rx1065_fail:
.annotate "line", 421
    (rx1065_rep, rx1065_pos, $I10, $P10) = rx1065_cur."!mark_fail"(0)
    lt rx1065_pos, -1, rx1065_done
    eq rx1065_pos, -1, rx1065_fail
    jump $I10
  rx1065_done:
    rx1065_cur."!cursor_fail"()
    rx1065_cur."!cursor_debug"("FAIL  ", "infix:sym<==>")
    .return (rx1065_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("270_1271336396.90314") :method
.annotate "line", 421
    $P1067 = self."!PREFIX__!subrule"("O", "==")
    new $P1068, "ResizablePMCArray"
    push $P1068, $P1067
    .return ($P1068)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("271_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1072_tgt
    .local int rx1072_pos
    .local int rx1072_off
    .local int rx1072_eos
    .local int rx1072_rep
    .local pmc rx1072_cur
    (rx1072_cur, rx1072_pos, rx1072_tgt) = self."!cursor_start"()
    rx1072_cur."!cursor_debug"("START ", "infix:sym<!=>")
    .lex unicode:"$\x{a2}", rx1072_cur
    .local pmc match
    .lex "$/", match
    length rx1072_eos, rx1072_tgt
    set rx1072_off, 0
    lt rx1072_pos, 2, rx1072_start
    sub rx1072_off, rx1072_pos, 1
    substr rx1072_tgt, rx1072_tgt, rx1072_off
  rx1072_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1076_done
    goto rxscan1076_scan
  rxscan1076_loop:
    ($P10) = rx1072_cur."from"()
    inc $P10
    set rx1072_pos, $P10
    ge rx1072_pos, rx1072_eos, rxscan1076_done
  rxscan1076_scan:
    set_addr $I10, rxscan1076_loop
    rx1072_cur."!mark_push"(0, rx1072_pos, $I10)
  rxscan1076_done:
.annotate "line", 491
  # rx subcapture "sym"
    set_addr $I10, rxcap_1077_fail
    rx1072_cur."!mark_push"(0, rx1072_pos, $I10)
  # rx literal  "!="
    add $I11, rx1072_pos, 2
    gt $I11, rx1072_eos, rx1072_fail
    sub $I11, rx1072_pos, rx1072_off
    substr $S10, rx1072_tgt, $I11, 2
    ne $S10, "!=", rx1072_fail
    add rx1072_pos, 2
    set_addr $I10, rxcap_1077_fail
    ($I12, $I11) = rx1072_cur."!mark_peek"($I10)
    rx1072_cur."!cursor_pos"($I11)
    ($P10) = rx1072_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1072_pos, "")
    rx1072_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1077_done
  rxcap_1077_fail:
    goto rx1072_fail
  rxcap_1077_done:
  # rx subrule "O" subtype=capture negate=
    rx1072_cur."!cursor_pos"(rx1072_pos)
    $P10 = rx1072_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx1072_fail
    rx1072_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1072_pos = $P10."pos"()
  # rx pass
    rx1072_cur."!cursor_pass"(rx1072_pos, "infix:sym<!=>")
    rx1072_cur."!cursor_debug"("PASS  ", "infix:sym<!=>", " at pos=", rx1072_pos)
    .return (rx1072_cur)
  rx1072_fail:
.annotate "line", 421
    (rx1072_rep, rx1072_pos, $I10, $P10) = rx1072_cur."!mark_fail"(0)
    lt rx1072_pos, -1, rx1072_done
    eq rx1072_pos, -1, rx1072_fail
    jump $I10
  rx1072_done:
    rx1072_cur."!cursor_fail"()
    rx1072_cur."!cursor_debug"("FAIL  ", "infix:sym<!=>")
    .return (rx1072_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("272_1271336396.90314") :method
.annotate "line", 421
    $P1074 = self."!PREFIX__!subrule"("O", "!=")
    new $P1075, "ResizablePMCArray"
    push $P1075, $P1074
    .return ($P1075)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("273_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1079_tgt
    .local int rx1079_pos
    .local int rx1079_off
    .local int rx1079_eos
    .local int rx1079_rep
    .local pmc rx1079_cur
    (rx1079_cur, rx1079_pos, rx1079_tgt) = self."!cursor_start"()
    rx1079_cur."!cursor_debug"("START ", "infix:sym<<=>")
    .lex unicode:"$\x{a2}", rx1079_cur
    .local pmc match
    .lex "$/", match
    length rx1079_eos, rx1079_tgt
    set rx1079_off, 0
    lt rx1079_pos, 2, rx1079_start
    sub rx1079_off, rx1079_pos, 1
    substr rx1079_tgt, rx1079_tgt, rx1079_off
  rx1079_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1083_done
    goto rxscan1083_scan
  rxscan1083_loop:
    ($P10) = rx1079_cur."from"()
    inc $P10
    set rx1079_pos, $P10
    ge rx1079_pos, rx1079_eos, rxscan1083_done
  rxscan1083_scan:
    set_addr $I10, rxscan1083_loop
    rx1079_cur."!mark_push"(0, rx1079_pos, $I10)
  rxscan1083_done:
.annotate "line", 492
  # rx subcapture "sym"
    set_addr $I10, rxcap_1084_fail
    rx1079_cur."!mark_push"(0, rx1079_pos, $I10)
  # rx literal  "<="
    add $I11, rx1079_pos, 2
    gt $I11, rx1079_eos, rx1079_fail
    sub $I11, rx1079_pos, rx1079_off
    substr $S10, rx1079_tgt, $I11, 2
    ne $S10, "<=", rx1079_fail
    add rx1079_pos, 2
    set_addr $I10, rxcap_1084_fail
    ($I12, $I11) = rx1079_cur."!mark_peek"($I10)
    rx1079_cur."!cursor_pos"($I11)
    ($P10) = rx1079_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1079_pos, "")
    rx1079_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1084_done
  rxcap_1084_fail:
    goto rx1079_fail
  rxcap_1084_done:
  # rx subrule "O" subtype=capture negate=
    rx1079_cur."!cursor_pos"(rx1079_pos)
    $P10 = rx1079_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx1079_fail
    rx1079_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1079_pos = $P10."pos"()
  # rx pass
    rx1079_cur."!cursor_pass"(rx1079_pos, "infix:sym<<=>")
    rx1079_cur."!cursor_debug"("PASS  ", "infix:sym<<=>", " at pos=", rx1079_pos)
    .return (rx1079_cur)
  rx1079_fail:
.annotate "line", 421
    (rx1079_rep, rx1079_pos, $I10, $P10) = rx1079_cur."!mark_fail"(0)
    lt rx1079_pos, -1, rx1079_done
    eq rx1079_pos, -1, rx1079_fail
    jump $I10
  rx1079_done:
    rx1079_cur."!cursor_fail"()
    rx1079_cur."!cursor_debug"("FAIL  ", "infix:sym<<=>")
    .return (rx1079_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("274_1271336396.90314") :method
.annotate "line", 421
    $P1081 = self."!PREFIX__!subrule"("O", "<=")
    new $P1082, "ResizablePMCArray"
    push $P1082, $P1081
    .return ($P1082)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("275_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1086_tgt
    .local int rx1086_pos
    .local int rx1086_off
    .local int rx1086_eos
    .local int rx1086_rep
    .local pmc rx1086_cur
    (rx1086_cur, rx1086_pos, rx1086_tgt) = self."!cursor_start"()
    rx1086_cur."!cursor_debug"("START ", "infix:sym<>=>")
    .lex unicode:"$\x{a2}", rx1086_cur
    .local pmc match
    .lex "$/", match
    length rx1086_eos, rx1086_tgt
    set rx1086_off, 0
    lt rx1086_pos, 2, rx1086_start
    sub rx1086_off, rx1086_pos, 1
    substr rx1086_tgt, rx1086_tgt, rx1086_off
  rx1086_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1090_done
    goto rxscan1090_scan
  rxscan1090_loop:
    ($P10) = rx1086_cur."from"()
    inc $P10
    set rx1086_pos, $P10
    ge rx1086_pos, rx1086_eos, rxscan1090_done
  rxscan1090_scan:
    set_addr $I10, rxscan1090_loop
    rx1086_cur."!mark_push"(0, rx1086_pos, $I10)
  rxscan1090_done:
.annotate "line", 493
  # rx subcapture "sym"
    set_addr $I10, rxcap_1091_fail
    rx1086_cur."!mark_push"(0, rx1086_pos, $I10)
  # rx literal  ">="
    add $I11, rx1086_pos, 2
    gt $I11, rx1086_eos, rx1086_fail
    sub $I11, rx1086_pos, rx1086_off
    substr $S10, rx1086_tgt, $I11, 2
    ne $S10, ">=", rx1086_fail
    add rx1086_pos, 2
    set_addr $I10, rxcap_1091_fail
    ($I12, $I11) = rx1086_cur."!mark_peek"($I10)
    rx1086_cur."!cursor_pos"($I11)
    ($P10) = rx1086_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1086_pos, "")
    rx1086_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1091_done
  rxcap_1091_fail:
    goto rx1086_fail
  rxcap_1091_done:
  # rx subrule "O" subtype=capture negate=
    rx1086_cur."!cursor_pos"(rx1086_pos)
    $P10 = rx1086_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx1086_fail
    rx1086_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1086_pos = $P10."pos"()
  # rx pass
    rx1086_cur."!cursor_pass"(rx1086_pos, "infix:sym<>=>")
    rx1086_cur."!cursor_debug"("PASS  ", "infix:sym<>=>", " at pos=", rx1086_pos)
    .return (rx1086_cur)
  rx1086_fail:
.annotate "line", 421
    (rx1086_rep, rx1086_pos, $I10, $P10) = rx1086_cur."!mark_fail"(0)
    lt rx1086_pos, -1, rx1086_done
    eq rx1086_pos, -1, rx1086_fail
    jump $I10
  rx1086_done:
    rx1086_cur."!cursor_fail"()
    rx1086_cur."!cursor_debug"("FAIL  ", "infix:sym<>=>")
    .return (rx1086_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("276_1271336396.90314") :method
.annotate "line", 421
    $P1088 = self."!PREFIX__!subrule"("O", ">=")
    new $P1089, "ResizablePMCArray"
    push $P1089, $P1088
    .return ($P1089)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("277_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1093_tgt
    .local int rx1093_pos
    .local int rx1093_off
    .local int rx1093_eos
    .local int rx1093_rep
    .local pmc rx1093_cur
    (rx1093_cur, rx1093_pos, rx1093_tgt) = self."!cursor_start"()
    rx1093_cur."!cursor_debug"("START ", "infix:sym<<>")
    .lex unicode:"$\x{a2}", rx1093_cur
    .local pmc match
    .lex "$/", match
    length rx1093_eos, rx1093_tgt
    set rx1093_off, 0
    lt rx1093_pos, 2, rx1093_start
    sub rx1093_off, rx1093_pos, 1
    substr rx1093_tgt, rx1093_tgt, rx1093_off
  rx1093_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1097_done
    goto rxscan1097_scan
  rxscan1097_loop:
    ($P10) = rx1093_cur."from"()
    inc $P10
    set rx1093_pos, $P10
    ge rx1093_pos, rx1093_eos, rxscan1097_done
  rxscan1097_scan:
    set_addr $I10, rxscan1097_loop
    rx1093_cur."!mark_push"(0, rx1093_pos, $I10)
  rxscan1097_done:
.annotate "line", 494
  # rx subcapture "sym"
    set_addr $I10, rxcap_1098_fail
    rx1093_cur."!mark_push"(0, rx1093_pos, $I10)
  # rx literal  "<"
    add $I11, rx1093_pos, 1
    gt $I11, rx1093_eos, rx1093_fail
    sub $I11, rx1093_pos, rx1093_off
    substr $S10, rx1093_tgt, $I11, 1
    ne $S10, "<", rx1093_fail
    add rx1093_pos, 1
    set_addr $I10, rxcap_1098_fail
    ($I12, $I11) = rx1093_cur."!mark_peek"($I10)
    rx1093_cur."!cursor_pos"($I11)
    ($P10) = rx1093_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1093_pos, "")
    rx1093_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1098_done
  rxcap_1098_fail:
    goto rx1093_fail
  rxcap_1098_done:
  # rx subrule "O" subtype=capture negate=
    rx1093_cur."!cursor_pos"(rx1093_pos)
    $P10 = rx1093_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx1093_fail
    rx1093_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1093_pos = $P10."pos"()
  # rx pass
    rx1093_cur."!cursor_pass"(rx1093_pos, "infix:sym<<>")
    rx1093_cur."!cursor_debug"("PASS  ", "infix:sym<<>", " at pos=", rx1093_pos)
    .return (rx1093_cur)
  rx1093_fail:
.annotate "line", 421
    (rx1093_rep, rx1093_pos, $I10, $P10) = rx1093_cur."!mark_fail"(0)
    lt rx1093_pos, -1, rx1093_done
    eq rx1093_pos, -1, rx1093_fail
    jump $I10
  rx1093_done:
    rx1093_cur."!cursor_fail"()
    rx1093_cur."!cursor_debug"("FAIL  ", "infix:sym<<>")
    .return (rx1093_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("278_1271336396.90314") :method
.annotate "line", 421
    $P1095 = self."!PREFIX__!subrule"("O", "<")
    new $P1096, "ResizablePMCArray"
    push $P1096, $P1095
    .return ($P1096)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("279_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1100_tgt
    .local int rx1100_pos
    .local int rx1100_off
    .local int rx1100_eos
    .local int rx1100_rep
    .local pmc rx1100_cur
    (rx1100_cur, rx1100_pos, rx1100_tgt) = self."!cursor_start"()
    rx1100_cur."!cursor_debug"("START ", "infix:sym<>>")
    .lex unicode:"$\x{a2}", rx1100_cur
    .local pmc match
    .lex "$/", match
    length rx1100_eos, rx1100_tgt
    set rx1100_off, 0
    lt rx1100_pos, 2, rx1100_start
    sub rx1100_off, rx1100_pos, 1
    substr rx1100_tgt, rx1100_tgt, rx1100_off
  rx1100_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1104_done
    goto rxscan1104_scan
  rxscan1104_loop:
    ($P10) = rx1100_cur."from"()
    inc $P10
    set rx1100_pos, $P10
    ge rx1100_pos, rx1100_eos, rxscan1104_done
  rxscan1104_scan:
    set_addr $I10, rxscan1104_loop
    rx1100_cur."!mark_push"(0, rx1100_pos, $I10)
  rxscan1104_done:
.annotate "line", 495
  # rx subcapture "sym"
    set_addr $I10, rxcap_1105_fail
    rx1100_cur."!mark_push"(0, rx1100_pos, $I10)
  # rx literal  ">"
    add $I11, rx1100_pos, 1
    gt $I11, rx1100_eos, rx1100_fail
    sub $I11, rx1100_pos, rx1100_off
    substr $S10, rx1100_tgt, $I11, 1
    ne $S10, ">", rx1100_fail
    add rx1100_pos, 1
    set_addr $I10, rxcap_1105_fail
    ($I12, $I11) = rx1100_cur."!mark_peek"($I10)
    rx1100_cur."!cursor_pos"($I11)
    ($P10) = rx1100_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1100_pos, "")
    rx1100_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1105_done
  rxcap_1105_fail:
    goto rx1100_fail
  rxcap_1105_done:
  # rx subrule "O" subtype=capture negate=
    rx1100_cur."!cursor_pos"(rx1100_pos)
    $P10 = rx1100_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx1100_fail
    rx1100_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1100_pos = $P10."pos"()
  # rx pass
    rx1100_cur."!cursor_pass"(rx1100_pos, "infix:sym<>>")
    rx1100_cur."!cursor_debug"("PASS  ", "infix:sym<>>", " at pos=", rx1100_pos)
    .return (rx1100_cur)
  rx1100_fail:
.annotate "line", 421
    (rx1100_rep, rx1100_pos, $I10, $P10) = rx1100_cur."!mark_fail"(0)
    lt rx1100_pos, -1, rx1100_done
    eq rx1100_pos, -1, rx1100_fail
    jump $I10
  rx1100_done:
    rx1100_cur."!cursor_fail"()
    rx1100_cur."!cursor_debug"("FAIL  ", "infix:sym<>>")
    .return (rx1100_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("280_1271336396.90314") :method
.annotate "line", 421
    $P1102 = self."!PREFIX__!subrule"("O", ">")
    new $P1103, "ResizablePMCArray"
    push $P1103, $P1102
    .return ($P1103)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("281_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1107_tgt
    .local int rx1107_pos
    .local int rx1107_off
    .local int rx1107_eos
    .local int rx1107_rep
    .local pmc rx1107_cur
    (rx1107_cur, rx1107_pos, rx1107_tgt) = self."!cursor_start"()
    rx1107_cur."!cursor_debug"("START ", "infix:sym<eq>")
    .lex unicode:"$\x{a2}", rx1107_cur
    .local pmc match
    .lex "$/", match
    length rx1107_eos, rx1107_tgt
    set rx1107_off, 0
    lt rx1107_pos, 2, rx1107_start
    sub rx1107_off, rx1107_pos, 1
    substr rx1107_tgt, rx1107_tgt, rx1107_off
  rx1107_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1111_done
    goto rxscan1111_scan
  rxscan1111_loop:
    ($P10) = rx1107_cur."from"()
    inc $P10
    set rx1107_pos, $P10
    ge rx1107_pos, rx1107_eos, rxscan1111_done
  rxscan1111_scan:
    set_addr $I10, rxscan1111_loop
    rx1107_cur."!mark_push"(0, rx1107_pos, $I10)
  rxscan1111_done:
.annotate "line", 496
  # rx subcapture "sym"
    set_addr $I10, rxcap_1112_fail
    rx1107_cur."!mark_push"(0, rx1107_pos, $I10)
  # rx literal  "eq"
    add $I11, rx1107_pos, 2
    gt $I11, rx1107_eos, rx1107_fail
    sub $I11, rx1107_pos, rx1107_off
    substr $S10, rx1107_tgt, $I11, 2
    ne $S10, "eq", rx1107_fail
    add rx1107_pos, 2
    set_addr $I10, rxcap_1112_fail
    ($I12, $I11) = rx1107_cur."!mark_peek"($I10)
    rx1107_cur."!cursor_pos"($I11)
    ($P10) = rx1107_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1107_pos, "")
    rx1107_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1112_done
  rxcap_1112_fail:
    goto rx1107_fail
  rxcap_1112_done:
  # rx subrule "O" subtype=capture negate=
    rx1107_cur."!cursor_pos"(rx1107_pos)
    $P10 = rx1107_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx1107_fail
    rx1107_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1107_pos = $P10."pos"()
  # rx pass
    rx1107_cur."!cursor_pass"(rx1107_pos, "infix:sym<eq>")
    rx1107_cur."!cursor_debug"("PASS  ", "infix:sym<eq>", " at pos=", rx1107_pos)
    .return (rx1107_cur)
  rx1107_fail:
.annotate "line", 421
    (rx1107_rep, rx1107_pos, $I10, $P10) = rx1107_cur."!mark_fail"(0)
    lt rx1107_pos, -1, rx1107_done
    eq rx1107_pos, -1, rx1107_fail
    jump $I10
  rx1107_done:
    rx1107_cur."!cursor_fail"()
    rx1107_cur."!cursor_debug"("FAIL  ", "infix:sym<eq>")
    .return (rx1107_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("282_1271336396.90314") :method
.annotate "line", 421
    $P1109 = self."!PREFIX__!subrule"("O", "eq")
    new $P1110, "ResizablePMCArray"
    push $P1110, $P1109
    .return ($P1110)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("283_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1114_tgt
    .local int rx1114_pos
    .local int rx1114_off
    .local int rx1114_eos
    .local int rx1114_rep
    .local pmc rx1114_cur
    (rx1114_cur, rx1114_pos, rx1114_tgt) = self."!cursor_start"()
    rx1114_cur."!cursor_debug"("START ", "infix:sym<ne>")
    .lex unicode:"$\x{a2}", rx1114_cur
    .local pmc match
    .lex "$/", match
    length rx1114_eos, rx1114_tgt
    set rx1114_off, 0
    lt rx1114_pos, 2, rx1114_start
    sub rx1114_off, rx1114_pos, 1
    substr rx1114_tgt, rx1114_tgt, rx1114_off
  rx1114_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1118_done
    goto rxscan1118_scan
  rxscan1118_loop:
    ($P10) = rx1114_cur."from"()
    inc $P10
    set rx1114_pos, $P10
    ge rx1114_pos, rx1114_eos, rxscan1118_done
  rxscan1118_scan:
    set_addr $I10, rxscan1118_loop
    rx1114_cur."!mark_push"(0, rx1114_pos, $I10)
  rxscan1118_done:
.annotate "line", 497
  # rx subcapture "sym"
    set_addr $I10, rxcap_1119_fail
    rx1114_cur."!mark_push"(0, rx1114_pos, $I10)
  # rx literal  "ne"
    add $I11, rx1114_pos, 2
    gt $I11, rx1114_eos, rx1114_fail
    sub $I11, rx1114_pos, rx1114_off
    substr $S10, rx1114_tgt, $I11, 2
    ne $S10, "ne", rx1114_fail
    add rx1114_pos, 2
    set_addr $I10, rxcap_1119_fail
    ($I12, $I11) = rx1114_cur."!mark_peek"($I10)
    rx1114_cur."!cursor_pos"($I11)
    ($P10) = rx1114_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1114_pos, "")
    rx1114_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1119_done
  rxcap_1119_fail:
    goto rx1114_fail
  rxcap_1119_done:
  # rx subrule "O" subtype=capture negate=
    rx1114_cur."!cursor_pos"(rx1114_pos)
    $P10 = rx1114_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx1114_fail
    rx1114_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1114_pos = $P10."pos"()
  # rx pass
    rx1114_cur."!cursor_pass"(rx1114_pos, "infix:sym<ne>")
    rx1114_cur."!cursor_debug"("PASS  ", "infix:sym<ne>", " at pos=", rx1114_pos)
    .return (rx1114_cur)
  rx1114_fail:
.annotate "line", 421
    (rx1114_rep, rx1114_pos, $I10, $P10) = rx1114_cur."!mark_fail"(0)
    lt rx1114_pos, -1, rx1114_done
    eq rx1114_pos, -1, rx1114_fail
    jump $I10
  rx1114_done:
    rx1114_cur."!cursor_fail"()
    rx1114_cur."!cursor_debug"("FAIL  ", "infix:sym<ne>")
    .return (rx1114_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("284_1271336396.90314") :method
.annotate "line", 421
    $P1116 = self."!PREFIX__!subrule"("O", "ne")
    new $P1117, "ResizablePMCArray"
    push $P1117, $P1116
    .return ($P1117)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("285_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1121_tgt
    .local int rx1121_pos
    .local int rx1121_off
    .local int rx1121_eos
    .local int rx1121_rep
    .local pmc rx1121_cur
    (rx1121_cur, rx1121_pos, rx1121_tgt) = self."!cursor_start"()
    rx1121_cur."!cursor_debug"("START ", "infix:sym<le>")
    .lex unicode:"$\x{a2}", rx1121_cur
    .local pmc match
    .lex "$/", match
    length rx1121_eos, rx1121_tgt
    set rx1121_off, 0
    lt rx1121_pos, 2, rx1121_start
    sub rx1121_off, rx1121_pos, 1
    substr rx1121_tgt, rx1121_tgt, rx1121_off
  rx1121_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1125_done
    goto rxscan1125_scan
  rxscan1125_loop:
    ($P10) = rx1121_cur."from"()
    inc $P10
    set rx1121_pos, $P10
    ge rx1121_pos, rx1121_eos, rxscan1125_done
  rxscan1125_scan:
    set_addr $I10, rxscan1125_loop
    rx1121_cur."!mark_push"(0, rx1121_pos, $I10)
  rxscan1125_done:
.annotate "line", 498
  # rx subcapture "sym"
    set_addr $I10, rxcap_1126_fail
    rx1121_cur."!mark_push"(0, rx1121_pos, $I10)
  # rx literal  "le"
    add $I11, rx1121_pos, 2
    gt $I11, rx1121_eos, rx1121_fail
    sub $I11, rx1121_pos, rx1121_off
    substr $S10, rx1121_tgt, $I11, 2
    ne $S10, "le", rx1121_fail
    add rx1121_pos, 2
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
  # rx subrule "O" subtype=capture negate=
    rx1121_cur."!cursor_pos"(rx1121_pos)
    $P10 = rx1121_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx1121_fail
    rx1121_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1121_pos = $P10."pos"()
  # rx pass
    rx1121_cur."!cursor_pass"(rx1121_pos, "infix:sym<le>")
    rx1121_cur."!cursor_debug"("PASS  ", "infix:sym<le>", " at pos=", rx1121_pos)
    .return (rx1121_cur)
  rx1121_fail:
.annotate "line", 421
    (rx1121_rep, rx1121_pos, $I10, $P10) = rx1121_cur."!mark_fail"(0)
    lt rx1121_pos, -1, rx1121_done
    eq rx1121_pos, -1, rx1121_fail
    jump $I10
  rx1121_done:
    rx1121_cur."!cursor_fail"()
    rx1121_cur."!cursor_debug"("FAIL  ", "infix:sym<le>")
    .return (rx1121_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("286_1271336396.90314") :method
.annotate "line", 421
    $P1123 = self."!PREFIX__!subrule"("O", "le")
    new $P1124, "ResizablePMCArray"
    push $P1124, $P1123
    .return ($P1124)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("287_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1128_tgt
    .local int rx1128_pos
    .local int rx1128_off
    .local int rx1128_eos
    .local int rx1128_rep
    .local pmc rx1128_cur
    (rx1128_cur, rx1128_pos, rx1128_tgt) = self."!cursor_start"()
    rx1128_cur."!cursor_debug"("START ", "infix:sym<ge>")
    .lex unicode:"$\x{a2}", rx1128_cur
    .local pmc match
    .lex "$/", match
    length rx1128_eos, rx1128_tgt
    set rx1128_off, 0
    lt rx1128_pos, 2, rx1128_start
    sub rx1128_off, rx1128_pos, 1
    substr rx1128_tgt, rx1128_tgt, rx1128_off
  rx1128_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1132_done
    goto rxscan1132_scan
  rxscan1132_loop:
    ($P10) = rx1128_cur."from"()
    inc $P10
    set rx1128_pos, $P10
    ge rx1128_pos, rx1128_eos, rxscan1132_done
  rxscan1132_scan:
    set_addr $I10, rxscan1132_loop
    rx1128_cur."!mark_push"(0, rx1128_pos, $I10)
  rxscan1132_done:
.annotate "line", 499
  # rx subcapture "sym"
    set_addr $I10, rxcap_1133_fail
    rx1128_cur."!mark_push"(0, rx1128_pos, $I10)
  # rx literal  "ge"
    add $I11, rx1128_pos, 2
    gt $I11, rx1128_eos, rx1128_fail
    sub $I11, rx1128_pos, rx1128_off
    substr $S10, rx1128_tgt, $I11, 2
    ne $S10, "ge", rx1128_fail
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
    $P10 = rx1128_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx1128_fail
    rx1128_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1128_pos = $P10."pos"()
  # rx pass
    rx1128_cur."!cursor_pass"(rx1128_pos, "infix:sym<ge>")
    rx1128_cur."!cursor_debug"("PASS  ", "infix:sym<ge>", " at pos=", rx1128_pos)
    .return (rx1128_cur)
  rx1128_fail:
.annotate "line", 421
    (rx1128_rep, rx1128_pos, $I10, $P10) = rx1128_cur."!mark_fail"(0)
    lt rx1128_pos, -1, rx1128_done
    eq rx1128_pos, -1, rx1128_fail
    jump $I10
  rx1128_done:
    rx1128_cur."!cursor_fail"()
    rx1128_cur."!cursor_debug"("FAIL  ", "infix:sym<ge>")
    .return (rx1128_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("288_1271336396.90314") :method
.annotate "line", 421
    $P1130 = self."!PREFIX__!subrule"("O", "ge")
    new $P1131, "ResizablePMCArray"
    push $P1131, $P1130
    .return ($P1131)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("289_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1135_tgt
    .local int rx1135_pos
    .local int rx1135_off
    .local int rx1135_eos
    .local int rx1135_rep
    .local pmc rx1135_cur
    (rx1135_cur, rx1135_pos, rx1135_tgt) = self."!cursor_start"()
    rx1135_cur."!cursor_debug"("START ", "infix:sym<lt>")
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
.annotate "line", 500
  # rx subcapture "sym"
    set_addr $I10, rxcap_1140_fail
    rx1135_cur."!mark_push"(0, rx1135_pos, $I10)
  # rx literal  "lt"
    add $I11, rx1135_pos, 2
    gt $I11, rx1135_eos, rx1135_fail
    sub $I11, rx1135_pos, rx1135_off
    substr $S10, rx1135_tgt, $I11, 2
    ne $S10, "lt", rx1135_fail
    add rx1135_pos, 2
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
    $P10 = rx1135_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx1135_fail
    rx1135_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1135_pos = $P10."pos"()
  # rx pass
    rx1135_cur."!cursor_pass"(rx1135_pos, "infix:sym<lt>")
    rx1135_cur."!cursor_debug"("PASS  ", "infix:sym<lt>", " at pos=", rx1135_pos)
    .return (rx1135_cur)
  rx1135_fail:
.annotate "line", 421
    (rx1135_rep, rx1135_pos, $I10, $P10) = rx1135_cur."!mark_fail"(0)
    lt rx1135_pos, -1, rx1135_done
    eq rx1135_pos, -1, rx1135_fail
    jump $I10
  rx1135_done:
    rx1135_cur."!cursor_fail"()
    rx1135_cur."!cursor_debug"("FAIL  ", "infix:sym<lt>")
    .return (rx1135_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("290_1271336396.90314") :method
.annotate "line", 421
    $P1137 = self."!PREFIX__!subrule"("O", "lt")
    new $P1138, "ResizablePMCArray"
    push $P1138, $P1137
    .return ($P1138)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("291_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1142_tgt
    .local int rx1142_pos
    .local int rx1142_off
    .local int rx1142_eos
    .local int rx1142_rep
    .local pmc rx1142_cur
    (rx1142_cur, rx1142_pos, rx1142_tgt) = self."!cursor_start"()
    rx1142_cur."!cursor_debug"("START ", "infix:sym<gt>")
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
.annotate "line", 501
  # rx subcapture "sym"
    set_addr $I10, rxcap_1147_fail
    rx1142_cur."!mark_push"(0, rx1142_pos, $I10)
  # rx literal  "gt"
    add $I11, rx1142_pos, 2
    gt $I11, rx1142_eos, rx1142_fail
    sub $I11, rx1142_pos, rx1142_off
    substr $S10, rx1142_tgt, $I11, 2
    ne $S10, "gt", rx1142_fail
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
    $P10 = rx1142_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx1142_fail
    rx1142_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1142_pos = $P10."pos"()
  # rx pass
    rx1142_cur."!cursor_pass"(rx1142_pos, "infix:sym<gt>")
    rx1142_cur."!cursor_debug"("PASS  ", "infix:sym<gt>", " at pos=", rx1142_pos)
    .return (rx1142_cur)
  rx1142_fail:
.annotate "line", 421
    (rx1142_rep, rx1142_pos, $I10, $P10) = rx1142_cur."!mark_fail"(0)
    lt rx1142_pos, -1, rx1142_done
    eq rx1142_pos, -1, rx1142_fail
    jump $I10
  rx1142_done:
    rx1142_cur."!cursor_fail"()
    rx1142_cur."!cursor_debug"("FAIL  ", "infix:sym<gt>")
    .return (rx1142_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("292_1271336396.90314") :method
.annotate "line", 421
    $P1144 = self."!PREFIX__!subrule"("O", "gt")
    new $P1145, "ResizablePMCArray"
    push $P1145, $P1144
    .return ($P1145)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("293_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1149_tgt
    .local int rx1149_pos
    .local int rx1149_off
    .local int rx1149_eos
    .local int rx1149_rep
    .local pmc rx1149_cur
    (rx1149_cur, rx1149_pos, rx1149_tgt) = self."!cursor_start"()
    rx1149_cur."!cursor_debug"("START ", "infix:sym<=:=>")
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
.annotate "line", 502
  # rx subcapture "sym"
    set_addr $I10, rxcap_1154_fail
    rx1149_cur."!mark_push"(0, rx1149_pos, $I10)
  # rx literal  "=:="
    add $I11, rx1149_pos, 3
    gt $I11, rx1149_eos, rx1149_fail
    sub $I11, rx1149_pos, rx1149_off
    substr $S10, rx1149_tgt, $I11, 3
    ne $S10, "=:=", rx1149_fail
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
    $P10 = rx1149_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx1149_fail
    rx1149_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1149_pos = $P10."pos"()
  # rx pass
    rx1149_cur."!cursor_pass"(rx1149_pos, "infix:sym<=:=>")
    rx1149_cur."!cursor_debug"("PASS  ", "infix:sym<=:=>", " at pos=", rx1149_pos)
    .return (rx1149_cur)
  rx1149_fail:
.annotate "line", 421
    (rx1149_rep, rx1149_pos, $I10, $P10) = rx1149_cur."!mark_fail"(0)
    lt rx1149_pos, -1, rx1149_done
    eq rx1149_pos, -1, rx1149_fail
    jump $I10
  rx1149_done:
    rx1149_cur."!cursor_fail"()
    rx1149_cur."!cursor_debug"("FAIL  ", "infix:sym<=:=>")
    .return (rx1149_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("294_1271336396.90314") :method
.annotate "line", 421
    $P1151 = self."!PREFIX__!subrule"("O", "=:=")
    new $P1152, "ResizablePMCArray"
    push $P1152, $P1151
    .return ($P1152)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~~>"  :subid("295_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1156_tgt
    .local int rx1156_pos
    .local int rx1156_off
    .local int rx1156_eos
    .local int rx1156_rep
    .local pmc rx1156_cur
    (rx1156_cur, rx1156_pos, rx1156_tgt) = self."!cursor_start"()
    rx1156_cur."!cursor_debug"("START ", "infix:sym<~~>")
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
.annotate "line", 503
  # rx subcapture "sym"
    set_addr $I10, rxcap_1161_fail
    rx1156_cur."!mark_push"(0, rx1156_pos, $I10)
  # rx literal  "~~"
    add $I11, rx1156_pos, 2
    gt $I11, rx1156_eos, rx1156_fail
    sub $I11, rx1156_pos, rx1156_off
    substr $S10, rx1156_tgt, $I11, 2
    ne $S10, "~~", rx1156_fail
    add rx1156_pos, 2
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
    $P10 = rx1156_cur."O"("%relational, :reducecheck<smartmatch>")
    unless $P10, rx1156_fail
    rx1156_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1156_pos = $P10."pos"()
  # rx pass
    rx1156_cur."!cursor_pass"(rx1156_pos, "infix:sym<~~>")
    rx1156_cur."!cursor_debug"("PASS  ", "infix:sym<~~>", " at pos=", rx1156_pos)
    .return (rx1156_cur)
  rx1156_fail:
.annotate "line", 421
    (rx1156_rep, rx1156_pos, $I10, $P10) = rx1156_cur."!mark_fail"(0)
    lt rx1156_pos, -1, rx1156_done
    eq rx1156_pos, -1, rx1156_fail
    jump $I10
  rx1156_done:
    rx1156_cur."!cursor_fail"()
    rx1156_cur."!cursor_debug"("FAIL  ", "infix:sym<~~>")
    .return (rx1156_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~~>"  :subid("296_1271336396.90314") :method
.annotate "line", 421
    $P1158 = self."!PREFIX__!subrule"("O", "~~")
    new $P1159, "ResizablePMCArray"
    push $P1159, $P1158
    .return ($P1159)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("297_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1163_tgt
    .local int rx1163_pos
    .local int rx1163_off
    .local int rx1163_eos
    .local int rx1163_rep
    .local pmc rx1163_cur
    (rx1163_cur, rx1163_pos, rx1163_tgt) = self."!cursor_start"()
    rx1163_cur."!cursor_debug"("START ", "infix:sym<&&>")
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
    ne $I10, -1, rxscan1167_done
    goto rxscan1167_scan
  rxscan1167_loop:
    ($P10) = rx1163_cur."from"()
    inc $P10
    set rx1163_pos, $P10
    ge rx1163_pos, rx1163_eos, rxscan1167_done
  rxscan1167_scan:
    set_addr $I10, rxscan1167_loop
    rx1163_cur."!mark_push"(0, rx1163_pos, $I10)
  rxscan1167_done:
.annotate "line", 505
  # rx subcapture "sym"
    set_addr $I10, rxcap_1168_fail
    rx1163_cur."!mark_push"(0, rx1163_pos, $I10)
  # rx literal  "&&"
    add $I11, rx1163_pos, 2
    gt $I11, rx1163_eos, rx1163_fail
    sub $I11, rx1163_pos, rx1163_off
    substr $S10, rx1163_tgt, $I11, 2
    ne $S10, "&&", rx1163_fail
    add rx1163_pos, 2
    set_addr $I10, rxcap_1168_fail
    ($I12, $I11) = rx1163_cur."!mark_peek"($I10)
    rx1163_cur."!cursor_pos"($I11)
    ($P10) = rx1163_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1163_pos, "")
    rx1163_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1168_done
  rxcap_1168_fail:
    goto rx1163_fail
  rxcap_1168_done:
  # rx subrule "O" subtype=capture negate=
    rx1163_cur."!cursor_pos"(rx1163_pos)
    $P10 = rx1163_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx1163_fail
    rx1163_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1163_pos = $P10."pos"()
  # rx pass
    rx1163_cur."!cursor_pass"(rx1163_pos, "infix:sym<&&>")
    rx1163_cur."!cursor_debug"("PASS  ", "infix:sym<&&>", " at pos=", rx1163_pos)
    .return (rx1163_cur)
  rx1163_fail:
.annotate "line", 421
    (rx1163_rep, rx1163_pos, $I10, $P10) = rx1163_cur."!mark_fail"(0)
    lt rx1163_pos, -1, rx1163_done
    eq rx1163_pos, -1, rx1163_fail
    jump $I10
  rx1163_done:
    rx1163_cur."!cursor_fail"()
    rx1163_cur."!cursor_debug"("FAIL  ", "infix:sym<&&>")
    .return (rx1163_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("298_1271336396.90314") :method
.annotate "line", 421
    $P1165 = self."!PREFIX__!subrule"("O", "&&")
    new $P1166, "ResizablePMCArray"
    push $P1166, $P1165
    .return ($P1166)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("299_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1170_tgt
    .local int rx1170_pos
    .local int rx1170_off
    .local int rx1170_eos
    .local int rx1170_rep
    .local pmc rx1170_cur
    (rx1170_cur, rx1170_pos, rx1170_tgt) = self."!cursor_start"()
    rx1170_cur."!cursor_debug"("START ", "infix:sym<||>")
    .lex unicode:"$\x{a2}", rx1170_cur
    .local pmc match
    .lex "$/", match
    length rx1170_eos, rx1170_tgt
    set rx1170_off, 0
    lt rx1170_pos, 2, rx1170_start
    sub rx1170_off, rx1170_pos, 1
    substr rx1170_tgt, rx1170_tgt, rx1170_off
  rx1170_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1174_done
    goto rxscan1174_scan
  rxscan1174_loop:
    ($P10) = rx1170_cur."from"()
    inc $P10
    set rx1170_pos, $P10
    ge rx1170_pos, rx1170_eos, rxscan1174_done
  rxscan1174_scan:
    set_addr $I10, rxscan1174_loop
    rx1170_cur."!mark_push"(0, rx1170_pos, $I10)
  rxscan1174_done:
.annotate "line", 507
  # rx subcapture "sym"
    set_addr $I10, rxcap_1175_fail
    rx1170_cur."!mark_push"(0, rx1170_pos, $I10)
  # rx literal  "||"
    add $I11, rx1170_pos, 2
    gt $I11, rx1170_eos, rx1170_fail
    sub $I11, rx1170_pos, rx1170_off
    substr $S10, rx1170_tgt, $I11, 2
    ne $S10, "||", rx1170_fail
    add rx1170_pos, 2
    set_addr $I10, rxcap_1175_fail
    ($I12, $I11) = rx1170_cur."!mark_peek"($I10)
    rx1170_cur."!cursor_pos"($I11)
    ($P10) = rx1170_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1170_pos, "")
    rx1170_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1175_done
  rxcap_1175_fail:
    goto rx1170_fail
  rxcap_1175_done:
  # rx subrule "O" subtype=capture negate=
    rx1170_cur."!cursor_pos"(rx1170_pos)
    $P10 = rx1170_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx1170_fail
    rx1170_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1170_pos = $P10."pos"()
  # rx pass
    rx1170_cur."!cursor_pass"(rx1170_pos, "infix:sym<||>")
    rx1170_cur."!cursor_debug"("PASS  ", "infix:sym<||>", " at pos=", rx1170_pos)
    .return (rx1170_cur)
  rx1170_fail:
.annotate "line", 421
    (rx1170_rep, rx1170_pos, $I10, $P10) = rx1170_cur."!mark_fail"(0)
    lt rx1170_pos, -1, rx1170_done
    eq rx1170_pos, -1, rx1170_fail
    jump $I10
  rx1170_done:
    rx1170_cur."!cursor_fail"()
    rx1170_cur."!cursor_debug"("FAIL  ", "infix:sym<||>")
    .return (rx1170_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("300_1271336396.90314") :method
.annotate "line", 421
    $P1172 = self."!PREFIX__!subrule"("O", "||")
    new $P1173, "ResizablePMCArray"
    push $P1173, $P1172
    .return ($P1173)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("301_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1177_tgt
    .local int rx1177_pos
    .local int rx1177_off
    .local int rx1177_eos
    .local int rx1177_rep
    .local pmc rx1177_cur
    (rx1177_cur, rx1177_pos, rx1177_tgt) = self."!cursor_start"()
    rx1177_cur."!cursor_debug"("START ", "infix:sym<//>")
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
    ne $I10, -1, rxscan1181_done
    goto rxscan1181_scan
  rxscan1181_loop:
    ($P10) = rx1177_cur."from"()
    inc $P10
    set rx1177_pos, $P10
    ge rx1177_pos, rx1177_eos, rxscan1181_done
  rxscan1181_scan:
    set_addr $I10, rxscan1181_loop
    rx1177_cur."!mark_push"(0, rx1177_pos, $I10)
  rxscan1181_done:
.annotate "line", 508
  # rx subcapture "sym"
    set_addr $I10, rxcap_1182_fail
    rx1177_cur."!mark_push"(0, rx1177_pos, $I10)
  # rx literal  "//"
    add $I11, rx1177_pos, 2
    gt $I11, rx1177_eos, rx1177_fail
    sub $I11, rx1177_pos, rx1177_off
    substr $S10, rx1177_tgt, $I11, 2
    ne $S10, "//", rx1177_fail
    add rx1177_pos, 2
    set_addr $I10, rxcap_1182_fail
    ($I12, $I11) = rx1177_cur."!mark_peek"($I10)
    rx1177_cur."!cursor_pos"($I11)
    ($P10) = rx1177_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1177_pos, "")
    rx1177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1182_done
  rxcap_1182_fail:
    goto rx1177_fail
  rxcap_1182_done:
  # rx subrule "O" subtype=capture negate=
    rx1177_cur."!cursor_pos"(rx1177_pos)
    $P10 = rx1177_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx1177_fail
    rx1177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1177_pos = $P10."pos"()
  # rx pass
    rx1177_cur."!cursor_pass"(rx1177_pos, "infix:sym<//>")
    rx1177_cur."!cursor_debug"("PASS  ", "infix:sym<//>", " at pos=", rx1177_pos)
    .return (rx1177_cur)
  rx1177_fail:
.annotate "line", 421
    (rx1177_rep, rx1177_pos, $I10, $P10) = rx1177_cur."!mark_fail"(0)
    lt rx1177_pos, -1, rx1177_done
    eq rx1177_pos, -1, rx1177_fail
    jump $I10
  rx1177_done:
    rx1177_cur."!cursor_fail"()
    rx1177_cur."!cursor_debug"("FAIL  ", "infix:sym<//>")
    .return (rx1177_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("302_1271336396.90314") :method
.annotate "line", 421
    $P1179 = self."!PREFIX__!subrule"("O", "//")
    new $P1180, "ResizablePMCArray"
    push $P1180, $P1179
    .return ($P1180)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("303_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1184_tgt
    .local int rx1184_pos
    .local int rx1184_off
    .local int rx1184_eos
    .local int rx1184_rep
    .local pmc rx1184_cur
    (rx1184_cur, rx1184_pos, rx1184_tgt) = self."!cursor_start"()
    rx1184_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
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
    ne $I10, -1, rxscan1188_done
    goto rxscan1188_scan
  rxscan1188_loop:
    ($P10) = rx1184_cur."from"()
    inc $P10
    set rx1184_pos, $P10
    ge rx1184_pos, rx1184_eos, rxscan1188_done
  rxscan1188_scan:
    set_addr $I10, rxscan1188_loop
    rx1184_cur."!mark_push"(0, rx1184_pos, $I10)
  rxscan1188_done:
.annotate "line", 511
  # rx literal  "??"
    add $I11, rx1184_pos, 2
    gt $I11, rx1184_eos, rx1184_fail
    sub $I11, rx1184_pos, rx1184_off
    substr $S10, rx1184_tgt, $I11, 2
    ne $S10, "??", rx1184_fail
    add rx1184_pos, 2
.annotate "line", 512
  # rx subrule "ws" subtype=method negate=
    rx1184_cur."!cursor_pos"(rx1184_pos)
    $P10 = rx1184_cur."ws"()
    unless $P10, rx1184_fail
    rx1184_pos = $P10."pos"()
.annotate "line", 513
  # rx subrule "EXPR" subtype=capture negate=
    rx1184_cur."!cursor_pos"(rx1184_pos)
    $P10 = rx1184_cur."EXPR"("i=")
    unless $P10, rx1184_fail
    rx1184_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1184_pos = $P10."pos"()
.annotate "line", 514
  # rx literal  "!!"
    add $I11, rx1184_pos, 2
    gt $I11, rx1184_eos, rx1184_fail
    sub $I11, rx1184_pos, rx1184_off
    substr $S10, rx1184_tgt, $I11, 2
    ne $S10, "!!", rx1184_fail
    add rx1184_pos, 2
.annotate "line", 515
  # rx subrule "O" subtype=capture negate=
    rx1184_cur."!cursor_pos"(rx1184_pos)
    $P10 = rx1184_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx1184_fail
    rx1184_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1184_pos = $P10."pos"()
.annotate "line", 510
  # rx pass
    rx1184_cur."!cursor_pass"(rx1184_pos, "infix:sym<?? !!>")
    rx1184_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx1184_pos)
    .return (rx1184_cur)
  rx1184_fail:
.annotate "line", 421
    (rx1184_rep, rx1184_pos, $I10, $P10) = rx1184_cur."!mark_fail"(0)
    lt rx1184_pos, -1, rx1184_done
    eq rx1184_pos, -1, rx1184_fail
    jump $I10
  rx1184_done:
    rx1184_cur."!cursor_fail"()
    rx1184_cur."!cursor_debug"("FAIL  ", "infix:sym<?? !!>")
    .return (rx1184_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("304_1271336396.90314") :method
.annotate "line", 421
    $P1186 = self."!PREFIX__!subrule"("", "??")
    new $P1187, "ResizablePMCArray"
    push $P1187, $P1186
    .return ($P1187)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("305_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1190_tgt
    .local int rx1190_pos
    .local int rx1190_off
    .local int rx1190_eos
    .local int rx1190_rep
    .local pmc rx1190_cur
    (rx1190_cur, rx1190_pos, rx1190_tgt) = self."!cursor_start"()
    rx1190_cur."!cursor_debug"("START ", "infix:sym<=>")
    .lex unicode:"$\x{a2}", rx1190_cur
    .local pmc match
    .lex "$/", match
    length rx1190_eos, rx1190_tgt
    set rx1190_off, 0
    lt rx1190_pos, 2, rx1190_start
    sub rx1190_off, rx1190_pos, 1
    substr rx1190_tgt, rx1190_tgt, rx1190_off
  rx1190_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1194_done
    goto rxscan1194_scan
  rxscan1194_loop:
    ($P10) = rx1190_cur."from"()
    inc $P10
    set rx1190_pos, $P10
    ge rx1190_pos, rx1190_eos, rxscan1194_done
  rxscan1194_scan:
    set_addr $I10, rxscan1194_loop
    rx1190_cur."!mark_push"(0, rx1190_pos, $I10)
  rxscan1194_done:
.annotate "line", 519
  # rx subcapture "sym"
    set_addr $I10, rxcap_1195_fail
    rx1190_cur."!mark_push"(0, rx1190_pos, $I10)
  # rx literal  "="
    add $I11, rx1190_pos, 1
    gt $I11, rx1190_eos, rx1190_fail
    sub $I11, rx1190_pos, rx1190_off
    substr $S10, rx1190_tgt, $I11, 1
    ne $S10, "=", rx1190_fail
    add rx1190_pos, 1
    set_addr $I10, rxcap_1195_fail
    ($I12, $I11) = rx1190_cur."!mark_peek"($I10)
    rx1190_cur."!cursor_pos"($I11)
    ($P10) = rx1190_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1190_pos, "")
    rx1190_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1195_done
  rxcap_1195_fail:
    goto rx1190_fail
  rxcap_1195_done:
  # rx subrule "panic" subtype=method negate=
    rx1190_cur."!cursor_pos"(rx1190_pos)
    $P10 = rx1190_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx1190_fail
    rx1190_pos = $P10."pos"()
.annotate "line", 518
  # rx pass
    rx1190_cur."!cursor_pass"(rx1190_pos, "infix:sym<=>")
    rx1190_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx1190_pos)
    .return (rx1190_cur)
  rx1190_fail:
.annotate "line", 421
    (rx1190_rep, rx1190_pos, $I10, $P10) = rx1190_cur."!mark_fail"(0)
    lt rx1190_pos, -1, rx1190_done
    eq rx1190_pos, -1, rx1190_fail
    jump $I10
  rx1190_done:
    rx1190_cur."!cursor_fail"()
    rx1190_cur."!cursor_debug"("FAIL  ", "infix:sym<=>")
    .return (rx1190_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("306_1271336396.90314") :method
.annotate "line", 421
    $P1192 = self."!PREFIX__!subrule"("", "=")
    new $P1193, "ResizablePMCArray"
    push $P1193, $P1192
    .return ($P1193)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("307_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1197_tgt
    .local int rx1197_pos
    .local int rx1197_off
    .local int rx1197_eos
    .local int rx1197_rep
    .local pmc rx1197_cur
    (rx1197_cur, rx1197_pos, rx1197_tgt) = self."!cursor_start"()
    rx1197_cur."!cursor_debug"("START ", "infix:sym<:=>")
    .lex unicode:"$\x{a2}", rx1197_cur
    .local pmc match
    .lex "$/", match
    length rx1197_eos, rx1197_tgt
    set rx1197_off, 0
    lt rx1197_pos, 2, rx1197_start
    sub rx1197_off, rx1197_pos, 1
    substr rx1197_tgt, rx1197_tgt, rx1197_off
  rx1197_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1201_done
    goto rxscan1201_scan
  rxscan1201_loop:
    ($P10) = rx1197_cur."from"()
    inc $P10
    set rx1197_pos, $P10
    ge rx1197_pos, rx1197_eos, rxscan1201_done
  rxscan1201_scan:
    set_addr $I10, rxscan1201_loop
    rx1197_cur."!mark_push"(0, rx1197_pos, $I10)
  rxscan1201_done:
.annotate "line", 521
  # rx subcapture "sym"
    set_addr $I10, rxcap_1202_fail
    rx1197_cur."!mark_push"(0, rx1197_pos, $I10)
  # rx literal  ":="
    add $I11, rx1197_pos, 2
    gt $I11, rx1197_eos, rx1197_fail
    sub $I11, rx1197_pos, rx1197_off
    substr $S10, rx1197_tgt, $I11, 2
    ne $S10, ":=", rx1197_fail
    add rx1197_pos, 2
    set_addr $I10, rxcap_1202_fail
    ($I12, $I11) = rx1197_cur."!mark_peek"($I10)
    rx1197_cur."!cursor_pos"($I11)
    ($P10) = rx1197_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1197_pos, "")
    rx1197_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1202_done
  rxcap_1202_fail:
    goto rx1197_fail
  rxcap_1202_done:
  # rx subrule "O" subtype=capture negate=
    rx1197_cur."!cursor_pos"(rx1197_pos)
    $P10 = rx1197_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1197_fail
    rx1197_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1197_pos = $P10."pos"()
  # rx pass
    rx1197_cur."!cursor_pass"(rx1197_pos, "infix:sym<:=>")
    rx1197_cur."!cursor_debug"("PASS  ", "infix:sym<:=>", " at pos=", rx1197_pos)
    .return (rx1197_cur)
  rx1197_fail:
.annotate "line", 421
    (rx1197_rep, rx1197_pos, $I10, $P10) = rx1197_cur."!mark_fail"(0)
    lt rx1197_pos, -1, rx1197_done
    eq rx1197_pos, -1, rx1197_fail
    jump $I10
  rx1197_done:
    rx1197_cur."!cursor_fail"()
    rx1197_cur."!cursor_debug"("FAIL  ", "infix:sym<:=>")
    .return (rx1197_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("308_1271336396.90314") :method
.annotate "line", 421
    $P1199 = self."!PREFIX__!subrule"("O", ":=")
    new $P1200, "ResizablePMCArray"
    push $P1200, $P1199
    .return ($P1200)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("309_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1204_tgt
    .local int rx1204_pos
    .local int rx1204_off
    .local int rx1204_eos
    .local int rx1204_rep
    .local pmc rx1204_cur
    (rx1204_cur, rx1204_pos, rx1204_tgt) = self."!cursor_start"()
    rx1204_cur."!cursor_debug"("START ", "infix:sym<::=>")
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
    ne $I10, -1, rxscan1208_done
    goto rxscan1208_scan
  rxscan1208_loop:
    ($P10) = rx1204_cur."from"()
    inc $P10
    set rx1204_pos, $P10
    ge rx1204_pos, rx1204_eos, rxscan1208_done
  rxscan1208_scan:
    set_addr $I10, rxscan1208_loop
    rx1204_cur."!mark_push"(0, rx1204_pos, $I10)
  rxscan1208_done:
.annotate "line", 522
  # rx subcapture "sym"
    set_addr $I10, rxcap_1209_fail
    rx1204_cur."!mark_push"(0, rx1204_pos, $I10)
  # rx literal  "::="
    add $I11, rx1204_pos, 3
    gt $I11, rx1204_eos, rx1204_fail
    sub $I11, rx1204_pos, rx1204_off
    substr $S10, rx1204_tgt, $I11, 3
    ne $S10, "::=", rx1204_fail
    add rx1204_pos, 3
    set_addr $I10, rxcap_1209_fail
    ($I12, $I11) = rx1204_cur."!mark_peek"($I10)
    rx1204_cur."!cursor_pos"($I11)
    ($P10) = rx1204_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1204_pos, "")
    rx1204_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1209_done
  rxcap_1209_fail:
    goto rx1204_fail
  rxcap_1209_done:
  # rx subrule "O" subtype=capture negate=
    rx1204_cur."!cursor_pos"(rx1204_pos)
    $P10 = rx1204_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1204_fail
    rx1204_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1204_pos = $P10."pos"()
  # rx pass
    rx1204_cur."!cursor_pass"(rx1204_pos, "infix:sym<::=>")
    rx1204_cur."!cursor_debug"("PASS  ", "infix:sym<::=>", " at pos=", rx1204_pos)
    .return (rx1204_cur)
  rx1204_fail:
.annotate "line", 421
    (rx1204_rep, rx1204_pos, $I10, $P10) = rx1204_cur."!mark_fail"(0)
    lt rx1204_pos, -1, rx1204_done
    eq rx1204_pos, -1, rx1204_fail
    jump $I10
  rx1204_done:
    rx1204_cur."!cursor_fail"()
    rx1204_cur."!cursor_debug"("FAIL  ", "infix:sym<::=>")
    .return (rx1204_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("310_1271336396.90314") :method
.annotate "line", 421
    $P1206 = self."!PREFIX__!subrule"("O", "::=")
    new $P1207, "ResizablePMCArray"
    push $P1207, $P1206
    .return ($P1207)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("311_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1211_tgt
    .local int rx1211_pos
    .local int rx1211_off
    .local int rx1211_eos
    .local int rx1211_rep
    .local pmc rx1211_cur
    (rx1211_cur, rx1211_pos, rx1211_tgt) = self."!cursor_start"()
    rx1211_cur."!cursor_debug"("START ", "infix:sym<,>")
    .lex unicode:"$\x{a2}", rx1211_cur
    .local pmc match
    .lex "$/", match
    length rx1211_eos, rx1211_tgt
    set rx1211_off, 0
    lt rx1211_pos, 2, rx1211_start
    sub rx1211_off, rx1211_pos, 1
    substr rx1211_tgt, rx1211_tgt, rx1211_off
  rx1211_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1215_done
    goto rxscan1215_scan
  rxscan1215_loop:
    ($P10) = rx1211_cur."from"()
    inc $P10
    set rx1211_pos, $P10
    ge rx1211_pos, rx1211_eos, rxscan1215_done
  rxscan1215_scan:
    set_addr $I10, rxscan1215_loop
    rx1211_cur."!mark_push"(0, rx1211_pos, $I10)
  rxscan1215_done:
.annotate "line", 524
  # rx subcapture "sym"
    set_addr $I10, rxcap_1216_fail
    rx1211_cur."!mark_push"(0, rx1211_pos, $I10)
  # rx literal  ","
    add $I11, rx1211_pos, 1
    gt $I11, rx1211_eos, rx1211_fail
    sub $I11, rx1211_pos, rx1211_off
    substr $S10, rx1211_tgt, $I11, 1
    ne $S10, ",", rx1211_fail
    add rx1211_pos, 1
    set_addr $I10, rxcap_1216_fail
    ($I12, $I11) = rx1211_cur."!mark_peek"($I10)
    rx1211_cur."!cursor_pos"($I11)
    ($P10) = rx1211_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1211_pos, "")
    rx1211_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1216_done
  rxcap_1216_fail:
    goto rx1211_fail
  rxcap_1216_done:
  # rx subrule "O" subtype=capture negate=
    rx1211_cur."!cursor_pos"(rx1211_pos)
    $P10 = rx1211_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1211_fail
    rx1211_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1211_pos = $P10."pos"()
  # rx pass
    rx1211_cur."!cursor_pass"(rx1211_pos, "infix:sym<,>")
    rx1211_cur."!cursor_debug"("PASS  ", "infix:sym<,>", " at pos=", rx1211_pos)
    .return (rx1211_cur)
  rx1211_fail:
.annotate "line", 421
    (rx1211_rep, rx1211_pos, $I10, $P10) = rx1211_cur."!mark_fail"(0)
    lt rx1211_pos, -1, rx1211_done
    eq rx1211_pos, -1, rx1211_fail
    jump $I10
  rx1211_done:
    rx1211_cur."!cursor_fail"()
    rx1211_cur."!cursor_debug"("FAIL  ", "infix:sym<,>")
    .return (rx1211_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("312_1271336396.90314") :method
.annotate "line", 421
    $P1213 = self."!PREFIX__!subrule"("O", ",")
    new $P1214, "ResizablePMCArray"
    push $P1214, $P1213
    .return ($P1214)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("313_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1218_tgt
    .local int rx1218_pos
    .local int rx1218_off
    .local int rx1218_eos
    .local int rx1218_rep
    .local pmc rx1218_cur
    (rx1218_cur, rx1218_pos, rx1218_tgt) = self."!cursor_start"()
    rx1218_cur."!cursor_debug"("START ", "prefix:sym<return>")
    .lex unicode:"$\x{a2}", rx1218_cur
    .local pmc match
    .lex "$/", match
    length rx1218_eos, rx1218_tgt
    set rx1218_off, 0
    lt rx1218_pos, 2, rx1218_start
    sub rx1218_off, rx1218_pos, 1
    substr rx1218_tgt, rx1218_tgt, rx1218_off
  rx1218_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1221_done
    goto rxscan1221_scan
  rxscan1221_loop:
    ($P10) = rx1218_cur."from"()
    inc $P10
    set rx1218_pos, $P10
    ge rx1218_pos, rx1218_eos, rxscan1221_done
  rxscan1221_scan:
    set_addr $I10, rxscan1221_loop
    rx1218_cur."!mark_push"(0, rx1218_pos, $I10)
  rxscan1221_done:
.annotate "line", 526
  # rx subcapture "sym"
    set_addr $I10, rxcap_1222_fail
    rx1218_cur."!mark_push"(0, rx1218_pos, $I10)
  # rx literal  "return"
    add $I11, rx1218_pos, 6
    gt $I11, rx1218_eos, rx1218_fail
    sub $I11, rx1218_pos, rx1218_off
    substr $S10, rx1218_tgt, $I11, 6
    ne $S10, "return", rx1218_fail
    add rx1218_pos, 6
    set_addr $I10, rxcap_1222_fail
    ($I12, $I11) = rx1218_cur."!mark_peek"($I10)
    rx1218_cur."!cursor_pos"($I11)
    ($P10) = rx1218_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1218_pos, "")
    rx1218_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1222_done
  rxcap_1222_fail:
    goto rx1218_fail
  rxcap_1222_done:
  # rx charclass s
    ge rx1218_pos, rx1218_eos, rx1218_fail
    sub $I10, rx1218_pos, rx1218_off
    is_cclass $I11, 32, rx1218_tgt, $I10
    unless $I11, rx1218_fail
    inc rx1218_pos
  # rx subrule "O" subtype=capture negate=
    rx1218_cur."!cursor_pos"(rx1218_pos)
    $P10 = rx1218_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1218_fail
    rx1218_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1218_pos = $P10."pos"()
  # rx pass
    rx1218_cur."!cursor_pass"(rx1218_pos, "prefix:sym<return>")
    rx1218_cur."!cursor_debug"("PASS  ", "prefix:sym<return>", " at pos=", rx1218_pos)
    .return (rx1218_cur)
  rx1218_fail:
.annotate "line", 421
    (rx1218_rep, rx1218_pos, $I10, $P10) = rx1218_cur."!mark_fail"(0)
    lt rx1218_pos, -1, rx1218_done
    eq rx1218_pos, -1, rx1218_fail
    jump $I10
  rx1218_done:
    rx1218_cur."!cursor_fail"()
    rx1218_cur."!cursor_debug"("FAIL  ", "prefix:sym<return>")
    .return (rx1218_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("314_1271336396.90314") :method
.annotate "line", 421
    new $P1220, "ResizablePMCArray"
    push $P1220, "return"
    .return ($P1220)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("315_1271336396.90314") :method :outer("11_1271336396.90314")
.annotate "line", 421
    .local string rx1224_tgt
    .local int rx1224_pos
    .local int rx1224_off
    .local int rx1224_eos
    .local int rx1224_rep
    .local pmc rx1224_cur
    (rx1224_cur, rx1224_pos, rx1224_tgt) = self."!cursor_start"()
    rx1224_cur."!cursor_debug"("START ", "prefix:sym<make>")
    .lex unicode:"$\x{a2}", rx1224_cur
    .local pmc match
    .lex "$/", match
    length rx1224_eos, rx1224_tgt
    set rx1224_off, 0
    lt rx1224_pos, 2, rx1224_start
    sub rx1224_off, rx1224_pos, 1
    substr rx1224_tgt, rx1224_tgt, rx1224_off
  rx1224_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1227_done
    goto rxscan1227_scan
  rxscan1227_loop:
    ($P10) = rx1224_cur."from"()
    inc $P10
    set rx1224_pos, $P10
    ge rx1224_pos, rx1224_eos, rxscan1227_done
  rxscan1227_scan:
    set_addr $I10, rxscan1227_loop
    rx1224_cur."!mark_push"(0, rx1224_pos, $I10)
  rxscan1227_done:
.annotate "line", 527
  # rx subcapture "sym"
    set_addr $I10, rxcap_1228_fail
    rx1224_cur."!mark_push"(0, rx1224_pos, $I10)
  # rx literal  "make"
    add $I11, rx1224_pos, 4
    gt $I11, rx1224_eos, rx1224_fail
    sub $I11, rx1224_pos, rx1224_off
    substr $S10, rx1224_tgt, $I11, 4
    ne $S10, "make", rx1224_fail
    add rx1224_pos, 4
    set_addr $I10, rxcap_1228_fail
    ($I12, $I11) = rx1224_cur."!mark_peek"($I10)
    rx1224_cur."!cursor_pos"($I11)
    ($P10) = rx1224_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1224_pos, "")
    rx1224_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1228_done
  rxcap_1228_fail:
    goto rx1224_fail
  rxcap_1228_done:
  # rx charclass s
    ge rx1224_pos, rx1224_eos, rx1224_fail
    sub $I10, rx1224_pos, rx1224_off
    is_cclass $I11, 32, rx1224_tgt, $I10
    unless $I11, rx1224_fail
    inc rx1224_pos
  # rx subrule "O" subtype=capture negate=
    rx1224_cur."!cursor_pos"(rx1224_pos)
    $P10 = rx1224_cur."O"("%list_prefix")
    unless $P10, rx1224_fail
    rx1224_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1224_pos = $P10."pos"()
  # rx pass
    rx1224_cur."!cursor_pass"(rx1224_pos, "prefix:sym<make>")
    rx1224_cur."!cursor_debug"("PASS  ", "prefix:sym<make>", " at pos=", rx1224_pos)
    .return (rx1224_cur)
  rx1224_fail:
.annotate "line", 421
    (rx1224_rep, rx1224_pos, $I10, $P10) = rx1224_cur."!mark_fail"(0)
    lt rx1224_pos, -1, rx1224_done
    eq rx1224_pos, -1, rx1224_fail
    jump $I10
  rx1224_done:
    rx1224_cur."!cursor_fail"()
    rx1224_cur."!cursor_debug"("FAIL  ", "prefix:sym<make>")
    .return (rx1224_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("316_1271336396.90314") :method
.annotate "line", 421
    new $P1226, "ResizablePMCArray"
    push $P1226, "make"
    .return ($P1226)
.end


.namespace ["NQP";"Grammar"]
.sub "smartmatch"  :subid("317_1271336396.90314") :method :outer("11_1271336396.90314")
    .param pmc param_1232
.annotate "line", 529
    new $P1231, 'ExceptionHandler'
    set_addr $P1231, control_1230
    $P1231."handle_types"(58)
    push_eh $P1231
    .lex "self", self
    .lex "$/", param_1232
.annotate "line", 531
    new $P1233, "Undef"
    .lex "$t", $P1233
    find_lex $P1234, "$/"
    unless_null $P1234, vivify_343
    $P1234 = root_new ['parrot';'ResizablePMCArray']
  vivify_343:
    set $P1235, $P1234[0]
    unless_null $P1235, vivify_344
    new $P1235, "Undef"
  vivify_344:
    store_lex "$t", $P1235
    find_lex $P1236, "$/"
    unless_null $P1236, vivify_345
    $P1236 = root_new ['parrot';'ResizablePMCArray']
  vivify_345:
    set $P1237, $P1236[1]
    unless_null $P1237, vivify_346
    new $P1237, "Undef"
  vivify_346:
    find_lex $P1238, "$/"
    unless_null $P1238, vivify_347
    $P1238 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1238
  vivify_347:
    set $P1238[0], $P1237
    find_lex $P1239, "$t"
    find_lex $P1240, "$/"
    unless_null $P1240, vivify_348
    $P1240 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1240
  vivify_348:
    set $P1240[1], $P1239
.annotate "line", 529
    .return ($P1239)
  control_1230:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1241, exception, "payload"
    .return ($P1241)
.end


.namespace ["NQP";"Regex"]
.sub "_block1242"  :subid("318_1271336396.90314") :outer("11_1271336396.90314")
.annotate "line", 535
    .const 'Sub' $P1276 = "329_1271336396.90314" 
    capture_lex $P1276
    .const 'Sub' $P1263 = "326_1271336396.90314" 
    capture_lex $P1263
    .const 'Sub' $P1258 = "324_1271336396.90314" 
    capture_lex $P1258
    .const 'Sub' $P1253 = "322_1271336396.90314" 
    capture_lex $P1253
    .const 'Sub' $P1244 = "319_1271336396.90314" 
    capture_lex $P1244
    .const 'Sub' $P1276 = "329_1271336396.90314" 
    capture_lex $P1276
    .return ($P1276)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("319_1271336396.90314") :method :outer("318_1271336396.90314")
.annotate "line", 535
    .const 'Sub' $P1250 = "321_1271336396.90314" 
    capture_lex $P1250
    .local string rx1245_tgt
    .local int rx1245_pos
    .local int rx1245_off
    .local int rx1245_eos
    .local int rx1245_rep
    .local pmc rx1245_cur
    (rx1245_cur, rx1245_pos, rx1245_tgt) = self."!cursor_start"()
    rx1245_cur."!cursor_debug"("START ", "metachar:sym<:my>")
    .lex unicode:"$\x{a2}", rx1245_cur
    .local pmc match
    .lex "$/", match
    length rx1245_eos, rx1245_tgt
    set rx1245_off, 0
    lt rx1245_pos, 2, rx1245_start
    sub rx1245_off, rx1245_pos, 1
    substr rx1245_tgt, rx1245_tgt, rx1245_off
  rx1245_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1248_done
    goto rxscan1248_scan
  rxscan1248_loop:
    ($P10) = rx1245_cur."from"()
    inc $P10
    set rx1245_pos, $P10
    ge rx1245_pos, rx1245_eos, rxscan1248_done
  rxscan1248_scan:
    set_addr $I10, rxscan1248_loop
    rx1245_cur."!mark_push"(0, rx1245_pos, $I10)
  rxscan1248_done:
.annotate "line", 537
  # rx literal  ":"
    add $I11, rx1245_pos, 1
    gt $I11, rx1245_eos, rx1245_fail
    sub $I11, rx1245_pos, rx1245_off
    substr $S10, rx1245_tgt, $I11, 1
    ne $S10, ":", rx1245_fail
    add rx1245_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1245_cur."!cursor_pos"(rx1245_pos)
    .const 'Sub' $P1250 = "321_1271336396.90314" 
    capture_lex $P1250
    $P10 = rx1245_cur."before"($P1250)
    unless $P10, rx1245_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1245_cur."!cursor_pos"(rx1245_pos)
    $P10 = rx1245_cur."LANG"("MAIN", "statement")
    unless $P10, rx1245_fail
    rx1245_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1245_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1245_cur."!cursor_pos"(rx1245_pos)
    $P10 = rx1245_cur."ws"()
    unless $P10, rx1245_fail
    rx1245_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1245_pos, 1
    gt $I11, rx1245_eos, rx1245_fail
    sub $I11, rx1245_pos, rx1245_off
    substr $S10, rx1245_tgt, $I11, 1
    ne $S10, ";", rx1245_fail
    add rx1245_pos, 1
.annotate "line", 536
  # rx pass
    rx1245_cur."!cursor_pass"(rx1245_pos, "metachar:sym<:my>")
    rx1245_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1245_pos)
    .return (rx1245_cur)
  rx1245_fail:
.annotate "line", 535
    (rx1245_rep, rx1245_pos, $I10, $P10) = rx1245_cur."!mark_fail"(0)
    lt rx1245_pos, -1, rx1245_done
    eq rx1245_pos, -1, rx1245_fail
    jump $I10
  rx1245_done:
    rx1245_cur."!cursor_fail"()
    rx1245_cur."!cursor_debug"("FAIL  ", "metachar:sym<:my>")
    .return (rx1245_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("320_1271336396.90314") :method
.annotate "line", 535
    new $P1247, "ResizablePMCArray"
    push $P1247, ":"
    .return ($P1247)
.end


.namespace ["NQP";"Regex"]
.sub "_block1249"  :anon :subid("321_1271336396.90314") :method :outer("319_1271336396.90314")
.annotate "line", 537
    .local string rx1251_tgt
    .local int rx1251_pos
    .local int rx1251_off
    .local int rx1251_eos
    .local int rx1251_rep
    .local pmc rx1251_cur
    (rx1251_cur, rx1251_pos, rx1251_tgt) = self."!cursor_start"()
    rx1251_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1251_cur
    .local pmc match
    .lex "$/", match
    length rx1251_eos, rx1251_tgt
    set rx1251_off, 0
    lt rx1251_pos, 2, rx1251_start
    sub rx1251_off, rx1251_pos, 1
    substr rx1251_tgt, rx1251_tgt, rx1251_off
  rx1251_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1252_done
    goto rxscan1252_scan
  rxscan1252_loop:
    ($P10) = rx1251_cur."from"()
    inc $P10
    set rx1251_pos, $P10
    ge rx1251_pos, rx1251_eos, rxscan1252_done
  rxscan1252_scan:
    set_addr $I10, rxscan1252_loop
    rx1251_cur."!mark_push"(0, rx1251_pos, $I10)
  rxscan1252_done:
  # rx literal  "my"
    add $I11, rx1251_pos, 2
    gt $I11, rx1251_eos, rx1251_fail
    sub $I11, rx1251_pos, rx1251_off
    substr $S10, rx1251_tgt, $I11, 2
    ne $S10, "my", rx1251_fail
    add rx1251_pos, 2
  # rx pass
    rx1251_cur."!cursor_pass"(rx1251_pos, "")
    rx1251_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1251_pos)
    .return (rx1251_cur)
  rx1251_fail:
    (rx1251_rep, rx1251_pos, $I10, $P10) = rx1251_cur."!mark_fail"(0)
    lt rx1251_pos, -1, rx1251_done
    eq rx1251_pos, -1, rx1251_fail
    jump $I10
  rx1251_done:
    rx1251_cur."!cursor_fail"()
    rx1251_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1251_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("322_1271336396.90314") :method :outer("318_1271336396.90314")
.annotate "line", 535
    .local string rx1254_tgt
    .local int rx1254_pos
    .local int rx1254_off
    .local int rx1254_eos
    .local int rx1254_rep
    .local pmc rx1254_cur
    (rx1254_cur, rx1254_pos, rx1254_tgt) = self."!cursor_start"()
    rx1254_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1254_cur
    .local pmc match
    .lex "$/", match
    length rx1254_eos, rx1254_tgt
    set rx1254_off, 0
    lt rx1254_pos, 2, rx1254_start
    sub rx1254_off, rx1254_pos, 1
    substr rx1254_tgt, rx1254_tgt, rx1254_off
  rx1254_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1257_done
    goto rxscan1257_scan
  rxscan1257_loop:
    ($P10) = rx1254_cur."from"()
    inc $P10
    set rx1254_pos, $P10
    ge rx1254_pos, rx1254_eos, rxscan1257_done
  rxscan1257_scan:
    set_addr $I10, rxscan1257_loop
    rx1254_cur."!mark_push"(0, rx1254_pos, $I10)
  rxscan1257_done:
.annotate "line", 541
  # rx enumcharlist negate=0 zerowidth
    ge rx1254_pos, rx1254_eos, rx1254_fail
    sub $I10, rx1254_pos, rx1254_off
    substr $S10, rx1254_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1254_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1254_cur."!cursor_pos"(rx1254_pos)
    $P10 = rx1254_cur."codeblock"()
    unless $P10, rx1254_fail
    rx1254_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1254_pos = $P10."pos"()
.annotate "line", 540
  # rx pass
    rx1254_cur."!cursor_pass"(rx1254_pos, "metachar:sym<{ }>")
    rx1254_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1254_pos)
    .return (rx1254_cur)
  rx1254_fail:
.annotate "line", 535
    (rx1254_rep, rx1254_pos, $I10, $P10) = rx1254_cur."!mark_fail"(0)
    lt rx1254_pos, -1, rx1254_done
    eq rx1254_pos, -1, rx1254_fail
    jump $I10
  rx1254_done:
    rx1254_cur."!cursor_fail"()
    rx1254_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx1254_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("323_1271336396.90314") :method
.annotate "line", 535
    new $P1256, "ResizablePMCArray"
    push $P1256, "{"
    .return ($P1256)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("324_1271336396.90314") :method :outer("318_1271336396.90314")
.annotate "line", 535
    .local string rx1259_tgt
    .local int rx1259_pos
    .local int rx1259_off
    .local int rx1259_eos
    .local int rx1259_rep
    .local pmc rx1259_cur
    (rx1259_cur, rx1259_pos, rx1259_tgt) = self."!cursor_start"()
    rx1259_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1259_cur
    .local pmc match
    .lex "$/", match
    length rx1259_eos, rx1259_tgt
    set rx1259_off, 0
    lt rx1259_pos, 2, rx1259_start
    sub rx1259_off, rx1259_pos, 1
    substr rx1259_tgt, rx1259_tgt, rx1259_off
  rx1259_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1262_done
    goto rxscan1262_scan
  rxscan1262_loop:
    ($P10) = rx1259_cur."from"()
    inc $P10
    set rx1259_pos, $P10
    ge rx1259_pos, rx1259_eos, rxscan1262_done
  rxscan1262_scan:
    set_addr $I10, rxscan1262_loop
    rx1259_cur."!mark_push"(0, rx1259_pos, $I10)
  rxscan1262_done:
.annotate "line", 545
  # rx enumcharlist negate=0 zerowidth
    ge rx1259_pos, rx1259_eos, rx1259_fail
    sub $I10, rx1259_pos, rx1259_off
    substr $S10, rx1259_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1259_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1259_cur."!cursor_pos"(rx1259_pos)
    $P10 = rx1259_cur."codeblock"()
    unless $P10, rx1259_fail
    rx1259_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1259_pos = $P10."pos"()
.annotate "line", 544
  # rx pass
    rx1259_cur."!cursor_pass"(rx1259_pos, "assertion:sym<{ }>")
    rx1259_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1259_pos)
    .return (rx1259_cur)
  rx1259_fail:
.annotate "line", 535
    (rx1259_rep, rx1259_pos, $I10, $P10) = rx1259_cur."!mark_fail"(0)
    lt rx1259_pos, -1, rx1259_done
    eq rx1259_pos, -1, rx1259_fail
    jump $I10
  rx1259_done:
    rx1259_cur."!cursor_fail"()
    rx1259_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1259_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("325_1271336396.90314") :method
.annotate "line", 535
    new $P1261, "ResizablePMCArray"
    push $P1261, "{"
    .return ($P1261)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("326_1271336396.90314") :method :outer("318_1271336396.90314")
.annotate "line", 535
    .const 'Sub' $P1272 = "328_1271336396.90314" 
    capture_lex $P1272
    .local string rx1264_tgt
    .local int rx1264_pos
    .local int rx1264_off
    .local int rx1264_eos
    .local int rx1264_rep
    .local pmc rx1264_cur
    (rx1264_cur, rx1264_pos, rx1264_tgt) = self."!cursor_start"()
    rx1264_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1264_cur."!cursor_caparray"("nibbler", "arglist", "assertion")
    .lex unicode:"$\x{a2}", rx1264_cur
    .local pmc match
    .lex "$/", match
    length rx1264_eos, rx1264_tgt
    set rx1264_off, 0
    lt rx1264_pos, 2, rx1264_start
    sub rx1264_off, rx1264_pos, 1
    substr rx1264_tgt, rx1264_tgt, rx1264_off
  rx1264_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1267_done
    goto rxscan1267_scan
  rxscan1267_loop:
    ($P10) = rx1264_cur."from"()
    inc $P10
    set rx1264_pos, $P10
    ge rx1264_pos, rx1264_eos, rxscan1267_done
  rxscan1267_scan:
    set_addr $I10, rxscan1267_loop
    rx1264_cur."!mark_push"(0, rx1264_pos, $I10)
  rxscan1267_done:
.annotate "line", 549
  # rx subcapture "longname"
    set_addr $I10, rxcap_1268_fail
    rx1264_cur."!mark_push"(0, rx1264_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1264_pos, rx1264_off
    find_not_cclass $I11, 8192, rx1264_tgt, $I10, rx1264_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1264_fail
    add rx1264_pos, rx1264_off, $I11
    set_addr $I10, rxcap_1268_fail
    ($I12, $I11) = rx1264_cur."!mark_peek"($I10)
    rx1264_cur."!cursor_pos"($I11)
    ($P10) = rx1264_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1264_pos, "")
    rx1264_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_1268_done
  rxcap_1268_fail:
    goto rx1264_fail
  rxcap_1268_done:
.annotate "line", 556
  # rx rxquantr1269 ** 0..1
    set_addr $I1275, rxquantr1269_done
    rx1264_cur."!mark_push"(0, rx1264_pos, $I1275)
  rxquantr1269_loop:
  alt1270_0:
.annotate "line", 550
    set_addr $I10, alt1270_1
    rx1264_cur."!mark_push"(0, rx1264_pos, $I10)
.annotate "line", 551
  # rx subrule "before" subtype=zerowidth negate=
    rx1264_cur."!cursor_pos"(rx1264_pos)
    .const 'Sub' $P1272 = "328_1271336396.90314" 
    capture_lex $P1272
    $P10 = rx1264_cur."before"($P1272)
    unless $P10, rx1264_fail
    goto alt1270_end
  alt1270_1:
    set_addr $I10, alt1270_2
    rx1264_cur."!mark_push"(0, rx1264_pos, $I10)
.annotate "line", 552
  # rx literal  "="
    add $I11, rx1264_pos, 1
    gt $I11, rx1264_eos, rx1264_fail
    sub $I11, rx1264_pos, rx1264_off
    substr $S10, rx1264_tgt, $I11, 1
    ne $S10, "=", rx1264_fail
    add rx1264_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1264_cur."!cursor_pos"(rx1264_pos)
    $P10 = rx1264_cur."assertion"()
    unless $P10, rx1264_fail
    rx1264_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1264_pos = $P10."pos"()
    goto alt1270_end
  alt1270_2:
    set_addr $I10, alt1270_3
    rx1264_cur."!mark_push"(0, rx1264_pos, $I10)
.annotate "line", 553
  # rx literal  ":"
    add $I11, rx1264_pos, 1
    gt $I11, rx1264_eos, rx1264_fail
    sub $I11, rx1264_pos, rx1264_off
    substr $S10, rx1264_tgt, $I11, 1
    ne $S10, ":", rx1264_fail
    add rx1264_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1264_cur."!cursor_pos"(rx1264_pos)
    $P10 = rx1264_cur."arglist"()
    unless $P10, rx1264_fail
    rx1264_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1264_pos = $P10."pos"()
    goto alt1270_end
  alt1270_3:
    set_addr $I10, alt1270_4
    rx1264_cur."!mark_push"(0, rx1264_pos, $I10)
.annotate "line", 554
  # rx literal  "("
    add $I11, rx1264_pos, 1
    gt $I11, rx1264_eos, rx1264_fail
    sub $I11, rx1264_pos, rx1264_off
    substr $S10, rx1264_tgt, $I11, 1
    ne $S10, "(", rx1264_fail
    add rx1264_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1264_cur."!cursor_pos"(rx1264_pos)
    $P10 = rx1264_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1264_fail
    rx1264_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1264_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1264_pos, 1
    gt $I11, rx1264_eos, rx1264_fail
    sub $I11, rx1264_pos, rx1264_off
    substr $S10, rx1264_tgt, $I11, 1
    ne $S10, ")", rx1264_fail
    add rx1264_pos, 1
    goto alt1270_end
  alt1270_4:
.annotate "line", 555
  # rx subrule "normspace" subtype=method negate=
    rx1264_cur."!cursor_pos"(rx1264_pos)
    $P10 = rx1264_cur."normspace"()
    unless $P10, rx1264_fail
    rx1264_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1264_cur."!cursor_pos"(rx1264_pos)
    $P10 = rx1264_cur."nibbler"()
    unless $P10, rx1264_fail
    rx1264_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1264_pos = $P10."pos"()
  alt1270_end:
.annotate "line", 556
    (rx1264_rep) = rx1264_cur."!mark_commit"($I1275)
  rxquantr1269_done:
.annotate "line", 548
  # rx pass
    rx1264_cur."!cursor_pass"(rx1264_pos, "assertion:sym<name>")
    rx1264_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1264_pos)
    .return (rx1264_cur)
  rx1264_fail:
.annotate "line", 535
    (rx1264_rep, rx1264_pos, $I10, $P10) = rx1264_cur."!mark_fail"(0)
    lt rx1264_pos, -1, rx1264_done
    eq rx1264_pos, -1, rx1264_fail
    jump $I10
  rx1264_done:
    rx1264_cur."!cursor_fail"()
    rx1264_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1264_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("327_1271336396.90314") :method
.annotate "line", 535
    new $P1266, "ResizablePMCArray"
    push $P1266, ""
    .return ($P1266)
.end


.namespace ["NQP";"Regex"]
.sub "_block1271"  :anon :subid("328_1271336396.90314") :method :outer("326_1271336396.90314")
.annotate "line", 551
    .local string rx1273_tgt
    .local int rx1273_pos
    .local int rx1273_off
    .local int rx1273_eos
    .local int rx1273_rep
    .local pmc rx1273_cur
    (rx1273_cur, rx1273_pos, rx1273_tgt) = self."!cursor_start"()
    rx1273_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1273_cur
    .local pmc match
    .lex "$/", match
    length rx1273_eos, rx1273_tgt
    set rx1273_off, 0
    lt rx1273_pos, 2, rx1273_start
    sub rx1273_off, rx1273_pos, 1
    substr rx1273_tgt, rx1273_tgt, rx1273_off
  rx1273_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1274_done
    goto rxscan1274_scan
  rxscan1274_loop:
    ($P10) = rx1273_cur."from"()
    inc $P10
    set rx1273_pos, $P10
    ge rx1273_pos, rx1273_eos, rxscan1274_done
  rxscan1274_scan:
    set_addr $I10, rxscan1274_loop
    rx1273_cur."!mark_push"(0, rx1273_pos, $I10)
  rxscan1274_done:
  # rx literal  ">"
    add $I11, rx1273_pos, 1
    gt $I11, rx1273_eos, rx1273_fail
    sub $I11, rx1273_pos, rx1273_off
    substr $S10, rx1273_tgt, $I11, 1
    ne $S10, ">", rx1273_fail
    add rx1273_pos, 1
  # rx pass
    rx1273_cur."!cursor_pass"(rx1273_pos, "")
    rx1273_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1273_pos)
    .return (rx1273_cur)
  rx1273_fail:
    (rx1273_rep, rx1273_pos, $I10, $P10) = rx1273_cur."!mark_fail"(0)
    lt rx1273_pos, -1, rx1273_done
    eq rx1273_pos, -1, rx1273_fail
    jump $I10
  rx1273_done:
    rx1273_cur."!cursor_fail"()
    rx1273_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1273_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("329_1271336396.90314") :method :outer("318_1271336396.90314")
.annotate "line", 535
    .local string rx1277_tgt
    .local int rx1277_pos
    .local int rx1277_off
    .local int rx1277_eos
    .local int rx1277_rep
    .local pmc rx1277_cur
    (rx1277_cur, rx1277_pos, rx1277_tgt) = self."!cursor_start"()
    rx1277_cur."!cursor_debug"("START ", "codeblock")
    .lex unicode:"$\x{a2}", rx1277_cur
    .local pmc match
    .lex "$/", match
    length rx1277_eos, rx1277_tgt
    set rx1277_off, 0
    lt rx1277_pos, 2, rx1277_start
    sub rx1277_off, rx1277_pos, 1
    substr rx1277_tgt, rx1277_tgt, rx1277_off
  rx1277_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1281_done
    goto rxscan1281_scan
  rxscan1281_loop:
    ($P10) = rx1277_cur."from"()
    inc $P10
    set rx1277_pos, $P10
    ge rx1277_pos, rx1277_eos, rxscan1281_done
  rxscan1281_scan:
    set_addr $I10, rxscan1281_loop
    rx1277_cur."!mark_push"(0, rx1277_pos, $I10)
  rxscan1281_done:
.annotate "line", 561
  # rx subrule "LANG" subtype=capture negate=
    rx1277_cur."!cursor_pos"(rx1277_pos)
    $P10 = rx1277_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1277_fail
    rx1277_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1277_pos = $P10."pos"()
.annotate "line", 560
  # rx pass
    rx1277_cur."!cursor_pass"(rx1277_pos, "codeblock")
    rx1277_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1277_pos)
    .return (rx1277_cur)
  rx1277_fail:
.annotate "line", 535
    (rx1277_rep, rx1277_pos, $I10, $P10) = rx1277_cur."!mark_fail"(0)
    lt rx1277_pos, -1, rx1277_done
    eq rx1277_pos, -1, rx1277_fail
    jump $I10
  rx1277_done:
    rx1277_cur."!cursor_fail"()
    rx1277_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1277_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("330_1271336396.90314") :method
.annotate "line", 535
    $P1279 = self."!PREFIX__!subrule"("block", "")
    new $P1280, "ResizablePMCArray"
    push $P1280, $P1279
    .return ($P1280)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1271336409.53729")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
    $P2168 = $P14()
.annotate "line", 1
    .return ($P2168)
.end


.namespace []
.sub "" :load :init :subid("post126") :outer("10_1271336409.53729")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1271336409.53729" 
    .local pmc block
    set block, $P12
    $P2169 = get_root_global ["parrot"], "P6metaclass"
    $P2169."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1271336409.53729") :outer("10_1271336409.53729")
.annotate "line", 3
    .const 'Sub' $P2164 = "125_1271336409.53729" 
    capture_lex $P2164
    get_hll_global $P2100, ["NQP";"RegexActions"], "_block2099" 
    capture_lex $P2100
    .const 'Sub' $P2089 = "119_1271336409.53729" 
    capture_lex $P2089
    .const 'Sub' $P2077 = "118_1271336409.53729" 
    capture_lex $P2077
    .const 'Sub' $P2067 = "117_1271336409.53729" 
    capture_lex $P2067
    .const 'Sub' $P2057 = "116_1271336409.53729" 
    capture_lex $P2057
    .const 'Sub' $P2047 = "115_1271336409.53729" 
    capture_lex $P2047
    .const 'Sub' $P2033 = "114_1271336409.53729" 
    capture_lex $P2033
    .const 'Sub' $P2023 = "113_1271336409.53729" 
    capture_lex $P2023
    .const 'Sub' $P1986 = "112_1271336409.53729" 
    capture_lex $P1986
    .const 'Sub' $P1972 = "111_1271336409.53729" 
    capture_lex $P1972
    .const 'Sub' $P1962 = "110_1271336409.53729" 
    capture_lex $P1962
    .const 'Sub' $P1952 = "109_1271336409.53729" 
    capture_lex $P1952
    .const 'Sub' $P1942 = "108_1271336409.53729" 
    capture_lex $P1942
    .const 'Sub' $P1932 = "107_1271336409.53729" 
    capture_lex $P1932
    .const 'Sub' $P1922 = "106_1271336409.53729" 
    capture_lex $P1922
    .const 'Sub' $P1894 = "105_1271336409.53729" 
    capture_lex $P1894
    .const 'Sub' $P1877 = "104_1271336409.53729" 
    capture_lex $P1877
    .const 'Sub' $P1867 = "103_1271336409.53729" 
    capture_lex $P1867
    .const 'Sub' $P1854 = "102_1271336409.53729" 
    capture_lex $P1854
    .const 'Sub' $P1841 = "101_1271336409.53729" 
    capture_lex $P1841
    .const 'Sub' $P1828 = "100_1271336409.53729" 
    capture_lex $P1828
    .const 'Sub' $P1818 = "99_1271336409.53729" 
    capture_lex $P1818
    .const 'Sub' $P1789 = "98_1271336409.53729" 
    capture_lex $P1789
    .const 'Sub' $P1769 = "97_1271336409.53729" 
    capture_lex $P1769
    .const 'Sub' $P1759 = "96_1271336409.53729" 
    capture_lex $P1759
    .const 'Sub' $P1749 = "95_1271336409.53729" 
    capture_lex $P1749
    .const 'Sub' $P1722 = "94_1271336409.53729" 
    capture_lex $P1722
    .const 'Sub' $P1704 = "93_1271336409.53729" 
    capture_lex $P1704
    .const 'Sub' $P1694 = "92_1271336409.53729" 
    capture_lex $P1694
    .const 'Sub' $P1610 = "89_1271336409.53729" 
    capture_lex $P1610
    .const 'Sub' $P1600 = "88_1271336409.53729" 
    capture_lex $P1600
    .const 'Sub' $P1571 = "87_1271336409.53729" 
    capture_lex $P1571
    .const 'Sub' $P1529 = "86_1271336409.53729" 
    capture_lex $P1529
    .const 'Sub' $P1513 = "85_1271336409.53729" 
    capture_lex $P1513
    .const 'Sub' $P1504 = "84_1271336409.53729" 
    capture_lex $P1504
    .const 'Sub' $P1472 = "83_1271336409.53729" 
    capture_lex $P1472
    .const 'Sub' $P1373 = "80_1271336409.53729" 
    capture_lex $P1373
    .const 'Sub' $P1356 = "79_1271336409.53729" 
    capture_lex $P1356
    .const 'Sub' $P1336 = "78_1271336409.53729" 
    capture_lex $P1336
    .const 'Sub' $P1252 = "77_1271336409.53729" 
    capture_lex $P1252
    .const 'Sub' $P1228 = "75_1271336409.53729" 
    capture_lex $P1228
    .const 'Sub' $P1194 = "73_1271336409.53729" 
    capture_lex $P1194
    .const 'Sub' $P1144 = "71_1271336409.53729" 
    capture_lex $P1144
    .const 'Sub' $P1134 = "70_1271336409.53729" 
    capture_lex $P1134
    .const 'Sub' $P1124 = "69_1271336409.53729" 
    capture_lex $P1124
    .const 'Sub' $P1053 = "67_1271336409.53729" 
    capture_lex $P1053
    .const 'Sub' $P1036 = "66_1271336409.53729" 
    capture_lex $P1036
    .const 'Sub' $P1026 = "65_1271336409.53729" 
    capture_lex $P1026
    .const 'Sub' $P1016 = "64_1271336409.53729" 
    capture_lex $P1016
    .const 'Sub' $P1006 = "63_1271336409.53729" 
    capture_lex $P1006
    .const 'Sub' $P982 = "62_1271336409.53729" 
    capture_lex $P982
    .const 'Sub' $P929 = "61_1271336409.53729" 
    capture_lex $P929
    .const 'Sub' $P919 = "60_1271336409.53729" 
    capture_lex $P919
    .const 'Sub' $P830 = "58_1271336409.53729" 
    capture_lex $P830
    .const 'Sub' $P804 = "57_1271336409.53729" 
    capture_lex $P804
    .const 'Sub' $P788 = "56_1271336409.53729" 
    capture_lex $P788
    .const 'Sub' $P778 = "55_1271336409.53729" 
    capture_lex $P778
    .const 'Sub' $P768 = "54_1271336409.53729" 
    capture_lex $P768
    .const 'Sub' $P758 = "53_1271336409.53729" 
    capture_lex $P758
    .const 'Sub' $P748 = "52_1271336409.53729" 
    capture_lex $P748
    .const 'Sub' $P738 = "51_1271336409.53729" 
    capture_lex $P738
    .const 'Sub' $P728 = "50_1271336409.53729" 
    capture_lex $P728
    .const 'Sub' $P718 = "49_1271336409.53729" 
    capture_lex $P718
    .const 'Sub' $P708 = "48_1271336409.53729" 
    capture_lex $P708
    .const 'Sub' $P698 = "47_1271336409.53729" 
    capture_lex $P698
    .const 'Sub' $P688 = "46_1271336409.53729" 
    capture_lex $P688
    .const 'Sub' $P678 = "45_1271336409.53729" 
    capture_lex $P678
    .const 'Sub' $P668 = "44_1271336409.53729" 
    capture_lex $P668
    .const 'Sub' $P658 = "43_1271336409.53729" 
    capture_lex $P658
    .const 'Sub' $P640 = "42_1271336409.53729" 
    capture_lex $P640
    .const 'Sub' $P605 = "41_1271336409.53729" 
    capture_lex $P605
    .const 'Sub' $P589 = "40_1271336409.53729" 
    capture_lex $P589
    .const 'Sub' $P568 = "39_1271336409.53729" 
    capture_lex $P568
    .const 'Sub' $P548 = "38_1271336409.53729" 
    capture_lex $P548
    .const 'Sub' $P535 = "37_1271336409.53729" 
    capture_lex $P535
    .const 'Sub' $P509 = "36_1271336409.53729" 
    capture_lex $P509
    .const 'Sub' $P473 = "35_1271336409.53729" 
    capture_lex $P473
    .const 'Sub' $P456 = "34_1271336409.53729" 
    capture_lex $P456
    .const 'Sub' $P442 = "33_1271336409.53729" 
    capture_lex $P442
    .const 'Sub' $P389 = "31_1271336409.53729" 
    capture_lex $P389
    .const 'Sub' $P376 = "30_1271336409.53729" 
    capture_lex $P376
    .const 'Sub' $P357 = "29_1271336409.53729" 
    capture_lex $P357
    .const 'Sub' $P347 = "28_1271336409.53729" 
    capture_lex $P347
    .const 'Sub' $P337 = "27_1271336409.53729" 
    capture_lex $P337
    .const 'Sub' $P321 = "26_1271336409.53729" 
    capture_lex $P321
    .const 'Sub' $P261 = "24_1271336409.53729" 
    capture_lex $P261
    .const 'Sub' $P212 = "22_1271336409.53729" 
    capture_lex $P212
    .const 'Sub' $P193 = "21_1271336409.53729" 
    capture_lex $P193
    .const 'Sub' $P160 = "20_1271336409.53729" 
    capture_lex $P160
    .const 'Sub' $P150 = "19_1271336409.53729" 
    capture_lex $P150
    .const 'Sub' $P96 = "18_1271336409.53729" 
    capture_lex $P96
    .const 'Sub' $P81 = "17_1271336409.53729" 
    capture_lex $P81
    .const 'Sub' $P61 = "16_1271336409.53729" 
    capture_lex $P61
    .const 'Sub' $P26 = "13_1271336409.53729" 
    capture_lex $P26
    .const 'Sub' $P16 = "12_1271336409.53729" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_129
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P15
  vivify_129:
.annotate "line", 9
    .const 'Sub' $P16 = "12_1271336409.53729" 
    capture_lex $P16
    .lex "xblock_immediate", $P16
.annotate "line", 14
    .const 'Sub' $P26 = "13_1271336409.53729" 
    capture_lex $P26
    .lex "block_immediate", $P26
.annotate "line", 24
    .const 'Sub' $P61 = "16_1271336409.53729" 
    capture_lex $P61
    .lex "vivitype", $P61
.annotate "line", 43
    .const 'Sub' $P81 = "17_1271336409.53729" 
    capture_lex $P81
    .lex "colonpair_str", $P81
.annotate "line", 190
    .const 'Sub' $P96 = "18_1271336409.53729" 
    capture_lex $P96
    .lex "push_block_handler", $P96
.annotate "line", 3
    get_global $P146, "@BLOCK"
.annotate "line", 5
    find_lex $P147, "xblock_immediate"
    find_lex $P148, "block_immediate"
    find_lex $P149, "vivitype"
.annotate "line", 35
    find_lex $P192, "colonpair_str"
.annotate "line", 183
    find_lex $P588, "push_block_handler"
.annotate "line", 768
    get_hll_global $P2100, ["NQP";"RegexActions"], "_block2099" 
    capture_lex $P2100
    $P2162 = $P2100()
.annotate "line", 3
    .return ($P2162)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post127") :outer("11_1271336409.53729")
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 5
    .const 'Sub' $P2164 = "125_1271336409.53729" 
    capture_lex $P2164
    $P2164()
    $P2167 = get_root_global ["parrot"], "P6metaclass"
    $P2167."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block2163"  :anon :subid("125_1271336409.53729") :outer("11_1271336409.53729")
.annotate "line", 6
    get_global $P2165, "@BLOCK"
    unless_null $P2165, vivify_128
    $P2165 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P2165
  vivify_128:
 $P2166 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P2166
.annotate "line", 5
    .return ($P2166)
.end


.namespace ["NQP";"Actions"]
.sub "xblock_immediate"  :subid("12_1271336409.53729") :outer("11_1271336409.53729")
    .param pmc param_19
.annotate "line", 9
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(58)
    push_eh $P18
    .lex "$xblock", param_19
.annotate "line", 10
    find_lex $P20, "$xblock"
    unless_null $P20, vivify_130
    $P20 = root_new ['parrot';'ResizablePMCArray']
  vivify_130:
    set $P21, $P20[1]
    unless_null $P21, vivify_131
    new $P21, "Undef"
  vivify_131:
    $P22 = "block_immediate"($P21)
    find_lex $P23, "$xblock"
    unless_null $P23, vivify_132
    $P23 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$xblock", $P23
  vivify_132:
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
.sub "block_immediate"  :subid("13_1271336409.53729") :outer("11_1271336409.53729")
    .param pmc param_29
.annotate "line", 14
    .const 'Sub' $P39 = "14_1271336409.53729" 
    capture_lex $P39
    new $P28, 'ExceptionHandler'
    set_addr $P28, control_27
    $P28."handle_types"(58)
    push_eh $P28
    .lex "$block", param_29
.annotate "line", 15
    find_lex $P30, "$block"
    $P30."blocktype"("immediate")
.annotate "line", 16
    find_lex $P34, "$block"
    $P35 = $P34."symtable"()
    unless $P35, unless_33
    set $P32, $P35
    goto unless_33_end
  unless_33:
    find_lex $P36, "$block"
    $P37 = $P36."handlers"()
    set $P32, $P37
  unless_33_end:
    if $P32, unless_31_end
    .const 'Sub' $P39 = "14_1271336409.53729" 
    capture_lex $P39
    $P39()
  unless_31_end:
    find_lex $P59, "$block"
.annotate "line", 14
    .return ($P59)
  control_27:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P60, exception, "payload"
    .return ($P60)
.end


.namespace ["NQP";"Actions"]
.sub "_block38"  :anon :subid("14_1271336409.53729") :outer("13_1271336409.53729")
.annotate "line", 16
    .const 'Sub' $P50 = "15_1271336409.53729" 
    capture_lex $P50
.annotate "line", 17
    new $P40, "Undef"
    .lex "$stmts", $P40
    get_hll_global $P41, ["PAST"], "Stmts"
    find_lex $P42, "$block"
    $P43 = $P41."new"($P42 :named("node"))
    store_lex "$stmts", $P43
.annotate "line", 18
    find_lex $P45, "$block"
    $P46 = $P45."list"()
    defined $I47, $P46
    unless $I47, for_undef_133
    iter $P44, $P46
    new $P56, 'ExceptionHandler'
    set_addr $P56, loop55_handler
    $P56."handle_types"(65, 67, 66)
    push_eh $P56
  loop55_test:
    unless $P44, loop55_done
    shift $P48, $P44
  loop55_redo:
    .const 'Sub' $P50 = "15_1271336409.53729" 
    capture_lex $P50
    $P50($P48)
  loop55_next:
    goto loop55_test
  loop55_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P57, exception, 'type'
    eq $P57, 65, loop55_next
    eq $P57, 67, loop55_redo
  loop55_done:
    pop_eh 
  for_undef_133:
.annotate "line", 19
    find_lex $P58, "$stmts"
    store_lex "$block", $P58
.annotate "line", 16
    .return ($P58)
.end


.namespace ["NQP";"Actions"]
.sub "_block49"  :anon :subid("15_1271336409.53729") :outer("14_1271336409.53729")
    .param pmc param_51
.annotate "line", 18
    .lex "$_", param_51
    find_lex $P52, "$stmts"
    find_lex $P53, "$_"
    $P54 = $P52."push"($P53)
    .return ($P54)
.end


.namespace ["NQP";"Actions"]
.sub "vivitype"  :subid("16_1271336409.53729") :outer("11_1271336409.53729")
    .param pmc param_64
.annotate "line", 24
    new $P63, 'ExceptionHandler'
    set_addr $P63, control_62
    $P63."handle_types"(58)
    push_eh $P63
    .lex "$sigil", param_64
.annotate "line", 25
    find_lex $P67, "$sigil"
    set $S68, $P67
    iseq $I69, $S68, "%"
    if $I69, if_66
.annotate "line", 27
    find_lex $P74, "$sigil"
    set $S75, $P74
    iseq $I76, $S75, "@"
    if $I76, if_73
    new $P79, "String"
    assign $P79, "Undef"
    set $P72, $P79
    goto if_73_end
  if_73:
.annotate "line", 28
    get_hll_global $P77, ["PAST"], "Op"
    $P78 = $P77."new"("    %r = root_new ['parrot';'ResizablePMCArray']" :named("inline"))
    set $P72, $P78
  if_73_end:
    set $P65, $P72
.annotate "line", 25
    goto if_66_end
  if_66:
.annotate "line", 26
    get_hll_global $P70, ["PAST"], "Op"
    $P71 = $P70."new"("    %r = root_new ['parrot';'Hash']" :named("inline"))
    set $P65, $P71
  if_66_end:
.annotate "line", 24
    .return ($P65)
  control_62:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P80, exception, "payload"
    .return ($P80)
.end


.namespace ["NQP";"Actions"]
.sub "colonpair_str"  :subid("17_1271336409.53729") :outer("11_1271336409.53729")
    .param pmc param_84
.annotate "line", 43
    new $P83, 'ExceptionHandler'
    set_addr $P83, control_82
    $P83."handle_types"(58)
    push_eh $P83
    .lex "$ast", param_84
.annotate "line", 44
    get_hll_global $P87, ["PAST"], "Op"
    find_lex $P88, "$ast"
    $P89 = $P87."ACCEPTS"($P88)
    if $P89, if_86
.annotate "line", 46
    find_lex $P93, "$ast"
    $P94 = $P93."value"()
    set $P85, $P94
.annotate "line", 44
    goto if_86_end
  if_86:
.annotate "line", 45
    find_lex $P90, "$ast"
    $P91 = $P90."list"()
    join $S92, " ", $P91
    new $P85, 'String'
    set $P85, $S92
  if_86_end:
.annotate "line", 43
    .return ($P85)
  control_82:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P95, exception, "payload"
    .return ($P95)
.end


.namespace ["NQP";"Actions"]
.sub "push_block_handler"  :subid("18_1271336409.53729") :outer("11_1271336409.53729")
    .param pmc param_99
    .param pmc param_100
.annotate "line", 190
    new $P98, 'ExceptionHandler'
    set_addr $P98, control_97
    $P98."handle_types"(58)
    push_eh $P98
    .lex "$/", param_99
    .lex "$block", param_100
.annotate "line", 191
    get_global $P102, "@BLOCK"
    unless_null $P102, vivify_134
    $P102 = root_new ['parrot';'ResizablePMCArray']
  vivify_134:
    set $P103, $P102[0]
    unless_null $P103, vivify_135
    new $P103, "Undef"
  vivify_135:
    $P104 = $P103."handlers"()
    if $P104, unless_101_end
.annotate "line", 192
    get_global $P105, "@BLOCK"
    unless_null $P105, vivify_136
    $P105 = root_new ['parrot';'ResizablePMCArray']
  vivify_136:
    set $P106, $P105[0]
    unless_null $P106, vivify_137
    new $P106, "Undef"
  vivify_137:
    new $P107, "ResizablePMCArray"
    $P106."handlers"($P107)
  unless_101_end:
.annotate "line", 194
    find_lex $P109, "$block"
    $P110 = $P109."arity"()
    if $P110, unless_108_end
.annotate "line", 195
    find_lex $P111, "$block"
.annotate "line", 196
    get_hll_global $P112, ["PAST"], "Op"
.annotate "line", 197
    get_hll_global $P113, ["PAST"], "Var"
    $P114 = $P113."new"("lexical" :named("scope"), "$!" :named("name"), 1 :named("isdecl"))
.annotate "line", 198
    get_hll_global $P115, ["PAST"], "Var"
    $P116 = $P115."new"("lexical" :named("scope"), "$_" :named("name"))
    $P117 = $P112."new"($P114, $P116, "bind" :named("pasttype"))
.annotate "line", 196
    $P111."unshift"($P117)
.annotate "line", 201
    find_lex $P118, "$block"
    get_hll_global $P119, ["PAST"], "Var"
    $P120 = $P119."new"("$_" :named("name"), "parameter" :named("scope"))
    $P118."unshift"($P120)
.annotate "line", 202
    find_lex $P121, "$block"
    $P121."symbol"("$_", "lexical" :named("scope"))
.annotate "line", 203
    find_lex $P122, "$block"
    $P122."symbol"("$!", "lexical" :named("scope"))
.annotate "line", 204
    find_lex $P123, "$block"
    $P123."arity"(1)
  unless_108_end:
.annotate "line", 206
    find_lex $P124, "$block"
    $P124."blocktype"("declaration")
.annotate "line", 207
    get_global $P125, "@BLOCK"
    unless_null $P125, vivify_138
    $P125 = root_new ['parrot';'ResizablePMCArray']
  vivify_138:
    set $P126, $P125[0]
    unless_null $P126, vivify_139
    new $P126, "Undef"
  vivify_139:
    $P127 = $P126."handlers"()
.annotate "line", 208
    get_hll_global $P128, ["PAST"], "Control"
    find_lex $P129, "$/"
.annotate "line", 210
    get_hll_global $P130, ["PAST"], "Stmts"
.annotate "line", 211
    get_hll_global $P131, ["PAST"], "Op"
    find_lex $P132, "$block"
.annotate "line", 213
    get_hll_global $P133, ["PAST"], "Var"
    $P134 = $P133."new"("register" :named("scope"), "exception" :named("name"))
    $P135 = $P131."new"($P132, $P134, "call" :named("pasttype"))
.annotate "line", 215
    get_hll_global $P136, ["PAST"], "Op"
.annotate "line", 216
    get_hll_global $P137, ["PAST"], "Var"
.annotate "line", 217
    get_hll_global $P138, ["PAST"], "Var"
    $P139 = $P138."new"("register" :named("scope"), "exception" :named("name"))
    $P140 = $P137."new"($P139, "handled", "keyed" :named("scope"))
.annotate "line", 216
    $P141 = $P136."new"($P140, 1, "bind" :named("pasttype"))
.annotate "line", 215
    $P142 = $P130."new"($P135, $P141)
.annotate "line", 210
    $P143 = $P128."new"($P142, $P129 :named("node"))
.annotate "line", 208
    $P144 = $P127."unshift"($P143)
.annotate "line", 190
    .return ($P144)
  control_97:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P145, exception, "payload"
    .return ($P145)
.end


.namespace ["NQP";"Actions"]
.sub "TOP"  :subid("19_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_153
.annotate "line", 33
    new $P152, 'ExceptionHandler'
    set_addr $P152, control_151
    $P152."handle_types"(58)
    push_eh $P152
    .lex "self", self
    .lex "$/", param_153
    find_lex $P154, "$/"
    find_lex $P155, "$/"
    unless_null $P155, vivify_140
    $P155 = root_new ['parrot';'Hash']
  vivify_140:
    set $P156, $P155["comp_unit"]
    unless_null $P156, vivify_141
    new $P156, "Undef"
  vivify_141:
    $P157 = $P156."ast"()
    $P158 = $P154."!make"($P157)
    .return ($P158)
  control_151:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P159, exception, "payload"
    .return ($P159)
.end


.namespace ["NQP";"Actions"]
.sub "deflongname"  :subid("20_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_163
.annotate "line", 35
    new $P162, 'ExceptionHandler'
    set_addr $P162, control_161
    $P162."handle_types"(58)
    push_eh $P162
    .lex "self", self
    .lex "$/", param_163
.annotate "line", 36
    find_lex $P164, "$/"
.annotate "line", 37
    find_lex $P167, "$/"
    unless_null $P167, vivify_142
    $P167 = root_new ['parrot';'Hash']
  vivify_142:
    set $P168, $P167["colonpair"]
    unless_null $P168, vivify_143
    new $P168, "Undef"
  vivify_143:
    if $P168, if_166
.annotate "line", 39
    find_lex $P188, "$/"
    set $S189, $P188
    new $P165, 'String'
    set $P165, $S189
.annotate "line", 37
    goto if_166_end
  if_166:
    find_lex $P169, "$/"
    unless_null $P169, vivify_144
    $P169 = root_new ['parrot';'Hash']
  vivify_144:
    set $P170, $P169["identifier"]
    unless_null $P170, vivify_145
    new $P170, "Undef"
  vivify_145:
    set $S171, $P170
    new $P172, 'String'
    set $P172, $S171
    concat $P173, $P172, ":"
    find_lex $P174, "$/"
    unless_null $P174, vivify_146
    $P174 = root_new ['parrot';'Hash']
  vivify_146:
    set $P175, $P174["colonpair"]
    unless_null $P175, vivify_147
    $P175 = root_new ['parrot';'ResizablePMCArray']
  vivify_147:
    set $P176, $P175[0]
    unless_null $P176, vivify_148
    new $P176, "Undef"
  vivify_148:
    $P177 = $P176."ast"()
    $S178 = $P177."named"()
    concat $P179, $P173, $S178
    concat $P180, $P179, "<"
.annotate "line", 38
    find_lex $P181, "$/"
    unless_null $P181, vivify_149
    $P181 = root_new ['parrot';'Hash']
  vivify_149:
    set $P182, $P181["colonpair"]
    unless_null $P182, vivify_150
    $P182 = root_new ['parrot';'ResizablePMCArray']
  vivify_150:
    set $P183, $P182[0]
    unless_null $P183, vivify_151
    new $P183, "Undef"
  vivify_151:
    $P184 = $P183."ast"()
    $S185 = "colonpair_str"($P184)
    concat $P186, $P180, $S185
    concat $P187, $P186, ">"
    set $P165, $P187
  if_166_end:
.annotate "line", 37
    $P190 = $P164."!make"($P165)
.annotate "line", 35
    .return ($P190)
  control_161:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P191, exception, "payload"
    .return ($P191)
.end


.namespace ["NQP";"Actions"]
.sub "comp_unit"  :subid("21_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_196
.annotate "line", 49
    new $P195, 'ExceptionHandler'
    set_addr $P195, control_194
    $P195."handle_types"(58)
    push_eh $P195
    .lex "self", self
    .lex "$/", param_196
.annotate "line", 50
    new $P197, "Undef"
    .lex "$past", $P197
.annotate "line", 51
    new $P198, "Undef"
    .lex "$BLOCK", $P198
.annotate "line", 50
    find_lex $P199, "$/"
    unless_null $P199, vivify_152
    $P199 = root_new ['parrot';'Hash']
  vivify_152:
    set $P200, $P199["statementlist"]
    unless_null $P200, vivify_153
    new $P200, "Undef"
  vivify_153:
    $P201 = $P200."ast"()
    store_lex "$past", $P201
.annotate "line", 51
    get_global $P202, "@BLOCK"
    $P203 = $P202."shift"()
    store_lex "$BLOCK", $P203
.annotate "line", 52
    find_lex $P204, "$BLOCK"
    find_lex $P205, "$past"
    $P204."push"($P205)
.annotate "line", 53
    find_lex $P206, "$BLOCK"
    find_lex $P207, "$/"
    $P206."node"($P207)
.annotate "line", 54
    find_lex $P208, "$/"
    find_lex $P209, "$BLOCK"
    $P210 = $P208."!make"($P209)
.annotate "line", 49
    .return ($P210)
  control_194:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P211, exception, "payload"
    .return ($P211)
.end


.namespace ["NQP";"Actions"]
.sub "statementlist"  :subid("22_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_215
.annotate "line", 57
    .const 'Sub' $P229 = "23_1271336409.53729" 
    capture_lex $P229
    new $P214, 'ExceptionHandler'
    set_addr $P214, control_213
    $P214."handle_types"(58)
    push_eh $P214
    .lex "self", self
    .lex "$/", param_215
.annotate "line", 58
    new $P216, "Undef"
    .lex "$past", $P216
    get_hll_global $P217, ["PAST"], "Stmts"
    find_lex $P218, "$/"
    $P219 = $P217."new"($P218 :named("node"))
    store_lex "$past", $P219
.annotate "line", 59
    find_lex $P221, "$/"
    unless_null $P221, vivify_154
    $P221 = root_new ['parrot';'Hash']
  vivify_154:
    set $P222, $P221["statement"]
    unless_null $P222, vivify_155
    new $P222, "Undef"
  vivify_155:
    unless $P222, if_220_end
.annotate "line", 60
    find_lex $P224, "$/"
    unless_null $P224, vivify_156
    $P224 = root_new ['parrot';'Hash']
  vivify_156:
    set $P225, $P224["statement"]
    unless_null $P225, vivify_157
    new $P225, "Undef"
  vivify_157:
    defined $I226, $P225
    unless $I226, for_undef_158
    iter $P223, $P225
    new $P255, 'ExceptionHandler'
    set_addr $P255, loop254_handler
    $P255."handle_types"(65, 67, 66)
    push_eh $P255
  loop254_test:
    unless $P223, loop254_done
    shift $P227, $P223
  loop254_redo:
    .const 'Sub' $P229 = "23_1271336409.53729" 
    capture_lex $P229
    $P229($P227)
  loop254_next:
    goto loop254_test
  loop254_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P256, exception, 'type'
    eq $P256, 65, loop254_next
    eq $P256, 67, loop254_redo
  loop254_done:
    pop_eh 
  for_undef_158:
  if_220_end:
.annotate "line", 69
    find_lex $P257, "$/"
    find_lex $P258, "$past"
    $P259 = $P257."!make"($P258)
.annotate "line", 57
    .return ($P259)
  control_213:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P260, exception, "payload"
    .return ($P260)
.end


.namespace ["NQP";"Actions"]
.sub "_block228"  :anon :subid("23_1271336409.53729") :outer("22_1271336409.53729")
    .param pmc param_231
.annotate "line", 61
    new $P230, "Undef"
    .lex "$ast", $P230
    .lex "$_", param_231
    find_lex $P232, "$_"
    $P233 = $P232."ast"()
    store_lex "$ast", $P233
.annotate "line", 62
    find_lex $P235, "$ast"
    unless_null $P235, vivify_159
    $P235 = root_new ['parrot';'Hash']
  vivify_159:
    set $P236, $P235["sink"]
    unless_null $P236, vivify_160
    new $P236, "Undef"
  vivify_160:
    defined $I237, $P236
    unless $I237, if_234_end
    find_lex $P238, "$ast"
    unless_null $P238, vivify_161
    $P238 = root_new ['parrot';'Hash']
  vivify_161:
    set $P239, $P238["sink"]
    unless_null $P239, vivify_162
    new $P239, "Undef"
  vivify_162:
    store_lex "$ast", $P239
  if_234_end:
.annotate "line", 63
    find_lex $P243, "$ast"
    get_hll_global $P244, ["PAST"], "Block"
    $P245 = $P243."isa"($P244)
    if $P245, if_242
    set $P241, $P245
    goto if_242_end
  if_242:
    find_lex $P246, "$ast"
    $P247 = $P246."blocktype"()
    isfalse $I248, $P247
    new $P241, 'Integer'
    set $P241, $I248
  if_242_end:
    unless $P241, if_240_end
.annotate "line", 64
    find_lex $P249, "$ast"
    $P250 = "block_immediate"($P249)
    store_lex "$ast", $P250
  if_240_end:
.annotate "line", 66
    find_lex $P251, "$past"
    find_lex $P252, "$ast"
    $P253 = $P251."push"($P252)
.annotate "line", 60
    .return ($P253)
.end


.namespace ["NQP";"Actions"]
.sub "statement"  :subid("24_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_264
    .param pmc param_265 :optional
    .param int has_param_265 :opt_flag
.annotate "line", 72
    .const 'Sub' $P273 = "25_1271336409.53729" 
    capture_lex $P273
    new $P263, 'ExceptionHandler'
    set_addr $P263, control_262
    $P263."handle_types"(58)
    push_eh $P263
    .lex "self", self
    .lex "$/", param_264
    if has_param_265, optparam_163
    new $P266, "Undef"
    set param_265, $P266
  optparam_163:
    .lex "$key", param_265
.annotate "line", 73
    new $P267, "Undef"
    .lex "$past", $P267
.annotate "line", 72
    find_lex $P268, "$past"
.annotate "line", 74
    find_lex $P270, "$/"
    unless_null $P270, vivify_164
    $P270 = root_new ['parrot';'Hash']
  vivify_164:
    set $P271, $P270["EXPR"]
    unless_null $P271, vivify_165
    new $P271, "Undef"
  vivify_165:
    if $P271, if_269
.annotate "line", 85
    find_lex $P311, "$/"
    unless_null $P311, vivify_166
    $P311 = root_new ['parrot';'Hash']
  vivify_166:
    set $P312, $P311["statement_control"]
    unless_null $P312, vivify_167
    new $P312, "Undef"
  vivify_167:
    if $P312, if_310
.annotate "line", 86
    new $P316, "Integer"
    assign $P316, 0
    store_lex "$past", $P316
    goto if_310_end
  if_310:
.annotate "line", 85
    find_lex $P313, "$/"
    unless_null $P313, vivify_168
    $P313 = root_new ['parrot';'Hash']
  vivify_168:
    set $P314, $P313["statement_control"]
    unless_null $P314, vivify_169
    new $P314, "Undef"
  vivify_169:
    $P315 = $P314."ast"()
    store_lex "$past", $P315
  if_310_end:
    goto if_269_end
  if_269:
.annotate "line", 74
    .const 'Sub' $P273 = "25_1271336409.53729" 
    capture_lex $P273
    $P273()
  if_269_end:
.annotate "line", 87
    find_lex $P317, "$/"
    find_lex $P318, "$past"
    $P319 = $P317."!make"($P318)
.annotate "line", 72
    .return ($P319)
  control_262:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P320, exception, "payload"
    .return ($P320)
.end


.namespace ["NQP";"Actions"]
.sub "_block272"  :anon :subid("25_1271336409.53729") :outer("24_1271336409.53729")
.annotate "line", 75
    new $P274, "Undef"
    .lex "$mc", $P274
.annotate "line", 76
    new $P275, "Undef"
    .lex "$ml", $P275
.annotate "line", 75
    find_lex $P276, "$/"
    unless_null $P276, vivify_170
    $P276 = root_new ['parrot';'Hash']
  vivify_170:
    set $P277, $P276["statement_mod_cond"]
    unless_null $P277, vivify_171
    $P277 = root_new ['parrot';'ResizablePMCArray']
  vivify_171:
    set $P278, $P277[0]
    unless_null $P278, vivify_172
    new $P278, "Undef"
  vivify_172:
    store_lex "$mc", $P278
.annotate "line", 76
    find_lex $P279, "$/"
    unless_null $P279, vivify_173
    $P279 = root_new ['parrot';'Hash']
  vivify_173:
    set $P280, $P279["statement_mod_loop"]
    unless_null $P280, vivify_174
    $P280 = root_new ['parrot';'ResizablePMCArray']
  vivify_174:
    set $P281, $P280[0]
    unless_null $P281, vivify_175
    new $P281, "Undef"
  vivify_175:
    store_lex "$ml", $P281
.annotate "line", 77
    find_lex $P282, "$/"
    unless_null $P282, vivify_176
    $P282 = root_new ['parrot';'Hash']
  vivify_176:
    set $P283, $P282["EXPR"]
    unless_null $P283, vivify_177
    new $P283, "Undef"
  vivify_177:
    $P284 = $P283."ast"()
    store_lex "$past", $P284
.annotate "line", 78
    find_lex $P286, "$mc"
    unless $P286, if_285_end
.annotate "line", 79
    get_hll_global $P287, ["PAST"], "Op"
    find_lex $P288, "$mc"
    unless_null $P288, vivify_178
    $P288 = root_new ['parrot';'Hash']
  vivify_178:
    set $P289, $P288["cond"]
    unless_null $P289, vivify_179
    new $P289, "Undef"
  vivify_179:
    $P290 = $P289."ast"()
    find_lex $P291, "$past"
    find_lex $P292, "$mc"
    unless_null $P292, vivify_180
    $P292 = root_new ['parrot';'Hash']
  vivify_180:
    set $P293, $P292["sym"]
    unless_null $P293, vivify_181
    new $P293, "Undef"
  vivify_181:
    set $S294, $P293
    find_lex $P295, "$/"
    $P296 = $P287."new"($P290, $P291, $S294 :named("pasttype"), $P295 :named("node"))
    store_lex "$past", $P296
  if_285_end:
.annotate "line", 81
    find_lex $P299, "$ml"
    if $P299, if_298
    set $P297, $P299
    goto if_298_end
  if_298:
.annotate "line", 82
    get_hll_global $P300, ["PAST"], "Op"
    find_lex $P301, "$ml"
    unless_null $P301, vivify_182
    $P301 = root_new ['parrot';'Hash']
  vivify_182:
    set $P302, $P301["cond"]
    unless_null $P302, vivify_183
    new $P302, "Undef"
  vivify_183:
    $P303 = $P302."ast"()
    find_lex $P304, "$past"
    find_lex $P305, "$ml"
    unless_null $P305, vivify_184
    $P305 = root_new ['parrot';'Hash']
  vivify_184:
    set $P306, $P305["sym"]
    unless_null $P306, vivify_185
    new $P306, "Undef"
  vivify_185:
    set $S307, $P306
    find_lex $P308, "$/"
    $P309 = $P300."new"($P303, $P304, $S307 :named("pasttype"), $P308 :named("node"))
    store_lex "$past", $P309
.annotate "line", 81
    set $P297, $P309
  if_298_end:
.annotate "line", 74
    .return ($P297)
.end


.namespace ["NQP";"Actions"]
.sub "xblock"  :subid("26_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_324
.annotate "line", 90
    new $P323, 'ExceptionHandler'
    set_addr $P323, control_322
    $P323."handle_types"(58)
    push_eh $P323
    .lex "self", self
    .lex "$/", param_324
.annotate "line", 91
    find_lex $P325, "$/"
    get_hll_global $P326, ["PAST"], "Op"
    find_lex $P327, "$/"
    unless_null $P327, vivify_186
    $P327 = root_new ['parrot';'Hash']
  vivify_186:
    set $P328, $P327["EXPR"]
    unless_null $P328, vivify_187
    new $P328, "Undef"
  vivify_187:
    $P329 = $P328."ast"()
    find_lex $P330, "$/"
    unless_null $P330, vivify_188
    $P330 = root_new ['parrot';'Hash']
  vivify_188:
    set $P331, $P330["pblock"]
    unless_null $P331, vivify_189
    new $P331, "Undef"
  vivify_189:
    $P332 = $P331."ast"()
    find_lex $P333, "$/"
    $P334 = $P326."new"($P329, $P332, "if" :named("pasttype"), $P333 :named("node"))
    $P335 = $P325."!make"($P334)
.annotate "line", 90
    .return ($P335)
  control_322:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P336, exception, "payload"
    .return ($P336)
.end


.namespace ["NQP";"Actions"]
.sub "pblock"  :subid("27_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_340
.annotate "line", 94
    new $P339, 'ExceptionHandler'
    set_addr $P339, control_338
    $P339."handle_types"(58)
    push_eh $P339
    .lex "self", self
    .lex "$/", param_340
.annotate "line", 95
    find_lex $P341, "$/"
    find_lex $P342, "$/"
    unless_null $P342, vivify_190
    $P342 = root_new ['parrot';'Hash']
  vivify_190:
    set $P343, $P342["blockoid"]
    unless_null $P343, vivify_191
    new $P343, "Undef"
  vivify_191:
    $P344 = $P343."ast"()
    $P345 = $P341."!make"($P344)
.annotate "line", 94
    .return ($P345)
  control_338:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P346, exception, "payload"
    .return ($P346)
.end


.namespace ["NQP";"Actions"]
.sub "block"  :subid("28_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_350
.annotate "line", 98
    new $P349, 'ExceptionHandler'
    set_addr $P349, control_348
    $P349."handle_types"(58)
    push_eh $P349
    .lex "self", self
    .lex "$/", param_350
.annotate "line", 99
    find_lex $P351, "$/"
    find_lex $P352, "$/"
    unless_null $P352, vivify_192
    $P352 = root_new ['parrot';'Hash']
  vivify_192:
    set $P353, $P352["blockoid"]
    unless_null $P353, vivify_193
    new $P353, "Undef"
  vivify_193:
    $P354 = $P353."ast"()
    $P355 = $P351."!make"($P354)
.annotate "line", 98
    .return ($P355)
  control_348:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P356, exception, "payload"
    .return ($P356)
.end


.namespace ["NQP";"Actions"]
.sub "blockoid"  :subid("29_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_360
.annotate "line", 102
    new $P359, 'ExceptionHandler'
    set_addr $P359, control_358
    $P359."handle_types"(58)
    push_eh $P359
    .lex "self", self
    .lex "$/", param_360
.annotate "line", 103
    new $P361, "Undef"
    .lex "$past", $P361
.annotate "line", 104
    new $P362, "Undef"
    .lex "$BLOCK", $P362
.annotate "line", 103
    find_lex $P363, "$/"
    unless_null $P363, vivify_194
    $P363 = root_new ['parrot';'Hash']
  vivify_194:
    set $P364, $P363["statementlist"]
    unless_null $P364, vivify_195
    new $P364, "Undef"
  vivify_195:
    $P365 = $P364."ast"()
    store_lex "$past", $P365
.annotate "line", 104
    get_global $P366, "@BLOCK"
    $P367 = $P366."shift"()
    store_lex "$BLOCK", $P367
.annotate "line", 105
    find_lex $P368, "$BLOCK"
    find_lex $P369, "$past"
    $P368."push"($P369)
.annotate "line", 106
    find_lex $P370, "$BLOCK"
    find_lex $P371, "$/"
    $P370."node"($P371)
.annotate "line", 107
    find_lex $P372, "$/"
    find_lex $P373, "$BLOCK"
    $P374 = $P372."!make"($P373)
.annotate "line", 102
    .return ($P374)
  control_358:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P375, exception, "payload"
    .return ($P375)
.end


.namespace ["NQP";"Actions"]
.sub "newpad"  :subid("30_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_379
.annotate "line", 110
    new $P378, 'ExceptionHandler'
    set_addr $P378, control_377
    $P378."handle_types"(58)
    push_eh $P378
    .lex "self", self
    .lex "$/", param_379
.annotate "line", 111
    get_global $P380, "@BLOCK"
    unless_null $P380, vivify_196
    $P380 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P380
  vivify_196:
.annotate "line", 110
    get_global $P381, "@BLOCK"
.annotate "line", 112
    get_global $P382, "@BLOCK"
    get_hll_global $P383, ["PAST"], "Block"
    get_hll_global $P384, ["PAST"], "Stmts"
    $P385 = $P384."new"()
    $P386 = $P383."new"($P385)
    $P387 = $P382."unshift"($P386)
.annotate "line", 110
    .return ($P387)
  control_377:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P388, exception, "payload"
    .return ($P388)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<if>"  :subid("31_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_392
.annotate "line", 117
    .const 'Sub' $P420 = "32_1271336409.53729" 
    capture_lex $P420
    new $P391, 'ExceptionHandler'
    set_addr $P391, control_390
    $P391."handle_types"(58)
    push_eh $P391
    .lex "self", self
    .lex "$/", param_392
.annotate "line", 118
    new $P393, "Undef"
    .lex "$count", $P393
.annotate "line", 119
    new $P394, "Undef"
    .lex "$past", $P394
.annotate "line", 118
    find_lex $P395, "$/"
    unless_null $P395, vivify_197
    $P395 = root_new ['parrot';'Hash']
  vivify_197:
    set $P396, $P395["xblock"]
    unless_null $P396, vivify_198
    new $P396, "Undef"
  vivify_198:
    set $N397, $P396
    new $P398, 'Float'
    set $P398, $N397
    sub $P399, $P398, 1
    store_lex "$count", $P399
.annotate "line", 119
    find_lex $P400, "$count"
    set $I401, $P400
    find_lex $P402, "$/"
    unless_null $P402, vivify_199
    $P402 = root_new ['parrot';'Hash']
  vivify_199:
    set $P403, $P402["xblock"]
    unless_null $P403, vivify_200
    $P403 = root_new ['parrot';'ResizablePMCArray']
  vivify_200:
    set $P404, $P403[$I401]
    unless_null $P404, vivify_201
    new $P404, "Undef"
  vivify_201:
    $P405 = $P404."ast"()
    $P406 = "xblock_immediate"($P405)
    store_lex "$past", $P406
.annotate "line", 120
    find_lex $P408, "$/"
    unless_null $P408, vivify_202
    $P408 = root_new ['parrot';'Hash']
  vivify_202:
    set $P409, $P408["else"]
    unless_null $P409, vivify_203
    new $P409, "Undef"
  vivify_203:
    unless $P409, if_407_end
.annotate "line", 121
    find_lex $P410, "$past"
    find_lex $P411, "$/"
    unless_null $P411, vivify_204
    $P411 = root_new ['parrot';'Hash']
  vivify_204:
    set $P412, $P411["else"]
    unless_null $P412, vivify_205
    $P412 = root_new ['parrot';'ResizablePMCArray']
  vivify_205:
    set $P413, $P412[0]
    unless_null $P413, vivify_206
    new $P413, "Undef"
  vivify_206:
    $P414 = $P413."ast"()
    $P415 = "block_immediate"($P414)
    $P410."push"($P415)
  if_407_end:
.annotate "line", 124
    new $P436, 'ExceptionHandler'
    set_addr $P436, loop435_handler
    $P436."handle_types"(65, 67, 66)
    push_eh $P436
  loop435_test:
    find_lex $P416, "$count"
    set $N417, $P416
    isgt $I418, $N417, 0.0
    unless $I418, loop435_done
  loop435_redo:
    .const 'Sub' $P420 = "32_1271336409.53729" 
    capture_lex $P420
    $P420()
  loop435_next:
    goto loop435_test
  loop435_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P437, exception, 'type'
    eq $P437, 65, loop435_next
    eq $P437, 67, loop435_redo
  loop435_done:
    pop_eh 
.annotate "line", 130
    find_lex $P438, "$/"
    find_lex $P439, "$past"
    $P440 = $P438."!make"($P439)
.annotate "line", 117
    .return ($P440)
  control_390:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P441, exception, "payload"
    .return ($P441)
.end


.namespace ["NQP";"Actions"]
.sub "_block419"  :anon :subid("32_1271336409.53729") :outer("31_1271336409.53729")
.annotate "line", 126
    new $P421, "Undef"
    .lex "$else", $P421
.annotate "line", 124
    find_lex $P422, "$count"
    clone $P423, $P422
    dec $P422
.annotate "line", 126
    find_lex $P424, "$past"
    store_lex "$else", $P424
.annotate "line", 127
    find_lex $P425, "$count"
    set $I426, $P425
    find_lex $P427, "$/"
    unless_null $P427, vivify_207
    $P427 = root_new ['parrot';'Hash']
  vivify_207:
    set $P428, $P427["xblock"]
    unless_null $P428, vivify_208
    $P428 = root_new ['parrot';'ResizablePMCArray']
  vivify_208:
    set $P429, $P428[$I426]
    unless_null $P429, vivify_209
    new $P429, "Undef"
  vivify_209:
    $P430 = $P429."ast"()
    $P431 = "xblock_immediate"($P430)
    store_lex "$past", $P431
.annotate "line", 128
    find_lex $P432, "$past"
    find_lex $P433, "$else"
    $P434 = $P432."push"($P433)
.annotate "line", 124
    .return ($P434)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<unless>"  :subid("33_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_445
.annotate "line", 133
    new $P444, 'ExceptionHandler'
    set_addr $P444, control_443
    $P444."handle_types"(58)
    push_eh $P444
    .lex "self", self
    .lex "$/", param_445
.annotate "line", 134
    new $P446, "Undef"
    .lex "$past", $P446
    find_lex $P447, "$/"
    unless_null $P447, vivify_210
    $P447 = root_new ['parrot';'Hash']
  vivify_210:
    set $P448, $P447["xblock"]
    unless_null $P448, vivify_211
    new $P448, "Undef"
  vivify_211:
    $P449 = $P448."ast"()
    $P450 = "xblock_immediate"($P449)
    store_lex "$past", $P450
.annotate "line", 135
    find_lex $P451, "$past"
    $P451."pasttype"("unless")
.annotate "line", 136
    find_lex $P452, "$/"
    find_lex $P453, "$past"
    $P454 = $P452."!make"($P453)
.annotate "line", 133
    .return ($P454)
  control_443:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P455, exception, "payload"
    .return ($P455)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<while>"  :subid("34_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_459
.annotate "line", 139
    new $P458, 'ExceptionHandler'
    set_addr $P458, control_457
    $P458."handle_types"(58)
    push_eh $P458
    .lex "self", self
    .lex "$/", param_459
.annotate "line", 140
    new $P460, "Undef"
    .lex "$past", $P460
    find_lex $P461, "$/"
    unless_null $P461, vivify_212
    $P461 = root_new ['parrot';'Hash']
  vivify_212:
    set $P462, $P461["xblock"]
    unless_null $P462, vivify_213
    new $P462, "Undef"
  vivify_213:
    $P463 = $P462."ast"()
    $P464 = "xblock_immediate"($P463)
    store_lex "$past", $P464
.annotate "line", 141
    find_lex $P465, "$past"
    find_lex $P466, "$/"
    unless_null $P466, vivify_214
    $P466 = root_new ['parrot';'Hash']
  vivify_214:
    set $P467, $P466["sym"]
    unless_null $P467, vivify_215
    new $P467, "Undef"
  vivify_215:
    set $S468, $P467
    $P465."pasttype"($S468)
.annotate "line", 142
    find_lex $P469, "$/"
    find_lex $P470, "$past"
    $P471 = $P469."!make"($P470)
.annotate "line", 139
    .return ($P471)
  control_457:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P472, exception, "payload"
    .return ($P472)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<repeat>"  :subid("35_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_476
.annotate "line", 145
    new $P475, 'ExceptionHandler'
    set_addr $P475, control_474
    $P475."handle_types"(58)
    push_eh $P475
    .lex "self", self
    .lex "$/", param_476
.annotate "line", 146
    new $P477, "Undef"
    .lex "$pasttype", $P477
.annotate "line", 147
    new $P478, "Undef"
    .lex "$past", $P478
.annotate "line", 146
    new $P479, "String"
    assign $P479, "repeat_"
    find_lex $P480, "$/"
    unless_null $P480, vivify_216
    $P480 = root_new ['parrot';'Hash']
  vivify_216:
    set $P481, $P480["wu"]
    unless_null $P481, vivify_217
    new $P481, "Undef"
  vivify_217:
    set $S482, $P481
    concat $P483, $P479, $S482
    store_lex "$pasttype", $P483
    find_lex $P484, "$past"
.annotate "line", 148
    find_lex $P486, "$/"
    unless_null $P486, vivify_218
    $P486 = root_new ['parrot';'Hash']
  vivify_218:
    set $P487, $P486["xblock"]
    unless_null $P487, vivify_219
    new $P487, "Undef"
  vivify_219:
    if $P487, if_485
.annotate "line", 153
    get_hll_global $P494, ["PAST"], "Op"
    find_lex $P495, "$/"
    unless_null $P495, vivify_220
    $P495 = root_new ['parrot';'Hash']
  vivify_220:
    set $P496, $P495["EXPR"]
    unless_null $P496, vivify_221
    new $P496, "Undef"
  vivify_221:
    $P497 = $P496."ast"()
    find_lex $P498, "$/"
    unless_null $P498, vivify_222
    $P498 = root_new ['parrot';'Hash']
  vivify_222:
    set $P499, $P498["pblock"]
    unless_null $P499, vivify_223
    new $P499, "Undef"
  vivify_223:
    $P500 = $P499."ast"()
    $P501 = "block_immediate"($P500)
    find_lex $P502, "$pasttype"
    find_lex $P503, "$/"
    $P504 = $P494."new"($P497, $P501, $P502 :named("pasttype"), $P503 :named("node"))
    store_lex "$past", $P504
.annotate "line", 152
    goto if_485_end
  if_485:
.annotate "line", 149
    find_lex $P488, "$/"
    unless_null $P488, vivify_224
    $P488 = root_new ['parrot';'Hash']
  vivify_224:
    set $P489, $P488["xblock"]
    unless_null $P489, vivify_225
    new $P489, "Undef"
  vivify_225:
    $P490 = $P489."ast"()
    $P491 = "xblock_immediate"($P490)
    store_lex "$past", $P491
.annotate "line", 150
    find_lex $P492, "$past"
    find_lex $P493, "$pasttype"
    $P492."pasttype"($P493)
  if_485_end:
.annotate "line", 156
    find_lex $P505, "$/"
    find_lex $P506, "$past"
    $P507 = $P505."!make"($P506)
.annotate "line", 145
    .return ($P507)
  control_474:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P508, exception, "payload"
    .return ($P508)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<for>"  :subid("36_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_512
.annotate "line", 159
    new $P511, 'ExceptionHandler'
    set_addr $P511, control_510
    $P511."handle_types"(58)
    push_eh $P511
    .lex "self", self
    .lex "$/", param_512
.annotate "line", 160
    new $P513, "Undef"
    .lex "$past", $P513
.annotate "line", 162
    new $P514, "Undef"
    .lex "$block", $P514
.annotate "line", 160
    find_lex $P515, "$/"
    unless_null $P515, vivify_226
    $P515 = root_new ['parrot';'Hash']
  vivify_226:
    set $P516, $P515["xblock"]
    unless_null $P516, vivify_227
    new $P516, "Undef"
  vivify_227:
    $P517 = $P516."ast"()
    store_lex "$past", $P517
.annotate "line", 161
    find_lex $P518, "$past"
    $P518."pasttype"("for")
.annotate "line", 162
    find_lex $P519, "$past"
    unless_null $P519, vivify_228
    $P519 = root_new ['parrot';'ResizablePMCArray']
  vivify_228:
    set $P520, $P519[1]
    unless_null $P520, vivify_229
    new $P520, "Undef"
  vivify_229:
    store_lex "$block", $P520
.annotate "line", 163
    find_lex $P522, "$block"
    $P523 = $P522."arity"()
    if $P523, unless_521_end
.annotate "line", 164
    find_lex $P524, "$block"
    unless_null $P524, vivify_230
    $P524 = root_new ['parrot';'ResizablePMCArray']
  vivify_230:
    set $P525, $P524[0]
    unless_null $P525, vivify_231
    new $P525, "Undef"
  vivify_231:
    get_hll_global $P526, ["PAST"], "Var"
    $P527 = $P526."new"("$_" :named("name"), "parameter" :named("scope"))
    $P525."push"($P527)
.annotate "line", 165
    find_lex $P528, "$block"
    $P528."symbol"("$_", "lexical" :named("scope"))
.annotate "line", 166
    find_lex $P529, "$block"
    $P529."arity"(1)
  unless_521_end:
.annotate "line", 168
    find_lex $P530, "$block"
    $P530."blocktype"("immediate")
.annotate "line", 169
    find_lex $P531, "$/"
    find_lex $P532, "$past"
    $P533 = $P531."!make"($P532)
.annotate "line", 159
    .return ($P533)
  control_510:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P534, exception, "payload"
    .return ($P534)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<return>"  :subid("37_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_538
.annotate "line", 172
    new $P537, 'ExceptionHandler'
    set_addr $P537, control_536
    $P537."handle_types"(58)
    push_eh $P537
    .lex "self", self
    .lex "$/", param_538
.annotate "line", 173
    find_lex $P539, "$/"
    get_hll_global $P540, ["PAST"], "Op"
    find_lex $P541, "$/"
    unless_null $P541, vivify_232
    $P541 = root_new ['parrot';'Hash']
  vivify_232:
    set $P542, $P541["EXPR"]
    unless_null $P542, vivify_233
    new $P542, "Undef"
  vivify_233:
    $P543 = $P542."ast"()
    find_lex $P544, "$/"
    $P545 = $P540."new"($P543, "return" :named("pasttype"), $P544 :named("node"))
    $P546 = $P539."!make"($P545)
.annotate "line", 172
    .return ($P546)
  control_536:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P547, exception, "payload"
    .return ($P547)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<CATCH>"  :subid("38_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_551
.annotate "line", 176
    new $P550, 'ExceptionHandler'
    set_addr $P550, control_549
    $P550."handle_types"(58)
    push_eh $P550
    .lex "self", self
    .lex "$/", param_551
.annotate "line", 177
    new $P552, "Undef"
    .lex "$block", $P552
    find_lex $P553, "$/"
    unless_null $P553, vivify_234
    $P553 = root_new ['parrot';'Hash']
  vivify_234:
    set $P554, $P553["block"]
    unless_null $P554, vivify_235
    new $P554, "Undef"
  vivify_235:
    $P555 = $P554."ast"()
    store_lex "$block", $P555
.annotate "line", 178
    find_lex $P556, "$/"
    find_lex $P557, "$block"
    "push_block_handler"($P556, $P557)
.annotate "line", 179
    get_global $P558, "@BLOCK"
    unless_null $P558, vivify_236
    $P558 = root_new ['parrot';'ResizablePMCArray']
  vivify_236:
    set $P559, $P558[0]
    unless_null $P559, vivify_237
    new $P559, "Undef"
  vivify_237:
    $P560 = $P559."handlers"()
    set $P561, $P560[0]
    unless_null $P561, vivify_238
    new $P561, "Undef"
  vivify_238:
    $P561."handle_types_except"("CONTROL")
.annotate "line", 180
    find_lex $P562, "$/"
    get_hll_global $P563, ["PAST"], "Stmts"
    find_lex $P564, "$/"
    $P565 = $P563."new"($P564 :named("node"))
    $P566 = $P562."!make"($P565)
.annotate "line", 176
    .return ($P566)
  control_549:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P567, exception, "payload"
    .return ($P567)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<CONTROL>"  :subid("39_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_571
.annotate "line", 183
    new $P570, 'ExceptionHandler'
    set_addr $P570, control_569
    $P570."handle_types"(58)
    push_eh $P570
    .lex "self", self
    .lex "$/", param_571
.annotate "line", 184
    new $P572, "Undef"
    .lex "$block", $P572
    find_lex $P573, "$/"
    unless_null $P573, vivify_239
    $P573 = root_new ['parrot';'Hash']
  vivify_239:
    set $P574, $P573["block"]
    unless_null $P574, vivify_240
    new $P574, "Undef"
  vivify_240:
    $P575 = $P574."ast"()
    store_lex "$block", $P575
.annotate "line", 185
    find_lex $P576, "$/"
    find_lex $P577, "$block"
    "push_block_handler"($P576, $P577)
.annotate "line", 186
    get_global $P578, "@BLOCK"
    unless_null $P578, vivify_241
    $P578 = root_new ['parrot';'ResizablePMCArray']
  vivify_241:
    set $P579, $P578[0]
    unless_null $P579, vivify_242
    new $P579, "Undef"
  vivify_242:
    $P580 = $P579."handlers"()
    set $P581, $P580[0]
    unless_null $P581, vivify_243
    new $P581, "Undef"
  vivify_243:
    $P581."handle_types"("CONTROL")
.annotate "line", 187
    find_lex $P582, "$/"
    get_hll_global $P583, ["PAST"], "Stmts"
    find_lex $P584, "$/"
    $P585 = $P583."new"($P584 :named("node"))
    $P586 = $P582."!make"($P585)
.annotate "line", 183
    .return ($P586)
  control_569:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P587, exception, "payload"
    .return ($P587)
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<INIT>"  :subid("40_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_592
.annotate "line", 227
    new $P591, 'ExceptionHandler'
    set_addr $P591, control_590
    $P591."handle_types"(58)
    push_eh $P591
    .lex "self", self
    .lex "$/", param_592
.annotate "line", 228
    get_global $P593, "@BLOCK"
    unless_null $P593, vivify_244
    $P593 = root_new ['parrot';'ResizablePMCArray']
  vivify_244:
    set $P594, $P593[0]
    unless_null $P594, vivify_245
    new $P594, "Undef"
  vivify_245:
    $P595 = $P594."loadinit"()
    find_lex $P596, "$/"
    unless_null $P596, vivify_246
    $P596 = root_new ['parrot';'Hash']
  vivify_246:
    set $P597, $P596["blorst"]
    unless_null $P597, vivify_247
    new $P597, "Undef"
  vivify_247:
    $P598 = $P597."ast"()
    $P595."push"($P598)
.annotate "line", 229
    find_lex $P599, "$/"
    get_hll_global $P600, ["PAST"], "Stmts"
    find_lex $P601, "$/"
    $P602 = $P600."new"($P601 :named("node"))
    $P603 = $P599."!make"($P602)
.annotate "line", 227
    .return ($P603)
  control_590:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P604, exception, "payload"
    .return ($P604)
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<try>"  :subid("41_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_608
.annotate "line", 232
    new $P607, 'ExceptionHandler'
    set_addr $P607, control_606
    $P607."handle_types"(58)
    push_eh $P607
    .lex "self", self
    .lex "$/", param_608
.annotate "line", 233
    new $P609, "Undef"
    .lex "$past", $P609
    find_lex $P610, "$/"
    unless_null $P610, vivify_248
    $P610 = root_new ['parrot';'Hash']
  vivify_248:
    set $P611, $P610["blorst"]
    unless_null $P611, vivify_249
    new $P611, "Undef"
  vivify_249:
    $P612 = $P611."ast"()
    store_lex "$past", $P612
.annotate "line", 234
    find_lex $P614, "$past"
    $S615 = $P614."WHAT"()
    isne $I616, $S615, "PAST::Block()"
    unless $I616, if_613_end
.annotate "line", 235
    get_hll_global $P617, ["PAST"], "Block"
    find_lex $P618, "$past"
    find_lex $P619, "$/"
    $P620 = $P617."new"($P618, "immediate" :named("blocktype"), $P619 :named("node"))
    store_lex "$past", $P620
  if_613_end:
.annotate "line", 237
    find_lex $P622, "$past"
    $P623 = $P622."handlers"()
    if $P623, unless_621_end
.annotate "line", 238
    find_lex $P624, "$past"
    get_hll_global $P625, ["PAST"], "Control"
.annotate "line", 240
    get_hll_global $P626, ["PAST"], "Stmts"
.annotate "line", 241
    get_hll_global $P627, ["PAST"], "Op"
.annotate "line", 242
    get_hll_global $P628, ["PAST"], "Var"
.annotate "line", 243
    get_hll_global $P629, ["PAST"], "Var"
    $P630 = $P629."new"("register" :named("scope"), "exception" :named("name"))
    $P631 = $P628."new"($P630, "handled", "keyed" :named("scope"))
.annotate "line", 242
    $P632 = $P627."new"($P631, 1, "bind" :named("pasttype"))
.annotate "line", 241
    $P633 = $P626."new"($P632)
.annotate "line", 240
    $P634 = $P625."new"($P633, "CONTROL" :named("handle_types_except"))
.annotate "line", 238
    new $P635, "ResizablePMCArray"
    push $P635, $P634
    $P624."handlers"($P635)
  unless_621_end:
.annotate "line", 252
    find_lex $P636, "$/"
    find_lex $P637, "$past"
    $P638 = $P636."!make"($P637)
.annotate "line", 232
    .return ($P638)
  control_606:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P639, exception, "payload"
    .return ($P639)
.end


.namespace ["NQP";"Actions"]
.sub "blorst"  :subid("42_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_643
.annotate "line", 255
    new $P642, 'ExceptionHandler'
    set_addr $P642, control_641
    $P642."handle_types"(58)
    push_eh $P642
    .lex "self", self
    .lex "$/", param_643
.annotate "line", 256
    find_lex $P644, "$/"
.annotate "line", 257
    find_lex $P647, "$/"
    unless_null $P647, vivify_250
    $P647 = root_new ['parrot';'Hash']
  vivify_250:
    set $P648, $P647["block"]
    unless_null $P648, vivify_251
    new $P648, "Undef"
  vivify_251:
    if $P648, if_646
.annotate "line", 258
    find_lex $P653, "$/"
    unless_null $P653, vivify_252
    $P653 = root_new ['parrot';'Hash']
  vivify_252:
    set $P654, $P653["statement"]
    unless_null $P654, vivify_253
    new $P654, "Undef"
  vivify_253:
    $P655 = $P654."ast"()
    set $P645, $P655
.annotate "line", 257
    goto if_646_end
  if_646:
    find_lex $P649, "$/"
    unless_null $P649, vivify_254
    $P649 = root_new ['parrot';'Hash']
  vivify_254:
    set $P650, $P649["block"]
    unless_null $P650, vivify_255
    new $P650, "Undef"
  vivify_255:
    $P651 = $P650."ast"()
    $P652 = "block_immediate"($P651)
    set $P645, $P652
  if_646_end:
    $P656 = $P644."!make"($P645)
.annotate "line", 255
    .return ($P656)
  control_641:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P657, exception, "payload"
    .return ($P657)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<if>"  :subid("43_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_661
.annotate "line", 263
    new $P660, 'ExceptionHandler'
    set_addr $P660, control_659
    $P660."handle_types"(58)
    push_eh $P660
    .lex "self", self
    .lex "$/", param_661
    find_lex $P662, "$/"
    find_lex $P663, "$/"
    unless_null $P663, vivify_256
    $P663 = root_new ['parrot';'Hash']
  vivify_256:
    set $P664, $P663["cond"]
    unless_null $P664, vivify_257
    new $P664, "Undef"
  vivify_257:
    $P665 = $P664."ast"()
    $P666 = $P662."!make"($P665)
    .return ($P666)
  control_659:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P667, exception, "payload"
    .return ($P667)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<unless>"  :subid("44_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_671
.annotate "line", 264
    new $P670, 'ExceptionHandler'
    set_addr $P670, control_669
    $P670."handle_types"(58)
    push_eh $P670
    .lex "self", self
    .lex "$/", param_671
    find_lex $P672, "$/"
    find_lex $P673, "$/"
    unless_null $P673, vivify_258
    $P673 = root_new ['parrot';'Hash']
  vivify_258:
    set $P674, $P673["cond"]
    unless_null $P674, vivify_259
    new $P674, "Undef"
  vivify_259:
    $P675 = $P674."ast"()
    $P676 = $P672."!make"($P675)
    .return ($P676)
  control_669:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P677, exception, "payload"
    .return ($P677)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<while>"  :subid("45_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_681
.annotate "line", 266
    new $P680, 'ExceptionHandler'
    set_addr $P680, control_679
    $P680."handle_types"(58)
    push_eh $P680
    .lex "self", self
    .lex "$/", param_681
    find_lex $P682, "$/"
    find_lex $P683, "$/"
    unless_null $P683, vivify_260
    $P683 = root_new ['parrot';'Hash']
  vivify_260:
    set $P684, $P683["cond"]
    unless_null $P684, vivify_261
    new $P684, "Undef"
  vivify_261:
    $P685 = $P684."ast"()
    $P686 = $P682."!make"($P685)
    .return ($P686)
  control_679:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P687, exception, "payload"
    .return ($P687)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<until>"  :subid("46_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_691
.annotate "line", 267
    new $P690, 'ExceptionHandler'
    set_addr $P690, control_689
    $P690."handle_types"(58)
    push_eh $P690
    .lex "self", self
    .lex "$/", param_691
    find_lex $P692, "$/"
    find_lex $P693, "$/"
    unless_null $P693, vivify_262
    $P693 = root_new ['parrot';'Hash']
  vivify_262:
    set $P694, $P693["cond"]
    unless_null $P694, vivify_263
    new $P694, "Undef"
  vivify_263:
    $P695 = $P694."ast"()
    $P696 = $P692."!make"($P695)
    .return ($P696)
  control_689:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P697, exception, "payload"
    .return ($P697)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<fatarrow>"  :subid("47_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_701
.annotate "line", 271
    new $P700, 'ExceptionHandler'
    set_addr $P700, control_699
    $P700."handle_types"(58)
    push_eh $P700
    .lex "self", self
    .lex "$/", param_701
    find_lex $P702, "$/"
    find_lex $P703, "$/"
    unless_null $P703, vivify_264
    $P703 = root_new ['parrot';'Hash']
  vivify_264:
    set $P704, $P703["fatarrow"]
    unless_null $P704, vivify_265
    new $P704, "Undef"
  vivify_265:
    $P705 = $P704."ast"()
    $P706 = $P702."!make"($P705)
    .return ($P706)
  control_699:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P707, exception, "payload"
    .return ($P707)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<colonpair>"  :subid("48_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_711
.annotate "line", 272
    new $P710, 'ExceptionHandler'
    set_addr $P710, control_709
    $P710."handle_types"(58)
    push_eh $P710
    .lex "self", self
    .lex "$/", param_711
    find_lex $P712, "$/"
    find_lex $P713, "$/"
    unless_null $P713, vivify_266
    $P713 = root_new ['parrot';'Hash']
  vivify_266:
    set $P714, $P713["colonpair"]
    unless_null $P714, vivify_267
    new $P714, "Undef"
  vivify_267:
    $P715 = $P714."ast"()
    $P716 = $P712."!make"($P715)
    .return ($P716)
  control_709:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P717, exception, "payload"
    .return ($P717)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<variable>"  :subid("49_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_721
.annotate "line", 273
    new $P720, 'ExceptionHandler'
    set_addr $P720, control_719
    $P720."handle_types"(58)
    push_eh $P720
    .lex "self", self
    .lex "$/", param_721
    find_lex $P722, "$/"
    find_lex $P723, "$/"
    unless_null $P723, vivify_268
    $P723 = root_new ['parrot';'Hash']
  vivify_268:
    set $P724, $P723["variable"]
    unless_null $P724, vivify_269
    new $P724, "Undef"
  vivify_269:
    $P725 = $P724."ast"()
    $P726 = $P722."!make"($P725)
    .return ($P726)
  control_719:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P727, exception, "payload"
    .return ($P727)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<package_declarator>"  :subid("50_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_731
.annotate "line", 274
    new $P730, 'ExceptionHandler'
    set_addr $P730, control_729
    $P730."handle_types"(58)
    push_eh $P730
    .lex "self", self
    .lex "$/", param_731
    find_lex $P732, "$/"
    find_lex $P733, "$/"
    unless_null $P733, vivify_270
    $P733 = root_new ['parrot';'Hash']
  vivify_270:
    set $P734, $P733["package_declarator"]
    unless_null $P734, vivify_271
    new $P734, "Undef"
  vivify_271:
    $P735 = $P734."ast"()
    $P736 = $P732."!make"($P735)
    .return ($P736)
  control_729:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P737, exception, "payload"
    .return ($P737)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<scope_declarator>"  :subid("51_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_741
.annotate "line", 275
    new $P740, 'ExceptionHandler'
    set_addr $P740, control_739
    $P740."handle_types"(58)
    push_eh $P740
    .lex "self", self
    .lex "$/", param_741
    find_lex $P742, "$/"
    find_lex $P743, "$/"
    unless_null $P743, vivify_272
    $P743 = root_new ['parrot';'Hash']
  vivify_272:
    set $P744, $P743["scope_declarator"]
    unless_null $P744, vivify_273
    new $P744, "Undef"
  vivify_273:
    $P745 = $P744."ast"()
    $P746 = $P742."!make"($P745)
    .return ($P746)
  control_739:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P747, exception, "payload"
    .return ($P747)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<routine_declarator>"  :subid("52_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_751
.annotate "line", 276
    new $P750, 'ExceptionHandler'
    set_addr $P750, control_749
    $P750."handle_types"(58)
    push_eh $P750
    .lex "self", self
    .lex "$/", param_751
    find_lex $P752, "$/"
    find_lex $P753, "$/"
    unless_null $P753, vivify_274
    $P753 = root_new ['parrot';'Hash']
  vivify_274:
    set $P754, $P753["routine_declarator"]
    unless_null $P754, vivify_275
    new $P754, "Undef"
  vivify_275:
    $P755 = $P754."ast"()
    $P756 = $P752."!make"($P755)
    .return ($P756)
  control_749:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P757, exception, "payload"
    .return ($P757)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<regex_declarator>"  :subid("53_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_761
.annotate "line", 277
    new $P760, 'ExceptionHandler'
    set_addr $P760, control_759
    $P760."handle_types"(58)
    push_eh $P760
    .lex "self", self
    .lex "$/", param_761
    find_lex $P762, "$/"
    find_lex $P763, "$/"
    unless_null $P763, vivify_276
    $P763 = root_new ['parrot';'Hash']
  vivify_276:
    set $P764, $P763["regex_declarator"]
    unless_null $P764, vivify_277
    new $P764, "Undef"
  vivify_277:
    $P765 = $P764."ast"()
    $P766 = $P762."!make"($P765)
    .return ($P766)
  control_759:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P767, exception, "payload"
    .return ($P767)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<statement_prefix>"  :subid("54_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_771
.annotate "line", 278
    new $P770, 'ExceptionHandler'
    set_addr $P770, control_769
    $P770."handle_types"(58)
    push_eh $P770
    .lex "self", self
    .lex "$/", param_771
    find_lex $P772, "$/"
    find_lex $P773, "$/"
    unless_null $P773, vivify_278
    $P773 = root_new ['parrot';'Hash']
  vivify_278:
    set $P774, $P773["statement_prefix"]
    unless_null $P774, vivify_279
    new $P774, "Undef"
  vivify_279:
    $P775 = $P774."ast"()
    $P776 = $P772."!make"($P775)
    .return ($P776)
  control_769:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P777, exception, "payload"
    .return ($P777)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<lambda>"  :subid("55_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_781
.annotate "line", 279
    new $P780, 'ExceptionHandler'
    set_addr $P780, control_779
    $P780."handle_types"(58)
    push_eh $P780
    .lex "self", self
    .lex "$/", param_781
    find_lex $P782, "$/"
    find_lex $P783, "$/"
    unless_null $P783, vivify_280
    $P783 = root_new ['parrot';'Hash']
  vivify_280:
    set $P784, $P783["pblock"]
    unless_null $P784, vivify_281
    new $P784, "Undef"
  vivify_281:
    $P785 = $P784."ast"()
    $P786 = $P782."!make"($P785)
    .return ($P786)
  control_779:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P787, exception, "payload"
    .return ($P787)
.end


.namespace ["NQP";"Actions"]
.sub "fatarrow"  :subid("56_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_791
.annotate "line", 281
    new $P790, 'ExceptionHandler'
    set_addr $P790, control_789
    $P790."handle_types"(58)
    push_eh $P790
    .lex "self", self
    .lex "$/", param_791
.annotate "line", 282
    new $P792, "Undef"
    .lex "$past", $P792
    find_lex $P793, "$/"
    unless_null $P793, vivify_282
    $P793 = root_new ['parrot';'Hash']
  vivify_282:
    set $P794, $P793["val"]
    unless_null $P794, vivify_283
    new $P794, "Undef"
  vivify_283:
    $P795 = $P794."ast"()
    store_lex "$past", $P795
.annotate "line", 283
    find_lex $P796, "$past"
    find_lex $P797, "$/"
    unless_null $P797, vivify_284
    $P797 = root_new ['parrot';'Hash']
  vivify_284:
    set $P798, $P797["key"]
    unless_null $P798, vivify_285
    new $P798, "Undef"
  vivify_285:
    $P799 = $P798."Str"()
    $P796."named"($P799)
.annotate "line", 284
    find_lex $P800, "$/"
    find_lex $P801, "$past"
    $P802 = $P800."!make"($P801)
.annotate "line", 281
    .return ($P802)
  control_789:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P803, exception, "payload"
    .return ($P803)
.end


.namespace ["NQP";"Actions"]
.sub "colonpair"  :subid("57_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_807
.annotate "line", 287
    new $P806, 'ExceptionHandler'
    set_addr $P806, control_805
    $P806."handle_types"(58)
    push_eh $P806
    .lex "self", self
    .lex "$/", param_807
.annotate "line", 288
    new $P808, "Undef"
    .lex "$past", $P808
.annotate "line", 289
    find_lex $P811, "$/"
    unless_null $P811, vivify_286
    $P811 = root_new ['parrot';'Hash']
  vivify_286:
    set $P812, $P811["circumfix"]
    unless_null $P812, vivify_287
    new $P812, "Undef"
  vivify_287:
    if $P812, if_810
.annotate "line", 290
    get_hll_global $P817, ["PAST"], "Val"
    find_lex $P818, "$/"
    unless_null $P818, vivify_288
    $P818 = root_new ['parrot';'Hash']
  vivify_288:
    set $P819, $P818["not"]
    unless_null $P819, vivify_289
    new $P819, "Undef"
  vivify_289:
    isfalse $I820, $P819
    $P821 = $P817."new"($I820 :named("value"))
    set $P809, $P821
.annotate "line", 289
    goto if_810_end
  if_810:
    find_lex $P813, "$/"
    unless_null $P813, vivify_290
    $P813 = root_new ['parrot';'Hash']
  vivify_290:
    set $P814, $P813["circumfix"]
    unless_null $P814, vivify_291
    $P814 = root_new ['parrot';'ResizablePMCArray']
  vivify_291:
    set $P815, $P814[0]
    unless_null $P815, vivify_292
    new $P815, "Undef"
  vivify_292:
    $P816 = $P815."ast"()
    set $P809, $P816
  if_810_end:
    store_lex "$past", $P809
.annotate "line", 291
    find_lex $P822, "$past"
    find_lex $P823, "$/"
    unless_null $P823, vivify_293
    $P823 = root_new ['parrot';'Hash']
  vivify_293:
    set $P824, $P823["identifier"]
    unless_null $P824, vivify_294
    new $P824, "Undef"
  vivify_294:
    set $S825, $P824
    $P822."named"($S825)
.annotate "line", 292
    find_lex $P826, "$/"
    find_lex $P827, "$past"
    $P828 = $P826."!make"($P827)
.annotate "line", 287
    .return ($P828)
  control_805:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P829, exception, "payload"
    .return ($P829)
.end


.namespace ["NQP";"Actions"]
.sub "variable"  :subid("58_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_833
.annotate "line", 295
    .const 'Sub' $P846 = "59_1271336409.53729" 
    capture_lex $P846
    new $P832, 'ExceptionHandler'
    set_addr $P832, control_831
    $P832."handle_types"(58)
    push_eh $P832
    .lex "self", self
    .lex "$/", param_833
.annotate "line", 296
    new $P834, "Undef"
    .lex "$past", $P834
.annotate "line", 295
    find_lex $P835, "$past"
.annotate "line", 297
    find_lex $P837, "$/"
    unless_null $P837, vivify_295
    $P837 = root_new ['parrot';'Hash']
  vivify_295:
    set $P838, $P837["postcircumfix"]
    unless_null $P838, vivify_296
    new $P838, "Undef"
  vivify_296:
    if $P838, if_836
.annotate "line", 301
    .const 'Sub' $P846 = "59_1271336409.53729" 
    capture_lex $P846
    $P846()
    goto if_836_end
  if_836:
.annotate "line", 298
    find_lex $P839, "$/"
    unless_null $P839, vivify_313
    $P839 = root_new ['parrot';'Hash']
  vivify_313:
    set $P840, $P839["postcircumfix"]
    unless_null $P840, vivify_314
    new $P840, "Undef"
  vivify_314:
    $P841 = $P840."ast"()
    store_lex "$past", $P841
.annotate "line", 299
    find_lex $P842, "$past"
    get_hll_global $P843, ["PAST"], "Var"
    $P844 = $P843."new"("$/" :named("name"))
    $P842."unshift"($P844)
  if_836_end:
.annotate "line", 330
    find_lex $P915, "$/"
    find_lex $P916, "$past"
    $P917 = $P915."!make"($P916)
.annotate "line", 295
    .return ($P917)
  control_831:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P918, exception, "payload"
    .return ($P918)
.end


.namespace ["NQP";"Actions"]
.sub "_block845"  :anon :subid("59_1271336409.53729") :outer("58_1271336409.53729")
.annotate "line", 302
    $P847 = root_new ['parrot';'ResizablePMCArray']
    .lex "@name", $P847
    get_hll_global $P848, ["NQP"], "Compiler"
    find_lex $P849, "$/"
    set $S850, $P849
    $P851 = $P848."parse_name"($S850)
    store_lex "@name", $P851
.annotate "line", 303
    get_hll_global $P852, ["PAST"], "Var"
    find_lex $P853, "@name"
    $P854 = $P853."pop"()
    set $S855, $P854
    $P856 = $P852."new"($S855 :named("name"))
    store_lex "$past", $P856
.annotate "line", 304
    find_lex $P858, "@name"
    unless $P858, if_857_end
.annotate "line", 305
    find_lex $P860, "@name"
    unless_null $P860, vivify_297
    $P860 = root_new ['parrot';'ResizablePMCArray']
  vivify_297:
    set $P861, $P860[0]
    unless_null $P861, vivify_298
    new $P861, "Undef"
  vivify_298:
    set $S862, $P861
    iseq $I863, $S862, "GLOBAL"
    unless $I863, if_859_end
    find_lex $P864, "@name"
    $P864."shift"()
  if_859_end:
.annotate "line", 306
    find_lex $P865, "$past"
    find_lex $P866, "@name"
    $P865."namespace"($P866)
.annotate "line", 307
    find_lex $P867, "$past"
    $P867."scope"("package")
.annotate "line", 308
    find_lex $P868, "$past"
    find_lex $P869, "$/"
    unless_null $P869, vivify_299
    $P869 = root_new ['parrot';'Hash']
  vivify_299:
    set $P870, $P869["sigil"]
    unless_null $P870, vivify_300
    new $P870, "Undef"
  vivify_300:
    $P871 = "vivitype"($P870)
    $P868."viviself"($P871)
.annotate "line", 309
    find_lex $P872, "$past"
    $P872."lvalue"(1)
  if_857_end:
.annotate "line", 311
    find_lex $P875, "$/"
    unless_null $P875, vivify_301
    $P875 = root_new ['parrot';'Hash']
  vivify_301:
    set $P876, $P875["twigil"]
    unless_null $P876, vivify_302
    $P876 = root_new ['parrot';'ResizablePMCArray']
  vivify_302:
    set $P877, $P876[0]
    unless_null $P877, vivify_303
    new $P877, "Undef"
  vivify_303:
    set $S878, $P877
    iseq $I879, $S878, "*"
    if $I879, if_874
.annotate "line", 324
    find_lex $P901, "$/"
    unless_null $P901, vivify_304
    $P901 = root_new ['parrot';'Hash']
  vivify_304:
    set $P902, $P901["twigil"]
    unless_null $P902, vivify_305
    $P902 = root_new ['parrot';'ResizablePMCArray']
  vivify_305:
    set $P903, $P902[0]
    unless_null $P903, vivify_306
    new $P903, "Undef"
  vivify_306:
    set $S904, $P903
    iseq $I905, $S904, "!"
    if $I905, if_900
    new $P899, 'Integer'
    set $P899, $I905
    goto if_900_end
  if_900:
.annotate "line", 325
    find_lex $P906, "$past"
    get_hll_global $P907, ["PAST"], "Var"
    $P908 = $P907."new"("self" :named("name"))
    $P906."push"($P908)
.annotate "line", 326
    find_lex $P909, "$past"
    $P909."scope"("attribute")
.annotate "line", 327
    find_lex $P910, "$past"
    find_lex $P911, "$/"
    unless_null $P911, vivify_307
    $P911 = root_new ['parrot';'Hash']
  vivify_307:
    set $P912, $P911["sigil"]
    unless_null $P912, vivify_308
    new $P912, "Undef"
  vivify_308:
    $P913 = "vivitype"($P912)
    $P914 = $P910."viviself"($P913)
.annotate "line", 324
    set $P899, $P914
  if_900_end:
    set $P873, $P899
.annotate "line", 311
    goto if_874_end
  if_874:
.annotate "line", 312
    find_lex $P880, "$past"
    $P880."scope"("contextual")
.annotate "line", 313
    find_lex $P881, "$past"
.annotate "line", 314
    get_hll_global $P882, ["PAST"], "Var"
.annotate "line", 316
    find_lex $P883, "$/"
    unless_null $P883, vivify_309
    $P883 = root_new ['parrot';'Hash']
  vivify_309:
    set $P884, $P883["sigil"]
    unless_null $P884, vivify_310
    new $P884, "Undef"
  vivify_310:
    set $S885, $P884
    new $P886, 'String'
    set $P886, $S885
    find_lex $P887, "$/"
    unless_null $P887, vivify_311
    $P887 = root_new ['parrot';'Hash']
  vivify_311:
    set $P888, $P887["desigilname"]
    unless_null $P888, vivify_312
    new $P888, "Undef"
  vivify_312:
    concat $P889, $P886, $P888
.annotate "line", 318
    get_hll_global $P890, ["PAST"], "Op"
    new $P891, "String"
    assign $P891, "Contextual "
    find_lex $P892, "$/"
    set $S893, $P892
    concat $P894, $P891, $S893
    concat $P895, $P894, " not found"
    $P896 = $P890."new"($P895, "die" :named("pirop"))
    $P897 = $P882."new"("package" :named("scope"), "" :named("namespace"), $P889 :named("name"), $P896 :named("viviself"))
.annotate "line", 314
    $P898 = $P881."viviself"($P897)
.annotate "line", 311
    set $P873, $P898
  if_874_end:
.annotate "line", 301
    .return ($P873)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<module>"  :subid("60_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_922
.annotate "line", 333
    new $P921, 'ExceptionHandler'
    set_addr $P921, control_920
    $P921."handle_types"(58)
    push_eh $P921
    .lex "self", self
    .lex "$/", param_922
    find_lex $P923, "$/"
    find_lex $P924, "$/"
    unless_null $P924, vivify_315
    $P924 = root_new ['parrot';'Hash']
  vivify_315:
    set $P925, $P924["package_def"]
    unless_null $P925, vivify_316
    new $P925, "Undef"
  vivify_316:
    $P926 = $P925."ast"()
    $P927 = $P923."!make"($P926)
    .return ($P927)
  control_920:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P928, exception, "payload"
    .return ($P928)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<class>"  :subid("61_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_932
.annotate "line", 334
    new $P931, 'ExceptionHandler'
    set_addr $P931, control_930
    $P931."handle_types"(58)
    push_eh $P931
    .lex "self", self
    .lex "$/", param_932
.annotate "line", 335
    new $P933, "Undef"
    .lex "$past", $P933
.annotate "line", 336
    new $P934, "Undef"
    .lex "$classinit", $P934
.annotate "line", 345
    new $P935, "Undef"
    .lex "$parent", $P935
.annotate "line", 335
    find_lex $P936, "$/"
    unless_null $P936, vivify_317
    $P936 = root_new ['parrot';'Hash']
  vivify_317:
    set $P937, $P936["package_def"]
    unless_null $P937, vivify_318
    new $P937, "Undef"
  vivify_318:
    $P938 = $P937."ast"()
    store_lex "$past", $P938
.annotate "line", 337
    get_hll_global $P939, ["PAST"], "Op"
.annotate "line", 338
    get_hll_global $P940, ["PAST"], "Op"
    $P941 = $P940."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate "line", 341
    find_lex $P942, "$/"
    unless_null $P942, vivify_319
    $P942 = root_new ['parrot';'Hash']
  vivify_319:
    set $P943, $P942["package_def"]
    unless_null $P943, vivify_320
    $P943 = root_new ['parrot';'Hash']
  vivify_320:
    set $P944, $P943["name"]
    unless_null $P944, vivify_321
    new $P944, "Undef"
  vivify_321:
    set $S945, $P944
    $P946 = $P939."new"($P941, $S945, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 337
    store_lex "$classinit", $P946
.annotate "line", 345
    find_lex $P949, "$/"
    unless_null $P949, vivify_322
    $P949 = root_new ['parrot';'Hash']
  vivify_322:
    set $P950, $P949["package_def"]
    unless_null $P950, vivify_323
    $P950 = root_new ['parrot';'Hash']
  vivify_323:
    set $P951, $P950["parent"]
    unless_null $P951, vivify_324
    $P951 = root_new ['parrot';'ResizablePMCArray']
  vivify_324:
    set $P952, $P951[0]
    unless_null $P952, vivify_325
    new $P952, "Undef"
  vivify_325:
    set $S953, $P952
    unless $S953, unless_948
    new $P947, 'String'
    set $P947, $S953
    goto unless_948_end
  unless_948:
.annotate "line", 346
    find_lex $P956, "$/"
    unless_null $P956, vivify_326
    $P956 = root_new ['parrot';'Hash']
  vivify_326:
    set $P957, $P956["sym"]
    unless_null $P957, vivify_327
    new $P957, "Undef"
  vivify_327:
    set $S958, $P957
    iseq $I959, $S958, "grammar"
    if $I959, if_955
    new $P961, "String"
    assign $P961, ""
    set $P954, $P961
    goto if_955_end
  if_955:
    new $P960, "String"
    assign $P960, "Regex::Cursor"
    set $P954, $P960
  if_955_end:
    set $P947, $P954
  unless_948_end:
    store_lex "$parent", $P947
.annotate "line", 347
    find_lex $P963, "$parent"
    unless $P963, if_962_end
.annotate "line", 348
    find_lex $P964, "$classinit"
    get_hll_global $P965, ["PAST"], "Val"
    find_lex $P966, "$parent"
    $P967 = $P965."new"($P966 :named("value"), "parent" :named("named"))
    $P964."push"($P967)
  if_962_end:
.annotate "line", 350
    find_lex $P969, "$past"
    unless_null $P969, vivify_328
    $P969 = root_new ['parrot';'Hash']
  vivify_328:
    set $P970, $P969["attributes"]
    unless_null $P970, vivify_329
    new $P970, "Undef"
  vivify_329:
    unless $P970, if_968_end
.annotate "line", 351
    find_lex $P971, "$classinit"
    find_lex $P972, "$past"
    unless_null $P972, vivify_330
    $P972 = root_new ['parrot';'Hash']
  vivify_330:
    set $P973, $P972["attributes"]
    unless_null $P973, vivify_331
    new $P973, "Undef"
  vivify_331:
    $P971."push"($P973)
  if_968_end:
.annotate "line", 353
    get_global $P974, "@BLOCK"
    unless_null $P974, vivify_332
    $P974 = root_new ['parrot';'ResizablePMCArray']
  vivify_332:
    set $P975, $P974[0]
    unless_null $P975, vivify_333
    new $P975, "Undef"
  vivify_333:
    $P976 = $P975."loadinit"()
    find_lex $P977, "$classinit"
    $P976."push"($P977)
.annotate "line", 354
    find_lex $P978, "$/"
    find_lex $P979, "$past"
    $P980 = $P978."!make"($P979)
.annotate "line", 334
    .return ($P980)
  control_930:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P981, exception, "payload"
    .return ($P981)
.end


.namespace ["NQP";"Actions"]
.sub "package_def"  :subid("62_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_985
.annotate "line", 357
    new $P984, 'ExceptionHandler'
    set_addr $P984, control_983
    $P984."handle_types"(58)
    push_eh $P984
    .lex "self", self
    .lex "$/", param_985
.annotate "line", 358
    new $P986, "Undef"
    .lex "$past", $P986
    find_lex $P989, "$/"
    unless_null $P989, vivify_334
    $P989 = root_new ['parrot';'Hash']
  vivify_334:
    set $P990, $P989["block"]
    unless_null $P990, vivify_335
    new $P990, "Undef"
  vivify_335:
    if $P990, if_988
    find_lex $P994, "$/"
    unless_null $P994, vivify_336
    $P994 = root_new ['parrot';'Hash']
  vivify_336:
    set $P995, $P994["comp_unit"]
    unless_null $P995, vivify_337
    new $P995, "Undef"
  vivify_337:
    $P996 = $P995."ast"()
    set $P987, $P996
    goto if_988_end
  if_988:
    find_lex $P991, "$/"
    unless_null $P991, vivify_338
    $P991 = root_new ['parrot';'Hash']
  vivify_338:
    set $P992, $P991["block"]
    unless_null $P992, vivify_339
    new $P992, "Undef"
  vivify_339:
    $P993 = $P992."ast"()
    set $P987, $P993
  if_988_end:
    store_lex "$past", $P987
.annotate "line", 359
    find_lex $P997, "$past"
    find_lex $P998, "$/"
    unless_null $P998, vivify_340
    $P998 = root_new ['parrot';'Hash']
  vivify_340:
    set $P999, $P998["name"]
    unless_null $P999, vivify_341
    $P999 = root_new ['parrot';'Hash']
  vivify_341:
    set $P1000, $P999["identifier"]
    unless_null $P1000, vivify_342
    new $P1000, "Undef"
  vivify_342:
    $P997."namespace"($P1000)
.annotate "line", 360
    find_lex $P1001, "$past"
    $P1001."blocktype"("immediate")
.annotate "line", 361
    find_lex $P1002, "$/"
    find_lex $P1003, "$past"
    $P1004 = $P1002."!make"($P1003)
.annotate "line", 357
    .return ($P1004)
  control_983:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1005, exception, "payload"
    .return ($P1005)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<my>"  :subid("63_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1009
.annotate "line", 364
    new $P1008, 'ExceptionHandler'
    set_addr $P1008, control_1007
    $P1008."handle_types"(58)
    push_eh $P1008
    .lex "self", self
    .lex "$/", param_1009
    find_lex $P1010, "$/"
    find_lex $P1011, "$/"
    unless_null $P1011, vivify_343
    $P1011 = root_new ['parrot';'Hash']
  vivify_343:
    set $P1012, $P1011["scoped"]
    unless_null $P1012, vivify_344
    new $P1012, "Undef"
  vivify_344:
    $P1013 = $P1012."ast"()
    $P1014 = $P1010."!make"($P1013)
    .return ($P1014)
  control_1007:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1015, exception, "payload"
    .return ($P1015)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<our>"  :subid("64_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1019
.annotate "line", 365
    new $P1018, 'ExceptionHandler'
    set_addr $P1018, control_1017
    $P1018."handle_types"(58)
    push_eh $P1018
    .lex "self", self
    .lex "$/", param_1019
    find_lex $P1020, "$/"
    find_lex $P1021, "$/"
    unless_null $P1021, vivify_345
    $P1021 = root_new ['parrot';'Hash']
  vivify_345:
    set $P1022, $P1021["scoped"]
    unless_null $P1022, vivify_346
    new $P1022, "Undef"
  vivify_346:
    $P1023 = $P1022."ast"()
    $P1024 = $P1020."!make"($P1023)
    .return ($P1024)
  control_1017:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1025, exception, "payload"
    .return ($P1025)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<has>"  :subid("65_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1029
.annotate "line", 366
    new $P1028, 'ExceptionHandler'
    set_addr $P1028, control_1027
    $P1028."handle_types"(58)
    push_eh $P1028
    .lex "self", self
    .lex "$/", param_1029
    find_lex $P1030, "$/"
    find_lex $P1031, "$/"
    unless_null $P1031, vivify_347
    $P1031 = root_new ['parrot';'Hash']
  vivify_347:
    set $P1032, $P1031["scoped"]
    unless_null $P1032, vivify_348
    new $P1032, "Undef"
  vivify_348:
    $P1033 = $P1032."ast"()
    $P1034 = $P1030."!make"($P1033)
    .return ($P1034)
  control_1027:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1035, exception, "payload"
    .return ($P1035)
.end


.namespace ["NQP";"Actions"]
.sub "scoped"  :subid("66_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1039
.annotate "line", 368
    new $P1038, 'ExceptionHandler'
    set_addr $P1038, control_1037
    $P1038."handle_types"(58)
    push_eh $P1038
    .lex "self", self
    .lex "$/", param_1039
.annotate "line", 369
    find_lex $P1040, "$/"
.annotate "line", 370
    find_lex $P1043, "$/"
    unless_null $P1043, vivify_349
    $P1043 = root_new ['parrot';'Hash']
  vivify_349:
    set $P1044, $P1043["routine_declarator"]
    unless_null $P1044, vivify_350
    new $P1044, "Undef"
  vivify_350:
    if $P1044, if_1042
.annotate "line", 371
    find_lex $P1048, "$/"
    unless_null $P1048, vivify_351
    $P1048 = root_new ['parrot';'Hash']
  vivify_351:
    set $P1049, $P1048["variable_declarator"]
    unless_null $P1049, vivify_352
    new $P1049, "Undef"
  vivify_352:
    $P1050 = $P1049."ast"()
    set $P1041, $P1050
.annotate "line", 370
    goto if_1042_end
  if_1042:
    find_lex $P1045, "$/"
    unless_null $P1045, vivify_353
    $P1045 = root_new ['parrot';'Hash']
  vivify_353:
    set $P1046, $P1045["routine_declarator"]
    unless_null $P1046, vivify_354
    new $P1046, "Undef"
  vivify_354:
    $P1047 = $P1046."ast"()
    set $P1041, $P1047
  if_1042_end:
    $P1051 = $P1040."!make"($P1041)
.annotate "line", 368
    .return ($P1051)
  control_1037:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1052, exception, "payload"
    .return ($P1052)
.end


.namespace ["NQP";"Actions"]
.sub "variable_declarator"  :subid("67_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1056
.annotate "line", 374
    .const 'Sub' $P1096 = "68_1271336409.53729" 
    capture_lex $P1096
    new $P1055, 'ExceptionHandler'
    set_addr $P1055, control_1054
    $P1055."handle_types"(58)
    push_eh $P1055
    .lex "self", self
    .lex "$/", param_1056
.annotate "line", 375
    new $P1057, "Undef"
    .lex "$past", $P1057
.annotate "line", 376
    new $P1058, "Undef"
    .lex "$sigil", $P1058
.annotate "line", 377
    new $P1059, "Undef"
    .lex "$name", $P1059
.annotate "line", 378
    new $P1060, "Undef"
    .lex "$BLOCK", $P1060
.annotate "line", 375
    find_lex $P1061, "$/"
    unless_null $P1061, vivify_355
    $P1061 = root_new ['parrot';'Hash']
  vivify_355:
    set $P1062, $P1061["variable"]
    unless_null $P1062, vivify_356
    new $P1062, "Undef"
  vivify_356:
    $P1063 = $P1062."ast"()
    store_lex "$past", $P1063
.annotate "line", 376
    find_lex $P1064, "$/"
    unless_null $P1064, vivify_357
    $P1064 = root_new ['parrot';'Hash']
  vivify_357:
    set $P1065, $P1064["variable"]
    unless_null $P1065, vivify_358
    $P1065 = root_new ['parrot';'Hash']
  vivify_358:
    set $P1066, $P1065["sigil"]
    unless_null $P1066, vivify_359
    new $P1066, "Undef"
  vivify_359:
    store_lex "$sigil", $P1066
.annotate "line", 377
    find_lex $P1067, "$past"
    $P1068 = $P1067."name"()
    store_lex "$name", $P1068
.annotate "line", 378
    get_global $P1069, "@BLOCK"
    unless_null $P1069, vivify_360
    $P1069 = root_new ['parrot';'ResizablePMCArray']
  vivify_360:
    set $P1070, $P1069[0]
    unless_null $P1070, vivify_361
    new $P1070, "Undef"
  vivify_361:
    store_lex "$BLOCK", $P1070
.annotate "line", 379
    find_lex $P1072, "$BLOCK"
    find_lex $P1073, "$name"
    $P1074 = $P1072."symbol"($P1073)
    unless $P1074, if_1071_end
.annotate "line", 380
    find_lex $P1075, "$/"
    $P1076 = $P1075."CURSOR"()
    find_lex $P1077, "$name"
    $P1076."panic"("Redeclaration of symbol ", $P1077)
  if_1071_end:
.annotate "line", 382
    find_dynamic_lex $P1079, "$*SCOPE"
    unless_null $P1079, vivify_362
    get_hll_global $P1079, "$SCOPE"
    unless_null $P1079, vivify_363
    die "Contextual $*SCOPE not found"
  vivify_363:
  vivify_362:
    set $S1080, $P1079
    iseq $I1081, $S1080, "has"
    if $I1081, if_1078
.annotate "line", 391
    .const 'Sub' $P1096 = "68_1271336409.53729" 
    capture_lex $P1096
    $P1096()
    goto if_1078_end
  if_1078:
.annotate "line", 383
    find_lex $P1082, "$BLOCK"
    find_lex $P1083, "$name"
    $P1082."symbol"($P1083, "attribute" :named("scope"))
.annotate "line", 384
    find_lex $P1085, "$BLOCK"
    unless_null $P1085, vivify_368
    $P1085 = root_new ['parrot';'Hash']
  vivify_368:
    set $P1086, $P1085["attributes"]
    unless_null $P1086, vivify_369
    new $P1086, "Undef"
  vivify_369:
    if $P1086, unless_1084_end
.annotate "line", 386
    get_hll_global $P1087, ["PAST"], "Op"
    $P1088 = $P1087."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P1089, "$BLOCK"
    unless_null $P1089, vivify_370
    $P1089 = root_new ['parrot';'Hash']
    store_lex "$BLOCK", $P1089
  vivify_370:
    set $P1089["attributes"], $P1088
  unless_1084_end:
.annotate "line", 388
    find_lex $P1090, "$BLOCK"
    unless_null $P1090, vivify_371
    $P1090 = root_new ['parrot';'Hash']
  vivify_371:
    set $P1091, $P1090["attributes"]
    unless_null $P1091, vivify_372
    new $P1091, "Undef"
  vivify_372:
    find_lex $P1092, "$name"
    $P1091."push"($P1092)
.annotate "line", 389
    get_hll_global $P1093, ["PAST"], "Stmts"
    $P1094 = $P1093."new"()
    store_lex "$past", $P1094
  if_1078_end:
.annotate "line", 399
    find_lex $P1120, "$/"
    find_lex $P1121, "$past"
    $P1122 = $P1120."!make"($P1121)
.annotate "line", 374
    .return ($P1122)
  control_1054:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1123, exception, "payload"
    .return ($P1123)
.end


.namespace ["NQP";"Actions"]
.sub "_block1095"  :anon :subid("68_1271336409.53729") :outer("67_1271336409.53729")
.annotate "line", 392
    new $P1097, "Undef"
    .lex "$scope", $P1097
.annotate "line", 393
    new $P1098, "Undef"
    .lex "$decl", $P1098
.annotate "line", 392
    find_dynamic_lex $P1101, "$*SCOPE"
    unless_null $P1101, vivify_364
    get_hll_global $P1101, "$SCOPE"
    unless_null $P1101, vivify_365
    die "Contextual $*SCOPE not found"
  vivify_365:
  vivify_364:
    set $S1102, $P1101
    iseq $I1103, $S1102, "our"
    if $I1103, if_1100
    new $P1105, "String"
    assign $P1105, "lexical"
    set $P1099, $P1105
    goto if_1100_end
  if_1100:
    new $P1104, "String"
    assign $P1104, "package"
    set $P1099, $P1104
  if_1100_end:
    store_lex "$scope", $P1099
.annotate "line", 393
    get_hll_global $P1106, ["PAST"], "Var"
    find_lex $P1107, "$name"
    find_lex $P1108, "$scope"
.annotate "line", 394
    find_lex $P1109, "$sigil"
    $P1110 = "vivitype"($P1109)
    find_lex $P1111, "$/"
    $P1112 = $P1106."new"($P1107 :named("name"), $P1108 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P1110 :named("viviself"), $P1111 :named("node"))
.annotate "line", 393
    store_lex "$decl", $P1112
.annotate "line", 396
    find_lex $P1113, "$BLOCK"
    find_lex $P1114, "$name"
    find_lex $P1115, "$scope"
    $P1113."symbol"($P1114, $P1115 :named("scope"))
.annotate "line", 397
    find_lex $P1116, "$BLOCK"
    unless_null $P1116, vivify_366
    $P1116 = root_new ['parrot';'ResizablePMCArray']
  vivify_366:
    set $P1117, $P1116[0]
    unless_null $P1117, vivify_367
    new $P1117, "Undef"
  vivify_367:
    find_lex $P1118, "$decl"
    $P1119 = $P1117."push"($P1118)
.annotate "line", 391
    .return ($P1119)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<sub>"  :subid("69_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1127
.annotate "line", 402
    new $P1126, 'ExceptionHandler'
    set_addr $P1126, control_1125
    $P1126."handle_types"(58)
    push_eh $P1126
    .lex "self", self
    .lex "$/", param_1127
    find_lex $P1128, "$/"
    find_lex $P1129, "$/"
    unless_null $P1129, vivify_373
    $P1129 = root_new ['parrot';'Hash']
  vivify_373:
    set $P1130, $P1129["routine_def"]
    unless_null $P1130, vivify_374
    new $P1130, "Undef"
  vivify_374:
    $P1131 = $P1130."ast"()
    $P1132 = $P1128."!make"($P1131)
    .return ($P1132)
  control_1125:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1133, exception, "payload"
    .return ($P1133)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<method>"  :subid("70_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1137
.annotate "line", 403
    new $P1136, 'ExceptionHandler'
    set_addr $P1136, control_1135
    $P1136."handle_types"(58)
    push_eh $P1136
    .lex "self", self
    .lex "$/", param_1137
    find_lex $P1138, "$/"
    find_lex $P1139, "$/"
    unless_null $P1139, vivify_375
    $P1139 = root_new ['parrot';'Hash']
  vivify_375:
    set $P1140, $P1139["method_def"]
    unless_null $P1140, vivify_376
    new $P1140, "Undef"
  vivify_376:
    $P1141 = $P1140."ast"()
    $P1142 = $P1138."!make"($P1141)
    .return ($P1142)
  control_1135:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1143, exception, "payload"
    .return ($P1143)
.end


.namespace ["NQP";"Actions"]
.sub "routine_def"  :subid("71_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1147
.annotate "line", 405
    .const 'Sub' $P1158 = "72_1271336409.53729" 
    capture_lex $P1158
    new $P1146, 'ExceptionHandler'
    set_addr $P1146, control_1145
    $P1146."handle_types"(58)
    push_eh $P1146
    .lex "self", self
    .lex "$/", param_1147
.annotate "line", 406
    new $P1148, "Undef"
    .lex "$past", $P1148
    find_lex $P1149, "$/"
    unless_null $P1149, vivify_377
    $P1149 = root_new ['parrot';'Hash']
  vivify_377:
    set $P1150, $P1149["blockoid"]
    unless_null $P1150, vivify_378
    new $P1150, "Undef"
  vivify_378:
    $P1151 = $P1150."ast"()
    store_lex "$past", $P1151
.annotate "line", 407
    find_lex $P1152, "$past"
    $P1152."blocktype"("declaration")
.annotate "line", 408
    find_lex $P1153, "$past"
    $P1153."control"("return_pir")
.annotate "line", 409
    find_lex $P1155, "$/"
    unless_null $P1155, vivify_379
    $P1155 = root_new ['parrot';'Hash']
  vivify_379:
    set $P1156, $P1155["deflongname"]
    unless_null $P1156, vivify_380
    new $P1156, "Undef"
  vivify_380:
    unless $P1156, if_1154_end
    .const 'Sub' $P1158 = "72_1271336409.53729" 
    capture_lex $P1158
    $P1158()
  if_1154_end:
.annotate "line", 419
    find_lex $P1190, "$/"
    find_lex $P1191, "$past"
    $P1192 = $P1190."!make"($P1191)
.annotate "line", 405
    .return ($P1192)
  control_1145:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1193, exception, "payload"
    .return ($P1193)
.end


.namespace ["NQP";"Actions"]
.sub "_block1157"  :anon :subid("72_1271336409.53729") :outer("71_1271336409.53729")
.annotate "line", 410
    new $P1159, "Undef"
    .lex "$name", $P1159
    find_lex $P1160, "$/"
    unless_null $P1160, vivify_381
    $P1160 = root_new ['parrot';'Hash']
  vivify_381:
    set $P1161, $P1160["sigil"]
    unless_null $P1161, vivify_382
    $P1161 = root_new ['parrot';'ResizablePMCArray']
  vivify_382:
    set $P1162, $P1161[0]
    unless_null $P1162, vivify_383
    new $P1162, "Undef"
  vivify_383:
    set $S1163, $P1162
    new $P1164, 'String'
    set $P1164, $S1163
    find_lex $P1165, "$/"
    unless_null $P1165, vivify_384
    $P1165 = root_new ['parrot';'Hash']
  vivify_384:
    set $P1166, $P1165["deflongname"]
    unless_null $P1166, vivify_385
    $P1166 = root_new ['parrot';'ResizablePMCArray']
  vivify_385:
    set $P1167, $P1166[0]
    unless_null $P1167, vivify_386
    new $P1167, "Undef"
  vivify_386:
    $S1168 = $P1167."ast"()
    concat $P1169, $P1164, $S1168
    store_lex "$name", $P1169
.annotate "line", 411
    find_lex $P1170, "$past"
    find_lex $P1171, "$name"
    $P1170."name"($P1171)
.annotate "line", 412
    find_dynamic_lex $P1174, "$*SCOPE"
    unless_null $P1174, vivify_387
    get_hll_global $P1174, "$SCOPE"
    unless_null $P1174, vivify_388
    die "Contextual $*SCOPE not found"
  vivify_388:
  vivify_387:
    set $S1175, $P1174
    isne $I1176, $S1175, "our"
    if $I1176, if_1173
    new $P1172, 'Integer'
    set $P1172, $I1176
    goto if_1173_end
  if_1173:
.annotate "line", 413
    get_global $P1177, "@BLOCK"
    unless_null $P1177, vivify_389
    $P1177 = root_new ['parrot';'ResizablePMCArray']
  vivify_389:
    set $P1178, $P1177[0]
    unless_null $P1178, vivify_390
    $P1178 = root_new ['parrot';'ResizablePMCArray']
  vivify_390:
    set $P1179, $P1178[0]
    unless_null $P1179, vivify_391
    new $P1179, "Undef"
  vivify_391:
    get_hll_global $P1180, ["PAST"], "Var"
    find_lex $P1181, "$name"
    find_lex $P1182, "$past"
    $P1183 = $P1180."new"($P1181 :named("name"), 1 :named("isdecl"), $P1182 :named("viviself"), "lexical" :named("scope"))
    $P1179."push"($P1183)
.annotate "line", 415
    get_global $P1184, "@BLOCK"
    unless_null $P1184, vivify_392
    $P1184 = root_new ['parrot';'ResizablePMCArray']
  vivify_392:
    set $P1185, $P1184[0]
    unless_null $P1185, vivify_393
    new $P1185, "Undef"
  vivify_393:
    find_lex $P1186, "$name"
    $P1185."symbol"($P1186, "lexical" :named("scope"))
.annotate "line", 416
    get_hll_global $P1187, ["PAST"], "Var"
    find_lex $P1188, "$name"
    $P1189 = $P1187."new"($P1188 :named("name"))
    store_lex "$past", $P1189
.annotate "line", 412
    set $P1172, $P1189
  if_1173_end:
.annotate "line", 409
    .return ($P1172)
.end


.namespace ["NQP";"Actions"]
.sub "method_def"  :subid("73_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1197
.annotate "line", 423
    .const 'Sub' $P1213 = "74_1271336409.53729" 
    capture_lex $P1213
    new $P1196, 'ExceptionHandler'
    set_addr $P1196, control_1195
    $P1196."handle_types"(58)
    push_eh $P1196
    .lex "self", self
    .lex "$/", param_1197
.annotate "line", 424
    new $P1198, "Undef"
    .lex "$past", $P1198
    find_lex $P1199, "$/"
    unless_null $P1199, vivify_394
    $P1199 = root_new ['parrot';'Hash']
  vivify_394:
    set $P1200, $P1199["blockoid"]
    unless_null $P1200, vivify_395
    new $P1200, "Undef"
  vivify_395:
    $P1201 = $P1200."ast"()
    store_lex "$past", $P1201
.annotate "line", 425
    find_lex $P1202, "$past"
    $P1202."blocktype"("method")
.annotate "line", 426
    find_lex $P1203, "$past"
    $P1203."control"("return_pir")
.annotate "line", 427
    find_lex $P1204, "$past"
    unless_null $P1204, vivify_396
    $P1204 = root_new ['parrot';'ResizablePMCArray']
  vivify_396:
    set $P1205, $P1204[0]
    unless_null $P1205, vivify_397
    new $P1205, "Undef"
  vivify_397:
    get_hll_global $P1206, ["PAST"], "Op"
    $P1207 = $P1206."new"("    .lex \"self\", self" :named("inline"))
    $P1205."unshift"($P1207)
.annotate "line", 428
    find_lex $P1208, "$past"
    $P1208."symbol"("self", "lexical" :named("scope"))
.annotate "line", 429
    find_lex $P1210, "$/"
    unless_null $P1210, vivify_398
    $P1210 = root_new ['parrot';'Hash']
  vivify_398:
    set $P1211, $P1210["deflongname"]
    unless_null $P1211, vivify_399
    new $P1211, "Undef"
  vivify_399:
    unless $P1211, if_1209_end
    .const 'Sub' $P1213 = "74_1271336409.53729" 
    capture_lex $P1213
    $P1213()
  if_1209_end:
.annotate "line", 433
    find_lex $P1224, "$/"
    find_lex $P1225, "$past"
    $P1226 = $P1224."!make"($P1225)
.annotate "line", 423
    .return ($P1226)
  control_1195:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1227, exception, "payload"
    .return ($P1227)
.end


.namespace ["NQP";"Actions"]
.sub "_block1212"  :anon :subid("74_1271336409.53729") :outer("73_1271336409.53729")
.annotate "line", 430
    new $P1214, "Undef"
    .lex "$name", $P1214
    find_lex $P1215, "$/"
    unless_null $P1215, vivify_400
    $P1215 = root_new ['parrot';'Hash']
  vivify_400:
    set $P1216, $P1215["deflongname"]
    unless_null $P1216, vivify_401
    $P1216 = root_new ['parrot';'ResizablePMCArray']
  vivify_401:
    set $P1217, $P1216[0]
    unless_null $P1217, vivify_402
    new $P1217, "Undef"
  vivify_402:
    $P1218 = $P1217."ast"()
    set $S1219, $P1218
    new $P1220, 'String'
    set $P1220, $S1219
    store_lex "$name", $P1220
.annotate "line", 431
    find_lex $P1221, "$past"
    find_lex $P1222, "$name"
    $P1223 = $P1221."name"($P1222)
.annotate "line", 429
    .return ($P1223)
.end


.namespace ["NQP";"Actions"]
.sub "signature"  :subid("75_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1231
.annotate "line", 437
    .const 'Sub' $P1242 = "76_1271336409.53729" 
    capture_lex $P1242
    new $P1230, 'ExceptionHandler'
    set_addr $P1230, control_1229
    $P1230."handle_types"(58)
    push_eh $P1230
    .lex "self", self
    .lex "$/", param_1231
.annotate "line", 438
    new $P1232, "Undef"
    .lex "$BLOCKINIT", $P1232
    get_global $P1233, "@BLOCK"
    unless_null $P1233, vivify_403
    $P1233 = root_new ['parrot';'ResizablePMCArray']
  vivify_403:
    set $P1234, $P1233[0]
    unless_null $P1234, vivify_404
    $P1234 = root_new ['parrot';'ResizablePMCArray']
  vivify_404:
    set $P1235, $P1234[0]
    unless_null $P1235, vivify_405
    new $P1235, "Undef"
  vivify_405:
    store_lex "$BLOCKINIT", $P1235
.annotate "line", 439
    find_lex $P1237, "$/"
    unless_null $P1237, vivify_406
    $P1237 = root_new ['parrot';'Hash']
  vivify_406:
    set $P1238, $P1237["parameter"]
    unless_null $P1238, vivify_407
    new $P1238, "Undef"
  vivify_407:
    defined $I1239, $P1238
    unless $I1239, for_undef_408
    iter $P1236, $P1238
    new $P1249, 'ExceptionHandler'
    set_addr $P1249, loop1248_handler
    $P1249."handle_types"(65, 67, 66)
    push_eh $P1249
  loop1248_test:
    unless $P1236, loop1248_done
    shift $P1240, $P1236
  loop1248_redo:
    .const 'Sub' $P1242 = "76_1271336409.53729" 
    capture_lex $P1242
    $P1242($P1240)
  loop1248_next:
    goto loop1248_test
  loop1248_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1250, exception, 'type'
    eq $P1250, 65, loop1248_next
    eq $P1250, 67, loop1248_redo
  loop1248_done:
    pop_eh 
  for_undef_408:
.annotate "line", 437
    .return ($P1236)
  control_1229:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1251, exception, "payload"
    .return ($P1251)
.end


.namespace ["NQP";"Actions"]
.sub "_block1241"  :anon :subid("76_1271336409.53729") :outer("75_1271336409.53729")
    .param pmc param_1243
.annotate "line", 439
    .lex "$_", param_1243
    find_lex $P1244, "$BLOCKINIT"
    find_lex $P1245, "$_"
    $P1246 = $P1245."ast"()
    $P1247 = $P1244."push"($P1246)
    .return ($P1247)
.end


.namespace ["NQP";"Actions"]
.sub "parameter"  :subid("77_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1255
.annotate "line", 442
    new $P1254, 'ExceptionHandler'
    set_addr $P1254, control_1253
    $P1254."handle_types"(58)
    push_eh $P1254
    .lex "self", self
    .lex "$/", param_1255
.annotate "line", 443
    new $P1256, "Undef"
    .lex "$quant", $P1256
.annotate "line", 444
    new $P1257, "Undef"
    .lex "$past", $P1257
.annotate "line", 443
    find_lex $P1258, "$/"
    unless_null $P1258, vivify_409
    $P1258 = root_new ['parrot';'Hash']
  vivify_409:
    set $P1259, $P1258["quant"]
    unless_null $P1259, vivify_410
    new $P1259, "Undef"
  vivify_410:
    store_lex "$quant", $P1259
    find_lex $P1260, "$past"
.annotate "line", 445
    find_lex $P1262, "$/"
    unless_null $P1262, vivify_411
    $P1262 = root_new ['parrot';'Hash']
  vivify_411:
    set $P1263, $P1262["named_param"]
    unless_null $P1263, vivify_412
    new $P1263, "Undef"
  vivify_412:
    if $P1263, if_1261
.annotate "line", 452
    find_lex $P1277, "$/"
    unless_null $P1277, vivify_413
    $P1277 = root_new ['parrot';'Hash']
  vivify_413:
    set $P1278, $P1277["param_var"]
    unless_null $P1278, vivify_414
    new $P1278, "Undef"
  vivify_414:
    $P1279 = $P1278."ast"()
    store_lex "$past", $P1279
.annotate "line", 453
    find_lex $P1281, "$quant"
    set $S1282, $P1281
    iseq $I1283, $S1282, "*"
    if $I1283, if_1280
.annotate "line", 457
    find_lex $P1292, "$quant"
    set $S1293, $P1292
    iseq $I1294, $S1293, "?"
    unless $I1294, if_1291_end
.annotate "line", 458
    find_lex $P1295, "$past"
    find_lex $P1296, "$/"
    unless_null $P1296, vivify_415
    $P1296 = root_new ['parrot';'Hash']
  vivify_415:
    set $P1297, $P1296["param_var"]
    unless_null $P1297, vivify_416
    $P1297 = root_new ['parrot';'Hash']
  vivify_416:
    set $P1298, $P1297["sigil"]
    unless_null $P1298, vivify_417
    new $P1298, "Undef"
  vivify_417:
    $P1299 = "vivitype"($P1298)
    $P1295."viviself"($P1299)
  if_1291_end:
.annotate "line", 457
    goto if_1280_end
  if_1280:
.annotate "line", 454
    find_lex $P1284, "$past"
    $P1284."slurpy"(1)
.annotate "line", 455
    find_lex $P1285, "$past"
    find_lex $P1286, "$/"
    unless_null $P1286, vivify_418
    $P1286 = root_new ['parrot';'Hash']
  vivify_418:
    set $P1287, $P1286["param_var"]
    unless_null $P1287, vivify_419
    $P1287 = root_new ['parrot';'Hash']
  vivify_419:
    set $P1288, $P1287["sigil"]
    unless_null $P1288, vivify_420
    new $P1288, "Undef"
  vivify_420:
    set $S1289, $P1288
    iseq $I1290, $S1289, "%"
    $P1285."named"($I1290)
  if_1280_end:
.annotate "line", 451
    goto if_1261_end
  if_1261:
.annotate "line", 446
    find_lex $P1264, "$/"
    unless_null $P1264, vivify_421
    $P1264 = root_new ['parrot';'Hash']
  vivify_421:
    set $P1265, $P1264["named_param"]
    unless_null $P1265, vivify_422
    new $P1265, "Undef"
  vivify_422:
    $P1266 = $P1265."ast"()
    store_lex "$past", $P1266
.annotate "line", 447
    find_lex $P1268, "$quant"
    set $S1269, $P1268
    isne $I1270, $S1269, "!"
    unless $I1270, if_1267_end
.annotate "line", 448
    find_lex $P1271, "$past"
    find_lex $P1272, "$/"
    unless_null $P1272, vivify_423
    $P1272 = root_new ['parrot';'Hash']
  vivify_423:
    set $P1273, $P1272["named_param"]
    unless_null $P1273, vivify_424
    $P1273 = root_new ['parrot';'Hash']
  vivify_424:
    set $P1274, $P1273["param_var"]
    unless_null $P1274, vivify_425
    $P1274 = root_new ['parrot';'Hash']
  vivify_425:
    set $P1275, $P1274["sigil"]
    unless_null $P1275, vivify_426
    new $P1275, "Undef"
  vivify_426:
    $P1276 = "vivitype"($P1275)
    $P1271."viviself"($P1276)
  if_1267_end:
  if_1261_end:
.annotate "line", 461
    find_lex $P1301, "$/"
    unless_null $P1301, vivify_427
    $P1301 = root_new ['parrot';'Hash']
  vivify_427:
    set $P1302, $P1301["default_value"]
    unless_null $P1302, vivify_428
    new $P1302, "Undef"
  vivify_428:
    unless $P1302, if_1300_end
.annotate "line", 462
    find_lex $P1304, "$quant"
    set $S1305, $P1304
    iseq $I1306, $S1305, "*"
    unless $I1306, if_1303_end
.annotate "line", 463
    find_lex $P1307, "$/"
    $P1308 = $P1307."CURSOR"()
    $P1308."panic"("Can't put default on slurpy parameter")
  if_1303_end:
.annotate "line", 465
    find_lex $P1310, "$quant"
    set $S1311, $P1310
    iseq $I1312, $S1311, "!"
    unless $I1312, if_1309_end
.annotate "line", 466
    find_lex $P1313, "$/"
    $P1314 = $P1313."CURSOR"()
    $P1314."panic"("Can't put default on required parameter")
  if_1309_end:
.annotate "line", 468
    find_lex $P1315, "$past"
    find_lex $P1316, "$/"
    unless_null $P1316, vivify_429
    $P1316 = root_new ['parrot';'Hash']
  vivify_429:
    set $P1317, $P1316["default_value"]
    unless_null $P1317, vivify_430
    $P1317 = root_new ['parrot';'ResizablePMCArray']
  vivify_430:
    set $P1318, $P1317[0]
    unless_null $P1318, vivify_431
    $P1318 = root_new ['parrot';'Hash']
  vivify_431:
    set $P1319, $P1318["EXPR"]
    unless_null $P1319, vivify_432
    new $P1319, "Undef"
  vivify_432:
    $P1320 = $P1319."ast"()
    $P1315."viviself"($P1320)
  if_1300_end:
.annotate "line", 470
    find_lex $P1322, "$past"
    $P1323 = $P1322."viviself"()
    if $P1323, unless_1321_end
    get_global $P1324, "@BLOCK"
    unless_null $P1324, vivify_433
    $P1324 = root_new ['parrot';'ResizablePMCArray']
  vivify_433:
    set $P1325, $P1324[0]
    unless_null $P1325, vivify_434
    new $P1325, "Undef"
  vivify_434:
    get_global $P1326, "@BLOCK"
    unless_null $P1326, vivify_435
    $P1326 = root_new ['parrot';'ResizablePMCArray']
  vivify_435:
    set $P1327, $P1326[0]
    unless_null $P1327, vivify_436
    new $P1327, "Undef"
  vivify_436:
    $P1328 = $P1327."arity"()
    set $N1329, $P1328
    new $P1330, 'Float'
    set $P1330, $N1329
    add $P1331, $P1330, 1
    $P1325."arity"($P1331)
  unless_1321_end:
.annotate "line", 471
    find_lex $P1332, "$/"
    find_lex $P1333, "$past"
    $P1334 = $P1332."!make"($P1333)
.annotate "line", 442
    .return ($P1334)
  control_1253:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1335, exception, "payload"
    .return ($P1335)
.end


.namespace ["NQP";"Actions"]
.sub "param_var"  :subid("78_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1339
.annotate "line", 474
    new $P1338, 'ExceptionHandler'
    set_addr $P1338, control_1337
    $P1338."handle_types"(58)
    push_eh $P1338
    .lex "self", self
    .lex "$/", param_1339
.annotate "line", 475
    new $P1340, "Undef"
    .lex "$name", $P1340
.annotate "line", 476
    new $P1341, "Undef"
    .lex "$past", $P1341
.annotate "line", 475
    find_lex $P1342, "$/"
    set $S1343, $P1342
    new $P1344, 'String'
    set $P1344, $S1343
    store_lex "$name", $P1344
.annotate "line", 476
    get_hll_global $P1345, ["PAST"], "Var"
    find_lex $P1346, "$name"
    find_lex $P1347, "$/"
    $P1348 = $P1345."new"($P1346 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1347 :named("node"))
    store_lex "$past", $P1348
.annotate "line", 478
    get_global $P1349, "@BLOCK"
    unless_null $P1349, vivify_437
    $P1349 = root_new ['parrot';'ResizablePMCArray']
  vivify_437:
    set $P1350, $P1349[0]
    unless_null $P1350, vivify_438
    new $P1350, "Undef"
  vivify_438:
    find_lex $P1351, "$name"
    $P1350."symbol"($P1351, "lexical" :named("scope"))
.annotate "line", 479
    find_lex $P1352, "$/"
    find_lex $P1353, "$past"
    $P1354 = $P1352."!make"($P1353)
.annotate "line", 474
    .return ($P1354)
  control_1337:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1355, exception, "payload"
    .return ($P1355)
.end


.namespace ["NQP";"Actions"]
.sub "named_param"  :subid("79_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1359
.annotate "line", 482
    new $P1358, 'ExceptionHandler'
    set_addr $P1358, control_1357
    $P1358."handle_types"(58)
    push_eh $P1358
    .lex "self", self
    .lex "$/", param_1359
.annotate "line", 483
    new $P1360, "Undef"
    .lex "$past", $P1360
    find_lex $P1361, "$/"
    unless_null $P1361, vivify_439
    $P1361 = root_new ['parrot';'Hash']
  vivify_439:
    set $P1362, $P1361["param_var"]
    unless_null $P1362, vivify_440
    new $P1362, "Undef"
  vivify_440:
    $P1363 = $P1362."ast"()
    store_lex "$past", $P1363
.annotate "line", 484
    find_lex $P1364, "$past"
    find_lex $P1365, "$/"
    unless_null $P1365, vivify_441
    $P1365 = root_new ['parrot';'Hash']
  vivify_441:
    set $P1366, $P1365["param_var"]
    unless_null $P1366, vivify_442
    $P1366 = root_new ['parrot';'Hash']
  vivify_442:
    set $P1367, $P1366["name"]
    unless_null $P1367, vivify_443
    new $P1367, "Undef"
  vivify_443:
    set $S1368, $P1367
    $P1364."named"($S1368)
.annotate "line", 485
    find_lex $P1369, "$/"
    find_lex $P1370, "$past"
    $P1371 = $P1369."!make"($P1370)
.annotate "line", 482
    .return ($P1371)
  control_1357:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1372, exception, "payload"
    .return ($P1372)
.end


.namespace ["NQP";"Actions"]
.sub "regex_declarator"  :subid("80_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1376
    .param pmc param_1377 :optional
    .param int has_param_1377 :opt_flag
.annotate "line", 488
    .const 'Sub' $P1447 = "82_1271336409.53729" 
    capture_lex $P1447
    .const 'Sub' $P1419 = "81_1271336409.53729" 
    capture_lex $P1419
    new $P1375, 'ExceptionHandler'
    set_addr $P1375, control_1374
    $P1375."handle_types"(58)
    push_eh $P1375
    .lex "self", self
    .lex "$/", param_1376
    if has_param_1377, optparam_444
    new $P1378, "Undef"
    set param_1377, $P1378
  optparam_444:
    .lex "$key", param_1377
.annotate "line", 489
    $P1379 = root_new ['parrot';'ResizablePMCArray']
    .lex "@MODIFIERS", $P1379
.annotate "line", 492
    new $P1380, "Undef"
    .lex "$name", $P1380
.annotate "line", 493
    new $P1381, "Undef"
    .lex "$past", $P1381
.annotate "line", 489

        $P1382 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1382
.annotate "line", 492
    find_lex $P1383, "$/"
    unless_null $P1383, vivify_445
    $P1383 = root_new ['parrot';'Hash']
  vivify_445:
    set $P1384, $P1383["deflongname"]
    unless_null $P1384, vivify_446
    new $P1384, "Undef"
  vivify_446:
    $P1385 = $P1384."ast"()
    set $S1386, $P1385
    new $P1387, 'String'
    set $P1387, $S1386
    store_lex "$name", $P1387
    find_lex $P1388, "$past"
.annotate "line", 494
    find_lex $P1390, "$/"
    unless_null $P1390, vivify_447
    $P1390 = root_new ['parrot';'Hash']
  vivify_447:
    set $P1391, $P1390["proto"]
    unless_null $P1391, vivify_448
    new $P1391, "Undef"
  vivify_448:
    if $P1391, if_1389
.annotate "line", 521
    find_lex $P1415, "$key"
    set $S1416, $P1415
    iseq $I1417, $S1416, "open"
    if $I1417, if_1414
.annotate "line", 534
    .const 'Sub' $P1447 = "82_1271336409.53729" 
    capture_lex $P1447
    $P1447()
    goto if_1414_end
  if_1414:
.annotate "line", 521
    .const 'Sub' $P1419 = "81_1271336409.53729" 
    capture_lex $P1419
    $P1419()
  if_1414_end:
    goto if_1389_end
  if_1389:
.annotate "line", 496
    get_hll_global $P1392, ["PAST"], "Stmts"
.annotate "line", 497
    get_hll_global $P1393, ["PAST"], "Block"
    find_lex $P1394, "$name"
.annotate "line", 498
    get_hll_global $P1395, ["PAST"], "Op"
.annotate "line", 499
    get_hll_global $P1396, ["PAST"], "Var"
    $P1397 = $P1396."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1398, "$name"
    $P1399 = $P1395."new"($P1397, $P1398, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 498
    find_lex $P1400, "$/"
    $P1401 = $P1393."new"($P1399, $P1394 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1400 :named("node"))
.annotate "line", 508
    get_hll_global $P1402, ["PAST"], "Block"
    new $P1403, "String"
    assign $P1403, "!PREFIX__"
    find_lex $P1404, "$name"
    concat $P1405, $P1403, $P1404
.annotate "line", 509
    get_hll_global $P1406, ["PAST"], "Op"
.annotate "line", 510
    get_hll_global $P1407, ["PAST"], "Var"
    $P1408 = $P1407."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1409, "$name"
    $P1410 = $P1406."new"($P1408, $P1409, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 509
    find_lex $P1411, "$/"
    $P1412 = $P1402."new"($P1410, $P1405 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1411 :named("node"))
.annotate "line", 508
    $P1413 = $P1392."new"($P1401, $P1412)
.annotate "line", 496
    store_lex "$past", $P1413
  if_1389_end:
.annotate "line", 548
    find_lex $P1468, "$/"
    find_lex $P1469, "$past"
    $P1470 = $P1468."!make"($P1469)
.annotate "line", 488
    .return ($P1470)
  control_1374:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1471, exception, "payload"
    .return ($P1471)
.end


.namespace ["NQP";"Actions"]
.sub "_block1446"  :anon :subid("82_1271336409.53729") :outer("80_1271336409.53729")
.annotate "line", 535
    new $P1448, "Undef"
    .lex "$regex", $P1448
.annotate "line", 536
    get_hll_global $P1449, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1450, "$/"
    unless_null $P1450, vivify_449
    $P1450 = root_new ['parrot';'Hash']
  vivify_449:
    set $P1451, $P1450["p6regex"]
    unless_null $P1451, vivify_450
    new $P1451, "Undef"
  vivify_450:
    $P1452 = $P1451."ast"()
    get_global $P1453, "@BLOCK"
    $P1454 = $P1453."shift"()
    $P1455 = $P1449($P1452, $P1454)
    store_lex "$regex", $P1455
.annotate "line", 537
    find_lex $P1456, "$regex"
    find_lex $P1457, "$name"
    $P1456."name"($P1457)
.annotate "line", 539
    get_hll_global $P1458, ["PAST"], "Op"
.annotate "line", 541
    get_hll_global $P1459, ["PAST"], "Var"
    new $P1460, "ResizablePMCArray"
    push $P1460, "Regex"
    $P1461 = $P1459."new"("Method" :named("name"), $P1460 :named("namespace"), "package" :named("scope"))
    find_lex $P1462, "$regex"
    $P1463 = $P1458."new"($P1461, $P1462, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate "line", 539
    store_lex "$past", $P1463
.annotate "line", 545
    find_lex $P1464, "$regex"
    find_lex $P1465, "$past"
    unless_null $P1465, vivify_451
    $P1465 = root_new ['parrot';'Hash']
    store_lex "$past", $P1465
  vivify_451:
    set $P1465["sink"], $P1464
.annotate "line", 546
    find_lex $P1466, "@MODIFIERS"
    $P1467 = $P1466."shift"()
.annotate "line", 534
    .return ($P1467)
.end


.namespace ["NQP";"Actions"]
.sub "_block1418"  :anon :subid("81_1271336409.53729") :outer("80_1271336409.53729")
.annotate "line", 522
    $P1420 = root_new ['parrot';'Hash']
    .lex "%h", $P1420
.annotate "line", 521
    find_lex $P1421, "%h"
.annotate "line", 523
    find_lex $P1423, "$/"
    unless_null $P1423, vivify_452
    $P1423 = root_new ['parrot';'Hash']
  vivify_452:
    set $P1424, $P1423["sym"]
    unless_null $P1424, vivify_453
    new $P1424, "Undef"
  vivify_453:
    set $S1425, $P1424
    iseq $I1426, $S1425, "token"
    unless $I1426, if_1422_end
    new $P1427, "Integer"
    assign $P1427, 1
    find_lex $P1428, "%h"
    unless_null $P1428, vivify_454
    $P1428 = root_new ['parrot';'Hash']
    store_lex "%h", $P1428
  vivify_454:
    set $P1428["r"], $P1427
  if_1422_end:
.annotate "line", 524
    find_lex $P1430, "$/"
    unless_null $P1430, vivify_455
    $P1430 = root_new ['parrot';'Hash']
  vivify_455:
    set $P1431, $P1430["sym"]
    unless_null $P1431, vivify_456
    new $P1431, "Undef"
  vivify_456:
    set $S1432, $P1431
    iseq $I1433, $S1432, "rule"
    unless $I1433, if_1429_end
    new $P1434, "Integer"
    assign $P1434, 1
    find_lex $P1435, "%h"
    unless_null $P1435, vivify_457
    $P1435 = root_new ['parrot';'Hash']
    store_lex "%h", $P1435
  vivify_457:
    set $P1435["r"], $P1434
    new $P1436, "Integer"
    assign $P1436, 1
    find_lex $P1437, "%h"
    unless_null $P1437, vivify_458
    $P1437 = root_new ['parrot';'Hash']
    store_lex "%h", $P1437
  vivify_458:
    set $P1437["s"], $P1436
  if_1429_end:
.annotate "line", 525
    find_lex $P1438, "@MODIFIERS"
    find_lex $P1439, "%h"
    $P1438."unshift"($P1439)
.annotate "line", 526

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate "line", 530
    get_global $P1440, "@BLOCK"
    unless_null $P1440, vivify_459
    $P1440 = root_new ['parrot';'ResizablePMCArray']
  vivify_459:
    set $P1441, $P1440[0]
    unless_null $P1441, vivify_460
    new $P1441, "Undef"
  vivify_460:
    $P1441."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate "line", 531
    get_global $P1442, "@BLOCK"
    unless_null $P1442, vivify_461
    $P1442 = root_new ['parrot';'ResizablePMCArray']
  vivify_461:
    set $P1443, $P1442[0]
    unless_null $P1443, vivify_462
    new $P1443, "Undef"
  vivify_462:
    $P1443."symbol"("$/", "lexical" :named("scope"))
.annotate "line", 532
    new $P1444, "Exception"
    set $P1444['type'], 58
    new $P1445, "Integer"
    assign $P1445, 0
    setattribute $P1444, 'payload', $P1445
    throw $P1444
.annotate "line", 521
    .return ()
.end


.namespace ["NQP";"Actions"]
.sub "dotty"  :subid("83_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1475
.annotate "line", 552
    new $P1474, 'ExceptionHandler'
    set_addr $P1474, control_1473
    $P1474."handle_types"(58)
    push_eh $P1474
    .lex "self", self
    .lex "$/", param_1475
.annotate "line", 553
    new $P1476, "Undef"
    .lex "$past", $P1476
    find_lex $P1479, "$/"
    unless_null $P1479, vivify_463
    $P1479 = root_new ['parrot';'Hash']
  vivify_463:
    set $P1480, $P1479["args"]
    unless_null $P1480, vivify_464
    new $P1480, "Undef"
  vivify_464:
    if $P1480, if_1478
    get_hll_global $P1485, ["PAST"], "Op"
    find_lex $P1486, "$/"
    $P1487 = $P1485."new"($P1486 :named("node"))
    set $P1477, $P1487
    goto if_1478_end
  if_1478:
    find_lex $P1481, "$/"
    unless_null $P1481, vivify_465
    $P1481 = root_new ['parrot';'Hash']
  vivify_465:
    set $P1482, $P1481["args"]
    unless_null $P1482, vivify_466
    $P1482 = root_new ['parrot';'ResizablePMCArray']
  vivify_466:
    set $P1483, $P1482[0]
    unless_null $P1483, vivify_467
    new $P1483, "Undef"
  vivify_467:
    $P1484 = $P1483."ast"()
    set $P1477, $P1484
  if_1478_end:
    store_lex "$past", $P1477
.annotate "line", 554
    find_lex $P1488, "$past"
    find_lex $P1491, "$/"
    unless_null $P1491, vivify_468
    $P1491 = root_new ['parrot';'Hash']
  vivify_468:
    set $P1492, $P1491["quote"]
    unless_null $P1492, vivify_469
    new $P1492, "Undef"
  vivify_469:
    if $P1492, if_1490
    find_lex $P1496, "$/"
    unless_null $P1496, vivify_470
    $P1496 = root_new ['parrot';'Hash']
  vivify_470:
    set $P1497, $P1496["longname"]
    unless_null $P1497, vivify_471
    new $P1497, "Undef"
  vivify_471:
    set $S1498, $P1497
    new $P1489, 'String'
    set $P1489, $S1498
    goto if_1490_end
  if_1490:
    find_lex $P1493, "$/"
    unless_null $P1493, vivify_472
    $P1493 = root_new ['parrot';'Hash']
  vivify_472:
    set $P1494, $P1493["quote"]
    unless_null $P1494, vivify_473
    new $P1494, "Undef"
  vivify_473:
    $P1495 = $P1494."ast"()
    set $P1489, $P1495
  if_1490_end:
    $P1488."name"($P1489)
.annotate "line", 555
    find_lex $P1499, "$past"
    $P1499."pasttype"("callmethod")
.annotate "line", 556
    find_lex $P1500, "$/"
    find_lex $P1501, "$past"
    $P1502 = $P1500."!make"($P1501)
.annotate "line", 552
    .return ($P1502)
  control_1473:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1503, exception, "payload"
    .return ($P1503)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<self>"  :subid("84_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1507
.annotate "line", 561
    new $P1506, 'ExceptionHandler'
    set_addr $P1506, control_1505
    $P1506."handle_types"(58)
    push_eh $P1506
    .lex "self", self
    .lex "$/", param_1507
.annotate "line", 562
    find_lex $P1508, "$/"
    get_hll_global $P1509, ["PAST"], "Var"
    $P1510 = $P1509."new"("self" :named("name"))
    $P1511 = $P1508."!make"($P1510)
.annotate "line", 561
    .return ($P1511)
  control_1505:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1512, exception, "payload"
    .return ($P1512)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<identifier>"  :subid("85_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1516
.annotate "line", 565
    new $P1515, 'ExceptionHandler'
    set_addr $P1515, control_1514
    $P1515."handle_types"(58)
    push_eh $P1515
    .lex "self", self
    .lex "$/", param_1516
.annotate "line", 566
    new $P1517, "Undef"
    .lex "$past", $P1517
    find_lex $P1518, "$/"
    unless_null $P1518, vivify_474
    $P1518 = root_new ['parrot';'Hash']
  vivify_474:
    set $P1519, $P1518["args"]
    unless_null $P1519, vivify_475
    new $P1519, "Undef"
  vivify_475:
    $P1520 = $P1519."ast"()
    store_lex "$past", $P1520
.annotate "line", 567
    find_lex $P1521, "$past"
    find_lex $P1522, "$/"
    unless_null $P1522, vivify_476
    $P1522 = root_new ['parrot';'Hash']
  vivify_476:
    set $P1523, $P1522["identifier"]
    unless_null $P1523, vivify_477
    new $P1523, "Undef"
  vivify_477:
    set $S1524, $P1523
    $P1521."name"($S1524)
.annotate "line", 568
    find_lex $P1525, "$/"
    find_lex $P1526, "$past"
    $P1527 = $P1525."!make"($P1526)
.annotate "line", 565
    .return ($P1527)
  control_1514:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1528, exception, "payload"
    .return ($P1528)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<name>"  :subid("86_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1532
.annotate "line", 571
    new $P1531, 'ExceptionHandler'
    set_addr $P1531, control_1530
    $P1531."handle_types"(58)
    push_eh $P1531
    .lex "self", self
    .lex "$/", param_1532
.annotate "line", 572
    $P1533 = root_new ['parrot';'ResizablePMCArray']
    .lex "@ns", $P1533
.annotate "line", 573
    new $P1534, "Undef"
    .lex "$name", $P1534
.annotate "line", 575
    new $P1535, "Undef"
    .lex "$var", $P1535
.annotate "line", 577
    new $P1536, "Undef"
    .lex "$past", $P1536
.annotate "line", 572
    find_lex $P1537, "$/"
    unless_null $P1537, vivify_478
    $P1537 = root_new ['parrot';'Hash']
  vivify_478:
    set $P1538, $P1537["name"]
    unless_null $P1538, vivify_479
    $P1538 = root_new ['parrot';'Hash']
  vivify_479:
    set $P1539, $P1538["identifier"]
    unless_null $P1539, vivify_480
    new $P1539, "Undef"
  vivify_480:
    clone $P1540, $P1539
    store_lex "@ns", $P1540
.annotate "line", 573
    find_lex $P1541, "@ns"
    $P1542 = $P1541."pop"()
    store_lex "$name", $P1542
.annotate "line", 574
    find_lex $P1546, "@ns"
    if $P1546, if_1545
    set $P1544, $P1546
    goto if_1545_end
  if_1545:
    find_lex $P1547, "@ns"
    unless_null $P1547, vivify_481
    $P1547 = root_new ['parrot';'ResizablePMCArray']
  vivify_481:
    set $P1548, $P1547[0]
    unless_null $P1548, vivify_482
    new $P1548, "Undef"
  vivify_482:
    set $S1549, $P1548
    iseq $I1550, $S1549, "GLOBAL"
    new $P1544, 'Integer'
    set $P1544, $I1550
  if_1545_end:
    unless $P1544, if_1543_end
    find_lex $P1551, "@ns"
    $P1551."shift"()
  if_1543_end:
.annotate "line", 576
    get_hll_global $P1552, ["PAST"], "Var"
    find_lex $P1553, "$name"
    set $S1554, $P1553
    find_lex $P1555, "@ns"
    $P1556 = $P1552."new"($S1554 :named("name"), $P1555 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1556
.annotate "line", 577
    find_lex $P1557, "$var"
    store_lex "$past", $P1557
.annotate "line", 578
    find_lex $P1559, "$/"
    unless_null $P1559, vivify_483
    $P1559 = root_new ['parrot';'Hash']
  vivify_483:
    set $P1560, $P1559["args"]
    unless_null $P1560, vivify_484
    new $P1560, "Undef"
  vivify_484:
    unless $P1560, if_1558_end
.annotate "line", 579
    find_lex $P1561, "$/"
    unless_null $P1561, vivify_485
    $P1561 = root_new ['parrot';'Hash']
  vivify_485:
    set $P1562, $P1561["args"]
    unless_null $P1562, vivify_486
    $P1562 = root_new ['parrot';'ResizablePMCArray']
  vivify_486:
    set $P1563, $P1562[0]
    unless_null $P1563, vivify_487
    new $P1563, "Undef"
  vivify_487:
    $P1564 = $P1563."ast"()
    store_lex "$past", $P1564
.annotate "line", 580
    find_lex $P1565, "$past"
    find_lex $P1566, "$var"
    $P1565."unshift"($P1566)
  if_1558_end:
.annotate "line", 582
    find_lex $P1567, "$/"
    find_lex $P1568, "$past"
    $P1569 = $P1567."!make"($P1568)
.annotate "line", 571
    .return ($P1569)
  control_1530:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1570, exception, "payload"
    .return ($P1570)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<pir::op>"  :subid("87_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1574
.annotate "line", 585
    new $P1573, 'ExceptionHandler'
    set_addr $P1573, control_1572
    $P1573."handle_types"(58)
    push_eh $P1573
    .lex "self", self
    .lex "$/", param_1574
.annotate "line", 586
    new $P1575, "Undef"
    .lex "$past", $P1575
.annotate "line", 587
    new $P1576, "Undef"
    .lex "$pirop", $P1576
.annotate "line", 586
    find_lex $P1579, "$/"
    unless_null $P1579, vivify_488
    $P1579 = root_new ['parrot';'Hash']
  vivify_488:
    set $P1580, $P1579["args"]
    unless_null $P1580, vivify_489
    new $P1580, "Undef"
  vivify_489:
    if $P1580, if_1578
    get_hll_global $P1585, ["PAST"], "Op"
    find_lex $P1586, "$/"
    $P1587 = $P1585."new"($P1586 :named("node"))
    set $P1577, $P1587
    goto if_1578_end
  if_1578:
    find_lex $P1581, "$/"
    unless_null $P1581, vivify_490
    $P1581 = root_new ['parrot';'Hash']
  vivify_490:
    set $P1582, $P1581["args"]
    unless_null $P1582, vivify_491
    $P1582 = root_new ['parrot';'ResizablePMCArray']
  vivify_491:
    set $P1583, $P1582[0]
    unless_null $P1583, vivify_492
    new $P1583, "Undef"
  vivify_492:
    $P1584 = $P1583."ast"()
    set $P1577, $P1584
  if_1578_end:
    store_lex "$past", $P1577
.annotate "line", 587
    find_lex $P1588, "$/"
    unless_null $P1588, vivify_493
    $P1588 = root_new ['parrot';'Hash']
  vivify_493:
    set $P1589, $P1588["op"]
    unless_null $P1589, vivify_494
    new $P1589, "Undef"
  vivify_494:
    set $S1590, $P1589
    new $P1591, 'String'
    set $P1591, $S1590
    store_lex "$pirop", $P1591
.annotate "line", 588

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1592 = box $S0
    
    store_lex "$pirop", $P1592
.annotate "line", 595
    find_lex $P1593, "$past"
    find_lex $P1594, "$pirop"
    $P1593."pirop"($P1594)
.annotate "line", 596
    find_lex $P1595, "$past"
    $P1595."pasttype"("pirop")
.annotate "line", 597
    find_lex $P1596, "$/"
    find_lex $P1597, "$past"
    $P1598 = $P1596."!make"($P1597)
.annotate "line", 585
    .return ($P1598)
  control_1572:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1599, exception, "payload"
    .return ($P1599)
.end


.namespace ["NQP";"Actions"]
.sub "args"  :subid("88_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1603
.annotate "line", 600
    new $P1602, 'ExceptionHandler'
    set_addr $P1602, control_1601
    $P1602."handle_types"(58)
    push_eh $P1602
    .lex "self", self
    .lex "$/", param_1603
    find_lex $P1604, "$/"
    find_lex $P1605, "$/"
    unless_null $P1605, vivify_495
    $P1605 = root_new ['parrot';'Hash']
  vivify_495:
    set $P1606, $P1605["arglist"]
    unless_null $P1606, vivify_496
    new $P1606, "Undef"
  vivify_496:
    $P1607 = $P1606."ast"()
    $P1608 = $P1604."!make"($P1607)
    .return ($P1608)
  control_1601:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1609, exception, "payload"
    .return ($P1609)
.end


.namespace ["NQP";"Actions"]
.sub "arglist"  :subid("89_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1613
.annotate "line", 602
    .const 'Sub' $P1624 = "90_1271336409.53729" 
    capture_lex $P1624
    new $P1612, 'ExceptionHandler'
    set_addr $P1612, control_1611
    $P1612."handle_types"(58)
    push_eh $P1612
    .lex "self", self
    .lex "$/", param_1613
.annotate "line", 603
    new $P1614, "Undef"
    .lex "$past", $P1614
.annotate "line", 611
    new $P1615, "Undef"
    .lex "$i", $P1615
.annotate "line", 612
    new $P1616, "Undef"
    .lex "$n", $P1616
.annotate "line", 603
    get_hll_global $P1617, ["PAST"], "Op"
    find_lex $P1618, "$/"
    $P1619 = $P1617."new"("call" :named("pasttype"), $P1618 :named("node"))
    store_lex "$past", $P1619
.annotate "line", 604
    find_lex $P1621, "$/"
    unless_null $P1621, vivify_497
    $P1621 = root_new ['parrot';'Hash']
  vivify_497:
    set $P1622, $P1621["EXPR"]
    unless_null $P1622, vivify_498
    new $P1622, "Undef"
  vivify_498:
    unless $P1622, if_1620_end
    .const 'Sub' $P1624 = "90_1271336409.53729" 
    capture_lex $P1624
    $P1624()
  if_1620_end:
.annotate "line", 611
    new $P1656, "Integer"
    assign $P1656, 0
    store_lex "$i", $P1656
.annotate "line", 612
    find_lex $P1657, "$past"
    $P1658 = $P1657."list"()
    set $N1659, $P1658
    new $P1660, 'Float'
    set $P1660, $N1659
    store_lex "$n", $P1660
.annotate "line", 613
    new $P1688, 'ExceptionHandler'
    set_addr $P1688, loop1687_handler
    $P1688."handle_types"(65, 67, 66)
    push_eh $P1688
  loop1687_test:
    find_lex $P1661, "$i"
    set $N1662, $P1661
    find_lex $P1663, "$n"
    set $N1664, $P1663
    islt $I1665, $N1662, $N1664
    unless $I1665, loop1687_done
  loop1687_redo:
.annotate "line", 614
    find_lex $P1667, "$i"
    set $I1668, $P1667
    find_lex $P1669, "$past"
    unless_null $P1669, vivify_502
    $P1669 = root_new ['parrot';'ResizablePMCArray']
  vivify_502:
    set $P1670, $P1669[$I1668]
    unless_null $P1670, vivify_503
    new $P1670, "Undef"
  vivify_503:
    $S1671 = $P1670."name"()
    iseq $I1672, $S1671, "&prefix:<|>"
    unless $I1672, if_1666_end
.annotate "line", 615
    find_lex $P1673, "$i"
    set $I1674, $P1673
    find_lex $P1675, "$past"
    unless_null $P1675, vivify_504
    $P1675 = root_new ['parrot';'ResizablePMCArray']
  vivify_504:
    set $P1676, $P1675[$I1674]
    unless_null $P1676, vivify_505
    $P1676 = root_new ['parrot';'ResizablePMCArray']
  vivify_505:
    set $P1677, $P1676[0]
    unless_null $P1677, vivify_506
    new $P1677, "Undef"
  vivify_506:
    find_lex $P1678, "$i"
    set $I1679, $P1678
    find_lex $P1680, "$past"
    unless_null $P1680, vivify_507
    $P1680 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$past", $P1680
  vivify_507:
    set $P1680[$I1679], $P1677
.annotate "line", 616
    find_lex $P1681, "$i"
    set $I1682, $P1681
    find_lex $P1683, "$past"
    unless_null $P1683, vivify_508
    $P1683 = root_new ['parrot';'ResizablePMCArray']
  vivify_508:
    set $P1684, $P1683[$I1682]
    unless_null $P1684, vivify_509
    new $P1684, "Undef"
  vivify_509:
    $P1684."flat"(1)
  if_1666_end:
.annotate "line", 614
    find_lex $P1685, "$i"
    clone $P1686, $P1685
    inc $P1685
  loop1687_next:
.annotate "line", 613
    goto loop1687_test
  loop1687_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1689, exception, 'type'
    eq $P1689, 65, loop1687_next
    eq $P1689, 67, loop1687_redo
  loop1687_done:
    pop_eh 
.annotate "line", 620
    find_lex $P1690, "$/"
    find_lex $P1691, "$past"
    $P1692 = $P1690."!make"($P1691)
.annotate "line", 602
    .return ($P1692)
  control_1611:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1693, exception, "payload"
    .return ($P1693)
.end


.namespace ["NQP";"Actions"]
.sub "_block1623"  :anon :subid("90_1271336409.53729") :outer("89_1271336409.53729")
.annotate "line", 604
    .const 'Sub' $P1645 = "91_1271336409.53729" 
    capture_lex $P1645
.annotate "line", 605
    new $P1625, "Undef"
    .lex "$expr", $P1625
    find_lex $P1626, "$/"
    unless_null $P1626, vivify_499
    $P1626 = root_new ['parrot';'Hash']
  vivify_499:
    set $P1627, $P1626["EXPR"]
    unless_null $P1627, vivify_500
    new $P1627, "Undef"
  vivify_500:
    $P1628 = $P1627."ast"()
    store_lex "$expr", $P1628
.annotate "line", 606
    find_lex $P1633, "$expr"
    $S1634 = $P1633."name"()
    iseq $I1635, $S1634, "&infix:<,>"
    if $I1635, if_1632
    new $P1631, 'Integer'
    set $P1631, $I1635
    goto if_1632_end
  if_1632:
    find_lex $P1636, "$expr"
    $P1637 = $P1636."named"()
    isfalse $I1638, $P1637
    new $P1631, 'Integer'
    set $P1631, $I1638
  if_1632_end:
    if $P1631, if_1630
.annotate "line", 609
    find_lex $P1653, "$past"
    find_lex $P1654, "$expr"
    $P1655 = $P1653."push"($P1654)
    set $P1629, $P1655
.annotate "line", 606
    goto if_1630_end
  if_1630:
.annotate "line", 607
    find_lex $P1640, "$expr"
    $P1641 = $P1640."list"()
    defined $I1642, $P1641
    unless $I1642, for_undef_501
    iter $P1639, $P1641
    new $P1651, 'ExceptionHandler'
    set_addr $P1651, loop1650_handler
    $P1651."handle_types"(65, 67, 66)
    push_eh $P1651
  loop1650_test:
    unless $P1639, loop1650_done
    shift $P1643, $P1639
  loop1650_redo:
    .const 'Sub' $P1645 = "91_1271336409.53729" 
    capture_lex $P1645
    $P1645($P1643)
  loop1650_next:
    goto loop1650_test
  loop1650_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1652, exception, 'type'
    eq $P1652, 65, loop1650_next
    eq $P1652, 67, loop1650_redo
  loop1650_done:
    pop_eh 
  for_undef_501:
.annotate "line", 606
    set $P1629, $P1639
  if_1630_end:
.annotate "line", 604
    .return ($P1629)
.end


.namespace ["NQP";"Actions"]
.sub "_block1644"  :anon :subid("91_1271336409.53729") :outer("90_1271336409.53729")
    .param pmc param_1646
.annotate "line", 607
    .lex "$_", param_1646
    find_lex $P1647, "$past"
    find_lex $P1648, "$_"
    $P1649 = $P1647."push"($P1648)
    .return ($P1649)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<value>"  :subid("92_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1697
.annotate "line", 624
    new $P1696, 'ExceptionHandler'
    set_addr $P1696, control_1695
    $P1696."handle_types"(58)
    push_eh $P1696
    .lex "self", self
    .lex "$/", param_1697
    find_lex $P1698, "$/"
    find_lex $P1699, "$/"
    unless_null $P1699, vivify_510
    $P1699 = root_new ['parrot';'Hash']
  vivify_510:
    set $P1700, $P1699["value"]
    unless_null $P1700, vivify_511
    new $P1700, "Undef"
  vivify_511:
    $P1701 = $P1700."ast"()
    $P1702 = $P1698."!make"($P1701)
    .return ($P1702)
  control_1695:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1703, exception, "payload"
    .return ($P1703)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<( )>"  :subid("93_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1707
.annotate "line", 626
    new $P1706, 'ExceptionHandler'
    set_addr $P1706, control_1705
    $P1706."handle_types"(58)
    push_eh $P1706
    .lex "self", self
    .lex "$/", param_1707
.annotate "line", 627
    find_lex $P1708, "$/"
.annotate "line", 628
    find_lex $P1711, "$/"
    unless_null $P1711, vivify_512
    $P1711 = root_new ['parrot';'Hash']
  vivify_512:
    set $P1712, $P1711["EXPR"]
    unless_null $P1712, vivify_513
    new $P1712, "Undef"
  vivify_513:
    if $P1712, if_1710
.annotate "line", 629
    get_hll_global $P1717, ["PAST"], "Op"
    find_lex $P1718, "$/"
    $P1719 = $P1717."new"("list" :named("pasttype"), $P1718 :named("node"))
    set $P1709, $P1719
.annotate "line", 628
    goto if_1710_end
  if_1710:
    find_lex $P1713, "$/"
    unless_null $P1713, vivify_514
    $P1713 = root_new ['parrot';'Hash']
  vivify_514:
    set $P1714, $P1713["EXPR"]
    unless_null $P1714, vivify_515
    $P1714 = root_new ['parrot';'ResizablePMCArray']
  vivify_515:
    set $P1715, $P1714[0]
    unless_null $P1715, vivify_516
    new $P1715, "Undef"
  vivify_516:
    $P1716 = $P1715."ast"()
    set $P1709, $P1716
  if_1710_end:
    $P1720 = $P1708."!make"($P1709)
.annotate "line", 626
    .return ($P1720)
  control_1705:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1721, exception, "payload"
    .return ($P1721)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<[ ]>"  :subid("94_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1725
.annotate "line", 632
    new $P1724, 'ExceptionHandler'
    set_addr $P1724, control_1723
    $P1724."handle_types"(58)
    push_eh $P1724
    .lex "self", self
    .lex "$/", param_1725
.annotate "line", 633
    new $P1726, "Undef"
    .lex "$past", $P1726
.annotate "line", 632
    find_lex $P1727, "$past"
.annotate "line", 634
    find_lex $P1729, "$/"
    unless_null $P1729, vivify_517
    $P1729 = root_new ['parrot';'Hash']
  vivify_517:
    set $P1730, $P1729["EXPR"]
    unless_null $P1730, vivify_518
    new $P1730, "Undef"
  vivify_518:
    if $P1730, if_1728
.annotate "line", 641
    get_hll_global $P1742, ["PAST"], "Op"
    $P1743 = $P1742."new"("list" :named("pasttype"))
    store_lex "$past", $P1743
.annotate "line", 640
    goto if_1728_end
  if_1728:
.annotate "line", 635
    find_lex $P1731, "$/"
    unless_null $P1731, vivify_519
    $P1731 = root_new ['parrot';'Hash']
  vivify_519:
    set $P1732, $P1731["EXPR"]
    unless_null $P1732, vivify_520
    $P1732 = root_new ['parrot';'ResizablePMCArray']
  vivify_520:
    set $P1733, $P1732[0]
    unless_null $P1733, vivify_521
    new $P1733, "Undef"
  vivify_521:
    $P1734 = $P1733."ast"()
    store_lex "$past", $P1734
.annotate "line", 636
    find_lex $P1736, "$past"
    $S1737 = $P1736."name"()
    isne $I1738, $S1737, "&infix:<,>"
    unless $I1738, if_1735_end
.annotate "line", 637
    get_hll_global $P1739, ["PAST"], "Op"
    find_lex $P1740, "$past"
    $P1741 = $P1739."new"($P1740, "list" :named("pasttype"))
    store_lex "$past", $P1741
  if_1735_end:
  if_1728_end:
.annotate "line", 643
    find_lex $P1744, "$past"
    $P1744."name"("&circumfix:<[ ]>")
.annotate "line", 644
    find_lex $P1745, "$/"
    find_lex $P1746, "$past"
    $P1747 = $P1745."!make"($P1746)
.annotate "line", 632
    .return ($P1747)
  control_1723:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1748, exception, "payload"
    .return ($P1748)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<ang>"  :subid("95_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1752
.annotate "line", 647
    new $P1751, 'ExceptionHandler'
    set_addr $P1751, control_1750
    $P1751."handle_types"(58)
    push_eh $P1751
    .lex "self", self
    .lex "$/", param_1752
    find_lex $P1753, "$/"
    find_lex $P1754, "$/"
    unless_null $P1754, vivify_522
    $P1754 = root_new ['parrot';'Hash']
  vivify_522:
    set $P1755, $P1754["quote_EXPR"]
    unless_null $P1755, vivify_523
    new $P1755, "Undef"
  vivify_523:
    $P1756 = $P1755."ast"()
    $P1757 = $P1753."!make"($P1756)
    .return ($P1757)
  control_1750:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1758, exception, "payload"
    .return ($P1758)
.end


.namespace ["NQP";"Actions"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("96_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1762
.annotate "line", 648
    new $P1761, 'ExceptionHandler'
    set_addr $P1761, control_1760
    $P1761."handle_types"(58)
    push_eh $P1761
    .lex "self", self
    .lex "$/", param_1762
    find_lex $P1763, "$/"
    find_lex $P1764, "$/"
    unless_null $P1764, vivify_524
    $P1764 = root_new ['parrot';'Hash']
  vivify_524:
    set $P1765, $P1764["quote_EXPR"]
    unless_null $P1765, vivify_525
    new $P1765, "Undef"
  vivify_525:
    $P1766 = $P1765."ast"()
    $P1767 = $P1763."!make"($P1766)
    .return ($P1767)
  control_1760:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1768, exception, "payload"
    .return ($P1768)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<{ }>"  :subid("97_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1772
.annotate "line", 650
    new $P1771, 'ExceptionHandler'
    set_addr $P1771, control_1770
    $P1771."handle_types"(58)
    push_eh $P1771
    .lex "self", self
    .lex "$/", param_1772
.annotate "line", 651
    find_lex $P1773, "$/"
    find_lex $P1776, "$/"
    unless_null $P1776, vivify_526
    $P1776 = root_new ['parrot';'Hash']
  vivify_526:
    set $P1777, $P1776["pblock"]
    unless_null $P1777, vivify_527
    $P1777 = root_new ['parrot';'Hash']
  vivify_527:
    set $P1778, $P1777["blockoid"]
    unless_null $P1778, vivify_528
    $P1778 = root_new ['parrot';'Hash']
  vivify_528:
    set $P1779, $P1778["statementlist"]
    unless_null $P1779, vivify_529
    $P1779 = root_new ['parrot';'Hash']
  vivify_529:
    set $P1780, $P1779["statement"]
    unless_null $P1780, vivify_530
    new $P1780, "Undef"
  vivify_530:
    set $N1781, $P1780
    isgt $I1782, $N1781, 0.0
    if $I1782, if_1775
.annotate "line", 653
    $P1786 = "vivitype"("%")
    set $P1774, $P1786
.annotate "line", 651
    goto if_1775_end
  if_1775:
.annotate "line", 652
    find_lex $P1783, "$/"
    unless_null $P1783, vivify_531
    $P1783 = root_new ['parrot';'Hash']
  vivify_531:
    set $P1784, $P1783["pblock"]
    unless_null $P1784, vivify_532
    new $P1784, "Undef"
  vivify_532:
    $P1785 = $P1784."ast"()
    set $P1774, $P1785
  if_1775_end:
    $P1787 = $P1773."!make"($P1774)
.annotate "line", 650
    .return ($P1787)
  control_1770:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1788, exception, "payload"
    .return ($P1788)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<sigil>"  :subid("98_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1792
.annotate "line", 656
    new $P1791, 'ExceptionHandler'
    set_addr $P1791, control_1790
    $P1791."handle_types"(58)
    push_eh $P1791
    .lex "self", self
    .lex "$/", param_1792
.annotate "line", 657
    new $P1793, "Undef"
    .lex "$name", $P1793
    find_lex $P1796, "$/"
    unless_null $P1796, vivify_533
    $P1796 = root_new ['parrot';'Hash']
  vivify_533:
    set $P1797, $P1796["sigil"]
    unless_null $P1797, vivify_534
    new $P1797, "Undef"
  vivify_534:
    set $S1798, $P1797
    iseq $I1799, $S1798, "@"
    if $I1799, if_1795
.annotate "line", 658
    find_lex $P1803, "$/"
    unless_null $P1803, vivify_535
    $P1803 = root_new ['parrot';'Hash']
  vivify_535:
    set $P1804, $P1803["sigil"]
    unless_null $P1804, vivify_536
    new $P1804, "Undef"
  vivify_536:
    set $S1805, $P1804
    iseq $I1806, $S1805, "%"
    if $I1806, if_1802
    new $P1808, "String"
    assign $P1808, "item"
    set $P1801, $P1808
    goto if_1802_end
  if_1802:
    new $P1807, "String"
    assign $P1807, "hash"
    set $P1801, $P1807
  if_1802_end:
    set $P1794, $P1801
.annotate "line", 657
    goto if_1795_end
  if_1795:
    new $P1800, "String"
    assign $P1800, "list"
    set $P1794, $P1800
  if_1795_end:
    store_lex "$name", $P1794
.annotate "line", 660
    find_lex $P1809, "$/"
    get_hll_global $P1810, ["PAST"], "Op"
    find_lex $P1811, "$name"
    find_lex $P1812, "$/"
    unless_null $P1812, vivify_537
    $P1812 = root_new ['parrot';'Hash']
  vivify_537:
    set $P1813, $P1812["semilist"]
    unless_null $P1813, vivify_538
    new $P1813, "Undef"
  vivify_538:
    $P1814 = $P1813."ast"()
    $P1815 = $P1810."new"($P1814, "callmethod" :named("pasttype"), $P1811 :named("name"))
    $P1816 = $P1809."!make"($P1815)
.annotate "line", 656
    .return ($P1816)
  control_1790:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1817, exception, "payload"
    .return ($P1817)
.end


.namespace ["NQP";"Actions"]
.sub "semilist"  :subid("99_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1821
.annotate "line", 663
    new $P1820, 'ExceptionHandler'
    set_addr $P1820, control_1819
    $P1820."handle_types"(58)
    push_eh $P1820
    .lex "self", self
    .lex "$/", param_1821
    find_lex $P1822, "$/"
    find_lex $P1823, "$/"
    unless_null $P1823, vivify_539
    $P1823 = root_new ['parrot';'Hash']
  vivify_539:
    set $P1824, $P1823["statement"]
    unless_null $P1824, vivify_540
    new $P1824, "Undef"
  vivify_540:
    $P1825 = $P1824."ast"()
    $P1826 = $P1822."!make"($P1825)
    .return ($P1826)
  control_1819:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1827, exception, "payload"
    .return ($P1827)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<[ ]>"  :subid("100_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1831
.annotate "line", 665
    new $P1830, 'ExceptionHandler'
    set_addr $P1830, control_1829
    $P1830."handle_types"(58)
    push_eh $P1830
    .lex "self", self
    .lex "$/", param_1831
.annotate "line", 666
    find_lex $P1832, "$/"
    get_hll_global $P1833, ["PAST"], "Var"
    find_lex $P1834, "$/"
    unless_null $P1834, vivify_541
    $P1834 = root_new ['parrot';'Hash']
  vivify_541:
    set $P1835, $P1834["EXPR"]
    unless_null $P1835, vivify_542
    new $P1835, "Undef"
  vivify_542:
    $P1836 = $P1835."ast"()
.annotate "line", 668
    $P1837 = "vivitype"("@")
    $P1838 = $P1833."new"($P1836, "keyed_int" :named("scope"), "Undef" :named("viviself"), $P1837 :named("vivibase"))
.annotate "line", 666
    $P1839 = $P1832."!make"($P1838)
.annotate "line", 665
    .return ($P1839)
  control_1829:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1840, exception, "payload"
    .return ($P1840)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<{ }>"  :subid("101_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1844
.annotate "line", 671
    new $P1843, 'ExceptionHandler'
    set_addr $P1843, control_1842
    $P1843."handle_types"(58)
    push_eh $P1843
    .lex "self", self
    .lex "$/", param_1844
.annotate "line", 672
    find_lex $P1845, "$/"
    get_hll_global $P1846, ["PAST"], "Var"
    find_lex $P1847, "$/"
    unless_null $P1847, vivify_543
    $P1847 = root_new ['parrot';'Hash']
  vivify_543:
    set $P1848, $P1847["EXPR"]
    unless_null $P1848, vivify_544
    new $P1848, "Undef"
  vivify_544:
    $P1849 = $P1848."ast"()
.annotate "line", 674
    $P1850 = "vivitype"("%")
    $P1851 = $P1846."new"($P1849, "keyed" :named("scope"), "Undef" :named("viviself"), $P1850 :named("vivibase"))
.annotate "line", 672
    $P1852 = $P1845."!make"($P1851)
.annotate "line", 671
    .return ($P1852)
  control_1842:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1853, exception, "payload"
    .return ($P1853)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<ang>"  :subid("102_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1857
.annotate "line", 677
    new $P1856, 'ExceptionHandler'
    set_addr $P1856, control_1855
    $P1856."handle_types"(58)
    push_eh $P1856
    .lex "self", self
    .lex "$/", param_1857
.annotate "line", 678
    find_lex $P1858, "$/"
    get_hll_global $P1859, ["PAST"], "Var"
    find_lex $P1860, "$/"
    unless_null $P1860, vivify_545
    $P1860 = root_new ['parrot';'Hash']
  vivify_545:
    set $P1861, $P1860["quote_EXPR"]
    unless_null $P1861, vivify_546
    new $P1861, "Undef"
  vivify_546:
    $P1862 = $P1861."ast"()
.annotate "line", 680
    $P1863 = "vivitype"("%")
    $P1864 = $P1859."new"($P1862, "keyed" :named("scope"), "Undef" :named("viviself"), $P1863 :named("vivibase"))
.annotate "line", 678
    $P1865 = $P1858."!make"($P1864)
.annotate "line", 677
    .return ($P1865)
  control_1855:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1866, exception, "payload"
    .return ($P1866)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<( )>"  :subid("103_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1870
.annotate "line", 683
    new $P1869, 'ExceptionHandler'
    set_addr $P1869, control_1868
    $P1869."handle_types"(58)
    push_eh $P1869
    .lex "self", self
    .lex "$/", param_1870
.annotate "line", 684
    find_lex $P1871, "$/"
    find_lex $P1872, "$/"
    unless_null $P1872, vivify_547
    $P1872 = root_new ['parrot';'Hash']
  vivify_547:
    set $P1873, $P1872["arglist"]
    unless_null $P1873, vivify_548
    new $P1873, "Undef"
  vivify_548:
    $P1874 = $P1873."ast"()
    $P1875 = $P1871."!make"($P1874)
.annotate "line", 683
    .return ($P1875)
  control_1868:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1876, exception, "payload"
    .return ($P1876)
.end


.namespace ["NQP";"Actions"]
.sub "value"  :subid("104_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1880
.annotate "line", 687
    new $P1879, 'ExceptionHandler'
    set_addr $P1879, control_1878
    $P1879."handle_types"(58)
    push_eh $P1879
    .lex "self", self
    .lex "$/", param_1880
.annotate "line", 688
    find_lex $P1881, "$/"
    find_lex $P1884, "$/"
    unless_null $P1884, vivify_549
    $P1884 = root_new ['parrot';'Hash']
  vivify_549:
    set $P1885, $P1884["quote"]
    unless_null $P1885, vivify_550
    new $P1885, "Undef"
  vivify_550:
    if $P1885, if_1883
    find_lex $P1889, "$/"
    unless_null $P1889, vivify_551
    $P1889 = root_new ['parrot';'Hash']
  vivify_551:
    set $P1890, $P1889["number"]
    unless_null $P1890, vivify_552
    new $P1890, "Undef"
  vivify_552:
    $P1891 = $P1890."ast"()
    set $P1882, $P1891
    goto if_1883_end
  if_1883:
    find_lex $P1886, "$/"
    unless_null $P1886, vivify_553
    $P1886 = root_new ['parrot';'Hash']
  vivify_553:
    set $P1887, $P1886["quote"]
    unless_null $P1887, vivify_554
    new $P1887, "Undef"
  vivify_554:
    $P1888 = $P1887."ast"()
    set $P1882, $P1888
  if_1883_end:
    $P1892 = $P1881."!make"($P1882)
.annotate "line", 687
    .return ($P1892)
  control_1878:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1893, exception, "payload"
    .return ($P1893)
.end


.namespace ["NQP";"Actions"]
.sub "number"  :subid("105_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1897
.annotate "line", 691
    new $P1896, 'ExceptionHandler'
    set_addr $P1896, control_1895
    $P1896."handle_types"(58)
    push_eh $P1896
    .lex "self", self
    .lex "$/", param_1897
.annotate "line", 692
    new $P1898, "Undef"
    .lex "$value", $P1898
    find_lex $P1901, "$/"
    unless_null $P1901, vivify_555
    $P1901 = root_new ['parrot';'Hash']
  vivify_555:
    set $P1902, $P1901["dec_number"]
    unless_null $P1902, vivify_556
    new $P1902, "Undef"
  vivify_556:
    if $P1902, if_1900
    find_lex $P1906, "$/"
    unless_null $P1906, vivify_557
    $P1906 = root_new ['parrot';'Hash']
  vivify_557:
    set $P1907, $P1906["integer"]
    unless_null $P1907, vivify_558
    new $P1907, "Undef"
  vivify_558:
    $P1908 = $P1907."ast"()
    set $P1899, $P1908
    goto if_1900_end
  if_1900:
    find_lex $P1903, "$/"
    unless_null $P1903, vivify_559
    $P1903 = root_new ['parrot';'Hash']
  vivify_559:
    set $P1904, $P1903["dec_number"]
    unless_null $P1904, vivify_560
    new $P1904, "Undef"
  vivify_560:
    $P1905 = $P1904."ast"()
    set $P1899, $P1905
  if_1900_end:
    store_lex "$value", $P1899
.annotate "line", 693
    find_lex $P1910, "$/"
    unless_null $P1910, vivify_561
    $P1910 = root_new ['parrot';'Hash']
  vivify_561:
    set $P1911, $P1910["sign"]
    unless_null $P1911, vivify_562
    new $P1911, "Undef"
  vivify_562:
    set $S1912, $P1911
    iseq $I1913, $S1912, "-"
    unless $I1913, if_1909_end
    find_lex $P1914, "$value"
    neg $P1915, $P1914
    store_lex "$value", $P1915
  if_1909_end:
.annotate "line", 694
    find_lex $P1916, "$/"
    get_hll_global $P1917, ["PAST"], "Val"
    find_lex $P1918, "$value"
    $P1919 = $P1917."new"($P1918 :named("value"))
    $P1920 = $P1916."!make"($P1919)
.annotate "line", 691
    .return ($P1920)
  control_1895:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1921, exception, "payload"
    .return ($P1921)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<apos>"  :subid("106_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1925
.annotate "line", 697
    new $P1924, 'ExceptionHandler'
    set_addr $P1924, control_1923
    $P1924."handle_types"(58)
    push_eh $P1924
    .lex "self", self
    .lex "$/", param_1925
    find_lex $P1926, "$/"
    find_lex $P1927, "$/"
    unless_null $P1927, vivify_563
    $P1927 = root_new ['parrot';'Hash']
  vivify_563:
    set $P1928, $P1927["quote_EXPR"]
    unless_null $P1928, vivify_564
    new $P1928, "Undef"
  vivify_564:
    $P1929 = $P1928."ast"()
    $P1930 = $P1926."!make"($P1929)
    .return ($P1930)
  control_1923:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1931, exception, "payload"
    .return ($P1931)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<dblq>"  :subid("107_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1935
.annotate "line", 698
    new $P1934, 'ExceptionHandler'
    set_addr $P1934, control_1933
    $P1934."handle_types"(58)
    push_eh $P1934
    .lex "self", self
    .lex "$/", param_1935
    find_lex $P1936, "$/"
    find_lex $P1937, "$/"
    unless_null $P1937, vivify_565
    $P1937 = root_new ['parrot';'Hash']
  vivify_565:
    set $P1938, $P1937["quote_EXPR"]
    unless_null $P1938, vivify_566
    new $P1938, "Undef"
  vivify_566:
    $P1939 = $P1938."ast"()
    $P1940 = $P1936."!make"($P1939)
    .return ($P1940)
  control_1933:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1941, exception, "payload"
    .return ($P1941)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<qq>"  :subid("108_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1945
.annotate "line", 699
    new $P1944, 'ExceptionHandler'
    set_addr $P1944, control_1943
    $P1944."handle_types"(58)
    push_eh $P1944
    .lex "self", self
    .lex "$/", param_1945
    find_lex $P1946, "$/"
    find_lex $P1947, "$/"
    unless_null $P1947, vivify_567
    $P1947 = root_new ['parrot';'Hash']
  vivify_567:
    set $P1948, $P1947["quote_EXPR"]
    unless_null $P1948, vivify_568
    new $P1948, "Undef"
  vivify_568:
    $P1949 = $P1948."ast"()
    $P1950 = $P1946."!make"($P1949)
    .return ($P1950)
  control_1943:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1951, exception, "payload"
    .return ($P1951)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<q>"  :subid("109_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1955
.annotate "line", 700
    new $P1954, 'ExceptionHandler'
    set_addr $P1954, control_1953
    $P1954."handle_types"(58)
    push_eh $P1954
    .lex "self", self
    .lex "$/", param_1955
    find_lex $P1956, "$/"
    find_lex $P1957, "$/"
    unless_null $P1957, vivify_569
    $P1957 = root_new ['parrot';'Hash']
  vivify_569:
    set $P1958, $P1957["quote_EXPR"]
    unless_null $P1958, vivify_570
    new $P1958, "Undef"
  vivify_570:
    $P1959 = $P1958."ast"()
    $P1960 = $P1956."!make"($P1959)
    .return ($P1960)
  control_1953:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1961, exception, "payload"
    .return ($P1961)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q>"  :subid("110_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1965
.annotate "line", 701
    new $P1964, 'ExceptionHandler'
    set_addr $P1964, control_1963
    $P1964."handle_types"(58)
    push_eh $P1964
    .lex "self", self
    .lex "$/", param_1965
    find_lex $P1966, "$/"
    find_lex $P1967, "$/"
    unless_null $P1967, vivify_571
    $P1967 = root_new ['parrot';'Hash']
  vivify_571:
    set $P1968, $P1967["quote_EXPR"]
    unless_null $P1968, vivify_572
    new $P1968, "Undef"
  vivify_572:
    $P1969 = $P1968."ast"()
    $P1970 = $P1966."!make"($P1969)
    .return ($P1970)
  control_1963:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1971, exception, "payload"
    .return ($P1971)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q:PIR>"  :subid("111_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1975
.annotate "line", 702
    new $P1974, 'ExceptionHandler'
    set_addr $P1974, control_1973
    $P1974."handle_types"(58)
    push_eh $P1974
    .lex "self", self
    .lex "$/", param_1975
.annotate "line", 703
    find_lex $P1976, "$/"
    get_hll_global $P1977, ["PAST"], "Op"
    find_lex $P1978, "$/"
    unless_null $P1978, vivify_573
    $P1978 = root_new ['parrot';'Hash']
  vivify_573:
    set $P1979, $P1978["quote_EXPR"]
    unless_null $P1979, vivify_574
    new $P1979, "Undef"
  vivify_574:
    $P1980 = $P1979."ast"()
    $P1981 = $P1980."value"()
    find_lex $P1982, "$/"
    $P1983 = $P1977."new"($P1981 :named("inline"), "inline" :named("pasttype"), $P1982 :named("node"))
    $P1984 = $P1976."!make"($P1983)
.annotate "line", 702
    .return ($P1984)
  control_1973:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1985, exception, "payload"
    .return ($P1985)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym</ />"  :subid("112_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_1989
    .param pmc param_1990 :optional
    .param int has_param_1990 :opt_flag
.annotate "line", 708
    new $P1988, 'ExceptionHandler'
    set_addr $P1988, control_1987
    $P1988."handle_types"(58)
    push_eh $P1988
    .lex "self", self
    .lex "$/", param_1989
    if has_param_1990, optparam_575
    new $P1991, "Undef"
    set param_1990, $P1991
  optparam_575:
    .lex "$key", param_1990
.annotate "line", 718
    new $P1992, "Undef"
    .lex "$regex", $P1992
.annotate "line", 720
    new $P1993, "Undef"
    .lex "$past", $P1993
.annotate "line", 709
    find_lex $P1995, "$key"
    set $S1996, $P1995
    iseq $I1997, $S1996, "open"
    unless $I1997, if_1994_end
.annotate "line", 710

            null $P0
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate "line", 714
    get_global $P1998, "@BLOCK"
    unless_null $P1998, vivify_576
    $P1998 = root_new ['parrot';'ResizablePMCArray']
  vivify_576:
    set $P1999, $P1998[0]
    unless_null $P1999, vivify_577
    new $P1999, "Undef"
  vivify_577:
    $P1999."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate "line", 715
    get_global $P2000, "@BLOCK"
    unless_null $P2000, vivify_578
    $P2000 = root_new ['parrot';'ResizablePMCArray']
  vivify_578:
    set $P2001, $P2000[0]
    unless_null $P2001, vivify_579
    new $P2001, "Undef"
  vivify_579:
    $P2001."symbol"("$/", "lexical" :named("scope"))
.annotate "line", 716
    new $P2002, "Exception"
    set $P2002['type'], 58
    new $P2003, "Integer"
    assign $P2003, 0
    setattribute $P2002, 'payload', $P2003
    throw $P2002
  if_1994_end:
.annotate "line", 719
    get_hll_global $P2004, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P2005, "$/"
    unless_null $P2005, vivify_580
    $P2005 = root_new ['parrot';'Hash']
  vivify_580:
    set $P2006, $P2005["p6regex"]
    unless_null $P2006, vivify_581
    new $P2006, "Undef"
  vivify_581:
    $P2007 = $P2006."ast"()
    get_global $P2008, "@BLOCK"
    $P2009 = $P2008."shift"()
    $P2010 = $P2004($P2007, $P2009)
    store_lex "$regex", $P2010
.annotate "line", 721
    get_hll_global $P2011, ["PAST"], "Op"
.annotate "line", 723
    get_hll_global $P2012, ["PAST"], "Var"
    new $P2013, "ResizablePMCArray"
    push $P2013, "Regex"
    $P2014 = $P2012."new"("Regex" :named("name"), $P2013 :named("namespace"), "package" :named("scope"))
    find_lex $P2015, "$regex"
    $P2016 = $P2011."new"($P2014, $P2015, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate "line", 721
    store_lex "$past", $P2016
.annotate "line", 727
    find_lex $P2017, "$regex"
    find_lex $P2018, "$past"
    unless_null $P2018, vivify_582
    $P2018 = root_new ['parrot';'Hash']
    store_lex "$past", $P2018
  vivify_582:
    set $P2018["sink"], $P2017
.annotate "line", 728
    find_lex $P2019, "$/"
    find_lex $P2020, "$past"
    $P2021 = $P2019."!make"($P2020)
.annotate "line", 708
    .return ($P2021)
  control_1987:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2022, exception, "payload"
    .return ($P2022)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<$>"  :subid("113_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_2026
.annotate "line", 731
    new $P2025, 'ExceptionHandler'
    set_addr $P2025, control_2024
    $P2025."handle_types"(58)
    push_eh $P2025
    .lex "self", self
    .lex "$/", param_2026
    find_lex $P2027, "$/"
    find_lex $P2028, "$/"
    unless_null $P2028, vivify_583
    $P2028 = root_new ['parrot';'Hash']
  vivify_583:
    set $P2029, $P2028["variable"]
    unless_null $P2029, vivify_584
    new $P2029, "Undef"
  vivify_584:
    $P2030 = $P2029."ast"()
    $P2031 = $P2027."!make"($P2030)
    .return ($P2031)
  control_2024:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2032, exception, "payload"
    .return ($P2032)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<{ }>"  :subid("114_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_2036
.annotate "line", 732
    new $P2035, 'ExceptionHandler'
    set_addr $P2035, control_2034
    $P2035."handle_types"(58)
    push_eh $P2035
    .lex "self", self
    .lex "$/", param_2036
.annotate "line", 733
    find_lex $P2037, "$/"
    get_hll_global $P2038, ["PAST"], "Op"
.annotate "line", 734
    find_lex $P2039, "$/"
    unless_null $P2039, vivify_585
    $P2039 = root_new ['parrot';'Hash']
  vivify_585:
    set $P2040, $P2039["block"]
    unless_null $P2040, vivify_586
    new $P2040, "Undef"
  vivify_586:
    $P2041 = $P2040."ast"()
    $P2042 = "block_immediate"($P2041)
    find_lex $P2043, "$/"
    $P2044 = $P2038."new"($P2042, "set S*" :named("pirop"), $P2043 :named("node"))
.annotate "line", 733
    $P2045 = $P2037."!make"($P2044)
.annotate "line", 732
    .return ($P2045)
  control_2034:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2046, exception, "payload"
    .return ($P2046)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<.>"  :subid("115_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_2050
.annotate "line", 740
    new $P2049, 'ExceptionHandler'
    set_addr $P2049, control_2048
    $P2049."handle_types"(58)
    push_eh $P2049
    .lex "self", self
    .lex "$/", param_2050
    find_lex $P2051, "$/"
    find_lex $P2052, "$/"
    unless_null $P2052, vivify_587
    $P2052 = root_new ['parrot';'Hash']
  vivify_587:
    set $P2053, $P2052["dotty"]
    unless_null $P2053, vivify_588
    new $P2053, "Undef"
  vivify_588:
    $P2054 = $P2053."ast"()
    $P2055 = $P2051."!make"($P2054)
    .return ($P2055)
  control_2048:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2056, exception, "payload"
    .return ($P2056)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<++>"  :subid("116_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_2060
.annotate "line", 742
    new $P2059, 'ExceptionHandler'
    set_addr $P2059, control_2058
    $P2059."handle_types"(58)
    push_eh $P2059
    .lex "self", self
    .lex "$/", param_2060
.annotate "line", 743
    find_lex $P2061, "$/"
    get_hll_global $P2062, ["PAST"], "Op"
.annotate "line", 744
    new $P2063, "ResizablePMCArray"
    push $P2063, "    clone %r, %0"
    push $P2063, "    inc %0"
    $P2064 = $P2062."new"("postfix:<++>" :named("name"), $P2063 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 743
    $P2065 = $P2061."!make"($P2064)
.annotate "line", 742
    .return ($P2065)
  control_2058:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2066, exception, "payload"
    .return ($P2066)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<-->"  :subid("117_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_2070
.annotate "line", 748
    new $P2069, 'ExceptionHandler'
    set_addr $P2069, control_2068
    $P2069."handle_types"(58)
    push_eh $P2069
    .lex "self", self
    .lex "$/", param_2070
.annotate "line", 749
    find_lex $P2071, "$/"
    get_hll_global $P2072, ["PAST"], "Op"
.annotate "line", 750
    new $P2073, "ResizablePMCArray"
    push $P2073, "    clone %r, %0"
    push $P2073, "    dec %0"
    $P2074 = $P2072."new"("postfix:<-->" :named("name"), $P2073 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 749
    $P2075 = $P2071."!make"($P2074)
.annotate "line", 748
    .return ($P2075)
  control_2068:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2076, exception, "payload"
    .return ($P2076)
.end


.namespace ["NQP";"Actions"]
.sub "prefix:sym<make>"  :subid("118_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_2080
.annotate "line", 754
    new $P2079, 'ExceptionHandler'
    set_addr $P2079, control_2078
    $P2079."handle_types"(58)
    push_eh $P2079
    .lex "self", self
    .lex "$/", param_2080
.annotate "line", 755
    find_lex $P2081, "$/"
    get_hll_global $P2082, ["PAST"], "Op"
.annotate "line", 756
    get_hll_global $P2083, ["PAST"], "Var"
    $P2084 = $P2083."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P2085, "$/"
    $P2086 = $P2082."new"($P2084, "callmethod" :named("pasttype"), "!make" :named("name"), $P2085 :named("node"))
.annotate "line", 755
    $P2087 = $P2081."!make"($P2086)
.annotate "line", 754
    .return ($P2087)
  control_2078:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2088, exception, "payload"
    .return ($P2088)
.end


.namespace ["NQP";"Actions"]
.sub "infix:sym<~~>"  :subid("119_1271336409.53729") :method :outer("11_1271336409.53729")
    .param pmc param_2092
.annotate "line", 763
    new $P2091, 'ExceptionHandler'
    set_addr $P2091, control_2090
    $P2091."handle_types"(58)
    push_eh $P2091
    .lex "self", self
    .lex "$/", param_2092
.annotate "line", 764
    find_lex $P2093, "$/"
    get_hll_global $P2094, ["PAST"], "Op"
    find_lex $P2095, "$/"
    $P2096 = $P2094."new"("callmethod" :named("pasttype"), "ACCEPTS" :named("name"), $P2095 :named("node"))
    $P2097 = $P2093."!make"($P2096)
.annotate "line", 763
    .return ($P2097)
  control_2090:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2098, exception, "payload"
    .return ($P2098)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block2099"  :subid("120_1271336409.53729") :outer("11_1271336409.53729")
.annotate "line", 768
    .const 'Sub' $P2135 = "124_1271336409.53729" 
    capture_lex $P2135
    .const 'Sub' $P2125 = "123_1271336409.53729" 
    capture_lex $P2125
    .const 'Sub' $P2115 = "122_1271336409.53729" 
    capture_lex $P2115
    .const 'Sub' $P2101 = "121_1271336409.53729" 
    capture_lex $P2101
.annotate "line", 779
    .const 'Sub' $P2135 = "124_1271336409.53729" 
    capture_lex $P2135
.annotate "line", 768
    .return ($P2135)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<:my>"  :subid("121_1271336409.53729") :method :outer("120_1271336409.53729")
    .param pmc param_2104
.annotate "line", 770
    new $P2103, 'ExceptionHandler'
    set_addr $P2103, control_2102
    $P2103."handle_types"(58)
    push_eh $P2103
    .lex "self", self
    .lex "$/", param_2104
.annotate "line", 771
    new $P2105, "Undef"
    .lex "$past", $P2105
    find_lex $P2106, "$/"
    unless_null $P2106, vivify_589
    $P2106 = root_new ['parrot';'Hash']
  vivify_589:
    set $P2107, $P2106["statement"]
    unless_null $P2107, vivify_590
    new $P2107, "Undef"
  vivify_590:
    $P2108 = $P2107."ast"()
    store_lex "$past", $P2108
.annotate "line", 772
    find_lex $P2109, "$/"
    get_hll_global $P2110, ["PAST"], "Regex"
    find_lex $P2111, "$past"
    $P2112 = $P2110."new"($P2111, "pastnode" :named("pasttype"))
    $P2113 = $P2109."!make"($P2112)
.annotate "line", 770
    .return ($P2113)
  control_2102:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2114, exception, "payload"
    .return ($P2114)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<{ }>"  :subid("122_1271336409.53729") :method :outer("120_1271336409.53729")
    .param pmc param_2118
.annotate "line", 775
    new $P2117, 'ExceptionHandler'
    set_addr $P2117, control_2116
    $P2117."handle_types"(58)
    push_eh $P2117
    .lex "self", self
    .lex "$/", param_2118
    find_lex $P2119, "$/"
    find_lex $P2120, "$/"
    unless_null $P2120, vivify_591
    $P2120 = root_new ['parrot';'Hash']
  vivify_591:
    set $P2121, $P2120["codeblock"]
    unless_null $P2121, vivify_592
    new $P2121, "Undef"
  vivify_592:
    $P2122 = $P2121."ast"()
    $P2123 = $P2119."!make"($P2122)
    .return ($P2123)
  control_2116:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2124, exception, "payload"
    .return ($P2124)
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<{ }>"  :subid("123_1271336409.53729") :method :outer("120_1271336409.53729")
    .param pmc param_2128
.annotate "line", 777
    new $P2127, 'ExceptionHandler'
    set_addr $P2127, control_2126
    $P2127."handle_types"(58)
    push_eh $P2127
    .lex "self", self
    .lex "$/", param_2128
    find_lex $P2129, "$/"
    find_lex $P2130, "$/"
    unless_null $P2130, vivify_593
    $P2130 = root_new ['parrot';'Hash']
  vivify_593:
    set $P2131, $P2130["codeblock"]
    unless_null $P2131, vivify_594
    new $P2131, "Undef"
  vivify_594:
    $P2132 = $P2131."ast"()
    $P2133 = $P2129."!make"($P2132)
    .return ($P2133)
  control_2126:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2134, exception, "payload"
    .return ($P2134)
.end


.namespace ["NQP";"RegexActions"]
.sub "codeblock"  :subid("124_1271336409.53729") :method :outer("120_1271336409.53729")
    .param pmc param_2138
.annotate "line", 779
    new $P2137, 'ExceptionHandler'
    set_addr $P2137, control_2136
    $P2137."handle_types"(58)
    push_eh $P2137
    .lex "self", self
    .lex "$/", param_2138
.annotate "line", 780
    new $P2139, "Undef"
    .lex "$block", $P2139
.annotate "line", 782
    new $P2140, "Undef"
    .lex "$past", $P2140
.annotate "line", 780
    find_lex $P2141, "$/"
    unless_null $P2141, vivify_595
    $P2141 = root_new ['parrot';'Hash']
  vivify_595:
    set $P2142, $P2141["block"]
    unless_null $P2142, vivify_596
    new $P2142, "Undef"
  vivify_596:
    $P2143 = $P2142."ast"()
    store_lex "$block", $P2143
.annotate "line", 781
    find_lex $P2144, "$block"
    $P2144."blocktype"("immediate")
.annotate "line", 783
    get_hll_global $P2145, ["PAST"], "Regex"
.annotate "line", 784
    get_hll_global $P2146, ["PAST"], "Stmts"
.annotate "line", 785
    get_hll_global $P2147, ["PAST"], "Op"
.annotate "line", 786
    get_hll_global $P2148, ["PAST"], "Var"
    $P2149 = $P2148."new"("$/" :named("name"))
.annotate "line", 787
    get_hll_global $P2150, ["PAST"], "Op"
.annotate "line", 788
    get_hll_global $P2151, ["PAST"], "Var"
    $P2152 = $P2151."new"(unicode:"$\x{a2}" :named("name"))
    $P2153 = $P2150."new"($P2152, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 787
    $P2154 = $P2147."new"($P2149, $P2153, "bind" :named("pasttype"))
.annotate "line", 785
    find_lex $P2155, "$block"
    $P2156 = $P2146."new"($P2154, $P2155)
.annotate "line", 784
    $P2157 = $P2145."new"($P2156, "pastnode" :named("pasttype"))
.annotate "line", 783
    store_lex "$past", $P2157
.annotate "line", 798
    find_lex $P2158, "$/"
    find_lex $P2159, "$past"
    $P2160 = $P2158."!make"($P2159)
.annotate "line", 779
    .return ($P2160)
  control_2136:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2161, exception, "payload"
    .return ($P2161)
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
