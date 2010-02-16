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
.sub "_block11"  :anon :subid("10_1266334190.64822")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
    $P1291 = $P14()
.annotate "line", 1
    .return ($P1291)
.end


.namespace []
.sub "" :load :init :subid("post331") :outer("10_1266334190.64822")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1266334190.64822" 
    .local pmc block
    set block, $P12
    $P1292 = get_root_global ["parrot"], "P6metaclass"
    $P1292."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1266334190.64822") :outer("10_1266334190.64822")
.annotate "line", 4
    get_hll_global $P1235, ["NQP";"Regex"], "_block1234" 
    capture_lex $P1235
    .const 'Sub' $P1221 = "317_1266334190.64822" 
    capture_lex $P1221
    .const 'Sub' $P1215 = "315_1266334190.64822" 
    capture_lex $P1215
    .const 'Sub' $P1209 = "313_1266334190.64822" 
    capture_lex $P1209
    .const 'Sub' $P1202 = "311_1266334190.64822" 
    capture_lex $P1202
    .const 'Sub' $P1195 = "309_1266334190.64822" 
    capture_lex $P1195
    .const 'Sub' $P1188 = "307_1266334190.64822" 
    capture_lex $P1188
    .const 'Sub' $P1181 = "305_1266334190.64822" 
    capture_lex $P1181
    .const 'Sub' $P1175 = "303_1266334190.64822" 
    capture_lex $P1175
    .const 'Sub' $P1168 = "301_1266334190.64822" 
    capture_lex $P1168
    .const 'Sub' $P1161 = "299_1266334190.64822" 
    capture_lex $P1161
    .const 'Sub' $P1154 = "297_1266334190.64822" 
    capture_lex $P1154
    .const 'Sub' $P1147 = "295_1266334190.64822" 
    capture_lex $P1147
    .const 'Sub' $P1140 = "293_1266334190.64822" 
    capture_lex $P1140
    .const 'Sub' $P1133 = "291_1266334190.64822" 
    capture_lex $P1133
    .const 'Sub' $P1126 = "289_1266334190.64822" 
    capture_lex $P1126
    .const 'Sub' $P1119 = "287_1266334190.64822" 
    capture_lex $P1119
    .const 'Sub' $P1112 = "285_1266334190.64822" 
    capture_lex $P1112
    .const 'Sub' $P1105 = "283_1266334190.64822" 
    capture_lex $P1105
    .const 'Sub' $P1098 = "281_1266334190.64822" 
    capture_lex $P1098
    .const 'Sub' $P1091 = "279_1266334190.64822" 
    capture_lex $P1091
    .const 'Sub' $P1084 = "277_1266334190.64822" 
    capture_lex $P1084
    .const 'Sub' $P1077 = "275_1266334190.64822" 
    capture_lex $P1077
    .const 'Sub' $P1070 = "273_1266334190.64822" 
    capture_lex $P1070
    .const 'Sub' $P1063 = "271_1266334190.64822" 
    capture_lex $P1063
    .const 'Sub' $P1056 = "269_1266334190.64822" 
    capture_lex $P1056
    .const 'Sub' $P1049 = "267_1266334190.64822" 
    capture_lex $P1049
    .const 'Sub' $P1042 = "265_1266334190.64822" 
    capture_lex $P1042
    .const 'Sub' $P1035 = "263_1266334190.64822" 
    capture_lex $P1035
    .const 'Sub' $P1028 = "261_1266334190.64822" 
    capture_lex $P1028
    .const 'Sub' $P1021 = "259_1266334190.64822" 
    capture_lex $P1021
    .const 'Sub' $P1014 = "257_1266334190.64822" 
    capture_lex $P1014
    .const 'Sub' $P1007 = "255_1266334190.64822" 
    capture_lex $P1007
    .const 'Sub' $P1000 = "253_1266334190.64822" 
    capture_lex $P1000
    .const 'Sub' $P993 = "251_1266334190.64822" 
    capture_lex $P993
    .const 'Sub' $P987 = "249_1266334190.64822" 
    capture_lex $P987
    .const 'Sub' $P980 = "247_1266334190.64822" 
    capture_lex $P980
    .const 'Sub' $P973 = "245_1266334190.64822" 
    capture_lex $P973
    .const 'Sub' $P966 = "243_1266334190.64822" 
    capture_lex $P966
    .const 'Sub' $P959 = "241_1266334190.64822" 
    capture_lex $P959
    .const 'Sub' $P952 = "239_1266334190.64822" 
    capture_lex $P952
    .const 'Sub' $P945 = "237_1266334190.64822" 
    capture_lex $P945
    .const 'Sub' $P938 = "235_1266334190.64822" 
    capture_lex $P938
    .const 'Sub' $P932 = "233_1266334190.64822" 
    capture_lex $P932
    .const 'Sub' $P926 = "231_1266334190.64822" 
    capture_lex $P926
    .const 'Sub' $P921 = "229_1266334190.64822" 
    capture_lex $P921
    .const 'Sub' $P915 = "227_1266334190.64822" 
    capture_lex $P915
    .const 'Sub' $P909 = "225_1266334190.64822" 
    capture_lex $P909
    .const 'Sub' $P904 = "223_1266334190.64822" 
    capture_lex $P904
    .const 'Sub' $P899 = "221_1266334190.64822" 
    capture_lex $P899
    .const 'Sub' $P892 = "219_1266334190.64822" 
    capture_lex $P892
    .const 'Sub' $P884 = "217_1266334190.64822" 
    capture_lex $P884
    .const 'Sub' $P879 = "215_1266334190.64822" 
    capture_lex $P879
    .const 'Sub' $P874 = "213_1266334190.64822" 
    capture_lex $P874
    .const 'Sub' $P869 = "211_1266334190.64822" 
    capture_lex $P869
    .const 'Sub' $P861 = "209_1266334190.64822" 
    capture_lex $P861
    .const 'Sub' $P853 = "207_1266334190.64822" 
    capture_lex $P853
    .const 'Sub' $P848 = "205_1266334190.64822" 
    capture_lex $P848
    .const 'Sub' $P843 = "203_1266334190.64822" 
    capture_lex $P843
    .const 'Sub' $P837 = "201_1266334190.64822" 
    capture_lex $P837
    .const 'Sub' $P831 = "199_1266334190.64822" 
    capture_lex $P831
    .const 'Sub' $P825 = "197_1266334190.64822" 
    capture_lex $P825
    .const 'Sub' $P819 = "195_1266334190.64822" 
    capture_lex $P819
    .const 'Sub' $P813 = "193_1266334190.64822" 
    capture_lex $P813
    .const 'Sub' $P808 = "191_1266334190.64822" 
    capture_lex $P808
    .const 'Sub' $P803 = "189_1266334190.64822" 
    capture_lex $P803
    .const 'Sub' $P790 = "185_1266334190.64822" 
    capture_lex $P790
    .const 'Sub' $P782 = "183_1266334190.64822" 
    capture_lex $P782
    .const 'Sub' $P776 = "181_1266334190.64822" 
    capture_lex $P776
    .const 'Sub' $P769 = "179_1266334190.64822" 
    capture_lex $P769
    .const 'Sub' $P763 = "177_1266334190.64822" 
    capture_lex $P763
    .const 'Sub' $P755 = "175_1266334190.64822" 
    capture_lex $P755
    .const 'Sub' $P747 = "173_1266334190.64822" 
    capture_lex $P747
    .const 'Sub' $P741 = "171_1266334190.64822" 
    capture_lex $P741
    .const 'Sub' $P735 = "169_1266334190.64822" 
    capture_lex $P735
    .const 'Sub' $P720 = "165_1266334190.64822" 
    capture_lex $P720
    .const 'Sub' $P688 = "163_1266334190.64822" 
    capture_lex $P688
    .const 'Sub' $P680 = "161_1266334190.64822" 
    capture_lex $P680
    .const 'Sub' $P674 = "159_1266334190.64822" 
    capture_lex $P674
    .const 'Sub' $P664 = "157_1266334190.64822" 
    capture_lex $P664
    .const 'Sub' $P649 = "155_1266334190.64822" 
    capture_lex $P649
    .const 'Sub' $P640 = "153_1266334190.64822" 
    capture_lex $P640
    .const 'Sub' $P621 = "151_1266334190.64822" 
    capture_lex $P621
    .const 'Sub' $P597 = "149_1266334190.64822" 
    capture_lex $P597
    .const 'Sub' $P590 = "147_1266334190.64822" 
    capture_lex $P590
    .const 'Sub' $P583 = "145_1266334190.64822" 
    capture_lex $P583
    .const 'Sub' $P573 = "141_1266334190.64822" 
    capture_lex $P573
    .const 'Sub' $P562 = "139_1266334190.64822" 
    capture_lex $P562
    .const 'Sub' $P555 = "137_1266334190.64822" 
    capture_lex $P555
    .const 'Sub' $P548 = "135_1266334190.64822" 
    capture_lex $P548
    .const 'Sub' $P541 = "133_1266334190.64822" 
    capture_lex $P541
    .const 'Sub' $P514 = "129_1266334190.64822" 
    capture_lex $P514
    .const 'Sub' $P505 = "127_1266334190.64822" 
    capture_lex $P505
    .const 'Sub' $P498 = "125_1266334190.64822" 
    capture_lex $P498
    .const 'Sub' $P489 = "121_1266334190.64822" 
    capture_lex $P489
    .const 'Sub' $P484 = "119_1266334190.64822" 
    capture_lex $P484
    .const 'Sub' $P472 = "117_1266334190.64822" 
    capture_lex $P472
    .const 'Sub' $P460 = "115_1266334190.64822" 
    capture_lex $P460
    .const 'Sub' $P452 = "113_1266334190.64822" 
    capture_lex $P452
    .const 'Sub' $P447 = "111_1266334190.64822" 
    capture_lex $P447
    .const 'Sub' $P441 = "109_1266334190.64822" 
    capture_lex $P441
    .const 'Sub' $P435 = "107_1266334190.64822" 
    capture_lex $P435
    .const 'Sub' $P429 = "105_1266334190.64822" 
    capture_lex $P429
    .const 'Sub' $P423 = "103_1266334190.64822" 
    capture_lex $P423
    .const 'Sub' $P417 = "101_1266334190.64822" 
    capture_lex $P417
    .const 'Sub' $P411 = "99_1266334190.64822" 
    capture_lex $P411
    .const 'Sub' $P405 = "97_1266334190.64822" 
    capture_lex $P405
    .const 'Sub' $P399 = "95_1266334190.64822" 
    capture_lex $P399
    .const 'Sub' $P391 = "93_1266334190.64822" 
    capture_lex $P391
    .const 'Sub' $P383 = "91_1266334190.64822" 
    capture_lex $P383
    .const 'Sub' $P371 = "87_1266334190.64822" 
    capture_lex $P371
    .const 'Sub' $P363 = "85_1266334190.64822" 
    capture_lex $P363
    .const 'Sub' $P353 = "81_1266334190.64822" 
    capture_lex $P353
    .const 'Sub' $P346 = "79_1266334190.64822" 
    capture_lex $P346
    .const 'Sub' $P339 = "77_1266334190.64822" 
    capture_lex $P339
    .const 'Sub' $P327 = "73_1266334190.64822" 
    capture_lex $P327
    .const 'Sub' $P319 = "71_1266334190.64822" 
    capture_lex $P319
    .const 'Sub' $P311 = "69_1266334190.64822" 
    capture_lex $P311
    .const 'Sub' $P291 = "67_1266334190.64822" 
    capture_lex $P291
    .const 'Sub' $P282 = "65_1266334190.64822" 
    capture_lex $P282
    .const 'Sub' $P264 = "62_1266334190.64822" 
    capture_lex $P264
    .const 'Sub' $P244 = "60_1266334190.64822" 
    capture_lex $P244
    .const 'Sub' $P235 = "56_1266334190.64822" 
    capture_lex $P235
    .const 'Sub' $P230 = "54_1266334190.64822" 
    capture_lex $P230
    .const 'Sub' $P221 = "50_1266334190.64822" 
    capture_lex $P221
    .const 'Sub' $P216 = "48_1266334190.64822" 
    capture_lex $P216
    .const 'Sub' $P208 = "46_1266334190.64822" 
    capture_lex $P208
    .const 'Sub' $P201 = "44_1266334190.64822" 
    capture_lex $P201
    .const 'Sub' $P195 = "42_1266334190.64822" 
    capture_lex $P195
    .const 'Sub' $P187 = "40_1266334190.64822" 
    capture_lex $P187
    .const 'Sub' $P181 = "38_1266334190.64822" 
    capture_lex $P181
    .const 'Sub' $P175 = "36_1266334190.64822" 
    capture_lex $P175
    .const 'Sub' $P159 = "33_1266334190.64822" 
    capture_lex $P159
    .const 'Sub' $P146 = "31_1266334190.64822" 
    capture_lex $P146
    .const 'Sub' $P139 = "29_1266334190.64822" 
    capture_lex $P139
    .const 'Sub' $P96 = "26_1266334190.64822" 
    capture_lex $P96
    .const 'Sub' $P78 = "23_1266334190.64822" 
    capture_lex $P78
    .const 'Sub' $P68 = "21_1266334190.64822" 
    capture_lex $P68
    .const 'Sub' $P54 = "19_1266334190.64822" 
    capture_lex $P54
    .const 'Sub' $P46 = "17_1266334190.64822" 
    capture_lex $P46
    .const 'Sub' $P39 = "15_1266334190.64822" 
    capture_lex $P39
    .const 'Sub' $P33 = "13_1266334190.64822" 
    capture_lex $P33
    .const 'Sub' $P15 = "12_1266334190.64822" 
    capture_lex $P15
.annotate "line", 527
    get_hll_global $P1235, ["NQP";"Regex"], "_block1234" 
    capture_lex $P1235
    $P1274 = $P1235()
.annotate "line", 4
    .return ($P1274)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post332") :outer("11_1266334190.64822")
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 414
    get_hll_global $P1275, ["NQP"], "Grammar"
    $P1275."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate "line", 415
    get_hll_global $P1276, ["NQP"], "Grammar"
    $P1276."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate "line", 416
    get_hll_global $P1277, ["NQP"], "Grammar"
    $P1277."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate "line", 417
    get_hll_global $P1278, ["NQP"], "Grammar"
    $P1278."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate "line", 418
    get_hll_global $P1279, ["NQP"], "Grammar"
    $P1279."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate "line", 419
    get_hll_global $P1280, ["NQP"], "Grammar"
    $P1280."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate "line", 420
    get_hll_global $P1281, ["NQP"], "Grammar"
    $P1281."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate "line", 421
    get_hll_global $P1282, ["NQP"], "Grammar"
    $P1282."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate "line", 422
    get_hll_global $P1283, ["NQP"], "Grammar"
    $P1283."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate "line", 423
    get_hll_global $P1284, ["NQP"], "Grammar"
    $P1284."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate "line", 424
    get_hll_global $P1285, ["NQP"], "Grammar"
    $P1285."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate "line", 425
    get_hll_global $P1286, ["NQP"], "Grammar"
    $P1286."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate "line", 426
    get_hll_global $P1287, ["NQP"], "Grammar"
    $P1287."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate "line", 427
    get_hll_global $P1288, ["NQP"], "Grammar"
    $P1288."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate "line", 428
    get_hll_global $P1289, ["NQP"], "Grammar"
    $P1289."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate "line", 413
    $P1290 = get_root_global ["parrot"], "P6metaclass"
    $P1290."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "TOP"  :subid("12_1266334190.64822") :method :outer("11_1266334190.64822")
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
.sub "identifier"  :subid("13_1266334190.64822") :method :outer("11_1266334190.64822")
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
.sub "!PREFIX__identifier"  :subid("14_1266334190.64822") :method
.annotate "line", 4
    $P36 = self."!PREFIX__!subrule"("ident", "")
    new $P37, "ResizablePMCArray"
    push $P37, $P36
    .return ($P37)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1266334190.64822") :method :outer("11_1266334190.64822")
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
.sub "!PREFIX__name"  :subid("16_1266334190.64822") :method
.annotate "line", 4
    new $P42, "ResizablePMCArray"
    push $P42, ""
    .return ($P42)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1266334190.64822") :method :outer("11_1266334190.64822")
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
.sub "!PREFIX__deflongname"  :subid("18_1266334190.64822") :method
.annotate "line", 4
    $P49 = self."!PREFIX__!subrule"("identifier", "")
    new $P50, "ResizablePMCArray"
    push $P50, $P49
    .return ($P50)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1266334190.64822") :method :outer("11_1266334190.64822")
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
.sub "!PREFIX__ENDSTMT"  :subid("20_1266334190.64822") :method
.annotate "line", 4
    new $P57, "ResizablePMCArray"
    push $P57, ""
    .return ($P57)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1266334190.64822") :method :outer("11_1266334190.64822")
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
.sub "!PREFIX__ws"  :subid("22_1266334190.64822") :method
.annotate "line", 4
    new $P71, "ResizablePMCArray"
    push $P71, ""
    push $P71, ""
    .return ($P71)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .const 'Sub' $P86 = "25_1266334190.64822" 
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
    .const 'Sub' $P86 = "25_1266334190.64822" 
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
.sub "!PREFIX__unv"  :subid("24_1266334190.64822") :method
.annotate "line", 4
    new $P81, "ResizablePMCArray"
    push $P81, ""
    push $P81, ""
    push $P81, ""
    .return ($P81)
.end


.namespace ["NQP";"Grammar"]
.sub "_block85"  :anon :subid("25_1266334190.64822") :method :outer("23_1266334190.64822")
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
.sub "pod_comment"  :subid("26_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .const 'Sub' $P131 = "28_1266334190.64822" 
    capture_lex $P131
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
.annotate "line", 68
  # rx rxquantr129 ** 0..1
    set_addr $I137, rxquantr129_done
    rx97_cur."!mark_push"(0, rx97_pos, $I137)
  rxquantr129_loop:
.annotate "line", 67
  # rx subrule "before" subtype=zerowidth negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    .const 'Sub' $P131 = "28_1266334190.64822" 
    capture_lex $P131
    $P10 = rx97_cur."before"($P131)
    unless $P10, rx97_fail
.annotate "line", 68
  # rx subrule "panic" subtype=method negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    $P10 = rx97_cur."panic"("Obsolete pod format, please use =begin/=end instead")
    unless $P10, rx97_fail
    rx97_pos = $P10."pos"()
    (rx97_rep) = rx97_cur."!mark_commit"($I137)
  rxquantr129_done:
  alt138_0:
.annotate "line", 69
    set_addr $I10, alt138_1
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
  # rx subrule "alpha" subtype=capture negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    $P10 = rx97_cur."alpha"()
    unless $P10, rx97_fail
    rx97_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("alpha")
    rx97_pos = $P10."pos"()
    goto alt138_end
  alt138_1:
    set_addr $I10, alt138_2
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
  # rx charclass s
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    is_cclass $I11, 32, rx97_tgt, $I10
    unless $I11, rx97_fail
    inc rx97_pos
    goto alt138_end
  alt138_2:
  # rx subrule "panic" subtype=method negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    $P10 = rx97_cur."panic"("Illegal pod directive")
    unless $P10, rx97_fail
    rx97_pos = $P10."pos"()
  alt138_end:
.annotate "line", 70
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
.sub "!PREFIX__pod_comment"  :subid("27_1266334190.64822") :method
.annotate "line", 4
    new $P99, "ResizablePMCArray"
    push $P99, ""
    .return ($P99)
.end


.namespace ["NQP";"Grammar"]
.sub "_block130"  :anon :subid("28_1266334190.64822") :method :outer("26_1266334190.64822")
.annotate "line", 67
    .local string rx132_tgt
    .local int rx132_pos
    .local int rx132_off
    .local int rx132_eos
    .local int rx132_rep
    .local pmc rx132_cur
    (rx132_cur, rx132_pos, rx132_tgt) = self."!cursor_start"()
    rx132_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx132_cur
    .local pmc match
    .lex "$/", match
    length rx132_eos, rx132_tgt
    set rx132_off, 0
    lt rx132_pos, 2, rx132_start
    sub rx132_off, rx132_pos, 1
    substr rx132_tgt, rx132_tgt, rx132_off
  rx132_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan133_done
    goto rxscan133_scan
  rxscan133_loop:
    ($P10) = rx132_cur."from"()
    inc $P10
    set rx132_pos, $P10
    ge rx132_pos, rx132_eos, rxscan133_done
  rxscan133_scan:
    set_addr $I10, rxscan133_loop
    rx132_cur."!mark_push"(0, rx132_pos, $I10)
  rxscan133_done:
  # rx rxquantf134 ** 0..*
    set_addr $I10, rxquantf134_loop
    rx132_cur."!mark_push"(0, rx132_pos, $I10)
    goto rxquantf134_done
  rxquantf134_loop:
  # rx charclass .
    ge rx132_pos, rx132_eos, rx132_fail
    inc rx132_pos
    set_addr $I10, rxquantf134_loop
    rx132_cur."!mark_push"($I135, rx132_pos, $I10)
  rxquantf134_done:
  # rxanchor bol
    eq rx132_pos, 0, rxanchor136_done
    ge rx132_pos, rx132_eos, rx132_fail
    sub $I10, rx132_pos, rx132_off
    dec $I10
    is_cclass $I11, 4096, rx132_tgt, $I10
    unless $I11, rx132_fail
  rxanchor136_done:
  # rx literal  "=cut"
    add $I11, rx132_pos, 4
    gt $I11, rx132_eos, rx132_fail
    sub $I11, rx132_pos, rx132_off
    substr $S10, rx132_tgt, $I11, 4
    ne $S10, "=cut", rx132_fail
    add rx132_pos, 4
  # rxanchor rwb
    le rx132_pos, 0, rx132_fail
    sub $I10, rx132_pos, rx132_off
    is_cclass $I11, 8192, rx132_tgt, $I10
    if $I11, rx132_fail
    dec $I10
    is_cclass $I11, 8192, rx132_tgt, $I10
    unless $I11, rx132_fail
  # rx pass
    rx132_cur."!cursor_pass"(rx132_pos, "")
    rx132_cur."!cursor_debug"("PASS  ", "", " at pos=", rx132_pos)
    .return (rx132_cur)
  rx132_fail:
    (rx132_rep, rx132_pos, $I10, $P10) = rx132_cur."!mark_fail"(0)
    lt rx132_pos, -1, rx132_done
    eq rx132_pos, -1, rx132_fail
    jump $I10
  rx132_done:
    rx132_cur."!cursor_fail"()
    rx132_cur."!cursor_debug"("FAIL  ", "")
    .return (rx132_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "comp_unit"  :subid("29_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx140_tgt
    .local int rx140_pos
    .local int rx140_off
    .local int rx140_eos
    .local int rx140_rep
    .local pmc rx140_cur
    (rx140_cur, rx140_pos, rx140_tgt) = self."!cursor_start"()
    rx140_cur."!cursor_debug"("START ", "comp_unit")
    .lex unicode:"$\x{a2}", rx140_cur
    .local pmc match
    .lex "$/", match
    length rx140_eos, rx140_tgt
    set rx140_off, 0
    lt rx140_pos, 2, rx140_start
    sub rx140_off, rx140_pos, 1
    substr rx140_tgt, rx140_tgt, rx140_off
  rx140_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan144_done
    goto rxscan144_scan
  rxscan144_loop:
    ($P10) = rx140_cur."from"()
    inc $P10
    set rx140_pos, $P10
    ge rx140_pos, rx140_eos, rxscan144_done
  rxscan144_scan:
    set_addr $I10, rxscan144_loop
    rx140_cur."!mark_push"(0, rx140_pos, $I10)
  rxscan144_done:
.annotate "line", 78
  # rx subrule "newpad" subtype=method negate=
    rx140_cur."!cursor_pos"(rx140_pos)
    $P10 = rx140_cur."newpad"()
    unless $P10, rx140_fail
    rx140_pos = $P10."pos"()
.annotate "line", 79
  # rx subrule "statementlist" subtype=capture negate=
    rx140_cur."!cursor_pos"(rx140_pos)
    $P10 = rx140_cur."statementlist"()
    unless $P10, rx140_fail
    rx140_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx140_pos = $P10."pos"()
  alt145_0:
.annotate "line", 80
    set_addr $I10, alt145_1
    rx140_cur."!mark_push"(0, rx140_pos, $I10)
  # rxanchor eos
    ne rx140_pos, rx140_eos, rx140_fail
    goto alt145_end
  alt145_1:
  # rx subrule "panic" subtype=method negate=
    rx140_cur."!cursor_pos"(rx140_pos)
    $P10 = rx140_cur."panic"("Confused")
    unless $P10, rx140_fail
    rx140_pos = $P10."pos"()
  alt145_end:
.annotate "line", 77
  # rx pass
    rx140_cur."!cursor_pass"(rx140_pos, "comp_unit")
    rx140_cur."!cursor_debug"("PASS  ", "comp_unit", " at pos=", rx140_pos)
    .return (rx140_cur)
  rx140_fail:
.annotate "line", 4
    (rx140_rep, rx140_pos, $I10, $P10) = rx140_cur."!mark_fail"(0)
    lt rx140_pos, -1, rx140_done
    eq rx140_pos, -1, rx140_fail
    jump $I10
  rx140_done:
    rx140_cur."!cursor_fail"()
    rx140_cur."!cursor_debug"("FAIL  ", "comp_unit")
    .return (rx140_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__comp_unit"  :subid("30_1266334190.64822") :method
.annotate "line", 4
    $P142 = self."!PREFIX__!subrule"("", "")
    new $P143, "ResizablePMCArray"
    push $P143, $P142
    .return ($P143)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx147_tgt
    .local int rx147_pos
    .local int rx147_off
    .local int rx147_eos
    .local int rx147_rep
    .local pmc rx147_cur
    (rx147_cur, rx147_pos, rx147_tgt) = self."!cursor_start"()
    rx147_cur."!cursor_debug"("START ", "statementlist")
    rx147_cur."!cursor_caparray"("statement")
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
    ne $I10, -1, rxscan150_done
    goto rxscan150_scan
  rxscan150_loop:
    ($P10) = rx147_cur."from"()
    inc $P10
    set rx147_pos, $P10
    ge rx147_pos, rx147_eos, rxscan150_done
  rxscan150_scan:
    set_addr $I10, rxscan150_loop
    rx147_cur."!mark_push"(0, rx147_pos, $I10)
  rxscan150_done:
  alt151_0:
.annotate "line", 83
    set_addr $I10, alt151_1
    rx147_cur."!mark_push"(0, rx147_pos, $I10)
.annotate "line", 84
  # rx subrule "ws" subtype=method negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."ws"()
    unless $P10, rx147_fail
    rx147_pos = $P10."pos"()
  # rxanchor eos
    ne rx147_pos, rx147_eos, rx147_fail
  # rx subrule "ws" subtype=method negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."ws"()
    unless $P10, rx147_fail
    rx147_pos = $P10."pos"()
    goto alt151_end
  alt151_1:
.annotate "line", 85
  # rx subrule "ws" subtype=method negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."ws"()
    unless $P10, rx147_fail
    rx147_pos = $P10."pos"()
  # rx rxquantr155 ** 0..*
    set_addr $I157, rxquantr155_done
    rx147_cur."!mark_push"(0, rx147_pos, $I157)
  rxquantr155_loop:
  # rx subrule "statement" subtype=capture negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."statement"()
    unless $P10, rx147_fail
    rx147_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx147_pos = $P10."pos"()
  # rx subrule "eat_terminator" subtype=method negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."eat_terminator"()
    unless $P10, rx147_fail
    rx147_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."ws"()
    unless $P10, rx147_fail
    rx147_pos = $P10."pos"()
    (rx147_rep) = rx147_cur."!mark_commit"($I157)
    rx147_cur."!mark_push"(rx147_rep, rx147_pos, $I157)
    goto rxquantr155_loop
  rxquantr155_done:
  # rx subrule "ws" subtype=method negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."ws"()
    unless $P10, rx147_fail
    rx147_pos = $P10."pos"()
  alt151_end:
.annotate "line", 83
  # rx pass
    rx147_cur."!cursor_pass"(rx147_pos, "statementlist")
    rx147_cur."!cursor_debug"("PASS  ", "statementlist", " at pos=", rx147_pos)
    .return (rx147_cur)
  rx147_fail:
.annotate "line", 4
    (rx147_rep, rx147_pos, $I10, $P10) = rx147_cur."!mark_fail"(0)
    lt rx147_pos, -1, rx147_done
    eq rx147_pos, -1, rx147_fail
    jump $I10
  rx147_done:
    rx147_cur."!cursor_fail"()
    rx147_cur."!cursor_debug"("FAIL  ", "statementlist")
    .return (rx147_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statementlist"  :subid("32_1266334190.64822") :method
.annotate "line", 4
    new $P149, "ResizablePMCArray"
    push $P149, ""
    push $P149, ""
    .return ($P149)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .const 'Sub' $P165 = "35_1266334190.64822" 
    capture_lex $P165
    .local string rx160_tgt
    .local int rx160_pos
    .local int rx160_off
    .local int rx160_eos
    .local int rx160_rep
    .local pmc rx160_cur
    (rx160_cur, rx160_pos, rx160_tgt) = self."!cursor_start"()
    rx160_cur."!cursor_debug"("START ", "statement")
    rx160_cur."!cursor_caparray"("statement_mod_loop", "statement_mod_cond")
    .lex unicode:"$\x{a2}", rx160_cur
    .local pmc match
    .lex "$/", match
    length rx160_eos, rx160_tgt
    set rx160_off, 0
    lt rx160_pos, 2, rx160_start
    sub rx160_off, rx160_pos, 1
    substr rx160_tgt, rx160_tgt, rx160_off
  rx160_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan163_done
    goto rxscan163_scan
  rxscan163_loop:
    ($P10) = rx160_cur."from"()
    inc $P10
    set rx160_pos, $P10
    ge rx160_pos, rx160_eos, rxscan163_done
  rxscan163_scan:
    set_addr $I10, rxscan163_loop
    rx160_cur."!mark_push"(0, rx160_pos, $I10)
  rxscan163_done:
.annotate "line", 89
  # rx subrule "before" subtype=zerowidth negate=1
    rx160_cur."!cursor_pos"(rx160_pos)
    .const 'Sub' $P165 = "35_1266334190.64822" 
    capture_lex $P165
    $P10 = rx160_cur."before"($P165)
    if $P10, rx160_fail
  alt169_0:
.annotate "line", 90
    set_addr $I10, alt169_1
    rx160_cur."!mark_push"(0, rx160_pos, $I10)
.annotate "line", 91
  # rx subrule "statement_control" subtype=capture negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."statement_control"()
    unless $P10, rx160_fail
    rx160_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_control")
    rx160_pos = $P10."pos"()
    goto alt169_end
  alt169_1:
.annotate "line", 92
  # rx subrule "EXPR" subtype=capture negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."EXPR"()
    unless $P10, rx160_fail
    rx160_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx160_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."ws"()
    unless $P10, rx160_fail
    rx160_pos = $P10."pos"()
.annotate "line", 96
  # rx rxquantr170 ** 0..1
    set_addr $I174, rxquantr170_done
    rx160_cur."!mark_push"(0, rx160_pos, $I174)
  rxquantr170_loop:
  alt171_0:
.annotate "line", 93
    set_addr $I10, alt171_1
    rx160_cur."!mark_push"(0, rx160_pos, $I10)
.annotate "line", 94
  # rx subrule "statement_mod_cond" subtype=capture negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."statement_mod_cond"()
    unless $P10, rx160_fail
    rx160_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_cond")
    rx160_pos = $P10."pos"()
  # rx rxquantr172 ** 0..1
    set_addr $I173, rxquantr172_done
    rx160_cur."!mark_push"(0, rx160_pos, $I173)
  rxquantr172_loop:
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."statement_mod_loop"()
    unless $P10, rx160_fail
    rx160_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx160_pos = $P10."pos"()
    (rx160_rep) = rx160_cur."!mark_commit"($I173)
  rxquantr172_done:
    goto alt171_end
  alt171_1:
.annotate "line", 95
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."statement_mod_loop"()
    unless $P10, rx160_fail
    rx160_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx160_pos = $P10."pos"()
  alt171_end:
.annotate "line", 96
    (rx160_rep) = rx160_cur."!mark_commit"($I174)
  rxquantr170_done:
  alt169_end:
.annotate "line", 88
  # rx pass
    rx160_cur."!cursor_pass"(rx160_pos, "statement")
    rx160_cur."!cursor_debug"("PASS  ", "statement", " at pos=", rx160_pos)
    .return (rx160_cur)
  rx160_fail:
.annotate "line", 4
    (rx160_rep, rx160_pos, $I10, $P10) = rx160_cur."!mark_fail"(0)
    lt rx160_pos, -1, rx160_done
    eq rx160_pos, -1, rx160_fail
    jump $I10
  rx160_done:
    rx160_cur."!cursor_fail"()
    rx160_cur."!cursor_debug"("FAIL  ", "statement")
    .return (rx160_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement"  :subid("34_1266334190.64822") :method
.annotate "line", 4
    new $P162, "ResizablePMCArray"
    push $P162, ""
    .return ($P162)
.end


.namespace ["NQP";"Grammar"]
.sub "_block164"  :anon :subid("35_1266334190.64822") :method :outer("33_1266334190.64822")
.annotate "line", 89
    .local string rx166_tgt
    .local int rx166_pos
    .local int rx166_off
    .local int rx166_eos
    .local int rx166_rep
    .local pmc rx166_cur
    (rx166_cur, rx166_pos, rx166_tgt) = self."!cursor_start"()
    rx166_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx166_cur
    .local pmc match
    .lex "$/", match
    length rx166_eos, rx166_tgt
    set rx166_off, 0
    lt rx166_pos, 2, rx166_start
    sub rx166_off, rx166_pos, 1
    substr rx166_tgt, rx166_tgt, rx166_off
  rx166_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan167_done
    goto rxscan167_scan
  rxscan167_loop:
    ($P10) = rx166_cur."from"()
    inc $P10
    set rx166_pos, $P10
    ge rx166_pos, rx166_eos, rxscan167_done
  rxscan167_scan:
    set_addr $I10, rxscan167_loop
    rx166_cur."!mark_push"(0, rx166_pos, $I10)
  rxscan167_done:
  alt168_0:
    set_addr $I10, alt168_1
    rx166_cur."!mark_push"(0, rx166_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx166_pos, rx166_eos, rx166_fail
    sub $I10, rx166_pos, rx166_off
    substr $S10, rx166_tgt, $I10, 1
    index $I11, "])}", $S10
    lt $I11, 0, rx166_fail
    inc rx166_pos
    goto alt168_end
  alt168_1:
  # rxanchor eos
    ne rx166_pos, rx166_eos, rx166_fail
  alt168_end:
  # rx pass
    rx166_cur."!cursor_pass"(rx166_pos, "")
    rx166_cur."!cursor_debug"("PASS  ", "", " at pos=", rx166_pos)
    .return (rx166_cur)
  rx166_fail:
    (rx166_rep, rx166_pos, $I10, $P10) = rx166_cur."!mark_fail"(0)
    lt rx166_pos, -1, rx166_done
    eq rx166_pos, -1, rx166_fail
    jump $I10
  rx166_done:
    rx166_cur."!cursor_fail"()
    rx166_cur."!cursor_debug"("FAIL  ", "")
    .return (rx166_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "eat_terminator"  :subid("36_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx176_tgt
    .local int rx176_pos
    .local int rx176_off
    .local int rx176_eos
    .local int rx176_rep
    .local pmc rx176_cur
    (rx176_cur, rx176_pos, rx176_tgt) = self."!cursor_start"()
    rx176_cur."!cursor_debug"("START ", "eat_terminator")
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
    ne $I10, -1, rxscan179_done
    goto rxscan179_scan
  rxscan179_loop:
    ($P10) = rx176_cur."from"()
    inc $P10
    set rx176_pos, $P10
    ge rx176_pos, rx176_eos, rxscan179_done
  rxscan179_scan:
    set_addr $I10, rxscan179_loop
    rx176_cur."!mark_push"(0, rx176_pos, $I10)
  rxscan179_done:
  alt180_0:
.annotate "line", 100
    set_addr $I10, alt180_1
    rx176_cur."!mark_push"(0, rx176_pos, $I10)
.annotate "line", 101
  # rx literal  ";"
    add $I11, rx176_pos, 1
    gt $I11, rx176_eos, rx176_fail
    sub $I11, rx176_pos, rx176_off
    substr $S10, rx176_tgt, $I11, 1
    ne $S10, ";", rx176_fail
    add rx176_pos, 1
    goto alt180_end
  alt180_1:
    set_addr $I10, alt180_2
    rx176_cur."!mark_push"(0, rx176_pos, $I10)
.annotate "line", 102
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx176_cur."!cursor_pos"(rx176_pos)
    $P10 = rx176_cur."MARKED"("endstmt")
    unless $P10, rx176_fail
    goto alt180_end
  alt180_2:
    set_addr $I10, alt180_3
    rx176_cur."!mark_push"(0, rx176_pos, $I10)
.annotate "line", 103
  # rx subrule "terminator" subtype=zerowidth negate=
    rx176_cur."!cursor_pos"(rx176_pos)
    $P10 = rx176_cur."terminator"()
    unless $P10, rx176_fail
    goto alt180_end
  alt180_3:
.annotate "line", 104
  # rxanchor eos
    ne rx176_pos, rx176_eos, rx176_fail
  alt180_end:
.annotate "line", 100
  # rx pass
    rx176_cur."!cursor_pass"(rx176_pos, "eat_terminator")
    rx176_cur."!cursor_debug"("PASS  ", "eat_terminator", " at pos=", rx176_pos)
    .return (rx176_cur)
  rx176_fail:
.annotate "line", 4
    (rx176_rep, rx176_pos, $I10, $P10) = rx176_cur."!mark_fail"(0)
    lt rx176_pos, -1, rx176_done
    eq rx176_pos, -1, rx176_fail
    jump $I10
  rx176_done:
    rx176_cur."!cursor_fail"()
    rx176_cur."!cursor_debug"("FAIL  ", "eat_terminator")
    .return (rx176_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__eat_terminator"  :subid("37_1266334190.64822") :method
.annotate "line", 4
    new $P178, "ResizablePMCArray"
    push $P178, ""
    push $P178, ""
    push $P178, ""
    push $P178, ";"
    .return ($P178)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx182_tgt
    .local int rx182_pos
    .local int rx182_off
    .local int rx182_eos
    .local int rx182_rep
    .local pmc rx182_cur
    (rx182_cur, rx182_pos, rx182_tgt) = self."!cursor_start"()
    rx182_cur."!cursor_debug"("START ", "xblock")
    .lex unicode:"$\x{a2}", rx182_cur
    .local pmc match
    .lex "$/", match
    length rx182_eos, rx182_tgt
    set rx182_off, 0
    lt rx182_pos, 2, rx182_start
    sub rx182_off, rx182_pos, 1
    substr rx182_tgt, rx182_tgt, rx182_off
  rx182_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan186_done
    goto rxscan186_scan
  rxscan186_loop:
    ($P10) = rx182_cur."from"()
    inc $P10
    set rx182_pos, $P10
    ge rx182_pos, rx182_eos, rxscan186_done
  rxscan186_scan:
    set_addr $I10, rxscan186_loop
    rx182_cur."!mark_push"(0, rx182_pos, $I10)
  rxscan186_done:
.annotate "line", 108
  # rx subrule "EXPR" subtype=capture negate=
    rx182_cur."!cursor_pos"(rx182_pos)
    $P10 = rx182_cur."EXPR"()
    unless $P10, rx182_fail
    rx182_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx182_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx182_cur."!cursor_pos"(rx182_pos)
    $P10 = rx182_cur."ws"()
    unless $P10, rx182_fail
    rx182_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx182_cur."!cursor_pos"(rx182_pos)
    $P10 = rx182_cur."pblock"()
    unless $P10, rx182_fail
    rx182_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx182_pos = $P10."pos"()
.annotate "line", 107
  # rx pass
    rx182_cur."!cursor_pass"(rx182_pos, "xblock")
    rx182_cur."!cursor_debug"("PASS  ", "xblock", " at pos=", rx182_pos)
    .return (rx182_cur)
  rx182_fail:
.annotate "line", 4
    (rx182_rep, rx182_pos, $I10, $P10) = rx182_cur."!mark_fail"(0)
    lt rx182_pos, -1, rx182_done
    eq rx182_pos, -1, rx182_fail
    jump $I10
  rx182_done:
    rx182_cur."!cursor_fail"()
    rx182_cur."!cursor_debug"("FAIL  ", "xblock")
    .return (rx182_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__xblock"  :subid("39_1266334190.64822") :method
.annotate "line", 4
    $P184 = self."!PREFIX__!subrule"("EXPR", "")
    new $P185, "ResizablePMCArray"
    push $P185, $P184
    .return ($P185)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx188_tgt
    .local int rx188_pos
    .local int rx188_off
    .local int rx188_eos
    .local int rx188_rep
    .local pmc rx188_cur
    (rx188_cur, rx188_pos, rx188_tgt) = self."!cursor_start"()
    rx188_cur."!cursor_debug"("START ", "pblock")
    .lex unicode:"$\x{a2}", rx188_cur
    .local pmc match
    .lex "$/", match
    length rx188_eos, rx188_tgt
    set rx188_off, 0
    lt rx188_pos, 2, rx188_start
    sub rx188_off, rx188_pos, 1
    substr rx188_tgt, rx188_tgt, rx188_off
  rx188_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan193_done
    goto rxscan193_scan
  rxscan193_loop:
    ($P10) = rx188_cur."from"()
    inc $P10
    set rx188_pos, $P10
    ge rx188_pos, rx188_eos, rxscan193_done
  rxscan193_scan:
    set_addr $I10, rxscan193_loop
    rx188_cur."!mark_push"(0, rx188_pos, $I10)
  rxscan193_done:
  alt194_0:
.annotate "line", 111
    set_addr $I10, alt194_1
    rx188_cur."!mark_push"(0, rx188_pos, $I10)
.annotate "line", 112
  # rx subrule "lambda" subtype=method negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."lambda"()
    unless $P10, rx188_fail
    rx188_pos = $P10."pos"()
.annotate "line", 113
  # rx subrule "newpad" subtype=method negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."newpad"()
    unless $P10, rx188_fail
    rx188_pos = $P10."pos"()
.annotate "line", 114
  # rx subrule "signature" subtype=capture negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."signature"()
    unless $P10, rx188_fail
    rx188_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx188_pos = $P10."pos"()
.annotate "line", 115
  # rx subrule "blockoid" subtype=capture negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."blockoid"()
    unless $P10, rx188_fail
    rx188_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx188_pos = $P10."pos"()
.annotate "line", 112
    goto alt194_end
  alt194_1:
    set_addr $I10, alt194_2
    rx188_cur."!mark_push"(0, rx188_pos, $I10)
.annotate "line", 116
  # rx enumcharlist negate=0 zerowidth
    ge rx188_pos, rx188_eos, rx188_fail
    sub $I10, rx188_pos, rx188_off
    substr $S10, rx188_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx188_fail
.annotate "line", 117
  # rx subrule "newpad" subtype=method negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."newpad"()
    unless $P10, rx188_fail
    rx188_pos = $P10."pos"()
.annotate "line", 118
  # rx subrule "blockoid" subtype=capture negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."blockoid"()
    unless $P10, rx188_fail
    rx188_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx188_pos = $P10."pos"()
.annotate "line", 116
    goto alt194_end
  alt194_2:
.annotate "line", 119
  # rx subrule "panic" subtype=method negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."panic"("Missing block")
    unless $P10, rx188_fail
    rx188_pos = $P10."pos"()
  alt194_end:
.annotate "line", 111
  # rx pass
    rx188_cur."!cursor_pass"(rx188_pos, "pblock")
    rx188_cur."!cursor_debug"("PASS  ", "pblock", " at pos=", rx188_pos)
    .return (rx188_cur)
  rx188_fail:
.annotate "line", 4
    (rx188_rep, rx188_pos, $I10, $P10) = rx188_cur."!mark_fail"(0)
    lt rx188_pos, -1, rx188_done
    eq rx188_pos, -1, rx188_fail
    jump $I10
  rx188_done:
    rx188_cur."!cursor_fail"()
    rx188_cur."!cursor_debug"("FAIL  ", "pblock")
    .return (rx188_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pblock"  :subid("41_1266334190.64822") :method
.annotate "line", 4
    $P190 = self."!PREFIX__!subrule"("", "")
    $P191 = self."!PREFIX__!subrule"("", "")
    new $P192, "ResizablePMCArray"
    push $P192, $P190
    push $P192, "{"
    push $P192, $P191
    .return ($P192)
.end


.namespace ["NQP";"Grammar"]
.sub "lambda"  :subid("42_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx196_tgt
    .local int rx196_pos
    .local int rx196_off
    .local int rx196_eos
    .local int rx196_rep
    .local pmc rx196_cur
    (rx196_cur, rx196_pos, rx196_tgt) = self."!cursor_start"()
    rx196_cur."!cursor_debug"("START ", "lambda")
    .lex unicode:"$\x{a2}", rx196_cur
    .local pmc match
    .lex "$/", match
    length rx196_eos, rx196_tgt
    set rx196_off, 0
    lt rx196_pos, 2, rx196_start
    sub rx196_off, rx196_pos, 1
    substr rx196_tgt, rx196_tgt, rx196_off
  rx196_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan199_done
    goto rxscan199_scan
  rxscan199_loop:
    ($P10) = rx196_cur."from"()
    inc $P10
    set rx196_pos, $P10
    ge rx196_pos, rx196_eos, rxscan199_done
  rxscan199_scan:
    set_addr $I10, rxscan199_loop
    rx196_cur."!mark_push"(0, rx196_pos, $I10)
  rxscan199_done:
  alt200_0:
.annotate "line", 122
    set_addr $I10, alt200_1
    rx196_cur."!mark_push"(0, rx196_pos, $I10)
  # rx literal  "->"
    add $I11, rx196_pos, 2
    gt $I11, rx196_eos, rx196_fail
    sub $I11, rx196_pos, rx196_off
    substr $S10, rx196_tgt, $I11, 2
    ne $S10, "->", rx196_fail
    add rx196_pos, 2
    goto alt200_end
  alt200_1:
  # rx literal  "<->"
    add $I11, rx196_pos, 3
    gt $I11, rx196_eos, rx196_fail
    sub $I11, rx196_pos, rx196_off
    substr $S10, rx196_tgt, $I11, 3
    ne $S10, "<->", rx196_fail
    add rx196_pos, 3
  alt200_end:
  # rx pass
    rx196_cur."!cursor_pass"(rx196_pos, "lambda")
    rx196_cur."!cursor_debug"("PASS  ", "lambda", " at pos=", rx196_pos)
    .return (rx196_cur)
  rx196_fail:
.annotate "line", 4
    (rx196_rep, rx196_pos, $I10, $P10) = rx196_cur."!mark_fail"(0)
    lt rx196_pos, -1, rx196_done
    eq rx196_pos, -1, rx196_fail
    jump $I10
  rx196_done:
    rx196_cur."!cursor_fail"()
    rx196_cur."!cursor_debug"("FAIL  ", "lambda")
    .return (rx196_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__lambda"  :subid("43_1266334190.64822") :method
.annotate "line", 4
    new $P198, "ResizablePMCArray"
    push $P198, "<->"
    push $P198, "->"
    .return ($P198)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx202_tgt
    .local int rx202_pos
    .local int rx202_off
    .local int rx202_eos
    .local int rx202_rep
    .local pmc rx202_cur
    (rx202_cur, rx202_pos, rx202_tgt) = self."!cursor_start"()
    rx202_cur."!cursor_debug"("START ", "block")
    .lex unicode:"$\x{a2}", rx202_cur
    .local pmc match
    .lex "$/", match
    length rx202_eos, rx202_tgt
    set rx202_off, 0
    lt rx202_pos, 2, rx202_start
    sub rx202_off, rx202_pos, 1
    substr rx202_tgt, rx202_tgt, rx202_off
  rx202_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan206_done
    goto rxscan206_scan
  rxscan206_loop:
    ($P10) = rx202_cur."from"()
    inc $P10
    set rx202_pos, $P10
    ge rx202_pos, rx202_eos, rxscan206_done
  rxscan206_scan:
    set_addr $I10, rxscan206_loop
    rx202_cur."!mark_push"(0, rx202_pos, $I10)
  rxscan206_done:
  alt207_0:
.annotate "line", 125
    set_addr $I10, alt207_1
    rx202_cur."!mark_push"(0, rx202_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx202_pos, rx202_eos, rx202_fail
    sub $I10, rx202_pos, rx202_off
    substr $S10, rx202_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx202_fail
    goto alt207_end
  alt207_1:
  # rx subrule "panic" subtype=method negate=
    rx202_cur."!cursor_pos"(rx202_pos)
    $P10 = rx202_cur."panic"("Missing block")
    unless $P10, rx202_fail
    rx202_pos = $P10."pos"()
  alt207_end:
.annotate "line", 126
  # rx subrule "newpad" subtype=method negate=
    rx202_cur."!cursor_pos"(rx202_pos)
    $P10 = rx202_cur."newpad"()
    unless $P10, rx202_fail
    rx202_pos = $P10."pos"()
.annotate "line", 127
  # rx subrule "blockoid" subtype=capture negate=
    rx202_cur."!cursor_pos"(rx202_pos)
    $P10 = rx202_cur."blockoid"()
    unless $P10, rx202_fail
    rx202_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx202_pos = $P10."pos"()
.annotate "line", 124
  # rx pass
    rx202_cur."!cursor_pass"(rx202_pos, "block")
    rx202_cur."!cursor_debug"("PASS  ", "block", " at pos=", rx202_pos)
    .return (rx202_cur)
  rx202_fail:
.annotate "line", 4
    (rx202_rep, rx202_pos, $I10, $P10) = rx202_cur."!mark_fail"(0)
    lt rx202_pos, -1, rx202_done
    eq rx202_pos, -1, rx202_fail
    jump $I10
  rx202_done:
    rx202_cur."!cursor_fail"()
    rx202_cur."!cursor_debug"("FAIL  ", "block")
    .return (rx202_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__block"  :subid("45_1266334190.64822") :method
.annotate "line", 4
    $P204 = self."!PREFIX__!subrule"("", "")
    new $P205, "ResizablePMCArray"
    push $P205, $P204
    push $P205, "{"
    .return ($P205)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx209_tgt
    .local int rx209_pos
    .local int rx209_off
    .local int rx209_eos
    .local int rx209_rep
    .local pmc rx209_cur
    (rx209_cur, rx209_pos, rx209_tgt) = self."!cursor_start"()
    rx209_cur."!cursor_debug"("START ", "blockoid")
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
.annotate "line", 131
  # rx subrule "finishpad" subtype=method negate=
    rx209_cur."!cursor_pos"(rx209_pos)
    $P10 = rx209_cur."finishpad"()
    unless $P10, rx209_fail
    rx209_pos = $P10."pos"()
.annotate "line", 132
  # rx literal  "{"
    add $I11, rx209_pos, 1
    gt $I11, rx209_eos, rx209_fail
    sub $I11, rx209_pos, rx209_off
    substr $S10, rx209_tgt, $I11, 1
    ne $S10, "{", rx209_fail
    add rx209_pos, 1
  # rx subrule "statementlist" subtype=capture negate=
    rx209_cur."!cursor_pos"(rx209_pos)
    $P10 = rx209_cur."statementlist"()
    unless $P10, rx209_fail
    rx209_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx209_pos = $P10."pos"()
  alt214_0:
    set_addr $I10, alt214_1
    rx209_cur."!mark_push"(0, rx209_pos, $I10)
  # rx literal  "}"
    add $I11, rx209_pos, 1
    gt $I11, rx209_eos, rx209_fail
    sub $I11, rx209_pos, rx209_off
    substr $S10, rx209_tgt, $I11, 1
    ne $S10, "}", rx209_fail
    add rx209_pos, 1
    goto alt214_end
  alt214_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx209_cur."!cursor_pos"(rx209_pos)
    $P10 = rx209_cur."FAILGOAL"("'}'")
    unless $P10, rx209_fail
    rx209_pos = $P10."pos"()
  alt214_end:
.annotate "line", 133
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx209_cur."!cursor_pos"(rx209_pos)
    $P10 = rx209_cur."ENDSTMT"()
    unless $P10, rx209_fail
.annotate "line", 130
  # rx pass
    rx209_cur."!cursor_pass"(rx209_pos, "blockoid")
    rx209_cur."!cursor_debug"("PASS  ", "blockoid", " at pos=", rx209_pos)
    .return (rx209_cur)
  rx209_fail:
.annotate "line", 4
    (rx209_rep, rx209_pos, $I10, $P10) = rx209_cur."!mark_fail"(0)
    lt rx209_pos, -1, rx209_done
    eq rx209_pos, -1, rx209_fail
    jump $I10
  rx209_done:
    rx209_cur."!cursor_fail"()
    rx209_cur."!cursor_debug"("FAIL  ", "blockoid")
    .return (rx209_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blockoid"  :subid("47_1266334190.64822") :method
.annotate "line", 4
    $P211 = self."!PREFIX__!subrule"("", "")
    new $P212, "ResizablePMCArray"
    push $P212, $P211
    .return ($P212)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx217_tgt
    .local int rx217_pos
    .local int rx217_off
    .local int rx217_eos
    .local int rx217_rep
    .local pmc rx217_cur
    (rx217_cur, rx217_pos, rx217_tgt) = self."!cursor_start"()
    rx217_cur."!cursor_debug"("START ", "newpad")
    .lex unicode:"$\x{a2}", rx217_cur
    .local pmc match
    .lex "$/", match
    length rx217_eos, rx217_tgt
    set rx217_off, 0
    lt rx217_pos, 2, rx217_start
    sub rx217_off, rx217_pos, 1
    substr rx217_tgt, rx217_tgt, rx217_off
  rx217_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan220_done
    goto rxscan220_scan
  rxscan220_loop:
    ($P10) = rx217_cur."from"()
    inc $P10
    set rx217_pos, $P10
    ge rx217_pos, rx217_eos, rxscan220_done
  rxscan220_scan:
    set_addr $I10, rxscan220_loop
    rx217_cur."!mark_push"(0, rx217_pos, $I10)
  rxscan220_done:
.annotate "line", 136
  # rx pass
    rx217_cur."!cursor_pass"(rx217_pos, "newpad")
    rx217_cur."!cursor_debug"("PASS  ", "newpad", " at pos=", rx217_pos)
    .return (rx217_cur)
  rx217_fail:
.annotate "line", 4
    (rx217_rep, rx217_pos, $I10, $P10) = rx217_cur."!mark_fail"(0)
    lt rx217_pos, -1, rx217_done
    eq rx217_pos, -1, rx217_fail
    jump $I10
  rx217_done:
    rx217_cur."!cursor_fail"()
    rx217_cur."!cursor_debug"("FAIL  ", "newpad")
    .return (rx217_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__newpad"  :subid("49_1266334190.64822") :method
.annotate "line", 4
    new $P219, "ResizablePMCArray"
    push $P219, ""
    .return ($P219)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("50_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx222_tgt
    .local int rx222_pos
    .local int rx222_off
    .local int rx222_eos
    .local int rx222_rep
    .local pmc rx222_cur
    (rx222_cur, rx222_pos, rx222_tgt) = self."!cursor_start"()
    rx222_cur."!cursor_debug"("START ", "finishpad")
    .lex unicode:"$\x{a2}", rx222_cur
    .local pmc match
    .lex "$/", match
    length rx222_eos, rx222_tgt
    set rx222_off, 0
    lt rx222_pos, 2, rx222_start
    sub rx222_off, rx222_pos, 1
    substr rx222_tgt, rx222_tgt, rx222_off
  rx222_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan225_done
    goto rxscan225_scan
  rxscan225_loop:
    ($P10) = rx222_cur."from"()
    inc $P10
    set rx222_pos, $P10
    ge rx222_pos, rx222_eos, rxscan225_done
  rxscan225_scan:
    set_addr $I10, rxscan225_loop
    rx222_cur."!mark_push"(0, rx222_pos, $I10)
  rxscan225_done:
.annotate "line", 137
  # rx pass
    rx222_cur."!cursor_pass"(rx222_pos, "finishpad")
    rx222_cur."!cursor_debug"("PASS  ", "finishpad", " at pos=", rx222_pos)
    .return (rx222_cur)
  rx222_fail:
.annotate "line", 4
    (rx222_rep, rx222_pos, $I10, $P10) = rx222_cur."!mark_fail"(0)
    lt rx222_pos, -1, rx222_done
    eq rx222_pos, -1, rx222_fail
    jump $I10
  rx222_done:
    rx222_cur."!cursor_fail"()
    rx222_cur."!cursor_debug"("FAIL  ", "finishpad")
    .return (rx222_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__finishpad"  :subid("51_1266334190.64822") :method
.annotate "line", 4
    new $P224, "ResizablePMCArray"
    push $P224, ""
    .return ($P224)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("52_1266334190.64822") :method
.annotate "line", 139
    $P227 = self."!protoregex"("terminator")
    .return ($P227)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("53_1266334190.64822") :method
.annotate "line", 139
    $P229 = self."!PREFIX__!protoregex"("terminator")
    .return ($P229)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("54_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx231_tgt
    .local int rx231_pos
    .local int rx231_off
    .local int rx231_eos
    .local int rx231_rep
    .local pmc rx231_cur
    (rx231_cur, rx231_pos, rx231_tgt) = self."!cursor_start"()
    rx231_cur."!cursor_debug"("START ", "terminator:sym<;>")
    .lex unicode:"$\x{a2}", rx231_cur
    .local pmc match
    .lex "$/", match
    length rx231_eos, rx231_tgt
    set rx231_off, 0
    lt rx231_pos, 2, rx231_start
    sub rx231_off, rx231_pos, 1
    substr rx231_tgt, rx231_tgt, rx231_off
  rx231_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan234_done
    goto rxscan234_scan
  rxscan234_loop:
    ($P10) = rx231_cur."from"()
    inc $P10
    set rx231_pos, $P10
    ge rx231_pos, rx231_eos, rxscan234_done
  rxscan234_scan:
    set_addr $I10, rxscan234_loop
    rx231_cur."!mark_push"(0, rx231_pos, $I10)
  rxscan234_done:
.annotate "line", 141
  # rx enumcharlist negate=0 zerowidth
    ge rx231_pos, rx231_eos, rx231_fail
    sub $I10, rx231_pos, rx231_off
    substr $S10, rx231_tgt, $I10, 1
    index $I11, ";", $S10
    lt $I11, 0, rx231_fail
  # rx pass
    rx231_cur."!cursor_pass"(rx231_pos, "terminator:sym<;>")
    rx231_cur."!cursor_debug"("PASS  ", "terminator:sym<;>", " at pos=", rx231_pos)
    .return (rx231_cur)
  rx231_fail:
.annotate "line", 4
    (rx231_rep, rx231_pos, $I10, $P10) = rx231_cur."!mark_fail"(0)
    lt rx231_pos, -1, rx231_done
    eq rx231_pos, -1, rx231_fail
    jump $I10
  rx231_done:
    rx231_cur."!cursor_fail"()
    rx231_cur."!cursor_debug"("FAIL  ", "terminator:sym<;>")
    .return (rx231_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<;>"  :subid("55_1266334190.64822") :method
.annotate "line", 4
    new $P233, "ResizablePMCArray"
    push $P233, ";"
    .return ($P233)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("56_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx236_tgt
    .local int rx236_pos
    .local int rx236_off
    .local int rx236_eos
    .local int rx236_rep
    .local pmc rx236_cur
    (rx236_cur, rx236_pos, rx236_tgt) = self."!cursor_start"()
    rx236_cur."!cursor_debug"("START ", "terminator:sym<}>")
    .lex unicode:"$\x{a2}", rx236_cur
    .local pmc match
    .lex "$/", match
    length rx236_eos, rx236_tgt
    set rx236_off, 0
    lt rx236_pos, 2, rx236_start
    sub rx236_off, rx236_pos, 1
    substr rx236_tgt, rx236_tgt, rx236_off
  rx236_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan239_done
    goto rxscan239_scan
  rxscan239_loop:
    ($P10) = rx236_cur."from"()
    inc $P10
    set rx236_pos, $P10
    ge rx236_pos, rx236_eos, rxscan239_done
  rxscan239_scan:
    set_addr $I10, rxscan239_loop
    rx236_cur."!mark_push"(0, rx236_pos, $I10)
  rxscan239_done:
.annotate "line", 142
  # rx enumcharlist negate=0 zerowidth
    ge rx236_pos, rx236_eos, rx236_fail
    sub $I10, rx236_pos, rx236_off
    substr $S10, rx236_tgt, $I10, 1
    index $I11, "}", $S10
    lt $I11, 0, rx236_fail
  # rx pass
    rx236_cur."!cursor_pass"(rx236_pos, "terminator:sym<}>")
    rx236_cur."!cursor_debug"("PASS  ", "terminator:sym<}>", " at pos=", rx236_pos)
    .return (rx236_cur)
  rx236_fail:
.annotate "line", 4
    (rx236_rep, rx236_pos, $I10, $P10) = rx236_cur."!mark_fail"(0)
    lt rx236_pos, -1, rx236_done
    eq rx236_pos, -1, rx236_fail
    jump $I10
  rx236_done:
    rx236_cur."!cursor_fail"()
    rx236_cur."!cursor_debug"("FAIL  ", "terminator:sym<}>")
    .return (rx236_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<}>"  :subid("57_1266334190.64822") :method
.annotate "line", 4
    new $P238, "ResizablePMCArray"
    push $P238, "}"
    .return ($P238)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("58_1266334190.64822") :method
.annotate "line", 146
    $P241 = self."!protoregex"("statement_control")
    .return ($P241)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("59_1266334190.64822") :method
.annotate "line", 146
    $P243 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P243)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("60_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx245_tgt
    .local int rx245_pos
    .local int rx245_off
    .local int rx245_eos
    .local int rx245_rep
    .local pmc rx245_cur
    (rx245_cur, rx245_pos, rx245_tgt) = self."!cursor_start"()
    rx245_cur."!cursor_debug"("START ", "statement_control:sym<if>")
    rx245_cur."!cursor_caparray"("xblock", "else")
    .lex unicode:"$\x{a2}", rx245_cur
    .local pmc match
    .lex "$/", match
    length rx245_eos, rx245_tgt
    set rx245_off, 0
    lt rx245_pos, 2, rx245_start
    sub rx245_off, rx245_pos, 1
    substr rx245_tgt, rx245_tgt, rx245_off
  rx245_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan248_done
    goto rxscan248_scan
  rxscan248_loop:
    ($P10) = rx245_cur."from"()
    inc $P10
    set rx245_pos, $P10
    ge rx245_pos, rx245_eos, rxscan248_done
  rxscan248_scan:
    set_addr $I10, rxscan248_loop
    rx245_cur."!mark_push"(0, rx245_pos, $I10)
  rxscan248_done:
.annotate "line", 149
  # rx subcapture "sym"
    set_addr $I10, rxcap_249_fail
    rx245_cur."!mark_push"(0, rx245_pos, $I10)
  # rx literal  "if"
    add $I11, rx245_pos, 2
    gt $I11, rx245_eos, rx245_fail
    sub $I11, rx245_pos, rx245_off
    substr $S10, rx245_tgt, $I11, 2
    ne $S10, "if", rx245_fail
    add rx245_pos, 2
    set_addr $I10, rxcap_249_fail
    ($I12, $I11) = rx245_cur."!mark_peek"($I10)
    rx245_cur."!cursor_pos"($I11)
    ($P10) = rx245_cur."!cursor_start"()
    $P10."!cursor_pass"(rx245_pos, "")
    rx245_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_249_done
  rxcap_249_fail:
    goto rx245_fail
  rxcap_249_done:
  # rx charclass s
    ge rx245_pos, rx245_eos, rx245_fail
    sub $I10, rx245_pos, rx245_off
    is_cclass $I11, 32, rx245_tgt, $I10
    unless $I11, rx245_fail
    inc rx245_pos
  # rx subrule "ws" subtype=method negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."ws"()
    unless $P10, rx245_fail
    rx245_pos = $P10."pos"()
.annotate "line", 150
  # rx subrule "xblock" subtype=capture negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."xblock"()
    unless $P10, rx245_fail
    rx245_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx245_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."ws"()
    unless $P10, rx245_fail
    rx245_pos = $P10."pos"()
.annotate "line", 151
  # rx rxquantr252 ** 0..*
    set_addr $I256, rxquantr252_done
    rx245_cur."!mark_push"(0, rx245_pos, $I256)
  rxquantr252_loop:
  # rx subrule "ws" subtype=method negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."ws"()
    unless $P10, rx245_fail
    rx245_pos = $P10."pos"()
  # rx literal  "elsif"
    add $I11, rx245_pos, 5
    gt $I11, rx245_eos, rx245_fail
    sub $I11, rx245_pos, rx245_off
    substr $S10, rx245_tgt, $I11, 5
    ne $S10, "elsif", rx245_fail
    add rx245_pos, 5
  # rx charclass s
    ge rx245_pos, rx245_eos, rx245_fail
    sub $I10, rx245_pos, rx245_off
    is_cclass $I11, 32, rx245_tgt, $I10
    unless $I11, rx245_fail
    inc rx245_pos
  # rx subrule "ws" subtype=method negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."ws"()
    unless $P10, rx245_fail
    rx245_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."xblock"()
    unless $P10, rx245_fail
    rx245_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx245_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."ws"()
    unless $P10, rx245_fail
    rx245_pos = $P10."pos"()
    (rx245_rep) = rx245_cur."!mark_commit"($I256)
    rx245_cur."!mark_push"(rx245_rep, rx245_pos, $I256)
    goto rxquantr252_loop
  rxquantr252_done:
  # rx subrule "ws" subtype=method negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."ws"()
    unless $P10, rx245_fail
    rx245_pos = $P10."pos"()
.annotate "line", 152
  # rx rxquantr258 ** 0..1
    set_addr $I262, rxquantr258_done
    rx245_cur."!mark_push"(0, rx245_pos, $I262)
  rxquantr258_loop:
  # rx subrule "ws" subtype=method negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."ws"()
    unless $P10, rx245_fail
    rx245_pos = $P10."pos"()
  # rx literal  "else"
    add $I11, rx245_pos, 4
    gt $I11, rx245_eos, rx245_fail
    sub $I11, rx245_pos, rx245_off
    substr $S10, rx245_tgt, $I11, 4
    ne $S10, "else", rx245_fail
    add rx245_pos, 4
  # rx charclass s
    ge rx245_pos, rx245_eos, rx245_fail
    sub $I10, rx245_pos, rx245_off
    is_cclass $I11, 32, rx245_tgt, $I10
    unless $I11, rx245_fail
    inc rx245_pos
  # rx subrule "ws" subtype=method negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."ws"()
    unless $P10, rx245_fail
    rx245_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."pblock"()
    unless $P10, rx245_fail
    rx245_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("else")
    rx245_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."ws"()
    unless $P10, rx245_fail
    rx245_pos = $P10."pos"()
    (rx245_rep) = rx245_cur."!mark_commit"($I262)
  rxquantr258_done:
  # rx subrule "ws" subtype=method negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."ws"()
    unless $P10, rx245_fail
    rx245_pos = $P10."pos"()
.annotate "line", 148
  # rx pass
    rx245_cur."!cursor_pass"(rx245_pos, "statement_control:sym<if>")
    rx245_cur."!cursor_debug"("PASS  ", "statement_control:sym<if>", " at pos=", rx245_pos)
    .return (rx245_cur)
  rx245_fail:
.annotate "line", 4
    (rx245_rep, rx245_pos, $I10, $P10) = rx245_cur."!mark_fail"(0)
    lt rx245_pos, -1, rx245_done
    eq rx245_pos, -1, rx245_fail
    jump $I10
  rx245_done:
    rx245_cur."!cursor_fail"()
    rx245_cur."!cursor_debug"("FAIL  ", "statement_control:sym<if>")
    .return (rx245_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<if>"  :subid("61_1266334190.64822") :method
.annotate "line", 4
    new $P247, "ResizablePMCArray"
    push $P247, "if"
    .return ($P247)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("62_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .const 'Sub' $P275 = "64_1266334190.64822" 
    capture_lex $P275
    .local string rx265_tgt
    .local int rx265_pos
    .local int rx265_off
    .local int rx265_eos
    .local int rx265_rep
    .local pmc rx265_cur
    (rx265_cur, rx265_pos, rx265_tgt) = self."!cursor_start"()
    rx265_cur."!cursor_debug"("START ", "statement_control:sym<unless>")
    .lex unicode:"$\x{a2}", rx265_cur
    .local pmc match
    .lex "$/", match
    length rx265_eos, rx265_tgt
    set rx265_off, 0
    lt rx265_pos, 2, rx265_start
    sub rx265_off, rx265_pos, 1
    substr rx265_tgt, rx265_tgt, rx265_off
  rx265_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan268_done
    goto rxscan268_scan
  rxscan268_loop:
    ($P10) = rx265_cur."from"()
    inc $P10
    set rx265_pos, $P10
    ge rx265_pos, rx265_eos, rxscan268_done
  rxscan268_scan:
    set_addr $I10, rxscan268_loop
    rx265_cur."!mark_push"(0, rx265_pos, $I10)
  rxscan268_done:
.annotate "line", 156
  # rx subcapture "sym"
    set_addr $I10, rxcap_269_fail
    rx265_cur."!mark_push"(0, rx265_pos, $I10)
  # rx literal  "unless"
    add $I11, rx265_pos, 6
    gt $I11, rx265_eos, rx265_fail
    sub $I11, rx265_pos, rx265_off
    substr $S10, rx265_tgt, $I11, 6
    ne $S10, "unless", rx265_fail
    add rx265_pos, 6
    set_addr $I10, rxcap_269_fail
    ($I12, $I11) = rx265_cur."!mark_peek"($I10)
    rx265_cur."!cursor_pos"($I11)
    ($P10) = rx265_cur."!cursor_start"()
    $P10."!cursor_pass"(rx265_pos, "")
    rx265_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_269_done
  rxcap_269_fail:
    goto rx265_fail
  rxcap_269_done:
  # rx charclass s
    ge rx265_pos, rx265_eos, rx265_fail
    sub $I10, rx265_pos, rx265_off
    is_cclass $I11, 32, rx265_tgt, $I10
    unless $I11, rx265_fail
    inc rx265_pos
  # rx subrule "ws" subtype=method negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."ws"()
    unless $P10, rx265_fail
    rx265_pos = $P10."pos"()
.annotate "line", 157
  # rx subrule "xblock" subtype=capture negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."xblock"()
    unless $P10, rx265_fail
    rx265_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx265_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."ws"()
    unless $P10, rx265_fail
    rx265_pos = $P10."pos"()
  alt272_0:
.annotate "line", 158
    set_addr $I10, alt272_1
    rx265_cur."!mark_push"(0, rx265_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."ws"()
    unless $P10, rx265_fail
    rx265_pos = $P10."pos"()
  # rx subrule "before" subtype=zerowidth negate=1
    rx265_cur."!cursor_pos"(rx265_pos)
    .const 'Sub' $P275 = "64_1266334190.64822" 
    capture_lex $P275
    $P10 = rx265_cur."before"($P275)
    if $P10, rx265_fail
  # rx subrule "ws" subtype=method negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."ws"()
    unless $P10, rx265_fail
    rx265_pos = $P10."pos"()
    goto alt272_end
  alt272_1:
  # rx subrule "ws" subtype=method negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."ws"()
    unless $P10, rx265_fail
    rx265_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."panic"("unless does not take \"else\", please rewrite using \"if\"")
    unless $P10, rx265_fail
    rx265_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."ws"()
    unless $P10, rx265_fail
    rx265_pos = $P10."pos"()
  alt272_end:
  # rx subrule "ws" subtype=method negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."ws"()
    unless $P10, rx265_fail
    rx265_pos = $P10."pos"()
.annotate "line", 155
  # rx pass
    rx265_cur."!cursor_pass"(rx265_pos, "statement_control:sym<unless>")
    rx265_cur."!cursor_debug"("PASS  ", "statement_control:sym<unless>", " at pos=", rx265_pos)
    .return (rx265_cur)
  rx265_fail:
.annotate "line", 4
    (rx265_rep, rx265_pos, $I10, $P10) = rx265_cur."!mark_fail"(0)
    lt rx265_pos, -1, rx265_done
    eq rx265_pos, -1, rx265_fail
    jump $I10
  rx265_done:
    rx265_cur."!cursor_fail"()
    rx265_cur."!cursor_debug"("FAIL  ", "statement_control:sym<unless>")
    .return (rx265_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<unless>"  :subid("63_1266334190.64822") :method
.annotate "line", 4
    new $P267, "ResizablePMCArray"
    push $P267, "unless"
    .return ($P267)
.end


.namespace ["NQP";"Grammar"]
.sub "_block274"  :anon :subid("64_1266334190.64822") :method :outer("62_1266334190.64822")
.annotate "line", 158
    .local string rx276_tgt
    .local int rx276_pos
    .local int rx276_off
    .local int rx276_eos
    .local int rx276_rep
    .local pmc rx276_cur
    (rx276_cur, rx276_pos, rx276_tgt) = self."!cursor_start"()
    rx276_cur."!cursor_debug"("START ", "")
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
    ne $I10, -1, rxscan277_done
    goto rxscan277_scan
  rxscan277_loop:
    ($P10) = rx276_cur."from"()
    inc $P10
    set rx276_pos, $P10
    ge rx276_pos, rx276_eos, rxscan277_done
  rxscan277_scan:
    set_addr $I10, rxscan277_loop
    rx276_cur."!mark_push"(0, rx276_pos, $I10)
  rxscan277_done:
  # rx literal  "else"
    add $I11, rx276_pos, 4
    gt $I11, rx276_eos, rx276_fail
    sub $I11, rx276_pos, rx276_off
    substr $S10, rx276_tgt, $I11, 4
    ne $S10, "else", rx276_fail
    add rx276_pos, 4
  # rx pass
    rx276_cur."!cursor_pass"(rx276_pos, "")
    rx276_cur."!cursor_debug"("PASS  ", "", " at pos=", rx276_pos)
    .return (rx276_cur)
  rx276_fail:
    (rx276_rep, rx276_pos, $I10, $P10) = rx276_cur."!mark_fail"(0)
    lt rx276_pos, -1, rx276_done
    eq rx276_pos, -1, rx276_fail
    jump $I10
  rx276_done:
    rx276_cur."!cursor_fail"()
    rx276_cur."!cursor_debug"("FAIL  ", "")
    .return (rx276_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<while>"  :subid("65_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx283_tgt
    .local int rx283_pos
    .local int rx283_off
    .local int rx283_eos
    .local int rx283_rep
    .local pmc rx283_cur
    (rx283_cur, rx283_pos, rx283_tgt) = self."!cursor_start"()
    rx283_cur."!cursor_debug"("START ", "statement_control:sym<while>")
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
    ne $I10, -1, rxscan286_done
    goto rxscan286_scan
  rxscan286_loop:
    ($P10) = rx283_cur."from"()
    inc $P10
    set rx283_pos, $P10
    ge rx283_pos, rx283_eos, rxscan286_done
  rxscan286_scan:
    set_addr $I10, rxscan286_loop
    rx283_cur."!mark_push"(0, rx283_pos, $I10)
  rxscan286_done:
.annotate "line", 162
  # rx subcapture "sym"
    set_addr $I10, rxcap_288_fail
    rx283_cur."!mark_push"(0, rx283_pos, $I10)
  alt287_0:
    set_addr $I10, alt287_1
    rx283_cur."!mark_push"(0, rx283_pos, $I10)
  # rx literal  "while"
    add $I11, rx283_pos, 5
    gt $I11, rx283_eos, rx283_fail
    sub $I11, rx283_pos, rx283_off
    substr $S10, rx283_tgt, $I11, 5
    ne $S10, "while", rx283_fail
    add rx283_pos, 5
    goto alt287_end
  alt287_1:
  # rx literal  "until"
    add $I11, rx283_pos, 5
    gt $I11, rx283_eos, rx283_fail
    sub $I11, rx283_pos, rx283_off
    substr $S10, rx283_tgt, $I11, 5
    ne $S10, "until", rx283_fail
    add rx283_pos, 5
  alt287_end:
    set_addr $I10, rxcap_288_fail
    ($I12, $I11) = rx283_cur."!mark_peek"($I10)
    rx283_cur."!cursor_pos"($I11)
    ($P10) = rx283_cur."!cursor_start"()
    $P10."!cursor_pass"(rx283_pos, "")
    rx283_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_288_done
  rxcap_288_fail:
    goto rx283_fail
  rxcap_288_done:
  # rx charclass s
    ge rx283_pos, rx283_eos, rx283_fail
    sub $I10, rx283_pos, rx283_off
    is_cclass $I11, 32, rx283_tgt, $I10
    unless $I11, rx283_fail
    inc rx283_pos
  # rx subrule "ws" subtype=method negate=
    rx283_cur."!cursor_pos"(rx283_pos)
    $P10 = rx283_cur."ws"()
    unless $P10, rx283_fail
    rx283_pos = $P10."pos"()
.annotate "line", 163
  # rx subrule "xblock" subtype=capture negate=
    rx283_cur."!cursor_pos"(rx283_pos)
    $P10 = rx283_cur."xblock"()
    unless $P10, rx283_fail
    rx283_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx283_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx283_cur."!cursor_pos"(rx283_pos)
    $P10 = rx283_cur."ws"()
    unless $P10, rx283_fail
    rx283_pos = $P10."pos"()
.annotate "line", 161
  # rx pass
    rx283_cur."!cursor_pass"(rx283_pos, "statement_control:sym<while>")
    rx283_cur."!cursor_debug"("PASS  ", "statement_control:sym<while>", " at pos=", rx283_pos)
    .return (rx283_cur)
  rx283_fail:
.annotate "line", 4
    (rx283_rep, rx283_pos, $I10, $P10) = rx283_cur."!mark_fail"(0)
    lt rx283_pos, -1, rx283_done
    eq rx283_pos, -1, rx283_fail
    jump $I10
  rx283_done:
    rx283_cur."!cursor_fail"()
    rx283_cur."!cursor_debug"("FAIL  ", "statement_control:sym<while>")
    .return (rx283_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<while>"  :subid("66_1266334190.64822") :method
.annotate "line", 4
    new $P285, "ResizablePMCArray"
    push $P285, "until"
    push $P285, "while"
    .return ($P285)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("67_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx292_tgt
    .local int rx292_pos
    .local int rx292_off
    .local int rx292_eos
    .local int rx292_rep
    .local pmc rx292_cur
    (rx292_cur, rx292_pos, rx292_tgt) = self."!cursor_start"()
    rx292_cur."!cursor_debug"("START ", "statement_control:sym<repeat>")
    .lex unicode:"$\x{a2}", rx292_cur
    .local pmc match
    .lex "$/", match
    length rx292_eos, rx292_tgt
    set rx292_off, 0
    lt rx292_pos, 2, rx292_start
    sub rx292_off, rx292_pos, 1
    substr rx292_tgt, rx292_tgt, rx292_off
  rx292_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan295_done
    goto rxscan295_scan
  rxscan295_loop:
    ($P10) = rx292_cur."from"()
    inc $P10
    set rx292_pos, $P10
    ge rx292_pos, rx292_eos, rxscan295_done
  rxscan295_scan:
    set_addr $I10, rxscan295_loop
    rx292_cur."!mark_push"(0, rx292_pos, $I10)
  rxscan295_done:
.annotate "line", 167
  # rx subcapture "sym"
    set_addr $I10, rxcap_296_fail
    rx292_cur."!mark_push"(0, rx292_pos, $I10)
  # rx literal  "repeat"
    add $I11, rx292_pos, 6
    gt $I11, rx292_eos, rx292_fail
    sub $I11, rx292_pos, rx292_off
    substr $S10, rx292_tgt, $I11, 6
    ne $S10, "repeat", rx292_fail
    add rx292_pos, 6
    set_addr $I10, rxcap_296_fail
    ($I12, $I11) = rx292_cur."!mark_peek"($I10)
    rx292_cur."!cursor_pos"($I11)
    ($P10) = rx292_cur."!cursor_start"()
    $P10."!cursor_pass"(rx292_pos, "")
    rx292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_296_done
  rxcap_296_fail:
    goto rx292_fail
  rxcap_296_done:
  # rx charclass s
    ge rx292_pos, rx292_eos, rx292_fail
    sub $I10, rx292_pos, rx292_off
    is_cclass $I11, 32, rx292_tgt, $I10
    unless $I11, rx292_fail
    inc rx292_pos
  # rx subrule "ws" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."ws"()
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
  alt298_0:
.annotate "line", 168
    set_addr $I10, alt298_1
    rx292_cur."!mark_push"(0, rx292_pos, $I10)
.annotate "line", 169
  # rx subrule "ws" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."ws"()
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_301_fail
    rx292_cur."!mark_push"(0, rx292_pos, $I10)
  alt300_0:
    set_addr $I10, alt300_1
    rx292_cur."!mark_push"(0, rx292_pos, $I10)
  # rx literal  "while"
    add $I11, rx292_pos, 5
    gt $I11, rx292_eos, rx292_fail
    sub $I11, rx292_pos, rx292_off
    substr $S10, rx292_tgt, $I11, 5
    ne $S10, "while", rx292_fail
    add rx292_pos, 5
    goto alt300_end
  alt300_1:
  # rx literal  "until"
    add $I11, rx292_pos, 5
    gt $I11, rx292_eos, rx292_fail
    sub $I11, rx292_pos, rx292_off
    substr $S10, rx292_tgt, $I11, 5
    ne $S10, "until", rx292_fail
    add rx292_pos, 5
  alt300_end:
    set_addr $I10, rxcap_301_fail
    ($I12, $I11) = rx292_cur."!mark_peek"($I10)
    rx292_cur."!cursor_pos"($I11)
    ($P10) = rx292_cur."!cursor_start"()
    $P10."!cursor_pass"(rx292_pos, "")
    rx292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_301_done
  rxcap_301_fail:
    goto rx292_fail
  rxcap_301_done:
  # rx charclass s
    ge rx292_pos, rx292_eos, rx292_fail
    sub $I10, rx292_pos, rx292_off
    is_cclass $I11, 32, rx292_tgt, $I10
    unless $I11, rx292_fail
    inc rx292_pos
  # rx subrule "ws" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."ws"()
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."xblock"()
    unless $P10, rx292_fail
    rx292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx292_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."ws"()
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
    goto alt298_end
  alt298_1:
.annotate "line", 170
  # rx subrule "ws" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."ws"()
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."pblock"()
    unless $P10, rx292_fail
    rx292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx292_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."ws"()
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_307_fail
    rx292_cur."!mark_push"(0, rx292_pos, $I10)
  alt306_0:
    set_addr $I10, alt306_1
    rx292_cur."!mark_push"(0, rx292_pos, $I10)
  # rx literal  "while"
    add $I11, rx292_pos, 5
    gt $I11, rx292_eos, rx292_fail
    sub $I11, rx292_pos, rx292_off
    substr $S10, rx292_tgt, $I11, 5
    ne $S10, "while", rx292_fail
    add rx292_pos, 5
    goto alt306_end
  alt306_1:
  # rx literal  "until"
    add $I11, rx292_pos, 5
    gt $I11, rx292_eos, rx292_fail
    sub $I11, rx292_pos, rx292_off
    substr $S10, rx292_tgt, $I11, 5
    ne $S10, "until", rx292_fail
    add rx292_pos, 5
  alt306_end:
    set_addr $I10, rxcap_307_fail
    ($I12, $I11) = rx292_cur."!mark_peek"($I10)
    rx292_cur."!cursor_pos"($I11)
    ($P10) = rx292_cur."!cursor_start"()
    $P10."!cursor_pass"(rx292_pos, "")
    rx292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_307_done
  rxcap_307_fail:
    goto rx292_fail
  rxcap_307_done:
  # rx charclass s
    ge rx292_pos, rx292_eos, rx292_fail
    sub $I10, rx292_pos, rx292_off
    is_cclass $I11, 32, rx292_tgt, $I10
    unless $I11, rx292_fail
    inc rx292_pos
  # rx subrule "ws" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."ws"()
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."EXPR"()
    unless $P10, rx292_fail
    rx292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx292_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."ws"()
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
  alt298_end:
.annotate "line", 171
  # rx subrule "ws" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."ws"()
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
.annotate "line", 166
  # rx pass
    rx292_cur."!cursor_pass"(rx292_pos, "statement_control:sym<repeat>")
    rx292_cur."!cursor_debug"("PASS  ", "statement_control:sym<repeat>", " at pos=", rx292_pos)
    .return (rx292_cur)
  rx292_fail:
.annotate "line", 4
    (rx292_rep, rx292_pos, $I10, $P10) = rx292_cur."!mark_fail"(0)
    lt rx292_pos, -1, rx292_done
    eq rx292_pos, -1, rx292_fail
    jump $I10
  rx292_done:
    rx292_cur."!cursor_fail"()
    rx292_cur."!cursor_debug"("FAIL  ", "statement_control:sym<repeat>")
    .return (rx292_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("68_1266334190.64822") :method
.annotate "line", 4
    new $P294, "ResizablePMCArray"
    push $P294, "repeat"
    .return ($P294)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("69_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx312_tgt
    .local int rx312_pos
    .local int rx312_off
    .local int rx312_eos
    .local int rx312_rep
    .local pmc rx312_cur
    (rx312_cur, rx312_pos, rx312_tgt) = self."!cursor_start"()
    rx312_cur."!cursor_debug"("START ", "statement_control:sym<for>")
    .lex unicode:"$\x{a2}", rx312_cur
    .local pmc match
    .lex "$/", match
    length rx312_eos, rx312_tgt
    set rx312_off, 0
    lt rx312_pos, 2, rx312_start
    sub rx312_off, rx312_pos, 1
    substr rx312_tgt, rx312_tgt, rx312_off
  rx312_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan315_done
    goto rxscan315_scan
  rxscan315_loop:
    ($P10) = rx312_cur."from"()
    inc $P10
    set rx312_pos, $P10
    ge rx312_pos, rx312_eos, rxscan315_done
  rxscan315_scan:
    set_addr $I10, rxscan315_loop
    rx312_cur."!mark_push"(0, rx312_pos, $I10)
  rxscan315_done:
.annotate "line", 175
  # rx subcapture "sym"
    set_addr $I10, rxcap_316_fail
    rx312_cur."!mark_push"(0, rx312_pos, $I10)
  # rx literal  "for"
    add $I11, rx312_pos, 3
    gt $I11, rx312_eos, rx312_fail
    sub $I11, rx312_pos, rx312_off
    substr $S10, rx312_tgt, $I11, 3
    ne $S10, "for", rx312_fail
    add rx312_pos, 3
    set_addr $I10, rxcap_316_fail
    ($I12, $I11) = rx312_cur."!mark_peek"($I10)
    rx312_cur."!cursor_pos"($I11)
    ($P10) = rx312_cur."!cursor_start"()
    $P10."!cursor_pass"(rx312_pos, "")
    rx312_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_316_done
  rxcap_316_fail:
    goto rx312_fail
  rxcap_316_done:
  # rx charclass s
    ge rx312_pos, rx312_eos, rx312_fail
    sub $I10, rx312_pos, rx312_off
    is_cclass $I11, 32, rx312_tgt, $I10
    unless $I11, rx312_fail
    inc rx312_pos
  # rx subrule "ws" subtype=method negate=
    rx312_cur."!cursor_pos"(rx312_pos)
    $P10 = rx312_cur."ws"()
    unless $P10, rx312_fail
    rx312_pos = $P10."pos"()
.annotate "line", 176
  # rx subrule "xblock" subtype=capture negate=
    rx312_cur."!cursor_pos"(rx312_pos)
    $P10 = rx312_cur."xblock"()
    unless $P10, rx312_fail
    rx312_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx312_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx312_cur."!cursor_pos"(rx312_pos)
    $P10 = rx312_cur."ws"()
    unless $P10, rx312_fail
    rx312_pos = $P10."pos"()
.annotate "line", 174
  # rx pass
    rx312_cur."!cursor_pass"(rx312_pos, "statement_control:sym<for>")
    rx312_cur."!cursor_debug"("PASS  ", "statement_control:sym<for>", " at pos=", rx312_pos)
    .return (rx312_cur)
  rx312_fail:
.annotate "line", 4
    (rx312_rep, rx312_pos, $I10, $P10) = rx312_cur."!mark_fail"(0)
    lt rx312_pos, -1, rx312_done
    eq rx312_pos, -1, rx312_fail
    jump $I10
  rx312_done:
    rx312_cur."!cursor_fail"()
    rx312_cur."!cursor_debug"("FAIL  ", "statement_control:sym<for>")
    .return (rx312_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<for>"  :subid("70_1266334190.64822") :method
.annotate "line", 4
    new $P314, "ResizablePMCArray"
    push $P314, "for"
    .return ($P314)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CATCH>"  :subid("71_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx320_tgt
    .local int rx320_pos
    .local int rx320_off
    .local int rx320_eos
    .local int rx320_rep
    .local pmc rx320_cur
    (rx320_cur, rx320_pos, rx320_tgt) = self."!cursor_start"()
    rx320_cur."!cursor_debug"("START ", "statement_control:sym<CATCH>")
    .lex unicode:"$\x{a2}", rx320_cur
    .local pmc match
    .lex "$/", match
    length rx320_eos, rx320_tgt
    set rx320_off, 0
    lt rx320_pos, 2, rx320_start
    sub rx320_off, rx320_pos, 1
    substr rx320_tgt, rx320_tgt, rx320_off
  rx320_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan323_done
    goto rxscan323_scan
  rxscan323_loop:
    ($P10) = rx320_cur."from"()
    inc $P10
    set rx320_pos, $P10
    ge rx320_pos, rx320_eos, rxscan323_done
  rxscan323_scan:
    set_addr $I10, rxscan323_loop
    rx320_cur."!mark_push"(0, rx320_pos, $I10)
  rxscan323_done:
.annotate "line", 180
  # rx subcapture "sym"
    set_addr $I10, rxcap_324_fail
    rx320_cur."!mark_push"(0, rx320_pos, $I10)
  # rx literal  "CATCH"
    add $I11, rx320_pos, 5
    gt $I11, rx320_eos, rx320_fail
    sub $I11, rx320_pos, rx320_off
    substr $S10, rx320_tgt, $I11, 5
    ne $S10, "CATCH", rx320_fail
    add rx320_pos, 5
    set_addr $I10, rxcap_324_fail
    ($I12, $I11) = rx320_cur."!mark_peek"($I10)
    rx320_cur."!cursor_pos"($I11)
    ($P10) = rx320_cur."!cursor_start"()
    $P10."!cursor_pass"(rx320_pos, "")
    rx320_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_324_done
  rxcap_324_fail:
    goto rx320_fail
  rxcap_324_done:
  # rx charclass s
    ge rx320_pos, rx320_eos, rx320_fail
    sub $I10, rx320_pos, rx320_off
    is_cclass $I11, 32, rx320_tgt, $I10
    unless $I11, rx320_fail
    inc rx320_pos
  # rx subrule "ws" subtype=method negate=
    rx320_cur."!cursor_pos"(rx320_pos)
    $P10 = rx320_cur."ws"()
    unless $P10, rx320_fail
    rx320_pos = $P10."pos"()
.annotate "line", 181
  # rx subrule "block" subtype=capture negate=
    rx320_cur."!cursor_pos"(rx320_pos)
    $P10 = rx320_cur."block"()
    unless $P10, rx320_fail
    rx320_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx320_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx320_cur."!cursor_pos"(rx320_pos)
    $P10 = rx320_cur."ws"()
    unless $P10, rx320_fail
    rx320_pos = $P10."pos"()
.annotate "line", 179
  # rx pass
    rx320_cur."!cursor_pass"(rx320_pos, "statement_control:sym<CATCH>")
    rx320_cur."!cursor_debug"("PASS  ", "statement_control:sym<CATCH>", " at pos=", rx320_pos)
    .return (rx320_cur)
  rx320_fail:
.annotate "line", 4
    (rx320_rep, rx320_pos, $I10, $P10) = rx320_cur."!mark_fail"(0)
    lt rx320_pos, -1, rx320_done
    eq rx320_pos, -1, rx320_fail
    jump $I10
  rx320_done:
    rx320_cur."!cursor_fail"()
    rx320_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CATCH>")
    .return (rx320_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CATCH>"  :subid("72_1266334190.64822") :method
.annotate "line", 4
    new $P322, "ResizablePMCArray"
    push $P322, "CATCH"
    .return ($P322)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CONTROL>"  :subid("73_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx328_tgt
    .local int rx328_pos
    .local int rx328_off
    .local int rx328_eos
    .local int rx328_rep
    .local pmc rx328_cur
    (rx328_cur, rx328_pos, rx328_tgt) = self."!cursor_start"()
    rx328_cur."!cursor_debug"("START ", "statement_control:sym<CONTROL>")
    .lex unicode:"$\x{a2}", rx328_cur
    .local pmc match
    .lex "$/", match
    length rx328_eos, rx328_tgt
    set rx328_off, 0
    lt rx328_pos, 2, rx328_start
    sub rx328_off, rx328_pos, 1
    substr rx328_tgt, rx328_tgt, rx328_off
  rx328_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan331_done
    goto rxscan331_scan
  rxscan331_loop:
    ($P10) = rx328_cur."from"()
    inc $P10
    set rx328_pos, $P10
    ge rx328_pos, rx328_eos, rxscan331_done
  rxscan331_scan:
    set_addr $I10, rxscan331_loop
    rx328_cur."!mark_push"(0, rx328_pos, $I10)
  rxscan331_done:
.annotate "line", 185
  # rx subcapture "sym"
    set_addr $I10, rxcap_332_fail
    rx328_cur."!mark_push"(0, rx328_pos, $I10)
  # rx literal  "CONTROL"
    add $I11, rx328_pos, 7
    gt $I11, rx328_eos, rx328_fail
    sub $I11, rx328_pos, rx328_off
    substr $S10, rx328_tgt, $I11, 7
    ne $S10, "CONTROL", rx328_fail
    add rx328_pos, 7
    set_addr $I10, rxcap_332_fail
    ($I12, $I11) = rx328_cur."!mark_peek"($I10)
    rx328_cur."!cursor_pos"($I11)
    ($P10) = rx328_cur."!cursor_start"()
    $P10."!cursor_pass"(rx328_pos, "")
    rx328_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_332_done
  rxcap_332_fail:
    goto rx328_fail
  rxcap_332_done:
  # rx charclass s
    ge rx328_pos, rx328_eos, rx328_fail
    sub $I10, rx328_pos, rx328_off
    is_cclass $I11, 32, rx328_tgt, $I10
    unless $I11, rx328_fail
    inc rx328_pos
  # rx subrule "ws" subtype=method negate=
    rx328_cur."!cursor_pos"(rx328_pos)
    $P10 = rx328_cur."ws"()
    unless $P10, rx328_fail
    rx328_pos = $P10."pos"()
.annotate "line", 186
  # rx subrule "block" subtype=capture negate=
    rx328_cur."!cursor_pos"(rx328_pos)
    $P10 = rx328_cur."block"()
    unless $P10, rx328_fail
    rx328_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx328_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx328_cur."!cursor_pos"(rx328_pos)
    $P10 = rx328_cur."ws"()
    unless $P10, rx328_fail
    rx328_pos = $P10."pos"()
.annotate "line", 184
  # rx pass
    rx328_cur."!cursor_pass"(rx328_pos, "statement_control:sym<CONTROL>")
    rx328_cur."!cursor_debug"("PASS  ", "statement_control:sym<CONTROL>", " at pos=", rx328_pos)
    .return (rx328_cur)
  rx328_fail:
.annotate "line", 4
    (rx328_rep, rx328_pos, $I10, $P10) = rx328_cur."!mark_fail"(0)
    lt rx328_pos, -1, rx328_done
    eq rx328_pos, -1, rx328_fail
    jump $I10
  rx328_done:
    rx328_cur."!cursor_fail"()
    rx328_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CONTROL>")
    .return (rx328_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CONTROL>"  :subid("74_1266334190.64822") :method
.annotate "line", 4
    new $P330, "ResizablePMCArray"
    push $P330, "CONTROL"
    .return ($P330)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("75_1266334190.64822") :method
.annotate "line", 189
    $P336 = self."!protoregex"("statement_prefix")
    .return ($P336)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("76_1266334190.64822") :method
.annotate "line", 189
    $P338 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P338)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("77_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx340_tgt
    .local int rx340_pos
    .local int rx340_off
    .local int rx340_eos
    .local int rx340_rep
    .local pmc rx340_cur
    (rx340_cur, rx340_pos, rx340_tgt) = self."!cursor_start"()
    rx340_cur."!cursor_debug"("START ", "statement_prefix:sym<INIT>")
    .lex unicode:"$\x{a2}", rx340_cur
    .local pmc match
    .lex "$/", match
    length rx340_eos, rx340_tgt
    set rx340_off, 0
    lt rx340_pos, 2, rx340_start
    sub rx340_off, rx340_pos, 1
    substr rx340_tgt, rx340_tgt, rx340_off
  rx340_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan344_done
    goto rxscan344_scan
  rxscan344_loop:
    ($P10) = rx340_cur."from"()
    inc $P10
    set rx340_pos, $P10
    ge rx340_pos, rx340_eos, rxscan344_done
  rxscan344_scan:
    set_addr $I10, rxscan344_loop
    rx340_cur."!mark_push"(0, rx340_pos, $I10)
  rxscan344_done:
.annotate "line", 190
  # rx subcapture "sym"
    set_addr $I10, rxcap_345_fail
    rx340_cur."!mark_push"(0, rx340_pos, $I10)
  # rx literal  "INIT"
    add $I11, rx340_pos, 4
    gt $I11, rx340_eos, rx340_fail
    sub $I11, rx340_pos, rx340_off
    substr $S10, rx340_tgt, $I11, 4
    ne $S10, "INIT", rx340_fail
    add rx340_pos, 4
    set_addr $I10, rxcap_345_fail
    ($I12, $I11) = rx340_cur."!mark_peek"($I10)
    rx340_cur."!cursor_pos"($I11)
    ($P10) = rx340_cur."!cursor_start"()
    $P10."!cursor_pass"(rx340_pos, "")
    rx340_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_345_done
  rxcap_345_fail:
    goto rx340_fail
  rxcap_345_done:
  # rx subrule "blorst" subtype=capture negate=
    rx340_cur."!cursor_pos"(rx340_pos)
    $P10 = rx340_cur."blorst"()
    unless $P10, rx340_fail
    rx340_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx340_pos = $P10."pos"()
  # rx pass
    rx340_cur."!cursor_pass"(rx340_pos, "statement_prefix:sym<INIT>")
    rx340_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<INIT>", " at pos=", rx340_pos)
    .return (rx340_cur)
  rx340_fail:
.annotate "line", 4
    (rx340_rep, rx340_pos, $I10, $P10) = rx340_cur."!mark_fail"(0)
    lt rx340_pos, -1, rx340_done
    eq rx340_pos, -1, rx340_fail
    jump $I10
  rx340_done:
    rx340_cur."!cursor_fail"()
    rx340_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<INIT>")
    .return (rx340_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("78_1266334190.64822") :method
.annotate "line", 4
    $P342 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P343, "ResizablePMCArray"
    push $P343, $P342
    .return ($P343)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<try>"  :subid("79_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx347_tgt
    .local int rx347_pos
    .local int rx347_off
    .local int rx347_eos
    .local int rx347_rep
    .local pmc rx347_cur
    (rx347_cur, rx347_pos, rx347_tgt) = self."!cursor_start"()
    rx347_cur."!cursor_debug"("START ", "statement_prefix:sym<try>")
    .lex unicode:"$\x{a2}", rx347_cur
    .local pmc match
    .lex "$/", match
    length rx347_eos, rx347_tgt
    set rx347_off, 0
    lt rx347_pos, 2, rx347_start
    sub rx347_off, rx347_pos, 1
    substr rx347_tgt, rx347_tgt, rx347_off
  rx347_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan351_done
    goto rxscan351_scan
  rxscan351_loop:
    ($P10) = rx347_cur."from"()
    inc $P10
    set rx347_pos, $P10
    ge rx347_pos, rx347_eos, rxscan351_done
  rxscan351_scan:
    set_addr $I10, rxscan351_loop
    rx347_cur."!mark_push"(0, rx347_pos, $I10)
  rxscan351_done:
.annotate "line", 193
  # rx subcapture "sym"
    set_addr $I10, rxcap_352_fail
    rx347_cur."!mark_push"(0, rx347_pos, $I10)
  # rx literal  "try"
    add $I11, rx347_pos, 3
    gt $I11, rx347_eos, rx347_fail
    sub $I11, rx347_pos, rx347_off
    substr $S10, rx347_tgt, $I11, 3
    ne $S10, "try", rx347_fail
    add rx347_pos, 3
    set_addr $I10, rxcap_352_fail
    ($I12, $I11) = rx347_cur."!mark_peek"($I10)
    rx347_cur."!cursor_pos"($I11)
    ($P10) = rx347_cur."!cursor_start"()
    $P10."!cursor_pass"(rx347_pos, "")
    rx347_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_352_done
  rxcap_352_fail:
    goto rx347_fail
  rxcap_352_done:
.annotate "line", 194
  # rx subrule "blorst" subtype=capture negate=
    rx347_cur."!cursor_pos"(rx347_pos)
    $P10 = rx347_cur."blorst"()
    unless $P10, rx347_fail
    rx347_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx347_pos = $P10."pos"()
.annotate "line", 192
  # rx pass
    rx347_cur."!cursor_pass"(rx347_pos, "statement_prefix:sym<try>")
    rx347_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<try>", " at pos=", rx347_pos)
    .return (rx347_cur)
  rx347_fail:
.annotate "line", 4
    (rx347_rep, rx347_pos, $I10, $P10) = rx347_cur."!mark_fail"(0)
    lt rx347_pos, -1, rx347_done
    eq rx347_pos, -1, rx347_fail
    jump $I10
  rx347_done:
    rx347_cur."!cursor_fail"()
    rx347_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<try>")
    .return (rx347_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<try>"  :subid("80_1266334190.64822") :method
.annotate "line", 4
    $P349 = self."!PREFIX__!subrule"("blorst", "try")
    new $P350, "ResizablePMCArray"
    push $P350, $P349
    .return ($P350)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("81_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx354_tgt
    .local int rx354_pos
    .local int rx354_off
    .local int rx354_eos
    .local int rx354_rep
    .local pmc rx354_cur
    (rx354_cur, rx354_pos, rx354_tgt) = self."!cursor_start"()
    rx354_cur."!cursor_debug"("START ", "blorst")
    .lex unicode:"$\x{a2}", rx354_cur
    .local pmc match
    .lex "$/", match
    length rx354_eos, rx354_tgt
    set rx354_off, 0
    lt rx354_pos, 2, rx354_start
    sub rx354_off, rx354_pos, 1
    substr rx354_tgt, rx354_tgt, rx354_off
  rx354_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan357_done
    goto rxscan357_scan
  rxscan357_loop:
    ($P10) = rx354_cur."from"()
    inc $P10
    set rx354_pos, $P10
    ge rx354_pos, rx354_eos, rxscan357_done
  rxscan357_scan:
    set_addr $I10, rxscan357_loop
    rx354_cur."!mark_push"(0, rx354_pos, $I10)
  rxscan357_done:
.annotate "line", 198
  # rx charclass s
    ge rx354_pos, rx354_eos, rx354_fail
    sub $I10, rx354_pos, rx354_off
    is_cclass $I11, 32, rx354_tgt, $I10
    unless $I11, rx354_fail
    inc rx354_pos
  # rx subrule "ws" subtype=method negate=
    rx354_cur."!cursor_pos"(rx354_pos)
    $P10 = rx354_cur."ws"()
    unless $P10, rx354_fail
    rx354_pos = $P10."pos"()
  alt358_0:
    set_addr $I10, alt358_1
    rx354_cur."!mark_push"(0, rx354_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx354_pos, rx354_eos, rx354_fail
    sub $I10, rx354_pos, rx354_off
    substr $S10, rx354_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx354_fail
  # rx subrule "block" subtype=capture negate=
    rx354_cur."!cursor_pos"(rx354_pos)
    $P10 = rx354_cur."block"()
    unless $P10, rx354_fail
    rx354_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx354_pos = $P10."pos"()
    goto alt358_end
  alt358_1:
  # rx subrule "statement" subtype=capture negate=
    rx354_cur."!cursor_pos"(rx354_pos)
    $P10 = rx354_cur."statement"()
    unless $P10, rx354_fail
    rx354_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx354_pos = $P10."pos"()
  alt358_end:
.annotate "line", 197
  # rx pass
    rx354_cur."!cursor_pass"(rx354_pos, "blorst")
    rx354_cur."!cursor_debug"("PASS  ", "blorst", " at pos=", rx354_pos)
    .return (rx354_cur)
  rx354_fail:
.annotate "line", 4
    (rx354_rep, rx354_pos, $I10, $P10) = rx354_cur."!mark_fail"(0)
    lt rx354_pos, -1, rx354_done
    eq rx354_pos, -1, rx354_fail
    jump $I10
  rx354_done:
    rx354_cur."!cursor_fail"()
    rx354_cur."!cursor_debug"("FAIL  ", "blorst")
    .return (rx354_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blorst"  :subid("82_1266334190.64822") :method
.annotate "line", 4
    new $P356, "ResizablePMCArray"
    push $P356, ""
    .return ($P356)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("83_1266334190.64822") :method
.annotate "line", 203
    $P360 = self."!protoregex"("statement_mod_cond")
    .return ($P360)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("84_1266334190.64822") :method
.annotate "line", 203
    $P362 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P362)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("85_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx364_tgt
    .local int rx364_pos
    .local int rx364_off
    .local int rx364_eos
    .local int rx364_rep
    .local pmc rx364_cur
    (rx364_cur, rx364_pos, rx364_tgt) = self."!cursor_start"()
    rx364_cur."!cursor_debug"("START ", "statement_mod_cond:sym<if>")
    .lex unicode:"$\x{a2}", rx364_cur
    .local pmc match
    .lex "$/", match
    length rx364_eos, rx364_tgt
    set rx364_off, 0
    lt rx364_pos, 2, rx364_start
    sub rx364_off, rx364_pos, 1
    substr rx364_tgt, rx364_tgt, rx364_off
  rx364_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan367_done
    goto rxscan367_scan
  rxscan367_loop:
    ($P10) = rx364_cur."from"()
    inc $P10
    set rx364_pos, $P10
    ge rx364_pos, rx364_eos, rxscan367_done
  rxscan367_scan:
    set_addr $I10, rxscan367_loop
    rx364_cur."!mark_push"(0, rx364_pos, $I10)
  rxscan367_done:
.annotate "line", 205
  # rx subcapture "sym"
    set_addr $I10, rxcap_368_fail
    rx364_cur."!mark_push"(0, rx364_pos, $I10)
  # rx literal  "if"
    add $I11, rx364_pos, 2
    gt $I11, rx364_eos, rx364_fail
    sub $I11, rx364_pos, rx364_off
    substr $S10, rx364_tgt, $I11, 2
    ne $S10, "if", rx364_fail
    add rx364_pos, 2
    set_addr $I10, rxcap_368_fail
    ($I12, $I11) = rx364_cur."!mark_peek"($I10)
    rx364_cur."!cursor_pos"($I11)
    ($P10) = rx364_cur."!cursor_start"()
    $P10."!cursor_pass"(rx364_pos, "")
    rx364_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_368_done
  rxcap_368_fail:
    goto rx364_fail
  rxcap_368_done:
  # rx subrule "ws" subtype=method negate=
    rx364_cur."!cursor_pos"(rx364_pos)
    $P10 = rx364_cur."ws"()
    unless $P10, rx364_fail
    rx364_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx364_cur."!cursor_pos"(rx364_pos)
    $P10 = rx364_cur."EXPR"()
    unless $P10, rx364_fail
    rx364_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx364_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx364_cur."!cursor_pos"(rx364_pos)
    $P10 = rx364_cur."ws"()
    unless $P10, rx364_fail
    rx364_pos = $P10."pos"()
  # rx pass
    rx364_cur."!cursor_pass"(rx364_pos, "statement_mod_cond:sym<if>")
    rx364_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<if>", " at pos=", rx364_pos)
    .return (rx364_cur)
  rx364_fail:
.annotate "line", 4
    (rx364_rep, rx364_pos, $I10, $P10) = rx364_cur."!mark_fail"(0)
    lt rx364_pos, -1, rx364_done
    eq rx364_pos, -1, rx364_fail
    jump $I10
  rx364_done:
    rx364_cur."!cursor_fail"()
    rx364_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<if>")
    .return (rx364_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("86_1266334190.64822") :method
.annotate "line", 4
    new $P366, "ResizablePMCArray"
    push $P366, "if"
    .return ($P366)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("87_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx372_tgt
    .local int rx372_pos
    .local int rx372_off
    .local int rx372_eos
    .local int rx372_rep
    .local pmc rx372_cur
    (rx372_cur, rx372_pos, rx372_tgt) = self."!cursor_start"()
    rx372_cur."!cursor_debug"("START ", "statement_mod_cond:sym<unless>")
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
.annotate "line", 206
  # rx subcapture "sym"
    set_addr $I10, rxcap_376_fail
    rx372_cur."!mark_push"(0, rx372_pos, $I10)
  # rx literal  "unless"
    add $I11, rx372_pos, 6
    gt $I11, rx372_eos, rx372_fail
    sub $I11, rx372_pos, rx372_off
    substr $S10, rx372_tgt, $I11, 6
    ne $S10, "unless", rx372_fail
    add rx372_pos, 6
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
    rx372_cur."!cursor_pass"(rx372_pos, "statement_mod_cond:sym<unless>")
    rx372_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<unless>", " at pos=", rx372_pos)
    .return (rx372_cur)
  rx372_fail:
.annotate "line", 4
    (rx372_rep, rx372_pos, $I10, $P10) = rx372_cur."!mark_fail"(0)
    lt rx372_pos, -1, rx372_done
    eq rx372_pos, -1, rx372_fail
    jump $I10
  rx372_done:
    rx372_cur."!cursor_fail"()
    rx372_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<unless>")
    .return (rx372_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("88_1266334190.64822") :method
.annotate "line", 4
    new $P374, "ResizablePMCArray"
    push $P374, "unless"
    .return ($P374)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("89_1266334190.64822") :method
.annotate "line", 208
    $P380 = self."!protoregex"("statement_mod_loop")
    .return ($P380)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("90_1266334190.64822") :method
.annotate "line", 208
    $P382 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P382)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("91_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx384_tgt
    .local int rx384_pos
    .local int rx384_off
    .local int rx384_eos
    .local int rx384_rep
    .local pmc rx384_cur
    (rx384_cur, rx384_pos, rx384_tgt) = self."!cursor_start"()
    rx384_cur."!cursor_debug"("START ", "statement_mod_loop:sym<while>")
    .lex unicode:"$\x{a2}", rx384_cur
    .local pmc match
    .lex "$/", match
    length rx384_eos, rx384_tgt
    set rx384_off, 0
    lt rx384_pos, 2, rx384_start
    sub rx384_off, rx384_pos, 1
    substr rx384_tgt, rx384_tgt, rx384_off
  rx384_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan387_done
    goto rxscan387_scan
  rxscan387_loop:
    ($P10) = rx384_cur."from"()
    inc $P10
    set rx384_pos, $P10
    ge rx384_pos, rx384_eos, rxscan387_done
  rxscan387_scan:
    set_addr $I10, rxscan387_loop
    rx384_cur."!mark_push"(0, rx384_pos, $I10)
  rxscan387_done:
.annotate "line", 210
  # rx subcapture "sym"
    set_addr $I10, rxcap_388_fail
    rx384_cur."!mark_push"(0, rx384_pos, $I10)
  # rx literal  "while"
    add $I11, rx384_pos, 5
    gt $I11, rx384_eos, rx384_fail
    sub $I11, rx384_pos, rx384_off
    substr $S10, rx384_tgt, $I11, 5
    ne $S10, "while", rx384_fail
    add rx384_pos, 5
    set_addr $I10, rxcap_388_fail
    ($I12, $I11) = rx384_cur."!mark_peek"($I10)
    rx384_cur."!cursor_pos"($I11)
    ($P10) = rx384_cur."!cursor_start"()
    $P10."!cursor_pass"(rx384_pos, "")
    rx384_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_388_done
  rxcap_388_fail:
    goto rx384_fail
  rxcap_388_done:
  # rx subrule "ws" subtype=method negate=
    rx384_cur."!cursor_pos"(rx384_pos)
    $P10 = rx384_cur."ws"()
    unless $P10, rx384_fail
    rx384_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx384_cur."!cursor_pos"(rx384_pos)
    $P10 = rx384_cur."EXPR"()
    unless $P10, rx384_fail
    rx384_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx384_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx384_cur."!cursor_pos"(rx384_pos)
    $P10 = rx384_cur."ws"()
    unless $P10, rx384_fail
    rx384_pos = $P10."pos"()
  # rx pass
    rx384_cur."!cursor_pass"(rx384_pos, "statement_mod_loop:sym<while>")
    rx384_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<while>", " at pos=", rx384_pos)
    .return (rx384_cur)
  rx384_fail:
.annotate "line", 4
    (rx384_rep, rx384_pos, $I10, $P10) = rx384_cur."!mark_fail"(0)
    lt rx384_pos, -1, rx384_done
    eq rx384_pos, -1, rx384_fail
    jump $I10
  rx384_done:
    rx384_cur."!cursor_fail"()
    rx384_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<while>")
    .return (rx384_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("92_1266334190.64822") :method
.annotate "line", 4
    new $P386, "ResizablePMCArray"
    push $P386, "while"
    .return ($P386)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("93_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx392_tgt
    .local int rx392_pos
    .local int rx392_off
    .local int rx392_eos
    .local int rx392_rep
    .local pmc rx392_cur
    (rx392_cur, rx392_pos, rx392_tgt) = self."!cursor_start"()
    rx392_cur."!cursor_debug"("START ", "statement_mod_loop:sym<until>")
    .lex unicode:"$\x{a2}", rx392_cur
    .local pmc match
    .lex "$/", match
    length rx392_eos, rx392_tgt
    set rx392_off, 0
    lt rx392_pos, 2, rx392_start
    sub rx392_off, rx392_pos, 1
    substr rx392_tgt, rx392_tgt, rx392_off
  rx392_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan395_done
    goto rxscan395_scan
  rxscan395_loop:
    ($P10) = rx392_cur."from"()
    inc $P10
    set rx392_pos, $P10
    ge rx392_pos, rx392_eos, rxscan395_done
  rxscan395_scan:
    set_addr $I10, rxscan395_loop
    rx392_cur."!mark_push"(0, rx392_pos, $I10)
  rxscan395_done:
.annotate "line", 211
  # rx subcapture "sym"
    set_addr $I10, rxcap_396_fail
    rx392_cur."!mark_push"(0, rx392_pos, $I10)
  # rx literal  "until"
    add $I11, rx392_pos, 5
    gt $I11, rx392_eos, rx392_fail
    sub $I11, rx392_pos, rx392_off
    substr $S10, rx392_tgt, $I11, 5
    ne $S10, "until", rx392_fail
    add rx392_pos, 5
    set_addr $I10, rxcap_396_fail
    ($I12, $I11) = rx392_cur."!mark_peek"($I10)
    rx392_cur."!cursor_pos"($I11)
    ($P10) = rx392_cur."!cursor_start"()
    $P10."!cursor_pass"(rx392_pos, "")
    rx392_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_396_done
  rxcap_396_fail:
    goto rx392_fail
  rxcap_396_done:
  # rx subrule "ws" subtype=method negate=
    rx392_cur."!cursor_pos"(rx392_pos)
    $P10 = rx392_cur."ws"()
    unless $P10, rx392_fail
    rx392_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx392_cur."!cursor_pos"(rx392_pos)
    $P10 = rx392_cur."EXPR"()
    unless $P10, rx392_fail
    rx392_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx392_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx392_cur."!cursor_pos"(rx392_pos)
    $P10 = rx392_cur."ws"()
    unless $P10, rx392_fail
    rx392_pos = $P10."pos"()
  # rx pass
    rx392_cur."!cursor_pass"(rx392_pos, "statement_mod_loop:sym<until>")
    rx392_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<until>", " at pos=", rx392_pos)
    .return (rx392_cur)
  rx392_fail:
.annotate "line", 4
    (rx392_rep, rx392_pos, $I10, $P10) = rx392_cur."!mark_fail"(0)
    lt rx392_pos, -1, rx392_done
    eq rx392_pos, -1, rx392_fail
    jump $I10
  rx392_done:
    rx392_cur."!cursor_fail"()
    rx392_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<until>")
    .return (rx392_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("94_1266334190.64822") :method
.annotate "line", 4
    new $P394, "ResizablePMCArray"
    push $P394, "until"
    .return ($P394)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<fatarrow>"  :subid("95_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx400_tgt
    .local int rx400_pos
    .local int rx400_off
    .local int rx400_eos
    .local int rx400_rep
    .local pmc rx400_cur
    (rx400_cur, rx400_pos, rx400_tgt) = self."!cursor_start"()
    rx400_cur."!cursor_debug"("START ", "term:sym<fatarrow>")
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
.annotate "line", 215
  # rx subrule "fatarrow" subtype=capture negate=
    rx400_cur."!cursor_pos"(rx400_pos)
    $P10 = rx400_cur."fatarrow"()
    unless $P10, rx400_fail
    rx400_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("fatarrow")
    rx400_pos = $P10."pos"()
  # rx pass
    rx400_cur."!cursor_pass"(rx400_pos, "term:sym<fatarrow>")
    rx400_cur."!cursor_debug"("PASS  ", "term:sym<fatarrow>", " at pos=", rx400_pos)
    .return (rx400_cur)
  rx400_fail:
.annotate "line", 4
    (rx400_rep, rx400_pos, $I10, $P10) = rx400_cur."!mark_fail"(0)
    lt rx400_pos, -1, rx400_done
    eq rx400_pos, -1, rx400_fail
    jump $I10
  rx400_done:
    rx400_cur."!cursor_fail"()
    rx400_cur."!cursor_debug"("FAIL  ", "term:sym<fatarrow>")
    .return (rx400_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<fatarrow>"  :subid("96_1266334190.64822") :method
.annotate "line", 4
    $P402 = self."!PREFIX__!subrule"("fatarrow", "")
    new $P403, "ResizablePMCArray"
    push $P403, $P402
    .return ($P403)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("97_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx406_tgt
    .local int rx406_pos
    .local int rx406_off
    .local int rx406_eos
    .local int rx406_rep
    .local pmc rx406_cur
    (rx406_cur, rx406_pos, rx406_tgt) = self."!cursor_start"()
    rx406_cur."!cursor_debug"("START ", "term:sym<colonpair>")
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
.annotate "line", 216
  # rx subrule "colonpair" subtype=capture negate=
    rx406_cur."!cursor_pos"(rx406_pos)
    $P10 = rx406_cur."colonpair"()
    unless $P10, rx406_fail
    rx406_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx406_pos = $P10."pos"()
  # rx pass
    rx406_cur."!cursor_pass"(rx406_pos, "term:sym<colonpair>")
    rx406_cur."!cursor_debug"("PASS  ", "term:sym<colonpair>", " at pos=", rx406_pos)
    .return (rx406_cur)
  rx406_fail:
.annotate "line", 4
    (rx406_rep, rx406_pos, $I10, $P10) = rx406_cur."!mark_fail"(0)
    lt rx406_pos, -1, rx406_done
    eq rx406_pos, -1, rx406_fail
    jump $I10
  rx406_done:
    rx406_cur."!cursor_fail"()
    rx406_cur."!cursor_debug"("FAIL  ", "term:sym<colonpair>")
    .return (rx406_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("98_1266334190.64822") :method
.annotate "line", 4
    $P408 = self."!PREFIX__!subrule"("colonpair", "")
    new $P409, "ResizablePMCArray"
    push $P409, $P408
    .return ($P409)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("99_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx412_tgt
    .local int rx412_pos
    .local int rx412_off
    .local int rx412_eos
    .local int rx412_rep
    .local pmc rx412_cur
    (rx412_cur, rx412_pos, rx412_tgt) = self."!cursor_start"()
    rx412_cur."!cursor_debug"("START ", "term:sym<variable>")
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
.annotate "line", 217
  # rx subrule "variable" subtype=capture negate=
    rx412_cur."!cursor_pos"(rx412_pos)
    $P10 = rx412_cur."variable"()
    unless $P10, rx412_fail
    rx412_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx412_pos = $P10."pos"()
  # rx pass
    rx412_cur."!cursor_pass"(rx412_pos, "term:sym<variable>")
    rx412_cur."!cursor_debug"("PASS  ", "term:sym<variable>", " at pos=", rx412_pos)
    .return (rx412_cur)
  rx412_fail:
.annotate "line", 4
    (rx412_rep, rx412_pos, $I10, $P10) = rx412_cur."!mark_fail"(0)
    lt rx412_pos, -1, rx412_done
    eq rx412_pos, -1, rx412_fail
    jump $I10
  rx412_done:
    rx412_cur."!cursor_fail"()
    rx412_cur."!cursor_debug"("FAIL  ", "term:sym<variable>")
    .return (rx412_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("100_1266334190.64822") :method
.annotate "line", 4
    $P414 = self."!PREFIX__!subrule"("variable", "")
    new $P415, "ResizablePMCArray"
    push $P415, $P414
    .return ($P415)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("101_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx418_tgt
    .local int rx418_pos
    .local int rx418_off
    .local int rx418_eos
    .local int rx418_rep
    .local pmc rx418_cur
    (rx418_cur, rx418_pos, rx418_tgt) = self."!cursor_start"()
    rx418_cur."!cursor_debug"("START ", "term:sym<package_declarator>")
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
.annotate "line", 218
  # rx subrule "package_declarator" subtype=capture negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."package_declarator"()
    unless $P10, rx418_fail
    rx418_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx418_pos = $P10."pos"()
  # rx pass
    rx418_cur."!cursor_pass"(rx418_pos, "term:sym<package_declarator>")
    rx418_cur."!cursor_debug"("PASS  ", "term:sym<package_declarator>", " at pos=", rx418_pos)
    .return (rx418_cur)
  rx418_fail:
.annotate "line", 4
    (rx418_rep, rx418_pos, $I10, $P10) = rx418_cur."!mark_fail"(0)
    lt rx418_pos, -1, rx418_done
    eq rx418_pos, -1, rx418_fail
    jump $I10
  rx418_done:
    rx418_cur."!cursor_fail"()
    rx418_cur."!cursor_debug"("FAIL  ", "term:sym<package_declarator>")
    .return (rx418_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("102_1266334190.64822") :method
.annotate "line", 4
    $P420 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P421, "ResizablePMCArray"
    push $P421, $P420
    .return ($P421)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("103_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx424_tgt
    .local int rx424_pos
    .local int rx424_off
    .local int rx424_eos
    .local int rx424_rep
    .local pmc rx424_cur
    (rx424_cur, rx424_pos, rx424_tgt) = self."!cursor_start"()
    rx424_cur."!cursor_debug"("START ", "term:sym<scope_declarator>")
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
.annotate "line", 219
  # rx subrule "scope_declarator" subtype=capture negate=
    rx424_cur."!cursor_pos"(rx424_pos)
    $P10 = rx424_cur."scope_declarator"()
    unless $P10, rx424_fail
    rx424_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx424_pos = $P10."pos"()
  # rx pass
    rx424_cur."!cursor_pass"(rx424_pos, "term:sym<scope_declarator>")
    rx424_cur."!cursor_debug"("PASS  ", "term:sym<scope_declarator>", " at pos=", rx424_pos)
    .return (rx424_cur)
  rx424_fail:
.annotate "line", 4
    (rx424_rep, rx424_pos, $I10, $P10) = rx424_cur."!mark_fail"(0)
    lt rx424_pos, -1, rx424_done
    eq rx424_pos, -1, rx424_fail
    jump $I10
  rx424_done:
    rx424_cur."!cursor_fail"()
    rx424_cur."!cursor_debug"("FAIL  ", "term:sym<scope_declarator>")
    .return (rx424_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("104_1266334190.64822") :method
.annotate "line", 4
    $P426 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P427, "ResizablePMCArray"
    push $P427, $P426
    .return ($P427)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("105_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx430_tgt
    .local int rx430_pos
    .local int rx430_off
    .local int rx430_eos
    .local int rx430_rep
    .local pmc rx430_cur
    (rx430_cur, rx430_pos, rx430_tgt) = self."!cursor_start"()
    rx430_cur."!cursor_debug"("START ", "term:sym<routine_declarator>")
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
    ne $I10, -1, rxscan434_done
    goto rxscan434_scan
  rxscan434_loop:
    ($P10) = rx430_cur."from"()
    inc $P10
    set rx430_pos, $P10
    ge rx430_pos, rx430_eos, rxscan434_done
  rxscan434_scan:
    set_addr $I10, rxscan434_loop
    rx430_cur."!mark_push"(0, rx430_pos, $I10)
  rxscan434_done:
.annotate "line", 220
  # rx subrule "routine_declarator" subtype=capture negate=
    rx430_cur."!cursor_pos"(rx430_pos)
    $P10 = rx430_cur."routine_declarator"()
    unless $P10, rx430_fail
    rx430_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx430_pos = $P10."pos"()
  # rx pass
    rx430_cur."!cursor_pass"(rx430_pos, "term:sym<routine_declarator>")
    rx430_cur."!cursor_debug"("PASS  ", "term:sym<routine_declarator>", " at pos=", rx430_pos)
    .return (rx430_cur)
  rx430_fail:
.annotate "line", 4
    (rx430_rep, rx430_pos, $I10, $P10) = rx430_cur."!mark_fail"(0)
    lt rx430_pos, -1, rx430_done
    eq rx430_pos, -1, rx430_fail
    jump $I10
  rx430_done:
    rx430_cur."!cursor_fail"()
    rx430_cur."!cursor_debug"("FAIL  ", "term:sym<routine_declarator>")
    .return (rx430_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("106_1266334190.64822") :method
.annotate "line", 4
    $P432 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P433, "ResizablePMCArray"
    push $P433, $P432
    .return ($P433)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("107_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx436_tgt
    .local int rx436_pos
    .local int rx436_off
    .local int rx436_eos
    .local int rx436_rep
    .local pmc rx436_cur
    (rx436_cur, rx436_pos, rx436_tgt) = self."!cursor_start"()
    rx436_cur."!cursor_debug"("START ", "term:sym<regex_declarator>")
    .lex unicode:"$\x{a2}", rx436_cur
    .local pmc match
    .lex "$/", match
    length rx436_eos, rx436_tgt
    set rx436_off, 0
    lt rx436_pos, 2, rx436_start
    sub rx436_off, rx436_pos, 1
    substr rx436_tgt, rx436_tgt, rx436_off
  rx436_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan440_done
    goto rxscan440_scan
  rxscan440_loop:
    ($P10) = rx436_cur."from"()
    inc $P10
    set rx436_pos, $P10
    ge rx436_pos, rx436_eos, rxscan440_done
  rxscan440_scan:
    set_addr $I10, rxscan440_loop
    rx436_cur."!mark_push"(0, rx436_pos, $I10)
  rxscan440_done:
.annotate "line", 221
  # rx subrule "regex_declarator" subtype=capture negate=
    rx436_cur."!cursor_pos"(rx436_pos)
    $P10 = rx436_cur."regex_declarator"()
    unless $P10, rx436_fail
    rx436_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx436_pos = $P10."pos"()
  # rx pass
    rx436_cur."!cursor_pass"(rx436_pos, "term:sym<regex_declarator>")
    rx436_cur."!cursor_debug"("PASS  ", "term:sym<regex_declarator>", " at pos=", rx436_pos)
    .return (rx436_cur)
  rx436_fail:
.annotate "line", 4
    (rx436_rep, rx436_pos, $I10, $P10) = rx436_cur."!mark_fail"(0)
    lt rx436_pos, -1, rx436_done
    eq rx436_pos, -1, rx436_fail
    jump $I10
  rx436_done:
    rx436_cur."!cursor_fail"()
    rx436_cur."!cursor_debug"("FAIL  ", "term:sym<regex_declarator>")
    .return (rx436_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("108_1266334190.64822") :method
.annotate "line", 4
    $P438 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P439, "ResizablePMCArray"
    push $P439, $P438
    .return ($P439)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("109_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx442_tgt
    .local int rx442_pos
    .local int rx442_off
    .local int rx442_eos
    .local int rx442_rep
    .local pmc rx442_cur
    (rx442_cur, rx442_pos, rx442_tgt) = self."!cursor_start"()
    rx442_cur."!cursor_debug"("START ", "term:sym<statement_prefix>")
    .lex unicode:"$\x{a2}", rx442_cur
    .local pmc match
    .lex "$/", match
    length rx442_eos, rx442_tgt
    set rx442_off, 0
    lt rx442_pos, 2, rx442_start
    sub rx442_off, rx442_pos, 1
    substr rx442_tgt, rx442_tgt, rx442_off
  rx442_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan446_done
    goto rxscan446_scan
  rxscan446_loop:
    ($P10) = rx442_cur."from"()
    inc $P10
    set rx442_pos, $P10
    ge rx442_pos, rx442_eos, rxscan446_done
  rxscan446_scan:
    set_addr $I10, rxscan446_loop
    rx442_cur."!mark_push"(0, rx442_pos, $I10)
  rxscan446_done:
.annotate "line", 222
  # rx subrule "statement_prefix" subtype=capture negate=
    rx442_cur."!cursor_pos"(rx442_pos)
    $P10 = rx442_cur."statement_prefix"()
    unless $P10, rx442_fail
    rx442_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx442_pos = $P10."pos"()
  # rx pass
    rx442_cur."!cursor_pass"(rx442_pos, "term:sym<statement_prefix>")
    rx442_cur."!cursor_debug"("PASS  ", "term:sym<statement_prefix>", " at pos=", rx442_pos)
    .return (rx442_cur)
  rx442_fail:
.annotate "line", 4
    (rx442_rep, rx442_pos, $I10, $P10) = rx442_cur."!mark_fail"(0)
    lt rx442_pos, -1, rx442_done
    eq rx442_pos, -1, rx442_fail
    jump $I10
  rx442_done:
    rx442_cur."!cursor_fail"()
    rx442_cur."!cursor_debug"("FAIL  ", "term:sym<statement_prefix>")
    .return (rx442_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("110_1266334190.64822") :method
.annotate "line", 4
    $P444 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P445, "ResizablePMCArray"
    push $P445, $P444
    .return ($P445)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("111_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx448_tgt
    .local int rx448_pos
    .local int rx448_off
    .local int rx448_eos
    .local int rx448_rep
    .local pmc rx448_cur
    (rx448_cur, rx448_pos, rx448_tgt) = self."!cursor_start"()
    rx448_cur."!cursor_debug"("START ", "term:sym<lambda>")
    .lex unicode:"$\x{a2}", rx448_cur
    .local pmc match
    .lex "$/", match
    length rx448_eos, rx448_tgt
    set rx448_off, 0
    lt rx448_pos, 2, rx448_start
    sub rx448_off, rx448_pos, 1
    substr rx448_tgt, rx448_tgt, rx448_off
  rx448_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan451_done
    goto rxscan451_scan
  rxscan451_loop:
    ($P10) = rx448_cur."from"()
    inc $P10
    set rx448_pos, $P10
    ge rx448_pos, rx448_eos, rxscan451_done
  rxscan451_scan:
    set_addr $I10, rxscan451_loop
    rx448_cur."!mark_push"(0, rx448_pos, $I10)
  rxscan451_done:
.annotate "line", 223
  # rx subrule "lambda" subtype=zerowidth negate=
    rx448_cur."!cursor_pos"(rx448_pos)
    $P10 = rx448_cur."lambda"()
    unless $P10, rx448_fail
  # rx subrule "pblock" subtype=capture negate=
    rx448_cur."!cursor_pos"(rx448_pos)
    $P10 = rx448_cur."pblock"()
    unless $P10, rx448_fail
    rx448_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx448_pos = $P10."pos"()
  # rx pass
    rx448_cur."!cursor_pass"(rx448_pos, "term:sym<lambda>")
    rx448_cur."!cursor_debug"("PASS  ", "term:sym<lambda>", " at pos=", rx448_pos)
    .return (rx448_cur)
  rx448_fail:
.annotate "line", 4
    (rx448_rep, rx448_pos, $I10, $P10) = rx448_cur."!mark_fail"(0)
    lt rx448_pos, -1, rx448_done
    eq rx448_pos, -1, rx448_fail
    jump $I10
  rx448_done:
    rx448_cur."!cursor_fail"()
    rx448_cur."!cursor_debug"("FAIL  ", "term:sym<lambda>")
    .return (rx448_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("112_1266334190.64822") :method
.annotate "line", 4
    new $P450, "ResizablePMCArray"
    push $P450, ""
    .return ($P450)
.end


.namespace ["NQP";"Grammar"]
.sub "fatarrow"  :subid("113_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx453_tgt
    .local int rx453_pos
    .local int rx453_off
    .local int rx453_eos
    .local int rx453_rep
    .local pmc rx453_cur
    (rx453_cur, rx453_pos, rx453_tgt) = self."!cursor_start"()
    rx453_cur."!cursor_debug"("START ", "fatarrow")
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
.annotate "line", 226
  # rx subrule "identifier" subtype=capture negate=
    rx453_cur."!cursor_pos"(rx453_pos)
    $P10 = rx453_cur."identifier"()
    unless $P10, rx453_fail
    rx453_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    rx453_pos = $P10."pos"()
  # rx rxquantr458 ** 0..*
    set_addr $I459, rxquantr458_done
    rx453_cur."!mark_push"(0, rx453_pos, $I459)
  rxquantr458_loop:
  # rx enumcharlist negate=0 
    ge rx453_pos, rx453_eos, rx453_fail
    sub $I10, rx453_pos, rx453_off
    substr $S10, rx453_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx453_fail
    inc rx453_pos
    (rx453_rep) = rx453_cur."!mark_commit"($I459)
    rx453_cur."!mark_push"(rx453_rep, rx453_pos, $I459)
    goto rxquantr458_loop
  rxquantr458_done:
  # rx literal  "=>"
    add $I11, rx453_pos, 2
    gt $I11, rx453_eos, rx453_fail
    sub $I11, rx453_pos, rx453_off
    substr $S10, rx453_tgt, $I11, 2
    ne $S10, "=>", rx453_fail
    add rx453_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx453_cur."!cursor_pos"(rx453_pos)
    $P10 = rx453_cur."ws"()
    unless $P10, rx453_fail
    rx453_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx453_cur."!cursor_pos"(rx453_pos)
    $P10 = rx453_cur."EXPR"("i=")
    unless $P10, rx453_fail
    rx453_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("val")
    rx453_pos = $P10."pos"()
.annotate "line", 225
  # rx pass
    rx453_cur."!cursor_pass"(rx453_pos, "fatarrow")
    rx453_cur."!cursor_debug"("PASS  ", "fatarrow", " at pos=", rx453_pos)
    .return (rx453_cur)
  rx453_fail:
.annotate "line", 4
    (rx453_rep, rx453_pos, $I10, $P10) = rx453_cur."!mark_fail"(0)
    lt rx453_pos, -1, rx453_done
    eq rx453_pos, -1, rx453_fail
    jump $I10
  rx453_done:
    rx453_cur."!cursor_fail"()
    rx453_cur."!cursor_debug"("FAIL  ", "fatarrow")
    .return (rx453_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__fatarrow"  :subid("114_1266334190.64822") :method
.annotate "line", 4
    $P455 = self."!PREFIX__!subrule"("key", "")
    new $P456, "ResizablePMCArray"
    push $P456, $P455
    .return ($P456)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("115_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx461_tgt
    .local int rx461_pos
    .local int rx461_off
    .local int rx461_eos
    .local int rx461_rep
    .local pmc rx461_cur
    (rx461_cur, rx461_pos, rx461_tgt) = self."!cursor_start"()
    rx461_cur."!cursor_debug"("START ", "colonpair")
    rx461_cur."!cursor_caparray"("circumfix")
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
    ne $I10, -1, rxscan467_done
    goto rxscan467_scan
  rxscan467_loop:
    ($P10) = rx461_cur."from"()
    inc $P10
    set rx461_pos, $P10
    ge rx461_pos, rx461_eos, rxscan467_done
  rxscan467_scan:
    set_addr $I10, rxscan467_loop
    rx461_cur."!mark_push"(0, rx461_pos, $I10)
  rxscan467_done:
.annotate "line", 230
  # rx literal  ":"
    add $I11, rx461_pos, 1
    gt $I11, rx461_eos, rx461_fail
    sub $I11, rx461_pos, rx461_off
    substr $S10, rx461_tgt, $I11, 1
    ne $S10, ":", rx461_fail
    add rx461_pos, 1
  alt468_0:
.annotate "line", 231
    set_addr $I10, alt468_1
    rx461_cur."!mark_push"(0, rx461_pos, $I10)
.annotate "line", 232
  # rx subcapture "not"
    set_addr $I10, rxcap_469_fail
    rx461_cur."!mark_push"(0, rx461_pos, $I10)
  # rx literal  "!"
    add $I11, rx461_pos, 1
    gt $I11, rx461_eos, rx461_fail
    sub $I11, rx461_pos, rx461_off
    substr $S10, rx461_tgt, $I11, 1
    ne $S10, "!", rx461_fail
    add rx461_pos, 1
    set_addr $I10, rxcap_469_fail
    ($I12, $I11) = rx461_cur."!mark_peek"($I10)
    rx461_cur."!cursor_pos"($I11)
    ($P10) = rx461_cur."!cursor_start"()
    $P10."!cursor_pass"(rx461_pos, "")
    rx461_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_469_done
  rxcap_469_fail:
    goto rx461_fail
  rxcap_469_done:
  # rx subrule "identifier" subtype=capture negate=
    rx461_cur."!cursor_pos"(rx461_pos)
    $P10 = rx461_cur."identifier"()
    unless $P10, rx461_fail
    rx461_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx461_pos = $P10."pos"()
    goto alt468_end
  alt468_1:
    set_addr $I10, alt468_2
    rx461_cur."!mark_push"(0, rx461_pos, $I10)
.annotate "line", 233
  # rx subrule "identifier" subtype=capture negate=
    rx461_cur."!cursor_pos"(rx461_pos)
    $P10 = rx461_cur."identifier"()
    unless $P10, rx461_fail
    rx461_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx461_pos = $P10."pos"()
  # rx rxquantr470 ** 0..1
    set_addr $I471, rxquantr470_done
    rx461_cur."!mark_push"(0, rx461_pos, $I471)
  rxquantr470_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx461_cur."!cursor_pos"(rx461_pos)
    $P10 = rx461_cur."circumfix"()
    unless $P10, rx461_fail
    rx461_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx461_pos = $P10."pos"()
    (rx461_rep) = rx461_cur."!mark_commit"($I471)
  rxquantr470_done:
    goto alt468_end
  alt468_2:
.annotate "line", 234
  # rx subrule "circumfix" subtype=capture negate=
    rx461_cur."!cursor_pos"(rx461_pos)
    $P10 = rx461_cur."circumfix"()
    unless $P10, rx461_fail
    rx461_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx461_pos = $P10."pos"()
  alt468_end:
.annotate "line", 229
  # rx pass
    rx461_cur."!cursor_pass"(rx461_pos, "colonpair")
    rx461_cur."!cursor_debug"("PASS  ", "colonpair", " at pos=", rx461_pos)
    .return (rx461_cur)
  rx461_fail:
.annotate "line", 4
    (rx461_rep, rx461_pos, $I10, $P10) = rx461_cur."!mark_fail"(0)
    lt rx461_pos, -1, rx461_done
    eq rx461_pos, -1, rx461_fail
    jump $I10
  rx461_done:
    rx461_cur."!cursor_fail"()
    rx461_cur."!cursor_debug"("FAIL  ", "colonpair")
    .return (rx461_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("116_1266334190.64822") :method
.annotate "line", 4
    $P463 = self."!PREFIX__!subrule"("circumfix", ":")
    $P464 = self."!PREFIX__!subrule"("identifier", ":")
    $P465 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P466, "ResizablePMCArray"
    push $P466, $P463
    push $P466, $P464
    push $P466, $P465
    .return ($P466)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("117_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx473_tgt
    .local int rx473_pos
    .local int rx473_off
    .local int rx473_eos
    .local int rx473_rep
    .local pmc rx473_cur
    (rx473_cur, rx473_pos, rx473_tgt) = self."!cursor_start"()
    rx473_cur."!cursor_debug"("START ", "variable")
    rx473_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx473_cur
    .local pmc match
    .lex "$/", match
    length rx473_eos, rx473_tgt
    set rx473_off, 0
    lt rx473_pos, 2, rx473_start
    sub rx473_off, rx473_pos, 1
    substr rx473_tgt, rx473_tgt, rx473_off
  rx473_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan478_done
    goto rxscan478_scan
  rxscan478_loop:
    ($P10) = rx473_cur."from"()
    inc $P10
    set rx473_pos, $P10
    ge rx473_pos, rx473_eos, rxscan478_done
  rxscan478_scan:
    set_addr $I10, rxscan478_loop
    rx473_cur."!mark_push"(0, rx473_pos, $I10)
  rxscan478_done:
  alt479_0:
.annotate "line", 238
    set_addr $I10, alt479_1
    rx473_cur."!mark_push"(0, rx473_pos, $I10)
.annotate "line", 239
  # rx subrule "sigil" subtype=capture negate=
    rx473_cur."!cursor_pos"(rx473_pos)
    $P10 = rx473_cur."sigil"()
    unless $P10, rx473_fail
    rx473_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx473_pos = $P10."pos"()
  # rx rxquantr480 ** 0..1
    set_addr $I481, rxquantr480_done
    rx473_cur."!mark_push"(0, rx473_pos, $I481)
  rxquantr480_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx473_cur."!cursor_pos"(rx473_pos)
    $P10 = rx473_cur."twigil"()
    unless $P10, rx473_fail
    rx473_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx473_pos = $P10."pos"()
    (rx473_rep) = rx473_cur."!mark_commit"($I481)
  rxquantr480_done:
  # rx subrule "name" subtype=capture negate=
    rx473_cur."!cursor_pos"(rx473_pos)
    $P10 = rx473_cur."name"()
    unless $P10, rx473_fail
    rx473_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx473_pos = $P10."pos"()
    goto alt479_end
  alt479_1:
    set_addr $I10, alt479_2
    rx473_cur."!mark_push"(0, rx473_pos, $I10)
.annotate "line", 240
  # rx subrule "sigil" subtype=capture negate=
    rx473_cur."!cursor_pos"(rx473_pos)
    $P10 = rx473_cur."sigil"()
    unless $P10, rx473_fail
    rx473_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx473_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx473_pos, rx473_eos, rx473_fail
    sub $I10, rx473_pos, rx473_off
    substr $S10, rx473_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx473_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx473_cur."!cursor_pos"(rx473_pos)
    $P10 = rx473_cur."postcircumfix"()
    unless $P10, rx473_fail
    rx473_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx473_pos = $P10."pos"()
    goto alt479_end
  alt479_2:
.annotate "line", 241
  # rx subcapture "sigil"
    set_addr $I10, rxcap_482_fail
    rx473_cur."!mark_push"(0, rx473_pos, $I10)
  # rx literal  "$"
    add $I11, rx473_pos, 1
    gt $I11, rx473_eos, rx473_fail
    sub $I11, rx473_pos, rx473_off
    substr $S10, rx473_tgt, $I11, 1
    ne $S10, "$", rx473_fail
    add rx473_pos, 1
    set_addr $I10, rxcap_482_fail
    ($I12, $I11) = rx473_cur."!mark_peek"($I10)
    rx473_cur."!cursor_pos"($I11)
    ($P10) = rx473_cur."!cursor_start"()
    $P10."!cursor_pass"(rx473_pos, "")
    rx473_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_482_done
  rxcap_482_fail:
    goto rx473_fail
  rxcap_482_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_483_fail
    rx473_cur."!mark_push"(0, rx473_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx473_pos, rx473_eos, rx473_fail
    sub $I10, rx473_pos, rx473_off
    substr $S10, rx473_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx473_fail
    inc rx473_pos
    set_addr $I10, rxcap_483_fail
    ($I12, $I11) = rx473_cur."!mark_peek"($I10)
    rx473_cur."!cursor_pos"($I11)
    ($P10) = rx473_cur."!cursor_start"()
    $P10."!cursor_pass"(rx473_pos, "")
    rx473_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_483_done
  rxcap_483_fail:
    goto rx473_fail
  rxcap_483_done:
  alt479_end:
.annotate "line", 238
  # rx pass
    rx473_cur."!cursor_pass"(rx473_pos, "variable")
    rx473_cur."!cursor_debug"("PASS  ", "variable", " at pos=", rx473_pos)
    .return (rx473_cur)
  rx473_fail:
.annotate "line", 4
    (rx473_rep, rx473_pos, $I10, $P10) = rx473_cur."!mark_fail"(0)
    lt rx473_pos, -1, rx473_done
    eq rx473_pos, -1, rx473_fail
    jump $I10
  rx473_done:
    rx473_cur."!cursor_fail"()
    rx473_cur."!cursor_debug"("FAIL  ", "variable")
    .return (rx473_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("118_1266334190.64822") :method
.annotate "line", 4
    $P475 = self."!PREFIX__!subrule"("sigil", "")
    $P476 = self."!PREFIX__!subrule"("sigil", "")
    new $P477, "ResizablePMCArray"
    push $P477, "$!"
    push $P477, "$_"
    push $P477, "$/"
    push $P477, $P475
    push $P477, $P476
    .return ($P477)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("119_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx485_tgt
    .local int rx485_pos
    .local int rx485_off
    .local int rx485_eos
    .local int rx485_rep
    .local pmc rx485_cur
    (rx485_cur, rx485_pos, rx485_tgt) = self."!cursor_start"()
    rx485_cur."!cursor_debug"("START ", "sigil")
    .lex unicode:"$\x{a2}", rx485_cur
    .local pmc match
    .lex "$/", match
    length rx485_eos, rx485_tgt
    set rx485_off, 0
    lt rx485_pos, 2, rx485_start
    sub rx485_off, rx485_pos, 1
    substr rx485_tgt, rx485_tgt, rx485_off
  rx485_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan488_done
    goto rxscan488_scan
  rxscan488_loop:
    ($P10) = rx485_cur."from"()
    inc $P10
    set rx485_pos, $P10
    ge rx485_pos, rx485_eos, rxscan488_done
  rxscan488_scan:
    set_addr $I10, rxscan488_loop
    rx485_cur."!mark_push"(0, rx485_pos, $I10)
  rxscan488_done:
.annotate "line", 244
  # rx enumcharlist negate=0 
    ge rx485_pos, rx485_eos, rx485_fail
    sub $I10, rx485_pos, rx485_off
    substr $S10, rx485_tgt, $I10, 1
    index $I11, "$@%&", $S10
    lt $I11, 0, rx485_fail
    inc rx485_pos
  # rx pass
    rx485_cur."!cursor_pass"(rx485_pos, "sigil")
    rx485_cur."!cursor_debug"("PASS  ", "sigil", " at pos=", rx485_pos)
    .return (rx485_cur)
  rx485_fail:
.annotate "line", 4
    (rx485_rep, rx485_pos, $I10, $P10) = rx485_cur."!mark_fail"(0)
    lt rx485_pos, -1, rx485_done
    eq rx485_pos, -1, rx485_fail
    jump $I10
  rx485_done:
    rx485_cur."!cursor_fail"()
    rx485_cur."!cursor_debug"("FAIL  ", "sigil")
    .return (rx485_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("120_1266334190.64822") :method
.annotate "line", 4
    new $P487, "ResizablePMCArray"
    push $P487, "&"
    push $P487, "%"
    push $P487, "@"
    push $P487, "$"
    .return ($P487)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("121_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx490_tgt
    .local int rx490_pos
    .local int rx490_off
    .local int rx490_eos
    .local int rx490_rep
    .local pmc rx490_cur
    (rx490_cur, rx490_pos, rx490_tgt) = self."!cursor_start"()
    rx490_cur."!cursor_debug"("START ", "twigil")
    .lex unicode:"$\x{a2}", rx490_cur
    .local pmc match
    .lex "$/", match
    length rx490_eos, rx490_tgt
    set rx490_off, 0
    lt rx490_pos, 2, rx490_start
    sub rx490_off, rx490_pos, 1
    substr rx490_tgt, rx490_tgt, rx490_off
  rx490_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan493_done
    goto rxscan493_scan
  rxscan493_loop:
    ($P10) = rx490_cur."from"()
    inc $P10
    set rx490_pos, $P10
    ge rx490_pos, rx490_eos, rxscan493_done
  rxscan493_scan:
    set_addr $I10, rxscan493_loop
    rx490_cur."!mark_push"(0, rx490_pos, $I10)
  rxscan493_done:
.annotate "line", 246
  # rx enumcharlist negate=0 
    ge rx490_pos, rx490_eos, rx490_fail
    sub $I10, rx490_pos, rx490_off
    substr $S10, rx490_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx490_fail
    inc rx490_pos
  # rx pass
    rx490_cur."!cursor_pass"(rx490_pos, "twigil")
    rx490_cur."!cursor_debug"("PASS  ", "twigil", " at pos=", rx490_pos)
    .return (rx490_cur)
  rx490_fail:
.annotate "line", 4
    (rx490_rep, rx490_pos, $I10, $P10) = rx490_cur."!mark_fail"(0)
    lt rx490_pos, -1, rx490_done
    eq rx490_pos, -1, rx490_fail
    jump $I10
  rx490_done:
    rx490_cur."!cursor_fail"()
    rx490_cur."!cursor_debug"("FAIL  ", "twigil")
    .return (rx490_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("122_1266334190.64822") :method
.annotate "line", 4
    new $P492, "ResizablePMCArray"
    push $P492, "?"
    push $P492, "!"
    push $P492, "*"
    .return ($P492)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("123_1266334190.64822") :method
.annotate "line", 248
    $P495 = self."!protoregex"("package_declarator")
    .return ($P495)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("124_1266334190.64822") :method
.annotate "line", 248
    $P497 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P497)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("125_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx499_tgt
    .local int rx499_pos
    .local int rx499_off
    .local int rx499_eos
    .local int rx499_rep
    .local pmc rx499_cur
    (rx499_cur, rx499_pos, rx499_tgt) = self."!cursor_start"()
    rx499_cur."!cursor_debug"("START ", "package_declarator:sym<module>")
    .lex unicode:"$\x{a2}", rx499_cur
    .local pmc match
    .lex "$/", match
    length rx499_eos, rx499_tgt
    set rx499_off, 0
    lt rx499_pos, 2, rx499_start
    sub rx499_off, rx499_pos, 1
    substr rx499_tgt, rx499_tgt, rx499_off
  rx499_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan503_done
    goto rxscan503_scan
  rxscan503_loop:
    ($P10) = rx499_cur."from"()
    inc $P10
    set rx499_pos, $P10
    ge rx499_pos, rx499_eos, rxscan503_done
  rxscan503_scan:
    set_addr $I10, rxscan503_loop
    rx499_cur."!mark_push"(0, rx499_pos, $I10)
  rxscan503_done:
.annotate "line", 249
  # rx subcapture "sym"
    set_addr $I10, rxcap_504_fail
    rx499_cur."!mark_push"(0, rx499_pos, $I10)
  # rx literal  "module"
    add $I11, rx499_pos, 6
    gt $I11, rx499_eos, rx499_fail
    sub $I11, rx499_pos, rx499_off
    substr $S10, rx499_tgt, $I11, 6
    ne $S10, "module", rx499_fail
    add rx499_pos, 6
    set_addr $I10, rxcap_504_fail
    ($I12, $I11) = rx499_cur."!mark_peek"($I10)
    rx499_cur."!cursor_pos"($I11)
    ($P10) = rx499_cur."!cursor_start"()
    $P10."!cursor_pass"(rx499_pos, "")
    rx499_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_504_done
  rxcap_504_fail:
    goto rx499_fail
  rxcap_504_done:
  # rx subrule "package_def" subtype=capture negate=
    rx499_cur."!cursor_pos"(rx499_pos)
    $P10 = rx499_cur."package_def"()
    unless $P10, rx499_fail
    rx499_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx499_pos = $P10."pos"()
  # rx pass
    rx499_cur."!cursor_pass"(rx499_pos, "package_declarator:sym<module>")
    rx499_cur."!cursor_debug"("PASS  ", "package_declarator:sym<module>", " at pos=", rx499_pos)
    .return (rx499_cur)
  rx499_fail:
.annotate "line", 4
    (rx499_rep, rx499_pos, $I10, $P10) = rx499_cur."!mark_fail"(0)
    lt rx499_pos, -1, rx499_done
    eq rx499_pos, -1, rx499_fail
    jump $I10
  rx499_done:
    rx499_cur."!cursor_fail"()
    rx499_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<module>")
    .return (rx499_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("126_1266334190.64822") :method
.annotate "line", 4
    $P501 = self."!PREFIX__!subrule"("package_def", "module")
    new $P502, "ResizablePMCArray"
    push $P502, $P501
    .return ($P502)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("127_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx506_tgt
    .local int rx506_pos
    .local int rx506_off
    .local int rx506_eos
    .local int rx506_rep
    .local pmc rx506_cur
    (rx506_cur, rx506_pos, rx506_tgt) = self."!cursor_start"()
    rx506_cur."!cursor_debug"("START ", "package_declarator:sym<class>")
    .lex unicode:"$\x{a2}", rx506_cur
    .local pmc match
    .lex "$/", match
    length rx506_eos, rx506_tgt
    set rx506_off, 0
    lt rx506_pos, 2, rx506_start
    sub rx506_off, rx506_pos, 1
    substr rx506_tgt, rx506_tgt, rx506_off
  rx506_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan511_done
    goto rxscan511_scan
  rxscan511_loop:
    ($P10) = rx506_cur."from"()
    inc $P10
    set rx506_pos, $P10
    ge rx506_pos, rx506_eos, rxscan511_done
  rxscan511_scan:
    set_addr $I10, rxscan511_loop
    rx506_cur."!mark_push"(0, rx506_pos, $I10)
  rxscan511_done:
.annotate "line", 250
  # rx subcapture "sym"
    set_addr $I10, rxcap_513_fail
    rx506_cur."!mark_push"(0, rx506_pos, $I10)
  alt512_0:
    set_addr $I10, alt512_1
    rx506_cur."!mark_push"(0, rx506_pos, $I10)
  # rx literal  "class"
    add $I11, rx506_pos, 5
    gt $I11, rx506_eos, rx506_fail
    sub $I11, rx506_pos, rx506_off
    substr $S10, rx506_tgt, $I11, 5
    ne $S10, "class", rx506_fail
    add rx506_pos, 5
    goto alt512_end
  alt512_1:
  # rx literal  "grammar"
    add $I11, rx506_pos, 7
    gt $I11, rx506_eos, rx506_fail
    sub $I11, rx506_pos, rx506_off
    substr $S10, rx506_tgt, $I11, 7
    ne $S10, "grammar", rx506_fail
    add rx506_pos, 7
  alt512_end:
    set_addr $I10, rxcap_513_fail
    ($I12, $I11) = rx506_cur."!mark_peek"($I10)
    rx506_cur."!cursor_pos"($I11)
    ($P10) = rx506_cur."!cursor_start"()
    $P10."!cursor_pass"(rx506_pos, "")
    rx506_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_513_done
  rxcap_513_fail:
    goto rx506_fail
  rxcap_513_done:
  # rx subrule "package_def" subtype=capture negate=
    rx506_cur."!cursor_pos"(rx506_pos)
    $P10 = rx506_cur."package_def"()
    unless $P10, rx506_fail
    rx506_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx506_pos = $P10."pos"()
  # rx pass
    rx506_cur."!cursor_pass"(rx506_pos, "package_declarator:sym<class>")
    rx506_cur."!cursor_debug"("PASS  ", "package_declarator:sym<class>", " at pos=", rx506_pos)
    .return (rx506_cur)
  rx506_fail:
.annotate "line", 4
    (rx506_rep, rx506_pos, $I10, $P10) = rx506_cur."!mark_fail"(0)
    lt rx506_pos, -1, rx506_done
    eq rx506_pos, -1, rx506_fail
    jump $I10
  rx506_done:
    rx506_cur."!cursor_fail"()
    rx506_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<class>")
    .return (rx506_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("128_1266334190.64822") :method
.annotate "line", 4
    $P508 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P509 = self."!PREFIX__!subrule"("package_def", "class")
    new $P510, "ResizablePMCArray"
    push $P510, $P508
    push $P510, $P509
    .return ($P510)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("129_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx515_tgt
    .local int rx515_pos
    .local int rx515_off
    .local int rx515_eos
    .local int rx515_rep
    .local pmc rx515_cur
    (rx515_cur, rx515_pos, rx515_tgt) = self."!cursor_start"()
    rx515_cur."!cursor_debug"("START ", "package_def")
    rx515_cur."!cursor_caparray"("parent")
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
    ne $I10, -1, rxscan518_done
    goto rxscan518_scan
  rxscan518_loop:
    ($P10) = rx515_cur."from"()
    inc $P10
    set rx515_pos, $P10
    ge rx515_pos, rx515_eos, rxscan518_done
  rxscan518_scan:
    set_addr $I10, rxscan518_loop
    rx515_cur."!mark_push"(0, rx515_pos, $I10)
  rxscan518_done:
.annotate "line", 252
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
.annotate "line", 253
  # rx subrule "name" subtype=capture negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."name"()
    unless $P10, rx515_fail
    rx515_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx515_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
.annotate "line", 254
  # rx rxquantr521 ** 0..1
    set_addr $I525, rxquantr521_done
    rx515_cur."!mark_push"(0, rx515_pos, $I525)
  rxquantr521_loop:
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx515_pos, 2
    gt $I11, rx515_eos, rx515_fail
    sub $I11, rx515_pos, rx515_off
    substr $S10, rx515_tgt, $I11, 2
    ne $S10, "is", rx515_fail
    add rx515_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."name"()
    unless $P10, rx515_fail
    rx515_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx515_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
    (rx515_rep) = rx515_cur."!mark_commit"($I525)
  rxquantr521_done:
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
  alt527_0:
.annotate "line", 255
    set_addr $I10, alt527_1
    rx515_cur."!mark_push"(0, rx515_pos, $I10)
.annotate "line", 256
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx515_pos, 1
    gt $I11, rx515_eos, rx515_fail
    sub $I11, rx515_pos, rx515_off
    substr $S10, rx515_tgt, $I11, 1
    ne $S10, ";", rx515_fail
    add rx515_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."comp_unit"()
    unless $P10, rx515_fail
    rx515_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx515_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
    goto alt527_end
  alt527_1:
    set_addr $I10, alt527_2
    rx515_cur."!mark_push"(0, rx515_pos, $I10)
.annotate "line", 257
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx515_pos, rx515_eos, rx515_fail
    sub $I10, rx515_pos, rx515_off
    substr $S10, rx515_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx515_fail
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."block"()
    unless $P10, rx515_fail
    rx515_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx515_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
    goto alt527_end
  alt527_2:
.annotate "line", 258
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."panic"("Malformed package declaration")
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
  alt527_end:
.annotate "line", 259
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
.annotate "line", 252
  # rx pass
    rx515_cur."!cursor_pass"(rx515_pos, "package_def")
    rx515_cur."!cursor_debug"("PASS  ", "package_def", " at pos=", rx515_pos)
    .return (rx515_cur)
  rx515_fail:
.annotate "line", 4
    (rx515_rep, rx515_pos, $I10, $P10) = rx515_cur."!mark_fail"(0)
    lt rx515_pos, -1, rx515_done
    eq rx515_pos, -1, rx515_fail
    jump $I10
  rx515_done:
    rx515_cur."!cursor_fail"()
    rx515_cur."!cursor_debug"("FAIL  ", "package_def")
    .return (rx515_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("130_1266334190.64822") :method
.annotate "line", 4
    new $P517, "ResizablePMCArray"
    push $P517, ""
    .return ($P517)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("131_1266334190.64822") :method
.annotate "line", 262
    $P538 = self."!protoregex"("scope_declarator")
    .return ($P538)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("132_1266334190.64822") :method
.annotate "line", 262
    $P540 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P540)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("133_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx542_tgt
    .local int rx542_pos
    .local int rx542_off
    .local int rx542_eos
    .local int rx542_rep
    .local pmc rx542_cur
    (rx542_cur, rx542_pos, rx542_tgt) = self."!cursor_start"()
    rx542_cur."!cursor_debug"("START ", "scope_declarator:sym<my>")
    .lex unicode:"$\x{a2}", rx542_cur
    .local pmc match
    .lex "$/", match
    length rx542_eos, rx542_tgt
    set rx542_off, 0
    lt rx542_pos, 2, rx542_start
    sub rx542_off, rx542_pos, 1
    substr rx542_tgt, rx542_tgt, rx542_off
  rx542_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan546_done
    goto rxscan546_scan
  rxscan546_loop:
    ($P10) = rx542_cur."from"()
    inc $P10
    set rx542_pos, $P10
    ge rx542_pos, rx542_eos, rxscan546_done
  rxscan546_scan:
    set_addr $I10, rxscan546_loop
    rx542_cur."!mark_push"(0, rx542_pos, $I10)
  rxscan546_done:
.annotate "line", 263
  # rx subcapture "sym"
    set_addr $I10, rxcap_547_fail
    rx542_cur."!mark_push"(0, rx542_pos, $I10)
  # rx literal  "my"
    add $I11, rx542_pos, 2
    gt $I11, rx542_eos, rx542_fail
    sub $I11, rx542_pos, rx542_off
    substr $S10, rx542_tgt, $I11, 2
    ne $S10, "my", rx542_fail
    add rx542_pos, 2
    set_addr $I10, rxcap_547_fail
    ($I12, $I11) = rx542_cur."!mark_peek"($I10)
    rx542_cur."!cursor_pos"($I11)
    ($P10) = rx542_cur."!cursor_start"()
    $P10."!cursor_pass"(rx542_pos, "")
    rx542_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_547_done
  rxcap_547_fail:
    goto rx542_fail
  rxcap_547_done:
  # rx subrule "scoped" subtype=capture negate=
    rx542_cur."!cursor_pos"(rx542_pos)
    $P10 = rx542_cur."scoped"("my")
    unless $P10, rx542_fail
    rx542_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx542_pos = $P10."pos"()
  # rx pass
    rx542_cur."!cursor_pass"(rx542_pos, "scope_declarator:sym<my>")
    rx542_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<my>", " at pos=", rx542_pos)
    .return (rx542_cur)
  rx542_fail:
.annotate "line", 4
    (rx542_rep, rx542_pos, $I10, $P10) = rx542_cur."!mark_fail"(0)
    lt rx542_pos, -1, rx542_done
    eq rx542_pos, -1, rx542_fail
    jump $I10
  rx542_done:
    rx542_cur."!cursor_fail"()
    rx542_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<my>")
    .return (rx542_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("134_1266334190.64822") :method
.annotate "line", 4
    $P544 = self."!PREFIX__!subrule"("scoped", "my")
    new $P545, "ResizablePMCArray"
    push $P545, $P544
    .return ($P545)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("135_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx549_tgt
    .local int rx549_pos
    .local int rx549_off
    .local int rx549_eos
    .local int rx549_rep
    .local pmc rx549_cur
    (rx549_cur, rx549_pos, rx549_tgt) = self."!cursor_start"()
    rx549_cur."!cursor_debug"("START ", "scope_declarator:sym<our>")
    .lex unicode:"$\x{a2}", rx549_cur
    .local pmc match
    .lex "$/", match
    length rx549_eos, rx549_tgt
    set rx549_off, 0
    lt rx549_pos, 2, rx549_start
    sub rx549_off, rx549_pos, 1
    substr rx549_tgt, rx549_tgt, rx549_off
  rx549_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan553_done
    goto rxscan553_scan
  rxscan553_loop:
    ($P10) = rx549_cur."from"()
    inc $P10
    set rx549_pos, $P10
    ge rx549_pos, rx549_eos, rxscan553_done
  rxscan553_scan:
    set_addr $I10, rxscan553_loop
    rx549_cur."!mark_push"(0, rx549_pos, $I10)
  rxscan553_done:
.annotate "line", 264
  # rx subcapture "sym"
    set_addr $I10, rxcap_554_fail
    rx549_cur."!mark_push"(0, rx549_pos, $I10)
  # rx literal  "our"
    add $I11, rx549_pos, 3
    gt $I11, rx549_eos, rx549_fail
    sub $I11, rx549_pos, rx549_off
    substr $S10, rx549_tgt, $I11, 3
    ne $S10, "our", rx549_fail
    add rx549_pos, 3
    set_addr $I10, rxcap_554_fail
    ($I12, $I11) = rx549_cur."!mark_peek"($I10)
    rx549_cur."!cursor_pos"($I11)
    ($P10) = rx549_cur."!cursor_start"()
    $P10."!cursor_pass"(rx549_pos, "")
    rx549_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_554_done
  rxcap_554_fail:
    goto rx549_fail
  rxcap_554_done:
  # rx subrule "scoped" subtype=capture negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."scoped"("our")
    unless $P10, rx549_fail
    rx549_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx549_pos = $P10."pos"()
  # rx pass
    rx549_cur."!cursor_pass"(rx549_pos, "scope_declarator:sym<our>")
    rx549_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<our>", " at pos=", rx549_pos)
    .return (rx549_cur)
  rx549_fail:
.annotate "line", 4
    (rx549_rep, rx549_pos, $I10, $P10) = rx549_cur."!mark_fail"(0)
    lt rx549_pos, -1, rx549_done
    eq rx549_pos, -1, rx549_fail
    jump $I10
  rx549_done:
    rx549_cur."!cursor_fail"()
    rx549_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<our>")
    .return (rx549_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("136_1266334190.64822") :method
.annotate "line", 4
    $P551 = self."!PREFIX__!subrule"("scoped", "our")
    new $P552, "ResizablePMCArray"
    push $P552, $P551
    .return ($P552)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("137_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx556_tgt
    .local int rx556_pos
    .local int rx556_off
    .local int rx556_eos
    .local int rx556_rep
    .local pmc rx556_cur
    (rx556_cur, rx556_pos, rx556_tgt) = self."!cursor_start"()
    rx556_cur."!cursor_debug"("START ", "scope_declarator:sym<has>")
    .lex unicode:"$\x{a2}", rx556_cur
    .local pmc match
    .lex "$/", match
    length rx556_eos, rx556_tgt
    set rx556_off, 0
    lt rx556_pos, 2, rx556_start
    sub rx556_off, rx556_pos, 1
    substr rx556_tgt, rx556_tgt, rx556_off
  rx556_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan560_done
    goto rxscan560_scan
  rxscan560_loop:
    ($P10) = rx556_cur."from"()
    inc $P10
    set rx556_pos, $P10
    ge rx556_pos, rx556_eos, rxscan560_done
  rxscan560_scan:
    set_addr $I10, rxscan560_loop
    rx556_cur."!mark_push"(0, rx556_pos, $I10)
  rxscan560_done:
.annotate "line", 265
  # rx subcapture "sym"
    set_addr $I10, rxcap_561_fail
    rx556_cur."!mark_push"(0, rx556_pos, $I10)
  # rx literal  "has"
    add $I11, rx556_pos, 3
    gt $I11, rx556_eos, rx556_fail
    sub $I11, rx556_pos, rx556_off
    substr $S10, rx556_tgt, $I11, 3
    ne $S10, "has", rx556_fail
    add rx556_pos, 3
    set_addr $I10, rxcap_561_fail
    ($I12, $I11) = rx556_cur."!mark_peek"($I10)
    rx556_cur."!cursor_pos"($I11)
    ($P10) = rx556_cur."!cursor_start"()
    $P10."!cursor_pass"(rx556_pos, "")
    rx556_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_561_done
  rxcap_561_fail:
    goto rx556_fail
  rxcap_561_done:
  # rx subrule "scoped" subtype=capture negate=
    rx556_cur."!cursor_pos"(rx556_pos)
    $P10 = rx556_cur."scoped"("has")
    unless $P10, rx556_fail
    rx556_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx556_pos = $P10."pos"()
  # rx pass
    rx556_cur."!cursor_pass"(rx556_pos, "scope_declarator:sym<has>")
    rx556_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<has>", " at pos=", rx556_pos)
    .return (rx556_cur)
  rx556_fail:
.annotate "line", 4
    (rx556_rep, rx556_pos, $I10, $P10) = rx556_cur."!mark_fail"(0)
    lt rx556_pos, -1, rx556_done
    eq rx556_pos, -1, rx556_fail
    jump $I10
  rx556_done:
    rx556_cur."!cursor_fail"()
    rx556_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<has>")
    .return (rx556_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("138_1266334190.64822") :method
.annotate "line", 4
    $P558 = self."!PREFIX__!subrule"("scoped", "has")
    new $P559, "ResizablePMCArray"
    push $P559, $P558
    .return ($P559)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("139_1266334190.64822") :method :outer("11_1266334190.64822")
    .param pmc param_563
.annotate "line", 267
    .lex "$*SCOPE", param_563
.annotate "line", 4
    .local string rx564_tgt
    .local int rx564_pos
    .local int rx564_off
    .local int rx564_eos
    .local int rx564_rep
    .local pmc rx564_cur
    (rx564_cur, rx564_pos, rx564_tgt) = self."!cursor_start"()
    rx564_cur."!cursor_debug"("START ", "scoped")
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
    ne $I10, -1, rxscan567_done
    goto rxscan567_scan
  rxscan567_loop:
    ($P10) = rx564_cur."from"()
    inc $P10
    set rx564_pos, $P10
    ge rx564_pos, rx564_eos, rxscan567_done
  rxscan567_scan:
    set_addr $I10, rxscan567_loop
    rx564_cur."!mark_push"(0, rx564_pos, $I10)
  rxscan567_done:
  alt568_0:
.annotate "line", 267
    set_addr $I10, alt568_1
    rx564_cur."!mark_push"(0, rx564_pos, $I10)
.annotate "line", 268
  # rx subrule "ws" subtype=method negate=
    rx564_cur."!cursor_pos"(rx564_pos)
    $P10 = rx564_cur."ws"()
    unless $P10, rx564_fail
    rx564_pos = $P10."pos"()
  # rx subrule "variable_declarator" subtype=capture negate=
    rx564_cur."!cursor_pos"(rx564_pos)
    $P10 = rx564_cur."variable_declarator"()
    unless $P10, rx564_fail
    rx564_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx564_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx564_cur."!cursor_pos"(rx564_pos)
    $P10 = rx564_cur."ws"()
    unless $P10, rx564_fail
    rx564_pos = $P10."pos"()
    goto alt568_end
  alt568_1:
.annotate "line", 269
  # rx subrule "ws" subtype=method negate=
    rx564_cur."!cursor_pos"(rx564_pos)
    $P10 = rx564_cur."ws"()
    unless $P10, rx564_fail
    rx564_pos = $P10."pos"()
  # rx subrule "routine_declarator" subtype=capture negate=
    rx564_cur."!cursor_pos"(rx564_pos)
    $P10 = rx564_cur."routine_declarator"()
    unless $P10, rx564_fail
    rx564_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx564_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx564_cur."!cursor_pos"(rx564_pos)
    $P10 = rx564_cur."ws"()
    unless $P10, rx564_fail
    rx564_pos = $P10."pos"()
  alt568_end:
.annotate "line", 267
  # rx pass
    rx564_cur."!cursor_pass"(rx564_pos, "scoped")
    rx564_cur."!cursor_debug"("PASS  ", "scoped", " at pos=", rx564_pos)
    .return (rx564_cur)
  rx564_fail:
.annotate "line", 4
    (rx564_rep, rx564_pos, $I10, $P10) = rx564_cur."!mark_fail"(0)
    lt rx564_pos, -1, rx564_done
    eq rx564_pos, -1, rx564_fail
    jump $I10
  rx564_done:
    rx564_cur."!cursor_fail"()
    rx564_cur."!cursor_debug"("FAIL  ", "scoped")
    .return (rx564_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("140_1266334190.64822") :method
.annotate "line", 4
    new $P566, "ResizablePMCArray"
    push $P566, ""
    push $P566, ""
    .return ($P566)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("141_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx574_tgt
    .local int rx574_pos
    .local int rx574_off
    .local int rx574_eos
    .local int rx574_rep
    .local pmc rx574_cur
    (rx574_cur, rx574_pos, rx574_tgt) = self."!cursor_start"()
    rx574_cur."!cursor_debug"("START ", "variable_declarator")
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
    ne $I10, -1, rxscan578_done
    goto rxscan578_scan
  rxscan578_loop:
    ($P10) = rx574_cur."from"()
    inc $P10
    set rx574_pos, $P10
    ge rx574_pos, rx574_eos, rxscan578_done
  rxscan578_scan:
    set_addr $I10, rxscan578_loop
    rx574_cur."!mark_push"(0, rx574_pos, $I10)
  rxscan578_done:
.annotate "line", 272
  # rx subrule "variable" subtype=capture negate=
    rx574_cur."!cursor_pos"(rx574_pos)
    $P10 = rx574_cur."variable"()
    unless $P10, rx574_fail
    rx574_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx574_pos = $P10."pos"()
  # rx pass
    rx574_cur."!cursor_pass"(rx574_pos, "variable_declarator")
    rx574_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx574_pos)
    .return (rx574_cur)
  rx574_fail:
.annotate "line", 4
    (rx574_rep, rx574_pos, $I10, $P10) = rx574_cur."!mark_fail"(0)
    lt rx574_pos, -1, rx574_done
    eq rx574_pos, -1, rx574_fail
    jump $I10
  rx574_done:
    rx574_cur."!cursor_fail"()
    rx574_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx574_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("142_1266334190.64822") :method
.annotate "line", 4
    $P576 = self."!PREFIX__!subrule"("variable", "")
    new $P577, "ResizablePMCArray"
    push $P577, $P576
    .return ($P577)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("143_1266334190.64822") :method
.annotate "line", 274
    $P580 = self."!protoregex"("routine_declarator")
    .return ($P580)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("144_1266334190.64822") :method
.annotate "line", 274
    $P582 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P582)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("145_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx584_tgt
    .local int rx584_pos
    .local int rx584_off
    .local int rx584_eos
    .local int rx584_rep
    .local pmc rx584_cur
    (rx584_cur, rx584_pos, rx584_tgt) = self."!cursor_start"()
    rx584_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
    .lex unicode:"$\x{a2}", rx584_cur
    .local pmc match
    .lex "$/", match
    length rx584_eos, rx584_tgt
    set rx584_off, 0
    lt rx584_pos, 2, rx584_start
    sub rx584_off, rx584_pos, 1
    substr rx584_tgt, rx584_tgt, rx584_off
  rx584_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan588_done
    goto rxscan588_scan
  rxscan588_loop:
    ($P10) = rx584_cur."from"()
    inc $P10
    set rx584_pos, $P10
    ge rx584_pos, rx584_eos, rxscan588_done
  rxscan588_scan:
    set_addr $I10, rxscan588_loop
    rx584_cur."!mark_push"(0, rx584_pos, $I10)
  rxscan588_done:
.annotate "line", 275
  # rx subcapture "sym"
    set_addr $I10, rxcap_589_fail
    rx584_cur."!mark_push"(0, rx584_pos, $I10)
  # rx literal  "sub"
    add $I11, rx584_pos, 3
    gt $I11, rx584_eos, rx584_fail
    sub $I11, rx584_pos, rx584_off
    substr $S10, rx584_tgt, $I11, 3
    ne $S10, "sub", rx584_fail
    add rx584_pos, 3
    set_addr $I10, rxcap_589_fail
    ($I12, $I11) = rx584_cur."!mark_peek"($I10)
    rx584_cur."!cursor_pos"($I11)
    ($P10) = rx584_cur."!cursor_start"()
    $P10."!cursor_pass"(rx584_pos, "")
    rx584_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_589_done
  rxcap_589_fail:
    goto rx584_fail
  rxcap_589_done:
  # rx subrule "routine_def" subtype=capture negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."routine_def"()
    unless $P10, rx584_fail
    rx584_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx584_pos = $P10."pos"()
  # rx pass
    rx584_cur."!cursor_pass"(rx584_pos, "routine_declarator:sym<sub>")
    rx584_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx584_pos)
    .return (rx584_cur)
  rx584_fail:
.annotate "line", 4
    (rx584_rep, rx584_pos, $I10, $P10) = rx584_cur."!mark_fail"(0)
    lt rx584_pos, -1, rx584_done
    eq rx584_pos, -1, rx584_fail
    jump $I10
  rx584_done:
    rx584_cur."!cursor_fail"()
    rx584_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx584_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("146_1266334190.64822") :method
.annotate "line", 4
    $P586 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P587, "ResizablePMCArray"
    push $P587, $P586
    .return ($P587)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("147_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx591_tgt
    .local int rx591_pos
    .local int rx591_off
    .local int rx591_eos
    .local int rx591_rep
    .local pmc rx591_cur
    (rx591_cur, rx591_pos, rx591_tgt) = self."!cursor_start"()
    rx591_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
    .lex unicode:"$\x{a2}", rx591_cur
    .local pmc match
    .lex "$/", match
    length rx591_eos, rx591_tgt
    set rx591_off, 0
    lt rx591_pos, 2, rx591_start
    sub rx591_off, rx591_pos, 1
    substr rx591_tgt, rx591_tgt, rx591_off
  rx591_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan595_done
    goto rxscan595_scan
  rxscan595_loop:
    ($P10) = rx591_cur."from"()
    inc $P10
    set rx591_pos, $P10
    ge rx591_pos, rx591_eos, rxscan595_done
  rxscan595_scan:
    set_addr $I10, rxscan595_loop
    rx591_cur."!mark_push"(0, rx591_pos, $I10)
  rxscan595_done:
.annotate "line", 276
  # rx subcapture "sym"
    set_addr $I10, rxcap_596_fail
    rx591_cur."!mark_push"(0, rx591_pos, $I10)
  # rx literal  "method"
    add $I11, rx591_pos, 6
    gt $I11, rx591_eos, rx591_fail
    sub $I11, rx591_pos, rx591_off
    substr $S10, rx591_tgt, $I11, 6
    ne $S10, "method", rx591_fail
    add rx591_pos, 6
    set_addr $I10, rxcap_596_fail
    ($I12, $I11) = rx591_cur."!mark_peek"($I10)
    rx591_cur."!cursor_pos"($I11)
    ($P10) = rx591_cur."!cursor_start"()
    $P10."!cursor_pass"(rx591_pos, "")
    rx591_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_596_done
  rxcap_596_fail:
    goto rx591_fail
  rxcap_596_done:
  # rx subrule "method_def" subtype=capture negate=
    rx591_cur."!cursor_pos"(rx591_pos)
    $P10 = rx591_cur."method_def"()
    unless $P10, rx591_fail
    rx591_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx591_pos = $P10."pos"()
  # rx pass
    rx591_cur."!cursor_pass"(rx591_pos, "routine_declarator:sym<method>")
    rx591_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx591_pos)
    .return (rx591_cur)
  rx591_fail:
.annotate "line", 4
    (rx591_rep, rx591_pos, $I10, $P10) = rx591_cur."!mark_fail"(0)
    lt rx591_pos, -1, rx591_done
    eq rx591_pos, -1, rx591_fail
    jump $I10
  rx591_done:
    rx591_cur."!cursor_fail"()
    rx591_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx591_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("148_1266334190.64822") :method
.annotate "line", 4
    $P593 = self."!PREFIX__!subrule"("method_def", "method")
    new $P594, "ResizablePMCArray"
    push $P594, $P593
    .return ($P594)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("149_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx598_tgt
    .local int rx598_pos
    .local int rx598_off
    .local int rx598_eos
    .local int rx598_rep
    .local pmc rx598_cur
    (rx598_cur, rx598_pos, rx598_tgt) = self."!cursor_start"()
    rx598_cur."!cursor_debug"("START ", "routine_def")
    rx598_cur."!cursor_caparray"("sigil", "deflongname")
    .lex unicode:"$\x{a2}", rx598_cur
    .local pmc match
    .lex "$/", match
    length rx598_eos, rx598_tgt
    set rx598_off, 0
    lt rx598_pos, 2, rx598_start
    sub rx598_off, rx598_pos, 1
    substr rx598_tgt, rx598_tgt, rx598_off
  rx598_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan601_done
    goto rxscan601_scan
  rxscan601_loop:
    ($P10) = rx598_cur."from"()
    inc $P10
    set rx598_pos, $P10
    ge rx598_pos, rx598_eos, rxscan601_done
  rxscan601_scan:
    set_addr $I10, rxscan601_loop
    rx598_cur."!mark_push"(0, rx598_pos, $I10)
  rxscan601_done:
.annotate "line", 278
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
.annotate "line", 279
  # rx rxquantr603 ** 0..1
    set_addr $I609, rxquantr603_done
    rx598_cur."!mark_push"(0, rx598_pos, $I609)
  rxquantr603_loop:
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
  # rx subcapture "sigil"
    set_addr $I10, rxcap_607_fail
    rx598_cur."!mark_push"(0, rx598_pos, $I10)
  # rx rxquantr605 ** 0..1
    set_addr $I606, rxquantr605_done
    rx598_cur."!mark_push"(0, rx598_pos, $I606)
  rxquantr605_loop:
  # rx literal  "&"
    add $I11, rx598_pos, 1
    gt $I11, rx598_eos, rx598_fail
    sub $I11, rx598_pos, rx598_off
    substr $S10, rx598_tgt, $I11, 1
    ne $S10, "&", rx598_fail
    add rx598_pos, 1
    (rx598_rep) = rx598_cur."!mark_commit"($I606)
  rxquantr605_done:
    set_addr $I10, rxcap_607_fail
    ($I12, $I11) = rx598_cur."!mark_peek"($I10)
    rx598_cur."!cursor_pos"($I11)
    ($P10) = rx598_cur."!cursor_start"()
    $P10."!cursor_pass"(rx598_pos, "")
    rx598_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_607_done
  rxcap_607_fail:
    goto rx598_fail
  rxcap_607_done:
  # rx subrule "deflongname" subtype=capture negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."deflongname"()
    unless $P10, rx598_fail
    rx598_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx598_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
    (rx598_rep) = rx598_cur."!mark_commit"($I609)
  rxquantr603_done:
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
.annotate "line", 280
  # rx subrule "newpad" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."newpad"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
  alt612_0:
.annotate "line", 281
    set_addr $I10, alt612_1
    rx598_cur."!mark_push"(0, rx598_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx598_pos, 1
    gt $I11, rx598_eos, rx598_fail
    sub $I11, rx598_pos, rx598_off
    substr $S10, rx598_tgt, $I11, 1
    ne $S10, "(", rx598_fail
    add rx598_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."signature"()
    unless $P10, rx598_fail
    rx598_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx598_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx598_pos, 1
    gt $I11, rx598_eos, rx598_fail
    sub $I11, rx598_pos, rx598_off
    substr $S10, rx598_tgt, $I11, 1
    ne $S10, ")", rx598_fail
    add rx598_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
    goto alt612_end
  alt612_1:
.annotate "line", 282
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
  alt612_end:
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
.annotate "line", 283
  # rx subrule "blockoid" subtype=capture negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."blockoid"()
    unless $P10, rx598_fail
    rx598_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx598_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
.annotate "line", 278
  # rx pass
    rx598_cur."!cursor_pass"(rx598_pos, "routine_def")
    rx598_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx598_pos)
    .return (rx598_cur)
  rx598_fail:
.annotate "line", 4
    (rx598_rep, rx598_pos, $I10, $P10) = rx598_cur."!mark_fail"(0)
    lt rx598_pos, -1, rx598_done
    eq rx598_pos, -1, rx598_fail
    jump $I10
  rx598_done:
    rx598_cur."!cursor_fail"()
    rx598_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx598_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("150_1266334190.64822") :method
.annotate "line", 4
    new $P600, "ResizablePMCArray"
    push $P600, ""
    .return ($P600)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("151_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx622_tgt
    .local int rx622_pos
    .local int rx622_off
    .local int rx622_eos
    .local int rx622_rep
    .local pmc rx622_cur
    (rx622_cur, rx622_pos, rx622_tgt) = self."!cursor_start"()
    rx622_cur."!cursor_debug"("START ", "method_def")
    rx622_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx622_cur
    .local pmc match
    .lex "$/", match
    length rx622_eos, rx622_tgt
    set rx622_off, 0
    lt rx622_pos, 2, rx622_start
    sub rx622_off, rx622_pos, 1
    substr rx622_tgt, rx622_tgt, rx622_off
  rx622_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan625_done
    goto rxscan625_scan
  rxscan625_loop:
    ($P10) = rx622_cur."from"()
    inc $P10
    set rx622_pos, $P10
    ge rx622_pos, rx622_eos, rxscan625_done
  rxscan625_scan:
    set_addr $I10, rxscan625_loop
    rx622_cur."!mark_push"(0, rx622_pos, $I10)
  rxscan625_done:
.annotate "line", 286
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
.annotate "line", 287
  # rx rxquantr627 ** 0..1
    set_addr $I628, rxquantr627_done
    rx622_cur."!mark_push"(0, rx622_pos, $I628)
  rxquantr627_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."deflongname"()
    unless $P10, rx622_fail
    rx622_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx622_pos = $P10."pos"()
    (rx622_rep) = rx622_cur."!mark_commit"($I628)
  rxquantr627_done:
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
.annotate "line", 288
  # rx subrule "newpad" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."newpad"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
  alt631_0:
.annotate "line", 289
    set_addr $I10, alt631_1
    rx622_cur."!mark_push"(0, rx622_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx622_pos, 1
    gt $I11, rx622_eos, rx622_fail
    sub $I11, rx622_pos, rx622_off
    substr $S10, rx622_tgt, $I11, 1
    ne $S10, "(", rx622_fail
    add rx622_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."signature"()
    unless $P10, rx622_fail
    rx622_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx622_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx622_pos, 1
    gt $I11, rx622_eos, rx622_fail
    sub $I11, rx622_pos, rx622_off
    substr $S10, rx622_tgt, $I11, 1
    ne $S10, ")", rx622_fail
    add rx622_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
    goto alt631_end
  alt631_1:
.annotate "line", 290
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
  alt631_end:
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
.annotate "line", 291
  # rx subrule "blockoid" subtype=capture negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."blockoid"()
    unless $P10, rx622_fail
    rx622_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx622_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
.annotate "line", 286
  # rx pass
    rx622_cur."!cursor_pass"(rx622_pos, "method_def")
    rx622_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx622_pos)
    .return (rx622_cur)
  rx622_fail:
.annotate "line", 4
    (rx622_rep, rx622_pos, $I10, $P10) = rx622_cur."!mark_fail"(0)
    lt rx622_pos, -1, rx622_done
    eq rx622_pos, -1, rx622_fail
    jump $I10
  rx622_done:
    rx622_cur."!cursor_fail"()
    rx622_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx622_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("152_1266334190.64822") :method
.annotate "line", 4
    new $P624, "ResizablePMCArray"
    push $P624, ""
    .return ($P624)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("153_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx641_tgt
    .local int rx641_pos
    .local int rx641_off
    .local int rx641_eos
    .local int rx641_rep
    .local pmc rx641_cur
    (rx641_cur, rx641_pos, rx641_tgt) = self."!cursor_start"()
    rx641_cur."!cursor_debug"("START ", "signature")
    rx641_cur."!cursor_caparray"("parameter")
    .lex unicode:"$\x{a2}", rx641_cur
    .local pmc match
    .lex "$/", match
    length rx641_eos, rx641_tgt
    set rx641_off, 0
    lt rx641_pos, 2, rx641_start
    sub rx641_off, rx641_pos, 1
    substr rx641_tgt, rx641_tgt, rx641_off
  rx641_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan644_done
    goto rxscan644_scan
  rxscan644_loop:
    ($P10) = rx641_cur."from"()
    inc $P10
    set rx641_pos, $P10
    ge rx641_pos, rx641_eos, rxscan644_done
  rxscan644_scan:
    set_addr $I10, rxscan644_loop
    rx641_cur."!mark_push"(0, rx641_pos, $I10)
  rxscan644_done:
.annotate "line", 294
  # rx rxquantr645 ** 0..1
    set_addr $I648, rxquantr645_done
    rx641_cur."!mark_push"(0, rx641_pos, $I648)
  rxquantr645_loop:
  # rx rxquantr646 ** 1..*
    set_addr $I647, rxquantr646_done
    rx641_cur."!mark_push"(0, -1, $I647)
  rxquantr646_loop:
  # rx subrule "ws" subtype=method negate=
    rx641_cur."!cursor_pos"(rx641_pos)
    $P10 = rx641_cur."ws"()
    unless $P10, rx641_fail
    rx641_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx641_cur."!cursor_pos"(rx641_pos)
    $P10 = rx641_cur."parameter"()
    unless $P10, rx641_fail
    rx641_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx641_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx641_cur."!cursor_pos"(rx641_pos)
    $P10 = rx641_cur."ws"()
    unless $P10, rx641_fail
    rx641_pos = $P10."pos"()
    (rx641_rep) = rx641_cur."!mark_commit"($I647)
    rx641_cur."!mark_push"(rx641_rep, rx641_pos, $I647)
  # rx literal  ","
    add $I11, rx641_pos, 1
    gt $I11, rx641_eos, rx641_fail
    sub $I11, rx641_pos, rx641_off
    substr $S10, rx641_tgt, $I11, 1
    ne $S10, ",", rx641_fail
    add rx641_pos, 1
    goto rxquantr646_loop
  rxquantr646_done:
    (rx641_rep) = rx641_cur."!mark_commit"($I648)
  rxquantr645_done:
  # rx pass
    rx641_cur."!cursor_pass"(rx641_pos, "signature")
    rx641_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx641_pos)
    .return (rx641_cur)
  rx641_fail:
.annotate "line", 4
    (rx641_rep, rx641_pos, $I10, $P10) = rx641_cur."!mark_fail"(0)
    lt rx641_pos, -1, rx641_done
    eq rx641_pos, -1, rx641_fail
    jump $I10
  rx641_done:
    rx641_cur."!cursor_fail"()
    rx641_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx641_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("154_1266334190.64822") :method
.annotate "line", 4
    new $P643, "ResizablePMCArray"
    push $P643, ""
    .return ($P643)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("155_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx650_tgt
    .local int rx650_pos
    .local int rx650_off
    .local int rx650_eos
    .local int rx650_rep
    .local pmc rx650_cur
    (rx650_cur, rx650_pos, rx650_tgt) = self."!cursor_start"()
    rx650_cur."!cursor_debug"("START ", "parameter")
    rx650_cur."!cursor_caparray"("default_value")
    .lex unicode:"$\x{a2}", rx650_cur
    .local pmc match
    .lex "$/", match
    length rx650_eos, rx650_tgt
    set rx650_off, 0
    lt rx650_pos, 2, rx650_start
    sub rx650_off, rx650_pos, 1
    substr rx650_tgt, rx650_tgt, rx650_off
  rx650_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan656_done
    goto rxscan656_scan
  rxscan656_loop:
    ($P10) = rx650_cur."from"()
    inc $P10
    set rx650_pos, $P10
    ge rx650_pos, rx650_eos, rxscan656_done
  rxscan656_scan:
    set_addr $I10, rxscan656_loop
    rx650_cur."!mark_push"(0, rx650_pos, $I10)
  rxscan656_done:
  alt657_0:
.annotate "line", 297
    set_addr $I10, alt657_1
    rx650_cur."!mark_push"(0, rx650_pos, $I10)
.annotate "line", 298
  # rx subcapture "quant"
    set_addr $I10, rxcap_658_fail
    rx650_cur."!mark_push"(0, rx650_pos, $I10)
  # rx literal  "*"
    add $I11, rx650_pos, 1
    gt $I11, rx650_eos, rx650_fail
    sub $I11, rx650_pos, rx650_off
    substr $S10, rx650_tgt, $I11, 1
    ne $S10, "*", rx650_fail
    add rx650_pos, 1
    set_addr $I10, rxcap_658_fail
    ($I12, $I11) = rx650_cur."!mark_peek"($I10)
    rx650_cur."!cursor_pos"($I11)
    ($P10) = rx650_cur."!cursor_start"()
    $P10."!cursor_pass"(rx650_pos, "")
    rx650_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_658_done
  rxcap_658_fail:
    goto rx650_fail
  rxcap_658_done:
  # rx subrule "param_var" subtype=capture negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."param_var"()
    unless $P10, rx650_fail
    rx650_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx650_pos = $P10."pos"()
    goto alt657_end
  alt657_1:
  alt659_0:
.annotate "line", 299
    set_addr $I10, alt659_1
    rx650_cur."!mark_push"(0, rx650_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."param_var"()
    unless $P10, rx650_fail
    rx650_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx650_pos = $P10."pos"()
    goto alt659_end
  alt659_1:
  # rx subrule "named_param" subtype=capture negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."named_param"()
    unless $P10, rx650_fail
    rx650_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx650_pos = $P10."pos"()
  alt659_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_661_fail
    rx650_cur."!mark_push"(0, rx650_pos, $I10)
  alt660_0:
    set_addr $I10, alt660_1
    rx650_cur."!mark_push"(0, rx650_pos, $I10)
  # rx literal  "?"
    add $I11, rx650_pos, 1
    gt $I11, rx650_eos, rx650_fail
    sub $I11, rx650_pos, rx650_off
    substr $S10, rx650_tgt, $I11, 1
    ne $S10, "?", rx650_fail
    add rx650_pos, 1
    goto alt660_end
  alt660_1:
    set_addr $I10, alt660_2
    rx650_cur."!mark_push"(0, rx650_pos, $I10)
  # rx literal  "!"
    add $I11, rx650_pos, 1
    gt $I11, rx650_eos, rx650_fail
    sub $I11, rx650_pos, rx650_off
    substr $S10, rx650_tgt, $I11, 1
    ne $S10, "!", rx650_fail
    add rx650_pos, 1
    goto alt660_end
  alt660_2:
  alt660_end:
    set_addr $I10, rxcap_661_fail
    ($I12, $I11) = rx650_cur."!mark_peek"($I10)
    rx650_cur."!cursor_pos"($I11)
    ($P10) = rx650_cur."!cursor_start"()
    $P10."!cursor_pass"(rx650_pos, "")
    rx650_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_661_done
  rxcap_661_fail:
    goto rx650_fail
  rxcap_661_done:
  alt657_end:
.annotate "line", 301
  # rx rxquantr662 ** 0..1
    set_addr $I663, rxquantr662_done
    rx650_cur."!mark_push"(0, rx650_pos, $I663)
  rxquantr662_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."default_value"()
    unless $P10, rx650_fail
    rx650_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("default_value")
    rx650_pos = $P10."pos"()
    (rx650_rep) = rx650_cur."!mark_commit"($I663)
  rxquantr662_done:
.annotate "line", 296
  # rx pass
    rx650_cur."!cursor_pass"(rx650_pos, "parameter")
    rx650_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx650_pos)
    .return (rx650_cur)
  rx650_fail:
.annotate "line", 4
    (rx650_rep, rx650_pos, $I10, $P10) = rx650_cur."!mark_fail"(0)
    lt rx650_pos, -1, rx650_done
    eq rx650_pos, -1, rx650_fail
    jump $I10
  rx650_done:
    rx650_cur."!cursor_fail"()
    rx650_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx650_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("156_1266334190.64822") :method
.annotate "line", 4
    $P652 = self."!PREFIX__!subrule"("named_param", "")
    $P653 = self."!PREFIX__!subrule"("param_var", "")
    $P654 = self."!PREFIX__!subrule"("param_var", "*")
    new $P655, "ResizablePMCArray"
    push $P655, $P652
    push $P655, $P653
    push $P655, $P654
    .return ($P655)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("157_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx665_tgt
    .local int rx665_pos
    .local int rx665_off
    .local int rx665_eos
    .local int rx665_rep
    .local pmc rx665_cur
    (rx665_cur, rx665_pos, rx665_tgt) = self."!cursor_start"()
    rx665_cur."!cursor_debug"("START ", "param_var")
    rx665_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx665_cur
    .local pmc match
    .lex "$/", match
    length rx665_eos, rx665_tgt
    set rx665_off, 0
    lt rx665_pos, 2, rx665_start
    sub rx665_off, rx665_pos, 1
    substr rx665_tgt, rx665_tgt, rx665_off
  rx665_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan669_done
    goto rxscan669_scan
  rxscan669_loop:
    ($P10) = rx665_cur."from"()
    inc $P10
    set rx665_pos, $P10
    ge rx665_pos, rx665_eos, rxscan669_done
  rxscan669_scan:
    set_addr $I10, rxscan669_loop
    rx665_cur."!mark_push"(0, rx665_pos, $I10)
  rxscan669_done:
.annotate "line", 305
  # rx subrule "sigil" subtype=capture negate=
    rx665_cur."!cursor_pos"(rx665_pos)
    $P10 = rx665_cur."sigil"()
    unless $P10, rx665_fail
    rx665_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx665_pos = $P10."pos"()
  # rx rxquantr670 ** 0..1
    set_addr $I671, rxquantr670_done
    rx665_cur."!mark_push"(0, rx665_pos, $I671)
  rxquantr670_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx665_cur."!cursor_pos"(rx665_pos)
    $P10 = rx665_cur."twigil"()
    unless $P10, rx665_fail
    rx665_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx665_pos = $P10."pos"()
    (rx665_rep) = rx665_cur."!mark_commit"($I671)
  rxquantr670_done:
  alt672_0:
.annotate "line", 306
    set_addr $I10, alt672_1
    rx665_cur."!mark_push"(0, rx665_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx665_cur."!cursor_pos"(rx665_pos)
    $P10 = rx665_cur."ident"()
    unless $P10, rx665_fail
    rx665_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx665_pos = $P10."pos"()
    goto alt672_end
  alt672_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_673_fail
    rx665_cur."!mark_push"(0, rx665_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx665_pos, rx665_eos, rx665_fail
    sub $I10, rx665_pos, rx665_off
    substr $S10, rx665_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx665_fail
    inc rx665_pos
    set_addr $I10, rxcap_673_fail
    ($I12, $I11) = rx665_cur."!mark_peek"($I10)
    rx665_cur."!cursor_pos"($I11)
    ($P10) = rx665_cur."!cursor_start"()
    $P10."!cursor_pass"(rx665_pos, "")
    rx665_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_673_done
  rxcap_673_fail:
    goto rx665_fail
  rxcap_673_done:
  alt672_end:
.annotate "line", 304
  # rx pass
    rx665_cur."!cursor_pass"(rx665_pos, "param_var")
    rx665_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx665_pos)
    .return (rx665_cur)
  rx665_fail:
.annotate "line", 4
    (rx665_rep, rx665_pos, $I10, $P10) = rx665_cur."!mark_fail"(0)
    lt rx665_pos, -1, rx665_done
    eq rx665_pos, -1, rx665_fail
    jump $I10
  rx665_done:
    rx665_cur."!cursor_fail"()
    rx665_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx665_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("158_1266334190.64822") :method
.annotate "line", 4
    $P667 = self."!PREFIX__!subrule"("sigil", "")
    new $P668, "ResizablePMCArray"
    push $P668, $P667
    .return ($P668)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("159_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx675_tgt
    .local int rx675_pos
    .local int rx675_off
    .local int rx675_eos
    .local int rx675_rep
    .local pmc rx675_cur
    (rx675_cur, rx675_pos, rx675_tgt) = self."!cursor_start"()
    rx675_cur."!cursor_debug"("START ", "named_param")
    .lex unicode:"$\x{a2}", rx675_cur
    .local pmc match
    .lex "$/", match
    length rx675_eos, rx675_tgt
    set rx675_off, 0
    lt rx675_pos, 2, rx675_start
    sub rx675_off, rx675_pos, 1
    substr rx675_tgt, rx675_tgt, rx675_off
  rx675_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan679_done
    goto rxscan679_scan
  rxscan679_loop:
    ($P10) = rx675_cur."from"()
    inc $P10
    set rx675_pos, $P10
    ge rx675_pos, rx675_eos, rxscan679_done
  rxscan679_scan:
    set_addr $I10, rxscan679_loop
    rx675_cur."!mark_push"(0, rx675_pos, $I10)
  rxscan679_done:
.annotate "line", 310
  # rx literal  ":"
    add $I11, rx675_pos, 1
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 1
    ne $S10, ":", rx675_fail
    add rx675_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."param_var"()
    unless $P10, rx675_fail
    rx675_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx675_pos = $P10."pos"()
.annotate "line", 309
  # rx pass
    rx675_cur."!cursor_pass"(rx675_pos, "named_param")
    rx675_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx675_pos)
    .return (rx675_cur)
  rx675_fail:
.annotate "line", 4
    (rx675_rep, rx675_pos, $I10, $P10) = rx675_cur."!mark_fail"(0)
    lt rx675_pos, -1, rx675_done
    eq rx675_pos, -1, rx675_fail
    jump $I10
  rx675_done:
    rx675_cur."!cursor_fail"()
    rx675_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx675_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("160_1266334190.64822") :method
.annotate "line", 4
    $P677 = self."!PREFIX__!subrule"("param_var", ":")
    new $P678, "ResizablePMCArray"
    push $P678, $P677
    .return ($P678)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("161_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx681_tgt
    .local int rx681_pos
    .local int rx681_off
    .local int rx681_eos
    .local int rx681_rep
    .local pmc rx681_cur
    (rx681_cur, rx681_pos, rx681_tgt) = self."!cursor_start"()
    rx681_cur."!cursor_debug"("START ", "default_value")
    .lex unicode:"$\x{a2}", rx681_cur
    .local pmc match
    .lex "$/", match
    length rx681_eos, rx681_tgt
    set rx681_off, 0
    lt rx681_pos, 2, rx681_start
    sub rx681_off, rx681_pos, 1
    substr rx681_tgt, rx681_tgt, rx681_off
  rx681_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan684_done
    goto rxscan684_scan
  rxscan684_loop:
    ($P10) = rx681_cur."from"()
    inc $P10
    set rx681_pos, $P10
    ge rx681_pos, rx681_eos, rxscan684_done
  rxscan684_scan:
    set_addr $I10, rxscan684_loop
    rx681_cur."!mark_push"(0, rx681_pos, $I10)
  rxscan684_done:
.annotate "line", 313
  # rx subrule "ws" subtype=method negate=
    rx681_cur."!cursor_pos"(rx681_pos)
    $P10 = rx681_cur."ws"()
    unless $P10, rx681_fail
    rx681_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx681_pos, 1
    gt $I11, rx681_eos, rx681_fail
    sub $I11, rx681_pos, rx681_off
    substr $S10, rx681_tgt, $I11, 1
    ne $S10, "=", rx681_fail
    add rx681_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx681_cur."!cursor_pos"(rx681_pos)
    $P10 = rx681_cur."ws"()
    unless $P10, rx681_fail
    rx681_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx681_cur."!cursor_pos"(rx681_pos)
    $P10 = rx681_cur."EXPR"("i=")
    unless $P10, rx681_fail
    rx681_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx681_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx681_cur."!cursor_pos"(rx681_pos)
    $P10 = rx681_cur."ws"()
    unless $P10, rx681_fail
    rx681_pos = $P10."pos"()
  # rx pass
    rx681_cur."!cursor_pass"(rx681_pos, "default_value")
    rx681_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx681_pos)
    .return (rx681_cur)
  rx681_fail:
.annotate "line", 4
    (rx681_rep, rx681_pos, $I10, $P10) = rx681_cur."!mark_fail"(0)
    lt rx681_pos, -1, rx681_done
    eq rx681_pos, -1, rx681_fail
    jump $I10
  rx681_done:
    rx681_cur."!cursor_fail"()
    rx681_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx681_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("162_1266334190.64822") :method
.annotate "line", 4
    new $P683, "ResizablePMCArray"
    push $P683, ""
    .return ($P683)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("163_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx689_tgt
    .local int rx689_pos
    .local int rx689_off
    .local int rx689_eos
    .local int rx689_rep
    .local pmc rx689_cur
    (rx689_cur, rx689_pos, rx689_tgt) = self."!cursor_start"()
    rx689_cur."!cursor_debug"("START ", "regex_declarator")
    rx689_cur."!cursor_caparray"("signature")
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
    ne $I10, -1, rxscan692_done
    goto rxscan692_scan
  rxscan692_loop:
    ($P10) = rx689_cur."from"()
    inc $P10
    set rx689_pos, $P10
    ge rx689_pos, rx689_eos, rxscan692_done
  rxscan692_scan:
    set_addr $I10, rxscan692_loop
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
  rxscan692_done:
.annotate "line", 315
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  alt694_0:
.annotate "line", 316
    set_addr $I10, alt694_1
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
.annotate "line", 317
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_696_fail
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
  # rx literal  "proto"
    add $I11, rx689_pos, 5
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 5
    ne $S10, "proto", rx689_fail
    add rx689_pos, 5
    set_addr $I10, rxcap_696_fail
    ($I12, $I11) = rx689_cur."!mark_peek"($I10)
    rx689_cur."!cursor_pos"($I11)
    ($P10) = rx689_cur."!cursor_start"()
    $P10."!cursor_pass"(rx689_pos, "")
    rx689_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_696_done
  rxcap_696_fail:
    goto rx689_fail
  rxcap_696_done:
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  alt698_0:
    set_addr $I10, alt698_1
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
  # rx literal  "regex"
    add $I11, rx689_pos, 5
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 5
    ne $S10, "regex", rx689_fail
    add rx689_pos, 5
    goto alt698_end
  alt698_1:
    set_addr $I10, alt698_2
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
  # rx literal  "token"
    add $I11, rx689_pos, 5
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 5
    ne $S10, "token", rx689_fail
    add rx689_pos, 5
    goto alt698_end
  alt698_2:
  # rx literal  "rule"
    add $I11, rx689_pos, 4
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 4
    ne $S10, "rule", rx689_fail
    add rx689_pos, 4
  alt698_end:
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
.annotate "line", 318
  # rx subrule "deflongname" subtype=capture negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."deflongname"()
    unless $P10, rx689_fail
    rx689_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx689_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
.annotate "line", 319
  # rx literal  "{"
    add $I11, rx689_pos, 1
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 1
    ne $S10, "{", rx689_fail
    add rx689_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx689_pos, 5
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 5
    ne $S10, "<...>", rx689_fail
    add rx689_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx689_pos, 1
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 1
    ne $S10, "}", rx689_fail
    add rx689_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ENDSTMT"()
    unless $P10, rx689_fail
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
.annotate "line", 317
    goto alt694_end
  alt694_1:
.annotate "line", 320
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_706_fail
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
  alt705_0:
    set_addr $I10, alt705_1
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
  # rx literal  "regex"
    add $I11, rx689_pos, 5
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 5
    ne $S10, "regex", rx689_fail
    add rx689_pos, 5
    goto alt705_end
  alt705_1:
    set_addr $I10, alt705_2
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
  # rx literal  "token"
    add $I11, rx689_pos, 5
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 5
    ne $S10, "token", rx689_fail
    add rx689_pos, 5
    goto alt705_end
  alt705_2:
  # rx literal  "rule"
    add $I11, rx689_pos, 4
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 4
    ne $S10, "rule", rx689_fail
    add rx689_pos, 4
  alt705_end:
    set_addr $I10, rxcap_706_fail
    ($I12, $I11) = rx689_cur."!mark_peek"($I10)
    rx689_cur."!cursor_pos"($I11)
    ($P10) = rx689_cur."!cursor_start"()
    $P10."!cursor_pass"(rx689_pos, "")
    rx689_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_706_done
  rxcap_706_fail:
    goto rx689_fail
  rxcap_706_done:
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
.annotate "line", 321
  # rx subrule "deflongname" subtype=capture negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."deflongname"()
    unless $P10, rx689_fail
    rx689_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx689_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
.annotate "line", 322
  # rx subrule "newpad" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."newpad"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
.annotate "line", 323
  # rx rxquantr710 ** 0..1
    set_addr $I715, rxquantr710_done
    rx689_cur."!mark_push"(0, rx689_pos, $I715)
  rxquantr710_loop:
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx689_pos, 1
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 1
    ne $S10, "(", rx689_fail
    add rx689_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."signature"()
    unless $P10, rx689_fail
    rx689_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx689_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx689_pos, 1
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 1
    ne $S10, ")", rx689_fail
    add rx689_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
    (rx689_rep) = rx689_cur."!mark_commit"($I715)
  rxquantr710_done:
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
.annotate "line", 324
  # rx reduce name="regex_declarator" key="open"
    rx689_cur."!cursor_pos"(rx689_pos)
    rx689_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
.annotate "line", 325
  # rx literal  "{"
    add $I11, rx689_pos, 1
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 1
    ne $S10, "{", rx689_fail
    add rx689_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."LANG"("Regex", "nibbler")
    unless $P10, rx689_fail
    rx689_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx689_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx689_pos, 1
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 1
    ne $S10, "}", rx689_fail
    add rx689_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ENDSTMT"()
    unless $P10, rx689_fail
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  alt694_end:
.annotate "line", 326
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
.annotate "line", 315
  # rx pass
    rx689_cur."!cursor_pass"(rx689_pos, "regex_declarator")
    rx689_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx689_pos)
    .return (rx689_cur)
  rx689_fail:
.annotate "line", 4
    (rx689_rep, rx689_pos, $I10, $P10) = rx689_cur."!mark_fail"(0)
    lt rx689_pos, -1, rx689_done
    eq rx689_pos, -1, rx689_fail
    jump $I10
  rx689_done:
    rx689_cur."!cursor_fail"()
    rx689_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx689_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("164_1266334190.64822") :method
.annotate "line", 4
    new $P691, "ResizablePMCArray"
    push $P691, ""
    .return ($P691)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("165_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx721_tgt
    .local int rx721_pos
    .local int rx721_off
    .local int rx721_eos
    .local int rx721_rep
    .local pmc rx721_cur
    (rx721_cur, rx721_pos, rx721_tgt) = self."!cursor_start"()
    rx721_cur."!cursor_debug"("START ", "dotty")
    rx721_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx721_cur
    .local pmc match
    .lex "$/", match
    length rx721_eos, rx721_tgt
    set rx721_off, 0
    lt rx721_pos, 2, rx721_start
    sub rx721_off, rx721_pos, 1
    substr rx721_tgt, rx721_tgt, rx721_off
  rx721_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan725_done
    goto rxscan725_scan
  rxscan725_loop:
    ($P10) = rx721_cur."from"()
    inc $P10
    set rx721_pos, $P10
    ge rx721_pos, rx721_eos, rxscan725_done
  rxscan725_scan:
    set_addr $I10, rxscan725_loop
    rx721_cur."!mark_push"(0, rx721_pos, $I10)
  rxscan725_done:
.annotate "line", 330
  # rx literal  "."
    add $I11, rx721_pos, 1
    gt $I11, rx721_eos, rx721_fail
    sub $I11, rx721_pos, rx721_off
    substr $S10, rx721_tgt, $I11, 1
    ne $S10, ".", rx721_fail
    add rx721_pos, 1
  alt726_0:
.annotate "line", 331
    set_addr $I10, alt726_1
    rx721_cur."!mark_push"(0, rx721_pos, $I10)
  # rx subrule "identifier" subtype=capture negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."identifier"()
    unless $P10, rx721_fail
    rx721_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=identifier")
    rx721_pos = $P10."pos"()
    goto alt726_end
  alt726_1:
.annotate "line", 332
  # rx enumcharlist negate=0 zerowidth
    ge rx721_pos, rx721_eos, rx721_fail
    sub $I10, rx721_pos, rx721_off
    substr $S10, rx721_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx721_fail
  # rx subrule "quote" subtype=capture negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."quote"()
    unless $P10, rx721_fail
    rx721_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx721_pos = $P10."pos"()
  alt727_0:
.annotate "line", 333
    set_addr $I10, alt727_1
    rx721_cur."!mark_push"(0, rx721_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx721_pos, rx721_eos, rx721_fail
    sub $I10, rx721_pos, rx721_off
    substr $S10, rx721_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx721_fail
    goto alt727_end
  alt727_1:
  # rx subrule "panic" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
  alt727_end:
  alt726_end:
.annotate "line", 339
  # rx rxquantr728 ** 0..1
    set_addr $I730, rxquantr728_done
    rx721_cur."!mark_push"(0, rx721_pos, $I730)
  rxquantr728_loop:
  alt729_0:
.annotate "line", 336
    set_addr $I10, alt729_1
    rx721_cur."!mark_push"(0, rx721_pos, $I10)
.annotate "line", 337
  # rx enumcharlist negate=0 zerowidth
    ge rx721_pos, rx721_eos, rx721_fail
    sub $I10, rx721_pos, rx721_off
    substr $S10, rx721_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx721_fail
  # rx subrule "args" subtype=capture negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."args"()
    unless $P10, rx721_fail
    rx721_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx721_pos = $P10."pos"()
    goto alt729_end
  alt729_1:
.annotate "line", 338
  # rx literal  ":"
    add $I11, rx721_pos, 1
    gt $I11, rx721_eos, rx721_fail
    sub $I11, rx721_pos, rx721_off
    substr $S10, rx721_tgt, $I11, 1
    ne $S10, ":", rx721_fail
    add rx721_pos, 1
  # rx charclass s
    ge rx721_pos, rx721_eos, rx721_fail
    sub $I10, rx721_pos, rx721_off
    is_cclass $I11, 32, rx721_tgt, $I10
    unless $I11, rx721_fail
    inc rx721_pos
  # rx subrule "arglist" subtype=capture negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."arglist"()
    unless $P10, rx721_fail
    rx721_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx721_pos = $P10."pos"()
  alt729_end:
.annotate "line", 339
    (rx721_rep) = rx721_cur."!mark_commit"($I730)
  rxquantr728_done:
.annotate "line", 329
  # rx pass
    rx721_cur."!cursor_pass"(rx721_pos, "dotty")
    rx721_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx721_pos)
    .return (rx721_cur)
  rx721_fail:
.annotate "line", 4
    (rx721_rep, rx721_pos, $I10, $P10) = rx721_cur."!mark_fail"(0)
    lt rx721_pos, -1, rx721_done
    eq rx721_pos, -1, rx721_fail
    jump $I10
  rx721_done:
    rx721_cur."!cursor_fail"()
    rx721_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx721_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("166_1266334190.64822") :method
.annotate "line", 4
    $P723 = self."!PREFIX__!subrule"("longname=identifier", ".")
    new $P724, "ResizablePMCArray"
    push $P724, "'"
    push $P724, "\""
    push $P724, $P723
    .return ($P724)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("167_1266334190.64822") :method
.annotate "line", 343
    $P732 = self."!protoregex"("term")
    .return ($P732)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("168_1266334190.64822") :method
.annotate "line", 343
    $P734 = self."!PREFIX__!protoregex"("term")
    .return ($P734)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("169_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx736_tgt
    .local int rx736_pos
    .local int rx736_off
    .local int rx736_eos
    .local int rx736_rep
    .local pmc rx736_cur
    (rx736_cur, rx736_pos, rx736_tgt) = self."!cursor_start"()
    rx736_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx736_cur
    .local pmc match
    .lex "$/", match
    length rx736_eos, rx736_tgt
    set rx736_off, 0
    lt rx736_pos, 2, rx736_start
    sub rx736_off, rx736_pos, 1
    substr rx736_tgt, rx736_tgt, rx736_off
  rx736_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan739_done
    goto rxscan739_scan
  rxscan739_loop:
    ($P10) = rx736_cur."from"()
    inc $P10
    set rx736_pos, $P10
    ge rx736_pos, rx736_eos, rxscan739_done
  rxscan739_scan:
    set_addr $I10, rxscan739_loop
    rx736_cur."!mark_push"(0, rx736_pos, $I10)
  rxscan739_done:
.annotate "line", 345
  # rx subcapture "sym"
    set_addr $I10, rxcap_740_fail
    rx736_cur."!mark_push"(0, rx736_pos, $I10)
  # rx literal  "self"
    add $I11, rx736_pos, 4
    gt $I11, rx736_eos, rx736_fail
    sub $I11, rx736_pos, rx736_off
    substr $S10, rx736_tgt, $I11, 4
    ne $S10, "self", rx736_fail
    add rx736_pos, 4
    set_addr $I10, rxcap_740_fail
    ($I12, $I11) = rx736_cur."!mark_peek"($I10)
    rx736_cur."!cursor_pos"($I11)
    ($P10) = rx736_cur."!cursor_start"()
    $P10."!cursor_pass"(rx736_pos, "")
    rx736_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_740_done
  rxcap_740_fail:
    goto rx736_fail
  rxcap_740_done:
  # rxanchor rwb
    le rx736_pos, 0, rx736_fail
    sub $I10, rx736_pos, rx736_off
    is_cclass $I11, 8192, rx736_tgt, $I10
    if $I11, rx736_fail
    dec $I10
    is_cclass $I11, 8192, rx736_tgt, $I10
    unless $I11, rx736_fail
  # rx pass
    rx736_cur."!cursor_pass"(rx736_pos, "term:sym<self>")
    rx736_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx736_pos)
    .return (rx736_cur)
  rx736_fail:
.annotate "line", 4
    (rx736_rep, rx736_pos, $I10, $P10) = rx736_cur."!mark_fail"(0)
    lt rx736_pos, -1, rx736_done
    eq rx736_pos, -1, rx736_fail
    jump $I10
  rx736_done:
    rx736_cur."!cursor_fail"()
    rx736_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx736_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("170_1266334190.64822") :method
.annotate "line", 4
    new $P738, "ResizablePMCArray"
    push $P738, "self"
    .return ($P738)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("171_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx742_tgt
    .local int rx742_pos
    .local int rx742_off
    .local int rx742_eos
    .local int rx742_rep
    .local pmc rx742_cur
    (rx742_cur, rx742_pos, rx742_tgt) = self."!cursor_start"()
    rx742_cur."!cursor_debug"("START ", "term:sym<identifier>")
    .lex unicode:"$\x{a2}", rx742_cur
    .local pmc match
    .lex "$/", match
    length rx742_eos, rx742_tgt
    set rx742_off, 0
    lt rx742_pos, 2, rx742_start
    sub rx742_off, rx742_pos, 1
    substr rx742_tgt, rx742_tgt, rx742_off
  rx742_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan746_done
    goto rxscan746_scan
  rxscan746_loop:
    ($P10) = rx742_cur."from"()
    inc $P10
    set rx742_pos, $P10
    ge rx742_pos, rx742_eos, rxscan746_done
  rxscan746_scan:
    set_addr $I10, rxscan746_loop
    rx742_cur."!mark_push"(0, rx742_pos, $I10)
  rxscan746_done:
.annotate "line", 348
  # rx subrule "identifier" subtype=capture negate=
    rx742_cur."!cursor_pos"(rx742_pos)
    $P10 = rx742_cur."identifier"()
    unless $P10, rx742_fail
    rx742_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx742_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx742_pos, rx742_eos, rx742_fail
    sub $I10, rx742_pos, rx742_off
    substr $S10, rx742_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx742_fail
  # rx subrule "args" subtype=capture negate=
    rx742_cur."!cursor_pos"(rx742_pos)
    $P10 = rx742_cur."args"()
    unless $P10, rx742_fail
    rx742_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx742_pos = $P10."pos"()
.annotate "line", 347
  # rx pass
    rx742_cur."!cursor_pass"(rx742_pos, "term:sym<identifier>")
    rx742_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx742_pos)
    .return (rx742_cur)
  rx742_fail:
.annotate "line", 4
    (rx742_rep, rx742_pos, $I10, $P10) = rx742_cur."!mark_fail"(0)
    lt rx742_pos, -1, rx742_done
    eq rx742_pos, -1, rx742_fail
    jump $I10
  rx742_done:
    rx742_cur."!cursor_fail"()
    rx742_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx742_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("172_1266334190.64822") :method
.annotate "line", 4
    $P744 = self."!PREFIX__!subrule"("identifier", "")
    new $P745, "ResizablePMCArray"
    push $P745, $P744
    .return ($P745)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("173_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx748_tgt
    .local int rx748_pos
    .local int rx748_off
    .local int rx748_eos
    .local int rx748_rep
    .local pmc rx748_cur
    (rx748_cur, rx748_pos, rx748_tgt) = self."!cursor_start"()
    rx748_cur."!cursor_debug"("START ", "term:sym<name>")
    rx748_cur."!cursor_caparray"("args")
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
.annotate "line", 352
  # rx subrule "name" subtype=capture negate=
    rx748_cur."!cursor_pos"(rx748_pos)
    $P10 = rx748_cur."name"()
    unless $P10, rx748_fail
    rx748_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx748_pos = $P10."pos"()
  # rx rxquantr753 ** 0..1
    set_addr $I754, rxquantr753_done
    rx748_cur."!mark_push"(0, rx748_pos, $I754)
  rxquantr753_loop:
  # rx subrule "args" subtype=capture negate=
    rx748_cur."!cursor_pos"(rx748_pos)
    $P10 = rx748_cur."args"()
    unless $P10, rx748_fail
    rx748_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx748_pos = $P10."pos"()
    (rx748_rep) = rx748_cur."!mark_commit"($I754)
  rxquantr753_done:
.annotate "line", 351
  # rx pass
    rx748_cur."!cursor_pass"(rx748_pos, "term:sym<name>")
    rx748_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx748_pos)
    .return (rx748_cur)
  rx748_fail:
.annotate "line", 4
    (rx748_rep, rx748_pos, $I10, $P10) = rx748_cur."!mark_fail"(0)
    lt rx748_pos, -1, rx748_done
    eq rx748_pos, -1, rx748_fail
    jump $I10
  rx748_done:
    rx748_cur."!cursor_fail"()
    rx748_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx748_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("174_1266334190.64822") :method
.annotate "line", 4
    $P750 = self."!PREFIX__!subrule"("name", "")
    new $P751, "ResizablePMCArray"
    push $P751, $P750
    .return ($P751)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("175_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx756_tgt
    .local int rx756_pos
    .local int rx756_off
    .local int rx756_eos
    .local int rx756_rep
    .local pmc rx756_cur
    (rx756_cur, rx756_pos, rx756_tgt) = self."!cursor_start"()
    rx756_cur."!cursor_debug"("START ", "term:sym<pir::op>")
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
    ne $I10, -1, rxscan759_done
    goto rxscan759_scan
  rxscan759_loop:
    ($P10) = rx756_cur."from"()
    inc $P10
    set rx756_pos, $P10
    ge rx756_pos, rx756_eos, rxscan759_done
  rxscan759_scan:
    set_addr $I10, rxscan759_loop
    rx756_cur."!mark_push"(0, rx756_pos, $I10)
  rxscan759_done:
.annotate "line", 356
  # rx literal  "pir::"
    add $I11, rx756_pos, 5
    gt $I11, rx756_eos, rx756_fail
    sub $I11, rx756_pos, rx756_off
    substr $S10, rx756_tgt, $I11, 5
    ne $S10, "pir::", rx756_fail
    add rx756_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_760_fail
    rx756_cur."!mark_push"(0, rx756_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx756_pos, rx756_off
    find_not_cclass $I11, 8192, rx756_tgt, $I10, rx756_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx756_fail
    add rx756_pos, rx756_off, $I11
    set_addr $I10, rxcap_760_fail
    ($I12, $I11) = rx756_cur."!mark_peek"($I10)
    rx756_cur."!cursor_pos"($I11)
    ($P10) = rx756_cur."!cursor_start"()
    $P10."!cursor_pass"(rx756_pos, "")
    rx756_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_760_done
  rxcap_760_fail:
    goto rx756_fail
  rxcap_760_done:
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
.annotate "line", 355
  # rx pass
    rx756_cur."!cursor_pass"(rx756_pos, "term:sym<pir::op>")
    rx756_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx756_pos)
    .return (rx756_cur)
  rx756_fail:
.annotate "line", 4
    (rx756_rep, rx756_pos, $I10, $P10) = rx756_cur."!mark_fail"(0)
    lt rx756_pos, -1, rx756_done
    eq rx756_pos, -1, rx756_fail
    jump $I10
  rx756_done:
    rx756_cur."!cursor_fail"()
    rx756_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx756_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("176_1266334190.64822") :method
.annotate "line", 4
    new $P758, "ResizablePMCArray"
    push $P758, "pir::"
    .return ($P758)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("177_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx764_tgt
    .local int rx764_pos
    .local int rx764_off
    .local int rx764_eos
    .local int rx764_rep
    .local pmc rx764_cur
    (rx764_cur, rx764_pos, rx764_tgt) = self."!cursor_start"()
    rx764_cur."!cursor_debug"("START ", "args")
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
.annotate "line", 360
  # rx literal  "("
    add $I11, rx764_pos, 1
    gt $I11, rx764_eos, rx764_fail
    sub $I11, rx764_pos, rx764_off
    substr $S10, rx764_tgt, $I11, 1
    ne $S10, "(", rx764_fail
    add rx764_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."arglist"()
    unless $P10, rx764_fail
    rx764_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx764_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx764_pos, 1
    gt $I11, rx764_eos, rx764_fail
    sub $I11, rx764_pos, rx764_off
    substr $S10, rx764_tgt, $I11, 1
    ne $S10, ")", rx764_fail
    add rx764_pos, 1
  # rx pass
    rx764_cur."!cursor_pass"(rx764_pos, "args")
    rx764_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx764_pos)
    .return (rx764_cur)
  rx764_fail:
.annotate "line", 4
    (rx764_rep, rx764_pos, $I10, $P10) = rx764_cur."!mark_fail"(0)
    lt rx764_pos, -1, rx764_done
    eq rx764_pos, -1, rx764_fail
    jump $I10
  rx764_done:
    rx764_cur."!cursor_fail"()
    rx764_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx764_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("178_1266334190.64822") :method
.annotate "line", 4
    $P766 = self."!PREFIX__!subrule"("arglist", "(")
    new $P767, "ResizablePMCArray"
    push $P767, $P766
    .return ($P767)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("179_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx770_tgt
    .local int rx770_pos
    .local int rx770_off
    .local int rx770_eos
    .local int rx770_rep
    .local pmc rx770_cur
    (rx770_cur, rx770_pos, rx770_tgt) = self."!cursor_start"()
    rx770_cur."!cursor_debug"("START ", "arglist")
    .lex unicode:"$\x{a2}", rx770_cur
    .local pmc match
    .lex "$/", match
    length rx770_eos, rx770_tgt
    set rx770_off, 0
    lt rx770_pos, 2, rx770_start
    sub rx770_off, rx770_pos, 1
    substr rx770_tgt, rx770_tgt, rx770_off
  rx770_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan774_done
    goto rxscan774_scan
  rxscan774_loop:
    ($P10) = rx770_cur."from"()
    inc $P10
    set rx770_pos, $P10
    ge rx770_pos, rx770_eos, rxscan774_done
  rxscan774_scan:
    set_addr $I10, rxscan774_loop
    rx770_cur."!mark_push"(0, rx770_pos, $I10)
  rxscan774_done:
.annotate "line", 364
  # rx subrule "ws" subtype=method negate=
    rx770_cur."!cursor_pos"(rx770_pos)
    $P10 = rx770_cur."ws"()
    unless $P10, rx770_fail
    rx770_pos = $P10."pos"()
  alt775_0:
.annotate "line", 365
    set_addr $I10, alt775_1
    rx770_cur."!mark_push"(0, rx770_pos, $I10)
.annotate "line", 366
  # rx subrule "EXPR" subtype=capture negate=
    rx770_cur."!cursor_pos"(rx770_pos)
    $P10 = rx770_cur."EXPR"("f=")
    unless $P10, rx770_fail
    rx770_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx770_pos = $P10."pos"()
    goto alt775_end
  alt775_1:
  alt775_end:
.annotate "line", 363
  # rx pass
    rx770_cur."!cursor_pass"(rx770_pos, "arglist")
    rx770_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx770_pos)
    .return (rx770_cur)
  rx770_fail:
.annotate "line", 4
    (rx770_rep, rx770_pos, $I10, $P10) = rx770_cur."!mark_fail"(0)
    lt rx770_pos, -1, rx770_done
    eq rx770_pos, -1, rx770_fail
    jump $I10
  rx770_done:
    rx770_cur."!cursor_fail"()
    rx770_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx770_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("180_1266334190.64822") :method
.annotate "line", 4
    $P772 = self."!PREFIX__!subrule"("", "")
    new $P773, "ResizablePMCArray"
    push $P773, $P772
    .return ($P773)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("181_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx777_tgt
    .local int rx777_pos
    .local int rx777_off
    .local int rx777_eos
    .local int rx777_rep
    .local pmc rx777_cur
    (rx777_cur, rx777_pos, rx777_tgt) = self."!cursor_start"()
    rx777_cur."!cursor_debug"("START ", "term:sym<value>")
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
    ne $I10, -1, rxscan781_done
    goto rxscan781_scan
  rxscan781_loop:
    ($P10) = rx777_cur."from"()
    inc $P10
    set rx777_pos, $P10
    ge rx777_pos, rx777_eos, rxscan781_done
  rxscan781_scan:
    set_addr $I10, rxscan781_loop
    rx777_cur."!mark_push"(0, rx777_pos, $I10)
  rxscan781_done:
.annotate "line", 372
  # rx subrule "value" subtype=capture negate=
    rx777_cur."!cursor_pos"(rx777_pos)
    $P10 = rx777_cur."value"()
    unless $P10, rx777_fail
    rx777_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx777_pos = $P10."pos"()
  # rx pass
    rx777_cur."!cursor_pass"(rx777_pos, "term:sym<value>")
    rx777_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx777_pos)
    .return (rx777_cur)
  rx777_fail:
.annotate "line", 4
    (rx777_rep, rx777_pos, $I10, $P10) = rx777_cur."!mark_fail"(0)
    lt rx777_pos, -1, rx777_done
    eq rx777_pos, -1, rx777_fail
    jump $I10
  rx777_done:
    rx777_cur."!cursor_fail"()
    rx777_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx777_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("182_1266334190.64822") :method
.annotate "line", 4
    $P779 = self."!PREFIX__!subrule"("value", "")
    new $P780, "ResizablePMCArray"
    push $P780, $P779
    .return ($P780)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("183_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx783_tgt
    .local int rx783_pos
    .local int rx783_off
    .local int rx783_eos
    .local int rx783_rep
    .local pmc rx783_cur
    (rx783_cur, rx783_pos, rx783_tgt) = self."!cursor_start"()
    rx783_cur."!cursor_debug"("START ", "value")
    .lex unicode:"$\x{a2}", rx783_cur
    .local pmc match
    .lex "$/", match
    length rx783_eos, rx783_tgt
    set rx783_off, 0
    lt rx783_pos, 2, rx783_start
    sub rx783_off, rx783_pos, 1
    substr rx783_tgt, rx783_tgt, rx783_off
  rx783_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan788_done
    goto rxscan788_scan
  rxscan788_loop:
    ($P10) = rx783_cur."from"()
    inc $P10
    set rx783_pos, $P10
    ge rx783_pos, rx783_eos, rxscan788_done
  rxscan788_scan:
    set_addr $I10, rxscan788_loop
    rx783_cur."!mark_push"(0, rx783_pos, $I10)
  rxscan788_done:
  alt789_0:
.annotate "line", 374
    set_addr $I10, alt789_1
    rx783_cur."!mark_push"(0, rx783_pos, $I10)
.annotate "line", 375
  # rx subrule "quote" subtype=capture negate=
    rx783_cur."!cursor_pos"(rx783_pos)
    $P10 = rx783_cur."quote"()
    unless $P10, rx783_fail
    rx783_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx783_pos = $P10."pos"()
    goto alt789_end
  alt789_1:
.annotate "line", 376
  # rx subrule "number" subtype=capture negate=
    rx783_cur."!cursor_pos"(rx783_pos)
    $P10 = rx783_cur."number"()
    unless $P10, rx783_fail
    rx783_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("number")
    rx783_pos = $P10."pos"()
  alt789_end:
.annotate "line", 374
  # rx pass
    rx783_cur."!cursor_pass"(rx783_pos, "value")
    rx783_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx783_pos)
    .return (rx783_cur)
  rx783_fail:
.annotate "line", 4
    (rx783_rep, rx783_pos, $I10, $P10) = rx783_cur."!mark_fail"(0)
    lt rx783_pos, -1, rx783_done
    eq rx783_pos, -1, rx783_fail
    jump $I10
  rx783_done:
    rx783_cur."!cursor_fail"()
    rx783_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx783_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("184_1266334190.64822") :method
.annotate "line", 4
    $P785 = self."!PREFIX__!subrule"("number", "")
    $P786 = self."!PREFIX__!subrule"("quote", "")
    new $P787, "ResizablePMCArray"
    push $P787, $P785
    push $P787, $P786
    .return ($P787)
.end


.namespace ["NQP";"Grammar"]
.sub "number"  :subid("185_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx791_tgt
    .local int rx791_pos
    .local int rx791_off
    .local int rx791_eos
    .local int rx791_rep
    .local pmc rx791_cur
    (rx791_cur, rx791_pos, rx791_tgt) = self."!cursor_start"()
    rx791_cur."!cursor_debug"("START ", "number")
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
    ne $I10, -1, rxscan794_done
    goto rxscan794_scan
  rxscan794_loop:
    ($P10) = rx791_cur."from"()
    inc $P10
    set rx791_pos, $P10
    ge rx791_pos, rx791_eos, rxscan794_done
  rxscan794_scan:
    set_addr $I10, rxscan794_loop
    rx791_cur."!mark_push"(0, rx791_pos, $I10)
  rxscan794_done:
.annotate "line", 380
  # rx subcapture "sign"
    set_addr $I10, rxcap_797_fail
    rx791_cur."!mark_push"(0, rx791_pos, $I10)
  # rx rxquantr795 ** 0..1
    set_addr $I796, rxquantr795_done
    rx791_cur."!mark_push"(0, rx791_pos, $I796)
  rxquantr795_loop:
  # rx enumcharlist negate=0 
    ge rx791_pos, rx791_eos, rx791_fail
    sub $I10, rx791_pos, rx791_off
    substr $S10, rx791_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rx791_fail
    inc rx791_pos
    (rx791_rep) = rx791_cur."!mark_commit"($I796)
  rxquantr795_done:
    set_addr $I10, rxcap_797_fail
    ($I12, $I11) = rx791_cur."!mark_peek"($I10)
    rx791_cur."!cursor_pos"($I11)
    ($P10) = rx791_cur."!cursor_start"()
    $P10."!cursor_pass"(rx791_pos, "")
    rx791_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_797_done
  rxcap_797_fail:
    goto rx791_fail
  rxcap_797_done:
  alt798_0:
.annotate "line", 381
    set_addr $I10, alt798_1
    rx791_cur."!mark_push"(0, rx791_pos, $I10)
  # rx subrule "dec_number" subtype=capture negate=
    rx791_cur."!cursor_pos"(rx791_pos)
    $P10 = rx791_cur."dec_number"()
    unless $P10, rx791_fail
    rx791_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx791_pos = $P10."pos"()
    goto alt798_end
  alt798_1:
  # rx subrule "integer" subtype=capture negate=
    rx791_cur."!cursor_pos"(rx791_pos)
    $P10 = rx791_cur."integer"()
    unless $P10, rx791_fail
    rx791_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx791_pos = $P10."pos"()
  alt798_end:
.annotate "line", 379
  # rx pass
    rx791_cur."!cursor_pass"(rx791_pos, "number")
    rx791_cur."!cursor_debug"("PASS  ", "number", " at pos=", rx791_pos)
    .return (rx791_cur)
  rx791_fail:
.annotate "line", 4
    (rx791_rep, rx791_pos, $I10, $P10) = rx791_cur."!mark_fail"(0)
    lt rx791_pos, -1, rx791_done
    eq rx791_pos, -1, rx791_fail
    jump $I10
  rx791_done:
    rx791_cur."!cursor_fail"()
    rx791_cur."!cursor_debug"("FAIL  ", "number")
    .return (rx791_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__number"  :subid("186_1266334190.64822") :method
.annotate "line", 4
    new $P793, "ResizablePMCArray"
    push $P793, ""
    .return ($P793)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("187_1266334190.64822") :method
.annotate "line", 384
    $P800 = self."!protoregex"("quote")
    .return ($P800)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("188_1266334190.64822") :method
.annotate "line", 384
    $P802 = self."!PREFIX__!protoregex"("quote")
    .return ($P802)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("189_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx804_tgt
    .local int rx804_pos
    .local int rx804_off
    .local int rx804_eos
    .local int rx804_rep
    .local pmc rx804_cur
    (rx804_cur, rx804_pos, rx804_tgt) = self."!cursor_start"()
    rx804_cur."!cursor_debug"("START ", "quote:sym<apos>")
    .lex unicode:"$\x{a2}", rx804_cur
    .local pmc match
    .lex "$/", match
    length rx804_eos, rx804_tgt
    set rx804_off, 0
    lt rx804_pos, 2, rx804_start
    sub rx804_off, rx804_pos, 1
    substr rx804_tgt, rx804_tgt, rx804_off
  rx804_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan807_done
    goto rxscan807_scan
  rxscan807_loop:
    ($P10) = rx804_cur."from"()
    inc $P10
    set rx804_pos, $P10
    ge rx804_pos, rx804_eos, rxscan807_done
  rxscan807_scan:
    set_addr $I10, rxscan807_loop
    rx804_cur."!mark_push"(0, rx804_pos, $I10)
  rxscan807_done:
.annotate "line", 385
  # rx enumcharlist negate=0 zerowidth
    ge rx804_pos, rx804_eos, rx804_fail
    sub $I10, rx804_pos, rx804_off
    substr $S10, rx804_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx804_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx804_cur."!cursor_pos"(rx804_pos)
    $P10 = rx804_cur."quote_EXPR"(":q")
    unless $P10, rx804_fail
    rx804_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx804_pos = $P10."pos"()
  # rx pass
    rx804_cur."!cursor_pass"(rx804_pos, "quote:sym<apos>")
    rx804_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx804_pos)
    .return (rx804_cur)
  rx804_fail:
.annotate "line", 4
    (rx804_rep, rx804_pos, $I10, $P10) = rx804_cur."!mark_fail"(0)
    lt rx804_pos, -1, rx804_done
    eq rx804_pos, -1, rx804_fail
    jump $I10
  rx804_done:
    rx804_cur."!cursor_fail"()
    rx804_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx804_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("190_1266334190.64822") :method
.annotate "line", 4
    new $P806, "ResizablePMCArray"
    push $P806, "'"
    .return ($P806)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("191_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx809_tgt
    .local int rx809_pos
    .local int rx809_off
    .local int rx809_eos
    .local int rx809_rep
    .local pmc rx809_cur
    (rx809_cur, rx809_pos, rx809_tgt) = self."!cursor_start"()
    rx809_cur."!cursor_debug"("START ", "quote:sym<dblq>")
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
.annotate "line", 386
  # rx enumcharlist negate=0 zerowidth
    ge rx809_pos, rx809_eos, rx809_fail
    sub $I10, rx809_pos, rx809_off
    substr $S10, rx809_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx809_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx809_cur."!cursor_pos"(rx809_pos)
    $P10 = rx809_cur."quote_EXPR"(":qq")
    unless $P10, rx809_fail
    rx809_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx809_pos = $P10."pos"()
  # rx pass
    rx809_cur."!cursor_pass"(rx809_pos, "quote:sym<dblq>")
    rx809_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx809_pos)
    .return (rx809_cur)
  rx809_fail:
.annotate "line", 4
    (rx809_rep, rx809_pos, $I10, $P10) = rx809_cur."!mark_fail"(0)
    lt rx809_pos, -1, rx809_done
    eq rx809_pos, -1, rx809_fail
    jump $I10
  rx809_done:
    rx809_cur."!cursor_fail"()
    rx809_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx809_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("192_1266334190.64822") :method
.annotate "line", 4
    new $P811, "ResizablePMCArray"
    push $P811, "\""
    .return ($P811)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("193_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx814_tgt
    .local int rx814_pos
    .local int rx814_off
    .local int rx814_eos
    .local int rx814_rep
    .local pmc rx814_cur
    (rx814_cur, rx814_pos, rx814_tgt) = self."!cursor_start"()
    rx814_cur."!cursor_debug"("START ", "quote:sym<q>")
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
    ne $I10, -1, rxscan818_done
    goto rxscan818_scan
  rxscan818_loop:
    ($P10) = rx814_cur."from"()
    inc $P10
    set rx814_pos, $P10
    ge rx814_pos, rx814_eos, rxscan818_done
  rxscan818_scan:
    set_addr $I10, rxscan818_loop
    rx814_cur."!mark_push"(0, rx814_pos, $I10)
  rxscan818_done:
.annotate "line", 387
  # rx literal  "q"
    add $I11, rx814_pos, 1
    gt $I11, rx814_eos, rx814_fail
    sub $I11, rx814_pos, rx814_off
    substr $S10, rx814_tgt, $I11, 1
    ne $S10, "q", rx814_fail
    add rx814_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx814_pos, rx814_eos, rx814_fail
    sub $I10, rx814_pos, rx814_off
    substr $S10, rx814_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx814_fail
  # rx subrule "ws" subtype=method negate=
    rx814_cur."!cursor_pos"(rx814_pos)
    $P10 = rx814_cur."ws"()
    unless $P10, rx814_fail
    rx814_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx814_cur."!cursor_pos"(rx814_pos)
    $P10 = rx814_cur."quote_EXPR"(":q")
    unless $P10, rx814_fail
    rx814_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx814_pos = $P10."pos"()
  # rx pass
    rx814_cur."!cursor_pass"(rx814_pos, "quote:sym<q>")
    rx814_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx814_pos)
    .return (rx814_cur)
  rx814_fail:
.annotate "line", 4
    (rx814_rep, rx814_pos, $I10, $P10) = rx814_cur."!mark_fail"(0)
    lt rx814_pos, -1, rx814_done
    eq rx814_pos, -1, rx814_fail
    jump $I10
  rx814_done:
    rx814_cur."!cursor_fail"()
    rx814_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx814_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("194_1266334190.64822") :method
.annotate "line", 4
    $P816 = self."!PREFIX__!subrule"("", "q")
    new $P817, "ResizablePMCArray"
    push $P817, $P816
    .return ($P817)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("195_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx820_tgt
    .local int rx820_pos
    .local int rx820_off
    .local int rx820_eos
    .local int rx820_rep
    .local pmc rx820_cur
    (rx820_cur, rx820_pos, rx820_tgt) = self."!cursor_start"()
    rx820_cur."!cursor_debug"("START ", "quote:sym<qq>")
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
    ne $I10, -1, rxscan824_done
    goto rxscan824_scan
  rxscan824_loop:
    ($P10) = rx820_cur."from"()
    inc $P10
    set rx820_pos, $P10
    ge rx820_pos, rx820_eos, rxscan824_done
  rxscan824_scan:
    set_addr $I10, rxscan824_loop
    rx820_cur."!mark_push"(0, rx820_pos, $I10)
  rxscan824_done:
.annotate "line", 388
  # rx literal  "qq"
    add $I11, rx820_pos, 2
    gt $I11, rx820_eos, rx820_fail
    sub $I11, rx820_pos, rx820_off
    substr $S10, rx820_tgt, $I11, 2
    ne $S10, "qq", rx820_fail
    add rx820_pos, 2
  # rx enumcharlist negate=1 zerowidth
    ge rx820_pos, rx820_eos, rx820_fail
    sub $I10, rx820_pos, rx820_off
    substr $S10, rx820_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx820_fail
  # rx subrule "ws" subtype=method negate=
    rx820_cur."!cursor_pos"(rx820_pos)
    $P10 = rx820_cur."ws"()
    unless $P10, rx820_fail
    rx820_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx820_cur."!cursor_pos"(rx820_pos)
    $P10 = rx820_cur."quote_EXPR"(":qq")
    unless $P10, rx820_fail
    rx820_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx820_pos = $P10."pos"()
  # rx pass
    rx820_cur."!cursor_pass"(rx820_pos, "quote:sym<qq>")
    rx820_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx820_pos)
    .return (rx820_cur)
  rx820_fail:
.annotate "line", 4
    (rx820_rep, rx820_pos, $I10, $P10) = rx820_cur."!mark_fail"(0)
    lt rx820_pos, -1, rx820_done
    eq rx820_pos, -1, rx820_fail
    jump $I10
  rx820_done:
    rx820_cur."!cursor_fail"()
    rx820_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx820_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("196_1266334190.64822") :method
.annotate "line", 4
    $P822 = self."!PREFIX__!subrule"("", "qq")
    new $P823, "ResizablePMCArray"
    push $P823, $P822
    .return ($P823)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("197_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx826_tgt
    .local int rx826_pos
    .local int rx826_off
    .local int rx826_eos
    .local int rx826_rep
    .local pmc rx826_cur
    (rx826_cur, rx826_pos, rx826_tgt) = self."!cursor_start"()
    rx826_cur."!cursor_debug"("START ", "quote:sym<Q>")
    .lex unicode:"$\x{a2}", rx826_cur
    .local pmc match
    .lex "$/", match
    length rx826_eos, rx826_tgt
    set rx826_off, 0
    lt rx826_pos, 2, rx826_start
    sub rx826_off, rx826_pos, 1
    substr rx826_tgt, rx826_tgt, rx826_off
  rx826_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan830_done
    goto rxscan830_scan
  rxscan830_loop:
    ($P10) = rx826_cur."from"()
    inc $P10
    set rx826_pos, $P10
    ge rx826_pos, rx826_eos, rxscan830_done
  rxscan830_scan:
    set_addr $I10, rxscan830_loop
    rx826_cur."!mark_push"(0, rx826_pos, $I10)
  rxscan830_done:
.annotate "line", 389
  # rx literal  "Q"
    add $I11, rx826_pos, 1
    gt $I11, rx826_eos, rx826_fail
    sub $I11, rx826_pos, rx826_off
    substr $S10, rx826_tgt, $I11, 1
    ne $S10, "Q", rx826_fail
    add rx826_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx826_pos, rx826_eos, rx826_fail
    sub $I10, rx826_pos, rx826_off
    substr $S10, rx826_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx826_fail
  # rx subrule "ws" subtype=method negate=
    rx826_cur."!cursor_pos"(rx826_pos)
    $P10 = rx826_cur."ws"()
    unless $P10, rx826_fail
    rx826_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx826_cur."!cursor_pos"(rx826_pos)
    $P10 = rx826_cur."quote_EXPR"()
    unless $P10, rx826_fail
    rx826_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx826_pos = $P10."pos"()
  # rx pass
    rx826_cur."!cursor_pass"(rx826_pos, "quote:sym<Q>")
    rx826_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx826_pos)
    .return (rx826_cur)
  rx826_fail:
.annotate "line", 4
    (rx826_rep, rx826_pos, $I10, $P10) = rx826_cur."!mark_fail"(0)
    lt rx826_pos, -1, rx826_done
    eq rx826_pos, -1, rx826_fail
    jump $I10
  rx826_done:
    rx826_cur."!cursor_fail"()
    rx826_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx826_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("198_1266334190.64822") :method
.annotate "line", 4
    $P828 = self."!PREFIX__!subrule"("", "Q")
    new $P829, "ResizablePMCArray"
    push $P829, $P828
    .return ($P829)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("199_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx832_tgt
    .local int rx832_pos
    .local int rx832_off
    .local int rx832_eos
    .local int rx832_rep
    .local pmc rx832_cur
    (rx832_cur, rx832_pos, rx832_tgt) = self."!cursor_start"()
    rx832_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
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
    ne $I10, -1, rxscan836_done
    goto rxscan836_scan
  rxscan836_loop:
    ($P10) = rx832_cur."from"()
    inc $P10
    set rx832_pos, $P10
    ge rx832_pos, rx832_eos, rxscan836_done
  rxscan836_scan:
    set_addr $I10, rxscan836_loop
    rx832_cur."!mark_push"(0, rx832_pos, $I10)
  rxscan836_done:
.annotate "line", 390
  # rx literal  "Q:PIR"
    add $I11, rx832_pos, 5
    gt $I11, rx832_eos, rx832_fail
    sub $I11, rx832_pos, rx832_off
    substr $S10, rx832_tgt, $I11, 5
    ne $S10, "Q:PIR", rx832_fail
    add rx832_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx832_cur."!cursor_pos"(rx832_pos)
    $P10 = rx832_cur."ws"()
    unless $P10, rx832_fail
    rx832_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx832_cur."!cursor_pos"(rx832_pos)
    $P10 = rx832_cur."quote_EXPR"()
    unless $P10, rx832_fail
    rx832_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx832_pos = $P10."pos"()
  # rx pass
    rx832_cur."!cursor_pass"(rx832_pos, "quote:sym<Q:PIR>")
    rx832_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx832_pos)
    .return (rx832_cur)
  rx832_fail:
.annotate "line", 4
    (rx832_rep, rx832_pos, $I10, $P10) = rx832_cur."!mark_fail"(0)
    lt rx832_pos, -1, rx832_done
    eq rx832_pos, -1, rx832_fail
    jump $I10
  rx832_done:
    rx832_cur."!cursor_fail"()
    rx832_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx832_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("200_1266334190.64822") :method
.annotate "line", 4
    $P834 = self."!PREFIX__!subrule"("", "Q:PIR")
    new $P835, "ResizablePMCArray"
    push $P835, $P834
    .return ($P835)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym</ />"  :subid("201_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx838_tgt
    .local int rx838_pos
    .local int rx838_off
    .local int rx838_eos
    .local int rx838_rep
    .local pmc rx838_cur
    (rx838_cur, rx838_pos, rx838_tgt) = self."!cursor_start"()
    rx838_cur."!cursor_debug"("START ", "quote:sym</ />")
    .lex unicode:"$\x{a2}", rx838_cur
    .local pmc match
    .lex "$/", match
    length rx838_eos, rx838_tgt
    set rx838_off, 0
    lt rx838_pos, 2, rx838_start
    sub rx838_off, rx838_pos, 1
    substr rx838_tgt, rx838_tgt, rx838_off
  rx838_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan842_done
    goto rxscan842_scan
  rxscan842_loop:
    ($P10) = rx838_cur."from"()
    inc $P10
    set rx838_pos, $P10
    ge rx838_pos, rx838_eos, rxscan842_done
  rxscan842_scan:
    set_addr $I10, rxscan842_loop
    rx838_cur."!mark_push"(0, rx838_pos, $I10)
  rxscan842_done:
.annotate "line", 392
  # rx literal  "/"
    add $I11, rx838_pos, 1
    gt $I11, rx838_eos, rx838_fail
    sub $I11, rx838_pos, rx838_off
    substr $S10, rx838_tgt, $I11, 1
    ne $S10, "/", rx838_fail
    add rx838_pos, 1
.annotate "line", 393
  # rx subrule "newpad" subtype=method negate=
    rx838_cur."!cursor_pos"(rx838_pos)
    $P10 = rx838_cur."newpad"()
    unless $P10, rx838_fail
    rx838_pos = $P10."pos"()
.annotate "line", 394
  # rx reduce name="quote:sym</ />" key="open"
    rx838_cur."!cursor_pos"(rx838_pos)
    rx838_cur."!reduce"("quote:sym</ />", "open")
.annotate "line", 395
  # rx subrule "LANG" subtype=capture negate=
    rx838_cur."!cursor_pos"(rx838_pos)
    $P10 = rx838_cur."LANG"("Regex", "nibbler")
    unless $P10, rx838_fail
    rx838_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx838_pos = $P10."pos"()
.annotate "line", 396
  # rx literal  "/"
    add $I11, rx838_pos, 1
    gt $I11, rx838_eos, rx838_fail
    sub $I11, rx838_pos, rx838_off
    substr $S10, rx838_tgt, $I11, 1
    ne $S10, "/", rx838_fail
    add rx838_pos, 1
.annotate "line", 391
  # rx pass
    rx838_cur."!cursor_pass"(rx838_pos, "quote:sym</ />")
    rx838_cur."!cursor_debug"("PASS  ", "quote:sym</ />", " at pos=", rx838_pos)
    .return (rx838_cur)
  rx838_fail:
.annotate "line", 4
    (rx838_rep, rx838_pos, $I10, $P10) = rx838_cur."!mark_fail"(0)
    lt rx838_pos, -1, rx838_done
    eq rx838_pos, -1, rx838_fail
    jump $I10
  rx838_done:
    rx838_cur."!cursor_fail"()
    rx838_cur."!cursor_debug"("FAIL  ", "quote:sym</ />")
    .return (rx838_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym</ />"  :subid("202_1266334190.64822") :method
.annotate "line", 4
    $P840 = self."!PREFIX__!subrule"("", "/")
    new $P841, "ResizablePMCArray"
    push $P841, $P840
    .return ($P841)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("203_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx844_tgt
    .local int rx844_pos
    .local int rx844_off
    .local int rx844_eos
    .local int rx844_rep
    .local pmc rx844_cur
    (rx844_cur, rx844_pos, rx844_tgt) = self."!cursor_start"()
    rx844_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
    .lex unicode:"$\x{a2}", rx844_cur
    .local pmc match
    .lex "$/", match
    length rx844_eos, rx844_tgt
    set rx844_off, 0
    lt rx844_pos, 2, rx844_start
    sub rx844_off, rx844_pos, 1
    substr rx844_tgt, rx844_tgt, rx844_off
  rx844_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan847_done
    goto rxscan847_scan
  rxscan847_loop:
    ($P10) = rx844_cur."from"()
    inc $P10
    set rx844_pos, $P10
    ge rx844_pos, rx844_eos, rxscan847_done
  rxscan847_scan:
    set_addr $I10, rxscan847_loop
    rx844_cur."!mark_push"(0, rx844_pos, $I10)
  rxscan847_done:
.annotate "line", 399
  # rx enumcharlist negate=0 zerowidth
    ge rx844_pos, rx844_eos, rx844_fail
    sub $I10, rx844_pos, rx844_off
    substr $S10, rx844_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx844_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx844_cur."!cursor_pos"(rx844_pos)
    $P10 = rx844_cur."quotemod_check"("s")
    unless $P10, rx844_fail
  # rx subrule "variable" subtype=capture negate=
    rx844_cur."!cursor_pos"(rx844_pos)
    $P10 = rx844_cur."variable"()
    unless $P10, rx844_fail
    rx844_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx844_pos = $P10."pos"()
  # rx pass
    rx844_cur."!cursor_pass"(rx844_pos, "quote_escape:sym<$>")
    rx844_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx844_pos)
    .return (rx844_cur)
  rx844_fail:
.annotate "line", 4
    (rx844_rep, rx844_pos, $I10, $P10) = rx844_cur."!mark_fail"(0)
    lt rx844_pos, -1, rx844_done
    eq rx844_pos, -1, rx844_fail
    jump $I10
  rx844_done:
    rx844_cur."!cursor_fail"()
    rx844_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx844_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("204_1266334190.64822") :method
.annotate "line", 4
    new $P846, "ResizablePMCArray"
    push $P846, "$"
    .return ($P846)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("205_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx849_tgt
    .local int rx849_pos
    .local int rx849_off
    .local int rx849_eos
    .local int rx849_rep
    .local pmc rx849_cur
    (rx849_cur, rx849_pos, rx849_tgt) = self."!cursor_start"()
    rx849_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
    .lex unicode:"$\x{a2}", rx849_cur
    .local pmc match
    .lex "$/", match
    length rx849_eos, rx849_tgt
    set rx849_off, 0
    lt rx849_pos, 2, rx849_start
    sub rx849_off, rx849_pos, 1
    substr rx849_tgt, rx849_tgt, rx849_off
  rx849_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan852_done
    goto rxscan852_scan
  rxscan852_loop:
    ($P10) = rx849_cur."from"()
    inc $P10
    set rx849_pos, $P10
    ge rx849_pos, rx849_eos, rxscan852_done
  rxscan852_scan:
    set_addr $I10, rxscan852_loop
    rx849_cur."!mark_push"(0, rx849_pos, $I10)
  rxscan852_done:
.annotate "line", 400
  # rx enumcharlist negate=0 zerowidth
    ge rx849_pos, rx849_eos, rx849_fail
    sub $I10, rx849_pos, rx849_off
    substr $S10, rx849_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx849_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx849_cur."!cursor_pos"(rx849_pos)
    $P10 = rx849_cur."quotemod_check"("c")
    unless $P10, rx849_fail
  # rx subrule "block" subtype=capture negate=
    rx849_cur."!cursor_pos"(rx849_pos)
    $P10 = rx849_cur."block"()
    unless $P10, rx849_fail
    rx849_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx849_pos = $P10."pos"()
  # rx pass
    rx849_cur."!cursor_pass"(rx849_pos, "quote_escape:sym<{ }>")
    rx849_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx849_pos)
    .return (rx849_cur)
  rx849_fail:
.annotate "line", 4
    (rx849_rep, rx849_pos, $I10, $P10) = rx849_cur."!mark_fail"(0)
    lt rx849_pos, -1, rx849_done
    eq rx849_pos, -1, rx849_fail
    jump $I10
  rx849_done:
    rx849_cur."!cursor_fail"()
    rx849_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx849_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("206_1266334190.64822") :method
.annotate "line", 4
    new $P851, "ResizablePMCArray"
    push $P851, "{"
    .return ($P851)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("207_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx854_tgt
    .local int rx854_pos
    .local int rx854_off
    .local int rx854_eos
    .local int rx854_rep
    .local pmc rx854_cur
    (rx854_cur, rx854_pos, rx854_tgt) = self."!cursor_start"()
    rx854_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx854_cur."!cursor_caparray"("EXPR")
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
.annotate "line", 402
  # rx literal  "("
    add $I11, rx854_pos, 1
    gt $I11, rx854_eos, rx854_fail
    sub $I11, rx854_pos, rx854_off
    substr $S10, rx854_tgt, $I11, 1
    ne $S10, "(", rx854_fail
    add rx854_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx854_cur."!cursor_pos"(rx854_pos)
    $P10 = rx854_cur."ws"()
    unless $P10, rx854_fail
    rx854_pos = $P10."pos"()
  # rx rxquantr859 ** 0..1
    set_addr $I860, rxquantr859_done
    rx854_cur."!mark_push"(0, rx854_pos, $I860)
  rxquantr859_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx854_cur."!cursor_pos"(rx854_pos)
    $P10 = rx854_cur."EXPR"()
    unless $P10, rx854_fail
    rx854_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx854_pos = $P10."pos"()
    (rx854_rep) = rx854_cur."!mark_commit"($I860)
  rxquantr859_done:
  # rx literal  ")"
    add $I11, rx854_pos, 1
    gt $I11, rx854_eos, rx854_fail
    sub $I11, rx854_pos, rx854_off
    substr $S10, rx854_tgt, $I11, 1
    ne $S10, ")", rx854_fail
    add rx854_pos, 1
  # rx pass
    rx854_cur."!cursor_pass"(rx854_pos, "circumfix:sym<( )>")
    rx854_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx854_pos)
    .return (rx854_cur)
  rx854_fail:
.annotate "line", 4
    (rx854_rep, rx854_pos, $I10, $P10) = rx854_cur."!mark_fail"(0)
    lt rx854_pos, -1, rx854_done
    eq rx854_pos, -1, rx854_fail
    jump $I10
  rx854_done:
    rx854_cur."!cursor_fail"()
    rx854_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx854_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("208_1266334190.64822") :method
.annotate "line", 4
    $P856 = self."!PREFIX__!subrule"("", "(")
    new $P857, "ResizablePMCArray"
    push $P857, $P856
    .return ($P857)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("209_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx862_tgt
    .local int rx862_pos
    .local int rx862_off
    .local int rx862_eos
    .local int rx862_rep
    .local pmc rx862_cur
    (rx862_cur, rx862_pos, rx862_tgt) = self."!cursor_start"()
    rx862_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
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
.annotate "line", 403
  # rx literal  "["
    add $I11, rx862_pos, 1
    gt $I11, rx862_eos, rx862_fail
    sub $I11, rx862_pos, rx862_off
    substr $S10, rx862_tgt, $I11, 1
    ne $S10, "[", rx862_fail
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
  # rx literal  "]"
    add $I11, rx862_pos, 1
    gt $I11, rx862_eos, rx862_fail
    sub $I11, rx862_pos, rx862_off
    substr $S10, rx862_tgt, $I11, 1
    ne $S10, "]", rx862_fail
    add rx862_pos, 1
  # rx pass
    rx862_cur."!cursor_pass"(rx862_pos, "circumfix:sym<[ ]>")
    rx862_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx862_pos)
    .return (rx862_cur)
  rx862_fail:
.annotate "line", 4
    (rx862_rep, rx862_pos, $I10, $P10) = rx862_cur."!mark_fail"(0)
    lt rx862_pos, -1, rx862_done
    eq rx862_pos, -1, rx862_fail
    jump $I10
  rx862_done:
    rx862_cur."!cursor_fail"()
    rx862_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx862_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("210_1266334190.64822") :method
.annotate "line", 4
    $P864 = self."!PREFIX__!subrule"("", "[")
    new $P865, "ResizablePMCArray"
    push $P865, $P864
    .return ($P865)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("211_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx870_tgt
    .local int rx870_pos
    .local int rx870_off
    .local int rx870_eos
    .local int rx870_rep
    .local pmc rx870_cur
    (rx870_cur, rx870_pos, rx870_tgt) = self."!cursor_start"()
    rx870_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
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
.annotate "line", 404
  # rx enumcharlist negate=0 zerowidth
    ge rx870_pos, rx870_eos, rx870_fail
    sub $I10, rx870_pos, rx870_off
    substr $S10, rx870_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx870_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx870_cur."!cursor_pos"(rx870_pos)
    $P10 = rx870_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx870_fail
    rx870_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx870_pos = $P10."pos"()
  # rx pass
    rx870_cur."!cursor_pass"(rx870_pos, "circumfix:sym<ang>")
    rx870_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx870_pos)
    .return (rx870_cur)
  rx870_fail:
.annotate "line", 4
    (rx870_rep, rx870_pos, $I10, $P10) = rx870_cur."!mark_fail"(0)
    lt rx870_pos, -1, rx870_done
    eq rx870_pos, -1, rx870_fail
    jump $I10
  rx870_done:
    rx870_cur."!cursor_fail"()
    rx870_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx870_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("212_1266334190.64822") :method
.annotate "line", 4
    new $P872, "ResizablePMCArray"
    push $P872, "<"
    .return ($P872)
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("213_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx875_tgt
    .local int rx875_pos
    .local int rx875_off
    .local int rx875_eos
    .local int rx875_rep
    .local pmc rx875_cur
    (rx875_cur, rx875_pos, rx875_tgt) = self."!cursor_start"()
    rx875_cur."!cursor_debug"("START ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
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
    ne $I10, -1, rxscan878_done
    goto rxscan878_scan
  rxscan878_loop:
    ($P10) = rx875_cur."from"()
    inc $P10
    set rx875_pos, $P10
    ge rx875_pos, rx875_eos, rxscan878_done
  rxscan878_scan:
    set_addr $I10, rxscan878_loop
    rx875_cur."!mark_push"(0, rx875_pos, $I10)
  rxscan878_done:
.annotate "line", 405
  # rx enumcharlist negate=0 zerowidth
    ge rx875_pos, rx875_eos, rx875_fail
    sub $I10, rx875_pos, rx875_off
    substr $S10, rx875_tgt, $I10, 1
    index $I11, unicode:"\x{ab}", $S10
    lt $I11, 0, rx875_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx875_cur."!cursor_pos"(rx875_pos)
    $P10 = rx875_cur."quote_EXPR"(":qq", ":w")
    unless $P10, rx875_fail
    rx875_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx875_pos = $P10."pos"()
  # rx pass
    rx875_cur."!cursor_pass"(rx875_pos, unicode:"circumfix:sym<\x{ab} \x{bb}>")
    rx875_cur."!cursor_debug"("PASS  ", unicode:"circumfix:sym<\x{ab} \x{bb}>", " at pos=", rx875_pos)
    .return (rx875_cur)
  rx875_fail:
.annotate "line", 4
    (rx875_rep, rx875_pos, $I10, $P10) = rx875_cur."!mark_fail"(0)
    lt rx875_pos, -1, rx875_done
    eq rx875_pos, -1, rx875_fail
    jump $I10
  rx875_done:
    rx875_cur."!cursor_fail"()
    rx875_cur."!cursor_debug"("FAIL  ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
    .return (rx875_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"!PREFIX__circumfix:sym<\x{ab} \x{bb}>"  :subid("214_1266334190.64822") :method
.annotate "line", 4
    new $P877, "ResizablePMCArray"
    push $P877, unicode:"\x{ab}"
    .return ($P877)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("215_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx880_tgt
    .local int rx880_pos
    .local int rx880_off
    .local int rx880_eos
    .local int rx880_rep
    .local pmc rx880_cur
    (rx880_cur, rx880_pos, rx880_tgt) = self."!cursor_start"()
    rx880_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx880_cur
    .local pmc match
    .lex "$/", match
    length rx880_eos, rx880_tgt
    set rx880_off, 0
    lt rx880_pos, 2, rx880_start
    sub rx880_off, rx880_pos, 1
    substr rx880_tgt, rx880_tgt, rx880_off
  rx880_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan883_done
    goto rxscan883_scan
  rxscan883_loop:
    ($P10) = rx880_cur."from"()
    inc $P10
    set rx880_pos, $P10
    ge rx880_pos, rx880_eos, rxscan883_done
  rxscan883_scan:
    set_addr $I10, rxscan883_loop
    rx880_cur."!mark_push"(0, rx880_pos, $I10)
  rxscan883_done:
.annotate "line", 406
  # rx enumcharlist negate=0 zerowidth
    ge rx880_pos, rx880_eos, rx880_fail
    sub $I10, rx880_pos, rx880_off
    substr $S10, rx880_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx880_fail
  # rx subrule "pblock" subtype=capture negate=
    rx880_cur."!cursor_pos"(rx880_pos)
    $P10 = rx880_cur."pblock"()
    unless $P10, rx880_fail
    rx880_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx880_pos = $P10."pos"()
  # rx pass
    rx880_cur."!cursor_pass"(rx880_pos, "circumfix:sym<{ }>")
    rx880_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx880_pos)
    .return (rx880_cur)
  rx880_fail:
.annotate "line", 4
    (rx880_rep, rx880_pos, $I10, $P10) = rx880_cur."!mark_fail"(0)
    lt rx880_pos, -1, rx880_done
    eq rx880_pos, -1, rx880_fail
    jump $I10
  rx880_done:
    rx880_cur."!cursor_fail"()
    rx880_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx880_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("216_1266334190.64822") :method
.annotate "line", 4
    new $P882, "ResizablePMCArray"
    push $P882, "{"
    .return ($P882)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("217_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx885_tgt
    .local int rx885_pos
    .local int rx885_off
    .local int rx885_eos
    .local int rx885_rep
    .local pmc rx885_cur
    (rx885_cur, rx885_pos, rx885_tgt) = self."!cursor_start"()
    rx885_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
    .lex unicode:"$\x{a2}", rx885_cur
    .local pmc match
    .lex "$/", match
    length rx885_eos, rx885_tgt
    set rx885_off, 0
    lt rx885_pos, 2, rx885_start
    sub rx885_off, rx885_pos, 1
    substr rx885_tgt, rx885_tgt, rx885_off
  rx885_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan889_done
    goto rxscan889_scan
  rxscan889_loop:
    ($P10) = rx885_cur."from"()
    inc $P10
    set rx885_pos, $P10
    ge rx885_pos, rx885_eos, rxscan889_done
  rxscan889_scan:
    set_addr $I10, rxscan889_loop
    rx885_cur."!mark_push"(0, rx885_pos, $I10)
  rxscan889_done:
.annotate "line", 407
  # rx subrule "sigil" subtype=capture negate=
    rx885_cur."!cursor_pos"(rx885_pos)
    $P10 = rx885_cur."sigil"()
    unless $P10, rx885_fail
    rx885_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx885_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx885_pos, 1
    gt $I11, rx885_eos, rx885_fail
    sub $I11, rx885_pos, rx885_off
    substr $S10, rx885_tgt, $I11, 1
    ne $S10, "(", rx885_fail
    add rx885_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx885_cur."!cursor_pos"(rx885_pos)
    $P10 = rx885_cur."semilist"()
    unless $P10, rx885_fail
    rx885_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx885_pos = $P10."pos"()
  alt890_0:
    set_addr $I10, alt890_1
    rx885_cur."!mark_push"(0, rx885_pos, $I10)
  # rx literal  ")"
    add $I11, rx885_pos, 1
    gt $I11, rx885_eos, rx885_fail
    sub $I11, rx885_pos, rx885_off
    substr $S10, rx885_tgt, $I11, 1
    ne $S10, ")", rx885_fail
    add rx885_pos, 1
    goto alt890_end
  alt890_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx885_cur."!cursor_pos"(rx885_pos)
    $P10 = rx885_cur."FAILGOAL"("')'")
    unless $P10, rx885_fail
    rx885_pos = $P10."pos"()
  alt890_end:
  # rx pass
    rx885_cur."!cursor_pass"(rx885_pos, "circumfix:sym<sigil>")
    rx885_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx885_pos)
    .return (rx885_cur)
  rx885_fail:
.annotate "line", 4
    (rx885_rep, rx885_pos, $I10, $P10) = rx885_cur."!mark_fail"(0)
    lt rx885_pos, -1, rx885_done
    eq rx885_pos, -1, rx885_fail
    jump $I10
  rx885_done:
    rx885_cur."!cursor_fail"()
    rx885_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx885_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("218_1266334190.64822") :method
.annotate "line", 4
    $P887 = self."!PREFIX__!subrule"("sigil", "")
    new $P888, "ResizablePMCArray"
    push $P888, $P887
    .return ($P888)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("219_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 4
    .local string rx893_tgt
    .local int rx893_pos
    .local int rx893_off
    .local int rx893_eos
    .local int rx893_rep
    .local pmc rx893_cur
    (rx893_cur, rx893_pos, rx893_tgt) = self."!cursor_start"()
    rx893_cur."!cursor_debug"("START ", "semilist")
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
    ne $I10, -1, rxscan896_done
    goto rxscan896_scan
  rxscan896_loop:
    ($P10) = rx893_cur."from"()
    inc $P10
    set rx893_pos, $P10
    ge rx893_pos, rx893_eos, rxscan896_done
  rxscan896_scan:
    set_addr $I10, rxscan896_loop
    rx893_cur."!mark_push"(0, rx893_pos, $I10)
  rxscan896_done:
.annotate "line", 409
  # rx subrule "ws" subtype=method negate=
    rx893_cur."!cursor_pos"(rx893_pos)
    $P10 = rx893_cur."ws"()
    unless $P10, rx893_fail
    rx893_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx893_cur."!cursor_pos"(rx893_pos)
    $P10 = rx893_cur."statement"()
    unless $P10, rx893_fail
    rx893_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx893_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx893_cur."!cursor_pos"(rx893_pos)
    $P10 = rx893_cur."ws"()
    unless $P10, rx893_fail
    rx893_pos = $P10."pos"()
  # rx pass
    rx893_cur."!cursor_pass"(rx893_pos, "semilist")
    rx893_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx893_pos)
    .return (rx893_cur)
  rx893_fail:
.annotate "line", 4
    (rx893_rep, rx893_pos, $I10, $P10) = rx893_cur."!mark_fail"(0)
    lt rx893_pos, -1, rx893_done
    eq rx893_pos, -1, rx893_fail
    jump $I10
  rx893_done:
    rx893_cur."!cursor_fail"()
    rx893_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx893_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("220_1266334190.64822") :method
.annotate "line", 4
    new $P895, "ResizablePMCArray"
    push $P895, ""
    .return ($P895)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("221_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx900_tgt
    .local int rx900_pos
    .local int rx900_off
    .local int rx900_eos
    .local int rx900_rep
    .local pmc rx900_cur
    (rx900_cur, rx900_pos, rx900_tgt) = self."!cursor_start"()
    rx900_cur."!cursor_debug"("START ", "infixish")
    .lex unicode:"$\x{a2}", rx900_cur
    .local pmc match
    .lex "$/", match
    length rx900_eos, rx900_tgt
    set rx900_off, 0
    lt rx900_pos, 2, rx900_start
    sub rx900_off, rx900_pos, 1
    substr rx900_tgt, rx900_tgt, rx900_off
  rx900_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan903_done
    goto rxscan903_scan
  rxscan903_loop:
    ($P10) = rx900_cur."from"()
    inc $P10
    set rx900_pos, $P10
    ge rx900_pos, rx900_eos, rxscan903_done
  rxscan903_scan:
    set_addr $I10, rxscan903_loop
    rx900_cur."!mark_push"(0, rx900_pos, $I10)
  rxscan903_done:
.annotate "line", 432
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx900_cur."!cursor_pos"(rx900_pos)
    $P10 = rx900_cur."infixstopper"()
    if $P10, rx900_fail
  # rx subrule "infix" subtype=capture negate=
    rx900_cur."!cursor_pos"(rx900_pos)
    $P10 = rx900_cur."infix"()
    unless $P10, rx900_fail
    rx900_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx900_pos = $P10."pos"()
  # rx pass
    rx900_cur."!cursor_pass"(rx900_pos, "infixish")
    rx900_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx900_pos)
    .return (rx900_cur)
  rx900_fail:
.annotate "line", 413
    (rx900_rep, rx900_pos, $I10, $P10) = rx900_cur."!mark_fail"(0)
    lt rx900_pos, -1, rx900_done
    eq rx900_pos, -1, rx900_fail
    jump $I10
  rx900_done:
    rx900_cur."!cursor_fail"()
    rx900_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx900_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("222_1266334190.64822") :method
.annotate "line", 413
    new $P902, "ResizablePMCArray"
    push $P902, ""
    .return ($P902)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("223_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx905_tgt
    .local int rx905_pos
    .local int rx905_off
    .local int rx905_eos
    .local int rx905_rep
    .local pmc rx905_cur
    (rx905_cur, rx905_pos, rx905_tgt) = self."!cursor_start"()
    rx905_cur."!cursor_debug"("START ", "infixstopper")
    .lex unicode:"$\x{a2}", rx905_cur
    .local pmc match
    .lex "$/", match
    length rx905_eos, rx905_tgt
    set rx905_off, 0
    lt rx905_pos, 2, rx905_start
    sub rx905_off, rx905_pos, 1
    substr rx905_tgt, rx905_tgt, rx905_off
  rx905_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan908_done
    goto rxscan908_scan
  rxscan908_loop:
    ($P10) = rx905_cur."from"()
    inc $P10
    set rx905_pos, $P10
    ge rx905_pos, rx905_eos, rxscan908_done
  rxscan908_scan:
    set_addr $I10, rxscan908_loop
    rx905_cur."!mark_push"(0, rx905_pos, $I10)
  rxscan908_done:
.annotate "line", 433
  # rx subrule "lambda" subtype=zerowidth negate=
    rx905_cur."!cursor_pos"(rx905_pos)
    $P10 = rx905_cur."lambda"()
    unless $P10, rx905_fail
  # rx pass
    rx905_cur."!cursor_pass"(rx905_pos, "infixstopper")
    rx905_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx905_pos)
    .return (rx905_cur)
  rx905_fail:
.annotate "line", 413
    (rx905_rep, rx905_pos, $I10, $P10) = rx905_cur."!mark_fail"(0)
    lt rx905_pos, -1, rx905_done
    eq rx905_pos, -1, rx905_fail
    jump $I10
  rx905_done:
    rx905_cur."!cursor_fail"()
    rx905_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx905_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("224_1266334190.64822") :method
.annotate "line", 413
    new $P907, "ResizablePMCArray"
    push $P907, ""
    .return ($P907)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("225_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx910_tgt
    .local int rx910_pos
    .local int rx910_off
    .local int rx910_eos
    .local int rx910_rep
    .local pmc rx910_cur
    (rx910_cur, rx910_pos, rx910_tgt) = self."!cursor_start"()
    rx910_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
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
.annotate "line", 436
  # rx literal  "["
    add $I11, rx910_pos, 1
    gt $I11, rx910_eos, rx910_fail
    sub $I11, rx910_pos, rx910_off
    substr $S10, rx910_tgt, $I11, 1
    ne $S10, "[", rx910_fail
    add rx910_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx910_cur."!cursor_pos"(rx910_pos)
    $P10 = rx910_cur."ws"()
    unless $P10, rx910_fail
    rx910_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx910_cur."!cursor_pos"(rx910_pos)
    $P10 = rx910_cur."EXPR"()
    unless $P10, rx910_fail
    rx910_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx910_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx910_pos, 1
    gt $I11, rx910_eos, rx910_fail
    sub $I11, rx910_pos, rx910_off
    substr $S10, rx910_tgt, $I11, 1
    ne $S10, "]", rx910_fail
    add rx910_pos, 1
.annotate "line", 437
  # rx subrule "O" subtype=capture negate=
    rx910_cur."!cursor_pos"(rx910_pos)
    $P10 = rx910_cur."O"("%methodop")
    unless $P10, rx910_fail
    rx910_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx910_pos = $P10."pos"()
.annotate "line", 435
  # rx pass
    rx910_cur."!cursor_pass"(rx910_pos, "postcircumfix:sym<[ ]>")
    rx910_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx910_pos)
    .return (rx910_cur)
  rx910_fail:
.annotate "line", 413
    (rx910_rep, rx910_pos, $I10, $P10) = rx910_cur."!mark_fail"(0)
    lt rx910_pos, -1, rx910_done
    eq rx910_pos, -1, rx910_fail
    jump $I10
  rx910_done:
    rx910_cur."!cursor_fail"()
    rx910_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx910_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("226_1266334190.64822") :method
.annotate "line", 413
    $P912 = self."!PREFIX__!subrule"("", "[")
    new $P913, "ResizablePMCArray"
    push $P913, $P912
    .return ($P913)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("227_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx916_tgt
    .local int rx916_pos
    .local int rx916_off
    .local int rx916_eos
    .local int rx916_rep
    .local pmc rx916_cur
    (rx916_cur, rx916_pos, rx916_tgt) = self."!cursor_start"()
    rx916_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx916_cur
    .local pmc match
    .lex "$/", match
    length rx916_eos, rx916_tgt
    set rx916_off, 0
    lt rx916_pos, 2, rx916_start
    sub rx916_off, rx916_pos, 1
    substr rx916_tgt, rx916_tgt, rx916_off
  rx916_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan920_done
    goto rxscan920_scan
  rxscan920_loop:
    ($P10) = rx916_cur."from"()
    inc $P10
    set rx916_pos, $P10
    ge rx916_pos, rx916_eos, rxscan920_done
  rxscan920_scan:
    set_addr $I10, rxscan920_loop
    rx916_cur."!mark_push"(0, rx916_pos, $I10)
  rxscan920_done:
.annotate "line", 441
  # rx literal  "{"
    add $I11, rx916_pos, 1
    gt $I11, rx916_eos, rx916_fail
    sub $I11, rx916_pos, rx916_off
    substr $S10, rx916_tgt, $I11, 1
    ne $S10, "{", rx916_fail
    add rx916_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx916_cur."!cursor_pos"(rx916_pos)
    $P10 = rx916_cur."ws"()
    unless $P10, rx916_fail
    rx916_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx916_cur."!cursor_pos"(rx916_pos)
    $P10 = rx916_cur."EXPR"()
    unless $P10, rx916_fail
    rx916_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx916_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx916_pos, 1
    gt $I11, rx916_eos, rx916_fail
    sub $I11, rx916_pos, rx916_off
    substr $S10, rx916_tgt, $I11, 1
    ne $S10, "}", rx916_fail
    add rx916_pos, 1
.annotate "line", 442
  # rx subrule "O" subtype=capture negate=
    rx916_cur."!cursor_pos"(rx916_pos)
    $P10 = rx916_cur."O"("%methodop")
    unless $P10, rx916_fail
    rx916_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx916_pos = $P10."pos"()
.annotate "line", 440
  # rx pass
    rx916_cur."!cursor_pass"(rx916_pos, "postcircumfix:sym<{ }>")
    rx916_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx916_pos)
    .return (rx916_cur)
  rx916_fail:
.annotate "line", 413
    (rx916_rep, rx916_pos, $I10, $P10) = rx916_cur."!mark_fail"(0)
    lt rx916_pos, -1, rx916_done
    eq rx916_pos, -1, rx916_fail
    jump $I10
  rx916_done:
    rx916_cur."!cursor_fail"()
    rx916_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx916_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("228_1266334190.64822") :method
.annotate "line", 413
    $P918 = self."!PREFIX__!subrule"("", "{")
    new $P919, "ResizablePMCArray"
    push $P919, $P918
    .return ($P919)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("229_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx922_tgt
    .local int rx922_pos
    .local int rx922_off
    .local int rx922_eos
    .local int rx922_rep
    .local pmc rx922_cur
    (rx922_cur, rx922_pos, rx922_tgt) = self."!cursor_start"()
    rx922_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx922_cur
    .local pmc match
    .lex "$/", match
    length rx922_eos, rx922_tgt
    set rx922_off, 0
    lt rx922_pos, 2, rx922_start
    sub rx922_off, rx922_pos, 1
    substr rx922_tgt, rx922_tgt, rx922_off
  rx922_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan925_done
    goto rxscan925_scan
  rxscan925_loop:
    ($P10) = rx922_cur."from"()
    inc $P10
    set rx922_pos, $P10
    ge rx922_pos, rx922_eos, rxscan925_done
  rxscan925_scan:
    set_addr $I10, rxscan925_loop
    rx922_cur."!mark_push"(0, rx922_pos, $I10)
  rxscan925_done:
.annotate "line", 446
  # rx enumcharlist negate=0 zerowidth
    ge rx922_pos, rx922_eos, rx922_fail
    sub $I10, rx922_pos, rx922_off
    substr $S10, rx922_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx922_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx922_cur."!cursor_pos"(rx922_pos)
    $P10 = rx922_cur."quote_EXPR"(":q")
    unless $P10, rx922_fail
    rx922_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx922_pos = $P10."pos"()
.annotate "line", 447
  # rx subrule "O" subtype=capture negate=
    rx922_cur."!cursor_pos"(rx922_pos)
    $P10 = rx922_cur."O"("%methodop")
    unless $P10, rx922_fail
    rx922_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx922_pos = $P10."pos"()
.annotate "line", 445
  # rx pass
    rx922_cur."!cursor_pass"(rx922_pos, "postcircumfix:sym<ang>")
    rx922_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx922_pos)
    .return (rx922_cur)
  rx922_fail:
.annotate "line", 413
    (rx922_rep, rx922_pos, $I10, $P10) = rx922_cur."!mark_fail"(0)
    lt rx922_pos, -1, rx922_done
    eq rx922_pos, -1, rx922_fail
    jump $I10
  rx922_done:
    rx922_cur."!cursor_fail"()
    rx922_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx922_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("230_1266334190.64822") :method
.annotate "line", 413
    new $P924, "ResizablePMCArray"
    push $P924, "<"
    .return ($P924)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("231_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx927_tgt
    .local int rx927_pos
    .local int rx927_off
    .local int rx927_eos
    .local int rx927_rep
    .local pmc rx927_cur
    (rx927_cur, rx927_pos, rx927_tgt) = self."!cursor_start"()
    rx927_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
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
.annotate "line", 451
  # rx literal  "("
    add $I11, rx927_pos, 1
    gt $I11, rx927_eos, rx927_fail
    sub $I11, rx927_pos, rx927_off
    substr $S10, rx927_tgt, $I11, 1
    ne $S10, "(", rx927_fail
    add rx927_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx927_cur."!cursor_pos"(rx927_pos)
    $P10 = rx927_cur."ws"()
    unless $P10, rx927_fail
    rx927_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx927_cur."!cursor_pos"(rx927_pos)
    $P10 = rx927_cur."arglist"()
    unless $P10, rx927_fail
    rx927_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx927_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx927_pos, 1
    gt $I11, rx927_eos, rx927_fail
    sub $I11, rx927_pos, rx927_off
    substr $S10, rx927_tgt, $I11, 1
    ne $S10, ")", rx927_fail
    add rx927_pos, 1
.annotate "line", 452
  # rx subrule "O" subtype=capture negate=
    rx927_cur."!cursor_pos"(rx927_pos)
    $P10 = rx927_cur."O"("%methodop")
    unless $P10, rx927_fail
    rx927_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx927_pos = $P10."pos"()
.annotate "line", 450
  # rx pass
    rx927_cur."!cursor_pass"(rx927_pos, "postcircumfix:sym<( )>")
    rx927_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx927_pos)
    .return (rx927_cur)
  rx927_fail:
.annotate "line", 413
    (rx927_rep, rx927_pos, $I10, $P10) = rx927_cur."!mark_fail"(0)
    lt rx927_pos, -1, rx927_done
    eq rx927_pos, -1, rx927_fail
    jump $I10
  rx927_done:
    rx927_cur."!cursor_fail"()
    rx927_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx927_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("232_1266334190.64822") :method
.annotate "line", 413
    $P929 = self."!PREFIX__!subrule"("", "(")
    new $P930, "ResizablePMCArray"
    push $P930, $P929
    .return ($P930)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("233_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx933_tgt
    .local int rx933_pos
    .local int rx933_off
    .local int rx933_eos
    .local int rx933_rep
    .local pmc rx933_cur
    (rx933_cur, rx933_pos, rx933_tgt) = self."!cursor_start"()
    rx933_cur."!cursor_debug"("START ", "postfix:sym<.>")
    .lex unicode:"$\x{a2}", rx933_cur
    .local pmc match
    .lex "$/", match
    length rx933_eos, rx933_tgt
    set rx933_off, 0
    lt rx933_pos, 2, rx933_start
    sub rx933_off, rx933_pos, 1
    substr rx933_tgt, rx933_tgt, rx933_off
  rx933_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan937_done
    goto rxscan937_scan
  rxscan937_loop:
    ($P10) = rx933_cur."from"()
    inc $P10
    set rx933_pos, $P10
    ge rx933_pos, rx933_eos, rxscan937_done
  rxscan937_scan:
    set_addr $I10, rxscan937_loop
    rx933_cur."!mark_push"(0, rx933_pos, $I10)
  rxscan937_done:
.annotate "line", 455
  # rx subrule "dotty" subtype=capture negate=
    rx933_cur."!cursor_pos"(rx933_pos)
    $P10 = rx933_cur."dotty"()
    unless $P10, rx933_fail
    rx933_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx933_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx933_cur."!cursor_pos"(rx933_pos)
    $P10 = rx933_cur."O"("%methodop")
    unless $P10, rx933_fail
    rx933_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx933_pos = $P10."pos"()
  # rx pass
    rx933_cur."!cursor_pass"(rx933_pos, "postfix:sym<.>")
    rx933_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx933_pos)
    .return (rx933_cur)
  rx933_fail:
.annotate "line", 413
    (rx933_rep, rx933_pos, $I10, $P10) = rx933_cur."!mark_fail"(0)
    lt rx933_pos, -1, rx933_done
    eq rx933_pos, -1, rx933_fail
    jump $I10
  rx933_done:
    rx933_cur."!cursor_fail"()
    rx933_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx933_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("234_1266334190.64822") :method
.annotate "line", 413
    $P935 = self."!PREFIX__!subrule"("dotty", "")
    new $P936, "ResizablePMCArray"
    push $P936, $P935
    .return ($P936)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("235_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx939_tgt
    .local int rx939_pos
    .local int rx939_off
    .local int rx939_eos
    .local int rx939_rep
    .local pmc rx939_cur
    (rx939_cur, rx939_pos, rx939_tgt) = self."!cursor_start"()
    rx939_cur."!cursor_debug"("START ", "prefix:sym<++>")
    .lex unicode:"$\x{a2}", rx939_cur
    .local pmc match
    .lex "$/", match
    length rx939_eos, rx939_tgt
    set rx939_off, 0
    lt rx939_pos, 2, rx939_start
    sub rx939_off, rx939_pos, 1
    substr rx939_tgt, rx939_tgt, rx939_off
  rx939_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan943_done
    goto rxscan943_scan
  rxscan943_loop:
    ($P10) = rx939_cur."from"()
    inc $P10
    set rx939_pos, $P10
    ge rx939_pos, rx939_eos, rxscan943_done
  rxscan943_scan:
    set_addr $I10, rxscan943_loop
    rx939_cur."!mark_push"(0, rx939_pos, $I10)
  rxscan943_done:
.annotate "line", 457
  # rx subcapture "sym"
    set_addr $I10, rxcap_944_fail
    rx939_cur."!mark_push"(0, rx939_pos, $I10)
  # rx literal  "++"
    add $I11, rx939_pos, 2
    gt $I11, rx939_eos, rx939_fail
    sub $I11, rx939_pos, rx939_off
    substr $S10, rx939_tgt, $I11, 2
    ne $S10, "++", rx939_fail
    add rx939_pos, 2
    set_addr $I10, rxcap_944_fail
    ($I12, $I11) = rx939_cur."!mark_peek"($I10)
    rx939_cur."!cursor_pos"($I11)
    ($P10) = rx939_cur."!cursor_start"()
    $P10."!cursor_pass"(rx939_pos, "")
    rx939_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_944_done
  rxcap_944_fail:
    goto rx939_fail
  rxcap_944_done:
  # rx subrule "O" subtype=capture negate=
    rx939_cur."!cursor_pos"(rx939_pos)
    $P10 = rx939_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx939_fail
    rx939_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx939_pos = $P10."pos"()
  # rx pass
    rx939_cur."!cursor_pass"(rx939_pos, "prefix:sym<++>")
    rx939_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx939_pos)
    .return (rx939_cur)
  rx939_fail:
.annotate "line", 413
    (rx939_rep, rx939_pos, $I10, $P10) = rx939_cur."!mark_fail"(0)
    lt rx939_pos, -1, rx939_done
    eq rx939_pos, -1, rx939_fail
    jump $I10
  rx939_done:
    rx939_cur."!cursor_fail"()
    rx939_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx939_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("236_1266334190.64822") :method
.annotate "line", 413
    $P941 = self."!PREFIX__!subrule"("O", "++")
    new $P942, "ResizablePMCArray"
    push $P942, $P941
    .return ($P942)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("237_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx946_tgt
    .local int rx946_pos
    .local int rx946_off
    .local int rx946_eos
    .local int rx946_rep
    .local pmc rx946_cur
    (rx946_cur, rx946_pos, rx946_tgt) = self."!cursor_start"()
    rx946_cur."!cursor_debug"("START ", "prefix:sym<-->")
    .lex unicode:"$\x{a2}", rx946_cur
    .local pmc match
    .lex "$/", match
    length rx946_eos, rx946_tgt
    set rx946_off, 0
    lt rx946_pos, 2, rx946_start
    sub rx946_off, rx946_pos, 1
    substr rx946_tgt, rx946_tgt, rx946_off
  rx946_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan950_done
    goto rxscan950_scan
  rxscan950_loop:
    ($P10) = rx946_cur."from"()
    inc $P10
    set rx946_pos, $P10
    ge rx946_pos, rx946_eos, rxscan950_done
  rxscan950_scan:
    set_addr $I10, rxscan950_loop
    rx946_cur."!mark_push"(0, rx946_pos, $I10)
  rxscan950_done:
.annotate "line", 458
  # rx subcapture "sym"
    set_addr $I10, rxcap_951_fail
    rx946_cur."!mark_push"(0, rx946_pos, $I10)
  # rx literal  "--"
    add $I11, rx946_pos, 2
    gt $I11, rx946_eos, rx946_fail
    sub $I11, rx946_pos, rx946_off
    substr $S10, rx946_tgt, $I11, 2
    ne $S10, "--", rx946_fail
    add rx946_pos, 2
    set_addr $I10, rxcap_951_fail
    ($I12, $I11) = rx946_cur."!mark_peek"($I10)
    rx946_cur."!cursor_pos"($I11)
    ($P10) = rx946_cur."!cursor_start"()
    $P10."!cursor_pass"(rx946_pos, "")
    rx946_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_951_done
  rxcap_951_fail:
    goto rx946_fail
  rxcap_951_done:
  # rx subrule "O" subtype=capture negate=
    rx946_cur."!cursor_pos"(rx946_pos)
    $P10 = rx946_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx946_fail
    rx946_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx946_pos = $P10."pos"()
  # rx pass
    rx946_cur."!cursor_pass"(rx946_pos, "prefix:sym<-->")
    rx946_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx946_pos)
    .return (rx946_cur)
  rx946_fail:
.annotate "line", 413
    (rx946_rep, rx946_pos, $I10, $P10) = rx946_cur."!mark_fail"(0)
    lt rx946_pos, -1, rx946_done
    eq rx946_pos, -1, rx946_fail
    jump $I10
  rx946_done:
    rx946_cur."!cursor_fail"()
    rx946_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx946_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("238_1266334190.64822") :method
.annotate "line", 413
    $P948 = self."!PREFIX__!subrule"("O", "--")
    new $P949, "ResizablePMCArray"
    push $P949, $P948
    .return ($P949)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("239_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx953_tgt
    .local int rx953_pos
    .local int rx953_off
    .local int rx953_eos
    .local int rx953_rep
    .local pmc rx953_cur
    (rx953_cur, rx953_pos, rx953_tgt) = self."!cursor_start"()
    rx953_cur."!cursor_debug"("START ", "postfix:sym<++>")
    .lex unicode:"$\x{a2}", rx953_cur
    .local pmc match
    .lex "$/", match
    length rx953_eos, rx953_tgt
    set rx953_off, 0
    lt rx953_pos, 2, rx953_start
    sub rx953_off, rx953_pos, 1
    substr rx953_tgt, rx953_tgt, rx953_off
  rx953_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan957_done
    goto rxscan957_scan
  rxscan957_loop:
    ($P10) = rx953_cur."from"()
    inc $P10
    set rx953_pos, $P10
    ge rx953_pos, rx953_eos, rxscan957_done
  rxscan957_scan:
    set_addr $I10, rxscan957_loop
    rx953_cur."!mark_push"(0, rx953_pos, $I10)
  rxscan957_done:
.annotate "line", 461
  # rx subcapture "sym"
    set_addr $I10, rxcap_958_fail
    rx953_cur."!mark_push"(0, rx953_pos, $I10)
  # rx literal  "++"
    add $I11, rx953_pos, 2
    gt $I11, rx953_eos, rx953_fail
    sub $I11, rx953_pos, rx953_off
    substr $S10, rx953_tgt, $I11, 2
    ne $S10, "++", rx953_fail
    add rx953_pos, 2
    set_addr $I10, rxcap_958_fail
    ($I12, $I11) = rx953_cur."!mark_peek"($I10)
    rx953_cur."!cursor_pos"($I11)
    ($P10) = rx953_cur."!cursor_start"()
    $P10."!cursor_pass"(rx953_pos, "")
    rx953_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_958_done
  rxcap_958_fail:
    goto rx953_fail
  rxcap_958_done:
  # rx subrule "O" subtype=capture negate=
    rx953_cur."!cursor_pos"(rx953_pos)
    $P10 = rx953_cur."O"("%autoincrement")
    unless $P10, rx953_fail
    rx953_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx953_pos = $P10."pos"()
  # rx pass
    rx953_cur."!cursor_pass"(rx953_pos, "postfix:sym<++>")
    rx953_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx953_pos)
    .return (rx953_cur)
  rx953_fail:
.annotate "line", 413
    (rx953_rep, rx953_pos, $I10, $P10) = rx953_cur."!mark_fail"(0)
    lt rx953_pos, -1, rx953_done
    eq rx953_pos, -1, rx953_fail
    jump $I10
  rx953_done:
    rx953_cur."!cursor_fail"()
    rx953_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx953_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("240_1266334190.64822") :method
.annotate "line", 413
    $P955 = self."!PREFIX__!subrule"("O", "++")
    new $P956, "ResizablePMCArray"
    push $P956, $P955
    .return ($P956)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("241_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx960_tgt
    .local int rx960_pos
    .local int rx960_off
    .local int rx960_eos
    .local int rx960_rep
    .local pmc rx960_cur
    (rx960_cur, rx960_pos, rx960_tgt) = self."!cursor_start"()
    rx960_cur."!cursor_debug"("START ", "postfix:sym<-->")
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
.annotate "line", 462
  # rx subcapture "sym"
    set_addr $I10, rxcap_965_fail
    rx960_cur."!mark_push"(0, rx960_pos, $I10)
  # rx literal  "--"
    add $I11, rx960_pos, 2
    gt $I11, rx960_eos, rx960_fail
    sub $I11, rx960_pos, rx960_off
    substr $S10, rx960_tgt, $I11, 2
    ne $S10, "--", rx960_fail
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
    $P10 = rx960_cur."O"("%autoincrement")
    unless $P10, rx960_fail
    rx960_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx960_pos = $P10."pos"()
  # rx pass
    rx960_cur."!cursor_pass"(rx960_pos, "postfix:sym<-->")
    rx960_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx960_pos)
    .return (rx960_cur)
  rx960_fail:
.annotate "line", 413
    (rx960_rep, rx960_pos, $I10, $P10) = rx960_cur."!mark_fail"(0)
    lt rx960_pos, -1, rx960_done
    eq rx960_pos, -1, rx960_fail
    jump $I10
  rx960_done:
    rx960_cur."!cursor_fail"()
    rx960_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx960_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("242_1266334190.64822") :method
.annotate "line", 413
    $P962 = self."!PREFIX__!subrule"("O", "--")
    new $P963, "ResizablePMCArray"
    push $P963, $P962
    .return ($P963)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("243_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx967_tgt
    .local int rx967_pos
    .local int rx967_off
    .local int rx967_eos
    .local int rx967_rep
    .local pmc rx967_cur
    (rx967_cur, rx967_pos, rx967_tgt) = self."!cursor_start"()
    rx967_cur."!cursor_debug"("START ", "infix:sym<**>")
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
.annotate "line", 464
  # rx subcapture "sym"
    set_addr $I10, rxcap_972_fail
    rx967_cur."!mark_push"(0, rx967_pos, $I10)
  # rx literal  "**"
    add $I11, rx967_pos, 2
    gt $I11, rx967_eos, rx967_fail
    sub $I11, rx967_pos, rx967_off
    substr $S10, rx967_tgt, $I11, 2
    ne $S10, "**", rx967_fail
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
    $P10 = rx967_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx967_fail
    rx967_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx967_pos = $P10."pos"()
  # rx pass
    rx967_cur."!cursor_pass"(rx967_pos, "infix:sym<**>")
    rx967_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx967_pos)
    .return (rx967_cur)
  rx967_fail:
.annotate "line", 413
    (rx967_rep, rx967_pos, $I10, $P10) = rx967_cur."!mark_fail"(0)
    lt rx967_pos, -1, rx967_done
    eq rx967_pos, -1, rx967_fail
    jump $I10
  rx967_done:
    rx967_cur."!cursor_fail"()
    rx967_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx967_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("244_1266334190.64822") :method
.annotate "line", 413
    $P969 = self."!PREFIX__!subrule"("O", "**")
    new $P970, "ResizablePMCArray"
    push $P970, $P969
    .return ($P970)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("245_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx974_tgt
    .local int rx974_pos
    .local int rx974_off
    .local int rx974_eos
    .local int rx974_rep
    .local pmc rx974_cur
    (rx974_cur, rx974_pos, rx974_tgt) = self."!cursor_start"()
    rx974_cur."!cursor_debug"("START ", "prefix:sym<+>")
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
.annotate "line", 466
  # rx subcapture "sym"
    set_addr $I10, rxcap_979_fail
    rx974_cur."!mark_push"(0, rx974_pos, $I10)
  # rx literal  "+"
    add $I11, rx974_pos, 1
    gt $I11, rx974_eos, rx974_fail
    sub $I11, rx974_pos, rx974_off
    substr $S10, rx974_tgt, $I11, 1
    ne $S10, "+", rx974_fail
    add rx974_pos, 1
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
    $P10 = rx974_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx974_fail
    rx974_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx974_pos = $P10."pos"()
  # rx pass
    rx974_cur."!cursor_pass"(rx974_pos, "prefix:sym<+>")
    rx974_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx974_pos)
    .return (rx974_cur)
  rx974_fail:
.annotate "line", 413
    (rx974_rep, rx974_pos, $I10, $P10) = rx974_cur."!mark_fail"(0)
    lt rx974_pos, -1, rx974_done
    eq rx974_pos, -1, rx974_fail
    jump $I10
  rx974_done:
    rx974_cur."!cursor_fail"()
    rx974_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx974_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("246_1266334190.64822") :method
.annotate "line", 413
    $P976 = self."!PREFIX__!subrule"("O", "+")
    new $P977, "ResizablePMCArray"
    push $P977, $P976
    .return ($P977)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("247_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx981_tgt
    .local int rx981_pos
    .local int rx981_off
    .local int rx981_eos
    .local int rx981_rep
    .local pmc rx981_cur
    (rx981_cur, rx981_pos, rx981_tgt) = self."!cursor_start"()
    rx981_cur."!cursor_debug"("START ", "prefix:sym<~>")
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
.annotate "line", 467
  # rx subcapture "sym"
    set_addr $I10, rxcap_986_fail
    rx981_cur."!mark_push"(0, rx981_pos, $I10)
  # rx literal  "~"
    add $I11, rx981_pos, 1
    gt $I11, rx981_eos, rx981_fail
    sub $I11, rx981_pos, rx981_off
    substr $S10, rx981_tgt, $I11, 1
    ne $S10, "~", rx981_fail
    add rx981_pos, 1
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
    $P10 = rx981_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx981_fail
    rx981_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx981_pos = $P10."pos"()
  # rx pass
    rx981_cur."!cursor_pass"(rx981_pos, "prefix:sym<~>")
    rx981_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx981_pos)
    .return (rx981_cur)
  rx981_fail:
.annotate "line", 413
    (rx981_rep, rx981_pos, $I10, $P10) = rx981_cur."!mark_fail"(0)
    lt rx981_pos, -1, rx981_done
    eq rx981_pos, -1, rx981_fail
    jump $I10
  rx981_done:
    rx981_cur."!cursor_fail"()
    rx981_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx981_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("248_1266334190.64822") :method
.annotate "line", 413
    $P983 = self."!PREFIX__!subrule"("O", "~")
    new $P984, "ResizablePMCArray"
    push $P984, $P983
    .return ($P984)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("249_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx988_tgt
    .local int rx988_pos
    .local int rx988_off
    .local int rx988_eos
    .local int rx988_rep
    .local pmc rx988_cur
    (rx988_cur, rx988_pos, rx988_tgt) = self."!cursor_start"()
    rx988_cur."!cursor_debug"("START ", "prefix:sym<->")
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
    ne $I10, -1, rxscan991_done
    goto rxscan991_scan
  rxscan991_loop:
    ($P10) = rx988_cur."from"()
    inc $P10
    set rx988_pos, $P10
    ge rx988_pos, rx988_eos, rxscan991_done
  rxscan991_scan:
    set_addr $I10, rxscan991_loop
    rx988_cur."!mark_push"(0, rx988_pos, $I10)
  rxscan991_done:
.annotate "line", 468
  # rx subcapture "sym"
    set_addr $I10, rxcap_992_fail
    rx988_cur."!mark_push"(0, rx988_pos, $I10)
  # rx literal  "-"
    add $I11, rx988_pos, 1
    gt $I11, rx988_eos, rx988_fail
    sub $I11, rx988_pos, rx988_off
    substr $S10, rx988_tgt, $I11, 1
    ne $S10, "-", rx988_fail
    add rx988_pos, 1
    set_addr $I10, rxcap_992_fail
    ($I12, $I11) = rx988_cur."!mark_peek"($I10)
    rx988_cur."!cursor_pos"($I11)
    ($P10) = rx988_cur."!cursor_start"()
    $P10."!cursor_pass"(rx988_pos, "")
    rx988_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_992_done
  rxcap_992_fail:
    goto rx988_fail
  rxcap_992_done:
  # rx enumcharlist negate=1 zerowidth
    ge rx988_pos, rx988_eos, rx988_fail
    sub $I10, rx988_pos, rx988_off
    substr $S10, rx988_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx988_fail
  # rx subrule "number" subtype=zerowidth negate=1
    rx988_cur."!cursor_pos"(rx988_pos)
    $P10 = rx988_cur."number"()
    if $P10, rx988_fail
  # rx subrule "O" subtype=capture negate=
    rx988_cur."!cursor_pos"(rx988_pos)
    $P10 = rx988_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx988_fail
    rx988_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx988_pos = $P10."pos"()
  # rx pass
    rx988_cur."!cursor_pass"(rx988_pos, "prefix:sym<->")
    rx988_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx988_pos)
    .return (rx988_cur)
  rx988_fail:
.annotate "line", 413
    (rx988_rep, rx988_pos, $I10, $P10) = rx988_cur."!mark_fail"(0)
    lt rx988_pos, -1, rx988_done
    eq rx988_pos, -1, rx988_fail
    jump $I10
  rx988_done:
    rx988_cur."!cursor_fail"()
    rx988_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx988_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("250_1266334190.64822") :method
.annotate "line", 413
    new $P990, "ResizablePMCArray"
    push $P990, "-"
    .return ($P990)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("251_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx994_tgt
    .local int rx994_pos
    .local int rx994_off
    .local int rx994_eos
    .local int rx994_rep
    .local pmc rx994_cur
    (rx994_cur, rx994_pos, rx994_tgt) = self."!cursor_start"()
    rx994_cur."!cursor_debug"("START ", "prefix:sym<?>")
    .lex unicode:"$\x{a2}", rx994_cur
    .local pmc match
    .lex "$/", match
    length rx994_eos, rx994_tgt
    set rx994_off, 0
    lt rx994_pos, 2, rx994_start
    sub rx994_off, rx994_pos, 1
    substr rx994_tgt, rx994_tgt, rx994_off
  rx994_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan998_done
    goto rxscan998_scan
  rxscan998_loop:
    ($P10) = rx994_cur."from"()
    inc $P10
    set rx994_pos, $P10
    ge rx994_pos, rx994_eos, rxscan998_done
  rxscan998_scan:
    set_addr $I10, rxscan998_loop
    rx994_cur."!mark_push"(0, rx994_pos, $I10)
  rxscan998_done:
.annotate "line", 469
  # rx subcapture "sym"
    set_addr $I10, rxcap_999_fail
    rx994_cur."!mark_push"(0, rx994_pos, $I10)
  # rx literal  "?"
    add $I11, rx994_pos, 1
    gt $I11, rx994_eos, rx994_fail
    sub $I11, rx994_pos, rx994_off
    substr $S10, rx994_tgt, $I11, 1
    ne $S10, "?", rx994_fail
    add rx994_pos, 1
    set_addr $I10, rxcap_999_fail
    ($I12, $I11) = rx994_cur."!mark_peek"($I10)
    rx994_cur."!cursor_pos"($I11)
    ($P10) = rx994_cur."!cursor_start"()
    $P10."!cursor_pass"(rx994_pos, "")
    rx994_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_999_done
  rxcap_999_fail:
    goto rx994_fail
  rxcap_999_done:
  # rx subrule "O" subtype=capture negate=
    rx994_cur."!cursor_pos"(rx994_pos)
    $P10 = rx994_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx994_fail
    rx994_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx994_pos = $P10."pos"()
  # rx pass
    rx994_cur."!cursor_pass"(rx994_pos, "prefix:sym<?>")
    rx994_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx994_pos)
    .return (rx994_cur)
  rx994_fail:
.annotate "line", 413
    (rx994_rep, rx994_pos, $I10, $P10) = rx994_cur."!mark_fail"(0)
    lt rx994_pos, -1, rx994_done
    eq rx994_pos, -1, rx994_fail
    jump $I10
  rx994_done:
    rx994_cur."!cursor_fail"()
    rx994_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx994_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("252_1266334190.64822") :method
.annotate "line", 413
    $P996 = self."!PREFIX__!subrule"("O", "?")
    new $P997, "ResizablePMCArray"
    push $P997, $P996
    .return ($P997)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("253_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1001_tgt
    .local int rx1001_pos
    .local int rx1001_off
    .local int rx1001_eos
    .local int rx1001_rep
    .local pmc rx1001_cur
    (rx1001_cur, rx1001_pos, rx1001_tgt) = self."!cursor_start"()
    rx1001_cur."!cursor_debug"("START ", "prefix:sym<!>")
    .lex unicode:"$\x{a2}", rx1001_cur
    .local pmc match
    .lex "$/", match
    length rx1001_eos, rx1001_tgt
    set rx1001_off, 0
    lt rx1001_pos, 2, rx1001_start
    sub rx1001_off, rx1001_pos, 1
    substr rx1001_tgt, rx1001_tgt, rx1001_off
  rx1001_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1005_done
    goto rxscan1005_scan
  rxscan1005_loop:
    ($P10) = rx1001_cur."from"()
    inc $P10
    set rx1001_pos, $P10
    ge rx1001_pos, rx1001_eos, rxscan1005_done
  rxscan1005_scan:
    set_addr $I10, rxscan1005_loop
    rx1001_cur."!mark_push"(0, rx1001_pos, $I10)
  rxscan1005_done:
.annotate "line", 470
  # rx subcapture "sym"
    set_addr $I10, rxcap_1006_fail
    rx1001_cur."!mark_push"(0, rx1001_pos, $I10)
  # rx literal  "!"
    add $I11, rx1001_pos, 1
    gt $I11, rx1001_eos, rx1001_fail
    sub $I11, rx1001_pos, rx1001_off
    substr $S10, rx1001_tgt, $I11, 1
    ne $S10, "!", rx1001_fail
    add rx1001_pos, 1
    set_addr $I10, rxcap_1006_fail
    ($I12, $I11) = rx1001_cur."!mark_peek"($I10)
    rx1001_cur."!cursor_pos"($I11)
    ($P10) = rx1001_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1001_pos, "")
    rx1001_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1006_done
  rxcap_1006_fail:
    goto rx1001_fail
  rxcap_1006_done:
  # rx subrule "O" subtype=capture negate=
    rx1001_cur."!cursor_pos"(rx1001_pos)
    $P10 = rx1001_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx1001_fail
    rx1001_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1001_pos = $P10."pos"()
  # rx pass
    rx1001_cur."!cursor_pass"(rx1001_pos, "prefix:sym<!>")
    rx1001_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx1001_pos)
    .return (rx1001_cur)
  rx1001_fail:
.annotate "line", 413
    (rx1001_rep, rx1001_pos, $I10, $P10) = rx1001_cur."!mark_fail"(0)
    lt rx1001_pos, -1, rx1001_done
    eq rx1001_pos, -1, rx1001_fail
    jump $I10
  rx1001_done:
    rx1001_cur."!cursor_fail"()
    rx1001_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx1001_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("254_1266334190.64822") :method
.annotate "line", 413
    $P1003 = self."!PREFIX__!subrule"("O", "!")
    new $P1004, "ResizablePMCArray"
    push $P1004, $P1003
    .return ($P1004)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("255_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1008_tgt
    .local int rx1008_pos
    .local int rx1008_off
    .local int rx1008_eos
    .local int rx1008_rep
    .local pmc rx1008_cur
    (rx1008_cur, rx1008_pos, rx1008_tgt) = self."!cursor_start"()
    rx1008_cur."!cursor_debug"("START ", "prefix:sym<|>")
    .lex unicode:"$\x{a2}", rx1008_cur
    .local pmc match
    .lex "$/", match
    length rx1008_eos, rx1008_tgt
    set rx1008_off, 0
    lt rx1008_pos, 2, rx1008_start
    sub rx1008_off, rx1008_pos, 1
    substr rx1008_tgt, rx1008_tgt, rx1008_off
  rx1008_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1012_done
    goto rxscan1012_scan
  rxscan1012_loop:
    ($P10) = rx1008_cur."from"()
    inc $P10
    set rx1008_pos, $P10
    ge rx1008_pos, rx1008_eos, rxscan1012_done
  rxscan1012_scan:
    set_addr $I10, rxscan1012_loop
    rx1008_cur."!mark_push"(0, rx1008_pos, $I10)
  rxscan1012_done:
.annotate "line", 471
  # rx subcapture "sym"
    set_addr $I10, rxcap_1013_fail
    rx1008_cur."!mark_push"(0, rx1008_pos, $I10)
  # rx literal  "|"
    add $I11, rx1008_pos, 1
    gt $I11, rx1008_eos, rx1008_fail
    sub $I11, rx1008_pos, rx1008_off
    substr $S10, rx1008_tgt, $I11, 1
    ne $S10, "|", rx1008_fail
    add rx1008_pos, 1
    set_addr $I10, rxcap_1013_fail
    ($I12, $I11) = rx1008_cur."!mark_peek"($I10)
    rx1008_cur."!cursor_pos"($I11)
    ($P10) = rx1008_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1008_pos, "")
    rx1008_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1013_done
  rxcap_1013_fail:
    goto rx1008_fail
  rxcap_1013_done:
  # rx subrule "O" subtype=capture negate=
    rx1008_cur."!cursor_pos"(rx1008_pos)
    $P10 = rx1008_cur."O"("%symbolic_unary")
    unless $P10, rx1008_fail
    rx1008_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1008_pos = $P10."pos"()
  # rx pass
    rx1008_cur."!cursor_pass"(rx1008_pos, "prefix:sym<|>")
    rx1008_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx1008_pos)
    .return (rx1008_cur)
  rx1008_fail:
.annotate "line", 413
    (rx1008_rep, rx1008_pos, $I10, $P10) = rx1008_cur."!mark_fail"(0)
    lt rx1008_pos, -1, rx1008_done
    eq rx1008_pos, -1, rx1008_fail
    jump $I10
  rx1008_done:
    rx1008_cur."!cursor_fail"()
    rx1008_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx1008_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("256_1266334190.64822") :method
.annotate "line", 413
    $P1010 = self."!PREFIX__!subrule"("O", "|")
    new $P1011, "ResizablePMCArray"
    push $P1011, $P1010
    .return ($P1011)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("257_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1015_tgt
    .local int rx1015_pos
    .local int rx1015_off
    .local int rx1015_eos
    .local int rx1015_rep
    .local pmc rx1015_cur
    (rx1015_cur, rx1015_pos, rx1015_tgt) = self."!cursor_start"()
    rx1015_cur."!cursor_debug"("START ", "infix:sym<*>")
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
.annotate "line", 473
  # rx subcapture "sym"
    set_addr $I10, rxcap_1020_fail
    rx1015_cur."!mark_push"(0, rx1015_pos, $I10)
  # rx literal  "*"
    add $I11, rx1015_pos, 1
    gt $I11, rx1015_eos, rx1015_fail
    sub $I11, rx1015_pos, rx1015_off
    substr $S10, rx1015_tgt, $I11, 1
    ne $S10, "*", rx1015_fail
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
    $P10 = rx1015_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx1015_fail
    rx1015_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1015_pos = $P10."pos"()
  # rx pass
    rx1015_cur."!cursor_pass"(rx1015_pos, "infix:sym<*>")
    rx1015_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx1015_pos)
    .return (rx1015_cur)
  rx1015_fail:
.annotate "line", 413
    (rx1015_rep, rx1015_pos, $I10, $P10) = rx1015_cur."!mark_fail"(0)
    lt rx1015_pos, -1, rx1015_done
    eq rx1015_pos, -1, rx1015_fail
    jump $I10
  rx1015_done:
    rx1015_cur."!cursor_fail"()
    rx1015_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx1015_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("258_1266334190.64822") :method
.annotate "line", 413
    $P1017 = self."!PREFIX__!subrule"("O", "*")
    new $P1018, "ResizablePMCArray"
    push $P1018, $P1017
    .return ($P1018)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("259_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1022_tgt
    .local int rx1022_pos
    .local int rx1022_off
    .local int rx1022_eos
    .local int rx1022_rep
    .local pmc rx1022_cur
    (rx1022_cur, rx1022_pos, rx1022_tgt) = self."!cursor_start"()
    rx1022_cur."!cursor_debug"("START ", "infix:sym</>")
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
.annotate "line", 474
  # rx subcapture "sym"
    set_addr $I10, rxcap_1027_fail
    rx1022_cur."!mark_push"(0, rx1022_pos, $I10)
  # rx literal  "/"
    add $I11, rx1022_pos, 1
    gt $I11, rx1022_eos, rx1022_fail
    sub $I11, rx1022_pos, rx1022_off
    substr $S10, rx1022_tgt, $I11, 1
    ne $S10, "/", rx1022_fail
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
    $P10 = rx1022_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx1022_fail
    rx1022_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1022_pos = $P10."pos"()
  # rx pass
    rx1022_cur."!cursor_pass"(rx1022_pos, "infix:sym</>")
    rx1022_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx1022_pos)
    .return (rx1022_cur)
  rx1022_fail:
.annotate "line", 413
    (rx1022_rep, rx1022_pos, $I10, $P10) = rx1022_cur."!mark_fail"(0)
    lt rx1022_pos, -1, rx1022_done
    eq rx1022_pos, -1, rx1022_fail
    jump $I10
  rx1022_done:
    rx1022_cur."!cursor_fail"()
    rx1022_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx1022_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("260_1266334190.64822") :method
.annotate "line", 413
    $P1024 = self."!PREFIX__!subrule"("O", "/")
    new $P1025, "ResizablePMCArray"
    push $P1025, $P1024
    .return ($P1025)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("261_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1029_tgt
    .local int rx1029_pos
    .local int rx1029_off
    .local int rx1029_eos
    .local int rx1029_rep
    .local pmc rx1029_cur
    (rx1029_cur, rx1029_pos, rx1029_tgt) = self."!cursor_start"()
    rx1029_cur."!cursor_debug"("START ", "infix:sym<%>")
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
.annotate "line", 475
  # rx subcapture "sym"
    set_addr $I10, rxcap_1034_fail
    rx1029_cur."!mark_push"(0, rx1029_pos, $I10)
  # rx literal  "%"
    add $I11, rx1029_pos, 1
    gt $I11, rx1029_eos, rx1029_fail
    sub $I11, rx1029_pos, rx1029_off
    substr $S10, rx1029_tgt, $I11, 1
    ne $S10, "%", rx1029_fail
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
    $P10 = rx1029_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx1029_fail
    rx1029_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1029_pos = $P10."pos"()
  # rx pass
    rx1029_cur."!cursor_pass"(rx1029_pos, "infix:sym<%>")
    rx1029_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx1029_pos)
    .return (rx1029_cur)
  rx1029_fail:
.annotate "line", 413
    (rx1029_rep, rx1029_pos, $I10, $P10) = rx1029_cur."!mark_fail"(0)
    lt rx1029_pos, -1, rx1029_done
    eq rx1029_pos, -1, rx1029_fail
    jump $I10
  rx1029_done:
    rx1029_cur."!cursor_fail"()
    rx1029_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx1029_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("262_1266334190.64822") :method
.annotate "line", 413
    $P1031 = self."!PREFIX__!subrule"("O", "%")
    new $P1032, "ResizablePMCArray"
    push $P1032, $P1031
    .return ($P1032)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("263_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1036_tgt
    .local int rx1036_pos
    .local int rx1036_off
    .local int rx1036_eos
    .local int rx1036_rep
    .local pmc rx1036_cur
    (rx1036_cur, rx1036_pos, rx1036_tgt) = self."!cursor_start"()
    rx1036_cur."!cursor_debug"("START ", "infix:sym<+>")
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
.annotate "line", 477
  # rx subcapture "sym"
    set_addr $I10, rxcap_1041_fail
    rx1036_cur."!mark_push"(0, rx1036_pos, $I10)
  # rx literal  "+"
    add $I11, rx1036_pos, 1
    gt $I11, rx1036_eos, rx1036_fail
    sub $I11, rx1036_pos, rx1036_off
    substr $S10, rx1036_tgt, $I11, 1
    ne $S10, "+", rx1036_fail
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
    $P10 = rx1036_cur."O"("%additive, :pirop<add>")
    unless $P10, rx1036_fail
    rx1036_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1036_pos = $P10."pos"()
  # rx pass
    rx1036_cur."!cursor_pass"(rx1036_pos, "infix:sym<+>")
    rx1036_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx1036_pos)
    .return (rx1036_cur)
  rx1036_fail:
.annotate "line", 413
    (rx1036_rep, rx1036_pos, $I10, $P10) = rx1036_cur."!mark_fail"(0)
    lt rx1036_pos, -1, rx1036_done
    eq rx1036_pos, -1, rx1036_fail
    jump $I10
  rx1036_done:
    rx1036_cur."!cursor_fail"()
    rx1036_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx1036_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("264_1266334190.64822") :method
.annotate "line", 413
    $P1038 = self."!PREFIX__!subrule"("O", "+")
    new $P1039, "ResizablePMCArray"
    push $P1039, $P1038
    .return ($P1039)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("265_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1043_tgt
    .local int rx1043_pos
    .local int rx1043_off
    .local int rx1043_eos
    .local int rx1043_rep
    .local pmc rx1043_cur
    (rx1043_cur, rx1043_pos, rx1043_tgt) = self."!cursor_start"()
    rx1043_cur."!cursor_debug"("START ", "infix:sym<->")
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
.annotate "line", 478
  # rx subcapture "sym"
    set_addr $I10, rxcap_1048_fail
    rx1043_cur."!mark_push"(0, rx1043_pos, $I10)
  # rx literal  "-"
    add $I11, rx1043_pos, 1
    gt $I11, rx1043_eos, rx1043_fail
    sub $I11, rx1043_pos, rx1043_off
    substr $S10, rx1043_tgt, $I11, 1
    ne $S10, "-", rx1043_fail
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
    $P10 = rx1043_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx1043_fail
    rx1043_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1043_pos = $P10."pos"()
  # rx pass
    rx1043_cur."!cursor_pass"(rx1043_pos, "infix:sym<->")
    rx1043_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx1043_pos)
    .return (rx1043_cur)
  rx1043_fail:
.annotate "line", 413
    (rx1043_rep, rx1043_pos, $I10, $P10) = rx1043_cur."!mark_fail"(0)
    lt rx1043_pos, -1, rx1043_done
    eq rx1043_pos, -1, rx1043_fail
    jump $I10
  rx1043_done:
    rx1043_cur."!cursor_fail"()
    rx1043_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx1043_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("266_1266334190.64822") :method
.annotate "line", 413
    $P1045 = self."!PREFIX__!subrule"("O", "-")
    new $P1046, "ResizablePMCArray"
    push $P1046, $P1045
    .return ($P1046)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("267_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1050_tgt
    .local int rx1050_pos
    .local int rx1050_off
    .local int rx1050_eos
    .local int rx1050_rep
    .local pmc rx1050_cur
    (rx1050_cur, rx1050_pos, rx1050_tgt) = self."!cursor_start"()
    rx1050_cur."!cursor_debug"("START ", "infix:sym<~>")
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
.annotate "line", 480
  # rx subcapture "sym"
    set_addr $I10, rxcap_1055_fail
    rx1050_cur."!mark_push"(0, rx1050_pos, $I10)
  # rx literal  "~"
    add $I11, rx1050_pos, 1
    gt $I11, rx1050_eos, rx1050_fail
    sub $I11, rx1050_pos, rx1050_off
    substr $S10, rx1050_tgt, $I11, 1
    ne $S10, "~", rx1050_fail
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
    $P10 = rx1050_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx1050_fail
    rx1050_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1050_pos = $P10."pos"()
  # rx pass
    rx1050_cur."!cursor_pass"(rx1050_pos, "infix:sym<~>")
    rx1050_cur."!cursor_debug"("PASS  ", "infix:sym<~>", " at pos=", rx1050_pos)
    .return (rx1050_cur)
  rx1050_fail:
.annotate "line", 413
    (rx1050_rep, rx1050_pos, $I10, $P10) = rx1050_cur."!mark_fail"(0)
    lt rx1050_pos, -1, rx1050_done
    eq rx1050_pos, -1, rx1050_fail
    jump $I10
  rx1050_done:
    rx1050_cur."!cursor_fail"()
    rx1050_cur."!cursor_debug"("FAIL  ", "infix:sym<~>")
    .return (rx1050_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("268_1266334190.64822") :method
.annotate "line", 413
    $P1052 = self."!PREFIX__!subrule"("O", "~")
    new $P1053, "ResizablePMCArray"
    push $P1053, $P1052
    .return ($P1053)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("269_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1057_tgt
    .local int rx1057_pos
    .local int rx1057_off
    .local int rx1057_eos
    .local int rx1057_rep
    .local pmc rx1057_cur
    (rx1057_cur, rx1057_pos, rx1057_tgt) = self."!cursor_start"()
    rx1057_cur."!cursor_debug"("START ", "infix:sym<==>")
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
.annotate "line", 482
  # rx subcapture "sym"
    set_addr $I10, rxcap_1062_fail
    rx1057_cur."!mark_push"(0, rx1057_pos, $I10)
  # rx literal  "=="
    add $I11, rx1057_pos, 2
    gt $I11, rx1057_eos, rx1057_fail
    sub $I11, rx1057_pos, rx1057_off
    substr $S10, rx1057_tgt, $I11, 2
    ne $S10, "==", rx1057_fail
    add rx1057_pos, 2
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
    $P10 = rx1057_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx1057_fail
    rx1057_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1057_pos = $P10."pos"()
  # rx pass
    rx1057_cur."!cursor_pass"(rx1057_pos, "infix:sym<==>")
    rx1057_cur."!cursor_debug"("PASS  ", "infix:sym<==>", " at pos=", rx1057_pos)
    .return (rx1057_cur)
  rx1057_fail:
.annotate "line", 413
    (rx1057_rep, rx1057_pos, $I10, $P10) = rx1057_cur."!mark_fail"(0)
    lt rx1057_pos, -1, rx1057_done
    eq rx1057_pos, -1, rx1057_fail
    jump $I10
  rx1057_done:
    rx1057_cur."!cursor_fail"()
    rx1057_cur."!cursor_debug"("FAIL  ", "infix:sym<==>")
    .return (rx1057_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("270_1266334190.64822") :method
.annotate "line", 413
    $P1059 = self."!PREFIX__!subrule"("O", "==")
    new $P1060, "ResizablePMCArray"
    push $P1060, $P1059
    .return ($P1060)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("271_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1064_tgt
    .local int rx1064_pos
    .local int rx1064_off
    .local int rx1064_eos
    .local int rx1064_rep
    .local pmc rx1064_cur
    (rx1064_cur, rx1064_pos, rx1064_tgt) = self."!cursor_start"()
    rx1064_cur."!cursor_debug"("START ", "infix:sym<!=>")
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
.annotate "line", 483
  # rx subcapture "sym"
    set_addr $I10, rxcap_1069_fail
    rx1064_cur."!mark_push"(0, rx1064_pos, $I10)
  # rx literal  "!="
    add $I11, rx1064_pos, 2
    gt $I11, rx1064_eos, rx1064_fail
    sub $I11, rx1064_pos, rx1064_off
    substr $S10, rx1064_tgt, $I11, 2
    ne $S10, "!=", rx1064_fail
    add rx1064_pos, 2
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
    $P10 = rx1064_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx1064_fail
    rx1064_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1064_pos = $P10."pos"()
  # rx pass
    rx1064_cur."!cursor_pass"(rx1064_pos, "infix:sym<!=>")
    rx1064_cur."!cursor_debug"("PASS  ", "infix:sym<!=>", " at pos=", rx1064_pos)
    .return (rx1064_cur)
  rx1064_fail:
.annotate "line", 413
    (rx1064_rep, rx1064_pos, $I10, $P10) = rx1064_cur."!mark_fail"(0)
    lt rx1064_pos, -1, rx1064_done
    eq rx1064_pos, -1, rx1064_fail
    jump $I10
  rx1064_done:
    rx1064_cur."!cursor_fail"()
    rx1064_cur."!cursor_debug"("FAIL  ", "infix:sym<!=>")
    .return (rx1064_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("272_1266334190.64822") :method
.annotate "line", 413
    $P1066 = self."!PREFIX__!subrule"("O", "!=")
    new $P1067, "ResizablePMCArray"
    push $P1067, $P1066
    .return ($P1067)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("273_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1071_tgt
    .local int rx1071_pos
    .local int rx1071_off
    .local int rx1071_eos
    .local int rx1071_rep
    .local pmc rx1071_cur
    (rx1071_cur, rx1071_pos, rx1071_tgt) = self."!cursor_start"()
    rx1071_cur."!cursor_debug"("START ", "infix:sym<<=>")
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
.annotate "line", 484
  # rx subcapture "sym"
    set_addr $I10, rxcap_1076_fail
    rx1071_cur."!mark_push"(0, rx1071_pos, $I10)
  # rx literal  "<="
    add $I11, rx1071_pos, 2
    gt $I11, rx1071_eos, rx1071_fail
    sub $I11, rx1071_pos, rx1071_off
    substr $S10, rx1071_tgt, $I11, 2
    ne $S10, "<=", rx1071_fail
    add rx1071_pos, 2
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
    $P10 = rx1071_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx1071_fail
    rx1071_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1071_pos = $P10."pos"()
  # rx pass
    rx1071_cur."!cursor_pass"(rx1071_pos, "infix:sym<<=>")
    rx1071_cur."!cursor_debug"("PASS  ", "infix:sym<<=>", " at pos=", rx1071_pos)
    .return (rx1071_cur)
  rx1071_fail:
.annotate "line", 413
    (rx1071_rep, rx1071_pos, $I10, $P10) = rx1071_cur."!mark_fail"(0)
    lt rx1071_pos, -1, rx1071_done
    eq rx1071_pos, -1, rx1071_fail
    jump $I10
  rx1071_done:
    rx1071_cur."!cursor_fail"()
    rx1071_cur."!cursor_debug"("FAIL  ", "infix:sym<<=>")
    .return (rx1071_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("274_1266334190.64822") :method
.annotate "line", 413
    $P1073 = self."!PREFIX__!subrule"("O", "<=")
    new $P1074, "ResizablePMCArray"
    push $P1074, $P1073
    .return ($P1074)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("275_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1078_tgt
    .local int rx1078_pos
    .local int rx1078_off
    .local int rx1078_eos
    .local int rx1078_rep
    .local pmc rx1078_cur
    (rx1078_cur, rx1078_pos, rx1078_tgt) = self."!cursor_start"()
    rx1078_cur."!cursor_debug"("START ", "infix:sym<>=>")
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
.annotate "line", 485
  # rx subcapture "sym"
    set_addr $I10, rxcap_1083_fail
    rx1078_cur."!mark_push"(0, rx1078_pos, $I10)
  # rx literal  ">="
    add $I11, rx1078_pos, 2
    gt $I11, rx1078_eos, rx1078_fail
    sub $I11, rx1078_pos, rx1078_off
    substr $S10, rx1078_tgt, $I11, 2
    ne $S10, ">=", rx1078_fail
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
    $P10 = rx1078_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx1078_fail
    rx1078_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1078_pos = $P10."pos"()
  # rx pass
    rx1078_cur."!cursor_pass"(rx1078_pos, "infix:sym<>=>")
    rx1078_cur."!cursor_debug"("PASS  ", "infix:sym<>=>", " at pos=", rx1078_pos)
    .return (rx1078_cur)
  rx1078_fail:
.annotate "line", 413
    (rx1078_rep, rx1078_pos, $I10, $P10) = rx1078_cur."!mark_fail"(0)
    lt rx1078_pos, -1, rx1078_done
    eq rx1078_pos, -1, rx1078_fail
    jump $I10
  rx1078_done:
    rx1078_cur."!cursor_fail"()
    rx1078_cur."!cursor_debug"("FAIL  ", "infix:sym<>=>")
    .return (rx1078_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("276_1266334190.64822") :method
.annotate "line", 413
    $P1080 = self."!PREFIX__!subrule"("O", ">=")
    new $P1081, "ResizablePMCArray"
    push $P1081, $P1080
    .return ($P1081)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("277_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1085_tgt
    .local int rx1085_pos
    .local int rx1085_off
    .local int rx1085_eos
    .local int rx1085_rep
    .local pmc rx1085_cur
    (rx1085_cur, rx1085_pos, rx1085_tgt) = self."!cursor_start"()
    rx1085_cur."!cursor_debug"("START ", "infix:sym<<>")
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
.annotate "line", 486
  # rx subcapture "sym"
    set_addr $I10, rxcap_1090_fail
    rx1085_cur."!mark_push"(0, rx1085_pos, $I10)
  # rx literal  "<"
    add $I11, rx1085_pos, 1
    gt $I11, rx1085_eos, rx1085_fail
    sub $I11, rx1085_pos, rx1085_off
    substr $S10, rx1085_tgt, $I11, 1
    ne $S10, "<", rx1085_fail
    add rx1085_pos, 1
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
    $P10 = rx1085_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx1085_fail
    rx1085_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1085_pos = $P10."pos"()
  # rx pass
    rx1085_cur."!cursor_pass"(rx1085_pos, "infix:sym<<>")
    rx1085_cur."!cursor_debug"("PASS  ", "infix:sym<<>", " at pos=", rx1085_pos)
    .return (rx1085_cur)
  rx1085_fail:
.annotate "line", 413
    (rx1085_rep, rx1085_pos, $I10, $P10) = rx1085_cur."!mark_fail"(0)
    lt rx1085_pos, -1, rx1085_done
    eq rx1085_pos, -1, rx1085_fail
    jump $I10
  rx1085_done:
    rx1085_cur."!cursor_fail"()
    rx1085_cur."!cursor_debug"("FAIL  ", "infix:sym<<>")
    .return (rx1085_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("278_1266334190.64822") :method
.annotate "line", 413
    $P1087 = self."!PREFIX__!subrule"("O", "<")
    new $P1088, "ResizablePMCArray"
    push $P1088, $P1087
    .return ($P1088)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("279_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1092_tgt
    .local int rx1092_pos
    .local int rx1092_off
    .local int rx1092_eos
    .local int rx1092_rep
    .local pmc rx1092_cur
    (rx1092_cur, rx1092_pos, rx1092_tgt) = self."!cursor_start"()
    rx1092_cur."!cursor_debug"("START ", "infix:sym<>>")
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
.annotate "line", 487
  # rx subcapture "sym"
    set_addr $I10, rxcap_1097_fail
    rx1092_cur."!mark_push"(0, rx1092_pos, $I10)
  # rx literal  ">"
    add $I11, rx1092_pos, 1
    gt $I11, rx1092_eos, rx1092_fail
    sub $I11, rx1092_pos, rx1092_off
    substr $S10, rx1092_tgt, $I11, 1
    ne $S10, ">", rx1092_fail
    add rx1092_pos, 1
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
    $P10 = rx1092_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx1092_fail
    rx1092_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1092_pos = $P10."pos"()
  # rx pass
    rx1092_cur."!cursor_pass"(rx1092_pos, "infix:sym<>>")
    rx1092_cur."!cursor_debug"("PASS  ", "infix:sym<>>", " at pos=", rx1092_pos)
    .return (rx1092_cur)
  rx1092_fail:
.annotate "line", 413
    (rx1092_rep, rx1092_pos, $I10, $P10) = rx1092_cur."!mark_fail"(0)
    lt rx1092_pos, -1, rx1092_done
    eq rx1092_pos, -1, rx1092_fail
    jump $I10
  rx1092_done:
    rx1092_cur."!cursor_fail"()
    rx1092_cur."!cursor_debug"("FAIL  ", "infix:sym<>>")
    .return (rx1092_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("280_1266334190.64822") :method
.annotate "line", 413
    $P1094 = self."!PREFIX__!subrule"("O", ">")
    new $P1095, "ResizablePMCArray"
    push $P1095, $P1094
    .return ($P1095)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("281_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1099_tgt
    .local int rx1099_pos
    .local int rx1099_off
    .local int rx1099_eos
    .local int rx1099_rep
    .local pmc rx1099_cur
    (rx1099_cur, rx1099_pos, rx1099_tgt) = self."!cursor_start"()
    rx1099_cur."!cursor_debug"("START ", "infix:sym<eq>")
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
.annotate "line", 488
  # rx subcapture "sym"
    set_addr $I10, rxcap_1104_fail
    rx1099_cur."!mark_push"(0, rx1099_pos, $I10)
  # rx literal  "eq"
    add $I11, rx1099_pos, 2
    gt $I11, rx1099_eos, rx1099_fail
    sub $I11, rx1099_pos, rx1099_off
    substr $S10, rx1099_tgt, $I11, 2
    ne $S10, "eq", rx1099_fail
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
    $P10 = rx1099_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx1099_fail
    rx1099_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1099_pos = $P10."pos"()
  # rx pass
    rx1099_cur."!cursor_pass"(rx1099_pos, "infix:sym<eq>")
    rx1099_cur."!cursor_debug"("PASS  ", "infix:sym<eq>", " at pos=", rx1099_pos)
    .return (rx1099_cur)
  rx1099_fail:
.annotate "line", 413
    (rx1099_rep, rx1099_pos, $I10, $P10) = rx1099_cur."!mark_fail"(0)
    lt rx1099_pos, -1, rx1099_done
    eq rx1099_pos, -1, rx1099_fail
    jump $I10
  rx1099_done:
    rx1099_cur."!cursor_fail"()
    rx1099_cur."!cursor_debug"("FAIL  ", "infix:sym<eq>")
    .return (rx1099_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("282_1266334190.64822") :method
.annotate "line", 413
    $P1101 = self."!PREFIX__!subrule"("O", "eq")
    new $P1102, "ResizablePMCArray"
    push $P1102, $P1101
    .return ($P1102)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("283_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1106_tgt
    .local int rx1106_pos
    .local int rx1106_off
    .local int rx1106_eos
    .local int rx1106_rep
    .local pmc rx1106_cur
    (rx1106_cur, rx1106_pos, rx1106_tgt) = self."!cursor_start"()
    rx1106_cur."!cursor_debug"("START ", "infix:sym<ne>")
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
.annotate "line", 489
  # rx subcapture "sym"
    set_addr $I10, rxcap_1111_fail
    rx1106_cur."!mark_push"(0, rx1106_pos, $I10)
  # rx literal  "ne"
    add $I11, rx1106_pos, 2
    gt $I11, rx1106_eos, rx1106_fail
    sub $I11, rx1106_pos, rx1106_off
    substr $S10, rx1106_tgt, $I11, 2
    ne $S10, "ne", rx1106_fail
    add rx1106_pos, 2
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
    $P10 = rx1106_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx1106_fail
    rx1106_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1106_pos = $P10."pos"()
  # rx pass
    rx1106_cur."!cursor_pass"(rx1106_pos, "infix:sym<ne>")
    rx1106_cur."!cursor_debug"("PASS  ", "infix:sym<ne>", " at pos=", rx1106_pos)
    .return (rx1106_cur)
  rx1106_fail:
.annotate "line", 413
    (rx1106_rep, rx1106_pos, $I10, $P10) = rx1106_cur."!mark_fail"(0)
    lt rx1106_pos, -1, rx1106_done
    eq rx1106_pos, -1, rx1106_fail
    jump $I10
  rx1106_done:
    rx1106_cur."!cursor_fail"()
    rx1106_cur."!cursor_debug"("FAIL  ", "infix:sym<ne>")
    .return (rx1106_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("284_1266334190.64822") :method
.annotate "line", 413
    $P1108 = self."!PREFIX__!subrule"("O", "ne")
    new $P1109, "ResizablePMCArray"
    push $P1109, $P1108
    .return ($P1109)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("285_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1113_tgt
    .local int rx1113_pos
    .local int rx1113_off
    .local int rx1113_eos
    .local int rx1113_rep
    .local pmc rx1113_cur
    (rx1113_cur, rx1113_pos, rx1113_tgt) = self."!cursor_start"()
    rx1113_cur."!cursor_debug"("START ", "infix:sym<le>")
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
.annotate "line", 490
  # rx subcapture "sym"
    set_addr $I10, rxcap_1118_fail
    rx1113_cur."!mark_push"(0, rx1113_pos, $I10)
  # rx literal  "le"
    add $I11, rx1113_pos, 2
    gt $I11, rx1113_eos, rx1113_fail
    sub $I11, rx1113_pos, rx1113_off
    substr $S10, rx1113_tgt, $I11, 2
    ne $S10, "le", rx1113_fail
    add rx1113_pos, 2
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
    $P10 = rx1113_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx1113_fail
    rx1113_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1113_pos = $P10."pos"()
  # rx pass
    rx1113_cur."!cursor_pass"(rx1113_pos, "infix:sym<le>")
    rx1113_cur."!cursor_debug"("PASS  ", "infix:sym<le>", " at pos=", rx1113_pos)
    .return (rx1113_cur)
  rx1113_fail:
.annotate "line", 413
    (rx1113_rep, rx1113_pos, $I10, $P10) = rx1113_cur."!mark_fail"(0)
    lt rx1113_pos, -1, rx1113_done
    eq rx1113_pos, -1, rx1113_fail
    jump $I10
  rx1113_done:
    rx1113_cur."!cursor_fail"()
    rx1113_cur."!cursor_debug"("FAIL  ", "infix:sym<le>")
    .return (rx1113_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("286_1266334190.64822") :method
.annotate "line", 413
    $P1115 = self."!PREFIX__!subrule"("O", "le")
    new $P1116, "ResizablePMCArray"
    push $P1116, $P1115
    .return ($P1116)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("287_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1120_tgt
    .local int rx1120_pos
    .local int rx1120_off
    .local int rx1120_eos
    .local int rx1120_rep
    .local pmc rx1120_cur
    (rx1120_cur, rx1120_pos, rx1120_tgt) = self."!cursor_start"()
    rx1120_cur."!cursor_debug"("START ", "infix:sym<ge>")
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
.annotate "line", 491
  # rx subcapture "sym"
    set_addr $I10, rxcap_1125_fail
    rx1120_cur."!mark_push"(0, rx1120_pos, $I10)
  # rx literal  "ge"
    add $I11, rx1120_pos, 2
    gt $I11, rx1120_eos, rx1120_fail
    sub $I11, rx1120_pos, rx1120_off
    substr $S10, rx1120_tgt, $I11, 2
    ne $S10, "ge", rx1120_fail
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
    $P10 = rx1120_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx1120_fail
    rx1120_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1120_pos = $P10."pos"()
  # rx pass
    rx1120_cur."!cursor_pass"(rx1120_pos, "infix:sym<ge>")
    rx1120_cur."!cursor_debug"("PASS  ", "infix:sym<ge>", " at pos=", rx1120_pos)
    .return (rx1120_cur)
  rx1120_fail:
.annotate "line", 413
    (rx1120_rep, rx1120_pos, $I10, $P10) = rx1120_cur."!mark_fail"(0)
    lt rx1120_pos, -1, rx1120_done
    eq rx1120_pos, -1, rx1120_fail
    jump $I10
  rx1120_done:
    rx1120_cur."!cursor_fail"()
    rx1120_cur."!cursor_debug"("FAIL  ", "infix:sym<ge>")
    .return (rx1120_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("288_1266334190.64822") :method
.annotate "line", 413
    $P1122 = self."!PREFIX__!subrule"("O", "ge")
    new $P1123, "ResizablePMCArray"
    push $P1123, $P1122
    .return ($P1123)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("289_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1127_tgt
    .local int rx1127_pos
    .local int rx1127_off
    .local int rx1127_eos
    .local int rx1127_rep
    .local pmc rx1127_cur
    (rx1127_cur, rx1127_pos, rx1127_tgt) = self."!cursor_start"()
    rx1127_cur."!cursor_debug"("START ", "infix:sym<lt>")
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
.annotate "line", 492
  # rx subcapture "sym"
    set_addr $I10, rxcap_1132_fail
    rx1127_cur."!mark_push"(0, rx1127_pos, $I10)
  # rx literal  "lt"
    add $I11, rx1127_pos, 2
    gt $I11, rx1127_eos, rx1127_fail
    sub $I11, rx1127_pos, rx1127_off
    substr $S10, rx1127_tgt, $I11, 2
    ne $S10, "lt", rx1127_fail
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
    $P10 = rx1127_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx1127_fail
    rx1127_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1127_pos = $P10."pos"()
  # rx pass
    rx1127_cur."!cursor_pass"(rx1127_pos, "infix:sym<lt>")
    rx1127_cur."!cursor_debug"("PASS  ", "infix:sym<lt>", " at pos=", rx1127_pos)
    .return (rx1127_cur)
  rx1127_fail:
.annotate "line", 413
    (rx1127_rep, rx1127_pos, $I10, $P10) = rx1127_cur."!mark_fail"(0)
    lt rx1127_pos, -1, rx1127_done
    eq rx1127_pos, -1, rx1127_fail
    jump $I10
  rx1127_done:
    rx1127_cur."!cursor_fail"()
    rx1127_cur."!cursor_debug"("FAIL  ", "infix:sym<lt>")
    .return (rx1127_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("290_1266334190.64822") :method
.annotate "line", 413
    $P1129 = self."!PREFIX__!subrule"("O", "lt")
    new $P1130, "ResizablePMCArray"
    push $P1130, $P1129
    .return ($P1130)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("291_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1134_tgt
    .local int rx1134_pos
    .local int rx1134_off
    .local int rx1134_eos
    .local int rx1134_rep
    .local pmc rx1134_cur
    (rx1134_cur, rx1134_pos, rx1134_tgt) = self."!cursor_start"()
    rx1134_cur."!cursor_debug"("START ", "infix:sym<gt>")
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
.annotate "line", 493
  # rx subcapture "sym"
    set_addr $I10, rxcap_1139_fail
    rx1134_cur."!mark_push"(0, rx1134_pos, $I10)
  # rx literal  "gt"
    add $I11, rx1134_pos, 2
    gt $I11, rx1134_eos, rx1134_fail
    sub $I11, rx1134_pos, rx1134_off
    substr $S10, rx1134_tgt, $I11, 2
    ne $S10, "gt", rx1134_fail
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
    $P10 = rx1134_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx1134_fail
    rx1134_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1134_pos = $P10."pos"()
  # rx pass
    rx1134_cur."!cursor_pass"(rx1134_pos, "infix:sym<gt>")
    rx1134_cur."!cursor_debug"("PASS  ", "infix:sym<gt>", " at pos=", rx1134_pos)
    .return (rx1134_cur)
  rx1134_fail:
.annotate "line", 413
    (rx1134_rep, rx1134_pos, $I10, $P10) = rx1134_cur."!mark_fail"(0)
    lt rx1134_pos, -1, rx1134_done
    eq rx1134_pos, -1, rx1134_fail
    jump $I10
  rx1134_done:
    rx1134_cur."!cursor_fail"()
    rx1134_cur."!cursor_debug"("FAIL  ", "infix:sym<gt>")
    .return (rx1134_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("292_1266334190.64822") :method
.annotate "line", 413
    $P1136 = self."!PREFIX__!subrule"("O", "gt")
    new $P1137, "ResizablePMCArray"
    push $P1137, $P1136
    .return ($P1137)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("293_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1141_tgt
    .local int rx1141_pos
    .local int rx1141_off
    .local int rx1141_eos
    .local int rx1141_rep
    .local pmc rx1141_cur
    (rx1141_cur, rx1141_pos, rx1141_tgt) = self."!cursor_start"()
    rx1141_cur."!cursor_debug"("START ", "infix:sym<=:=>")
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
.annotate "line", 494
  # rx subcapture "sym"
    set_addr $I10, rxcap_1146_fail
    rx1141_cur."!mark_push"(0, rx1141_pos, $I10)
  # rx literal  "=:="
    add $I11, rx1141_pos, 3
    gt $I11, rx1141_eos, rx1141_fail
    sub $I11, rx1141_pos, rx1141_off
    substr $S10, rx1141_tgt, $I11, 3
    ne $S10, "=:=", rx1141_fail
    add rx1141_pos, 3
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
    $P10 = rx1141_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx1141_fail
    rx1141_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1141_pos = $P10."pos"()
  # rx pass
    rx1141_cur."!cursor_pass"(rx1141_pos, "infix:sym<=:=>")
    rx1141_cur."!cursor_debug"("PASS  ", "infix:sym<=:=>", " at pos=", rx1141_pos)
    .return (rx1141_cur)
  rx1141_fail:
.annotate "line", 413
    (rx1141_rep, rx1141_pos, $I10, $P10) = rx1141_cur."!mark_fail"(0)
    lt rx1141_pos, -1, rx1141_done
    eq rx1141_pos, -1, rx1141_fail
    jump $I10
  rx1141_done:
    rx1141_cur."!cursor_fail"()
    rx1141_cur."!cursor_debug"("FAIL  ", "infix:sym<=:=>")
    .return (rx1141_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("294_1266334190.64822") :method
.annotate "line", 413
    $P1143 = self."!PREFIX__!subrule"("O", "=:=")
    new $P1144, "ResizablePMCArray"
    push $P1144, $P1143
    .return ($P1144)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~~>"  :subid("295_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1148_tgt
    .local int rx1148_pos
    .local int rx1148_off
    .local int rx1148_eos
    .local int rx1148_rep
    .local pmc rx1148_cur
    (rx1148_cur, rx1148_pos, rx1148_tgt) = self."!cursor_start"()
    rx1148_cur."!cursor_debug"("START ", "infix:sym<~~>")
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
.annotate "line", 495
  # rx subcapture "sym"
    set_addr $I10, rxcap_1153_fail
    rx1148_cur."!mark_push"(0, rx1148_pos, $I10)
  # rx literal  "~~"
    add $I11, rx1148_pos, 2
    gt $I11, rx1148_eos, rx1148_fail
    sub $I11, rx1148_pos, rx1148_off
    substr $S10, rx1148_tgt, $I11, 2
    ne $S10, "~~", rx1148_fail
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
    $P10 = rx1148_cur."O"("%relational, :reducecheck<smartmatch>")
    unless $P10, rx1148_fail
    rx1148_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1148_pos = $P10."pos"()
  # rx pass
    rx1148_cur."!cursor_pass"(rx1148_pos, "infix:sym<~~>")
    rx1148_cur."!cursor_debug"("PASS  ", "infix:sym<~~>", " at pos=", rx1148_pos)
    .return (rx1148_cur)
  rx1148_fail:
.annotate "line", 413
    (rx1148_rep, rx1148_pos, $I10, $P10) = rx1148_cur."!mark_fail"(0)
    lt rx1148_pos, -1, rx1148_done
    eq rx1148_pos, -1, rx1148_fail
    jump $I10
  rx1148_done:
    rx1148_cur."!cursor_fail"()
    rx1148_cur."!cursor_debug"("FAIL  ", "infix:sym<~~>")
    .return (rx1148_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~~>"  :subid("296_1266334190.64822") :method
.annotate "line", 413
    $P1150 = self."!PREFIX__!subrule"("O", "~~")
    new $P1151, "ResizablePMCArray"
    push $P1151, $P1150
    .return ($P1151)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("297_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1155_tgt
    .local int rx1155_pos
    .local int rx1155_off
    .local int rx1155_eos
    .local int rx1155_rep
    .local pmc rx1155_cur
    (rx1155_cur, rx1155_pos, rx1155_tgt) = self."!cursor_start"()
    rx1155_cur."!cursor_debug"("START ", "infix:sym<&&>")
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
.annotate "line", 497
  # rx subcapture "sym"
    set_addr $I10, rxcap_1160_fail
    rx1155_cur."!mark_push"(0, rx1155_pos, $I10)
  # rx literal  "&&"
    add $I11, rx1155_pos, 2
    gt $I11, rx1155_eos, rx1155_fail
    sub $I11, rx1155_pos, rx1155_off
    substr $S10, rx1155_tgt, $I11, 2
    ne $S10, "&&", rx1155_fail
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
    $P10 = rx1155_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx1155_fail
    rx1155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1155_pos = $P10."pos"()
  # rx pass
    rx1155_cur."!cursor_pass"(rx1155_pos, "infix:sym<&&>")
    rx1155_cur."!cursor_debug"("PASS  ", "infix:sym<&&>", " at pos=", rx1155_pos)
    .return (rx1155_cur)
  rx1155_fail:
.annotate "line", 413
    (rx1155_rep, rx1155_pos, $I10, $P10) = rx1155_cur."!mark_fail"(0)
    lt rx1155_pos, -1, rx1155_done
    eq rx1155_pos, -1, rx1155_fail
    jump $I10
  rx1155_done:
    rx1155_cur."!cursor_fail"()
    rx1155_cur."!cursor_debug"("FAIL  ", "infix:sym<&&>")
    .return (rx1155_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("298_1266334190.64822") :method
.annotate "line", 413
    $P1157 = self."!PREFIX__!subrule"("O", "&&")
    new $P1158, "ResizablePMCArray"
    push $P1158, $P1157
    .return ($P1158)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("299_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1162_tgt
    .local int rx1162_pos
    .local int rx1162_off
    .local int rx1162_eos
    .local int rx1162_rep
    .local pmc rx1162_cur
    (rx1162_cur, rx1162_pos, rx1162_tgt) = self."!cursor_start"()
    rx1162_cur."!cursor_debug"("START ", "infix:sym<||>")
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
.annotate "line", 499
  # rx subcapture "sym"
    set_addr $I10, rxcap_1167_fail
    rx1162_cur."!mark_push"(0, rx1162_pos, $I10)
  # rx literal  "||"
    add $I11, rx1162_pos, 2
    gt $I11, rx1162_eos, rx1162_fail
    sub $I11, rx1162_pos, rx1162_off
    substr $S10, rx1162_tgt, $I11, 2
    ne $S10, "||", rx1162_fail
    add rx1162_pos, 2
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
    $P10 = rx1162_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx1162_fail
    rx1162_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1162_pos = $P10."pos"()
  # rx pass
    rx1162_cur."!cursor_pass"(rx1162_pos, "infix:sym<||>")
    rx1162_cur."!cursor_debug"("PASS  ", "infix:sym<||>", " at pos=", rx1162_pos)
    .return (rx1162_cur)
  rx1162_fail:
.annotate "line", 413
    (rx1162_rep, rx1162_pos, $I10, $P10) = rx1162_cur."!mark_fail"(0)
    lt rx1162_pos, -1, rx1162_done
    eq rx1162_pos, -1, rx1162_fail
    jump $I10
  rx1162_done:
    rx1162_cur."!cursor_fail"()
    rx1162_cur."!cursor_debug"("FAIL  ", "infix:sym<||>")
    .return (rx1162_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("300_1266334190.64822") :method
.annotate "line", 413
    $P1164 = self."!PREFIX__!subrule"("O", "||")
    new $P1165, "ResizablePMCArray"
    push $P1165, $P1164
    .return ($P1165)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("301_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1169_tgt
    .local int rx1169_pos
    .local int rx1169_off
    .local int rx1169_eos
    .local int rx1169_rep
    .local pmc rx1169_cur
    (rx1169_cur, rx1169_pos, rx1169_tgt) = self."!cursor_start"()
    rx1169_cur."!cursor_debug"("START ", "infix:sym<//>")
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
.annotate "line", 500
  # rx subcapture "sym"
    set_addr $I10, rxcap_1174_fail
    rx1169_cur."!mark_push"(0, rx1169_pos, $I10)
  # rx literal  "//"
    add $I11, rx1169_pos, 2
    gt $I11, rx1169_eos, rx1169_fail
    sub $I11, rx1169_pos, rx1169_off
    substr $S10, rx1169_tgt, $I11, 2
    ne $S10, "//", rx1169_fail
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
    $P10 = rx1169_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx1169_fail
    rx1169_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1169_pos = $P10."pos"()
  # rx pass
    rx1169_cur."!cursor_pass"(rx1169_pos, "infix:sym<//>")
    rx1169_cur."!cursor_debug"("PASS  ", "infix:sym<//>", " at pos=", rx1169_pos)
    .return (rx1169_cur)
  rx1169_fail:
.annotate "line", 413
    (rx1169_rep, rx1169_pos, $I10, $P10) = rx1169_cur."!mark_fail"(0)
    lt rx1169_pos, -1, rx1169_done
    eq rx1169_pos, -1, rx1169_fail
    jump $I10
  rx1169_done:
    rx1169_cur."!cursor_fail"()
    rx1169_cur."!cursor_debug"("FAIL  ", "infix:sym<//>")
    .return (rx1169_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("302_1266334190.64822") :method
.annotate "line", 413
    $P1171 = self."!PREFIX__!subrule"("O", "//")
    new $P1172, "ResizablePMCArray"
    push $P1172, $P1171
    .return ($P1172)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("303_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1176_tgt
    .local int rx1176_pos
    .local int rx1176_off
    .local int rx1176_eos
    .local int rx1176_rep
    .local pmc rx1176_cur
    (rx1176_cur, rx1176_pos, rx1176_tgt) = self."!cursor_start"()
    rx1176_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
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
.annotate "line", 503
  # rx literal  "??"
    add $I11, rx1176_pos, 2
    gt $I11, rx1176_eos, rx1176_fail
    sub $I11, rx1176_pos, rx1176_off
    substr $S10, rx1176_tgt, $I11, 2
    ne $S10, "??", rx1176_fail
    add rx1176_pos, 2
.annotate "line", 504
  # rx subrule "ws" subtype=method negate=
    rx1176_cur."!cursor_pos"(rx1176_pos)
    $P10 = rx1176_cur."ws"()
    unless $P10, rx1176_fail
    rx1176_pos = $P10."pos"()
.annotate "line", 505
  # rx subrule "EXPR" subtype=capture negate=
    rx1176_cur."!cursor_pos"(rx1176_pos)
    $P10 = rx1176_cur."EXPR"("i=")
    unless $P10, rx1176_fail
    rx1176_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1176_pos = $P10."pos"()
.annotate "line", 506
  # rx literal  "!!"
    add $I11, rx1176_pos, 2
    gt $I11, rx1176_eos, rx1176_fail
    sub $I11, rx1176_pos, rx1176_off
    substr $S10, rx1176_tgt, $I11, 2
    ne $S10, "!!", rx1176_fail
    add rx1176_pos, 2
.annotate "line", 507
  # rx subrule "O" subtype=capture negate=
    rx1176_cur."!cursor_pos"(rx1176_pos)
    $P10 = rx1176_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx1176_fail
    rx1176_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1176_pos = $P10."pos"()
.annotate "line", 502
  # rx pass
    rx1176_cur."!cursor_pass"(rx1176_pos, "infix:sym<?? !!>")
    rx1176_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx1176_pos)
    .return (rx1176_cur)
  rx1176_fail:
.annotate "line", 413
    (rx1176_rep, rx1176_pos, $I10, $P10) = rx1176_cur."!mark_fail"(0)
    lt rx1176_pos, -1, rx1176_done
    eq rx1176_pos, -1, rx1176_fail
    jump $I10
  rx1176_done:
    rx1176_cur."!cursor_fail"()
    rx1176_cur."!cursor_debug"("FAIL  ", "infix:sym<?? !!>")
    .return (rx1176_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("304_1266334190.64822") :method
.annotate "line", 413
    $P1178 = self."!PREFIX__!subrule"("", "??")
    new $P1179, "ResizablePMCArray"
    push $P1179, $P1178
    .return ($P1179)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("305_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1182_tgt
    .local int rx1182_pos
    .local int rx1182_off
    .local int rx1182_eos
    .local int rx1182_rep
    .local pmc rx1182_cur
    (rx1182_cur, rx1182_pos, rx1182_tgt) = self."!cursor_start"()
    rx1182_cur."!cursor_debug"("START ", "infix:sym<=>")
    .lex unicode:"$\x{a2}", rx1182_cur
    .local pmc match
    .lex "$/", match
    length rx1182_eos, rx1182_tgt
    set rx1182_off, 0
    lt rx1182_pos, 2, rx1182_start
    sub rx1182_off, rx1182_pos, 1
    substr rx1182_tgt, rx1182_tgt, rx1182_off
  rx1182_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1186_done
    goto rxscan1186_scan
  rxscan1186_loop:
    ($P10) = rx1182_cur."from"()
    inc $P10
    set rx1182_pos, $P10
    ge rx1182_pos, rx1182_eos, rxscan1186_done
  rxscan1186_scan:
    set_addr $I10, rxscan1186_loop
    rx1182_cur."!mark_push"(0, rx1182_pos, $I10)
  rxscan1186_done:
.annotate "line", 511
  # rx subcapture "sym"
    set_addr $I10, rxcap_1187_fail
    rx1182_cur."!mark_push"(0, rx1182_pos, $I10)
  # rx literal  "="
    add $I11, rx1182_pos, 1
    gt $I11, rx1182_eos, rx1182_fail
    sub $I11, rx1182_pos, rx1182_off
    substr $S10, rx1182_tgt, $I11, 1
    ne $S10, "=", rx1182_fail
    add rx1182_pos, 1
    set_addr $I10, rxcap_1187_fail
    ($I12, $I11) = rx1182_cur."!mark_peek"($I10)
    rx1182_cur."!cursor_pos"($I11)
    ($P10) = rx1182_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1182_pos, "")
    rx1182_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1187_done
  rxcap_1187_fail:
    goto rx1182_fail
  rxcap_1187_done:
  # rx subrule "panic" subtype=method negate=
    rx1182_cur."!cursor_pos"(rx1182_pos)
    $P10 = rx1182_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx1182_fail
    rx1182_pos = $P10."pos"()
.annotate "line", 510
  # rx pass
    rx1182_cur."!cursor_pass"(rx1182_pos, "infix:sym<=>")
    rx1182_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx1182_pos)
    .return (rx1182_cur)
  rx1182_fail:
.annotate "line", 413
    (rx1182_rep, rx1182_pos, $I10, $P10) = rx1182_cur."!mark_fail"(0)
    lt rx1182_pos, -1, rx1182_done
    eq rx1182_pos, -1, rx1182_fail
    jump $I10
  rx1182_done:
    rx1182_cur."!cursor_fail"()
    rx1182_cur."!cursor_debug"("FAIL  ", "infix:sym<=>")
    .return (rx1182_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("306_1266334190.64822") :method
.annotate "line", 413
    $P1184 = self."!PREFIX__!subrule"("", "=")
    new $P1185, "ResizablePMCArray"
    push $P1185, $P1184
    .return ($P1185)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("307_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1189_tgt
    .local int rx1189_pos
    .local int rx1189_off
    .local int rx1189_eos
    .local int rx1189_rep
    .local pmc rx1189_cur
    (rx1189_cur, rx1189_pos, rx1189_tgt) = self."!cursor_start"()
    rx1189_cur."!cursor_debug"("START ", "infix:sym<:=>")
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
    ne $I10, -1, rxscan1193_done
    goto rxscan1193_scan
  rxscan1193_loop:
    ($P10) = rx1189_cur."from"()
    inc $P10
    set rx1189_pos, $P10
    ge rx1189_pos, rx1189_eos, rxscan1193_done
  rxscan1193_scan:
    set_addr $I10, rxscan1193_loop
    rx1189_cur."!mark_push"(0, rx1189_pos, $I10)
  rxscan1193_done:
.annotate "line", 513
  # rx subcapture "sym"
    set_addr $I10, rxcap_1194_fail
    rx1189_cur."!mark_push"(0, rx1189_pos, $I10)
  # rx literal  ":="
    add $I11, rx1189_pos, 2
    gt $I11, rx1189_eos, rx1189_fail
    sub $I11, rx1189_pos, rx1189_off
    substr $S10, rx1189_tgt, $I11, 2
    ne $S10, ":=", rx1189_fail
    add rx1189_pos, 2
    set_addr $I10, rxcap_1194_fail
    ($I12, $I11) = rx1189_cur."!mark_peek"($I10)
    rx1189_cur."!cursor_pos"($I11)
    ($P10) = rx1189_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1189_pos, "")
    rx1189_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1194_done
  rxcap_1194_fail:
    goto rx1189_fail
  rxcap_1194_done:
  # rx subrule "O" subtype=capture negate=
    rx1189_cur."!cursor_pos"(rx1189_pos)
    $P10 = rx1189_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1189_fail
    rx1189_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1189_pos = $P10."pos"()
  # rx pass
    rx1189_cur."!cursor_pass"(rx1189_pos, "infix:sym<:=>")
    rx1189_cur."!cursor_debug"("PASS  ", "infix:sym<:=>", " at pos=", rx1189_pos)
    .return (rx1189_cur)
  rx1189_fail:
.annotate "line", 413
    (rx1189_rep, rx1189_pos, $I10, $P10) = rx1189_cur."!mark_fail"(0)
    lt rx1189_pos, -1, rx1189_done
    eq rx1189_pos, -1, rx1189_fail
    jump $I10
  rx1189_done:
    rx1189_cur."!cursor_fail"()
    rx1189_cur."!cursor_debug"("FAIL  ", "infix:sym<:=>")
    .return (rx1189_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("308_1266334190.64822") :method
.annotate "line", 413
    $P1191 = self."!PREFIX__!subrule"("O", ":=")
    new $P1192, "ResizablePMCArray"
    push $P1192, $P1191
    .return ($P1192)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("309_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1196_tgt
    .local int rx1196_pos
    .local int rx1196_off
    .local int rx1196_eos
    .local int rx1196_rep
    .local pmc rx1196_cur
    (rx1196_cur, rx1196_pos, rx1196_tgt) = self."!cursor_start"()
    rx1196_cur."!cursor_debug"("START ", "infix:sym<::=>")
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
    ne $I10, -1, rxscan1200_done
    goto rxscan1200_scan
  rxscan1200_loop:
    ($P10) = rx1196_cur."from"()
    inc $P10
    set rx1196_pos, $P10
    ge rx1196_pos, rx1196_eos, rxscan1200_done
  rxscan1200_scan:
    set_addr $I10, rxscan1200_loop
    rx1196_cur."!mark_push"(0, rx1196_pos, $I10)
  rxscan1200_done:
.annotate "line", 514
  # rx subcapture "sym"
    set_addr $I10, rxcap_1201_fail
    rx1196_cur."!mark_push"(0, rx1196_pos, $I10)
  # rx literal  "::="
    add $I11, rx1196_pos, 3
    gt $I11, rx1196_eos, rx1196_fail
    sub $I11, rx1196_pos, rx1196_off
    substr $S10, rx1196_tgt, $I11, 3
    ne $S10, "::=", rx1196_fail
    add rx1196_pos, 3
    set_addr $I10, rxcap_1201_fail
    ($I12, $I11) = rx1196_cur."!mark_peek"($I10)
    rx1196_cur."!cursor_pos"($I11)
    ($P10) = rx1196_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1196_pos, "")
    rx1196_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1201_done
  rxcap_1201_fail:
    goto rx1196_fail
  rxcap_1201_done:
  # rx subrule "O" subtype=capture negate=
    rx1196_cur."!cursor_pos"(rx1196_pos)
    $P10 = rx1196_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1196_fail
    rx1196_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1196_pos = $P10."pos"()
  # rx pass
    rx1196_cur."!cursor_pass"(rx1196_pos, "infix:sym<::=>")
    rx1196_cur."!cursor_debug"("PASS  ", "infix:sym<::=>", " at pos=", rx1196_pos)
    .return (rx1196_cur)
  rx1196_fail:
.annotate "line", 413
    (rx1196_rep, rx1196_pos, $I10, $P10) = rx1196_cur."!mark_fail"(0)
    lt rx1196_pos, -1, rx1196_done
    eq rx1196_pos, -1, rx1196_fail
    jump $I10
  rx1196_done:
    rx1196_cur."!cursor_fail"()
    rx1196_cur."!cursor_debug"("FAIL  ", "infix:sym<::=>")
    .return (rx1196_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("310_1266334190.64822") :method
.annotate "line", 413
    $P1198 = self."!PREFIX__!subrule"("O", "::=")
    new $P1199, "ResizablePMCArray"
    push $P1199, $P1198
    .return ($P1199)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("311_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1203_tgt
    .local int rx1203_pos
    .local int rx1203_off
    .local int rx1203_eos
    .local int rx1203_rep
    .local pmc rx1203_cur
    (rx1203_cur, rx1203_pos, rx1203_tgt) = self."!cursor_start"()
    rx1203_cur."!cursor_debug"("START ", "infix:sym<,>")
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
.annotate "line", 516
  # rx subcapture "sym"
    set_addr $I10, rxcap_1208_fail
    rx1203_cur."!mark_push"(0, rx1203_pos, $I10)
  # rx literal  ","
    add $I11, rx1203_pos, 1
    gt $I11, rx1203_eos, rx1203_fail
    sub $I11, rx1203_pos, rx1203_off
    substr $S10, rx1203_tgt, $I11, 1
    ne $S10, ",", rx1203_fail
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
  # rx subrule "O" subtype=capture negate=
    rx1203_cur."!cursor_pos"(rx1203_pos)
    $P10 = rx1203_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1203_fail
    rx1203_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1203_pos = $P10."pos"()
  # rx pass
    rx1203_cur."!cursor_pass"(rx1203_pos, "infix:sym<,>")
    rx1203_cur."!cursor_debug"("PASS  ", "infix:sym<,>", " at pos=", rx1203_pos)
    .return (rx1203_cur)
  rx1203_fail:
.annotate "line", 413
    (rx1203_rep, rx1203_pos, $I10, $P10) = rx1203_cur."!mark_fail"(0)
    lt rx1203_pos, -1, rx1203_done
    eq rx1203_pos, -1, rx1203_fail
    jump $I10
  rx1203_done:
    rx1203_cur."!cursor_fail"()
    rx1203_cur."!cursor_debug"("FAIL  ", "infix:sym<,>")
    .return (rx1203_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("312_1266334190.64822") :method
.annotate "line", 413
    $P1205 = self."!PREFIX__!subrule"("O", ",")
    new $P1206, "ResizablePMCArray"
    push $P1206, $P1205
    .return ($P1206)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("313_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1210_tgt
    .local int rx1210_pos
    .local int rx1210_off
    .local int rx1210_eos
    .local int rx1210_rep
    .local pmc rx1210_cur
    (rx1210_cur, rx1210_pos, rx1210_tgt) = self."!cursor_start"()
    rx1210_cur."!cursor_debug"("START ", "prefix:sym<return>")
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
    ne $I10, -1, rxscan1213_done
    goto rxscan1213_scan
  rxscan1213_loop:
    ($P10) = rx1210_cur."from"()
    inc $P10
    set rx1210_pos, $P10
    ge rx1210_pos, rx1210_eos, rxscan1213_done
  rxscan1213_scan:
    set_addr $I10, rxscan1213_loop
    rx1210_cur."!mark_push"(0, rx1210_pos, $I10)
  rxscan1213_done:
.annotate "line", 518
  # rx subcapture "sym"
    set_addr $I10, rxcap_1214_fail
    rx1210_cur."!mark_push"(0, rx1210_pos, $I10)
  # rx literal  "return"
    add $I11, rx1210_pos, 6
    gt $I11, rx1210_eos, rx1210_fail
    sub $I11, rx1210_pos, rx1210_off
    substr $S10, rx1210_tgt, $I11, 6
    ne $S10, "return", rx1210_fail
    add rx1210_pos, 6
    set_addr $I10, rxcap_1214_fail
    ($I12, $I11) = rx1210_cur."!mark_peek"($I10)
    rx1210_cur."!cursor_pos"($I11)
    ($P10) = rx1210_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1210_pos, "")
    rx1210_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1214_done
  rxcap_1214_fail:
    goto rx1210_fail
  rxcap_1214_done:
  # rx charclass s
    ge rx1210_pos, rx1210_eos, rx1210_fail
    sub $I10, rx1210_pos, rx1210_off
    is_cclass $I11, 32, rx1210_tgt, $I10
    unless $I11, rx1210_fail
    inc rx1210_pos
  # rx subrule "O" subtype=capture negate=
    rx1210_cur."!cursor_pos"(rx1210_pos)
    $P10 = rx1210_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1210_fail
    rx1210_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1210_pos = $P10."pos"()
  # rx pass
    rx1210_cur."!cursor_pass"(rx1210_pos, "prefix:sym<return>")
    rx1210_cur."!cursor_debug"("PASS  ", "prefix:sym<return>", " at pos=", rx1210_pos)
    .return (rx1210_cur)
  rx1210_fail:
.annotate "line", 413
    (rx1210_rep, rx1210_pos, $I10, $P10) = rx1210_cur."!mark_fail"(0)
    lt rx1210_pos, -1, rx1210_done
    eq rx1210_pos, -1, rx1210_fail
    jump $I10
  rx1210_done:
    rx1210_cur."!cursor_fail"()
    rx1210_cur."!cursor_debug"("FAIL  ", "prefix:sym<return>")
    .return (rx1210_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("314_1266334190.64822") :method
.annotate "line", 413
    new $P1212, "ResizablePMCArray"
    push $P1212, "return"
    .return ($P1212)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("315_1266334190.64822") :method :outer("11_1266334190.64822")
.annotate "line", 413
    .local string rx1216_tgt
    .local int rx1216_pos
    .local int rx1216_off
    .local int rx1216_eos
    .local int rx1216_rep
    .local pmc rx1216_cur
    (rx1216_cur, rx1216_pos, rx1216_tgt) = self."!cursor_start"()
    rx1216_cur."!cursor_debug"("START ", "prefix:sym<make>")
    .lex unicode:"$\x{a2}", rx1216_cur
    .local pmc match
    .lex "$/", match
    length rx1216_eos, rx1216_tgt
    set rx1216_off, 0
    lt rx1216_pos, 2, rx1216_start
    sub rx1216_off, rx1216_pos, 1
    substr rx1216_tgt, rx1216_tgt, rx1216_off
  rx1216_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1219_done
    goto rxscan1219_scan
  rxscan1219_loop:
    ($P10) = rx1216_cur."from"()
    inc $P10
    set rx1216_pos, $P10
    ge rx1216_pos, rx1216_eos, rxscan1219_done
  rxscan1219_scan:
    set_addr $I10, rxscan1219_loop
    rx1216_cur."!mark_push"(0, rx1216_pos, $I10)
  rxscan1219_done:
.annotate "line", 519
  # rx subcapture "sym"
    set_addr $I10, rxcap_1220_fail
    rx1216_cur."!mark_push"(0, rx1216_pos, $I10)
  # rx literal  "make"
    add $I11, rx1216_pos, 4
    gt $I11, rx1216_eos, rx1216_fail
    sub $I11, rx1216_pos, rx1216_off
    substr $S10, rx1216_tgt, $I11, 4
    ne $S10, "make", rx1216_fail
    add rx1216_pos, 4
    set_addr $I10, rxcap_1220_fail
    ($I12, $I11) = rx1216_cur."!mark_peek"($I10)
    rx1216_cur."!cursor_pos"($I11)
    ($P10) = rx1216_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1216_pos, "")
    rx1216_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1220_done
  rxcap_1220_fail:
    goto rx1216_fail
  rxcap_1220_done:
  # rx charclass s
    ge rx1216_pos, rx1216_eos, rx1216_fail
    sub $I10, rx1216_pos, rx1216_off
    is_cclass $I11, 32, rx1216_tgt, $I10
    unless $I11, rx1216_fail
    inc rx1216_pos
  # rx subrule "O" subtype=capture negate=
    rx1216_cur."!cursor_pos"(rx1216_pos)
    $P10 = rx1216_cur."O"("%list_prefix")
    unless $P10, rx1216_fail
    rx1216_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1216_pos = $P10."pos"()
  # rx pass
    rx1216_cur."!cursor_pass"(rx1216_pos, "prefix:sym<make>")
    rx1216_cur."!cursor_debug"("PASS  ", "prefix:sym<make>", " at pos=", rx1216_pos)
    .return (rx1216_cur)
  rx1216_fail:
.annotate "line", 413
    (rx1216_rep, rx1216_pos, $I10, $P10) = rx1216_cur."!mark_fail"(0)
    lt rx1216_pos, -1, rx1216_done
    eq rx1216_pos, -1, rx1216_fail
    jump $I10
  rx1216_done:
    rx1216_cur."!cursor_fail"()
    rx1216_cur."!cursor_debug"("FAIL  ", "prefix:sym<make>")
    .return (rx1216_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("316_1266334190.64822") :method
.annotate "line", 413
    new $P1218, "ResizablePMCArray"
    push $P1218, "make"
    .return ($P1218)
.end


.namespace ["NQP";"Grammar"]
.sub "smartmatch"  :subid("317_1266334190.64822") :method :outer("11_1266334190.64822")
    .param pmc param_1224
.annotate "line", 521
    new $P1223, 'ExceptionHandler'
    set_addr $P1223, control_1222
    $P1223."handle_types"(58)
    push_eh $P1223
    .lex "self", self
    .lex "$/", param_1224
.annotate "line", 523
    new $P1225, "Undef"
    .lex "$t", $P1225
    find_lex $P1226, "$/"
    unless_null $P1226, vivify_343
    new $P1226, "ResizablePMCArray"
  vivify_343:
    set $P1227, $P1226[0]
    unless_null $P1227, vivify_344
    new $P1227, "Undef"
  vivify_344:
    store_lex "$t", $P1227
    find_lex $P1228, "$/"
    unless_null $P1228, vivify_345
    new $P1228, "ResizablePMCArray"
  vivify_345:
    set $P1229, $P1228[1]
    unless_null $P1229, vivify_346
    new $P1229, "Undef"
  vivify_346:
    find_lex $P1230, "$/"
    unless_null $P1230, vivify_347
    new $P1230, "ResizablePMCArray"
    store_lex "$/", $P1230
  vivify_347:
    set $P1230[0], $P1229
    find_lex $P1231, "$t"
    find_lex $P1232, "$/"
    unless_null $P1232, vivify_348
    new $P1232, "ResizablePMCArray"
    store_lex "$/", $P1232
  vivify_348:
    set $P1232[1], $P1231
.annotate "line", 521
    .return ($P1231)
  control_1222:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1233, exception, "payload"
    .return ($P1233)
.end


.namespace ["NQP";"Regex"]
.sub "_block1234"  :subid("318_1266334190.64822") :outer("11_1266334190.64822")
.annotate "line", 527
    .const 'Sub' $P1268 = "329_1266334190.64822" 
    capture_lex $P1268
    .const 'Sub' $P1255 = "326_1266334190.64822" 
    capture_lex $P1255
    .const 'Sub' $P1250 = "324_1266334190.64822" 
    capture_lex $P1250
    .const 'Sub' $P1245 = "322_1266334190.64822" 
    capture_lex $P1245
    .const 'Sub' $P1236 = "319_1266334190.64822" 
    capture_lex $P1236
    .const 'Sub' $P1268 = "329_1266334190.64822" 
    capture_lex $P1268
    .return ($P1268)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("319_1266334190.64822") :method :outer("318_1266334190.64822")
.annotate "line", 527
    .const 'Sub' $P1242 = "321_1266334190.64822" 
    capture_lex $P1242
    .local string rx1237_tgt
    .local int rx1237_pos
    .local int rx1237_off
    .local int rx1237_eos
    .local int rx1237_rep
    .local pmc rx1237_cur
    (rx1237_cur, rx1237_pos, rx1237_tgt) = self."!cursor_start"()
    rx1237_cur."!cursor_debug"("START ", "metachar:sym<:my>")
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
.annotate "line", 529
  # rx literal  ":"
    add $I11, rx1237_pos, 1
    gt $I11, rx1237_eos, rx1237_fail
    sub $I11, rx1237_pos, rx1237_off
    substr $S10, rx1237_tgt, $I11, 1
    ne $S10, ":", rx1237_fail
    add rx1237_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1237_cur."!cursor_pos"(rx1237_pos)
    .const 'Sub' $P1242 = "321_1266334190.64822" 
    capture_lex $P1242
    $P10 = rx1237_cur."before"($P1242)
    unless $P10, rx1237_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1237_cur."!cursor_pos"(rx1237_pos)
    $P10 = rx1237_cur."LANG"("MAIN", "statement")
    unless $P10, rx1237_fail
    rx1237_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1237_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1237_cur."!cursor_pos"(rx1237_pos)
    $P10 = rx1237_cur."ws"()
    unless $P10, rx1237_fail
    rx1237_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1237_pos, 1
    gt $I11, rx1237_eos, rx1237_fail
    sub $I11, rx1237_pos, rx1237_off
    substr $S10, rx1237_tgt, $I11, 1
    ne $S10, ";", rx1237_fail
    add rx1237_pos, 1
.annotate "line", 528
  # rx pass
    rx1237_cur."!cursor_pass"(rx1237_pos, "metachar:sym<:my>")
    rx1237_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1237_pos)
    .return (rx1237_cur)
  rx1237_fail:
.annotate "line", 527
    (rx1237_rep, rx1237_pos, $I10, $P10) = rx1237_cur."!mark_fail"(0)
    lt rx1237_pos, -1, rx1237_done
    eq rx1237_pos, -1, rx1237_fail
    jump $I10
  rx1237_done:
    rx1237_cur."!cursor_fail"()
    rx1237_cur."!cursor_debug"("FAIL  ", "metachar:sym<:my>")
    .return (rx1237_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("320_1266334190.64822") :method
.annotate "line", 527
    new $P1239, "ResizablePMCArray"
    push $P1239, ":"
    .return ($P1239)
.end


.namespace ["NQP";"Regex"]
.sub "_block1241"  :anon :subid("321_1266334190.64822") :method :outer("319_1266334190.64822")
.annotate "line", 529
    .local string rx1243_tgt
    .local int rx1243_pos
    .local int rx1243_off
    .local int rx1243_eos
    .local int rx1243_rep
    .local pmc rx1243_cur
    (rx1243_cur, rx1243_pos, rx1243_tgt) = self."!cursor_start"()
    rx1243_cur."!cursor_debug"("START ", "")
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
    ne $I10, -1, rxscan1244_done
    goto rxscan1244_scan
  rxscan1244_loop:
    ($P10) = rx1243_cur."from"()
    inc $P10
    set rx1243_pos, $P10
    ge rx1243_pos, rx1243_eos, rxscan1244_done
  rxscan1244_scan:
    set_addr $I10, rxscan1244_loop
    rx1243_cur."!mark_push"(0, rx1243_pos, $I10)
  rxscan1244_done:
  # rx literal  "my"
    add $I11, rx1243_pos, 2
    gt $I11, rx1243_eos, rx1243_fail
    sub $I11, rx1243_pos, rx1243_off
    substr $S10, rx1243_tgt, $I11, 2
    ne $S10, "my", rx1243_fail
    add rx1243_pos, 2
  # rx pass
    rx1243_cur."!cursor_pass"(rx1243_pos, "")
    rx1243_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1243_pos)
    .return (rx1243_cur)
  rx1243_fail:
    (rx1243_rep, rx1243_pos, $I10, $P10) = rx1243_cur."!mark_fail"(0)
    lt rx1243_pos, -1, rx1243_done
    eq rx1243_pos, -1, rx1243_fail
    jump $I10
  rx1243_done:
    rx1243_cur."!cursor_fail"()
    rx1243_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1243_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("322_1266334190.64822") :method :outer("318_1266334190.64822")
.annotate "line", 527
    .local string rx1246_tgt
    .local int rx1246_pos
    .local int rx1246_off
    .local int rx1246_eos
    .local int rx1246_rep
    .local pmc rx1246_cur
    (rx1246_cur, rx1246_pos, rx1246_tgt) = self."!cursor_start"()
    rx1246_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1246_cur
    .local pmc match
    .lex "$/", match
    length rx1246_eos, rx1246_tgt
    set rx1246_off, 0
    lt rx1246_pos, 2, rx1246_start
    sub rx1246_off, rx1246_pos, 1
    substr rx1246_tgt, rx1246_tgt, rx1246_off
  rx1246_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1249_done
    goto rxscan1249_scan
  rxscan1249_loop:
    ($P10) = rx1246_cur."from"()
    inc $P10
    set rx1246_pos, $P10
    ge rx1246_pos, rx1246_eos, rxscan1249_done
  rxscan1249_scan:
    set_addr $I10, rxscan1249_loop
    rx1246_cur."!mark_push"(0, rx1246_pos, $I10)
  rxscan1249_done:
.annotate "line", 533
  # rx enumcharlist negate=0 zerowidth
    ge rx1246_pos, rx1246_eos, rx1246_fail
    sub $I10, rx1246_pos, rx1246_off
    substr $S10, rx1246_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1246_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1246_cur."!cursor_pos"(rx1246_pos)
    $P10 = rx1246_cur."codeblock"()
    unless $P10, rx1246_fail
    rx1246_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1246_pos = $P10."pos"()
.annotate "line", 532
  # rx pass
    rx1246_cur."!cursor_pass"(rx1246_pos, "metachar:sym<{ }>")
    rx1246_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1246_pos)
    .return (rx1246_cur)
  rx1246_fail:
.annotate "line", 527
    (rx1246_rep, rx1246_pos, $I10, $P10) = rx1246_cur."!mark_fail"(0)
    lt rx1246_pos, -1, rx1246_done
    eq rx1246_pos, -1, rx1246_fail
    jump $I10
  rx1246_done:
    rx1246_cur."!cursor_fail"()
    rx1246_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx1246_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("323_1266334190.64822") :method
.annotate "line", 527
    new $P1248, "ResizablePMCArray"
    push $P1248, "{"
    .return ($P1248)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("324_1266334190.64822") :method :outer("318_1266334190.64822")
.annotate "line", 527
    .local string rx1251_tgt
    .local int rx1251_pos
    .local int rx1251_off
    .local int rx1251_eos
    .local int rx1251_rep
    .local pmc rx1251_cur
    (rx1251_cur, rx1251_pos, rx1251_tgt) = self."!cursor_start"()
    rx1251_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
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
    ne $I10, -1, rxscan1254_done
    goto rxscan1254_scan
  rxscan1254_loop:
    ($P10) = rx1251_cur."from"()
    inc $P10
    set rx1251_pos, $P10
    ge rx1251_pos, rx1251_eos, rxscan1254_done
  rxscan1254_scan:
    set_addr $I10, rxscan1254_loop
    rx1251_cur."!mark_push"(0, rx1251_pos, $I10)
  rxscan1254_done:
.annotate "line", 537
  # rx enumcharlist negate=0 zerowidth
    ge rx1251_pos, rx1251_eos, rx1251_fail
    sub $I10, rx1251_pos, rx1251_off
    substr $S10, rx1251_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1251_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1251_cur."!cursor_pos"(rx1251_pos)
    $P10 = rx1251_cur."codeblock"()
    unless $P10, rx1251_fail
    rx1251_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1251_pos = $P10."pos"()
.annotate "line", 536
  # rx pass
    rx1251_cur."!cursor_pass"(rx1251_pos, "assertion:sym<{ }>")
    rx1251_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1251_pos)
    .return (rx1251_cur)
  rx1251_fail:
.annotate "line", 527
    (rx1251_rep, rx1251_pos, $I10, $P10) = rx1251_cur."!mark_fail"(0)
    lt rx1251_pos, -1, rx1251_done
    eq rx1251_pos, -1, rx1251_fail
    jump $I10
  rx1251_done:
    rx1251_cur."!cursor_fail"()
    rx1251_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1251_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("325_1266334190.64822") :method
.annotate "line", 527
    new $P1253, "ResizablePMCArray"
    push $P1253, "{"
    .return ($P1253)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("326_1266334190.64822") :method :outer("318_1266334190.64822")
.annotate "line", 527
    .const 'Sub' $P1264 = "328_1266334190.64822" 
    capture_lex $P1264
    .local string rx1256_tgt
    .local int rx1256_pos
    .local int rx1256_off
    .local int rx1256_eos
    .local int rx1256_rep
    .local pmc rx1256_cur
    (rx1256_cur, rx1256_pos, rx1256_tgt) = self."!cursor_start"()
    rx1256_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1256_cur."!cursor_caparray"("arglist", "nibbler", "assertion")
    .lex unicode:"$\x{a2}", rx1256_cur
    .local pmc match
    .lex "$/", match
    length rx1256_eos, rx1256_tgt
    set rx1256_off, 0
    lt rx1256_pos, 2, rx1256_start
    sub rx1256_off, rx1256_pos, 1
    substr rx1256_tgt, rx1256_tgt, rx1256_off
  rx1256_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1259_done
    goto rxscan1259_scan
  rxscan1259_loop:
    ($P10) = rx1256_cur."from"()
    inc $P10
    set rx1256_pos, $P10
    ge rx1256_pos, rx1256_eos, rxscan1259_done
  rxscan1259_scan:
    set_addr $I10, rxscan1259_loop
    rx1256_cur."!mark_push"(0, rx1256_pos, $I10)
  rxscan1259_done:
.annotate "line", 541
  # rx subcapture "longname"
    set_addr $I10, rxcap_1260_fail
    rx1256_cur."!mark_push"(0, rx1256_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1256_pos, rx1256_off
    find_not_cclass $I11, 8192, rx1256_tgt, $I10, rx1256_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1256_fail
    add rx1256_pos, rx1256_off, $I11
    set_addr $I10, rxcap_1260_fail
    ($I12, $I11) = rx1256_cur."!mark_peek"($I10)
    rx1256_cur."!cursor_pos"($I11)
    ($P10) = rx1256_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1256_pos, "")
    rx1256_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_1260_done
  rxcap_1260_fail:
    goto rx1256_fail
  rxcap_1260_done:
.annotate "line", 548
  # rx rxquantr1261 ** 0..1
    set_addr $I1267, rxquantr1261_done
    rx1256_cur."!mark_push"(0, rx1256_pos, $I1267)
  rxquantr1261_loop:
  alt1262_0:
.annotate "line", 542
    set_addr $I10, alt1262_1
    rx1256_cur."!mark_push"(0, rx1256_pos, $I10)
.annotate "line", 543
  # rx subrule "before" subtype=zerowidth negate=
    rx1256_cur."!cursor_pos"(rx1256_pos)
    .const 'Sub' $P1264 = "328_1266334190.64822" 
    capture_lex $P1264
    $P10 = rx1256_cur."before"($P1264)
    unless $P10, rx1256_fail
    goto alt1262_end
  alt1262_1:
    set_addr $I10, alt1262_2
    rx1256_cur."!mark_push"(0, rx1256_pos, $I10)
.annotate "line", 544
  # rx literal  "="
    add $I11, rx1256_pos, 1
    gt $I11, rx1256_eos, rx1256_fail
    sub $I11, rx1256_pos, rx1256_off
    substr $S10, rx1256_tgt, $I11, 1
    ne $S10, "=", rx1256_fail
    add rx1256_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1256_cur."!cursor_pos"(rx1256_pos)
    $P10 = rx1256_cur."assertion"()
    unless $P10, rx1256_fail
    rx1256_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1256_pos = $P10."pos"()
    goto alt1262_end
  alt1262_2:
    set_addr $I10, alt1262_3
    rx1256_cur."!mark_push"(0, rx1256_pos, $I10)
.annotate "line", 545
  # rx literal  ":"
    add $I11, rx1256_pos, 1
    gt $I11, rx1256_eos, rx1256_fail
    sub $I11, rx1256_pos, rx1256_off
    substr $S10, rx1256_tgt, $I11, 1
    ne $S10, ":", rx1256_fail
    add rx1256_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1256_cur."!cursor_pos"(rx1256_pos)
    $P10 = rx1256_cur."arglist"()
    unless $P10, rx1256_fail
    rx1256_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1256_pos = $P10."pos"()
    goto alt1262_end
  alt1262_3:
    set_addr $I10, alt1262_4
    rx1256_cur."!mark_push"(0, rx1256_pos, $I10)
.annotate "line", 546
  # rx literal  "("
    add $I11, rx1256_pos, 1
    gt $I11, rx1256_eos, rx1256_fail
    sub $I11, rx1256_pos, rx1256_off
    substr $S10, rx1256_tgt, $I11, 1
    ne $S10, "(", rx1256_fail
    add rx1256_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1256_cur."!cursor_pos"(rx1256_pos)
    $P10 = rx1256_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1256_fail
    rx1256_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1256_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1256_pos, 1
    gt $I11, rx1256_eos, rx1256_fail
    sub $I11, rx1256_pos, rx1256_off
    substr $S10, rx1256_tgt, $I11, 1
    ne $S10, ")", rx1256_fail
    add rx1256_pos, 1
    goto alt1262_end
  alt1262_4:
.annotate "line", 547
  # rx subrule "normspace" subtype=method negate=
    rx1256_cur."!cursor_pos"(rx1256_pos)
    $P10 = rx1256_cur."normspace"()
    unless $P10, rx1256_fail
    rx1256_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1256_cur."!cursor_pos"(rx1256_pos)
    $P10 = rx1256_cur."nibbler"()
    unless $P10, rx1256_fail
    rx1256_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1256_pos = $P10."pos"()
  alt1262_end:
.annotate "line", 548
    (rx1256_rep) = rx1256_cur."!mark_commit"($I1267)
  rxquantr1261_done:
.annotate "line", 540
  # rx pass
    rx1256_cur."!cursor_pass"(rx1256_pos, "assertion:sym<name>")
    rx1256_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1256_pos)
    .return (rx1256_cur)
  rx1256_fail:
.annotate "line", 527
    (rx1256_rep, rx1256_pos, $I10, $P10) = rx1256_cur."!mark_fail"(0)
    lt rx1256_pos, -1, rx1256_done
    eq rx1256_pos, -1, rx1256_fail
    jump $I10
  rx1256_done:
    rx1256_cur."!cursor_fail"()
    rx1256_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1256_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("327_1266334190.64822") :method
.annotate "line", 527
    new $P1258, "ResizablePMCArray"
    push $P1258, ""
    .return ($P1258)
.end


.namespace ["NQP";"Regex"]
.sub "_block1263"  :anon :subid("328_1266334190.64822") :method :outer("326_1266334190.64822")
.annotate "line", 543
    .local string rx1265_tgt
    .local int rx1265_pos
    .local int rx1265_off
    .local int rx1265_eos
    .local int rx1265_rep
    .local pmc rx1265_cur
    (rx1265_cur, rx1265_pos, rx1265_tgt) = self."!cursor_start"()
    rx1265_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1265_cur
    .local pmc match
    .lex "$/", match
    length rx1265_eos, rx1265_tgt
    set rx1265_off, 0
    lt rx1265_pos, 2, rx1265_start
    sub rx1265_off, rx1265_pos, 1
    substr rx1265_tgt, rx1265_tgt, rx1265_off
  rx1265_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1266_done
    goto rxscan1266_scan
  rxscan1266_loop:
    ($P10) = rx1265_cur."from"()
    inc $P10
    set rx1265_pos, $P10
    ge rx1265_pos, rx1265_eos, rxscan1266_done
  rxscan1266_scan:
    set_addr $I10, rxscan1266_loop
    rx1265_cur."!mark_push"(0, rx1265_pos, $I10)
  rxscan1266_done:
  # rx literal  ">"
    add $I11, rx1265_pos, 1
    gt $I11, rx1265_eos, rx1265_fail
    sub $I11, rx1265_pos, rx1265_off
    substr $S10, rx1265_tgt, $I11, 1
    ne $S10, ">", rx1265_fail
    add rx1265_pos, 1
  # rx pass
    rx1265_cur."!cursor_pass"(rx1265_pos, "")
    rx1265_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1265_pos)
    .return (rx1265_cur)
  rx1265_fail:
    (rx1265_rep, rx1265_pos, $I10, $P10) = rx1265_cur."!mark_fail"(0)
    lt rx1265_pos, -1, rx1265_done
    eq rx1265_pos, -1, rx1265_fail
    jump $I10
  rx1265_done:
    rx1265_cur."!cursor_fail"()
    rx1265_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1265_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("329_1266334190.64822") :method :outer("318_1266334190.64822")
.annotate "line", 527
    .local string rx1269_tgt
    .local int rx1269_pos
    .local int rx1269_off
    .local int rx1269_eos
    .local int rx1269_rep
    .local pmc rx1269_cur
    (rx1269_cur, rx1269_pos, rx1269_tgt) = self."!cursor_start"()
    rx1269_cur."!cursor_debug"("START ", "codeblock")
    .lex unicode:"$\x{a2}", rx1269_cur
    .local pmc match
    .lex "$/", match
    length rx1269_eos, rx1269_tgt
    set rx1269_off, 0
    lt rx1269_pos, 2, rx1269_start
    sub rx1269_off, rx1269_pos, 1
    substr rx1269_tgt, rx1269_tgt, rx1269_off
  rx1269_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1273_done
    goto rxscan1273_scan
  rxscan1273_loop:
    ($P10) = rx1269_cur."from"()
    inc $P10
    set rx1269_pos, $P10
    ge rx1269_pos, rx1269_eos, rxscan1273_done
  rxscan1273_scan:
    set_addr $I10, rxscan1273_loop
    rx1269_cur."!mark_push"(0, rx1269_pos, $I10)
  rxscan1273_done:
.annotate "line", 553
  # rx subrule "LANG" subtype=capture negate=
    rx1269_cur."!cursor_pos"(rx1269_pos)
    $P10 = rx1269_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1269_fail
    rx1269_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1269_pos = $P10."pos"()
.annotate "line", 552
  # rx pass
    rx1269_cur."!cursor_pass"(rx1269_pos, "codeblock")
    rx1269_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1269_pos)
    .return (rx1269_cur)
  rx1269_fail:
.annotate "line", 527
    (rx1269_rep, rx1269_pos, $I10, $P10) = rx1269_cur."!mark_fail"(0)
    lt rx1269_pos, -1, rx1269_done
    eq rx1269_pos, -1, rx1269_fail
    jump $I10
  rx1269_done:
    rx1269_cur."!cursor_fail"()
    rx1269_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1269_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("330_1266334190.64822") :method
.annotate "line", 527
    $P1271 = self."!PREFIX__!subrule"("block", "")
    new $P1272, "ResizablePMCArray"
    push $P1272, $P1271
    .return ($P1272)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1266334201.91429")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
    $P2165 = $P14()
.annotate "line", 1
    .return ($P2165)
.end


.namespace []
.sub "" :load :init :subid("post126") :outer("10_1266334201.91429")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1266334201.91429" 
    .local pmc block
    set block, $P12
    $P2166 = get_root_global ["parrot"], "P6metaclass"
    $P2166."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1266334201.91429") :outer("10_1266334201.91429")
.annotate "line", 3
    .const 'Sub' $P2161 = "125_1266334201.91429" 
    capture_lex $P2161
    get_hll_global $P2097, ["NQP";"RegexActions"], "_block2096" 
    capture_lex $P2097
    .const 'Sub' $P2086 = "119_1266334201.91429" 
    capture_lex $P2086
    .const 'Sub' $P2074 = "118_1266334201.91429" 
    capture_lex $P2074
    .const 'Sub' $P2064 = "117_1266334201.91429" 
    capture_lex $P2064
    .const 'Sub' $P2054 = "116_1266334201.91429" 
    capture_lex $P2054
    .const 'Sub' $P2044 = "115_1266334201.91429" 
    capture_lex $P2044
    .const 'Sub' $P2030 = "114_1266334201.91429" 
    capture_lex $P2030
    .const 'Sub' $P2020 = "113_1266334201.91429" 
    capture_lex $P2020
    .const 'Sub' $P1983 = "112_1266334201.91429" 
    capture_lex $P1983
    .const 'Sub' $P1969 = "111_1266334201.91429" 
    capture_lex $P1969
    .const 'Sub' $P1959 = "110_1266334201.91429" 
    capture_lex $P1959
    .const 'Sub' $P1949 = "109_1266334201.91429" 
    capture_lex $P1949
    .const 'Sub' $P1939 = "108_1266334201.91429" 
    capture_lex $P1939
    .const 'Sub' $P1929 = "107_1266334201.91429" 
    capture_lex $P1929
    .const 'Sub' $P1919 = "106_1266334201.91429" 
    capture_lex $P1919
    .const 'Sub' $P1891 = "105_1266334201.91429" 
    capture_lex $P1891
    .const 'Sub' $P1874 = "104_1266334201.91429" 
    capture_lex $P1874
    .const 'Sub' $P1864 = "103_1266334201.91429" 
    capture_lex $P1864
    .const 'Sub' $P1852 = "102_1266334201.91429" 
    capture_lex $P1852
    .const 'Sub' $P1840 = "101_1266334201.91429" 
    capture_lex $P1840
    .const 'Sub' $P1828 = "100_1266334201.91429" 
    capture_lex $P1828
    .const 'Sub' $P1818 = "99_1266334201.91429" 
    capture_lex $P1818
    .const 'Sub' $P1789 = "98_1266334201.91429" 
    capture_lex $P1789
    .const 'Sub' $P1767 = "97_1266334201.91429" 
    capture_lex $P1767
    .const 'Sub' $P1757 = "96_1266334201.91429" 
    capture_lex $P1757
    .const 'Sub' $P1747 = "95_1266334201.91429" 
    capture_lex $P1747
    .const 'Sub' $P1720 = "94_1266334201.91429" 
    capture_lex $P1720
    .const 'Sub' $P1702 = "93_1266334201.91429" 
    capture_lex $P1702
    .const 'Sub' $P1692 = "92_1266334201.91429" 
    capture_lex $P1692
    .const 'Sub' $P1608 = "89_1266334201.91429" 
    capture_lex $P1608
    .const 'Sub' $P1598 = "88_1266334201.91429" 
    capture_lex $P1598
    .const 'Sub' $P1569 = "87_1266334201.91429" 
    capture_lex $P1569
    .const 'Sub' $P1527 = "86_1266334201.91429" 
    capture_lex $P1527
    .const 'Sub' $P1511 = "85_1266334201.91429" 
    capture_lex $P1511
    .const 'Sub' $P1502 = "84_1266334201.91429" 
    capture_lex $P1502
    .const 'Sub' $P1470 = "83_1266334201.91429" 
    capture_lex $P1470
    .const 'Sub' $P1371 = "80_1266334201.91429" 
    capture_lex $P1371
    .const 'Sub' $P1354 = "79_1266334201.91429" 
    capture_lex $P1354
    .const 'Sub' $P1334 = "78_1266334201.91429" 
    capture_lex $P1334
    .const 'Sub' $P1250 = "77_1266334201.91429" 
    capture_lex $P1250
    .const 'Sub' $P1226 = "75_1266334201.91429" 
    capture_lex $P1226
    .const 'Sub' $P1192 = "73_1266334201.91429" 
    capture_lex $P1192
    .const 'Sub' $P1142 = "71_1266334201.91429" 
    capture_lex $P1142
    .const 'Sub' $P1132 = "70_1266334201.91429" 
    capture_lex $P1132
    .const 'Sub' $P1122 = "69_1266334201.91429" 
    capture_lex $P1122
    .const 'Sub' $P1051 = "67_1266334201.91429" 
    capture_lex $P1051
    .const 'Sub' $P1034 = "66_1266334201.91429" 
    capture_lex $P1034
    .const 'Sub' $P1024 = "65_1266334201.91429" 
    capture_lex $P1024
    .const 'Sub' $P1014 = "64_1266334201.91429" 
    capture_lex $P1014
    .const 'Sub' $P1004 = "63_1266334201.91429" 
    capture_lex $P1004
    .const 'Sub' $P980 = "62_1266334201.91429" 
    capture_lex $P980
    .const 'Sub' $P927 = "61_1266334201.91429" 
    capture_lex $P927
    .const 'Sub' $P917 = "60_1266334201.91429" 
    capture_lex $P917
    .const 'Sub' $P828 = "58_1266334201.91429" 
    capture_lex $P828
    .const 'Sub' $P802 = "57_1266334201.91429" 
    capture_lex $P802
    .const 'Sub' $P786 = "56_1266334201.91429" 
    capture_lex $P786
    .const 'Sub' $P776 = "55_1266334201.91429" 
    capture_lex $P776
    .const 'Sub' $P766 = "54_1266334201.91429" 
    capture_lex $P766
    .const 'Sub' $P756 = "53_1266334201.91429" 
    capture_lex $P756
    .const 'Sub' $P746 = "52_1266334201.91429" 
    capture_lex $P746
    .const 'Sub' $P736 = "51_1266334201.91429" 
    capture_lex $P736
    .const 'Sub' $P726 = "50_1266334201.91429" 
    capture_lex $P726
    .const 'Sub' $P716 = "49_1266334201.91429" 
    capture_lex $P716
    .const 'Sub' $P706 = "48_1266334201.91429" 
    capture_lex $P706
    .const 'Sub' $P696 = "47_1266334201.91429" 
    capture_lex $P696
    .const 'Sub' $P686 = "46_1266334201.91429" 
    capture_lex $P686
    .const 'Sub' $P676 = "45_1266334201.91429" 
    capture_lex $P676
    .const 'Sub' $P666 = "44_1266334201.91429" 
    capture_lex $P666
    .const 'Sub' $P656 = "43_1266334201.91429" 
    capture_lex $P656
    .const 'Sub' $P638 = "42_1266334201.91429" 
    capture_lex $P638
    .const 'Sub' $P603 = "41_1266334201.91429" 
    capture_lex $P603
    .const 'Sub' $P587 = "40_1266334201.91429" 
    capture_lex $P587
    .const 'Sub' $P566 = "39_1266334201.91429" 
    capture_lex $P566
    .const 'Sub' $P546 = "38_1266334201.91429" 
    capture_lex $P546
    .const 'Sub' $P533 = "37_1266334201.91429" 
    capture_lex $P533
    .const 'Sub' $P507 = "36_1266334201.91429" 
    capture_lex $P507
    .const 'Sub' $P471 = "35_1266334201.91429" 
    capture_lex $P471
    .const 'Sub' $P454 = "34_1266334201.91429" 
    capture_lex $P454
    .const 'Sub' $P440 = "33_1266334201.91429" 
    capture_lex $P440
    .const 'Sub' $P387 = "31_1266334201.91429" 
    capture_lex $P387
    .const 'Sub' $P374 = "30_1266334201.91429" 
    capture_lex $P374
    .const 'Sub' $P355 = "29_1266334201.91429" 
    capture_lex $P355
    .const 'Sub' $P345 = "28_1266334201.91429" 
    capture_lex $P345
    .const 'Sub' $P335 = "27_1266334201.91429" 
    capture_lex $P335
    .const 'Sub' $P319 = "26_1266334201.91429" 
    capture_lex $P319
    .const 'Sub' $P259 = "24_1266334201.91429" 
    capture_lex $P259
    .const 'Sub' $P210 = "22_1266334201.91429" 
    capture_lex $P210
    .const 'Sub' $P191 = "21_1266334201.91429" 
    capture_lex $P191
    .const 'Sub' $P158 = "20_1266334201.91429" 
    capture_lex $P158
    .const 'Sub' $P148 = "19_1266334201.91429" 
    capture_lex $P148
    .const 'Sub' $P94 = "18_1266334201.91429" 
    capture_lex $P94
    .const 'Sub' $P79 = "17_1266334201.91429" 
    capture_lex $P79
    .const 'Sub' $P61 = "16_1266334201.91429" 
    capture_lex $P61
    .const 'Sub' $P26 = "13_1266334201.91429" 
    capture_lex $P26
    .const 'Sub' $P16 = "12_1266334201.91429" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_129
    new $P15, "ResizablePMCArray"
    set_global "@BLOCK", $P15
  vivify_129:
.annotate "line", 9
    .const 'Sub' $P16 = "12_1266334201.91429" 
    capture_lex $P16
    .lex "xblock_immediate", $P16
.annotate "line", 14
    .const 'Sub' $P26 = "13_1266334201.91429" 
    capture_lex $P26
    .lex "block_immediate", $P26
.annotate "line", 24
    .const 'Sub' $P61 = "16_1266334201.91429" 
    capture_lex $P61
    .lex "sigiltype", $P61
.annotate "line", 40
    .const 'Sub' $P79 = "17_1266334201.91429" 
    capture_lex $P79
    .lex "colonpair_str", $P79
.annotate "line", 187
    .const 'Sub' $P94 = "18_1266334201.91429" 
    capture_lex $P94
    .lex "push_block_handler", $P94
.annotate "line", 3
    get_global $P144, "@BLOCK"
.annotate "line", 5
    find_lex $P145, "xblock_immediate"
    find_lex $P146, "block_immediate"
    find_lex $P147, "sigiltype"
.annotate "line", 32
    find_lex $P190, "colonpair_str"
.annotate "line", 180
    find_lex $P586, "push_block_handler"
.annotate "line", 765
    get_hll_global $P2097, ["NQP";"RegexActions"], "_block2096" 
    capture_lex $P2097
    $P2159 = $P2097()
.annotate "line", 3
    .return ($P2159)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post127") :outer("11_1266334201.91429")
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 5
    .const 'Sub' $P2161 = "125_1266334201.91429" 
    capture_lex $P2161
    $P2161()
    $P2164 = get_root_global ["parrot"], "P6metaclass"
    $P2164."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block2160"  :anon :subid("125_1266334201.91429") :outer("11_1266334201.91429")
.annotate "line", 6
    get_global $P2162, "@BLOCK"
    unless_null $P2162, vivify_128
    new $P2162, "ResizablePMCArray"
    set_global "@BLOCK", $P2162
  vivify_128:
 $P2163 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P2163
.annotate "line", 5
    .return ($P2163)
.end


.namespace ["NQP";"Actions"]
.sub "xblock_immediate"  :subid("12_1266334201.91429") :outer("11_1266334201.91429")
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
    new $P20, "ResizablePMCArray"
  vivify_130:
    set $P21, $P20[1]
    unless_null $P21, vivify_131
    new $P21, "Undef"
  vivify_131:
    $P22 = "block_immediate"($P21)
    find_lex $P23, "$xblock"
    unless_null $P23, vivify_132
    new $P23, "ResizablePMCArray"
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
.sub "block_immediate"  :subid("13_1266334201.91429") :outer("11_1266334201.91429")
    .param pmc param_29
.annotate "line", 14
    .const 'Sub' $P39 = "14_1266334201.91429" 
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
    .const 'Sub' $P39 = "14_1266334201.91429" 
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
.sub "_block38"  :anon :subid("14_1266334201.91429") :outer("13_1266334201.91429")
.annotate "line", 16
    .const 'Sub' $P50 = "15_1266334201.91429" 
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
    .const 'Sub' $P50 = "15_1266334201.91429" 
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
.sub "_block49"  :anon :subid("15_1266334201.91429") :outer("14_1266334201.91429")
    .param pmc param_51
.annotate "line", 18
    .lex "$_", param_51
    find_lex $P52, "$stmts"
    find_lex $P53, "$_"
    $P54 = $P52."push"($P53)
    .return ($P54)
.end


.namespace ["NQP";"Actions"]
.sub "sigiltype"  :subid("16_1266334201.91429") :outer("11_1266334201.91429")
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
    find_lex $P73, "$sigil"
    set $S74, $P73
    iseq $I75, $S74, "@"
    if $I75, if_72
    new $P77, "String"
    assign $P77, "Undef"
    set $P71, $P77
    goto if_72_end
  if_72:
    new $P76, "String"
    assign $P76, "ResizablePMCArray"
    set $P71, $P76
  if_72_end:
    set $P65, $P71
.annotate "line", 25
    goto if_66_end
  if_66:
    new $P70, "String"
    assign $P70, "Hash"
    set $P65, $P70
  if_66_end:
.annotate "line", 24
    .return ($P65)
  control_62:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P78, exception, "payload"
    .return ($P78)
.end


.namespace ["NQP";"Actions"]
.sub "colonpair_str"  :subid("17_1266334201.91429") :outer("11_1266334201.91429")
    .param pmc param_82
.annotate "line", 40
    new $P81, 'ExceptionHandler'
    set_addr $P81, control_80
    $P81."handle_types"(58)
    push_eh $P81
    .lex "$ast", param_82
.annotate "line", 41
    get_hll_global $P85, ["PAST"], "Op"
    find_lex $P86, "$ast"
    $P87 = $P85."ACCEPTS"($P86)
    if $P87, if_84
.annotate "line", 43
    find_lex $P91, "$ast"
    $P92 = $P91."value"()
    set $P83, $P92
.annotate "line", 41
    goto if_84_end
  if_84:
.annotate "line", 42
    find_lex $P88, "$ast"
    $P89 = $P88."list"()
    join $S90, " ", $P89
    new $P83, 'String'
    set $P83, $S90
  if_84_end:
.annotate "line", 40
    .return ($P83)
  control_80:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P93, exception, "payload"
    .return ($P93)
.end


.namespace ["NQP";"Actions"]
.sub "push_block_handler"  :subid("18_1266334201.91429") :outer("11_1266334201.91429")
    .param pmc param_97
    .param pmc param_98
.annotate "line", 187
    new $P96, 'ExceptionHandler'
    set_addr $P96, control_95
    $P96."handle_types"(58)
    push_eh $P96
    .lex "$/", param_97
    .lex "$block", param_98
.annotate "line", 188
    get_global $P100, "@BLOCK"
    unless_null $P100, vivify_134
    new $P100, "ResizablePMCArray"
  vivify_134:
    set $P101, $P100[0]
    unless_null $P101, vivify_135
    new $P101, "Undef"
  vivify_135:
    $P102 = $P101."handlers"()
    if $P102, unless_99_end
.annotate "line", 189
    get_global $P103, "@BLOCK"
    unless_null $P103, vivify_136
    new $P103, "ResizablePMCArray"
  vivify_136:
    set $P104, $P103[0]
    unless_null $P104, vivify_137
    new $P104, "Undef"
  vivify_137:
    new $P105, "ResizablePMCArray"
    $P104."handlers"($P105)
  unless_99_end:
.annotate "line", 191
    find_lex $P107, "$block"
    $P108 = $P107."arity"()
    if $P108, unless_106_end
.annotate "line", 192
    find_lex $P109, "$block"
.annotate "line", 193
    get_hll_global $P110, ["PAST"], "Op"
.annotate "line", 194
    get_hll_global $P111, ["PAST"], "Var"
    $P112 = $P111."new"("lexical" :named("scope"), "$!" :named("name"), 1 :named("isdecl"))
.annotate "line", 195
    get_hll_global $P113, ["PAST"], "Var"
    $P114 = $P113."new"("lexical" :named("scope"), "$_" :named("name"))
    $P115 = $P110."new"($P112, $P114, "bind" :named("pasttype"))
.annotate "line", 193
    $P109."unshift"($P115)
.annotate "line", 198
    find_lex $P116, "$block"
    get_hll_global $P117, ["PAST"], "Var"
    $P118 = $P117."new"("$_" :named("name"), "parameter" :named("scope"))
    $P116."unshift"($P118)
.annotate "line", 199
    find_lex $P119, "$block"
    $P119."symbol"("$_", "lexical" :named("scope"))
.annotate "line", 200
    find_lex $P120, "$block"
    $P120."symbol"("$!", "lexical" :named("scope"))
.annotate "line", 201
    find_lex $P121, "$block"
    $P121."arity"(1)
  unless_106_end:
.annotate "line", 203
    find_lex $P122, "$block"
    $P122."blocktype"("declaration")
.annotate "line", 204
    get_global $P123, "@BLOCK"
    unless_null $P123, vivify_138
    new $P123, "ResizablePMCArray"
  vivify_138:
    set $P124, $P123[0]
    unless_null $P124, vivify_139
    new $P124, "Undef"
  vivify_139:
    $P125 = $P124."handlers"()
.annotate "line", 205
    get_hll_global $P126, ["PAST"], "Control"
    find_lex $P127, "$/"
.annotate "line", 207
    get_hll_global $P128, ["PAST"], "Stmts"
.annotate "line", 208
    get_hll_global $P129, ["PAST"], "Op"
    find_lex $P130, "$block"
.annotate "line", 210
    get_hll_global $P131, ["PAST"], "Var"
    $P132 = $P131."new"("register" :named("scope"), "exception" :named("name"))
    $P133 = $P129."new"($P130, $P132, "call" :named("pasttype"))
.annotate "line", 212
    get_hll_global $P134, ["PAST"], "Op"
.annotate "line", 213
    get_hll_global $P135, ["PAST"], "Var"
.annotate "line", 214
    get_hll_global $P136, ["PAST"], "Var"
    $P137 = $P136."new"("register" :named("scope"), "exception" :named("name"))
    $P138 = $P135."new"($P137, "handled", "keyed" :named("scope"))
.annotate "line", 213
    $P139 = $P134."new"($P138, 1, "bind" :named("pasttype"))
.annotate "line", 212
    $P140 = $P128."new"($P133, $P139)
.annotate "line", 207
    $P141 = $P126."new"($P140, $P127 :named("node"))
.annotate "line", 205
    $P142 = $P125."unshift"($P141)
.annotate "line", 187
    .return ($P142)
  control_95:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P143, exception, "payload"
    .return ($P143)
.end


.namespace ["NQP";"Actions"]
.sub "TOP"  :subid("19_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_151
.annotate "line", 30
    new $P150, 'ExceptionHandler'
    set_addr $P150, control_149
    $P150."handle_types"(58)
    push_eh $P150
    .lex "self", self
    .lex "$/", param_151
    find_lex $P152, "$/"
    find_lex $P153, "$/"
    unless_null $P153, vivify_140
    new $P153, "Hash"
  vivify_140:
    set $P154, $P153["comp_unit"]
    unless_null $P154, vivify_141
    new $P154, "Undef"
  vivify_141:
    $P155 = $P154."ast"()
    $P156 = $P152."!make"($P155)
    .return ($P156)
  control_149:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P157, exception, "payload"
    .return ($P157)
.end


.namespace ["NQP";"Actions"]
.sub "deflongname"  :subid("20_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_161
.annotate "line", 32
    new $P160, 'ExceptionHandler'
    set_addr $P160, control_159
    $P160."handle_types"(58)
    push_eh $P160
    .lex "self", self
    .lex "$/", param_161
.annotate "line", 33
    find_lex $P162, "$/"
.annotate "line", 34
    find_lex $P165, "$/"
    unless_null $P165, vivify_142
    new $P165, "Hash"
  vivify_142:
    set $P166, $P165["colonpair"]
    unless_null $P166, vivify_143
    new $P166, "Undef"
  vivify_143:
    if $P166, if_164
.annotate "line", 36
    find_lex $P186, "$/"
    set $S187, $P186
    new $P163, 'String'
    set $P163, $S187
.annotate "line", 34
    goto if_164_end
  if_164:
    find_lex $P167, "$/"
    unless_null $P167, vivify_144
    new $P167, "Hash"
  vivify_144:
    set $P168, $P167["identifier"]
    unless_null $P168, vivify_145
    new $P168, "Undef"
  vivify_145:
    set $S169, $P168
    new $P170, 'String'
    set $P170, $S169
    concat $P171, $P170, ":"
    find_lex $P172, "$/"
    unless_null $P172, vivify_146
    new $P172, "Hash"
  vivify_146:
    set $P173, $P172["colonpair"]
    unless_null $P173, vivify_147
    new $P173, "ResizablePMCArray"
  vivify_147:
    set $P174, $P173[0]
    unless_null $P174, vivify_148
    new $P174, "Undef"
  vivify_148:
    $P175 = $P174."ast"()
    $S176 = $P175."named"()
    concat $P177, $P171, $S176
    concat $P178, $P177, "<"
.annotate "line", 35
    find_lex $P179, "$/"
    unless_null $P179, vivify_149
    new $P179, "Hash"
  vivify_149:
    set $P180, $P179["colonpair"]
    unless_null $P180, vivify_150
    new $P180, "ResizablePMCArray"
  vivify_150:
    set $P181, $P180[0]
    unless_null $P181, vivify_151
    new $P181, "Undef"
  vivify_151:
    $P182 = $P181."ast"()
    $S183 = "colonpair_str"($P182)
    concat $P184, $P178, $S183
    concat $P185, $P184, ">"
    set $P163, $P185
  if_164_end:
.annotate "line", 34
    $P188 = $P162."!make"($P163)
.annotate "line", 32
    .return ($P188)
  control_159:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P189, exception, "payload"
    .return ($P189)
.end


.namespace ["NQP";"Actions"]
.sub "comp_unit"  :subid("21_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_194
.annotate "line", 46
    new $P193, 'ExceptionHandler'
    set_addr $P193, control_192
    $P193."handle_types"(58)
    push_eh $P193
    .lex "self", self
    .lex "$/", param_194
.annotate "line", 47
    new $P195, "Undef"
    .lex "$past", $P195
.annotate "line", 48
    new $P196, "Undef"
    .lex "$BLOCK", $P196
.annotate "line", 47
    find_lex $P197, "$/"
    unless_null $P197, vivify_152
    new $P197, "Hash"
  vivify_152:
    set $P198, $P197["statementlist"]
    unless_null $P198, vivify_153
    new $P198, "Undef"
  vivify_153:
    $P199 = $P198."ast"()
    store_lex "$past", $P199
.annotate "line", 48
    get_global $P200, "@BLOCK"
    $P201 = $P200."shift"()
    store_lex "$BLOCK", $P201
.annotate "line", 49
    find_lex $P202, "$BLOCK"
    find_lex $P203, "$past"
    $P202."push"($P203)
.annotate "line", 50
    find_lex $P204, "$BLOCK"
    find_lex $P205, "$/"
    $P204."node"($P205)
.annotate "line", 51
    find_lex $P206, "$/"
    find_lex $P207, "$BLOCK"
    $P208 = $P206."!make"($P207)
.annotate "line", 46
    .return ($P208)
  control_192:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P209, exception, "payload"
    .return ($P209)
.end


.namespace ["NQP";"Actions"]
.sub "statementlist"  :subid("22_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_213
.annotate "line", 54
    .const 'Sub' $P227 = "23_1266334201.91429" 
    capture_lex $P227
    new $P212, 'ExceptionHandler'
    set_addr $P212, control_211
    $P212."handle_types"(58)
    push_eh $P212
    .lex "self", self
    .lex "$/", param_213
.annotate "line", 55
    new $P214, "Undef"
    .lex "$past", $P214
    get_hll_global $P215, ["PAST"], "Stmts"
    find_lex $P216, "$/"
    $P217 = $P215."new"($P216 :named("node"))
    store_lex "$past", $P217
.annotate "line", 56
    find_lex $P219, "$/"
    unless_null $P219, vivify_154
    new $P219, "Hash"
  vivify_154:
    set $P220, $P219["statement"]
    unless_null $P220, vivify_155
    new $P220, "Undef"
  vivify_155:
    unless $P220, if_218_end
.annotate "line", 57
    find_lex $P222, "$/"
    unless_null $P222, vivify_156
    new $P222, "Hash"
  vivify_156:
    set $P223, $P222["statement"]
    unless_null $P223, vivify_157
    new $P223, "Undef"
  vivify_157:
    defined $I224, $P223
    unless $I224, for_undef_158
    iter $P221, $P223
    new $P253, 'ExceptionHandler'
    set_addr $P253, loop252_handler
    $P253."handle_types"(65, 67, 66)
    push_eh $P253
  loop252_test:
    unless $P221, loop252_done
    shift $P225, $P221
  loop252_redo:
    .const 'Sub' $P227 = "23_1266334201.91429" 
    capture_lex $P227
    $P227($P225)
  loop252_next:
    goto loop252_test
  loop252_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P254, exception, 'type'
    eq $P254, 65, loop252_next
    eq $P254, 67, loop252_redo
  loop252_done:
    pop_eh 
  for_undef_158:
  if_218_end:
.annotate "line", 66
    find_lex $P255, "$/"
    find_lex $P256, "$past"
    $P257 = $P255."!make"($P256)
.annotate "line", 54
    .return ($P257)
  control_211:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P258, exception, "payload"
    .return ($P258)
.end


.namespace ["NQP";"Actions"]
.sub "_block226"  :anon :subid("23_1266334201.91429") :outer("22_1266334201.91429")
    .param pmc param_229
.annotate "line", 58
    new $P228, "Undef"
    .lex "$ast", $P228
    .lex "$_", param_229
    find_lex $P230, "$_"
    $P231 = $P230."ast"()
    store_lex "$ast", $P231
.annotate "line", 59
    find_lex $P233, "$ast"
    unless_null $P233, vivify_159
    new $P233, "Hash"
  vivify_159:
    set $P234, $P233["sink"]
    unless_null $P234, vivify_160
    new $P234, "Undef"
  vivify_160:
    defined $I235, $P234
    unless $I235, if_232_end
    find_lex $P236, "$ast"
    unless_null $P236, vivify_161
    new $P236, "Hash"
  vivify_161:
    set $P237, $P236["sink"]
    unless_null $P237, vivify_162
    new $P237, "Undef"
  vivify_162:
    store_lex "$ast", $P237
  if_232_end:
.annotate "line", 60
    find_lex $P241, "$ast"
    get_hll_global $P242, ["PAST"], "Block"
    $P243 = $P241."isa"($P242)
    if $P243, if_240
    set $P239, $P243
    goto if_240_end
  if_240:
    find_lex $P244, "$ast"
    $P245 = $P244."blocktype"()
    isfalse $I246, $P245
    new $P239, 'Integer'
    set $P239, $I246
  if_240_end:
    unless $P239, if_238_end
.annotate "line", 61
    find_lex $P247, "$ast"
    $P248 = "block_immediate"($P247)
    store_lex "$ast", $P248
  if_238_end:
.annotate "line", 63
    find_lex $P249, "$past"
    find_lex $P250, "$ast"
    $P251 = $P249."push"($P250)
.annotate "line", 57
    .return ($P251)
.end


.namespace ["NQP";"Actions"]
.sub "statement"  :subid("24_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_262
    .param pmc param_263 :optional
    .param int has_param_263 :opt_flag
.annotate "line", 69
    .const 'Sub' $P271 = "25_1266334201.91429" 
    capture_lex $P271
    new $P261, 'ExceptionHandler'
    set_addr $P261, control_260
    $P261."handle_types"(58)
    push_eh $P261
    .lex "self", self
    .lex "$/", param_262
    if has_param_263, optparam_163
    new $P264, "Undef"
    set param_263, $P264
  optparam_163:
    .lex "$key", param_263
.annotate "line", 70
    new $P265, "Undef"
    .lex "$past", $P265
.annotate "line", 69
    find_lex $P266, "$past"
.annotate "line", 71
    find_lex $P268, "$/"
    unless_null $P268, vivify_164
    new $P268, "Hash"
  vivify_164:
    set $P269, $P268["EXPR"]
    unless_null $P269, vivify_165
    new $P269, "Undef"
  vivify_165:
    if $P269, if_267
.annotate "line", 82
    find_lex $P309, "$/"
    unless_null $P309, vivify_166
    new $P309, "Hash"
  vivify_166:
    set $P310, $P309["statement_control"]
    unless_null $P310, vivify_167
    new $P310, "Undef"
  vivify_167:
    if $P310, if_308
.annotate "line", 83
    new $P314, "Integer"
    assign $P314, 0
    store_lex "$past", $P314
    goto if_308_end
  if_308:
.annotate "line", 82
    find_lex $P311, "$/"
    unless_null $P311, vivify_168
    new $P311, "Hash"
  vivify_168:
    set $P312, $P311["statement_control"]
    unless_null $P312, vivify_169
    new $P312, "Undef"
  vivify_169:
    $P313 = $P312."ast"()
    store_lex "$past", $P313
  if_308_end:
    goto if_267_end
  if_267:
.annotate "line", 71
    .const 'Sub' $P271 = "25_1266334201.91429" 
    capture_lex $P271
    $P271()
  if_267_end:
.annotate "line", 84
    find_lex $P315, "$/"
    find_lex $P316, "$past"
    $P317 = $P315."!make"($P316)
.annotate "line", 69
    .return ($P317)
  control_260:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P318, exception, "payload"
    .return ($P318)
.end


.namespace ["NQP";"Actions"]
.sub "_block270"  :anon :subid("25_1266334201.91429") :outer("24_1266334201.91429")
.annotate "line", 72
    new $P272, "Undef"
    .lex "$mc", $P272
.annotate "line", 73
    new $P273, "Undef"
    .lex "$ml", $P273
.annotate "line", 72
    find_lex $P274, "$/"
    unless_null $P274, vivify_170
    new $P274, "Hash"
  vivify_170:
    set $P275, $P274["statement_mod_cond"]
    unless_null $P275, vivify_171
    new $P275, "ResizablePMCArray"
  vivify_171:
    set $P276, $P275[0]
    unless_null $P276, vivify_172
    new $P276, "Undef"
  vivify_172:
    store_lex "$mc", $P276
.annotate "line", 73
    find_lex $P277, "$/"
    unless_null $P277, vivify_173
    new $P277, "Hash"
  vivify_173:
    set $P278, $P277["statement_mod_loop"]
    unless_null $P278, vivify_174
    new $P278, "ResizablePMCArray"
  vivify_174:
    set $P279, $P278[0]
    unless_null $P279, vivify_175
    new $P279, "Undef"
  vivify_175:
    store_lex "$ml", $P279
.annotate "line", 74
    find_lex $P280, "$/"
    unless_null $P280, vivify_176
    new $P280, "Hash"
  vivify_176:
    set $P281, $P280["EXPR"]
    unless_null $P281, vivify_177
    new $P281, "Undef"
  vivify_177:
    $P282 = $P281."ast"()
    store_lex "$past", $P282
.annotate "line", 75
    find_lex $P284, "$mc"
    unless $P284, if_283_end
.annotate "line", 76
    get_hll_global $P285, ["PAST"], "Op"
    find_lex $P286, "$mc"
    unless_null $P286, vivify_178
    new $P286, "Hash"
  vivify_178:
    set $P287, $P286["cond"]
    unless_null $P287, vivify_179
    new $P287, "Undef"
  vivify_179:
    $P288 = $P287."ast"()
    find_lex $P289, "$past"
    find_lex $P290, "$mc"
    unless_null $P290, vivify_180
    new $P290, "Hash"
  vivify_180:
    set $P291, $P290["sym"]
    unless_null $P291, vivify_181
    new $P291, "Undef"
  vivify_181:
    set $S292, $P291
    find_lex $P293, "$/"
    $P294 = $P285."new"($P288, $P289, $S292 :named("pasttype"), $P293 :named("node"))
    store_lex "$past", $P294
  if_283_end:
.annotate "line", 78
    find_lex $P297, "$ml"
    if $P297, if_296
    set $P295, $P297
    goto if_296_end
  if_296:
.annotate "line", 79
    get_hll_global $P298, ["PAST"], "Op"
    find_lex $P299, "$ml"
    unless_null $P299, vivify_182
    new $P299, "Hash"
  vivify_182:
    set $P300, $P299["cond"]
    unless_null $P300, vivify_183
    new $P300, "Undef"
  vivify_183:
    $P301 = $P300."ast"()
    find_lex $P302, "$past"
    find_lex $P303, "$ml"
    unless_null $P303, vivify_184
    new $P303, "Hash"
  vivify_184:
    set $P304, $P303["sym"]
    unless_null $P304, vivify_185
    new $P304, "Undef"
  vivify_185:
    set $S305, $P304
    find_lex $P306, "$/"
    $P307 = $P298."new"($P301, $P302, $S305 :named("pasttype"), $P306 :named("node"))
    store_lex "$past", $P307
.annotate "line", 78
    set $P295, $P307
  if_296_end:
.annotate "line", 71
    .return ($P295)
.end


.namespace ["NQP";"Actions"]
.sub "xblock"  :subid("26_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_322
.annotate "line", 87
    new $P321, 'ExceptionHandler'
    set_addr $P321, control_320
    $P321."handle_types"(58)
    push_eh $P321
    .lex "self", self
    .lex "$/", param_322
.annotate "line", 88
    find_lex $P323, "$/"
    get_hll_global $P324, ["PAST"], "Op"
    find_lex $P325, "$/"
    unless_null $P325, vivify_186
    new $P325, "Hash"
  vivify_186:
    set $P326, $P325["EXPR"]
    unless_null $P326, vivify_187
    new $P326, "Undef"
  vivify_187:
    $P327 = $P326."ast"()
    find_lex $P328, "$/"
    unless_null $P328, vivify_188
    new $P328, "Hash"
  vivify_188:
    set $P329, $P328["pblock"]
    unless_null $P329, vivify_189
    new $P329, "Undef"
  vivify_189:
    $P330 = $P329."ast"()
    find_lex $P331, "$/"
    $P332 = $P324."new"($P327, $P330, "if" :named("pasttype"), $P331 :named("node"))
    $P333 = $P323."!make"($P332)
.annotate "line", 87
    .return ($P333)
  control_320:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P334, exception, "payload"
    .return ($P334)
.end


.namespace ["NQP";"Actions"]
.sub "pblock"  :subid("27_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_338
.annotate "line", 91
    new $P337, 'ExceptionHandler'
    set_addr $P337, control_336
    $P337."handle_types"(58)
    push_eh $P337
    .lex "self", self
    .lex "$/", param_338
.annotate "line", 92
    find_lex $P339, "$/"
    find_lex $P340, "$/"
    unless_null $P340, vivify_190
    new $P340, "Hash"
  vivify_190:
    set $P341, $P340["blockoid"]
    unless_null $P341, vivify_191
    new $P341, "Undef"
  vivify_191:
    $P342 = $P341."ast"()
    $P343 = $P339."!make"($P342)
.annotate "line", 91
    .return ($P343)
  control_336:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P344, exception, "payload"
    .return ($P344)
.end


.namespace ["NQP";"Actions"]
.sub "block"  :subid("28_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_348
.annotate "line", 95
    new $P347, 'ExceptionHandler'
    set_addr $P347, control_346
    $P347."handle_types"(58)
    push_eh $P347
    .lex "self", self
    .lex "$/", param_348
.annotate "line", 96
    find_lex $P349, "$/"
    find_lex $P350, "$/"
    unless_null $P350, vivify_192
    new $P350, "Hash"
  vivify_192:
    set $P351, $P350["blockoid"]
    unless_null $P351, vivify_193
    new $P351, "Undef"
  vivify_193:
    $P352 = $P351."ast"()
    $P353 = $P349."!make"($P352)
.annotate "line", 95
    .return ($P353)
  control_346:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P354, exception, "payload"
    .return ($P354)
.end


.namespace ["NQP";"Actions"]
.sub "blockoid"  :subid("29_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_358
.annotate "line", 99
    new $P357, 'ExceptionHandler'
    set_addr $P357, control_356
    $P357."handle_types"(58)
    push_eh $P357
    .lex "self", self
    .lex "$/", param_358
.annotate "line", 100
    new $P359, "Undef"
    .lex "$past", $P359
.annotate "line", 101
    new $P360, "Undef"
    .lex "$BLOCK", $P360
.annotate "line", 100
    find_lex $P361, "$/"
    unless_null $P361, vivify_194
    new $P361, "Hash"
  vivify_194:
    set $P362, $P361["statementlist"]
    unless_null $P362, vivify_195
    new $P362, "Undef"
  vivify_195:
    $P363 = $P362."ast"()
    store_lex "$past", $P363
.annotate "line", 101
    get_global $P364, "@BLOCK"
    $P365 = $P364."shift"()
    store_lex "$BLOCK", $P365
.annotate "line", 102
    find_lex $P366, "$BLOCK"
    find_lex $P367, "$past"
    $P366."push"($P367)
.annotate "line", 103
    find_lex $P368, "$BLOCK"
    find_lex $P369, "$/"
    $P368."node"($P369)
.annotate "line", 104
    find_lex $P370, "$/"
    find_lex $P371, "$BLOCK"
    $P372 = $P370."!make"($P371)
.annotate "line", 99
    .return ($P372)
  control_356:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P373, exception, "payload"
    .return ($P373)
.end


.namespace ["NQP";"Actions"]
.sub "newpad"  :subid("30_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_377
.annotate "line", 107
    new $P376, 'ExceptionHandler'
    set_addr $P376, control_375
    $P376."handle_types"(58)
    push_eh $P376
    .lex "self", self
    .lex "$/", param_377
.annotate "line", 108
    get_global $P378, "@BLOCK"
    unless_null $P378, vivify_196
    new $P378, "ResizablePMCArray"
    set_global "@BLOCK", $P378
  vivify_196:
.annotate "line", 107
    get_global $P379, "@BLOCK"
.annotate "line", 109
    get_global $P380, "@BLOCK"
    get_hll_global $P381, ["PAST"], "Block"
    get_hll_global $P382, ["PAST"], "Stmts"
    $P383 = $P382."new"()
    $P384 = $P381."new"($P383)
    $P385 = $P380."unshift"($P384)
.annotate "line", 107
    .return ($P385)
  control_375:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P386, exception, "payload"
    .return ($P386)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<if>"  :subid("31_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_390
.annotate "line", 114
    .const 'Sub' $P418 = "32_1266334201.91429" 
    capture_lex $P418
    new $P389, 'ExceptionHandler'
    set_addr $P389, control_388
    $P389."handle_types"(58)
    push_eh $P389
    .lex "self", self
    .lex "$/", param_390
.annotate "line", 115
    new $P391, "Undef"
    .lex "$count", $P391
.annotate "line", 116
    new $P392, "Undef"
    .lex "$past", $P392
.annotate "line", 115
    find_lex $P393, "$/"
    unless_null $P393, vivify_197
    new $P393, "Hash"
  vivify_197:
    set $P394, $P393["xblock"]
    unless_null $P394, vivify_198
    new $P394, "Undef"
  vivify_198:
    set $N395, $P394
    new $P396, 'Float'
    set $P396, $N395
    sub $P397, $P396, 1
    store_lex "$count", $P397
.annotate "line", 116
    find_lex $P398, "$count"
    set $I399, $P398
    find_lex $P400, "$/"
    unless_null $P400, vivify_199
    new $P400, "Hash"
  vivify_199:
    set $P401, $P400["xblock"]
    unless_null $P401, vivify_200
    new $P401, "ResizablePMCArray"
  vivify_200:
    set $P402, $P401[$I399]
    unless_null $P402, vivify_201
    new $P402, "Undef"
  vivify_201:
    $P403 = $P402."ast"()
    $P404 = "xblock_immediate"($P403)
    store_lex "$past", $P404
.annotate "line", 117
    find_lex $P406, "$/"
    unless_null $P406, vivify_202
    new $P406, "Hash"
  vivify_202:
    set $P407, $P406["else"]
    unless_null $P407, vivify_203
    new $P407, "Undef"
  vivify_203:
    unless $P407, if_405_end
.annotate "line", 118
    find_lex $P408, "$past"
    find_lex $P409, "$/"
    unless_null $P409, vivify_204
    new $P409, "Hash"
  vivify_204:
    set $P410, $P409["else"]
    unless_null $P410, vivify_205
    new $P410, "ResizablePMCArray"
  vivify_205:
    set $P411, $P410[0]
    unless_null $P411, vivify_206
    new $P411, "Undef"
  vivify_206:
    $P412 = $P411."ast"()
    $P413 = "block_immediate"($P412)
    $P408."push"($P413)
  if_405_end:
.annotate "line", 121
    new $P434, 'ExceptionHandler'
    set_addr $P434, loop433_handler
    $P434."handle_types"(65, 67, 66)
    push_eh $P434
  loop433_test:
    find_lex $P414, "$count"
    set $N415, $P414
    isgt $I416, $N415, 0.0
    unless $I416, loop433_done
  loop433_redo:
    .const 'Sub' $P418 = "32_1266334201.91429" 
    capture_lex $P418
    $P418()
  loop433_next:
    goto loop433_test
  loop433_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P435, exception, 'type'
    eq $P435, 65, loop433_next
    eq $P435, 67, loop433_redo
  loop433_done:
    pop_eh 
.annotate "line", 127
    find_lex $P436, "$/"
    find_lex $P437, "$past"
    $P438 = $P436."!make"($P437)
.annotate "line", 114
    .return ($P438)
  control_388:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P439, exception, "payload"
    .return ($P439)
.end


.namespace ["NQP";"Actions"]
.sub "_block417"  :anon :subid("32_1266334201.91429") :outer("31_1266334201.91429")
.annotate "line", 123
    new $P419, "Undef"
    .lex "$else", $P419
.annotate "line", 121
    find_lex $P420, "$count"
    clone $P421, $P420
    dec $P420
.annotate "line", 123
    find_lex $P422, "$past"
    store_lex "$else", $P422
.annotate "line", 124
    find_lex $P423, "$count"
    set $I424, $P423
    find_lex $P425, "$/"
    unless_null $P425, vivify_207
    new $P425, "Hash"
  vivify_207:
    set $P426, $P425["xblock"]
    unless_null $P426, vivify_208
    new $P426, "ResizablePMCArray"
  vivify_208:
    set $P427, $P426[$I424]
    unless_null $P427, vivify_209
    new $P427, "Undef"
  vivify_209:
    $P428 = $P427."ast"()
    $P429 = "xblock_immediate"($P428)
    store_lex "$past", $P429
.annotate "line", 125
    find_lex $P430, "$past"
    find_lex $P431, "$else"
    $P432 = $P430."push"($P431)
.annotate "line", 121
    .return ($P432)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<unless>"  :subid("33_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_443
.annotate "line", 130
    new $P442, 'ExceptionHandler'
    set_addr $P442, control_441
    $P442."handle_types"(58)
    push_eh $P442
    .lex "self", self
    .lex "$/", param_443
.annotate "line", 131
    new $P444, "Undef"
    .lex "$past", $P444
    find_lex $P445, "$/"
    unless_null $P445, vivify_210
    new $P445, "Hash"
  vivify_210:
    set $P446, $P445["xblock"]
    unless_null $P446, vivify_211
    new $P446, "Undef"
  vivify_211:
    $P447 = $P446."ast"()
    $P448 = "xblock_immediate"($P447)
    store_lex "$past", $P448
.annotate "line", 132
    find_lex $P449, "$past"
    $P449."pasttype"("unless")
.annotate "line", 133
    find_lex $P450, "$/"
    find_lex $P451, "$past"
    $P452 = $P450."!make"($P451)
.annotate "line", 130
    .return ($P452)
  control_441:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P453, exception, "payload"
    .return ($P453)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<while>"  :subid("34_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_457
.annotate "line", 136
    new $P456, 'ExceptionHandler'
    set_addr $P456, control_455
    $P456."handle_types"(58)
    push_eh $P456
    .lex "self", self
    .lex "$/", param_457
.annotate "line", 137
    new $P458, "Undef"
    .lex "$past", $P458
    find_lex $P459, "$/"
    unless_null $P459, vivify_212
    new $P459, "Hash"
  vivify_212:
    set $P460, $P459["xblock"]
    unless_null $P460, vivify_213
    new $P460, "Undef"
  vivify_213:
    $P461 = $P460."ast"()
    $P462 = "xblock_immediate"($P461)
    store_lex "$past", $P462
.annotate "line", 138
    find_lex $P463, "$past"
    find_lex $P464, "$/"
    unless_null $P464, vivify_214
    new $P464, "Hash"
  vivify_214:
    set $P465, $P464["sym"]
    unless_null $P465, vivify_215
    new $P465, "Undef"
  vivify_215:
    set $S466, $P465
    $P463."pasttype"($S466)
.annotate "line", 139
    find_lex $P467, "$/"
    find_lex $P468, "$past"
    $P469 = $P467."!make"($P468)
.annotate "line", 136
    .return ($P469)
  control_455:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P470, exception, "payload"
    .return ($P470)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<repeat>"  :subid("35_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_474
.annotate "line", 142
    new $P473, 'ExceptionHandler'
    set_addr $P473, control_472
    $P473."handle_types"(58)
    push_eh $P473
    .lex "self", self
    .lex "$/", param_474
.annotate "line", 143
    new $P475, "Undef"
    .lex "$pasttype", $P475
.annotate "line", 144
    new $P476, "Undef"
    .lex "$past", $P476
.annotate "line", 143
    new $P477, "String"
    assign $P477, "repeat_"
    find_lex $P478, "$/"
    unless_null $P478, vivify_216
    new $P478, "Hash"
  vivify_216:
    set $P479, $P478["wu"]
    unless_null $P479, vivify_217
    new $P479, "Undef"
  vivify_217:
    set $S480, $P479
    concat $P481, $P477, $S480
    store_lex "$pasttype", $P481
    find_lex $P482, "$past"
.annotate "line", 145
    find_lex $P484, "$/"
    unless_null $P484, vivify_218
    new $P484, "Hash"
  vivify_218:
    set $P485, $P484["xblock"]
    unless_null $P485, vivify_219
    new $P485, "Undef"
  vivify_219:
    if $P485, if_483
.annotate "line", 150
    get_hll_global $P492, ["PAST"], "Op"
    find_lex $P493, "$/"
    unless_null $P493, vivify_220
    new $P493, "Hash"
  vivify_220:
    set $P494, $P493["EXPR"]
    unless_null $P494, vivify_221
    new $P494, "Undef"
  vivify_221:
    $P495 = $P494."ast"()
    find_lex $P496, "$/"
    unless_null $P496, vivify_222
    new $P496, "Hash"
  vivify_222:
    set $P497, $P496["pblock"]
    unless_null $P497, vivify_223
    new $P497, "Undef"
  vivify_223:
    $P498 = $P497."ast"()
    $P499 = "block_immediate"($P498)
    find_lex $P500, "$pasttype"
    find_lex $P501, "$/"
    $P502 = $P492."new"($P495, $P499, $P500 :named("pasttype"), $P501 :named("node"))
    store_lex "$past", $P502
.annotate "line", 149
    goto if_483_end
  if_483:
.annotate "line", 146
    find_lex $P486, "$/"
    unless_null $P486, vivify_224
    new $P486, "Hash"
  vivify_224:
    set $P487, $P486["xblock"]
    unless_null $P487, vivify_225
    new $P487, "Undef"
  vivify_225:
    $P488 = $P487."ast"()
    $P489 = "xblock_immediate"($P488)
    store_lex "$past", $P489
.annotate "line", 147
    find_lex $P490, "$past"
    find_lex $P491, "$pasttype"
    $P490."pasttype"($P491)
  if_483_end:
.annotate "line", 153
    find_lex $P503, "$/"
    find_lex $P504, "$past"
    $P505 = $P503."!make"($P504)
.annotate "line", 142
    .return ($P505)
  control_472:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P506, exception, "payload"
    .return ($P506)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<for>"  :subid("36_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_510
.annotate "line", 156
    new $P509, 'ExceptionHandler'
    set_addr $P509, control_508
    $P509."handle_types"(58)
    push_eh $P509
    .lex "self", self
    .lex "$/", param_510
.annotate "line", 157
    new $P511, "Undef"
    .lex "$past", $P511
.annotate "line", 159
    new $P512, "Undef"
    .lex "$block", $P512
.annotate "line", 157
    find_lex $P513, "$/"
    unless_null $P513, vivify_226
    new $P513, "Hash"
  vivify_226:
    set $P514, $P513["xblock"]
    unless_null $P514, vivify_227
    new $P514, "Undef"
  vivify_227:
    $P515 = $P514."ast"()
    store_lex "$past", $P515
.annotate "line", 158
    find_lex $P516, "$past"
    $P516."pasttype"("for")
.annotate "line", 159
    find_lex $P517, "$past"
    unless_null $P517, vivify_228
    new $P517, "ResizablePMCArray"
  vivify_228:
    set $P518, $P517[1]
    unless_null $P518, vivify_229
    new $P518, "Undef"
  vivify_229:
    store_lex "$block", $P518
.annotate "line", 160
    find_lex $P520, "$block"
    $P521 = $P520."arity"()
    if $P521, unless_519_end
.annotate "line", 161
    find_lex $P522, "$block"
    unless_null $P522, vivify_230
    new $P522, "ResizablePMCArray"
  vivify_230:
    set $P523, $P522[0]
    unless_null $P523, vivify_231
    new $P523, "Undef"
  vivify_231:
    get_hll_global $P524, ["PAST"], "Var"
    $P525 = $P524."new"("$_" :named("name"), "parameter" :named("scope"))
    $P523."push"($P525)
.annotate "line", 162
    find_lex $P526, "$block"
    $P526."symbol"("$_", "lexical" :named("scope"))
.annotate "line", 163
    find_lex $P527, "$block"
    $P527."arity"(1)
  unless_519_end:
.annotate "line", 165
    find_lex $P528, "$block"
    $P528."blocktype"("immediate")
.annotate "line", 166
    find_lex $P529, "$/"
    find_lex $P530, "$past"
    $P531 = $P529."!make"($P530)
.annotate "line", 156
    .return ($P531)
  control_508:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P532, exception, "payload"
    .return ($P532)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<return>"  :subid("37_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_536
.annotate "line", 169
    new $P535, 'ExceptionHandler'
    set_addr $P535, control_534
    $P535."handle_types"(58)
    push_eh $P535
    .lex "self", self
    .lex "$/", param_536
.annotate "line", 170
    find_lex $P537, "$/"
    get_hll_global $P538, ["PAST"], "Op"
    find_lex $P539, "$/"
    unless_null $P539, vivify_232
    new $P539, "Hash"
  vivify_232:
    set $P540, $P539["EXPR"]
    unless_null $P540, vivify_233
    new $P540, "Undef"
  vivify_233:
    $P541 = $P540."ast"()
    find_lex $P542, "$/"
    $P543 = $P538."new"($P541, "return" :named("pasttype"), $P542 :named("node"))
    $P544 = $P537."!make"($P543)
.annotate "line", 169
    .return ($P544)
  control_534:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P545, exception, "payload"
    .return ($P545)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<CATCH>"  :subid("38_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_549
.annotate "line", 173
    new $P548, 'ExceptionHandler'
    set_addr $P548, control_547
    $P548."handle_types"(58)
    push_eh $P548
    .lex "self", self
    .lex "$/", param_549
.annotate "line", 174
    new $P550, "Undef"
    .lex "$block", $P550
    find_lex $P551, "$/"
    unless_null $P551, vivify_234
    new $P551, "Hash"
  vivify_234:
    set $P552, $P551["block"]
    unless_null $P552, vivify_235
    new $P552, "Undef"
  vivify_235:
    $P553 = $P552."ast"()
    store_lex "$block", $P553
.annotate "line", 175
    find_lex $P554, "$/"
    find_lex $P555, "$block"
    "push_block_handler"($P554, $P555)
.annotate "line", 176
    get_global $P556, "@BLOCK"
    unless_null $P556, vivify_236
    new $P556, "ResizablePMCArray"
  vivify_236:
    set $P557, $P556[0]
    unless_null $P557, vivify_237
    new $P557, "Undef"
  vivify_237:
    $P558 = $P557."handlers"()
    set $P559, $P558[0]
    unless_null $P559, vivify_238
    new $P559, "Undef"
  vivify_238:
    $P559."handle_types_except"("CONTROL")
.annotate "line", 177
    find_lex $P560, "$/"
    get_hll_global $P561, ["PAST"], "Stmts"
    find_lex $P562, "$/"
    $P563 = $P561."new"($P562 :named("node"))
    $P564 = $P560."!make"($P563)
.annotate "line", 173
    .return ($P564)
  control_547:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P565, exception, "payload"
    .return ($P565)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<CONTROL>"  :subid("39_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_569
.annotate "line", 180
    new $P568, 'ExceptionHandler'
    set_addr $P568, control_567
    $P568."handle_types"(58)
    push_eh $P568
    .lex "self", self
    .lex "$/", param_569
.annotate "line", 181
    new $P570, "Undef"
    .lex "$block", $P570
    find_lex $P571, "$/"
    unless_null $P571, vivify_239
    new $P571, "Hash"
  vivify_239:
    set $P572, $P571["block"]
    unless_null $P572, vivify_240
    new $P572, "Undef"
  vivify_240:
    $P573 = $P572."ast"()
    store_lex "$block", $P573
.annotate "line", 182
    find_lex $P574, "$/"
    find_lex $P575, "$block"
    "push_block_handler"($P574, $P575)
.annotate "line", 183
    get_global $P576, "@BLOCK"
    unless_null $P576, vivify_241
    new $P576, "ResizablePMCArray"
  vivify_241:
    set $P577, $P576[0]
    unless_null $P577, vivify_242
    new $P577, "Undef"
  vivify_242:
    $P578 = $P577."handlers"()
    set $P579, $P578[0]
    unless_null $P579, vivify_243
    new $P579, "Undef"
  vivify_243:
    $P579."handle_types"("CONTROL")
.annotate "line", 184
    find_lex $P580, "$/"
    get_hll_global $P581, ["PAST"], "Stmts"
    find_lex $P582, "$/"
    $P583 = $P581."new"($P582 :named("node"))
    $P584 = $P580."!make"($P583)
.annotate "line", 180
    .return ($P584)
  control_567:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P585, exception, "payload"
    .return ($P585)
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<INIT>"  :subid("40_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_590
.annotate "line", 224
    new $P589, 'ExceptionHandler'
    set_addr $P589, control_588
    $P589."handle_types"(58)
    push_eh $P589
    .lex "self", self
    .lex "$/", param_590
.annotate "line", 225
    get_global $P591, "@BLOCK"
    unless_null $P591, vivify_244
    new $P591, "ResizablePMCArray"
  vivify_244:
    set $P592, $P591[0]
    unless_null $P592, vivify_245
    new $P592, "Undef"
  vivify_245:
    $P593 = $P592."loadinit"()
    find_lex $P594, "$/"
    unless_null $P594, vivify_246
    new $P594, "Hash"
  vivify_246:
    set $P595, $P594["blorst"]
    unless_null $P595, vivify_247
    new $P595, "Undef"
  vivify_247:
    $P596 = $P595."ast"()
    $P593."push"($P596)
.annotate "line", 226
    find_lex $P597, "$/"
    get_hll_global $P598, ["PAST"], "Stmts"
    find_lex $P599, "$/"
    $P600 = $P598."new"($P599 :named("node"))
    $P601 = $P597."!make"($P600)
.annotate "line", 224
    .return ($P601)
  control_588:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P602, exception, "payload"
    .return ($P602)
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<try>"  :subid("41_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_606
.annotate "line", 229
    new $P605, 'ExceptionHandler'
    set_addr $P605, control_604
    $P605."handle_types"(58)
    push_eh $P605
    .lex "self", self
    .lex "$/", param_606
.annotate "line", 230
    new $P607, "Undef"
    .lex "$past", $P607
    find_lex $P608, "$/"
    unless_null $P608, vivify_248
    new $P608, "Hash"
  vivify_248:
    set $P609, $P608["blorst"]
    unless_null $P609, vivify_249
    new $P609, "Undef"
  vivify_249:
    $P610 = $P609."ast"()
    store_lex "$past", $P610
.annotate "line", 231
    find_lex $P612, "$past"
    $S613 = $P612."WHAT"()
    isne $I614, $S613, "PAST::Block()"
    unless $I614, if_611_end
.annotate "line", 232
    get_hll_global $P615, ["PAST"], "Block"
    find_lex $P616, "$past"
    find_lex $P617, "$/"
    $P618 = $P615."new"($P616, "immediate" :named("blocktype"), $P617 :named("node"))
    store_lex "$past", $P618
  if_611_end:
.annotate "line", 234
    find_lex $P620, "$past"
    $P621 = $P620."handlers"()
    if $P621, unless_619_end
.annotate "line", 235
    find_lex $P622, "$past"
    get_hll_global $P623, ["PAST"], "Control"
.annotate "line", 237
    get_hll_global $P624, ["PAST"], "Stmts"
.annotate "line", 238
    get_hll_global $P625, ["PAST"], "Op"
.annotate "line", 239
    get_hll_global $P626, ["PAST"], "Var"
.annotate "line", 240
    get_hll_global $P627, ["PAST"], "Var"
    $P628 = $P627."new"("register" :named("scope"), "exception" :named("name"))
    $P629 = $P626."new"($P628, "handled", "keyed" :named("scope"))
.annotate "line", 239
    $P630 = $P625."new"($P629, 1, "bind" :named("pasttype"))
.annotate "line", 238
    $P631 = $P624."new"($P630)
.annotate "line", 237
    $P632 = $P623."new"($P631, "CONTROL" :named("handle_types_except"))
.annotate "line", 235
    new $P633, "ResizablePMCArray"
    push $P633, $P632
    $P622."handlers"($P633)
  unless_619_end:
.annotate "line", 249
    find_lex $P634, "$/"
    find_lex $P635, "$past"
    $P636 = $P634."!make"($P635)
.annotate "line", 229
    .return ($P636)
  control_604:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P637, exception, "payload"
    .return ($P637)
.end


.namespace ["NQP";"Actions"]
.sub "blorst"  :subid("42_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_641
.annotate "line", 252
    new $P640, 'ExceptionHandler'
    set_addr $P640, control_639
    $P640."handle_types"(58)
    push_eh $P640
    .lex "self", self
    .lex "$/", param_641
.annotate "line", 253
    find_lex $P642, "$/"
.annotate "line", 254
    find_lex $P645, "$/"
    unless_null $P645, vivify_250
    new $P645, "Hash"
  vivify_250:
    set $P646, $P645["block"]
    unless_null $P646, vivify_251
    new $P646, "Undef"
  vivify_251:
    if $P646, if_644
.annotate "line", 255
    find_lex $P651, "$/"
    unless_null $P651, vivify_252
    new $P651, "Hash"
  vivify_252:
    set $P652, $P651["statement"]
    unless_null $P652, vivify_253
    new $P652, "Undef"
  vivify_253:
    $P653 = $P652."ast"()
    set $P643, $P653
.annotate "line", 254
    goto if_644_end
  if_644:
    find_lex $P647, "$/"
    unless_null $P647, vivify_254
    new $P647, "Hash"
  vivify_254:
    set $P648, $P647["block"]
    unless_null $P648, vivify_255
    new $P648, "Undef"
  vivify_255:
    $P649 = $P648."ast"()
    $P650 = "block_immediate"($P649)
    set $P643, $P650
  if_644_end:
    $P654 = $P642."!make"($P643)
.annotate "line", 252
    .return ($P654)
  control_639:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P655, exception, "payload"
    .return ($P655)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<if>"  :subid("43_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_659
.annotate "line", 260
    new $P658, 'ExceptionHandler'
    set_addr $P658, control_657
    $P658."handle_types"(58)
    push_eh $P658
    .lex "self", self
    .lex "$/", param_659
    find_lex $P660, "$/"
    find_lex $P661, "$/"
    unless_null $P661, vivify_256
    new $P661, "Hash"
  vivify_256:
    set $P662, $P661["cond"]
    unless_null $P662, vivify_257
    new $P662, "Undef"
  vivify_257:
    $P663 = $P662."ast"()
    $P664 = $P660."!make"($P663)
    .return ($P664)
  control_657:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P665, exception, "payload"
    .return ($P665)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<unless>"  :subid("44_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_669
.annotate "line", 261
    new $P668, 'ExceptionHandler'
    set_addr $P668, control_667
    $P668."handle_types"(58)
    push_eh $P668
    .lex "self", self
    .lex "$/", param_669
    find_lex $P670, "$/"
    find_lex $P671, "$/"
    unless_null $P671, vivify_258
    new $P671, "Hash"
  vivify_258:
    set $P672, $P671["cond"]
    unless_null $P672, vivify_259
    new $P672, "Undef"
  vivify_259:
    $P673 = $P672."ast"()
    $P674 = $P670."!make"($P673)
    .return ($P674)
  control_667:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P675, exception, "payload"
    .return ($P675)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<while>"  :subid("45_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_679
.annotate "line", 263
    new $P678, 'ExceptionHandler'
    set_addr $P678, control_677
    $P678."handle_types"(58)
    push_eh $P678
    .lex "self", self
    .lex "$/", param_679
    find_lex $P680, "$/"
    find_lex $P681, "$/"
    unless_null $P681, vivify_260
    new $P681, "Hash"
  vivify_260:
    set $P682, $P681["cond"]
    unless_null $P682, vivify_261
    new $P682, "Undef"
  vivify_261:
    $P683 = $P682."ast"()
    $P684 = $P680."!make"($P683)
    .return ($P684)
  control_677:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P685, exception, "payload"
    .return ($P685)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<until>"  :subid("46_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_689
.annotate "line", 264
    new $P688, 'ExceptionHandler'
    set_addr $P688, control_687
    $P688."handle_types"(58)
    push_eh $P688
    .lex "self", self
    .lex "$/", param_689
    find_lex $P690, "$/"
    find_lex $P691, "$/"
    unless_null $P691, vivify_262
    new $P691, "Hash"
  vivify_262:
    set $P692, $P691["cond"]
    unless_null $P692, vivify_263
    new $P692, "Undef"
  vivify_263:
    $P693 = $P692."ast"()
    $P694 = $P690."!make"($P693)
    .return ($P694)
  control_687:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P695, exception, "payload"
    .return ($P695)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<fatarrow>"  :subid("47_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_699
.annotate "line", 268
    new $P698, 'ExceptionHandler'
    set_addr $P698, control_697
    $P698."handle_types"(58)
    push_eh $P698
    .lex "self", self
    .lex "$/", param_699
    find_lex $P700, "$/"
    find_lex $P701, "$/"
    unless_null $P701, vivify_264
    new $P701, "Hash"
  vivify_264:
    set $P702, $P701["fatarrow"]
    unless_null $P702, vivify_265
    new $P702, "Undef"
  vivify_265:
    $P703 = $P702."ast"()
    $P704 = $P700."!make"($P703)
    .return ($P704)
  control_697:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P705, exception, "payload"
    .return ($P705)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<colonpair>"  :subid("48_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_709
.annotate "line", 269
    new $P708, 'ExceptionHandler'
    set_addr $P708, control_707
    $P708."handle_types"(58)
    push_eh $P708
    .lex "self", self
    .lex "$/", param_709
    find_lex $P710, "$/"
    find_lex $P711, "$/"
    unless_null $P711, vivify_266
    new $P711, "Hash"
  vivify_266:
    set $P712, $P711["colonpair"]
    unless_null $P712, vivify_267
    new $P712, "Undef"
  vivify_267:
    $P713 = $P712."ast"()
    $P714 = $P710."!make"($P713)
    .return ($P714)
  control_707:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P715, exception, "payload"
    .return ($P715)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<variable>"  :subid("49_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_719
.annotate "line", 270
    new $P718, 'ExceptionHandler'
    set_addr $P718, control_717
    $P718."handle_types"(58)
    push_eh $P718
    .lex "self", self
    .lex "$/", param_719
    find_lex $P720, "$/"
    find_lex $P721, "$/"
    unless_null $P721, vivify_268
    new $P721, "Hash"
  vivify_268:
    set $P722, $P721["variable"]
    unless_null $P722, vivify_269
    new $P722, "Undef"
  vivify_269:
    $P723 = $P722."ast"()
    $P724 = $P720."!make"($P723)
    .return ($P724)
  control_717:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P725, exception, "payload"
    .return ($P725)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<package_declarator>"  :subid("50_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_729
.annotate "line", 271
    new $P728, 'ExceptionHandler'
    set_addr $P728, control_727
    $P728."handle_types"(58)
    push_eh $P728
    .lex "self", self
    .lex "$/", param_729
    find_lex $P730, "$/"
    find_lex $P731, "$/"
    unless_null $P731, vivify_270
    new $P731, "Hash"
  vivify_270:
    set $P732, $P731["package_declarator"]
    unless_null $P732, vivify_271
    new $P732, "Undef"
  vivify_271:
    $P733 = $P732."ast"()
    $P734 = $P730."!make"($P733)
    .return ($P734)
  control_727:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P735, exception, "payload"
    .return ($P735)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<scope_declarator>"  :subid("51_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_739
.annotate "line", 272
    new $P738, 'ExceptionHandler'
    set_addr $P738, control_737
    $P738."handle_types"(58)
    push_eh $P738
    .lex "self", self
    .lex "$/", param_739
    find_lex $P740, "$/"
    find_lex $P741, "$/"
    unless_null $P741, vivify_272
    new $P741, "Hash"
  vivify_272:
    set $P742, $P741["scope_declarator"]
    unless_null $P742, vivify_273
    new $P742, "Undef"
  vivify_273:
    $P743 = $P742."ast"()
    $P744 = $P740."!make"($P743)
    .return ($P744)
  control_737:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P745, exception, "payload"
    .return ($P745)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<routine_declarator>"  :subid("52_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_749
.annotate "line", 273
    new $P748, 'ExceptionHandler'
    set_addr $P748, control_747
    $P748."handle_types"(58)
    push_eh $P748
    .lex "self", self
    .lex "$/", param_749
    find_lex $P750, "$/"
    find_lex $P751, "$/"
    unless_null $P751, vivify_274
    new $P751, "Hash"
  vivify_274:
    set $P752, $P751["routine_declarator"]
    unless_null $P752, vivify_275
    new $P752, "Undef"
  vivify_275:
    $P753 = $P752."ast"()
    $P754 = $P750."!make"($P753)
    .return ($P754)
  control_747:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P755, exception, "payload"
    .return ($P755)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<regex_declarator>"  :subid("53_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_759
.annotate "line", 274
    new $P758, 'ExceptionHandler'
    set_addr $P758, control_757
    $P758."handle_types"(58)
    push_eh $P758
    .lex "self", self
    .lex "$/", param_759
    find_lex $P760, "$/"
    find_lex $P761, "$/"
    unless_null $P761, vivify_276
    new $P761, "Hash"
  vivify_276:
    set $P762, $P761["regex_declarator"]
    unless_null $P762, vivify_277
    new $P762, "Undef"
  vivify_277:
    $P763 = $P762."ast"()
    $P764 = $P760."!make"($P763)
    .return ($P764)
  control_757:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P765, exception, "payload"
    .return ($P765)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<statement_prefix>"  :subid("54_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_769
.annotate "line", 275
    new $P768, 'ExceptionHandler'
    set_addr $P768, control_767
    $P768."handle_types"(58)
    push_eh $P768
    .lex "self", self
    .lex "$/", param_769
    find_lex $P770, "$/"
    find_lex $P771, "$/"
    unless_null $P771, vivify_278
    new $P771, "Hash"
  vivify_278:
    set $P772, $P771["statement_prefix"]
    unless_null $P772, vivify_279
    new $P772, "Undef"
  vivify_279:
    $P773 = $P772."ast"()
    $P774 = $P770."!make"($P773)
    .return ($P774)
  control_767:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P775, exception, "payload"
    .return ($P775)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<lambda>"  :subid("55_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_779
.annotate "line", 276
    new $P778, 'ExceptionHandler'
    set_addr $P778, control_777
    $P778."handle_types"(58)
    push_eh $P778
    .lex "self", self
    .lex "$/", param_779
    find_lex $P780, "$/"
    find_lex $P781, "$/"
    unless_null $P781, vivify_280
    new $P781, "Hash"
  vivify_280:
    set $P782, $P781["pblock"]
    unless_null $P782, vivify_281
    new $P782, "Undef"
  vivify_281:
    $P783 = $P782."ast"()
    $P784 = $P780."!make"($P783)
    .return ($P784)
  control_777:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P785, exception, "payload"
    .return ($P785)
.end


.namespace ["NQP";"Actions"]
.sub "fatarrow"  :subid("56_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_789
.annotate "line", 278
    new $P788, 'ExceptionHandler'
    set_addr $P788, control_787
    $P788."handle_types"(58)
    push_eh $P788
    .lex "self", self
    .lex "$/", param_789
.annotate "line", 279
    new $P790, "Undef"
    .lex "$past", $P790
    find_lex $P791, "$/"
    unless_null $P791, vivify_282
    new $P791, "Hash"
  vivify_282:
    set $P792, $P791["val"]
    unless_null $P792, vivify_283
    new $P792, "Undef"
  vivify_283:
    $P793 = $P792."ast"()
    store_lex "$past", $P793
.annotate "line", 280
    find_lex $P794, "$past"
    find_lex $P795, "$/"
    unless_null $P795, vivify_284
    new $P795, "Hash"
  vivify_284:
    set $P796, $P795["key"]
    unless_null $P796, vivify_285
    new $P796, "Undef"
  vivify_285:
    $P797 = $P796."Str"()
    $P794."named"($P797)
.annotate "line", 281
    find_lex $P798, "$/"
    find_lex $P799, "$past"
    $P800 = $P798."!make"($P799)
.annotate "line", 278
    .return ($P800)
  control_787:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P801, exception, "payload"
    .return ($P801)
.end


.namespace ["NQP";"Actions"]
.sub "colonpair"  :subid("57_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_805
.annotate "line", 284
    new $P804, 'ExceptionHandler'
    set_addr $P804, control_803
    $P804."handle_types"(58)
    push_eh $P804
    .lex "self", self
    .lex "$/", param_805
.annotate "line", 285
    new $P806, "Undef"
    .lex "$past", $P806
.annotate "line", 286
    find_lex $P809, "$/"
    unless_null $P809, vivify_286
    new $P809, "Hash"
  vivify_286:
    set $P810, $P809["circumfix"]
    unless_null $P810, vivify_287
    new $P810, "Undef"
  vivify_287:
    if $P810, if_808
.annotate "line", 287
    get_hll_global $P815, ["PAST"], "Val"
    find_lex $P816, "$/"
    unless_null $P816, vivify_288
    new $P816, "Hash"
  vivify_288:
    set $P817, $P816["not"]
    unless_null $P817, vivify_289
    new $P817, "Undef"
  vivify_289:
    isfalse $I818, $P817
    $P819 = $P815."new"($I818 :named("value"))
    set $P807, $P819
.annotate "line", 286
    goto if_808_end
  if_808:
    find_lex $P811, "$/"
    unless_null $P811, vivify_290
    new $P811, "Hash"
  vivify_290:
    set $P812, $P811["circumfix"]
    unless_null $P812, vivify_291
    new $P812, "ResizablePMCArray"
  vivify_291:
    set $P813, $P812[0]
    unless_null $P813, vivify_292
    new $P813, "Undef"
  vivify_292:
    $P814 = $P813."ast"()
    set $P807, $P814
  if_808_end:
    store_lex "$past", $P807
.annotate "line", 288
    find_lex $P820, "$past"
    find_lex $P821, "$/"
    unless_null $P821, vivify_293
    new $P821, "Hash"
  vivify_293:
    set $P822, $P821["identifier"]
    unless_null $P822, vivify_294
    new $P822, "Undef"
  vivify_294:
    set $S823, $P822
    $P820."named"($S823)
.annotate "line", 289
    find_lex $P824, "$/"
    find_lex $P825, "$past"
    $P826 = $P824."!make"($P825)
.annotate "line", 284
    .return ($P826)
  control_803:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P827, exception, "payload"
    .return ($P827)
.end


.namespace ["NQP";"Actions"]
.sub "variable"  :subid("58_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_831
.annotate "line", 292
    .const 'Sub' $P844 = "59_1266334201.91429" 
    capture_lex $P844
    new $P830, 'ExceptionHandler'
    set_addr $P830, control_829
    $P830."handle_types"(58)
    push_eh $P830
    .lex "self", self
    .lex "$/", param_831
.annotate "line", 293
    new $P832, "Undef"
    .lex "$past", $P832
.annotate "line", 292
    find_lex $P833, "$past"
.annotate "line", 294
    find_lex $P835, "$/"
    unless_null $P835, vivify_295
    new $P835, "Hash"
  vivify_295:
    set $P836, $P835["postcircumfix"]
    unless_null $P836, vivify_296
    new $P836, "Undef"
  vivify_296:
    if $P836, if_834
.annotate "line", 298
    .const 'Sub' $P844 = "59_1266334201.91429" 
    capture_lex $P844
    $P844()
    goto if_834_end
  if_834:
.annotate "line", 295
    find_lex $P837, "$/"
    unless_null $P837, vivify_313
    new $P837, "Hash"
  vivify_313:
    set $P838, $P837["postcircumfix"]
    unless_null $P838, vivify_314
    new $P838, "Undef"
  vivify_314:
    $P839 = $P838."ast"()
    store_lex "$past", $P839
.annotate "line", 296
    find_lex $P840, "$past"
    get_hll_global $P841, ["PAST"], "Var"
    $P842 = $P841."new"("$/" :named("name"))
    $P840."unshift"($P842)
  if_834_end:
.annotate "line", 327
    find_lex $P913, "$/"
    find_lex $P914, "$past"
    $P915 = $P913."!make"($P914)
.annotate "line", 292
    .return ($P915)
  control_829:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P916, exception, "payload"
    .return ($P916)
.end


.namespace ["NQP";"Actions"]
.sub "_block843"  :anon :subid("59_1266334201.91429") :outer("58_1266334201.91429")
.annotate "line", 299
    new $P845, "ResizablePMCArray"
    .lex "@name", $P845
    get_hll_global $P846, ["NQP"], "Compiler"
    find_lex $P847, "$/"
    set $S848, $P847
    $P849 = $P846."parse_name"($S848)
    store_lex "@name", $P849
.annotate "line", 300
    get_hll_global $P850, ["PAST"], "Var"
    find_lex $P851, "@name"
    $P852 = $P851."pop"()
    set $S853, $P852
    $P854 = $P850."new"($S853 :named("name"))
    store_lex "$past", $P854
.annotate "line", 301
    find_lex $P856, "@name"
    unless $P856, if_855_end
.annotate "line", 302
    find_lex $P858, "@name"
    unless_null $P858, vivify_297
    new $P858, "ResizablePMCArray"
  vivify_297:
    set $P859, $P858[0]
    unless_null $P859, vivify_298
    new $P859, "Undef"
  vivify_298:
    set $S860, $P859
    iseq $I861, $S860, "GLOBAL"
    unless $I861, if_857_end
    find_lex $P862, "@name"
    $P862."shift"()
  if_857_end:
.annotate "line", 303
    find_lex $P863, "$past"
    find_lex $P864, "@name"
    $P863."namespace"($P864)
.annotate "line", 304
    find_lex $P865, "$past"
    $P865."scope"("package")
.annotate "line", 305
    find_lex $P866, "$past"
    find_lex $P867, "$/"
    unless_null $P867, vivify_299
    new $P867, "Hash"
  vivify_299:
    set $P868, $P867["sigil"]
    unless_null $P868, vivify_300
    new $P868, "Undef"
  vivify_300:
    $P869 = "sigiltype"($P868)
    $P866."viviself"($P869)
.annotate "line", 306
    find_lex $P870, "$past"
    $P870."lvalue"(1)
  if_855_end:
.annotate "line", 308
    find_lex $P873, "$/"
    unless_null $P873, vivify_301
    new $P873, "Hash"
  vivify_301:
    set $P874, $P873["twigil"]
    unless_null $P874, vivify_302
    new $P874, "ResizablePMCArray"
  vivify_302:
    set $P875, $P874[0]
    unless_null $P875, vivify_303
    new $P875, "Undef"
  vivify_303:
    set $S876, $P875
    iseq $I877, $S876, "*"
    if $I877, if_872
.annotate "line", 321
    find_lex $P899, "$/"
    unless_null $P899, vivify_304
    new $P899, "Hash"
  vivify_304:
    set $P900, $P899["twigil"]
    unless_null $P900, vivify_305
    new $P900, "ResizablePMCArray"
  vivify_305:
    set $P901, $P900[0]
    unless_null $P901, vivify_306
    new $P901, "Undef"
  vivify_306:
    set $S902, $P901
    iseq $I903, $S902, "!"
    if $I903, if_898
    new $P897, 'Integer'
    set $P897, $I903
    goto if_898_end
  if_898:
.annotate "line", 322
    find_lex $P904, "$past"
    get_hll_global $P905, ["PAST"], "Var"
    $P906 = $P905."new"("self" :named("name"))
    $P904."push"($P906)
.annotate "line", 323
    find_lex $P907, "$past"
    $P907."scope"("attribute")
.annotate "line", 324
    find_lex $P908, "$past"
    find_lex $P909, "$/"
    unless_null $P909, vivify_307
    new $P909, "Hash"
  vivify_307:
    set $P910, $P909["sigil"]
    unless_null $P910, vivify_308
    new $P910, "Undef"
  vivify_308:
    $P911 = "sigiltype"($P910)
    $P912 = $P908."viviself"($P911)
.annotate "line", 321
    set $P897, $P912
  if_898_end:
    set $P871, $P897
.annotate "line", 308
    goto if_872_end
  if_872:
.annotate "line", 309
    find_lex $P878, "$past"
    $P878."scope"("contextual")
.annotate "line", 310
    find_lex $P879, "$past"
.annotate "line", 311
    get_hll_global $P880, ["PAST"], "Var"
.annotate "line", 313
    find_lex $P881, "$/"
    unless_null $P881, vivify_309
    new $P881, "Hash"
  vivify_309:
    set $P882, $P881["sigil"]
    unless_null $P882, vivify_310
    new $P882, "Undef"
  vivify_310:
    set $S883, $P882
    new $P884, 'String'
    set $P884, $S883
    find_lex $P885, "$/"
    unless_null $P885, vivify_311
    new $P885, "Hash"
  vivify_311:
    set $P886, $P885["desigilname"]
    unless_null $P886, vivify_312
    new $P886, "Undef"
  vivify_312:
    concat $P887, $P884, $P886
.annotate "line", 315
    get_hll_global $P888, ["PAST"], "Op"
    new $P889, "String"
    assign $P889, "Contextual "
    find_lex $P890, "$/"
    set $S891, $P890
    concat $P892, $P889, $S891
    concat $P893, $P892, " not found"
    $P894 = $P888."new"($P893, "die" :named("pirop"))
    $P895 = $P880."new"("package" :named("scope"), "" :named("namespace"), $P887 :named("name"), $P894 :named("viviself"))
.annotate "line", 311
    $P896 = $P879."viviself"($P895)
.annotate "line", 308
    set $P871, $P896
  if_872_end:
.annotate "line", 298
    .return ($P871)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<module>"  :subid("60_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_920
.annotate "line", 330
    new $P919, 'ExceptionHandler'
    set_addr $P919, control_918
    $P919."handle_types"(58)
    push_eh $P919
    .lex "self", self
    .lex "$/", param_920
    find_lex $P921, "$/"
    find_lex $P922, "$/"
    unless_null $P922, vivify_315
    new $P922, "Hash"
  vivify_315:
    set $P923, $P922["package_def"]
    unless_null $P923, vivify_316
    new $P923, "Undef"
  vivify_316:
    $P924 = $P923."ast"()
    $P925 = $P921."!make"($P924)
    .return ($P925)
  control_918:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P926, exception, "payload"
    .return ($P926)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<class>"  :subid("61_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_930
.annotate "line", 331
    new $P929, 'ExceptionHandler'
    set_addr $P929, control_928
    $P929."handle_types"(58)
    push_eh $P929
    .lex "self", self
    .lex "$/", param_930
.annotate "line", 332
    new $P931, "Undef"
    .lex "$past", $P931
.annotate "line", 333
    new $P932, "Undef"
    .lex "$classinit", $P932
.annotate "line", 342
    new $P933, "Undef"
    .lex "$parent", $P933
.annotate "line", 332
    find_lex $P934, "$/"
    unless_null $P934, vivify_317
    new $P934, "Hash"
  vivify_317:
    set $P935, $P934["package_def"]
    unless_null $P935, vivify_318
    new $P935, "Undef"
  vivify_318:
    $P936 = $P935."ast"()
    store_lex "$past", $P936
.annotate "line", 334
    get_hll_global $P937, ["PAST"], "Op"
.annotate "line", 335
    get_hll_global $P938, ["PAST"], "Op"
    $P939 = $P938."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate "line", 338
    find_lex $P940, "$/"
    unless_null $P940, vivify_319
    new $P940, "Hash"
  vivify_319:
    set $P941, $P940["package_def"]
    unless_null $P941, vivify_320
    new $P941, "Hash"
  vivify_320:
    set $P942, $P941["name"]
    unless_null $P942, vivify_321
    new $P942, "Undef"
  vivify_321:
    set $S943, $P942
    $P944 = $P937."new"($P939, $S943, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 334
    store_lex "$classinit", $P944
.annotate "line", 342
    find_lex $P947, "$/"
    unless_null $P947, vivify_322
    new $P947, "Hash"
  vivify_322:
    set $P948, $P947["package_def"]
    unless_null $P948, vivify_323
    new $P948, "Hash"
  vivify_323:
    set $P949, $P948["parent"]
    unless_null $P949, vivify_324
    new $P949, "ResizablePMCArray"
  vivify_324:
    set $P950, $P949[0]
    unless_null $P950, vivify_325
    new $P950, "Undef"
  vivify_325:
    set $S951, $P950
    unless $S951, unless_946
    new $P945, 'String'
    set $P945, $S951
    goto unless_946_end
  unless_946:
.annotate "line", 343
    find_lex $P954, "$/"
    unless_null $P954, vivify_326
    new $P954, "Hash"
  vivify_326:
    set $P955, $P954["sym"]
    unless_null $P955, vivify_327
    new $P955, "Undef"
  vivify_327:
    set $S956, $P955
    iseq $I957, $S956, "grammar"
    if $I957, if_953
    new $P959, "String"
    assign $P959, ""
    set $P952, $P959
    goto if_953_end
  if_953:
    new $P958, "String"
    assign $P958, "Regex::Cursor"
    set $P952, $P958
  if_953_end:
    set $P945, $P952
  unless_946_end:
    store_lex "$parent", $P945
.annotate "line", 344
    find_lex $P961, "$parent"
    unless $P961, if_960_end
.annotate "line", 345
    find_lex $P962, "$classinit"
    get_hll_global $P963, ["PAST"], "Val"
    find_lex $P964, "$parent"
    $P965 = $P963."new"($P964 :named("value"), "parent" :named("named"))
    $P962."push"($P965)
  if_960_end:
.annotate "line", 347
    find_lex $P967, "$past"
    unless_null $P967, vivify_328
    new $P967, "Hash"
  vivify_328:
    set $P968, $P967["attributes"]
    unless_null $P968, vivify_329
    new $P968, "Undef"
  vivify_329:
    unless $P968, if_966_end
.annotate "line", 348
    find_lex $P969, "$classinit"
    find_lex $P970, "$past"
    unless_null $P970, vivify_330
    new $P970, "Hash"
  vivify_330:
    set $P971, $P970["attributes"]
    unless_null $P971, vivify_331
    new $P971, "Undef"
  vivify_331:
    $P969."push"($P971)
  if_966_end:
.annotate "line", 350
    get_global $P972, "@BLOCK"
    unless_null $P972, vivify_332
    new $P972, "ResizablePMCArray"
  vivify_332:
    set $P973, $P972[0]
    unless_null $P973, vivify_333
    new $P973, "Undef"
  vivify_333:
    $P974 = $P973."loadinit"()
    find_lex $P975, "$classinit"
    $P974."push"($P975)
.annotate "line", 351
    find_lex $P976, "$/"
    find_lex $P977, "$past"
    $P978 = $P976."!make"($P977)
.annotate "line", 331
    .return ($P978)
  control_928:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P979, exception, "payload"
    .return ($P979)
.end


.namespace ["NQP";"Actions"]
.sub "package_def"  :subid("62_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_983
.annotate "line", 354
    new $P982, 'ExceptionHandler'
    set_addr $P982, control_981
    $P982."handle_types"(58)
    push_eh $P982
    .lex "self", self
    .lex "$/", param_983
.annotate "line", 355
    new $P984, "Undef"
    .lex "$past", $P984
    find_lex $P987, "$/"
    unless_null $P987, vivify_334
    new $P987, "Hash"
  vivify_334:
    set $P988, $P987["block"]
    unless_null $P988, vivify_335
    new $P988, "Undef"
  vivify_335:
    if $P988, if_986
    find_lex $P992, "$/"
    unless_null $P992, vivify_336
    new $P992, "Hash"
  vivify_336:
    set $P993, $P992["comp_unit"]
    unless_null $P993, vivify_337
    new $P993, "Undef"
  vivify_337:
    $P994 = $P993."ast"()
    set $P985, $P994
    goto if_986_end
  if_986:
    find_lex $P989, "$/"
    unless_null $P989, vivify_338
    new $P989, "Hash"
  vivify_338:
    set $P990, $P989["block"]
    unless_null $P990, vivify_339
    new $P990, "Undef"
  vivify_339:
    $P991 = $P990."ast"()
    set $P985, $P991
  if_986_end:
    store_lex "$past", $P985
.annotate "line", 356
    find_lex $P995, "$past"
    find_lex $P996, "$/"
    unless_null $P996, vivify_340
    new $P996, "Hash"
  vivify_340:
    set $P997, $P996["name"]
    unless_null $P997, vivify_341
    new $P997, "Hash"
  vivify_341:
    set $P998, $P997["identifier"]
    unless_null $P998, vivify_342
    new $P998, "Undef"
  vivify_342:
    $P995."namespace"($P998)
.annotate "line", 357
    find_lex $P999, "$past"
    $P999."blocktype"("immediate")
.annotate "line", 358
    find_lex $P1000, "$/"
    find_lex $P1001, "$past"
    $P1002 = $P1000."!make"($P1001)
.annotate "line", 354
    .return ($P1002)
  control_981:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1003, exception, "payload"
    .return ($P1003)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<my>"  :subid("63_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1007
.annotate "line", 361
    new $P1006, 'ExceptionHandler'
    set_addr $P1006, control_1005
    $P1006."handle_types"(58)
    push_eh $P1006
    .lex "self", self
    .lex "$/", param_1007
    find_lex $P1008, "$/"
    find_lex $P1009, "$/"
    unless_null $P1009, vivify_343
    new $P1009, "Hash"
  vivify_343:
    set $P1010, $P1009["scoped"]
    unless_null $P1010, vivify_344
    new $P1010, "Undef"
  vivify_344:
    $P1011 = $P1010."ast"()
    $P1012 = $P1008."!make"($P1011)
    .return ($P1012)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1013, exception, "payload"
    .return ($P1013)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<our>"  :subid("64_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1017
.annotate "line", 362
    new $P1016, 'ExceptionHandler'
    set_addr $P1016, control_1015
    $P1016."handle_types"(58)
    push_eh $P1016
    .lex "self", self
    .lex "$/", param_1017
    find_lex $P1018, "$/"
    find_lex $P1019, "$/"
    unless_null $P1019, vivify_345
    new $P1019, "Hash"
  vivify_345:
    set $P1020, $P1019["scoped"]
    unless_null $P1020, vivify_346
    new $P1020, "Undef"
  vivify_346:
    $P1021 = $P1020."ast"()
    $P1022 = $P1018."!make"($P1021)
    .return ($P1022)
  control_1015:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1023, exception, "payload"
    .return ($P1023)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<has>"  :subid("65_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1027
.annotate "line", 363
    new $P1026, 'ExceptionHandler'
    set_addr $P1026, control_1025
    $P1026."handle_types"(58)
    push_eh $P1026
    .lex "self", self
    .lex "$/", param_1027
    find_lex $P1028, "$/"
    find_lex $P1029, "$/"
    unless_null $P1029, vivify_347
    new $P1029, "Hash"
  vivify_347:
    set $P1030, $P1029["scoped"]
    unless_null $P1030, vivify_348
    new $P1030, "Undef"
  vivify_348:
    $P1031 = $P1030."ast"()
    $P1032 = $P1028."!make"($P1031)
    .return ($P1032)
  control_1025:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1033, exception, "payload"
    .return ($P1033)
.end


.namespace ["NQP";"Actions"]
.sub "scoped"  :subid("66_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1037
.annotate "line", 365
    new $P1036, 'ExceptionHandler'
    set_addr $P1036, control_1035
    $P1036."handle_types"(58)
    push_eh $P1036
    .lex "self", self
    .lex "$/", param_1037
.annotate "line", 366
    find_lex $P1038, "$/"
.annotate "line", 367
    find_lex $P1041, "$/"
    unless_null $P1041, vivify_349
    new $P1041, "Hash"
  vivify_349:
    set $P1042, $P1041["routine_declarator"]
    unless_null $P1042, vivify_350
    new $P1042, "Undef"
  vivify_350:
    if $P1042, if_1040
.annotate "line", 368
    find_lex $P1046, "$/"
    unless_null $P1046, vivify_351
    new $P1046, "Hash"
  vivify_351:
    set $P1047, $P1046["variable_declarator"]
    unless_null $P1047, vivify_352
    new $P1047, "Undef"
  vivify_352:
    $P1048 = $P1047."ast"()
    set $P1039, $P1048
.annotate "line", 367
    goto if_1040_end
  if_1040:
    find_lex $P1043, "$/"
    unless_null $P1043, vivify_353
    new $P1043, "Hash"
  vivify_353:
    set $P1044, $P1043["routine_declarator"]
    unless_null $P1044, vivify_354
    new $P1044, "Undef"
  vivify_354:
    $P1045 = $P1044."ast"()
    set $P1039, $P1045
  if_1040_end:
    $P1049 = $P1038."!make"($P1039)
.annotate "line", 365
    .return ($P1049)
  control_1035:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1050, exception, "payload"
    .return ($P1050)
.end


.namespace ["NQP";"Actions"]
.sub "variable_declarator"  :subid("67_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1054
.annotate "line", 371
    .const 'Sub' $P1094 = "68_1266334201.91429" 
    capture_lex $P1094
    new $P1053, 'ExceptionHandler'
    set_addr $P1053, control_1052
    $P1053."handle_types"(58)
    push_eh $P1053
    .lex "self", self
    .lex "$/", param_1054
.annotate "line", 372
    new $P1055, "Undef"
    .lex "$past", $P1055
.annotate "line", 373
    new $P1056, "Undef"
    .lex "$sigil", $P1056
.annotate "line", 374
    new $P1057, "Undef"
    .lex "$name", $P1057
.annotate "line", 375
    new $P1058, "Undef"
    .lex "$BLOCK", $P1058
.annotate "line", 372
    find_lex $P1059, "$/"
    unless_null $P1059, vivify_355
    new $P1059, "Hash"
  vivify_355:
    set $P1060, $P1059["variable"]
    unless_null $P1060, vivify_356
    new $P1060, "Undef"
  vivify_356:
    $P1061 = $P1060."ast"()
    store_lex "$past", $P1061
.annotate "line", 373
    find_lex $P1062, "$/"
    unless_null $P1062, vivify_357
    new $P1062, "Hash"
  vivify_357:
    set $P1063, $P1062["variable"]
    unless_null $P1063, vivify_358
    new $P1063, "Hash"
  vivify_358:
    set $P1064, $P1063["sigil"]
    unless_null $P1064, vivify_359
    new $P1064, "Undef"
  vivify_359:
    store_lex "$sigil", $P1064
.annotate "line", 374
    find_lex $P1065, "$past"
    $P1066 = $P1065."name"()
    store_lex "$name", $P1066
.annotate "line", 375
    get_global $P1067, "@BLOCK"
    unless_null $P1067, vivify_360
    new $P1067, "ResizablePMCArray"
  vivify_360:
    set $P1068, $P1067[0]
    unless_null $P1068, vivify_361
    new $P1068, "Undef"
  vivify_361:
    store_lex "$BLOCK", $P1068
.annotate "line", 376
    find_lex $P1070, "$BLOCK"
    find_lex $P1071, "$name"
    $P1072 = $P1070."symbol"($P1071)
    unless $P1072, if_1069_end
.annotate "line", 377
    find_lex $P1073, "$/"
    $P1074 = $P1073."CURSOR"()
    find_lex $P1075, "$name"
    $P1074."panic"("Redeclaration of symbol ", $P1075)
  if_1069_end:
.annotate "line", 379
    find_dynamic_lex $P1077, "$*SCOPE"
    unless_null $P1077, vivify_362
    get_hll_global $P1077, "$SCOPE"
    unless_null $P1077, vivify_363
    die "Contextual $*SCOPE not found"
  vivify_363:
  vivify_362:
    set $S1078, $P1077
    iseq $I1079, $S1078, "has"
    if $I1079, if_1076
.annotate "line", 388
    .const 'Sub' $P1094 = "68_1266334201.91429" 
    capture_lex $P1094
    $P1094()
    goto if_1076_end
  if_1076:
.annotate "line", 380
    find_lex $P1080, "$BLOCK"
    find_lex $P1081, "$name"
    $P1080."symbol"($P1081, "attribute" :named("scope"))
.annotate "line", 381
    find_lex $P1083, "$BLOCK"
    unless_null $P1083, vivify_368
    new $P1083, "Hash"
  vivify_368:
    set $P1084, $P1083["attributes"]
    unless_null $P1084, vivify_369
    new $P1084, "Undef"
  vivify_369:
    if $P1084, unless_1082_end
.annotate "line", 383
    get_hll_global $P1085, ["PAST"], "Op"
    $P1086 = $P1085."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P1087, "$BLOCK"
    unless_null $P1087, vivify_370
    new $P1087, "Hash"
    store_lex "$BLOCK", $P1087
  vivify_370:
    set $P1087["attributes"], $P1086
  unless_1082_end:
.annotate "line", 385
    find_lex $P1088, "$BLOCK"
    unless_null $P1088, vivify_371
    new $P1088, "Hash"
  vivify_371:
    set $P1089, $P1088["attributes"]
    unless_null $P1089, vivify_372
    new $P1089, "Undef"
  vivify_372:
    find_lex $P1090, "$name"
    $P1089."push"($P1090)
.annotate "line", 386
    get_hll_global $P1091, ["PAST"], "Stmts"
    $P1092 = $P1091."new"()
    store_lex "$past", $P1092
  if_1076_end:
.annotate "line", 396
    find_lex $P1118, "$/"
    find_lex $P1119, "$past"
    $P1120 = $P1118."!make"($P1119)
.annotate "line", 371
    .return ($P1120)
  control_1052:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1121, exception, "payload"
    .return ($P1121)
.end


.namespace ["NQP";"Actions"]
.sub "_block1093"  :anon :subid("68_1266334201.91429") :outer("67_1266334201.91429")
.annotate "line", 389
    new $P1095, "Undef"
    .lex "$scope", $P1095
.annotate "line", 390
    new $P1096, "Undef"
    .lex "$decl", $P1096
.annotate "line", 389
    find_dynamic_lex $P1099, "$*SCOPE"
    unless_null $P1099, vivify_364
    get_hll_global $P1099, "$SCOPE"
    unless_null $P1099, vivify_365
    die "Contextual $*SCOPE not found"
  vivify_365:
  vivify_364:
    set $S1100, $P1099
    iseq $I1101, $S1100, "our"
    if $I1101, if_1098
    new $P1103, "String"
    assign $P1103, "lexical"
    set $P1097, $P1103
    goto if_1098_end
  if_1098:
    new $P1102, "String"
    assign $P1102, "package"
    set $P1097, $P1102
  if_1098_end:
    store_lex "$scope", $P1097
.annotate "line", 390
    get_hll_global $P1104, ["PAST"], "Var"
    find_lex $P1105, "$name"
    find_lex $P1106, "$scope"
.annotate "line", 391
    find_lex $P1107, "$sigil"
    $P1108 = "sigiltype"($P1107)
    find_lex $P1109, "$/"
    $P1110 = $P1104."new"($P1105 :named("name"), $P1106 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P1108 :named("viviself"), $P1109 :named("node"))
.annotate "line", 390
    store_lex "$decl", $P1110
.annotate "line", 393
    find_lex $P1111, "$BLOCK"
    find_lex $P1112, "$name"
    find_lex $P1113, "$scope"
    $P1111."symbol"($P1112, $P1113 :named("scope"))
.annotate "line", 394
    find_lex $P1114, "$BLOCK"
    unless_null $P1114, vivify_366
    new $P1114, "ResizablePMCArray"
  vivify_366:
    set $P1115, $P1114[0]
    unless_null $P1115, vivify_367
    new $P1115, "Undef"
  vivify_367:
    find_lex $P1116, "$decl"
    $P1117 = $P1115."push"($P1116)
.annotate "line", 388
    .return ($P1117)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<sub>"  :subid("69_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1125
.annotate "line", 399
    new $P1124, 'ExceptionHandler'
    set_addr $P1124, control_1123
    $P1124."handle_types"(58)
    push_eh $P1124
    .lex "self", self
    .lex "$/", param_1125
    find_lex $P1126, "$/"
    find_lex $P1127, "$/"
    unless_null $P1127, vivify_373
    new $P1127, "Hash"
  vivify_373:
    set $P1128, $P1127["routine_def"]
    unless_null $P1128, vivify_374
    new $P1128, "Undef"
  vivify_374:
    $P1129 = $P1128."ast"()
    $P1130 = $P1126."!make"($P1129)
    .return ($P1130)
  control_1123:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1131, exception, "payload"
    .return ($P1131)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<method>"  :subid("70_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1135
.annotate "line", 400
    new $P1134, 'ExceptionHandler'
    set_addr $P1134, control_1133
    $P1134."handle_types"(58)
    push_eh $P1134
    .lex "self", self
    .lex "$/", param_1135
    find_lex $P1136, "$/"
    find_lex $P1137, "$/"
    unless_null $P1137, vivify_375
    new $P1137, "Hash"
  vivify_375:
    set $P1138, $P1137["method_def"]
    unless_null $P1138, vivify_376
    new $P1138, "Undef"
  vivify_376:
    $P1139 = $P1138."ast"()
    $P1140 = $P1136."!make"($P1139)
    .return ($P1140)
  control_1133:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1141, exception, "payload"
    .return ($P1141)
.end


.namespace ["NQP";"Actions"]
.sub "routine_def"  :subid("71_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1145
.annotate "line", 402
    .const 'Sub' $P1156 = "72_1266334201.91429" 
    capture_lex $P1156
    new $P1144, 'ExceptionHandler'
    set_addr $P1144, control_1143
    $P1144."handle_types"(58)
    push_eh $P1144
    .lex "self", self
    .lex "$/", param_1145
.annotate "line", 403
    new $P1146, "Undef"
    .lex "$past", $P1146
    find_lex $P1147, "$/"
    unless_null $P1147, vivify_377
    new $P1147, "Hash"
  vivify_377:
    set $P1148, $P1147["blockoid"]
    unless_null $P1148, vivify_378
    new $P1148, "Undef"
  vivify_378:
    $P1149 = $P1148."ast"()
    store_lex "$past", $P1149
.annotate "line", 404
    find_lex $P1150, "$past"
    $P1150."blocktype"("declaration")
.annotate "line", 405
    find_lex $P1151, "$past"
    $P1151."control"("return_pir")
.annotate "line", 406
    find_lex $P1153, "$/"
    unless_null $P1153, vivify_379
    new $P1153, "Hash"
  vivify_379:
    set $P1154, $P1153["deflongname"]
    unless_null $P1154, vivify_380
    new $P1154, "Undef"
  vivify_380:
    unless $P1154, if_1152_end
    .const 'Sub' $P1156 = "72_1266334201.91429" 
    capture_lex $P1156
    $P1156()
  if_1152_end:
.annotate "line", 416
    find_lex $P1188, "$/"
    find_lex $P1189, "$past"
    $P1190 = $P1188."!make"($P1189)
.annotate "line", 402
    .return ($P1190)
  control_1143:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1191, exception, "payload"
    .return ($P1191)
.end


.namespace ["NQP";"Actions"]
.sub "_block1155"  :anon :subid("72_1266334201.91429") :outer("71_1266334201.91429")
.annotate "line", 407
    new $P1157, "Undef"
    .lex "$name", $P1157
    find_lex $P1158, "$/"
    unless_null $P1158, vivify_381
    new $P1158, "Hash"
  vivify_381:
    set $P1159, $P1158["sigil"]
    unless_null $P1159, vivify_382
    new $P1159, "ResizablePMCArray"
  vivify_382:
    set $P1160, $P1159[0]
    unless_null $P1160, vivify_383
    new $P1160, "Undef"
  vivify_383:
    set $S1161, $P1160
    new $P1162, 'String'
    set $P1162, $S1161
    find_lex $P1163, "$/"
    unless_null $P1163, vivify_384
    new $P1163, "Hash"
  vivify_384:
    set $P1164, $P1163["deflongname"]
    unless_null $P1164, vivify_385
    new $P1164, "ResizablePMCArray"
  vivify_385:
    set $P1165, $P1164[0]
    unless_null $P1165, vivify_386
    new $P1165, "Undef"
  vivify_386:
    $S1166 = $P1165."ast"()
    concat $P1167, $P1162, $S1166
    store_lex "$name", $P1167
.annotate "line", 408
    find_lex $P1168, "$past"
    find_lex $P1169, "$name"
    $P1168."name"($P1169)
.annotate "line", 409
    find_dynamic_lex $P1172, "$*SCOPE"
    unless_null $P1172, vivify_387
    get_hll_global $P1172, "$SCOPE"
    unless_null $P1172, vivify_388
    die "Contextual $*SCOPE not found"
  vivify_388:
  vivify_387:
    set $S1173, $P1172
    isne $I1174, $S1173, "our"
    if $I1174, if_1171
    new $P1170, 'Integer'
    set $P1170, $I1174
    goto if_1171_end
  if_1171:
.annotate "line", 410
    get_global $P1175, "@BLOCK"
    unless_null $P1175, vivify_389
    new $P1175, "ResizablePMCArray"
  vivify_389:
    set $P1176, $P1175[0]
    unless_null $P1176, vivify_390
    new $P1176, "ResizablePMCArray"
  vivify_390:
    set $P1177, $P1176[0]
    unless_null $P1177, vivify_391
    new $P1177, "Undef"
  vivify_391:
    get_hll_global $P1178, ["PAST"], "Var"
    find_lex $P1179, "$name"
    find_lex $P1180, "$past"
    $P1181 = $P1178."new"($P1179 :named("name"), 1 :named("isdecl"), $P1180 :named("viviself"), "lexical" :named("scope"))
    $P1177."push"($P1181)
.annotate "line", 412
    get_global $P1182, "@BLOCK"
    unless_null $P1182, vivify_392
    new $P1182, "ResizablePMCArray"
  vivify_392:
    set $P1183, $P1182[0]
    unless_null $P1183, vivify_393
    new $P1183, "Undef"
  vivify_393:
    find_lex $P1184, "$name"
    $P1183."symbol"($P1184, "lexical" :named("scope"))
.annotate "line", 413
    get_hll_global $P1185, ["PAST"], "Var"
    find_lex $P1186, "$name"
    $P1187 = $P1185."new"($P1186 :named("name"))
    store_lex "$past", $P1187
.annotate "line", 409
    set $P1170, $P1187
  if_1171_end:
.annotate "line", 406
    .return ($P1170)
.end


.namespace ["NQP";"Actions"]
.sub "method_def"  :subid("73_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1195
.annotate "line", 420
    .const 'Sub' $P1211 = "74_1266334201.91429" 
    capture_lex $P1211
    new $P1194, 'ExceptionHandler'
    set_addr $P1194, control_1193
    $P1194."handle_types"(58)
    push_eh $P1194
    .lex "self", self
    .lex "$/", param_1195
.annotate "line", 421
    new $P1196, "Undef"
    .lex "$past", $P1196
    find_lex $P1197, "$/"
    unless_null $P1197, vivify_394
    new $P1197, "Hash"
  vivify_394:
    set $P1198, $P1197["blockoid"]
    unless_null $P1198, vivify_395
    new $P1198, "Undef"
  vivify_395:
    $P1199 = $P1198."ast"()
    store_lex "$past", $P1199
.annotate "line", 422
    find_lex $P1200, "$past"
    $P1200."blocktype"("method")
.annotate "line", 423
    find_lex $P1201, "$past"
    $P1201."control"("return_pir")
.annotate "line", 424
    find_lex $P1202, "$past"
    unless_null $P1202, vivify_396
    new $P1202, "ResizablePMCArray"
  vivify_396:
    set $P1203, $P1202[0]
    unless_null $P1203, vivify_397
    new $P1203, "Undef"
  vivify_397:
    get_hll_global $P1204, ["PAST"], "Op"
    $P1205 = $P1204."new"("    .lex \"self\", self" :named("inline"))
    $P1203."unshift"($P1205)
.annotate "line", 425
    find_lex $P1206, "$past"
    $P1206."symbol"("self", "lexical" :named("scope"))
.annotate "line", 426
    find_lex $P1208, "$/"
    unless_null $P1208, vivify_398
    new $P1208, "Hash"
  vivify_398:
    set $P1209, $P1208["deflongname"]
    unless_null $P1209, vivify_399
    new $P1209, "Undef"
  vivify_399:
    unless $P1209, if_1207_end
    .const 'Sub' $P1211 = "74_1266334201.91429" 
    capture_lex $P1211
    $P1211()
  if_1207_end:
.annotate "line", 430
    find_lex $P1222, "$/"
    find_lex $P1223, "$past"
    $P1224 = $P1222."!make"($P1223)
.annotate "line", 420
    .return ($P1224)
  control_1193:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1225, exception, "payload"
    .return ($P1225)
.end


.namespace ["NQP";"Actions"]
.sub "_block1210"  :anon :subid("74_1266334201.91429") :outer("73_1266334201.91429")
.annotate "line", 427
    new $P1212, "Undef"
    .lex "$name", $P1212
    find_lex $P1213, "$/"
    unless_null $P1213, vivify_400
    new $P1213, "Hash"
  vivify_400:
    set $P1214, $P1213["deflongname"]
    unless_null $P1214, vivify_401
    new $P1214, "ResizablePMCArray"
  vivify_401:
    set $P1215, $P1214[0]
    unless_null $P1215, vivify_402
    new $P1215, "Undef"
  vivify_402:
    $P1216 = $P1215."ast"()
    set $S1217, $P1216
    new $P1218, 'String'
    set $P1218, $S1217
    store_lex "$name", $P1218
.annotate "line", 428
    find_lex $P1219, "$past"
    find_lex $P1220, "$name"
    $P1221 = $P1219."name"($P1220)
.annotate "line", 426
    .return ($P1221)
.end


.namespace ["NQP";"Actions"]
.sub "signature"  :subid("75_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1229
.annotate "line", 434
    .const 'Sub' $P1240 = "76_1266334201.91429" 
    capture_lex $P1240
    new $P1228, 'ExceptionHandler'
    set_addr $P1228, control_1227
    $P1228."handle_types"(58)
    push_eh $P1228
    .lex "self", self
    .lex "$/", param_1229
.annotate "line", 435
    new $P1230, "Undef"
    .lex "$BLOCKINIT", $P1230
    get_global $P1231, "@BLOCK"
    unless_null $P1231, vivify_403
    new $P1231, "ResizablePMCArray"
  vivify_403:
    set $P1232, $P1231[0]
    unless_null $P1232, vivify_404
    new $P1232, "ResizablePMCArray"
  vivify_404:
    set $P1233, $P1232[0]
    unless_null $P1233, vivify_405
    new $P1233, "Undef"
  vivify_405:
    store_lex "$BLOCKINIT", $P1233
.annotate "line", 436
    find_lex $P1235, "$/"
    unless_null $P1235, vivify_406
    new $P1235, "Hash"
  vivify_406:
    set $P1236, $P1235["parameter"]
    unless_null $P1236, vivify_407
    new $P1236, "Undef"
  vivify_407:
    defined $I1237, $P1236
    unless $I1237, for_undef_408
    iter $P1234, $P1236
    new $P1247, 'ExceptionHandler'
    set_addr $P1247, loop1246_handler
    $P1247."handle_types"(65, 67, 66)
    push_eh $P1247
  loop1246_test:
    unless $P1234, loop1246_done
    shift $P1238, $P1234
  loop1246_redo:
    .const 'Sub' $P1240 = "76_1266334201.91429" 
    capture_lex $P1240
    $P1240($P1238)
  loop1246_next:
    goto loop1246_test
  loop1246_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1248, exception, 'type'
    eq $P1248, 65, loop1246_next
    eq $P1248, 67, loop1246_redo
  loop1246_done:
    pop_eh 
  for_undef_408:
.annotate "line", 434
    .return ($P1234)
  control_1227:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1249, exception, "payload"
    .return ($P1249)
.end


.namespace ["NQP";"Actions"]
.sub "_block1239"  :anon :subid("76_1266334201.91429") :outer("75_1266334201.91429")
    .param pmc param_1241
.annotate "line", 436
    .lex "$_", param_1241
    find_lex $P1242, "$BLOCKINIT"
    find_lex $P1243, "$_"
    $P1244 = $P1243."ast"()
    $P1245 = $P1242."push"($P1244)
    .return ($P1245)
.end


.namespace ["NQP";"Actions"]
.sub "parameter"  :subid("77_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1253
.annotate "line", 439
    new $P1252, 'ExceptionHandler'
    set_addr $P1252, control_1251
    $P1252."handle_types"(58)
    push_eh $P1252
    .lex "self", self
    .lex "$/", param_1253
.annotate "line", 440
    new $P1254, "Undef"
    .lex "$quant", $P1254
.annotate "line", 441
    new $P1255, "Undef"
    .lex "$past", $P1255
.annotate "line", 440
    find_lex $P1256, "$/"
    unless_null $P1256, vivify_409
    new $P1256, "Hash"
  vivify_409:
    set $P1257, $P1256["quant"]
    unless_null $P1257, vivify_410
    new $P1257, "Undef"
  vivify_410:
    store_lex "$quant", $P1257
    find_lex $P1258, "$past"
.annotate "line", 442
    find_lex $P1260, "$/"
    unless_null $P1260, vivify_411
    new $P1260, "Hash"
  vivify_411:
    set $P1261, $P1260["named_param"]
    unless_null $P1261, vivify_412
    new $P1261, "Undef"
  vivify_412:
    if $P1261, if_1259
.annotate "line", 449
    find_lex $P1275, "$/"
    unless_null $P1275, vivify_413
    new $P1275, "Hash"
  vivify_413:
    set $P1276, $P1275["param_var"]
    unless_null $P1276, vivify_414
    new $P1276, "Undef"
  vivify_414:
    $P1277 = $P1276."ast"()
    store_lex "$past", $P1277
.annotate "line", 450
    find_lex $P1279, "$quant"
    set $S1280, $P1279
    iseq $I1281, $S1280, "*"
    if $I1281, if_1278
.annotate "line", 454
    find_lex $P1290, "$quant"
    set $S1291, $P1290
    iseq $I1292, $S1291, "?"
    unless $I1292, if_1289_end
.annotate "line", 455
    find_lex $P1293, "$past"
    find_lex $P1294, "$/"
    unless_null $P1294, vivify_415
    new $P1294, "Hash"
  vivify_415:
    set $P1295, $P1294["param_var"]
    unless_null $P1295, vivify_416
    new $P1295, "Hash"
  vivify_416:
    set $P1296, $P1295["sigil"]
    unless_null $P1296, vivify_417
    new $P1296, "Undef"
  vivify_417:
    $P1297 = "sigiltype"($P1296)
    $P1293."viviself"($P1297)
  if_1289_end:
.annotate "line", 454
    goto if_1278_end
  if_1278:
.annotate "line", 451
    find_lex $P1282, "$past"
    $P1282."slurpy"(1)
.annotate "line", 452
    find_lex $P1283, "$past"
    find_lex $P1284, "$/"
    unless_null $P1284, vivify_418
    new $P1284, "Hash"
  vivify_418:
    set $P1285, $P1284["param_var"]
    unless_null $P1285, vivify_419
    new $P1285, "Hash"
  vivify_419:
    set $P1286, $P1285["sigil"]
    unless_null $P1286, vivify_420
    new $P1286, "Undef"
  vivify_420:
    set $S1287, $P1286
    iseq $I1288, $S1287, "%"
    $P1283."named"($I1288)
  if_1278_end:
.annotate "line", 448
    goto if_1259_end
  if_1259:
.annotate "line", 443
    find_lex $P1262, "$/"
    unless_null $P1262, vivify_421
    new $P1262, "Hash"
  vivify_421:
    set $P1263, $P1262["named_param"]
    unless_null $P1263, vivify_422
    new $P1263, "Undef"
  vivify_422:
    $P1264 = $P1263."ast"()
    store_lex "$past", $P1264
.annotate "line", 444
    find_lex $P1266, "$quant"
    set $S1267, $P1266
    isne $I1268, $S1267, "!"
    unless $I1268, if_1265_end
.annotate "line", 445
    find_lex $P1269, "$past"
    find_lex $P1270, "$/"
    unless_null $P1270, vivify_423
    new $P1270, "Hash"
  vivify_423:
    set $P1271, $P1270["named_param"]
    unless_null $P1271, vivify_424
    new $P1271, "Hash"
  vivify_424:
    set $P1272, $P1271["param_var"]
    unless_null $P1272, vivify_425
    new $P1272, "Hash"
  vivify_425:
    set $P1273, $P1272["sigil"]
    unless_null $P1273, vivify_426
    new $P1273, "Undef"
  vivify_426:
    $P1274 = "sigiltype"($P1273)
    $P1269."viviself"($P1274)
  if_1265_end:
  if_1259_end:
.annotate "line", 458
    find_lex $P1299, "$/"
    unless_null $P1299, vivify_427
    new $P1299, "Hash"
  vivify_427:
    set $P1300, $P1299["default_value"]
    unless_null $P1300, vivify_428
    new $P1300, "Undef"
  vivify_428:
    unless $P1300, if_1298_end
.annotate "line", 459
    find_lex $P1302, "$quant"
    set $S1303, $P1302
    iseq $I1304, $S1303, "*"
    unless $I1304, if_1301_end
.annotate "line", 460
    find_lex $P1305, "$/"
    $P1306 = $P1305."CURSOR"()
    $P1306."panic"("Can't put default on slurpy parameter")
  if_1301_end:
.annotate "line", 462
    find_lex $P1308, "$quant"
    set $S1309, $P1308
    iseq $I1310, $S1309, "!"
    unless $I1310, if_1307_end
.annotate "line", 463
    find_lex $P1311, "$/"
    $P1312 = $P1311."CURSOR"()
    $P1312."panic"("Can't put default on required parameter")
  if_1307_end:
.annotate "line", 465
    find_lex $P1313, "$past"
    find_lex $P1314, "$/"
    unless_null $P1314, vivify_429
    new $P1314, "Hash"
  vivify_429:
    set $P1315, $P1314["default_value"]
    unless_null $P1315, vivify_430
    new $P1315, "ResizablePMCArray"
  vivify_430:
    set $P1316, $P1315[0]
    unless_null $P1316, vivify_431
    new $P1316, "Hash"
  vivify_431:
    set $P1317, $P1316["EXPR"]
    unless_null $P1317, vivify_432
    new $P1317, "Undef"
  vivify_432:
    $P1318 = $P1317."ast"()
    $P1313."viviself"($P1318)
  if_1298_end:
.annotate "line", 467
    find_lex $P1320, "$past"
    $P1321 = $P1320."viviself"()
    if $P1321, unless_1319_end
    get_global $P1322, "@BLOCK"
    unless_null $P1322, vivify_433
    new $P1322, "ResizablePMCArray"
  vivify_433:
    set $P1323, $P1322[0]
    unless_null $P1323, vivify_434
    new $P1323, "Undef"
  vivify_434:
    get_global $P1324, "@BLOCK"
    unless_null $P1324, vivify_435
    new $P1324, "ResizablePMCArray"
  vivify_435:
    set $P1325, $P1324[0]
    unless_null $P1325, vivify_436
    new $P1325, "Undef"
  vivify_436:
    $P1326 = $P1325."arity"()
    set $N1327, $P1326
    new $P1328, 'Float'
    set $P1328, $N1327
    add $P1329, $P1328, 1
    $P1323."arity"($P1329)
  unless_1319_end:
.annotate "line", 468
    find_lex $P1330, "$/"
    find_lex $P1331, "$past"
    $P1332 = $P1330."!make"($P1331)
.annotate "line", 439
    .return ($P1332)
  control_1251:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1333, exception, "payload"
    .return ($P1333)
.end


.namespace ["NQP";"Actions"]
.sub "param_var"  :subid("78_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1337
.annotate "line", 471
    new $P1336, 'ExceptionHandler'
    set_addr $P1336, control_1335
    $P1336."handle_types"(58)
    push_eh $P1336
    .lex "self", self
    .lex "$/", param_1337
.annotate "line", 472
    new $P1338, "Undef"
    .lex "$name", $P1338
.annotate "line", 473
    new $P1339, "Undef"
    .lex "$past", $P1339
.annotate "line", 472
    find_lex $P1340, "$/"
    set $S1341, $P1340
    new $P1342, 'String'
    set $P1342, $S1341
    store_lex "$name", $P1342
.annotate "line", 473
    get_hll_global $P1343, ["PAST"], "Var"
    find_lex $P1344, "$name"
    find_lex $P1345, "$/"
    $P1346 = $P1343."new"($P1344 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1345 :named("node"))
    store_lex "$past", $P1346
.annotate "line", 475
    get_global $P1347, "@BLOCK"
    unless_null $P1347, vivify_437
    new $P1347, "ResizablePMCArray"
  vivify_437:
    set $P1348, $P1347[0]
    unless_null $P1348, vivify_438
    new $P1348, "Undef"
  vivify_438:
    find_lex $P1349, "$name"
    $P1348."symbol"($P1349, "lexical" :named("scope"))
.annotate "line", 476
    find_lex $P1350, "$/"
    find_lex $P1351, "$past"
    $P1352 = $P1350."!make"($P1351)
.annotate "line", 471
    .return ($P1352)
  control_1335:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1353, exception, "payload"
    .return ($P1353)
.end


.namespace ["NQP";"Actions"]
.sub "named_param"  :subid("79_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1357
.annotate "line", 479
    new $P1356, 'ExceptionHandler'
    set_addr $P1356, control_1355
    $P1356."handle_types"(58)
    push_eh $P1356
    .lex "self", self
    .lex "$/", param_1357
.annotate "line", 480
    new $P1358, "Undef"
    .lex "$past", $P1358
    find_lex $P1359, "$/"
    unless_null $P1359, vivify_439
    new $P1359, "Hash"
  vivify_439:
    set $P1360, $P1359["param_var"]
    unless_null $P1360, vivify_440
    new $P1360, "Undef"
  vivify_440:
    $P1361 = $P1360."ast"()
    store_lex "$past", $P1361
.annotate "line", 481
    find_lex $P1362, "$past"
    find_lex $P1363, "$/"
    unless_null $P1363, vivify_441
    new $P1363, "Hash"
  vivify_441:
    set $P1364, $P1363["param_var"]
    unless_null $P1364, vivify_442
    new $P1364, "Hash"
  vivify_442:
    set $P1365, $P1364["name"]
    unless_null $P1365, vivify_443
    new $P1365, "Undef"
  vivify_443:
    set $S1366, $P1365
    $P1362."named"($S1366)
.annotate "line", 482
    find_lex $P1367, "$/"
    find_lex $P1368, "$past"
    $P1369 = $P1367."!make"($P1368)
.annotate "line", 479
    .return ($P1369)
  control_1355:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1370, exception, "payload"
    .return ($P1370)
.end


.namespace ["NQP";"Actions"]
.sub "regex_declarator"  :subid("80_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1374
    .param pmc param_1375 :optional
    .param int has_param_1375 :opt_flag
.annotate "line", 485
    .const 'Sub' $P1445 = "82_1266334201.91429" 
    capture_lex $P1445
    .const 'Sub' $P1417 = "81_1266334201.91429" 
    capture_lex $P1417
    new $P1373, 'ExceptionHandler'
    set_addr $P1373, control_1372
    $P1373."handle_types"(58)
    push_eh $P1373
    .lex "self", self
    .lex "$/", param_1374
    if has_param_1375, optparam_444
    new $P1376, "Undef"
    set param_1375, $P1376
  optparam_444:
    .lex "$key", param_1375
.annotate "line", 486
    new $P1377, "ResizablePMCArray"
    .lex "@MODIFIERS", $P1377
.annotate "line", 489
    new $P1378, "Undef"
    .lex "$name", $P1378
.annotate "line", 490
    new $P1379, "Undef"
    .lex "$past", $P1379
.annotate "line", 486

        $P1380 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1380
.annotate "line", 489
    find_lex $P1381, "$/"
    unless_null $P1381, vivify_445
    new $P1381, "Hash"
  vivify_445:
    set $P1382, $P1381["deflongname"]
    unless_null $P1382, vivify_446
    new $P1382, "Undef"
  vivify_446:
    $P1383 = $P1382."ast"()
    set $S1384, $P1383
    new $P1385, 'String'
    set $P1385, $S1384
    store_lex "$name", $P1385
    find_lex $P1386, "$past"
.annotate "line", 491
    find_lex $P1388, "$/"
    unless_null $P1388, vivify_447
    new $P1388, "Hash"
  vivify_447:
    set $P1389, $P1388["proto"]
    unless_null $P1389, vivify_448
    new $P1389, "Undef"
  vivify_448:
    if $P1389, if_1387
.annotate "line", 518
    find_lex $P1413, "$key"
    set $S1414, $P1413
    iseq $I1415, $S1414, "open"
    if $I1415, if_1412
.annotate "line", 531
    .const 'Sub' $P1445 = "82_1266334201.91429" 
    capture_lex $P1445
    $P1445()
    goto if_1412_end
  if_1412:
.annotate "line", 518
    .const 'Sub' $P1417 = "81_1266334201.91429" 
    capture_lex $P1417
    $P1417()
  if_1412_end:
    goto if_1387_end
  if_1387:
.annotate "line", 493
    get_hll_global $P1390, ["PAST"], "Stmts"
.annotate "line", 494
    get_hll_global $P1391, ["PAST"], "Block"
    find_lex $P1392, "$name"
.annotate "line", 495
    get_hll_global $P1393, ["PAST"], "Op"
.annotate "line", 496
    get_hll_global $P1394, ["PAST"], "Var"
    $P1395 = $P1394."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1396, "$name"
    $P1397 = $P1393."new"($P1395, $P1396, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 495
    find_lex $P1398, "$/"
    $P1399 = $P1391."new"($P1397, $P1392 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1398 :named("node"))
.annotate "line", 505
    get_hll_global $P1400, ["PAST"], "Block"
    new $P1401, "String"
    assign $P1401, "!PREFIX__"
    find_lex $P1402, "$name"
    concat $P1403, $P1401, $P1402
.annotate "line", 506
    get_hll_global $P1404, ["PAST"], "Op"
.annotate "line", 507
    get_hll_global $P1405, ["PAST"], "Var"
    $P1406 = $P1405."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1407, "$name"
    $P1408 = $P1404."new"($P1406, $P1407, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 506
    find_lex $P1409, "$/"
    $P1410 = $P1400."new"($P1408, $P1403 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1409 :named("node"))
.annotate "line", 505
    $P1411 = $P1390."new"($P1399, $P1410)
.annotate "line", 493
    store_lex "$past", $P1411
  if_1387_end:
.annotate "line", 545
    find_lex $P1466, "$/"
    find_lex $P1467, "$past"
    $P1468 = $P1466."!make"($P1467)
.annotate "line", 485
    .return ($P1468)
  control_1372:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1469, exception, "payload"
    .return ($P1469)
.end


.namespace ["NQP";"Actions"]
.sub "_block1444"  :anon :subid("82_1266334201.91429") :outer("80_1266334201.91429")
.annotate "line", 532
    new $P1446, "Undef"
    .lex "$regex", $P1446
.annotate "line", 533
    get_hll_global $P1447, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1448, "$/"
    unless_null $P1448, vivify_449
    new $P1448, "Hash"
  vivify_449:
    set $P1449, $P1448["p6regex"]
    unless_null $P1449, vivify_450
    new $P1449, "Undef"
  vivify_450:
    $P1450 = $P1449."ast"()
    get_global $P1451, "@BLOCK"
    $P1452 = $P1451."shift"()
    $P1453 = $P1447($P1450, $P1452)
    store_lex "$regex", $P1453
.annotate "line", 534
    find_lex $P1454, "$regex"
    find_lex $P1455, "$name"
    $P1454."name"($P1455)
.annotate "line", 536
    get_hll_global $P1456, ["PAST"], "Op"
.annotate "line", 538
    get_hll_global $P1457, ["PAST"], "Var"
    new $P1458, "ResizablePMCArray"
    push $P1458, "Regex"
    $P1459 = $P1457."new"("Method" :named("name"), $P1458 :named("namespace"), "package" :named("scope"))
    find_lex $P1460, "$regex"
    $P1461 = $P1456."new"($P1459, $P1460, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate "line", 536
    store_lex "$past", $P1461
.annotate "line", 542
    find_lex $P1462, "$regex"
    find_lex $P1463, "$past"
    unless_null $P1463, vivify_451
    new $P1463, "Hash"
    store_lex "$past", $P1463
  vivify_451:
    set $P1463["sink"], $P1462
.annotate "line", 543
    find_lex $P1464, "@MODIFIERS"
    $P1465 = $P1464."shift"()
.annotate "line", 531
    .return ($P1465)
.end


.namespace ["NQP";"Actions"]
.sub "_block1416"  :anon :subid("81_1266334201.91429") :outer("80_1266334201.91429")
.annotate "line", 519
    new $P1418, "Hash"
    .lex "%h", $P1418
.annotate "line", 518
    find_lex $P1419, "%h"
.annotate "line", 520
    find_lex $P1421, "$/"
    unless_null $P1421, vivify_452
    new $P1421, "Hash"
  vivify_452:
    set $P1422, $P1421["sym"]
    unless_null $P1422, vivify_453
    new $P1422, "Undef"
  vivify_453:
    set $S1423, $P1422
    iseq $I1424, $S1423, "token"
    unless $I1424, if_1420_end
    new $P1425, "Integer"
    assign $P1425, 1
    find_lex $P1426, "%h"
    unless_null $P1426, vivify_454
    new $P1426, "Hash"
    store_lex "%h", $P1426
  vivify_454:
    set $P1426["r"], $P1425
  if_1420_end:
.annotate "line", 521
    find_lex $P1428, "$/"
    unless_null $P1428, vivify_455
    new $P1428, "Hash"
  vivify_455:
    set $P1429, $P1428["sym"]
    unless_null $P1429, vivify_456
    new $P1429, "Undef"
  vivify_456:
    set $S1430, $P1429
    iseq $I1431, $S1430, "rule"
    unless $I1431, if_1427_end
    new $P1432, "Integer"
    assign $P1432, 1
    find_lex $P1433, "%h"
    unless_null $P1433, vivify_457
    new $P1433, "Hash"
    store_lex "%h", $P1433
  vivify_457:
    set $P1433["r"], $P1432
    new $P1434, "Integer"
    assign $P1434, 1
    find_lex $P1435, "%h"
    unless_null $P1435, vivify_458
    new $P1435, "Hash"
    store_lex "%h", $P1435
  vivify_458:
    set $P1435["s"], $P1434
  if_1427_end:
.annotate "line", 522
    find_lex $P1436, "@MODIFIERS"
    find_lex $P1437, "%h"
    $P1436."unshift"($P1437)
.annotate "line", 523

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate "line", 527
    get_global $P1438, "@BLOCK"
    unless_null $P1438, vivify_459
    new $P1438, "ResizablePMCArray"
  vivify_459:
    set $P1439, $P1438[0]
    unless_null $P1439, vivify_460
    new $P1439, "Undef"
  vivify_460:
    $P1439."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate "line", 528
    get_global $P1440, "@BLOCK"
    unless_null $P1440, vivify_461
    new $P1440, "ResizablePMCArray"
  vivify_461:
    set $P1441, $P1440[0]
    unless_null $P1441, vivify_462
    new $P1441, "Undef"
  vivify_462:
    $P1441."symbol"("$/", "lexical" :named("scope"))
.annotate "line", 529
    new $P1442, "Exception"
    set $P1442['type'], 58
    new $P1443, "Integer"
    assign $P1443, 0
    setattribute $P1442, 'payload', $P1443
    throw $P1442
.annotate "line", 518
    .return ()
.end


.namespace ["NQP";"Actions"]
.sub "dotty"  :subid("83_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1473
.annotate "line", 549
    new $P1472, 'ExceptionHandler'
    set_addr $P1472, control_1471
    $P1472."handle_types"(58)
    push_eh $P1472
    .lex "self", self
    .lex "$/", param_1473
.annotate "line", 550
    new $P1474, "Undef"
    .lex "$past", $P1474
    find_lex $P1477, "$/"
    unless_null $P1477, vivify_463
    new $P1477, "Hash"
  vivify_463:
    set $P1478, $P1477["args"]
    unless_null $P1478, vivify_464
    new $P1478, "Undef"
  vivify_464:
    if $P1478, if_1476
    get_hll_global $P1483, ["PAST"], "Op"
    find_lex $P1484, "$/"
    $P1485 = $P1483."new"($P1484 :named("node"))
    set $P1475, $P1485
    goto if_1476_end
  if_1476:
    find_lex $P1479, "$/"
    unless_null $P1479, vivify_465
    new $P1479, "Hash"
  vivify_465:
    set $P1480, $P1479["args"]
    unless_null $P1480, vivify_466
    new $P1480, "ResizablePMCArray"
  vivify_466:
    set $P1481, $P1480[0]
    unless_null $P1481, vivify_467
    new $P1481, "Undef"
  vivify_467:
    $P1482 = $P1481."ast"()
    set $P1475, $P1482
  if_1476_end:
    store_lex "$past", $P1475
.annotate "line", 551
    find_lex $P1486, "$past"
    find_lex $P1489, "$/"
    unless_null $P1489, vivify_468
    new $P1489, "Hash"
  vivify_468:
    set $P1490, $P1489["quote"]
    unless_null $P1490, vivify_469
    new $P1490, "Undef"
  vivify_469:
    if $P1490, if_1488
    find_lex $P1494, "$/"
    unless_null $P1494, vivify_470
    new $P1494, "Hash"
  vivify_470:
    set $P1495, $P1494["longname"]
    unless_null $P1495, vivify_471
    new $P1495, "Undef"
  vivify_471:
    set $S1496, $P1495
    new $P1487, 'String'
    set $P1487, $S1496
    goto if_1488_end
  if_1488:
    find_lex $P1491, "$/"
    unless_null $P1491, vivify_472
    new $P1491, "Hash"
  vivify_472:
    set $P1492, $P1491["quote"]
    unless_null $P1492, vivify_473
    new $P1492, "Undef"
  vivify_473:
    $P1493 = $P1492."ast"()
    set $P1487, $P1493
  if_1488_end:
    $P1486."name"($P1487)
.annotate "line", 552
    find_lex $P1497, "$past"
    $P1497."pasttype"("callmethod")
.annotate "line", 553
    find_lex $P1498, "$/"
    find_lex $P1499, "$past"
    $P1500 = $P1498."!make"($P1499)
.annotate "line", 549
    .return ($P1500)
  control_1471:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1501, exception, "payload"
    .return ($P1501)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<self>"  :subid("84_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1505
.annotate "line", 558
    new $P1504, 'ExceptionHandler'
    set_addr $P1504, control_1503
    $P1504."handle_types"(58)
    push_eh $P1504
    .lex "self", self
    .lex "$/", param_1505
.annotate "line", 559
    find_lex $P1506, "$/"
    get_hll_global $P1507, ["PAST"], "Var"
    $P1508 = $P1507."new"("self" :named("name"))
    $P1509 = $P1506."!make"($P1508)
.annotate "line", 558
    .return ($P1509)
  control_1503:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1510, exception, "payload"
    .return ($P1510)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<identifier>"  :subid("85_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1514
.annotate "line", 562
    new $P1513, 'ExceptionHandler'
    set_addr $P1513, control_1512
    $P1513."handle_types"(58)
    push_eh $P1513
    .lex "self", self
    .lex "$/", param_1514
.annotate "line", 563
    new $P1515, "Undef"
    .lex "$past", $P1515
    find_lex $P1516, "$/"
    unless_null $P1516, vivify_474
    new $P1516, "Hash"
  vivify_474:
    set $P1517, $P1516["args"]
    unless_null $P1517, vivify_475
    new $P1517, "Undef"
  vivify_475:
    $P1518 = $P1517."ast"()
    store_lex "$past", $P1518
.annotate "line", 564
    find_lex $P1519, "$past"
    find_lex $P1520, "$/"
    unless_null $P1520, vivify_476
    new $P1520, "Hash"
  vivify_476:
    set $P1521, $P1520["identifier"]
    unless_null $P1521, vivify_477
    new $P1521, "Undef"
  vivify_477:
    set $S1522, $P1521
    $P1519."name"($S1522)
.annotate "line", 565
    find_lex $P1523, "$/"
    find_lex $P1524, "$past"
    $P1525 = $P1523."!make"($P1524)
.annotate "line", 562
    .return ($P1525)
  control_1512:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1526, exception, "payload"
    .return ($P1526)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<name>"  :subid("86_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1530
.annotate "line", 568
    new $P1529, 'ExceptionHandler'
    set_addr $P1529, control_1528
    $P1529."handle_types"(58)
    push_eh $P1529
    .lex "self", self
    .lex "$/", param_1530
.annotate "line", 569
    new $P1531, "ResizablePMCArray"
    .lex "@ns", $P1531
.annotate "line", 570
    new $P1532, "Undef"
    .lex "$name", $P1532
.annotate "line", 572
    new $P1533, "Undef"
    .lex "$var", $P1533
.annotate "line", 574
    new $P1534, "Undef"
    .lex "$past", $P1534
.annotate "line", 569
    find_lex $P1535, "$/"
    unless_null $P1535, vivify_478
    new $P1535, "Hash"
  vivify_478:
    set $P1536, $P1535["name"]
    unless_null $P1536, vivify_479
    new $P1536, "Hash"
  vivify_479:
    set $P1537, $P1536["identifier"]
    unless_null $P1537, vivify_480
    new $P1537, "Undef"
  vivify_480:
    clone $P1538, $P1537
    store_lex "@ns", $P1538
.annotate "line", 570
    find_lex $P1539, "@ns"
    $P1540 = $P1539."pop"()
    store_lex "$name", $P1540
.annotate "line", 571
    find_lex $P1544, "@ns"
    if $P1544, if_1543
    set $P1542, $P1544
    goto if_1543_end
  if_1543:
    find_lex $P1545, "@ns"
    unless_null $P1545, vivify_481
    new $P1545, "ResizablePMCArray"
  vivify_481:
    set $P1546, $P1545[0]
    unless_null $P1546, vivify_482
    new $P1546, "Undef"
  vivify_482:
    set $S1547, $P1546
    iseq $I1548, $S1547, "GLOBAL"
    new $P1542, 'Integer'
    set $P1542, $I1548
  if_1543_end:
    unless $P1542, if_1541_end
    find_lex $P1549, "@ns"
    $P1549."shift"()
  if_1541_end:
.annotate "line", 573
    get_hll_global $P1550, ["PAST"], "Var"
    find_lex $P1551, "$name"
    set $S1552, $P1551
    find_lex $P1553, "@ns"
    $P1554 = $P1550."new"($S1552 :named("name"), $P1553 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1554
.annotate "line", 574
    find_lex $P1555, "$var"
    store_lex "$past", $P1555
.annotate "line", 575
    find_lex $P1557, "$/"
    unless_null $P1557, vivify_483
    new $P1557, "Hash"
  vivify_483:
    set $P1558, $P1557["args"]
    unless_null $P1558, vivify_484
    new $P1558, "Undef"
  vivify_484:
    unless $P1558, if_1556_end
.annotate "line", 576
    find_lex $P1559, "$/"
    unless_null $P1559, vivify_485
    new $P1559, "Hash"
  vivify_485:
    set $P1560, $P1559["args"]
    unless_null $P1560, vivify_486
    new $P1560, "ResizablePMCArray"
  vivify_486:
    set $P1561, $P1560[0]
    unless_null $P1561, vivify_487
    new $P1561, "Undef"
  vivify_487:
    $P1562 = $P1561."ast"()
    store_lex "$past", $P1562
.annotate "line", 577
    find_lex $P1563, "$past"
    find_lex $P1564, "$var"
    $P1563."unshift"($P1564)
  if_1556_end:
.annotate "line", 579
    find_lex $P1565, "$/"
    find_lex $P1566, "$past"
    $P1567 = $P1565."!make"($P1566)
.annotate "line", 568
    .return ($P1567)
  control_1528:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1568, exception, "payload"
    .return ($P1568)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<pir::op>"  :subid("87_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1572
.annotate "line", 582
    new $P1571, 'ExceptionHandler'
    set_addr $P1571, control_1570
    $P1571."handle_types"(58)
    push_eh $P1571
    .lex "self", self
    .lex "$/", param_1572
.annotate "line", 583
    new $P1573, "Undef"
    .lex "$past", $P1573
.annotate "line", 584
    new $P1574, "Undef"
    .lex "$pirop", $P1574
.annotate "line", 583
    find_lex $P1577, "$/"
    unless_null $P1577, vivify_488
    new $P1577, "Hash"
  vivify_488:
    set $P1578, $P1577["args"]
    unless_null $P1578, vivify_489
    new $P1578, "Undef"
  vivify_489:
    if $P1578, if_1576
    get_hll_global $P1583, ["PAST"], "Op"
    find_lex $P1584, "$/"
    $P1585 = $P1583."new"($P1584 :named("node"))
    set $P1575, $P1585
    goto if_1576_end
  if_1576:
    find_lex $P1579, "$/"
    unless_null $P1579, vivify_490
    new $P1579, "Hash"
  vivify_490:
    set $P1580, $P1579["args"]
    unless_null $P1580, vivify_491
    new $P1580, "ResizablePMCArray"
  vivify_491:
    set $P1581, $P1580[0]
    unless_null $P1581, vivify_492
    new $P1581, "Undef"
  vivify_492:
    $P1582 = $P1581."ast"()
    set $P1575, $P1582
  if_1576_end:
    store_lex "$past", $P1575
.annotate "line", 584
    find_lex $P1586, "$/"
    unless_null $P1586, vivify_493
    new $P1586, "Hash"
  vivify_493:
    set $P1587, $P1586["op"]
    unless_null $P1587, vivify_494
    new $P1587, "Undef"
  vivify_494:
    set $S1588, $P1587
    new $P1589, 'String'
    set $P1589, $S1588
    store_lex "$pirop", $P1589
.annotate "line", 585

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1590 = box $S0
    
    store_lex "$pirop", $P1590
.annotate "line", 592
    find_lex $P1591, "$past"
    find_lex $P1592, "$pirop"
    $P1591."pirop"($P1592)
.annotate "line", 593
    find_lex $P1593, "$past"
    $P1593."pasttype"("pirop")
.annotate "line", 594
    find_lex $P1594, "$/"
    find_lex $P1595, "$past"
    $P1596 = $P1594."!make"($P1595)
.annotate "line", 582
    .return ($P1596)
  control_1570:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1597, exception, "payload"
    .return ($P1597)
.end


.namespace ["NQP";"Actions"]
.sub "args"  :subid("88_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1601
.annotate "line", 597
    new $P1600, 'ExceptionHandler'
    set_addr $P1600, control_1599
    $P1600."handle_types"(58)
    push_eh $P1600
    .lex "self", self
    .lex "$/", param_1601
    find_lex $P1602, "$/"
    find_lex $P1603, "$/"
    unless_null $P1603, vivify_495
    new $P1603, "Hash"
  vivify_495:
    set $P1604, $P1603["arglist"]
    unless_null $P1604, vivify_496
    new $P1604, "Undef"
  vivify_496:
    $P1605 = $P1604."ast"()
    $P1606 = $P1602."!make"($P1605)
    .return ($P1606)
  control_1599:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1607, exception, "payload"
    .return ($P1607)
.end


.namespace ["NQP";"Actions"]
.sub "arglist"  :subid("89_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1611
.annotate "line", 599
    .const 'Sub' $P1622 = "90_1266334201.91429" 
    capture_lex $P1622
    new $P1610, 'ExceptionHandler'
    set_addr $P1610, control_1609
    $P1610."handle_types"(58)
    push_eh $P1610
    .lex "self", self
    .lex "$/", param_1611
.annotate "line", 600
    new $P1612, "Undef"
    .lex "$past", $P1612
.annotate "line", 608
    new $P1613, "Undef"
    .lex "$i", $P1613
.annotate "line", 609
    new $P1614, "Undef"
    .lex "$n", $P1614
.annotate "line", 600
    get_hll_global $P1615, ["PAST"], "Op"
    find_lex $P1616, "$/"
    $P1617 = $P1615."new"("call" :named("pasttype"), $P1616 :named("node"))
    store_lex "$past", $P1617
.annotate "line", 601
    find_lex $P1619, "$/"
    unless_null $P1619, vivify_497
    new $P1619, "Hash"
  vivify_497:
    set $P1620, $P1619["EXPR"]
    unless_null $P1620, vivify_498
    new $P1620, "Undef"
  vivify_498:
    unless $P1620, if_1618_end
    .const 'Sub' $P1622 = "90_1266334201.91429" 
    capture_lex $P1622
    $P1622()
  if_1618_end:
.annotate "line", 608
    new $P1654, "Integer"
    assign $P1654, 0
    store_lex "$i", $P1654
.annotate "line", 609
    find_lex $P1655, "$past"
    $P1656 = $P1655."list"()
    set $N1657, $P1656
    new $P1658, 'Float'
    set $P1658, $N1657
    store_lex "$n", $P1658
.annotate "line", 610
    new $P1686, 'ExceptionHandler'
    set_addr $P1686, loop1685_handler
    $P1686."handle_types"(65, 67, 66)
    push_eh $P1686
  loop1685_test:
    find_lex $P1659, "$i"
    set $N1660, $P1659
    find_lex $P1661, "$n"
    set $N1662, $P1661
    islt $I1663, $N1660, $N1662
    unless $I1663, loop1685_done
  loop1685_redo:
.annotate "line", 611
    find_lex $P1665, "$i"
    set $I1666, $P1665
    find_lex $P1667, "$past"
    unless_null $P1667, vivify_502
    new $P1667, "ResizablePMCArray"
  vivify_502:
    set $P1668, $P1667[$I1666]
    unless_null $P1668, vivify_503
    new $P1668, "Undef"
  vivify_503:
    $S1669 = $P1668."name"()
    iseq $I1670, $S1669, "&prefix:<|>"
    unless $I1670, if_1664_end
.annotate "line", 612
    find_lex $P1671, "$i"
    set $I1672, $P1671
    find_lex $P1673, "$past"
    unless_null $P1673, vivify_504
    new $P1673, "ResizablePMCArray"
  vivify_504:
    set $P1674, $P1673[$I1672]
    unless_null $P1674, vivify_505
    new $P1674, "ResizablePMCArray"
  vivify_505:
    set $P1675, $P1674[0]
    unless_null $P1675, vivify_506
    new $P1675, "Undef"
  vivify_506:
    find_lex $P1676, "$i"
    set $I1677, $P1676
    find_lex $P1678, "$past"
    unless_null $P1678, vivify_507
    new $P1678, "ResizablePMCArray"
    store_lex "$past", $P1678
  vivify_507:
    set $P1678[$I1677], $P1675
.annotate "line", 613
    find_lex $P1679, "$i"
    set $I1680, $P1679
    find_lex $P1681, "$past"
    unless_null $P1681, vivify_508
    new $P1681, "ResizablePMCArray"
  vivify_508:
    set $P1682, $P1681[$I1680]
    unless_null $P1682, vivify_509
    new $P1682, "Undef"
  vivify_509:
    $P1682."flat"(1)
  if_1664_end:
.annotate "line", 611
    find_lex $P1683, "$i"
    clone $P1684, $P1683
    inc $P1683
  loop1685_next:
.annotate "line", 610
    goto loop1685_test
  loop1685_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1687, exception, 'type'
    eq $P1687, 65, loop1685_next
    eq $P1687, 67, loop1685_redo
  loop1685_done:
    pop_eh 
.annotate "line", 617
    find_lex $P1688, "$/"
    find_lex $P1689, "$past"
    $P1690 = $P1688."!make"($P1689)
.annotate "line", 599
    .return ($P1690)
  control_1609:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1691, exception, "payload"
    .return ($P1691)
.end


.namespace ["NQP";"Actions"]
.sub "_block1621"  :anon :subid("90_1266334201.91429") :outer("89_1266334201.91429")
.annotate "line", 601
    .const 'Sub' $P1643 = "91_1266334201.91429" 
    capture_lex $P1643
.annotate "line", 602
    new $P1623, "Undef"
    .lex "$expr", $P1623
    find_lex $P1624, "$/"
    unless_null $P1624, vivify_499
    new $P1624, "Hash"
  vivify_499:
    set $P1625, $P1624["EXPR"]
    unless_null $P1625, vivify_500
    new $P1625, "Undef"
  vivify_500:
    $P1626 = $P1625."ast"()
    store_lex "$expr", $P1626
.annotate "line", 603
    find_lex $P1631, "$expr"
    $S1632 = $P1631."name"()
    iseq $I1633, $S1632, "&infix:<,>"
    if $I1633, if_1630
    new $P1629, 'Integer'
    set $P1629, $I1633
    goto if_1630_end
  if_1630:
    find_lex $P1634, "$expr"
    $P1635 = $P1634."named"()
    isfalse $I1636, $P1635
    new $P1629, 'Integer'
    set $P1629, $I1636
  if_1630_end:
    if $P1629, if_1628
.annotate "line", 606
    find_lex $P1651, "$past"
    find_lex $P1652, "$expr"
    $P1653 = $P1651."push"($P1652)
    set $P1627, $P1653
.annotate "line", 603
    goto if_1628_end
  if_1628:
.annotate "line", 604
    find_lex $P1638, "$expr"
    $P1639 = $P1638."list"()
    defined $I1640, $P1639
    unless $I1640, for_undef_501
    iter $P1637, $P1639
    new $P1649, 'ExceptionHandler'
    set_addr $P1649, loop1648_handler
    $P1649."handle_types"(65, 67, 66)
    push_eh $P1649
  loop1648_test:
    unless $P1637, loop1648_done
    shift $P1641, $P1637
  loop1648_redo:
    .const 'Sub' $P1643 = "91_1266334201.91429" 
    capture_lex $P1643
    $P1643($P1641)
  loop1648_next:
    goto loop1648_test
  loop1648_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1650, exception, 'type'
    eq $P1650, 65, loop1648_next
    eq $P1650, 67, loop1648_redo
  loop1648_done:
    pop_eh 
  for_undef_501:
.annotate "line", 603
    set $P1627, $P1637
  if_1628_end:
.annotate "line", 601
    .return ($P1627)
.end


.namespace ["NQP";"Actions"]
.sub "_block1642"  :anon :subid("91_1266334201.91429") :outer("90_1266334201.91429")
    .param pmc param_1644
.annotate "line", 604
    .lex "$_", param_1644
    find_lex $P1645, "$past"
    find_lex $P1646, "$_"
    $P1647 = $P1645."push"($P1646)
    .return ($P1647)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<value>"  :subid("92_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1695
.annotate "line", 621
    new $P1694, 'ExceptionHandler'
    set_addr $P1694, control_1693
    $P1694."handle_types"(58)
    push_eh $P1694
    .lex "self", self
    .lex "$/", param_1695
    find_lex $P1696, "$/"
    find_lex $P1697, "$/"
    unless_null $P1697, vivify_510
    new $P1697, "Hash"
  vivify_510:
    set $P1698, $P1697["value"]
    unless_null $P1698, vivify_511
    new $P1698, "Undef"
  vivify_511:
    $P1699 = $P1698."ast"()
    $P1700 = $P1696."!make"($P1699)
    .return ($P1700)
  control_1693:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1701, exception, "payload"
    .return ($P1701)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<( )>"  :subid("93_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1705
.annotate "line", 623
    new $P1704, 'ExceptionHandler'
    set_addr $P1704, control_1703
    $P1704."handle_types"(58)
    push_eh $P1704
    .lex "self", self
    .lex "$/", param_1705
.annotate "line", 624
    find_lex $P1706, "$/"
.annotate "line", 625
    find_lex $P1709, "$/"
    unless_null $P1709, vivify_512
    new $P1709, "Hash"
  vivify_512:
    set $P1710, $P1709["EXPR"]
    unless_null $P1710, vivify_513
    new $P1710, "Undef"
  vivify_513:
    if $P1710, if_1708
.annotate "line", 626
    get_hll_global $P1715, ["PAST"], "Op"
    find_lex $P1716, "$/"
    $P1717 = $P1715."new"("list" :named("pasttype"), $P1716 :named("node"))
    set $P1707, $P1717
.annotate "line", 625
    goto if_1708_end
  if_1708:
    find_lex $P1711, "$/"
    unless_null $P1711, vivify_514
    new $P1711, "Hash"
  vivify_514:
    set $P1712, $P1711["EXPR"]
    unless_null $P1712, vivify_515
    new $P1712, "ResizablePMCArray"
  vivify_515:
    set $P1713, $P1712[0]
    unless_null $P1713, vivify_516
    new $P1713, "Undef"
  vivify_516:
    $P1714 = $P1713."ast"()
    set $P1707, $P1714
  if_1708_end:
    $P1718 = $P1706."!make"($P1707)
.annotate "line", 623
    .return ($P1718)
  control_1703:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1719, exception, "payload"
    .return ($P1719)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<[ ]>"  :subid("94_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1723
.annotate "line", 629
    new $P1722, 'ExceptionHandler'
    set_addr $P1722, control_1721
    $P1722."handle_types"(58)
    push_eh $P1722
    .lex "self", self
    .lex "$/", param_1723
.annotate "line", 630
    new $P1724, "Undef"
    .lex "$past", $P1724
.annotate "line", 629
    find_lex $P1725, "$past"
.annotate "line", 631
    find_lex $P1727, "$/"
    unless_null $P1727, vivify_517
    new $P1727, "Hash"
  vivify_517:
    set $P1728, $P1727["EXPR"]
    unless_null $P1728, vivify_518
    new $P1728, "Undef"
  vivify_518:
    if $P1728, if_1726
.annotate "line", 638
    get_hll_global $P1740, ["PAST"], "Op"
    $P1741 = $P1740."new"("list" :named("pasttype"))
    store_lex "$past", $P1741
.annotate "line", 637
    goto if_1726_end
  if_1726:
.annotate "line", 632
    find_lex $P1729, "$/"
    unless_null $P1729, vivify_519
    new $P1729, "Hash"
  vivify_519:
    set $P1730, $P1729["EXPR"]
    unless_null $P1730, vivify_520
    new $P1730, "ResizablePMCArray"
  vivify_520:
    set $P1731, $P1730[0]
    unless_null $P1731, vivify_521
    new $P1731, "Undef"
  vivify_521:
    $P1732 = $P1731."ast"()
    store_lex "$past", $P1732
.annotate "line", 633
    find_lex $P1734, "$past"
    $S1735 = $P1734."name"()
    isne $I1736, $S1735, "&infix:<,>"
    unless $I1736, if_1733_end
.annotate "line", 634
    get_hll_global $P1737, ["PAST"], "Op"
    find_lex $P1738, "$past"
    $P1739 = $P1737."new"($P1738, "list" :named("pasttype"))
    store_lex "$past", $P1739
  if_1733_end:
  if_1726_end:
.annotate "line", 640
    find_lex $P1742, "$past"
    $P1742."name"("&circumfix:<[ ]>")
.annotate "line", 641
    find_lex $P1743, "$/"
    find_lex $P1744, "$past"
    $P1745 = $P1743."!make"($P1744)
.annotate "line", 629
    .return ($P1745)
  control_1721:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1746, exception, "payload"
    .return ($P1746)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<ang>"  :subid("95_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1750
.annotate "line", 644
    new $P1749, 'ExceptionHandler'
    set_addr $P1749, control_1748
    $P1749."handle_types"(58)
    push_eh $P1749
    .lex "self", self
    .lex "$/", param_1750
    find_lex $P1751, "$/"
    find_lex $P1752, "$/"
    unless_null $P1752, vivify_522
    new $P1752, "Hash"
  vivify_522:
    set $P1753, $P1752["quote_EXPR"]
    unless_null $P1753, vivify_523
    new $P1753, "Undef"
  vivify_523:
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
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("96_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1760
.annotate "line", 645
    new $P1759, 'ExceptionHandler'
    set_addr $P1759, control_1758
    $P1759."handle_types"(58)
    push_eh $P1759
    .lex "self", self
    .lex "$/", param_1760
    find_lex $P1761, "$/"
    find_lex $P1762, "$/"
    unless_null $P1762, vivify_524
    new $P1762, "Hash"
  vivify_524:
    set $P1763, $P1762["quote_EXPR"]
    unless_null $P1763, vivify_525
    new $P1763, "Undef"
  vivify_525:
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
.sub "circumfix:sym<{ }>"  :subid("97_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1770
.annotate "line", 647
    new $P1769, 'ExceptionHandler'
    set_addr $P1769, control_1768
    $P1769."handle_types"(58)
    push_eh $P1769
    .lex "self", self
    .lex "$/", param_1770
.annotate "line", 648
    find_lex $P1771, "$/"
    find_lex $P1774, "$/"
    unless_null $P1774, vivify_526
    new $P1774, "Hash"
  vivify_526:
    set $P1775, $P1774["pblock"]
    unless_null $P1775, vivify_527
    new $P1775, "Hash"
  vivify_527:
    set $P1776, $P1775["blockoid"]
    unless_null $P1776, vivify_528
    new $P1776, "Hash"
  vivify_528:
    set $P1777, $P1776["statementlist"]
    unless_null $P1777, vivify_529
    new $P1777, "Hash"
  vivify_529:
    set $P1778, $P1777["statement"]
    unless_null $P1778, vivify_530
    new $P1778, "Undef"
  vivify_530:
    set $N1779, $P1778
    isgt $I1780, $N1779, 0.0
    if $I1780, if_1773
.annotate "line", 650
    get_hll_global $P1784, ["PAST"], "Op"
    find_lex $P1785, "$/"
    $P1786 = $P1784."new"("    %r = new [\"Hash\"]" :named("inline"), $P1785 :named("node"))
    set $P1772, $P1786
.annotate "line", 648
    goto if_1773_end
  if_1773:
.annotate "line", 649
    find_lex $P1781, "$/"
    unless_null $P1781, vivify_531
    new $P1781, "Hash"
  vivify_531:
    set $P1782, $P1781["pblock"]
    unless_null $P1782, vivify_532
    new $P1782, "Undef"
  vivify_532:
    $P1783 = $P1782."ast"()
    set $P1772, $P1783
  if_1773_end:
    $P1787 = $P1771."!make"($P1772)
.annotate "line", 647
    .return ($P1787)
  control_1768:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1788, exception, "payload"
    .return ($P1788)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<sigil>"  :subid("98_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1792
.annotate "line", 653
    new $P1791, 'ExceptionHandler'
    set_addr $P1791, control_1790
    $P1791."handle_types"(58)
    push_eh $P1791
    .lex "self", self
    .lex "$/", param_1792
.annotate "line", 654
    new $P1793, "Undef"
    .lex "$name", $P1793
    find_lex $P1796, "$/"
    unless_null $P1796, vivify_533
    new $P1796, "Hash"
  vivify_533:
    set $P1797, $P1796["sigil"]
    unless_null $P1797, vivify_534
    new $P1797, "Undef"
  vivify_534:
    set $S1798, $P1797
    iseq $I1799, $S1798, "@"
    if $I1799, if_1795
.annotate "line", 655
    find_lex $P1803, "$/"
    unless_null $P1803, vivify_535
    new $P1803, "Hash"
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
.annotate "line", 654
    goto if_1795_end
  if_1795:
    new $P1800, "String"
    assign $P1800, "list"
    set $P1794, $P1800
  if_1795_end:
    store_lex "$name", $P1794
.annotate "line", 657
    find_lex $P1809, "$/"
    get_hll_global $P1810, ["PAST"], "Op"
    find_lex $P1811, "$name"
    find_lex $P1812, "$/"
    unless_null $P1812, vivify_537
    new $P1812, "Hash"
  vivify_537:
    set $P1813, $P1812["semilist"]
    unless_null $P1813, vivify_538
    new $P1813, "Undef"
  vivify_538:
    $P1814 = $P1813."ast"()
    $P1815 = $P1810."new"($P1814, "callmethod" :named("pasttype"), $P1811 :named("name"))
    $P1816 = $P1809."!make"($P1815)
.annotate "line", 653
    .return ($P1816)
  control_1790:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1817, exception, "payload"
    .return ($P1817)
.end


.namespace ["NQP";"Actions"]
.sub "semilist"  :subid("99_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1821
.annotate "line", 660
    new $P1820, 'ExceptionHandler'
    set_addr $P1820, control_1819
    $P1820."handle_types"(58)
    push_eh $P1820
    .lex "self", self
    .lex "$/", param_1821
    find_lex $P1822, "$/"
    find_lex $P1823, "$/"
    unless_null $P1823, vivify_539
    new $P1823, "Hash"
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
.sub "postcircumfix:sym<[ ]>"  :subid("100_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1831
.annotate "line", 662
    new $P1830, 'ExceptionHandler'
    set_addr $P1830, control_1829
    $P1830."handle_types"(58)
    push_eh $P1830
    .lex "self", self
    .lex "$/", param_1831
.annotate "line", 663
    find_lex $P1832, "$/"
    get_hll_global $P1833, ["PAST"], "Var"
    find_lex $P1834, "$/"
    unless_null $P1834, vivify_541
    new $P1834, "Hash"
  vivify_541:
    set $P1835, $P1834["EXPR"]
    unless_null $P1835, vivify_542
    new $P1835, "Undef"
  vivify_542:
    $P1836 = $P1835."ast"()
    $P1837 = $P1833."new"($P1836, "keyed_int" :named("scope"), "Undef" :named("viviself"), "ResizablePMCArray" :named("vivibase"))
    $P1838 = $P1832."!make"($P1837)
.annotate "line", 662
    .return ($P1838)
  control_1829:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1839, exception, "payload"
    .return ($P1839)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<{ }>"  :subid("101_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1843
.annotate "line", 668
    new $P1842, 'ExceptionHandler'
    set_addr $P1842, control_1841
    $P1842."handle_types"(58)
    push_eh $P1842
    .lex "self", self
    .lex "$/", param_1843
.annotate "line", 669
    find_lex $P1844, "$/"
    get_hll_global $P1845, ["PAST"], "Var"
    find_lex $P1846, "$/"
    unless_null $P1846, vivify_543
    new $P1846, "Hash"
  vivify_543:
    set $P1847, $P1846["EXPR"]
    unless_null $P1847, vivify_544
    new $P1847, "Undef"
  vivify_544:
    $P1848 = $P1847."ast"()
    $P1849 = $P1845."new"($P1848, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1850 = $P1844."!make"($P1849)
.annotate "line", 668
    .return ($P1850)
  control_1841:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1851, exception, "payload"
    .return ($P1851)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<ang>"  :subid("102_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1855
.annotate "line", 674
    new $P1854, 'ExceptionHandler'
    set_addr $P1854, control_1853
    $P1854."handle_types"(58)
    push_eh $P1854
    .lex "self", self
    .lex "$/", param_1855
.annotate "line", 675
    find_lex $P1856, "$/"
    get_hll_global $P1857, ["PAST"], "Var"
    find_lex $P1858, "$/"
    unless_null $P1858, vivify_545
    new $P1858, "Hash"
  vivify_545:
    set $P1859, $P1858["quote_EXPR"]
    unless_null $P1859, vivify_546
    new $P1859, "Undef"
  vivify_546:
    $P1860 = $P1859."ast"()
    $P1861 = $P1857."new"($P1860, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1862 = $P1856."!make"($P1861)
.annotate "line", 674
    .return ($P1862)
  control_1853:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1863, exception, "payload"
    .return ($P1863)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<( )>"  :subid("103_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1867
.annotate "line", 680
    new $P1866, 'ExceptionHandler'
    set_addr $P1866, control_1865
    $P1866."handle_types"(58)
    push_eh $P1866
    .lex "self", self
    .lex "$/", param_1867
.annotate "line", 681
    find_lex $P1868, "$/"
    find_lex $P1869, "$/"
    unless_null $P1869, vivify_547
    new $P1869, "Hash"
  vivify_547:
    set $P1870, $P1869["arglist"]
    unless_null $P1870, vivify_548
    new $P1870, "Undef"
  vivify_548:
    $P1871 = $P1870."ast"()
    $P1872 = $P1868."!make"($P1871)
.annotate "line", 680
    .return ($P1872)
  control_1865:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1873, exception, "payload"
    .return ($P1873)
.end


.namespace ["NQP";"Actions"]
.sub "value"  :subid("104_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1877
.annotate "line", 684
    new $P1876, 'ExceptionHandler'
    set_addr $P1876, control_1875
    $P1876."handle_types"(58)
    push_eh $P1876
    .lex "self", self
    .lex "$/", param_1877
.annotate "line", 685
    find_lex $P1878, "$/"
    find_lex $P1881, "$/"
    unless_null $P1881, vivify_549
    new $P1881, "Hash"
  vivify_549:
    set $P1882, $P1881["quote"]
    unless_null $P1882, vivify_550
    new $P1882, "Undef"
  vivify_550:
    if $P1882, if_1880
    find_lex $P1886, "$/"
    unless_null $P1886, vivify_551
    new $P1886, "Hash"
  vivify_551:
    set $P1887, $P1886["number"]
    unless_null $P1887, vivify_552
    new $P1887, "Undef"
  vivify_552:
    $P1888 = $P1887."ast"()
    set $P1879, $P1888
    goto if_1880_end
  if_1880:
    find_lex $P1883, "$/"
    unless_null $P1883, vivify_553
    new $P1883, "Hash"
  vivify_553:
    set $P1884, $P1883["quote"]
    unless_null $P1884, vivify_554
    new $P1884, "Undef"
  vivify_554:
    $P1885 = $P1884."ast"()
    set $P1879, $P1885
  if_1880_end:
    $P1889 = $P1878."!make"($P1879)
.annotate "line", 684
    .return ($P1889)
  control_1875:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1890, exception, "payload"
    .return ($P1890)
.end


.namespace ["NQP";"Actions"]
.sub "number"  :subid("105_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1894
.annotate "line", 688
    new $P1893, 'ExceptionHandler'
    set_addr $P1893, control_1892
    $P1893."handle_types"(58)
    push_eh $P1893
    .lex "self", self
    .lex "$/", param_1894
.annotate "line", 689
    new $P1895, "Undef"
    .lex "$value", $P1895
    find_lex $P1898, "$/"
    unless_null $P1898, vivify_555
    new $P1898, "Hash"
  vivify_555:
    set $P1899, $P1898["dec_number"]
    unless_null $P1899, vivify_556
    new $P1899, "Undef"
  vivify_556:
    if $P1899, if_1897
    find_lex $P1903, "$/"
    unless_null $P1903, vivify_557
    new $P1903, "Hash"
  vivify_557:
    set $P1904, $P1903["integer"]
    unless_null $P1904, vivify_558
    new $P1904, "Undef"
  vivify_558:
    $P1905 = $P1904."ast"()
    set $P1896, $P1905
    goto if_1897_end
  if_1897:
    find_lex $P1900, "$/"
    unless_null $P1900, vivify_559
    new $P1900, "Hash"
  vivify_559:
    set $P1901, $P1900["dec_number"]
    unless_null $P1901, vivify_560
    new $P1901, "Undef"
  vivify_560:
    $P1902 = $P1901."ast"()
    set $P1896, $P1902
  if_1897_end:
    store_lex "$value", $P1896
.annotate "line", 690
    find_lex $P1907, "$/"
    unless_null $P1907, vivify_561
    new $P1907, "Hash"
  vivify_561:
    set $P1908, $P1907["sign"]
    unless_null $P1908, vivify_562
    new $P1908, "Undef"
  vivify_562:
    set $S1909, $P1908
    iseq $I1910, $S1909, "-"
    unless $I1910, if_1906_end
    find_lex $P1911, "$value"
    neg $P1912, $P1911
    store_lex "$value", $P1912
  if_1906_end:
.annotate "line", 691
    find_lex $P1913, "$/"
    get_hll_global $P1914, ["PAST"], "Val"
    find_lex $P1915, "$value"
    $P1916 = $P1914."new"($P1915 :named("value"))
    $P1917 = $P1913."!make"($P1916)
.annotate "line", 688
    .return ($P1917)
  control_1892:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1918, exception, "payload"
    .return ($P1918)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<apos>"  :subid("106_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1922
.annotate "line", 694
    new $P1921, 'ExceptionHandler'
    set_addr $P1921, control_1920
    $P1921."handle_types"(58)
    push_eh $P1921
    .lex "self", self
    .lex "$/", param_1922
    find_lex $P1923, "$/"
    find_lex $P1924, "$/"
    unless_null $P1924, vivify_563
    new $P1924, "Hash"
  vivify_563:
    set $P1925, $P1924["quote_EXPR"]
    unless_null $P1925, vivify_564
    new $P1925, "Undef"
  vivify_564:
    $P1926 = $P1925."ast"()
    $P1927 = $P1923."!make"($P1926)
    .return ($P1927)
  control_1920:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1928, exception, "payload"
    .return ($P1928)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<dblq>"  :subid("107_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1932
.annotate "line", 695
    new $P1931, 'ExceptionHandler'
    set_addr $P1931, control_1930
    $P1931."handle_types"(58)
    push_eh $P1931
    .lex "self", self
    .lex "$/", param_1932
    find_lex $P1933, "$/"
    find_lex $P1934, "$/"
    unless_null $P1934, vivify_565
    new $P1934, "Hash"
  vivify_565:
    set $P1935, $P1934["quote_EXPR"]
    unless_null $P1935, vivify_566
    new $P1935, "Undef"
  vivify_566:
    $P1936 = $P1935."ast"()
    $P1937 = $P1933."!make"($P1936)
    .return ($P1937)
  control_1930:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1938, exception, "payload"
    .return ($P1938)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<qq>"  :subid("108_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1942
.annotate "line", 696
    new $P1941, 'ExceptionHandler'
    set_addr $P1941, control_1940
    $P1941."handle_types"(58)
    push_eh $P1941
    .lex "self", self
    .lex "$/", param_1942
    find_lex $P1943, "$/"
    find_lex $P1944, "$/"
    unless_null $P1944, vivify_567
    new $P1944, "Hash"
  vivify_567:
    set $P1945, $P1944["quote_EXPR"]
    unless_null $P1945, vivify_568
    new $P1945, "Undef"
  vivify_568:
    $P1946 = $P1945."ast"()
    $P1947 = $P1943."!make"($P1946)
    .return ($P1947)
  control_1940:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1948, exception, "payload"
    .return ($P1948)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<q>"  :subid("109_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1952
.annotate "line", 697
    new $P1951, 'ExceptionHandler'
    set_addr $P1951, control_1950
    $P1951."handle_types"(58)
    push_eh $P1951
    .lex "self", self
    .lex "$/", param_1952
    find_lex $P1953, "$/"
    find_lex $P1954, "$/"
    unless_null $P1954, vivify_569
    new $P1954, "Hash"
  vivify_569:
    set $P1955, $P1954["quote_EXPR"]
    unless_null $P1955, vivify_570
    new $P1955, "Undef"
  vivify_570:
    $P1956 = $P1955."ast"()
    $P1957 = $P1953."!make"($P1956)
    .return ($P1957)
  control_1950:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1958, exception, "payload"
    .return ($P1958)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q>"  :subid("110_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1962
.annotate "line", 698
    new $P1961, 'ExceptionHandler'
    set_addr $P1961, control_1960
    $P1961."handle_types"(58)
    push_eh $P1961
    .lex "self", self
    .lex "$/", param_1962
    find_lex $P1963, "$/"
    find_lex $P1964, "$/"
    unless_null $P1964, vivify_571
    new $P1964, "Hash"
  vivify_571:
    set $P1965, $P1964["quote_EXPR"]
    unless_null $P1965, vivify_572
    new $P1965, "Undef"
  vivify_572:
    $P1966 = $P1965."ast"()
    $P1967 = $P1963."!make"($P1966)
    .return ($P1967)
  control_1960:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1968, exception, "payload"
    .return ($P1968)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q:PIR>"  :subid("111_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1972
.annotate "line", 699
    new $P1971, 'ExceptionHandler'
    set_addr $P1971, control_1970
    $P1971."handle_types"(58)
    push_eh $P1971
    .lex "self", self
    .lex "$/", param_1972
.annotate "line", 700
    find_lex $P1973, "$/"
    get_hll_global $P1974, ["PAST"], "Op"
    find_lex $P1975, "$/"
    unless_null $P1975, vivify_573
    new $P1975, "Hash"
  vivify_573:
    set $P1976, $P1975["quote_EXPR"]
    unless_null $P1976, vivify_574
    new $P1976, "Undef"
  vivify_574:
    $P1977 = $P1976."ast"()
    $P1978 = $P1977."value"()
    find_lex $P1979, "$/"
    $P1980 = $P1974."new"($P1978 :named("inline"), "inline" :named("pasttype"), $P1979 :named("node"))
    $P1981 = $P1973."!make"($P1980)
.annotate "line", 699
    .return ($P1981)
  control_1970:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1982, exception, "payload"
    .return ($P1982)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym</ />"  :subid("112_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_1986
    .param pmc param_1987 :optional
    .param int has_param_1987 :opt_flag
.annotate "line", 705
    new $P1985, 'ExceptionHandler'
    set_addr $P1985, control_1984
    $P1985."handle_types"(58)
    push_eh $P1985
    .lex "self", self
    .lex "$/", param_1986
    if has_param_1987, optparam_575
    new $P1988, "Undef"
    set param_1987, $P1988
  optparam_575:
    .lex "$key", param_1987
.annotate "line", 715
    new $P1989, "Undef"
    .lex "$regex", $P1989
.annotate "line", 717
    new $P1990, "Undef"
    .lex "$past", $P1990
.annotate "line", 706
    find_lex $P1992, "$key"
    set $S1993, $P1992
    iseq $I1994, $S1993, "open"
    unless $I1994, if_1991_end
.annotate "line", 707

            null $P0
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate "line", 711
    get_global $P1995, "@BLOCK"
    unless_null $P1995, vivify_576
    new $P1995, "ResizablePMCArray"
  vivify_576:
    set $P1996, $P1995[0]
    unless_null $P1996, vivify_577
    new $P1996, "Undef"
  vivify_577:
    $P1996."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate "line", 712
    get_global $P1997, "@BLOCK"
    unless_null $P1997, vivify_578
    new $P1997, "ResizablePMCArray"
  vivify_578:
    set $P1998, $P1997[0]
    unless_null $P1998, vivify_579
    new $P1998, "Undef"
  vivify_579:
    $P1998."symbol"("$/", "lexical" :named("scope"))
.annotate "line", 713
    new $P1999, "Exception"
    set $P1999['type'], 58
    new $P2000, "Integer"
    assign $P2000, 0
    setattribute $P1999, 'payload', $P2000
    throw $P1999
  if_1991_end:
.annotate "line", 716
    get_hll_global $P2001, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P2002, "$/"
    unless_null $P2002, vivify_580
    new $P2002, "Hash"
  vivify_580:
    set $P2003, $P2002["p6regex"]
    unless_null $P2003, vivify_581
    new $P2003, "Undef"
  vivify_581:
    $P2004 = $P2003."ast"()
    get_global $P2005, "@BLOCK"
    $P2006 = $P2005."shift"()
    $P2007 = $P2001($P2004, $P2006)
    store_lex "$regex", $P2007
.annotate "line", 718
    get_hll_global $P2008, ["PAST"], "Op"
.annotate "line", 720
    get_hll_global $P2009, ["PAST"], "Var"
    new $P2010, "ResizablePMCArray"
    push $P2010, "Regex"
    $P2011 = $P2009."new"("Regex" :named("name"), $P2010 :named("namespace"), "package" :named("scope"))
    find_lex $P2012, "$regex"
    $P2013 = $P2008."new"($P2011, $P2012, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate "line", 718
    store_lex "$past", $P2013
.annotate "line", 724
    find_lex $P2014, "$regex"
    find_lex $P2015, "$past"
    unless_null $P2015, vivify_582
    new $P2015, "Hash"
    store_lex "$past", $P2015
  vivify_582:
    set $P2015["sink"], $P2014
.annotate "line", 725
    find_lex $P2016, "$/"
    find_lex $P2017, "$past"
    $P2018 = $P2016."!make"($P2017)
.annotate "line", 705
    .return ($P2018)
  control_1984:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2019, exception, "payload"
    .return ($P2019)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<$>"  :subid("113_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_2023
.annotate "line", 728
    new $P2022, 'ExceptionHandler'
    set_addr $P2022, control_2021
    $P2022."handle_types"(58)
    push_eh $P2022
    .lex "self", self
    .lex "$/", param_2023
    find_lex $P2024, "$/"
    find_lex $P2025, "$/"
    unless_null $P2025, vivify_583
    new $P2025, "Hash"
  vivify_583:
    set $P2026, $P2025["variable"]
    unless_null $P2026, vivify_584
    new $P2026, "Undef"
  vivify_584:
    $P2027 = $P2026."ast"()
    $P2028 = $P2024."!make"($P2027)
    .return ($P2028)
  control_2021:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2029, exception, "payload"
    .return ($P2029)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<{ }>"  :subid("114_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_2033
.annotate "line", 729
    new $P2032, 'ExceptionHandler'
    set_addr $P2032, control_2031
    $P2032."handle_types"(58)
    push_eh $P2032
    .lex "self", self
    .lex "$/", param_2033
.annotate "line", 730
    find_lex $P2034, "$/"
    get_hll_global $P2035, ["PAST"], "Op"
.annotate "line", 731
    find_lex $P2036, "$/"
    unless_null $P2036, vivify_585
    new $P2036, "Hash"
  vivify_585:
    set $P2037, $P2036["block"]
    unless_null $P2037, vivify_586
    new $P2037, "Undef"
  vivify_586:
    $P2038 = $P2037."ast"()
    $P2039 = "block_immediate"($P2038)
    find_lex $P2040, "$/"
    $P2041 = $P2035."new"($P2039, "set S*" :named("pirop"), $P2040 :named("node"))
.annotate "line", 730
    $P2042 = $P2034."!make"($P2041)
.annotate "line", 729
    .return ($P2042)
  control_2031:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2043, exception, "payload"
    .return ($P2043)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<.>"  :subid("115_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_2047
.annotate "line", 737
    new $P2046, 'ExceptionHandler'
    set_addr $P2046, control_2045
    $P2046."handle_types"(58)
    push_eh $P2046
    .lex "self", self
    .lex "$/", param_2047
    find_lex $P2048, "$/"
    find_lex $P2049, "$/"
    unless_null $P2049, vivify_587
    new $P2049, "Hash"
  vivify_587:
    set $P2050, $P2049["dotty"]
    unless_null $P2050, vivify_588
    new $P2050, "Undef"
  vivify_588:
    $P2051 = $P2050."ast"()
    $P2052 = $P2048."!make"($P2051)
    .return ($P2052)
  control_2045:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2053, exception, "payload"
    .return ($P2053)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<++>"  :subid("116_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_2057
.annotate "line", 739
    new $P2056, 'ExceptionHandler'
    set_addr $P2056, control_2055
    $P2056."handle_types"(58)
    push_eh $P2056
    .lex "self", self
    .lex "$/", param_2057
.annotate "line", 740
    find_lex $P2058, "$/"
    get_hll_global $P2059, ["PAST"], "Op"
.annotate "line", 741
    new $P2060, "ResizablePMCArray"
    push $P2060, "    clone %r, %0"
    push $P2060, "    inc %0"
    $P2061 = $P2059."new"("postfix:<++>" :named("name"), $P2060 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 740
    $P2062 = $P2058."!make"($P2061)
.annotate "line", 739
    .return ($P2062)
  control_2055:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2063, exception, "payload"
    .return ($P2063)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<-->"  :subid("117_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_2067
.annotate "line", 745
    new $P2066, 'ExceptionHandler'
    set_addr $P2066, control_2065
    $P2066."handle_types"(58)
    push_eh $P2066
    .lex "self", self
    .lex "$/", param_2067
.annotate "line", 746
    find_lex $P2068, "$/"
    get_hll_global $P2069, ["PAST"], "Op"
.annotate "line", 747
    new $P2070, "ResizablePMCArray"
    push $P2070, "    clone %r, %0"
    push $P2070, "    dec %0"
    $P2071 = $P2069."new"("postfix:<-->" :named("name"), $P2070 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 746
    $P2072 = $P2068."!make"($P2071)
.annotate "line", 745
    .return ($P2072)
  control_2065:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2073, exception, "payload"
    .return ($P2073)
.end


.namespace ["NQP";"Actions"]
.sub "prefix:sym<make>"  :subid("118_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_2077
.annotate "line", 751
    new $P2076, 'ExceptionHandler'
    set_addr $P2076, control_2075
    $P2076."handle_types"(58)
    push_eh $P2076
    .lex "self", self
    .lex "$/", param_2077
.annotate "line", 752
    find_lex $P2078, "$/"
    get_hll_global $P2079, ["PAST"], "Op"
.annotate "line", 753
    get_hll_global $P2080, ["PAST"], "Var"
    $P2081 = $P2080."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P2082, "$/"
    $P2083 = $P2079."new"($P2081, "callmethod" :named("pasttype"), "!make" :named("name"), $P2082 :named("node"))
.annotate "line", 752
    $P2084 = $P2078."!make"($P2083)
.annotate "line", 751
    .return ($P2084)
  control_2075:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2085, exception, "payload"
    .return ($P2085)
.end


.namespace ["NQP";"Actions"]
.sub "infix:sym<~~>"  :subid("119_1266334201.91429") :method :outer("11_1266334201.91429")
    .param pmc param_2089
.annotate "line", 760
    new $P2088, 'ExceptionHandler'
    set_addr $P2088, control_2087
    $P2088."handle_types"(58)
    push_eh $P2088
    .lex "self", self
    .lex "$/", param_2089
.annotate "line", 761
    find_lex $P2090, "$/"
    get_hll_global $P2091, ["PAST"], "Op"
    find_lex $P2092, "$/"
    $P2093 = $P2091."new"("callmethod" :named("pasttype"), "ACCEPTS" :named("name"), $P2092 :named("node"))
    $P2094 = $P2090."!make"($P2093)
.annotate "line", 760
    .return ($P2094)
  control_2087:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2095, exception, "payload"
    .return ($P2095)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block2096"  :subid("120_1266334201.91429") :outer("11_1266334201.91429")
.annotate "line", 765
    .const 'Sub' $P2132 = "124_1266334201.91429" 
    capture_lex $P2132
    .const 'Sub' $P2122 = "123_1266334201.91429" 
    capture_lex $P2122
    .const 'Sub' $P2112 = "122_1266334201.91429" 
    capture_lex $P2112
    .const 'Sub' $P2098 = "121_1266334201.91429" 
    capture_lex $P2098
.annotate "line", 776
    .const 'Sub' $P2132 = "124_1266334201.91429" 
    capture_lex $P2132
.annotate "line", 765
    .return ($P2132)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<:my>"  :subid("121_1266334201.91429") :method :outer("120_1266334201.91429")
    .param pmc param_2101
.annotate "line", 767
    new $P2100, 'ExceptionHandler'
    set_addr $P2100, control_2099
    $P2100."handle_types"(58)
    push_eh $P2100
    .lex "self", self
    .lex "$/", param_2101
.annotate "line", 768
    new $P2102, "Undef"
    .lex "$past", $P2102
    find_lex $P2103, "$/"
    unless_null $P2103, vivify_589
    new $P2103, "Hash"
  vivify_589:
    set $P2104, $P2103["statement"]
    unless_null $P2104, vivify_590
    new $P2104, "Undef"
  vivify_590:
    $P2105 = $P2104."ast"()
    store_lex "$past", $P2105
.annotate "line", 769
    find_lex $P2106, "$/"
    get_hll_global $P2107, ["PAST"], "Regex"
    find_lex $P2108, "$past"
    $P2109 = $P2107."new"($P2108, "pastnode" :named("pasttype"))
    $P2110 = $P2106."!make"($P2109)
.annotate "line", 767
    .return ($P2110)
  control_2099:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2111, exception, "payload"
    .return ($P2111)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<{ }>"  :subid("122_1266334201.91429") :method :outer("120_1266334201.91429")
    .param pmc param_2115
.annotate "line", 772
    new $P2114, 'ExceptionHandler'
    set_addr $P2114, control_2113
    $P2114."handle_types"(58)
    push_eh $P2114
    .lex "self", self
    .lex "$/", param_2115
    find_lex $P2116, "$/"
    find_lex $P2117, "$/"
    unless_null $P2117, vivify_591
    new $P2117, "Hash"
  vivify_591:
    set $P2118, $P2117["codeblock"]
    unless_null $P2118, vivify_592
    new $P2118, "Undef"
  vivify_592:
    $P2119 = $P2118."ast"()
    $P2120 = $P2116."!make"($P2119)
    .return ($P2120)
  control_2113:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2121, exception, "payload"
    .return ($P2121)
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<{ }>"  :subid("123_1266334201.91429") :method :outer("120_1266334201.91429")
    .param pmc param_2125
.annotate "line", 774
    new $P2124, 'ExceptionHandler'
    set_addr $P2124, control_2123
    $P2124."handle_types"(58)
    push_eh $P2124
    .lex "self", self
    .lex "$/", param_2125
    find_lex $P2126, "$/"
    find_lex $P2127, "$/"
    unless_null $P2127, vivify_593
    new $P2127, "Hash"
  vivify_593:
    set $P2128, $P2127["codeblock"]
    unless_null $P2128, vivify_594
    new $P2128, "Undef"
  vivify_594:
    $P2129 = $P2128."ast"()
    $P2130 = $P2126."!make"($P2129)
    .return ($P2130)
  control_2123:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2131, exception, "payload"
    .return ($P2131)
.end


.namespace ["NQP";"RegexActions"]
.sub "codeblock"  :subid("124_1266334201.91429") :method :outer("120_1266334201.91429")
    .param pmc param_2135
.annotate "line", 776
    new $P2134, 'ExceptionHandler'
    set_addr $P2134, control_2133
    $P2134."handle_types"(58)
    push_eh $P2134
    .lex "self", self
    .lex "$/", param_2135
.annotate "line", 777
    new $P2136, "Undef"
    .lex "$block", $P2136
.annotate "line", 779
    new $P2137, "Undef"
    .lex "$past", $P2137
.annotate "line", 777
    find_lex $P2138, "$/"
    unless_null $P2138, vivify_595
    new $P2138, "Hash"
  vivify_595:
    set $P2139, $P2138["block"]
    unless_null $P2139, vivify_596
    new $P2139, "Undef"
  vivify_596:
    $P2140 = $P2139."ast"()
    store_lex "$block", $P2140
.annotate "line", 778
    find_lex $P2141, "$block"
    $P2141."blocktype"("immediate")
.annotate "line", 780
    get_hll_global $P2142, ["PAST"], "Regex"
.annotate "line", 781
    get_hll_global $P2143, ["PAST"], "Stmts"
.annotate "line", 782
    get_hll_global $P2144, ["PAST"], "Op"
.annotate "line", 783
    get_hll_global $P2145, ["PAST"], "Var"
    $P2146 = $P2145."new"("$/" :named("name"))
.annotate "line", 784
    get_hll_global $P2147, ["PAST"], "Op"
.annotate "line", 785
    get_hll_global $P2148, ["PAST"], "Var"
    $P2149 = $P2148."new"(unicode:"$\x{a2}" :named("name"))
    $P2150 = $P2147."new"($P2149, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 784
    $P2151 = $P2144."new"($P2146, $P2150, "bind" :named("pasttype"))
.annotate "line", 782
    find_lex $P2152, "$block"
    $P2153 = $P2143."new"($P2151, $P2152)
.annotate "line", 781
    $P2154 = $P2142."new"($P2153, "pastnode" :named("pasttype"))
.annotate "line", 780
    store_lex "$past", $P2154
.annotate "line", 795
    find_lex $P2155, "$/"
    find_lex $P2156, "$past"
    $P2157 = $P2155."!make"($P2156)
.annotate "line", 776
    .return ($P2157)
  control_2133:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2158, exception, "payload"
    .return ($P2158)
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
