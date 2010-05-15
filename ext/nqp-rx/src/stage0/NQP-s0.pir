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
.sub "_block11"  :anon :subid("10_1273884026.76819")
.annotate 'line', 0
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
.annotate 'line', 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
    $P1330 = $P14()
.annotate 'line', 1
    .return ($P1330)
.end


.namespace []
.sub "" :load :init :subid("post339") :outer("10_1273884026.76819")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1273884026.76819" 
    .local pmc block
    set block, $P12
    $P1331 = get_root_global ["parrot"], "P6metaclass"
    $P1331."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1273884026.76819") :outer("10_1273884026.76819")
.annotate 'line', 4
    get_hll_global $P1274, ["NQP";"Regex"], "_block1273" 
    capture_lex $P1274
    .const 'Sub' $P1260 = "325_1273884026.76819" 
    capture_lex $P1260
    .const 'Sub' $P1254 = "323_1273884026.76819" 
    capture_lex $P1254
    .const 'Sub' $P1248 = "321_1273884026.76819" 
    capture_lex $P1248
    .const 'Sub' $P1242 = "319_1273884026.76819" 
    capture_lex $P1242
    .const 'Sub' $P1236 = "317_1273884026.76819" 
    capture_lex $P1236
    .const 'Sub' $P1230 = "315_1273884026.76819" 
    capture_lex $P1230
    .const 'Sub' $P1223 = "313_1273884026.76819" 
    capture_lex $P1223
    .const 'Sub' $P1216 = "311_1273884026.76819" 
    capture_lex $P1216
    .const 'Sub' $P1209 = "309_1273884026.76819" 
    capture_lex $P1209
    .const 'Sub' $P1202 = "307_1273884026.76819" 
    capture_lex $P1202
    .const 'Sub' $P1196 = "305_1273884026.76819" 
    capture_lex $P1196
    .const 'Sub' $P1189 = "303_1273884026.76819" 
    capture_lex $P1189
    .const 'Sub' $P1182 = "301_1273884026.76819" 
    capture_lex $P1182
    .const 'Sub' $P1175 = "299_1273884026.76819" 
    capture_lex $P1175
    .const 'Sub' $P1168 = "297_1273884026.76819" 
    capture_lex $P1168
    .const 'Sub' $P1161 = "295_1273884026.76819" 
    capture_lex $P1161
    .const 'Sub' $P1154 = "293_1273884026.76819" 
    capture_lex $P1154
    .const 'Sub' $P1147 = "291_1273884026.76819" 
    capture_lex $P1147
    .const 'Sub' $P1140 = "289_1273884026.76819" 
    capture_lex $P1140
    .const 'Sub' $P1133 = "287_1273884026.76819" 
    capture_lex $P1133
    .const 'Sub' $P1126 = "285_1273884026.76819" 
    capture_lex $P1126
    .const 'Sub' $P1119 = "283_1273884026.76819" 
    capture_lex $P1119
    .const 'Sub' $P1112 = "281_1273884026.76819" 
    capture_lex $P1112
    .const 'Sub' $P1105 = "279_1273884026.76819" 
    capture_lex $P1105
    .const 'Sub' $P1098 = "277_1273884026.76819" 
    capture_lex $P1098
    .const 'Sub' $P1091 = "275_1273884026.76819" 
    capture_lex $P1091
    .const 'Sub' $P1084 = "273_1273884026.76819" 
    capture_lex $P1084
    .const 'Sub' $P1077 = "271_1273884026.76819" 
    capture_lex $P1077
    .const 'Sub' $P1070 = "269_1273884026.76819" 
    capture_lex $P1070
    .const 'Sub' $P1063 = "267_1273884026.76819" 
    capture_lex $P1063
    .const 'Sub' $P1056 = "265_1273884026.76819" 
    capture_lex $P1056
    .const 'Sub' $P1049 = "263_1273884026.76819" 
    capture_lex $P1049
    .const 'Sub' $P1042 = "261_1273884026.76819" 
    capture_lex $P1042
    .const 'Sub' $P1035 = "259_1273884026.76819" 
    capture_lex $P1035
    .const 'Sub' $P1028 = "257_1273884026.76819" 
    capture_lex $P1028
    .const 'Sub' $P1021 = "255_1273884026.76819" 
    capture_lex $P1021
    .const 'Sub' $P1014 = "253_1273884026.76819" 
    capture_lex $P1014
    .const 'Sub' $P1008 = "251_1273884026.76819" 
    capture_lex $P1008
    .const 'Sub' $P1001 = "249_1273884026.76819" 
    capture_lex $P1001
    .const 'Sub' $P994 = "247_1273884026.76819" 
    capture_lex $P994
    .const 'Sub' $P987 = "245_1273884026.76819" 
    capture_lex $P987
    .const 'Sub' $P980 = "243_1273884026.76819" 
    capture_lex $P980
    .const 'Sub' $P973 = "241_1273884026.76819" 
    capture_lex $P973
    .const 'Sub' $P966 = "239_1273884026.76819" 
    capture_lex $P966
    .const 'Sub' $P959 = "237_1273884026.76819" 
    capture_lex $P959
    .const 'Sub' $P953 = "235_1273884026.76819" 
    capture_lex $P953
    .const 'Sub' $P947 = "233_1273884026.76819" 
    capture_lex $P947
    .const 'Sub' $P942 = "231_1273884026.76819" 
    capture_lex $P942
    .const 'Sub' $P936 = "229_1273884026.76819" 
    capture_lex $P936
    .const 'Sub' $P930 = "227_1273884026.76819" 
    capture_lex $P930
    .const 'Sub' $P925 = "225_1273884026.76819" 
    capture_lex $P925
    .const 'Sub' $P920 = "223_1273884026.76819" 
    capture_lex $P920
    .const 'Sub' $P913 = "221_1273884026.76819" 
    capture_lex $P913
    .const 'Sub' $P905 = "219_1273884026.76819" 
    capture_lex $P905
    .const 'Sub' $P900 = "217_1273884026.76819" 
    capture_lex $P900
    .const 'Sub' $P895 = "215_1273884026.76819" 
    capture_lex $P895
    .const 'Sub' $P890 = "213_1273884026.76819" 
    capture_lex $P890
    .const 'Sub' $P882 = "211_1273884026.76819" 
    capture_lex $P882
    .const 'Sub' $P874 = "209_1273884026.76819" 
    capture_lex $P874
    .const 'Sub' $P869 = "207_1273884026.76819" 
    capture_lex $P869
    .const 'Sub' $P864 = "205_1273884026.76819" 
    capture_lex $P864
    .const 'Sub' $P859 = "203_1273884026.76819" 
    capture_lex $P859
    .const 'Sub' $P853 = "201_1273884026.76819" 
    capture_lex $P853
    .const 'Sub' $P847 = "199_1273884026.76819" 
    capture_lex $P847
    .const 'Sub' $P841 = "197_1273884026.76819" 
    capture_lex $P841
    .const 'Sub' $P835 = "195_1273884026.76819" 
    capture_lex $P835
    .const 'Sub' $P829 = "193_1273884026.76819" 
    capture_lex $P829
    .const 'Sub' $P824 = "191_1273884026.76819" 
    capture_lex $P824
    .const 'Sub' $P819 = "189_1273884026.76819" 
    capture_lex $P819
    .const 'Sub' $P806 = "185_1273884026.76819" 
    capture_lex $P806
    .const 'Sub' $P798 = "183_1273884026.76819" 
    capture_lex $P798
    .const 'Sub' $P792 = "181_1273884026.76819" 
    capture_lex $P792
    .const 'Sub' $P785 = "179_1273884026.76819" 
    capture_lex $P785
    .const 'Sub' $P779 = "177_1273884026.76819" 
    capture_lex $P779
    .const 'Sub' $P771 = "175_1273884026.76819" 
    capture_lex $P771
    .const 'Sub' $P763 = "173_1273884026.76819" 
    capture_lex $P763
    .const 'Sub' $P757 = "171_1273884026.76819" 
    capture_lex $P757
    .const 'Sub' $P751 = "169_1273884026.76819" 
    capture_lex $P751
    .const 'Sub' $P736 = "165_1273884026.76819" 
    capture_lex $P736
    .const 'Sub' $P699 = "163_1273884026.76819" 
    capture_lex $P699
    .const 'Sub' $P691 = "161_1273884026.76819" 
    capture_lex $P691
    .const 'Sub' $P685 = "159_1273884026.76819" 
    capture_lex $P685
    .const 'Sub' $P675 = "157_1273884026.76819" 
    capture_lex $P675
    .const 'Sub' $P660 = "155_1273884026.76819" 
    capture_lex $P660
    .const 'Sub' $P651 = "153_1273884026.76819" 
    capture_lex $P651
    .const 'Sub' $P632 = "151_1273884026.76819" 
    capture_lex $P632
    .const 'Sub' $P608 = "149_1273884026.76819" 
    capture_lex $P608
    .const 'Sub' $P601 = "147_1273884026.76819" 
    capture_lex $P601
    .const 'Sub' $P594 = "145_1273884026.76819" 
    capture_lex $P594
    .const 'Sub' $P584 = "141_1273884026.76819" 
    capture_lex $P584
    .const 'Sub' $P573 = "139_1273884026.76819" 
    capture_lex $P573
    .const 'Sub' $P566 = "137_1273884026.76819" 
    capture_lex $P566
    .const 'Sub' $P559 = "135_1273884026.76819" 
    capture_lex $P559
    .const 'Sub' $P552 = "133_1273884026.76819" 
    capture_lex $P552
    .const 'Sub' $P525 = "129_1273884026.76819" 
    capture_lex $P525
    .const 'Sub' $P516 = "127_1273884026.76819" 
    capture_lex $P516
    .const 'Sub' $P509 = "125_1273884026.76819" 
    capture_lex $P509
    .const 'Sub' $P500 = "121_1273884026.76819" 
    capture_lex $P500
    .const 'Sub' $P495 = "119_1273884026.76819" 
    capture_lex $P495
    .const 'Sub' $P483 = "117_1273884026.76819" 
    capture_lex $P483
    .const 'Sub' $P471 = "115_1273884026.76819" 
    capture_lex $P471
    .const 'Sub' $P463 = "113_1273884026.76819" 
    capture_lex $P463
    .const 'Sub' $P458 = "111_1273884026.76819" 
    capture_lex $P458
    .const 'Sub' $P452 = "109_1273884026.76819" 
    capture_lex $P452
    .const 'Sub' $P446 = "107_1273884026.76819" 
    capture_lex $P446
    .const 'Sub' $P440 = "105_1273884026.76819" 
    capture_lex $P440
    .const 'Sub' $P434 = "103_1273884026.76819" 
    capture_lex $P434
    .const 'Sub' $P428 = "101_1273884026.76819" 
    capture_lex $P428
    .const 'Sub' $P422 = "99_1273884026.76819" 
    capture_lex $P422
    .const 'Sub' $P416 = "97_1273884026.76819" 
    capture_lex $P416
    .const 'Sub' $P410 = "95_1273884026.76819" 
    capture_lex $P410
    .const 'Sub' $P402 = "93_1273884026.76819" 
    capture_lex $P402
    .const 'Sub' $P394 = "91_1273884026.76819" 
    capture_lex $P394
    .const 'Sub' $P382 = "87_1273884026.76819" 
    capture_lex $P382
    .const 'Sub' $P374 = "85_1273884026.76819" 
    capture_lex $P374
    .const 'Sub' $P364 = "81_1273884026.76819" 
    capture_lex $P364
    .const 'Sub' $P357 = "79_1273884026.76819" 
    capture_lex $P357
    .const 'Sub' $P350 = "77_1273884026.76819" 
    capture_lex $P350
    .const 'Sub' $P338 = "73_1273884026.76819" 
    capture_lex $P338
    .const 'Sub' $P330 = "71_1273884026.76819" 
    capture_lex $P330
    .const 'Sub' $P322 = "69_1273884026.76819" 
    capture_lex $P322
    .const 'Sub' $P302 = "67_1273884026.76819" 
    capture_lex $P302
    .const 'Sub' $P293 = "65_1273884026.76819" 
    capture_lex $P293
    .const 'Sub' $P275 = "62_1273884026.76819" 
    capture_lex $P275
    .const 'Sub' $P255 = "60_1273884026.76819" 
    capture_lex $P255
    .const 'Sub' $P246 = "56_1273884026.76819" 
    capture_lex $P246
    .const 'Sub' $P241 = "54_1273884026.76819" 
    capture_lex $P241
    .const 'Sub' $P232 = "50_1273884026.76819" 
    capture_lex $P232
    .const 'Sub' $P227 = "48_1273884026.76819" 
    capture_lex $P227
    .const 'Sub' $P219 = "46_1273884026.76819" 
    capture_lex $P219
    .const 'Sub' $P212 = "44_1273884026.76819" 
    capture_lex $P212
    .const 'Sub' $P206 = "42_1273884026.76819" 
    capture_lex $P206
    .const 'Sub' $P198 = "40_1273884026.76819" 
    capture_lex $P198
    .const 'Sub' $P192 = "38_1273884026.76819" 
    capture_lex $P192
    .const 'Sub' $P186 = "36_1273884026.76819" 
    capture_lex $P186
    .const 'Sub' $P170 = "33_1273884026.76819" 
    capture_lex $P170
    .const 'Sub' $P157 = "31_1273884026.76819" 
    capture_lex $P157
    .const 'Sub' $P150 = "29_1273884026.76819" 
    capture_lex $P150
    .const 'Sub' $P100 = "26_1273884026.76819" 
    capture_lex $P100
    .const 'Sub' $P82 = "23_1273884026.76819" 
    capture_lex $P82
    .const 'Sub' $P68 = "21_1273884026.76819" 
    capture_lex $P68
    .const 'Sub' $P54 = "19_1273884026.76819" 
    capture_lex $P54
    .const 'Sub' $P46 = "17_1273884026.76819" 
    capture_lex $P46
    .const 'Sub' $P39 = "15_1273884026.76819" 
    capture_lex $P39
    .const 'Sub' $P33 = "13_1273884026.76819" 
    capture_lex $P33
    .const 'Sub' $P15 = "12_1273884026.76819" 
    capture_lex $P15
.annotate 'line', 540
    get_hll_global $P1274, ["NQP";"Regex"], "_block1273" 
    capture_lex $P1274
    $P1313 = $P1274()
.annotate 'line', 4
    .return ($P1313)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post340") :outer("11_1273884026.76819")
.annotate 'line', 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 424
    get_hll_global $P1314, ["NQP"], "Grammar"
    $P1314."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate 'line', 425
    get_hll_global $P1315, ["NQP"], "Grammar"
    $P1315."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate 'line', 426
    get_hll_global $P1316, ["NQP"], "Grammar"
    $P1316."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate 'line', 427
    get_hll_global $P1317, ["NQP"], "Grammar"
    $P1317."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate 'line', 428
    get_hll_global $P1318, ["NQP"], "Grammar"
    $P1318."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate 'line', 429
    get_hll_global $P1319, ["NQP"], "Grammar"
    $P1319."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate 'line', 430
    get_hll_global $P1320, ["NQP"], "Grammar"
    $P1320."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate 'line', 431
    get_hll_global $P1321, ["NQP"], "Grammar"
    $P1321."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate 'line', 432
    get_hll_global $P1322, ["NQP"], "Grammar"
    $P1322."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate 'line', 433
    get_hll_global $P1323, ["NQP"], "Grammar"
    $P1323."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate 'line', 434
    get_hll_global $P1324, ["NQP"], "Grammar"
    $P1324."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate 'line', 435
    get_hll_global $P1325, ["NQP"], "Grammar"
    $P1325."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate 'line', 436
    get_hll_global $P1326, ["NQP"], "Grammar"
    $P1326."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate 'line', 437
    get_hll_global $P1327, ["NQP"], "Grammar"
    $P1327."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate 'line', 438
    get_hll_global $P1328, ["NQP"], "Grammar"
    $P1328."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate 'line', 423
    $P1329 = get_root_global ["parrot"], "P6metaclass"
    $P1329."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "TOP"  :subid("12_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(57)
    push_eh $P17
    .lex "self", self
.annotate 'line', 5
    $P18 = root_new ['parrot';'Hash']
    .lex "%*LANG", $P18
.annotate 'line', 10
    new $P19, "Undef"
    .lex "$*SCOPE", $P19
.annotate 'line', 4
    find_lex $P20, "%*LANG"
    unless_null $P20, vivify_341
    get_hll_global $P20, "%LANG"
    unless_null $P20, vivify_342
    die "Contextual %*LANG not found"
  vivify_342:
  vivify_341:
.annotate 'line', 6
    get_hll_global $P21, ["NQP"], "Regex"
    find_lex $P22, "%*LANG"
    unless_null $P22, vivify_343
    get_hll_global $P22, "%LANG"
    unless_null $P22, vivify_344
    die "Contextual %*LANG not found"
  vivify_344:
    store_lex "%*LANG", $P22
  vivify_343:
    set $P22["Regex"], $P21
.annotate 'line', 7
    get_hll_global $P23, ["NQP"], "RegexActions"
    find_lex $P24, "%*LANG"
    unless_null $P24, vivify_345
    get_hll_global $P24, "%LANG"
    unless_null $P24, vivify_346
    die "Contextual %*LANG not found"
  vivify_346:
    store_lex "%*LANG", $P24
  vivify_345:
    set $P24["Regex-actions"], $P23
.annotate 'line', 8
    get_hll_global $P25, ["NQP"], "Grammar"
    find_lex $P26, "%*LANG"
    unless_null $P26, vivify_347
    get_hll_global $P26, "%LANG"
    unless_null $P26, vivify_348
    die "Contextual %*LANG not found"
  vivify_348:
    store_lex "%*LANG", $P26
  vivify_347:
    set $P26["MAIN"], $P25
.annotate 'line', 9
    get_hll_global $P27, ["NQP"], "Actions"
    find_lex $P28, "%*LANG"
    unless_null $P28, vivify_349
    get_hll_global $P28, "%LANG"
    unless_null $P28, vivify_350
    die "Contextual %*LANG not found"
  vivify_350:
    store_lex "%*LANG", $P28
  vivify_349:
    set $P28["MAIN-actions"], $P27
.annotate 'line', 10
    new $P29, "String"
    assign $P29, ""
    store_lex "$*SCOPE", $P29
.annotate 'line', 11
    find_lex $P30, "self"
    $P31 = $P30."comp_unit"()
.annotate 'line', 4
    .return ($P31)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P32, exception, "payload"
    .return ($P32)
.end


.namespace ["NQP";"Grammar"]
.sub "identifier"  :subid("13_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
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
.annotate 'line', 16
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
.annotate 'line', 4
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
.sub "!PREFIX__identifier"  :subid("14_1273884026.76819") :method
.annotate 'line', 4
    $P36 = self."!PREFIX__!subrule"("ident", "")
    new $P37, "ResizablePMCArray"
    push $P37, $P36
    .return ($P37)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
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
.annotate 'line', 18
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
.annotate 'line', 4
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
.sub "!PREFIX__name"  :subid("16_1273884026.76819") :method
.annotate 'line', 4
    new $P42, "ResizablePMCArray"
    push $P42, ""
    .return ($P42)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
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
.annotate 'line', 21
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
.annotate 'line', 20
  # rx pass
    rx47_cur."!cursor_pass"(rx47_pos, "deflongname")
    rx47_cur."!cursor_debug"("PASS  ", "deflongname", " at pos=", rx47_pos)
    .return (rx47_cur)
  rx47_fail:
.annotate 'line', 4
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
.sub "!PREFIX__deflongname"  :subid("18_1273884026.76819") :method
.annotate 'line', 4
    $P49 = self."!PREFIX__!subrule"("identifier", "")
    new $P50, "ResizablePMCArray"
    push $P50, $P49
    .return ($P50)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
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
.annotate 'line', 28
  # rx rxquantr59 ** 0..1
    set_addr $I67, rxquantr59_done
    rx55_cur."!mark_push"(0, rx55_pos, $I67)
  rxquantr59_loop:
  alt60_0:
.annotate 'line', 25
    set_addr $I10, alt60_1
    rx55_cur."!mark_push"(0, rx55_pos, $I10)
.annotate 'line', 26
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
.annotate 'line', 27
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
.annotate 'line', 28
    (rx55_rep) = rx55_cur."!mark_commit"($I67)
  rxquantr59_done:
.annotate 'line', 24
  # rx pass
    rx55_cur."!cursor_pass"(rx55_pos, "ENDSTMT")
    rx55_cur."!cursor_debug"("PASS  ", "ENDSTMT", " at pos=", rx55_pos)
    .return (rx55_cur)
  rx55_fail:
.annotate 'line', 4
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
.sub "!PREFIX__ENDSTMT"  :subid("20_1273884026.76819") :method
.annotate 'line', 4
    new $P57, "ResizablePMCArray"
    push $P57, ""
    .return ($P57)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
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
.annotate 'line', 31
    set_addr $I10, alt73_1
    rx69_cur."!mark_push"(0, rx69_pos, $I10)
.annotate 'line', 32
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."MARKED"("ws")
    unless $P10, rx69_fail
    goto alt73_end
  alt73_1:
.annotate 'line', 33
  # rx subrule "ww" subtype=zerowidth negate=1
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."ww"()
    if $P10, rx69_fail
.annotate 'line', 38
  # rx rxquantr74 ** 0..*
    set_addr $I81, rxquantr74_done
    rx69_cur."!mark_push"(0, rx69_pos, $I81)
  rxquantr74_loop:
  alt75_0:
.annotate 'line', 34
    set_addr $I10, alt75_1
    rx69_cur."!mark_push"(0, rx69_pos, $I10)
  # rx rxquantr76 ** 1..*
    set_addr $I77, rxquantr76_done
    rx69_cur."!mark_push"(0, -1, $I77)
  rxquantr76_loop:
  # rx enumcharlist negate=0 
    ge rx69_pos, rx69_eos, rx69_fail
    sub $I10, rx69_pos, rx69_off
    substr $S10, rx69_tgt, $I10, 1
    index $I11, unicode:"\n\x{b}\f\r\x{85}\u2028\u2029", $S10
    lt $I11, 0, rx69_fail
    inc rx69_pos
    (rx69_rep) = rx69_cur."!mark_commit"($I77)
    rx69_cur."!mark_push"(rx69_rep, rx69_pos, $I77)
    goto rxquantr76_loop
  rxquantr76_done:
    goto alt75_end
  alt75_1:
    set_addr $I10, alt75_2
    rx69_cur."!mark_push"(0, rx69_pos, $I10)
.annotate 'line', 35
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
    set_addr $I10, alt75_3
    rx69_cur."!mark_push"(0, rx69_pos, $I10)
.annotate 'line', 36
  # rxanchor bol
    eq rx69_pos, 0, rxanchor78_done
    ge rx69_pos, rx69_eos, rx69_fail
    sub $I10, rx69_pos, rx69_off
    dec $I10
    is_cclass $I11, 4096, rx69_tgt, $I10
    unless $I11, rx69_fail
  rxanchor78_done:
  # rx subrule "pod_comment" subtype=method negate=
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."pod_comment"()
    unless $P10, rx69_fail
    rx69_pos = $P10."pos"()
    goto alt75_end
  alt75_3:
.annotate 'line', 37
  # rx rxquantr79 ** 1..*
    set_addr $I80, rxquantr79_done
    rx69_cur."!mark_push"(0, -1, $I80)
  rxquantr79_loop:
  # rx enumcharlist negate=0 
    ge rx69_pos, rx69_eos, rx69_fail
    sub $I10, rx69_pos, rx69_off
    substr $S10, rx69_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx69_fail
    inc rx69_pos
    (rx69_rep) = rx69_cur."!mark_commit"($I80)
    rx69_cur."!mark_push"(rx69_rep, rx69_pos, $I80)
    goto rxquantr79_loop
  rxquantr79_done:
  alt75_end:
.annotate 'line', 38
    (rx69_rep) = rx69_cur."!mark_commit"($I81)
    rx69_cur."!mark_push"(rx69_rep, rx69_pos, $I81)
    goto rxquantr74_loop
  rxquantr74_done:
.annotate 'line', 39
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."MARKER"("ws")
    unless $P10, rx69_fail
  alt73_end:
.annotate 'line', 31
  # rx pass
    rx69_cur."!cursor_pass"(rx69_pos, "ws")
    rx69_cur."!cursor_debug"("PASS  ", "ws", " at pos=", rx69_pos)
    .return (rx69_cur)
  rx69_fail:
.annotate 'line', 4
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
.sub "!PREFIX__ws"  :subid("22_1273884026.76819") :method
.annotate 'line', 4
    new $P71, "ResizablePMCArray"
    push $P71, ""
    push $P71, ""
    .return ($P71)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .const 'Sub' $P90 = "25_1273884026.76819" 
    capture_lex $P90
    .local string rx83_tgt
    .local int rx83_pos
    .local int rx83_off
    .local int rx83_eos
    .local int rx83_rep
    .local pmc rx83_cur
    (rx83_cur, rx83_pos, rx83_tgt) = self."!cursor_start"()
    rx83_cur."!cursor_debug"("START ", "unv")
    .lex unicode:"$\x{a2}", rx83_cur
    .local pmc match
    .lex "$/", match
    length rx83_eos, rx83_tgt
    set rx83_off, 0
    lt rx83_pos, 2, rx83_start
    sub rx83_off, rx83_pos, 1
    substr rx83_tgt, rx83_tgt, rx83_off
  rx83_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan86_done
    goto rxscan86_scan
  rxscan86_loop:
    ($P10) = rx83_cur."from"()
    inc $P10
    set rx83_pos, $P10
    ge rx83_pos, rx83_eos, rxscan86_done
  rxscan86_scan:
    set_addr $I10, rxscan86_loop
    rx83_cur."!mark_push"(0, rx83_pos, $I10)
  rxscan86_done:
  alt87_0:
.annotate 'line', 44
    set_addr $I10, alt87_1
    rx83_cur."!mark_push"(0, rx83_pos, $I10)
.annotate 'line', 45
  # rxanchor bol
    eq rx83_pos, 0, rxanchor88_done
    ge rx83_pos, rx83_eos, rx83_fail
    sub $I10, rx83_pos, rx83_off
    dec $I10
    is_cclass $I11, 4096, rx83_tgt, $I10
    unless $I11, rx83_fail
  rxanchor88_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx83_cur."!cursor_pos"(rx83_pos)
    .const 'Sub' $P90 = "25_1273884026.76819" 
    capture_lex $P90
    $P10 = rx83_cur."before"($P90)
    unless $P10, rx83_fail
  # rx subrule "pod_comment" subtype=method negate=
    rx83_cur."!cursor_pos"(rx83_pos)
    $P10 = rx83_cur."pod_comment"()
    unless $P10, rx83_fail
    rx83_pos = $P10."pos"()
    goto alt87_end
  alt87_1:
    set_addr $I10, alt87_2
    rx83_cur."!mark_push"(0, rx83_pos, $I10)
.annotate 'line', 46
  # rx rxquantr96 ** 0..*
    set_addr $I97, rxquantr96_done
    rx83_cur."!mark_push"(0, rx83_pos, $I97)
  rxquantr96_loop:
  # rx enumcharlist negate=0 
    ge rx83_pos, rx83_eos, rx83_fail
    sub $I10, rx83_pos, rx83_off
    substr $S10, rx83_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx83_fail
    inc rx83_pos
    (rx83_rep) = rx83_cur."!mark_commit"($I97)
    rx83_cur."!mark_push"(rx83_rep, rx83_pos, $I97)
    goto rxquantr96_loop
  rxquantr96_done:
  # rx literal  "#"
    add $I11, rx83_pos, 1
    gt $I11, rx83_eos, rx83_fail
    sub $I11, rx83_pos, rx83_off
    substr $S10, rx83_tgt, $I11, 1
    ne $S10, "#", rx83_fail
    add rx83_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx83_pos, rx83_off
    find_cclass $I11, 4096, rx83_tgt, $I10, rx83_eos
    add rx83_pos, rx83_off, $I11
    goto alt87_end
  alt87_2:
.annotate 'line', 47
  # rx rxquantr98 ** 1..*
    set_addr $I99, rxquantr98_done
    rx83_cur."!mark_push"(0, -1, $I99)
  rxquantr98_loop:
  # rx enumcharlist negate=0 
    ge rx83_pos, rx83_eos, rx83_fail
    sub $I10, rx83_pos, rx83_off
    substr $S10, rx83_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx83_fail
    inc rx83_pos
    (rx83_rep) = rx83_cur."!mark_commit"($I99)
    rx83_cur."!mark_push"(rx83_rep, rx83_pos, $I99)
    goto rxquantr98_loop
  rxquantr98_done:
  alt87_end:
.annotate 'line', 42
  # rx pass
    rx83_cur."!cursor_pass"(rx83_pos, "unv")
    rx83_cur."!cursor_debug"("PASS  ", "unv", " at pos=", rx83_pos)
    .return (rx83_cur)
  rx83_fail:
.annotate 'line', 4
    (rx83_rep, rx83_pos, $I10, $P10) = rx83_cur."!mark_fail"(0)
    lt rx83_pos, -1, rx83_done
    eq rx83_pos, -1, rx83_fail
    jump $I10
  rx83_done:
    rx83_cur."!cursor_fail"()
    rx83_cur."!cursor_debug"("FAIL  ", "unv")
    .return (rx83_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__unv"  :subid("24_1273884026.76819") :method
.annotate 'line', 4
    new $P85, "ResizablePMCArray"
    push $P85, ""
    push $P85, ""
    push $P85, ""
    .return ($P85)
.end


.namespace ["NQP";"Grammar"]
.sub "_block89"  :anon :subid("25_1273884026.76819") :method :outer("23_1273884026.76819")
.annotate 'line', 45
    .local string rx91_tgt
    .local int rx91_pos
    .local int rx91_off
    .local int rx91_eos
    .local int rx91_rep
    .local pmc rx91_cur
    (rx91_cur, rx91_pos, rx91_tgt) = self."!cursor_start"()
    rx91_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx91_cur
    .local pmc match
    .lex "$/", match
    length rx91_eos, rx91_tgt
    set rx91_off, 0
    lt rx91_pos, 2, rx91_start
    sub rx91_off, rx91_pos, 1
    substr rx91_tgt, rx91_tgt, rx91_off
  rx91_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan92_done
    goto rxscan92_scan
  rxscan92_loop:
    ($P10) = rx91_cur."from"()
    inc $P10
    set rx91_pos, $P10
    ge rx91_pos, rx91_eos, rxscan92_done
  rxscan92_scan:
    set_addr $I10, rxscan92_loop
    rx91_cur."!mark_push"(0, rx91_pos, $I10)
  rxscan92_done:
  # rx rxquantr93 ** 0..*
    set_addr $I94, rxquantr93_done
    rx91_cur."!mark_push"(0, rx91_pos, $I94)
  rxquantr93_loop:
  # rx enumcharlist negate=0 
    ge rx91_pos, rx91_eos, rx91_fail
    sub $I10, rx91_pos, rx91_off
    substr $S10, rx91_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx91_fail
    inc rx91_pos
    (rx91_rep) = rx91_cur."!mark_commit"($I94)
    rx91_cur."!mark_push"(rx91_rep, rx91_pos, $I94)
    goto rxquantr93_loop
  rxquantr93_done:
  # rx literal  "="
    add $I11, rx91_pos, 1
    gt $I11, rx91_eos, rx91_fail
    sub $I11, rx91_pos, rx91_off
    substr $S10, rx91_tgt, $I11, 1
    ne $S10, "=", rx91_fail
    add rx91_pos, 1
  alt95_0:
    set_addr $I10, alt95_1
    rx91_cur."!mark_push"(0, rx91_pos, $I10)
  # rx charclass w
    ge rx91_pos, rx91_eos, rx91_fail
    sub $I10, rx91_pos, rx91_off
    is_cclass $I11, 8192, rx91_tgt, $I10
    unless $I11, rx91_fail
    inc rx91_pos
    goto alt95_end
  alt95_1:
  # rx literal  "\\"
    add $I11, rx91_pos, 1
    gt $I11, rx91_eos, rx91_fail
    sub $I11, rx91_pos, rx91_off
    substr $S10, rx91_tgt, $I11, 1
    ne $S10, "\\", rx91_fail
    add rx91_pos, 1
  alt95_end:
  # rx pass
    rx91_cur."!cursor_pass"(rx91_pos, "")
    rx91_cur."!cursor_debug"("PASS  ", "", " at pos=", rx91_pos)
    .return (rx91_cur)
  rx91_fail:
    (rx91_rep, rx91_pos, $I10, $P10) = rx91_cur."!mark_fail"(0)
    lt rx91_pos, -1, rx91_done
    eq rx91_pos, -1, rx91_fail
    jump $I10
  rx91_done:
    rx91_cur."!cursor_fail"()
    rx91_cur."!cursor_debug"("FAIL  ", "")
    .return (rx91_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "pod_comment"  :subid("26_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .const 'Sub' $P141 = "28_1273884026.76819" 
    capture_lex $P141
    .local string rx101_tgt
    .local int rx101_pos
    .local int rx101_off
    .local int rx101_eos
    .local int rx101_rep
    .local pmc rx101_cur
    (rx101_cur, rx101_pos, rx101_tgt) = self."!cursor_start"()
    rx101_cur."!cursor_debug"("START ", "pod_comment")
    .lex unicode:"$\x{a2}", rx101_cur
    .local pmc match
    .lex "$/", match
    length rx101_eos, rx101_tgt
    set rx101_off, 0
    lt rx101_pos, 2, rx101_start
    sub rx101_off, rx101_pos, 1
    substr rx101_tgt, rx101_tgt, rx101_off
  rx101_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan104_done
    goto rxscan104_scan
  rxscan104_loop:
    ($P10) = rx101_cur."from"()
    inc $P10
    set rx101_pos, $P10
    ge rx101_pos, rx101_eos, rxscan104_done
  rxscan104_scan:
    set_addr $I10, rxscan104_loop
    rx101_cur."!mark_push"(0, rx101_pos, $I10)
  rxscan104_done:
.annotate 'line', 52
  # rxanchor bol
    eq rx101_pos, 0, rxanchor105_done
    ge rx101_pos, rx101_eos, rx101_fail
    sub $I10, rx101_pos, rx101_off
    dec $I10
    is_cclass $I11, 4096, rx101_tgt, $I10
    unless $I11, rx101_fail
  rxanchor105_done:
  # rx rxquantr106 ** 0..*
    set_addr $I107, rxquantr106_done
    rx101_cur."!mark_push"(0, rx101_pos, $I107)
  rxquantr106_loop:
  # rx enumcharlist negate=0 
    ge rx101_pos, rx101_eos, rx101_fail
    sub $I10, rx101_pos, rx101_off
    substr $S10, rx101_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx101_fail
    inc rx101_pos
    (rx101_rep) = rx101_cur."!mark_commit"($I107)
    rx101_cur."!mark_push"(rx101_rep, rx101_pos, $I107)
    goto rxquantr106_loop
  rxquantr106_done:
  # rx literal  "="
    add $I11, rx101_pos, 1
    gt $I11, rx101_eos, rx101_fail
    sub $I11, rx101_pos, rx101_off
    substr $S10, rx101_tgt, $I11, 1
    ne $S10, "=", rx101_fail
    add rx101_pos, 1
  alt108_0:
.annotate 'line', 53
    set_addr $I10, alt108_1
    rx101_cur."!mark_push"(0, rx101_pos, $I10)
.annotate 'line', 54
  # rx literal  "begin"
    add $I11, rx101_pos, 5
    gt $I11, rx101_eos, rx101_fail
    sub $I11, rx101_pos, rx101_off
    substr $S10, rx101_tgt, $I11, 5
    ne $S10, "begin", rx101_fail
    add rx101_pos, 5
  # rx rxquantr109 ** 1..*
    set_addr $I110, rxquantr109_done
    rx101_cur."!mark_push"(0, -1, $I110)
  rxquantr109_loop:
  # rx enumcharlist negate=0 
    ge rx101_pos, rx101_eos, rx101_fail
    sub $I10, rx101_pos, rx101_off
    substr $S10, rx101_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx101_fail
    inc rx101_pos
    (rx101_rep) = rx101_cur."!mark_commit"($I110)
    rx101_cur."!mark_push"(rx101_rep, rx101_pos, $I110)
    goto rxquantr109_loop
  rxquantr109_done:
  # rx literal  "END"
    add $I11, rx101_pos, 3
    gt $I11, rx101_eos, rx101_fail
    sub $I11, rx101_pos, rx101_off
    substr $S10, rx101_tgt, $I11, 3
    ne $S10, "END", rx101_fail
    add rx101_pos, 3
  # rxanchor rwb
    le rx101_pos, 0, rx101_fail
    sub $I10, rx101_pos, rx101_off
    is_cclass $I11, 8192, rx101_tgt, $I10
    if $I11, rx101_fail
    dec $I10
    is_cclass $I11, 8192, rx101_tgt, $I10
    unless $I11, rx101_fail
  alt111_0:
.annotate 'line', 55
    set_addr $I10, alt111_1
    rx101_cur."!mark_push"(0, rx101_pos, $I10)
  # rx rxquantf112 ** 0..*
    set_addr $I10, rxquantf112_loop
    rx101_cur."!mark_push"(0, rx101_pos, $I10)
    goto rxquantf112_done
  rxquantf112_loop:
  # rx charclass .
    ge rx101_pos, rx101_eos, rx101_fail
    inc rx101_pos
    set_addr $I10, rxquantf112_loop
    rx101_cur."!mark_push"($I113, rx101_pos, $I10)
  rxquantf112_done:
  # rx charclass nl
    ge rx101_pos, rx101_eos, rx101_fail
    sub $I10, rx101_pos, rx101_off
    is_cclass $I11, 4096, rx101_tgt, $I10
    unless $I11, rx101_fail
    substr $S10, rx101_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx101_pos, $I11
    inc rx101_pos
  # rx rxquantr114 ** 0..*
    set_addr $I115, rxquantr114_done
    rx101_cur."!mark_push"(0, rx101_pos, $I115)
  rxquantr114_loop:
  # rx enumcharlist negate=0 
    ge rx101_pos, rx101_eos, rx101_fail
    sub $I10, rx101_pos, rx101_off
    substr $S10, rx101_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx101_fail
    inc rx101_pos
    (rx101_rep) = rx101_cur."!mark_commit"($I115)
    rx101_cur."!mark_push"(rx101_rep, rx101_pos, $I115)
    goto rxquantr114_loop
  rxquantr114_done:
  # rx literal  "=end"
    add $I11, rx101_pos, 4
    gt $I11, rx101_eos, rx101_fail
    sub $I11, rx101_pos, rx101_off
    substr $S10, rx101_tgt, $I11, 4
    ne $S10, "=end", rx101_fail
    add rx101_pos, 4
  # rx rxquantr116 ** 1..*
    set_addr $I117, rxquantr116_done
    rx101_cur."!mark_push"(0, -1, $I117)
  rxquantr116_loop:
  # rx enumcharlist negate=0 
    ge rx101_pos, rx101_eos, rx101_fail
    sub $I10, rx101_pos, rx101_off
    substr $S10, rx101_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx101_fail
    inc rx101_pos
    (rx101_rep) = rx101_cur."!mark_commit"($I117)
    rx101_cur."!mark_push"(rx101_rep, rx101_pos, $I117)
    goto rxquantr116_loop
  rxquantr116_done:
  # rx literal  "END"
    add $I11, rx101_pos, 3
    gt $I11, rx101_eos, rx101_fail
    sub $I11, rx101_pos, rx101_off
    substr $S10, rx101_tgt, $I11, 3
    ne $S10, "END", rx101_fail
    add rx101_pos, 3
  # rxanchor rwb
    le rx101_pos, 0, rx101_fail
    sub $I10, rx101_pos, rx101_off
    is_cclass $I11, 8192, rx101_tgt, $I10
    if $I11, rx101_fail
    dec $I10
    is_cclass $I11, 8192, rx101_tgt, $I10
    unless $I11, rx101_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx101_pos, rx101_off
    find_cclass $I11, 4096, rx101_tgt, $I10, rx101_eos
    add rx101_pos, rx101_off, $I11
    goto alt111_end
  alt111_1:
  # rx charclass_q . r 0..-1
    sub $I10, rx101_pos, rx101_off
    find_not_cclass $I11, 65535, rx101_tgt, $I10, rx101_eos
    add rx101_pos, rx101_off, $I11
  alt111_end:
.annotate 'line', 54
    goto alt108_end
  alt108_1:
    set_addr $I10, alt108_2
    rx101_cur."!mark_push"(0, rx101_pos, $I10)
.annotate 'line', 56
  # rx literal  "begin"
    add $I11, rx101_pos, 5
    gt $I11, rx101_eos, rx101_fail
    sub $I11, rx101_pos, rx101_off
    substr $S10, rx101_tgt, $I11, 5
    ne $S10, "begin", rx101_fail
    add rx101_pos, 5
  # rx rxquantr118 ** 1..*
    set_addr $I119, rxquantr118_done
    rx101_cur."!mark_push"(0, -1, $I119)
  rxquantr118_loop:
  # rx enumcharlist negate=0 
    ge rx101_pos, rx101_eos, rx101_fail
    sub $I10, rx101_pos, rx101_off
    substr $S10, rx101_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx101_fail
    inc rx101_pos
    (rx101_rep) = rx101_cur."!mark_commit"($I119)
    rx101_cur."!mark_push"(rx101_rep, rx101_pos, $I119)
    goto rxquantr118_loop
  rxquantr118_done:
  # rx subrule "identifier" subtype=capture negate=
    rx101_cur."!cursor_pos"(rx101_pos)
    $P10 = rx101_cur."identifier"()
    unless $P10, rx101_fail
    rx101_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx101_pos = $P10."pos"()
  alt120_0:
.annotate 'line', 57
    set_addr $I10, alt120_1
    rx101_cur."!mark_push"(0, rx101_pos, $I10)
.annotate 'line', 58
  # rx rxquantf121 ** 0..*
    set_addr $I10, rxquantf121_loop
    rx101_cur."!mark_push"(0, rx101_pos, $I10)
    goto rxquantf121_done
  rxquantf121_loop:
  # rx charclass .
    ge rx101_pos, rx101_eos, rx101_fail
    inc rx101_pos
    set_addr $I10, rxquantf121_loop
    rx101_cur."!mark_push"($I122, rx101_pos, $I10)
  rxquantf121_done:
  # rx charclass nl
    ge rx101_pos, rx101_eos, rx101_fail
    sub $I10, rx101_pos, rx101_off
    is_cclass $I11, 4096, rx101_tgt, $I10
    unless $I11, rx101_fail
    substr $S10, rx101_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx101_pos, $I11
    inc rx101_pos
  # rx rxquantr123 ** 0..*
    set_addr $I124, rxquantr123_done
    rx101_cur."!mark_push"(0, rx101_pos, $I124)
  rxquantr123_loop:
  # rx enumcharlist negate=0 
    ge rx101_pos, rx101_eos, rx101_fail
    sub $I10, rx101_pos, rx101_off
    substr $S10, rx101_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx101_fail
    inc rx101_pos
    (rx101_rep) = rx101_cur."!mark_commit"($I124)
    rx101_cur."!mark_push"(rx101_rep, rx101_pos, $I124)
    goto rxquantr123_loop
  rxquantr123_done:
  # rx literal  "=end"
    add $I11, rx101_pos, 4
    gt $I11, rx101_eos, rx101_fail
    sub $I11, rx101_pos, rx101_off
    substr $S10, rx101_tgt, $I11, 4
    ne $S10, "=end", rx101_fail
    add rx101_pos, 4
  # rx rxquantr125 ** 1..*
    set_addr $I126, rxquantr125_done
    rx101_cur."!mark_push"(0, -1, $I126)
  rxquantr125_loop:
  # rx enumcharlist negate=0 
    ge rx101_pos, rx101_eos, rx101_fail
    sub $I10, rx101_pos, rx101_off
    substr $S10, rx101_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx101_fail
    inc rx101_pos
    (rx101_rep) = rx101_cur."!mark_commit"($I126)
    rx101_cur."!mark_push"(rx101_rep, rx101_pos, $I126)
    goto rxquantr125_loop
  rxquantr125_done:
  # rx subrule "!BACKREF" subtype=method negate=
    rx101_cur."!cursor_pos"(rx101_pos)
    $P10 = rx101_cur."!BACKREF"("identifier")
    unless $P10, rx101_fail
    rx101_pos = $P10."pos"()
  # rxanchor rwb
    le rx101_pos, 0, rx101_fail
    sub $I10, rx101_pos, rx101_off
    is_cclass $I11, 8192, rx101_tgt, $I10
    if $I11, rx101_fail
    dec $I10
    is_cclass $I11, 8192, rx101_tgt, $I10
    unless $I11, rx101_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx101_pos, rx101_off
    find_cclass $I11, 4096, rx101_tgt, $I10, rx101_eos
    add rx101_pos, rx101_off, $I11
    goto alt120_end
  alt120_1:
.annotate 'line', 59
  # rx subrule "panic" subtype=method negate=
    rx101_cur."!cursor_pos"(rx101_pos)
    $P10 = rx101_cur."panic"("=begin without matching =end")
    unless $P10, rx101_fail
    rx101_pos = $P10."pos"()
  alt120_end:
.annotate 'line', 56
    goto alt108_end
  alt108_2:
    set_addr $I10, alt108_3
    rx101_cur."!mark_push"(0, rx101_pos, $I10)
.annotate 'line', 61
  # rx literal  "begin"
    add $I11, rx101_pos, 5
    gt $I11, rx101_eos, rx101_fail
    sub $I11, rx101_pos, rx101_off
    substr $S10, rx101_tgt, $I11, 5
    ne $S10, "begin", rx101_fail
    add rx101_pos, 5
  # rxanchor rwb
    le rx101_pos, 0, rx101_fail
    sub $I10, rx101_pos, rx101_off
    is_cclass $I11, 8192, rx101_tgt, $I10
    if $I11, rx101_fail
    dec $I10
    is_cclass $I11, 8192, rx101_tgt, $I10
    unless $I11, rx101_fail
  # rx rxquantr128 ** 0..*
    set_addr $I129, rxquantr128_done
    rx101_cur."!mark_push"(0, rx101_pos, $I129)
  rxquantr128_loop:
  # rx enumcharlist negate=0 
    ge rx101_pos, rx101_eos, rx101_fail
    sub $I10, rx101_pos, rx101_off
    substr $S10, rx101_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx101_fail
    inc rx101_pos
    (rx101_rep) = rx101_cur."!mark_commit"($I129)
    rx101_cur."!mark_push"(rx101_rep, rx101_pos, $I129)
    goto rxquantr128_loop
  rxquantr128_done:
  alt130_0:
.annotate 'line', 62
    set_addr $I10, alt130_1
    rx101_cur."!mark_push"(0, rx101_pos, $I10)
  # rxanchor eol
    sub $I10, rx101_pos, rx101_off
    is_cclass $I11, 4096, rx101_tgt, $I10
    if $I11, rxanchor131_done
    ne rx101_pos, rx101_eos, rx101_fail
    eq rx101_pos, 0, rxanchor131_done
    dec $I10
    is_cclass $I11, 4096, rx101_tgt, $I10
    if $I11, rx101_fail
  rxanchor131_done:
    goto alt130_end
  alt130_1:
    set_addr $I10, alt130_2
    rx101_cur."!mark_push"(0, rx101_pos, $I10)
  # rx literal  "#"
    add $I11, rx101_pos, 1
    gt $I11, rx101_eos, rx101_fail
    sub $I11, rx101_pos, rx101_off
    substr $S10, rx101_tgt, $I11, 1
    ne $S10, "#", rx101_fail
    add rx101_pos, 1
    goto alt130_end
  alt130_2:
  # rx subrule "panic" subtype=method negate=
    rx101_cur."!cursor_pos"(rx101_pos)
    $P10 = rx101_cur."panic"("Unrecognized token after =begin")
    unless $P10, rx101_fail
    rx101_pos = $P10."pos"()
  alt130_end:
  alt132_0:
.annotate 'line', 63
    set_addr $I10, alt132_1
    rx101_cur."!mark_push"(0, rx101_pos, $I10)
.annotate 'line', 64
  # rx rxquantf133 ** 0..*
    set_addr $I10, rxquantf133_loop
    rx101_cur."!mark_push"(0, rx101_pos, $I10)
    goto rxquantf133_done
  rxquantf133_loop:
  # rx charclass .
    ge rx101_pos, rx101_eos, rx101_fail
    inc rx101_pos
    set_addr $I10, rxquantf133_loop
    rx101_cur."!mark_push"($I134, rx101_pos, $I10)
  rxquantf133_done:
  # rx charclass nl
    ge rx101_pos, rx101_eos, rx101_fail
    sub $I10, rx101_pos, rx101_off
    is_cclass $I11, 4096, rx101_tgt, $I10
    unless $I11, rx101_fail
    substr $S10, rx101_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx101_pos, $I11
    inc rx101_pos
  # rx rxquantr135 ** 0..*
    set_addr $I136, rxquantr135_done
    rx101_cur."!mark_push"(0, rx101_pos, $I136)
  rxquantr135_loop:
  # rx enumcharlist negate=0 
    ge rx101_pos, rx101_eos, rx101_fail
    sub $I10, rx101_pos, rx101_off
    substr $S10, rx101_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx101_fail
    inc rx101_pos
    (rx101_rep) = rx101_cur."!mark_commit"($I136)
    rx101_cur."!mark_push"(rx101_rep, rx101_pos, $I136)
    goto rxquantr135_loop
  rxquantr135_done:
  # rx literal  "=end"
    add $I11, rx101_pos, 4
    gt $I11, rx101_eos, rx101_fail
    sub $I11, rx101_pos, rx101_off
    substr $S10, rx101_tgt, $I11, 4
    ne $S10, "=end", rx101_fail
    add rx101_pos, 4
  # rxanchor rwb
    le rx101_pos, 0, rx101_fail
    sub $I10, rx101_pos, rx101_off
    is_cclass $I11, 8192, rx101_tgt, $I10
    if $I11, rx101_fail
    dec $I10
    is_cclass $I11, 8192, rx101_tgt, $I10
    unless $I11, rx101_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx101_pos, rx101_off
    find_cclass $I11, 4096, rx101_tgt, $I10, rx101_eos
    add rx101_pos, rx101_off, $I11
    goto alt132_end
  alt132_1:
.annotate 'line', 65
  # rx subrule "panic" subtype=method negate=
    rx101_cur."!cursor_pos"(rx101_pos)
    $P10 = rx101_cur."panic"("=begin without matching =end")
    unless $P10, rx101_fail
    rx101_pos = $P10."pos"()
  alt132_end:
.annotate 'line', 61
    goto alt108_end
  alt108_3:
    set_addr $I10, alt108_4
    rx101_cur."!mark_push"(0, rx101_pos, $I10)
.annotate 'line', 67
  # rx subrule "identifier" subtype=capture negate=
    rx101_cur."!cursor_pos"(rx101_pos)
    $P10 = rx101_cur."identifier"()
    unless $P10, rx101_fail
    rx101_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx101_pos = $P10."pos"()
.annotate 'line', 68
  # rx rxquantf137 ** 0..*
    set_addr $I10, rxquantf137_loop
    rx101_cur."!mark_push"(0, rx101_pos, $I10)
    goto rxquantf137_done
  rxquantf137_loop:
  # rx charclass .
    ge rx101_pos, rx101_eos, rx101_fail
    inc rx101_pos
    set_addr $I10, rxquantf137_loop
    rx101_cur."!mark_push"($I138, rx101_pos, $I10)
  rxquantf137_done:
  # rxanchor bol
    eq rx101_pos, 0, rxanchor139_done
    ge rx101_pos, rx101_eos, rx101_fail
    sub $I10, rx101_pos, rx101_off
    dec $I10
    is_cclass $I11, 4096, rx101_tgt, $I10
    unless $I11, rx101_fail
  rxanchor139_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx101_cur."!cursor_pos"(rx101_pos)
    .const 'Sub' $P141 = "28_1273884026.76819" 
    capture_lex $P141
    $P10 = rx101_cur."before"($P141)
    unless $P10, rx101_fail
.annotate 'line', 67
    goto alt108_end
  alt108_4:
  alt149_0:
.annotate 'line', 74
    set_addr $I10, alt149_1
    rx101_cur."!mark_push"(0, rx101_pos, $I10)
  # rx charclass s
    ge rx101_pos, rx101_eos, rx101_fail
    sub $I10, rx101_pos, rx101_off
    is_cclass $I11, 32, rx101_tgt, $I10
    unless $I11, rx101_fail
    inc rx101_pos
    goto alt149_end
  alt149_1:
  # rx subrule "panic" subtype=method negate=
    rx101_cur."!cursor_pos"(rx101_pos)
    $P10 = rx101_cur."panic"("Illegal pod directive")
    unless $P10, rx101_fail
    rx101_pos = $P10."pos"()
  alt149_end:
.annotate 'line', 75
  # rx charclass_q N r 0..-1
    sub $I10, rx101_pos, rx101_off
    find_cclass $I11, 4096, rx101_tgt, $I10, rx101_eos
    add rx101_pos, rx101_off, $I11
  alt108_end:
.annotate 'line', 51
  # rx pass
    rx101_cur."!cursor_pass"(rx101_pos, "pod_comment")
    rx101_cur."!cursor_debug"("PASS  ", "pod_comment", " at pos=", rx101_pos)
    .return (rx101_cur)
  rx101_fail:
.annotate 'line', 4
    (rx101_rep, rx101_pos, $I10, $P10) = rx101_cur."!mark_fail"(0)
    lt rx101_pos, -1, rx101_done
    eq rx101_pos, -1, rx101_fail
    jump $I10
  rx101_done:
    rx101_cur."!cursor_fail"()
    rx101_cur."!cursor_debug"("FAIL  ", "pod_comment")
    .return (rx101_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pod_comment"  :subid("27_1273884026.76819") :method
.annotate 'line', 4
    new $P103, "ResizablePMCArray"
    push $P103, ""
    .return ($P103)
.end


.namespace ["NQP";"Grammar"]
.sub "_block140"  :anon :subid("28_1273884026.76819") :method :outer("26_1273884026.76819")
.annotate 'line', 68
    .local string rx142_tgt
    .local int rx142_pos
    .local int rx142_off
    .local int rx142_eos
    .local int rx142_rep
    .local pmc rx142_cur
    (rx142_cur, rx142_pos, rx142_tgt) = self."!cursor_start"()
    rx142_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx142_cur
    .local pmc match
    .lex "$/", match
    length rx142_eos, rx142_tgt
    set rx142_off, 0
    lt rx142_pos, 2, rx142_start
    sub rx142_off, rx142_pos, 1
    substr rx142_tgt, rx142_tgt, rx142_off
  rx142_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan143_done
    goto rxscan143_scan
  rxscan143_loop:
    ($P10) = rx142_cur."from"()
    inc $P10
    set rx142_pos, $P10
    ge rx142_pos, rx142_eos, rxscan143_done
  rxscan143_scan:
    set_addr $I10, rxscan143_loop
    rx142_cur."!mark_push"(0, rx142_pos, $I10)
  rxscan143_done:
  # rx rxquantr144 ** 0..*
    set_addr $I145, rxquantr144_done
    rx142_cur."!mark_push"(0, rx142_pos, $I145)
  rxquantr144_loop:
  # rx enumcharlist negate=0 
    ge rx142_pos, rx142_eos, rx142_fail
    sub $I10, rx142_pos, rx142_off
    substr $S10, rx142_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx142_fail
    inc rx142_pos
    (rx142_rep) = rx142_cur."!mark_commit"($I145)
    rx142_cur."!mark_push"(rx142_rep, rx142_pos, $I145)
    goto rxquantr144_loop
  rxquantr144_done:
  alt146_0:
    set_addr $I10, alt146_1
    rx142_cur."!mark_push"(0, rx142_pos, $I10)
.annotate 'line', 69
  # rx literal  "="
    add $I11, rx142_pos, 1
    gt $I11, rx142_eos, rx142_fail
    sub $I11, rx142_pos, rx142_off
    substr $S10, rx142_tgt, $I11, 1
    ne $S10, "=", rx142_fail
    add rx142_pos, 1
.annotate 'line', 71
  # rx rxquantr147 ** 0..1
    set_addr $I148, rxquantr147_done
    rx142_cur."!mark_push"(0, rx142_pos, $I148)
  rxquantr147_loop:
.annotate 'line', 70
  # rx literal  "cut"
    add $I11, rx142_pos, 3
    gt $I11, rx142_eos, rx142_fail
    sub $I11, rx142_pos, rx142_off
    substr $S10, rx142_tgt, $I11, 3
    ne $S10, "cut", rx142_fail
    add rx142_pos, 3
  # rxanchor rwb
    le rx142_pos, 0, rx142_fail
    sub $I10, rx142_pos, rx142_off
    is_cclass $I11, 8192, rx142_tgt, $I10
    if $I11, rx142_fail
    dec $I10
    is_cclass $I11, 8192, rx142_tgt, $I10
    unless $I11, rx142_fail
.annotate 'line', 71
  # rx subrule "panic" subtype=method negate=
    rx142_cur."!cursor_pos"(rx142_pos)
    $P10 = rx142_cur."panic"("Obsolete pod format, please use =begin/=end instead")
    unless $P10, rx142_fail
    rx142_pos = $P10."pos"()
    (rx142_rep) = rx142_cur."!mark_commit"($I148)
  rxquantr147_done:
.annotate 'line', 68
    goto alt146_end
  alt146_1:
.annotate 'line', 72
  # rx charclass nl
    ge rx142_pos, rx142_eos, rx142_fail
    sub $I10, rx142_pos, rx142_off
    is_cclass $I11, 4096, rx142_tgt, $I10
    unless $I11, rx142_fail
    substr $S10, rx142_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx142_pos, $I11
    inc rx142_pos
  alt146_end:
.annotate 'line', 68
  # rx pass
    rx142_cur."!cursor_pass"(rx142_pos, "")
    rx142_cur."!cursor_debug"("PASS  ", "", " at pos=", rx142_pos)
    .return (rx142_cur)
  rx142_fail:
    (rx142_rep, rx142_pos, $I10, $P10) = rx142_cur."!mark_fail"(0)
    lt rx142_pos, -1, rx142_done
    eq rx142_pos, -1, rx142_fail
    jump $I10
  rx142_done:
    rx142_cur."!cursor_fail"()
    rx142_cur."!cursor_debug"("FAIL  ", "")
    .return (rx142_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "comp_unit"  :subid("29_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx151_tgt
    .local int rx151_pos
    .local int rx151_off
    .local int rx151_eos
    .local int rx151_rep
    .local pmc rx151_cur
    (rx151_cur, rx151_pos, rx151_tgt) = self."!cursor_start"()
    rx151_cur."!cursor_debug"("START ", "comp_unit")
    .lex unicode:"$\x{a2}", rx151_cur
    .local pmc match
    .lex "$/", match
    length rx151_eos, rx151_tgt
    set rx151_off, 0
    lt rx151_pos, 2, rx151_start
    sub rx151_off, rx151_pos, 1
    substr rx151_tgt, rx151_tgt, rx151_off
  rx151_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan155_done
    goto rxscan155_scan
  rxscan155_loop:
    ($P10) = rx151_cur."from"()
    inc $P10
    set rx151_pos, $P10
    ge rx151_pos, rx151_eos, rxscan155_done
  rxscan155_scan:
    set_addr $I10, rxscan155_loop
    rx151_cur."!mark_push"(0, rx151_pos, $I10)
  rxscan155_done:
.annotate 'line', 83
  # rx subrule "newpad" subtype=method negate=
    rx151_cur."!cursor_pos"(rx151_pos)
    $P10 = rx151_cur."newpad"()
    unless $P10, rx151_fail
    rx151_pos = $P10."pos"()
.annotate 'line', 84
  # rx subrule "statementlist" subtype=capture negate=
    rx151_cur."!cursor_pos"(rx151_pos)
    $P10 = rx151_cur."statementlist"()
    unless $P10, rx151_fail
    rx151_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx151_pos = $P10."pos"()
  alt156_0:
.annotate 'line', 85
    set_addr $I10, alt156_1
    rx151_cur."!mark_push"(0, rx151_pos, $I10)
  # rxanchor eos
    ne rx151_pos, rx151_eos, rx151_fail
    goto alt156_end
  alt156_1:
  # rx subrule "panic" subtype=method negate=
    rx151_cur."!cursor_pos"(rx151_pos)
    $P10 = rx151_cur."panic"("Confused")
    unless $P10, rx151_fail
    rx151_pos = $P10."pos"()
  alt156_end:
.annotate 'line', 82
  # rx pass
    rx151_cur."!cursor_pass"(rx151_pos, "comp_unit")
    rx151_cur."!cursor_debug"("PASS  ", "comp_unit", " at pos=", rx151_pos)
    .return (rx151_cur)
  rx151_fail:
.annotate 'line', 4
    (rx151_rep, rx151_pos, $I10, $P10) = rx151_cur."!mark_fail"(0)
    lt rx151_pos, -1, rx151_done
    eq rx151_pos, -1, rx151_fail
    jump $I10
  rx151_done:
    rx151_cur."!cursor_fail"()
    rx151_cur."!cursor_debug"("FAIL  ", "comp_unit")
    .return (rx151_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__comp_unit"  :subid("30_1273884026.76819") :method
.annotate 'line', 4
    $P153 = self."!PREFIX__!subrule"("", "")
    new $P154, "ResizablePMCArray"
    push $P154, $P153
    .return ($P154)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx158_tgt
    .local int rx158_pos
    .local int rx158_off
    .local int rx158_eos
    .local int rx158_rep
    .local pmc rx158_cur
    (rx158_cur, rx158_pos, rx158_tgt) = self."!cursor_start"()
    rx158_cur."!cursor_debug"("START ", "statementlist")
    rx158_cur."!cursor_caparray"("statement")
    .lex unicode:"$\x{a2}", rx158_cur
    .local pmc match
    .lex "$/", match
    length rx158_eos, rx158_tgt
    set rx158_off, 0
    lt rx158_pos, 2, rx158_start
    sub rx158_off, rx158_pos, 1
    substr rx158_tgt, rx158_tgt, rx158_off
  rx158_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan161_done
    goto rxscan161_scan
  rxscan161_loop:
    ($P10) = rx158_cur."from"()
    inc $P10
    set rx158_pos, $P10
    ge rx158_pos, rx158_eos, rxscan161_done
  rxscan161_scan:
    set_addr $I10, rxscan161_loop
    rx158_cur."!mark_push"(0, rx158_pos, $I10)
  rxscan161_done:
  alt162_0:
.annotate 'line', 88
    set_addr $I10, alt162_1
    rx158_cur."!mark_push"(0, rx158_pos, $I10)
.annotate 'line', 89
  # rx subrule "ws" subtype=method negate=
    rx158_cur."!cursor_pos"(rx158_pos)
    $P10 = rx158_cur."ws"()
    unless $P10, rx158_fail
    rx158_pos = $P10."pos"()
  # rxanchor eos
    ne rx158_pos, rx158_eos, rx158_fail
  # rx subrule "ws" subtype=method negate=
    rx158_cur."!cursor_pos"(rx158_pos)
    $P10 = rx158_cur."ws"()
    unless $P10, rx158_fail
    rx158_pos = $P10."pos"()
    goto alt162_end
  alt162_1:
.annotate 'line', 90
  # rx subrule "ws" subtype=method negate=
    rx158_cur."!cursor_pos"(rx158_pos)
    $P10 = rx158_cur."ws"()
    unless $P10, rx158_fail
    rx158_pos = $P10."pos"()
  # rx rxquantr166 ** 0..*
    set_addr $I168, rxquantr166_done
    rx158_cur."!mark_push"(0, rx158_pos, $I168)
  rxquantr166_loop:
  # rx subrule "statement" subtype=capture negate=
    rx158_cur."!cursor_pos"(rx158_pos)
    $P10 = rx158_cur."statement"()
    unless $P10, rx158_fail
    rx158_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx158_pos = $P10."pos"()
  # rx subrule "eat_terminator" subtype=method negate=
    rx158_cur."!cursor_pos"(rx158_pos)
    $P10 = rx158_cur."eat_terminator"()
    unless $P10, rx158_fail
    rx158_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx158_cur."!cursor_pos"(rx158_pos)
    $P10 = rx158_cur."ws"()
    unless $P10, rx158_fail
    rx158_pos = $P10."pos"()
    (rx158_rep) = rx158_cur."!mark_commit"($I168)
    rx158_cur."!mark_push"(rx158_rep, rx158_pos, $I168)
    goto rxquantr166_loop
  rxquantr166_done:
  # rx subrule "ws" subtype=method negate=
    rx158_cur."!cursor_pos"(rx158_pos)
    $P10 = rx158_cur."ws"()
    unless $P10, rx158_fail
    rx158_pos = $P10."pos"()
  alt162_end:
.annotate 'line', 88
  # rx pass
    rx158_cur."!cursor_pass"(rx158_pos, "statementlist")
    rx158_cur."!cursor_debug"("PASS  ", "statementlist", " at pos=", rx158_pos)
    .return (rx158_cur)
  rx158_fail:
.annotate 'line', 4
    (rx158_rep, rx158_pos, $I10, $P10) = rx158_cur."!mark_fail"(0)
    lt rx158_pos, -1, rx158_done
    eq rx158_pos, -1, rx158_fail
    jump $I10
  rx158_done:
    rx158_cur."!cursor_fail"()
    rx158_cur."!cursor_debug"("FAIL  ", "statementlist")
    .return (rx158_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statementlist"  :subid("32_1273884026.76819") :method
.annotate 'line', 4
    new $P160, "ResizablePMCArray"
    push $P160, ""
    push $P160, ""
    .return ($P160)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .const 'Sub' $P176 = "35_1273884026.76819" 
    capture_lex $P176
    .local string rx171_tgt
    .local int rx171_pos
    .local int rx171_off
    .local int rx171_eos
    .local int rx171_rep
    .local pmc rx171_cur
    (rx171_cur, rx171_pos, rx171_tgt) = self."!cursor_start"()
    rx171_cur."!cursor_debug"("START ", "statement")
    rx171_cur."!cursor_caparray"("statement_mod_cond", "statement_mod_loop")
    .lex unicode:"$\x{a2}", rx171_cur
    .local pmc match
    .lex "$/", match
    length rx171_eos, rx171_tgt
    set rx171_off, 0
    lt rx171_pos, 2, rx171_start
    sub rx171_off, rx171_pos, 1
    substr rx171_tgt, rx171_tgt, rx171_off
  rx171_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan174_done
    goto rxscan174_scan
  rxscan174_loop:
    ($P10) = rx171_cur."from"()
    inc $P10
    set rx171_pos, $P10
    ge rx171_pos, rx171_eos, rxscan174_done
  rxscan174_scan:
    set_addr $I10, rxscan174_loop
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
  rxscan174_done:
.annotate 'line', 94
  # rx subrule "before" subtype=zerowidth negate=1
    rx171_cur."!cursor_pos"(rx171_pos)
    .const 'Sub' $P176 = "35_1273884026.76819" 
    capture_lex $P176
    $P10 = rx171_cur."before"($P176)
    if $P10, rx171_fail
  alt180_0:
.annotate 'line', 95
    set_addr $I10, alt180_1
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
.annotate 'line', 96
  # rx subrule "statement_control" subtype=capture negate=
    rx171_cur."!cursor_pos"(rx171_pos)
    $P10 = rx171_cur."statement_control"()
    unless $P10, rx171_fail
    rx171_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_control")
    rx171_pos = $P10."pos"()
    goto alt180_end
  alt180_1:
.annotate 'line', 97
  # rx subrule "EXPR" subtype=capture negate=
    rx171_cur."!cursor_pos"(rx171_pos)
    $P10 = rx171_cur."EXPR"()
    unless $P10, rx171_fail
    rx171_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx171_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx171_cur."!cursor_pos"(rx171_pos)
    $P10 = rx171_cur."ws"()
    unless $P10, rx171_fail
    rx171_pos = $P10."pos"()
.annotate 'line', 102
  # rx rxquantr181 ** 0..1
    set_addr $I185, rxquantr181_done
    rx171_cur."!mark_push"(0, rx171_pos, $I185)
  rxquantr181_loop:
  alt182_0:
.annotate 'line', 98
    set_addr $I10, alt182_1
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
.annotate 'line', 99
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx171_cur."!cursor_pos"(rx171_pos)
    $P10 = rx171_cur."MARKED"("endstmt")
    unless $P10, rx171_fail
    goto alt182_end
  alt182_1:
    set_addr $I10, alt182_2
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
.annotate 'line', 100
  # rx subrule "statement_mod_cond" subtype=capture negate=
    rx171_cur."!cursor_pos"(rx171_pos)
    $P10 = rx171_cur."statement_mod_cond"()
    unless $P10, rx171_fail
    rx171_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_cond")
    rx171_pos = $P10."pos"()
  # rx rxquantr183 ** 0..1
    set_addr $I184, rxquantr183_done
    rx171_cur."!mark_push"(0, rx171_pos, $I184)
  rxquantr183_loop:
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx171_cur."!cursor_pos"(rx171_pos)
    $P10 = rx171_cur."statement_mod_loop"()
    unless $P10, rx171_fail
    rx171_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx171_pos = $P10."pos"()
    (rx171_rep) = rx171_cur."!mark_commit"($I184)
  rxquantr183_done:
    goto alt182_end
  alt182_2:
.annotate 'line', 101
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx171_cur."!cursor_pos"(rx171_pos)
    $P10 = rx171_cur."statement_mod_loop"()
    unless $P10, rx171_fail
    rx171_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx171_pos = $P10."pos"()
  alt182_end:
.annotate 'line', 102
    (rx171_rep) = rx171_cur."!mark_commit"($I185)
  rxquantr181_done:
  alt180_end:
.annotate 'line', 93
  # rx pass
    rx171_cur."!cursor_pass"(rx171_pos, "statement")
    rx171_cur."!cursor_debug"("PASS  ", "statement", " at pos=", rx171_pos)
    .return (rx171_cur)
  rx171_fail:
.annotate 'line', 4
    (rx171_rep, rx171_pos, $I10, $P10) = rx171_cur."!mark_fail"(0)
    lt rx171_pos, -1, rx171_done
    eq rx171_pos, -1, rx171_fail
    jump $I10
  rx171_done:
    rx171_cur."!cursor_fail"()
    rx171_cur."!cursor_debug"("FAIL  ", "statement")
    .return (rx171_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement"  :subid("34_1273884026.76819") :method
.annotate 'line', 4
    new $P173, "ResizablePMCArray"
    push $P173, ""
    .return ($P173)
.end


.namespace ["NQP";"Grammar"]
.sub "_block175"  :anon :subid("35_1273884026.76819") :method :outer("33_1273884026.76819")
.annotate 'line', 94
    .local string rx177_tgt
    .local int rx177_pos
    .local int rx177_off
    .local int rx177_eos
    .local int rx177_rep
    .local pmc rx177_cur
    (rx177_cur, rx177_pos, rx177_tgt) = self."!cursor_start"()
    rx177_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx177_cur
    .local pmc match
    .lex "$/", match
    length rx177_eos, rx177_tgt
    set rx177_off, 0
    lt rx177_pos, 2, rx177_start
    sub rx177_off, rx177_pos, 1
    substr rx177_tgt, rx177_tgt, rx177_off
  rx177_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan178_done
    goto rxscan178_scan
  rxscan178_loop:
    ($P10) = rx177_cur."from"()
    inc $P10
    set rx177_pos, $P10
    ge rx177_pos, rx177_eos, rxscan178_done
  rxscan178_scan:
    set_addr $I10, rxscan178_loop
    rx177_cur."!mark_push"(0, rx177_pos, $I10)
  rxscan178_done:
  alt179_0:
    set_addr $I10, alt179_1
    rx177_cur."!mark_push"(0, rx177_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx177_pos, rx177_eos, rx177_fail
    sub $I10, rx177_pos, rx177_off
    substr $S10, rx177_tgt, $I10, 1
    index $I11, "])}", $S10
    lt $I11, 0, rx177_fail
    inc rx177_pos
    goto alt179_end
  alt179_1:
  # rxanchor eos
    ne rx177_pos, rx177_eos, rx177_fail
  alt179_end:
  # rx pass
    rx177_cur."!cursor_pass"(rx177_pos, "")
    rx177_cur."!cursor_debug"("PASS  ", "", " at pos=", rx177_pos)
    .return (rx177_cur)
  rx177_fail:
    (rx177_rep, rx177_pos, $I10, $P10) = rx177_cur."!mark_fail"(0)
    lt rx177_pos, -1, rx177_done
    eq rx177_pos, -1, rx177_fail
    jump $I10
  rx177_done:
    rx177_cur."!cursor_fail"()
    rx177_cur."!cursor_debug"("FAIL  ", "")
    .return (rx177_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "eat_terminator"  :subid("36_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx187_tgt
    .local int rx187_pos
    .local int rx187_off
    .local int rx187_eos
    .local int rx187_rep
    .local pmc rx187_cur
    (rx187_cur, rx187_pos, rx187_tgt) = self."!cursor_start"()
    rx187_cur."!cursor_debug"("START ", "eat_terminator")
    .lex unicode:"$\x{a2}", rx187_cur
    .local pmc match
    .lex "$/", match
    length rx187_eos, rx187_tgt
    set rx187_off, 0
    lt rx187_pos, 2, rx187_start
    sub rx187_off, rx187_pos, 1
    substr rx187_tgt, rx187_tgt, rx187_off
  rx187_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan190_done
    goto rxscan190_scan
  rxscan190_loop:
    ($P10) = rx187_cur."from"()
    inc $P10
    set rx187_pos, $P10
    ge rx187_pos, rx187_eos, rxscan190_done
  rxscan190_scan:
    set_addr $I10, rxscan190_loop
    rx187_cur."!mark_push"(0, rx187_pos, $I10)
  rxscan190_done:
  alt191_0:
.annotate 'line', 106
    set_addr $I10, alt191_1
    rx187_cur."!mark_push"(0, rx187_pos, $I10)
.annotate 'line', 107
  # rx literal  ";"
    add $I11, rx187_pos, 1
    gt $I11, rx187_eos, rx187_fail
    sub $I11, rx187_pos, rx187_off
    substr $S10, rx187_tgt, $I11, 1
    ne $S10, ";", rx187_fail
    add rx187_pos, 1
    goto alt191_end
  alt191_1:
    set_addr $I10, alt191_2
    rx187_cur."!mark_push"(0, rx187_pos, $I10)
.annotate 'line', 108
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx187_cur."!cursor_pos"(rx187_pos)
    $P10 = rx187_cur."MARKED"("endstmt")
    unless $P10, rx187_fail
    goto alt191_end
  alt191_2:
    set_addr $I10, alt191_3
    rx187_cur."!mark_push"(0, rx187_pos, $I10)
.annotate 'line', 109
  # rx subrule "terminator" subtype=zerowidth negate=
    rx187_cur."!cursor_pos"(rx187_pos)
    $P10 = rx187_cur."terminator"()
    unless $P10, rx187_fail
    goto alt191_end
  alt191_3:
.annotate 'line', 110
  # rxanchor eos
    ne rx187_pos, rx187_eos, rx187_fail
  alt191_end:
.annotate 'line', 106
  # rx pass
    rx187_cur."!cursor_pass"(rx187_pos, "eat_terminator")
    rx187_cur."!cursor_debug"("PASS  ", "eat_terminator", " at pos=", rx187_pos)
    .return (rx187_cur)
  rx187_fail:
.annotate 'line', 4
    (rx187_rep, rx187_pos, $I10, $P10) = rx187_cur."!mark_fail"(0)
    lt rx187_pos, -1, rx187_done
    eq rx187_pos, -1, rx187_fail
    jump $I10
  rx187_done:
    rx187_cur."!cursor_fail"()
    rx187_cur."!cursor_debug"("FAIL  ", "eat_terminator")
    .return (rx187_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__eat_terminator"  :subid("37_1273884026.76819") :method
.annotate 'line', 4
    new $P189, "ResizablePMCArray"
    push $P189, ""
    push $P189, ""
    push $P189, ""
    push $P189, ";"
    .return ($P189)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx193_tgt
    .local int rx193_pos
    .local int rx193_off
    .local int rx193_eos
    .local int rx193_rep
    .local pmc rx193_cur
    (rx193_cur, rx193_pos, rx193_tgt) = self."!cursor_start"()
    rx193_cur."!cursor_debug"("START ", "xblock")
    .lex unicode:"$\x{a2}", rx193_cur
    .local pmc match
    .lex "$/", match
    length rx193_eos, rx193_tgt
    set rx193_off, 0
    lt rx193_pos, 2, rx193_start
    sub rx193_off, rx193_pos, 1
    substr rx193_tgt, rx193_tgt, rx193_off
  rx193_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan197_done
    goto rxscan197_scan
  rxscan197_loop:
    ($P10) = rx193_cur."from"()
    inc $P10
    set rx193_pos, $P10
    ge rx193_pos, rx193_eos, rxscan197_done
  rxscan197_scan:
    set_addr $I10, rxscan197_loop
    rx193_cur."!mark_push"(0, rx193_pos, $I10)
  rxscan197_done:
.annotate 'line', 114
  # rx subrule "EXPR" subtype=capture negate=
    rx193_cur."!cursor_pos"(rx193_pos)
    $P10 = rx193_cur."EXPR"()
    unless $P10, rx193_fail
    rx193_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx193_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx193_cur."!cursor_pos"(rx193_pos)
    $P10 = rx193_cur."ws"()
    unless $P10, rx193_fail
    rx193_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx193_cur."!cursor_pos"(rx193_pos)
    $P10 = rx193_cur."pblock"()
    unless $P10, rx193_fail
    rx193_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx193_pos = $P10."pos"()
.annotate 'line', 113
  # rx pass
    rx193_cur."!cursor_pass"(rx193_pos, "xblock")
    rx193_cur."!cursor_debug"("PASS  ", "xblock", " at pos=", rx193_pos)
    .return (rx193_cur)
  rx193_fail:
.annotate 'line', 4
    (rx193_rep, rx193_pos, $I10, $P10) = rx193_cur."!mark_fail"(0)
    lt rx193_pos, -1, rx193_done
    eq rx193_pos, -1, rx193_fail
    jump $I10
  rx193_done:
    rx193_cur."!cursor_fail"()
    rx193_cur."!cursor_debug"("FAIL  ", "xblock")
    .return (rx193_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__xblock"  :subid("39_1273884026.76819") :method
.annotate 'line', 4
    $P195 = self."!PREFIX__!subrule"("EXPR", "")
    new $P196, "ResizablePMCArray"
    push $P196, $P195
    .return ($P196)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx199_tgt
    .local int rx199_pos
    .local int rx199_off
    .local int rx199_eos
    .local int rx199_rep
    .local pmc rx199_cur
    (rx199_cur, rx199_pos, rx199_tgt) = self."!cursor_start"()
    rx199_cur."!cursor_debug"("START ", "pblock")
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
    ne $I10, -1, rxscan204_done
    goto rxscan204_scan
  rxscan204_loop:
    ($P10) = rx199_cur."from"()
    inc $P10
    set rx199_pos, $P10
    ge rx199_pos, rx199_eos, rxscan204_done
  rxscan204_scan:
    set_addr $I10, rxscan204_loop
    rx199_cur."!mark_push"(0, rx199_pos, $I10)
  rxscan204_done:
  alt205_0:
.annotate 'line', 117
    set_addr $I10, alt205_1
    rx199_cur."!mark_push"(0, rx199_pos, $I10)
.annotate 'line', 118
  # rx subrule "lambda" subtype=method negate=
    rx199_cur."!cursor_pos"(rx199_pos)
    $P10 = rx199_cur."lambda"()
    unless $P10, rx199_fail
    rx199_pos = $P10."pos"()
.annotate 'line', 119
  # rx subrule "newpad" subtype=method negate=
    rx199_cur."!cursor_pos"(rx199_pos)
    $P10 = rx199_cur."newpad"()
    unless $P10, rx199_fail
    rx199_pos = $P10."pos"()
.annotate 'line', 120
  # rx subrule "signature" subtype=capture negate=
    rx199_cur."!cursor_pos"(rx199_pos)
    $P10 = rx199_cur."signature"()
    unless $P10, rx199_fail
    rx199_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx199_pos = $P10."pos"()
.annotate 'line', 121
  # rx subrule "blockoid" subtype=capture negate=
    rx199_cur."!cursor_pos"(rx199_pos)
    $P10 = rx199_cur."blockoid"()
    unless $P10, rx199_fail
    rx199_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx199_pos = $P10."pos"()
.annotate 'line', 118
    goto alt205_end
  alt205_1:
    set_addr $I10, alt205_2
    rx199_cur."!mark_push"(0, rx199_pos, $I10)
.annotate 'line', 122
  # rx enumcharlist negate=0 zerowidth
    ge rx199_pos, rx199_eos, rx199_fail
    sub $I10, rx199_pos, rx199_off
    substr $S10, rx199_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx199_fail
.annotate 'line', 123
  # rx subrule "newpad" subtype=method negate=
    rx199_cur."!cursor_pos"(rx199_pos)
    $P10 = rx199_cur."newpad"()
    unless $P10, rx199_fail
    rx199_pos = $P10."pos"()
.annotate 'line', 124
  # rx subrule "blockoid" subtype=capture negate=
    rx199_cur."!cursor_pos"(rx199_pos)
    $P10 = rx199_cur."blockoid"()
    unless $P10, rx199_fail
    rx199_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx199_pos = $P10."pos"()
.annotate 'line', 122
    goto alt205_end
  alt205_2:
.annotate 'line', 125
  # rx subrule "panic" subtype=method negate=
    rx199_cur."!cursor_pos"(rx199_pos)
    $P10 = rx199_cur."panic"("Missing block")
    unless $P10, rx199_fail
    rx199_pos = $P10."pos"()
  alt205_end:
.annotate 'line', 117
  # rx pass
    rx199_cur."!cursor_pass"(rx199_pos, "pblock")
    rx199_cur."!cursor_debug"("PASS  ", "pblock", " at pos=", rx199_pos)
    .return (rx199_cur)
  rx199_fail:
.annotate 'line', 4
    (rx199_rep, rx199_pos, $I10, $P10) = rx199_cur."!mark_fail"(0)
    lt rx199_pos, -1, rx199_done
    eq rx199_pos, -1, rx199_fail
    jump $I10
  rx199_done:
    rx199_cur."!cursor_fail"()
    rx199_cur."!cursor_debug"("FAIL  ", "pblock")
    .return (rx199_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pblock"  :subid("41_1273884026.76819") :method
.annotate 'line', 4
    $P201 = self."!PREFIX__!subrule"("", "")
    $P202 = self."!PREFIX__!subrule"("", "")
    new $P203, "ResizablePMCArray"
    push $P203, $P201
    push $P203, "{"
    push $P203, $P202
    .return ($P203)
.end


.namespace ["NQP";"Grammar"]
.sub "lambda"  :subid("42_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx207_tgt
    .local int rx207_pos
    .local int rx207_off
    .local int rx207_eos
    .local int rx207_rep
    .local pmc rx207_cur
    (rx207_cur, rx207_pos, rx207_tgt) = self."!cursor_start"()
    rx207_cur."!cursor_debug"("START ", "lambda")
    .lex unicode:"$\x{a2}", rx207_cur
    .local pmc match
    .lex "$/", match
    length rx207_eos, rx207_tgt
    set rx207_off, 0
    lt rx207_pos, 2, rx207_start
    sub rx207_off, rx207_pos, 1
    substr rx207_tgt, rx207_tgt, rx207_off
  rx207_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan210_done
    goto rxscan210_scan
  rxscan210_loop:
    ($P10) = rx207_cur."from"()
    inc $P10
    set rx207_pos, $P10
    ge rx207_pos, rx207_eos, rxscan210_done
  rxscan210_scan:
    set_addr $I10, rxscan210_loop
    rx207_cur."!mark_push"(0, rx207_pos, $I10)
  rxscan210_done:
  alt211_0:
.annotate 'line', 128
    set_addr $I10, alt211_1
    rx207_cur."!mark_push"(0, rx207_pos, $I10)
  # rx literal  "->"
    add $I11, rx207_pos, 2
    gt $I11, rx207_eos, rx207_fail
    sub $I11, rx207_pos, rx207_off
    substr $S10, rx207_tgt, $I11, 2
    ne $S10, "->", rx207_fail
    add rx207_pos, 2
    goto alt211_end
  alt211_1:
  # rx literal  "<->"
    add $I11, rx207_pos, 3
    gt $I11, rx207_eos, rx207_fail
    sub $I11, rx207_pos, rx207_off
    substr $S10, rx207_tgt, $I11, 3
    ne $S10, "<->", rx207_fail
    add rx207_pos, 3
  alt211_end:
  # rx pass
    rx207_cur."!cursor_pass"(rx207_pos, "lambda")
    rx207_cur."!cursor_debug"("PASS  ", "lambda", " at pos=", rx207_pos)
    .return (rx207_cur)
  rx207_fail:
.annotate 'line', 4
    (rx207_rep, rx207_pos, $I10, $P10) = rx207_cur."!mark_fail"(0)
    lt rx207_pos, -1, rx207_done
    eq rx207_pos, -1, rx207_fail
    jump $I10
  rx207_done:
    rx207_cur."!cursor_fail"()
    rx207_cur."!cursor_debug"("FAIL  ", "lambda")
    .return (rx207_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__lambda"  :subid("43_1273884026.76819") :method
.annotate 'line', 4
    new $P209, "ResizablePMCArray"
    push $P209, "<->"
    push $P209, "->"
    .return ($P209)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx213_tgt
    .local int rx213_pos
    .local int rx213_off
    .local int rx213_eos
    .local int rx213_rep
    .local pmc rx213_cur
    (rx213_cur, rx213_pos, rx213_tgt) = self."!cursor_start"()
    rx213_cur."!cursor_debug"("START ", "block")
    .lex unicode:"$\x{a2}", rx213_cur
    .local pmc match
    .lex "$/", match
    length rx213_eos, rx213_tgt
    set rx213_off, 0
    lt rx213_pos, 2, rx213_start
    sub rx213_off, rx213_pos, 1
    substr rx213_tgt, rx213_tgt, rx213_off
  rx213_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan217_done
    goto rxscan217_scan
  rxscan217_loop:
    ($P10) = rx213_cur."from"()
    inc $P10
    set rx213_pos, $P10
    ge rx213_pos, rx213_eos, rxscan217_done
  rxscan217_scan:
    set_addr $I10, rxscan217_loop
    rx213_cur."!mark_push"(0, rx213_pos, $I10)
  rxscan217_done:
  alt218_0:
.annotate 'line', 131
    set_addr $I10, alt218_1
    rx213_cur."!mark_push"(0, rx213_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx213_pos, rx213_eos, rx213_fail
    sub $I10, rx213_pos, rx213_off
    substr $S10, rx213_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx213_fail
    goto alt218_end
  alt218_1:
  # rx subrule "panic" subtype=method negate=
    rx213_cur."!cursor_pos"(rx213_pos)
    $P10 = rx213_cur."panic"("Missing block")
    unless $P10, rx213_fail
    rx213_pos = $P10."pos"()
  alt218_end:
.annotate 'line', 132
  # rx subrule "newpad" subtype=method negate=
    rx213_cur."!cursor_pos"(rx213_pos)
    $P10 = rx213_cur."newpad"()
    unless $P10, rx213_fail
    rx213_pos = $P10."pos"()
.annotate 'line', 133
  # rx subrule "blockoid" subtype=capture negate=
    rx213_cur."!cursor_pos"(rx213_pos)
    $P10 = rx213_cur."blockoid"()
    unless $P10, rx213_fail
    rx213_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx213_pos = $P10."pos"()
.annotate 'line', 130
  # rx pass
    rx213_cur."!cursor_pass"(rx213_pos, "block")
    rx213_cur."!cursor_debug"("PASS  ", "block", " at pos=", rx213_pos)
    .return (rx213_cur)
  rx213_fail:
.annotate 'line', 4
    (rx213_rep, rx213_pos, $I10, $P10) = rx213_cur."!mark_fail"(0)
    lt rx213_pos, -1, rx213_done
    eq rx213_pos, -1, rx213_fail
    jump $I10
  rx213_done:
    rx213_cur."!cursor_fail"()
    rx213_cur."!cursor_debug"("FAIL  ", "block")
    .return (rx213_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__block"  :subid("45_1273884026.76819") :method
.annotate 'line', 4
    $P215 = self."!PREFIX__!subrule"("", "")
    new $P216, "ResizablePMCArray"
    push $P216, $P215
    push $P216, "{"
    .return ($P216)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx220_tgt
    .local int rx220_pos
    .local int rx220_off
    .local int rx220_eos
    .local int rx220_rep
    .local pmc rx220_cur
    (rx220_cur, rx220_pos, rx220_tgt) = self."!cursor_start"()
    rx220_cur."!cursor_debug"("START ", "blockoid")
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
    ne $I10, -1, rxscan224_done
    goto rxscan224_scan
  rxscan224_loop:
    ($P10) = rx220_cur."from"()
    inc $P10
    set rx220_pos, $P10
    ge rx220_pos, rx220_eos, rxscan224_done
  rxscan224_scan:
    set_addr $I10, rxscan224_loop
    rx220_cur."!mark_push"(0, rx220_pos, $I10)
  rxscan224_done:
.annotate 'line', 137
  # rx subrule "finishpad" subtype=method negate=
    rx220_cur."!cursor_pos"(rx220_pos)
    $P10 = rx220_cur."finishpad"()
    unless $P10, rx220_fail
    rx220_pos = $P10."pos"()
.annotate 'line', 138
  # rx literal  "{"
    add $I11, rx220_pos, 1
    gt $I11, rx220_eos, rx220_fail
    sub $I11, rx220_pos, rx220_off
    substr $S10, rx220_tgt, $I11, 1
    ne $S10, "{", rx220_fail
    add rx220_pos, 1
  # rx subrule "statementlist" subtype=capture negate=
    rx220_cur."!cursor_pos"(rx220_pos)
    $P10 = rx220_cur."statementlist"()
    unless $P10, rx220_fail
    rx220_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx220_pos = $P10."pos"()
  alt225_0:
    set_addr $I10, alt225_1
    rx220_cur."!mark_push"(0, rx220_pos, $I10)
  # rx literal  "}"
    add $I11, rx220_pos, 1
    gt $I11, rx220_eos, rx220_fail
    sub $I11, rx220_pos, rx220_off
    substr $S10, rx220_tgt, $I11, 1
    ne $S10, "}", rx220_fail
    add rx220_pos, 1
    goto alt225_end
  alt225_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx220_cur."!cursor_pos"(rx220_pos)
    $P10 = rx220_cur."FAILGOAL"("'}'")
    unless $P10, rx220_fail
    rx220_pos = $P10."pos"()
  alt225_end:
.annotate 'line', 139
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx220_cur."!cursor_pos"(rx220_pos)
    $P10 = rx220_cur."ENDSTMT"()
    unless $P10, rx220_fail
.annotate 'line', 136
  # rx pass
    rx220_cur."!cursor_pass"(rx220_pos, "blockoid")
    rx220_cur."!cursor_debug"("PASS  ", "blockoid", " at pos=", rx220_pos)
    .return (rx220_cur)
  rx220_fail:
.annotate 'line', 4
    (rx220_rep, rx220_pos, $I10, $P10) = rx220_cur."!mark_fail"(0)
    lt rx220_pos, -1, rx220_done
    eq rx220_pos, -1, rx220_fail
    jump $I10
  rx220_done:
    rx220_cur."!cursor_fail"()
    rx220_cur."!cursor_debug"("FAIL  ", "blockoid")
    .return (rx220_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blockoid"  :subid("47_1273884026.76819") :method
.annotate 'line', 4
    $P222 = self."!PREFIX__!subrule"("", "")
    new $P223, "ResizablePMCArray"
    push $P223, $P222
    .return ($P223)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx228_tgt
    .local int rx228_pos
    .local int rx228_off
    .local int rx228_eos
    .local int rx228_rep
    .local pmc rx228_cur
    (rx228_cur, rx228_pos, rx228_tgt) = self."!cursor_start"()
    rx228_cur."!cursor_debug"("START ", "newpad")
    .lex unicode:"$\x{a2}", rx228_cur
    .local pmc match
    .lex "$/", match
    length rx228_eos, rx228_tgt
    set rx228_off, 0
    lt rx228_pos, 2, rx228_start
    sub rx228_off, rx228_pos, 1
    substr rx228_tgt, rx228_tgt, rx228_off
  rx228_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan231_done
    goto rxscan231_scan
  rxscan231_loop:
    ($P10) = rx228_cur."from"()
    inc $P10
    set rx228_pos, $P10
    ge rx228_pos, rx228_eos, rxscan231_done
  rxscan231_scan:
    set_addr $I10, rxscan231_loop
    rx228_cur."!mark_push"(0, rx228_pos, $I10)
  rxscan231_done:
.annotate 'line', 142
  # rx pass
    rx228_cur."!cursor_pass"(rx228_pos, "newpad")
    rx228_cur."!cursor_debug"("PASS  ", "newpad", " at pos=", rx228_pos)
    .return (rx228_cur)
  rx228_fail:
.annotate 'line', 4
    (rx228_rep, rx228_pos, $I10, $P10) = rx228_cur."!mark_fail"(0)
    lt rx228_pos, -1, rx228_done
    eq rx228_pos, -1, rx228_fail
    jump $I10
  rx228_done:
    rx228_cur."!cursor_fail"()
    rx228_cur."!cursor_debug"("FAIL  ", "newpad")
    .return (rx228_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__newpad"  :subid("49_1273884026.76819") :method
.annotate 'line', 4
    new $P230, "ResizablePMCArray"
    push $P230, ""
    .return ($P230)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("50_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx233_tgt
    .local int rx233_pos
    .local int rx233_off
    .local int rx233_eos
    .local int rx233_rep
    .local pmc rx233_cur
    (rx233_cur, rx233_pos, rx233_tgt) = self."!cursor_start"()
    rx233_cur."!cursor_debug"("START ", "finishpad")
    .lex unicode:"$\x{a2}", rx233_cur
    .local pmc match
    .lex "$/", match
    length rx233_eos, rx233_tgt
    set rx233_off, 0
    lt rx233_pos, 2, rx233_start
    sub rx233_off, rx233_pos, 1
    substr rx233_tgt, rx233_tgt, rx233_off
  rx233_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan236_done
    goto rxscan236_scan
  rxscan236_loop:
    ($P10) = rx233_cur."from"()
    inc $P10
    set rx233_pos, $P10
    ge rx233_pos, rx233_eos, rxscan236_done
  rxscan236_scan:
    set_addr $I10, rxscan236_loop
    rx233_cur."!mark_push"(0, rx233_pos, $I10)
  rxscan236_done:
.annotate 'line', 143
  # rx pass
    rx233_cur."!cursor_pass"(rx233_pos, "finishpad")
    rx233_cur."!cursor_debug"("PASS  ", "finishpad", " at pos=", rx233_pos)
    .return (rx233_cur)
  rx233_fail:
.annotate 'line', 4
    (rx233_rep, rx233_pos, $I10, $P10) = rx233_cur."!mark_fail"(0)
    lt rx233_pos, -1, rx233_done
    eq rx233_pos, -1, rx233_fail
    jump $I10
  rx233_done:
    rx233_cur."!cursor_fail"()
    rx233_cur."!cursor_debug"("FAIL  ", "finishpad")
    .return (rx233_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__finishpad"  :subid("51_1273884026.76819") :method
.annotate 'line', 4
    new $P235, "ResizablePMCArray"
    push $P235, ""
    .return ($P235)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("52_1273884026.76819") :method
.annotate 'line', 145
    $P238 = self."!protoregex"("terminator")
    .return ($P238)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("53_1273884026.76819") :method
.annotate 'line', 145
    $P240 = self."!PREFIX__!protoregex"("terminator")
    .return ($P240)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("54_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx242_tgt
    .local int rx242_pos
    .local int rx242_off
    .local int rx242_eos
    .local int rx242_rep
    .local pmc rx242_cur
    (rx242_cur, rx242_pos, rx242_tgt) = self."!cursor_start"()
    rx242_cur."!cursor_debug"("START ", "terminator:sym<;>")
    .lex unicode:"$\x{a2}", rx242_cur
    .local pmc match
    .lex "$/", match
    length rx242_eos, rx242_tgt
    set rx242_off, 0
    lt rx242_pos, 2, rx242_start
    sub rx242_off, rx242_pos, 1
    substr rx242_tgt, rx242_tgt, rx242_off
  rx242_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan245_done
    goto rxscan245_scan
  rxscan245_loop:
    ($P10) = rx242_cur."from"()
    inc $P10
    set rx242_pos, $P10
    ge rx242_pos, rx242_eos, rxscan245_done
  rxscan245_scan:
    set_addr $I10, rxscan245_loop
    rx242_cur."!mark_push"(0, rx242_pos, $I10)
  rxscan245_done:
.annotate 'line', 147
  # rx enumcharlist negate=0 zerowidth
    ge rx242_pos, rx242_eos, rx242_fail
    sub $I10, rx242_pos, rx242_off
    substr $S10, rx242_tgt, $I10, 1
    index $I11, ";", $S10
    lt $I11, 0, rx242_fail
  # rx pass
    rx242_cur."!cursor_pass"(rx242_pos, "terminator:sym<;>")
    rx242_cur."!cursor_debug"("PASS  ", "terminator:sym<;>", " at pos=", rx242_pos)
    .return (rx242_cur)
  rx242_fail:
.annotate 'line', 4
    (rx242_rep, rx242_pos, $I10, $P10) = rx242_cur."!mark_fail"(0)
    lt rx242_pos, -1, rx242_done
    eq rx242_pos, -1, rx242_fail
    jump $I10
  rx242_done:
    rx242_cur."!cursor_fail"()
    rx242_cur."!cursor_debug"("FAIL  ", "terminator:sym<;>")
    .return (rx242_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<;>"  :subid("55_1273884026.76819") :method
.annotate 'line', 4
    new $P244, "ResizablePMCArray"
    push $P244, ";"
    .return ($P244)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("56_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx247_tgt
    .local int rx247_pos
    .local int rx247_off
    .local int rx247_eos
    .local int rx247_rep
    .local pmc rx247_cur
    (rx247_cur, rx247_pos, rx247_tgt) = self."!cursor_start"()
    rx247_cur."!cursor_debug"("START ", "terminator:sym<}>")
    .lex unicode:"$\x{a2}", rx247_cur
    .local pmc match
    .lex "$/", match
    length rx247_eos, rx247_tgt
    set rx247_off, 0
    lt rx247_pos, 2, rx247_start
    sub rx247_off, rx247_pos, 1
    substr rx247_tgt, rx247_tgt, rx247_off
  rx247_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan250_done
    goto rxscan250_scan
  rxscan250_loop:
    ($P10) = rx247_cur."from"()
    inc $P10
    set rx247_pos, $P10
    ge rx247_pos, rx247_eos, rxscan250_done
  rxscan250_scan:
    set_addr $I10, rxscan250_loop
    rx247_cur."!mark_push"(0, rx247_pos, $I10)
  rxscan250_done:
.annotate 'line', 148
  # rx enumcharlist negate=0 zerowidth
    ge rx247_pos, rx247_eos, rx247_fail
    sub $I10, rx247_pos, rx247_off
    substr $S10, rx247_tgt, $I10, 1
    index $I11, "}", $S10
    lt $I11, 0, rx247_fail
  # rx pass
    rx247_cur."!cursor_pass"(rx247_pos, "terminator:sym<}>")
    rx247_cur."!cursor_debug"("PASS  ", "terminator:sym<}>", " at pos=", rx247_pos)
    .return (rx247_cur)
  rx247_fail:
.annotate 'line', 4
    (rx247_rep, rx247_pos, $I10, $P10) = rx247_cur."!mark_fail"(0)
    lt rx247_pos, -1, rx247_done
    eq rx247_pos, -1, rx247_fail
    jump $I10
  rx247_done:
    rx247_cur."!cursor_fail"()
    rx247_cur."!cursor_debug"("FAIL  ", "terminator:sym<}>")
    .return (rx247_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<}>"  :subid("57_1273884026.76819") :method
.annotate 'line', 4
    new $P249, "ResizablePMCArray"
    push $P249, "}"
    .return ($P249)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("58_1273884026.76819") :method
.annotate 'line', 152
    $P252 = self."!protoregex"("statement_control")
    .return ($P252)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("59_1273884026.76819") :method
.annotate 'line', 152
    $P254 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P254)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("60_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx256_tgt
    .local int rx256_pos
    .local int rx256_off
    .local int rx256_eos
    .local int rx256_rep
    .local pmc rx256_cur
    (rx256_cur, rx256_pos, rx256_tgt) = self."!cursor_start"()
    rx256_cur."!cursor_debug"("START ", "statement_control:sym<if>")
    rx256_cur."!cursor_caparray"("else", "xblock")
    .lex unicode:"$\x{a2}", rx256_cur
    .local pmc match
    .lex "$/", match
    length rx256_eos, rx256_tgt
    set rx256_off, 0
    lt rx256_pos, 2, rx256_start
    sub rx256_off, rx256_pos, 1
    substr rx256_tgt, rx256_tgt, rx256_off
  rx256_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan259_done
    goto rxscan259_scan
  rxscan259_loop:
    ($P10) = rx256_cur."from"()
    inc $P10
    set rx256_pos, $P10
    ge rx256_pos, rx256_eos, rxscan259_done
  rxscan259_scan:
    set_addr $I10, rxscan259_loop
    rx256_cur."!mark_push"(0, rx256_pos, $I10)
  rxscan259_done:
.annotate 'line', 155
  # rx subcapture "sym"
    set_addr $I10, rxcap_260_fail
    rx256_cur."!mark_push"(0, rx256_pos, $I10)
  # rx literal  "if"
    add $I11, rx256_pos, 2
    gt $I11, rx256_eos, rx256_fail
    sub $I11, rx256_pos, rx256_off
    substr $S10, rx256_tgt, $I11, 2
    ne $S10, "if", rx256_fail
    add rx256_pos, 2
    set_addr $I10, rxcap_260_fail
    ($I12, $I11) = rx256_cur."!mark_peek"($I10)
    rx256_cur."!cursor_pos"($I11)
    ($P10) = rx256_cur."!cursor_start"()
    $P10."!cursor_pass"(rx256_pos, "")
    rx256_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_260_done
  rxcap_260_fail:
    goto rx256_fail
  rxcap_260_done:
  # rx charclass s
    ge rx256_pos, rx256_eos, rx256_fail
    sub $I10, rx256_pos, rx256_off
    is_cclass $I11, 32, rx256_tgt, $I10
    unless $I11, rx256_fail
    inc rx256_pos
  # rx subrule "ws" subtype=method negate=
    rx256_cur."!cursor_pos"(rx256_pos)
    $P10 = rx256_cur."ws"()
    unless $P10, rx256_fail
    rx256_pos = $P10."pos"()
.annotate 'line', 156
  # rx subrule "xblock" subtype=capture negate=
    rx256_cur."!cursor_pos"(rx256_pos)
    $P10 = rx256_cur."xblock"()
    unless $P10, rx256_fail
    rx256_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx256_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx256_cur."!cursor_pos"(rx256_pos)
    $P10 = rx256_cur."ws"()
    unless $P10, rx256_fail
    rx256_pos = $P10."pos"()
.annotate 'line', 157
  # rx rxquantr263 ** 0..*
    set_addr $I267, rxquantr263_done
    rx256_cur."!mark_push"(0, rx256_pos, $I267)
  rxquantr263_loop:
  # rx subrule "ws" subtype=method negate=
    rx256_cur."!cursor_pos"(rx256_pos)
    $P10 = rx256_cur."ws"()
    unless $P10, rx256_fail
    rx256_pos = $P10."pos"()
  # rx literal  "elsif"
    add $I11, rx256_pos, 5
    gt $I11, rx256_eos, rx256_fail
    sub $I11, rx256_pos, rx256_off
    substr $S10, rx256_tgt, $I11, 5
    ne $S10, "elsif", rx256_fail
    add rx256_pos, 5
  # rx charclass s
    ge rx256_pos, rx256_eos, rx256_fail
    sub $I10, rx256_pos, rx256_off
    is_cclass $I11, 32, rx256_tgt, $I10
    unless $I11, rx256_fail
    inc rx256_pos
  # rx subrule "ws" subtype=method negate=
    rx256_cur."!cursor_pos"(rx256_pos)
    $P10 = rx256_cur."ws"()
    unless $P10, rx256_fail
    rx256_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx256_cur."!cursor_pos"(rx256_pos)
    $P10 = rx256_cur."xblock"()
    unless $P10, rx256_fail
    rx256_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx256_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx256_cur."!cursor_pos"(rx256_pos)
    $P10 = rx256_cur."ws"()
    unless $P10, rx256_fail
    rx256_pos = $P10."pos"()
    (rx256_rep) = rx256_cur."!mark_commit"($I267)
    rx256_cur."!mark_push"(rx256_rep, rx256_pos, $I267)
    goto rxquantr263_loop
  rxquantr263_done:
  # rx subrule "ws" subtype=method negate=
    rx256_cur."!cursor_pos"(rx256_pos)
    $P10 = rx256_cur."ws"()
    unless $P10, rx256_fail
    rx256_pos = $P10."pos"()
.annotate 'line', 158
  # rx rxquantr269 ** 0..1
    set_addr $I273, rxquantr269_done
    rx256_cur."!mark_push"(0, rx256_pos, $I273)
  rxquantr269_loop:
  # rx subrule "ws" subtype=method negate=
    rx256_cur."!cursor_pos"(rx256_pos)
    $P10 = rx256_cur."ws"()
    unless $P10, rx256_fail
    rx256_pos = $P10."pos"()
  # rx literal  "else"
    add $I11, rx256_pos, 4
    gt $I11, rx256_eos, rx256_fail
    sub $I11, rx256_pos, rx256_off
    substr $S10, rx256_tgt, $I11, 4
    ne $S10, "else", rx256_fail
    add rx256_pos, 4
  # rx charclass s
    ge rx256_pos, rx256_eos, rx256_fail
    sub $I10, rx256_pos, rx256_off
    is_cclass $I11, 32, rx256_tgt, $I10
    unless $I11, rx256_fail
    inc rx256_pos
  # rx subrule "ws" subtype=method negate=
    rx256_cur."!cursor_pos"(rx256_pos)
    $P10 = rx256_cur."ws"()
    unless $P10, rx256_fail
    rx256_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx256_cur."!cursor_pos"(rx256_pos)
    $P10 = rx256_cur."pblock"()
    unless $P10, rx256_fail
    rx256_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("else")
    rx256_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx256_cur."!cursor_pos"(rx256_pos)
    $P10 = rx256_cur."ws"()
    unless $P10, rx256_fail
    rx256_pos = $P10."pos"()
    (rx256_rep) = rx256_cur."!mark_commit"($I273)
  rxquantr269_done:
  # rx subrule "ws" subtype=method negate=
    rx256_cur."!cursor_pos"(rx256_pos)
    $P10 = rx256_cur."ws"()
    unless $P10, rx256_fail
    rx256_pos = $P10."pos"()
.annotate 'line', 154
  # rx pass
    rx256_cur."!cursor_pass"(rx256_pos, "statement_control:sym<if>")
    rx256_cur."!cursor_debug"("PASS  ", "statement_control:sym<if>", " at pos=", rx256_pos)
    .return (rx256_cur)
  rx256_fail:
.annotate 'line', 4
    (rx256_rep, rx256_pos, $I10, $P10) = rx256_cur."!mark_fail"(0)
    lt rx256_pos, -1, rx256_done
    eq rx256_pos, -1, rx256_fail
    jump $I10
  rx256_done:
    rx256_cur."!cursor_fail"()
    rx256_cur."!cursor_debug"("FAIL  ", "statement_control:sym<if>")
    .return (rx256_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<if>"  :subid("61_1273884026.76819") :method
.annotate 'line', 4
    new $P258, "ResizablePMCArray"
    push $P258, "if"
    .return ($P258)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("62_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .const 'Sub' $P286 = "64_1273884026.76819" 
    capture_lex $P286
    .local string rx276_tgt
    .local int rx276_pos
    .local int rx276_off
    .local int rx276_eos
    .local int rx276_rep
    .local pmc rx276_cur
    (rx276_cur, rx276_pos, rx276_tgt) = self."!cursor_start"()
    rx276_cur."!cursor_debug"("START ", "statement_control:sym<unless>")
    .lex unicode:"$\x{a2}", rx276_cur
    .local pmc match
    .lex "$/", match
    length rx276_eos, rx276_tgt
    set rx276_off, 0
    lt rx276_pos, 2, rx276_start
    sub rx276_off, rx276_pos, 1
    substr rx276_tgt, rx276_tgt, rx276_off
  rx276_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan279_done
    goto rxscan279_scan
  rxscan279_loop:
    ($P10) = rx276_cur."from"()
    inc $P10
    set rx276_pos, $P10
    ge rx276_pos, rx276_eos, rxscan279_done
  rxscan279_scan:
    set_addr $I10, rxscan279_loop
    rx276_cur."!mark_push"(0, rx276_pos, $I10)
  rxscan279_done:
.annotate 'line', 162
  # rx subcapture "sym"
    set_addr $I10, rxcap_280_fail
    rx276_cur."!mark_push"(0, rx276_pos, $I10)
  # rx literal  "unless"
    add $I11, rx276_pos, 6
    gt $I11, rx276_eos, rx276_fail
    sub $I11, rx276_pos, rx276_off
    substr $S10, rx276_tgt, $I11, 6
    ne $S10, "unless", rx276_fail
    add rx276_pos, 6
    set_addr $I10, rxcap_280_fail
    ($I12, $I11) = rx276_cur."!mark_peek"($I10)
    rx276_cur."!cursor_pos"($I11)
    ($P10) = rx276_cur."!cursor_start"()
    $P10."!cursor_pass"(rx276_pos, "")
    rx276_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_280_done
  rxcap_280_fail:
    goto rx276_fail
  rxcap_280_done:
  # rx charclass s
    ge rx276_pos, rx276_eos, rx276_fail
    sub $I10, rx276_pos, rx276_off
    is_cclass $I11, 32, rx276_tgt, $I10
    unless $I11, rx276_fail
    inc rx276_pos
  # rx subrule "ws" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."ws"()
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
.annotate 'line', 163
  # rx subrule "xblock" subtype=capture negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."xblock"()
    unless $P10, rx276_fail
    rx276_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx276_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."ws"()
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
  alt283_0:
.annotate 'line', 164
    set_addr $I10, alt283_1
    rx276_cur."!mark_push"(0, rx276_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."ws"()
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
  # rx subrule "before" subtype=zerowidth negate=1
    rx276_cur."!cursor_pos"(rx276_pos)
    .const 'Sub' $P286 = "64_1273884026.76819" 
    capture_lex $P286
    $P10 = rx276_cur."before"($P286)
    if $P10, rx276_fail
  # rx subrule "ws" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."ws"()
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
    goto alt283_end
  alt283_1:
  # rx subrule "ws" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."ws"()
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."panic"("unless does not take \"else\", please rewrite using \"if\"")
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."ws"()
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
  alt283_end:
  # rx subrule "ws" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."ws"()
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
.annotate 'line', 161
  # rx pass
    rx276_cur."!cursor_pass"(rx276_pos, "statement_control:sym<unless>")
    rx276_cur."!cursor_debug"("PASS  ", "statement_control:sym<unless>", " at pos=", rx276_pos)
    .return (rx276_cur)
  rx276_fail:
.annotate 'line', 4
    (rx276_rep, rx276_pos, $I10, $P10) = rx276_cur."!mark_fail"(0)
    lt rx276_pos, -1, rx276_done
    eq rx276_pos, -1, rx276_fail
    jump $I10
  rx276_done:
    rx276_cur."!cursor_fail"()
    rx276_cur."!cursor_debug"("FAIL  ", "statement_control:sym<unless>")
    .return (rx276_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<unless>"  :subid("63_1273884026.76819") :method
.annotate 'line', 4
    new $P278, "ResizablePMCArray"
    push $P278, "unless"
    .return ($P278)
.end


.namespace ["NQP";"Grammar"]
.sub "_block285"  :anon :subid("64_1273884026.76819") :method :outer("62_1273884026.76819")
.annotate 'line', 164
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
.sub "statement_control:sym<while>"  :subid("65_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
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
.annotate 'line', 168
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
.annotate 'line', 169
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
.annotate 'line', 167
  # rx pass
    rx294_cur."!cursor_pass"(rx294_pos, "statement_control:sym<while>")
    rx294_cur."!cursor_debug"("PASS  ", "statement_control:sym<while>", " at pos=", rx294_pos)
    .return (rx294_cur)
  rx294_fail:
.annotate 'line', 4
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
.sub "!PREFIX__statement_control:sym<while>"  :subid("66_1273884026.76819") :method
.annotate 'line', 4
    new $P296, "ResizablePMCArray"
    push $P296, "until"
    push $P296, "while"
    .return ($P296)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("67_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
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
.annotate 'line', 173
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
.annotate 'line', 174
    set_addr $I10, alt309_1
    rx303_cur."!mark_push"(0, rx303_pos, $I10)
.annotate 'line', 175
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
.annotate 'line', 176
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
.annotate 'line', 177
  # rx subrule "ws" subtype=method negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."ws"()
    unless $P10, rx303_fail
    rx303_pos = $P10."pos"()
.annotate 'line', 172
  # rx pass
    rx303_cur."!cursor_pass"(rx303_pos, "statement_control:sym<repeat>")
    rx303_cur."!cursor_debug"("PASS  ", "statement_control:sym<repeat>", " at pos=", rx303_pos)
    .return (rx303_cur)
  rx303_fail:
.annotate 'line', 4
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
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("68_1273884026.76819") :method
.annotate 'line', 4
    new $P305, "ResizablePMCArray"
    push $P305, "repeat"
    .return ($P305)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("69_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
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
.annotate 'line', 181
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
.annotate 'line', 182
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
.annotate 'line', 180
  # rx pass
    rx323_cur."!cursor_pass"(rx323_pos, "statement_control:sym<for>")
    rx323_cur."!cursor_debug"("PASS  ", "statement_control:sym<for>", " at pos=", rx323_pos)
    .return (rx323_cur)
  rx323_fail:
.annotate 'line', 4
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
.sub "!PREFIX__statement_control:sym<for>"  :subid("70_1273884026.76819") :method
.annotate 'line', 4
    new $P325, "ResizablePMCArray"
    push $P325, "for"
    .return ($P325)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CATCH>"  :subid("71_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx331_tgt
    .local int rx331_pos
    .local int rx331_off
    .local int rx331_eos
    .local int rx331_rep
    .local pmc rx331_cur
    (rx331_cur, rx331_pos, rx331_tgt) = self."!cursor_start"()
    rx331_cur."!cursor_debug"("START ", "statement_control:sym<CATCH>")
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
.annotate 'line', 186
  # rx subcapture "sym"
    set_addr $I10, rxcap_335_fail
    rx331_cur."!mark_push"(0, rx331_pos, $I10)
  # rx literal  "CATCH"
    add $I11, rx331_pos, 5
    gt $I11, rx331_eos, rx331_fail
    sub $I11, rx331_pos, rx331_off
    substr $S10, rx331_tgt, $I11, 5
    ne $S10, "CATCH", rx331_fail
    add rx331_pos, 5
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
.annotate 'line', 187
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
.annotate 'line', 185
  # rx pass
    rx331_cur."!cursor_pass"(rx331_pos, "statement_control:sym<CATCH>")
    rx331_cur."!cursor_debug"("PASS  ", "statement_control:sym<CATCH>", " at pos=", rx331_pos)
    .return (rx331_cur)
  rx331_fail:
.annotate 'line', 4
    (rx331_rep, rx331_pos, $I10, $P10) = rx331_cur."!mark_fail"(0)
    lt rx331_pos, -1, rx331_done
    eq rx331_pos, -1, rx331_fail
    jump $I10
  rx331_done:
    rx331_cur."!cursor_fail"()
    rx331_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CATCH>")
    .return (rx331_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CATCH>"  :subid("72_1273884026.76819") :method
.annotate 'line', 4
    new $P333, "ResizablePMCArray"
    push $P333, "CATCH"
    .return ($P333)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CONTROL>"  :subid("73_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx339_tgt
    .local int rx339_pos
    .local int rx339_off
    .local int rx339_eos
    .local int rx339_rep
    .local pmc rx339_cur
    (rx339_cur, rx339_pos, rx339_tgt) = self."!cursor_start"()
    rx339_cur."!cursor_debug"("START ", "statement_control:sym<CONTROL>")
    .lex unicode:"$\x{a2}", rx339_cur
    .local pmc match
    .lex "$/", match
    length rx339_eos, rx339_tgt
    set rx339_off, 0
    lt rx339_pos, 2, rx339_start
    sub rx339_off, rx339_pos, 1
    substr rx339_tgt, rx339_tgt, rx339_off
  rx339_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan342_done
    goto rxscan342_scan
  rxscan342_loop:
    ($P10) = rx339_cur."from"()
    inc $P10
    set rx339_pos, $P10
    ge rx339_pos, rx339_eos, rxscan342_done
  rxscan342_scan:
    set_addr $I10, rxscan342_loop
    rx339_cur."!mark_push"(0, rx339_pos, $I10)
  rxscan342_done:
.annotate 'line', 191
  # rx subcapture "sym"
    set_addr $I10, rxcap_343_fail
    rx339_cur."!mark_push"(0, rx339_pos, $I10)
  # rx literal  "CONTROL"
    add $I11, rx339_pos, 7
    gt $I11, rx339_eos, rx339_fail
    sub $I11, rx339_pos, rx339_off
    substr $S10, rx339_tgt, $I11, 7
    ne $S10, "CONTROL", rx339_fail
    add rx339_pos, 7
    set_addr $I10, rxcap_343_fail
    ($I12, $I11) = rx339_cur."!mark_peek"($I10)
    rx339_cur."!cursor_pos"($I11)
    ($P10) = rx339_cur."!cursor_start"()
    $P10."!cursor_pass"(rx339_pos, "")
    rx339_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_343_done
  rxcap_343_fail:
    goto rx339_fail
  rxcap_343_done:
  # rx charclass s
    ge rx339_pos, rx339_eos, rx339_fail
    sub $I10, rx339_pos, rx339_off
    is_cclass $I11, 32, rx339_tgt, $I10
    unless $I11, rx339_fail
    inc rx339_pos
  # rx subrule "ws" subtype=method negate=
    rx339_cur."!cursor_pos"(rx339_pos)
    $P10 = rx339_cur."ws"()
    unless $P10, rx339_fail
    rx339_pos = $P10."pos"()
.annotate 'line', 192
  # rx subrule "block" subtype=capture negate=
    rx339_cur."!cursor_pos"(rx339_pos)
    $P10 = rx339_cur."block"()
    unless $P10, rx339_fail
    rx339_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx339_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx339_cur."!cursor_pos"(rx339_pos)
    $P10 = rx339_cur."ws"()
    unless $P10, rx339_fail
    rx339_pos = $P10."pos"()
.annotate 'line', 190
  # rx pass
    rx339_cur."!cursor_pass"(rx339_pos, "statement_control:sym<CONTROL>")
    rx339_cur."!cursor_debug"("PASS  ", "statement_control:sym<CONTROL>", " at pos=", rx339_pos)
    .return (rx339_cur)
  rx339_fail:
.annotate 'line', 4
    (rx339_rep, rx339_pos, $I10, $P10) = rx339_cur."!mark_fail"(0)
    lt rx339_pos, -1, rx339_done
    eq rx339_pos, -1, rx339_fail
    jump $I10
  rx339_done:
    rx339_cur."!cursor_fail"()
    rx339_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CONTROL>")
    .return (rx339_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CONTROL>"  :subid("74_1273884026.76819") :method
.annotate 'line', 4
    new $P341, "ResizablePMCArray"
    push $P341, "CONTROL"
    .return ($P341)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("75_1273884026.76819") :method
.annotate 'line', 195
    $P347 = self."!protoregex"("statement_prefix")
    .return ($P347)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("76_1273884026.76819") :method
.annotate 'line', 195
    $P349 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P349)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("77_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx351_tgt
    .local int rx351_pos
    .local int rx351_off
    .local int rx351_eos
    .local int rx351_rep
    .local pmc rx351_cur
    (rx351_cur, rx351_pos, rx351_tgt) = self."!cursor_start"()
    rx351_cur."!cursor_debug"("START ", "statement_prefix:sym<INIT>")
    .lex unicode:"$\x{a2}", rx351_cur
    .local pmc match
    .lex "$/", match
    length rx351_eos, rx351_tgt
    set rx351_off, 0
    lt rx351_pos, 2, rx351_start
    sub rx351_off, rx351_pos, 1
    substr rx351_tgt, rx351_tgt, rx351_off
  rx351_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan355_done
    goto rxscan355_scan
  rxscan355_loop:
    ($P10) = rx351_cur."from"()
    inc $P10
    set rx351_pos, $P10
    ge rx351_pos, rx351_eos, rxscan355_done
  rxscan355_scan:
    set_addr $I10, rxscan355_loop
    rx351_cur."!mark_push"(0, rx351_pos, $I10)
  rxscan355_done:
.annotate 'line', 196
  # rx subcapture "sym"
    set_addr $I10, rxcap_356_fail
    rx351_cur."!mark_push"(0, rx351_pos, $I10)
  # rx literal  "INIT"
    add $I11, rx351_pos, 4
    gt $I11, rx351_eos, rx351_fail
    sub $I11, rx351_pos, rx351_off
    substr $S10, rx351_tgt, $I11, 4
    ne $S10, "INIT", rx351_fail
    add rx351_pos, 4
    set_addr $I10, rxcap_356_fail
    ($I12, $I11) = rx351_cur."!mark_peek"($I10)
    rx351_cur."!cursor_pos"($I11)
    ($P10) = rx351_cur."!cursor_start"()
    $P10."!cursor_pass"(rx351_pos, "")
    rx351_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_356_done
  rxcap_356_fail:
    goto rx351_fail
  rxcap_356_done:
  # rx subrule "blorst" subtype=capture negate=
    rx351_cur."!cursor_pos"(rx351_pos)
    $P10 = rx351_cur."blorst"()
    unless $P10, rx351_fail
    rx351_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx351_pos = $P10."pos"()
  # rx pass
    rx351_cur."!cursor_pass"(rx351_pos, "statement_prefix:sym<INIT>")
    rx351_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<INIT>", " at pos=", rx351_pos)
    .return (rx351_cur)
  rx351_fail:
.annotate 'line', 4
    (rx351_rep, rx351_pos, $I10, $P10) = rx351_cur."!mark_fail"(0)
    lt rx351_pos, -1, rx351_done
    eq rx351_pos, -1, rx351_fail
    jump $I10
  rx351_done:
    rx351_cur."!cursor_fail"()
    rx351_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<INIT>")
    .return (rx351_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("78_1273884026.76819") :method
.annotate 'line', 4
    $P353 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P354, "ResizablePMCArray"
    push $P354, $P353
    .return ($P354)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<try>"  :subid("79_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx358_tgt
    .local int rx358_pos
    .local int rx358_off
    .local int rx358_eos
    .local int rx358_rep
    .local pmc rx358_cur
    (rx358_cur, rx358_pos, rx358_tgt) = self."!cursor_start"()
    rx358_cur."!cursor_debug"("START ", "statement_prefix:sym<try>")
    .lex unicode:"$\x{a2}", rx358_cur
    .local pmc match
    .lex "$/", match
    length rx358_eos, rx358_tgt
    set rx358_off, 0
    lt rx358_pos, 2, rx358_start
    sub rx358_off, rx358_pos, 1
    substr rx358_tgt, rx358_tgt, rx358_off
  rx358_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan362_done
    goto rxscan362_scan
  rxscan362_loop:
    ($P10) = rx358_cur."from"()
    inc $P10
    set rx358_pos, $P10
    ge rx358_pos, rx358_eos, rxscan362_done
  rxscan362_scan:
    set_addr $I10, rxscan362_loop
    rx358_cur."!mark_push"(0, rx358_pos, $I10)
  rxscan362_done:
.annotate 'line', 199
  # rx subcapture "sym"
    set_addr $I10, rxcap_363_fail
    rx358_cur."!mark_push"(0, rx358_pos, $I10)
  # rx literal  "try"
    add $I11, rx358_pos, 3
    gt $I11, rx358_eos, rx358_fail
    sub $I11, rx358_pos, rx358_off
    substr $S10, rx358_tgt, $I11, 3
    ne $S10, "try", rx358_fail
    add rx358_pos, 3
    set_addr $I10, rxcap_363_fail
    ($I12, $I11) = rx358_cur."!mark_peek"($I10)
    rx358_cur."!cursor_pos"($I11)
    ($P10) = rx358_cur."!cursor_start"()
    $P10."!cursor_pass"(rx358_pos, "")
    rx358_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_363_done
  rxcap_363_fail:
    goto rx358_fail
  rxcap_363_done:
.annotate 'line', 200
  # rx subrule "blorst" subtype=capture negate=
    rx358_cur."!cursor_pos"(rx358_pos)
    $P10 = rx358_cur."blorst"()
    unless $P10, rx358_fail
    rx358_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx358_pos = $P10."pos"()
.annotate 'line', 198
  # rx pass
    rx358_cur."!cursor_pass"(rx358_pos, "statement_prefix:sym<try>")
    rx358_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<try>", " at pos=", rx358_pos)
    .return (rx358_cur)
  rx358_fail:
.annotate 'line', 4
    (rx358_rep, rx358_pos, $I10, $P10) = rx358_cur."!mark_fail"(0)
    lt rx358_pos, -1, rx358_done
    eq rx358_pos, -1, rx358_fail
    jump $I10
  rx358_done:
    rx358_cur."!cursor_fail"()
    rx358_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<try>")
    .return (rx358_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<try>"  :subid("80_1273884026.76819") :method
.annotate 'line', 4
    $P360 = self."!PREFIX__!subrule"("blorst", "try")
    new $P361, "ResizablePMCArray"
    push $P361, $P360
    .return ($P361)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("81_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx365_tgt
    .local int rx365_pos
    .local int rx365_off
    .local int rx365_eos
    .local int rx365_rep
    .local pmc rx365_cur
    (rx365_cur, rx365_pos, rx365_tgt) = self."!cursor_start"()
    rx365_cur."!cursor_debug"("START ", "blorst")
    .lex unicode:"$\x{a2}", rx365_cur
    .local pmc match
    .lex "$/", match
    length rx365_eos, rx365_tgt
    set rx365_off, 0
    lt rx365_pos, 2, rx365_start
    sub rx365_off, rx365_pos, 1
    substr rx365_tgt, rx365_tgt, rx365_off
  rx365_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan368_done
    goto rxscan368_scan
  rxscan368_loop:
    ($P10) = rx365_cur."from"()
    inc $P10
    set rx365_pos, $P10
    ge rx365_pos, rx365_eos, rxscan368_done
  rxscan368_scan:
    set_addr $I10, rxscan368_loop
    rx365_cur."!mark_push"(0, rx365_pos, $I10)
  rxscan368_done:
.annotate 'line', 204
  # rx charclass s
    ge rx365_pos, rx365_eos, rx365_fail
    sub $I10, rx365_pos, rx365_off
    is_cclass $I11, 32, rx365_tgt, $I10
    unless $I11, rx365_fail
    inc rx365_pos
  # rx subrule "ws" subtype=method negate=
    rx365_cur."!cursor_pos"(rx365_pos)
    $P10 = rx365_cur."ws"()
    unless $P10, rx365_fail
    rx365_pos = $P10."pos"()
  alt369_0:
    set_addr $I10, alt369_1
    rx365_cur."!mark_push"(0, rx365_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx365_pos, rx365_eos, rx365_fail
    sub $I10, rx365_pos, rx365_off
    substr $S10, rx365_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx365_fail
  # rx subrule "block" subtype=capture negate=
    rx365_cur."!cursor_pos"(rx365_pos)
    $P10 = rx365_cur."block"()
    unless $P10, rx365_fail
    rx365_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx365_pos = $P10."pos"()
    goto alt369_end
  alt369_1:
  # rx subrule "statement" subtype=capture negate=
    rx365_cur."!cursor_pos"(rx365_pos)
    $P10 = rx365_cur."statement"()
    unless $P10, rx365_fail
    rx365_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx365_pos = $P10."pos"()
  alt369_end:
.annotate 'line', 203
  # rx pass
    rx365_cur."!cursor_pass"(rx365_pos, "blorst")
    rx365_cur."!cursor_debug"("PASS  ", "blorst", " at pos=", rx365_pos)
    .return (rx365_cur)
  rx365_fail:
.annotate 'line', 4
    (rx365_rep, rx365_pos, $I10, $P10) = rx365_cur."!mark_fail"(0)
    lt rx365_pos, -1, rx365_done
    eq rx365_pos, -1, rx365_fail
    jump $I10
  rx365_done:
    rx365_cur."!cursor_fail"()
    rx365_cur."!cursor_debug"("FAIL  ", "blorst")
    .return (rx365_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blorst"  :subid("82_1273884026.76819") :method
.annotate 'line', 4
    new $P367, "ResizablePMCArray"
    push $P367, ""
    .return ($P367)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("83_1273884026.76819") :method
.annotate 'line', 209
    $P371 = self."!protoregex"("statement_mod_cond")
    .return ($P371)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("84_1273884026.76819") :method
.annotate 'line', 209
    $P373 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P373)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("85_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx375_tgt
    .local int rx375_pos
    .local int rx375_off
    .local int rx375_eos
    .local int rx375_rep
    .local pmc rx375_cur
    (rx375_cur, rx375_pos, rx375_tgt) = self."!cursor_start"()
    rx375_cur."!cursor_debug"("START ", "statement_mod_cond:sym<if>")
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
.annotate 'line', 211
  # rx subcapture "sym"
    set_addr $I10, rxcap_379_fail
    rx375_cur."!mark_push"(0, rx375_pos, $I10)
  # rx literal  "if"
    add $I11, rx375_pos, 2
    gt $I11, rx375_eos, rx375_fail
    sub $I11, rx375_pos, rx375_off
    substr $S10, rx375_tgt, $I11, 2
    ne $S10, "if", rx375_fail
    add rx375_pos, 2
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
    rx375_cur."!cursor_pass"(rx375_pos, "statement_mod_cond:sym<if>")
    rx375_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<if>", " at pos=", rx375_pos)
    .return (rx375_cur)
  rx375_fail:
.annotate 'line', 4
    (rx375_rep, rx375_pos, $I10, $P10) = rx375_cur."!mark_fail"(0)
    lt rx375_pos, -1, rx375_done
    eq rx375_pos, -1, rx375_fail
    jump $I10
  rx375_done:
    rx375_cur."!cursor_fail"()
    rx375_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<if>")
    .return (rx375_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("86_1273884026.76819") :method
.annotate 'line', 4
    new $P377, "ResizablePMCArray"
    push $P377, "if"
    .return ($P377)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("87_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx383_tgt
    .local int rx383_pos
    .local int rx383_off
    .local int rx383_eos
    .local int rx383_rep
    .local pmc rx383_cur
    (rx383_cur, rx383_pos, rx383_tgt) = self."!cursor_start"()
    rx383_cur."!cursor_debug"("START ", "statement_mod_cond:sym<unless>")
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
.annotate 'line', 212
  # rx subcapture "sym"
    set_addr $I10, rxcap_387_fail
    rx383_cur."!mark_push"(0, rx383_pos, $I10)
  # rx literal  "unless"
    add $I11, rx383_pos, 6
    gt $I11, rx383_eos, rx383_fail
    sub $I11, rx383_pos, rx383_off
    substr $S10, rx383_tgt, $I11, 6
    ne $S10, "unless", rx383_fail
    add rx383_pos, 6
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
    rx383_cur."!cursor_pass"(rx383_pos, "statement_mod_cond:sym<unless>")
    rx383_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<unless>", " at pos=", rx383_pos)
    .return (rx383_cur)
  rx383_fail:
.annotate 'line', 4
    (rx383_rep, rx383_pos, $I10, $P10) = rx383_cur."!mark_fail"(0)
    lt rx383_pos, -1, rx383_done
    eq rx383_pos, -1, rx383_fail
    jump $I10
  rx383_done:
    rx383_cur."!cursor_fail"()
    rx383_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<unless>")
    .return (rx383_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("88_1273884026.76819") :method
.annotate 'line', 4
    new $P385, "ResizablePMCArray"
    push $P385, "unless"
    .return ($P385)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("89_1273884026.76819") :method
.annotate 'line', 214
    $P391 = self."!protoregex"("statement_mod_loop")
    .return ($P391)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("90_1273884026.76819") :method
.annotate 'line', 214
    $P393 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P393)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("91_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx395_tgt
    .local int rx395_pos
    .local int rx395_off
    .local int rx395_eos
    .local int rx395_rep
    .local pmc rx395_cur
    (rx395_cur, rx395_pos, rx395_tgt) = self."!cursor_start"()
    rx395_cur."!cursor_debug"("START ", "statement_mod_loop:sym<while>")
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
.annotate 'line', 216
  # rx subcapture "sym"
    set_addr $I10, rxcap_399_fail
    rx395_cur."!mark_push"(0, rx395_pos, $I10)
  # rx literal  "while"
    add $I11, rx395_pos, 5
    gt $I11, rx395_eos, rx395_fail
    sub $I11, rx395_pos, rx395_off
    substr $S10, rx395_tgt, $I11, 5
    ne $S10, "while", rx395_fail
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
    rx395_cur."!cursor_pass"(rx395_pos, "statement_mod_loop:sym<while>")
    rx395_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<while>", " at pos=", rx395_pos)
    .return (rx395_cur)
  rx395_fail:
.annotate 'line', 4
    (rx395_rep, rx395_pos, $I10, $P10) = rx395_cur."!mark_fail"(0)
    lt rx395_pos, -1, rx395_done
    eq rx395_pos, -1, rx395_fail
    jump $I10
  rx395_done:
    rx395_cur."!cursor_fail"()
    rx395_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<while>")
    .return (rx395_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("92_1273884026.76819") :method
.annotate 'line', 4
    new $P397, "ResizablePMCArray"
    push $P397, "while"
    .return ($P397)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("93_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx403_tgt
    .local int rx403_pos
    .local int rx403_off
    .local int rx403_eos
    .local int rx403_rep
    .local pmc rx403_cur
    (rx403_cur, rx403_pos, rx403_tgt) = self."!cursor_start"()
    rx403_cur."!cursor_debug"("START ", "statement_mod_loop:sym<until>")
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
    ne $I10, -1, rxscan406_done
    goto rxscan406_scan
  rxscan406_loop:
    ($P10) = rx403_cur."from"()
    inc $P10
    set rx403_pos, $P10
    ge rx403_pos, rx403_eos, rxscan406_done
  rxscan406_scan:
    set_addr $I10, rxscan406_loop
    rx403_cur."!mark_push"(0, rx403_pos, $I10)
  rxscan406_done:
.annotate 'line', 217
  # rx subcapture "sym"
    set_addr $I10, rxcap_407_fail
    rx403_cur."!mark_push"(0, rx403_pos, $I10)
  # rx literal  "until"
    add $I11, rx403_pos, 5
    gt $I11, rx403_eos, rx403_fail
    sub $I11, rx403_pos, rx403_off
    substr $S10, rx403_tgt, $I11, 5
    ne $S10, "until", rx403_fail
    add rx403_pos, 5
    set_addr $I10, rxcap_407_fail
    ($I12, $I11) = rx403_cur."!mark_peek"($I10)
    rx403_cur."!cursor_pos"($I11)
    ($P10) = rx403_cur."!cursor_start"()
    $P10."!cursor_pass"(rx403_pos, "")
    rx403_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_407_done
  rxcap_407_fail:
    goto rx403_fail
  rxcap_407_done:
  # rx subrule "ws" subtype=method negate=
    rx403_cur."!cursor_pos"(rx403_pos)
    $P10 = rx403_cur."ws"()
    unless $P10, rx403_fail
    rx403_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx403_cur."!cursor_pos"(rx403_pos)
    $P10 = rx403_cur."EXPR"()
    unless $P10, rx403_fail
    rx403_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx403_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx403_cur."!cursor_pos"(rx403_pos)
    $P10 = rx403_cur."ws"()
    unless $P10, rx403_fail
    rx403_pos = $P10."pos"()
  # rx pass
    rx403_cur."!cursor_pass"(rx403_pos, "statement_mod_loop:sym<until>")
    rx403_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<until>", " at pos=", rx403_pos)
    .return (rx403_cur)
  rx403_fail:
.annotate 'line', 4
    (rx403_rep, rx403_pos, $I10, $P10) = rx403_cur."!mark_fail"(0)
    lt rx403_pos, -1, rx403_done
    eq rx403_pos, -1, rx403_fail
    jump $I10
  rx403_done:
    rx403_cur."!cursor_fail"()
    rx403_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<until>")
    .return (rx403_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("94_1273884026.76819") :method
.annotate 'line', 4
    new $P405, "ResizablePMCArray"
    push $P405, "until"
    .return ($P405)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<fatarrow>"  :subid("95_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx411_tgt
    .local int rx411_pos
    .local int rx411_off
    .local int rx411_eos
    .local int rx411_rep
    .local pmc rx411_cur
    (rx411_cur, rx411_pos, rx411_tgt) = self."!cursor_start"()
    rx411_cur."!cursor_debug"("START ", "term:sym<fatarrow>")
    .lex unicode:"$\x{a2}", rx411_cur
    .local pmc match
    .lex "$/", match
    length rx411_eos, rx411_tgt
    set rx411_off, 0
    lt rx411_pos, 2, rx411_start
    sub rx411_off, rx411_pos, 1
    substr rx411_tgt, rx411_tgt, rx411_off
  rx411_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan415_done
    goto rxscan415_scan
  rxscan415_loop:
    ($P10) = rx411_cur."from"()
    inc $P10
    set rx411_pos, $P10
    ge rx411_pos, rx411_eos, rxscan415_done
  rxscan415_scan:
    set_addr $I10, rxscan415_loop
    rx411_cur."!mark_push"(0, rx411_pos, $I10)
  rxscan415_done:
.annotate 'line', 221
  # rx subrule "fatarrow" subtype=capture negate=
    rx411_cur."!cursor_pos"(rx411_pos)
    $P10 = rx411_cur."fatarrow"()
    unless $P10, rx411_fail
    rx411_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("fatarrow")
    rx411_pos = $P10."pos"()
  # rx pass
    rx411_cur."!cursor_pass"(rx411_pos, "term:sym<fatarrow>")
    rx411_cur."!cursor_debug"("PASS  ", "term:sym<fatarrow>", " at pos=", rx411_pos)
    .return (rx411_cur)
  rx411_fail:
.annotate 'line', 4
    (rx411_rep, rx411_pos, $I10, $P10) = rx411_cur."!mark_fail"(0)
    lt rx411_pos, -1, rx411_done
    eq rx411_pos, -1, rx411_fail
    jump $I10
  rx411_done:
    rx411_cur."!cursor_fail"()
    rx411_cur."!cursor_debug"("FAIL  ", "term:sym<fatarrow>")
    .return (rx411_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<fatarrow>"  :subid("96_1273884026.76819") :method
.annotate 'line', 4
    $P413 = self."!PREFIX__!subrule"("fatarrow", "")
    new $P414, "ResizablePMCArray"
    push $P414, $P413
    .return ($P414)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("97_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx417_tgt
    .local int rx417_pos
    .local int rx417_off
    .local int rx417_eos
    .local int rx417_rep
    .local pmc rx417_cur
    (rx417_cur, rx417_pos, rx417_tgt) = self."!cursor_start"()
    rx417_cur."!cursor_debug"("START ", "term:sym<colonpair>")
    .lex unicode:"$\x{a2}", rx417_cur
    .local pmc match
    .lex "$/", match
    length rx417_eos, rx417_tgt
    set rx417_off, 0
    lt rx417_pos, 2, rx417_start
    sub rx417_off, rx417_pos, 1
    substr rx417_tgt, rx417_tgt, rx417_off
  rx417_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan421_done
    goto rxscan421_scan
  rxscan421_loop:
    ($P10) = rx417_cur."from"()
    inc $P10
    set rx417_pos, $P10
    ge rx417_pos, rx417_eos, rxscan421_done
  rxscan421_scan:
    set_addr $I10, rxscan421_loop
    rx417_cur."!mark_push"(0, rx417_pos, $I10)
  rxscan421_done:
.annotate 'line', 222
  # rx subrule "colonpair" subtype=capture negate=
    rx417_cur."!cursor_pos"(rx417_pos)
    $P10 = rx417_cur."colonpair"()
    unless $P10, rx417_fail
    rx417_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx417_pos = $P10."pos"()
  # rx pass
    rx417_cur."!cursor_pass"(rx417_pos, "term:sym<colonpair>")
    rx417_cur."!cursor_debug"("PASS  ", "term:sym<colonpair>", " at pos=", rx417_pos)
    .return (rx417_cur)
  rx417_fail:
.annotate 'line', 4
    (rx417_rep, rx417_pos, $I10, $P10) = rx417_cur."!mark_fail"(0)
    lt rx417_pos, -1, rx417_done
    eq rx417_pos, -1, rx417_fail
    jump $I10
  rx417_done:
    rx417_cur."!cursor_fail"()
    rx417_cur."!cursor_debug"("FAIL  ", "term:sym<colonpair>")
    .return (rx417_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("98_1273884026.76819") :method
.annotate 'line', 4
    $P419 = self."!PREFIX__!subrule"("colonpair", "")
    new $P420, "ResizablePMCArray"
    push $P420, $P419
    .return ($P420)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("99_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx423_tgt
    .local int rx423_pos
    .local int rx423_off
    .local int rx423_eos
    .local int rx423_rep
    .local pmc rx423_cur
    (rx423_cur, rx423_pos, rx423_tgt) = self."!cursor_start"()
    rx423_cur."!cursor_debug"("START ", "term:sym<variable>")
    .lex unicode:"$\x{a2}", rx423_cur
    .local pmc match
    .lex "$/", match
    length rx423_eos, rx423_tgt
    set rx423_off, 0
    lt rx423_pos, 2, rx423_start
    sub rx423_off, rx423_pos, 1
    substr rx423_tgt, rx423_tgt, rx423_off
  rx423_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan427_done
    goto rxscan427_scan
  rxscan427_loop:
    ($P10) = rx423_cur."from"()
    inc $P10
    set rx423_pos, $P10
    ge rx423_pos, rx423_eos, rxscan427_done
  rxscan427_scan:
    set_addr $I10, rxscan427_loop
    rx423_cur."!mark_push"(0, rx423_pos, $I10)
  rxscan427_done:
.annotate 'line', 223
  # rx subrule "variable" subtype=capture negate=
    rx423_cur."!cursor_pos"(rx423_pos)
    $P10 = rx423_cur."variable"()
    unless $P10, rx423_fail
    rx423_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx423_pos = $P10."pos"()
  # rx pass
    rx423_cur."!cursor_pass"(rx423_pos, "term:sym<variable>")
    rx423_cur."!cursor_debug"("PASS  ", "term:sym<variable>", " at pos=", rx423_pos)
    .return (rx423_cur)
  rx423_fail:
.annotate 'line', 4
    (rx423_rep, rx423_pos, $I10, $P10) = rx423_cur."!mark_fail"(0)
    lt rx423_pos, -1, rx423_done
    eq rx423_pos, -1, rx423_fail
    jump $I10
  rx423_done:
    rx423_cur."!cursor_fail"()
    rx423_cur."!cursor_debug"("FAIL  ", "term:sym<variable>")
    .return (rx423_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("100_1273884026.76819") :method
.annotate 'line', 4
    $P425 = self."!PREFIX__!subrule"("variable", "")
    new $P426, "ResizablePMCArray"
    push $P426, $P425
    .return ($P426)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("101_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx429_tgt
    .local int rx429_pos
    .local int rx429_off
    .local int rx429_eos
    .local int rx429_rep
    .local pmc rx429_cur
    (rx429_cur, rx429_pos, rx429_tgt) = self."!cursor_start"()
    rx429_cur."!cursor_debug"("START ", "term:sym<package_declarator>")
    .lex unicode:"$\x{a2}", rx429_cur
    .local pmc match
    .lex "$/", match
    length rx429_eos, rx429_tgt
    set rx429_off, 0
    lt rx429_pos, 2, rx429_start
    sub rx429_off, rx429_pos, 1
    substr rx429_tgt, rx429_tgt, rx429_off
  rx429_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan433_done
    goto rxscan433_scan
  rxscan433_loop:
    ($P10) = rx429_cur."from"()
    inc $P10
    set rx429_pos, $P10
    ge rx429_pos, rx429_eos, rxscan433_done
  rxscan433_scan:
    set_addr $I10, rxscan433_loop
    rx429_cur."!mark_push"(0, rx429_pos, $I10)
  rxscan433_done:
.annotate 'line', 224
  # rx subrule "package_declarator" subtype=capture negate=
    rx429_cur."!cursor_pos"(rx429_pos)
    $P10 = rx429_cur."package_declarator"()
    unless $P10, rx429_fail
    rx429_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx429_pos = $P10."pos"()
  # rx pass
    rx429_cur."!cursor_pass"(rx429_pos, "term:sym<package_declarator>")
    rx429_cur."!cursor_debug"("PASS  ", "term:sym<package_declarator>", " at pos=", rx429_pos)
    .return (rx429_cur)
  rx429_fail:
.annotate 'line', 4
    (rx429_rep, rx429_pos, $I10, $P10) = rx429_cur."!mark_fail"(0)
    lt rx429_pos, -1, rx429_done
    eq rx429_pos, -1, rx429_fail
    jump $I10
  rx429_done:
    rx429_cur."!cursor_fail"()
    rx429_cur."!cursor_debug"("FAIL  ", "term:sym<package_declarator>")
    .return (rx429_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("102_1273884026.76819") :method
.annotate 'line', 4
    $P431 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P432, "ResizablePMCArray"
    push $P432, $P431
    .return ($P432)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("103_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx435_tgt
    .local int rx435_pos
    .local int rx435_off
    .local int rx435_eos
    .local int rx435_rep
    .local pmc rx435_cur
    (rx435_cur, rx435_pos, rx435_tgt) = self."!cursor_start"()
    rx435_cur."!cursor_debug"("START ", "term:sym<scope_declarator>")
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
    ne $I10, -1, rxscan439_done
    goto rxscan439_scan
  rxscan439_loop:
    ($P10) = rx435_cur."from"()
    inc $P10
    set rx435_pos, $P10
    ge rx435_pos, rx435_eos, rxscan439_done
  rxscan439_scan:
    set_addr $I10, rxscan439_loop
    rx435_cur."!mark_push"(0, rx435_pos, $I10)
  rxscan439_done:
.annotate 'line', 225
  # rx subrule "scope_declarator" subtype=capture negate=
    rx435_cur."!cursor_pos"(rx435_pos)
    $P10 = rx435_cur."scope_declarator"()
    unless $P10, rx435_fail
    rx435_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx435_pos = $P10."pos"()
  # rx pass
    rx435_cur."!cursor_pass"(rx435_pos, "term:sym<scope_declarator>")
    rx435_cur."!cursor_debug"("PASS  ", "term:sym<scope_declarator>", " at pos=", rx435_pos)
    .return (rx435_cur)
  rx435_fail:
.annotate 'line', 4
    (rx435_rep, rx435_pos, $I10, $P10) = rx435_cur."!mark_fail"(0)
    lt rx435_pos, -1, rx435_done
    eq rx435_pos, -1, rx435_fail
    jump $I10
  rx435_done:
    rx435_cur."!cursor_fail"()
    rx435_cur."!cursor_debug"("FAIL  ", "term:sym<scope_declarator>")
    .return (rx435_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("104_1273884026.76819") :method
.annotate 'line', 4
    $P437 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P438, "ResizablePMCArray"
    push $P438, $P437
    .return ($P438)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("105_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx441_tgt
    .local int rx441_pos
    .local int rx441_off
    .local int rx441_eos
    .local int rx441_rep
    .local pmc rx441_cur
    (rx441_cur, rx441_pos, rx441_tgt) = self."!cursor_start"()
    rx441_cur."!cursor_debug"("START ", "term:sym<routine_declarator>")
    .lex unicode:"$\x{a2}", rx441_cur
    .local pmc match
    .lex "$/", match
    length rx441_eos, rx441_tgt
    set rx441_off, 0
    lt rx441_pos, 2, rx441_start
    sub rx441_off, rx441_pos, 1
    substr rx441_tgt, rx441_tgt, rx441_off
  rx441_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan445_done
    goto rxscan445_scan
  rxscan445_loop:
    ($P10) = rx441_cur."from"()
    inc $P10
    set rx441_pos, $P10
    ge rx441_pos, rx441_eos, rxscan445_done
  rxscan445_scan:
    set_addr $I10, rxscan445_loop
    rx441_cur."!mark_push"(0, rx441_pos, $I10)
  rxscan445_done:
.annotate 'line', 226
  # rx subrule "routine_declarator" subtype=capture negate=
    rx441_cur."!cursor_pos"(rx441_pos)
    $P10 = rx441_cur."routine_declarator"()
    unless $P10, rx441_fail
    rx441_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx441_pos = $P10."pos"()
  # rx pass
    rx441_cur."!cursor_pass"(rx441_pos, "term:sym<routine_declarator>")
    rx441_cur."!cursor_debug"("PASS  ", "term:sym<routine_declarator>", " at pos=", rx441_pos)
    .return (rx441_cur)
  rx441_fail:
.annotate 'line', 4
    (rx441_rep, rx441_pos, $I10, $P10) = rx441_cur."!mark_fail"(0)
    lt rx441_pos, -1, rx441_done
    eq rx441_pos, -1, rx441_fail
    jump $I10
  rx441_done:
    rx441_cur."!cursor_fail"()
    rx441_cur."!cursor_debug"("FAIL  ", "term:sym<routine_declarator>")
    .return (rx441_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("106_1273884026.76819") :method
.annotate 'line', 4
    $P443 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P444, "ResizablePMCArray"
    push $P444, $P443
    .return ($P444)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("107_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx447_tgt
    .local int rx447_pos
    .local int rx447_off
    .local int rx447_eos
    .local int rx447_rep
    .local pmc rx447_cur
    (rx447_cur, rx447_pos, rx447_tgt) = self."!cursor_start"()
    rx447_cur."!cursor_debug"("START ", "term:sym<regex_declarator>")
    .lex unicode:"$\x{a2}", rx447_cur
    .local pmc match
    .lex "$/", match
    length rx447_eos, rx447_tgt
    set rx447_off, 0
    lt rx447_pos, 2, rx447_start
    sub rx447_off, rx447_pos, 1
    substr rx447_tgt, rx447_tgt, rx447_off
  rx447_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan451_done
    goto rxscan451_scan
  rxscan451_loop:
    ($P10) = rx447_cur."from"()
    inc $P10
    set rx447_pos, $P10
    ge rx447_pos, rx447_eos, rxscan451_done
  rxscan451_scan:
    set_addr $I10, rxscan451_loop
    rx447_cur."!mark_push"(0, rx447_pos, $I10)
  rxscan451_done:
.annotate 'line', 227
  # rx subrule "regex_declarator" subtype=capture negate=
    rx447_cur."!cursor_pos"(rx447_pos)
    $P10 = rx447_cur."regex_declarator"()
    unless $P10, rx447_fail
    rx447_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx447_pos = $P10."pos"()
  # rx pass
    rx447_cur."!cursor_pass"(rx447_pos, "term:sym<regex_declarator>")
    rx447_cur."!cursor_debug"("PASS  ", "term:sym<regex_declarator>", " at pos=", rx447_pos)
    .return (rx447_cur)
  rx447_fail:
.annotate 'line', 4
    (rx447_rep, rx447_pos, $I10, $P10) = rx447_cur."!mark_fail"(0)
    lt rx447_pos, -1, rx447_done
    eq rx447_pos, -1, rx447_fail
    jump $I10
  rx447_done:
    rx447_cur."!cursor_fail"()
    rx447_cur."!cursor_debug"("FAIL  ", "term:sym<regex_declarator>")
    .return (rx447_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("108_1273884026.76819") :method
.annotate 'line', 4
    $P449 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P450, "ResizablePMCArray"
    push $P450, $P449
    .return ($P450)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("109_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx453_tgt
    .local int rx453_pos
    .local int rx453_off
    .local int rx453_eos
    .local int rx453_rep
    .local pmc rx453_cur
    (rx453_cur, rx453_pos, rx453_tgt) = self."!cursor_start"()
    rx453_cur."!cursor_debug"("START ", "term:sym<statement_prefix>")
    .lex unicode:"$\x{a2}", rx453_cur
    .local pmc match
    .lex "$/", match
    length rx453_eos, rx453_tgt
    set rx453_off, 0
    lt rx453_pos, 2, rx453_start
    sub rx453_off, rx453_pos, 1
    substr rx453_tgt, rx453_tgt, rx453_off
  rx453_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan457_done
    goto rxscan457_scan
  rxscan457_loop:
    ($P10) = rx453_cur."from"()
    inc $P10
    set rx453_pos, $P10
    ge rx453_pos, rx453_eos, rxscan457_done
  rxscan457_scan:
    set_addr $I10, rxscan457_loop
    rx453_cur."!mark_push"(0, rx453_pos, $I10)
  rxscan457_done:
.annotate 'line', 228
  # rx subrule "statement_prefix" subtype=capture negate=
    rx453_cur."!cursor_pos"(rx453_pos)
    $P10 = rx453_cur."statement_prefix"()
    unless $P10, rx453_fail
    rx453_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx453_pos = $P10."pos"()
  # rx pass
    rx453_cur."!cursor_pass"(rx453_pos, "term:sym<statement_prefix>")
    rx453_cur."!cursor_debug"("PASS  ", "term:sym<statement_prefix>", " at pos=", rx453_pos)
    .return (rx453_cur)
  rx453_fail:
.annotate 'line', 4
    (rx453_rep, rx453_pos, $I10, $P10) = rx453_cur."!mark_fail"(0)
    lt rx453_pos, -1, rx453_done
    eq rx453_pos, -1, rx453_fail
    jump $I10
  rx453_done:
    rx453_cur."!cursor_fail"()
    rx453_cur."!cursor_debug"("FAIL  ", "term:sym<statement_prefix>")
    .return (rx453_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("110_1273884026.76819") :method
.annotate 'line', 4
    $P455 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P456, "ResizablePMCArray"
    push $P456, $P455
    .return ($P456)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("111_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx459_tgt
    .local int rx459_pos
    .local int rx459_off
    .local int rx459_eos
    .local int rx459_rep
    .local pmc rx459_cur
    (rx459_cur, rx459_pos, rx459_tgt) = self."!cursor_start"()
    rx459_cur."!cursor_debug"("START ", "term:sym<lambda>")
    .lex unicode:"$\x{a2}", rx459_cur
    .local pmc match
    .lex "$/", match
    length rx459_eos, rx459_tgt
    set rx459_off, 0
    lt rx459_pos, 2, rx459_start
    sub rx459_off, rx459_pos, 1
    substr rx459_tgt, rx459_tgt, rx459_off
  rx459_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan462_done
    goto rxscan462_scan
  rxscan462_loop:
    ($P10) = rx459_cur."from"()
    inc $P10
    set rx459_pos, $P10
    ge rx459_pos, rx459_eos, rxscan462_done
  rxscan462_scan:
    set_addr $I10, rxscan462_loop
    rx459_cur."!mark_push"(0, rx459_pos, $I10)
  rxscan462_done:
.annotate 'line', 229
  # rx subrule "lambda" subtype=zerowidth negate=
    rx459_cur."!cursor_pos"(rx459_pos)
    $P10 = rx459_cur."lambda"()
    unless $P10, rx459_fail
  # rx subrule "pblock" subtype=capture negate=
    rx459_cur."!cursor_pos"(rx459_pos)
    $P10 = rx459_cur."pblock"()
    unless $P10, rx459_fail
    rx459_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx459_pos = $P10."pos"()
  # rx pass
    rx459_cur."!cursor_pass"(rx459_pos, "term:sym<lambda>")
    rx459_cur."!cursor_debug"("PASS  ", "term:sym<lambda>", " at pos=", rx459_pos)
    .return (rx459_cur)
  rx459_fail:
.annotate 'line', 4
    (rx459_rep, rx459_pos, $I10, $P10) = rx459_cur."!mark_fail"(0)
    lt rx459_pos, -1, rx459_done
    eq rx459_pos, -1, rx459_fail
    jump $I10
  rx459_done:
    rx459_cur."!cursor_fail"()
    rx459_cur."!cursor_debug"("FAIL  ", "term:sym<lambda>")
    .return (rx459_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("112_1273884026.76819") :method
.annotate 'line', 4
    new $P461, "ResizablePMCArray"
    push $P461, ""
    .return ($P461)
.end


.namespace ["NQP";"Grammar"]
.sub "fatarrow"  :subid("113_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx464_tgt
    .local int rx464_pos
    .local int rx464_off
    .local int rx464_eos
    .local int rx464_rep
    .local pmc rx464_cur
    (rx464_cur, rx464_pos, rx464_tgt) = self."!cursor_start"()
    rx464_cur."!cursor_debug"("START ", "fatarrow")
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
    ne $I10, -1, rxscan468_done
    goto rxscan468_scan
  rxscan468_loop:
    ($P10) = rx464_cur."from"()
    inc $P10
    set rx464_pos, $P10
    ge rx464_pos, rx464_eos, rxscan468_done
  rxscan468_scan:
    set_addr $I10, rxscan468_loop
    rx464_cur."!mark_push"(0, rx464_pos, $I10)
  rxscan468_done:
.annotate 'line', 232
  # rx subrule "identifier" subtype=capture negate=
    rx464_cur."!cursor_pos"(rx464_pos)
    $P10 = rx464_cur."identifier"()
    unless $P10, rx464_fail
    rx464_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    rx464_pos = $P10."pos"()
  # rx rxquantr469 ** 0..*
    set_addr $I470, rxquantr469_done
    rx464_cur."!mark_push"(0, rx464_pos, $I470)
  rxquantr469_loop:
  # rx enumcharlist negate=0 
    ge rx464_pos, rx464_eos, rx464_fail
    sub $I10, rx464_pos, rx464_off
    substr $S10, rx464_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx464_fail
    inc rx464_pos
    (rx464_rep) = rx464_cur."!mark_commit"($I470)
    rx464_cur."!mark_push"(rx464_rep, rx464_pos, $I470)
    goto rxquantr469_loop
  rxquantr469_done:
  # rx literal  "=>"
    add $I11, rx464_pos, 2
    gt $I11, rx464_eos, rx464_fail
    sub $I11, rx464_pos, rx464_off
    substr $S10, rx464_tgt, $I11, 2
    ne $S10, "=>", rx464_fail
    add rx464_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx464_cur."!cursor_pos"(rx464_pos)
    $P10 = rx464_cur."ws"()
    unless $P10, rx464_fail
    rx464_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx464_cur."!cursor_pos"(rx464_pos)
    $P10 = rx464_cur."EXPR"("i=")
    unless $P10, rx464_fail
    rx464_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("val")
    rx464_pos = $P10."pos"()
.annotate 'line', 231
  # rx pass
    rx464_cur."!cursor_pass"(rx464_pos, "fatarrow")
    rx464_cur."!cursor_debug"("PASS  ", "fatarrow", " at pos=", rx464_pos)
    .return (rx464_cur)
  rx464_fail:
.annotate 'line', 4
    (rx464_rep, rx464_pos, $I10, $P10) = rx464_cur."!mark_fail"(0)
    lt rx464_pos, -1, rx464_done
    eq rx464_pos, -1, rx464_fail
    jump $I10
  rx464_done:
    rx464_cur."!cursor_fail"()
    rx464_cur."!cursor_debug"("FAIL  ", "fatarrow")
    .return (rx464_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__fatarrow"  :subid("114_1273884026.76819") :method
.annotate 'line', 4
    $P466 = self."!PREFIX__!subrule"("key", "")
    new $P467, "ResizablePMCArray"
    push $P467, $P466
    .return ($P467)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("115_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx472_tgt
    .local int rx472_pos
    .local int rx472_off
    .local int rx472_eos
    .local int rx472_rep
    .local pmc rx472_cur
    (rx472_cur, rx472_pos, rx472_tgt) = self."!cursor_start"()
    rx472_cur."!cursor_debug"("START ", "colonpair")
    rx472_cur."!cursor_caparray"("circumfix")
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
    ne $I10, -1, rxscan478_done
    goto rxscan478_scan
  rxscan478_loop:
    ($P10) = rx472_cur."from"()
    inc $P10
    set rx472_pos, $P10
    ge rx472_pos, rx472_eos, rxscan478_done
  rxscan478_scan:
    set_addr $I10, rxscan478_loop
    rx472_cur."!mark_push"(0, rx472_pos, $I10)
  rxscan478_done:
.annotate 'line', 236
  # rx literal  ":"
    add $I11, rx472_pos, 1
    gt $I11, rx472_eos, rx472_fail
    sub $I11, rx472_pos, rx472_off
    substr $S10, rx472_tgt, $I11, 1
    ne $S10, ":", rx472_fail
    add rx472_pos, 1
  alt479_0:
.annotate 'line', 237
    set_addr $I10, alt479_1
    rx472_cur."!mark_push"(0, rx472_pos, $I10)
.annotate 'line', 238
  # rx subcapture "not"
    set_addr $I10, rxcap_480_fail
    rx472_cur."!mark_push"(0, rx472_pos, $I10)
  # rx literal  "!"
    add $I11, rx472_pos, 1
    gt $I11, rx472_eos, rx472_fail
    sub $I11, rx472_pos, rx472_off
    substr $S10, rx472_tgt, $I11, 1
    ne $S10, "!", rx472_fail
    add rx472_pos, 1
    set_addr $I10, rxcap_480_fail
    ($I12, $I11) = rx472_cur."!mark_peek"($I10)
    rx472_cur."!cursor_pos"($I11)
    ($P10) = rx472_cur."!cursor_start"()
    $P10."!cursor_pass"(rx472_pos, "")
    rx472_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_480_done
  rxcap_480_fail:
    goto rx472_fail
  rxcap_480_done:
  # rx subrule "identifier" subtype=capture negate=
    rx472_cur."!cursor_pos"(rx472_pos)
    $P10 = rx472_cur."identifier"()
    unless $P10, rx472_fail
    rx472_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx472_pos = $P10."pos"()
    goto alt479_end
  alt479_1:
    set_addr $I10, alt479_2
    rx472_cur."!mark_push"(0, rx472_pos, $I10)
.annotate 'line', 239
  # rx subrule "identifier" subtype=capture negate=
    rx472_cur."!cursor_pos"(rx472_pos)
    $P10 = rx472_cur."identifier"()
    unless $P10, rx472_fail
    rx472_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx472_pos = $P10."pos"()
  # rx rxquantr481 ** 0..1
    set_addr $I482, rxquantr481_done
    rx472_cur."!mark_push"(0, rx472_pos, $I482)
  rxquantr481_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx472_cur."!cursor_pos"(rx472_pos)
    $P10 = rx472_cur."circumfix"()
    unless $P10, rx472_fail
    rx472_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx472_pos = $P10."pos"()
    (rx472_rep) = rx472_cur."!mark_commit"($I482)
  rxquantr481_done:
    goto alt479_end
  alt479_2:
.annotate 'line', 240
  # rx subrule "circumfix" subtype=capture negate=
    rx472_cur."!cursor_pos"(rx472_pos)
    $P10 = rx472_cur."circumfix"()
    unless $P10, rx472_fail
    rx472_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx472_pos = $P10."pos"()
  alt479_end:
.annotate 'line', 235
  # rx pass
    rx472_cur."!cursor_pass"(rx472_pos, "colonpair")
    rx472_cur."!cursor_debug"("PASS  ", "colonpair", " at pos=", rx472_pos)
    .return (rx472_cur)
  rx472_fail:
.annotate 'line', 4
    (rx472_rep, rx472_pos, $I10, $P10) = rx472_cur."!mark_fail"(0)
    lt rx472_pos, -1, rx472_done
    eq rx472_pos, -1, rx472_fail
    jump $I10
  rx472_done:
    rx472_cur."!cursor_fail"()
    rx472_cur."!cursor_debug"("FAIL  ", "colonpair")
    .return (rx472_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("116_1273884026.76819") :method
.annotate 'line', 4
    $P474 = self."!PREFIX__!subrule"("circumfix", ":")
    $P475 = self."!PREFIX__!subrule"("identifier", ":")
    $P476 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P477, "ResizablePMCArray"
    push $P477, $P474
    push $P477, $P475
    push $P477, $P476
    .return ($P477)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("117_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx484_tgt
    .local int rx484_pos
    .local int rx484_off
    .local int rx484_eos
    .local int rx484_rep
    .local pmc rx484_cur
    (rx484_cur, rx484_pos, rx484_tgt) = self."!cursor_start"()
    rx484_cur."!cursor_debug"("START ", "variable")
    rx484_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx484_cur
    .local pmc match
    .lex "$/", match
    length rx484_eos, rx484_tgt
    set rx484_off, 0
    lt rx484_pos, 2, rx484_start
    sub rx484_off, rx484_pos, 1
    substr rx484_tgt, rx484_tgt, rx484_off
  rx484_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan489_done
    goto rxscan489_scan
  rxscan489_loop:
    ($P10) = rx484_cur."from"()
    inc $P10
    set rx484_pos, $P10
    ge rx484_pos, rx484_eos, rxscan489_done
  rxscan489_scan:
    set_addr $I10, rxscan489_loop
    rx484_cur."!mark_push"(0, rx484_pos, $I10)
  rxscan489_done:
  alt490_0:
.annotate 'line', 244
    set_addr $I10, alt490_1
    rx484_cur."!mark_push"(0, rx484_pos, $I10)
.annotate 'line', 245
  # rx subrule "sigil" subtype=capture negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."sigil"()
    unless $P10, rx484_fail
    rx484_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx484_pos = $P10."pos"()
  # rx rxquantr491 ** 0..1
    set_addr $I492, rxquantr491_done
    rx484_cur."!mark_push"(0, rx484_pos, $I492)
  rxquantr491_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."twigil"()
    unless $P10, rx484_fail
    rx484_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx484_pos = $P10."pos"()
    (rx484_rep) = rx484_cur."!mark_commit"($I492)
  rxquantr491_done:
  # rx subrule "name" subtype=capture negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."name"()
    unless $P10, rx484_fail
    rx484_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx484_pos = $P10."pos"()
    goto alt490_end
  alt490_1:
    set_addr $I10, alt490_2
    rx484_cur."!mark_push"(0, rx484_pos, $I10)
.annotate 'line', 246
  # rx subrule "sigil" subtype=capture negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."sigil"()
    unless $P10, rx484_fail
    rx484_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx484_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx484_pos, rx484_eos, rx484_fail
    sub $I10, rx484_pos, rx484_off
    substr $S10, rx484_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx484_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."postcircumfix"()
    unless $P10, rx484_fail
    rx484_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx484_pos = $P10."pos"()
    goto alt490_end
  alt490_2:
.annotate 'line', 247
  # rx subcapture "sigil"
    set_addr $I10, rxcap_493_fail
    rx484_cur."!mark_push"(0, rx484_pos, $I10)
  # rx literal  "$"
    add $I11, rx484_pos, 1
    gt $I11, rx484_eos, rx484_fail
    sub $I11, rx484_pos, rx484_off
    substr $S10, rx484_tgt, $I11, 1
    ne $S10, "$", rx484_fail
    add rx484_pos, 1
    set_addr $I10, rxcap_493_fail
    ($I12, $I11) = rx484_cur."!mark_peek"($I10)
    rx484_cur."!cursor_pos"($I11)
    ($P10) = rx484_cur."!cursor_start"()
    $P10."!cursor_pass"(rx484_pos, "")
    rx484_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_493_done
  rxcap_493_fail:
    goto rx484_fail
  rxcap_493_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_494_fail
    rx484_cur."!mark_push"(0, rx484_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx484_pos, rx484_eos, rx484_fail
    sub $I10, rx484_pos, rx484_off
    substr $S10, rx484_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx484_fail
    inc rx484_pos
    set_addr $I10, rxcap_494_fail
    ($I12, $I11) = rx484_cur."!mark_peek"($I10)
    rx484_cur."!cursor_pos"($I11)
    ($P10) = rx484_cur."!cursor_start"()
    $P10."!cursor_pass"(rx484_pos, "")
    rx484_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_494_done
  rxcap_494_fail:
    goto rx484_fail
  rxcap_494_done:
  alt490_end:
.annotate 'line', 244
  # rx pass
    rx484_cur."!cursor_pass"(rx484_pos, "variable")
    rx484_cur."!cursor_debug"("PASS  ", "variable", " at pos=", rx484_pos)
    .return (rx484_cur)
  rx484_fail:
.annotate 'line', 4
    (rx484_rep, rx484_pos, $I10, $P10) = rx484_cur."!mark_fail"(0)
    lt rx484_pos, -1, rx484_done
    eq rx484_pos, -1, rx484_fail
    jump $I10
  rx484_done:
    rx484_cur."!cursor_fail"()
    rx484_cur."!cursor_debug"("FAIL  ", "variable")
    .return (rx484_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("118_1273884026.76819") :method
.annotate 'line', 4
    $P486 = self."!PREFIX__!subrule"("sigil", "")
    $P487 = self."!PREFIX__!subrule"("sigil", "")
    new $P488, "ResizablePMCArray"
    push $P488, "$!"
    push $P488, "$_"
    push $P488, "$/"
    push $P488, $P486
    push $P488, $P487
    .return ($P488)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("119_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx496_tgt
    .local int rx496_pos
    .local int rx496_off
    .local int rx496_eos
    .local int rx496_rep
    .local pmc rx496_cur
    (rx496_cur, rx496_pos, rx496_tgt) = self."!cursor_start"()
    rx496_cur."!cursor_debug"("START ", "sigil")
    .lex unicode:"$\x{a2}", rx496_cur
    .local pmc match
    .lex "$/", match
    length rx496_eos, rx496_tgt
    set rx496_off, 0
    lt rx496_pos, 2, rx496_start
    sub rx496_off, rx496_pos, 1
    substr rx496_tgt, rx496_tgt, rx496_off
  rx496_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan499_done
    goto rxscan499_scan
  rxscan499_loop:
    ($P10) = rx496_cur."from"()
    inc $P10
    set rx496_pos, $P10
    ge rx496_pos, rx496_eos, rxscan499_done
  rxscan499_scan:
    set_addr $I10, rxscan499_loop
    rx496_cur."!mark_push"(0, rx496_pos, $I10)
  rxscan499_done:
.annotate 'line', 250
  # rx enumcharlist negate=0 
    ge rx496_pos, rx496_eos, rx496_fail
    sub $I10, rx496_pos, rx496_off
    substr $S10, rx496_tgt, $I10, 1
    index $I11, "$@%&", $S10
    lt $I11, 0, rx496_fail
    inc rx496_pos
  # rx pass
    rx496_cur."!cursor_pass"(rx496_pos, "sigil")
    rx496_cur."!cursor_debug"("PASS  ", "sigil", " at pos=", rx496_pos)
    .return (rx496_cur)
  rx496_fail:
.annotate 'line', 4
    (rx496_rep, rx496_pos, $I10, $P10) = rx496_cur."!mark_fail"(0)
    lt rx496_pos, -1, rx496_done
    eq rx496_pos, -1, rx496_fail
    jump $I10
  rx496_done:
    rx496_cur."!cursor_fail"()
    rx496_cur."!cursor_debug"("FAIL  ", "sigil")
    .return (rx496_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("120_1273884026.76819") :method
.annotate 'line', 4
    new $P498, "ResizablePMCArray"
    push $P498, "&"
    push $P498, "%"
    push $P498, "@"
    push $P498, "$"
    .return ($P498)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("121_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx501_tgt
    .local int rx501_pos
    .local int rx501_off
    .local int rx501_eos
    .local int rx501_rep
    .local pmc rx501_cur
    (rx501_cur, rx501_pos, rx501_tgt) = self."!cursor_start"()
    rx501_cur."!cursor_debug"("START ", "twigil")
    .lex unicode:"$\x{a2}", rx501_cur
    .local pmc match
    .lex "$/", match
    length rx501_eos, rx501_tgt
    set rx501_off, 0
    lt rx501_pos, 2, rx501_start
    sub rx501_off, rx501_pos, 1
    substr rx501_tgt, rx501_tgt, rx501_off
  rx501_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan504_done
    goto rxscan504_scan
  rxscan504_loop:
    ($P10) = rx501_cur."from"()
    inc $P10
    set rx501_pos, $P10
    ge rx501_pos, rx501_eos, rxscan504_done
  rxscan504_scan:
    set_addr $I10, rxscan504_loop
    rx501_cur."!mark_push"(0, rx501_pos, $I10)
  rxscan504_done:
.annotate 'line', 252
  # rx enumcharlist negate=0 
    ge rx501_pos, rx501_eos, rx501_fail
    sub $I10, rx501_pos, rx501_off
    substr $S10, rx501_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx501_fail
    inc rx501_pos
  # rx pass
    rx501_cur."!cursor_pass"(rx501_pos, "twigil")
    rx501_cur."!cursor_debug"("PASS  ", "twigil", " at pos=", rx501_pos)
    .return (rx501_cur)
  rx501_fail:
.annotate 'line', 4
    (rx501_rep, rx501_pos, $I10, $P10) = rx501_cur."!mark_fail"(0)
    lt rx501_pos, -1, rx501_done
    eq rx501_pos, -1, rx501_fail
    jump $I10
  rx501_done:
    rx501_cur."!cursor_fail"()
    rx501_cur."!cursor_debug"("FAIL  ", "twigil")
    .return (rx501_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("122_1273884026.76819") :method
.annotate 'line', 4
    new $P503, "ResizablePMCArray"
    push $P503, "?"
    push $P503, "!"
    push $P503, "*"
    .return ($P503)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("123_1273884026.76819") :method
.annotate 'line', 254
    $P506 = self."!protoregex"("package_declarator")
    .return ($P506)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("124_1273884026.76819") :method
.annotate 'line', 254
    $P508 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P508)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("125_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx510_tgt
    .local int rx510_pos
    .local int rx510_off
    .local int rx510_eos
    .local int rx510_rep
    .local pmc rx510_cur
    (rx510_cur, rx510_pos, rx510_tgt) = self."!cursor_start"()
    rx510_cur."!cursor_debug"("START ", "package_declarator:sym<module>")
    .lex unicode:"$\x{a2}", rx510_cur
    .local pmc match
    .lex "$/", match
    length rx510_eos, rx510_tgt
    set rx510_off, 0
    lt rx510_pos, 2, rx510_start
    sub rx510_off, rx510_pos, 1
    substr rx510_tgt, rx510_tgt, rx510_off
  rx510_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan514_done
    goto rxscan514_scan
  rxscan514_loop:
    ($P10) = rx510_cur."from"()
    inc $P10
    set rx510_pos, $P10
    ge rx510_pos, rx510_eos, rxscan514_done
  rxscan514_scan:
    set_addr $I10, rxscan514_loop
    rx510_cur."!mark_push"(0, rx510_pos, $I10)
  rxscan514_done:
.annotate 'line', 255
  # rx subcapture "sym"
    set_addr $I10, rxcap_515_fail
    rx510_cur."!mark_push"(0, rx510_pos, $I10)
  # rx literal  "module"
    add $I11, rx510_pos, 6
    gt $I11, rx510_eos, rx510_fail
    sub $I11, rx510_pos, rx510_off
    substr $S10, rx510_tgt, $I11, 6
    ne $S10, "module", rx510_fail
    add rx510_pos, 6
    set_addr $I10, rxcap_515_fail
    ($I12, $I11) = rx510_cur."!mark_peek"($I10)
    rx510_cur."!cursor_pos"($I11)
    ($P10) = rx510_cur."!cursor_start"()
    $P10."!cursor_pass"(rx510_pos, "")
    rx510_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_515_done
  rxcap_515_fail:
    goto rx510_fail
  rxcap_515_done:
  # rx subrule "package_def" subtype=capture negate=
    rx510_cur."!cursor_pos"(rx510_pos)
    $P10 = rx510_cur."package_def"()
    unless $P10, rx510_fail
    rx510_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx510_pos = $P10."pos"()
  # rx pass
    rx510_cur."!cursor_pass"(rx510_pos, "package_declarator:sym<module>")
    rx510_cur."!cursor_debug"("PASS  ", "package_declarator:sym<module>", " at pos=", rx510_pos)
    .return (rx510_cur)
  rx510_fail:
.annotate 'line', 4
    (rx510_rep, rx510_pos, $I10, $P10) = rx510_cur."!mark_fail"(0)
    lt rx510_pos, -1, rx510_done
    eq rx510_pos, -1, rx510_fail
    jump $I10
  rx510_done:
    rx510_cur."!cursor_fail"()
    rx510_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<module>")
    .return (rx510_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("126_1273884026.76819") :method
.annotate 'line', 4
    $P512 = self."!PREFIX__!subrule"("package_def", "module")
    new $P513, "ResizablePMCArray"
    push $P513, $P512
    .return ($P513)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("127_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx517_tgt
    .local int rx517_pos
    .local int rx517_off
    .local int rx517_eos
    .local int rx517_rep
    .local pmc rx517_cur
    (rx517_cur, rx517_pos, rx517_tgt) = self."!cursor_start"()
    rx517_cur."!cursor_debug"("START ", "package_declarator:sym<class>")
    .lex unicode:"$\x{a2}", rx517_cur
    .local pmc match
    .lex "$/", match
    length rx517_eos, rx517_tgt
    set rx517_off, 0
    lt rx517_pos, 2, rx517_start
    sub rx517_off, rx517_pos, 1
    substr rx517_tgt, rx517_tgt, rx517_off
  rx517_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan522_done
    goto rxscan522_scan
  rxscan522_loop:
    ($P10) = rx517_cur."from"()
    inc $P10
    set rx517_pos, $P10
    ge rx517_pos, rx517_eos, rxscan522_done
  rxscan522_scan:
    set_addr $I10, rxscan522_loop
    rx517_cur."!mark_push"(0, rx517_pos, $I10)
  rxscan522_done:
.annotate 'line', 256
  # rx subcapture "sym"
    set_addr $I10, rxcap_524_fail
    rx517_cur."!mark_push"(0, rx517_pos, $I10)
  alt523_0:
    set_addr $I10, alt523_1
    rx517_cur."!mark_push"(0, rx517_pos, $I10)
  # rx literal  "class"
    add $I11, rx517_pos, 5
    gt $I11, rx517_eos, rx517_fail
    sub $I11, rx517_pos, rx517_off
    substr $S10, rx517_tgt, $I11, 5
    ne $S10, "class", rx517_fail
    add rx517_pos, 5
    goto alt523_end
  alt523_1:
  # rx literal  "grammar"
    add $I11, rx517_pos, 7
    gt $I11, rx517_eos, rx517_fail
    sub $I11, rx517_pos, rx517_off
    substr $S10, rx517_tgt, $I11, 7
    ne $S10, "grammar", rx517_fail
    add rx517_pos, 7
  alt523_end:
    set_addr $I10, rxcap_524_fail
    ($I12, $I11) = rx517_cur."!mark_peek"($I10)
    rx517_cur."!cursor_pos"($I11)
    ($P10) = rx517_cur."!cursor_start"()
    $P10."!cursor_pass"(rx517_pos, "")
    rx517_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_524_done
  rxcap_524_fail:
    goto rx517_fail
  rxcap_524_done:
  # rx subrule "package_def" subtype=capture negate=
    rx517_cur."!cursor_pos"(rx517_pos)
    $P10 = rx517_cur."package_def"()
    unless $P10, rx517_fail
    rx517_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx517_pos = $P10."pos"()
  # rx pass
    rx517_cur."!cursor_pass"(rx517_pos, "package_declarator:sym<class>")
    rx517_cur."!cursor_debug"("PASS  ", "package_declarator:sym<class>", " at pos=", rx517_pos)
    .return (rx517_cur)
  rx517_fail:
.annotate 'line', 4
    (rx517_rep, rx517_pos, $I10, $P10) = rx517_cur."!mark_fail"(0)
    lt rx517_pos, -1, rx517_done
    eq rx517_pos, -1, rx517_fail
    jump $I10
  rx517_done:
    rx517_cur."!cursor_fail"()
    rx517_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<class>")
    .return (rx517_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("128_1273884026.76819") :method
.annotate 'line', 4
    $P519 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P520 = self."!PREFIX__!subrule"("package_def", "class")
    new $P521, "ResizablePMCArray"
    push $P521, $P519
    push $P521, $P520
    .return ($P521)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("129_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx526_tgt
    .local int rx526_pos
    .local int rx526_off
    .local int rx526_eos
    .local int rx526_rep
    .local pmc rx526_cur
    (rx526_cur, rx526_pos, rx526_tgt) = self."!cursor_start"()
    rx526_cur."!cursor_debug"("START ", "package_def")
    rx526_cur."!cursor_caparray"("parent")
    .lex unicode:"$\x{a2}", rx526_cur
    .local pmc match
    .lex "$/", match
    length rx526_eos, rx526_tgt
    set rx526_off, 0
    lt rx526_pos, 2, rx526_start
    sub rx526_off, rx526_pos, 1
    substr rx526_tgt, rx526_tgt, rx526_off
  rx526_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan529_done
    goto rxscan529_scan
  rxscan529_loop:
    ($P10) = rx526_cur."from"()
    inc $P10
    set rx526_pos, $P10
    ge rx526_pos, rx526_eos, rxscan529_done
  rxscan529_scan:
    set_addr $I10, rxscan529_loop
    rx526_cur."!mark_push"(0, rx526_pos, $I10)
  rxscan529_done:
.annotate 'line', 258
  # rx subrule "ws" subtype=method negate=
    rx526_cur."!cursor_pos"(rx526_pos)
    $P10 = rx526_cur."ws"()
    unless $P10, rx526_fail
    rx526_pos = $P10."pos"()
.annotate 'line', 259
  # rx subrule "name" subtype=capture negate=
    rx526_cur."!cursor_pos"(rx526_pos)
    $P10 = rx526_cur."name"()
    unless $P10, rx526_fail
    rx526_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx526_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx526_cur."!cursor_pos"(rx526_pos)
    $P10 = rx526_cur."ws"()
    unless $P10, rx526_fail
    rx526_pos = $P10."pos"()
.annotate 'line', 260
  # rx rxquantr532 ** 0..1
    set_addr $I536, rxquantr532_done
    rx526_cur."!mark_push"(0, rx526_pos, $I536)
  rxquantr532_loop:
  # rx subrule "ws" subtype=method negate=
    rx526_cur."!cursor_pos"(rx526_pos)
    $P10 = rx526_cur."ws"()
    unless $P10, rx526_fail
    rx526_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx526_pos, 2
    gt $I11, rx526_eos, rx526_fail
    sub $I11, rx526_pos, rx526_off
    substr $S10, rx526_tgt, $I11, 2
    ne $S10, "is", rx526_fail
    add rx526_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx526_cur."!cursor_pos"(rx526_pos)
    $P10 = rx526_cur."ws"()
    unless $P10, rx526_fail
    rx526_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx526_cur."!cursor_pos"(rx526_pos)
    $P10 = rx526_cur."name"()
    unless $P10, rx526_fail
    rx526_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx526_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx526_cur."!cursor_pos"(rx526_pos)
    $P10 = rx526_cur."ws"()
    unless $P10, rx526_fail
    rx526_pos = $P10."pos"()
    (rx526_rep) = rx526_cur."!mark_commit"($I536)
  rxquantr532_done:
  # rx subrule "ws" subtype=method negate=
    rx526_cur."!cursor_pos"(rx526_pos)
    $P10 = rx526_cur."ws"()
    unless $P10, rx526_fail
    rx526_pos = $P10."pos"()
  alt538_0:
.annotate 'line', 261
    set_addr $I10, alt538_1
    rx526_cur."!mark_push"(0, rx526_pos, $I10)
.annotate 'line', 262
  # rx subrule "ws" subtype=method negate=
    rx526_cur."!cursor_pos"(rx526_pos)
    $P10 = rx526_cur."ws"()
    unless $P10, rx526_fail
    rx526_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx526_pos, 1
    gt $I11, rx526_eos, rx526_fail
    sub $I11, rx526_pos, rx526_off
    substr $S10, rx526_tgt, $I11, 1
    ne $S10, ";", rx526_fail
    add rx526_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx526_cur."!cursor_pos"(rx526_pos)
    $P10 = rx526_cur."ws"()
    unless $P10, rx526_fail
    rx526_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx526_cur."!cursor_pos"(rx526_pos)
    $P10 = rx526_cur."comp_unit"()
    unless $P10, rx526_fail
    rx526_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx526_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx526_cur."!cursor_pos"(rx526_pos)
    $P10 = rx526_cur."ws"()
    unless $P10, rx526_fail
    rx526_pos = $P10."pos"()
    goto alt538_end
  alt538_1:
    set_addr $I10, alt538_2
    rx526_cur."!mark_push"(0, rx526_pos, $I10)
.annotate 'line', 263
  # rx subrule "ws" subtype=method negate=
    rx526_cur."!cursor_pos"(rx526_pos)
    $P10 = rx526_cur."ws"()
    unless $P10, rx526_fail
    rx526_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx526_pos, rx526_eos, rx526_fail
    sub $I10, rx526_pos, rx526_off
    substr $S10, rx526_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx526_fail
  # rx subrule "ws" subtype=method negate=
    rx526_cur."!cursor_pos"(rx526_pos)
    $P10 = rx526_cur."ws"()
    unless $P10, rx526_fail
    rx526_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx526_cur."!cursor_pos"(rx526_pos)
    $P10 = rx526_cur."block"()
    unless $P10, rx526_fail
    rx526_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx526_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx526_cur."!cursor_pos"(rx526_pos)
    $P10 = rx526_cur."ws"()
    unless $P10, rx526_fail
    rx526_pos = $P10."pos"()
    goto alt538_end
  alt538_2:
.annotate 'line', 264
  # rx subrule "ws" subtype=method negate=
    rx526_cur."!cursor_pos"(rx526_pos)
    $P10 = rx526_cur."ws"()
    unless $P10, rx526_fail
    rx526_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx526_cur."!cursor_pos"(rx526_pos)
    $P10 = rx526_cur."panic"("Malformed package declaration")
    unless $P10, rx526_fail
    rx526_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx526_cur."!cursor_pos"(rx526_pos)
    $P10 = rx526_cur."ws"()
    unless $P10, rx526_fail
    rx526_pos = $P10."pos"()
  alt538_end:
.annotate 'line', 265
  # rx subrule "ws" subtype=method negate=
    rx526_cur."!cursor_pos"(rx526_pos)
    $P10 = rx526_cur."ws"()
    unless $P10, rx526_fail
    rx526_pos = $P10."pos"()
.annotate 'line', 258
  # rx pass
    rx526_cur."!cursor_pass"(rx526_pos, "package_def")
    rx526_cur."!cursor_debug"("PASS  ", "package_def", " at pos=", rx526_pos)
    .return (rx526_cur)
  rx526_fail:
.annotate 'line', 4
    (rx526_rep, rx526_pos, $I10, $P10) = rx526_cur."!mark_fail"(0)
    lt rx526_pos, -1, rx526_done
    eq rx526_pos, -1, rx526_fail
    jump $I10
  rx526_done:
    rx526_cur."!cursor_fail"()
    rx526_cur."!cursor_debug"("FAIL  ", "package_def")
    .return (rx526_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("130_1273884026.76819") :method
.annotate 'line', 4
    new $P528, "ResizablePMCArray"
    push $P528, ""
    .return ($P528)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("131_1273884026.76819") :method
.annotate 'line', 268
    $P549 = self."!protoregex"("scope_declarator")
    .return ($P549)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("132_1273884026.76819") :method
.annotate 'line', 268
    $P551 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P551)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("133_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx553_tgt
    .local int rx553_pos
    .local int rx553_off
    .local int rx553_eos
    .local int rx553_rep
    .local pmc rx553_cur
    (rx553_cur, rx553_pos, rx553_tgt) = self."!cursor_start"()
    rx553_cur."!cursor_debug"("START ", "scope_declarator:sym<my>")
    .lex unicode:"$\x{a2}", rx553_cur
    .local pmc match
    .lex "$/", match
    length rx553_eos, rx553_tgt
    set rx553_off, 0
    lt rx553_pos, 2, rx553_start
    sub rx553_off, rx553_pos, 1
    substr rx553_tgt, rx553_tgt, rx553_off
  rx553_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan557_done
    goto rxscan557_scan
  rxscan557_loop:
    ($P10) = rx553_cur."from"()
    inc $P10
    set rx553_pos, $P10
    ge rx553_pos, rx553_eos, rxscan557_done
  rxscan557_scan:
    set_addr $I10, rxscan557_loop
    rx553_cur."!mark_push"(0, rx553_pos, $I10)
  rxscan557_done:
.annotate 'line', 269
  # rx subcapture "sym"
    set_addr $I10, rxcap_558_fail
    rx553_cur."!mark_push"(0, rx553_pos, $I10)
  # rx literal  "my"
    add $I11, rx553_pos, 2
    gt $I11, rx553_eos, rx553_fail
    sub $I11, rx553_pos, rx553_off
    substr $S10, rx553_tgt, $I11, 2
    ne $S10, "my", rx553_fail
    add rx553_pos, 2
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
  # rx subrule "scoped" subtype=capture negate=
    rx553_cur."!cursor_pos"(rx553_pos)
    $P10 = rx553_cur."scoped"("my")
    unless $P10, rx553_fail
    rx553_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx553_pos = $P10."pos"()
  # rx pass
    rx553_cur."!cursor_pass"(rx553_pos, "scope_declarator:sym<my>")
    rx553_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<my>", " at pos=", rx553_pos)
    .return (rx553_cur)
  rx553_fail:
.annotate 'line', 4
    (rx553_rep, rx553_pos, $I10, $P10) = rx553_cur."!mark_fail"(0)
    lt rx553_pos, -1, rx553_done
    eq rx553_pos, -1, rx553_fail
    jump $I10
  rx553_done:
    rx553_cur."!cursor_fail"()
    rx553_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<my>")
    .return (rx553_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("134_1273884026.76819") :method
.annotate 'line', 4
    $P555 = self."!PREFIX__!subrule"("scoped", "my")
    new $P556, "ResizablePMCArray"
    push $P556, $P555
    .return ($P556)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("135_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx560_tgt
    .local int rx560_pos
    .local int rx560_off
    .local int rx560_eos
    .local int rx560_rep
    .local pmc rx560_cur
    (rx560_cur, rx560_pos, rx560_tgt) = self."!cursor_start"()
    rx560_cur."!cursor_debug"("START ", "scope_declarator:sym<our>")
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
.annotate 'line', 270
  # rx subcapture "sym"
    set_addr $I10, rxcap_565_fail
    rx560_cur."!mark_push"(0, rx560_pos, $I10)
  # rx literal  "our"
    add $I11, rx560_pos, 3
    gt $I11, rx560_eos, rx560_fail
    sub $I11, rx560_pos, rx560_off
    substr $S10, rx560_tgt, $I11, 3
    ne $S10, "our", rx560_fail
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
  # rx subrule "scoped" subtype=capture negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."scoped"("our")
    unless $P10, rx560_fail
    rx560_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx560_pos = $P10."pos"()
  # rx pass
    rx560_cur."!cursor_pass"(rx560_pos, "scope_declarator:sym<our>")
    rx560_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<our>", " at pos=", rx560_pos)
    .return (rx560_cur)
  rx560_fail:
.annotate 'line', 4
    (rx560_rep, rx560_pos, $I10, $P10) = rx560_cur."!mark_fail"(0)
    lt rx560_pos, -1, rx560_done
    eq rx560_pos, -1, rx560_fail
    jump $I10
  rx560_done:
    rx560_cur."!cursor_fail"()
    rx560_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<our>")
    .return (rx560_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("136_1273884026.76819") :method
.annotate 'line', 4
    $P562 = self."!PREFIX__!subrule"("scoped", "our")
    new $P563, "ResizablePMCArray"
    push $P563, $P562
    .return ($P563)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("137_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx567_tgt
    .local int rx567_pos
    .local int rx567_off
    .local int rx567_eos
    .local int rx567_rep
    .local pmc rx567_cur
    (rx567_cur, rx567_pos, rx567_tgt) = self."!cursor_start"()
    rx567_cur."!cursor_debug"("START ", "scope_declarator:sym<has>")
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
.annotate 'line', 271
  # rx subcapture "sym"
    set_addr $I10, rxcap_572_fail
    rx567_cur."!mark_push"(0, rx567_pos, $I10)
  # rx literal  "has"
    add $I11, rx567_pos, 3
    gt $I11, rx567_eos, rx567_fail
    sub $I11, rx567_pos, rx567_off
    substr $S10, rx567_tgt, $I11, 3
    ne $S10, "has", rx567_fail
    add rx567_pos, 3
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
  # rx subrule "scoped" subtype=capture negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."scoped"("has")
    unless $P10, rx567_fail
    rx567_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx567_pos = $P10."pos"()
  # rx pass
    rx567_cur."!cursor_pass"(rx567_pos, "scope_declarator:sym<has>")
    rx567_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<has>", " at pos=", rx567_pos)
    .return (rx567_cur)
  rx567_fail:
.annotate 'line', 4
    (rx567_rep, rx567_pos, $I10, $P10) = rx567_cur."!mark_fail"(0)
    lt rx567_pos, -1, rx567_done
    eq rx567_pos, -1, rx567_fail
    jump $I10
  rx567_done:
    rx567_cur."!cursor_fail"()
    rx567_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<has>")
    .return (rx567_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("138_1273884026.76819") :method
.annotate 'line', 4
    $P569 = self."!PREFIX__!subrule"("scoped", "has")
    new $P570, "ResizablePMCArray"
    push $P570, $P569
    .return ($P570)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("139_1273884026.76819") :method :outer("11_1273884026.76819")
    .param pmc param_574
.annotate 'line', 273
    .lex "$*SCOPE", param_574
.annotate 'line', 4
    .local string rx575_tgt
    .local int rx575_pos
    .local int rx575_off
    .local int rx575_eos
    .local int rx575_rep
    .local pmc rx575_cur
    (rx575_cur, rx575_pos, rx575_tgt) = self."!cursor_start"()
    rx575_cur."!cursor_debug"("START ", "scoped")
    .lex unicode:"$\x{a2}", rx575_cur
    .local pmc match
    .lex "$/", match
    length rx575_eos, rx575_tgt
    set rx575_off, 0
    lt rx575_pos, 2, rx575_start
    sub rx575_off, rx575_pos, 1
    substr rx575_tgt, rx575_tgt, rx575_off
  rx575_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan578_done
    goto rxscan578_scan
  rxscan578_loop:
    ($P10) = rx575_cur."from"()
    inc $P10
    set rx575_pos, $P10
    ge rx575_pos, rx575_eos, rxscan578_done
  rxscan578_scan:
    set_addr $I10, rxscan578_loop
    rx575_cur."!mark_push"(0, rx575_pos, $I10)
  rxscan578_done:
  alt579_0:
.annotate 'line', 273
    set_addr $I10, alt579_1
    rx575_cur."!mark_push"(0, rx575_pos, $I10)
.annotate 'line', 274
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
  # rx subrule "variable_declarator" subtype=capture negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."variable_declarator"()
    unless $P10, rx575_fail
    rx575_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx575_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
    goto alt579_end
  alt579_1:
.annotate 'line', 275
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
  # rx subrule "routine_declarator" subtype=capture negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."routine_declarator"()
    unless $P10, rx575_fail
    rx575_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx575_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
  alt579_end:
.annotate 'line', 273
  # rx pass
    rx575_cur."!cursor_pass"(rx575_pos, "scoped")
    rx575_cur."!cursor_debug"("PASS  ", "scoped", " at pos=", rx575_pos)
    .return (rx575_cur)
  rx575_fail:
.annotate 'line', 4
    (rx575_rep, rx575_pos, $I10, $P10) = rx575_cur."!mark_fail"(0)
    lt rx575_pos, -1, rx575_done
    eq rx575_pos, -1, rx575_fail
    jump $I10
  rx575_done:
    rx575_cur."!cursor_fail"()
    rx575_cur."!cursor_debug"("FAIL  ", "scoped")
    .return (rx575_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("140_1273884026.76819") :method
.annotate 'line', 4
    new $P577, "ResizablePMCArray"
    push $P577, ""
    push $P577, ""
    .return ($P577)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("141_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx585_tgt
    .local int rx585_pos
    .local int rx585_off
    .local int rx585_eos
    .local int rx585_rep
    .local pmc rx585_cur
    (rx585_cur, rx585_pos, rx585_tgt) = self."!cursor_start"()
    rx585_cur."!cursor_debug"("START ", "variable_declarator")
    .lex unicode:"$\x{a2}", rx585_cur
    .local pmc match
    .lex "$/", match
    length rx585_eos, rx585_tgt
    set rx585_off, 0
    lt rx585_pos, 2, rx585_start
    sub rx585_off, rx585_pos, 1
    substr rx585_tgt, rx585_tgt, rx585_off
  rx585_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan589_done
    goto rxscan589_scan
  rxscan589_loop:
    ($P10) = rx585_cur."from"()
    inc $P10
    set rx585_pos, $P10
    ge rx585_pos, rx585_eos, rxscan589_done
  rxscan589_scan:
    set_addr $I10, rxscan589_loop
    rx585_cur."!mark_push"(0, rx585_pos, $I10)
  rxscan589_done:
.annotate 'line', 278
  # rx subrule "variable" subtype=capture negate=
    rx585_cur."!cursor_pos"(rx585_pos)
    $P10 = rx585_cur."variable"()
    unless $P10, rx585_fail
    rx585_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx585_pos = $P10."pos"()
  # rx pass
    rx585_cur."!cursor_pass"(rx585_pos, "variable_declarator")
    rx585_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx585_pos)
    .return (rx585_cur)
  rx585_fail:
.annotate 'line', 4
    (rx585_rep, rx585_pos, $I10, $P10) = rx585_cur."!mark_fail"(0)
    lt rx585_pos, -1, rx585_done
    eq rx585_pos, -1, rx585_fail
    jump $I10
  rx585_done:
    rx585_cur."!cursor_fail"()
    rx585_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx585_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("142_1273884026.76819") :method
.annotate 'line', 4
    $P587 = self."!PREFIX__!subrule"("variable", "")
    new $P588, "ResizablePMCArray"
    push $P588, $P587
    .return ($P588)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("143_1273884026.76819") :method
.annotate 'line', 280
    $P591 = self."!protoregex"("routine_declarator")
    .return ($P591)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("144_1273884026.76819") :method
.annotate 'line', 280
    $P593 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P593)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("145_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx595_tgt
    .local int rx595_pos
    .local int rx595_off
    .local int rx595_eos
    .local int rx595_rep
    .local pmc rx595_cur
    (rx595_cur, rx595_pos, rx595_tgt) = self."!cursor_start"()
    rx595_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
    .lex unicode:"$\x{a2}", rx595_cur
    .local pmc match
    .lex "$/", match
    length rx595_eos, rx595_tgt
    set rx595_off, 0
    lt rx595_pos, 2, rx595_start
    sub rx595_off, rx595_pos, 1
    substr rx595_tgt, rx595_tgt, rx595_off
  rx595_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan599_done
    goto rxscan599_scan
  rxscan599_loop:
    ($P10) = rx595_cur."from"()
    inc $P10
    set rx595_pos, $P10
    ge rx595_pos, rx595_eos, rxscan599_done
  rxscan599_scan:
    set_addr $I10, rxscan599_loop
    rx595_cur."!mark_push"(0, rx595_pos, $I10)
  rxscan599_done:
.annotate 'line', 281
  # rx subcapture "sym"
    set_addr $I10, rxcap_600_fail
    rx595_cur."!mark_push"(0, rx595_pos, $I10)
  # rx literal  "sub"
    add $I11, rx595_pos, 3
    gt $I11, rx595_eos, rx595_fail
    sub $I11, rx595_pos, rx595_off
    substr $S10, rx595_tgt, $I11, 3
    ne $S10, "sub", rx595_fail
    add rx595_pos, 3
    set_addr $I10, rxcap_600_fail
    ($I12, $I11) = rx595_cur."!mark_peek"($I10)
    rx595_cur."!cursor_pos"($I11)
    ($P10) = rx595_cur."!cursor_start"()
    $P10."!cursor_pass"(rx595_pos, "")
    rx595_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_600_done
  rxcap_600_fail:
    goto rx595_fail
  rxcap_600_done:
  # rx subrule "routine_def" subtype=capture negate=
    rx595_cur."!cursor_pos"(rx595_pos)
    $P10 = rx595_cur."routine_def"()
    unless $P10, rx595_fail
    rx595_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx595_pos = $P10."pos"()
  # rx pass
    rx595_cur."!cursor_pass"(rx595_pos, "routine_declarator:sym<sub>")
    rx595_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx595_pos)
    .return (rx595_cur)
  rx595_fail:
.annotate 'line', 4
    (rx595_rep, rx595_pos, $I10, $P10) = rx595_cur."!mark_fail"(0)
    lt rx595_pos, -1, rx595_done
    eq rx595_pos, -1, rx595_fail
    jump $I10
  rx595_done:
    rx595_cur."!cursor_fail"()
    rx595_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx595_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("146_1273884026.76819") :method
.annotate 'line', 4
    $P597 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P598, "ResizablePMCArray"
    push $P598, $P597
    .return ($P598)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("147_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx602_tgt
    .local int rx602_pos
    .local int rx602_off
    .local int rx602_eos
    .local int rx602_rep
    .local pmc rx602_cur
    (rx602_cur, rx602_pos, rx602_tgt) = self."!cursor_start"()
    rx602_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
    .lex unicode:"$\x{a2}", rx602_cur
    .local pmc match
    .lex "$/", match
    length rx602_eos, rx602_tgt
    set rx602_off, 0
    lt rx602_pos, 2, rx602_start
    sub rx602_off, rx602_pos, 1
    substr rx602_tgt, rx602_tgt, rx602_off
  rx602_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan606_done
    goto rxscan606_scan
  rxscan606_loop:
    ($P10) = rx602_cur."from"()
    inc $P10
    set rx602_pos, $P10
    ge rx602_pos, rx602_eos, rxscan606_done
  rxscan606_scan:
    set_addr $I10, rxscan606_loop
    rx602_cur."!mark_push"(0, rx602_pos, $I10)
  rxscan606_done:
.annotate 'line', 282
  # rx subcapture "sym"
    set_addr $I10, rxcap_607_fail
    rx602_cur."!mark_push"(0, rx602_pos, $I10)
  # rx literal  "method"
    add $I11, rx602_pos, 6
    gt $I11, rx602_eos, rx602_fail
    sub $I11, rx602_pos, rx602_off
    substr $S10, rx602_tgt, $I11, 6
    ne $S10, "method", rx602_fail
    add rx602_pos, 6
    set_addr $I10, rxcap_607_fail
    ($I12, $I11) = rx602_cur."!mark_peek"($I10)
    rx602_cur."!cursor_pos"($I11)
    ($P10) = rx602_cur."!cursor_start"()
    $P10."!cursor_pass"(rx602_pos, "")
    rx602_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_607_done
  rxcap_607_fail:
    goto rx602_fail
  rxcap_607_done:
  # rx subrule "method_def" subtype=capture negate=
    rx602_cur."!cursor_pos"(rx602_pos)
    $P10 = rx602_cur."method_def"()
    unless $P10, rx602_fail
    rx602_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx602_pos = $P10."pos"()
  # rx pass
    rx602_cur."!cursor_pass"(rx602_pos, "routine_declarator:sym<method>")
    rx602_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx602_pos)
    .return (rx602_cur)
  rx602_fail:
.annotate 'line', 4
    (rx602_rep, rx602_pos, $I10, $P10) = rx602_cur."!mark_fail"(0)
    lt rx602_pos, -1, rx602_done
    eq rx602_pos, -1, rx602_fail
    jump $I10
  rx602_done:
    rx602_cur."!cursor_fail"()
    rx602_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx602_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("148_1273884026.76819") :method
.annotate 'line', 4
    $P604 = self."!PREFIX__!subrule"("method_def", "method")
    new $P605, "ResizablePMCArray"
    push $P605, $P604
    .return ($P605)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("149_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx609_tgt
    .local int rx609_pos
    .local int rx609_off
    .local int rx609_eos
    .local int rx609_rep
    .local pmc rx609_cur
    (rx609_cur, rx609_pos, rx609_tgt) = self."!cursor_start"()
    rx609_cur."!cursor_debug"("START ", "routine_def")
    rx609_cur."!cursor_caparray"("deflongname", "sigil")
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
.annotate 'line', 284
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
.annotate 'line', 285
  # rx rxquantr614 ** 0..1
    set_addr $I620, rxquantr614_done
    rx609_cur."!mark_push"(0, rx609_pos, $I620)
  rxquantr614_loop:
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
  # rx subcapture "sigil"
    set_addr $I10, rxcap_618_fail
    rx609_cur."!mark_push"(0, rx609_pos, $I10)
  # rx rxquantr616 ** 0..1
    set_addr $I617, rxquantr616_done
    rx609_cur."!mark_push"(0, rx609_pos, $I617)
  rxquantr616_loop:
  # rx literal  "&"
    add $I11, rx609_pos, 1
    gt $I11, rx609_eos, rx609_fail
    sub $I11, rx609_pos, rx609_off
    substr $S10, rx609_tgt, $I11, 1
    ne $S10, "&", rx609_fail
    add rx609_pos, 1
    (rx609_rep) = rx609_cur."!mark_commit"($I617)
  rxquantr616_done:
    set_addr $I10, rxcap_618_fail
    ($I12, $I11) = rx609_cur."!mark_peek"($I10)
    rx609_cur."!cursor_pos"($I11)
    ($P10) = rx609_cur."!cursor_start"()
    $P10."!cursor_pass"(rx609_pos, "")
    rx609_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_618_done
  rxcap_618_fail:
    goto rx609_fail
  rxcap_618_done:
  # rx subrule "deflongname" subtype=capture negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."deflongname"()
    unless $P10, rx609_fail
    rx609_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx609_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
    (rx609_rep) = rx609_cur."!mark_commit"($I620)
  rxquantr614_done:
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
.annotate 'line', 286
  # rx subrule "newpad" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."newpad"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
  alt623_0:
.annotate 'line', 287
    set_addr $I10, alt623_1
    rx609_cur."!mark_push"(0, rx609_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx609_pos, 1
    gt $I11, rx609_eos, rx609_fail
    sub $I11, rx609_pos, rx609_off
    substr $S10, rx609_tgt, $I11, 1
    ne $S10, "(", rx609_fail
    add rx609_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."signature"()
    unless $P10, rx609_fail
    rx609_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx609_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx609_pos, 1
    gt $I11, rx609_eos, rx609_fail
    sub $I11, rx609_pos, rx609_off
    substr $S10, rx609_tgt, $I11, 1
    ne $S10, ")", rx609_fail
    add rx609_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
    goto alt623_end
  alt623_1:
.annotate 'line', 288
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
  alt623_end:
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
.annotate 'line', 289
  # rx subrule "blockoid" subtype=capture negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."blockoid"()
    unless $P10, rx609_fail
    rx609_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx609_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
.annotate 'line', 284
  # rx pass
    rx609_cur."!cursor_pass"(rx609_pos, "routine_def")
    rx609_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx609_pos)
    .return (rx609_cur)
  rx609_fail:
.annotate 'line', 4
    (rx609_rep, rx609_pos, $I10, $P10) = rx609_cur."!mark_fail"(0)
    lt rx609_pos, -1, rx609_done
    eq rx609_pos, -1, rx609_fail
    jump $I10
  rx609_done:
    rx609_cur."!cursor_fail"()
    rx609_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx609_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("150_1273884026.76819") :method
.annotate 'line', 4
    new $P611, "ResizablePMCArray"
    push $P611, ""
    .return ($P611)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("151_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx633_tgt
    .local int rx633_pos
    .local int rx633_off
    .local int rx633_eos
    .local int rx633_rep
    .local pmc rx633_cur
    (rx633_cur, rx633_pos, rx633_tgt) = self."!cursor_start"()
    rx633_cur."!cursor_debug"("START ", "method_def")
    rx633_cur."!cursor_caparray"("deflongname")
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
    ne $I10, -1, rxscan636_done
    goto rxscan636_scan
  rxscan636_loop:
    ($P10) = rx633_cur."from"()
    inc $P10
    set rx633_pos, $P10
    ge rx633_pos, rx633_eos, rxscan636_done
  rxscan636_scan:
    set_addr $I10, rxscan636_loop
    rx633_cur."!mark_push"(0, rx633_pos, $I10)
  rxscan636_done:
.annotate 'line', 292
  # rx subrule "ws" subtype=method negate=
    rx633_cur."!cursor_pos"(rx633_pos)
    $P10 = rx633_cur."ws"()
    unless $P10, rx633_fail
    rx633_pos = $P10."pos"()
.annotate 'line', 293
  # rx rxquantr638 ** 0..1
    set_addr $I639, rxquantr638_done
    rx633_cur."!mark_push"(0, rx633_pos, $I639)
  rxquantr638_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx633_cur."!cursor_pos"(rx633_pos)
    $P10 = rx633_cur."deflongname"()
    unless $P10, rx633_fail
    rx633_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx633_pos = $P10."pos"()
    (rx633_rep) = rx633_cur."!mark_commit"($I639)
  rxquantr638_done:
  # rx subrule "ws" subtype=method negate=
    rx633_cur."!cursor_pos"(rx633_pos)
    $P10 = rx633_cur."ws"()
    unless $P10, rx633_fail
    rx633_pos = $P10."pos"()
.annotate 'line', 294
  # rx subrule "newpad" subtype=method negate=
    rx633_cur."!cursor_pos"(rx633_pos)
    $P10 = rx633_cur."newpad"()
    unless $P10, rx633_fail
    rx633_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx633_cur."!cursor_pos"(rx633_pos)
    $P10 = rx633_cur."ws"()
    unless $P10, rx633_fail
    rx633_pos = $P10."pos"()
  alt642_0:
.annotate 'line', 295
    set_addr $I10, alt642_1
    rx633_cur."!mark_push"(0, rx633_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx633_cur."!cursor_pos"(rx633_pos)
    $P10 = rx633_cur."ws"()
    unless $P10, rx633_fail
    rx633_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx633_pos, 1
    gt $I11, rx633_eos, rx633_fail
    sub $I11, rx633_pos, rx633_off
    substr $S10, rx633_tgt, $I11, 1
    ne $S10, "(", rx633_fail
    add rx633_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx633_cur."!cursor_pos"(rx633_pos)
    $P10 = rx633_cur."ws"()
    unless $P10, rx633_fail
    rx633_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx633_cur."!cursor_pos"(rx633_pos)
    $P10 = rx633_cur."signature"()
    unless $P10, rx633_fail
    rx633_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx633_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx633_cur."!cursor_pos"(rx633_pos)
    $P10 = rx633_cur."ws"()
    unless $P10, rx633_fail
    rx633_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx633_pos, 1
    gt $I11, rx633_eos, rx633_fail
    sub $I11, rx633_pos, rx633_off
    substr $S10, rx633_tgt, $I11, 1
    ne $S10, ")", rx633_fail
    add rx633_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx633_cur."!cursor_pos"(rx633_pos)
    $P10 = rx633_cur."ws"()
    unless $P10, rx633_fail
    rx633_pos = $P10."pos"()
    goto alt642_end
  alt642_1:
.annotate 'line', 296
  # rx subrule "ws" subtype=method negate=
    rx633_cur."!cursor_pos"(rx633_pos)
    $P10 = rx633_cur."ws"()
    unless $P10, rx633_fail
    rx633_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx633_cur."!cursor_pos"(rx633_pos)
    $P10 = rx633_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx633_fail
    rx633_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx633_cur."!cursor_pos"(rx633_pos)
    $P10 = rx633_cur."ws"()
    unless $P10, rx633_fail
    rx633_pos = $P10."pos"()
  alt642_end:
  # rx subrule "ws" subtype=method negate=
    rx633_cur."!cursor_pos"(rx633_pos)
    $P10 = rx633_cur."ws"()
    unless $P10, rx633_fail
    rx633_pos = $P10."pos"()
.annotate 'line', 297
  # rx subrule "blockoid" subtype=capture negate=
    rx633_cur."!cursor_pos"(rx633_pos)
    $P10 = rx633_cur."blockoid"()
    unless $P10, rx633_fail
    rx633_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx633_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx633_cur."!cursor_pos"(rx633_pos)
    $P10 = rx633_cur."ws"()
    unless $P10, rx633_fail
    rx633_pos = $P10."pos"()
.annotate 'line', 292
  # rx pass
    rx633_cur."!cursor_pass"(rx633_pos, "method_def")
    rx633_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx633_pos)
    .return (rx633_cur)
  rx633_fail:
.annotate 'line', 4
    (rx633_rep, rx633_pos, $I10, $P10) = rx633_cur."!mark_fail"(0)
    lt rx633_pos, -1, rx633_done
    eq rx633_pos, -1, rx633_fail
    jump $I10
  rx633_done:
    rx633_cur."!cursor_fail"()
    rx633_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx633_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("152_1273884026.76819") :method
.annotate 'line', 4
    new $P635, "ResizablePMCArray"
    push $P635, ""
    .return ($P635)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("153_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx652_tgt
    .local int rx652_pos
    .local int rx652_off
    .local int rx652_eos
    .local int rx652_rep
    .local pmc rx652_cur
    (rx652_cur, rx652_pos, rx652_tgt) = self."!cursor_start"()
    rx652_cur."!cursor_debug"("START ", "signature")
    rx652_cur."!cursor_caparray"("parameter")
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
.annotate 'line', 300
  # rx rxquantr656 ** 0..1
    set_addr $I659, rxquantr656_done
    rx652_cur."!mark_push"(0, rx652_pos, $I659)
  rxquantr656_loop:
  # rx rxquantr657 ** 1..*
    set_addr $I658, rxquantr657_done
    rx652_cur."!mark_push"(0, -1, $I658)
  rxquantr657_loop:
  # rx subrule "ws" subtype=method negate=
    rx652_cur."!cursor_pos"(rx652_pos)
    $P10 = rx652_cur."ws"()
    unless $P10, rx652_fail
    rx652_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx652_cur."!cursor_pos"(rx652_pos)
    $P10 = rx652_cur."parameter"()
    unless $P10, rx652_fail
    rx652_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx652_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx652_cur."!cursor_pos"(rx652_pos)
    $P10 = rx652_cur."ws"()
    unless $P10, rx652_fail
    rx652_pos = $P10."pos"()
    (rx652_rep) = rx652_cur."!mark_commit"($I658)
    rx652_cur."!mark_push"(rx652_rep, rx652_pos, $I658)
  # rx literal  ","
    add $I11, rx652_pos, 1
    gt $I11, rx652_eos, rx652_fail
    sub $I11, rx652_pos, rx652_off
    substr $S10, rx652_tgt, $I11, 1
    ne $S10, ",", rx652_fail
    add rx652_pos, 1
    goto rxquantr657_loop
  rxquantr657_done:
    (rx652_rep) = rx652_cur."!mark_commit"($I659)
  rxquantr656_done:
  # rx pass
    rx652_cur."!cursor_pass"(rx652_pos, "signature")
    rx652_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx652_pos)
    .return (rx652_cur)
  rx652_fail:
.annotate 'line', 4
    (rx652_rep, rx652_pos, $I10, $P10) = rx652_cur."!mark_fail"(0)
    lt rx652_pos, -1, rx652_done
    eq rx652_pos, -1, rx652_fail
    jump $I10
  rx652_done:
    rx652_cur."!cursor_fail"()
    rx652_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx652_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("154_1273884026.76819") :method
.annotate 'line', 4
    new $P654, "ResizablePMCArray"
    push $P654, ""
    .return ($P654)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("155_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx661_tgt
    .local int rx661_pos
    .local int rx661_off
    .local int rx661_eos
    .local int rx661_rep
    .local pmc rx661_cur
    (rx661_cur, rx661_pos, rx661_tgt) = self."!cursor_start"()
    rx661_cur."!cursor_debug"("START ", "parameter")
    rx661_cur."!cursor_caparray"("default_value")
    .lex unicode:"$\x{a2}", rx661_cur
    .local pmc match
    .lex "$/", match
    length rx661_eos, rx661_tgt
    set rx661_off, 0
    lt rx661_pos, 2, rx661_start
    sub rx661_off, rx661_pos, 1
    substr rx661_tgt, rx661_tgt, rx661_off
  rx661_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan667_done
    goto rxscan667_scan
  rxscan667_loop:
    ($P10) = rx661_cur."from"()
    inc $P10
    set rx661_pos, $P10
    ge rx661_pos, rx661_eos, rxscan667_done
  rxscan667_scan:
    set_addr $I10, rxscan667_loop
    rx661_cur."!mark_push"(0, rx661_pos, $I10)
  rxscan667_done:
  alt668_0:
.annotate 'line', 303
    set_addr $I10, alt668_1
    rx661_cur."!mark_push"(0, rx661_pos, $I10)
.annotate 'line', 304
  # rx subcapture "quant"
    set_addr $I10, rxcap_669_fail
    rx661_cur."!mark_push"(0, rx661_pos, $I10)
  # rx literal  "*"
    add $I11, rx661_pos, 1
    gt $I11, rx661_eos, rx661_fail
    sub $I11, rx661_pos, rx661_off
    substr $S10, rx661_tgt, $I11, 1
    ne $S10, "*", rx661_fail
    add rx661_pos, 1
    set_addr $I10, rxcap_669_fail
    ($I12, $I11) = rx661_cur."!mark_peek"($I10)
    rx661_cur."!cursor_pos"($I11)
    ($P10) = rx661_cur."!cursor_start"()
    $P10."!cursor_pass"(rx661_pos, "")
    rx661_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_669_done
  rxcap_669_fail:
    goto rx661_fail
  rxcap_669_done:
  # rx subrule "param_var" subtype=capture negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."param_var"()
    unless $P10, rx661_fail
    rx661_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx661_pos = $P10."pos"()
    goto alt668_end
  alt668_1:
  alt670_0:
.annotate 'line', 305
    set_addr $I10, alt670_1
    rx661_cur."!mark_push"(0, rx661_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."param_var"()
    unless $P10, rx661_fail
    rx661_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx661_pos = $P10."pos"()
    goto alt670_end
  alt670_1:
  # rx subrule "named_param" subtype=capture negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."named_param"()
    unless $P10, rx661_fail
    rx661_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx661_pos = $P10."pos"()
  alt670_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_672_fail
    rx661_cur."!mark_push"(0, rx661_pos, $I10)
  alt671_0:
    set_addr $I10, alt671_1
    rx661_cur."!mark_push"(0, rx661_pos, $I10)
  # rx literal  "?"
    add $I11, rx661_pos, 1
    gt $I11, rx661_eos, rx661_fail
    sub $I11, rx661_pos, rx661_off
    substr $S10, rx661_tgt, $I11, 1
    ne $S10, "?", rx661_fail
    add rx661_pos, 1
    goto alt671_end
  alt671_1:
    set_addr $I10, alt671_2
    rx661_cur."!mark_push"(0, rx661_pos, $I10)
  # rx literal  "!"
    add $I11, rx661_pos, 1
    gt $I11, rx661_eos, rx661_fail
    sub $I11, rx661_pos, rx661_off
    substr $S10, rx661_tgt, $I11, 1
    ne $S10, "!", rx661_fail
    add rx661_pos, 1
    goto alt671_end
  alt671_2:
  alt671_end:
    set_addr $I10, rxcap_672_fail
    ($I12, $I11) = rx661_cur."!mark_peek"($I10)
    rx661_cur."!cursor_pos"($I11)
    ($P10) = rx661_cur."!cursor_start"()
    $P10."!cursor_pass"(rx661_pos, "")
    rx661_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_672_done
  rxcap_672_fail:
    goto rx661_fail
  rxcap_672_done:
  alt668_end:
.annotate 'line', 307
  # rx rxquantr673 ** 0..1
    set_addr $I674, rxquantr673_done
    rx661_cur."!mark_push"(0, rx661_pos, $I674)
  rxquantr673_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."default_value"()
    unless $P10, rx661_fail
    rx661_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("default_value")
    rx661_pos = $P10."pos"()
    (rx661_rep) = rx661_cur."!mark_commit"($I674)
  rxquantr673_done:
.annotate 'line', 302
  # rx pass
    rx661_cur."!cursor_pass"(rx661_pos, "parameter")
    rx661_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx661_pos)
    .return (rx661_cur)
  rx661_fail:
.annotate 'line', 4
    (rx661_rep, rx661_pos, $I10, $P10) = rx661_cur."!mark_fail"(0)
    lt rx661_pos, -1, rx661_done
    eq rx661_pos, -1, rx661_fail
    jump $I10
  rx661_done:
    rx661_cur."!cursor_fail"()
    rx661_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx661_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("156_1273884026.76819") :method
.annotate 'line', 4
    $P663 = self."!PREFIX__!subrule"("named_param", "")
    $P664 = self."!PREFIX__!subrule"("param_var", "")
    $P665 = self."!PREFIX__!subrule"("param_var", "*")
    new $P666, "ResizablePMCArray"
    push $P666, $P663
    push $P666, $P664
    push $P666, $P665
    .return ($P666)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("157_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx676_tgt
    .local int rx676_pos
    .local int rx676_off
    .local int rx676_eos
    .local int rx676_rep
    .local pmc rx676_cur
    (rx676_cur, rx676_pos, rx676_tgt) = self."!cursor_start"()
    rx676_cur."!cursor_debug"("START ", "param_var")
    rx676_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx676_cur
    .local pmc match
    .lex "$/", match
    length rx676_eos, rx676_tgt
    set rx676_off, 0
    lt rx676_pos, 2, rx676_start
    sub rx676_off, rx676_pos, 1
    substr rx676_tgt, rx676_tgt, rx676_off
  rx676_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan680_done
    goto rxscan680_scan
  rxscan680_loop:
    ($P10) = rx676_cur."from"()
    inc $P10
    set rx676_pos, $P10
    ge rx676_pos, rx676_eos, rxscan680_done
  rxscan680_scan:
    set_addr $I10, rxscan680_loop
    rx676_cur."!mark_push"(0, rx676_pos, $I10)
  rxscan680_done:
.annotate 'line', 311
  # rx subrule "sigil" subtype=capture negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."sigil"()
    unless $P10, rx676_fail
    rx676_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx676_pos = $P10."pos"()
  # rx rxquantr681 ** 0..1
    set_addr $I682, rxquantr681_done
    rx676_cur."!mark_push"(0, rx676_pos, $I682)
  rxquantr681_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."twigil"()
    unless $P10, rx676_fail
    rx676_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx676_pos = $P10."pos"()
    (rx676_rep) = rx676_cur."!mark_commit"($I682)
  rxquantr681_done:
  alt683_0:
.annotate 'line', 312
    set_addr $I10, alt683_1
    rx676_cur."!mark_push"(0, rx676_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ident"()
    unless $P10, rx676_fail
    rx676_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx676_pos = $P10."pos"()
    goto alt683_end
  alt683_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_684_fail
    rx676_cur."!mark_push"(0, rx676_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx676_pos, rx676_eos, rx676_fail
    sub $I10, rx676_pos, rx676_off
    substr $S10, rx676_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx676_fail
    inc rx676_pos
    set_addr $I10, rxcap_684_fail
    ($I12, $I11) = rx676_cur."!mark_peek"($I10)
    rx676_cur."!cursor_pos"($I11)
    ($P10) = rx676_cur."!cursor_start"()
    $P10."!cursor_pass"(rx676_pos, "")
    rx676_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_684_done
  rxcap_684_fail:
    goto rx676_fail
  rxcap_684_done:
  alt683_end:
.annotate 'line', 310
  # rx pass
    rx676_cur."!cursor_pass"(rx676_pos, "param_var")
    rx676_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx676_pos)
    .return (rx676_cur)
  rx676_fail:
.annotate 'line', 4
    (rx676_rep, rx676_pos, $I10, $P10) = rx676_cur."!mark_fail"(0)
    lt rx676_pos, -1, rx676_done
    eq rx676_pos, -1, rx676_fail
    jump $I10
  rx676_done:
    rx676_cur."!cursor_fail"()
    rx676_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx676_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("158_1273884026.76819") :method
.annotate 'line', 4
    $P678 = self."!PREFIX__!subrule"("sigil", "")
    new $P679, "ResizablePMCArray"
    push $P679, $P678
    .return ($P679)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("159_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx686_tgt
    .local int rx686_pos
    .local int rx686_off
    .local int rx686_eos
    .local int rx686_rep
    .local pmc rx686_cur
    (rx686_cur, rx686_pos, rx686_tgt) = self."!cursor_start"()
    rx686_cur."!cursor_debug"("START ", "named_param")
    .lex unicode:"$\x{a2}", rx686_cur
    .local pmc match
    .lex "$/", match
    length rx686_eos, rx686_tgt
    set rx686_off, 0
    lt rx686_pos, 2, rx686_start
    sub rx686_off, rx686_pos, 1
    substr rx686_tgt, rx686_tgt, rx686_off
  rx686_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan690_done
    goto rxscan690_scan
  rxscan690_loop:
    ($P10) = rx686_cur."from"()
    inc $P10
    set rx686_pos, $P10
    ge rx686_pos, rx686_eos, rxscan690_done
  rxscan690_scan:
    set_addr $I10, rxscan690_loop
    rx686_cur."!mark_push"(0, rx686_pos, $I10)
  rxscan690_done:
.annotate 'line', 316
  # rx literal  ":"
    add $I11, rx686_pos, 1
    gt $I11, rx686_eos, rx686_fail
    sub $I11, rx686_pos, rx686_off
    substr $S10, rx686_tgt, $I11, 1
    ne $S10, ":", rx686_fail
    add rx686_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx686_cur."!cursor_pos"(rx686_pos)
    $P10 = rx686_cur."param_var"()
    unless $P10, rx686_fail
    rx686_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx686_pos = $P10."pos"()
.annotate 'line', 315
  # rx pass
    rx686_cur."!cursor_pass"(rx686_pos, "named_param")
    rx686_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx686_pos)
    .return (rx686_cur)
  rx686_fail:
.annotate 'line', 4
    (rx686_rep, rx686_pos, $I10, $P10) = rx686_cur."!mark_fail"(0)
    lt rx686_pos, -1, rx686_done
    eq rx686_pos, -1, rx686_fail
    jump $I10
  rx686_done:
    rx686_cur."!cursor_fail"()
    rx686_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx686_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("160_1273884026.76819") :method
.annotate 'line', 4
    $P688 = self."!PREFIX__!subrule"("param_var", ":")
    new $P689, "ResizablePMCArray"
    push $P689, $P688
    .return ($P689)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("161_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx692_tgt
    .local int rx692_pos
    .local int rx692_off
    .local int rx692_eos
    .local int rx692_rep
    .local pmc rx692_cur
    (rx692_cur, rx692_pos, rx692_tgt) = self."!cursor_start"()
    rx692_cur."!cursor_debug"("START ", "default_value")
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
.annotate 'line', 319
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx692_pos, 1
    gt $I11, rx692_eos, rx692_fail
    sub $I11, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I11, 1
    ne $S10, "=", rx692_fail
    add rx692_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."EXPR"("i=")
    unless $P10, rx692_fail
    rx692_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx692_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ws"()
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
  # rx pass
    rx692_cur."!cursor_pass"(rx692_pos, "default_value")
    rx692_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx692_pos)
    .return (rx692_cur)
  rx692_fail:
.annotate 'line', 4
    (rx692_rep, rx692_pos, $I10, $P10) = rx692_cur."!mark_fail"(0)
    lt rx692_pos, -1, rx692_done
    eq rx692_pos, -1, rx692_fail
    jump $I10
  rx692_done:
    rx692_cur."!cursor_fail"()
    rx692_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx692_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("162_1273884026.76819") :method
.annotate 'line', 4
    new $P694, "ResizablePMCArray"
    push $P694, ""
    .return ($P694)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("163_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx700_tgt
    .local int rx700_pos
    .local int rx700_off
    .local int rx700_eos
    .local int rx700_rep
    .local pmc rx700_cur
    (rx700_cur, rx700_pos, rx700_tgt) = self."!cursor_start"()
    rx700_cur."!cursor_debug"("START ", "regex_declarator")
    rx700_cur."!cursor_caparray"("signature")
    .lex unicode:"$\x{a2}", rx700_cur
    .local pmc match
    .lex "$/", match
    length rx700_eos, rx700_tgt
    set rx700_off, 0
    lt rx700_pos, 2, rx700_start
    sub rx700_off, rx700_pos, 1
    substr rx700_tgt, rx700_tgt, rx700_off
  rx700_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan703_done
    goto rxscan703_scan
  rxscan703_loop:
    ($P10) = rx700_cur."from"()
    inc $P10
    set rx700_pos, $P10
    ge rx700_pos, rx700_eos, rxscan703_done
  rxscan703_scan:
    set_addr $I10, rxscan703_loop
    rx700_cur."!mark_push"(0, rx700_pos, $I10)
  rxscan703_done:
.annotate 'line', 321
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
  alt705_0:
.annotate 'line', 322
    set_addr $I10, alt705_1
    rx700_cur."!mark_push"(0, rx700_pos, $I10)
.annotate 'line', 323
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_707_fail
    rx700_cur."!mark_push"(0, rx700_pos, $I10)
  # rx literal  "proto"
    add $I11, rx700_pos, 5
    gt $I11, rx700_eos, rx700_fail
    sub $I11, rx700_pos, rx700_off
    substr $S10, rx700_tgt, $I11, 5
    ne $S10, "proto", rx700_fail
    add rx700_pos, 5
    set_addr $I10, rxcap_707_fail
    ($I12, $I11) = rx700_cur."!mark_peek"($I10)
    rx700_cur."!cursor_pos"($I11)
    ($P10) = rx700_cur."!cursor_start"()
    $P10."!cursor_pass"(rx700_pos, "")
    rx700_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_707_done
  rxcap_707_fail:
    goto rx700_fail
  rxcap_707_done:
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
  alt709_0:
    set_addr $I10, alt709_1
    rx700_cur."!mark_push"(0, rx700_pos, $I10)
  # rx literal  "regex"
    add $I11, rx700_pos, 5
    gt $I11, rx700_eos, rx700_fail
    sub $I11, rx700_pos, rx700_off
    substr $S10, rx700_tgt, $I11, 5
    ne $S10, "regex", rx700_fail
    add rx700_pos, 5
    goto alt709_end
  alt709_1:
    set_addr $I10, alt709_2
    rx700_cur."!mark_push"(0, rx700_pos, $I10)
  # rx literal  "token"
    add $I11, rx700_pos, 5
    gt $I11, rx700_eos, rx700_fail
    sub $I11, rx700_pos, rx700_off
    substr $S10, rx700_tgt, $I11, 5
    ne $S10, "token", rx700_fail
    add rx700_pos, 5
    goto alt709_end
  alt709_2:
  # rx literal  "rule"
    add $I11, rx700_pos, 4
    gt $I11, rx700_eos, rx700_fail
    sub $I11, rx700_pos, rx700_off
    substr $S10, rx700_tgt, $I11, 4
    ne $S10, "rule", rx700_fail
    add rx700_pos, 4
  alt709_end:
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
.annotate 'line', 324
  # rx subrule "deflongname" subtype=capture negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."deflongname"()
    unless $P10, rx700_fail
    rx700_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx700_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
  alt712_0:
.annotate 'line', 325
    set_addr $I10, alt712_1
    rx700_cur."!mark_push"(0, rx700_pos, $I10)
.annotate 'line', 326
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
  # rx literal  "{"
    add $I11, rx700_pos, 1
    gt $I11, rx700_eos, rx700_fail
    sub $I11, rx700_pos, rx700_off
    substr $S10, rx700_tgt, $I11, 1
    ne $S10, "{", rx700_fail
    add rx700_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx700_pos, 5
    gt $I11, rx700_eos, rx700_fail
    sub $I11, rx700_pos, rx700_off
    substr $S10, rx700_tgt, $I11, 5
    ne $S10, "<...>", rx700_fail
    add rx700_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx700_pos, 1
    gt $I11, rx700_eos, rx700_fail
    sub $I11, rx700_pos, rx700_off
    substr $S10, rx700_tgt, $I11, 1
    ne $S10, "}", rx700_fail
    add rx700_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ENDSTMT"()
    unless $P10, rx700_fail
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
    goto alt712_end
  alt712_1:
.annotate 'line', 327
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."panic"("Proto regex body must be <...>")
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
  alt712_end:
.annotate 'line', 328
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
.annotate 'line', 323
    goto alt705_end
  alt705_1:
.annotate 'line', 329
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_722_fail
    rx700_cur."!mark_push"(0, rx700_pos, $I10)
  alt721_0:
    set_addr $I10, alt721_1
    rx700_cur."!mark_push"(0, rx700_pos, $I10)
  # rx literal  "regex"
    add $I11, rx700_pos, 5
    gt $I11, rx700_eos, rx700_fail
    sub $I11, rx700_pos, rx700_off
    substr $S10, rx700_tgt, $I11, 5
    ne $S10, "regex", rx700_fail
    add rx700_pos, 5
    goto alt721_end
  alt721_1:
    set_addr $I10, alt721_2
    rx700_cur."!mark_push"(0, rx700_pos, $I10)
  # rx literal  "token"
    add $I11, rx700_pos, 5
    gt $I11, rx700_eos, rx700_fail
    sub $I11, rx700_pos, rx700_off
    substr $S10, rx700_tgt, $I11, 5
    ne $S10, "token", rx700_fail
    add rx700_pos, 5
    goto alt721_end
  alt721_2:
  # rx literal  "rule"
    add $I11, rx700_pos, 4
    gt $I11, rx700_eos, rx700_fail
    sub $I11, rx700_pos, rx700_off
    substr $S10, rx700_tgt, $I11, 4
    ne $S10, "rule", rx700_fail
    add rx700_pos, 4
  alt721_end:
    set_addr $I10, rxcap_722_fail
    ($I12, $I11) = rx700_cur."!mark_peek"($I10)
    rx700_cur."!cursor_pos"($I11)
    ($P10) = rx700_cur."!cursor_start"()
    $P10."!cursor_pass"(rx700_pos, "")
    rx700_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_722_done
  rxcap_722_fail:
    goto rx700_fail
  rxcap_722_done:
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
.annotate 'line', 330
  # rx subrule "deflongname" subtype=capture negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."deflongname"()
    unless $P10, rx700_fail
    rx700_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx700_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
.annotate 'line', 331
  # rx subrule "newpad" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."newpad"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
.annotate 'line', 332
  # rx rxquantr726 ** 0..1
    set_addr $I731, rxquantr726_done
    rx700_cur."!mark_push"(0, rx700_pos, $I731)
  rxquantr726_loop:
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx700_pos, 1
    gt $I11, rx700_eos, rx700_fail
    sub $I11, rx700_pos, rx700_off
    substr $S10, rx700_tgt, $I11, 1
    ne $S10, "(", rx700_fail
    add rx700_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."signature"()
    unless $P10, rx700_fail
    rx700_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx700_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx700_pos, 1
    gt $I11, rx700_eos, rx700_fail
    sub $I11, rx700_pos, rx700_off
    substr $S10, rx700_tgt, $I11, 1
    ne $S10, ")", rx700_fail
    add rx700_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
    (rx700_rep) = rx700_cur."!mark_commit"($I731)
  rxquantr726_done:
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
.annotate 'line', 333
  # rx reduce name="regex_declarator" key="open"
    rx700_cur."!cursor_pos"(rx700_pos)
    rx700_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
.annotate 'line', 334
  # rx literal  "{"
    add $I11, rx700_pos, 1
    gt $I11, rx700_eos, rx700_fail
    sub $I11, rx700_pos, rx700_off
    substr $S10, rx700_tgt, $I11, 1
    ne $S10, "{", rx700_fail
    add rx700_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."LANG"("Regex", "nibbler")
    unless $P10, rx700_fail
    rx700_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx700_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx700_pos, 1
    gt $I11, rx700_eos, rx700_fail
    sub $I11, rx700_pos, rx700_off
    substr $S10, rx700_tgt, $I11, 1
    ne $S10, "}", rx700_fail
    add rx700_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ENDSTMT"()
    unless $P10, rx700_fail
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
  alt705_end:
.annotate 'line', 335
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
.annotate 'line', 321
  # rx pass
    rx700_cur."!cursor_pass"(rx700_pos, "regex_declarator")
    rx700_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx700_pos)
    .return (rx700_cur)
  rx700_fail:
.annotate 'line', 4
    (rx700_rep, rx700_pos, $I10, $P10) = rx700_cur."!mark_fail"(0)
    lt rx700_pos, -1, rx700_done
    eq rx700_pos, -1, rx700_fail
    jump $I10
  rx700_done:
    rx700_cur."!cursor_fail"()
    rx700_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx700_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("164_1273884026.76819") :method
.annotate 'line', 4
    new $P702, "ResizablePMCArray"
    push $P702, ""
    .return ($P702)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("165_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx737_tgt
    .local int rx737_pos
    .local int rx737_off
    .local int rx737_eos
    .local int rx737_rep
    .local pmc rx737_cur
    (rx737_cur, rx737_pos, rx737_tgt) = self."!cursor_start"()
    rx737_cur."!cursor_debug"("START ", "dotty")
    rx737_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx737_cur
    .local pmc match
    .lex "$/", match
    length rx737_eos, rx737_tgt
    set rx737_off, 0
    lt rx737_pos, 2, rx737_start
    sub rx737_off, rx737_pos, 1
    substr rx737_tgt, rx737_tgt, rx737_off
  rx737_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan741_done
    goto rxscan741_scan
  rxscan741_loop:
    ($P10) = rx737_cur."from"()
    inc $P10
    set rx737_pos, $P10
    ge rx737_pos, rx737_eos, rxscan741_done
  rxscan741_scan:
    set_addr $I10, rxscan741_loop
    rx737_cur."!mark_push"(0, rx737_pos, $I10)
  rxscan741_done:
.annotate 'line', 339
  # rx literal  "."
    add $I11, rx737_pos, 1
    gt $I11, rx737_eos, rx737_fail
    sub $I11, rx737_pos, rx737_off
    substr $S10, rx737_tgt, $I11, 1
    ne $S10, ".", rx737_fail
    add rx737_pos, 1
  alt742_0:
.annotate 'line', 340
    set_addr $I10, alt742_1
    rx737_cur."!mark_push"(0, rx737_pos, $I10)
  # rx subrule "identifier" subtype=capture negate=
    rx737_cur."!cursor_pos"(rx737_pos)
    $P10 = rx737_cur."identifier"()
    unless $P10, rx737_fail
    rx737_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=identifier")
    rx737_pos = $P10."pos"()
    goto alt742_end
  alt742_1:
.annotate 'line', 341
  # rx enumcharlist negate=0 zerowidth
    ge rx737_pos, rx737_eos, rx737_fail
    sub $I10, rx737_pos, rx737_off
    substr $S10, rx737_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx737_fail
  # rx subrule "quote" subtype=capture negate=
    rx737_cur."!cursor_pos"(rx737_pos)
    $P10 = rx737_cur."quote"()
    unless $P10, rx737_fail
    rx737_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx737_pos = $P10."pos"()
  alt743_0:
.annotate 'line', 342
    set_addr $I10, alt743_1
    rx737_cur."!mark_push"(0, rx737_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx737_pos, rx737_eos, rx737_fail
    sub $I10, rx737_pos, rx737_off
    substr $S10, rx737_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx737_fail
    goto alt743_end
  alt743_1:
  # rx subrule "panic" subtype=method negate=
    rx737_cur."!cursor_pos"(rx737_pos)
    $P10 = rx737_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx737_fail
    rx737_pos = $P10."pos"()
  alt743_end:
  alt742_end:
.annotate 'line', 348
  # rx rxquantr744 ** 0..1
    set_addr $I746, rxquantr744_done
    rx737_cur."!mark_push"(0, rx737_pos, $I746)
  rxquantr744_loop:
  alt745_0:
.annotate 'line', 345
    set_addr $I10, alt745_1
    rx737_cur."!mark_push"(0, rx737_pos, $I10)
.annotate 'line', 346
  # rx enumcharlist negate=0 zerowidth
    ge rx737_pos, rx737_eos, rx737_fail
    sub $I10, rx737_pos, rx737_off
    substr $S10, rx737_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx737_fail
  # rx subrule "args" subtype=capture negate=
    rx737_cur."!cursor_pos"(rx737_pos)
    $P10 = rx737_cur."args"()
    unless $P10, rx737_fail
    rx737_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx737_pos = $P10."pos"()
    goto alt745_end
  alt745_1:
.annotate 'line', 347
  # rx literal  ":"
    add $I11, rx737_pos, 1
    gt $I11, rx737_eos, rx737_fail
    sub $I11, rx737_pos, rx737_off
    substr $S10, rx737_tgt, $I11, 1
    ne $S10, ":", rx737_fail
    add rx737_pos, 1
  # rx charclass s
    ge rx737_pos, rx737_eos, rx737_fail
    sub $I10, rx737_pos, rx737_off
    is_cclass $I11, 32, rx737_tgt, $I10
    unless $I11, rx737_fail
    inc rx737_pos
  # rx subrule "arglist" subtype=capture negate=
    rx737_cur."!cursor_pos"(rx737_pos)
    $P10 = rx737_cur."arglist"()
    unless $P10, rx737_fail
    rx737_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx737_pos = $P10."pos"()
  alt745_end:
.annotate 'line', 348
    (rx737_rep) = rx737_cur."!mark_commit"($I746)
  rxquantr744_done:
.annotate 'line', 338
  # rx pass
    rx737_cur."!cursor_pass"(rx737_pos, "dotty")
    rx737_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx737_pos)
    .return (rx737_cur)
  rx737_fail:
.annotate 'line', 4
    (rx737_rep, rx737_pos, $I10, $P10) = rx737_cur."!mark_fail"(0)
    lt rx737_pos, -1, rx737_done
    eq rx737_pos, -1, rx737_fail
    jump $I10
  rx737_done:
    rx737_cur."!cursor_fail"()
    rx737_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx737_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("166_1273884026.76819") :method
.annotate 'line', 4
    $P739 = self."!PREFIX__!subrule"("longname=identifier", ".")
    new $P740, "ResizablePMCArray"
    push $P740, "'"
    push $P740, "\""
    push $P740, $P739
    .return ($P740)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("167_1273884026.76819") :method
.annotate 'line', 352
    $P748 = self."!protoregex"("term")
    .return ($P748)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("168_1273884026.76819") :method
.annotate 'line', 352
    $P750 = self."!PREFIX__!protoregex"("term")
    .return ($P750)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("169_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx752_tgt
    .local int rx752_pos
    .local int rx752_off
    .local int rx752_eos
    .local int rx752_rep
    .local pmc rx752_cur
    (rx752_cur, rx752_pos, rx752_tgt) = self."!cursor_start"()
    rx752_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx752_cur
    .local pmc match
    .lex "$/", match
    length rx752_eos, rx752_tgt
    set rx752_off, 0
    lt rx752_pos, 2, rx752_start
    sub rx752_off, rx752_pos, 1
    substr rx752_tgt, rx752_tgt, rx752_off
  rx752_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan755_done
    goto rxscan755_scan
  rxscan755_loop:
    ($P10) = rx752_cur."from"()
    inc $P10
    set rx752_pos, $P10
    ge rx752_pos, rx752_eos, rxscan755_done
  rxscan755_scan:
    set_addr $I10, rxscan755_loop
    rx752_cur."!mark_push"(0, rx752_pos, $I10)
  rxscan755_done:
.annotate 'line', 354
  # rx subcapture "sym"
    set_addr $I10, rxcap_756_fail
    rx752_cur."!mark_push"(0, rx752_pos, $I10)
  # rx literal  "self"
    add $I11, rx752_pos, 4
    gt $I11, rx752_eos, rx752_fail
    sub $I11, rx752_pos, rx752_off
    substr $S10, rx752_tgt, $I11, 4
    ne $S10, "self", rx752_fail
    add rx752_pos, 4
    set_addr $I10, rxcap_756_fail
    ($I12, $I11) = rx752_cur."!mark_peek"($I10)
    rx752_cur."!cursor_pos"($I11)
    ($P10) = rx752_cur."!cursor_start"()
    $P10."!cursor_pass"(rx752_pos, "")
    rx752_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_756_done
  rxcap_756_fail:
    goto rx752_fail
  rxcap_756_done:
  # rxanchor rwb
    le rx752_pos, 0, rx752_fail
    sub $I10, rx752_pos, rx752_off
    is_cclass $I11, 8192, rx752_tgt, $I10
    if $I11, rx752_fail
    dec $I10
    is_cclass $I11, 8192, rx752_tgt, $I10
    unless $I11, rx752_fail
  # rx pass
    rx752_cur."!cursor_pass"(rx752_pos, "term:sym<self>")
    rx752_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx752_pos)
    .return (rx752_cur)
  rx752_fail:
.annotate 'line', 4
    (rx752_rep, rx752_pos, $I10, $P10) = rx752_cur."!mark_fail"(0)
    lt rx752_pos, -1, rx752_done
    eq rx752_pos, -1, rx752_fail
    jump $I10
  rx752_done:
    rx752_cur."!cursor_fail"()
    rx752_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx752_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("170_1273884026.76819") :method
.annotate 'line', 4
    new $P754, "ResizablePMCArray"
    push $P754, "self"
    .return ($P754)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("171_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx758_tgt
    .local int rx758_pos
    .local int rx758_off
    .local int rx758_eos
    .local int rx758_rep
    .local pmc rx758_cur
    (rx758_cur, rx758_pos, rx758_tgt) = self."!cursor_start"()
    rx758_cur."!cursor_debug"("START ", "term:sym<identifier>")
    .lex unicode:"$\x{a2}", rx758_cur
    .local pmc match
    .lex "$/", match
    length rx758_eos, rx758_tgt
    set rx758_off, 0
    lt rx758_pos, 2, rx758_start
    sub rx758_off, rx758_pos, 1
    substr rx758_tgt, rx758_tgt, rx758_off
  rx758_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan762_done
    goto rxscan762_scan
  rxscan762_loop:
    ($P10) = rx758_cur."from"()
    inc $P10
    set rx758_pos, $P10
    ge rx758_pos, rx758_eos, rxscan762_done
  rxscan762_scan:
    set_addr $I10, rxscan762_loop
    rx758_cur."!mark_push"(0, rx758_pos, $I10)
  rxscan762_done:
.annotate 'line', 357
  # rx subrule "identifier" subtype=capture negate=
    rx758_cur."!cursor_pos"(rx758_pos)
    $P10 = rx758_cur."identifier"()
    unless $P10, rx758_fail
    rx758_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx758_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx758_pos, rx758_eos, rx758_fail
    sub $I10, rx758_pos, rx758_off
    substr $S10, rx758_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx758_fail
  # rx subrule "args" subtype=capture negate=
    rx758_cur."!cursor_pos"(rx758_pos)
    $P10 = rx758_cur."args"()
    unless $P10, rx758_fail
    rx758_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx758_pos = $P10."pos"()
.annotate 'line', 356
  # rx pass
    rx758_cur."!cursor_pass"(rx758_pos, "term:sym<identifier>")
    rx758_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx758_pos)
    .return (rx758_cur)
  rx758_fail:
.annotate 'line', 4
    (rx758_rep, rx758_pos, $I10, $P10) = rx758_cur."!mark_fail"(0)
    lt rx758_pos, -1, rx758_done
    eq rx758_pos, -1, rx758_fail
    jump $I10
  rx758_done:
    rx758_cur."!cursor_fail"()
    rx758_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx758_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("172_1273884026.76819") :method
.annotate 'line', 4
    $P760 = self."!PREFIX__!subrule"("identifier", "")
    new $P761, "ResizablePMCArray"
    push $P761, $P760
    .return ($P761)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("173_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx764_tgt
    .local int rx764_pos
    .local int rx764_off
    .local int rx764_eos
    .local int rx764_rep
    .local pmc rx764_cur
    (rx764_cur, rx764_pos, rx764_tgt) = self."!cursor_start"()
    rx764_cur."!cursor_debug"("START ", "term:sym<name>")
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
    ne $I10, -1, rxscan768_done
    goto rxscan768_scan
  rxscan768_loop:
    ($P10) = rx764_cur."from"()
    inc $P10
    set rx764_pos, $P10
    ge rx764_pos, rx764_eos, rxscan768_done
  rxscan768_scan:
    set_addr $I10, rxscan768_loop
    rx764_cur."!mark_push"(0, rx764_pos, $I10)
  rxscan768_done:
.annotate 'line', 361
  # rx subrule "name" subtype=capture negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."name"()
    unless $P10, rx764_fail
    rx764_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx764_pos = $P10."pos"()
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
.annotate 'line', 360
  # rx pass
    rx764_cur."!cursor_pass"(rx764_pos, "term:sym<name>")
    rx764_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx764_pos)
    .return (rx764_cur)
  rx764_fail:
.annotate 'line', 4
    (rx764_rep, rx764_pos, $I10, $P10) = rx764_cur."!mark_fail"(0)
    lt rx764_pos, -1, rx764_done
    eq rx764_pos, -1, rx764_fail
    jump $I10
  rx764_done:
    rx764_cur."!cursor_fail"()
    rx764_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx764_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("174_1273884026.76819") :method
.annotate 'line', 4
    $P766 = self."!PREFIX__!subrule"("name", "")
    new $P767, "ResizablePMCArray"
    push $P767, $P766
    .return ($P767)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("175_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx772_tgt
    .local int rx772_pos
    .local int rx772_off
    .local int rx772_eos
    .local int rx772_rep
    .local pmc rx772_cur
    (rx772_cur, rx772_pos, rx772_tgt) = self."!cursor_start"()
    rx772_cur."!cursor_debug"("START ", "term:sym<pir::op>")
    rx772_cur."!cursor_caparray"("args")
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
.annotate 'line', 365
  # rx literal  "pir::"
    add $I11, rx772_pos, 5
    gt $I11, rx772_eos, rx772_fail
    sub $I11, rx772_pos, rx772_off
    substr $S10, rx772_tgt, $I11, 5
    ne $S10, "pir::", rx772_fail
    add rx772_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_776_fail
    rx772_cur."!mark_push"(0, rx772_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx772_pos, rx772_off
    find_not_cclass $I11, 8192, rx772_tgt, $I10, rx772_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx772_fail
    add rx772_pos, rx772_off, $I11
    set_addr $I10, rxcap_776_fail
    ($I12, $I11) = rx772_cur."!mark_peek"($I10)
    rx772_cur."!cursor_pos"($I11)
    ($P10) = rx772_cur."!cursor_start"()
    $P10."!cursor_pass"(rx772_pos, "")
    rx772_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_776_done
  rxcap_776_fail:
    goto rx772_fail
  rxcap_776_done:
  # rx rxquantr777 ** 0..1
    set_addr $I778, rxquantr777_done
    rx772_cur."!mark_push"(0, rx772_pos, $I778)
  rxquantr777_loop:
  # rx subrule "args" subtype=capture negate=
    rx772_cur."!cursor_pos"(rx772_pos)
    $P10 = rx772_cur."args"()
    unless $P10, rx772_fail
    rx772_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx772_pos = $P10."pos"()
    (rx772_rep) = rx772_cur."!mark_commit"($I778)
  rxquantr777_done:
.annotate 'line', 364
  # rx pass
    rx772_cur."!cursor_pass"(rx772_pos, "term:sym<pir::op>")
    rx772_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx772_pos)
    .return (rx772_cur)
  rx772_fail:
.annotate 'line', 4
    (rx772_rep, rx772_pos, $I10, $P10) = rx772_cur."!mark_fail"(0)
    lt rx772_pos, -1, rx772_done
    eq rx772_pos, -1, rx772_fail
    jump $I10
  rx772_done:
    rx772_cur."!cursor_fail"()
    rx772_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx772_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("176_1273884026.76819") :method
.annotate 'line', 4
    new $P774, "ResizablePMCArray"
    push $P774, "pir::"
    .return ($P774)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("177_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx780_tgt
    .local int rx780_pos
    .local int rx780_off
    .local int rx780_eos
    .local int rx780_rep
    .local pmc rx780_cur
    (rx780_cur, rx780_pos, rx780_tgt) = self."!cursor_start"()
    rx780_cur."!cursor_debug"("START ", "args")
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
    ne $I10, -1, rxscan784_done
    goto rxscan784_scan
  rxscan784_loop:
    ($P10) = rx780_cur."from"()
    inc $P10
    set rx780_pos, $P10
    ge rx780_pos, rx780_eos, rxscan784_done
  rxscan784_scan:
    set_addr $I10, rxscan784_loop
    rx780_cur."!mark_push"(0, rx780_pos, $I10)
  rxscan784_done:
.annotate 'line', 369
  # rx literal  "("
    add $I11, rx780_pos, 1
    gt $I11, rx780_eos, rx780_fail
    sub $I11, rx780_pos, rx780_off
    substr $S10, rx780_tgt, $I11, 1
    ne $S10, "(", rx780_fail
    add rx780_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx780_cur."!cursor_pos"(rx780_pos)
    $P10 = rx780_cur."arglist"()
    unless $P10, rx780_fail
    rx780_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx780_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx780_pos, 1
    gt $I11, rx780_eos, rx780_fail
    sub $I11, rx780_pos, rx780_off
    substr $S10, rx780_tgt, $I11, 1
    ne $S10, ")", rx780_fail
    add rx780_pos, 1
  # rx pass
    rx780_cur."!cursor_pass"(rx780_pos, "args")
    rx780_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx780_pos)
    .return (rx780_cur)
  rx780_fail:
.annotate 'line', 4
    (rx780_rep, rx780_pos, $I10, $P10) = rx780_cur."!mark_fail"(0)
    lt rx780_pos, -1, rx780_done
    eq rx780_pos, -1, rx780_fail
    jump $I10
  rx780_done:
    rx780_cur."!cursor_fail"()
    rx780_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx780_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("178_1273884026.76819") :method
.annotate 'line', 4
    $P782 = self."!PREFIX__!subrule"("arglist", "(")
    new $P783, "ResizablePMCArray"
    push $P783, $P782
    .return ($P783)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("179_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx786_tgt
    .local int rx786_pos
    .local int rx786_off
    .local int rx786_eos
    .local int rx786_rep
    .local pmc rx786_cur
    (rx786_cur, rx786_pos, rx786_tgt) = self."!cursor_start"()
    rx786_cur."!cursor_debug"("START ", "arglist")
    .lex unicode:"$\x{a2}", rx786_cur
    .local pmc match
    .lex "$/", match
    length rx786_eos, rx786_tgt
    set rx786_off, 0
    lt rx786_pos, 2, rx786_start
    sub rx786_off, rx786_pos, 1
    substr rx786_tgt, rx786_tgt, rx786_off
  rx786_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan790_done
    goto rxscan790_scan
  rxscan790_loop:
    ($P10) = rx786_cur."from"()
    inc $P10
    set rx786_pos, $P10
    ge rx786_pos, rx786_eos, rxscan790_done
  rxscan790_scan:
    set_addr $I10, rxscan790_loop
    rx786_cur."!mark_push"(0, rx786_pos, $I10)
  rxscan790_done:
.annotate 'line', 373
  # rx subrule "ws" subtype=method negate=
    rx786_cur."!cursor_pos"(rx786_pos)
    $P10 = rx786_cur."ws"()
    unless $P10, rx786_fail
    rx786_pos = $P10."pos"()
  alt791_0:
.annotate 'line', 374
    set_addr $I10, alt791_1
    rx786_cur."!mark_push"(0, rx786_pos, $I10)
.annotate 'line', 375
  # rx subrule "EXPR" subtype=capture negate=
    rx786_cur."!cursor_pos"(rx786_pos)
    $P10 = rx786_cur."EXPR"("f=")
    unless $P10, rx786_fail
    rx786_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx786_pos = $P10."pos"()
    goto alt791_end
  alt791_1:
  alt791_end:
.annotate 'line', 372
  # rx pass
    rx786_cur."!cursor_pass"(rx786_pos, "arglist")
    rx786_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx786_pos)
    .return (rx786_cur)
  rx786_fail:
.annotate 'line', 4
    (rx786_rep, rx786_pos, $I10, $P10) = rx786_cur."!mark_fail"(0)
    lt rx786_pos, -1, rx786_done
    eq rx786_pos, -1, rx786_fail
    jump $I10
  rx786_done:
    rx786_cur."!cursor_fail"()
    rx786_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx786_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("180_1273884026.76819") :method
.annotate 'line', 4
    $P788 = self."!PREFIX__!subrule"("", "")
    new $P789, "ResizablePMCArray"
    push $P789, $P788
    .return ($P789)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("181_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx793_tgt
    .local int rx793_pos
    .local int rx793_off
    .local int rx793_eos
    .local int rx793_rep
    .local pmc rx793_cur
    (rx793_cur, rx793_pos, rx793_tgt) = self."!cursor_start"()
    rx793_cur."!cursor_debug"("START ", "term:sym<value>")
    .lex unicode:"$\x{a2}", rx793_cur
    .local pmc match
    .lex "$/", match
    length rx793_eos, rx793_tgt
    set rx793_off, 0
    lt rx793_pos, 2, rx793_start
    sub rx793_off, rx793_pos, 1
    substr rx793_tgt, rx793_tgt, rx793_off
  rx793_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan797_done
    goto rxscan797_scan
  rxscan797_loop:
    ($P10) = rx793_cur."from"()
    inc $P10
    set rx793_pos, $P10
    ge rx793_pos, rx793_eos, rxscan797_done
  rxscan797_scan:
    set_addr $I10, rxscan797_loop
    rx793_cur."!mark_push"(0, rx793_pos, $I10)
  rxscan797_done:
.annotate 'line', 381
  # rx subrule "value" subtype=capture negate=
    rx793_cur."!cursor_pos"(rx793_pos)
    $P10 = rx793_cur."value"()
    unless $P10, rx793_fail
    rx793_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx793_pos = $P10."pos"()
  # rx pass
    rx793_cur."!cursor_pass"(rx793_pos, "term:sym<value>")
    rx793_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx793_pos)
    .return (rx793_cur)
  rx793_fail:
.annotate 'line', 4
    (rx793_rep, rx793_pos, $I10, $P10) = rx793_cur."!mark_fail"(0)
    lt rx793_pos, -1, rx793_done
    eq rx793_pos, -1, rx793_fail
    jump $I10
  rx793_done:
    rx793_cur."!cursor_fail"()
    rx793_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx793_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("182_1273884026.76819") :method
.annotate 'line', 4
    $P795 = self."!PREFIX__!subrule"("value", "")
    new $P796, "ResizablePMCArray"
    push $P796, $P795
    .return ($P796)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("183_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx799_tgt
    .local int rx799_pos
    .local int rx799_off
    .local int rx799_eos
    .local int rx799_rep
    .local pmc rx799_cur
    (rx799_cur, rx799_pos, rx799_tgt) = self."!cursor_start"()
    rx799_cur."!cursor_debug"("START ", "value")
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
    ne $I10, -1, rxscan804_done
    goto rxscan804_scan
  rxscan804_loop:
    ($P10) = rx799_cur."from"()
    inc $P10
    set rx799_pos, $P10
    ge rx799_pos, rx799_eos, rxscan804_done
  rxscan804_scan:
    set_addr $I10, rxscan804_loop
    rx799_cur."!mark_push"(0, rx799_pos, $I10)
  rxscan804_done:
  alt805_0:
.annotate 'line', 383
    set_addr $I10, alt805_1
    rx799_cur."!mark_push"(0, rx799_pos, $I10)
.annotate 'line', 384
  # rx subrule "quote" subtype=capture negate=
    rx799_cur."!cursor_pos"(rx799_pos)
    $P10 = rx799_cur."quote"()
    unless $P10, rx799_fail
    rx799_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx799_pos = $P10."pos"()
    goto alt805_end
  alt805_1:
.annotate 'line', 385
  # rx subrule "number" subtype=capture negate=
    rx799_cur."!cursor_pos"(rx799_pos)
    $P10 = rx799_cur."number"()
    unless $P10, rx799_fail
    rx799_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("number")
    rx799_pos = $P10."pos"()
  alt805_end:
.annotate 'line', 383
  # rx pass
    rx799_cur."!cursor_pass"(rx799_pos, "value")
    rx799_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx799_pos)
    .return (rx799_cur)
  rx799_fail:
.annotate 'line', 4
    (rx799_rep, rx799_pos, $I10, $P10) = rx799_cur."!mark_fail"(0)
    lt rx799_pos, -1, rx799_done
    eq rx799_pos, -1, rx799_fail
    jump $I10
  rx799_done:
    rx799_cur."!cursor_fail"()
    rx799_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx799_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("184_1273884026.76819") :method
.annotate 'line', 4
    $P801 = self."!PREFIX__!subrule"("number", "")
    $P802 = self."!PREFIX__!subrule"("quote", "")
    new $P803, "ResizablePMCArray"
    push $P803, $P801
    push $P803, $P802
    .return ($P803)
.end


.namespace ["NQP";"Grammar"]
.sub "number"  :subid("185_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx807_tgt
    .local int rx807_pos
    .local int rx807_off
    .local int rx807_eos
    .local int rx807_rep
    .local pmc rx807_cur
    (rx807_cur, rx807_pos, rx807_tgt) = self."!cursor_start"()
    rx807_cur."!cursor_debug"("START ", "number")
    .lex unicode:"$\x{a2}", rx807_cur
    .local pmc match
    .lex "$/", match
    length rx807_eos, rx807_tgt
    set rx807_off, 0
    lt rx807_pos, 2, rx807_start
    sub rx807_off, rx807_pos, 1
    substr rx807_tgt, rx807_tgt, rx807_off
  rx807_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan810_done
    goto rxscan810_scan
  rxscan810_loop:
    ($P10) = rx807_cur."from"()
    inc $P10
    set rx807_pos, $P10
    ge rx807_pos, rx807_eos, rxscan810_done
  rxscan810_scan:
    set_addr $I10, rxscan810_loop
    rx807_cur."!mark_push"(0, rx807_pos, $I10)
  rxscan810_done:
.annotate 'line', 389
  # rx subcapture "sign"
    set_addr $I10, rxcap_813_fail
    rx807_cur."!mark_push"(0, rx807_pos, $I10)
  # rx rxquantr811 ** 0..1
    set_addr $I812, rxquantr811_done
    rx807_cur."!mark_push"(0, rx807_pos, $I812)
  rxquantr811_loop:
  # rx enumcharlist negate=0 
    ge rx807_pos, rx807_eos, rx807_fail
    sub $I10, rx807_pos, rx807_off
    substr $S10, rx807_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rx807_fail
    inc rx807_pos
    (rx807_rep) = rx807_cur."!mark_commit"($I812)
  rxquantr811_done:
    set_addr $I10, rxcap_813_fail
    ($I12, $I11) = rx807_cur."!mark_peek"($I10)
    rx807_cur."!cursor_pos"($I11)
    ($P10) = rx807_cur."!cursor_start"()
    $P10."!cursor_pass"(rx807_pos, "")
    rx807_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_813_done
  rxcap_813_fail:
    goto rx807_fail
  rxcap_813_done:
  alt814_0:
.annotate 'line', 390
    set_addr $I10, alt814_1
    rx807_cur."!mark_push"(0, rx807_pos, $I10)
  # rx subrule "dec_number" subtype=capture negate=
    rx807_cur."!cursor_pos"(rx807_pos)
    $P10 = rx807_cur."dec_number"()
    unless $P10, rx807_fail
    rx807_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx807_pos = $P10."pos"()
    goto alt814_end
  alt814_1:
  # rx subrule "integer" subtype=capture negate=
    rx807_cur."!cursor_pos"(rx807_pos)
    $P10 = rx807_cur."integer"()
    unless $P10, rx807_fail
    rx807_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx807_pos = $P10."pos"()
  alt814_end:
.annotate 'line', 388
  # rx pass
    rx807_cur."!cursor_pass"(rx807_pos, "number")
    rx807_cur."!cursor_debug"("PASS  ", "number", " at pos=", rx807_pos)
    .return (rx807_cur)
  rx807_fail:
.annotate 'line', 4
    (rx807_rep, rx807_pos, $I10, $P10) = rx807_cur."!mark_fail"(0)
    lt rx807_pos, -1, rx807_done
    eq rx807_pos, -1, rx807_fail
    jump $I10
  rx807_done:
    rx807_cur."!cursor_fail"()
    rx807_cur."!cursor_debug"("FAIL  ", "number")
    .return (rx807_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__number"  :subid("186_1273884026.76819") :method
.annotate 'line', 4
    new $P809, "ResizablePMCArray"
    push $P809, ""
    .return ($P809)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("187_1273884026.76819") :method
.annotate 'line', 393
    $P816 = self."!protoregex"("quote")
    .return ($P816)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("188_1273884026.76819") :method
.annotate 'line', 393
    $P818 = self."!PREFIX__!protoregex"("quote")
    .return ($P818)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("189_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx820_tgt
    .local int rx820_pos
    .local int rx820_off
    .local int rx820_eos
    .local int rx820_rep
    .local pmc rx820_cur
    (rx820_cur, rx820_pos, rx820_tgt) = self."!cursor_start"()
    rx820_cur."!cursor_debug"("START ", "quote:sym<apos>")
    .lex unicode:"$\x{a2}", rx820_cur
    .local pmc match
    .lex "$/", match
    length rx820_eos, rx820_tgt
    set rx820_off, 0
    lt rx820_pos, 2, rx820_start
    sub rx820_off, rx820_pos, 1
    substr rx820_tgt, rx820_tgt, rx820_off
  rx820_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan823_done
    goto rxscan823_scan
  rxscan823_loop:
    ($P10) = rx820_cur."from"()
    inc $P10
    set rx820_pos, $P10
    ge rx820_pos, rx820_eos, rxscan823_done
  rxscan823_scan:
    set_addr $I10, rxscan823_loop
    rx820_cur."!mark_push"(0, rx820_pos, $I10)
  rxscan823_done:
.annotate 'line', 394
  # rx enumcharlist negate=0 zerowidth
    ge rx820_pos, rx820_eos, rx820_fail
    sub $I10, rx820_pos, rx820_off
    substr $S10, rx820_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx820_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx820_cur."!cursor_pos"(rx820_pos)
    $P10 = rx820_cur."quote_EXPR"(":q")
    unless $P10, rx820_fail
    rx820_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx820_pos = $P10."pos"()
  # rx pass
    rx820_cur."!cursor_pass"(rx820_pos, "quote:sym<apos>")
    rx820_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx820_pos)
    .return (rx820_cur)
  rx820_fail:
.annotate 'line', 4
    (rx820_rep, rx820_pos, $I10, $P10) = rx820_cur."!mark_fail"(0)
    lt rx820_pos, -1, rx820_done
    eq rx820_pos, -1, rx820_fail
    jump $I10
  rx820_done:
    rx820_cur."!cursor_fail"()
    rx820_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx820_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("190_1273884026.76819") :method
.annotate 'line', 4
    new $P822, "ResizablePMCArray"
    push $P822, "'"
    .return ($P822)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("191_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx825_tgt
    .local int rx825_pos
    .local int rx825_off
    .local int rx825_eos
    .local int rx825_rep
    .local pmc rx825_cur
    (rx825_cur, rx825_pos, rx825_tgt) = self."!cursor_start"()
    rx825_cur."!cursor_debug"("START ", "quote:sym<dblq>")
    .lex unicode:"$\x{a2}", rx825_cur
    .local pmc match
    .lex "$/", match
    length rx825_eos, rx825_tgt
    set rx825_off, 0
    lt rx825_pos, 2, rx825_start
    sub rx825_off, rx825_pos, 1
    substr rx825_tgt, rx825_tgt, rx825_off
  rx825_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan828_done
    goto rxscan828_scan
  rxscan828_loop:
    ($P10) = rx825_cur."from"()
    inc $P10
    set rx825_pos, $P10
    ge rx825_pos, rx825_eos, rxscan828_done
  rxscan828_scan:
    set_addr $I10, rxscan828_loop
    rx825_cur."!mark_push"(0, rx825_pos, $I10)
  rxscan828_done:
.annotate 'line', 395
  # rx enumcharlist negate=0 zerowidth
    ge rx825_pos, rx825_eos, rx825_fail
    sub $I10, rx825_pos, rx825_off
    substr $S10, rx825_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx825_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx825_cur."!cursor_pos"(rx825_pos)
    $P10 = rx825_cur."quote_EXPR"(":qq")
    unless $P10, rx825_fail
    rx825_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx825_pos = $P10."pos"()
  # rx pass
    rx825_cur."!cursor_pass"(rx825_pos, "quote:sym<dblq>")
    rx825_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx825_pos)
    .return (rx825_cur)
  rx825_fail:
.annotate 'line', 4
    (rx825_rep, rx825_pos, $I10, $P10) = rx825_cur."!mark_fail"(0)
    lt rx825_pos, -1, rx825_done
    eq rx825_pos, -1, rx825_fail
    jump $I10
  rx825_done:
    rx825_cur."!cursor_fail"()
    rx825_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx825_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("192_1273884026.76819") :method
.annotate 'line', 4
    new $P827, "ResizablePMCArray"
    push $P827, "\""
    .return ($P827)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("193_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx830_tgt
    .local int rx830_pos
    .local int rx830_off
    .local int rx830_eos
    .local int rx830_rep
    .local pmc rx830_cur
    (rx830_cur, rx830_pos, rx830_tgt) = self."!cursor_start"()
    rx830_cur."!cursor_debug"("START ", "quote:sym<q>")
    .lex unicode:"$\x{a2}", rx830_cur
    .local pmc match
    .lex "$/", match
    length rx830_eos, rx830_tgt
    set rx830_off, 0
    lt rx830_pos, 2, rx830_start
    sub rx830_off, rx830_pos, 1
    substr rx830_tgt, rx830_tgt, rx830_off
  rx830_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan834_done
    goto rxscan834_scan
  rxscan834_loop:
    ($P10) = rx830_cur."from"()
    inc $P10
    set rx830_pos, $P10
    ge rx830_pos, rx830_eos, rxscan834_done
  rxscan834_scan:
    set_addr $I10, rxscan834_loop
    rx830_cur."!mark_push"(0, rx830_pos, $I10)
  rxscan834_done:
.annotate 'line', 396
  # rx literal  "q"
    add $I11, rx830_pos, 1
    gt $I11, rx830_eos, rx830_fail
    sub $I11, rx830_pos, rx830_off
    substr $S10, rx830_tgt, $I11, 1
    ne $S10, "q", rx830_fail
    add rx830_pos, 1
  # rxanchor rwb
    le rx830_pos, 0, rx830_fail
    sub $I10, rx830_pos, rx830_off
    is_cclass $I11, 8192, rx830_tgt, $I10
    if $I11, rx830_fail
    dec $I10
    is_cclass $I11, 8192, rx830_tgt, $I10
    unless $I11, rx830_fail
  # rx enumcharlist negate=1 zerowidth
    ge rx830_pos, rx830_eos, rx830_fail
    sub $I10, rx830_pos, rx830_off
    substr $S10, rx830_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx830_fail
  # rx subrule "ws" subtype=method negate=
    rx830_cur."!cursor_pos"(rx830_pos)
    $P10 = rx830_cur."ws"()
    unless $P10, rx830_fail
    rx830_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx830_cur."!cursor_pos"(rx830_pos)
    $P10 = rx830_cur."quote_EXPR"(":q")
    unless $P10, rx830_fail
    rx830_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx830_pos = $P10."pos"()
  # rx pass
    rx830_cur."!cursor_pass"(rx830_pos, "quote:sym<q>")
    rx830_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx830_pos)
    .return (rx830_cur)
  rx830_fail:
.annotate 'line', 4
    (rx830_rep, rx830_pos, $I10, $P10) = rx830_cur."!mark_fail"(0)
    lt rx830_pos, -1, rx830_done
    eq rx830_pos, -1, rx830_fail
    jump $I10
  rx830_done:
    rx830_cur."!cursor_fail"()
    rx830_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx830_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("194_1273884026.76819") :method
.annotate 'line', 4
    $P832 = self."!PREFIX__!subrule"("", "q")
    new $P833, "ResizablePMCArray"
    push $P833, $P832
    .return ($P833)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("195_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx836_tgt
    .local int rx836_pos
    .local int rx836_off
    .local int rx836_eos
    .local int rx836_rep
    .local pmc rx836_cur
    (rx836_cur, rx836_pos, rx836_tgt) = self."!cursor_start"()
    rx836_cur."!cursor_debug"("START ", "quote:sym<qq>")
    .lex unicode:"$\x{a2}", rx836_cur
    .local pmc match
    .lex "$/", match
    length rx836_eos, rx836_tgt
    set rx836_off, 0
    lt rx836_pos, 2, rx836_start
    sub rx836_off, rx836_pos, 1
    substr rx836_tgt, rx836_tgt, rx836_off
  rx836_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan840_done
    goto rxscan840_scan
  rxscan840_loop:
    ($P10) = rx836_cur."from"()
    inc $P10
    set rx836_pos, $P10
    ge rx836_pos, rx836_eos, rxscan840_done
  rxscan840_scan:
    set_addr $I10, rxscan840_loop
    rx836_cur."!mark_push"(0, rx836_pos, $I10)
  rxscan840_done:
.annotate 'line', 397
  # rx literal  "qq"
    add $I11, rx836_pos, 2
    gt $I11, rx836_eos, rx836_fail
    sub $I11, rx836_pos, rx836_off
    substr $S10, rx836_tgt, $I11, 2
    ne $S10, "qq", rx836_fail
    add rx836_pos, 2
  # rxanchor rwb
    le rx836_pos, 0, rx836_fail
    sub $I10, rx836_pos, rx836_off
    is_cclass $I11, 8192, rx836_tgt, $I10
    if $I11, rx836_fail
    dec $I10
    is_cclass $I11, 8192, rx836_tgt, $I10
    unless $I11, rx836_fail
  # rx enumcharlist negate=1 zerowidth
    ge rx836_pos, rx836_eos, rx836_fail
    sub $I10, rx836_pos, rx836_off
    substr $S10, rx836_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx836_fail
  # rx subrule "ws" subtype=method negate=
    rx836_cur."!cursor_pos"(rx836_pos)
    $P10 = rx836_cur."ws"()
    unless $P10, rx836_fail
    rx836_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx836_cur."!cursor_pos"(rx836_pos)
    $P10 = rx836_cur."quote_EXPR"(":qq")
    unless $P10, rx836_fail
    rx836_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx836_pos = $P10."pos"()
  # rx pass
    rx836_cur."!cursor_pass"(rx836_pos, "quote:sym<qq>")
    rx836_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx836_pos)
    .return (rx836_cur)
  rx836_fail:
.annotate 'line', 4
    (rx836_rep, rx836_pos, $I10, $P10) = rx836_cur."!mark_fail"(0)
    lt rx836_pos, -1, rx836_done
    eq rx836_pos, -1, rx836_fail
    jump $I10
  rx836_done:
    rx836_cur."!cursor_fail"()
    rx836_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx836_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("196_1273884026.76819") :method
.annotate 'line', 4
    $P838 = self."!PREFIX__!subrule"("", "qq")
    new $P839, "ResizablePMCArray"
    push $P839, $P838
    .return ($P839)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("197_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx842_tgt
    .local int rx842_pos
    .local int rx842_off
    .local int rx842_eos
    .local int rx842_rep
    .local pmc rx842_cur
    (rx842_cur, rx842_pos, rx842_tgt) = self."!cursor_start"()
    rx842_cur."!cursor_debug"("START ", "quote:sym<Q>")
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
.annotate 'line', 398
  # rx literal  "Q"
    add $I11, rx842_pos, 1
    gt $I11, rx842_eos, rx842_fail
    sub $I11, rx842_pos, rx842_off
    substr $S10, rx842_tgt, $I11, 1
    ne $S10, "Q", rx842_fail
    add rx842_pos, 1
  # rxanchor rwb
    le rx842_pos, 0, rx842_fail
    sub $I10, rx842_pos, rx842_off
    is_cclass $I11, 8192, rx842_tgt, $I10
    if $I11, rx842_fail
    dec $I10
    is_cclass $I11, 8192, rx842_tgt, $I10
    unless $I11, rx842_fail
  # rx enumcharlist negate=1 zerowidth
    ge rx842_pos, rx842_eos, rx842_fail
    sub $I10, rx842_pos, rx842_off
    substr $S10, rx842_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx842_fail
  # rx subrule "ws" subtype=method negate=
    rx842_cur."!cursor_pos"(rx842_pos)
    $P10 = rx842_cur."ws"()
    unless $P10, rx842_fail
    rx842_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx842_cur."!cursor_pos"(rx842_pos)
    $P10 = rx842_cur."quote_EXPR"()
    unless $P10, rx842_fail
    rx842_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx842_pos = $P10."pos"()
  # rx pass
    rx842_cur."!cursor_pass"(rx842_pos, "quote:sym<Q>")
    rx842_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx842_pos)
    .return (rx842_cur)
  rx842_fail:
.annotate 'line', 4
    (rx842_rep, rx842_pos, $I10, $P10) = rx842_cur."!mark_fail"(0)
    lt rx842_pos, -1, rx842_done
    eq rx842_pos, -1, rx842_fail
    jump $I10
  rx842_done:
    rx842_cur."!cursor_fail"()
    rx842_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx842_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("198_1273884026.76819") :method
.annotate 'line', 4
    $P844 = self."!PREFIX__!subrule"("", "Q")
    new $P845, "ResizablePMCArray"
    push $P845, $P844
    .return ($P845)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("199_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx848_tgt
    .local int rx848_pos
    .local int rx848_off
    .local int rx848_eos
    .local int rx848_rep
    .local pmc rx848_cur
    (rx848_cur, rx848_pos, rx848_tgt) = self."!cursor_start"()
    rx848_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
    .lex unicode:"$\x{a2}", rx848_cur
    .local pmc match
    .lex "$/", match
    length rx848_eos, rx848_tgt
    set rx848_off, 0
    lt rx848_pos, 2, rx848_start
    sub rx848_off, rx848_pos, 1
    substr rx848_tgt, rx848_tgt, rx848_off
  rx848_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan852_done
    goto rxscan852_scan
  rxscan852_loop:
    ($P10) = rx848_cur."from"()
    inc $P10
    set rx848_pos, $P10
    ge rx848_pos, rx848_eos, rxscan852_done
  rxscan852_scan:
    set_addr $I10, rxscan852_loop
    rx848_cur."!mark_push"(0, rx848_pos, $I10)
  rxscan852_done:
.annotate 'line', 399
  # rx literal  "Q:PIR"
    add $I11, rx848_pos, 5
    gt $I11, rx848_eos, rx848_fail
    sub $I11, rx848_pos, rx848_off
    substr $S10, rx848_tgt, $I11, 5
    ne $S10, "Q:PIR", rx848_fail
    add rx848_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx848_cur."!cursor_pos"(rx848_pos)
    $P10 = rx848_cur."ws"()
    unless $P10, rx848_fail
    rx848_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx848_cur."!cursor_pos"(rx848_pos)
    $P10 = rx848_cur."quote_EXPR"()
    unless $P10, rx848_fail
    rx848_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx848_pos = $P10."pos"()
  # rx pass
    rx848_cur."!cursor_pass"(rx848_pos, "quote:sym<Q:PIR>")
    rx848_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx848_pos)
    .return (rx848_cur)
  rx848_fail:
.annotate 'line', 4
    (rx848_rep, rx848_pos, $I10, $P10) = rx848_cur."!mark_fail"(0)
    lt rx848_pos, -1, rx848_done
    eq rx848_pos, -1, rx848_fail
    jump $I10
  rx848_done:
    rx848_cur."!cursor_fail"()
    rx848_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx848_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("200_1273884026.76819") :method
.annotate 'line', 4
    $P850 = self."!PREFIX__!subrule"("", "Q:PIR")
    new $P851, "ResizablePMCArray"
    push $P851, $P850
    .return ($P851)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym</ />"  :subid("201_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx854_tgt
    .local int rx854_pos
    .local int rx854_off
    .local int rx854_eos
    .local int rx854_rep
    .local pmc rx854_cur
    (rx854_cur, rx854_pos, rx854_tgt) = self."!cursor_start"()
    rx854_cur."!cursor_debug"("START ", "quote:sym</ />")
    .lex unicode:"$\x{a2}", rx854_cur
    .local pmc match
    .lex "$/", match
    length rx854_eos, rx854_tgt
    set rx854_off, 0
    lt rx854_pos, 2, rx854_start
    sub rx854_off, rx854_pos, 1
    substr rx854_tgt, rx854_tgt, rx854_off
  rx854_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan858_done
    goto rxscan858_scan
  rxscan858_loop:
    ($P10) = rx854_cur."from"()
    inc $P10
    set rx854_pos, $P10
    ge rx854_pos, rx854_eos, rxscan858_done
  rxscan858_scan:
    set_addr $I10, rxscan858_loop
    rx854_cur."!mark_push"(0, rx854_pos, $I10)
  rxscan858_done:
.annotate 'line', 401
  # rx literal  "/"
    add $I11, rx854_pos, 1
    gt $I11, rx854_eos, rx854_fail
    sub $I11, rx854_pos, rx854_off
    substr $S10, rx854_tgt, $I11, 1
    ne $S10, "/", rx854_fail
    add rx854_pos, 1
.annotate 'line', 402
  # rx subrule "newpad" subtype=method negate=
    rx854_cur."!cursor_pos"(rx854_pos)
    $P10 = rx854_cur."newpad"()
    unless $P10, rx854_fail
    rx854_pos = $P10."pos"()
.annotate 'line', 403
  # rx reduce name="quote:sym</ />" key="open"
    rx854_cur."!cursor_pos"(rx854_pos)
    rx854_cur."!reduce"("quote:sym</ />", "open")
.annotate 'line', 404
  # rx subrule "LANG" subtype=capture negate=
    rx854_cur."!cursor_pos"(rx854_pos)
    $P10 = rx854_cur."LANG"("Regex", "nibbler")
    unless $P10, rx854_fail
    rx854_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx854_pos = $P10."pos"()
.annotate 'line', 405
  # rx literal  "/"
    add $I11, rx854_pos, 1
    gt $I11, rx854_eos, rx854_fail
    sub $I11, rx854_pos, rx854_off
    substr $S10, rx854_tgt, $I11, 1
    ne $S10, "/", rx854_fail
    add rx854_pos, 1
.annotate 'line', 400
  # rx pass
    rx854_cur."!cursor_pass"(rx854_pos, "quote:sym</ />")
    rx854_cur."!cursor_debug"("PASS  ", "quote:sym</ />", " at pos=", rx854_pos)
    .return (rx854_cur)
  rx854_fail:
.annotate 'line', 4
    (rx854_rep, rx854_pos, $I10, $P10) = rx854_cur."!mark_fail"(0)
    lt rx854_pos, -1, rx854_done
    eq rx854_pos, -1, rx854_fail
    jump $I10
  rx854_done:
    rx854_cur."!cursor_fail"()
    rx854_cur."!cursor_debug"("FAIL  ", "quote:sym</ />")
    .return (rx854_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym</ />"  :subid("202_1273884026.76819") :method
.annotate 'line', 4
    $P856 = self."!PREFIX__!subrule"("", "/")
    new $P857, "ResizablePMCArray"
    push $P857, $P856
    .return ($P857)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("203_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx860_tgt
    .local int rx860_pos
    .local int rx860_off
    .local int rx860_eos
    .local int rx860_rep
    .local pmc rx860_cur
    (rx860_cur, rx860_pos, rx860_tgt) = self."!cursor_start"()
    rx860_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
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
.annotate 'line', 408
  # rx enumcharlist negate=0 zerowidth
    ge rx860_pos, rx860_eos, rx860_fail
    sub $I10, rx860_pos, rx860_off
    substr $S10, rx860_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx860_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx860_cur."!cursor_pos"(rx860_pos)
    $P10 = rx860_cur."quotemod_check"("s")
    unless $P10, rx860_fail
  # rx subrule "variable" subtype=capture negate=
    rx860_cur."!cursor_pos"(rx860_pos)
    $P10 = rx860_cur."variable"()
    unless $P10, rx860_fail
    rx860_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx860_pos = $P10."pos"()
  # rx pass
    rx860_cur."!cursor_pass"(rx860_pos, "quote_escape:sym<$>")
    rx860_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx860_pos)
    .return (rx860_cur)
  rx860_fail:
.annotate 'line', 4
    (rx860_rep, rx860_pos, $I10, $P10) = rx860_cur."!mark_fail"(0)
    lt rx860_pos, -1, rx860_done
    eq rx860_pos, -1, rx860_fail
    jump $I10
  rx860_done:
    rx860_cur."!cursor_fail"()
    rx860_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx860_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("204_1273884026.76819") :method
.annotate 'line', 4
    new $P862, "ResizablePMCArray"
    push $P862, "$"
    .return ($P862)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("205_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx865_tgt
    .local int rx865_pos
    .local int rx865_off
    .local int rx865_eos
    .local int rx865_rep
    .local pmc rx865_cur
    (rx865_cur, rx865_pos, rx865_tgt) = self."!cursor_start"()
    rx865_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
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
.annotate 'line', 409
  # rx enumcharlist negate=0 zerowidth
    ge rx865_pos, rx865_eos, rx865_fail
    sub $I10, rx865_pos, rx865_off
    substr $S10, rx865_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx865_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx865_cur."!cursor_pos"(rx865_pos)
    $P10 = rx865_cur."quotemod_check"("c")
    unless $P10, rx865_fail
  # rx subrule "block" subtype=capture negate=
    rx865_cur."!cursor_pos"(rx865_pos)
    $P10 = rx865_cur."block"()
    unless $P10, rx865_fail
    rx865_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx865_pos = $P10."pos"()
  # rx pass
    rx865_cur."!cursor_pass"(rx865_pos, "quote_escape:sym<{ }>")
    rx865_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx865_pos)
    .return (rx865_cur)
  rx865_fail:
.annotate 'line', 4
    (rx865_rep, rx865_pos, $I10, $P10) = rx865_cur."!mark_fail"(0)
    lt rx865_pos, -1, rx865_done
    eq rx865_pos, -1, rx865_fail
    jump $I10
  rx865_done:
    rx865_cur."!cursor_fail"()
    rx865_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx865_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("206_1273884026.76819") :method
.annotate 'line', 4
    new $P867, "ResizablePMCArray"
    push $P867, "{"
    .return ($P867)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<esc>"  :subid("207_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx870_tgt
    .local int rx870_pos
    .local int rx870_off
    .local int rx870_eos
    .local int rx870_rep
    .local pmc rx870_cur
    (rx870_cur, rx870_pos, rx870_tgt) = self."!cursor_start"()
    rx870_cur."!cursor_debug"("START ", "quote_escape:sym<esc>")
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
    ne $I10, -1, rxscan873_done
    goto rxscan873_scan
  rxscan873_loop:
    ($P10) = rx870_cur."from"()
    inc $P10
    set rx870_pos, $P10
    ge rx870_pos, rx870_eos, rxscan873_done
  rxscan873_scan:
    set_addr $I10, rxscan873_loop
    rx870_cur."!mark_push"(0, rx870_pos, $I10)
  rxscan873_done:
.annotate 'line', 410
  # rx literal  "\\e"
    add $I11, rx870_pos, 2
    gt $I11, rx870_eos, rx870_fail
    sub $I11, rx870_pos, rx870_off
    substr $S10, rx870_tgt, $I11, 2
    ne $S10, "\\e", rx870_fail
    add rx870_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx870_cur."!cursor_pos"(rx870_pos)
    $P10 = rx870_cur."quotemod_check"("b")
    unless $P10, rx870_fail
  # rx pass
    rx870_cur."!cursor_pass"(rx870_pos, "quote_escape:sym<esc>")
    rx870_cur."!cursor_debug"("PASS  ", "quote_escape:sym<esc>", " at pos=", rx870_pos)
    .return (rx870_cur)
  rx870_fail:
.annotate 'line', 4
    (rx870_rep, rx870_pos, $I10, $P10) = rx870_cur."!mark_fail"(0)
    lt rx870_pos, -1, rx870_done
    eq rx870_pos, -1, rx870_fail
    jump $I10
  rx870_done:
    rx870_cur."!cursor_fail"()
    rx870_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<esc>")
    .return (rx870_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<esc>"  :subid("208_1273884026.76819") :method
.annotate 'line', 4
    new $P872, "ResizablePMCArray"
    push $P872, "\\e"
    .return ($P872)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("209_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx875_tgt
    .local int rx875_pos
    .local int rx875_off
    .local int rx875_eos
    .local int rx875_rep
    .local pmc rx875_cur
    (rx875_cur, rx875_pos, rx875_tgt) = self."!cursor_start"()
    rx875_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx875_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx875_cur
    .local pmc match
    .lex "$/", match
    length rx875_eos, rx875_tgt
    set rx875_off, 0
    lt rx875_pos, 2, rx875_start
    sub rx875_off, rx875_pos, 1
    substr rx875_tgt, rx875_tgt, rx875_off
  rx875_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan879_done
    goto rxscan879_scan
  rxscan879_loop:
    ($P10) = rx875_cur."from"()
    inc $P10
    set rx875_pos, $P10
    ge rx875_pos, rx875_eos, rxscan879_done
  rxscan879_scan:
    set_addr $I10, rxscan879_loop
    rx875_cur."!mark_push"(0, rx875_pos, $I10)
  rxscan879_done:
.annotate 'line', 412
  # rx literal  "("
    add $I11, rx875_pos, 1
    gt $I11, rx875_eos, rx875_fail
    sub $I11, rx875_pos, rx875_off
    substr $S10, rx875_tgt, $I11, 1
    ne $S10, "(", rx875_fail
    add rx875_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx875_cur."!cursor_pos"(rx875_pos)
    $P10 = rx875_cur."ws"()
    unless $P10, rx875_fail
    rx875_pos = $P10."pos"()
  # rx rxquantr880 ** 0..1
    set_addr $I881, rxquantr880_done
    rx875_cur."!mark_push"(0, rx875_pos, $I881)
  rxquantr880_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx875_cur."!cursor_pos"(rx875_pos)
    $P10 = rx875_cur."EXPR"()
    unless $P10, rx875_fail
    rx875_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx875_pos = $P10."pos"()
    (rx875_rep) = rx875_cur."!mark_commit"($I881)
  rxquantr880_done:
  # rx literal  ")"
    add $I11, rx875_pos, 1
    gt $I11, rx875_eos, rx875_fail
    sub $I11, rx875_pos, rx875_off
    substr $S10, rx875_tgt, $I11, 1
    ne $S10, ")", rx875_fail
    add rx875_pos, 1
  # rx pass
    rx875_cur."!cursor_pass"(rx875_pos, "circumfix:sym<( )>")
    rx875_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx875_pos)
    .return (rx875_cur)
  rx875_fail:
.annotate 'line', 4
    (rx875_rep, rx875_pos, $I10, $P10) = rx875_cur."!mark_fail"(0)
    lt rx875_pos, -1, rx875_done
    eq rx875_pos, -1, rx875_fail
    jump $I10
  rx875_done:
    rx875_cur."!cursor_fail"()
    rx875_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx875_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("210_1273884026.76819") :method
.annotate 'line', 4
    $P877 = self."!PREFIX__!subrule"("", "(")
    new $P878, "ResizablePMCArray"
    push $P878, $P877
    .return ($P878)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("211_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx883_tgt
    .local int rx883_pos
    .local int rx883_off
    .local int rx883_eos
    .local int rx883_rep
    .local pmc rx883_cur
    (rx883_cur, rx883_pos, rx883_tgt) = self."!cursor_start"()
    rx883_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
    rx883_cur."!cursor_caparray"("EXPR")
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
    ne $I10, -1, rxscan887_done
    goto rxscan887_scan
  rxscan887_loop:
    ($P10) = rx883_cur."from"()
    inc $P10
    set rx883_pos, $P10
    ge rx883_pos, rx883_eos, rxscan887_done
  rxscan887_scan:
    set_addr $I10, rxscan887_loop
    rx883_cur."!mark_push"(0, rx883_pos, $I10)
  rxscan887_done:
.annotate 'line', 413
  # rx literal  "["
    add $I11, rx883_pos, 1
    gt $I11, rx883_eos, rx883_fail
    sub $I11, rx883_pos, rx883_off
    substr $S10, rx883_tgt, $I11, 1
    ne $S10, "[", rx883_fail
    add rx883_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx883_cur."!cursor_pos"(rx883_pos)
    $P10 = rx883_cur."ws"()
    unless $P10, rx883_fail
    rx883_pos = $P10."pos"()
  # rx rxquantr888 ** 0..1
    set_addr $I889, rxquantr888_done
    rx883_cur."!mark_push"(0, rx883_pos, $I889)
  rxquantr888_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx883_cur."!cursor_pos"(rx883_pos)
    $P10 = rx883_cur."EXPR"()
    unless $P10, rx883_fail
    rx883_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx883_pos = $P10."pos"()
    (rx883_rep) = rx883_cur."!mark_commit"($I889)
  rxquantr888_done:
  # rx literal  "]"
    add $I11, rx883_pos, 1
    gt $I11, rx883_eos, rx883_fail
    sub $I11, rx883_pos, rx883_off
    substr $S10, rx883_tgt, $I11, 1
    ne $S10, "]", rx883_fail
    add rx883_pos, 1
  # rx pass
    rx883_cur."!cursor_pass"(rx883_pos, "circumfix:sym<[ ]>")
    rx883_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx883_pos)
    .return (rx883_cur)
  rx883_fail:
.annotate 'line', 4
    (rx883_rep, rx883_pos, $I10, $P10) = rx883_cur."!mark_fail"(0)
    lt rx883_pos, -1, rx883_done
    eq rx883_pos, -1, rx883_fail
    jump $I10
  rx883_done:
    rx883_cur."!cursor_fail"()
    rx883_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx883_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("212_1273884026.76819") :method
.annotate 'line', 4
    $P885 = self."!PREFIX__!subrule"("", "[")
    new $P886, "ResizablePMCArray"
    push $P886, $P885
    .return ($P886)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("213_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx891_tgt
    .local int rx891_pos
    .local int rx891_off
    .local int rx891_eos
    .local int rx891_rep
    .local pmc rx891_cur
    (rx891_cur, rx891_pos, rx891_tgt) = self."!cursor_start"()
    rx891_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx891_cur
    .local pmc match
    .lex "$/", match
    length rx891_eos, rx891_tgt
    set rx891_off, 0
    lt rx891_pos, 2, rx891_start
    sub rx891_off, rx891_pos, 1
    substr rx891_tgt, rx891_tgt, rx891_off
  rx891_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan894_done
    goto rxscan894_scan
  rxscan894_loop:
    ($P10) = rx891_cur."from"()
    inc $P10
    set rx891_pos, $P10
    ge rx891_pos, rx891_eos, rxscan894_done
  rxscan894_scan:
    set_addr $I10, rxscan894_loop
    rx891_cur."!mark_push"(0, rx891_pos, $I10)
  rxscan894_done:
.annotate 'line', 414
  # rx enumcharlist negate=0 zerowidth
    ge rx891_pos, rx891_eos, rx891_fail
    sub $I10, rx891_pos, rx891_off
    substr $S10, rx891_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx891_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx891_cur."!cursor_pos"(rx891_pos)
    $P10 = rx891_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx891_fail
    rx891_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx891_pos = $P10."pos"()
  # rx pass
    rx891_cur."!cursor_pass"(rx891_pos, "circumfix:sym<ang>")
    rx891_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx891_pos)
    .return (rx891_cur)
  rx891_fail:
.annotate 'line', 4
    (rx891_rep, rx891_pos, $I10, $P10) = rx891_cur."!mark_fail"(0)
    lt rx891_pos, -1, rx891_done
    eq rx891_pos, -1, rx891_fail
    jump $I10
  rx891_done:
    rx891_cur."!cursor_fail"()
    rx891_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx891_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("214_1273884026.76819") :method
.annotate 'line', 4
    new $P893, "ResizablePMCArray"
    push $P893, "<"
    .return ($P893)
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("215_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx896_tgt
    .local int rx896_pos
    .local int rx896_off
    .local int rx896_eos
    .local int rx896_rep
    .local pmc rx896_cur
    (rx896_cur, rx896_pos, rx896_tgt) = self."!cursor_start"()
    rx896_cur."!cursor_debug"("START ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
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
    ne $I10, -1, rxscan899_done
    goto rxscan899_scan
  rxscan899_loop:
    ($P10) = rx896_cur."from"()
    inc $P10
    set rx896_pos, $P10
    ge rx896_pos, rx896_eos, rxscan899_done
  rxscan899_scan:
    set_addr $I10, rxscan899_loop
    rx896_cur."!mark_push"(0, rx896_pos, $I10)
  rxscan899_done:
.annotate 'line', 415
  # rx enumcharlist negate=0 zerowidth
    ge rx896_pos, rx896_eos, rx896_fail
    sub $I10, rx896_pos, rx896_off
    substr $S10, rx896_tgt, $I10, 1
    index $I11, unicode:"\x{ab}", $S10
    lt $I11, 0, rx896_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx896_cur."!cursor_pos"(rx896_pos)
    $P10 = rx896_cur."quote_EXPR"(":qq", ":w")
    unless $P10, rx896_fail
    rx896_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx896_pos = $P10."pos"()
  # rx pass
    rx896_cur."!cursor_pass"(rx896_pos, unicode:"circumfix:sym<\x{ab} \x{bb}>")
    rx896_cur."!cursor_debug"("PASS  ", unicode:"circumfix:sym<\x{ab} \x{bb}>", " at pos=", rx896_pos)
    .return (rx896_cur)
  rx896_fail:
.annotate 'line', 4
    (rx896_rep, rx896_pos, $I10, $P10) = rx896_cur."!mark_fail"(0)
    lt rx896_pos, -1, rx896_done
    eq rx896_pos, -1, rx896_fail
    jump $I10
  rx896_done:
    rx896_cur."!cursor_fail"()
    rx896_cur."!cursor_debug"("FAIL  ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
    .return (rx896_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"!PREFIX__circumfix:sym<\x{ab} \x{bb}>"  :subid("216_1273884026.76819") :method
.annotate 'line', 4
    new $P898, "ResizablePMCArray"
    push $P898, unicode:"\x{ab}"
    .return ($P898)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("217_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx901_tgt
    .local int rx901_pos
    .local int rx901_off
    .local int rx901_eos
    .local int rx901_rep
    .local pmc rx901_cur
    (rx901_cur, rx901_pos, rx901_tgt) = self."!cursor_start"()
    rx901_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
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
.annotate 'line', 416
  # rx enumcharlist negate=0 zerowidth
    ge rx901_pos, rx901_eos, rx901_fail
    sub $I10, rx901_pos, rx901_off
    substr $S10, rx901_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx901_fail
  # rx subrule "pblock" subtype=capture negate=
    rx901_cur."!cursor_pos"(rx901_pos)
    $P10 = rx901_cur."pblock"()
    unless $P10, rx901_fail
    rx901_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx901_pos = $P10."pos"()
  # rx pass
    rx901_cur."!cursor_pass"(rx901_pos, "circumfix:sym<{ }>")
    rx901_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx901_pos)
    .return (rx901_cur)
  rx901_fail:
.annotate 'line', 4
    (rx901_rep, rx901_pos, $I10, $P10) = rx901_cur."!mark_fail"(0)
    lt rx901_pos, -1, rx901_done
    eq rx901_pos, -1, rx901_fail
    jump $I10
  rx901_done:
    rx901_cur."!cursor_fail"()
    rx901_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx901_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("218_1273884026.76819") :method
.annotate 'line', 4
    new $P903, "ResizablePMCArray"
    push $P903, "{"
    .return ($P903)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("219_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx906_tgt
    .local int rx906_pos
    .local int rx906_off
    .local int rx906_eos
    .local int rx906_rep
    .local pmc rx906_cur
    (rx906_cur, rx906_pos, rx906_tgt) = self."!cursor_start"()
    rx906_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
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
.annotate 'line', 417
  # rx subrule "sigil" subtype=capture negate=
    rx906_cur."!cursor_pos"(rx906_pos)
    $P10 = rx906_cur."sigil"()
    unless $P10, rx906_fail
    rx906_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx906_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx906_pos, 1
    gt $I11, rx906_eos, rx906_fail
    sub $I11, rx906_pos, rx906_off
    substr $S10, rx906_tgt, $I11, 1
    ne $S10, "(", rx906_fail
    add rx906_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx906_cur."!cursor_pos"(rx906_pos)
    $P10 = rx906_cur."semilist"()
    unless $P10, rx906_fail
    rx906_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx906_pos = $P10."pos"()
  alt911_0:
    set_addr $I10, alt911_1
    rx906_cur."!mark_push"(0, rx906_pos, $I10)
  # rx literal  ")"
    add $I11, rx906_pos, 1
    gt $I11, rx906_eos, rx906_fail
    sub $I11, rx906_pos, rx906_off
    substr $S10, rx906_tgt, $I11, 1
    ne $S10, ")", rx906_fail
    add rx906_pos, 1
    goto alt911_end
  alt911_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx906_cur."!cursor_pos"(rx906_pos)
    $P10 = rx906_cur."FAILGOAL"("')'")
    unless $P10, rx906_fail
    rx906_pos = $P10."pos"()
  alt911_end:
  # rx pass
    rx906_cur."!cursor_pass"(rx906_pos, "circumfix:sym<sigil>")
    rx906_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx906_pos)
    .return (rx906_cur)
  rx906_fail:
.annotate 'line', 4
    (rx906_rep, rx906_pos, $I10, $P10) = rx906_cur."!mark_fail"(0)
    lt rx906_pos, -1, rx906_done
    eq rx906_pos, -1, rx906_fail
    jump $I10
  rx906_done:
    rx906_cur."!cursor_fail"()
    rx906_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx906_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("220_1273884026.76819") :method
.annotate 'line', 4
    $P908 = self."!PREFIX__!subrule"("sigil", "")
    new $P909, "ResizablePMCArray"
    push $P909, $P908
    .return ($P909)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("221_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 4
    .local string rx914_tgt
    .local int rx914_pos
    .local int rx914_off
    .local int rx914_eos
    .local int rx914_rep
    .local pmc rx914_cur
    (rx914_cur, rx914_pos, rx914_tgt) = self."!cursor_start"()
    rx914_cur."!cursor_debug"("START ", "semilist")
    .lex unicode:"$\x{a2}", rx914_cur
    .local pmc match
    .lex "$/", match
    length rx914_eos, rx914_tgt
    set rx914_off, 0
    lt rx914_pos, 2, rx914_start
    sub rx914_off, rx914_pos, 1
    substr rx914_tgt, rx914_tgt, rx914_off
  rx914_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan917_done
    goto rxscan917_scan
  rxscan917_loop:
    ($P10) = rx914_cur."from"()
    inc $P10
    set rx914_pos, $P10
    ge rx914_pos, rx914_eos, rxscan917_done
  rxscan917_scan:
    set_addr $I10, rxscan917_loop
    rx914_cur."!mark_push"(0, rx914_pos, $I10)
  rxscan917_done:
.annotate 'line', 419
  # rx subrule "ws" subtype=method negate=
    rx914_cur."!cursor_pos"(rx914_pos)
    $P10 = rx914_cur."ws"()
    unless $P10, rx914_fail
    rx914_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx914_cur."!cursor_pos"(rx914_pos)
    $P10 = rx914_cur."statement"()
    unless $P10, rx914_fail
    rx914_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx914_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx914_cur."!cursor_pos"(rx914_pos)
    $P10 = rx914_cur."ws"()
    unless $P10, rx914_fail
    rx914_pos = $P10."pos"()
  # rx pass
    rx914_cur."!cursor_pass"(rx914_pos, "semilist")
    rx914_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx914_pos)
    .return (rx914_cur)
  rx914_fail:
.annotate 'line', 4
    (rx914_rep, rx914_pos, $I10, $P10) = rx914_cur."!mark_fail"(0)
    lt rx914_pos, -1, rx914_done
    eq rx914_pos, -1, rx914_fail
    jump $I10
  rx914_done:
    rx914_cur."!cursor_fail"()
    rx914_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx914_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("222_1273884026.76819") :method
.annotate 'line', 4
    new $P916, "ResizablePMCArray"
    push $P916, ""
    .return ($P916)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("223_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx921_tgt
    .local int rx921_pos
    .local int rx921_off
    .local int rx921_eos
    .local int rx921_rep
    .local pmc rx921_cur
    (rx921_cur, rx921_pos, rx921_tgt) = self."!cursor_start"()
    rx921_cur."!cursor_debug"("START ", "infixish")
    .lex unicode:"$\x{a2}", rx921_cur
    .local pmc match
    .lex "$/", match
    length rx921_eos, rx921_tgt
    set rx921_off, 0
    lt rx921_pos, 2, rx921_start
    sub rx921_off, rx921_pos, 1
    substr rx921_tgt, rx921_tgt, rx921_off
  rx921_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan924_done
    goto rxscan924_scan
  rxscan924_loop:
    ($P10) = rx921_cur."from"()
    inc $P10
    set rx921_pos, $P10
    ge rx921_pos, rx921_eos, rxscan924_done
  rxscan924_scan:
    set_addr $I10, rxscan924_loop
    rx921_cur."!mark_push"(0, rx921_pos, $I10)
  rxscan924_done:
.annotate 'line', 442
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx921_cur."!cursor_pos"(rx921_pos)
    $P10 = rx921_cur."infixstopper"()
    if $P10, rx921_fail
  # rx subrule "infix" subtype=capture negate=
    rx921_cur."!cursor_pos"(rx921_pos)
    $P10 = rx921_cur."infix"()
    unless $P10, rx921_fail
    rx921_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx921_pos = $P10."pos"()
  # rx pass
    rx921_cur."!cursor_pass"(rx921_pos, "infixish")
    rx921_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx921_pos)
    .return (rx921_cur)
  rx921_fail:
.annotate 'line', 423
    (rx921_rep, rx921_pos, $I10, $P10) = rx921_cur."!mark_fail"(0)
    lt rx921_pos, -1, rx921_done
    eq rx921_pos, -1, rx921_fail
    jump $I10
  rx921_done:
    rx921_cur."!cursor_fail"()
    rx921_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx921_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("224_1273884026.76819") :method
.annotate 'line', 423
    new $P923, "ResizablePMCArray"
    push $P923, ""
    .return ($P923)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("225_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx926_tgt
    .local int rx926_pos
    .local int rx926_off
    .local int rx926_eos
    .local int rx926_rep
    .local pmc rx926_cur
    (rx926_cur, rx926_pos, rx926_tgt) = self."!cursor_start"()
    rx926_cur."!cursor_debug"("START ", "infixstopper")
    .lex unicode:"$\x{a2}", rx926_cur
    .local pmc match
    .lex "$/", match
    length rx926_eos, rx926_tgt
    set rx926_off, 0
    lt rx926_pos, 2, rx926_start
    sub rx926_off, rx926_pos, 1
    substr rx926_tgt, rx926_tgt, rx926_off
  rx926_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan929_done
    goto rxscan929_scan
  rxscan929_loop:
    ($P10) = rx926_cur."from"()
    inc $P10
    set rx926_pos, $P10
    ge rx926_pos, rx926_eos, rxscan929_done
  rxscan929_scan:
    set_addr $I10, rxscan929_loop
    rx926_cur."!mark_push"(0, rx926_pos, $I10)
  rxscan929_done:
.annotate 'line', 443
  # rx subrule "lambda" subtype=zerowidth negate=
    rx926_cur."!cursor_pos"(rx926_pos)
    $P10 = rx926_cur."lambda"()
    unless $P10, rx926_fail
  # rx pass
    rx926_cur."!cursor_pass"(rx926_pos, "infixstopper")
    rx926_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx926_pos)
    .return (rx926_cur)
  rx926_fail:
.annotate 'line', 423
    (rx926_rep, rx926_pos, $I10, $P10) = rx926_cur."!mark_fail"(0)
    lt rx926_pos, -1, rx926_done
    eq rx926_pos, -1, rx926_fail
    jump $I10
  rx926_done:
    rx926_cur."!cursor_fail"()
    rx926_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx926_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("226_1273884026.76819") :method
.annotate 'line', 423
    new $P928, "ResizablePMCArray"
    push $P928, ""
    .return ($P928)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("227_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx931_tgt
    .local int rx931_pos
    .local int rx931_off
    .local int rx931_eos
    .local int rx931_rep
    .local pmc rx931_cur
    (rx931_cur, rx931_pos, rx931_tgt) = self."!cursor_start"()
    rx931_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
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
.annotate 'line', 446
  # rx literal  "["
    add $I11, rx931_pos, 1
    gt $I11, rx931_eos, rx931_fail
    sub $I11, rx931_pos, rx931_off
    substr $S10, rx931_tgt, $I11, 1
    ne $S10, "[", rx931_fail
    add rx931_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx931_cur."!cursor_pos"(rx931_pos)
    $P10 = rx931_cur."ws"()
    unless $P10, rx931_fail
    rx931_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx931_cur."!cursor_pos"(rx931_pos)
    $P10 = rx931_cur."EXPR"()
    unless $P10, rx931_fail
    rx931_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx931_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx931_pos, 1
    gt $I11, rx931_eos, rx931_fail
    sub $I11, rx931_pos, rx931_off
    substr $S10, rx931_tgt, $I11, 1
    ne $S10, "]", rx931_fail
    add rx931_pos, 1
.annotate 'line', 447
  # rx subrule "O" subtype=capture negate=
    rx931_cur."!cursor_pos"(rx931_pos)
    $P10 = rx931_cur."O"("%methodop")
    unless $P10, rx931_fail
    rx931_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx931_pos = $P10."pos"()
.annotate 'line', 445
  # rx pass
    rx931_cur."!cursor_pass"(rx931_pos, "postcircumfix:sym<[ ]>")
    rx931_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx931_pos)
    .return (rx931_cur)
  rx931_fail:
.annotate 'line', 423
    (rx931_rep, rx931_pos, $I10, $P10) = rx931_cur."!mark_fail"(0)
    lt rx931_pos, -1, rx931_done
    eq rx931_pos, -1, rx931_fail
    jump $I10
  rx931_done:
    rx931_cur."!cursor_fail"()
    rx931_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx931_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("228_1273884026.76819") :method
.annotate 'line', 423
    $P933 = self."!PREFIX__!subrule"("", "[")
    new $P934, "ResizablePMCArray"
    push $P934, $P933
    .return ($P934)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("229_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx937_tgt
    .local int rx937_pos
    .local int rx937_off
    .local int rx937_eos
    .local int rx937_rep
    .local pmc rx937_cur
    (rx937_cur, rx937_pos, rx937_tgt) = self."!cursor_start"()
    rx937_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx937_cur
    .local pmc match
    .lex "$/", match
    length rx937_eos, rx937_tgt
    set rx937_off, 0
    lt rx937_pos, 2, rx937_start
    sub rx937_off, rx937_pos, 1
    substr rx937_tgt, rx937_tgt, rx937_off
  rx937_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan941_done
    goto rxscan941_scan
  rxscan941_loop:
    ($P10) = rx937_cur."from"()
    inc $P10
    set rx937_pos, $P10
    ge rx937_pos, rx937_eos, rxscan941_done
  rxscan941_scan:
    set_addr $I10, rxscan941_loop
    rx937_cur."!mark_push"(0, rx937_pos, $I10)
  rxscan941_done:
.annotate 'line', 451
  # rx literal  "{"
    add $I11, rx937_pos, 1
    gt $I11, rx937_eos, rx937_fail
    sub $I11, rx937_pos, rx937_off
    substr $S10, rx937_tgt, $I11, 1
    ne $S10, "{", rx937_fail
    add rx937_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx937_cur."!cursor_pos"(rx937_pos)
    $P10 = rx937_cur."ws"()
    unless $P10, rx937_fail
    rx937_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx937_cur."!cursor_pos"(rx937_pos)
    $P10 = rx937_cur."EXPR"()
    unless $P10, rx937_fail
    rx937_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx937_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx937_pos, 1
    gt $I11, rx937_eos, rx937_fail
    sub $I11, rx937_pos, rx937_off
    substr $S10, rx937_tgt, $I11, 1
    ne $S10, "}", rx937_fail
    add rx937_pos, 1
.annotate 'line', 452
  # rx subrule "O" subtype=capture negate=
    rx937_cur."!cursor_pos"(rx937_pos)
    $P10 = rx937_cur."O"("%methodop")
    unless $P10, rx937_fail
    rx937_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx937_pos = $P10."pos"()
.annotate 'line', 450
  # rx pass
    rx937_cur."!cursor_pass"(rx937_pos, "postcircumfix:sym<{ }>")
    rx937_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx937_pos)
    .return (rx937_cur)
  rx937_fail:
.annotate 'line', 423
    (rx937_rep, rx937_pos, $I10, $P10) = rx937_cur."!mark_fail"(0)
    lt rx937_pos, -1, rx937_done
    eq rx937_pos, -1, rx937_fail
    jump $I10
  rx937_done:
    rx937_cur."!cursor_fail"()
    rx937_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx937_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("230_1273884026.76819") :method
.annotate 'line', 423
    $P939 = self."!PREFIX__!subrule"("", "{")
    new $P940, "ResizablePMCArray"
    push $P940, $P939
    .return ($P940)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("231_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx943_tgt
    .local int rx943_pos
    .local int rx943_off
    .local int rx943_eos
    .local int rx943_rep
    .local pmc rx943_cur
    (rx943_cur, rx943_pos, rx943_tgt) = self."!cursor_start"()
    rx943_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx943_cur
    .local pmc match
    .lex "$/", match
    length rx943_eos, rx943_tgt
    set rx943_off, 0
    lt rx943_pos, 2, rx943_start
    sub rx943_off, rx943_pos, 1
    substr rx943_tgt, rx943_tgt, rx943_off
  rx943_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan946_done
    goto rxscan946_scan
  rxscan946_loop:
    ($P10) = rx943_cur."from"()
    inc $P10
    set rx943_pos, $P10
    ge rx943_pos, rx943_eos, rxscan946_done
  rxscan946_scan:
    set_addr $I10, rxscan946_loop
    rx943_cur."!mark_push"(0, rx943_pos, $I10)
  rxscan946_done:
.annotate 'line', 456
  # rx enumcharlist negate=0 zerowidth
    ge rx943_pos, rx943_eos, rx943_fail
    sub $I10, rx943_pos, rx943_off
    substr $S10, rx943_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx943_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx943_cur."!cursor_pos"(rx943_pos)
    $P10 = rx943_cur."quote_EXPR"(":q")
    unless $P10, rx943_fail
    rx943_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx943_pos = $P10."pos"()
.annotate 'line', 457
  # rx subrule "O" subtype=capture negate=
    rx943_cur."!cursor_pos"(rx943_pos)
    $P10 = rx943_cur."O"("%methodop")
    unless $P10, rx943_fail
    rx943_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx943_pos = $P10."pos"()
.annotate 'line', 455
  # rx pass
    rx943_cur."!cursor_pass"(rx943_pos, "postcircumfix:sym<ang>")
    rx943_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx943_pos)
    .return (rx943_cur)
  rx943_fail:
.annotate 'line', 423
    (rx943_rep, rx943_pos, $I10, $P10) = rx943_cur."!mark_fail"(0)
    lt rx943_pos, -1, rx943_done
    eq rx943_pos, -1, rx943_fail
    jump $I10
  rx943_done:
    rx943_cur."!cursor_fail"()
    rx943_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx943_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("232_1273884026.76819") :method
.annotate 'line', 423
    new $P945, "ResizablePMCArray"
    push $P945, "<"
    .return ($P945)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("233_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx948_tgt
    .local int rx948_pos
    .local int rx948_off
    .local int rx948_eos
    .local int rx948_rep
    .local pmc rx948_cur
    (rx948_cur, rx948_pos, rx948_tgt) = self."!cursor_start"()
    rx948_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
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
    ne $I10, -1, rxscan952_done
    goto rxscan952_scan
  rxscan952_loop:
    ($P10) = rx948_cur."from"()
    inc $P10
    set rx948_pos, $P10
    ge rx948_pos, rx948_eos, rxscan952_done
  rxscan952_scan:
    set_addr $I10, rxscan952_loop
    rx948_cur."!mark_push"(0, rx948_pos, $I10)
  rxscan952_done:
.annotate 'line', 461
  # rx literal  "("
    add $I11, rx948_pos, 1
    gt $I11, rx948_eos, rx948_fail
    sub $I11, rx948_pos, rx948_off
    substr $S10, rx948_tgt, $I11, 1
    ne $S10, "(", rx948_fail
    add rx948_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx948_cur."!cursor_pos"(rx948_pos)
    $P10 = rx948_cur."ws"()
    unless $P10, rx948_fail
    rx948_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx948_cur."!cursor_pos"(rx948_pos)
    $P10 = rx948_cur."arglist"()
    unless $P10, rx948_fail
    rx948_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx948_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx948_pos, 1
    gt $I11, rx948_eos, rx948_fail
    sub $I11, rx948_pos, rx948_off
    substr $S10, rx948_tgt, $I11, 1
    ne $S10, ")", rx948_fail
    add rx948_pos, 1
.annotate 'line', 462
  # rx subrule "O" subtype=capture negate=
    rx948_cur."!cursor_pos"(rx948_pos)
    $P10 = rx948_cur."O"("%methodop")
    unless $P10, rx948_fail
    rx948_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx948_pos = $P10."pos"()
.annotate 'line', 460
  # rx pass
    rx948_cur."!cursor_pass"(rx948_pos, "postcircumfix:sym<( )>")
    rx948_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx948_pos)
    .return (rx948_cur)
  rx948_fail:
.annotate 'line', 423
    (rx948_rep, rx948_pos, $I10, $P10) = rx948_cur."!mark_fail"(0)
    lt rx948_pos, -1, rx948_done
    eq rx948_pos, -1, rx948_fail
    jump $I10
  rx948_done:
    rx948_cur."!cursor_fail"()
    rx948_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx948_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("234_1273884026.76819") :method
.annotate 'line', 423
    $P950 = self."!PREFIX__!subrule"("", "(")
    new $P951, "ResizablePMCArray"
    push $P951, $P950
    .return ($P951)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("235_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx954_tgt
    .local int rx954_pos
    .local int rx954_off
    .local int rx954_eos
    .local int rx954_rep
    .local pmc rx954_cur
    (rx954_cur, rx954_pos, rx954_tgt) = self."!cursor_start"()
    rx954_cur."!cursor_debug"("START ", "postfix:sym<.>")
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
.annotate 'line', 465
  # rx subrule "dotty" subtype=capture negate=
    rx954_cur."!cursor_pos"(rx954_pos)
    $P10 = rx954_cur."dotty"()
    unless $P10, rx954_fail
    rx954_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx954_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx954_cur."!cursor_pos"(rx954_pos)
    $P10 = rx954_cur."O"("%methodop")
    unless $P10, rx954_fail
    rx954_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx954_pos = $P10."pos"()
  # rx pass
    rx954_cur."!cursor_pass"(rx954_pos, "postfix:sym<.>")
    rx954_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx954_pos)
    .return (rx954_cur)
  rx954_fail:
.annotate 'line', 423
    (rx954_rep, rx954_pos, $I10, $P10) = rx954_cur."!mark_fail"(0)
    lt rx954_pos, -1, rx954_done
    eq rx954_pos, -1, rx954_fail
    jump $I10
  rx954_done:
    rx954_cur."!cursor_fail"()
    rx954_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx954_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("236_1273884026.76819") :method
.annotate 'line', 423
    $P956 = self."!PREFIX__!subrule"("dotty", "")
    new $P957, "ResizablePMCArray"
    push $P957, $P956
    .return ($P957)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("237_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx960_tgt
    .local int rx960_pos
    .local int rx960_off
    .local int rx960_eos
    .local int rx960_rep
    .local pmc rx960_cur
    (rx960_cur, rx960_pos, rx960_tgt) = self."!cursor_start"()
    rx960_cur."!cursor_debug"("START ", "prefix:sym<++>")
    .lex unicode:"$\x{a2}", rx960_cur
    .local pmc match
    .lex "$/", match
    length rx960_eos, rx960_tgt
    set rx960_off, 0
    lt rx960_pos, 2, rx960_start
    sub rx960_off, rx960_pos, 1
    substr rx960_tgt, rx960_tgt, rx960_off
  rx960_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan964_done
    goto rxscan964_scan
  rxscan964_loop:
    ($P10) = rx960_cur."from"()
    inc $P10
    set rx960_pos, $P10
    ge rx960_pos, rx960_eos, rxscan964_done
  rxscan964_scan:
    set_addr $I10, rxscan964_loop
    rx960_cur."!mark_push"(0, rx960_pos, $I10)
  rxscan964_done:
.annotate 'line', 467
  # rx subcapture "sym"
    set_addr $I10, rxcap_965_fail
    rx960_cur."!mark_push"(0, rx960_pos, $I10)
  # rx literal  "++"
    add $I11, rx960_pos, 2
    gt $I11, rx960_eos, rx960_fail
    sub $I11, rx960_pos, rx960_off
    substr $S10, rx960_tgt, $I11, 2
    ne $S10, "++", rx960_fail
    add rx960_pos, 2
    set_addr $I10, rxcap_965_fail
    ($I12, $I11) = rx960_cur."!mark_peek"($I10)
    rx960_cur."!cursor_pos"($I11)
    ($P10) = rx960_cur."!cursor_start"()
    $P10."!cursor_pass"(rx960_pos, "")
    rx960_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_965_done
  rxcap_965_fail:
    goto rx960_fail
  rxcap_965_done:
  # rx subrule "O" subtype=capture negate=
    rx960_cur."!cursor_pos"(rx960_pos)
    $P10 = rx960_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx960_fail
    rx960_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx960_pos = $P10."pos"()
  # rx pass
    rx960_cur."!cursor_pass"(rx960_pos, "prefix:sym<++>")
    rx960_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx960_pos)
    .return (rx960_cur)
  rx960_fail:
.annotate 'line', 423
    (rx960_rep, rx960_pos, $I10, $P10) = rx960_cur."!mark_fail"(0)
    lt rx960_pos, -1, rx960_done
    eq rx960_pos, -1, rx960_fail
    jump $I10
  rx960_done:
    rx960_cur."!cursor_fail"()
    rx960_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx960_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("238_1273884026.76819") :method
.annotate 'line', 423
    $P962 = self."!PREFIX__!subrule"("O", "++")
    new $P963, "ResizablePMCArray"
    push $P963, $P962
    .return ($P963)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("239_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx967_tgt
    .local int rx967_pos
    .local int rx967_off
    .local int rx967_eos
    .local int rx967_rep
    .local pmc rx967_cur
    (rx967_cur, rx967_pos, rx967_tgt) = self."!cursor_start"()
    rx967_cur."!cursor_debug"("START ", "prefix:sym<-->")
    .lex unicode:"$\x{a2}", rx967_cur
    .local pmc match
    .lex "$/", match
    length rx967_eos, rx967_tgt
    set rx967_off, 0
    lt rx967_pos, 2, rx967_start
    sub rx967_off, rx967_pos, 1
    substr rx967_tgt, rx967_tgt, rx967_off
  rx967_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan971_done
    goto rxscan971_scan
  rxscan971_loop:
    ($P10) = rx967_cur."from"()
    inc $P10
    set rx967_pos, $P10
    ge rx967_pos, rx967_eos, rxscan971_done
  rxscan971_scan:
    set_addr $I10, rxscan971_loop
    rx967_cur."!mark_push"(0, rx967_pos, $I10)
  rxscan971_done:
.annotate 'line', 468
  # rx subcapture "sym"
    set_addr $I10, rxcap_972_fail
    rx967_cur."!mark_push"(0, rx967_pos, $I10)
  # rx literal  "--"
    add $I11, rx967_pos, 2
    gt $I11, rx967_eos, rx967_fail
    sub $I11, rx967_pos, rx967_off
    substr $S10, rx967_tgt, $I11, 2
    ne $S10, "--", rx967_fail
    add rx967_pos, 2
    set_addr $I10, rxcap_972_fail
    ($I12, $I11) = rx967_cur."!mark_peek"($I10)
    rx967_cur."!cursor_pos"($I11)
    ($P10) = rx967_cur."!cursor_start"()
    $P10."!cursor_pass"(rx967_pos, "")
    rx967_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_972_done
  rxcap_972_fail:
    goto rx967_fail
  rxcap_972_done:
  # rx subrule "O" subtype=capture negate=
    rx967_cur."!cursor_pos"(rx967_pos)
    $P10 = rx967_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx967_fail
    rx967_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx967_pos = $P10."pos"()
  # rx pass
    rx967_cur."!cursor_pass"(rx967_pos, "prefix:sym<-->")
    rx967_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx967_pos)
    .return (rx967_cur)
  rx967_fail:
.annotate 'line', 423
    (rx967_rep, rx967_pos, $I10, $P10) = rx967_cur."!mark_fail"(0)
    lt rx967_pos, -1, rx967_done
    eq rx967_pos, -1, rx967_fail
    jump $I10
  rx967_done:
    rx967_cur."!cursor_fail"()
    rx967_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx967_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("240_1273884026.76819") :method
.annotate 'line', 423
    $P969 = self."!PREFIX__!subrule"("O", "--")
    new $P970, "ResizablePMCArray"
    push $P970, $P969
    .return ($P970)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("241_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx974_tgt
    .local int rx974_pos
    .local int rx974_off
    .local int rx974_eos
    .local int rx974_rep
    .local pmc rx974_cur
    (rx974_cur, rx974_pos, rx974_tgt) = self."!cursor_start"()
    rx974_cur."!cursor_debug"("START ", "postfix:sym<++>")
    .lex unicode:"$\x{a2}", rx974_cur
    .local pmc match
    .lex "$/", match
    length rx974_eos, rx974_tgt
    set rx974_off, 0
    lt rx974_pos, 2, rx974_start
    sub rx974_off, rx974_pos, 1
    substr rx974_tgt, rx974_tgt, rx974_off
  rx974_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan978_done
    goto rxscan978_scan
  rxscan978_loop:
    ($P10) = rx974_cur."from"()
    inc $P10
    set rx974_pos, $P10
    ge rx974_pos, rx974_eos, rxscan978_done
  rxscan978_scan:
    set_addr $I10, rxscan978_loop
    rx974_cur."!mark_push"(0, rx974_pos, $I10)
  rxscan978_done:
.annotate 'line', 471
  # rx subcapture "sym"
    set_addr $I10, rxcap_979_fail
    rx974_cur."!mark_push"(0, rx974_pos, $I10)
  # rx literal  "++"
    add $I11, rx974_pos, 2
    gt $I11, rx974_eos, rx974_fail
    sub $I11, rx974_pos, rx974_off
    substr $S10, rx974_tgt, $I11, 2
    ne $S10, "++", rx974_fail
    add rx974_pos, 2
    set_addr $I10, rxcap_979_fail
    ($I12, $I11) = rx974_cur."!mark_peek"($I10)
    rx974_cur."!cursor_pos"($I11)
    ($P10) = rx974_cur."!cursor_start"()
    $P10."!cursor_pass"(rx974_pos, "")
    rx974_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_979_done
  rxcap_979_fail:
    goto rx974_fail
  rxcap_979_done:
  # rx subrule "O" subtype=capture negate=
    rx974_cur."!cursor_pos"(rx974_pos)
    $P10 = rx974_cur."O"("%autoincrement")
    unless $P10, rx974_fail
    rx974_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx974_pos = $P10."pos"()
  # rx pass
    rx974_cur."!cursor_pass"(rx974_pos, "postfix:sym<++>")
    rx974_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx974_pos)
    .return (rx974_cur)
  rx974_fail:
.annotate 'line', 423
    (rx974_rep, rx974_pos, $I10, $P10) = rx974_cur."!mark_fail"(0)
    lt rx974_pos, -1, rx974_done
    eq rx974_pos, -1, rx974_fail
    jump $I10
  rx974_done:
    rx974_cur."!cursor_fail"()
    rx974_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx974_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("242_1273884026.76819") :method
.annotate 'line', 423
    $P976 = self."!PREFIX__!subrule"("O", "++")
    new $P977, "ResizablePMCArray"
    push $P977, $P976
    .return ($P977)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("243_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx981_tgt
    .local int rx981_pos
    .local int rx981_off
    .local int rx981_eos
    .local int rx981_rep
    .local pmc rx981_cur
    (rx981_cur, rx981_pos, rx981_tgt) = self."!cursor_start"()
    rx981_cur."!cursor_debug"("START ", "postfix:sym<-->")
    .lex unicode:"$\x{a2}", rx981_cur
    .local pmc match
    .lex "$/", match
    length rx981_eos, rx981_tgt
    set rx981_off, 0
    lt rx981_pos, 2, rx981_start
    sub rx981_off, rx981_pos, 1
    substr rx981_tgt, rx981_tgt, rx981_off
  rx981_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan985_done
    goto rxscan985_scan
  rxscan985_loop:
    ($P10) = rx981_cur."from"()
    inc $P10
    set rx981_pos, $P10
    ge rx981_pos, rx981_eos, rxscan985_done
  rxscan985_scan:
    set_addr $I10, rxscan985_loop
    rx981_cur."!mark_push"(0, rx981_pos, $I10)
  rxscan985_done:
.annotate 'line', 472
  # rx subcapture "sym"
    set_addr $I10, rxcap_986_fail
    rx981_cur."!mark_push"(0, rx981_pos, $I10)
  # rx literal  "--"
    add $I11, rx981_pos, 2
    gt $I11, rx981_eos, rx981_fail
    sub $I11, rx981_pos, rx981_off
    substr $S10, rx981_tgt, $I11, 2
    ne $S10, "--", rx981_fail
    add rx981_pos, 2
    set_addr $I10, rxcap_986_fail
    ($I12, $I11) = rx981_cur."!mark_peek"($I10)
    rx981_cur."!cursor_pos"($I11)
    ($P10) = rx981_cur."!cursor_start"()
    $P10."!cursor_pass"(rx981_pos, "")
    rx981_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_986_done
  rxcap_986_fail:
    goto rx981_fail
  rxcap_986_done:
  # rx subrule "O" subtype=capture negate=
    rx981_cur."!cursor_pos"(rx981_pos)
    $P10 = rx981_cur."O"("%autoincrement")
    unless $P10, rx981_fail
    rx981_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx981_pos = $P10."pos"()
  # rx pass
    rx981_cur."!cursor_pass"(rx981_pos, "postfix:sym<-->")
    rx981_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx981_pos)
    .return (rx981_cur)
  rx981_fail:
.annotate 'line', 423
    (rx981_rep, rx981_pos, $I10, $P10) = rx981_cur."!mark_fail"(0)
    lt rx981_pos, -1, rx981_done
    eq rx981_pos, -1, rx981_fail
    jump $I10
  rx981_done:
    rx981_cur."!cursor_fail"()
    rx981_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx981_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("244_1273884026.76819") :method
.annotate 'line', 423
    $P983 = self."!PREFIX__!subrule"("O", "--")
    new $P984, "ResizablePMCArray"
    push $P984, $P983
    .return ($P984)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("245_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx988_tgt
    .local int rx988_pos
    .local int rx988_off
    .local int rx988_eos
    .local int rx988_rep
    .local pmc rx988_cur
    (rx988_cur, rx988_pos, rx988_tgt) = self."!cursor_start"()
    rx988_cur."!cursor_debug"("START ", "infix:sym<**>")
    .lex unicode:"$\x{a2}", rx988_cur
    .local pmc match
    .lex "$/", match
    length rx988_eos, rx988_tgt
    set rx988_off, 0
    lt rx988_pos, 2, rx988_start
    sub rx988_off, rx988_pos, 1
    substr rx988_tgt, rx988_tgt, rx988_off
  rx988_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan992_done
    goto rxscan992_scan
  rxscan992_loop:
    ($P10) = rx988_cur."from"()
    inc $P10
    set rx988_pos, $P10
    ge rx988_pos, rx988_eos, rxscan992_done
  rxscan992_scan:
    set_addr $I10, rxscan992_loop
    rx988_cur."!mark_push"(0, rx988_pos, $I10)
  rxscan992_done:
.annotate 'line', 474
  # rx subcapture "sym"
    set_addr $I10, rxcap_993_fail
    rx988_cur."!mark_push"(0, rx988_pos, $I10)
  # rx literal  "**"
    add $I11, rx988_pos, 2
    gt $I11, rx988_eos, rx988_fail
    sub $I11, rx988_pos, rx988_off
    substr $S10, rx988_tgt, $I11, 2
    ne $S10, "**", rx988_fail
    add rx988_pos, 2
    set_addr $I10, rxcap_993_fail
    ($I12, $I11) = rx988_cur."!mark_peek"($I10)
    rx988_cur."!cursor_pos"($I11)
    ($P10) = rx988_cur."!cursor_start"()
    $P10."!cursor_pass"(rx988_pos, "")
    rx988_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_993_done
  rxcap_993_fail:
    goto rx988_fail
  rxcap_993_done:
  # rx subrule "O" subtype=capture negate=
    rx988_cur."!cursor_pos"(rx988_pos)
    $P10 = rx988_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx988_fail
    rx988_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx988_pos = $P10."pos"()
  # rx pass
    rx988_cur."!cursor_pass"(rx988_pos, "infix:sym<**>")
    rx988_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx988_pos)
    .return (rx988_cur)
  rx988_fail:
.annotate 'line', 423
    (rx988_rep, rx988_pos, $I10, $P10) = rx988_cur."!mark_fail"(0)
    lt rx988_pos, -1, rx988_done
    eq rx988_pos, -1, rx988_fail
    jump $I10
  rx988_done:
    rx988_cur."!cursor_fail"()
    rx988_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx988_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("246_1273884026.76819") :method
.annotate 'line', 423
    $P990 = self."!PREFIX__!subrule"("O", "**")
    new $P991, "ResizablePMCArray"
    push $P991, $P990
    .return ($P991)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("247_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx995_tgt
    .local int rx995_pos
    .local int rx995_off
    .local int rx995_eos
    .local int rx995_rep
    .local pmc rx995_cur
    (rx995_cur, rx995_pos, rx995_tgt) = self."!cursor_start"()
    rx995_cur."!cursor_debug"("START ", "prefix:sym<+>")
    .lex unicode:"$\x{a2}", rx995_cur
    .local pmc match
    .lex "$/", match
    length rx995_eos, rx995_tgt
    set rx995_off, 0
    lt rx995_pos, 2, rx995_start
    sub rx995_off, rx995_pos, 1
    substr rx995_tgt, rx995_tgt, rx995_off
  rx995_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan999_done
    goto rxscan999_scan
  rxscan999_loop:
    ($P10) = rx995_cur."from"()
    inc $P10
    set rx995_pos, $P10
    ge rx995_pos, rx995_eos, rxscan999_done
  rxscan999_scan:
    set_addr $I10, rxscan999_loop
    rx995_cur."!mark_push"(0, rx995_pos, $I10)
  rxscan999_done:
.annotate 'line', 476
  # rx subcapture "sym"
    set_addr $I10, rxcap_1000_fail
    rx995_cur."!mark_push"(0, rx995_pos, $I10)
  # rx literal  "+"
    add $I11, rx995_pos, 1
    gt $I11, rx995_eos, rx995_fail
    sub $I11, rx995_pos, rx995_off
    substr $S10, rx995_tgt, $I11, 1
    ne $S10, "+", rx995_fail
    add rx995_pos, 1
    set_addr $I10, rxcap_1000_fail
    ($I12, $I11) = rx995_cur."!mark_peek"($I10)
    rx995_cur."!cursor_pos"($I11)
    ($P10) = rx995_cur."!cursor_start"()
    $P10."!cursor_pass"(rx995_pos, "")
    rx995_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1000_done
  rxcap_1000_fail:
    goto rx995_fail
  rxcap_1000_done:
  # rx subrule "O" subtype=capture negate=
    rx995_cur."!cursor_pos"(rx995_pos)
    $P10 = rx995_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx995_fail
    rx995_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx995_pos = $P10."pos"()
  # rx pass
    rx995_cur."!cursor_pass"(rx995_pos, "prefix:sym<+>")
    rx995_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx995_pos)
    .return (rx995_cur)
  rx995_fail:
.annotate 'line', 423
    (rx995_rep, rx995_pos, $I10, $P10) = rx995_cur."!mark_fail"(0)
    lt rx995_pos, -1, rx995_done
    eq rx995_pos, -1, rx995_fail
    jump $I10
  rx995_done:
    rx995_cur."!cursor_fail"()
    rx995_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx995_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("248_1273884026.76819") :method
.annotate 'line', 423
    $P997 = self."!PREFIX__!subrule"("O", "+")
    new $P998, "ResizablePMCArray"
    push $P998, $P997
    .return ($P998)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("249_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1002_tgt
    .local int rx1002_pos
    .local int rx1002_off
    .local int rx1002_eos
    .local int rx1002_rep
    .local pmc rx1002_cur
    (rx1002_cur, rx1002_pos, rx1002_tgt) = self."!cursor_start"()
    rx1002_cur."!cursor_debug"("START ", "prefix:sym<~>")
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
.annotate 'line', 477
  # rx subcapture "sym"
    set_addr $I10, rxcap_1007_fail
    rx1002_cur."!mark_push"(0, rx1002_pos, $I10)
  # rx literal  "~"
    add $I11, rx1002_pos, 1
    gt $I11, rx1002_eos, rx1002_fail
    sub $I11, rx1002_pos, rx1002_off
    substr $S10, rx1002_tgt, $I11, 1
    ne $S10, "~", rx1002_fail
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
    $P10 = rx1002_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx1002_fail
    rx1002_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1002_pos = $P10."pos"()
  # rx pass
    rx1002_cur."!cursor_pass"(rx1002_pos, "prefix:sym<~>")
    rx1002_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx1002_pos)
    .return (rx1002_cur)
  rx1002_fail:
.annotate 'line', 423
    (rx1002_rep, rx1002_pos, $I10, $P10) = rx1002_cur."!mark_fail"(0)
    lt rx1002_pos, -1, rx1002_done
    eq rx1002_pos, -1, rx1002_fail
    jump $I10
  rx1002_done:
    rx1002_cur."!cursor_fail"()
    rx1002_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx1002_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("250_1273884026.76819") :method
.annotate 'line', 423
    $P1004 = self."!PREFIX__!subrule"("O", "~")
    new $P1005, "ResizablePMCArray"
    push $P1005, $P1004
    .return ($P1005)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("251_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1009_tgt
    .local int rx1009_pos
    .local int rx1009_off
    .local int rx1009_eos
    .local int rx1009_rep
    .local pmc rx1009_cur
    (rx1009_cur, rx1009_pos, rx1009_tgt) = self."!cursor_start"()
    rx1009_cur."!cursor_debug"("START ", "prefix:sym<->")
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
    ne $I10, -1, rxscan1012_done
    goto rxscan1012_scan
  rxscan1012_loop:
    ($P10) = rx1009_cur."from"()
    inc $P10
    set rx1009_pos, $P10
    ge rx1009_pos, rx1009_eos, rxscan1012_done
  rxscan1012_scan:
    set_addr $I10, rxscan1012_loop
    rx1009_cur."!mark_push"(0, rx1009_pos, $I10)
  rxscan1012_done:
.annotate 'line', 478
  # rx subcapture "sym"
    set_addr $I10, rxcap_1013_fail
    rx1009_cur."!mark_push"(0, rx1009_pos, $I10)
  # rx literal  "-"
    add $I11, rx1009_pos, 1
    gt $I11, rx1009_eos, rx1009_fail
    sub $I11, rx1009_pos, rx1009_off
    substr $S10, rx1009_tgt, $I11, 1
    ne $S10, "-", rx1009_fail
    add rx1009_pos, 1
    set_addr $I10, rxcap_1013_fail
    ($I12, $I11) = rx1009_cur."!mark_peek"($I10)
    rx1009_cur."!cursor_pos"($I11)
    ($P10) = rx1009_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1009_pos, "")
    rx1009_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1013_done
  rxcap_1013_fail:
    goto rx1009_fail
  rxcap_1013_done:
  # rx enumcharlist negate=1 zerowidth
    ge rx1009_pos, rx1009_eos, rx1009_fail
    sub $I10, rx1009_pos, rx1009_off
    substr $S10, rx1009_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx1009_fail
  # rx subrule "number" subtype=zerowidth negate=1
    rx1009_cur."!cursor_pos"(rx1009_pos)
    $P10 = rx1009_cur."number"()
    if $P10, rx1009_fail
  # rx subrule "O" subtype=capture negate=
    rx1009_cur."!cursor_pos"(rx1009_pos)
    $P10 = rx1009_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx1009_fail
    rx1009_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1009_pos = $P10."pos"()
  # rx pass
    rx1009_cur."!cursor_pass"(rx1009_pos, "prefix:sym<->")
    rx1009_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx1009_pos)
    .return (rx1009_cur)
  rx1009_fail:
.annotate 'line', 423
    (rx1009_rep, rx1009_pos, $I10, $P10) = rx1009_cur."!mark_fail"(0)
    lt rx1009_pos, -1, rx1009_done
    eq rx1009_pos, -1, rx1009_fail
    jump $I10
  rx1009_done:
    rx1009_cur."!cursor_fail"()
    rx1009_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx1009_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("252_1273884026.76819") :method
.annotate 'line', 423
    new $P1011, "ResizablePMCArray"
    push $P1011, "-"
    .return ($P1011)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("253_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1015_tgt
    .local int rx1015_pos
    .local int rx1015_off
    .local int rx1015_eos
    .local int rx1015_rep
    .local pmc rx1015_cur
    (rx1015_cur, rx1015_pos, rx1015_tgt) = self."!cursor_start"()
    rx1015_cur."!cursor_debug"("START ", "prefix:sym<?>")
    .lex unicode:"$\x{a2}", rx1015_cur
    .local pmc match
    .lex "$/", match
    length rx1015_eos, rx1015_tgt
    set rx1015_off, 0
    lt rx1015_pos, 2, rx1015_start
    sub rx1015_off, rx1015_pos, 1
    substr rx1015_tgt, rx1015_tgt, rx1015_off
  rx1015_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1019_done
    goto rxscan1019_scan
  rxscan1019_loop:
    ($P10) = rx1015_cur."from"()
    inc $P10
    set rx1015_pos, $P10
    ge rx1015_pos, rx1015_eos, rxscan1019_done
  rxscan1019_scan:
    set_addr $I10, rxscan1019_loop
    rx1015_cur."!mark_push"(0, rx1015_pos, $I10)
  rxscan1019_done:
.annotate 'line', 479
  # rx subcapture "sym"
    set_addr $I10, rxcap_1020_fail
    rx1015_cur."!mark_push"(0, rx1015_pos, $I10)
  # rx literal  "?"
    add $I11, rx1015_pos, 1
    gt $I11, rx1015_eos, rx1015_fail
    sub $I11, rx1015_pos, rx1015_off
    substr $S10, rx1015_tgt, $I11, 1
    ne $S10, "?", rx1015_fail
    add rx1015_pos, 1
    set_addr $I10, rxcap_1020_fail
    ($I12, $I11) = rx1015_cur."!mark_peek"($I10)
    rx1015_cur."!cursor_pos"($I11)
    ($P10) = rx1015_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1015_pos, "")
    rx1015_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1020_done
  rxcap_1020_fail:
    goto rx1015_fail
  rxcap_1020_done:
  # rx subrule "O" subtype=capture negate=
    rx1015_cur."!cursor_pos"(rx1015_pos)
    $P10 = rx1015_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx1015_fail
    rx1015_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1015_pos = $P10."pos"()
  # rx pass
    rx1015_cur."!cursor_pass"(rx1015_pos, "prefix:sym<?>")
    rx1015_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx1015_pos)
    .return (rx1015_cur)
  rx1015_fail:
.annotate 'line', 423
    (rx1015_rep, rx1015_pos, $I10, $P10) = rx1015_cur."!mark_fail"(0)
    lt rx1015_pos, -1, rx1015_done
    eq rx1015_pos, -1, rx1015_fail
    jump $I10
  rx1015_done:
    rx1015_cur."!cursor_fail"()
    rx1015_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx1015_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("254_1273884026.76819") :method
.annotate 'line', 423
    $P1017 = self."!PREFIX__!subrule"("O", "?")
    new $P1018, "ResizablePMCArray"
    push $P1018, $P1017
    .return ($P1018)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("255_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1022_tgt
    .local int rx1022_pos
    .local int rx1022_off
    .local int rx1022_eos
    .local int rx1022_rep
    .local pmc rx1022_cur
    (rx1022_cur, rx1022_pos, rx1022_tgt) = self."!cursor_start"()
    rx1022_cur."!cursor_debug"("START ", "prefix:sym<!>")
    .lex unicode:"$\x{a2}", rx1022_cur
    .local pmc match
    .lex "$/", match
    length rx1022_eos, rx1022_tgt
    set rx1022_off, 0
    lt rx1022_pos, 2, rx1022_start
    sub rx1022_off, rx1022_pos, 1
    substr rx1022_tgt, rx1022_tgt, rx1022_off
  rx1022_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1026_done
    goto rxscan1026_scan
  rxscan1026_loop:
    ($P10) = rx1022_cur."from"()
    inc $P10
    set rx1022_pos, $P10
    ge rx1022_pos, rx1022_eos, rxscan1026_done
  rxscan1026_scan:
    set_addr $I10, rxscan1026_loop
    rx1022_cur."!mark_push"(0, rx1022_pos, $I10)
  rxscan1026_done:
.annotate 'line', 480
  # rx subcapture "sym"
    set_addr $I10, rxcap_1027_fail
    rx1022_cur."!mark_push"(0, rx1022_pos, $I10)
  # rx literal  "!"
    add $I11, rx1022_pos, 1
    gt $I11, rx1022_eos, rx1022_fail
    sub $I11, rx1022_pos, rx1022_off
    substr $S10, rx1022_tgt, $I11, 1
    ne $S10, "!", rx1022_fail
    add rx1022_pos, 1
    set_addr $I10, rxcap_1027_fail
    ($I12, $I11) = rx1022_cur."!mark_peek"($I10)
    rx1022_cur."!cursor_pos"($I11)
    ($P10) = rx1022_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1022_pos, "")
    rx1022_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1027_done
  rxcap_1027_fail:
    goto rx1022_fail
  rxcap_1027_done:
  # rx subrule "O" subtype=capture negate=
    rx1022_cur."!cursor_pos"(rx1022_pos)
    $P10 = rx1022_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx1022_fail
    rx1022_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1022_pos = $P10."pos"()
  # rx pass
    rx1022_cur."!cursor_pass"(rx1022_pos, "prefix:sym<!>")
    rx1022_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx1022_pos)
    .return (rx1022_cur)
  rx1022_fail:
.annotate 'line', 423
    (rx1022_rep, rx1022_pos, $I10, $P10) = rx1022_cur."!mark_fail"(0)
    lt rx1022_pos, -1, rx1022_done
    eq rx1022_pos, -1, rx1022_fail
    jump $I10
  rx1022_done:
    rx1022_cur."!cursor_fail"()
    rx1022_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx1022_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("256_1273884026.76819") :method
.annotate 'line', 423
    $P1024 = self."!PREFIX__!subrule"("O", "!")
    new $P1025, "ResizablePMCArray"
    push $P1025, $P1024
    .return ($P1025)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("257_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1029_tgt
    .local int rx1029_pos
    .local int rx1029_off
    .local int rx1029_eos
    .local int rx1029_rep
    .local pmc rx1029_cur
    (rx1029_cur, rx1029_pos, rx1029_tgt) = self."!cursor_start"()
    rx1029_cur."!cursor_debug"("START ", "prefix:sym<|>")
    .lex unicode:"$\x{a2}", rx1029_cur
    .local pmc match
    .lex "$/", match
    length rx1029_eos, rx1029_tgt
    set rx1029_off, 0
    lt rx1029_pos, 2, rx1029_start
    sub rx1029_off, rx1029_pos, 1
    substr rx1029_tgt, rx1029_tgt, rx1029_off
  rx1029_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1033_done
    goto rxscan1033_scan
  rxscan1033_loop:
    ($P10) = rx1029_cur."from"()
    inc $P10
    set rx1029_pos, $P10
    ge rx1029_pos, rx1029_eos, rxscan1033_done
  rxscan1033_scan:
    set_addr $I10, rxscan1033_loop
    rx1029_cur."!mark_push"(0, rx1029_pos, $I10)
  rxscan1033_done:
.annotate 'line', 481
  # rx subcapture "sym"
    set_addr $I10, rxcap_1034_fail
    rx1029_cur."!mark_push"(0, rx1029_pos, $I10)
  # rx literal  "|"
    add $I11, rx1029_pos, 1
    gt $I11, rx1029_eos, rx1029_fail
    sub $I11, rx1029_pos, rx1029_off
    substr $S10, rx1029_tgt, $I11, 1
    ne $S10, "|", rx1029_fail
    add rx1029_pos, 1
    set_addr $I10, rxcap_1034_fail
    ($I12, $I11) = rx1029_cur."!mark_peek"($I10)
    rx1029_cur."!cursor_pos"($I11)
    ($P10) = rx1029_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1029_pos, "")
    rx1029_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1034_done
  rxcap_1034_fail:
    goto rx1029_fail
  rxcap_1034_done:
  # rx subrule "O" subtype=capture negate=
    rx1029_cur."!cursor_pos"(rx1029_pos)
    $P10 = rx1029_cur."O"("%symbolic_unary")
    unless $P10, rx1029_fail
    rx1029_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1029_pos = $P10."pos"()
  # rx pass
    rx1029_cur."!cursor_pass"(rx1029_pos, "prefix:sym<|>")
    rx1029_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx1029_pos)
    .return (rx1029_cur)
  rx1029_fail:
.annotate 'line', 423
    (rx1029_rep, rx1029_pos, $I10, $P10) = rx1029_cur."!mark_fail"(0)
    lt rx1029_pos, -1, rx1029_done
    eq rx1029_pos, -1, rx1029_fail
    jump $I10
  rx1029_done:
    rx1029_cur."!cursor_fail"()
    rx1029_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx1029_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("258_1273884026.76819") :method
.annotate 'line', 423
    $P1031 = self."!PREFIX__!subrule"("O", "|")
    new $P1032, "ResizablePMCArray"
    push $P1032, $P1031
    .return ($P1032)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("259_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1036_tgt
    .local int rx1036_pos
    .local int rx1036_off
    .local int rx1036_eos
    .local int rx1036_rep
    .local pmc rx1036_cur
    (rx1036_cur, rx1036_pos, rx1036_tgt) = self."!cursor_start"()
    rx1036_cur."!cursor_debug"("START ", "infix:sym<*>")
    .lex unicode:"$\x{a2}", rx1036_cur
    .local pmc match
    .lex "$/", match
    length rx1036_eos, rx1036_tgt
    set rx1036_off, 0
    lt rx1036_pos, 2, rx1036_start
    sub rx1036_off, rx1036_pos, 1
    substr rx1036_tgt, rx1036_tgt, rx1036_off
  rx1036_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1040_done
    goto rxscan1040_scan
  rxscan1040_loop:
    ($P10) = rx1036_cur."from"()
    inc $P10
    set rx1036_pos, $P10
    ge rx1036_pos, rx1036_eos, rxscan1040_done
  rxscan1040_scan:
    set_addr $I10, rxscan1040_loop
    rx1036_cur."!mark_push"(0, rx1036_pos, $I10)
  rxscan1040_done:
.annotate 'line', 483
  # rx subcapture "sym"
    set_addr $I10, rxcap_1041_fail
    rx1036_cur."!mark_push"(0, rx1036_pos, $I10)
  # rx literal  "*"
    add $I11, rx1036_pos, 1
    gt $I11, rx1036_eos, rx1036_fail
    sub $I11, rx1036_pos, rx1036_off
    substr $S10, rx1036_tgt, $I11, 1
    ne $S10, "*", rx1036_fail
    add rx1036_pos, 1
    set_addr $I10, rxcap_1041_fail
    ($I12, $I11) = rx1036_cur."!mark_peek"($I10)
    rx1036_cur."!cursor_pos"($I11)
    ($P10) = rx1036_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1036_pos, "")
    rx1036_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1041_done
  rxcap_1041_fail:
    goto rx1036_fail
  rxcap_1041_done:
  # rx subrule "O" subtype=capture negate=
    rx1036_cur."!cursor_pos"(rx1036_pos)
    $P10 = rx1036_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx1036_fail
    rx1036_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1036_pos = $P10."pos"()
  # rx pass
    rx1036_cur."!cursor_pass"(rx1036_pos, "infix:sym<*>")
    rx1036_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx1036_pos)
    .return (rx1036_cur)
  rx1036_fail:
.annotate 'line', 423
    (rx1036_rep, rx1036_pos, $I10, $P10) = rx1036_cur."!mark_fail"(0)
    lt rx1036_pos, -1, rx1036_done
    eq rx1036_pos, -1, rx1036_fail
    jump $I10
  rx1036_done:
    rx1036_cur."!cursor_fail"()
    rx1036_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx1036_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("260_1273884026.76819") :method
.annotate 'line', 423
    $P1038 = self."!PREFIX__!subrule"("O", "*")
    new $P1039, "ResizablePMCArray"
    push $P1039, $P1038
    .return ($P1039)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("261_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1043_tgt
    .local int rx1043_pos
    .local int rx1043_off
    .local int rx1043_eos
    .local int rx1043_rep
    .local pmc rx1043_cur
    (rx1043_cur, rx1043_pos, rx1043_tgt) = self."!cursor_start"()
    rx1043_cur."!cursor_debug"("START ", "infix:sym</>")
    .lex unicode:"$\x{a2}", rx1043_cur
    .local pmc match
    .lex "$/", match
    length rx1043_eos, rx1043_tgt
    set rx1043_off, 0
    lt rx1043_pos, 2, rx1043_start
    sub rx1043_off, rx1043_pos, 1
    substr rx1043_tgt, rx1043_tgt, rx1043_off
  rx1043_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1047_done
    goto rxscan1047_scan
  rxscan1047_loop:
    ($P10) = rx1043_cur."from"()
    inc $P10
    set rx1043_pos, $P10
    ge rx1043_pos, rx1043_eos, rxscan1047_done
  rxscan1047_scan:
    set_addr $I10, rxscan1047_loop
    rx1043_cur."!mark_push"(0, rx1043_pos, $I10)
  rxscan1047_done:
.annotate 'line', 484
  # rx subcapture "sym"
    set_addr $I10, rxcap_1048_fail
    rx1043_cur."!mark_push"(0, rx1043_pos, $I10)
  # rx literal  "/"
    add $I11, rx1043_pos, 1
    gt $I11, rx1043_eos, rx1043_fail
    sub $I11, rx1043_pos, rx1043_off
    substr $S10, rx1043_tgt, $I11, 1
    ne $S10, "/", rx1043_fail
    add rx1043_pos, 1
    set_addr $I10, rxcap_1048_fail
    ($I12, $I11) = rx1043_cur."!mark_peek"($I10)
    rx1043_cur."!cursor_pos"($I11)
    ($P10) = rx1043_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1043_pos, "")
    rx1043_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1048_done
  rxcap_1048_fail:
    goto rx1043_fail
  rxcap_1048_done:
  # rx subrule "O" subtype=capture negate=
    rx1043_cur."!cursor_pos"(rx1043_pos)
    $P10 = rx1043_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx1043_fail
    rx1043_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1043_pos = $P10."pos"()
  # rx pass
    rx1043_cur."!cursor_pass"(rx1043_pos, "infix:sym</>")
    rx1043_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx1043_pos)
    .return (rx1043_cur)
  rx1043_fail:
.annotate 'line', 423
    (rx1043_rep, rx1043_pos, $I10, $P10) = rx1043_cur."!mark_fail"(0)
    lt rx1043_pos, -1, rx1043_done
    eq rx1043_pos, -1, rx1043_fail
    jump $I10
  rx1043_done:
    rx1043_cur."!cursor_fail"()
    rx1043_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx1043_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("262_1273884026.76819") :method
.annotate 'line', 423
    $P1045 = self."!PREFIX__!subrule"("O", "/")
    new $P1046, "ResizablePMCArray"
    push $P1046, $P1045
    .return ($P1046)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("263_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1050_tgt
    .local int rx1050_pos
    .local int rx1050_off
    .local int rx1050_eos
    .local int rx1050_rep
    .local pmc rx1050_cur
    (rx1050_cur, rx1050_pos, rx1050_tgt) = self."!cursor_start"()
    rx1050_cur."!cursor_debug"("START ", "infix:sym<%>")
    .lex unicode:"$\x{a2}", rx1050_cur
    .local pmc match
    .lex "$/", match
    length rx1050_eos, rx1050_tgt
    set rx1050_off, 0
    lt rx1050_pos, 2, rx1050_start
    sub rx1050_off, rx1050_pos, 1
    substr rx1050_tgt, rx1050_tgt, rx1050_off
  rx1050_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1054_done
    goto rxscan1054_scan
  rxscan1054_loop:
    ($P10) = rx1050_cur."from"()
    inc $P10
    set rx1050_pos, $P10
    ge rx1050_pos, rx1050_eos, rxscan1054_done
  rxscan1054_scan:
    set_addr $I10, rxscan1054_loop
    rx1050_cur."!mark_push"(0, rx1050_pos, $I10)
  rxscan1054_done:
.annotate 'line', 485
  # rx subcapture "sym"
    set_addr $I10, rxcap_1055_fail
    rx1050_cur."!mark_push"(0, rx1050_pos, $I10)
  # rx literal  "%"
    add $I11, rx1050_pos, 1
    gt $I11, rx1050_eos, rx1050_fail
    sub $I11, rx1050_pos, rx1050_off
    substr $S10, rx1050_tgt, $I11, 1
    ne $S10, "%", rx1050_fail
    add rx1050_pos, 1
    set_addr $I10, rxcap_1055_fail
    ($I12, $I11) = rx1050_cur."!mark_peek"($I10)
    rx1050_cur."!cursor_pos"($I11)
    ($P10) = rx1050_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1050_pos, "")
    rx1050_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1055_done
  rxcap_1055_fail:
    goto rx1050_fail
  rxcap_1055_done:
  # rx subrule "O" subtype=capture negate=
    rx1050_cur."!cursor_pos"(rx1050_pos)
    $P10 = rx1050_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx1050_fail
    rx1050_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1050_pos = $P10."pos"()
  # rx pass
    rx1050_cur."!cursor_pass"(rx1050_pos, "infix:sym<%>")
    rx1050_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx1050_pos)
    .return (rx1050_cur)
  rx1050_fail:
.annotate 'line', 423
    (rx1050_rep, rx1050_pos, $I10, $P10) = rx1050_cur."!mark_fail"(0)
    lt rx1050_pos, -1, rx1050_done
    eq rx1050_pos, -1, rx1050_fail
    jump $I10
  rx1050_done:
    rx1050_cur."!cursor_fail"()
    rx1050_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx1050_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("264_1273884026.76819") :method
.annotate 'line', 423
    $P1052 = self."!PREFIX__!subrule"("O", "%")
    new $P1053, "ResizablePMCArray"
    push $P1053, $P1052
    .return ($P1053)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("265_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1057_tgt
    .local int rx1057_pos
    .local int rx1057_off
    .local int rx1057_eos
    .local int rx1057_rep
    .local pmc rx1057_cur
    (rx1057_cur, rx1057_pos, rx1057_tgt) = self."!cursor_start"()
    rx1057_cur."!cursor_debug"("START ", "infix:sym<+>")
    .lex unicode:"$\x{a2}", rx1057_cur
    .local pmc match
    .lex "$/", match
    length rx1057_eos, rx1057_tgt
    set rx1057_off, 0
    lt rx1057_pos, 2, rx1057_start
    sub rx1057_off, rx1057_pos, 1
    substr rx1057_tgt, rx1057_tgt, rx1057_off
  rx1057_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1061_done
    goto rxscan1061_scan
  rxscan1061_loop:
    ($P10) = rx1057_cur."from"()
    inc $P10
    set rx1057_pos, $P10
    ge rx1057_pos, rx1057_eos, rxscan1061_done
  rxscan1061_scan:
    set_addr $I10, rxscan1061_loop
    rx1057_cur."!mark_push"(0, rx1057_pos, $I10)
  rxscan1061_done:
.annotate 'line', 487
  # rx subcapture "sym"
    set_addr $I10, rxcap_1062_fail
    rx1057_cur."!mark_push"(0, rx1057_pos, $I10)
  # rx literal  "+"
    add $I11, rx1057_pos, 1
    gt $I11, rx1057_eos, rx1057_fail
    sub $I11, rx1057_pos, rx1057_off
    substr $S10, rx1057_tgt, $I11, 1
    ne $S10, "+", rx1057_fail
    add rx1057_pos, 1
    set_addr $I10, rxcap_1062_fail
    ($I12, $I11) = rx1057_cur."!mark_peek"($I10)
    rx1057_cur."!cursor_pos"($I11)
    ($P10) = rx1057_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1057_pos, "")
    rx1057_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1062_done
  rxcap_1062_fail:
    goto rx1057_fail
  rxcap_1062_done:
  # rx subrule "O" subtype=capture negate=
    rx1057_cur."!cursor_pos"(rx1057_pos)
    $P10 = rx1057_cur."O"("%additive, :pirop<add>")
    unless $P10, rx1057_fail
    rx1057_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1057_pos = $P10."pos"()
  # rx pass
    rx1057_cur."!cursor_pass"(rx1057_pos, "infix:sym<+>")
    rx1057_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx1057_pos)
    .return (rx1057_cur)
  rx1057_fail:
.annotate 'line', 423
    (rx1057_rep, rx1057_pos, $I10, $P10) = rx1057_cur."!mark_fail"(0)
    lt rx1057_pos, -1, rx1057_done
    eq rx1057_pos, -1, rx1057_fail
    jump $I10
  rx1057_done:
    rx1057_cur."!cursor_fail"()
    rx1057_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx1057_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("266_1273884026.76819") :method
.annotate 'line', 423
    $P1059 = self."!PREFIX__!subrule"("O", "+")
    new $P1060, "ResizablePMCArray"
    push $P1060, $P1059
    .return ($P1060)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("267_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1064_tgt
    .local int rx1064_pos
    .local int rx1064_off
    .local int rx1064_eos
    .local int rx1064_rep
    .local pmc rx1064_cur
    (rx1064_cur, rx1064_pos, rx1064_tgt) = self."!cursor_start"()
    rx1064_cur."!cursor_debug"("START ", "infix:sym<->")
    .lex unicode:"$\x{a2}", rx1064_cur
    .local pmc match
    .lex "$/", match
    length rx1064_eos, rx1064_tgt
    set rx1064_off, 0
    lt rx1064_pos, 2, rx1064_start
    sub rx1064_off, rx1064_pos, 1
    substr rx1064_tgt, rx1064_tgt, rx1064_off
  rx1064_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1068_done
    goto rxscan1068_scan
  rxscan1068_loop:
    ($P10) = rx1064_cur."from"()
    inc $P10
    set rx1064_pos, $P10
    ge rx1064_pos, rx1064_eos, rxscan1068_done
  rxscan1068_scan:
    set_addr $I10, rxscan1068_loop
    rx1064_cur."!mark_push"(0, rx1064_pos, $I10)
  rxscan1068_done:
.annotate 'line', 488
  # rx subcapture "sym"
    set_addr $I10, rxcap_1069_fail
    rx1064_cur."!mark_push"(0, rx1064_pos, $I10)
  # rx literal  "-"
    add $I11, rx1064_pos, 1
    gt $I11, rx1064_eos, rx1064_fail
    sub $I11, rx1064_pos, rx1064_off
    substr $S10, rx1064_tgt, $I11, 1
    ne $S10, "-", rx1064_fail
    add rx1064_pos, 1
    set_addr $I10, rxcap_1069_fail
    ($I12, $I11) = rx1064_cur."!mark_peek"($I10)
    rx1064_cur."!cursor_pos"($I11)
    ($P10) = rx1064_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1064_pos, "")
    rx1064_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1069_done
  rxcap_1069_fail:
    goto rx1064_fail
  rxcap_1069_done:
  # rx subrule "O" subtype=capture negate=
    rx1064_cur."!cursor_pos"(rx1064_pos)
    $P10 = rx1064_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx1064_fail
    rx1064_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1064_pos = $P10."pos"()
  # rx pass
    rx1064_cur."!cursor_pass"(rx1064_pos, "infix:sym<->")
    rx1064_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx1064_pos)
    .return (rx1064_cur)
  rx1064_fail:
.annotate 'line', 423
    (rx1064_rep, rx1064_pos, $I10, $P10) = rx1064_cur."!mark_fail"(0)
    lt rx1064_pos, -1, rx1064_done
    eq rx1064_pos, -1, rx1064_fail
    jump $I10
  rx1064_done:
    rx1064_cur."!cursor_fail"()
    rx1064_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx1064_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("268_1273884026.76819") :method
.annotate 'line', 423
    $P1066 = self."!PREFIX__!subrule"("O", "-")
    new $P1067, "ResizablePMCArray"
    push $P1067, $P1066
    .return ($P1067)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("269_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1071_tgt
    .local int rx1071_pos
    .local int rx1071_off
    .local int rx1071_eos
    .local int rx1071_rep
    .local pmc rx1071_cur
    (rx1071_cur, rx1071_pos, rx1071_tgt) = self."!cursor_start"()
    rx1071_cur."!cursor_debug"("START ", "infix:sym<~>")
    .lex unicode:"$\x{a2}", rx1071_cur
    .local pmc match
    .lex "$/", match
    length rx1071_eos, rx1071_tgt
    set rx1071_off, 0
    lt rx1071_pos, 2, rx1071_start
    sub rx1071_off, rx1071_pos, 1
    substr rx1071_tgt, rx1071_tgt, rx1071_off
  rx1071_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1075_done
    goto rxscan1075_scan
  rxscan1075_loop:
    ($P10) = rx1071_cur."from"()
    inc $P10
    set rx1071_pos, $P10
    ge rx1071_pos, rx1071_eos, rxscan1075_done
  rxscan1075_scan:
    set_addr $I10, rxscan1075_loop
    rx1071_cur."!mark_push"(0, rx1071_pos, $I10)
  rxscan1075_done:
.annotate 'line', 490
  # rx subcapture "sym"
    set_addr $I10, rxcap_1076_fail
    rx1071_cur."!mark_push"(0, rx1071_pos, $I10)
  # rx literal  "~"
    add $I11, rx1071_pos, 1
    gt $I11, rx1071_eos, rx1071_fail
    sub $I11, rx1071_pos, rx1071_off
    substr $S10, rx1071_tgt, $I11, 1
    ne $S10, "~", rx1071_fail
    add rx1071_pos, 1
    set_addr $I10, rxcap_1076_fail
    ($I12, $I11) = rx1071_cur."!mark_peek"($I10)
    rx1071_cur."!cursor_pos"($I11)
    ($P10) = rx1071_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1071_pos, "")
    rx1071_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1076_done
  rxcap_1076_fail:
    goto rx1071_fail
  rxcap_1076_done:
  # rx subrule "O" subtype=capture negate=
    rx1071_cur."!cursor_pos"(rx1071_pos)
    $P10 = rx1071_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx1071_fail
    rx1071_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1071_pos = $P10."pos"()
  # rx pass
    rx1071_cur."!cursor_pass"(rx1071_pos, "infix:sym<~>")
    rx1071_cur."!cursor_debug"("PASS  ", "infix:sym<~>", " at pos=", rx1071_pos)
    .return (rx1071_cur)
  rx1071_fail:
.annotate 'line', 423
    (rx1071_rep, rx1071_pos, $I10, $P10) = rx1071_cur."!mark_fail"(0)
    lt rx1071_pos, -1, rx1071_done
    eq rx1071_pos, -1, rx1071_fail
    jump $I10
  rx1071_done:
    rx1071_cur."!cursor_fail"()
    rx1071_cur."!cursor_debug"("FAIL  ", "infix:sym<~>")
    .return (rx1071_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("270_1273884026.76819") :method
.annotate 'line', 423
    $P1073 = self."!PREFIX__!subrule"("O", "~")
    new $P1074, "ResizablePMCArray"
    push $P1074, $P1073
    .return ($P1074)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("271_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1078_tgt
    .local int rx1078_pos
    .local int rx1078_off
    .local int rx1078_eos
    .local int rx1078_rep
    .local pmc rx1078_cur
    (rx1078_cur, rx1078_pos, rx1078_tgt) = self."!cursor_start"()
    rx1078_cur."!cursor_debug"("START ", "infix:sym<==>")
    .lex unicode:"$\x{a2}", rx1078_cur
    .local pmc match
    .lex "$/", match
    length rx1078_eos, rx1078_tgt
    set rx1078_off, 0
    lt rx1078_pos, 2, rx1078_start
    sub rx1078_off, rx1078_pos, 1
    substr rx1078_tgt, rx1078_tgt, rx1078_off
  rx1078_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1082_done
    goto rxscan1082_scan
  rxscan1082_loop:
    ($P10) = rx1078_cur."from"()
    inc $P10
    set rx1078_pos, $P10
    ge rx1078_pos, rx1078_eos, rxscan1082_done
  rxscan1082_scan:
    set_addr $I10, rxscan1082_loop
    rx1078_cur."!mark_push"(0, rx1078_pos, $I10)
  rxscan1082_done:
.annotate 'line', 492
  # rx subcapture "sym"
    set_addr $I10, rxcap_1083_fail
    rx1078_cur."!mark_push"(0, rx1078_pos, $I10)
  # rx literal  "=="
    add $I11, rx1078_pos, 2
    gt $I11, rx1078_eos, rx1078_fail
    sub $I11, rx1078_pos, rx1078_off
    substr $S10, rx1078_tgt, $I11, 2
    ne $S10, "==", rx1078_fail
    add rx1078_pos, 2
    set_addr $I10, rxcap_1083_fail
    ($I12, $I11) = rx1078_cur."!mark_peek"($I10)
    rx1078_cur."!cursor_pos"($I11)
    ($P10) = rx1078_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1078_pos, "")
    rx1078_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1083_done
  rxcap_1083_fail:
    goto rx1078_fail
  rxcap_1083_done:
  # rx subrule "O" subtype=capture negate=
    rx1078_cur."!cursor_pos"(rx1078_pos)
    $P10 = rx1078_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx1078_fail
    rx1078_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1078_pos = $P10."pos"()
  # rx pass
    rx1078_cur."!cursor_pass"(rx1078_pos, "infix:sym<==>")
    rx1078_cur."!cursor_debug"("PASS  ", "infix:sym<==>", " at pos=", rx1078_pos)
    .return (rx1078_cur)
  rx1078_fail:
.annotate 'line', 423
    (rx1078_rep, rx1078_pos, $I10, $P10) = rx1078_cur."!mark_fail"(0)
    lt rx1078_pos, -1, rx1078_done
    eq rx1078_pos, -1, rx1078_fail
    jump $I10
  rx1078_done:
    rx1078_cur."!cursor_fail"()
    rx1078_cur."!cursor_debug"("FAIL  ", "infix:sym<==>")
    .return (rx1078_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("272_1273884026.76819") :method
.annotate 'line', 423
    $P1080 = self."!PREFIX__!subrule"("O", "==")
    new $P1081, "ResizablePMCArray"
    push $P1081, $P1080
    .return ($P1081)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("273_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1085_tgt
    .local int rx1085_pos
    .local int rx1085_off
    .local int rx1085_eos
    .local int rx1085_rep
    .local pmc rx1085_cur
    (rx1085_cur, rx1085_pos, rx1085_tgt) = self."!cursor_start"()
    rx1085_cur."!cursor_debug"("START ", "infix:sym<!=>")
    .lex unicode:"$\x{a2}", rx1085_cur
    .local pmc match
    .lex "$/", match
    length rx1085_eos, rx1085_tgt
    set rx1085_off, 0
    lt rx1085_pos, 2, rx1085_start
    sub rx1085_off, rx1085_pos, 1
    substr rx1085_tgt, rx1085_tgt, rx1085_off
  rx1085_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1089_done
    goto rxscan1089_scan
  rxscan1089_loop:
    ($P10) = rx1085_cur."from"()
    inc $P10
    set rx1085_pos, $P10
    ge rx1085_pos, rx1085_eos, rxscan1089_done
  rxscan1089_scan:
    set_addr $I10, rxscan1089_loop
    rx1085_cur."!mark_push"(0, rx1085_pos, $I10)
  rxscan1089_done:
.annotate 'line', 493
  # rx subcapture "sym"
    set_addr $I10, rxcap_1090_fail
    rx1085_cur."!mark_push"(0, rx1085_pos, $I10)
  # rx literal  "!="
    add $I11, rx1085_pos, 2
    gt $I11, rx1085_eos, rx1085_fail
    sub $I11, rx1085_pos, rx1085_off
    substr $S10, rx1085_tgt, $I11, 2
    ne $S10, "!=", rx1085_fail
    add rx1085_pos, 2
    set_addr $I10, rxcap_1090_fail
    ($I12, $I11) = rx1085_cur."!mark_peek"($I10)
    rx1085_cur."!cursor_pos"($I11)
    ($P10) = rx1085_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1085_pos, "")
    rx1085_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1090_done
  rxcap_1090_fail:
    goto rx1085_fail
  rxcap_1090_done:
  # rx subrule "O" subtype=capture negate=
    rx1085_cur."!cursor_pos"(rx1085_pos)
    $P10 = rx1085_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx1085_fail
    rx1085_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1085_pos = $P10."pos"()
  # rx pass
    rx1085_cur."!cursor_pass"(rx1085_pos, "infix:sym<!=>")
    rx1085_cur."!cursor_debug"("PASS  ", "infix:sym<!=>", " at pos=", rx1085_pos)
    .return (rx1085_cur)
  rx1085_fail:
.annotate 'line', 423
    (rx1085_rep, rx1085_pos, $I10, $P10) = rx1085_cur."!mark_fail"(0)
    lt rx1085_pos, -1, rx1085_done
    eq rx1085_pos, -1, rx1085_fail
    jump $I10
  rx1085_done:
    rx1085_cur."!cursor_fail"()
    rx1085_cur."!cursor_debug"("FAIL  ", "infix:sym<!=>")
    .return (rx1085_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("274_1273884026.76819") :method
.annotate 'line', 423
    $P1087 = self."!PREFIX__!subrule"("O", "!=")
    new $P1088, "ResizablePMCArray"
    push $P1088, $P1087
    .return ($P1088)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("275_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1092_tgt
    .local int rx1092_pos
    .local int rx1092_off
    .local int rx1092_eos
    .local int rx1092_rep
    .local pmc rx1092_cur
    (rx1092_cur, rx1092_pos, rx1092_tgt) = self."!cursor_start"()
    rx1092_cur."!cursor_debug"("START ", "infix:sym<<=>")
    .lex unicode:"$\x{a2}", rx1092_cur
    .local pmc match
    .lex "$/", match
    length rx1092_eos, rx1092_tgt
    set rx1092_off, 0
    lt rx1092_pos, 2, rx1092_start
    sub rx1092_off, rx1092_pos, 1
    substr rx1092_tgt, rx1092_tgt, rx1092_off
  rx1092_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1096_done
    goto rxscan1096_scan
  rxscan1096_loop:
    ($P10) = rx1092_cur."from"()
    inc $P10
    set rx1092_pos, $P10
    ge rx1092_pos, rx1092_eos, rxscan1096_done
  rxscan1096_scan:
    set_addr $I10, rxscan1096_loop
    rx1092_cur."!mark_push"(0, rx1092_pos, $I10)
  rxscan1096_done:
.annotate 'line', 494
  # rx subcapture "sym"
    set_addr $I10, rxcap_1097_fail
    rx1092_cur."!mark_push"(0, rx1092_pos, $I10)
  # rx literal  "<="
    add $I11, rx1092_pos, 2
    gt $I11, rx1092_eos, rx1092_fail
    sub $I11, rx1092_pos, rx1092_off
    substr $S10, rx1092_tgt, $I11, 2
    ne $S10, "<=", rx1092_fail
    add rx1092_pos, 2
    set_addr $I10, rxcap_1097_fail
    ($I12, $I11) = rx1092_cur."!mark_peek"($I10)
    rx1092_cur."!cursor_pos"($I11)
    ($P10) = rx1092_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1092_pos, "")
    rx1092_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1097_done
  rxcap_1097_fail:
    goto rx1092_fail
  rxcap_1097_done:
  # rx subrule "O" subtype=capture negate=
    rx1092_cur."!cursor_pos"(rx1092_pos)
    $P10 = rx1092_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx1092_fail
    rx1092_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1092_pos = $P10."pos"()
  # rx pass
    rx1092_cur."!cursor_pass"(rx1092_pos, "infix:sym<<=>")
    rx1092_cur."!cursor_debug"("PASS  ", "infix:sym<<=>", " at pos=", rx1092_pos)
    .return (rx1092_cur)
  rx1092_fail:
.annotate 'line', 423
    (rx1092_rep, rx1092_pos, $I10, $P10) = rx1092_cur."!mark_fail"(0)
    lt rx1092_pos, -1, rx1092_done
    eq rx1092_pos, -1, rx1092_fail
    jump $I10
  rx1092_done:
    rx1092_cur."!cursor_fail"()
    rx1092_cur."!cursor_debug"("FAIL  ", "infix:sym<<=>")
    .return (rx1092_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("276_1273884026.76819") :method
.annotate 'line', 423
    $P1094 = self."!PREFIX__!subrule"("O", "<=")
    new $P1095, "ResizablePMCArray"
    push $P1095, $P1094
    .return ($P1095)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("277_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1099_tgt
    .local int rx1099_pos
    .local int rx1099_off
    .local int rx1099_eos
    .local int rx1099_rep
    .local pmc rx1099_cur
    (rx1099_cur, rx1099_pos, rx1099_tgt) = self."!cursor_start"()
    rx1099_cur."!cursor_debug"("START ", "infix:sym<>=>")
    .lex unicode:"$\x{a2}", rx1099_cur
    .local pmc match
    .lex "$/", match
    length rx1099_eos, rx1099_tgt
    set rx1099_off, 0
    lt rx1099_pos, 2, rx1099_start
    sub rx1099_off, rx1099_pos, 1
    substr rx1099_tgt, rx1099_tgt, rx1099_off
  rx1099_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1103_done
    goto rxscan1103_scan
  rxscan1103_loop:
    ($P10) = rx1099_cur."from"()
    inc $P10
    set rx1099_pos, $P10
    ge rx1099_pos, rx1099_eos, rxscan1103_done
  rxscan1103_scan:
    set_addr $I10, rxscan1103_loop
    rx1099_cur."!mark_push"(0, rx1099_pos, $I10)
  rxscan1103_done:
.annotate 'line', 495
  # rx subcapture "sym"
    set_addr $I10, rxcap_1104_fail
    rx1099_cur."!mark_push"(0, rx1099_pos, $I10)
  # rx literal  ">="
    add $I11, rx1099_pos, 2
    gt $I11, rx1099_eos, rx1099_fail
    sub $I11, rx1099_pos, rx1099_off
    substr $S10, rx1099_tgt, $I11, 2
    ne $S10, ">=", rx1099_fail
    add rx1099_pos, 2
    set_addr $I10, rxcap_1104_fail
    ($I12, $I11) = rx1099_cur."!mark_peek"($I10)
    rx1099_cur."!cursor_pos"($I11)
    ($P10) = rx1099_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1099_pos, "")
    rx1099_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1104_done
  rxcap_1104_fail:
    goto rx1099_fail
  rxcap_1104_done:
  # rx subrule "O" subtype=capture negate=
    rx1099_cur."!cursor_pos"(rx1099_pos)
    $P10 = rx1099_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx1099_fail
    rx1099_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1099_pos = $P10."pos"()
  # rx pass
    rx1099_cur."!cursor_pass"(rx1099_pos, "infix:sym<>=>")
    rx1099_cur."!cursor_debug"("PASS  ", "infix:sym<>=>", " at pos=", rx1099_pos)
    .return (rx1099_cur)
  rx1099_fail:
.annotate 'line', 423
    (rx1099_rep, rx1099_pos, $I10, $P10) = rx1099_cur."!mark_fail"(0)
    lt rx1099_pos, -1, rx1099_done
    eq rx1099_pos, -1, rx1099_fail
    jump $I10
  rx1099_done:
    rx1099_cur."!cursor_fail"()
    rx1099_cur."!cursor_debug"("FAIL  ", "infix:sym<>=>")
    .return (rx1099_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("278_1273884026.76819") :method
.annotate 'line', 423
    $P1101 = self."!PREFIX__!subrule"("O", ">=")
    new $P1102, "ResizablePMCArray"
    push $P1102, $P1101
    .return ($P1102)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("279_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1106_tgt
    .local int rx1106_pos
    .local int rx1106_off
    .local int rx1106_eos
    .local int rx1106_rep
    .local pmc rx1106_cur
    (rx1106_cur, rx1106_pos, rx1106_tgt) = self."!cursor_start"()
    rx1106_cur."!cursor_debug"("START ", "infix:sym<<>")
    .lex unicode:"$\x{a2}", rx1106_cur
    .local pmc match
    .lex "$/", match
    length rx1106_eos, rx1106_tgt
    set rx1106_off, 0
    lt rx1106_pos, 2, rx1106_start
    sub rx1106_off, rx1106_pos, 1
    substr rx1106_tgt, rx1106_tgt, rx1106_off
  rx1106_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1110_done
    goto rxscan1110_scan
  rxscan1110_loop:
    ($P10) = rx1106_cur."from"()
    inc $P10
    set rx1106_pos, $P10
    ge rx1106_pos, rx1106_eos, rxscan1110_done
  rxscan1110_scan:
    set_addr $I10, rxscan1110_loop
    rx1106_cur."!mark_push"(0, rx1106_pos, $I10)
  rxscan1110_done:
.annotate 'line', 496
  # rx subcapture "sym"
    set_addr $I10, rxcap_1111_fail
    rx1106_cur."!mark_push"(0, rx1106_pos, $I10)
  # rx literal  "<"
    add $I11, rx1106_pos, 1
    gt $I11, rx1106_eos, rx1106_fail
    sub $I11, rx1106_pos, rx1106_off
    substr $S10, rx1106_tgt, $I11, 1
    ne $S10, "<", rx1106_fail
    add rx1106_pos, 1
    set_addr $I10, rxcap_1111_fail
    ($I12, $I11) = rx1106_cur."!mark_peek"($I10)
    rx1106_cur."!cursor_pos"($I11)
    ($P10) = rx1106_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1106_pos, "")
    rx1106_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1111_done
  rxcap_1111_fail:
    goto rx1106_fail
  rxcap_1111_done:
  # rx subrule "O" subtype=capture negate=
    rx1106_cur."!cursor_pos"(rx1106_pos)
    $P10 = rx1106_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx1106_fail
    rx1106_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1106_pos = $P10."pos"()
  # rx pass
    rx1106_cur."!cursor_pass"(rx1106_pos, "infix:sym<<>")
    rx1106_cur."!cursor_debug"("PASS  ", "infix:sym<<>", " at pos=", rx1106_pos)
    .return (rx1106_cur)
  rx1106_fail:
.annotate 'line', 423
    (rx1106_rep, rx1106_pos, $I10, $P10) = rx1106_cur."!mark_fail"(0)
    lt rx1106_pos, -1, rx1106_done
    eq rx1106_pos, -1, rx1106_fail
    jump $I10
  rx1106_done:
    rx1106_cur."!cursor_fail"()
    rx1106_cur."!cursor_debug"("FAIL  ", "infix:sym<<>")
    .return (rx1106_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("280_1273884026.76819") :method
.annotate 'line', 423
    $P1108 = self."!PREFIX__!subrule"("O", "<")
    new $P1109, "ResizablePMCArray"
    push $P1109, $P1108
    .return ($P1109)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("281_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1113_tgt
    .local int rx1113_pos
    .local int rx1113_off
    .local int rx1113_eos
    .local int rx1113_rep
    .local pmc rx1113_cur
    (rx1113_cur, rx1113_pos, rx1113_tgt) = self."!cursor_start"()
    rx1113_cur."!cursor_debug"("START ", "infix:sym<>>")
    .lex unicode:"$\x{a2}", rx1113_cur
    .local pmc match
    .lex "$/", match
    length rx1113_eos, rx1113_tgt
    set rx1113_off, 0
    lt rx1113_pos, 2, rx1113_start
    sub rx1113_off, rx1113_pos, 1
    substr rx1113_tgt, rx1113_tgt, rx1113_off
  rx1113_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1117_done
    goto rxscan1117_scan
  rxscan1117_loop:
    ($P10) = rx1113_cur."from"()
    inc $P10
    set rx1113_pos, $P10
    ge rx1113_pos, rx1113_eos, rxscan1117_done
  rxscan1117_scan:
    set_addr $I10, rxscan1117_loop
    rx1113_cur."!mark_push"(0, rx1113_pos, $I10)
  rxscan1117_done:
.annotate 'line', 497
  # rx subcapture "sym"
    set_addr $I10, rxcap_1118_fail
    rx1113_cur."!mark_push"(0, rx1113_pos, $I10)
  # rx literal  ">"
    add $I11, rx1113_pos, 1
    gt $I11, rx1113_eos, rx1113_fail
    sub $I11, rx1113_pos, rx1113_off
    substr $S10, rx1113_tgt, $I11, 1
    ne $S10, ">", rx1113_fail
    add rx1113_pos, 1
    set_addr $I10, rxcap_1118_fail
    ($I12, $I11) = rx1113_cur."!mark_peek"($I10)
    rx1113_cur."!cursor_pos"($I11)
    ($P10) = rx1113_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1113_pos, "")
    rx1113_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1118_done
  rxcap_1118_fail:
    goto rx1113_fail
  rxcap_1118_done:
  # rx subrule "O" subtype=capture negate=
    rx1113_cur."!cursor_pos"(rx1113_pos)
    $P10 = rx1113_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx1113_fail
    rx1113_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1113_pos = $P10."pos"()
  # rx pass
    rx1113_cur."!cursor_pass"(rx1113_pos, "infix:sym<>>")
    rx1113_cur."!cursor_debug"("PASS  ", "infix:sym<>>", " at pos=", rx1113_pos)
    .return (rx1113_cur)
  rx1113_fail:
.annotate 'line', 423
    (rx1113_rep, rx1113_pos, $I10, $P10) = rx1113_cur."!mark_fail"(0)
    lt rx1113_pos, -1, rx1113_done
    eq rx1113_pos, -1, rx1113_fail
    jump $I10
  rx1113_done:
    rx1113_cur."!cursor_fail"()
    rx1113_cur."!cursor_debug"("FAIL  ", "infix:sym<>>")
    .return (rx1113_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("282_1273884026.76819") :method
.annotate 'line', 423
    $P1115 = self."!PREFIX__!subrule"("O", ">")
    new $P1116, "ResizablePMCArray"
    push $P1116, $P1115
    .return ($P1116)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("283_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1120_tgt
    .local int rx1120_pos
    .local int rx1120_off
    .local int rx1120_eos
    .local int rx1120_rep
    .local pmc rx1120_cur
    (rx1120_cur, rx1120_pos, rx1120_tgt) = self."!cursor_start"()
    rx1120_cur."!cursor_debug"("START ", "infix:sym<eq>")
    .lex unicode:"$\x{a2}", rx1120_cur
    .local pmc match
    .lex "$/", match
    length rx1120_eos, rx1120_tgt
    set rx1120_off, 0
    lt rx1120_pos, 2, rx1120_start
    sub rx1120_off, rx1120_pos, 1
    substr rx1120_tgt, rx1120_tgt, rx1120_off
  rx1120_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1124_done
    goto rxscan1124_scan
  rxscan1124_loop:
    ($P10) = rx1120_cur."from"()
    inc $P10
    set rx1120_pos, $P10
    ge rx1120_pos, rx1120_eos, rxscan1124_done
  rxscan1124_scan:
    set_addr $I10, rxscan1124_loop
    rx1120_cur."!mark_push"(0, rx1120_pos, $I10)
  rxscan1124_done:
.annotate 'line', 498
  # rx subcapture "sym"
    set_addr $I10, rxcap_1125_fail
    rx1120_cur."!mark_push"(0, rx1120_pos, $I10)
  # rx literal  "eq"
    add $I11, rx1120_pos, 2
    gt $I11, rx1120_eos, rx1120_fail
    sub $I11, rx1120_pos, rx1120_off
    substr $S10, rx1120_tgt, $I11, 2
    ne $S10, "eq", rx1120_fail
    add rx1120_pos, 2
    set_addr $I10, rxcap_1125_fail
    ($I12, $I11) = rx1120_cur."!mark_peek"($I10)
    rx1120_cur."!cursor_pos"($I11)
    ($P10) = rx1120_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1120_pos, "")
    rx1120_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1125_done
  rxcap_1125_fail:
    goto rx1120_fail
  rxcap_1125_done:
  # rx subrule "O" subtype=capture negate=
    rx1120_cur."!cursor_pos"(rx1120_pos)
    $P10 = rx1120_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx1120_fail
    rx1120_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1120_pos = $P10."pos"()
  # rx pass
    rx1120_cur."!cursor_pass"(rx1120_pos, "infix:sym<eq>")
    rx1120_cur."!cursor_debug"("PASS  ", "infix:sym<eq>", " at pos=", rx1120_pos)
    .return (rx1120_cur)
  rx1120_fail:
.annotate 'line', 423
    (rx1120_rep, rx1120_pos, $I10, $P10) = rx1120_cur."!mark_fail"(0)
    lt rx1120_pos, -1, rx1120_done
    eq rx1120_pos, -1, rx1120_fail
    jump $I10
  rx1120_done:
    rx1120_cur."!cursor_fail"()
    rx1120_cur."!cursor_debug"("FAIL  ", "infix:sym<eq>")
    .return (rx1120_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("284_1273884026.76819") :method
.annotate 'line', 423
    $P1122 = self."!PREFIX__!subrule"("O", "eq")
    new $P1123, "ResizablePMCArray"
    push $P1123, $P1122
    .return ($P1123)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("285_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1127_tgt
    .local int rx1127_pos
    .local int rx1127_off
    .local int rx1127_eos
    .local int rx1127_rep
    .local pmc rx1127_cur
    (rx1127_cur, rx1127_pos, rx1127_tgt) = self."!cursor_start"()
    rx1127_cur."!cursor_debug"("START ", "infix:sym<ne>")
    .lex unicode:"$\x{a2}", rx1127_cur
    .local pmc match
    .lex "$/", match
    length rx1127_eos, rx1127_tgt
    set rx1127_off, 0
    lt rx1127_pos, 2, rx1127_start
    sub rx1127_off, rx1127_pos, 1
    substr rx1127_tgt, rx1127_tgt, rx1127_off
  rx1127_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1131_done
    goto rxscan1131_scan
  rxscan1131_loop:
    ($P10) = rx1127_cur."from"()
    inc $P10
    set rx1127_pos, $P10
    ge rx1127_pos, rx1127_eos, rxscan1131_done
  rxscan1131_scan:
    set_addr $I10, rxscan1131_loop
    rx1127_cur."!mark_push"(0, rx1127_pos, $I10)
  rxscan1131_done:
.annotate 'line', 499
  # rx subcapture "sym"
    set_addr $I10, rxcap_1132_fail
    rx1127_cur."!mark_push"(0, rx1127_pos, $I10)
  # rx literal  "ne"
    add $I11, rx1127_pos, 2
    gt $I11, rx1127_eos, rx1127_fail
    sub $I11, rx1127_pos, rx1127_off
    substr $S10, rx1127_tgt, $I11, 2
    ne $S10, "ne", rx1127_fail
    add rx1127_pos, 2
    set_addr $I10, rxcap_1132_fail
    ($I12, $I11) = rx1127_cur."!mark_peek"($I10)
    rx1127_cur."!cursor_pos"($I11)
    ($P10) = rx1127_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1127_pos, "")
    rx1127_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1132_done
  rxcap_1132_fail:
    goto rx1127_fail
  rxcap_1132_done:
  # rx subrule "O" subtype=capture negate=
    rx1127_cur."!cursor_pos"(rx1127_pos)
    $P10 = rx1127_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx1127_fail
    rx1127_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1127_pos = $P10."pos"()
  # rx pass
    rx1127_cur."!cursor_pass"(rx1127_pos, "infix:sym<ne>")
    rx1127_cur."!cursor_debug"("PASS  ", "infix:sym<ne>", " at pos=", rx1127_pos)
    .return (rx1127_cur)
  rx1127_fail:
.annotate 'line', 423
    (rx1127_rep, rx1127_pos, $I10, $P10) = rx1127_cur."!mark_fail"(0)
    lt rx1127_pos, -1, rx1127_done
    eq rx1127_pos, -1, rx1127_fail
    jump $I10
  rx1127_done:
    rx1127_cur."!cursor_fail"()
    rx1127_cur."!cursor_debug"("FAIL  ", "infix:sym<ne>")
    .return (rx1127_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("286_1273884026.76819") :method
.annotate 'line', 423
    $P1129 = self."!PREFIX__!subrule"("O", "ne")
    new $P1130, "ResizablePMCArray"
    push $P1130, $P1129
    .return ($P1130)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("287_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1134_tgt
    .local int rx1134_pos
    .local int rx1134_off
    .local int rx1134_eos
    .local int rx1134_rep
    .local pmc rx1134_cur
    (rx1134_cur, rx1134_pos, rx1134_tgt) = self."!cursor_start"()
    rx1134_cur."!cursor_debug"("START ", "infix:sym<le>")
    .lex unicode:"$\x{a2}", rx1134_cur
    .local pmc match
    .lex "$/", match
    length rx1134_eos, rx1134_tgt
    set rx1134_off, 0
    lt rx1134_pos, 2, rx1134_start
    sub rx1134_off, rx1134_pos, 1
    substr rx1134_tgt, rx1134_tgt, rx1134_off
  rx1134_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1138_done
    goto rxscan1138_scan
  rxscan1138_loop:
    ($P10) = rx1134_cur."from"()
    inc $P10
    set rx1134_pos, $P10
    ge rx1134_pos, rx1134_eos, rxscan1138_done
  rxscan1138_scan:
    set_addr $I10, rxscan1138_loop
    rx1134_cur."!mark_push"(0, rx1134_pos, $I10)
  rxscan1138_done:
.annotate 'line', 500
  # rx subcapture "sym"
    set_addr $I10, rxcap_1139_fail
    rx1134_cur."!mark_push"(0, rx1134_pos, $I10)
  # rx literal  "le"
    add $I11, rx1134_pos, 2
    gt $I11, rx1134_eos, rx1134_fail
    sub $I11, rx1134_pos, rx1134_off
    substr $S10, rx1134_tgt, $I11, 2
    ne $S10, "le", rx1134_fail
    add rx1134_pos, 2
    set_addr $I10, rxcap_1139_fail
    ($I12, $I11) = rx1134_cur."!mark_peek"($I10)
    rx1134_cur."!cursor_pos"($I11)
    ($P10) = rx1134_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1134_pos, "")
    rx1134_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1139_done
  rxcap_1139_fail:
    goto rx1134_fail
  rxcap_1139_done:
  # rx subrule "O" subtype=capture negate=
    rx1134_cur."!cursor_pos"(rx1134_pos)
    $P10 = rx1134_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx1134_fail
    rx1134_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1134_pos = $P10."pos"()
  # rx pass
    rx1134_cur."!cursor_pass"(rx1134_pos, "infix:sym<le>")
    rx1134_cur."!cursor_debug"("PASS  ", "infix:sym<le>", " at pos=", rx1134_pos)
    .return (rx1134_cur)
  rx1134_fail:
.annotate 'line', 423
    (rx1134_rep, rx1134_pos, $I10, $P10) = rx1134_cur."!mark_fail"(0)
    lt rx1134_pos, -1, rx1134_done
    eq rx1134_pos, -1, rx1134_fail
    jump $I10
  rx1134_done:
    rx1134_cur."!cursor_fail"()
    rx1134_cur."!cursor_debug"("FAIL  ", "infix:sym<le>")
    .return (rx1134_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("288_1273884026.76819") :method
.annotate 'line', 423
    $P1136 = self."!PREFIX__!subrule"("O", "le")
    new $P1137, "ResizablePMCArray"
    push $P1137, $P1136
    .return ($P1137)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("289_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1141_tgt
    .local int rx1141_pos
    .local int rx1141_off
    .local int rx1141_eos
    .local int rx1141_rep
    .local pmc rx1141_cur
    (rx1141_cur, rx1141_pos, rx1141_tgt) = self."!cursor_start"()
    rx1141_cur."!cursor_debug"("START ", "infix:sym<ge>")
    .lex unicode:"$\x{a2}", rx1141_cur
    .local pmc match
    .lex "$/", match
    length rx1141_eos, rx1141_tgt
    set rx1141_off, 0
    lt rx1141_pos, 2, rx1141_start
    sub rx1141_off, rx1141_pos, 1
    substr rx1141_tgt, rx1141_tgt, rx1141_off
  rx1141_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1145_done
    goto rxscan1145_scan
  rxscan1145_loop:
    ($P10) = rx1141_cur."from"()
    inc $P10
    set rx1141_pos, $P10
    ge rx1141_pos, rx1141_eos, rxscan1145_done
  rxscan1145_scan:
    set_addr $I10, rxscan1145_loop
    rx1141_cur."!mark_push"(0, rx1141_pos, $I10)
  rxscan1145_done:
.annotate 'line', 501
  # rx subcapture "sym"
    set_addr $I10, rxcap_1146_fail
    rx1141_cur."!mark_push"(0, rx1141_pos, $I10)
  # rx literal  "ge"
    add $I11, rx1141_pos, 2
    gt $I11, rx1141_eos, rx1141_fail
    sub $I11, rx1141_pos, rx1141_off
    substr $S10, rx1141_tgt, $I11, 2
    ne $S10, "ge", rx1141_fail
    add rx1141_pos, 2
    set_addr $I10, rxcap_1146_fail
    ($I12, $I11) = rx1141_cur."!mark_peek"($I10)
    rx1141_cur."!cursor_pos"($I11)
    ($P10) = rx1141_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1141_pos, "")
    rx1141_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1146_done
  rxcap_1146_fail:
    goto rx1141_fail
  rxcap_1146_done:
  # rx subrule "O" subtype=capture negate=
    rx1141_cur."!cursor_pos"(rx1141_pos)
    $P10 = rx1141_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx1141_fail
    rx1141_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1141_pos = $P10."pos"()
  # rx pass
    rx1141_cur."!cursor_pass"(rx1141_pos, "infix:sym<ge>")
    rx1141_cur."!cursor_debug"("PASS  ", "infix:sym<ge>", " at pos=", rx1141_pos)
    .return (rx1141_cur)
  rx1141_fail:
.annotate 'line', 423
    (rx1141_rep, rx1141_pos, $I10, $P10) = rx1141_cur."!mark_fail"(0)
    lt rx1141_pos, -1, rx1141_done
    eq rx1141_pos, -1, rx1141_fail
    jump $I10
  rx1141_done:
    rx1141_cur."!cursor_fail"()
    rx1141_cur."!cursor_debug"("FAIL  ", "infix:sym<ge>")
    .return (rx1141_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("290_1273884026.76819") :method
.annotate 'line', 423
    $P1143 = self."!PREFIX__!subrule"("O", "ge")
    new $P1144, "ResizablePMCArray"
    push $P1144, $P1143
    .return ($P1144)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("291_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1148_tgt
    .local int rx1148_pos
    .local int rx1148_off
    .local int rx1148_eos
    .local int rx1148_rep
    .local pmc rx1148_cur
    (rx1148_cur, rx1148_pos, rx1148_tgt) = self."!cursor_start"()
    rx1148_cur."!cursor_debug"("START ", "infix:sym<lt>")
    .lex unicode:"$\x{a2}", rx1148_cur
    .local pmc match
    .lex "$/", match
    length rx1148_eos, rx1148_tgt
    set rx1148_off, 0
    lt rx1148_pos, 2, rx1148_start
    sub rx1148_off, rx1148_pos, 1
    substr rx1148_tgt, rx1148_tgt, rx1148_off
  rx1148_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1152_done
    goto rxscan1152_scan
  rxscan1152_loop:
    ($P10) = rx1148_cur."from"()
    inc $P10
    set rx1148_pos, $P10
    ge rx1148_pos, rx1148_eos, rxscan1152_done
  rxscan1152_scan:
    set_addr $I10, rxscan1152_loop
    rx1148_cur."!mark_push"(0, rx1148_pos, $I10)
  rxscan1152_done:
.annotate 'line', 502
  # rx subcapture "sym"
    set_addr $I10, rxcap_1153_fail
    rx1148_cur."!mark_push"(0, rx1148_pos, $I10)
  # rx literal  "lt"
    add $I11, rx1148_pos, 2
    gt $I11, rx1148_eos, rx1148_fail
    sub $I11, rx1148_pos, rx1148_off
    substr $S10, rx1148_tgt, $I11, 2
    ne $S10, "lt", rx1148_fail
    add rx1148_pos, 2
    set_addr $I10, rxcap_1153_fail
    ($I12, $I11) = rx1148_cur."!mark_peek"($I10)
    rx1148_cur."!cursor_pos"($I11)
    ($P10) = rx1148_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1148_pos, "")
    rx1148_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1153_done
  rxcap_1153_fail:
    goto rx1148_fail
  rxcap_1153_done:
  # rx subrule "O" subtype=capture negate=
    rx1148_cur."!cursor_pos"(rx1148_pos)
    $P10 = rx1148_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx1148_fail
    rx1148_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1148_pos = $P10."pos"()
  # rx pass
    rx1148_cur."!cursor_pass"(rx1148_pos, "infix:sym<lt>")
    rx1148_cur."!cursor_debug"("PASS  ", "infix:sym<lt>", " at pos=", rx1148_pos)
    .return (rx1148_cur)
  rx1148_fail:
.annotate 'line', 423
    (rx1148_rep, rx1148_pos, $I10, $P10) = rx1148_cur."!mark_fail"(0)
    lt rx1148_pos, -1, rx1148_done
    eq rx1148_pos, -1, rx1148_fail
    jump $I10
  rx1148_done:
    rx1148_cur."!cursor_fail"()
    rx1148_cur."!cursor_debug"("FAIL  ", "infix:sym<lt>")
    .return (rx1148_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("292_1273884026.76819") :method
.annotate 'line', 423
    $P1150 = self."!PREFIX__!subrule"("O", "lt")
    new $P1151, "ResizablePMCArray"
    push $P1151, $P1150
    .return ($P1151)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("293_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1155_tgt
    .local int rx1155_pos
    .local int rx1155_off
    .local int rx1155_eos
    .local int rx1155_rep
    .local pmc rx1155_cur
    (rx1155_cur, rx1155_pos, rx1155_tgt) = self."!cursor_start"()
    rx1155_cur."!cursor_debug"("START ", "infix:sym<gt>")
    .lex unicode:"$\x{a2}", rx1155_cur
    .local pmc match
    .lex "$/", match
    length rx1155_eos, rx1155_tgt
    set rx1155_off, 0
    lt rx1155_pos, 2, rx1155_start
    sub rx1155_off, rx1155_pos, 1
    substr rx1155_tgt, rx1155_tgt, rx1155_off
  rx1155_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1159_done
    goto rxscan1159_scan
  rxscan1159_loop:
    ($P10) = rx1155_cur."from"()
    inc $P10
    set rx1155_pos, $P10
    ge rx1155_pos, rx1155_eos, rxscan1159_done
  rxscan1159_scan:
    set_addr $I10, rxscan1159_loop
    rx1155_cur."!mark_push"(0, rx1155_pos, $I10)
  rxscan1159_done:
.annotate 'line', 503
  # rx subcapture "sym"
    set_addr $I10, rxcap_1160_fail
    rx1155_cur."!mark_push"(0, rx1155_pos, $I10)
  # rx literal  "gt"
    add $I11, rx1155_pos, 2
    gt $I11, rx1155_eos, rx1155_fail
    sub $I11, rx1155_pos, rx1155_off
    substr $S10, rx1155_tgt, $I11, 2
    ne $S10, "gt", rx1155_fail
    add rx1155_pos, 2
    set_addr $I10, rxcap_1160_fail
    ($I12, $I11) = rx1155_cur."!mark_peek"($I10)
    rx1155_cur."!cursor_pos"($I11)
    ($P10) = rx1155_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1155_pos, "")
    rx1155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1160_done
  rxcap_1160_fail:
    goto rx1155_fail
  rxcap_1160_done:
  # rx subrule "O" subtype=capture negate=
    rx1155_cur."!cursor_pos"(rx1155_pos)
    $P10 = rx1155_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx1155_fail
    rx1155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1155_pos = $P10."pos"()
  # rx pass
    rx1155_cur."!cursor_pass"(rx1155_pos, "infix:sym<gt>")
    rx1155_cur."!cursor_debug"("PASS  ", "infix:sym<gt>", " at pos=", rx1155_pos)
    .return (rx1155_cur)
  rx1155_fail:
.annotate 'line', 423
    (rx1155_rep, rx1155_pos, $I10, $P10) = rx1155_cur."!mark_fail"(0)
    lt rx1155_pos, -1, rx1155_done
    eq rx1155_pos, -1, rx1155_fail
    jump $I10
  rx1155_done:
    rx1155_cur."!cursor_fail"()
    rx1155_cur."!cursor_debug"("FAIL  ", "infix:sym<gt>")
    .return (rx1155_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("294_1273884026.76819") :method
.annotate 'line', 423
    $P1157 = self."!PREFIX__!subrule"("O", "gt")
    new $P1158, "ResizablePMCArray"
    push $P1158, $P1157
    .return ($P1158)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("295_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1162_tgt
    .local int rx1162_pos
    .local int rx1162_off
    .local int rx1162_eos
    .local int rx1162_rep
    .local pmc rx1162_cur
    (rx1162_cur, rx1162_pos, rx1162_tgt) = self."!cursor_start"()
    rx1162_cur."!cursor_debug"("START ", "infix:sym<=:=>")
    .lex unicode:"$\x{a2}", rx1162_cur
    .local pmc match
    .lex "$/", match
    length rx1162_eos, rx1162_tgt
    set rx1162_off, 0
    lt rx1162_pos, 2, rx1162_start
    sub rx1162_off, rx1162_pos, 1
    substr rx1162_tgt, rx1162_tgt, rx1162_off
  rx1162_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1166_done
    goto rxscan1166_scan
  rxscan1166_loop:
    ($P10) = rx1162_cur."from"()
    inc $P10
    set rx1162_pos, $P10
    ge rx1162_pos, rx1162_eos, rxscan1166_done
  rxscan1166_scan:
    set_addr $I10, rxscan1166_loop
    rx1162_cur."!mark_push"(0, rx1162_pos, $I10)
  rxscan1166_done:
.annotate 'line', 504
  # rx subcapture "sym"
    set_addr $I10, rxcap_1167_fail
    rx1162_cur."!mark_push"(0, rx1162_pos, $I10)
  # rx literal  "=:="
    add $I11, rx1162_pos, 3
    gt $I11, rx1162_eos, rx1162_fail
    sub $I11, rx1162_pos, rx1162_off
    substr $S10, rx1162_tgt, $I11, 3
    ne $S10, "=:=", rx1162_fail
    add rx1162_pos, 3
    set_addr $I10, rxcap_1167_fail
    ($I12, $I11) = rx1162_cur."!mark_peek"($I10)
    rx1162_cur."!cursor_pos"($I11)
    ($P10) = rx1162_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1162_pos, "")
    rx1162_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1167_done
  rxcap_1167_fail:
    goto rx1162_fail
  rxcap_1167_done:
  # rx subrule "O" subtype=capture negate=
    rx1162_cur."!cursor_pos"(rx1162_pos)
    $P10 = rx1162_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx1162_fail
    rx1162_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1162_pos = $P10."pos"()
  # rx pass
    rx1162_cur."!cursor_pass"(rx1162_pos, "infix:sym<=:=>")
    rx1162_cur."!cursor_debug"("PASS  ", "infix:sym<=:=>", " at pos=", rx1162_pos)
    .return (rx1162_cur)
  rx1162_fail:
.annotate 'line', 423
    (rx1162_rep, rx1162_pos, $I10, $P10) = rx1162_cur."!mark_fail"(0)
    lt rx1162_pos, -1, rx1162_done
    eq rx1162_pos, -1, rx1162_fail
    jump $I10
  rx1162_done:
    rx1162_cur."!cursor_fail"()
    rx1162_cur."!cursor_debug"("FAIL  ", "infix:sym<=:=>")
    .return (rx1162_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("296_1273884026.76819") :method
.annotate 'line', 423
    $P1164 = self."!PREFIX__!subrule"("O", "=:=")
    new $P1165, "ResizablePMCArray"
    push $P1165, $P1164
    .return ($P1165)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~~>"  :subid("297_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1169_tgt
    .local int rx1169_pos
    .local int rx1169_off
    .local int rx1169_eos
    .local int rx1169_rep
    .local pmc rx1169_cur
    (rx1169_cur, rx1169_pos, rx1169_tgt) = self."!cursor_start"()
    rx1169_cur."!cursor_debug"("START ", "infix:sym<~~>")
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
    ne $I10, -1, rxscan1173_done
    goto rxscan1173_scan
  rxscan1173_loop:
    ($P10) = rx1169_cur."from"()
    inc $P10
    set rx1169_pos, $P10
    ge rx1169_pos, rx1169_eos, rxscan1173_done
  rxscan1173_scan:
    set_addr $I10, rxscan1173_loop
    rx1169_cur."!mark_push"(0, rx1169_pos, $I10)
  rxscan1173_done:
.annotate 'line', 505
  # rx subcapture "sym"
    set_addr $I10, rxcap_1174_fail
    rx1169_cur."!mark_push"(0, rx1169_pos, $I10)
  # rx literal  "~~"
    add $I11, rx1169_pos, 2
    gt $I11, rx1169_eos, rx1169_fail
    sub $I11, rx1169_pos, rx1169_off
    substr $S10, rx1169_tgt, $I11, 2
    ne $S10, "~~", rx1169_fail
    add rx1169_pos, 2
    set_addr $I10, rxcap_1174_fail
    ($I12, $I11) = rx1169_cur."!mark_peek"($I10)
    rx1169_cur."!cursor_pos"($I11)
    ($P10) = rx1169_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1169_pos, "")
    rx1169_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1174_done
  rxcap_1174_fail:
    goto rx1169_fail
  rxcap_1174_done:
  # rx subrule "O" subtype=capture negate=
    rx1169_cur."!cursor_pos"(rx1169_pos)
    $P10 = rx1169_cur."O"("%relational, :reducecheck<smartmatch>")
    unless $P10, rx1169_fail
    rx1169_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1169_pos = $P10."pos"()
  # rx pass
    rx1169_cur."!cursor_pass"(rx1169_pos, "infix:sym<~~>")
    rx1169_cur."!cursor_debug"("PASS  ", "infix:sym<~~>", " at pos=", rx1169_pos)
    .return (rx1169_cur)
  rx1169_fail:
.annotate 'line', 423
    (rx1169_rep, rx1169_pos, $I10, $P10) = rx1169_cur."!mark_fail"(0)
    lt rx1169_pos, -1, rx1169_done
    eq rx1169_pos, -1, rx1169_fail
    jump $I10
  rx1169_done:
    rx1169_cur."!cursor_fail"()
    rx1169_cur."!cursor_debug"("FAIL  ", "infix:sym<~~>")
    .return (rx1169_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~~>"  :subid("298_1273884026.76819") :method
.annotate 'line', 423
    $P1171 = self."!PREFIX__!subrule"("O", "~~")
    new $P1172, "ResizablePMCArray"
    push $P1172, $P1171
    .return ($P1172)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("299_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1176_tgt
    .local int rx1176_pos
    .local int rx1176_off
    .local int rx1176_eos
    .local int rx1176_rep
    .local pmc rx1176_cur
    (rx1176_cur, rx1176_pos, rx1176_tgt) = self."!cursor_start"()
    rx1176_cur."!cursor_debug"("START ", "infix:sym<&&>")
    .lex unicode:"$\x{a2}", rx1176_cur
    .local pmc match
    .lex "$/", match
    length rx1176_eos, rx1176_tgt
    set rx1176_off, 0
    lt rx1176_pos, 2, rx1176_start
    sub rx1176_off, rx1176_pos, 1
    substr rx1176_tgt, rx1176_tgt, rx1176_off
  rx1176_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1180_done
    goto rxscan1180_scan
  rxscan1180_loop:
    ($P10) = rx1176_cur."from"()
    inc $P10
    set rx1176_pos, $P10
    ge rx1176_pos, rx1176_eos, rxscan1180_done
  rxscan1180_scan:
    set_addr $I10, rxscan1180_loop
    rx1176_cur."!mark_push"(0, rx1176_pos, $I10)
  rxscan1180_done:
.annotate 'line', 507
  # rx subcapture "sym"
    set_addr $I10, rxcap_1181_fail
    rx1176_cur."!mark_push"(0, rx1176_pos, $I10)
  # rx literal  "&&"
    add $I11, rx1176_pos, 2
    gt $I11, rx1176_eos, rx1176_fail
    sub $I11, rx1176_pos, rx1176_off
    substr $S10, rx1176_tgt, $I11, 2
    ne $S10, "&&", rx1176_fail
    add rx1176_pos, 2
    set_addr $I10, rxcap_1181_fail
    ($I12, $I11) = rx1176_cur."!mark_peek"($I10)
    rx1176_cur."!cursor_pos"($I11)
    ($P10) = rx1176_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1176_pos, "")
    rx1176_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1181_done
  rxcap_1181_fail:
    goto rx1176_fail
  rxcap_1181_done:
  # rx subrule "O" subtype=capture negate=
    rx1176_cur."!cursor_pos"(rx1176_pos)
    $P10 = rx1176_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx1176_fail
    rx1176_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1176_pos = $P10."pos"()
  # rx pass
    rx1176_cur."!cursor_pass"(rx1176_pos, "infix:sym<&&>")
    rx1176_cur."!cursor_debug"("PASS  ", "infix:sym<&&>", " at pos=", rx1176_pos)
    .return (rx1176_cur)
  rx1176_fail:
.annotate 'line', 423
    (rx1176_rep, rx1176_pos, $I10, $P10) = rx1176_cur."!mark_fail"(0)
    lt rx1176_pos, -1, rx1176_done
    eq rx1176_pos, -1, rx1176_fail
    jump $I10
  rx1176_done:
    rx1176_cur."!cursor_fail"()
    rx1176_cur."!cursor_debug"("FAIL  ", "infix:sym<&&>")
    .return (rx1176_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("300_1273884026.76819") :method
.annotate 'line', 423
    $P1178 = self."!PREFIX__!subrule"("O", "&&")
    new $P1179, "ResizablePMCArray"
    push $P1179, $P1178
    .return ($P1179)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("301_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1183_tgt
    .local int rx1183_pos
    .local int rx1183_off
    .local int rx1183_eos
    .local int rx1183_rep
    .local pmc rx1183_cur
    (rx1183_cur, rx1183_pos, rx1183_tgt) = self."!cursor_start"()
    rx1183_cur."!cursor_debug"("START ", "infix:sym<||>")
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
    ne $I10, -1, rxscan1187_done
    goto rxscan1187_scan
  rxscan1187_loop:
    ($P10) = rx1183_cur."from"()
    inc $P10
    set rx1183_pos, $P10
    ge rx1183_pos, rx1183_eos, rxscan1187_done
  rxscan1187_scan:
    set_addr $I10, rxscan1187_loop
    rx1183_cur."!mark_push"(0, rx1183_pos, $I10)
  rxscan1187_done:
.annotate 'line', 509
  # rx subcapture "sym"
    set_addr $I10, rxcap_1188_fail
    rx1183_cur."!mark_push"(0, rx1183_pos, $I10)
  # rx literal  "||"
    add $I11, rx1183_pos, 2
    gt $I11, rx1183_eos, rx1183_fail
    sub $I11, rx1183_pos, rx1183_off
    substr $S10, rx1183_tgt, $I11, 2
    ne $S10, "||", rx1183_fail
    add rx1183_pos, 2
    set_addr $I10, rxcap_1188_fail
    ($I12, $I11) = rx1183_cur."!mark_peek"($I10)
    rx1183_cur."!cursor_pos"($I11)
    ($P10) = rx1183_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1183_pos, "")
    rx1183_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1188_done
  rxcap_1188_fail:
    goto rx1183_fail
  rxcap_1188_done:
  # rx subrule "O" subtype=capture negate=
    rx1183_cur."!cursor_pos"(rx1183_pos)
    $P10 = rx1183_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx1183_fail
    rx1183_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1183_pos = $P10."pos"()
  # rx pass
    rx1183_cur."!cursor_pass"(rx1183_pos, "infix:sym<||>")
    rx1183_cur."!cursor_debug"("PASS  ", "infix:sym<||>", " at pos=", rx1183_pos)
    .return (rx1183_cur)
  rx1183_fail:
.annotate 'line', 423
    (rx1183_rep, rx1183_pos, $I10, $P10) = rx1183_cur."!mark_fail"(0)
    lt rx1183_pos, -1, rx1183_done
    eq rx1183_pos, -1, rx1183_fail
    jump $I10
  rx1183_done:
    rx1183_cur."!cursor_fail"()
    rx1183_cur."!cursor_debug"("FAIL  ", "infix:sym<||>")
    .return (rx1183_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("302_1273884026.76819") :method
.annotate 'line', 423
    $P1185 = self."!PREFIX__!subrule"("O", "||")
    new $P1186, "ResizablePMCArray"
    push $P1186, $P1185
    .return ($P1186)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("303_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1190_tgt
    .local int rx1190_pos
    .local int rx1190_off
    .local int rx1190_eos
    .local int rx1190_rep
    .local pmc rx1190_cur
    (rx1190_cur, rx1190_pos, rx1190_tgt) = self."!cursor_start"()
    rx1190_cur."!cursor_debug"("START ", "infix:sym<//>")
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
.annotate 'line', 510
  # rx subcapture "sym"
    set_addr $I10, rxcap_1195_fail
    rx1190_cur."!mark_push"(0, rx1190_pos, $I10)
  # rx literal  "//"
    add $I11, rx1190_pos, 2
    gt $I11, rx1190_eos, rx1190_fail
    sub $I11, rx1190_pos, rx1190_off
    substr $S10, rx1190_tgt, $I11, 2
    ne $S10, "//", rx1190_fail
    add rx1190_pos, 2
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
  # rx subrule "O" subtype=capture negate=
    rx1190_cur."!cursor_pos"(rx1190_pos)
    $P10 = rx1190_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx1190_fail
    rx1190_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1190_pos = $P10."pos"()
  # rx pass
    rx1190_cur."!cursor_pass"(rx1190_pos, "infix:sym<//>")
    rx1190_cur."!cursor_debug"("PASS  ", "infix:sym<//>", " at pos=", rx1190_pos)
    .return (rx1190_cur)
  rx1190_fail:
.annotate 'line', 423
    (rx1190_rep, rx1190_pos, $I10, $P10) = rx1190_cur."!mark_fail"(0)
    lt rx1190_pos, -1, rx1190_done
    eq rx1190_pos, -1, rx1190_fail
    jump $I10
  rx1190_done:
    rx1190_cur."!cursor_fail"()
    rx1190_cur."!cursor_debug"("FAIL  ", "infix:sym<//>")
    .return (rx1190_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("304_1273884026.76819") :method
.annotate 'line', 423
    $P1192 = self."!PREFIX__!subrule"("O", "//")
    new $P1193, "ResizablePMCArray"
    push $P1193, $P1192
    .return ($P1193)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("305_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1197_tgt
    .local int rx1197_pos
    .local int rx1197_off
    .local int rx1197_eos
    .local int rx1197_rep
    .local pmc rx1197_cur
    (rx1197_cur, rx1197_pos, rx1197_tgt) = self."!cursor_start"()
    rx1197_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
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
.annotate 'line', 513
  # rx literal  "??"
    add $I11, rx1197_pos, 2
    gt $I11, rx1197_eos, rx1197_fail
    sub $I11, rx1197_pos, rx1197_off
    substr $S10, rx1197_tgt, $I11, 2
    ne $S10, "??", rx1197_fail
    add rx1197_pos, 2
.annotate 'line', 514
  # rx subrule "ws" subtype=method negate=
    rx1197_cur."!cursor_pos"(rx1197_pos)
    $P10 = rx1197_cur."ws"()
    unless $P10, rx1197_fail
    rx1197_pos = $P10."pos"()
.annotate 'line', 515
  # rx subrule "EXPR" subtype=capture negate=
    rx1197_cur."!cursor_pos"(rx1197_pos)
    $P10 = rx1197_cur."EXPR"("i=")
    unless $P10, rx1197_fail
    rx1197_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1197_pos = $P10."pos"()
.annotate 'line', 516
  # rx literal  "!!"
    add $I11, rx1197_pos, 2
    gt $I11, rx1197_eos, rx1197_fail
    sub $I11, rx1197_pos, rx1197_off
    substr $S10, rx1197_tgt, $I11, 2
    ne $S10, "!!", rx1197_fail
    add rx1197_pos, 2
.annotate 'line', 517
  # rx subrule "O" subtype=capture negate=
    rx1197_cur."!cursor_pos"(rx1197_pos)
    $P10 = rx1197_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx1197_fail
    rx1197_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1197_pos = $P10."pos"()
.annotate 'line', 512
  # rx pass
    rx1197_cur."!cursor_pass"(rx1197_pos, "infix:sym<?? !!>")
    rx1197_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx1197_pos)
    .return (rx1197_cur)
  rx1197_fail:
.annotate 'line', 423
    (rx1197_rep, rx1197_pos, $I10, $P10) = rx1197_cur."!mark_fail"(0)
    lt rx1197_pos, -1, rx1197_done
    eq rx1197_pos, -1, rx1197_fail
    jump $I10
  rx1197_done:
    rx1197_cur."!cursor_fail"()
    rx1197_cur."!cursor_debug"("FAIL  ", "infix:sym<?? !!>")
    .return (rx1197_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("306_1273884026.76819") :method
.annotate 'line', 423
    $P1199 = self."!PREFIX__!subrule"("", "??")
    new $P1200, "ResizablePMCArray"
    push $P1200, $P1199
    .return ($P1200)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("307_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1203_tgt
    .local int rx1203_pos
    .local int rx1203_off
    .local int rx1203_eos
    .local int rx1203_rep
    .local pmc rx1203_cur
    (rx1203_cur, rx1203_pos, rx1203_tgt) = self."!cursor_start"()
    rx1203_cur."!cursor_debug"("START ", "infix:sym<=>")
    .lex unicode:"$\x{a2}", rx1203_cur
    .local pmc match
    .lex "$/", match
    length rx1203_eos, rx1203_tgt
    set rx1203_off, 0
    lt rx1203_pos, 2, rx1203_start
    sub rx1203_off, rx1203_pos, 1
    substr rx1203_tgt, rx1203_tgt, rx1203_off
  rx1203_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1207_done
    goto rxscan1207_scan
  rxscan1207_loop:
    ($P10) = rx1203_cur."from"()
    inc $P10
    set rx1203_pos, $P10
    ge rx1203_pos, rx1203_eos, rxscan1207_done
  rxscan1207_scan:
    set_addr $I10, rxscan1207_loop
    rx1203_cur."!mark_push"(0, rx1203_pos, $I10)
  rxscan1207_done:
.annotate 'line', 521
  # rx subcapture "sym"
    set_addr $I10, rxcap_1208_fail
    rx1203_cur."!mark_push"(0, rx1203_pos, $I10)
  # rx literal  "="
    add $I11, rx1203_pos, 1
    gt $I11, rx1203_eos, rx1203_fail
    sub $I11, rx1203_pos, rx1203_off
    substr $S10, rx1203_tgt, $I11, 1
    ne $S10, "=", rx1203_fail
    add rx1203_pos, 1
    set_addr $I10, rxcap_1208_fail
    ($I12, $I11) = rx1203_cur."!mark_peek"($I10)
    rx1203_cur."!cursor_pos"($I11)
    ($P10) = rx1203_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1203_pos, "")
    rx1203_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1208_done
  rxcap_1208_fail:
    goto rx1203_fail
  rxcap_1208_done:
  # rx subrule "panic" subtype=method negate=
    rx1203_cur."!cursor_pos"(rx1203_pos)
    $P10 = rx1203_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx1203_fail
    rx1203_pos = $P10."pos"()
.annotate 'line', 520
  # rx pass
    rx1203_cur."!cursor_pass"(rx1203_pos, "infix:sym<=>")
    rx1203_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx1203_pos)
    .return (rx1203_cur)
  rx1203_fail:
.annotate 'line', 423
    (rx1203_rep, rx1203_pos, $I10, $P10) = rx1203_cur."!mark_fail"(0)
    lt rx1203_pos, -1, rx1203_done
    eq rx1203_pos, -1, rx1203_fail
    jump $I10
  rx1203_done:
    rx1203_cur."!cursor_fail"()
    rx1203_cur."!cursor_debug"("FAIL  ", "infix:sym<=>")
    .return (rx1203_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("308_1273884026.76819") :method
.annotate 'line', 423
    $P1205 = self."!PREFIX__!subrule"("", "=")
    new $P1206, "ResizablePMCArray"
    push $P1206, $P1205
    .return ($P1206)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("309_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1210_tgt
    .local int rx1210_pos
    .local int rx1210_off
    .local int rx1210_eos
    .local int rx1210_rep
    .local pmc rx1210_cur
    (rx1210_cur, rx1210_pos, rx1210_tgt) = self."!cursor_start"()
    rx1210_cur."!cursor_debug"("START ", "infix:sym<:=>")
    .lex unicode:"$\x{a2}", rx1210_cur
    .local pmc match
    .lex "$/", match
    length rx1210_eos, rx1210_tgt
    set rx1210_off, 0
    lt rx1210_pos, 2, rx1210_start
    sub rx1210_off, rx1210_pos, 1
    substr rx1210_tgt, rx1210_tgt, rx1210_off
  rx1210_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1214_done
    goto rxscan1214_scan
  rxscan1214_loop:
    ($P10) = rx1210_cur."from"()
    inc $P10
    set rx1210_pos, $P10
    ge rx1210_pos, rx1210_eos, rxscan1214_done
  rxscan1214_scan:
    set_addr $I10, rxscan1214_loop
    rx1210_cur."!mark_push"(0, rx1210_pos, $I10)
  rxscan1214_done:
.annotate 'line', 523
  # rx subcapture "sym"
    set_addr $I10, rxcap_1215_fail
    rx1210_cur."!mark_push"(0, rx1210_pos, $I10)
  # rx literal  ":="
    add $I11, rx1210_pos, 2
    gt $I11, rx1210_eos, rx1210_fail
    sub $I11, rx1210_pos, rx1210_off
    substr $S10, rx1210_tgt, $I11, 2
    ne $S10, ":=", rx1210_fail
    add rx1210_pos, 2
    set_addr $I10, rxcap_1215_fail
    ($I12, $I11) = rx1210_cur."!mark_peek"($I10)
    rx1210_cur."!cursor_pos"($I11)
    ($P10) = rx1210_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1210_pos, "")
    rx1210_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1215_done
  rxcap_1215_fail:
    goto rx1210_fail
  rxcap_1215_done:
  # rx subrule "O" subtype=capture negate=
    rx1210_cur."!cursor_pos"(rx1210_pos)
    $P10 = rx1210_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1210_fail
    rx1210_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1210_pos = $P10."pos"()
  # rx pass
    rx1210_cur."!cursor_pass"(rx1210_pos, "infix:sym<:=>")
    rx1210_cur."!cursor_debug"("PASS  ", "infix:sym<:=>", " at pos=", rx1210_pos)
    .return (rx1210_cur)
  rx1210_fail:
.annotate 'line', 423
    (rx1210_rep, rx1210_pos, $I10, $P10) = rx1210_cur."!mark_fail"(0)
    lt rx1210_pos, -1, rx1210_done
    eq rx1210_pos, -1, rx1210_fail
    jump $I10
  rx1210_done:
    rx1210_cur."!cursor_fail"()
    rx1210_cur."!cursor_debug"("FAIL  ", "infix:sym<:=>")
    .return (rx1210_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("310_1273884026.76819") :method
.annotate 'line', 423
    $P1212 = self."!PREFIX__!subrule"("O", ":=")
    new $P1213, "ResizablePMCArray"
    push $P1213, $P1212
    .return ($P1213)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("311_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1217_tgt
    .local int rx1217_pos
    .local int rx1217_off
    .local int rx1217_eos
    .local int rx1217_rep
    .local pmc rx1217_cur
    (rx1217_cur, rx1217_pos, rx1217_tgt) = self."!cursor_start"()
    rx1217_cur."!cursor_debug"("START ", "infix:sym<::=>")
    .lex unicode:"$\x{a2}", rx1217_cur
    .local pmc match
    .lex "$/", match
    length rx1217_eos, rx1217_tgt
    set rx1217_off, 0
    lt rx1217_pos, 2, rx1217_start
    sub rx1217_off, rx1217_pos, 1
    substr rx1217_tgt, rx1217_tgt, rx1217_off
  rx1217_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1221_done
    goto rxscan1221_scan
  rxscan1221_loop:
    ($P10) = rx1217_cur."from"()
    inc $P10
    set rx1217_pos, $P10
    ge rx1217_pos, rx1217_eos, rxscan1221_done
  rxscan1221_scan:
    set_addr $I10, rxscan1221_loop
    rx1217_cur."!mark_push"(0, rx1217_pos, $I10)
  rxscan1221_done:
.annotate 'line', 524
  # rx subcapture "sym"
    set_addr $I10, rxcap_1222_fail
    rx1217_cur."!mark_push"(0, rx1217_pos, $I10)
  # rx literal  "::="
    add $I11, rx1217_pos, 3
    gt $I11, rx1217_eos, rx1217_fail
    sub $I11, rx1217_pos, rx1217_off
    substr $S10, rx1217_tgt, $I11, 3
    ne $S10, "::=", rx1217_fail
    add rx1217_pos, 3
    set_addr $I10, rxcap_1222_fail
    ($I12, $I11) = rx1217_cur."!mark_peek"($I10)
    rx1217_cur."!cursor_pos"($I11)
    ($P10) = rx1217_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1217_pos, "")
    rx1217_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1222_done
  rxcap_1222_fail:
    goto rx1217_fail
  rxcap_1222_done:
  # rx subrule "O" subtype=capture negate=
    rx1217_cur."!cursor_pos"(rx1217_pos)
    $P10 = rx1217_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1217_fail
    rx1217_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1217_pos = $P10."pos"()
  # rx pass
    rx1217_cur."!cursor_pass"(rx1217_pos, "infix:sym<::=>")
    rx1217_cur."!cursor_debug"("PASS  ", "infix:sym<::=>", " at pos=", rx1217_pos)
    .return (rx1217_cur)
  rx1217_fail:
.annotate 'line', 423
    (rx1217_rep, rx1217_pos, $I10, $P10) = rx1217_cur."!mark_fail"(0)
    lt rx1217_pos, -1, rx1217_done
    eq rx1217_pos, -1, rx1217_fail
    jump $I10
  rx1217_done:
    rx1217_cur."!cursor_fail"()
    rx1217_cur."!cursor_debug"("FAIL  ", "infix:sym<::=>")
    .return (rx1217_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("312_1273884026.76819") :method
.annotate 'line', 423
    $P1219 = self."!PREFIX__!subrule"("O", "::=")
    new $P1220, "ResizablePMCArray"
    push $P1220, $P1219
    .return ($P1220)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("313_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1224_tgt
    .local int rx1224_pos
    .local int rx1224_off
    .local int rx1224_eos
    .local int rx1224_rep
    .local pmc rx1224_cur
    (rx1224_cur, rx1224_pos, rx1224_tgt) = self."!cursor_start"()
    rx1224_cur."!cursor_debug"("START ", "infix:sym<,>")
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
    ne $I10, -1, rxscan1228_done
    goto rxscan1228_scan
  rxscan1228_loop:
    ($P10) = rx1224_cur."from"()
    inc $P10
    set rx1224_pos, $P10
    ge rx1224_pos, rx1224_eos, rxscan1228_done
  rxscan1228_scan:
    set_addr $I10, rxscan1228_loop
    rx1224_cur."!mark_push"(0, rx1224_pos, $I10)
  rxscan1228_done:
.annotate 'line', 526
  # rx subcapture "sym"
    set_addr $I10, rxcap_1229_fail
    rx1224_cur."!mark_push"(0, rx1224_pos, $I10)
  # rx literal  ","
    add $I11, rx1224_pos, 1
    gt $I11, rx1224_eos, rx1224_fail
    sub $I11, rx1224_pos, rx1224_off
    substr $S10, rx1224_tgt, $I11, 1
    ne $S10, ",", rx1224_fail
    add rx1224_pos, 1
    set_addr $I10, rxcap_1229_fail
    ($I12, $I11) = rx1224_cur."!mark_peek"($I10)
    rx1224_cur."!cursor_pos"($I11)
    ($P10) = rx1224_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1224_pos, "")
    rx1224_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1229_done
  rxcap_1229_fail:
    goto rx1224_fail
  rxcap_1229_done:
  # rx subrule "O" subtype=capture negate=
    rx1224_cur."!cursor_pos"(rx1224_pos)
    $P10 = rx1224_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1224_fail
    rx1224_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1224_pos = $P10."pos"()
  # rx pass
    rx1224_cur."!cursor_pass"(rx1224_pos, "infix:sym<,>")
    rx1224_cur."!cursor_debug"("PASS  ", "infix:sym<,>", " at pos=", rx1224_pos)
    .return (rx1224_cur)
  rx1224_fail:
.annotate 'line', 423
    (rx1224_rep, rx1224_pos, $I10, $P10) = rx1224_cur."!mark_fail"(0)
    lt rx1224_pos, -1, rx1224_done
    eq rx1224_pos, -1, rx1224_fail
    jump $I10
  rx1224_done:
    rx1224_cur."!cursor_fail"()
    rx1224_cur."!cursor_debug"("FAIL  ", "infix:sym<,>")
    .return (rx1224_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("314_1273884026.76819") :method
.annotate 'line', 423
    $P1226 = self."!PREFIX__!subrule"("O", ",")
    new $P1227, "ResizablePMCArray"
    push $P1227, $P1226
    .return ($P1227)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("315_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1231_tgt
    .local int rx1231_pos
    .local int rx1231_off
    .local int rx1231_eos
    .local int rx1231_rep
    .local pmc rx1231_cur
    (rx1231_cur, rx1231_pos, rx1231_tgt) = self."!cursor_start"()
    rx1231_cur."!cursor_debug"("START ", "prefix:sym<return>")
    .lex unicode:"$\x{a2}", rx1231_cur
    .local pmc match
    .lex "$/", match
    length rx1231_eos, rx1231_tgt
    set rx1231_off, 0
    lt rx1231_pos, 2, rx1231_start
    sub rx1231_off, rx1231_pos, 1
    substr rx1231_tgt, rx1231_tgt, rx1231_off
  rx1231_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1234_done
    goto rxscan1234_scan
  rxscan1234_loop:
    ($P10) = rx1231_cur."from"()
    inc $P10
    set rx1231_pos, $P10
    ge rx1231_pos, rx1231_eos, rxscan1234_done
  rxscan1234_scan:
    set_addr $I10, rxscan1234_loop
    rx1231_cur."!mark_push"(0, rx1231_pos, $I10)
  rxscan1234_done:
.annotate 'line', 528
  # rx subcapture "sym"
    set_addr $I10, rxcap_1235_fail
    rx1231_cur."!mark_push"(0, rx1231_pos, $I10)
  # rx literal  "return"
    add $I11, rx1231_pos, 6
    gt $I11, rx1231_eos, rx1231_fail
    sub $I11, rx1231_pos, rx1231_off
    substr $S10, rx1231_tgt, $I11, 6
    ne $S10, "return", rx1231_fail
    add rx1231_pos, 6
    set_addr $I10, rxcap_1235_fail
    ($I12, $I11) = rx1231_cur."!mark_peek"($I10)
    rx1231_cur."!cursor_pos"($I11)
    ($P10) = rx1231_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1231_pos, "")
    rx1231_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1235_done
  rxcap_1235_fail:
    goto rx1231_fail
  rxcap_1235_done:
  # rx charclass s
    ge rx1231_pos, rx1231_eos, rx1231_fail
    sub $I10, rx1231_pos, rx1231_off
    is_cclass $I11, 32, rx1231_tgt, $I10
    unless $I11, rx1231_fail
    inc rx1231_pos
  # rx subrule "O" subtype=capture negate=
    rx1231_cur."!cursor_pos"(rx1231_pos)
    $P10 = rx1231_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1231_fail
    rx1231_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1231_pos = $P10."pos"()
  # rx pass
    rx1231_cur."!cursor_pass"(rx1231_pos, "prefix:sym<return>")
    rx1231_cur."!cursor_debug"("PASS  ", "prefix:sym<return>", " at pos=", rx1231_pos)
    .return (rx1231_cur)
  rx1231_fail:
.annotate 'line', 423
    (rx1231_rep, rx1231_pos, $I10, $P10) = rx1231_cur."!mark_fail"(0)
    lt rx1231_pos, -1, rx1231_done
    eq rx1231_pos, -1, rx1231_fail
    jump $I10
  rx1231_done:
    rx1231_cur."!cursor_fail"()
    rx1231_cur."!cursor_debug"("FAIL  ", "prefix:sym<return>")
    .return (rx1231_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("316_1273884026.76819") :method
.annotate 'line', 423
    new $P1233, "ResizablePMCArray"
    push $P1233, "return"
    .return ($P1233)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("317_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1237_tgt
    .local int rx1237_pos
    .local int rx1237_off
    .local int rx1237_eos
    .local int rx1237_rep
    .local pmc rx1237_cur
    (rx1237_cur, rx1237_pos, rx1237_tgt) = self."!cursor_start"()
    rx1237_cur."!cursor_debug"("START ", "prefix:sym<make>")
    .lex unicode:"$\x{a2}", rx1237_cur
    .local pmc match
    .lex "$/", match
    length rx1237_eos, rx1237_tgt
    set rx1237_off, 0
    lt rx1237_pos, 2, rx1237_start
    sub rx1237_off, rx1237_pos, 1
    substr rx1237_tgt, rx1237_tgt, rx1237_off
  rx1237_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1240_done
    goto rxscan1240_scan
  rxscan1240_loop:
    ($P10) = rx1237_cur."from"()
    inc $P10
    set rx1237_pos, $P10
    ge rx1237_pos, rx1237_eos, rxscan1240_done
  rxscan1240_scan:
    set_addr $I10, rxscan1240_loop
    rx1237_cur."!mark_push"(0, rx1237_pos, $I10)
  rxscan1240_done:
.annotate 'line', 529
  # rx subcapture "sym"
    set_addr $I10, rxcap_1241_fail
    rx1237_cur."!mark_push"(0, rx1237_pos, $I10)
  # rx literal  "make"
    add $I11, rx1237_pos, 4
    gt $I11, rx1237_eos, rx1237_fail
    sub $I11, rx1237_pos, rx1237_off
    substr $S10, rx1237_tgt, $I11, 4
    ne $S10, "make", rx1237_fail
    add rx1237_pos, 4
    set_addr $I10, rxcap_1241_fail
    ($I12, $I11) = rx1237_cur."!mark_peek"($I10)
    rx1237_cur."!cursor_pos"($I11)
    ($P10) = rx1237_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1237_pos, "")
    rx1237_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1241_done
  rxcap_1241_fail:
    goto rx1237_fail
  rxcap_1241_done:
  # rx charclass s
    ge rx1237_pos, rx1237_eos, rx1237_fail
    sub $I10, rx1237_pos, rx1237_off
    is_cclass $I11, 32, rx1237_tgt, $I10
    unless $I11, rx1237_fail
    inc rx1237_pos
  # rx subrule "O" subtype=capture negate=
    rx1237_cur."!cursor_pos"(rx1237_pos)
    $P10 = rx1237_cur."O"("%list_prefix")
    unless $P10, rx1237_fail
    rx1237_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1237_pos = $P10."pos"()
  # rx pass
    rx1237_cur."!cursor_pass"(rx1237_pos, "prefix:sym<make>")
    rx1237_cur."!cursor_debug"("PASS  ", "prefix:sym<make>", " at pos=", rx1237_pos)
    .return (rx1237_cur)
  rx1237_fail:
.annotate 'line', 423
    (rx1237_rep, rx1237_pos, $I10, $P10) = rx1237_cur."!mark_fail"(0)
    lt rx1237_pos, -1, rx1237_done
    eq rx1237_pos, -1, rx1237_fail
    jump $I10
  rx1237_done:
    rx1237_cur."!cursor_fail"()
    rx1237_cur."!cursor_debug"("FAIL  ", "prefix:sym<make>")
    .return (rx1237_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("318_1273884026.76819") :method
.annotate 'line', 423
    new $P1239, "ResizablePMCArray"
    push $P1239, "make"
    .return ($P1239)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<last>"  :subid("319_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1243_tgt
    .local int rx1243_pos
    .local int rx1243_off
    .local int rx1243_eos
    .local int rx1243_rep
    .local pmc rx1243_cur
    (rx1243_cur, rx1243_pos, rx1243_tgt) = self."!cursor_start"()
    rx1243_cur."!cursor_debug"("START ", "term:sym<last>")
    .lex unicode:"$\x{a2}", rx1243_cur
    .local pmc match
    .lex "$/", match
    length rx1243_eos, rx1243_tgt
    set rx1243_off, 0
    lt rx1243_pos, 2, rx1243_start
    sub rx1243_off, rx1243_pos, 1
    substr rx1243_tgt, rx1243_tgt, rx1243_off
  rx1243_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1246_done
    goto rxscan1246_scan
  rxscan1246_loop:
    ($P10) = rx1243_cur."from"()
    inc $P10
    set rx1243_pos, $P10
    ge rx1243_pos, rx1243_eos, rxscan1246_done
  rxscan1246_scan:
    set_addr $I10, rxscan1246_loop
    rx1243_cur."!mark_push"(0, rx1243_pos, $I10)
  rxscan1246_done:
.annotate 'line', 530
  # rx subcapture "sym"
    set_addr $I10, rxcap_1247_fail
    rx1243_cur."!mark_push"(0, rx1243_pos, $I10)
  # rx literal  "last"
    add $I11, rx1243_pos, 4
    gt $I11, rx1243_eos, rx1243_fail
    sub $I11, rx1243_pos, rx1243_off
    substr $S10, rx1243_tgt, $I11, 4
    ne $S10, "last", rx1243_fail
    add rx1243_pos, 4
    set_addr $I10, rxcap_1247_fail
    ($I12, $I11) = rx1243_cur."!mark_peek"($I10)
    rx1243_cur."!cursor_pos"($I11)
    ($P10) = rx1243_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1243_pos, "")
    rx1243_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1247_done
  rxcap_1247_fail:
    goto rx1243_fail
  rxcap_1247_done:
  # rx pass
    rx1243_cur."!cursor_pass"(rx1243_pos, "term:sym<last>")
    rx1243_cur."!cursor_debug"("PASS  ", "term:sym<last>", " at pos=", rx1243_pos)
    .return (rx1243_cur)
  rx1243_fail:
.annotate 'line', 423
    (rx1243_rep, rx1243_pos, $I10, $P10) = rx1243_cur."!mark_fail"(0)
    lt rx1243_pos, -1, rx1243_done
    eq rx1243_pos, -1, rx1243_fail
    jump $I10
  rx1243_done:
    rx1243_cur."!cursor_fail"()
    rx1243_cur."!cursor_debug"("FAIL  ", "term:sym<last>")
    .return (rx1243_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<last>"  :subid("320_1273884026.76819") :method
.annotate 'line', 423
    new $P1245, "ResizablePMCArray"
    push $P1245, "last"
    .return ($P1245)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<next>"  :subid("321_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1249_tgt
    .local int rx1249_pos
    .local int rx1249_off
    .local int rx1249_eos
    .local int rx1249_rep
    .local pmc rx1249_cur
    (rx1249_cur, rx1249_pos, rx1249_tgt) = self."!cursor_start"()
    rx1249_cur."!cursor_debug"("START ", "term:sym<next>")
    .lex unicode:"$\x{a2}", rx1249_cur
    .local pmc match
    .lex "$/", match
    length rx1249_eos, rx1249_tgt
    set rx1249_off, 0
    lt rx1249_pos, 2, rx1249_start
    sub rx1249_off, rx1249_pos, 1
    substr rx1249_tgt, rx1249_tgt, rx1249_off
  rx1249_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1252_done
    goto rxscan1252_scan
  rxscan1252_loop:
    ($P10) = rx1249_cur."from"()
    inc $P10
    set rx1249_pos, $P10
    ge rx1249_pos, rx1249_eos, rxscan1252_done
  rxscan1252_scan:
    set_addr $I10, rxscan1252_loop
    rx1249_cur."!mark_push"(0, rx1249_pos, $I10)
  rxscan1252_done:
.annotate 'line', 531
  # rx subcapture "sym"
    set_addr $I10, rxcap_1253_fail
    rx1249_cur."!mark_push"(0, rx1249_pos, $I10)
  # rx literal  "next"
    add $I11, rx1249_pos, 4
    gt $I11, rx1249_eos, rx1249_fail
    sub $I11, rx1249_pos, rx1249_off
    substr $S10, rx1249_tgt, $I11, 4
    ne $S10, "next", rx1249_fail
    add rx1249_pos, 4
    set_addr $I10, rxcap_1253_fail
    ($I12, $I11) = rx1249_cur."!mark_peek"($I10)
    rx1249_cur."!cursor_pos"($I11)
    ($P10) = rx1249_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1249_pos, "")
    rx1249_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1253_done
  rxcap_1253_fail:
    goto rx1249_fail
  rxcap_1253_done:
  # rx pass
    rx1249_cur."!cursor_pass"(rx1249_pos, "term:sym<next>")
    rx1249_cur."!cursor_debug"("PASS  ", "term:sym<next>", " at pos=", rx1249_pos)
    .return (rx1249_cur)
  rx1249_fail:
.annotate 'line', 423
    (rx1249_rep, rx1249_pos, $I10, $P10) = rx1249_cur."!mark_fail"(0)
    lt rx1249_pos, -1, rx1249_done
    eq rx1249_pos, -1, rx1249_fail
    jump $I10
  rx1249_done:
    rx1249_cur."!cursor_fail"()
    rx1249_cur."!cursor_debug"("FAIL  ", "term:sym<next>")
    .return (rx1249_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<next>"  :subid("322_1273884026.76819") :method
.annotate 'line', 423
    new $P1251, "ResizablePMCArray"
    push $P1251, "next"
    .return ($P1251)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<redo>"  :subid("323_1273884026.76819") :method :outer("11_1273884026.76819")
.annotate 'line', 423
    .local string rx1255_tgt
    .local int rx1255_pos
    .local int rx1255_off
    .local int rx1255_eos
    .local int rx1255_rep
    .local pmc rx1255_cur
    (rx1255_cur, rx1255_pos, rx1255_tgt) = self."!cursor_start"()
    rx1255_cur."!cursor_debug"("START ", "term:sym<redo>")
    .lex unicode:"$\x{a2}", rx1255_cur
    .local pmc match
    .lex "$/", match
    length rx1255_eos, rx1255_tgt
    set rx1255_off, 0
    lt rx1255_pos, 2, rx1255_start
    sub rx1255_off, rx1255_pos, 1
    substr rx1255_tgt, rx1255_tgt, rx1255_off
  rx1255_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1258_done
    goto rxscan1258_scan
  rxscan1258_loop:
    ($P10) = rx1255_cur."from"()
    inc $P10
    set rx1255_pos, $P10
    ge rx1255_pos, rx1255_eos, rxscan1258_done
  rxscan1258_scan:
    set_addr $I10, rxscan1258_loop
    rx1255_cur."!mark_push"(0, rx1255_pos, $I10)
  rxscan1258_done:
.annotate 'line', 532
  # rx subcapture "sym"
    set_addr $I10, rxcap_1259_fail
    rx1255_cur."!mark_push"(0, rx1255_pos, $I10)
  # rx literal  "redo"
    add $I11, rx1255_pos, 4
    gt $I11, rx1255_eos, rx1255_fail
    sub $I11, rx1255_pos, rx1255_off
    substr $S10, rx1255_tgt, $I11, 4
    ne $S10, "redo", rx1255_fail
    add rx1255_pos, 4
    set_addr $I10, rxcap_1259_fail
    ($I12, $I11) = rx1255_cur."!mark_peek"($I10)
    rx1255_cur."!cursor_pos"($I11)
    ($P10) = rx1255_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1255_pos, "")
    rx1255_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1259_done
  rxcap_1259_fail:
    goto rx1255_fail
  rxcap_1259_done:
  # rx pass
    rx1255_cur."!cursor_pass"(rx1255_pos, "term:sym<redo>")
    rx1255_cur."!cursor_debug"("PASS  ", "term:sym<redo>", " at pos=", rx1255_pos)
    .return (rx1255_cur)
  rx1255_fail:
.annotate 'line', 423
    (rx1255_rep, rx1255_pos, $I10, $P10) = rx1255_cur."!mark_fail"(0)
    lt rx1255_pos, -1, rx1255_done
    eq rx1255_pos, -1, rx1255_fail
    jump $I10
  rx1255_done:
    rx1255_cur."!cursor_fail"()
    rx1255_cur."!cursor_debug"("FAIL  ", "term:sym<redo>")
    .return (rx1255_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<redo>"  :subid("324_1273884026.76819") :method
.annotate 'line', 423
    new $P1257, "ResizablePMCArray"
    push $P1257, "redo"
    .return ($P1257)
.end


.namespace ["NQP";"Grammar"]
.sub "smartmatch"  :subid("325_1273884026.76819") :method :outer("11_1273884026.76819")
    .param pmc param_1263
.annotate 'line', 534
    new $P1262, 'ExceptionHandler'
    set_addr $P1262, control_1261
    $P1262."handle_types"(57)
    push_eh $P1262
    .lex "self", self
    .lex "$/", param_1263
.annotate 'line', 536
    new $P1264, "Undef"
    .lex "$t", $P1264
    find_lex $P1265, "$/"
    unless_null $P1265, vivify_351
    $P1265 = root_new ['parrot';'ResizablePMCArray']
  vivify_351:
    set $P1266, $P1265[0]
    unless_null $P1266, vivify_352
    new $P1266, "Undef"
  vivify_352:
    store_lex "$t", $P1266
    find_lex $P1267, "$/"
    unless_null $P1267, vivify_353
    $P1267 = root_new ['parrot';'ResizablePMCArray']
  vivify_353:
    set $P1268, $P1267[1]
    unless_null $P1268, vivify_354
    new $P1268, "Undef"
  vivify_354:
    find_lex $P1269, "$/"
    unless_null $P1269, vivify_355
    $P1269 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1269
  vivify_355:
    set $P1269[0], $P1268
    find_lex $P1270, "$t"
    find_lex $P1271, "$/"
    unless_null $P1271, vivify_356
    $P1271 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1271
  vivify_356:
    set $P1271[1], $P1270
.annotate 'line', 534
    .return ($P1270)
  control_1261:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1272, exception, "payload"
    .return ($P1272)
.end


.namespace ["NQP";"Regex"]
.sub "_block1273"  :subid("326_1273884026.76819") :outer("11_1273884026.76819")
.annotate 'line', 540
    .const 'Sub' $P1307 = "337_1273884026.76819" 
    capture_lex $P1307
    .const 'Sub' $P1294 = "334_1273884026.76819" 
    capture_lex $P1294
    .const 'Sub' $P1289 = "332_1273884026.76819" 
    capture_lex $P1289
    .const 'Sub' $P1284 = "330_1273884026.76819" 
    capture_lex $P1284
    .const 'Sub' $P1275 = "327_1273884026.76819" 
    capture_lex $P1275
    .const 'Sub' $P1307 = "337_1273884026.76819" 
    capture_lex $P1307
    .return ($P1307)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("327_1273884026.76819") :method :outer("326_1273884026.76819")
.annotate 'line', 540
    .const 'Sub' $P1281 = "329_1273884026.76819" 
    capture_lex $P1281
    .local string rx1276_tgt
    .local int rx1276_pos
    .local int rx1276_off
    .local int rx1276_eos
    .local int rx1276_rep
    .local pmc rx1276_cur
    (rx1276_cur, rx1276_pos, rx1276_tgt) = self."!cursor_start"()
    rx1276_cur."!cursor_debug"("START ", "metachar:sym<:my>")
    .lex unicode:"$\x{a2}", rx1276_cur
    .local pmc match
    .lex "$/", match
    length rx1276_eos, rx1276_tgt
    set rx1276_off, 0
    lt rx1276_pos, 2, rx1276_start
    sub rx1276_off, rx1276_pos, 1
    substr rx1276_tgt, rx1276_tgt, rx1276_off
  rx1276_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1279_done
    goto rxscan1279_scan
  rxscan1279_loop:
    ($P10) = rx1276_cur."from"()
    inc $P10
    set rx1276_pos, $P10
    ge rx1276_pos, rx1276_eos, rxscan1279_done
  rxscan1279_scan:
    set_addr $I10, rxscan1279_loop
    rx1276_cur."!mark_push"(0, rx1276_pos, $I10)
  rxscan1279_done:
.annotate 'line', 542
  # rx literal  ":"
    add $I11, rx1276_pos, 1
    gt $I11, rx1276_eos, rx1276_fail
    sub $I11, rx1276_pos, rx1276_off
    substr $S10, rx1276_tgt, $I11, 1
    ne $S10, ":", rx1276_fail
    add rx1276_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1276_cur."!cursor_pos"(rx1276_pos)
    .const 'Sub' $P1281 = "329_1273884026.76819" 
    capture_lex $P1281
    $P10 = rx1276_cur."before"($P1281)
    unless $P10, rx1276_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1276_cur."!cursor_pos"(rx1276_pos)
    $P10 = rx1276_cur."LANG"("MAIN", "statement")
    unless $P10, rx1276_fail
    rx1276_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1276_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1276_cur."!cursor_pos"(rx1276_pos)
    $P10 = rx1276_cur."ws"()
    unless $P10, rx1276_fail
    rx1276_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1276_pos, 1
    gt $I11, rx1276_eos, rx1276_fail
    sub $I11, rx1276_pos, rx1276_off
    substr $S10, rx1276_tgt, $I11, 1
    ne $S10, ";", rx1276_fail
    add rx1276_pos, 1
.annotate 'line', 541
  # rx pass
    rx1276_cur."!cursor_pass"(rx1276_pos, "metachar:sym<:my>")
    rx1276_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1276_pos)
    .return (rx1276_cur)
  rx1276_fail:
.annotate 'line', 540
    (rx1276_rep, rx1276_pos, $I10, $P10) = rx1276_cur."!mark_fail"(0)
    lt rx1276_pos, -1, rx1276_done
    eq rx1276_pos, -1, rx1276_fail
    jump $I10
  rx1276_done:
    rx1276_cur."!cursor_fail"()
    rx1276_cur."!cursor_debug"("FAIL  ", "metachar:sym<:my>")
    .return (rx1276_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("328_1273884026.76819") :method
.annotate 'line', 540
    new $P1278, "ResizablePMCArray"
    push $P1278, ":"
    .return ($P1278)
.end


.namespace ["NQP";"Regex"]
.sub "_block1280"  :anon :subid("329_1273884026.76819") :method :outer("327_1273884026.76819")
.annotate 'line', 542
    .local string rx1282_tgt
    .local int rx1282_pos
    .local int rx1282_off
    .local int rx1282_eos
    .local int rx1282_rep
    .local pmc rx1282_cur
    (rx1282_cur, rx1282_pos, rx1282_tgt) = self."!cursor_start"()
    rx1282_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1282_cur
    .local pmc match
    .lex "$/", match
    length rx1282_eos, rx1282_tgt
    set rx1282_off, 0
    lt rx1282_pos, 2, rx1282_start
    sub rx1282_off, rx1282_pos, 1
    substr rx1282_tgt, rx1282_tgt, rx1282_off
  rx1282_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1283_done
    goto rxscan1283_scan
  rxscan1283_loop:
    ($P10) = rx1282_cur."from"()
    inc $P10
    set rx1282_pos, $P10
    ge rx1282_pos, rx1282_eos, rxscan1283_done
  rxscan1283_scan:
    set_addr $I10, rxscan1283_loop
    rx1282_cur."!mark_push"(0, rx1282_pos, $I10)
  rxscan1283_done:
  # rx literal  "my"
    add $I11, rx1282_pos, 2
    gt $I11, rx1282_eos, rx1282_fail
    sub $I11, rx1282_pos, rx1282_off
    substr $S10, rx1282_tgt, $I11, 2
    ne $S10, "my", rx1282_fail
    add rx1282_pos, 2
  # rx pass
    rx1282_cur."!cursor_pass"(rx1282_pos, "")
    rx1282_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1282_pos)
    .return (rx1282_cur)
  rx1282_fail:
    (rx1282_rep, rx1282_pos, $I10, $P10) = rx1282_cur."!mark_fail"(0)
    lt rx1282_pos, -1, rx1282_done
    eq rx1282_pos, -1, rx1282_fail
    jump $I10
  rx1282_done:
    rx1282_cur."!cursor_fail"()
    rx1282_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1282_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("330_1273884026.76819") :method :outer("326_1273884026.76819")
.annotate 'line', 540
    .local string rx1285_tgt
    .local int rx1285_pos
    .local int rx1285_off
    .local int rx1285_eos
    .local int rx1285_rep
    .local pmc rx1285_cur
    (rx1285_cur, rx1285_pos, rx1285_tgt) = self."!cursor_start"()
    rx1285_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1285_cur
    .local pmc match
    .lex "$/", match
    length rx1285_eos, rx1285_tgt
    set rx1285_off, 0
    lt rx1285_pos, 2, rx1285_start
    sub rx1285_off, rx1285_pos, 1
    substr rx1285_tgt, rx1285_tgt, rx1285_off
  rx1285_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1288_done
    goto rxscan1288_scan
  rxscan1288_loop:
    ($P10) = rx1285_cur."from"()
    inc $P10
    set rx1285_pos, $P10
    ge rx1285_pos, rx1285_eos, rxscan1288_done
  rxscan1288_scan:
    set_addr $I10, rxscan1288_loop
    rx1285_cur."!mark_push"(0, rx1285_pos, $I10)
  rxscan1288_done:
.annotate 'line', 546
  # rx enumcharlist negate=0 zerowidth
    ge rx1285_pos, rx1285_eos, rx1285_fail
    sub $I10, rx1285_pos, rx1285_off
    substr $S10, rx1285_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1285_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1285_cur."!cursor_pos"(rx1285_pos)
    $P10 = rx1285_cur."codeblock"()
    unless $P10, rx1285_fail
    rx1285_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1285_pos = $P10."pos"()
.annotate 'line', 545
  # rx pass
    rx1285_cur."!cursor_pass"(rx1285_pos, "metachar:sym<{ }>")
    rx1285_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1285_pos)
    .return (rx1285_cur)
  rx1285_fail:
.annotate 'line', 540
    (rx1285_rep, rx1285_pos, $I10, $P10) = rx1285_cur."!mark_fail"(0)
    lt rx1285_pos, -1, rx1285_done
    eq rx1285_pos, -1, rx1285_fail
    jump $I10
  rx1285_done:
    rx1285_cur."!cursor_fail"()
    rx1285_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx1285_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("331_1273884026.76819") :method
.annotate 'line', 540
    new $P1287, "ResizablePMCArray"
    push $P1287, "{"
    .return ($P1287)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("332_1273884026.76819") :method :outer("326_1273884026.76819")
.annotate 'line', 540
    .local string rx1290_tgt
    .local int rx1290_pos
    .local int rx1290_off
    .local int rx1290_eos
    .local int rx1290_rep
    .local pmc rx1290_cur
    (rx1290_cur, rx1290_pos, rx1290_tgt) = self."!cursor_start"()
    rx1290_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1290_cur
    .local pmc match
    .lex "$/", match
    length rx1290_eos, rx1290_tgt
    set rx1290_off, 0
    lt rx1290_pos, 2, rx1290_start
    sub rx1290_off, rx1290_pos, 1
    substr rx1290_tgt, rx1290_tgt, rx1290_off
  rx1290_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1293_done
    goto rxscan1293_scan
  rxscan1293_loop:
    ($P10) = rx1290_cur."from"()
    inc $P10
    set rx1290_pos, $P10
    ge rx1290_pos, rx1290_eos, rxscan1293_done
  rxscan1293_scan:
    set_addr $I10, rxscan1293_loop
    rx1290_cur."!mark_push"(0, rx1290_pos, $I10)
  rxscan1293_done:
.annotate 'line', 550
  # rx enumcharlist negate=0 zerowidth
    ge rx1290_pos, rx1290_eos, rx1290_fail
    sub $I10, rx1290_pos, rx1290_off
    substr $S10, rx1290_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1290_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1290_cur."!cursor_pos"(rx1290_pos)
    $P10 = rx1290_cur."codeblock"()
    unless $P10, rx1290_fail
    rx1290_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1290_pos = $P10."pos"()
.annotate 'line', 549
  # rx pass
    rx1290_cur."!cursor_pass"(rx1290_pos, "assertion:sym<{ }>")
    rx1290_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1290_pos)
    .return (rx1290_cur)
  rx1290_fail:
.annotate 'line', 540
    (rx1290_rep, rx1290_pos, $I10, $P10) = rx1290_cur."!mark_fail"(0)
    lt rx1290_pos, -1, rx1290_done
    eq rx1290_pos, -1, rx1290_fail
    jump $I10
  rx1290_done:
    rx1290_cur."!cursor_fail"()
    rx1290_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1290_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("333_1273884026.76819") :method
.annotate 'line', 540
    new $P1292, "ResizablePMCArray"
    push $P1292, "{"
    .return ($P1292)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("334_1273884026.76819") :method :outer("326_1273884026.76819")
.annotate 'line', 540
    .const 'Sub' $P1303 = "336_1273884026.76819" 
    capture_lex $P1303
    .local string rx1295_tgt
    .local int rx1295_pos
    .local int rx1295_off
    .local int rx1295_eos
    .local int rx1295_rep
    .local pmc rx1295_cur
    (rx1295_cur, rx1295_pos, rx1295_tgt) = self."!cursor_start"()
    rx1295_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1295_cur."!cursor_caparray"("nibbler", "arglist", "assertion")
    .lex unicode:"$\x{a2}", rx1295_cur
    .local pmc match
    .lex "$/", match
    length rx1295_eos, rx1295_tgt
    set rx1295_off, 0
    lt rx1295_pos, 2, rx1295_start
    sub rx1295_off, rx1295_pos, 1
    substr rx1295_tgt, rx1295_tgt, rx1295_off
  rx1295_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1298_done
    goto rxscan1298_scan
  rxscan1298_loop:
    ($P10) = rx1295_cur."from"()
    inc $P10
    set rx1295_pos, $P10
    ge rx1295_pos, rx1295_eos, rxscan1298_done
  rxscan1298_scan:
    set_addr $I10, rxscan1298_loop
    rx1295_cur."!mark_push"(0, rx1295_pos, $I10)
  rxscan1298_done:
.annotate 'line', 554
  # rx subcapture "longname"
    set_addr $I10, rxcap_1299_fail
    rx1295_cur."!mark_push"(0, rx1295_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1295_pos, rx1295_off
    find_not_cclass $I11, 8192, rx1295_tgt, $I10, rx1295_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1295_fail
    add rx1295_pos, rx1295_off, $I11
    set_addr $I10, rxcap_1299_fail
    ($I12, $I11) = rx1295_cur."!mark_peek"($I10)
    rx1295_cur."!cursor_pos"($I11)
    ($P10) = rx1295_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1295_pos, "")
    rx1295_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_1299_done
  rxcap_1299_fail:
    goto rx1295_fail
  rxcap_1299_done:
.annotate 'line', 561
  # rx rxquantr1300 ** 0..1
    set_addr $I1306, rxquantr1300_done
    rx1295_cur."!mark_push"(0, rx1295_pos, $I1306)
  rxquantr1300_loop:
  alt1301_0:
.annotate 'line', 555
    set_addr $I10, alt1301_1
    rx1295_cur."!mark_push"(0, rx1295_pos, $I10)
.annotate 'line', 556
  # rx subrule "before" subtype=zerowidth negate=
    rx1295_cur."!cursor_pos"(rx1295_pos)
    .const 'Sub' $P1303 = "336_1273884026.76819" 
    capture_lex $P1303
    $P10 = rx1295_cur."before"($P1303)
    unless $P10, rx1295_fail
    goto alt1301_end
  alt1301_1:
    set_addr $I10, alt1301_2
    rx1295_cur."!mark_push"(0, rx1295_pos, $I10)
.annotate 'line', 557
  # rx literal  "="
    add $I11, rx1295_pos, 1
    gt $I11, rx1295_eos, rx1295_fail
    sub $I11, rx1295_pos, rx1295_off
    substr $S10, rx1295_tgt, $I11, 1
    ne $S10, "=", rx1295_fail
    add rx1295_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1295_cur."!cursor_pos"(rx1295_pos)
    $P10 = rx1295_cur."assertion"()
    unless $P10, rx1295_fail
    rx1295_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1295_pos = $P10."pos"()
    goto alt1301_end
  alt1301_2:
    set_addr $I10, alt1301_3
    rx1295_cur."!mark_push"(0, rx1295_pos, $I10)
.annotate 'line', 558
  # rx literal  ":"
    add $I11, rx1295_pos, 1
    gt $I11, rx1295_eos, rx1295_fail
    sub $I11, rx1295_pos, rx1295_off
    substr $S10, rx1295_tgt, $I11, 1
    ne $S10, ":", rx1295_fail
    add rx1295_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1295_cur."!cursor_pos"(rx1295_pos)
    $P10 = rx1295_cur."arglist"()
    unless $P10, rx1295_fail
    rx1295_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1295_pos = $P10."pos"()
    goto alt1301_end
  alt1301_3:
    set_addr $I10, alt1301_4
    rx1295_cur."!mark_push"(0, rx1295_pos, $I10)
.annotate 'line', 559
  # rx literal  "("
    add $I11, rx1295_pos, 1
    gt $I11, rx1295_eos, rx1295_fail
    sub $I11, rx1295_pos, rx1295_off
    substr $S10, rx1295_tgt, $I11, 1
    ne $S10, "(", rx1295_fail
    add rx1295_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1295_cur."!cursor_pos"(rx1295_pos)
    $P10 = rx1295_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1295_fail
    rx1295_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1295_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1295_pos, 1
    gt $I11, rx1295_eos, rx1295_fail
    sub $I11, rx1295_pos, rx1295_off
    substr $S10, rx1295_tgt, $I11, 1
    ne $S10, ")", rx1295_fail
    add rx1295_pos, 1
    goto alt1301_end
  alt1301_4:
.annotate 'line', 560
  # rx subrule "normspace" subtype=method negate=
    rx1295_cur."!cursor_pos"(rx1295_pos)
    $P10 = rx1295_cur."normspace"()
    unless $P10, rx1295_fail
    rx1295_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1295_cur."!cursor_pos"(rx1295_pos)
    $P10 = rx1295_cur."nibbler"()
    unless $P10, rx1295_fail
    rx1295_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1295_pos = $P10."pos"()
  alt1301_end:
.annotate 'line', 561
    (rx1295_rep) = rx1295_cur."!mark_commit"($I1306)
  rxquantr1300_done:
.annotate 'line', 553
  # rx pass
    rx1295_cur."!cursor_pass"(rx1295_pos, "assertion:sym<name>")
    rx1295_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1295_pos)
    .return (rx1295_cur)
  rx1295_fail:
.annotate 'line', 540
    (rx1295_rep, rx1295_pos, $I10, $P10) = rx1295_cur."!mark_fail"(0)
    lt rx1295_pos, -1, rx1295_done
    eq rx1295_pos, -1, rx1295_fail
    jump $I10
  rx1295_done:
    rx1295_cur."!cursor_fail"()
    rx1295_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1295_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("335_1273884026.76819") :method
.annotate 'line', 540
    new $P1297, "ResizablePMCArray"
    push $P1297, ""
    .return ($P1297)
.end


.namespace ["NQP";"Regex"]
.sub "_block1302"  :anon :subid("336_1273884026.76819") :method :outer("334_1273884026.76819")
.annotate 'line', 556
    .local string rx1304_tgt
    .local int rx1304_pos
    .local int rx1304_off
    .local int rx1304_eos
    .local int rx1304_rep
    .local pmc rx1304_cur
    (rx1304_cur, rx1304_pos, rx1304_tgt) = self."!cursor_start"()
    rx1304_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1304_cur
    .local pmc match
    .lex "$/", match
    length rx1304_eos, rx1304_tgt
    set rx1304_off, 0
    lt rx1304_pos, 2, rx1304_start
    sub rx1304_off, rx1304_pos, 1
    substr rx1304_tgt, rx1304_tgt, rx1304_off
  rx1304_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1305_done
    goto rxscan1305_scan
  rxscan1305_loop:
    ($P10) = rx1304_cur."from"()
    inc $P10
    set rx1304_pos, $P10
    ge rx1304_pos, rx1304_eos, rxscan1305_done
  rxscan1305_scan:
    set_addr $I10, rxscan1305_loop
    rx1304_cur."!mark_push"(0, rx1304_pos, $I10)
  rxscan1305_done:
  # rx literal  ">"
    add $I11, rx1304_pos, 1
    gt $I11, rx1304_eos, rx1304_fail
    sub $I11, rx1304_pos, rx1304_off
    substr $S10, rx1304_tgt, $I11, 1
    ne $S10, ">", rx1304_fail
    add rx1304_pos, 1
  # rx pass
    rx1304_cur."!cursor_pass"(rx1304_pos, "")
    rx1304_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1304_pos)
    .return (rx1304_cur)
  rx1304_fail:
    (rx1304_rep, rx1304_pos, $I10, $P10) = rx1304_cur."!mark_fail"(0)
    lt rx1304_pos, -1, rx1304_done
    eq rx1304_pos, -1, rx1304_fail
    jump $I10
  rx1304_done:
    rx1304_cur."!cursor_fail"()
    rx1304_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1304_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("337_1273884026.76819") :method :outer("326_1273884026.76819")
.annotate 'line', 540
    .local string rx1308_tgt
    .local int rx1308_pos
    .local int rx1308_off
    .local int rx1308_eos
    .local int rx1308_rep
    .local pmc rx1308_cur
    (rx1308_cur, rx1308_pos, rx1308_tgt) = self."!cursor_start"()
    rx1308_cur."!cursor_debug"("START ", "codeblock")
    .lex unicode:"$\x{a2}", rx1308_cur
    .local pmc match
    .lex "$/", match
    length rx1308_eos, rx1308_tgt
    set rx1308_off, 0
    lt rx1308_pos, 2, rx1308_start
    sub rx1308_off, rx1308_pos, 1
    substr rx1308_tgt, rx1308_tgt, rx1308_off
  rx1308_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1312_done
    goto rxscan1312_scan
  rxscan1312_loop:
    ($P10) = rx1308_cur."from"()
    inc $P10
    set rx1308_pos, $P10
    ge rx1308_pos, rx1308_eos, rxscan1312_done
  rxscan1312_scan:
    set_addr $I10, rxscan1312_loop
    rx1308_cur."!mark_push"(0, rx1308_pos, $I10)
  rxscan1312_done:
.annotate 'line', 566
  # rx subrule "LANG" subtype=capture negate=
    rx1308_cur."!cursor_pos"(rx1308_pos)
    $P10 = rx1308_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1308_fail
    rx1308_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1308_pos = $P10."pos"()
.annotate 'line', 565
  # rx pass
    rx1308_cur."!cursor_pass"(rx1308_pos, "codeblock")
    rx1308_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1308_pos)
    .return (rx1308_cur)
  rx1308_fail:
.annotate 'line', 540
    (rx1308_rep, rx1308_pos, $I10, $P10) = rx1308_cur."!mark_fail"(0)
    lt rx1308_pos, -1, rx1308_done
    eq rx1308_pos, -1, rx1308_fail
    jump $I10
  rx1308_done:
    rx1308_cur."!cursor_fail"()
    rx1308_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1308_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("338_1273884026.76819") :method
.annotate 'line', 540
    $P1310 = self."!PREFIX__!subrule"("block", "")
    new $P1311, "ResizablePMCArray"
    push $P1311, $P1310
    .return ($P1311)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1273884035.78954")
.annotate 'line', 0
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
.annotate 'line', 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
    $P2238 = $P14()
.annotate 'line', 1
    .return ($P2238)
.end


.namespace []
.sub "" :load :init :subid("post131") :outer("10_1273884035.78954")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1273884035.78954" 
    .local pmc block
    set block, $P12
    $P2239 = get_root_global ["parrot"], "P6metaclass"
    $P2239."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1273884035.78954") :outer("10_1273884035.78954")
.annotate 'line', 3
    .const 'Sub' $P2234 = "130_1273884035.78954" 
    capture_lex $P2234
    get_hll_global $P2169, ["NQP";"RegexActions"], "_block2168" 
    capture_lex $P2169
    .const 'Sub' $P2158 = "124_1273884035.78954" 
    capture_lex $P2158
    .const 'Sub' $P2151 = "123_1273884035.78954" 
    capture_lex $P2151
    .const 'Sub' $P2144 = "122_1273884035.78954" 
    capture_lex $P2144
    .const 'Sub' $P2137 = "121_1273884035.78954" 
    capture_lex $P2137
    .const 'Sub' $P2124 = "120_1273884035.78954" 
    capture_lex $P2124
    .const 'Sub' $P2114 = "119_1273884035.78954" 
    capture_lex $P2114
    .const 'Sub' $P2104 = "118_1273884035.78954" 
    capture_lex $P2104
    .const 'Sub' $P2094 = "117_1273884035.78954" 
    capture_lex $P2094
    .const 'Sub' $P2087 = "116_1273884035.78954" 
    capture_lex $P2087
    .const 'Sub' $P2073 = "115_1273884035.78954" 
    capture_lex $P2073
    .const 'Sub' $P2063 = "114_1273884035.78954" 
    capture_lex $P2063
    .const 'Sub' $P2026 = "113_1273884035.78954" 
    capture_lex $P2026
    .const 'Sub' $P2012 = "112_1273884035.78954" 
    capture_lex $P2012
    .const 'Sub' $P2002 = "111_1273884035.78954" 
    capture_lex $P2002
    .const 'Sub' $P1992 = "110_1273884035.78954" 
    capture_lex $P1992
    .const 'Sub' $P1982 = "109_1273884035.78954" 
    capture_lex $P1982
    .const 'Sub' $P1972 = "108_1273884035.78954" 
    capture_lex $P1972
    .const 'Sub' $P1962 = "107_1273884035.78954" 
    capture_lex $P1962
    .const 'Sub' $P1934 = "106_1273884035.78954" 
    capture_lex $P1934
    .const 'Sub' $P1917 = "105_1273884035.78954" 
    capture_lex $P1917
    .const 'Sub' $P1907 = "104_1273884035.78954" 
    capture_lex $P1907
    .const 'Sub' $P1894 = "103_1273884035.78954" 
    capture_lex $P1894
    .const 'Sub' $P1881 = "102_1273884035.78954" 
    capture_lex $P1881
    .const 'Sub' $P1868 = "101_1273884035.78954" 
    capture_lex $P1868
    .const 'Sub' $P1858 = "100_1273884035.78954" 
    capture_lex $P1858
    .const 'Sub' $P1829 = "99_1273884035.78954" 
    capture_lex $P1829
    .const 'Sub' $P1805 = "98_1273884035.78954" 
    capture_lex $P1805
    .const 'Sub' $P1795 = "97_1273884035.78954" 
    capture_lex $P1795
    .const 'Sub' $P1785 = "96_1273884035.78954" 
    capture_lex $P1785
    .const 'Sub' $P1758 = "95_1273884035.78954" 
    capture_lex $P1758
    .const 'Sub' $P1740 = "94_1273884035.78954" 
    capture_lex $P1740
    .const 'Sub' $P1730 = "93_1273884035.78954" 
    capture_lex $P1730
    .const 'Sub' $P1626 = "90_1273884035.78954" 
    capture_lex $P1626
    .const 'Sub' $P1616 = "89_1273884035.78954" 
    capture_lex $P1616
    .const 'Sub' $P1587 = "88_1273884035.78954" 
    capture_lex $P1587
    .const 'Sub' $P1545 = "87_1273884035.78954" 
    capture_lex $P1545
    .const 'Sub' $P1529 = "86_1273884035.78954" 
    capture_lex $P1529
    .const 'Sub' $P1520 = "85_1273884035.78954" 
    capture_lex $P1520
    .const 'Sub' $P1488 = "84_1273884035.78954" 
    capture_lex $P1488
    .const 'Sub' $P1389 = "81_1273884035.78954" 
    capture_lex $P1389
    .const 'Sub' $P1372 = "80_1273884035.78954" 
    capture_lex $P1372
    .const 'Sub' $P1352 = "79_1273884035.78954" 
    capture_lex $P1352
    .const 'Sub' $P1268 = "78_1273884035.78954" 
    capture_lex $P1268
    .const 'Sub' $P1244 = "76_1273884035.78954" 
    capture_lex $P1244
    .const 'Sub' $P1210 = "74_1273884035.78954" 
    capture_lex $P1210
    .const 'Sub' $P1160 = "72_1273884035.78954" 
    capture_lex $P1160
    .const 'Sub' $P1150 = "71_1273884035.78954" 
    capture_lex $P1150
    .const 'Sub' $P1140 = "70_1273884035.78954" 
    capture_lex $P1140
    .const 'Sub' $P1069 = "68_1273884035.78954" 
    capture_lex $P1069
    .const 'Sub' $P1052 = "67_1273884035.78954" 
    capture_lex $P1052
    .const 'Sub' $P1042 = "66_1273884035.78954" 
    capture_lex $P1042
    .const 'Sub' $P1032 = "65_1273884035.78954" 
    capture_lex $P1032
    .const 'Sub' $P1022 = "64_1273884035.78954" 
    capture_lex $P1022
    .const 'Sub' $P998 = "63_1273884035.78954" 
    capture_lex $P998
    .const 'Sub' $P945 = "62_1273884035.78954" 
    capture_lex $P945
    .const 'Sub' $P935 = "61_1273884035.78954" 
    capture_lex $P935
    .const 'Sub' $P846 = "59_1273884035.78954" 
    capture_lex $P846
    .const 'Sub' $P820 = "58_1273884035.78954" 
    capture_lex $P820
    .const 'Sub' $P804 = "57_1273884035.78954" 
    capture_lex $P804
    .const 'Sub' $P794 = "56_1273884035.78954" 
    capture_lex $P794
    .const 'Sub' $P784 = "55_1273884035.78954" 
    capture_lex $P784
    .const 'Sub' $P774 = "54_1273884035.78954" 
    capture_lex $P774
    .const 'Sub' $P764 = "53_1273884035.78954" 
    capture_lex $P764
    .const 'Sub' $P754 = "52_1273884035.78954" 
    capture_lex $P754
    .const 'Sub' $P744 = "51_1273884035.78954" 
    capture_lex $P744
    .const 'Sub' $P734 = "50_1273884035.78954" 
    capture_lex $P734
    .const 'Sub' $P724 = "49_1273884035.78954" 
    capture_lex $P724
    .const 'Sub' $P714 = "48_1273884035.78954" 
    capture_lex $P714
    .const 'Sub' $P704 = "47_1273884035.78954" 
    capture_lex $P704
    .const 'Sub' $P694 = "46_1273884035.78954" 
    capture_lex $P694
    .const 'Sub' $P684 = "45_1273884035.78954" 
    capture_lex $P684
    .const 'Sub' $P674 = "44_1273884035.78954" 
    capture_lex $P674
    .const 'Sub' $P656 = "43_1273884035.78954" 
    capture_lex $P656
    .const 'Sub' $P621 = "42_1273884035.78954" 
    capture_lex $P621
    .const 'Sub' $P605 = "41_1273884035.78954" 
    capture_lex $P605
    .const 'Sub' $P584 = "40_1273884035.78954" 
    capture_lex $P584
    .const 'Sub' $P564 = "39_1273884035.78954" 
    capture_lex $P564
    .const 'Sub' $P551 = "38_1273884035.78954" 
    capture_lex $P551
    .const 'Sub' $P525 = "37_1273884035.78954" 
    capture_lex $P525
    .const 'Sub' $P489 = "36_1273884035.78954" 
    capture_lex $P489
    .const 'Sub' $P472 = "35_1273884035.78954" 
    capture_lex $P472
    .const 'Sub' $P458 = "34_1273884035.78954" 
    capture_lex $P458
    .const 'Sub' $P405 = "32_1273884035.78954" 
    capture_lex $P405
    .const 'Sub' $P392 = "31_1273884035.78954" 
    capture_lex $P392
    .const 'Sub' $P372 = "30_1273884035.78954" 
    capture_lex $P372
    .const 'Sub' $P362 = "29_1273884035.78954" 
    capture_lex $P362
    .const 'Sub' $P352 = "28_1273884035.78954" 
    capture_lex $P352
    .const 'Sub' $P336 = "27_1273884035.78954" 
    capture_lex $P336
    .const 'Sub' $P276 = "25_1273884035.78954" 
    capture_lex $P276
    .const 'Sub' $P233 = "23_1273884035.78954" 
    capture_lex $P233
    .const 'Sub' $P214 = "22_1273884035.78954" 
    capture_lex $P214
    .const 'Sub' $P181 = "21_1273884035.78954" 
    capture_lex $P181
    .const 'Sub' $P171 = "20_1273884035.78954" 
    capture_lex $P171
    .const 'Sub' $P151 = "19_1273884035.78954" 
    capture_lex $P151
    .const 'Sub' $P100 = "18_1273884035.78954" 
    capture_lex $P100
    .const 'Sub' $P84 = "17_1273884035.78954" 
    capture_lex $P84
    .const 'Sub' $P63 = "16_1273884035.78954" 
    capture_lex $P63
    .const 'Sub' $P27 = "13_1273884035.78954" 
    capture_lex $P27
    .const 'Sub' $P16 = "12_1273884035.78954" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_134
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P15
  vivify_134:
.annotate 'line', 9
    .const 'Sub' $P16 = "12_1273884035.78954" 
    newclosure $P26, $P16
    .lex "xblock_immediate", $P26
.annotate 'line', 14
    .const 'Sub' $P27 = "13_1273884035.78954" 
    newclosure $P62, $P27
    .lex "block_immediate", $P62
.annotate 'line', 24
    .const 'Sub' $P63 = "16_1273884035.78954" 
    newclosure $P83, $P63
    .lex "vivitype", $P83
.annotate 'line', 43
    .const 'Sub' $P84 = "17_1273884035.78954" 
    newclosure $P99, $P84
    .lex "colonpair_str", $P99
.annotate 'line', 189
    .const 'Sub' $P100 = "18_1273884035.78954" 
    newclosure $P150, $P100
    .lex "push_block_handler", $P150
.annotate 'line', 769
    .const 'Sub' $P151 = "19_1273884035.78954" 
    newclosure $P166, $P151
    .lex "control", $P166
.annotate 'line', 3
    get_global $P167, "@BLOCK"
.annotate 'line', 5
    find_lex $P168, "xblock_immediate"
    find_lex $P169, "block_immediate"
    find_lex $P170, "vivitype"
.annotate 'line', 35
    find_lex $P213, "colonpair_str"
.annotate 'line', 182
    find_lex $P604, "push_block_handler"
.annotate 'line', 760
    find_lex $P2136, "control"
.annotate 'line', 791
    get_hll_global $P2169, ["NQP";"RegexActions"], "_block2168" 
    capture_lex $P2169
    $P2232 = $P2169()
.annotate 'line', 3
    .return ($P2232)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post132") :outer("11_1273884035.78954")
.annotate 'line', 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 5
    .const 'Sub' $P2234 = "130_1273884035.78954" 
    capture_lex $P2234
    $P2234()
    $P2237 = get_root_global ["parrot"], "P6metaclass"
    $P2237."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block2233"  :anon :subid("130_1273884035.78954") :outer("11_1273884035.78954")
.annotate 'line', 6
    get_global $P2235, "@BLOCK"
    unless_null $P2235, vivify_133
    $P2235 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P2235
  vivify_133:
 $P2236 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P2236
.annotate 'line', 5
    .return ($P2236)
.end


.namespace ["NQP";"Actions"]
.sub "xblock_immediate"  :subid("12_1273884035.78954") :outer("11_1273884035.78954")
    .param pmc param_19
.annotate 'line', 9
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(57)
    push_eh $P18
    .lex "$xblock", param_19
.annotate 'line', 10
    find_lex $P20, "$xblock"
    unless_null $P20, vivify_135
    $P20 = root_new ['parrot';'ResizablePMCArray']
  vivify_135:
    set $P21, $P20[1]
    unless_null $P21, vivify_136
    new $P21, "Undef"
  vivify_136:
    $P22 = "block_immediate"($P21)
    find_lex $P23, "$xblock"
    unless_null $P23, vivify_137
    $P23 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$xblock", $P23
  vivify_137:
    set $P23[1], $P22
    find_lex $P24, "$xblock"
.annotate 'line', 9
    .return ($P24)
  control_17:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P25, exception, "payload"
    .return ($P25)
.end


.namespace ["NQP";"Actions"]
.sub "block_immediate"  :subid("13_1273884035.78954") :outer("11_1273884035.78954")
    .param pmc param_30
.annotate 'line', 14
    .const 'Sub' $P40 = "14_1273884035.78954" 
    capture_lex $P40
    new $P29, 'ExceptionHandler'
    set_addr $P29, control_28
    $P29."handle_types"(57)
    push_eh $P29
    .lex "$block", param_30
.annotate 'line', 15
    find_lex $P31, "$block"
    $P31."blocktype"("immediate")
.annotate 'line', 16
    find_lex $P35, "$block"
    $P36 = $P35."symtable"()
    unless $P36, unless_34
    set $P33, $P36
    goto unless_34_end
  unless_34:
    find_lex $P37, "$block"
    $P38 = $P37."handlers"()
    set $P33, $P38
  unless_34_end:
    if $P33, unless_32_end
    .const 'Sub' $P40 = "14_1273884035.78954" 
    capture_lex $P40
    $P40()
  unless_32_end:
    find_lex $P60, "$block"
.annotate 'line', 14
    .return ($P60)
  control_28:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P61, exception, "payload"
    .return ($P61)
.end


.namespace ["NQP";"Actions"]
.sub "_block39"  :anon :subid("14_1273884035.78954") :outer("13_1273884035.78954")
.annotate 'line', 16
    .const 'Sub' $P51 = "15_1273884035.78954" 
    capture_lex $P51
.annotate 'line', 17
    new $P41, "Undef"
    .lex "$stmts", $P41
    get_hll_global $P42, ["PAST"], "Stmts"
    find_lex $P43, "$block"
    $P44 = $P42."new"($P43 :named("node"))
    store_lex "$stmts", $P44
.annotate 'line', 18
    find_lex $P46, "$block"
    $P47 = $P46."list"()
    defined $I48, $P47
    unless $I48, for_undef_138
    iter $P45, $P47
    new $P57, 'ExceptionHandler'
    set_addr $P57, loop56_handler
    $P57."handle_types"(64, 66, 65)
    push_eh $P57
  loop56_test:
    unless $P45, loop56_done
    shift $P49, $P45
  loop56_redo:
    .const 'Sub' $P51 = "15_1273884035.78954" 
    capture_lex $P51
    $P51($P49)
  loop56_next:
    goto loop56_test
  loop56_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P58, exception, 'type'
    eq $P58, 64, loop56_next
    eq $P58, 66, loop56_redo
  loop56_done:
    pop_eh 
  for_undef_138:
.annotate 'line', 19
    find_lex $P59, "$stmts"
    store_lex "$block", $P59
.annotate 'line', 16
    .return ($P59)
.end


.namespace ["NQP";"Actions"]
.sub "_block50"  :anon :subid("15_1273884035.78954") :outer("14_1273884035.78954")
    .param pmc param_52
.annotate 'line', 18
    .lex "$_", param_52
    find_lex $P53, "$stmts"
    find_lex $P54, "$_"
    $P55 = $P53."push"($P54)
    .return ($P55)
.end


.namespace ["NQP";"Actions"]
.sub "vivitype"  :subid("16_1273884035.78954") :outer("11_1273884035.78954")
    .param pmc param_66
.annotate 'line', 24
    new $P65, 'ExceptionHandler'
    set_addr $P65, control_64
    $P65."handle_types"(57)
    push_eh $P65
    .lex "$sigil", param_66
.annotate 'line', 25
    find_lex $P69, "$sigil"
    set $S70, $P69
    iseq $I71, $S70, "%"
    if $I71, if_68
.annotate 'line', 27
    find_lex $P76, "$sigil"
    set $S77, $P76
    iseq $I78, $S77, "@"
    if $I78, if_75
    new $P81, "String"
    assign $P81, "Undef"
    set $P74, $P81
    goto if_75_end
  if_75:
.annotate 'line', 28
    get_hll_global $P79, ["PAST"], "Op"
    $P80 = $P79."new"("    %r = root_new ['parrot';'ResizablePMCArray']" :named("inline"))
    set $P74, $P80
  if_75_end:
    set $P67, $P74
.annotate 'line', 25
    goto if_68_end
  if_68:
.annotate 'line', 26
    get_hll_global $P72, ["PAST"], "Op"
    $P73 = $P72."new"("    %r = root_new ['parrot';'Hash']" :named("inline"))
    set $P67, $P73
  if_68_end:
.annotate 'line', 24
    .return ($P67)
  control_64:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P82, exception, "payload"
    .return ($P82)
.end


.namespace ["NQP";"Actions"]
.sub "colonpair_str"  :subid("17_1273884035.78954") :outer("11_1273884035.78954")
    .param pmc param_87
.annotate 'line', 43
    new $P86, 'ExceptionHandler'
    set_addr $P86, control_85
    $P86."handle_types"(57)
    push_eh $P86
    .lex "$ast", param_87
.annotate 'line', 44
    get_hll_global $P90, ["PAST"], "Op"
    find_lex $P91, "$ast"
    $P92 = $P90."ACCEPTS"($P91)
    if $P92, if_89
.annotate 'line', 46
    find_lex $P96, "$ast"
    $P97 = $P96."value"()
    set $P88, $P97
.annotate 'line', 44
    goto if_89_end
  if_89:
.annotate 'line', 45
    find_lex $P93, "$ast"
    $P94 = $P93."list"()
    join $S95, " ", $P94
    new $P88, 'String'
    set $P88, $S95
  if_89_end:
.annotate 'line', 43
    .return ($P88)
  control_85:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P98, exception, "payload"
    .return ($P98)
.end


.namespace ["NQP";"Actions"]
.sub "push_block_handler"  :subid("18_1273884035.78954") :outer("11_1273884035.78954")
    .param pmc param_103
    .param pmc param_104
.annotate 'line', 189
    new $P102, 'ExceptionHandler'
    set_addr $P102, control_101
    $P102."handle_types"(57)
    push_eh $P102
    .lex "$/", param_103
    .lex "$block", param_104
.annotate 'line', 190
    get_global $P106, "@BLOCK"
    unless_null $P106, vivify_139
    $P106 = root_new ['parrot';'ResizablePMCArray']
  vivify_139:
    set $P107, $P106[0]
    unless_null $P107, vivify_140
    new $P107, "Undef"
  vivify_140:
    $P108 = $P107."handlers"()
    if $P108, unless_105_end
.annotate 'line', 191
    get_global $P109, "@BLOCK"
    unless_null $P109, vivify_141
    $P109 = root_new ['parrot';'ResizablePMCArray']
  vivify_141:
    set $P110, $P109[0]
    unless_null $P110, vivify_142
    new $P110, "Undef"
  vivify_142:
    new $P111, "ResizablePMCArray"
    $P110."handlers"($P111)
  unless_105_end:
.annotate 'line', 193
    find_lex $P113, "$block"
    $P114 = $P113."arity"()
    if $P114, unless_112_end
.annotate 'line', 194
    find_lex $P115, "$block"
.annotate 'line', 195
    get_hll_global $P116, ["PAST"], "Op"
.annotate 'line', 196
    get_hll_global $P117, ["PAST"], "Var"
    $P118 = $P117."new"("lexical" :named("scope"), "$!" :named("name"), 1 :named("isdecl"))
.annotate 'line', 197
    get_hll_global $P119, ["PAST"], "Var"
    $P120 = $P119."new"("lexical" :named("scope"), "$_" :named("name"))
    $P121 = $P116."new"($P118, $P120, "bind" :named("pasttype"))
.annotate 'line', 195
    $P115."unshift"($P121)
.annotate 'line', 200
    find_lex $P122, "$block"
    get_hll_global $P123, ["PAST"], "Var"
    $P124 = $P123."new"("$_" :named("name"), "parameter" :named("scope"))
    $P122."unshift"($P124)
.annotate 'line', 201
    find_lex $P125, "$block"
    $P125."symbol"("$_", "lexical" :named("scope"))
.annotate 'line', 202
    find_lex $P126, "$block"
    $P126."symbol"("$!", "lexical" :named("scope"))
.annotate 'line', 203
    find_lex $P127, "$block"
    $P127."arity"(1)
  unless_112_end:
.annotate 'line', 205
    find_lex $P128, "$block"
    $P128."blocktype"("declaration")
.annotate 'line', 206
    get_global $P129, "@BLOCK"
    unless_null $P129, vivify_143
    $P129 = root_new ['parrot';'ResizablePMCArray']
  vivify_143:
    set $P130, $P129[0]
    unless_null $P130, vivify_144
    new $P130, "Undef"
  vivify_144:
    $P131 = $P130."handlers"()
.annotate 'line', 207
    get_hll_global $P132, ["PAST"], "Control"
    find_lex $P133, "$/"
.annotate 'line', 209
    get_hll_global $P134, ["PAST"], "Stmts"
.annotate 'line', 210
    get_hll_global $P135, ["PAST"], "Op"
    find_lex $P136, "$block"
.annotate 'line', 212
    get_hll_global $P137, ["PAST"], "Var"
    $P138 = $P137."new"("register" :named("scope"), "exception" :named("name"))
    $P139 = $P135."new"($P136, $P138, "call" :named("pasttype"))
.annotate 'line', 214
    get_hll_global $P140, ["PAST"], "Op"
.annotate 'line', 215
    get_hll_global $P141, ["PAST"], "Var"
.annotate 'line', 216
    get_hll_global $P142, ["PAST"], "Var"
    $P143 = $P142."new"("register" :named("scope"), "exception" :named("name"))
    $P144 = $P141."new"($P143, "handled", "keyed" :named("scope"))
.annotate 'line', 215
    $P145 = $P140."new"($P144, 1, "bind" :named("pasttype"))
.annotate 'line', 214
    $P146 = $P134."new"($P139, $P145)
.annotate 'line', 209
    $P147 = $P132."new"($P146, $P133 :named("node"))
.annotate 'line', 207
    $P148 = $P131."unshift"($P147)
.annotate 'line', 189
    .return ($P148)
  control_101:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P149, exception, "payload"
    .return ($P149)
.end


.namespace ["NQP";"Actions"]
.sub "control"  :subid("19_1273884035.78954") :outer("11_1273884035.78954")
    .param pmc param_154
    .param pmc param_155
.annotate 'line', 769
    new $P153, 'ExceptionHandler'
    set_addr $P153, control_152
    $P153."handle_types"(57)
    push_eh $P153
    .lex "$/", param_154
    .lex "$id", param_155
.annotate 'line', 770
    find_lex $P156, "$/"
    get_hll_global $P157, ["PAST"], "Op"
    find_lex $P158, "$/"
.annotate 'line', 776
    new $P159, "String"
    assign $P159, "    %r[\"type\"] = "
    find_lex $P160, "$id"
    concat $P161, $P159, $P160
    new $P162, "ResizablePMCArray"
    push $P162, ".include \"except_types.pasm\""
    push $P162, "    %r = new \"Exception\""
    push $P162, $P161
    push $P162, "    throw %r"
    $P163 = $P157."new"($P158 :named("node"), "inline" :named("pasttype"), $P162 :named("inline"))
.annotate 'line', 770
    $P164 = $P156."!make"($P163)
.annotate 'line', 769
    .return ($P164)
  control_152:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P165, exception, "payload"
    .return ($P165)
.end


.namespace ["NQP";"Actions"]
.sub "TOP"  :subid("20_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_174
.annotate 'line', 33
    new $P173, 'ExceptionHandler'
    set_addr $P173, control_172
    $P173."handle_types"(57)
    push_eh $P173
    .lex "self", self
    .lex "$/", param_174
    find_lex $P175, "$/"
    find_lex $P176, "$/"
    unless_null $P176, vivify_145
    $P176 = root_new ['parrot';'Hash']
  vivify_145:
    set $P177, $P176["comp_unit"]
    unless_null $P177, vivify_146
    new $P177, "Undef"
  vivify_146:
    $P178 = $P177."ast"()
    $P179 = $P175."!make"($P178)
    .return ($P179)
  control_172:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P180, exception, "payload"
    .return ($P180)
.end


.namespace ["NQP";"Actions"]
.sub "deflongname"  :subid("21_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_184
.annotate 'line', 35
    new $P183, 'ExceptionHandler'
    set_addr $P183, control_182
    $P183."handle_types"(57)
    push_eh $P183
    .lex "self", self
    .lex "$/", param_184
.annotate 'line', 36
    find_lex $P185, "$/"
.annotate 'line', 37
    find_lex $P188, "$/"
    unless_null $P188, vivify_147
    $P188 = root_new ['parrot';'Hash']
  vivify_147:
    set $P189, $P188["colonpair"]
    unless_null $P189, vivify_148
    new $P189, "Undef"
  vivify_148:
    if $P189, if_187
.annotate 'line', 39
    find_lex $P209, "$/"
    set $S210, $P209
    new $P186, 'String'
    set $P186, $S210
.annotate 'line', 37
    goto if_187_end
  if_187:
    find_lex $P190, "$/"
    unless_null $P190, vivify_149
    $P190 = root_new ['parrot';'Hash']
  vivify_149:
    set $P191, $P190["identifier"]
    unless_null $P191, vivify_150
    new $P191, "Undef"
  vivify_150:
    set $S192, $P191
    new $P193, 'String'
    set $P193, $S192
    concat $P194, $P193, ":"
    find_lex $P195, "$/"
    unless_null $P195, vivify_151
    $P195 = root_new ['parrot';'Hash']
  vivify_151:
    set $P196, $P195["colonpair"]
    unless_null $P196, vivify_152
    $P196 = root_new ['parrot';'ResizablePMCArray']
  vivify_152:
    set $P197, $P196[0]
    unless_null $P197, vivify_153
    new $P197, "Undef"
  vivify_153:
    $P198 = $P197."ast"()
    $S199 = $P198."named"()
    concat $P200, $P194, $S199
    concat $P201, $P200, "<"
.annotate 'line', 38
    find_lex $P202, "$/"
    unless_null $P202, vivify_154
    $P202 = root_new ['parrot';'Hash']
  vivify_154:
    set $P203, $P202["colonpair"]
    unless_null $P203, vivify_155
    $P203 = root_new ['parrot';'ResizablePMCArray']
  vivify_155:
    set $P204, $P203[0]
    unless_null $P204, vivify_156
    new $P204, "Undef"
  vivify_156:
    $P205 = $P204."ast"()
    $S206 = "colonpair_str"($P205)
    concat $P207, $P201, $S206
    concat $P208, $P207, ">"
    set $P186, $P208
  if_187_end:
.annotate 'line', 37
    $P211 = $P185."!make"($P186)
.annotate 'line', 35
    .return ($P211)
  control_182:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P212, exception, "payload"
    .return ($P212)
.end


.namespace ["NQP";"Actions"]
.sub "comp_unit"  :subid("22_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_217
.annotate 'line', 49
    new $P216, 'ExceptionHandler'
    set_addr $P216, control_215
    $P216."handle_types"(57)
    push_eh $P216
    .lex "self", self
    .lex "$/", param_217
.annotate 'line', 50
    new $P218, "Undef"
    .lex "$past", $P218
.annotate 'line', 51
    new $P219, "Undef"
    .lex "$BLOCK", $P219
.annotate 'line', 50
    find_lex $P220, "$/"
    unless_null $P220, vivify_157
    $P220 = root_new ['parrot';'Hash']
  vivify_157:
    set $P221, $P220["statementlist"]
    unless_null $P221, vivify_158
    new $P221, "Undef"
  vivify_158:
    $P222 = $P221."ast"()
    store_lex "$past", $P222
.annotate 'line', 51
    get_global $P223, "@BLOCK"
    $P224 = $P223."shift"()
    store_lex "$BLOCK", $P224
.annotate 'line', 52
    find_lex $P225, "$BLOCK"
    find_lex $P226, "$past"
    $P225."push"($P226)
.annotate 'line', 53
    find_lex $P227, "$BLOCK"
    find_lex $P228, "$/"
    $P227."node"($P228)
.annotate 'line', 54
    find_lex $P229, "$/"
    find_lex $P230, "$BLOCK"
    $P231 = $P229."!make"($P230)
.annotate 'line', 49
    .return ($P231)
  control_215:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P232, exception, "payload"
    .return ($P232)
.end


.namespace ["NQP";"Actions"]
.sub "statementlist"  :subid("23_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_236
.annotate 'line', 57
    .const 'Sub' $P250 = "24_1273884035.78954" 
    capture_lex $P250
    new $P235, 'ExceptionHandler'
    set_addr $P235, control_234
    $P235."handle_types"(57)
    push_eh $P235
    .lex "self", self
    .lex "$/", param_236
.annotate 'line', 58
    new $P237, "Undef"
    .lex "$past", $P237
    get_hll_global $P238, ["PAST"], "Stmts"
    find_lex $P239, "$/"
    $P240 = $P238."new"($P239 :named("node"))
    store_lex "$past", $P240
.annotate 'line', 59
    find_lex $P242, "$/"
    unless_null $P242, vivify_159
    $P242 = root_new ['parrot';'Hash']
  vivify_159:
    set $P243, $P242["statement"]
    unless_null $P243, vivify_160
    new $P243, "Undef"
  vivify_160:
    unless $P243, if_241_end
.annotate 'line', 60
    find_lex $P245, "$/"
    unless_null $P245, vivify_161
    $P245 = root_new ['parrot';'Hash']
  vivify_161:
    set $P246, $P245["statement"]
    unless_null $P246, vivify_162
    new $P246, "Undef"
  vivify_162:
    defined $I247, $P246
    unless $I247, for_undef_163
    iter $P244, $P246
    new $P270, 'ExceptionHandler'
    set_addr $P270, loop269_handler
    $P270."handle_types"(64, 66, 65)
    push_eh $P270
  loop269_test:
    unless $P244, loop269_done
    shift $P248, $P244
  loop269_redo:
    .const 'Sub' $P250 = "24_1273884035.78954" 
    capture_lex $P250
    $P250($P248)
  loop269_next:
    goto loop269_test
  loop269_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P271, exception, 'type'
    eq $P271, 64, loop269_next
    eq $P271, 66, loop269_redo
  loop269_done:
    pop_eh 
  for_undef_163:
  if_241_end:
.annotate 'line', 67
    find_lex $P272, "$/"
    find_lex $P273, "$past"
    $P274 = $P272."!make"($P273)
.annotate 'line', 57
    .return ($P274)
  control_234:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P275, exception, "payload"
    .return ($P275)
.end


.namespace ["NQP";"Actions"]
.sub "_block249"  :anon :subid("24_1273884035.78954") :outer("23_1273884035.78954")
    .param pmc param_252
.annotate 'line', 61
    new $P251, "Undef"
    .lex "$ast", $P251
    .lex "$_", param_252
    find_lex $P253, "$_"
    $P254 = $P253."ast"()
    store_lex "$ast", $P254
.annotate 'line', 62
    find_lex $P256, "$ast"
    unless_null $P256, vivify_164
    $P256 = root_new ['parrot';'Hash']
  vivify_164:
    set $P257, $P256["sink"]
    unless_null $P257, vivify_165
    new $P257, "Undef"
  vivify_165:
    defined $I258, $P257
    unless $I258, if_255_end
    find_lex $P259, "$ast"
    unless_null $P259, vivify_166
    $P259 = root_new ['parrot';'Hash']
  vivify_166:
    set $P260, $P259["sink"]
    unless_null $P260, vivify_167
    new $P260, "Undef"
  vivify_167:
    store_lex "$ast", $P260
  if_255_end:
.annotate 'line', 63
    find_lex $P262, "$ast"
    unless_null $P262, vivify_168
    $P262 = root_new ['parrot';'Hash']
  vivify_168:
    set $P263, $P262["bareblock"]
    unless_null $P263, vivify_169
    new $P263, "Undef"
  vivify_169:
    unless $P263, if_261_end
    find_lex $P264, "$ast"
    $P265 = "block_immediate"($P264)
    store_lex "$ast", $P265
  if_261_end:
.annotate 'line', 64
    find_lex $P266, "$past"
    find_lex $P267, "$ast"
    $P268 = $P266."push"($P267)
.annotate 'line', 60
    .return ($P268)
.end


.namespace ["NQP";"Actions"]
.sub "statement"  :subid("25_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_279
    .param pmc param_280 :optional
    .param int has_param_280 :opt_flag
.annotate 'line', 70
    .const 'Sub' $P288 = "26_1273884035.78954" 
    capture_lex $P288
    new $P278, 'ExceptionHandler'
    set_addr $P278, control_277
    $P278."handle_types"(57)
    push_eh $P278
    .lex "self", self
    .lex "$/", param_279
    if has_param_280, optparam_170
    new $P281, "Undef"
    set param_280, $P281
  optparam_170:
    .lex "$key", param_280
.annotate 'line', 71
    new $P282, "Undef"
    .lex "$past", $P282
.annotate 'line', 70
    find_lex $P283, "$past"
.annotate 'line', 72
    find_lex $P285, "$/"
    unless_null $P285, vivify_171
    $P285 = root_new ['parrot';'Hash']
  vivify_171:
    set $P286, $P285["EXPR"]
    unless_null $P286, vivify_172
    new $P286, "Undef"
  vivify_172:
    if $P286, if_284
.annotate 'line', 83
    find_lex $P326, "$/"
    unless_null $P326, vivify_173
    $P326 = root_new ['parrot';'Hash']
  vivify_173:
    set $P327, $P326["statement_control"]
    unless_null $P327, vivify_174
    new $P327, "Undef"
  vivify_174:
    if $P327, if_325
.annotate 'line', 84
    new $P331, "Integer"
    assign $P331, 0
    store_lex "$past", $P331
    goto if_325_end
  if_325:
.annotate 'line', 83
    find_lex $P328, "$/"
    unless_null $P328, vivify_175
    $P328 = root_new ['parrot';'Hash']
  vivify_175:
    set $P329, $P328["statement_control"]
    unless_null $P329, vivify_176
    new $P329, "Undef"
  vivify_176:
    $P330 = $P329."ast"()
    store_lex "$past", $P330
  if_325_end:
    goto if_284_end
  if_284:
.annotate 'line', 72
    .const 'Sub' $P288 = "26_1273884035.78954" 
    capture_lex $P288
    $P288()
  if_284_end:
.annotate 'line', 85
    find_lex $P332, "$/"
    find_lex $P333, "$past"
    $P334 = $P332."!make"($P333)
.annotate 'line', 70
    .return ($P334)
  control_277:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P335, exception, "payload"
    .return ($P335)
.end


.namespace ["NQP";"Actions"]
.sub "_block287"  :anon :subid("26_1273884035.78954") :outer("25_1273884035.78954")
.annotate 'line', 73
    new $P289, "Undef"
    .lex "$mc", $P289
.annotate 'line', 74
    new $P290, "Undef"
    .lex "$ml", $P290
.annotate 'line', 73
    find_lex $P291, "$/"
    unless_null $P291, vivify_177
    $P291 = root_new ['parrot';'Hash']
  vivify_177:
    set $P292, $P291["statement_mod_cond"]
    unless_null $P292, vivify_178
    $P292 = root_new ['parrot';'ResizablePMCArray']
  vivify_178:
    set $P293, $P292[0]
    unless_null $P293, vivify_179
    new $P293, "Undef"
  vivify_179:
    store_lex "$mc", $P293
.annotate 'line', 74
    find_lex $P294, "$/"
    unless_null $P294, vivify_180
    $P294 = root_new ['parrot';'Hash']
  vivify_180:
    set $P295, $P294["statement_mod_loop"]
    unless_null $P295, vivify_181
    $P295 = root_new ['parrot';'ResizablePMCArray']
  vivify_181:
    set $P296, $P295[0]
    unless_null $P296, vivify_182
    new $P296, "Undef"
  vivify_182:
    store_lex "$ml", $P296
.annotate 'line', 75
    find_lex $P297, "$/"
    unless_null $P297, vivify_183
    $P297 = root_new ['parrot';'Hash']
  vivify_183:
    set $P298, $P297["EXPR"]
    unless_null $P298, vivify_184
    new $P298, "Undef"
  vivify_184:
    $P299 = $P298."ast"()
    store_lex "$past", $P299
.annotate 'line', 76
    find_lex $P301, "$mc"
    unless $P301, if_300_end
.annotate 'line', 77
    get_hll_global $P302, ["PAST"], "Op"
    find_lex $P303, "$mc"
    unless_null $P303, vivify_185
    $P303 = root_new ['parrot';'Hash']
  vivify_185:
    set $P304, $P303["cond"]
    unless_null $P304, vivify_186
    new $P304, "Undef"
  vivify_186:
    $P305 = $P304."ast"()
    find_lex $P306, "$past"
    find_lex $P307, "$mc"
    unless_null $P307, vivify_187
    $P307 = root_new ['parrot';'Hash']
  vivify_187:
    set $P308, $P307["sym"]
    unless_null $P308, vivify_188
    new $P308, "Undef"
  vivify_188:
    set $S309, $P308
    find_lex $P310, "$/"
    $P311 = $P302."new"($P305, $P306, $S309 :named("pasttype"), $P310 :named("node"))
    store_lex "$past", $P311
  if_300_end:
.annotate 'line', 79
    find_lex $P314, "$ml"
    if $P314, if_313
    set $P312, $P314
    goto if_313_end
  if_313:
.annotate 'line', 80
    get_hll_global $P315, ["PAST"], "Op"
    find_lex $P316, "$ml"
    unless_null $P316, vivify_189
    $P316 = root_new ['parrot';'Hash']
  vivify_189:
    set $P317, $P316["cond"]
    unless_null $P317, vivify_190
    new $P317, "Undef"
  vivify_190:
    $P318 = $P317."ast"()
    find_lex $P319, "$past"
    find_lex $P320, "$ml"
    unless_null $P320, vivify_191
    $P320 = root_new ['parrot';'Hash']
  vivify_191:
    set $P321, $P320["sym"]
    unless_null $P321, vivify_192
    new $P321, "Undef"
  vivify_192:
    set $S322, $P321
    find_lex $P323, "$/"
    $P324 = $P315."new"($P318, $P319, $S322 :named("pasttype"), $P323 :named("node"))
    store_lex "$past", $P324
.annotate 'line', 79
    set $P312, $P324
  if_313_end:
.annotate 'line', 72
    .return ($P312)
.end


.namespace ["NQP";"Actions"]
.sub "xblock"  :subid("27_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_339
.annotate 'line', 88
    new $P338, 'ExceptionHandler'
    set_addr $P338, control_337
    $P338."handle_types"(57)
    push_eh $P338
    .lex "self", self
    .lex "$/", param_339
.annotate 'line', 89
    find_lex $P340, "$/"
    get_hll_global $P341, ["PAST"], "Op"
    find_lex $P342, "$/"
    unless_null $P342, vivify_193
    $P342 = root_new ['parrot';'Hash']
  vivify_193:
    set $P343, $P342["EXPR"]
    unless_null $P343, vivify_194
    new $P343, "Undef"
  vivify_194:
    $P344 = $P343."ast"()
    find_lex $P345, "$/"
    unless_null $P345, vivify_195
    $P345 = root_new ['parrot';'Hash']
  vivify_195:
    set $P346, $P345["pblock"]
    unless_null $P346, vivify_196
    new $P346, "Undef"
  vivify_196:
    $P347 = $P346."ast"()
    find_lex $P348, "$/"
    $P349 = $P341."new"($P344, $P347, "if" :named("pasttype"), $P348 :named("node"))
    $P350 = $P340."!make"($P349)
.annotate 'line', 88
    .return ($P350)
  control_337:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P351, exception, "payload"
    .return ($P351)
.end


.namespace ["NQP";"Actions"]
.sub "pblock"  :subid("28_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_355
.annotate 'line', 92
    new $P354, 'ExceptionHandler'
    set_addr $P354, control_353
    $P354."handle_types"(57)
    push_eh $P354
    .lex "self", self
    .lex "$/", param_355
.annotate 'line', 93
    find_lex $P356, "$/"
    find_lex $P357, "$/"
    unless_null $P357, vivify_197
    $P357 = root_new ['parrot';'Hash']
  vivify_197:
    set $P358, $P357["blockoid"]
    unless_null $P358, vivify_198
    new $P358, "Undef"
  vivify_198:
    $P359 = $P358."ast"()
    $P360 = $P356."!make"($P359)
.annotate 'line', 92
    .return ($P360)
  control_353:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P361, exception, "payload"
    .return ($P361)
.end


.namespace ["NQP";"Actions"]
.sub "block"  :subid("29_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_365
.annotate 'line', 96
    new $P364, 'ExceptionHandler'
    set_addr $P364, control_363
    $P364."handle_types"(57)
    push_eh $P364
    .lex "self", self
    .lex "$/", param_365
.annotate 'line', 97
    find_lex $P366, "$/"
    find_lex $P367, "$/"
    unless_null $P367, vivify_199
    $P367 = root_new ['parrot';'Hash']
  vivify_199:
    set $P368, $P367["blockoid"]
    unless_null $P368, vivify_200
    new $P368, "Undef"
  vivify_200:
    $P369 = $P368."ast"()
    $P370 = $P366."!make"($P369)
.annotate 'line', 96
    .return ($P370)
  control_363:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P371, exception, "payload"
    .return ($P371)
.end


.namespace ["NQP";"Actions"]
.sub "blockoid"  :subid("30_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_375
.annotate 'line', 100
    new $P374, 'ExceptionHandler'
    set_addr $P374, control_373
    $P374."handle_types"(57)
    push_eh $P374
    .lex "self", self
    .lex "$/", param_375
.annotate 'line', 101
    new $P376, "Undef"
    .lex "$past", $P376
.annotate 'line', 102
    new $P377, "Undef"
    .lex "$BLOCK", $P377
.annotate 'line', 101
    find_lex $P378, "$/"
    unless_null $P378, vivify_201
    $P378 = root_new ['parrot';'Hash']
  vivify_201:
    set $P379, $P378["statementlist"]
    unless_null $P379, vivify_202
    new $P379, "Undef"
  vivify_202:
    $P380 = $P379."ast"()
    store_lex "$past", $P380
.annotate 'line', 102
    get_global $P381, "@BLOCK"
    $P382 = $P381."shift"()
    store_lex "$BLOCK", $P382
.annotate 'line', 103
    find_lex $P383, "$BLOCK"
    find_lex $P384, "$past"
    $P383."push"($P384)
.annotate 'line', 104
    find_lex $P385, "$BLOCK"
    find_lex $P386, "$/"
    $P385."node"($P386)
.annotate 'line', 105
    find_lex $P387, "$BLOCK"
    $P387."closure"(1)
.annotate 'line', 106
    find_lex $P388, "$/"
    find_lex $P389, "$BLOCK"
    $P390 = $P388."!make"($P389)
.annotate 'line', 100
    .return ($P390)
  control_373:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P391, exception, "payload"
    .return ($P391)
.end


.namespace ["NQP";"Actions"]
.sub "newpad"  :subid("31_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_395
.annotate 'line', 109
    new $P394, 'ExceptionHandler'
    set_addr $P394, control_393
    $P394."handle_types"(57)
    push_eh $P394
    .lex "self", self
    .lex "$/", param_395
.annotate 'line', 110
    get_global $P396, "@BLOCK"
    unless_null $P396, vivify_203
    $P396 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P396
  vivify_203:
.annotate 'line', 109
    get_global $P397, "@BLOCK"
.annotate 'line', 111
    get_global $P398, "@BLOCK"
    get_hll_global $P399, ["PAST"], "Block"
    get_hll_global $P400, ["PAST"], "Stmts"
    $P401 = $P400."new"()
    $P402 = $P399."new"($P401)
    $P403 = $P398."unshift"($P402)
.annotate 'line', 109
    .return ($P403)
  control_393:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P404, exception, "payload"
    .return ($P404)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<if>"  :subid("32_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_408
.annotate 'line', 116
    .const 'Sub' $P436 = "33_1273884035.78954" 
    capture_lex $P436
    new $P407, 'ExceptionHandler'
    set_addr $P407, control_406
    $P407."handle_types"(57)
    push_eh $P407
    .lex "self", self
    .lex "$/", param_408
.annotate 'line', 117
    new $P409, "Undef"
    .lex "$count", $P409
.annotate 'line', 118
    new $P410, "Undef"
    .lex "$past", $P410
.annotate 'line', 117
    find_lex $P411, "$/"
    unless_null $P411, vivify_204
    $P411 = root_new ['parrot';'Hash']
  vivify_204:
    set $P412, $P411["xblock"]
    unless_null $P412, vivify_205
    new $P412, "Undef"
  vivify_205:
    set $N413, $P412
    new $P414, 'Float'
    set $P414, $N413
    sub $P415, $P414, 1
    store_lex "$count", $P415
.annotate 'line', 118
    find_lex $P416, "$count"
    set $I417, $P416
    find_lex $P418, "$/"
    unless_null $P418, vivify_206
    $P418 = root_new ['parrot';'Hash']
  vivify_206:
    set $P419, $P418["xblock"]
    unless_null $P419, vivify_207
    $P419 = root_new ['parrot';'ResizablePMCArray']
  vivify_207:
    set $P420, $P419[$I417]
    unless_null $P420, vivify_208
    new $P420, "Undef"
  vivify_208:
    $P421 = $P420."ast"()
    $P422 = "xblock_immediate"($P421)
    store_lex "$past", $P422
.annotate 'line', 119
    find_lex $P424, "$/"
    unless_null $P424, vivify_209
    $P424 = root_new ['parrot';'Hash']
  vivify_209:
    set $P425, $P424["else"]
    unless_null $P425, vivify_210
    new $P425, "Undef"
  vivify_210:
    unless $P425, if_423_end
.annotate 'line', 120
    find_lex $P426, "$past"
    find_lex $P427, "$/"
    unless_null $P427, vivify_211
    $P427 = root_new ['parrot';'Hash']
  vivify_211:
    set $P428, $P427["else"]
    unless_null $P428, vivify_212
    $P428 = root_new ['parrot';'ResizablePMCArray']
  vivify_212:
    set $P429, $P428[0]
    unless_null $P429, vivify_213
    new $P429, "Undef"
  vivify_213:
    $P430 = $P429."ast"()
    $P431 = "block_immediate"($P430)
    $P426."push"($P431)
  if_423_end:
.annotate 'line', 123
    new $P452, 'ExceptionHandler'
    set_addr $P452, loop451_handler
    $P452."handle_types"(64, 66, 65)
    push_eh $P452
  loop451_test:
    find_lex $P432, "$count"
    set $N433, $P432
    isgt $I434, $N433, 0.0
    unless $I434, loop451_done
  loop451_redo:
    .const 'Sub' $P436 = "33_1273884035.78954" 
    capture_lex $P436
    $P436()
  loop451_next:
    goto loop451_test
  loop451_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P453, exception, 'type'
    eq $P453, 64, loop451_next
    eq $P453, 66, loop451_redo
  loop451_done:
    pop_eh 
.annotate 'line', 129
    find_lex $P454, "$/"
    find_lex $P455, "$past"
    $P456 = $P454."!make"($P455)
.annotate 'line', 116
    .return ($P456)
  control_406:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P457, exception, "payload"
    .return ($P457)
.end


.namespace ["NQP";"Actions"]
.sub "_block435"  :anon :subid("33_1273884035.78954") :outer("32_1273884035.78954")
.annotate 'line', 125
    new $P437, "Undef"
    .lex "$else", $P437
.annotate 'line', 123
    find_lex $P438, "$count"
    clone $P439, $P438
    dec $P438
.annotate 'line', 125
    find_lex $P440, "$past"
    store_lex "$else", $P440
.annotate 'line', 126
    find_lex $P441, "$count"
    set $I442, $P441
    find_lex $P443, "$/"
    unless_null $P443, vivify_214
    $P443 = root_new ['parrot';'Hash']
  vivify_214:
    set $P444, $P443["xblock"]
    unless_null $P444, vivify_215
    $P444 = root_new ['parrot';'ResizablePMCArray']
  vivify_215:
    set $P445, $P444[$I442]
    unless_null $P445, vivify_216
    new $P445, "Undef"
  vivify_216:
    $P446 = $P445."ast"()
    $P447 = "xblock_immediate"($P446)
    store_lex "$past", $P447
.annotate 'line', 127
    find_lex $P448, "$past"
    find_lex $P449, "$else"
    $P450 = $P448."push"($P449)
.annotate 'line', 123
    .return ($P450)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<unless>"  :subid("34_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_461
.annotate 'line', 132
    new $P460, 'ExceptionHandler'
    set_addr $P460, control_459
    $P460."handle_types"(57)
    push_eh $P460
    .lex "self", self
    .lex "$/", param_461
.annotate 'line', 133
    new $P462, "Undef"
    .lex "$past", $P462
    find_lex $P463, "$/"
    unless_null $P463, vivify_217
    $P463 = root_new ['parrot';'Hash']
  vivify_217:
    set $P464, $P463["xblock"]
    unless_null $P464, vivify_218
    new $P464, "Undef"
  vivify_218:
    $P465 = $P464."ast"()
    $P466 = "xblock_immediate"($P465)
    store_lex "$past", $P466
.annotate 'line', 134
    find_lex $P467, "$past"
    $P467."pasttype"("unless")
.annotate 'line', 135
    find_lex $P468, "$/"
    find_lex $P469, "$past"
    $P470 = $P468."!make"($P469)
.annotate 'line', 132
    .return ($P470)
  control_459:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P471, exception, "payload"
    .return ($P471)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<while>"  :subid("35_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_475
.annotate 'line', 138
    new $P474, 'ExceptionHandler'
    set_addr $P474, control_473
    $P474."handle_types"(57)
    push_eh $P474
    .lex "self", self
    .lex "$/", param_475
.annotate 'line', 139
    new $P476, "Undef"
    .lex "$past", $P476
    find_lex $P477, "$/"
    unless_null $P477, vivify_219
    $P477 = root_new ['parrot';'Hash']
  vivify_219:
    set $P478, $P477["xblock"]
    unless_null $P478, vivify_220
    new $P478, "Undef"
  vivify_220:
    $P479 = $P478."ast"()
    $P480 = "xblock_immediate"($P479)
    store_lex "$past", $P480
.annotate 'line', 140
    find_lex $P481, "$past"
    find_lex $P482, "$/"
    unless_null $P482, vivify_221
    $P482 = root_new ['parrot';'Hash']
  vivify_221:
    set $P483, $P482["sym"]
    unless_null $P483, vivify_222
    new $P483, "Undef"
  vivify_222:
    set $S484, $P483
    $P481."pasttype"($S484)
.annotate 'line', 141
    find_lex $P485, "$/"
    find_lex $P486, "$past"
    $P487 = $P485."!make"($P486)
.annotate 'line', 138
    .return ($P487)
  control_473:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P488, exception, "payload"
    .return ($P488)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<repeat>"  :subid("36_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_492
.annotate 'line', 144
    new $P491, 'ExceptionHandler'
    set_addr $P491, control_490
    $P491."handle_types"(57)
    push_eh $P491
    .lex "self", self
    .lex "$/", param_492
.annotate 'line', 145
    new $P493, "Undef"
    .lex "$pasttype", $P493
.annotate 'line', 146
    new $P494, "Undef"
    .lex "$past", $P494
.annotate 'line', 145
    new $P495, "String"
    assign $P495, "repeat_"
    find_lex $P496, "$/"
    unless_null $P496, vivify_223
    $P496 = root_new ['parrot';'Hash']
  vivify_223:
    set $P497, $P496["wu"]
    unless_null $P497, vivify_224
    new $P497, "Undef"
  vivify_224:
    set $S498, $P497
    concat $P499, $P495, $S498
    store_lex "$pasttype", $P499
    find_lex $P500, "$past"
.annotate 'line', 147
    find_lex $P502, "$/"
    unless_null $P502, vivify_225
    $P502 = root_new ['parrot';'Hash']
  vivify_225:
    set $P503, $P502["xblock"]
    unless_null $P503, vivify_226
    new $P503, "Undef"
  vivify_226:
    if $P503, if_501
.annotate 'line', 152
    get_hll_global $P510, ["PAST"], "Op"
    find_lex $P511, "$/"
    unless_null $P511, vivify_227
    $P511 = root_new ['parrot';'Hash']
  vivify_227:
    set $P512, $P511["EXPR"]
    unless_null $P512, vivify_228
    new $P512, "Undef"
  vivify_228:
    $P513 = $P512."ast"()
    find_lex $P514, "$/"
    unless_null $P514, vivify_229
    $P514 = root_new ['parrot';'Hash']
  vivify_229:
    set $P515, $P514["pblock"]
    unless_null $P515, vivify_230
    new $P515, "Undef"
  vivify_230:
    $P516 = $P515."ast"()
    $P517 = "block_immediate"($P516)
    find_lex $P518, "$pasttype"
    find_lex $P519, "$/"
    $P520 = $P510."new"($P513, $P517, $P518 :named("pasttype"), $P519 :named("node"))
    store_lex "$past", $P520
.annotate 'line', 151
    goto if_501_end
  if_501:
.annotate 'line', 148
    find_lex $P504, "$/"
    unless_null $P504, vivify_231
    $P504 = root_new ['parrot';'Hash']
  vivify_231:
    set $P505, $P504["xblock"]
    unless_null $P505, vivify_232
    new $P505, "Undef"
  vivify_232:
    $P506 = $P505."ast"()
    $P507 = "xblock_immediate"($P506)
    store_lex "$past", $P507
.annotate 'line', 149
    find_lex $P508, "$past"
    find_lex $P509, "$pasttype"
    $P508."pasttype"($P509)
  if_501_end:
.annotate 'line', 155
    find_lex $P521, "$/"
    find_lex $P522, "$past"
    $P523 = $P521."!make"($P522)
.annotate 'line', 144
    .return ($P523)
  control_490:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P524, exception, "payload"
    .return ($P524)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<for>"  :subid("37_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_528
.annotate 'line', 158
    new $P527, 'ExceptionHandler'
    set_addr $P527, control_526
    $P527."handle_types"(57)
    push_eh $P527
    .lex "self", self
    .lex "$/", param_528
.annotate 'line', 159
    new $P529, "Undef"
    .lex "$past", $P529
.annotate 'line', 161
    new $P530, "Undef"
    .lex "$block", $P530
.annotate 'line', 159
    find_lex $P531, "$/"
    unless_null $P531, vivify_233
    $P531 = root_new ['parrot';'Hash']
  vivify_233:
    set $P532, $P531["xblock"]
    unless_null $P532, vivify_234
    new $P532, "Undef"
  vivify_234:
    $P533 = $P532."ast"()
    store_lex "$past", $P533
.annotate 'line', 160
    find_lex $P534, "$past"
    $P534."pasttype"("for")
.annotate 'line', 161
    find_lex $P535, "$past"
    unless_null $P535, vivify_235
    $P535 = root_new ['parrot';'ResizablePMCArray']
  vivify_235:
    set $P536, $P535[1]
    unless_null $P536, vivify_236
    new $P536, "Undef"
  vivify_236:
    store_lex "$block", $P536
.annotate 'line', 162
    find_lex $P538, "$block"
    $P539 = $P538."arity"()
    if $P539, unless_537_end
.annotate 'line', 163
    find_lex $P540, "$block"
    unless_null $P540, vivify_237
    $P540 = root_new ['parrot';'ResizablePMCArray']
  vivify_237:
    set $P541, $P540[0]
    unless_null $P541, vivify_238
    new $P541, "Undef"
  vivify_238:
    get_hll_global $P542, ["PAST"], "Var"
    $P543 = $P542."new"("$_" :named("name"), "parameter" :named("scope"))
    $P541."push"($P543)
.annotate 'line', 164
    find_lex $P544, "$block"
    $P544."symbol"("$_", "lexical" :named("scope"))
.annotate 'line', 165
    find_lex $P545, "$block"
    $P545."arity"(1)
  unless_537_end:
.annotate 'line', 167
    find_lex $P546, "$block"
    $P546."blocktype"("immediate")
.annotate 'line', 168
    find_lex $P547, "$/"
    find_lex $P548, "$past"
    $P549 = $P547."!make"($P548)
.annotate 'line', 158
    .return ($P549)
  control_526:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P550, exception, "payload"
    .return ($P550)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<return>"  :subid("38_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_554
.annotate 'line', 171
    new $P553, 'ExceptionHandler'
    set_addr $P553, control_552
    $P553."handle_types"(57)
    push_eh $P553
    .lex "self", self
    .lex "$/", param_554
.annotate 'line', 172
    find_lex $P555, "$/"
    get_hll_global $P556, ["PAST"], "Op"
    find_lex $P557, "$/"
    unless_null $P557, vivify_239
    $P557 = root_new ['parrot';'Hash']
  vivify_239:
    set $P558, $P557["EXPR"]
    unless_null $P558, vivify_240
    new $P558, "Undef"
  vivify_240:
    $P559 = $P558."ast"()
    find_lex $P560, "$/"
    $P561 = $P556."new"($P559, "return" :named("pasttype"), $P560 :named("node"))
    $P562 = $P555."!make"($P561)
.annotate 'line', 171
    .return ($P562)
  control_552:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P563, exception, "payload"
    .return ($P563)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<CATCH>"  :subid("39_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_567
.annotate 'line', 175
    new $P566, 'ExceptionHandler'
    set_addr $P566, control_565
    $P566."handle_types"(57)
    push_eh $P566
    .lex "self", self
    .lex "$/", param_567
.annotate 'line', 176
    new $P568, "Undef"
    .lex "$block", $P568
    find_lex $P569, "$/"
    unless_null $P569, vivify_241
    $P569 = root_new ['parrot';'Hash']
  vivify_241:
    set $P570, $P569["block"]
    unless_null $P570, vivify_242
    new $P570, "Undef"
  vivify_242:
    $P571 = $P570."ast"()
    store_lex "$block", $P571
.annotate 'line', 177
    find_lex $P572, "$/"
    find_lex $P573, "$block"
    "push_block_handler"($P572, $P573)
.annotate 'line', 178
    get_global $P574, "@BLOCK"
    unless_null $P574, vivify_243
    $P574 = root_new ['parrot';'ResizablePMCArray']
  vivify_243:
    set $P575, $P574[0]
    unless_null $P575, vivify_244
    new $P575, "Undef"
  vivify_244:
    $P576 = $P575."handlers"()
    set $P577, $P576[0]
    unless_null $P577, vivify_245
    new $P577, "Undef"
  vivify_245:
    $P577."handle_types_except"("CONTROL")
.annotate 'line', 179
    find_lex $P578, "$/"
    get_hll_global $P579, ["PAST"], "Stmts"
    find_lex $P580, "$/"
    $P581 = $P579."new"($P580 :named("node"))
    $P582 = $P578."!make"($P581)
.annotate 'line', 175
    .return ($P582)
  control_565:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P583, exception, "payload"
    .return ($P583)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<CONTROL>"  :subid("40_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_587
.annotate 'line', 182
    new $P586, 'ExceptionHandler'
    set_addr $P586, control_585
    $P586."handle_types"(57)
    push_eh $P586
    .lex "self", self
    .lex "$/", param_587
.annotate 'line', 183
    new $P588, "Undef"
    .lex "$block", $P588
    find_lex $P589, "$/"
    unless_null $P589, vivify_246
    $P589 = root_new ['parrot';'Hash']
  vivify_246:
    set $P590, $P589["block"]
    unless_null $P590, vivify_247
    new $P590, "Undef"
  vivify_247:
    $P591 = $P590."ast"()
    store_lex "$block", $P591
.annotate 'line', 184
    find_lex $P592, "$/"
    find_lex $P593, "$block"
    "push_block_handler"($P592, $P593)
.annotate 'line', 185
    get_global $P594, "@BLOCK"
    unless_null $P594, vivify_248
    $P594 = root_new ['parrot';'ResizablePMCArray']
  vivify_248:
    set $P595, $P594[0]
    unless_null $P595, vivify_249
    new $P595, "Undef"
  vivify_249:
    $P596 = $P595."handlers"()
    set $P597, $P596[0]
    unless_null $P597, vivify_250
    new $P597, "Undef"
  vivify_250:
    $P597."handle_types"("CONTROL")
.annotate 'line', 186
    find_lex $P598, "$/"
    get_hll_global $P599, ["PAST"], "Stmts"
    find_lex $P600, "$/"
    $P601 = $P599."new"($P600 :named("node"))
    $P602 = $P598."!make"($P601)
.annotate 'line', 182
    .return ($P602)
  control_585:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P603, exception, "payload"
    .return ($P603)
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<INIT>"  :subid("41_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_608
.annotate 'line', 226
    new $P607, 'ExceptionHandler'
    set_addr $P607, control_606
    $P607."handle_types"(57)
    push_eh $P607
    .lex "self", self
    .lex "$/", param_608
.annotate 'line', 227
    get_global $P609, "@BLOCK"
    unless_null $P609, vivify_251
    $P609 = root_new ['parrot';'ResizablePMCArray']
  vivify_251:
    set $P610, $P609[0]
    unless_null $P610, vivify_252
    new $P610, "Undef"
  vivify_252:
    $P611 = $P610."loadinit"()
    find_lex $P612, "$/"
    unless_null $P612, vivify_253
    $P612 = root_new ['parrot';'Hash']
  vivify_253:
    set $P613, $P612["blorst"]
    unless_null $P613, vivify_254
    new $P613, "Undef"
  vivify_254:
    $P614 = $P613."ast"()
    $P611."push"($P614)
.annotate 'line', 228
    find_lex $P615, "$/"
    get_hll_global $P616, ["PAST"], "Stmts"
    find_lex $P617, "$/"
    $P618 = $P616."new"($P617 :named("node"))
    $P619 = $P615."!make"($P618)
.annotate 'line', 226
    .return ($P619)
  control_606:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P620, exception, "payload"
    .return ($P620)
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<try>"  :subid("42_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_624
.annotate 'line', 231
    new $P623, 'ExceptionHandler'
    set_addr $P623, control_622
    $P623."handle_types"(57)
    push_eh $P623
    .lex "self", self
    .lex "$/", param_624
.annotate 'line', 232
    new $P625, "Undef"
    .lex "$past", $P625
    find_lex $P626, "$/"
    unless_null $P626, vivify_255
    $P626 = root_new ['parrot';'Hash']
  vivify_255:
    set $P627, $P626["blorst"]
    unless_null $P627, vivify_256
    new $P627, "Undef"
  vivify_256:
    $P628 = $P627."ast"()
    store_lex "$past", $P628
.annotate 'line', 233
    find_lex $P630, "$past"
    $S631 = $P630."WHAT"()
    isne $I632, $S631, "PAST::Block()"
    unless $I632, if_629_end
.annotate 'line', 234
    get_hll_global $P633, ["PAST"], "Block"
    find_lex $P634, "$past"
    find_lex $P635, "$/"
    $P636 = $P633."new"($P634, "immediate" :named("blocktype"), $P635 :named("node"))
    store_lex "$past", $P636
  if_629_end:
.annotate 'line', 236
    find_lex $P638, "$past"
    $P639 = $P638."handlers"()
    if $P639, unless_637_end
.annotate 'line', 237
    find_lex $P640, "$past"
    get_hll_global $P641, ["PAST"], "Control"
.annotate 'line', 239
    get_hll_global $P642, ["PAST"], "Stmts"
.annotate 'line', 240
    get_hll_global $P643, ["PAST"], "Op"
.annotate 'line', 241
    get_hll_global $P644, ["PAST"], "Var"
.annotate 'line', 242
    get_hll_global $P645, ["PAST"], "Var"
    $P646 = $P645."new"("register" :named("scope"), "exception" :named("name"))
    $P647 = $P644."new"($P646, "handled", "keyed" :named("scope"))
.annotate 'line', 241
    $P648 = $P643."new"($P647, 1, "bind" :named("pasttype"))
.annotate 'line', 240
    $P649 = $P642."new"($P648)
.annotate 'line', 239
    $P650 = $P641."new"($P649, "CONTROL" :named("handle_types_except"))
.annotate 'line', 237
    new $P651, "ResizablePMCArray"
    push $P651, $P650
    $P640."handlers"($P651)
  unless_637_end:
.annotate 'line', 251
    find_lex $P652, "$/"
    find_lex $P653, "$past"
    $P654 = $P652."!make"($P653)
.annotate 'line', 231
    .return ($P654)
  control_622:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P655, exception, "payload"
    .return ($P655)
.end


.namespace ["NQP";"Actions"]
.sub "blorst"  :subid("43_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_659
.annotate 'line', 254
    new $P658, 'ExceptionHandler'
    set_addr $P658, control_657
    $P658."handle_types"(57)
    push_eh $P658
    .lex "self", self
    .lex "$/", param_659
.annotate 'line', 255
    find_lex $P660, "$/"
.annotate 'line', 256
    find_lex $P663, "$/"
    unless_null $P663, vivify_257
    $P663 = root_new ['parrot';'Hash']
  vivify_257:
    set $P664, $P663["block"]
    unless_null $P664, vivify_258
    new $P664, "Undef"
  vivify_258:
    if $P664, if_662
.annotate 'line', 257
    find_lex $P669, "$/"
    unless_null $P669, vivify_259
    $P669 = root_new ['parrot';'Hash']
  vivify_259:
    set $P670, $P669["statement"]
    unless_null $P670, vivify_260
    new $P670, "Undef"
  vivify_260:
    $P671 = $P670."ast"()
    set $P661, $P671
.annotate 'line', 256
    goto if_662_end
  if_662:
    find_lex $P665, "$/"
    unless_null $P665, vivify_261
    $P665 = root_new ['parrot';'Hash']
  vivify_261:
    set $P666, $P665["block"]
    unless_null $P666, vivify_262
    new $P666, "Undef"
  vivify_262:
    $P667 = $P666."ast"()
    $P668 = "block_immediate"($P667)
    set $P661, $P668
  if_662_end:
    $P672 = $P660."!make"($P661)
.annotate 'line', 254
    .return ($P672)
  control_657:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P673, exception, "payload"
    .return ($P673)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<if>"  :subid("44_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_677
.annotate 'line', 262
    new $P676, 'ExceptionHandler'
    set_addr $P676, control_675
    $P676."handle_types"(57)
    push_eh $P676
    .lex "self", self
    .lex "$/", param_677
    find_lex $P678, "$/"
    find_lex $P679, "$/"
    unless_null $P679, vivify_263
    $P679 = root_new ['parrot';'Hash']
  vivify_263:
    set $P680, $P679["cond"]
    unless_null $P680, vivify_264
    new $P680, "Undef"
  vivify_264:
    $P681 = $P680."ast"()
    $P682 = $P678."!make"($P681)
    .return ($P682)
  control_675:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P683, exception, "payload"
    .return ($P683)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<unless>"  :subid("45_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_687
.annotate 'line', 263
    new $P686, 'ExceptionHandler'
    set_addr $P686, control_685
    $P686."handle_types"(57)
    push_eh $P686
    .lex "self", self
    .lex "$/", param_687
    find_lex $P688, "$/"
    find_lex $P689, "$/"
    unless_null $P689, vivify_265
    $P689 = root_new ['parrot';'Hash']
  vivify_265:
    set $P690, $P689["cond"]
    unless_null $P690, vivify_266
    new $P690, "Undef"
  vivify_266:
    $P691 = $P690."ast"()
    $P692 = $P688."!make"($P691)
    .return ($P692)
  control_685:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P693, exception, "payload"
    .return ($P693)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<while>"  :subid("46_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_697
.annotate 'line', 265
    new $P696, 'ExceptionHandler'
    set_addr $P696, control_695
    $P696."handle_types"(57)
    push_eh $P696
    .lex "self", self
    .lex "$/", param_697
    find_lex $P698, "$/"
    find_lex $P699, "$/"
    unless_null $P699, vivify_267
    $P699 = root_new ['parrot';'Hash']
  vivify_267:
    set $P700, $P699["cond"]
    unless_null $P700, vivify_268
    new $P700, "Undef"
  vivify_268:
    $P701 = $P700."ast"()
    $P702 = $P698."!make"($P701)
    .return ($P702)
  control_695:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P703, exception, "payload"
    .return ($P703)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<until>"  :subid("47_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_707
.annotate 'line', 266
    new $P706, 'ExceptionHandler'
    set_addr $P706, control_705
    $P706."handle_types"(57)
    push_eh $P706
    .lex "self", self
    .lex "$/", param_707
    find_lex $P708, "$/"
    find_lex $P709, "$/"
    unless_null $P709, vivify_269
    $P709 = root_new ['parrot';'Hash']
  vivify_269:
    set $P710, $P709["cond"]
    unless_null $P710, vivify_270
    new $P710, "Undef"
  vivify_270:
    $P711 = $P710."ast"()
    $P712 = $P708."!make"($P711)
    .return ($P712)
  control_705:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P713, exception, "payload"
    .return ($P713)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<fatarrow>"  :subid("48_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_717
.annotate 'line', 270
    new $P716, 'ExceptionHandler'
    set_addr $P716, control_715
    $P716."handle_types"(57)
    push_eh $P716
    .lex "self", self
    .lex "$/", param_717
    find_lex $P718, "$/"
    find_lex $P719, "$/"
    unless_null $P719, vivify_271
    $P719 = root_new ['parrot';'Hash']
  vivify_271:
    set $P720, $P719["fatarrow"]
    unless_null $P720, vivify_272
    new $P720, "Undef"
  vivify_272:
    $P721 = $P720."ast"()
    $P722 = $P718."!make"($P721)
    .return ($P722)
  control_715:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P723, exception, "payload"
    .return ($P723)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<colonpair>"  :subid("49_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_727
.annotate 'line', 271
    new $P726, 'ExceptionHandler'
    set_addr $P726, control_725
    $P726."handle_types"(57)
    push_eh $P726
    .lex "self", self
    .lex "$/", param_727
    find_lex $P728, "$/"
    find_lex $P729, "$/"
    unless_null $P729, vivify_273
    $P729 = root_new ['parrot';'Hash']
  vivify_273:
    set $P730, $P729["colonpair"]
    unless_null $P730, vivify_274
    new $P730, "Undef"
  vivify_274:
    $P731 = $P730."ast"()
    $P732 = $P728."!make"($P731)
    .return ($P732)
  control_725:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P733, exception, "payload"
    .return ($P733)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<variable>"  :subid("50_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_737
.annotate 'line', 272
    new $P736, 'ExceptionHandler'
    set_addr $P736, control_735
    $P736."handle_types"(57)
    push_eh $P736
    .lex "self", self
    .lex "$/", param_737
    find_lex $P738, "$/"
    find_lex $P739, "$/"
    unless_null $P739, vivify_275
    $P739 = root_new ['parrot';'Hash']
  vivify_275:
    set $P740, $P739["variable"]
    unless_null $P740, vivify_276
    new $P740, "Undef"
  vivify_276:
    $P741 = $P740."ast"()
    $P742 = $P738."!make"($P741)
    .return ($P742)
  control_735:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P743, exception, "payload"
    .return ($P743)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<package_declarator>"  :subid("51_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_747
.annotate 'line', 273
    new $P746, 'ExceptionHandler'
    set_addr $P746, control_745
    $P746."handle_types"(57)
    push_eh $P746
    .lex "self", self
    .lex "$/", param_747
    find_lex $P748, "$/"
    find_lex $P749, "$/"
    unless_null $P749, vivify_277
    $P749 = root_new ['parrot';'Hash']
  vivify_277:
    set $P750, $P749["package_declarator"]
    unless_null $P750, vivify_278
    new $P750, "Undef"
  vivify_278:
    $P751 = $P750."ast"()
    $P752 = $P748."!make"($P751)
    .return ($P752)
  control_745:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P753, exception, "payload"
    .return ($P753)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<scope_declarator>"  :subid("52_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_757
.annotate 'line', 274
    new $P756, 'ExceptionHandler'
    set_addr $P756, control_755
    $P756."handle_types"(57)
    push_eh $P756
    .lex "self", self
    .lex "$/", param_757
    find_lex $P758, "$/"
    find_lex $P759, "$/"
    unless_null $P759, vivify_279
    $P759 = root_new ['parrot';'Hash']
  vivify_279:
    set $P760, $P759["scope_declarator"]
    unless_null $P760, vivify_280
    new $P760, "Undef"
  vivify_280:
    $P761 = $P760."ast"()
    $P762 = $P758."!make"($P761)
    .return ($P762)
  control_755:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P763, exception, "payload"
    .return ($P763)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<routine_declarator>"  :subid("53_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_767
.annotate 'line', 275
    new $P766, 'ExceptionHandler'
    set_addr $P766, control_765
    $P766."handle_types"(57)
    push_eh $P766
    .lex "self", self
    .lex "$/", param_767
    find_lex $P768, "$/"
    find_lex $P769, "$/"
    unless_null $P769, vivify_281
    $P769 = root_new ['parrot';'Hash']
  vivify_281:
    set $P770, $P769["routine_declarator"]
    unless_null $P770, vivify_282
    new $P770, "Undef"
  vivify_282:
    $P771 = $P770."ast"()
    $P772 = $P768."!make"($P771)
    .return ($P772)
  control_765:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P773, exception, "payload"
    .return ($P773)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<regex_declarator>"  :subid("54_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_777
.annotate 'line', 276
    new $P776, 'ExceptionHandler'
    set_addr $P776, control_775
    $P776."handle_types"(57)
    push_eh $P776
    .lex "self", self
    .lex "$/", param_777
    find_lex $P778, "$/"
    find_lex $P779, "$/"
    unless_null $P779, vivify_283
    $P779 = root_new ['parrot';'Hash']
  vivify_283:
    set $P780, $P779["regex_declarator"]
    unless_null $P780, vivify_284
    new $P780, "Undef"
  vivify_284:
    $P781 = $P780."ast"()
    $P782 = $P778."!make"($P781)
    .return ($P782)
  control_775:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P783, exception, "payload"
    .return ($P783)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<statement_prefix>"  :subid("55_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_787
.annotate 'line', 277
    new $P786, 'ExceptionHandler'
    set_addr $P786, control_785
    $P786."handle_types"(57)
    push_eh $P786
    .lex "self", self
    .lex "$/", param_787
    find_lex $P788, "$/"
    find_lex $P789, "$/"
    unless_null $P789, vivify_285
    $P789 = root_new ['parrot';'Hash']
  vivify_285:
    set $P790, $P789["statement_prefix"]
    unless_null $P790, vivify_286
    new $P790, "Undef"
  vivify_286:
    $P791 = $P790."ast"()
    $P792 = $P788."!make"($P791)
    .return ($P792)
  control_785:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P793, exception, "payload"
    .return ($P793)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<lambda>"  :subid("56_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_797
.annotate 'line', 278
    new $P796, 'ExceptionHandler'
    set_addr $P796, control_795
    $P796."handle_types"(57)
    push_eh $P796
    .lex "self", self
    .lex "$/", param_797
    find_lex $P798, "$/"
    find_lex $P799, "$/"
    unless_null $P799, vivify_287
    $P799 = root_new ['parrot';'Hash']
  vivify_287:
    set $P800, $P799["pblock"]
    unless_null $P800, vivify_288
    new $P800, "Undef"
  vivify_288:
    $P801 = $P800."ast"()
    $P802 = $P798."!make"($P801)
    .return ($P802)
  control_795:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P803, exception, "payload"
    .return ($P803)
.end


.namespace ["NQP";"Actions"]
.sub "fatarrow"  :subid("57_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_807
.annotate 'line', 280
    new $P806, 'ExceptionHandler'
    set_addr $P806, control_805
    $P806."handle_types"(57)
    push_eh $P806
    .lex "self", self
    .lex "$/", param_807
.annotate 'line', 281
    new $P808, "Undef"
    .lex "$past", $P808
    find_lex $P809, "$/"
    unless_null $P809, vivify_289
    $P809 = root_new ['parrot';'Hash']
  vivify_289:
    set $P810, $P809["val"]
    unless_null $P810, vivify_290
    new $P810, "Undef"
  vivify_290:
    $P811 = $P810."ast"()
    store_lex "$past", $P811
.annotate 'line', 282
    find_lex $P812, "$past"
    find_lex $P813, "$/"
    unless_null $P813, vivify_291
    $P813 = root_new ['parrot';'Hash']
  vivify_291:
    set $P814, $P813["key"]
    unless_null $P814, vivify_292
    new $P814, "Undef"
  vivify_292:
    $P815 = $P814."Str"()
    $P812."named"($P815)
.annotate 'line', 283
    find_lex $P816, "$/"
    find_lex $P817, "$past"
    $P818 = $P816."!make"($P817)
.annotate 'line', 280
    .return ($P818)
  control_805:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P819, exception, "payload"
    .return ($P819)
.end


.namespace ["NQP";"Actions"]
.sub "colonpair"  :subid("58_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_823
.annotate 'line', 286
    new $P822, 'ExceptionHandler'
    set_addr $P822, control_821
    $P822."handle_types"(57)
    push_eh $P822
    .lex "self", self
    .lex "$/", param_823
.annotate 'line', 287
    new $P824, "Undef"
    .lex "$past", $P824
.annotate 'line', 288
    find_lex $P827, "$/"
    unless_null $P827, vivify_293
    $P827 = root_new ['parrot';'Hash']
  vivify_293:
    set $P828, $P827["circumfix"]
    unless_null $P828, vivify_294
    new $P828, "Undef"
  vivify_294:
    if $P828, if_826
.annotate 'line', 289
    get_hll_global $P833, ["PAST"], "Val"
    find_lex $P834, "$/"
    unless_null $P834, vivify_295
    $P834 = root_new ['parrot';'Hash']
  vivify_295:
    set $P835, $P834["not"]
    unless_null $P835, vivify_296
    new $P835, "Undef"
  vivify_296:
    isfalse $I836, $P835
    $P837 = $P833."new"($I836 :named("value"))
    set $P825, $P837
.annotate 'line', 288
    goto if_826_end
  if_826:
    find_lex $P829, "$/"
    unless_null $P829, vivify_297
    $P829 = root_new ['parrot';'Hash']
  vivify_297:
    set $P830, $P829["circumfix"]
    unless_null $P830, vivify_298
    $P830 = root_new ['parrot';'ResizablePMCArray']
  vivify_298:
    set $P831, $P830[0]
    unless_null $P831, vivify_299
    new $P831, "Undef"
  vivify_299:
    $P832 = $P831."ast"()
    set $P825, $P832
  if_826_end:
    store_lex "$past", $P825
.annotate 'line', 290
    find_lex $P838, "$past"
    find_lex $P839, "$/"
    unless_null $P839, vivify_300
    $P839 = root_new ['parrot';'Hash']
  vivify_300:
    set $P840, $P839["identifier"]
    unless_null $P840, vivify_301
    new $P840, "Undef"
  vivify_301:
    set $S841, $P840
    $P838."named"($S841)
.annotate 'line', 291
    find_lex $P842, "$/"
    find_lex $P843, "$past"
    $P844 = $P842."!make"($P843)
.annotate 'line', 286
    .return ($P844)
  control_821:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P845, exception, "payload"
    .return ($P845)
.end


.namespace ["NQP";"Actions"]
.sub "variable"  :subid("59_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_849
.annotate 'line', 294
    .const 'Sub' $P862 = "60_1273884035.78954" 
    capture_lex $P862
    new $P848, 'ExceptionHandler'
    set_addr $P848, control_847
    $P848."handle_types"(57)
    push_eh $P848
    .lex "self", self
    .lex "$/", param_849
.annotate 'line', 295
    new $P850, "Undef"
    .lex "$past", $P850
.annotate 'line', 294
    find_lex $P851, "$past"
.annotate 'line', 296
    find_lex $P853, "$/"
    unless_null $P853, vivify_302
    $P853 = root_new ['parrot';'Hash']
  vivify_302:
    set $P854, $P853["postcircumfix"]
    unless_null $P854, vivify_303
    new $P854, "Undef"
  vivify_303:
    if $P854, if_852
.annotate 'line', 300
    .const 'Sub' $P862 = "60_1273884035.78954" 
    capture_lex $P862
    $P862()
    goto if_852_end
  if_852:
.annotate 'line', 297
    find_lex $P855, "$/"
    unless_null $P855, vivify_320
    $P855 = root_new ['parrot';'Hash']
  vivify_320:
    set $P856, $P855["postcircumfix"]
    unless_null $P856, vivify_321
    new $P856, "Undef"
  vivify_321:
    $P857 = $P856."ast"()
    store_lex "$past", $P857
.annotate 'line', 298
    find_lex $P858, "$past"
    get_hll_global $P859, ["PAST"], "Var"
    $P860 = $P859."new"("$/" :named("name"))
    $P858."unshift"($P860)
  if_852_end:
.annotate 'line', 329
    find_lex $P931, "$/"
    find_lex $P932, "$past"
    $P933 = $P931."!make"($P932)
.annotate 'line', 294
    .return ($P933)
  control_847:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P934, exception, "payload"
    .return ($P934)
.end


.namespace ["NQP";"Actions"]
.sub "_block861"  :anon :subid("60_1273884035.78954") :outer("59_1273884035.78954")
.annotate 'line', 301
    $P863 = root_new ['parrot';'ResizablePMCArray']
    .lex "@name", $P863
    get_hll_global $P864, ["NQP"], "Compiler"
    find_lex $P865, "$/"
    set $S866, $P865
    $P867 = $P864."parse_name"($S866)
    store_lex "@name", $P867
.annotate 'line', 302
    get_hll_global $P868, ["PAST"], "Var"
    find_lex $P869, "@name"
    $P870 = $P869."pop"()
    set $S871, $P870
    $P872 = $P868."new"($S871 :named("name"))
    store_lex "$past", $P872
.annotate 'line', 303
    find_lex $P874, "@name"
    unless $P874, if_873_end
.annotate 'line', 304
    find_lex $P876, "@name"
    unless_null $P876, vivify_304
    $P876 = root_new ['parrot';'ResizablePMCArray']
  vivify_304:
    set $P877, $P876[0]
    unless_null $P877, vivify_305
    new $P877, "Undef"
  vivify_305:
    set $S878, $P877
    iseq $I879, $S878, "GLOBAL"
    unless $I879, if_875_end
    find_lex $P880, "@name"
    $P880."shift"()
  if_875_end:
.annotate 'line', 305
    find_lex $P881, "$past"
    find_lex $P882, "@name"
    $P881."namespace"($P882)
.annotate 'line', 306
    find_lex $P883, "$past"
    $P883."scope"("package")
.annotate 'line', 307
    find_lex $P884, "$past"
    find_lex $P885, "$/"
    unless_null $P885, vivify_306
    $P885 = root_new ['parrot';'Hash']
  vivify_306:
    set $P886, $P885["sigil"]
    unless_null $P886, vivify_307
    new $P886, "Undef"
  vivify_307:
    $P887 = "vivitype"($P886)
    $P884."viviself"($P887)
.annotate 'line', 308
    find_lex $P888, "$past"
    $P888."lvalue"(1)
  if_873_end:
.annotate 'line', 310
    find_lex $P891, "$/"
    unless_null $P891, vivify_308
    $P891 = root_new ['parrot';'Hash']
  vivify_308:
    set $P892, $P891["twigil"]
    unless_null $P892, vivify_309
    $P892 = root_new ['parrot';'ResizablePMCArray']
  vivify_309:
    set $P893, $P892[0]
    unless_null $P893, vivify_310
    new $P893, "Undef"
  vivify_310:
    set $S894, $P893
    iseq $I895, $S894, "*"
    if $I895, if_890
.annotate 'line', 323
    find_lex $P917, "$/"
    unless_null $P917, vivify_311
    $P917 = root_new ['parrot';'Hash']
  vivify_311:
    set $P918, $P917["twigil"]
    unless_null $P918, vivify_312
    $P918 = root_new ['parrot';'ResizablePMCArray']
  vivify_312:
    set $P919, $P918[0]
    unless_null $P919, vivify_313
    new $P919, "Undef"
  vivify_313:
    set $S920, $P919
    iseq $I921, $S920, "!"
    if $I921, if_916
    new $P915, 'Integer'
    set $P915, $I921
    goto if_916_end
  if_916:
.annotate 'line', 324
    find_lex $P922, "$past"
    get_hll_global $P923, ["PAST"], "Var"
    $P924 = $P923."new"("self" :named("name"))
    $P922."push"($P924)
.annotate 'line', 325
    find_lex $P925, "$past"
    $P925."scope"("attribute")
.annotate 'line', 326
    find_lex $P926, "$past"
    find_lex $P927, "$/"
    unless_null $P927, vivify_314
    $P927 = root_new ['parrot';'Hash']
  vivify_314:
    set $P928, $P927["sigil"]
    unless_null $P928, vivify_315
    new $P928, "Undef"
  vivify_315:
    $P929 = "vivitype"($P928)
    $P930 = $P926."viviself"($P929)
.annotate 'line', 323
    set $P915, $P930
  if_916_end:
    set $P889, $P915
.annotate 'line', 310
    goto if_890_end
  if_890:
.annotate 'line', 311
    find_lex $P896, "$past"
    $P896."scope"("contextual")
.annotate 'line', 312
    find_lex $P897, "$past"
.annotate 'line', 313
    get_hll_global $P898, ["PAST"], "Var"
.annotate 'line', 315
    find_lex $P899, "$/"
    unless_null $P899, vivify_316
    $P899 = root_new ['parrot';'Hash']
  vivify_316:
    set $P900, $P899["sigil"]
    unless_null $P900, vivify_317
    new $P900, "Undef"
  vivify_317:
    set $S901, $P900
    new $P902, 'String'
    set $P902, $S901
    find_lex $P903, "$/"
    unless_null $P903, vivify_318
    $P903 = root_new ['parrot';'Hash']
  vivify_318:
    set $P904, $P903["desigilname"]
    unless_null $P904, vivify_319
    new $P904, "Undef"
  vivify_319:
    concat $P905, $P902, $P904
.annotate 'line', 317
    get_hll_global $P906, ["PAST"], "Op"
    new $P907, "String"
    assign $P907, "Contextual "
    find_lex $P908, "$/"
    set $S909, $P908
    concat $P910, $P907, $S909
    concat $P911, $P910, " not found"
    $P912 = $P906."new"($P911, "die" :named("pirop"))
    $P913 = $P898."new"("package" :named("scope"), "" :named("namespace"), $P905 :named("name"), $P912 :named("viviself"))
.annotate 'line', 313
    $P914 = $P897."viviself"($P913)
.annotate 'line', 310
    set $P889, $P914
  if_890_end:
.annotate 'line', 300
    .return ($P889)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<module>"  :subid("61_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_938
.annotate 'line', 332
    new $P937, 'ExceptionHandler'
    set_addr $P937, control_936
    $P937."handle_types"(57)
    push_eh $P937
    .lex "self", self
    .lex "$/", param_938
    find_lex $P939, "$/"
    find_lex $P940, "$/"
    unless_null $P940, vivify_322
    $P940 = root_new ['parrot';'Hash']
  vivify_322:
    set $P941, $P940["package_def"]
    unless_null $P941, vivify_323
    new $P941, "Undef"
  vivify_323:
    $P942 = $P941."ast"()
    $P943 = $P939."!make"($P942)
    .return ($P943)
  control_936:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P944, exception, "payload"
    .return ($P944)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<class>"  :subid("62_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_948
.annotate 'line', 333
    new $P947, 'ExceptionHandler'
    set_addr $P947, control_946
    $P947."handle_types"(57)
    push_eh $P947
    .lex "self", self
    .lex "$/", param_948
.annotate 'line', 334
    new $P949, "Undef"
    .lex "$past", $P949
.annotate 'line', 335
    new $P950, "Undef"
    .lex "$classinit", $P950
.annotate 'line', 344
    new $P951, "Undef"
    .lex "$parent", $P951
.annotate 'line', 334
    find_lex $P952, "$/"
    unless_null $P952, vivify_324
    $P952 = root_new ['parrot';'Hash']
  vivify_324:
    set $P953, $P952["package_def"]
    unless_null $P953, vivify_325
    new $P953, "Undef"
  vivify_325:
    $P954 = $P953."ast"()
    store_lex "$past", $P954
.annotate 'line', 336
    get_hll_global $P955, ["PAST"], "Op"
.annotate 'line', 337
    get_hll_global $P956, ["PAST"], "Op"
    $P957 = $P956."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate 'line', 340
    find_lex $P958, "$/"
    unless_null $P958, vivify_326
    $P958 = root_new ['parrot';'Hash']
  vivify_326:
    set $P959, $P958["package_def"]
    unless_null $P959, vivify_327
    $P959 = root_new ['parrot';'Hash']
  vivify_327:
    set $P960, $P959["name"]
    unless_null $P960, vivify_328
    new $P960, "Undef"
  vivify_328:
    set $S961, $P960
    $P962 = $P955."new"($P957, $S961, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 336
    store_lex "$classinit", $P962
.annotate 'line', 344
    find_lex $P965, "$/"
    unless_null $P965, vivify_329
    $P965 = root_new ['parrot';'Hash']
  vivify_329:
    set $P966, $P965["package_def"]
    unless_null $P966, vivify_330
    $P966 = root_new ['parrot';'Hash']
  vivify_330:
    set $P967, $P966["parent"]
    unless_null $P967, vivify_331
    $P967 = root_new ['parrot';'ResizablePMCArray']
  vivify_331:
    set $P968, $P967[0]
    unless_null $P968, vivify_332
    new $P968, "Undef"
  vivify_332:
    set $S969, $P968
    unless $S969, unless_964
    new $P963, 'String'
    set $P963, $S969
    goto unless_964_end
  unless_964:
.annotate 'line', 345
    find_lex $P972, "$/"
    unless_null $P972, vivify_333
    $P972 = root_new ['parrot';'Hash']
  vivify_333:
    set $P973, $P972["sym"]
    unless_null $P973, vivify_334
    new $P973, "Undef"
  vivify_334:
    set $S974, $P973
    iseq $I975, $S974, "grammar"
    if $I975, if_971
    new $P977, "String"
    assign $P977, ""
    set $P970, $P977
    goto if_971_end
  if_971:
    new $P976, "String"
    assign $P976, "Regex::Cursor"
    set $P970, $P976
  if_971_end:
    set $P963, $P970
  unless_964_end:
    store_lex "$parent", $P963
.annotate 'line', 346
    find_lex $P979, "$parent"
    unless $P979, if_978_end
.annotate 'line', 347
    find_lex $P980, "$classinit"
    get_hll_global $P981, ["PAST"], "Val"
    find_lex $P982, "$parent"
    $P983 = $P981."new"($P982 :named("value"), "parent" :named("named"))
    $P980."push"($P983)
  if_978_end:
.annotate 'line', 349
    find_lex $P985, "$past"
    unless_null $P985, vivify_335
    $P985 = root_new ['parrot';'Hash']
  vivify_335:
    set $P986, $P985["attributes"]
    unless_null $P986, vivify_336
    new $P986, "Undef"
  vivify_336:
    unless $P986, if_984_end
.annotate 'line', 350
    find_lex $P987, "$classinit"
    find_lex $P988, "$past"
    unless_null $P988, vivify_337
    $P988 = root_new ['parrot';'Hash']
  vivify_337:
    set $P989, $P988["attributes"]
    unless_null $P989, vivify_338
    new $P989, "Undef"
  vivify_338:
    $P987."push"($P989)
  if_984_end:
.annotate 'line', 352
    get_global $P990, "@BLOCK"
    unless_null $P990, vivify_339
    $P990 = root_new ['parrot';'ResizablePMCArray']
  vivify_339:
    set $P991, $P990[0]
    unless_null $P991, vivify_340
    new $P991, "Undef"
  vivify_340:
    $P992 = $P991."loadinit"()
    find_lex $P993, "$classinit"
    $P992."push"($P993)
.annotate 'line', 353
    find_lex $P994, "$/"
    find_lex $P995, "$past"
    $P996 = $P994."!make"($P995)
.annotate 'line', 333
    .return ($P996)
  control_946:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P997, exception, "payload"
    .return ($P997)
.end


.namespace ["NQP";"Actions"]
.sub "package_def"  :subid("63_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1001
.annotate 'line', 356
    new $P1000, 'ExceptionHandler'
    set_addr $P1000, control_999
    $P1000."handle_types"(57)
    push_eh $P1000
    .lex "self", self
    .lex "$/", param_1001
.annotate 'line', 357
    new $P1002, "Undef"
    .lex "$past", $P1002
    find_lex $P1005, "$/"
    unless_null $P1005, vivify_341
    $P1005 = root_new ['parrot';'Hash']
  vivify_341:
    set $P1006, $P1005["block"]
    unless_null $P1006, vivify_342
    new $P1006, "Undef"
  vivify_342:
    if $P1006, if_1004
    find_lex $P1010, "$/"
    unless_null $P1010, vivify_343
    $P1010 = root_new ['parrot';'Hash']
  vivify_343:
    set $P1011, $P1010["comp_unit"]
    unless_null $P1011, vivify_344
    new $P1011, "Undef"
  vivify_344:
    $P1012 = $P1011."ast"()
    set $P1003, $P1012
    goto if_1004_end
  if_1004:
    find_lex $P1007, "$/"
    unless_null $P1007, vivify_345
    $P1007 = root_new ['parrot';'Hash']
  vivify_345:
    set $P1008, $P1007["block"]
    unless_null $P1008, vivify_346
    new $P1008, "Undef"
  vivify_346:
    $P1009 = $P1008."ast"()
    set $P1003, $P1009
  if_1004_end:
    store_lex "$past", $P1003
.annotate 'line', 358
    find_lex $P1013, "$past"
    find_lex $P1014, "$/"
    unless_null $P1014, vivify_347
    $P1014 = root_new ['parrot';'Hash']
  vivify_347:
    set $P1015, $P1014["name"]
    unless_null $P1015, vivify_348
    $P1015 = root_new ['parrot';'Hash']
  vivify_348:
    set $P1016, $P1015["identifier"]
    unless_null $P1016, vivify_349
    new $P1016, "Undef"
  vivify_349:
    $P1013."namespace"($P1016)
.annotate 'line', 359
    find_lex $P1017, "$past"
    $P1017."blocktype"("immediate")
.annotate 'line', 360
    find_lex $P1018, "$/"
    find_lex $P1019, "$past"
    $P1020 = $P1018."!make"($P1019)
.annotate 'line', 356
    .return ($P1020)
  control_999:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1021, exception, "payload"
    .return ($P1021)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<my>"  :subid("64_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1025
.annotate 'line', 363
    new $P1024, 'ExceptionHandler'
    set_addr $P1024, control_1023
    $P1024."handle_types"(57)
    push_eh $P1024
    .lex "self", self
    .lex "$/", param_1025
    find_lex $P1026, "$/"
    find_lex $P1027, "$/"
    unless_null $P1027, vivify_350
    $P1027 = root_new ['parrot';'Hash']
  vivify_350:
    set $P1028, $P1027["scoped"]
    unless_null $P1028, vivify_351
    new $P1028, "Undef"
  vivify_351:
    $P1029 = $P1028."ast"()
    $P1030 = $P1026."!make"($P1029)
    .return ($P1030)
  control_1023:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1031, exception, "payload"
    .return ($P1031)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<our>"  :subid("65_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1035
.annotate 'line', 364
    new $P1034, 'ExceptionHandler'
    set_addr $P1034, control_1033
    $P1034."handle_types"(57)
    push_eh $P1034
    .lex "self", self
    .lex "$/", param_1035
    find_lex $P1036, "$/"
    find_lex $P1037, "$/"
    unless_null $P1037, vivify_352
    $P1037 = root_new ['parrot';'Hash']
  vivify_352:
    set $P1038, $P1037["scoped"]
    unless_null $P1038, vivify_353
    new $P1038, "Undef"
  vivify_353:
    $P1039 = $P1038."ast"()
    $P1040 = $P1036."!make"($P1039)
    .return ($P1040)
  control_1033:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1041, exception, "payload"
    .return ($P1041)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<has>"  :subid("66_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1045
.annotate 'line', 365
    new $P1044, 'ExceptionHandler'
    set_addr $P1044, control_1043
    $P1044."handle_types"(57)
    push_eh $P1044
    .lex "self", self
    .lex "$/", param_1045
    find_lex $P1046, "$/"
    find_lex $P1047, "$/"
    unless_null $P1047, vivify_354
    $P1047 = root_new ['parrot';'Hash']
  vivify_354:
    set $P1048, $P1047["scoped"]
    unless_null $P1048, vivify_355
    new $P1048, "Undef"
  vivify_355:
    $P1049 = $P1048."ast"()
    $P1050 = $P1046."!make"($P1049)
    .return ($P1050)
  control_1043:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1051, exception, "payload"
    .return ($P1051)
.end


.namespace ["NQP";"Actions"]
.sub "scoped"  :subid("67_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1055
.annotate 'line', 367
    new $P1054, 'ExceptionHandler'
    set_addr $P1054, control_1053
    $P1054."handle_types"(57)
    push_eh $P1054
    .lex "self", self
    .lex "$/", param_1055
.annotate 'line', 368
    find_lex $P1056, "$/"
.annotate 'line', 369
    find_lex $P1059, "$/"
    unless_null $P1059, vivify_356
    $P1059 = root_new ['parrot';'Hash']
  vivify_356:
    set $P1060, $P1059["routine_declarator"]
    unless_null $P1060, vivify_357
    new $P1060, "Undef"
  vivify_357:
    if $P1060, if_1058
.annotate 'line', 370
    find_lex $P1064, "$/"
    unless_null $P1064, vivify_358
    $P1064 = root_new ['parrot';'Hash']
  vivify_358:
    set $P1065, $P1064["variable_declarator"]
    unless_null $P1065, vivify_359
    new $P1065, "Undef"
  vivify_359:
    $P1066 = $P1065."ast"()
    set $P1057, $P1066
.annotate 'line', 369
    goto if_1058_end
  if_1058:
    find_lex $P1061, "$/"
    unless_null $P1061, vivify_360
    $P1061 = root_new ['parrot';'Hash']
  vivify_360:
    set $P1062, $P1061["routine_declarator"]
    unless_null $P1062, vivify_361
    new $P1062, "Undef"
  vivify_361:
    $P1063 = $P1062."ast"()
    set $P1057, $P1063
  if_1058_end:
    $P1067 = $P1056."!make"($P1057)
.annotate 'line', 367
    .return ($P1067)
  control_1053:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1068, exception, "payload"
    .return ($P1068)
.end


.namespace ["NQP";"Actions"]
.sub "variable_declarator"  :subid("68_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1072
.annotate 'line', 373
    .const 'Sub' $P1112 = "69_1273884035.78954" 
    capture_lex $P1112
    new $P1071, 'ExceptionHandler'
    set_addr $P1071, control_1070
    $P1071."handle_types"(57)
    push_eh $P1071
    .lex "self", self
    .lex "$/", param_1072
.annotate 'line', 374
    new $P1073, "Undef"
    .lex "$past", $P1073
.annotate 'line', 375
    new $P1074, "Undef"
    .lex "$sigil", $P1074
.annotate 'line', 376
    new $P1075, "Undef"
    .lex "$name", $P1075
.annotate 'line', 377
    new $P1076, "Undef"
    .lex "$BLOCK", $P1076
.annotate 'line', 374
    find_lex $P1077, "$/"
    unless_null $P1077, vivify_362
    $P1077 = root_new ['parrot';'Hash']
  vivify_362:
    set $P1078, $P1077["variable"]
    unless_null $P1078, vivify_363
    new $P1078, "Undef"
  vivify_363:
    $P1079 = $P1078."ast"()
    store_lex "$past", $P1079
.annotate 'line', 375
    find_lex $P1080, "$/"
    unless_null $P1080, vivify_364
    $P1080 = root_new ['parrot';'Hash']
  vivify_364:
    set $P1081, $P1080["variable"]
    unless_null $P1081, vivify_365
    $P1081 = root_new ['parrot';'Hash']
  vivify_365:
    set $P1082, $P1081["sigil"]
    unless_null $P1082, vivify_366
    new $P1082, "Undef"
  vivify_366:
    store_lex "$sigil", $P1082
.annotate 'line', 376
    find_lex $P1083, "$past"
    $P1084 = $P1083."name"()
    store_lex "$name", $P1084
.annotate 'line', 377
    get_global $P1085, "@BLOCK"
    unless_null $P1085, vivify_367
    $P1085 = root_new ['parrot';'ResizablePMCArray']
  vivify_367:
    set $P1086, $P1085[0]
    unless_null $P1086, vivify_368
    new $P1086, "Undef"
  vivify_368:
    store_lex "$BLOCK", $P1086
.annotate 'line', 378
    find_lex $P1088, "$BLOCK"
    find_lex $P1089, "$name"
    $P1090 = $P1088."symbol"($P1089)
    unless $P1090, if_1087_end
.annotate 'line', 379
    find_lex $P1091, "$/"
    $P1092 = $P1091."CURSOR"()
    find_lex $P1093, "$name"
    $P1092."panic"("Redeclaration of symbol ", $P1093)
  if_1087_end:
.annotate 'line', 381
    find_dynamic_lex $P1095, "$*SCOPE"
    unless_null $P1095, vivify_369
    get_hll_global $P1095, "$SCOPE"
    unless_null $P1095, vivify_370
    die "Contextual $*SCOPE not found"
  vivify_370:
  vivify_369:
    set $S1096, $P1095
    iseq $I1097, $S1096, "has"
    if $I1097, if_1094
.annotate 'line', 390
    .const 'Sub' $P1112 = "69_1273884035.78954" 
    capture_lex $P1112
    $P1112()
    goto if_1094_end
  if_1094:
.annotate 'line', 382
    find_lex $P1098, "$BLOCK"
    find_lex $P1099, "$name"
    $P1098."symbol"($P1099, "attribute" :named("scope"))
.annotate 'line', 383
    find_lex $P1101, "$BLOCK"
    unless_null $P1101, vivify_375
    $P1101 = root_new ['parrot';'Hash']
  vivify_375:
    set $P1102, $P1101["attributes"]
    unless_null $P1102, vivify_376
    new $P1102, "Undef"
  vivify_376:
    if $P1102, unless_1100_end
.annotate 'line', 385
    get_hll_global $P1103, ["PAST"], "Op"
    $P1104 = $P1103."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P1105, "$BLOCK"
    unless_null $P1105, vivify_377
    $P1105 = root_new ['parrot';'Hash']
    store_lex "$BLOCK", $P1105
  vivify_377:
    set $P1105["attributes"], $P1104
  unless_1100_end:
.annotate 'line', 387
    find_lex $P1106, "$BLOCK"
    unless_null $P1106, vivify_378
    $P1106 = root_new ['parrot';'Hash']
  vivify_378:
    set $P1107, $P1106["attributes"]
    unless_null $P1107, vivify_379
    new $P1107, "Undef"
  vivify_379:
    find_lex $P1108, "$name"
    $P1107."push"($P1108)
.annotate 'line', 388
    get_hll_global $P1109, ["PAST"], "Stmts"
    $P1110 = $P1109."new"()
    store_lex "$past", $P1110
  if_1094_end:
.annotate 'line', 398
    find_lex $P1136, "$/"
    find_lex $P1137, "$past"
    $P1138 = $P1136."!make"($P1137)
.annotate 'line', 373
    .return ($P1138)
  control_1070:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1139, exception, "payload"
    .return ($P1139)
.end


.namespace ["NQP";"Actions"]
.sub "_block1111"  :anon :subid("69_1273884035.78954") :outer("68_1273884035.78954")
.annotate 'line', 391
    new $P1113, "Undef"
    .lex "$scope", $P1113
.annotate 'line', 392
    new $P1114, "Undef"
    .lex "$decl", $P1114
.annotate 'line', 391
    find_dynamic_lex $P1117, "$*SCOPE"
    unless_null $P1117, vivify_371
    get_hll_global $P1117, "$SCOPE"
    unless_null $P1117, vivify_372
    die "Contextual $*SCOPE not found"
  vivify_372:
  vivify_371:
    set $S1118, $P1117
    iseq $I1119, $S1118, "our"
    if $I1119, if_1116
    new $P1121, "String"
    assign $P1121, "lexical"
    set $P1115, $P1121
    goto if_1116_end
  if_1116:
    new $P1120, "String"
    assign $P1120, "package"
    set $P1115, $P1120
  if_1116_end:
    store_lex "$scope", $P1115
.annotate 'line', 392
    get_hll_global $P1122, ["PAST"], "Var"
    find_lex $P1123, "$name"
    find_lex $P1124, "$scope"
.annotate 'line', 393
    find_lex $P1125, "$sigil"
    $P1126 = "vivitype"($P1125)
    find_lex $P1127, "$/"
    $P1128 = $P1122."new"($P1123 :named("name"), $P1124 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P1126 :named("viviself"), $P1127 :named("node"))
.annotate 'line', 392
    store_lex "$decl", $P1128
.annotate 'line', 395
    find_lex $P1129, "$BLOCK"
    find_lex $P1130, "$name"
    find_lex $P1131, "$scope"
    $P1129."symbol"($P1130, $P1131 :named("scope"))
.annotate 'line', 396
    find_lex $P1132, "$BLOCK"
    unless_null $P1132, vivify_373
    $P1132 = root_new ['parrot';'ResizablePMCArray']
  vivify_373:
    set $P1133, $P1132[0]
    unless_null $P1133, vivify_374
    new $P1133, "Undef"
  vivify_374:
    find_lex $P1134, "$decl"
    $P1135 = $P1133."push"($P1134)
.annotate 'line', 390
    .return ($P1135)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<sub>"  :subid("70_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1143
.annotate 'line', 401
    new $P1142, 'ExceptionHandler'
    set_addr $P1142, control_1141
    $P1142."handle_types"(57)
    push_eh $P1142
    .lex "self", self
    .lex "$/", param_1143
    find_lex $P1144, "$/"
    find_lex $P1145, "$/"
    unless_null $P1145, vivify_380
    $P1145 = root_new ['parrot';'Hash']
  vivify_380:
    set $P1146, $P1145["routine_def"]
    unless_null $P1146, vivify_381
    new $P1146, "Undef"
  vivify_381:
    $P1147 = $P1146."ast"()
    $P1148 = $P1144."!make"($P1147)
    .return ($P1148)
  control_1141:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1149, exception, "payload"
    .return ($P1149)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<method>"  :subid("71_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1153
.annotate 'line', 402
    new $P1152, 'ExceptionHandler'
    set_addr $P1152, control_1151
    $P1152."handle_types"(57)
    push_eh $P1152
    .lex "self", self
    .lex "$/", param_1153
    find_lex $P1154, "$/"
    find_lex $P1155, "$/"
    unless_null $P1155, vivify_382
    $P1155 = root_new ['parrot';'Hash']
  vivify_382:
    set $P1156, $P1155["method_def"]
    unless_null $P1156, vivify_383
    new $P1156, "Undef"
  vivify_383:
    $P1157 = $P1156."ast"()
    $P1158 = $P1154."!make"($P1157)
    .return ($P1158)
  control_1151:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1159, exception, "payload"
    .return ($P1159)
.end


.namespace ["NQP";"Actions"]
.sub "routine_def"  :subid("72_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1163
.annotate 'line', 404
    .const 'Sub' $P1174 = "73_1273884035.78954" 
    capture_lex $P1174
    new $P1162, 'ExceptionHandler'
    set_addr $P1162, control_1161
    $P1162."handle_types"(57)
    push_eh $P1162
    .lex "self", self
    .lex "$/", param_1163
.annotate 'line', 405
    new $P1164, "Undef"
    .lex "$past", $P1164
    find_lex $P1165, "$/"
    unless_null $P1165, vivify_384
    $P1165 = root_new ['parrot';'Hash']
  vivify_384:
    set $P1166, $P1165["blockoid"]
    unless_null $P1166, vivify_385
    new $P1166, "Undef"
  vivify_385:
    $P1167 = $P1166."ast"()
    store_lex "$past", $P1167
.annotate 'line', 406
    find_lex $P1168, "$past"
    $P1168."blocktype"("declaration")
.annotate 'line', 407
    find_lex $P1169, "$past"
    $P1169."control"("return_pir")
.annotate 'line', 408
    find_lex $P1171, "$/"
    unless_null $P1171, vivify_386
    $P1171 = root_new ['parrot';'Hash']
  vivify_386:
    set $P1172, $P1171["deflongname"]
    unless_null $P1172, vivify_387
    new $P1172, "Undef"
  vivify_387:
    unless $P1172, if_1170_end
    .const 'Sub' $P1174 = "73_1273884035.78954" 
    capture_lex $P1174
    $P1174()
  if_1170_end:
.annotate 'line', 418
    find_lex $P1206, "$/"
    find_lex $P1207, "$past"
    $P1208 = $P1206."!make"($P1207)
.annotate 'line', 404
    .return ($P1208)
  control_1161:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1209, exception, "payload"
    .return ($P1209)
.end


.namespace ["NQP";"Actions"]
.sub "_block1173"  :anon :subid("73_1273884035.78954") :outer("72_1273884035.78954")
.annotate 'line', 409
    new $P1175, "Undef"
    .lex "$name", $P1175
    find_lex $P1176, "$/"
    unless_null $P1176, vivify_388
    $P1176 = root_new ['parrot';'Hash']
  vivify_388:
    set $P1177, $P1176["sigil"]
    unless_null $P1177, vivify_389
    $P1177 = root_new ['parrot';'ResizablePMCArray']
  vivify_389:
    set $P1178, $P1177[0]
    unless_null $P1178, vivify_390
    new $P1178, "Undef"
  vivify_390:
    set $S1179, $P1178
    new $P1180, 'String'
    set $P1180, $S1179
    find_lex $P1181, "$/"
    unless_null $P1181, vivify_391
    $P1181 = root_new ['parrot';'Hash']
  vivify_391:
    set $P1182, $P1181["deflongname"]
    unless_null $P1182, vivify_392
    $P1182 = root_new ['parrot';'ResizablePMCArray']
  vivify_392:
    set $P1183, $P1182[0]
    unless_null $P1183, vivify_393
    new $P1183, "Undef"
  vivify_393:
    $S1184 = $P1183."ast"()
    concat $P1185, $P1180, $S1184
    store_lex "$name", $P1185
.annotate 'line', 410
    find_lex $P1186, "$past"
    find_lex $P1187, "$name"
    $P1186."name"($P1187)
.annotate 'line', 411
    find_dynamic_lex $P1190, "$*SCOPE"
    unless_null $P1190, vivify_394
    get_hll_global $P1190, "$SCOPE"
    unless_null $P1190, vivify_395
    die "Contextual $*SCOPE not found"
  vivify_395:
  vivify_394:
    set $S1191, $P1190
    isne $I1192, $S1191, "our"
    if $I1192, if_1189
    new $P1188, 'Integer'
    set $P1188, $I1192
    goto if_1189_end
  if_1189:
.annotate 'line', 412
    get_global $P1193, "@BLOCK"
    unless_null $P1193, vivify_396
    $P1193 = root_new ['parrot';'ResizablePMCArray']
  vivify_396:
    set $P1194, $P1193[0]
    unless_null $P1194, vivify_397
    $P1194 = root_new ['parrot';'ResizablePMCArray']
  vivify_397:
    set $P1195, $P1194[0]
    unless_null $P1195, vivify_398
    new $P1195, "Undef"
  vivify_398:
    get_hll_global $P1196, ["PAST"], "Var"
    find_lex $P1197, "$name"
    find_lex $P1198, "$past"
    $P1199 = $P1196."new"($P1197 :named("name"), 1 :named("isdecl"), $P1198 :named("viviself"), "lexical" :named("scope"))
    $P1195."push"($P1199)
.annotate 'line', 414
    get_global $P1200, "@BLOCK"
    unless_null $P1200, vivify_399
    $P1200 = root_new ['parrot';'ResizablePMCArray']
  vivify_399:
    set $P1201, $P1200[0]
    unless_null $P1201, vivify_400
    new $P1201, "Undef"
  vivify_400:
    find_lex $P1202, "$name"
    $P1201."symbol"($P1202, "lexical" :named("scope"))
.annotate 'line', 415
    get_hll_global $P1203, ["PAST"], "Var"
    find_lex $P1204, "$name"
    $P1205 = $P1203."new"($P1204 :named("name"))
    store_lex "$past", $P1205
.annotate 'line', 411
    set $P1188, $P1205
  if_1189_end:
.annotate 'line', 408
    .return ($P1188)
.end


.namespace ["NQP";"Actions"]
.sub "method_def"  :subid("74_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1213
.annotate 'line', 422
    .const 'Sub' $P1229 = "75_1273884035.78954" 
    capture_lex $P1229
    new $P1212, 'ExceptionHandler'
    set_addr $P1212, control_1211
    $P1212."handle_types"(57)
    push_eh $P1212
    .lex "self", self
    .lex "$/", param_1213
.annotate 'line', 423
    new $P1214, "Undef"
    .lex "$past", $P1214
    find_lex $P1215, "$/"
    unless_null $P1215, vivify_401
    $P1215 = root_new ['parrot';'Hash']
  vivify_401:
    set $P1216, $P1215["blockoid"]
    unless_null $P1216, vivify_402
    new $P1216, "Undef"
  vivify_402:
    $P1217 = $P1216."ast"()
    store_lex "$past", $P1217
.annotate 'line', 424
    find_lex $P1218, "$past"
    $P1218."blocktype"("method")
.annotate 'line', 425
    find_lex $P1219, "$past"
    $P1219."control"("return_pir")
.annotate 'line', 426
    find_lex $P1220, "$past"
    unless_null $P1220, vivify_403
    $P1220 = root_new ['parrot';'ResizablePMCArray']
  vivify_403:
    set $P1221, $P1220[0]
    unless_null $P1221, vivify_404
    new $P1221, "Undef"
  vivify_404:
    get_hll_global $P1222, ["PAST"], "Op"
    $P1223 = $P1222."new"("    .lex \"self\", self" :named("inline"))
    $P1221."unshift"($P1223)
.annotate 'line', 427
    find_lex $P1224, "$past"
    $P1224."symbol"("self", "lexical" :named("scope"))
.annotate 'line', 428
    find_lex $P1226, "$/"
    unless_null $P1226, vivify_405
    $P1226 = root_new ['parrot';'Hash']
  vivify_405:
    set $P1227, $P1226["deflongname"]
    unless_null $P1227, vivify_406
    new $P1227, "Undef"
  vivify_406:
    unless $P1227, if_1225_end
    .const 'Sub' $P1229 = "75_1273884035.78954" 
    capture_lex $P1229
    $P1229()
  if_1225_end:
.annotate 'line', 432
    find_lex $P1240, "$/"
    find_lex $P1241, "$past"
    $P1242 = $P1240."!make"($P1241)
.annotate 'line', 422
    .return ($P1242)
  control_1211:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1243, exception, "payload"
    .return ($P1243)
.end


.namespace ["NQP";"Actions"]
.sub "_block1228"  :anon :subid("75_1273884035.78954") :outer("74_1273884035.78954")
.annotate 'line', 429
    new $P1230, "Undef"
    .lex "$name", $P1230
    find_lex $P1231, "$/"
    unless_null $P1231, vivify_407
    $P1231 = root_new ['parrot';'Hash']
  vivify_407:
    set $P1232, $P1231["deflongname"]
    unless_null $P1232, vivify_408
    $P1232 = root_new ['parrot';'ResizablePMCArray']
  vivify_408:
    set $P1233, $P1232[0]
    unless_null $P1233, vivify_409
    new $P1233, "Undef"
  vivify_409:
    $P1234 = $P1233."ast"()
    set $S1235, $P1234
    new $P1236, 'String'
    set $P1236, $S1235
    store_lex "$name", $P1236
.annotate 'line', 430
    find_lex $P1237, "$past"
    find_lex $P1238, "$name"
    $P1239 = $P1237."name"($P1238)
.annotate 'line', 428
    .return ($P1239)
.end


.namespace ["NQP";"Actions"]
.sub "signature"  :subid("76_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1247
.annotate 'line', 436
    .const 'Sub' $P1258 = "77_1273884035.78954" 
    capture_lex $P1258
    new $P1246, 'ExceptionHandler'
    set_addr $P1246, control_1245
    $P1246."handle_types"(57)
    push_eh $P1246
    .lex "self", self
    .lex "$/", param_1247
.annotate 'line', 437
    new $P1248, "Undef"
    .lex "$BLOCKINIT", $P1248
    get_global $P1249, "@BLOCK"
    unless_null $P1249, vivify_410
    $P1249 = root_new ['parrot';'ResizablePMCArray']
  vivify_410:
    set $P1250, $P1249[0]
    unless_null $P1250, vivify_411
    $P1250 = root_new ['parrot';'ResizablePMCArray']
  vivify_411:
    set $P1251, $P1250[0]
    unless_null $P1251, vivify_412
    new $P1251, "Undef"
  vivify_412:
    store_lex "$BLOCKINIT", $P1251
.annotate 'line', 438
    find_lex $P1253, "$/"
    unless_null $P1253, vivify_413
    $P1253 = root_new ['parrot';'Hash']
  vivify_413:
    set $P1254, $P1253["parameter"]
    unless_null $P1254, vivify_414
    new $P1254, "Undef"
  vivify_414:
    defined $I1255, $P1254
    unless $I1255, for_undef_415
    iter $P1252, $P1254
    new $P1265, 'ExceptionHandler'
    set_addr $P1265, loop1264_handler
    $P1265."handle_types"(64, 66, 65)
    push_eh $P1265
  loop1264_test:
    unless $P1252, loop1264_done
    shift $P1256, $P1252
  loop1264_redo:
    .const 'Sub' $P1258 = "77_1273884035.78954" 
    capture_lex $P1258
    $P1258($P1256)
  loop1264_next:
    goto loop1264_test
  loop1264_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1266, exception, 'type'
    eq $P1266, 64, loop1264_next
    eq $P1266, 66, loop1264_redo
  loop1264_done:
    pop_eh 
  for_undef_415:
.annotate 'line', 436
    .return ($P1252)
  control_1245:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1267, exception, "payload"
    .return ($P1267)
.end


.namespace ["NQP";"Actions"]
.sub "_block1257"  :anon :subid("77_1273884035.78954") :outer("76_1273884035.78954")
    .param pmc param_1259
.annotate 'line', 438
    .lex "$_", param_1259
    find_lex $P1260, "$BLOCKINIT"
    find_lex $P1261, "$_"
    $P1262 = $P1261."ast"()
    $P1263 = $P1260."push"($P1262)
    .return ($P1263)
.end


.namespace ["NQP";"Actions"]
.sub "parameter"  :subid("78_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1271
.annotate 'line', 441
    new $P1270, 'ExceptionHandler'
    set_addr $P1270, control_1269
    $P1270."handle_types"(57)
    push_eh $P1270
    .lex "self", self
    .lex "$/", param_1271
.annotate 'line', 442
    new $P1272, "Undef"
    .lex "$quant", $P1272
.annotate 'line', 443
    new $P1273, "Undef"
    .lex "$past", $P1273
.annotate 'line', 442
    find_lex $P1274, "$/"
    unless_null $P1274, vivify_416
    $P1274 = root_new ['parrot';'Hash']
  vivify_416:
    set $P1275, $P1274["quant"]
    unless_null $P1275, vivify_417
    new $P1275, "Undef"
  vivify_417:
    store_lex "$quant", $P1275
    find_lex $P1276, "$past"
.annotate 'line', 444
    find_lex $P1278, "$/"
    unless_null $P1278, vivify_418
    $P1278 = root_new ['parrot';'Hash']
  vivify_418:
    set $P1279, $P1278["named_param"]
    unless_null $P1279, vivify_419
    new $P1279, "Undef"
  vivify_419:
    if $P1279, if_1277
.annotate 'line', 451
    find_lex $P1293, "$/"
    unless_null $P1293, vivify_420
    $P1293 = root_new ['parrot';'Hash']
  vivify_420:
    set $P1294, $P1293["param_var"]
    unless_null $P1294, vivify_421
    new $P1294, "Undef"
  vivify_421:
    $P1295 = $P1294."ast"()
    store_lex "$past", $P1295
.annotate 'line', 452
    find_lex $P1297, "$quant"
    set $S1298, $P1297
    iseq $I1299, $S1298, "*"
    if $I1299, if_1296
.annotate 'line', 456
    find_lex $P1308, "$quant"
    set $S1309, $P1308
    iseq $I1310, $S1309, "?"
    unless $I1310, if_1307_end
.annotate 'line', 457
    find_lex $P1311, "$past"
    find_lex $P1312, "$/"
    unless_null $P1312, vivify_422
    $P1312 = root_new ['parrot';'Hash']
  vivify_422:
    set $P1313, $P1312["param_var"]
    unless_null $P1313, vivify_423
    $P1313 = root_new ['parrot';'Hash']
  vivify_423:
    set $P1314, $P1313["sigil"]
    unless_null $P1314, vivify_424
    new $P1314, "Undef"
  vivify_424:
    $P1315 = "vivitype"($P1314)
    $P1311."viviself"($P1315)
  if_1307_end:
.annotate 'line', 456
    goto if_1296_end
  if_1296:
.annotate 'line', 453
    find_lex $P1300, "$past"
    $P1300."slurpy"(1)
.annotate 'line', 454
    find_lex $P1301, "$past"
    find_lex $P1302, "$/"
    unless_null $P1302, vivify_425
    $P1302 = root_new ['parrot';'Hash']
  vivify_425:
    set $P1303, $P1302["param_var"]
    unless_null $P1303, vivify_426
    $P1303 = root_new ['parrot';'Hash']
  vivify_426:
    set $P1304, $P1303["sigil"]
    unless_null $P1304, vivify_427
    new $P1304, "Undef"
  vivify_427:
    set $S1305, $P1304
    iseq $I1306, $S1305, "%"
    $P1301."named"($I1306)
  if_1296_end:
.annotate 'line', 450
    goto if_1277_end
  if_1277:
.annotate 'line', 445
    find_lex $P1280, "$/"
    unless_null $P1280, vivify_428
    $P1280 = root_new ['parrot';'Hash']
  vivify_428:
    set $P1281, $P1280["named_param"]
    unless_null $P1281, vivify_429
    new $P1281, "Undef"
  vivify_429:
    $P1282 = $P1281."ast"()
    store_lex "$past", $P1282
.annotate 'line', 446
    find_lex $P1284, "$quant"
    set $S1285, $P1284
    isne $I1286, $S1285, "!"
    unless $I1286, if_1283_end
.annotate 'line', 447
    find_lex $P1287, "$past"
    find_lex $P1288, "$/"
    unless_null $P1288, vivify_430
    $P1288 = root_new ['parrot';'Hash']
  vivify_430:
    set $P1289, $P1288["named_param"]
    unless_null $P1289, vivify_431
    $P1289 = root_new ['parrot';'Hash']
  vivify_431:
    set $P1290, $P1289["param_var"]
    unless_null $P1290, vivify_432
    $P1290 = root_new ['parrot';'Hash']
  vivify_432:
    set $P1291, $P1290["sigil"]
    unless_null $P1291, vivify_433
    new $P1291, "Undef"
  vivify_433:
    $P1292 = "vivitype"($P1291)
    $P1287."viviself"($P1292)
  if_1283_end:
  if_1277_end:
.annotate 'line', 460
    find_lex $P1317, "$/"
    unless_null $P1317, vivify_434
    $P1317 = root_new ['parrot';'Hash']
  vivify_434:
    set $P1318, $P1317["default_value"]
    unless_null $P1318, vivify_435
    new $P1318, "Undef"
  vivify_435:
    unless $P1318, if_1316_end
.annotate 'line', 461
    find_lex $P1320, "$quant"
    set $S1321, $P1320
    iseq $I1322, $S1321, "*"
    unless $I1322, if_1319_end
.annotate 'line', 462
    find_lex $P1323, "$/"
    $P1324 = $P1323."CURSOR"()
    $P1324."panic"("Can't put default on slurpy parameter")
  if_1319_end:
.annotate 'line', 464
    find_lex $P1326, "$quant"
    set $S1327, $P1326
    iseq $I1328, $S1327, "!"
    unless $I1328, if_1325_end
.annotate 'line', 465
    find_lex $P1329, "$/"
    $P1330 = $P1329."CURSOR"()
    $P1330."panic"("Can't put default on required parameter")
  if_1325_end:
.annotate 'line', 467
    find_lex $P1331, "$past"
    find_lex $P1332, "$/"
    unless_null $P1332, vivify_436
    $P1332 = root_new ['parrot';'Hash']
  vivify_436:
    set $P1333, $P1332["default_value"]
    unless_null $P1333, vivify_437
    $P1333 = root_new ['parrot';'ResizablePMCArray']
  vivify_437:
    set $P1334, $P1333[0]
    unless_null $P1334, vivify_438
    $P1334 = root_new ['parrot';'Hash']
  vivify_438:
    set $P1335, $P1334["EXPR"]
    unless_null $P1335, vivify_439
    new $P1335, "Undef"
  vivify_439:
    $P1336 = $P1335."ast"()
    $P1331."viviself"($P1336)
  if_1316_end:
.annotate 'line', 469
    find_lex $P1338, "$past"
    $P1339 = $P1338."viviself"()
    if $P1339, unless_1337_end
    get_global $P1340, "@BLOCK"
    unless_null $P1340, vivify_440
    $P1340 = root_new ['parrot';'ResizablePMCArray']
  vivify_440:
    set $P1341, $P1340[0]
    unless_null $P1341, vivify_441
    new $P1341, "Undef"
  vivify_441:
    get_global $P1342, "@BLOCK"
    unless_null $P1342, vivify_442
    $P1342 = root_new ['parrot';'ResizablePMCArray']
  vivify_442:
    set $P1343, $P1342[0]
    unless_null $P1343, vivify_443
    new $P1343, "Undef"
  vivify_443:
    $P1344 = $P1343."arity"()
    set $N1345, $P1344
    new $P1346, 'Float'
    set $P1346, $N1345
    add $P1347, $P1346, 1
    $P1341."arity"($P1347)
  unless_1337_end:
.annotate 'line', 470
    find_lex $P1348, "$/"
    find_lex $P1349, "$past"
    $P1350 = $P1348."!make"($P1349)
.annotate 'line', 441
    .return ($P1350)
  control_1269:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1351, exception, "payload"
    .return ($P1351)
.end


.namespace ["NQP";"Actions"]
.sub "param_var"  :subid("79_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1355
.annotate 'line', 473
    new $P1354, 'ExceptionHandler'
    set_addr $P1354, control_1353
    $P1354."handle_types"(57)
    push_eh $P1354
    .lex "self", self
    .lex "$/", param_1355
.annotate 'line', 474
    new $P1356, "Undef"
    .lex "$name", $P1356
.annotate 'line', 475
    new $P1357, "Undef"
    .lex "$past", $P1357
.annotate 'line', 474
    find_lex $P1358, "$/"
    set $S1359, $P1358
    new $P1360, 'String'
    set $P1360, $S1359
    store_lex "$name", $P1360
.annotate 'line', 475
    get_hll_global $P1361, ["PAST"], "Var"
    find_lex $P1362, "$name"
    find_lex $P1363, "$/"
    $P1364 = $P1361."new"($P1362 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1363 :named("node"))
    store_lex "$past", $P1364
.annotate 'line', 477
    get_global $P1365, "@BLOCK"
    unless_null $P1365, vivify_444
    $P1365 = root_new ['parrot';'ResizablePMCArray']
  vivify_444:
    set $P1366, $P1365[0]
    unless_null $P1366, vivify_445
    new $P1366, "Undef"
  vivify_445:
    find_lex $P1367, "$name"
    $P1366."symbol"($P1367, "lexical" :named("scope"))
.annotate 'line', 478
    find_lex $P1368, "$/"
    find_lex $P1369, "$past"
    $P1370 = $P1368."!make"($P1369)
.annotate 'line', 473
    .return ($P1370)
  control_1353:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1371, exception, "payload"
    .return ($P1371)
.end


.namespace ["NQP";"Actions"]
.sub "named_param"  :subid("80_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1375
.annotate 'line', 481
    new $P1374, 'ExceptionHandler'
    set_addr $P1374, control_1373
    $P1374."handle_types"(57)
    push_eh $P1374
    .lex "self", self
    .lex "$/", param_1375
.annotate 'line', 482
    new $P1376, "Undef"
    .lex "$past", $P1376
    find_lex $P1377, "$/"
    unless_null $P1377, vivify_446
    $P1377 = root_new ['parrot';'Hash']
  vivify_446:
    set $P1378, $P1377["param_var"]
    unless_null $P1378, vivify_447
    new $P1378, "Undef"
  vivify_447:
    $P1379 = $P1378."ast"()
    store_lex "$past", $P1379
.annotate 'line', 483
    find_lex $P1380, "$past"
    find_lex $P1381, "$/"
    unless_null $P1381, vivify_448
    $P1381 = root_new ['parrot';'Hash']
  vivify_448:
    set $P1382, $P1381["param_var"]
    unless_null $P1382, vivify_449
    $P1382 = root_new ['parrot';'Hash']
  vivify_449:
    set $P1383, $P1382["name"]
    unless_null $P1383, vivify_450
    new $P1383, "Undef"
  vivify_450:
    set $S1384, $P1383
    $P1380."named"($S1384)
.annotate 'line', 484
    find_lex $P1385, "$/"
    find_lex $P1386, "$past"
    $P1387 = $P1385."!make"($P1386)
.annotate 'line', 481
    .return ($P1387)
  control_1373:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1388, exception, "payload"
    .return ($P1388)
.end


.namespace ["NQP";"Actions"]
.sub "regex_declarator"  :subid("81_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1392
    .param pmc param_1393 :optional
    .param int has_param_1393 :opt_flag
.annotate 'line', 487
    .const 'Sub' $P1463 = "83_1273884035.78954" 
    capture_lex $P1463
    .const 'Sub' $P1435 = "82_1273884035.78954" 
    capture_lex $P1435
    new $P1391, 'ExceptionHandler'
    set_addr $P1391, control_1390
    $P1391."handle_types"(57)
    push_eh $P1391
    .lex "self", self
    .lex "$/", param_1392
    if has_param_1393, optparam_451
    new $P1394, "Undef"
    set param_1393, $P1394
  optparam_451:
    .lex "$key", param_1393
.annotate 'line', 488
    $P1395 = root_new ['parrot';'ResizablePMCArray']
    .lex "@MODIFIERS", $P1395
.annotate 'line', 491
    new $P1396, "Undef"
    .lex "$name", $P1396
.annotate 'line', 492
    new $P1397, "Undef"
    .lex "$past", $P1397
.annotate 'line', 488

        $P1398 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1398
.annotate 'line', 491
    find_lex $P1399, "$/"
    unless_null $P1399, vivify_452
    $P1399 = root_new ['parrot';'Hash']
  vivify_452:
    set $P1400, $P1399["deflongname"]
    unless_null $P1400, vivify_453
    new $P1400, "Undef"
  vivify_453:
    $P1401 = $P1400."ast"()
    set $S1402, $P1401
    new $P1403, 'String'
    set $P1403, $S1402
    store_lex "$name", $P1403
    find_lex $P1404, "$past"
.annotate 'line', 493
    find_lex $P1406, "$/"
    unless_null $P1406, vivify_454
    $P1406 = root_new ['parrot';'Hash']
  vivify_454:
    set $P1407, $P1406["proto"]
    unless_null $P1407, vivify_455
    new $P1407, "Undef"
  vivify_455:
    if $P1407, if_1405
.annotate 'line', 520
    find_lex $P1431, "$key"
    set $S1432, $P1431
    iseq $I1433, $S1432, "open"
    if $I1433, if_1430
.annotate 'line', 533
    .const 'Sub' $P1463 = "83_1273884035.78954" 
    capture_lex $P1463
    $P1463()
    goto if_1430_end
  if_1430:
.annotate 'line', 520
    .const 'Sub' $P1435 = "82_1273884035.78954" 
    capture_lex $P1435
    $P1435()
  if_1430_end:
    goto if_1405_end
  if_1405:
.annotate 'line', 495
    get_hll_global $P1408, ["PAST"], "Stmts"
.annotate 'line', 496
    get_hll_global $P1409, ["PAST"], "Block"
    find_lex $P1410, "$name"
.annotate 'line', 497
    get_hll_global $P1411, ["PAST"], "Op"
.annotate 'line', 498
    get_hll_global $P1412, ["PAST"], "Var"
    $P1413 = $P1412."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1414, "$name"
    $P1415 = $P1411."new"($P1413, $P1414, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 497
    find_lex $P1416, "$/"
    $P1417 = $P1409."new"($P1415, $P1410 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1416 :named("node"))
.annotate 'line', 507
    get_hll_global $P1418, ["PAST"], "Block"
    new $P1419, "String"
    assign $P1419, "!PREFIX__"
    find_lex $P1420, "$name"
    concat $P1421, $P1419, $P1420
.annotate 'line', 508
    get_hll_global $P1422, ["PAST"], "Op"
.annotate 'line', 509
    get_hll_global $P1423, ["PAST"], "Var"
    $P1424 = $P1423."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1425, "$name"
    $P1426 = $P1422."new"($P1424, $P1425, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 508
    find_lex $P1427, "$/"
    $P1428 = $P1418."new"($P1426, $P1421 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1427 :named("node"))
.annotate 'line', 507
    $P1429 = $P1408."new"($P1417, $P1428)
.annotate 'line', 495
    store_lex "$past", $P1429
  if_1405_end:
.annotate 'line', 547
    find_lex $P1484, "$/"
    find_lex $P1485, "$past"
    $P1486 = $P1484."!make"($P1485)
.annotate 'line', 487
    .return ($P1486)
  control_1390:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1487, exception, "payload"
    .return ($P1487)
.end


.namespace ["NQP";"Actions"]
.sub "_block1462"  :anon :subid("83_1273884035.78954") :outer("81_1273884035.78954")
.annotate 'line', 534
    new $P1464, "Undef"
    .lex "$regex", $P1464
.annotate 'line', 535
    get_hll_global $P1465, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1466, "$/"
    unless_null $P1466, vivify_456
    $P1466 = root_new ['parrot';'Hash']
  vivify_456:
    set $P1467, $P1466["p6regex"]
    unless_null $P1467, vivify_457
    new $P1467, "Undef"
  vivify_457:
    $P1468 = $P1467."ast"()
    get_global $P1469, "@BLOCK"
    $P1470 = $P1469."shift"()
    $P1471 = $P1465($P1468, $P1470)
    store_lex "$regex", $P1471
.annotate 'line', 536
    find_lex $P1472, "$regex"
    find_lex $P1473, "$name"
    $P1472."name"($P1473)
.annotate 'line', 538
    get_hll_global $P1474, ["PAST"], "Op"
.annotate 'line', 540
    get_hll_global $P1475, ["PAST"], "Var"
    new $P1476, "ResizablePMCArray"
    push $P1476, "Regex"
    $P1477 = $P1475."new"("Method" :named("name"), $P1476 :named("namespace"), "package" :named("scope"))
    find_lex $P1478, "$regex"
    $P1479 = $P1474."new"($P1477, $P1478, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate 'line', 538
    store_lex "$past", $P1479
.annotate 'line', 544
    find_lex $P1480, "$regex"
    find_lex $P1481, "$past"
    unless_null $P1481, vivify_458
    $P1481 = root_new ['parrot';'Hash']
    store_lex "$past", $P1481
  vivify_458:
    set $P1481["sink"], $P1480
.annotate 'line', 545
    find_lex $P1482, "@MODIFIERS"
    $P1483 = $P1482."shift"()
.annotate 'line', 533
    .return ($P1483)
.end


.namespace ["NQP";"Actions"]
.sub "_block1434"  :anon :subid("82_1273884035.78954") :outer("81_1273884035.78954")
.annotate 'line', 521
    $P1436 = root_new ['parrot';'Hash']
    .lex "%h", $P1436
.annotate 'line', 520
    find_lex $P1437, "%h"
.annotate 'line', 522
    find_lex $P1439, "$/"
    unless_null $P1439, vivify_459
    $P1439 = root_new ['parrot';'Hash']
  vivify_459:
    set $P1440, $P1439["sym"]
    unless_null $P1440, vivify_460
    new $P1440, "Undef"
  vivify_460:
    set $S1441, $P1440
    iseq $I1442, $S1441, "token"
    unless $I1442, if_1438_end
    new $P1443, "Integer"
    assign $P1443, 1
    find_lex $P1444, "%h"
    unless_null $P1444, vivify_461
    $P1444 = root_new ['parrot';'Hash']
    store_lex "%h", $P1444
  vivify_461:
    set $P1444["r"], $P1443
  if_1438_end:
.annotate 'line', 523
    find_lex $P1446, "$/"
    unless_null $P1446, vivify_462
    $P1446 = root_new ['parrot';'Hash']
  vivify_462:
    set $P1447, $P1446["sym"]
    unless_null $P1447, vivify_463
    new $P1447, "Undef"
  vivify_463:
    set $S1448, $P1447
    iseq $I1449, $S1448, "rule"
    unless $I1449, if_1445_end
    new $P1450, "Integer"
    assign $P1450, 1
    find_lex $P1451, "%h"
    unless_null $P1451, vivify_464
    $P1451 = root_new ['parrot';'Hash']
    store_lex "%h", $P1451
  vivify_464:
    set $P1451["r"], $P1450
    new $P1452, "Integer"
    assign $P1452, 1
    find_lex $P1453, "%h"
    unless_null $P1453, vivify_465
    $P1453 = root_new ['parrot';'Hash']
    store_lex "%h", $P1453
  vivify_465:
    set $P1453["s"], $P1452
  if_1445_end:
.annotate 'line', 524
    find_lex $P1454, "@MODIFIERS"
    find_lex $P1455, "%h"
    $P1454."unshift"($P1455)
.annotate 'line', 525

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate 'line', 529
    get_global $P1456, "@BLOCK"
    unless_null $P1456, vivify_466
    $P1456 = root_new ['parrot';'ResizablePMCArray']
  vivify_466:
    set $P1457, $P1456[0]
    unless_null $P1457, vivify_467
    new $P1457, "Undef"
  vivify_467:
    $P1457."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate 'line', 530
    get_global $P1458, "@BLOCK"
    unless_null $P1458, vivify_468
    $P1458 = root_new ['parrot';'ResizablePMCArray']
  vivify_468:
    set $P1459, $P1458[0]
    unless_null $P1459, vivify_469
    new $P1459, "Undef"
  vivify_469:
    $P1459."symbol"("$/", "lexical" :named("scope"))
.annotate 'line', 531
    new $P1460, "Exception"
    set $P1460['type'], 57
    new $P1461, "Integer"
    assign $P1461, 0
    setattribute $P1460, 'payload', $P1461
    throw $P1460
.annotate 'line', 520
    .return ()
.end


.namespace ["NQP";"Actions"]
.sub "dotty"  :subid("84_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1491
.annotate 'line', 551
    new $P1490, 'ExceptionHandler'
    set_addr $P1490, control_1489
    $P1490."handle_types"(57)
    push_eh $P1490
    .lex "self", self
    .lex "$/", param_1491
.annotate 'line', 552
    new $P1492, "Undef"
    .lex "$past", $P1492
    find_lex $P1495, "$/"
    unless_null $P1495, vivify_470
    $P1495 = root_new ['parrot';'Hash']
  vivify_470:
    set $P1496, $P1495["args"]
    unless_null $P1496, vivify_471
    new $P1496, "Undef"
  vivify_471:
    if $P1496, if_1494
    get_hll_global $P1501, ["PAST"], "Op"
    find_lex $P1502, "$/"
    $P1503 = $P1501."new"($P1502 :named("node"))
    set $P1493, $P1503
    goto if_1494_end
  if_1494:
    find_lex $P1497, "$/"
    unless_null $P1497, vivify_472
    $P1497 = root_new ['parrot';'Hash']
  vivify_472:
    set $P1498, $P1497["args"]
    unless_null $P1498, vivify_473
    $P1498 = root_new ['parrot';'ResizablePMCArray']
  vivify_473:
    set $P1499, $P1498[0]
    unless_null $P1499, vivify_474
    new $P1499, "Undef"
  vivify_474:
    $P1500 = $P1499."ast"()
    set $P1493, $P1500
  if_1494_end:
    store_lex "$past", $P1493
.annotate 'line', 553
    find_lex $P1504, "$past"
    find_lex $P1507, "$/"
    unless_null $P1507, vivify_475
    $P1507 = root_new ['parrot';'Hash']
  vivify_475:
    set $P1508, $P1507["quote"]
    unless_null $P1508, vivify_476
    new $P1508, "Undef"
  vivify_476:
    if $P1508, if_1506
    find_lex $P1512, "$/"
    unless_null $P1512, vivify_477
    $P1512 = root_new ['parrot';'Hash']
  vivify_477:
    set $P1513, $P1512["longname"]
    unless_null $P1513, vivify_478
    new $P1513, "Undef"
  vivify_478:
    set $S1514, $P1513
    new $P1505, 'String'
    set $P1505, $S1514
    goto if_1506_end
  if_1506:
    find_lex $P1509, "$/"
    unless_null $P1509, vivify_479
    $P1509 = root_new ['parrot';'Hash']
  vivify_479:
    set $P1510, $P1509["quote"]
    unless_null $P1510, vivify_480
    new $P1510, "Undef"
  vivify_480:
    $P1511 = $P1510."ast"()
    set $P1505, $P1511
  if_1506_end:
    $P1504."name"($P1505)
.annotate 'line', 554
    find_lex $P1515, "$past"
    $P1515."pasttype"("callmethod")
.annotate 'line', 555
    find_lex $P1516, "$/"
    find_lex $P1517, "$past"
    $P1518 = $P1516."!make"($P1517)
.annotate 'line', 551
    .return ($P1518)
  control_1489:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1519, exception, "payload"
    .return ($P1519)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<self>"  :subid("85_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1523
.annotate 'line', 560
    new $P1522, 'ExceptionHandler'
    set_addr $P1522, control_1521
    $P1522."handle_types"(57)
    push_eh $P1522
    .lex "self", self
    .lex "$/", param_1523
.annotate 'line', 561
    find_lex $P1524, "$/"
    get_hll_global $P1525, ["PAST"], "Var"
    $P1526 = $P1525."new"("self" :named("name"))
    $P1527 = $P1524."!make"($P1526)
.annotate 'line', 560
    .return ($P1527)
  control_1521:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1528, exception, "payload"
    .return ($P1528)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<identifier>"  :subid("86_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1532
.annotate 'line', 564
    new $P1531, 'ExceptionHandler'
    set_addr $P1531, control_1530
    $P1531."handle_types"(57)
    push_eh $P1531
    .lex "self", self
    .lex "$/", param_1532
.annotate 'line', 565
    new $P1533, "Undef"
    .lex "$past", $P1533
    find_lex $P1534, "$/"
    unless_null $P1534, vivify_481
    $P1534 = root_new ['parrot';'Hash']
  vivify_481:
    set $P1535, $P1534["args"]
    unless_null $P1535, vivify_482
    new $P1535, "Undef"
  vivify_482:
    $P1536 = $P1535."ast"()
    store_lex "$past", $P1536
.annotate 'line', 566
    find_lex $P1537, "$past"
    find_lex $P1538, "$/"
    unless_null $P1538, vivify_483
    $P1538 = root_new ['parrot';'Hash']
  vivify_483:
    set $P1539, $P1538["identifier"]
    unless_null $P1539, vivify_484
    new $P1539, "Undef"
  vivify_484:
    set $S1540, $P1539
    $P1537."name"($S1540)
.annotate 'line', 567
    find_lex $P1541, "$/"
    find_lex $P1542, "$past"
    $P1543 = $P1541."!make"($P1542)
.annotate 'line', 564
    .return ($P1543)
  control_1530:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1544, exception, "payload"
    .return ($P1544)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<name>"  :subid("87_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1548
.annotate 'line', 570
    new $P1547, 'ExceptionHandler'
    set_addr $P1547, control_1546
    $P1547."handle_types"(57)
    push_eh $P1547
    .lex "self", self
    .lex "$/", param_1548
.annotate 'line', 571
    $P1549 = root_new ['parrot';'ResizablePMCArray']
    .lex "@ns", $P1549
.annotate 'line', 572
    new $P1550, "Undef"
    .lex "$name", $P1550
.annotate 'line', 574
    new $P1551, "Undef"
    .lex "$var", $P1551
.annotate 'line', 576
    new $P1552, "Undef"
    .lex "$past", $P1552
.annotate 'line', 571
    find_lex $P1553, "$/"
    unless_null $P1553, vivify_485
    $P1553 = root_new ['parrot';'Hash']
  vivify_485:
    set $P1554, $P1553["name"]
    unless_null $P1554, vivify_486
    $P1554 = root_new ['parrot';'Hash']
  vivify_486:
    set $P1555, $P1554["identifier"]
    unless_null $P1555, vivify_487
    new $P1555, "Undef"
  vivify_487:
    clone $P1556, $P1555
    store_lex "@ns", $P1556
.annotate 'line', 572
    find_lex $P1557, "@ns"
    $P1558 = $P1557."pop"()
    store_lex "$name", $P1558
.annotate 'line', 573
    find_lex $P1562, "@ns"
    if $P1562, if_1561
    set $P1560, $P1562
    goto if_1561_end
  if_1561:
    find_lex $P1563, "@ns"
    unless_null $P1563, vivify_488
    $P1563 = root_new ['parrot';'ResizablePMCArray']
  vivify_488:
    set $P1564, $P1563[0]
    unless_null $P1564, vivify_489
    new $P1564, "Undef"
  vivify_489:
    set $S1565, $P1564
    iseq $I1566, $S1565, "GLOBAL"
    new $P1560, 'Integer'
    set $P1560, $I1566
  if_1561_end:
    unless $P1560, if_1559_end
    find_lex $P1567, "@ns"
    $P1567."shift"()
  if_1559_end:
.annotate 'line', 575
    get_hll_global $P1568, ["PAST"], "Var"
    find_lex $P1569, "$name"
    set $S1570, $P1569
    find_lex $P1571, "@ns"
    $P1572 = $P1568."new"($S1570 :named("name"), $P1571 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1572
.annotate 'line', 576
    find_lex $P1573, "$var"
    store_lex "$past", $P1573
.annotate 'line', 577
    find_lex $P1575, "$/"
    unless_null $P1575, vivify_490
    $P1575 = root_new ['parrot';'Hash']
  vivify_490:
    set $P1576, $P1575["args"]
    unless_null $P1576, vivify_491
    new $P1576, "Undef"
  vivify_491:
    unless $P1576, if_1574_end
.annotate 'line', 578
    find_lex $P1577, "$/"
    unless_null $P1577, vivify_492
    $P1577 = root_new ['parrot';'Hash']
  vivify_492:
    set $P1578, $P1577["args"]
    unless_null $P1578, vivify_493
    $P1578 = root_new ['parrot';'ResizablePMCArray']
  vivify_493:
    set $P1579, $P1578[0]
    unless_null $P1579, vivify_494
    new $P1579, "Undef"
  vivify_494:
    $P1580 = $P1579."ast"()
    store_lex "$past", $P1580
.annotate 'line', 579
    find_lex $P1581, "$past"
    find_lex $P1582, "$var"
    $P1581."unshift"($P1582)
  if_1574_end:
.annotate 'line', 581
    find_lex $P1583, "$/"
    find_lex $P1584, "$past"
    $P1585 = $P1583."!make"($P1584)
.annotate 'line', 570
    .return ($P1585)
  control_1546:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1586, exception, "payload"
    .return ($P1586)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<pir::op>"  :subid("88_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1590
.annotate 'line', 584
    new $P1589, 'ExceptionHandler'
    set_addr $P1589, control_1588
    $P1589."handle_types"(57)
    push_eh $P1589
    .lex "self", self
    .lex "$/", param_1590
.annotate 'line', 585
    new $P1591, "Undef"
    .lex "$past", $P1591
.annotate 'line', 586
    new $P1592, "Undef"
    .lex "$pirop", $P1592
.annotate 'line', 585
    find_lex $P1595, "$/"
    unless_null $P1595, vivify_495
    $P1595 = root_new ['parrot';'Hash']
  vivify_495:
    set $P1596, $P1595["args"]
    unless_null $P1596, vivify_496
    new $P1596, "Undef"
  vivify_496:
    if $P1596, if_1594
    get_hll_global $P1601, ["PAST"], "Op"
    find_lex $P1602, "$/"
    $P1603 = $P1601."new"($P1602 :named("node"))
    set $P1593, $P1603
    goto if_1594_end
  if_1594:
    find_lex $P1597, "$/"
    unless_null $P1597, vivify_497
    $P1597 = root_new ['parrot';'Hash']
  vivify_497:
    set $P1598, $P1597["args"]
    unless_null $P1598, vivify_498
    $P1598 = root_new ['parrot';'ResizablePMCArray']
  vivify_498:
    set $P1599, $P1598[0]
    unless_null $P1599, vivify_499
    new $P1599, "Undef"
  vivify_499:
    $P1600 = $P1599."ast"()
    set $P1593, $P1600
  if_1594_end:
    store_lex "$past", $P1593
.annotate 'line', 586
    find_lex $P1604, "$/"
    unless_null $P1604, vivify_500
    $P1604 = root_new ['parrot';'Hash']
  vivify_500:
    set $P1605, $P1604["op"]
    unless_null $P1605, vivify_501
    new $P1605, "Undef"
  vivify_501:
    set $S1606, $P1605
    new $P1607, 'String'
    set $P1607, $S1606
    store_lex "$pirop", $P1607
.annotate 'line', 587

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1608 = box $S0
    
    store_lex "$pirop", $P1608
.annotate 'line', 594
    find_lex $P1609, "$past"
    find_lex $P1610, "$pirop"
    $P1609."pirop"($P1610)
.annotate 'line', 595
    find_lex $P1611, "$past"
    $P1611."pasttype"("pirop")
.annotate 'line', 596
    find_lex $P1612, "$/"
    find_lex $P1613, "$past"
    $P1614 = $P1612."!make"($P1613)
.annotate 'line', 584
    .return ($P1614)
  control_1588:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1615, exception, "payload"
    .return ($P1615)
.end


.namespace ["NQP";"Actions"]
.sub "args"  :subid("89_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1619
.annotate 'line', 599
    new $P1618, 'ExceptionHandler'
    set_addr $P1618, control_1617
    $P1618."handle_types"(57)
    push_eh $P1618
    .lex "self", self
    .lex "$/", param_1619
    find_lex $P1620, "$/"
    find_lex $P1621, "$/"
    unless_null $P1621, vivify_502
    $P1621 = root_new ['parrot';'Hash']
  vivify_502:
    set $P1622, $P1621["arglist"]
    unless_null $P1622, vivify_503
    new $P1622, "Undef"
  vivify_503:
    $P1623 = $P1622."ast"()
    $P1624 = $P1620."!make"($P1623)
    .return ($P1624)
  control_1617:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1625, exception, "payload"
    .return ($P1625)
.end


.namespace ["NQP";"Actions"]
.sub "arglist"  :subid("90_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1629
.annotate 'line', 601
    .const 'Sub' $P1640 = "91_1273884035.78954" 
    capture_lex $P1640
    new $P1628, 'ExceptionHandler'
    set_addr $P1628, control_1627
    $P1628."handle_types"(57)
    push_eh $P1628
    .lex "self", self
    .lex "$/", param_1629
.annotate 'line', 602
    new $P1630, "Undef"
    .lex "$past", $P1630
.annotate 'line', 610
    new $P1631, "Undef"
    .lex "$i", $P1631
.annotate 'line', 611
    new $P1632, "Undef"
    .lex "$n", $P1632
.annotate 'line', 602
    get_hll_global $P1633, ["PAST"], "Op"
    find_lex $P1634, "$/"
    $P1635 = $P1633."new"("call" :named("pasttype"), $P1634 :named("node"))
    store_lex "$past", $P1635
.annotate 'line', 603
    find_lex $P1637, "$/"
    unless_null $P1637, vivify_504
    $P1637 = root_new ['parrot';'Hash']
  vivify_504:
    set $P1638, $P1637["EXPR"]
    unless_null $P1638, vivify_505
    new $P1638, "Undef"
  vivify_505:
    unless $P1638, if_1636_end
    .const 'Sub' $P1640 = "91_1273884035.78954" 
    capture_lex $P1640
    $P1640()
  if_1636_end:
.annotate 'line', 610
    new $P1672, "Integer"
    assign $P1672, 0
    store_lex "$i", $P1672
.annotate 'line', 611
    find_lex $P1673, "$past"
    $P1674 = $P1673."list"()
    set $N1675, $P1674
    new $P1676, 'Float'
    set $P1676, $N1675
    store_lex "$n", $P1676
.annotate 'line', 612
    new $P1724, 'ExceptionHandler'
    set_addr $P1724, loop1723_handler
    $P1724."handle_types"(64, 66, 65)
    push_eh $P1724
  loop1723_test:
    find_lex $P1677, "$i"
    set $N1678, $P1677
    find_lex $P1679, "$n"
    set $N1680, $P1679
    islt $I1681, $N1678, $N1680
    unless $I1681, loop1723_done
  loop1723_redo:
.annotate 'line', 613
    find_lex $P1683, "$i"
    set $I1684, $P1683
    find_lex $P1685, "$past"
    unless_null $P1685, vivify_509
    $P1685 = root_new ['parrot';'ResizablePMCArray']
  vivify_509:
    set $P1686, $P1685[$I1684]
    unless_null $P1686, vivify_510
    new $P1686, "Undef"
  vivify_510:
    $S1687 = $P1686."name"()
    iseq $I1688, $S1687, "&prefix:<|>"
    unless $I1688, if_1682_end
.annotate 'line', 614
    find_lex $P1689, "$i"
    set $I1690, $P1689
    find_lex $P1691, "$past"
    unless_null $P1691, vivify_511
    $P1691 = root_new ['parrot';'ResizablePMCArray']
  vivify_511:
    set $P1692, $P1691[$I1690]
    unless_null $P1692, vivify_512
    $P1692 = root_new ['parrot';'ResizablePMCArray']
  vivify_512:
    set $P1693, $P1692[0]
    unless_null $P1693, vivify_513
    new $P1693, "Undef"
  vivify_513:
    find_lex $P1694, "$i"
    set $I1695, $P1694
    find_lex $P1696, "$past"
    unless_null $P1696, vivify_514
    $P1696 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$past", $P1696
  vivify_514:
    set $P1696[$I1695], $P1693
.annotate 'line', 615
    find_lex $P1697, "$i"
    set $I1698, $P1697
    find_lex $P1699, "$past"
    unless_null $P1699, vivify_515
    $P1699 = root_new ['parrot';'ResizablePMCArray']
  vivify_515:
    set $P1700, $P1699[$I1698]
    unless_null $P1700, vivify_516
    new $P1700, "Undef"
  vivify_516:
    $P1700."flat"(1)
.annotate 'line', 616
    find_lex $P1704, "$i"
    set $I1705, $P1704
    find_lex $P1706, "$past"
    unless_null $P1706, vivify_517
    $P1706 = root_new ['parrot';'ResizablePMCArray']
  vivify_517:
    set $P1707, $P1706[$I1705]
    unless_null $P1707, vivify_518
    new $P1707, "Undef"
  vivify_518:
    get_hll_global $P1708, ["PAST"], "Val"
    $P1709 = $P1707."isa"($P1708)
    if $P1709, if_1703
    set $P1702, $P1709
    goto if_1703_end
  if_1703:
.annotate 'line', 617
    find_lex $P1710, "$i"
    set $I1711, $P1710
    find_lex $P1712, "$past"
    unless_null $P1712, vivify_519
    $P1712 = root_new ['parrot';'ResizablePMCArray']
  vivify_519:
    set $P1713, $P1712[$I1711]
    unless_null $P1713, vivify_520
    new $P1713, "Undef"
  vivify_520:
    $S1714 = $P1713."name"()
    substr $S1715, $S1714, 0, 1
    iseq $I1716, $S1715, "%"
    new $P1702, 'Integer'
    set $P1702, $I1716
  if_1703_end:
    unless $P1702, if_1701_end
.annotate 'line', 618
    find_lex $P1717, "$i"
    set $I1718, $P1717
    find_lex $P1719, "$past"
    unless_null $P1719, vivify_521
    $P1719 = root_new ['parrot';'ResizablePMCArray']
  vivify_521:
    set $P1720, $P1719[$I1718]
    unless_null $P1720, vivify_522
    new $P1720, "Undef"
  vivify_522:
    $P1720."named"(1)
  if_1701_end:
  if_1682_end:
.annotate 'line', 613
    find_lex $P1721, "$i"
    clone $P1722, $P1721
    inc $P1721
  loop1723_next:
.annotate 'line', 612
    goto loop1723_test
  loop1723_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1725, exception, 'type'
    eq $P1725, 64, loop1723_next
    eq $P1725, 66, loop1723_redo
  loop1723_done:
    pop_eh 
.annotate 'line', 623
    find_lex $P1726, "$/"
    find_lex $P1727, "$past"
    $P1728 = $P1726."!make"($P1727)
.annotate 'line', 601
    .return ($P1728)
  control_1627:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1729, exception, "payload"
    .return ($P1729)
.end


.namespace ["NQP";"Actions"]
.sub "_block1639"  :anon :subid("91_1273884035.78954") :outer("90_1273884035.78954")
.annotate 'line', 603
    .const 'Sub' $P1661 = "92_1273884035.78954" 
    capture_lex $P1661
.annotate 'line', 604
    new $P1641, "Undef"
    .lex "$expr", $P1641
    find_lex $P1642, "$/"
    unless_null $P1642, vivify_506
    $P1642 = root_new ['parrot';'Hash']
  vivify_506:
    set $P1643, $P1642["EXPR"]
    unless_null $P1643, vivify_507
    new $P1643, "Undef"
  vivify_507:
    $P1644 = $P1643."ast"()
    store_lex "$expr", $P1644
.annotate 'line', 605
    find_lex $P1649, "$expr"
    $S1650 = $P1649."name"()
    iseq $I1651, $S1650, "&infix:<,>"
    if $I1651, if_1648
    new $P1647, 'Integer'
    set $P1647, $I1651
    goto if_1648_end
  if_1648:
    find_lex $P1652, "$expr"
    $P1653 = $P1652."named"()
    isfalse $I1654, $P1653
    new $P1647, 'Integer'
    set $P1647, $I1654
  if_1648_end:
    if $P1647, if_1646
.annotate 'line', 608
    find_lex $P1669, "$past"
    find_lex $P1670, "$expr"
    $P1671 = $P1669."push"($P1670)
    set $P1645, $P1671
.annotate 'line', 605
    goto if_1646_end
  if_1646:
.annotate 'line', 606
    find_lex $P1656, "$expr"
    $P1657 = $P1656."list"()
    defined $I1658, $P1657
    unless $I1658, for_undef_508
    iter $P1655, $P1657
    new $P1667, 'ExceptionHandler'
    set_addr $P1667, loop1666_handler
    $P1667."handle_types"(64, 66, 65)
    push_eh $P1667
  loop1666_test:
    unless $P1655, loop1666_done
    shift $P1659, $P1655
  loop1666_redo:
    .const 'Sub' $P1661 = "92_1273884035.78954" 
    capture_lex $P1661
    $P1661($P1659)
  loop1666_next:
    goto loop1666_test
  loop1666_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1668, exception, 'type'
    eq $P1668, 64, loop1666_next
    eq $P1668, 66, loop1666_redo
  loop1666_done:
    pop_eh 
  for_undef_508:
.annotate 'line', 605
    set $P1645, $P1655
  if_1646_end:
.annotate 'line', 603
    .return ($P1645)
.end


.namespace ["NQP";"Actions"]
.sub "_block1660"  :anon :subid("92_1273884035.78954") :outer("91_1273884035.78954")
    .param pmc param_1662
.annotate 'line', 606
    .lex "$_", param_1662
    find_lex $P1663, "$past"
    find_lex $P1664, "$_"
    $P1665 = $P1663."push"($P1664)
    .return ($P1665)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<value>"  :subid("93_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1733
.annotate 'line', 627
    new $P1732, 'ExceptionHandler'
    set_addr $P1732, control_1731
    $P1732."handle_types"(57)
    push_eh $P1732
    .lex "self", self
    .lex "$/", param_1733
    find_lex $P1734, "$/"
    find_lex $P1735, "$/"
    unless_null $P1735, vivify_523
    $P1735 = root_new ['parrot';'Hash']
  vivify_523:
    set $P1736, $P1735["value"]
    unless_null $P1736, vivify_524
    new $P1736, "Undef"
  vivify_524:
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
.sub "circumfix:sym<( )>"  :subid("94_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1743
.annotate 'line', 629
    new $P1742, 'ExceptionHandler'
    set_addr $P1742, control_1741
    $P1742."handle_types"(57)
    push_eh $P1742
    .lex "self", self
    .lex "$/", param_1743
.annotate 'line', 630
    find_lex $P1744, "$/"
.annotate 'line', 631
    find_lex $P1747, "$/"
    unless_null $P1747, vivify_525
    $P1747 = root_new ['parrot';'Hash']
  vivify_525:
    set $P1748, $P1747["EXPR"]
    unless_null $P1748, vivify_526
    new $P1748, "Undef"
  vivify_526:
    if $P1748, if_1746
.annotate 'line', 632
    get_hll_global $P1753, ["PAST"], "Op"
    find_lex $P1754, "$/"
    $P1755 = $P1753."new"("list" :named("pasttype"), $P1754 :named("node"))
    set $P1745, $P1755
.annotate 'line', 631
    goto if_1746_end
  if_1746:
    find_lex $P1749, "$/"
    unless_null $P1749, vivify_527
    $P1749 = root_new ['parrot';'Hash']
  vivify_527:
    set $P1750, $P1749["EXPR"]
    unless_null $P1750, vivify_528
    $P1750 = root_new ['parrot';'ResizablePMCArray']
  vivify_528:
    set $P1751, $P1750[0]
    unless_null $P1751, vivify_529
    new $P1751, "Undef"
  vivify_529:
    $P1752 = $P1751."ast"()
    set $P1745, $P1752
  if_1746_end:
    $P1756 = $P1744."!make"($P1745)
.annotate 'line', 629
    .return ($P1756)
  control_1741:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1757, exception, "payload"
    .return ($P1757)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<[ ]>"  :subid("95_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1761
.annotate 'line', 635
    new $P1760, 'ExceptionHandler'
    set_addr $P1760, control_1759
    $P1760."handle_types"(57)
    push_eh $P1760
    .lex "self", self
    .lex "$/", param_1761
.annotate 'line', 636
    new $P1762, "Undef"
    .lex "$past", $P1762
.annotate 'line', 635
    find_lex $P1763, "$past"
.annotate 'line', 637
    find_lex $P1765, "$/"
    unless_null $P1765, vivify_530
    $P1765 = root_new ['parrot';'Hash']
  vivify_530:
    set $P1766, $P1765["EXPR"]
    unless_null $P1766, vivify_531
    new $P1766, "Undef"
  vivify_531:
    if $P1766, if_1764
.annotate 'line', 644
    get_hll_global $P1778, ["PAST"], "Op"
    $P1779 = $P1778."new"("list" :named("pasttype"))
    store_lex "$past", $P1779
.annotate 'line', 643
    goto if_1764_end
  if_1764:
.annotate 'line', 638
    find_lex $P1767, "$/"
    unless_null $P1767, vivify_532
    $P1767 = root_new ['parrot';'Hash']
  vivify_532:
    set $P1768, $P1767["EXPR"]
    unless_null $P1768, vivify_533
    $P1768 = root_new ['parrot';'ResizablePMCArray']
  vivify_533:
    set $P1769, $P1768[0]
    unless_null $P1769, vivify_534
    new $P1769, "Undef"
  vivify_534:
    $P1770 = $P1769."ast"()
    store_lex "$past", $P1770
.annotate 'line', 639
    find_lex $P1772, "$past"
    $S1773 = $P1772."name"()
    isne $I1774, $S1773, "&infix:<,>"
    unless $I1774, if_1771_end
.annotate 'line', 640
    get_hll_global $P1775, ["PAST"], "Op"
    find_lex $P1776, "$past"
    $P1777 = $P1775."new"($P1776, "list" :named("pasttype"))
    store_lex "$past", $P1777
  if_1771_end:
  if_1764_end:
.annotate 'line', 646
    find_lex $P1780, "$past"
    $P1780."name"("&circumfix:<[ ]>")
.annotate 'line', 647
    find_lex $P1781, "$/"
    find_lex $P1782, "$past"
    $P1783 = $P1781."!make"($P1782)
.annotate 'line', 635
    .return ($P1783)
  control_1759:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1784, exception, "payload"
    .return ($P1784)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<ang>"  :subid("96_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1788
.annotate 'line', 650
    new $P1787, 'ExceptionHandler'
    set_addr $P1787, control_1786
    $P1787."handle_types"(57)
    push_eh $P1787
    .lex "self", self
    .lex "$/", param_1788
    find_lex $P1789, "$/"
    find_lex $P1790, "$/"
    unless_null $P1790, vivify_535
    $P1790 = root_new ['parrot';'Hash']
  vivify_535:
    set $P1791, $P1790["quote_EXPR"]
    unless_null $P1791, vivify_536
    new $P1791, "Undef"
  vivify_536:
    $P1792 = $P1791."ast"()
    $P1793 = $P1789."!make"($P1792)
    .return ($P1793)
  control_1786:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1794, exception, "payload"
    .return ($P1794)
.end


.namespace ["NQP";"Actions"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("97_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1798
.annotate 'line', 651
    new $P1797, 'ExceptionHandler'
    set_addr $P1797, control_1796
    $P1797."handle_types"(57)
    push_eh $P1797
    .lex "self", self
    .lex "$/", param_1798
    find_lex $P1799, "$/"
    find_lex $P1800, "$/"
    unless_null $P1800, vivify_537
    $P1800 = root_new ['parrot';'Hash']
  vivify_537:
    set $P1801, $P1800["quote_EXPR"]
    unless_null $P1801, vivify_538
    new $P1801, "Undef"
  vivify_538:
    $P1802 = $P1801."ast"()
    $P1803 = $P1799."!make"($P1802)
    .return ($P1803)
  control_1796:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1804, exception, "payload"
    .return ($P1804)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<{ }>"  :subid("98_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1808
.annotate 'line', 653
    new $P1807, 'ExceptionHandler'
    set_addr $P1807, control_1806
    $P1807."handle_types"(57)
    push_eh $P1807
    .lex "self", self
    .lex "$/", param_1808
.annotate 'line', 654
    new $P1809, "Undef"
    .lex "$past", $P1809
    find_lex $P1812, "$/"
    unless_null $P1812, vivify_539
    $P1812 = root_new ['parrot';'Hash']
  vivify_539:
    set $P1813, $P1812["pblock"]
    unless_null $P1813, vivify_540
    $P1813 = root_new ['parrot';'Hash']
  vivify_540:
    set $P1814, $P1813["blockoid"]
    unless_null $P1814, vivify_541
    $P1814 = root_new ['parrot';'Hash']
  vivify_541:
    set $P1815, $P1814["statementlist"]
    unless_null $P1815, vivify_542
    $P1815 = root_new ['parrot';'Hash']
  vivify_542:
    set $P1816, $P1815["statement"]
    unless_null $P1816, vivify_543
    new $P1816, "Undef"
  vivify_543:
    set $N1817, $P1816
    isgt $I1818, $N1817, 0.0
    if $I1818, if_1811
.annotate 'line', 656
    $P1822 = "vivitype"("%")
    set $P1810, $P1822
.annotate 'line', 654
    goto if_1811_end
  if_1811:
.annotate 'line', 655
    find_lex $P1819, "$/"
    unless_null $P1819, vivify_544
    $P1819 = root_new ['parrot';'Hash']
  vivify_544:
    set $P1820, $P1819["pblock"]
    unless_null $P1820, vivify_545
    new $P1820, "Undef"
  vivify_545:
    $P1821 = $P1820."ast"()
    set $P1810, $P1821
  if_1811_end:
    store_lex "$past", $P1810
.annotate 'line', 657
    new $P1823, "Integer"
    assign $P1823, 1
    find_lex $P1824, "$past"
    unless_null $P1824, vivify_546
    $P1824 = root_new ['parrot';'Hash']
    store_lex "$past", $P1824
  vivify_546:
    set $P1824["bareblock"], $P1823
.annotate 'line', 658
    find_lex $P1825, "$/"
    find_lex $P1826, "$past"
    $P1827 = $P1825."!make"($P1826)
.annotate 'line', 653
    .return ($P1827)
  control_1806:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1828, exception, "payload"
    .return ($P1828)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<sigil>"  :subid("99_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1832
.annotate 'line', 661
    new $P1831, 'ExceptionHandler'
    set_addr $P1831, control_1830
    $P1831."handle_types"(57)
    push_eh $P1831
    .lex "self", self
    .lex "$/", param_1832
.annotate 'line', 662
    new $P1833, "Undef"
    .lex "$name", $P1833
    find_lex $P1836, "$/"
    unless_null $P1836, vivify_547
    $P1836 = root_new ['parrot';'Hash']
  vivify_547:
    set $P1837, $P1836["sigil"]
    unless_null $P1837, vivify_548
    new $P1837, "Undef"
  vivify_548:
    set $S1838, $P1837
    iseq $I1839, $S1838, "@"
    if $I1839, if_1835
.annotate 'line', 663
    find_lex $P1843, "$/"
    unless_null $P1843, vivify_549
    $P1843 = root_new ['parrot';'Hash']
  vivify_549:
    set $P1844, $P1843["sigil"]
    unless_null $P1844, vivify_550
    new $P1844, "Undef"
  vivify_550:
    set $S1845, $P1844
    iseq $I1846, $S1845, "%"
    if $I1846, if_1842
    new $P1848, "String"
    assign $P1848, "item"
    set $P1841, $P1848
    goto if_1842_end
  if_1842:
    new $P1847, "String"
    assign $P1847, "hash"
    set $P1841, $P1847
  if_1842_end:
    set $P1834, $P1841
.annotate 'line', 662
    goto if_1835_end
  if_1835:
    new $P1840, "String"
    assign $P1840, "list"
    set $P1834, $P1840
  if_1835_end:
    store_lex "$name", $P1834
.annotate 'line', 665
    find_lex $P1849, "$/"
    get_hll_global $P1850, ["PAST"], "Op"
    find_lex $P1851, "$name"
    find_lex $P1852, "$/"
    unless_null $P1852, vivify_551
    $P1852 = root_new ['parrot';'Hash']
  vivify_551:
    set $P1853, $P1852["semilist"]
    unless_null $P1853, vivify_552
    new $P1853, "Undef"
  vivify_552:
    $P1854 = $P1853."ast"()
    $P1855 = $P1850."new"($P1854, "callmethod" :named("pasttype"), $P1851 :named("name"))
    $P1856 = $P1849."!make"($P1855)
.annotate 'line', 661
    .return ($P1856)
  control_1830:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1857, exception, "payload"
    .return ($P1857)
.end


.namespace ["NQP";"Actions"]
.sub "semilist"  :subid("100_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1861
.annotate 'line', 668
    new $P1860, 'ExceptionHandler'
    set_addr $P1860, control_1859
    $P1860."handle_types"(57)
    push_eh $P1860
    .lex "self", self
    .lex "$/", param_1861
    find_lex $P1862, "$/"
    find_lex $P1863, "$/"
    unless_null $P1863, vivify_553
    $P1863 = root_new ['parrot';'Hash']
  vivify_553:
    set $P1864, $P1863["statement"]
    unless_null $P1864, vivify_554
    new $P1864, "Undef"
  vivify_554:
    $P1865 = $P1864."ast"()
    $P1866 = $P1862."!make"($P1865)
    .return ($P1866)
  control_1859:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1867, exception, "payload"
    .return ($P1867)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<[ ]>"  :subid("101_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1871
.annotate 'line', 670
    new $P1870, 'ExceptionHandler'
    set_addr $P1870, control_1869
    $P1870."handle_types"(57)
    push_eh $P1870
    .lex "self", self
    .lex "$/", param_1871
.annotate 'line', 671
    find_lex $P1872, "$/"
    get_hll_global $P1873, ["PAST"], "Var"
    find_lex $P1874, "$/"
    unless_null $P1874, vivify_555
    $P1874 = root_new ['parrot';'Hash']
  vivify_555:
    set $P1875, $P1874["EXPR"]
    unless_null $P1875, vivify_556
    new $P1875, "Undef"
  vivify_556:
    $P1876 = $P1875."ast"()
.annotate 'line', 673
    $P1877 = "vivitype"("@")
    $P1878 = $P1873."new"($P1876, "keyed_int" :named("scope"), "Undef" :named("viviself"), $P1877 :named("vivibase"))
.annotate 'line', 671
    $P1879 = $P1872."!make"($P1878)
.annotate 'line', 670
    .return ($P1879)
  control_1869:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1880, exception, "payload"
    .return ($P1880)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<{ }>"  :subid("102_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1884
.annotate 'line', 676
    new $P1883, 'ExceptionHandler'
    set_addr $P1883, control_1882
    $P1883."handle_types"(57)
    push_eh $P1883
    .lex "self", self
    .lex "$/", param_1884
.annotate 'line', 677
    find_lex $P1885, "$/"
    get_hll_global $P1886, ["PAST"], "Var"
    find_lex $P1887, "$/"
    unless_null $P1887, vivify_557
    $P1887 = root_new ['parrot';'Hash']
  vivify_557:
    set $P1888, $P1887["EXPR"]
    unless_null $P1888, vivify_558
    new $P1888, "Undef"
  vivify_558:
    $P1889 = $P1888."ast"()
.annotate 'line', 679
    $P1890 = "vivitype"("%")
    $P1891 = $P1886."new"($P1889, "keyed" :named("scope"), "Undef" :named("viviself"), $P1890 :named("vivibase"))
.annotate 'line', 677
    $P1892 = $P1885."!make"($P1891)
.annotate 'line', 676
    .return ($P1892)
  control_1882:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1893, exception, "payload"
    .return ($P1893)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<ang>"  :subid("103_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1897
.annotate 'line', 682
    new $P1896, 'ExceptionHandler'
    set_addr $P1896, control_1895
    $P1896."handle_types"(57)
    push_eh $P1896
    .lex "self", self
    .lex "$/", param_1897
.annotate 'line', 683
    find_lex $P1898, "$/"
    get_hll_global $P1899, ["PAST"], "Var"
    find_lex $P1900, "$/"
    unless_null $P1900, vivify_559
    $P1900 = root_new ['parrot';'Hash']
  vivify_559:
    set $P1901, $P1900["quote_EXPR"]
    unless_null $P1901, vivify_560
    new $P1901, "Undef"
  vivify_560:
    $P1902 = $P1901."ast"()
.annotate 'line', 685
    $P1903 = "vivitype"("%")
    $P1904 = $P1899."new"($P1902, "keyed" :named("scope"), "Undef" :named("viviself"), $P1903 :named("vivibase"))
.annotate 'line', 683
    $P1905 = $P1898."!make"($P1904)
.annotate 'line', 682
    .return ($P1905)
  control_1895:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1906, exception, "payload"
    .return ($P1906)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<( )>"  :subid("104_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1910
.annotate 'line', 688
    new $P1909, 'ExceptionHandler'
    set_addr $P1909, control_1908
    $P1909."handle_types"(57)
    push_eh $P1909
    .lex "self", self
    .lex "$/", param_1910
.annotate 'line', 689
    find_lex $P1911, "$/"
    find_lex $P1912, "$/"
    unless_null $P1912, vivify_561
    $P1912 = root_new ['parrot';'Hash']
  vivify_561:
    set $P1913, $P1912["arglist"]
    unless_null $P1913, vivify_562
    new $P1913, "Undef"
  vivify_562:
    $P1914 = $P1913."ast"()
    $P1915 = $P1911."!make"($P1914)
.annotate 'line', 688
    .return ($P1915)
  control_1908:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1916, exception, "payload"
    .return ($P1916)
.end


.namespace ["NQP";"Actions"]
.sub "value"  :subid("105_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1920
.annotate 'line', 692
    new $P1919, 'ExceptionHandler'
    set_addr $P1919, control_1918
    $P1919."handle_types"(57)
    push_eh $P1919
    .lex "self", self
    .lex "$/", param_1920
.annotate 'line', 693
    find_lex $P1921, "$/"
    find_lex $P1924, "$/"
    unless_null $P1924, vivify_563
    $P1924 = root_new ['parrot';'Hash']
  vivify_563:
    set $P1925, $P1924["quote"]
    unless_null $P1925, vivify_564
    new $P1925, "Undef"
  vivify_564:
    if $P1925, if_1923
    find_lex $P1929, "$/"
    unless_null $P1929, vivify_565
    $P1929 = root_new ['parrot';'Hash']
  vivify_565:
    set $P1930, $P1929["number"]
    unless_null $P1930, vivify_566
    new $P1930, "Undef"
  vivify_566:
    $P1931 = $P1930."ast"()
    set $P1922, $P1931
    goto if_1923_end
  if_1923:
    find_lex $P1926, "$/"
    unless_null $P1926, vivify_567
    $P1926 = root_new ['parrot';'Hash']
  vivify_567:
    set $P1927, $P1926["quote"]
    unless_null $P1927, vivify_568
    new $P1927, "Undef"
  vivify_568:
    $P1928 = $P1927."ast"()
    set $P1922, $P1928
  if_1923_end:
    $P1932 = $P1921."!make"($P1922)
.annotate 'line', 692
    .return ($P1932)
  control_1918:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1933, exception, "payload"
    .return ($P1933)
.end


.namespace ["NQP";"Actions"]
.sub "number"  :subid("106_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1937
.annotate 'line', 696
    new $P1936, 'ExceptionHandler'
    set_addr $P1936, control_1935
    $P1936."handle_types"(57)
    push_eh $P1936
    .lex "self", self
    .lex "$/", param_1937
.annotate 'line', 697
    new $P1938, "Undef"
    .lex "$value", $P1938
    find_lex $P1941, "$/"
    unless_null $P1941, vivify_569
    $P1941 = root_new ['parrot';'Hash']
  vivify_569:
    set $P1942, $P1941["dec_number"]
    unless_null $P1942, vivify_570
    new $P1942, "Undef"
  vivify_570:
    if $P1942, if_1940
    find_lex $P1946, "$/"
    unless_null $P1946, vivify_571
    $P1946 = root_new ['parrot';'Hash']
  vivify_571:
    set $P1947, $P1946["integer"]
    unless_null $P1947, vivify_572
    new $P1947, "Undef"
  vivify_572:
    $P1948 = $P1947."ast"()
    set $P1939, $P1948
    goto if_1940_end
  if_1940:
    find_lex $P1943, "$/"
    unless_null $P1943, vivify_573
    $P1943 = root_new ['parrot';'Hash']
  vivify_573:
    set $P1944, $P1943["dec_number"]
    unless_null $P1944, vivify_574
    new $P1944, "Undef"
  vivify_574:
    $P1945 = $P1944."ast"()
    set $P1939, $P1945
  if_1940_end:
    store_lex "$value", $P1939
.annotate 'line', 698
    find_lex $P1950, "$/"
    unless_null $P1950, vivify_575
    $P1950 = root_new ['parrot';'Hash']
  vivify_575:
    set $P1951, $P1950["sign"]
    unless_null $P1951, vivify_576
    new $P1951, "Undef"
  vivify_576:
    set $S1952, $P1951
    iseq $I1953, $S1952, "-"
    unless $I1953, if_1949_end
    find_lex $P1954, "$value"
    neg $P1955, $P1954
    store_lex "$value", $P1955
  if_1949_end:
.annotate 'line', 699
    find_lex $P1956, "$/"
    get_hll_global $P1957, ["PAST"], "Val"
    find_lex $P1958, "$value"
    $P1959 = $P1957."new"($P1958 :named("value"))
    $P1960 = $P1956."!make"($P1959)
.annotate 'line', 696
    .return ($P1960)
  control_1935:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1961, exception, "payload"
    .return ($P1961)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<apos>"  :subid("107_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1965
.annotate 'line', 702
    new $P1964, 'ExceptionHandler'
    set_addr $P1964, control_1963
    $P1964."handle_types"(57)
    push_eh $P1964
    .lex "self", self
    .lex "$/", param_1965
    find_lex $P1966, "$/"
    find_lex $P1967, "$/"
    unless_null $P1967, vivify_577
    $P1967 = root_new ['parrot';'Hash']
  vivify_577:
    set $P1968, $P1967["quote_EXPR"]
    unless_null $P1968, vivify_578
    new $P1968, "Undef"
  vivify_578:
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
.sub "quote:sym<dblq>"  :subid("108_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1975
.annotate 'line', 703
    new $P1974, 'ExceptionHandler'
    set_addr $P1974, control_1973
    $P1974."handle_types"(57)
    push_eh $P1974
    .lex "self", self
    .lex "$/", param_1975
    find_lex $P1976, "$/"
    find_lex $P1977, "$/"
    unless_null $P1977, vivify_579
    $P1977 = root_new ['parrot';'Hash']
  vivify_579:
    set $P1978, $P1977["quote_EXPR"]
    unless_null $P1978, vivify_580
    new $P1978, "Undef"
  vivify_580:
    $P1979 = $P1978."ast"()
    $P1980 = $P1976."!make"($P1979)
    .return ($P1980)
  control_1973:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1981, exception, "payload"
    .return ($P1981)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<qq>"  :subid("109_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1985
.annotate 'line', 704
    new $P1984, 'ExceptionHandler'
    set_addr $P1984, control_1983
    $P1984."handle_types"(57)
    push_eh $P1984
    .lex "self", self
    .lex "$/", param_1985
    find_lex $P1986, "$/"
    find_lex $P1987, "$/"
    unless_null $P1987, vivify_581
    $P1987 = root_new ['parrot';'Hash']
  vivify_581:
    set $P1988, $P1987["quote_EXPR"]
    unless_null $P1988, vivify_582
    new $P1988, "Undef"
  vivify_582:
    $P1989 = $P1988."ast"()
    $P1990 = $P1986."!make"($P1989)
    .return ($P1990)
  control_1983:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1991, exception, "payload"
    .return ($P1991)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<q>"  :subid("110_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_1995
.annotate 'line', 705
    new $P1994, 'ExceptionHandler'
    set_addr $P1994, control_1993
    $P1994."handle_types"(57)
    push_eh $P1994
    .lex "self", self
    .lex "$/", param_1995
    find_lex $P1996, "$/"
    find_lex $P1997, "$/"
    unless_null $P1997, vivify_583
    $P1997 = root_new ['parrot';'Hash']
  vivify_583:
    set $P1998, $P1997["quote_EXPR"]
    unless_null $P1998, vivify_584
    new $P1998, "Undef"
  vivify_584:
    $P1999 = $P1998."ast"()
    $P2000 = $P1996."!make"($P1999)
    .return ($P2000)
  control_1993:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2001, exception, "payload"
    .return ($P2001)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q>"  :subid("111_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_2005
.annotate 'line', 706
    new $P2004, 'ExceptionHandler'
    set_addr $P2004, control_2003
    $P2004."handle_types"(57)
    push_eh $P2004
    .lex "self", self
    .lex "$/", param_2005
    find_lex $P2006, "$/"
    find_lex $P2007, "$/"
    unless_null $P2007, vivify_585
    $P2007 = root_new ['parrot';'Hash']
  vivify_585:
    set $P2008, $P2007["quote_EXPR"]
    unless_null $P2008, vivify_586
    new $P2008, "Undef"
  vivify_586:
    $P2009 = $P2008."ast"()
    $P2010 = $P2006."!make"($P2009)
    .return ($P2010)
  control_2003:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2011, exception, "payload"
    .return ($P2011)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q:PIR>"  :subid("112_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_2015
.annotate 'line', 707
    new $P2014, 'ExceptionHandler'
    set_addr $P2014, control_2013
    $P2014."handle_types"(57)
    push_eh $P2014
    .lex "self", self
    .lex "$/", param_2015
.annotate 'line', 708
    find_lex $P2016, "$/"
    get_hll_global $P2017, ["PAST"], "Op"
    find_lex $P2018, "$/"
    unless_null $P2018, vivify_587
    $P2018 = root_new ['parrot';'Hash']
  vivify_587:
    set $P2019, $P2018["quote_EXPR"]
    unless_null $P2019, vivify_588
    new $P2019, "Undef"
  vivify_588:
    $P2020 = $P2019."ast"()
    $P2021 = $P2020."value"()
    find_lex $P2022, "$/"
    $P2023 = $P2017."new"($P2021 :named("inline"), "inline" :named("pasttype"), $P2022 :named("node"))
    $P2024 = $P2016."!make"($P2023)
.annotate 'line', 707
    .return ($P2024)
  control_2013:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2025, exception, "payload"
    .return ($P2025)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym</ />"  :subid("113_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_2029
    .param pmc param_2030 :optional
    .param int has_param_2030 :opt_flag
.annotate 'line', 713
    new $P2028, 'ExceptionHandler'
    set_addr $P2028, control_2027
    $P2028."handle_types"(57)
    push_eh $P2028
    .lex "self", self
    .lex "$/", param_2029
    if has_param_2030, optparam_589
    new $P2031, "Undef"
    set param_2030, $P2031
  optparam_589:
    .lex "$key", param_2030
.annotate 'line', 723
    new $P2032, "Undef"
    .lex "$regex", $P2032
.annotate 'line', 725
    new $P2033, "Undef"
    .lex "$past", $P2033
.annotate 'line', 714
    find_lex $P2035, "$key"
    set $S2036, $P2035
    iseq $I2037, $S2036, "open"
    unless $I2037, if_2034_end
.annotate 'line', 715

            null $P0
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate 'line', 719
    get_global $P2038, "@BLOCK"
    unless_null $P2038, vivify_590
    $P2038 = root_new ['parrot';'ResizablePMCArray']
  vivify_590:
    set $P2039, $P2038[0]
    unless_null $P2039, vivify_591
    new $P2039, "Undef"
  vivify_591:
    $P2039."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate 'line', 720
    get_global $P2040, "@BLOCK"
    unless_null $P2040, vivify_592
    $P2040 = root_new ['parrot';'ResizablePMCArray']
  vivify_592:
    set $P2041, $P2040[0]
    unless_null $P2041, vivify_593
    new $P2041, "Undef"
  vivify_593:
    $P2041."symbol"("$/", "lexical" :named("scope"))
.annotate 'line', 721
    new $P2042, "Exception"
    set $P2042['type'], 57
    new $P2043, "Integer"
    assign $P2043, 0
    setattribute $P2042, 'payload', $P2043
    throw $P2042
  if_2034_end:
.annotate 'line', 724
    get_hll_global $P2044, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P2045, "$/"
    unless_null $P2045, vivify_594
    $P2045 = root_new ['parrot';'Hash']
  vivify_594:
    set $P2046, $P2045["p6regex"]
    unless_null $P2046, vivify_595
    new $P2046, "Undef"
  vivify_595:
    $P2047 = $P2046."ast"()
    get_global $P2048, "@BLOCK"
    $P2049 = $P2048."shift"()
    $P2050 = $P2044($P2047, $P2049)
    store_lex "$regex", $P2050
.annotate 'line', 726
    get_hll_global $P2051, ["PAST"], "Op"
.annotate 'line', 728
    get_hll_global $P2052, ["PAST"], "Var"
    new $P2053, "ResizablePMCArray"
    push $P2053, "Regex"
    $P2054 = $P2052."new"("Regex" :named("name"), $P2053 :named("namespace"), "package" :named("scope"))
    find_lex $P2055, "$regex"
    $P2056 = $P2051."new"($P2054, $P2055, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate 'line', 726
    store_lex "$past", $P2056
.annotate 'line', 732
    find_lex $P2057, "$regex"
    find_lex $P2058, "$past"
    unless_null $P2058, vivify_596
    $P2058 = root_new ['parrot';'Hash']
    store_lex "$past", $P2058
  vivify_596:
    set $P2058["sink"], $P2057
.annotate 'line', 733
    find_lex $P2059, "$/"
    find_lex $P2060, "$past"
    $P2061 = $P2059."!make"($P2060)
.annotate 'line', 713
    .return ($P2061)
  control_2027:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2062, exception, "payload"
    .return ($P2062)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<$>"  :subid("114_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_2066
.annotate 'line', 736
    new $P2065, 'ExceptionHandler'
    set_addr $P2065, control_2064
    $P2065."handle_types"(57)
    push_eh $P2065
    .lex "self", self
    .lex "$/", param_2066
    find_lex $P2067, "$/"
    find_lex $P2068, "$/"
    unless_null $P2068, vivify_597
    $P2068 = root_new ['parrot';'Hash']
  vivify_597:
    set $P2069, $P2068["variable"]
    unless_null $P2069, vivify_598
    new $P2069, "Undef"
  vivify_598:
    $P2070 = $P2069."ast"()
    $P2071 = $P2067."!make"($P2070)
    .return ($P2071)
  control_2064:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2072, exception, "payload"
    .return ($P2072)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<{ }>"  :subid("115_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_2076
.annotate 'line', 737
    new $P2075, 'ExceptionHandler'
    set_addr $P2075, control_2074
    $P2075."handle_types"(57)
    push_eh $P2075
    .lex "self", self
    .lex "$/", param_2076
.annotate 'line', 738
    find_lex $P2077, "$/"
    get_hll_global $P2078, ["PAST"], "Op"
.annotate 'line', 739
    find_lex $P2079, "$/"
    unless_null $P2079, vivify_599
    $P2079 = root_new ['parrot';'Hash']
  vivify_599:
    set $P2080, $P2079["block"]
    unless_null $P2080, vivify_600
    new $P2080, "Undef"
  vivify_600:
    $P2081 = $P2080."ast"()
    $P2082 = "block_immediate"($P2081)
    find_lex $P2083, "$/"
    $P2084 = $P2078."new"($P2082, "set S*" :named("pirop"), $P2083 :named("node"))
.annotate 'line', 738
    $P2085 = $P2077."!make"($P2084)
.annotate 'line', 737
    .return ($P2085)
  control_2074:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2086, exception, "payload"
    .return ($P2086)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<esc>"  :subid("116_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_2090
.annotate 'line', 742
    new $P2089, 'ExceptionHandler'
    set_addr $P2089, control_2088
    $P2089."handle_types"(57)
    push_eh $P2089
    .lex "self", self
    .lex "$/", param_2090
    find_lex $P2091, "$/"
    $P2092 = $P2091."!make"("\e")
    .return ($P2092)
  control_2088:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2093, exception, "payload"
    .return ($P2093)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<.>"  :subid("117_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_2097
.annotate 'line', 746
    new $P2096, 'ExceptionHandler'
    set_addr $P2096, control_2095
    $P2096."handle_types"(57)
    push_eh $P2096
    .lex "self", self
    .lex "$/", param_2097
    find_lex $P2098, "$/"
    find_lex $P2099, "$/"
    unless_null $P2099, vivify_601
    $P2099 = root_new ['parrot';'Hash']
  vivify_601:
    set $P2100, $P2099["dotty"]
    unless_null $P2100, vivify_602
    new $P2100, "Undef"
  vivify_602:
    $P2101 = $P2100."ast"()
    $P2102 = $P2098."!make"($P2101)
    .return ($P2102)
  control_2095:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2103, exception, "payload"
    .return ($P2103)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<++>"  :subid("118_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_2107
.annotate 'line', 748
    new $P2106, 'ExceptionHandler'
    set_addr $P2106, control_2105
    $P2106."handle_types"(57)
    push_eh $P2106
    .lex "self", self
    .lex "$/", param_2107
.annotate 'line', 749
    find_lex $P2108, "$/"
    get_hll_global $P2109, ["PAST"], "Op"
.annotate 'line', 750
    new $P2110, "ResizablePMCArray"
    push $P2110, "    clone %r, %0"
    push $P2110, "    inc %0"
    $P2111 = $P2109."new"("postfix:<++>" :named("name"), $P2110 :named("inline"), "inline" :named("pasttype"))
.annotate 'line', 749
    $P2112 = $P2108."!make"($P2111)
.annotate 'line', 748
    .return ($P2112)
  control_2105:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2113, exception, "payload"
    .return ($P2113)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<-->"  :subid("119_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_2117
.annotate 'line', 754
    new $P2116, 'ExceptionHandler'
    set_addr $P2116, control_2115
    $P2116."handle_types"(57)
    push_eh $P2116
    .lex "self", self
    .lex "$/", param_2117
.annotate 'line', 755
    find_lex $P2118, "$/"
    get_hll_global $P2119, ["PAST"], "Op"
.annotate 'line', 756
    new $P2120, "ResizablePMCArray"
    push $P2120, "    clone %r, %0"
    push $P2120, "    dec %0"
    $P2121 = $P2119."new"("postfix:<-->" :named("name"), $P2120 :named("inline"), "inline" :named("pasttype"))
.annotate 'line', 755
    $P2122 = $P2118."!make"($P2121)
.annotate 'line', 754
    .return ($P2122)
  control_2115:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2123, exception, "payload"
    .return ($P2123)
.end


.namespace ["NQP";"Actions"]
.sub "prefix:sym<make>"  :subid("120_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_2127
.annotate 'line', 760
    new $P2126, 'ExceptionHandler'
    set_addr $P2126, control_2125
    $P2126."handle_types"(57)
    push_eh $P2126
    .lex "self", self
    .lex "$/", param_2127
.annotate 'line', 761
    find_lex $P2128, "$/"
    get_hll_global $P2129, ["PAST"], "Op"
.annotate 'line', 762
    get_hll_global $P2130, ["PAST"], "Var"
    $P2131 = $P2130."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P2132, "$/"
    $P2133 = $P2129."new"($P2131, "callmethod" :named("pasttype"), "!make" :named("name"), $P2132 :named("node"))
.annotate 'line', 761
    $P2134 = $P2128."!make"($P2133)
.annotate 'line', 760
    .return ($P2134)
  control_2125:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2135, exception, "payload"
    .return ($P2135)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<next>"  :subid("121_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_2140
.annotate 'line', 782
    new $P2139, 'ExceptionHandler'
    set_addr $P2139, control_2138
    $P2139."handle_types"(57)
    push_eh $P2139
    .lex "self", self
    .lex "$/", param_2140
    find_lex $P2141, "$/"
    $P2142 = "control"($P2141, ".CONTROL_LOOP_NEXT")
    .return ($P2142)
  control_2138:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2143, exception, "payload"
    .return ($P2143)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<last>"  :subid("122_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_2147
.annotate 'line', 783
    new $P2146, 'ExceptionHandler'
    set_addr $P2146, control_2145
    $P2146."handle_types"(57)
    push_eh $P2146
    .lex "self", self
    .lex "$/", param_2147
    find_lex $P2148, "$/"
    $P2149 = "control"($P2148, ".CONTROL_LOOP_LAST")
    .return ($P2149)
  control_2145:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2150, exception, "payload"
    .return ($P2150)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<redo>"  :subid("123_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_2154
.annotate 'line', 784
    new $P2153, 'ExceptionHandler'
    set_addr $P2153, control_2152
    $P2153."handle_types"(57)
    push_eh $P2153
    .lex "self", self
    .lex "$/", param_2154
    find_lex $P2155, "$/"
    $P2156 = "control"($P2155, ".CONTROL_LOOP_REDO")
    .return ($P2156)
  control_2152:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2157, exception, "payload"
    .return ($P2157)
.end


.namespace ["NQP";"Actions"]
.sub "infix:sym<~~>"  :subid("124_1273884035.78954") :method :outer("11_1273884035.78954")
    .param pmc param_2161
.annotate 'line', 786
    new $P2160, 'ExceptionHandler'
    set_addr $P2160, control_2159
    $P2160."handle_types"(57)
    push_eh $P2160
    .lex "self", self
    .lex "$/", param_2161
.annotate 'line', 787
    find_lex $P2162, "$/"
    get_hll_global $P2163, ["PAST"], "Op"
    find_lex $P2164, "$/"
    $P2165 = $P2163."new"("callmethod" :named("pasttype"), "ACCEPTS" :named("name"), $P2164 :named("node"))
    $P2166 = $P2162."!make"($P2165)
.annotate 'line', 786
    .return ($P2166)
  control_2159:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2167, exception, "payload"
    .return ($P2167)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block2168"  :subid("125_1273884035.78954") :outer("11_1273884035.78954")
.annotate 'line', 791
    .const 'Sub' $P2204 = "129_1273884035.78954" 
    capture_lex $P2204
    .const 'Sub' $P2194 = "128_1273884035.78954" 
    capture_lex $P2194
    .const 'Sub' $P2184 = "127_1273884035.78954" 
    capture_lex $P2184
    .const 'Sub' $P2170 = "126_1273884035.78954" 
    capture_lex $P2170
.annotate 'line', 802
    .const 'Sub' $P2204 = "129_1273884035.78954" 
    newclosure $P2231, $P2204
.annotate 'line', 791
    .return ($P2231)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<:my>"  :subid("126_1273884035.78954") :method :outer("125_1273884035.78954")
    .param pmc param_2173
.annotate 'line', 793
    new $P2172, 'ExceptionHandler'
    set_addr $P2172, control_2171
    $P2172."handle_types"(57)
    push_eh $P2172
    .lex "self", self
    .lex "$/", param_2173
.annotate 'line', 794
    new $P2174, "Undef"
    .lex "$past", $P2174
    find_lex $P2175, "$/"
    unless_null $P2175, vivify_603
    $P2175 = root_new ['parrot';'Hash']
  vivify_603:
    set $P2176, $P2175["statement"]
    unless_null $P2176, vivify_604
    new $P2176, "Undef"
  vivify_604:
    $P2177 = $P2176."ast"()
    store_lex "$past", $P2177
.annotate 'line', 795
    find_lex $P2178, "$/"
    get_hll_global $P2179, ["PAST"], "Regex"
    find_lex $P2180, "$past"
    $P2181 = $P2179."new"($P2180, "pastnode" :named("pasttype"))
    $P2182 = $P2178."!make"($P2181)
.annotate 'line', 793
    .return ($P2182)
  control_2171:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2183, exception, "payload"
    .return ($P2183)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<{ }>"  :subid("127_1273884035.78954") :method :outer("125_1273884035.78954")
    .param pmc param_2187
.annotate 'line', 798
    new $P2186, 'ExceptionHandler'
    set_addr $P2186, control_2185
    $P2186."handle_types"(57)
    push_eh $P2186
    .lex "self", self
    .lex "$/", param_2187
    find_lex $P2188, "$/"
    find_lex $P2189, "$/"
    unless_null $P2189, vivify_605
    $P2189 = root_new ['parrot';'Hash']
  vivify_605:
    set $P2190, $P2189["codeblock"]
    unless_null $P2190, vivify_606
    new $P2190, "Undef"
  vivify_606:
    $P2191 = $P2190."ast"()
    $P2192 = $P2188."!make"($P2191)
    .return ($P2192)
  control_2185:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2193, exception, "payload"
    .return ($P2193)
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<{ }>"  :subid("128_1273884035.78954") :method :outer("125_1273884035.78954")
    .param pmc param_2197
.annotate 'line', 800
    new $P2196, 'ExceptionHandler'
    set_addr $P2196, control_2195
    $P2196."handle_types"(57)
    push_eh $P2196
    .lex "self", self
    .lex "$/", param_2197
    find_lex $P2198, "$/"
    find_lex $P2199, "$/"
    unless_null $P2199, vivify_607
    $P2199 = root_new ['parrot';'Hash']
  vivify_607:
    set $P2200, $P2199["codeblock"]
    unless_null $P2200, vivify_608
    new $P2200, "Undef"
  vivify_608:
    $P2201 = $P2200."ast"()
    $P2202 = $P2198."!make"($P2201)
    .return ($P2202)
  control_2195:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2203, exception, "payload"
    .return ($P2203)
.end


.namespace ["NQP";"RegexActions"]
.sub "codeblock"  :subid("129_1273884035.78954") :method :outer("125_1273884035.78954")
    .param pmc param_2207
.annotate 'line', 802
    new $P2206, 'ExceptionHandler'
    set_addr $P2206, control_2205
    $P2206."handle_types"(57)
    push_eh $P2206
    .lex "self", self
    .lex "$/", param_2207
.annotate 'line', 803
    new $P2208, "Undef"
    .lex "$block", $P2208
.annotate 'line', 805
    new $P2209, "Undef"
    .lex "$past", $P2209
.annotate 'line', 803
    find_lex $P2210, "$/"
    unless_null $P2210, vivify_609
    $P2210 = root_new ['parrot';'Hash']
  vivify_609:
    set $P2211, $P2210["block"]
    unless_null $P2211, vivify_610
    new $P2211, "Undef"
  vivify_610:
    $P2212 = $P2211."ast"()
    store_lex "$block", $P2212
.annotate 'line', 804
    find_lex $P2213, "$block"
    $P2213."blocktype"("immediate")
.annotate 'line', 806
    get_hll_global $P2214, ["PAST"], "Regex"
.annotate 'line', 807
    get_hll_global $P2215, ["PAST"], "Stmts"
.annotate 'line', 808
    get_hll_global $P2216, ["PAST"], "Op"
.annotate 'line', 809
    get_hll_global $P2217, ["PAST"], "Var"
    $P2218 = $P2217."new"("$/" :named("name"))
.annotate 'line', 810
    get_hll_global $P2219, ["PAST"], "Op"
.annotate 'line', 811
    get_hll_global $P2220, ["PAST"], "Var"
    $P2221 = $P2220."new"(unicode:"$\x{a2}" :named("name"))
    $P2222 = $P2219."new"($P2221, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 810
    $P2223 = $P2216."new"($P2218, $P2222, "bind" :named("pasttype"))
.annotate 'line', 808
    find_lex $P2224, "$block"
    $P2225 = $P2215."new"($P2223, $P2224)
.annotate 'line', 807
    $P2226 = $P2214."new"($P2225, "pastnode" :named("pasttype"))
.annotate 'line', 806
    store_lex "$past", $P2226
.annotate 'line', 821
    find_lex $P2227, "$/"
    find_lex $P2228, "$past"
    $P2229 = $P2227."!make"($P2228)
.annotate 'line', 802
    .return ($P2229)
  control_2205:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2230, exception, "payload"
    .return ($P2230)
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
    $P0 = getattribute nqpproto, '@cmdoptions'
    push $P0, 'parsetrace'
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
