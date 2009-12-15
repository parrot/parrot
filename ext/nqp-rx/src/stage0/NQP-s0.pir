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
.sub "_block11"  :anon :subid("10_1260829317.63188")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
    $P1277 = $P14()
.annotate "line", 1
    .return ($P1277)
.end


.namespace []
.sub "" :load :init :subid("post327") :outer("10_1260829317.63188")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1260829317.63188" 
    .local pmc block
    set block, $P12
    $P1278 = get_root_global ["parrot"], "P6metaclass"
    $P1278."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1260829317.63188") :outer("10_1260829317.63188")
.annotate "line", 4
    get_hll_global $P1221, ["NQP";"Regex"], "_block1220" 
    capture_lex $P1221
    .const 'Sub' $P1207 = "313_1260829317.63188" 
    capture_lex $P1207
    .const 'Sub' $P1201 = "311_1260829317.63188" 
    capture_lex $P1201
    .const 'Sub' $P1195 = "309_1260829317.63188" 
    capture_lex $P1195
    .const 'Sub' $P1188 = "307_1260829317.63188" 
    capture_lex $P1188
    .const 'Sub' $P1181 = "305_1260829317.63188" 
    capture_lex $P1181
    .const 'Sub' $P1174 = "303_1260829317.63188" 
    capture_lex $P1174
    .const 'Sub' $P1167 = "301_1260829317.63188" 
    capture_lex $P1167
    .const 'Sub' $P1161 = "299_1260829317.63188" 
    capture_lex $P1161
    .const 'Sub' $P1154 = "297_1260829317.63188" 
    capture_lex $P1154
    .const 'Sub' $P1147 = "295_1260829317.63188" 
    capture_lex $P1147
    .const 'Sub' $P1140 = "293_1260829317.63188" 
    capture_lex $P1140
    .const 'Sub' $P1133 = "291_1260829317.63188" 
    capture_lex $P1133
    .const 'Sub' $P1126 = "289_1260829317.63188" 
    capture_lex $P1126
    .const 'Sub' $P1119 = "287_1260829317.63188" 
    capture_lex $P1119
    .const 'Sub' $P1112 = "285_1260829317.63188" 
    capture_lex $P1112
    .const 'Sub' $P1105 = "283_1260829317.63188" 
    capture_lex $P1105
    .const 'Sub' $P1098 = "281_1260829317.63188" 
    capture_lex $P1098
    .const 'Sub' $P1091 = "279_1260829317.63188" 
    capture_lex $P1091
    .const 'Sub' $P1084 = "277_1260829317.63188" 
    capture_lex $P1084
    .const 'Sub' $P1077 = "275_1260829317.63188" 
    capture_lex $P1077
    .const 'Sub' $P1070 = "273_1260829317.63188" 
    capture_lex $P1070
    .const 'Sub' $P1063 = "271_1260829317.63188" 
    capture_lex $P1063
    .const 'Sub' $P1056 = "269_1260829317.63188" 
    capture_lex $P1056
    .const 'Sub' $P1049 = "267_1260829317.63188" 
    capture_lex $P1049
    .const 'Sub' $P1042 = "265_1260829317.63188" 
    capture_lex $P1042
    .const 'Sub' $P1035 = "263_1260829317.63188" 
    capture_lex $P1035
    .const 'Sub' $P1028 = "261_1260829317.63188" 
    capture_lex $P1028
    .const 'Sub' $P1021 = "259_1260829317.63188" 
    capture_lex $P1021
    .const 'Sub' $P1014 = "257_1260829317.63188" 
    capture_lex $P1014
    .const 'Sub' $P1007 = "255_1260829317.63188" 
    capture_lex $P1007
    .const 'Sub' $P1000 = "253_1260829317.63188" 
    capture_lex $P1000
    .const 'Sub' $P993 = "251_1260829317.63188" 
    capture_lex $P993
    .const 'Sub' $P986 = "249_1260829317.63188" 
    capture_lex $P986
    .const 'Sub' $P979 = "247_1260829317.63188" 
    capture_lex $P979
    .const 'Sub' $P973 = "245_1260829317.63188" 
    capture_lex $P973
    .const 'Sub' $P966 = "243_1260829317.63188" 
    capture_lex $P966
    .const 'Sub' $P959 = "241_1260829317.63188" 
    capture_lex $P959
    .const 'Sub' $P952 = "239_1260829317.63188" 
    capture_lex $P952
    .const 'Sub' $P945 = "237_1260829317.63188" 
    capture_lex $P945
    .const 'Sub' $P938 = "235_1260829317.63188" 
    capture_lex $P938
    .const 'Sub' $P931 = "233_1260829317.63188" 
    capture_lex $P931
    .const 'Sub' $P924 = "231_1260829317.63188" 
    capture_lex $P924
    .const 'Sub' $P918 = "229_1260829317.63188" 
    capture_lex $P918
    .const 'Sub' $P912 = "227_1260829317.63188" 
    capture_lex $P912
    .const 'Sub' $P907 = "225_1260829317.63188" 
    capture_lex $P907
    .const 'Sub' $P901 = "223_1260829317.63188" 
    capture_lex $P901
    .const 'Sub' $P895 = "221_1260829317.63188" 
    capture_lex $P895
    .const 'Sub' $P890 = "219_1260829317.63188" 
    capture_lex $P890
    .const 'Sub' $P885 = "217_1260829317.63188" 
    capture_lex $P885
    .const 'Sub' $P878 = "215_1260829317.63188" 
    capture_lex $P878
    .const 'Sub' $P870 = "213_1260829317.63188" 
    capture_lex $P870
    .const 'Sub' $P865 = "211_1260829317.63188" 
    capture_lex $P865
    .const 'Sub' $P860 = "209_1260829317.63188" 
    capture_lex $P860
    .const 'Sub' $P855 = "207_1260829317.63188" 
    capture_lex $P855
    .const 'Sub' $P847 = "205_1260829317.63188" 
    capture_lex $P847
    .const 'Sub' $P839 = "203_1260829317.63188" 
    capture_lex $P839
    .const 'Sub' $P834 = "201_1260829317.63188" 
    capture_lex $P834
    .const 'Sub' $P829 = "199_1260829317.63188" 
    capture_lex $P829
    .const 'Sub' $P823 = "197_1260829317.63188" 
    capture_lex $P823
    .const 'Sub' $P817 = "195_1260829317.63188" 
    capture_lex $P817
    .const 'Sub' $P811 = "193_1260829317.63188" 
    capture_lex $P811
    .const 'Sub' $P805 = "191_1260829317.63188" 
    capture_lex $P805
    .const 'Sub' $P799 = "189_1260829317.63188" 
    capture_lex $P799
    .const 'Sub' $P794 = "187_1260829317.63188" 
    capture_lex $P794
    .const 'Sub' $P789 = "185_1260829317.63188" 
    capture_lex $P789
    .const 'Sub' $P776 = "181_1260829317.63188" 
    capture_lex $P776
    .const 'Sub' $P768 = "179_1260829317.63188" 
    capture_lex $P768
    .const 'Sub' $P762 = "177_1260829317.63188" 
    capture_lex $P762
    .const 'Sub' $P755 = "175_1260829317.63188" 
    capture_lex $P755
    .const 'Sub' $P749 = "173_1260829317.63188" 
    capture_lex $P749
    .const 'Sub' $P741 = "171_1260829317.63188" 
    capture_lex $P741
    .const 'Sub' $P733 = "169_1260829317.63188" 
    capture_lex $P733
    .const 'Sub' $P727 = "167_1260829317.63188" 
    capture_lex $P727
    .const 'Sub' $P721 = "165_1260829317.63188" 
    capture_lex $P721
    .const 'Sub' $P706 = "161_1260829317.63188" 
    capture_lex $P706
    .const 'Sub' $P674 = "159_1260829317.63188" 
    capture_lex $P674
    .const 'Sub' $P666 = "157_1260829317.63188" 
    capture_lex $P666
    .const 'Sub' $P660 = "155_1260829317.63188" 
    capture_lex $P660
    .const 'Sub' $P650 = "153_1260829317.63188" 
    capture_lex $P650
    .const 'Sub' $P635 = "151_1260829317.63188" 
    capture_lex $P635
    .const 'Sub' $P626 = "149_1260829317.63188" 
    capture_lex $P626
    .const 'Sub' $P607 = "147_1260829317.63188" 
    capture_lex $P607
    .const 'Sub' $P583 = "145_1260829317.63188" 
    capture_lex $P583
    .const 'Sub' $P576 = "143_1260829317.63188" 
    capture_lex $P576
    .const 'Sub' $P569 = "141_1260829317.63188" 
    capture_lex $P569
    .const 'Sub' $P559 = "137_1260829317.63188" 
    capture_lex $P559
    .const 'Sub' $P548 = "135_1260829317.63188" 
    capture_lex $P548
    .const 'Sub' $P541 = "133_1260829317.63188" 
    capture_lex $P541
    .const 'Sub' $P534 = "131_1260829317.63188" 
    capture_lex $P534
    .const 'Sub' $P527 = "129_1260829317.63188" 
    capture_lex $P527
    .const 'Sub' $P500 = "125_1260829317.63188" 
    capture_lex $P500
    .const 'Sub' $P491 = "123_1260829317.63188" 
    capture_lex $P491
    .const 'Sub' $P484 = "121_1260829317.63188" 
    capture_lex $P484
    .const 'Sub' $P475 = "117_1260829317.63188" 
    capture_lex $P475
    .const 'Sub' $P470 = "115_1260829317.63188" 
    capture_lex $P470
    .const 'Sub' $P458 = "113_1260829317.63188" 
    capture_lex $P458
    .const 'Sub' $P446 = "111_1260829317.63188" 
    capture_lex $P446
    .const 'Sub' $P441 = "109_1260829317.63188" 
    capture_lex $P441
    .const 'Sub' $P435 = "107_1260829317.63188" 
    capture_lex $P435
    .const 'Sub' $P429 = "105_1260829317.63188" 
    capture_lex $P429
    .const 'Sub' $P423 = "103_1260829317.63188" 
    capture_lex $P423
    .const 'Sub' $P417 = "101_1260829317.63188" 
    capture_lex $P417
    .const 'Sub' $P411 = "99_1260829317.63188" 
    capture_lex $P411
    .const 'Sub' $P405 = "97_1260829317.63188" 
    capture_lex $P405
    .const 'Sub' $P399 = "95_1260829317.63188" 
    capture_lex $P399
    .const 'Sub' $P391 = "93_1260829317.63188" 
    capture_lex $P391
    .const 'Sub' $P383 = "91_1260829317.63188" 
    capture_lex $P383
    .const 'Sub' $P371 = "87_1260829317.63188" 
    capture_lex $P371
    .const 'Sub' $P363 = "85_1260829317.63188" 
    capture_lex $P363
    .const 'Sub' $P353 = "81_1260829317.63188" 
    capture_lex $P353
    .const 'Sub' $P346 = "79_1260829317.63188" 
    capture_lex $P346
    .const 'Sub' $P339 = "77_1260829317.63188" 
    capture_lex $P339
    .const 'Sub' $P327 = "73_1260829317.63188" 
    capture_lex $P327
    .const 'Sub' $P319 = "71_1260829317.63188" 
    capture_lex $P319
    .const 'Sub' $P311 = "69_1260829317.63188" 
    capture_lex $P311
    .const 'Sub' $P291 = "67_1260829317.63188" 
    capture_lex $P291
    .const 'Sub' $P282 = "65_1260829317.63188" 
    capture_lex $P282
    .const 'Sub' $P264 = "62_1260829317.63188" 
    capture_lex $P264
    .const 'Sub' $P244 = "60_1260829317.63188" 
    capture_lex $P244
    .const 'Sub' $P235 = "56_1260829317.63188" 
    capture_lex $P235
    .const 'Sub' $P230 = "54_1260829317.63188" 
    capture_lex $P230
    .const 'Sub' $P221 = "50_1260829317.63188" 
    capture_lex $P221
    .const 'Sub' $P216 = "48_1260829317.63188" 
    capture_lex $P216
    .const 'Sub' $P208 = "46_1260829317.63188" 
    capture_lex $P208
    .const 'Sub' $P201 = "44_1260829317.63188" 
    capture_lex $P201
    .const 'Sub' $P195 = "42_1260829317.63188" 
    capture_lex $P195
    .const 'Sub' $P187 = "40_1260829317.63188" 
    capture_lex $P187
    .const 'Sub' $P181 = "38_1260829317.63188" 
    capture_lex $P181
    .const 'Sub' $P175 = "36_1260829317.63188" 
    capture_lex $P175
    .const 'Sub' $P159 = "33_1260829317.63188" 
    capture_lex $P159
    .const 'Sub' $P146 = "31_1260829317.63188" 
    capture_lex $P146
    .const 'Sub' $P139 = "29_1260829317.63188" 
    capture_lex $P139
    .const 'Sub' $P96 = "26_1260829317.63188" 
    capture_lex $P96
    .const 'Sub' $P78 = "23_1260829317.63188" 
    capture_lex $P78
    .const 'Sub' $P68 = "21_1260829317.63188" 
    capture_lex $P68
    .const 'Sub' $P54 = "19_1260829317.63188" 
    capture_lex $P54
    .const 'Sub' $P46 = "17_1260829317.63188" 
    capture_lex $P46
    .const 'Sub' $P39 = "15_1260829317.63188" 
    capture_lex $P39
    .const 'Sub' $P33 = "13_1260829317.63188" 
    capture_lex $P33
    .const 'Sub' $P15 = "12_1260829317.63188" 
    capture_lex $P15
.annotate "line", 522
    get_hll_global $P1221, ["NQP";"Regex"], "_block1220" 
    capture_lex $P1221
    $P1260 = $P1221()
.annotate "line", 4
    .return ($P1260)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post328") :outer("11_1260829317.63188")
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 409
    get_hll_global $P1261, ["NQP"], "Grammar"
    $P1261."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate "line", 410
    get_hll_global $P1262, ["NQP"], "Grammar"
    $P1262."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate "line", 411
    get_hll_global $P1263, ["NQP"], "Grammar"
    $P1263."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate "line", 412
    get_hll_global $P1264, ["NQP"], "Grammar"
    $P1264."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate "line", 413
    get_hll_global $P1265, ["NQP"], "Grammar"
    $P1265."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate "line", 414
    get_hll_global $P1266, ["NQP"], "Grammar"
    $P1266."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate "line", 415
    get_hll_global $P1267, ["NQP"], "Grammar"
    $P1267."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate "line", 416
    get_hll_global $P1268, ["NQP"], "Grammar"
    $P1268."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate "line", 417
    get_hll_global $P1269, ["NQP"], "Grammar"
    $P1269."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate "line", 418
    get_hll_global $P1270, ["NQP"], "Grammar"
    $P1270."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate "line", 419
    get_hll_global $P1271, ["NQP"], "Grammar"
    $P1271."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate "line", 420
    get_hll_global $P1272, ["NQP"], "Grammar"
    $P1272."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate "line", 421
    get_hll_global $P1273, ["NQP"], "Grammar"
    $P1273."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate "line", 422
    get_hll_global $P1274, ["NQP"], "Grammar"
    $P1274."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate "line", 423
    get_hll_global $P1275, ["NQP"], "Grammar"
    $P1275."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate "line", 408
    $P1276 = get_root_global ["parrot"], "P6metaclass"
    $P1276."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "TOP"  :subid("12_1260829317.63188") :method :outer("11_1260829317.63188")
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
    unless_null $P20, vivify_329
    get_hll_global $P20, "%LANG"
    unless_null $P20, vivify_330
    die "Contextual %*LANG not found"
  vivify_330:
  vivify_329:
.annotate "line", 6
    get_hll_global $P21, ["NQP"], "Regex"
    find_lex $P22, "%*LANG"
    unless_null $P22, vivify_331
    get_hll_global $P22, "%LANG"
    unless_null $P22, vivify_332
    die "Contextual %*LANG not found"
  vivify_332:
    store_lex "%*LANG", $P22
  vivify_331:
    set $P22["Regex"], $P21
.annotate "line", 7
    get_hll_global $P23, ["NQP"], "RegexActions"
    find_lex $P24, "%*LANG"
    unless_null $P24, vivify_333
    get_hll_global $P24, "%LANG"
    unless_null $P24, vivify_334
    die "Contextual %*LANG not found"
  vivify_334:
    store_lex "%*LANG", $P24
  vivify_333:
    set $P24["Regex-actions"], $P23
.annotate "line", 8
    get_hll_global $P25, ["NQP"], "Grammar"
    find_lex $P26, "%*LANG"
    unless_null $P26, vivify_335
    get_hll_global $P26, "%LANG"
    unless_null $P26, vivify_336
    die "Contextual %*LANG not found"
  vivify_336:
    store_lex "%*LANG", $P26
  vivify_335:
    set $P26["MAIN"], $P25
.annotate "line", 9
    get_hll_global $P27, ["NQP"], "Actions"
    find_lex $P28, "%*LANG"
    unless_null $P28, vivify_337
    get_hll_global $P28, "%LANG"
    unless_null $P28, vivify_338
    die "Contextual %*LANG not found"
  vivify_338:
    store_lex "%*LANG", $P28
  vivify_337:
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
.sub "identifier"  :subid("13_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__identifier"  :subid("14_1260829317.63188") :method
.annotate "line", 4
    $P36 = self."!PREFIX__!subrule"("ident", "")
    new $P37, "ResizablePMCArray"
    push $P37, $P36
    .return ($P37)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__name"  :subid("16_1260829317.63188") :method
.annotate "line", 4
    new $P42, "ResizablePMCArray"
    push $P42, ""
    .return ($P42)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__deflongname"  :subid("18_1260829317.63188") :method
.annotate "line", 4
    $P49 = self."!PREFIX__!subrule"("identifier", "")
    new $P50, "ResizablePMCArray"
    push $P50, $P49
    .return ($P50)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__ENDSTMT"  :subid("20_1260829317.63188") :method
.annotate "line", 4
    new $P57, "ResizablePMCArray"
    push $P57, ""
    .return ($P57)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__ws"  :subid("22_1260829317.63188") :method
.annotate "line", 4
    new $P71, "ResizablePMCArray"
    push $P71, ""
    push $P71, ""
    .return ($P71)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .const 'Sub' $P86 = "25_1260829317.63188" 
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
    .const 'Sub' $P86 = "25_1260829317.63188" 
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
.sub "!PREFIX__unv"  :subid("24_1260829317.63188") :method
.annotate "line", 4
    new $P81, "ResizablePMCArray"
    push $P81, ""
    push $P81, ""
    push $P81, ""
    .return ($P81)
.end


.namespace ["NQP";"Grammar"]
.sub "_block85"  :anon :subid("25_1260829317.63188") :method :outer("23_1260829317.63188")
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
.sub "pod_comment"  :subid("26_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .const 'Sub' $P131 = "28_1260829317.63188" 
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
    .const 'Sub' $P131 = "28_1260829317.63188" 
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
.sub "!PREFIX__pod_comment"  :subid("27_1260829317.63188") :method
.annotate "line", 4
    new $P99, "ResizablePMCArray"
    push $P99, ""
    .return ($P99)
.end


.namespace ["NQP";"Grammar"]
.sub "_block130"  :anon :subid("28_1260829317.63188") :method :outer("26_1260829317.63188")
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
.sub "comp_unit"  :subid("29_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__comp_unit"  :subid("30_1260829317.63188") :method
.annotate "line", 4
    $P142 = self."!PREFIX__!subrule"("", "")
    new $P143, "ResizablePMCArray"
    push $P143, $P142
    .return ($P143)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__statementlist"  :subid("32_1260829317.63188") :method
.annotate "line", 4
    new $P149, "ResizablePMCArray"
    push $P149, ""
    push $P149, ""
    .return ($P149)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .const 'Sub' $P165 = "35_1260829317.63188" 
    capture_lex $P165
    .local string rx160_tgt
    .local int rx160_pos
    .local int rx160_off
    .local int rx160_eos
    .local int rx160_rep
    .local pmc rx160_cur
    (rx160_cur, rx160_pos, rx160_tgt) = self."!cursor_start"()
    rx160_cur."!cursor_debug"("START ", "statement")
    rx160_cur."!cursor_caparray"("statement_mod_cond", "statement_mod_loop")
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
    .const 'Sub' $P165 = "35_1260829317.63188" 
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
.sub "!PREFIX__statement"  :subid("34_1260829317.63188") :method
.annotate "line", 4
    new $P162, "ResizablePMCArray"
    push $P162, ""
    .return ($P162)
.end


.namespace ["NQP";"Grammar"]
.sub "_block164"  :anon :subid("35_1260829317.63188") :method :outer("33_1260829317.63188")
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
.sub "eat_terminator"  :subid("36_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__eat_terminator"  :subid("37_1260829317.63188") :method
.annotate "line", 4
    new $P178, "ResizablePMCArray"
    push $P178, ""
    push $P178, ""
    push $P178, ""
    push $P178, ";"
    .return ($P178)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__xblock"  :subid("39_1260829317.63188") :method
.annotate "line", 4
    $P184 = self."!PREFIX__!subrule"("EXPR", "")
    new $P185, "ResizablePMCArray"
    push $P185, $P184
    .return ($P185)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__pblock"  :subid("41_1260829317.63188") :method
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
.sub "lambda"  :subid("42_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__lambda"  :subid("43_1260829317.63188") :method
.annotate "line", 4
    new $P198, "ResizablePMCArray"
    push $P198, "<->"
    push $P198, "->"
    .return ($P198)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__block"  :subid("45_1260829317.63188") :method
.annotate "line", 4
    $P204 = self."!PREFIX__!subrule"("", "")
    new $P205, "ResizablePMCArray"
    push $P205, $P204
    push $P205, "{"
    .return ($P205)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__blockoid"  :subid("47_1260829317.63188") :method
.annotate "line", 4
    $P211 = self."!PREFIX__!subrule"("", "")
    new $P212, "ResizablePMCArray"
    push $P212, $P211
    .return ($P212)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__newpad"  :subid("49_1260829317.63188") :method
.annotate "line", 4
    new $P219, "ResizablePMCArray"
    push $P219, ""
    .return ($P219)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("50_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__finishpad"  :subid("51_1260829317.63188") :method
.annotate "line", 4
    new $P224, "ResizablePMCArray"
    push $P224, ""
    .return ($P224)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("52_1260829317.63188") :method
.annotate "line", 139
    $P227 = self."!protoregex"("terminator")
    .return ($P227)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("53_1260829317.63188") :method
.annotate "line", 139
    $P229 = self."!PREFIX__!protoregex"("terminator")
    .return ($P229)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("54_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__terminator:sym<;>"  :subid("55_1260829317.63188") :method
.annotate "line", 4
    new $P233, "ResizablePMCArray"
    push $P233, ";"
    .return ($P233)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("56_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__terminator:sym<}>"  :subid("57_1260829317.63188") :method
.annotate "line", 4
    new $P238, "ResizablePMCArray"
    push $P238, "}"
    .return ($P238)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("58_1260829317.63188") :method
.annotate "line", 146
    $P241 = self."!protoregex"("statement_control")
    .return ($P241)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("59_1260829317.63188") :method
.annotate "line", 146
    $P243 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P243)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("60_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx245_tgt
    .local int rx245_pos
    .local int rx245_off
    .local int rx245_eos
    .local int rx245_rep
    .local pmc rx245_cur
    (rx245_cur, rx245_pos, rx245_tgt) = self."!cursor_start"()
    rx245_cur."!cursor_debug"("START ", "statement_control:sym<if>")
    rx245_cur."!cursor_caparray"("else", "xblock")
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
.sub "!PREFIX__statement_control:sym<if>"  :subid("61_1260829317.63188") :method
.annotate "line", 4
    new $P247, "ResizablePMCArray"
    push $P247, "if"
    .return ($P247)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("62_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .const 'Sub' $P275 = "64_1260829317.63188" 
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
    .const 'Sub' $P275 = "64_1260829317.63188" 
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
.sub "!PREFIX__statement_control:sym<unless>"  :subid("63_1260829317.63188") :method
.annotate "line", 4
    new $P267, "ResizablePMCArray"
    push $P267, "unless"
    .return ($P267)
.end


.namespace ["NQP";"Grammar"]
.sub "_block274"  :anon :subid("64_1260829317.63188") :method :outer("62_1260829317.63188")
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
.sub "statement_control:sym<while>"  :subid("65_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__statement_control:sym<while>"  :subid("66_1260829317.63188") :method
.annotate "line", 4
    new $P285, "ResizablePMCArray"
    push $P285, "until"
    push $P285, "while"
    .return ($P285)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("67_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("68_1260829317.63188") :method
.annotate "line", 4
    new $P294, "ResizablePMCArray"
    push $P294, "repeat"
    .return ($P294)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("69_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__statement_control:sym<for>"  :subid("70_1260829317.63188") :method
.annotate "line", 4
    new $P314, "ResizablePMCArray"
    push $P314, "for"
    .return ($P314)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CATCH>"  :subid("71_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__statement_control:sym<CATCH>"  :subid("72_1260829317.63188") :method
.annotate "line", 4
    new $P322, "ResizablePMCArray"
    push $P322, "CATCH"
    .return ($P322)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CONTROL>"  :subid("73_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__statement_control:sym<CONTROL>"  :subid("74_1260829317.63188") :method
.annotate "line", 4
    new $P330, "ResizablePMCArray"
    push $P330, "CONTROL"
    .return ($P330)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("75_1260829317.63188") :method
.annotate "line", 189
    $P336 = self."!protoregex"("statement_prefix")
    .return ($P336)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("76_1260829317.63188") :method
.annotate "line", 189
    $P338 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P338)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("77_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("78_1260829317.63188") :method
.annotate "line", 4
    $P342 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P343, "ResizablePMCArray"
    push $P343, $P342
    .return ($P343)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<try>"  :subid("79_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__statement_prefix:sym<try>"  :subid("80_1260829317.63188") :method
.annotate "line", 4
    $P349 = self."!PREFIX__!subrule"("blorst", "try")
    new $P350, "ResizablePMCArray"
    push $P350, $P349
    .return ($P350)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("81_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__blorst"  :subid("82_1260829317.63188") :method
.annotate "line", 4
    new $P356, "ResizablePMCArray"
    push $P356, ""
    .return ($P356)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("83_1260829317.63188") :method
.annotate "line", 203
    $P360 = self."!protoregex"("statement_mod_cond")
    .return ($P360)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("84_1260829317.63188") :method
.annotate "line", 203
    $P362 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P362)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("85_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("86_1260829317.63188") :method
.annotate "line", 4
    new $P366, "ResizablePMCArray"
    push $P366, "if"
    .return ($P366)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("87_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("88_1260829317.63188") :method
.annotate "line", 4
    new $P374, "ResizablePMCArray"
    push $P374, "unless"
    .return ($P374)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("89_1260829317.63188") :method
.annotate "line", 208
    $P380 = self."!protoregex"("statement_mod_loop")
    .return ($P380)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("90_1260829317.63188") :method
.annotate "line", 208
    $P382 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P382)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("91_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("92_1260829317.63188") :method
.annotate "line", 4
    new $P386, "ResizablePMCArray"
    push $P386, "while"
    .return ($P386)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("93_1260829317.63188") :method :outer("11_1260829317.63188")
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
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("94_1260829317.63188") :method
.annotate "line", 4
    new $P394, "ResizablePMCArray"
    push $P394, "until"
    .return ($P394)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("95_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx400_tgt
    .local int rx400_pos
    .local int rx400_off
    .local int rx400_eos
    .local int rx400_rep
    .local pmc rx400_cur
    (rx400_cur, rx400_pos, rx400_tgt) = self."!cursor_start"()
    rx400_cur."!cursor_debug"("START ", "term:sym<colonpair>")
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
  # rx subrule "colonpair" subtype=capture negate=
    rx400_cur."!cursor_pos"(rx400_pos)
    $P10 = rx400_cur."colonpair"()
    unless $P10, rx400_fail
    rx400_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx400_pos = $P10."pos"()
  # rx pass
    rx400_cur."!cursor_pass"(rx400_pos, "term:sym<colonpair>")
    rx400_cur."!cursor_debug"("PASS  ", "term:sym<colonpair>", " at pos=", rx400_pos)
    .return (rx400_cur)
  rx400_fail:
.annotate "line", 4
    (rx400_rep, rx400_pos, $I10, $P10) = rx400_cur."!mark_fail"(0)
    lt rx400_pos, -1, rx400_done
    eq rx400_pos, -1, rx400_fail
    jump $I10
  rx400_done:
    rx400_cur."!cursor_fail"()
    rx400_cur."!cursor_debug"("FAIL  ", "term:sym<colonpair>")
    .return (rx400_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("96_1260829317.63188") :method
.annotate "line", 4
    $P402 = self."!PREFIX__!subrule"("colonpair", "")
    new $P403, "ResizablePMCArray"
    push $P403, $P402
    .return ($P403)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("97_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx406_tgt
    .local int rx406_pos
    .local int rx406_off
    .local int rx406_eos
    .local int rx406_rep
    .local pmc rx406_cur
    (rx406_cur, rx406_pos, rx406_tgt) = self."!cursor_start"()
    rx406_cur."!cursor_debug"("START ", "term:sym<variable>")
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
  # rx subrule "variable" subtype=capture negate=
    rx406_cur."!cursor_pos"(rx406_pos)
    $P10 = rx406_cur."variable"()
    unless $P10, rx406_fail
    rx406_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx406_pos = $P10."pos"()
  # rx pass
    rx406_cur."!cursor_pass"(rx406_pos, "term:sym<variable>")
    rx406_cur."!cursor_debug"("PASS  ", "term:sym<variable>", " at pos=", rx406_pos)
    .return (rx406_cur)
  rx406_fail:
.annotate "line", 4
    (rx406_rep, rx406_pos, $I10, $P10) = rx406_cur."!mark_fail"(0)
    lt rx406_pos, -1, rx406_done
    eq rx406_pos, -1, rx406_fail
    jump $I10
  rx406_done:
    rx406_cur."!cursor_fail"()
    rx406_cur."!cursor_debug"("FAIL  ", "term:sym<variable>")
    .return (rx406_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("98_1260829317.63188") :method
.annotate "line", 4
    $P408 = self."!PREFIX__!subrule"("variable", "")
    new $P409, "ResizablePMCArray"
    push $P409, $P408
    .return ($P409)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("99_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx412_tgt
    .local int rx412_pos
    .local int rx412_off
    .local int rx412_eos
    .local int rx412_rep
    .local pmc rx412_cur
    (rx412_cur, rx412_pos, rx412_tgt) = self."!cursor_start"()
    rx412_cur."!cursor_debug"("START ", "term:sym<package_declarator>")
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
  # rx subrule "package_declarator" subtype=capture negate=
    rx412_cur."!cursor_pos"(rx412_pos)
    $P10 = rx412_cur."package_declarator"()
    unless $P10, rx412_fail
    rx412_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx412_pos = $P10."pos"()
  # rx pass
    rx412_cur."!cursor_pass"(rx412_pos, "term:sym<package_declarator>")
    rx412_cur."!cursor_debug"("PASS  ", "term:sym<package_declarator>", " at pos=", rx412_pos)
    .return (rx412_cur)
  rx412_fail:
.annotate "line", 4
    (rx412_rep, rx412_pos, $I10, $P10) = rx412_cur."!mark_fail"(0)
    lt rx412_pos, -1, rx412_done
    eq rx412_pos, -1, rx412_fail
    jump $I10
  rx412_done:
    rx412_cur."!cursor_fail"()
    rx412_cur."!cursor_debug"("FAIL  ", "term:sym<package_declarator>")
    .return (rx412_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("100_1260829317.63188") :method
.annotate "line", 4
    $P414 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P415, "ResizablePMCArray"
    push $P415, $P414
    .return ($P415)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("101_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx418_tgt
    .local int rx418_pos
    .local int rx418_off
    .local int rx418_eos
    .local int rx418_rep
    .local pmc rx418_cur
    (rx418_cur, rx418_pos, rx418_tgt) = self."!cursor_start"()
    rx418_cur."!cursor_debug"("START ", "term:sym<scope_declarator>")
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
  # rx subrule "scope_declarator" subtype=capture negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."scope_declarator"()
    unless $P10, rx418_fail
    rx418_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx418_pos = $P10."pos"()
  # rx pass
    rx418_cur."!cursor_pass"(rx418_pos, "term:sym<scope_declarator>")
    rx418_cur."!cursor_debug"("PASS  ", "term:sym<scope_declarator>", " at pos=", rx418_pos)
    .return (rx418_cur)
  rx418_fail:
.annotate "line", 4
    (rx418_rep, rx418_pos, $I10, $P10) = rx418_cur."!mark_fail"(0)
    lt rx418_pos, -1, rx418_done
    eq rx418_pos, -1, rx418_fail
    jump $I10
  rx418_done:
    rx418_cur."!cursor_fail"()
    rx418_cur."!cursor_debug"("FAIL  ", "term:sym<scope_declarator>")
    .return (rx418_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("102_1260829317.63188") :method
.annotate "line", 4
    $P420 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P421, "ResizablePMCArray"
    push $P421, $P420
    .return ($P421)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("103_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx424_tgt
    .local int rx424_pos
    .local int rx424_off
    .local int rx424_eos
    .local int rx424_rep
    .local pmc rx424_cur
    (rx424_cur, rx424_pos, rx424_tgt) = self."!cursor_start"()
    rx424_cur."!cursor_debug"("START ", "term:sym<routine_declarator>")
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
  # rx subrule "routine_declarator" subtype=capture negate=
    rx424_cur."!cursor_pos"(rx424_pos)
    $P10 = rx424_cur."routine_declarator"()
    unless $P10, rx424_fail
    rx424_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx424_pos = $P10."pos"()
  # rx pass
    rx424_cur."!cursor_pass"(rx424_pos, "term:sym<routine_declarator>")
    rx424_cur."!cursor_debug"("PASS  ", "term:sym<routine_declarator>", " at pos=", rx424_pos)
    .return (rx424_cur)
  rx424_fail:
.annotate "line", 4
    (rx424_rep, rx424_pos, $I10, $P10) = rx424_cur."!mark_fail"(0)
    lt rx424_pos, -1, rx424_done
    eq rx424_pos, -1, rx424_fail
    jump $I10
  rx424_done:
    rx424_cur."!cursor_fail"()
    rx424_cur."!cursor_debug"("FAIL  ", "term:sym<routine_declarator>")
    .return (rx424_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("104_1260829317.63188") :method
.annotate "line", 4
    $P426 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P427, "ResizablePMCArray"
    push $P427, $P426
    .return ($P427)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("105_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx430_tgt
    .local int rx430_pos
    .local int rx430_off
    .local int rx430_eos
    .local int rx430_rep
    .local pmc rx430_cur
    (rx430_cur, rx430_pos, rx430_tgt) = self."!cursor_start"()
    rx430_cur."!cursor_debug"("START ", "term:sym<regex_declarator>")
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
  # rx subrule "regex_declarator" subtype=capture negate=
    rx430_cur."!cursor_pos"(rx430_pos)
    $P10 = rx430_cur."regex_declarator"()
    unless $P10, rx430_fail
    rx430_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx430_pos = $P10."pos"()
  # rx pass
    rx430_cur."!cursor_pass"(rx430_pos, "term:sym<regex_declarator>")
    rx430_cur."!cursor_debug"("PASS  ", "term:sym<regex_declarator>", " at pos=", rx430_pos)
    .return (rx430_cur)
  rx430_fail:
.annotate "line", 4
    (rx430_rep, rx430_pos, $I10, $P10) = rx430_cur."!mark_fail"(0)
    lt rx430_pos, -1, rx430_done
    eq rx430_pos, -1, rx430_fail
    jump $I10
  rx430_done:
    rx430_cur."!cursor_fail"()
    rx430_cur."!cursor_debug"("FAIL  ", "term:sym<regex_declarator>")
    .return (rx430_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("106_1260829317.63188") :method
.annotate "line", 4
    $P432 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P433, "ResizablePMCArray"
    push $P433, $P432
    .return ($P433)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("107_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx436_tgt
    .local int rx436_pos
    .local int rx436_off
    .local int rx436_eos
    .local int rx436_rep
    .local pmc rx436_cur
    (rx436_cur, rx436_pos, rx436_tgt) = self."!cursor_start"()
    rx436_cur."!cursor_debug"("START ", "term:sym<statement_prefix>")
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
  # rx subrule "statement_prefix" subtype=capture negate=
    rx436_cur."!cursor_pos"(rx436_pos)
    $P10 = rx436_cur."statement_prefix"()
    unless $P10, rx436_fail
    rx436_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx436_pos = $P10."pos"()
  # rx pass
    rx436_cur."!cursor_pass"(rx436_pos, "term:sym<statement_prefix>")
    rx436_cur."!cursor_debug"("PASS  ", "term:sym<statement_prefix>", " at pos=", rx436_pos)
    .return (rx436_cur)
  rx436_fail:
.annotate "line", 4
    (rx436_rep, rx436_pos, $I10, $P10) = rx436_cur."!mark_fail"(0)
    lt rx436_pos, -1, rx436_done
    eq rx436_pos, -1, rx436_fail
    jump $I10
  rx436_done:
    rx436_cur."!cursor_fail"()
    rx436_cur."!cursor_debug"("FAIL  ", "term:sym<statement_prefix>")
    .return (rx436_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("108_1260829317.63188") :method
.annotate "line", 4
    $P438 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P439, "ResizablePMCArray"
    push $P439, $P438
    .return ($P439)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("109_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx442_tgt
    .local int rx442_pos
    .local int rx442_off
    .local int rx442_eos
    .local int rx442_rep
    .local pmc rx442_cur
    (rx442_cur, rx442_pos, rx442_tgt) = self."!cursor_start"()
    rx442_cur."!cursor_debug"("START ", "term:sym<lambda>")
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
    ne $I10, -1, rxscan445_done
    goto rxscan445_scan
  rxscan445_loop:
    ($P10) = rx442_cur."from"()
    inc $P10
    set rx442_pos, $P10
    ge rx442_pos, rx442_eos, rxscan445_done
  rxscan445_scan:
    set_addr $I10, rxscan445_loop
    rx442_cur."!mark_push"(0, rx442_pos, $I10)
  rxscan445_done:
.annotate "line", 222
  # rx subrule "lambda" subtype=zerowidth negate=
    rx442_cur."!cursor_pos"(rx442_pos)
    $P10 = rx442_cur."lambda"()
    unless $P10, rx442_fail
  # rx subrule "pblock" subtype=capture negate=
    rx442_cur."!cursor_pos"(rx442_pos)
    $P10 = rx442_cur."pblock"()
    unless $P10, rx442_fail
    rx442_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx442_pos = $P10."pos"()
  # rx pass
    rx442_cur."!cursor_pass"(rx442_pos, "term:sym<lambda>")
    rx442_cur."!cursor_debug"("PASS  ", "term:sym<lambda>", " at pos=", rx442_pos)
    .return (rx442_cur)
  rx442_fail:
.annotate "line", 4
    (rx442_rep, rx442_pos, $I10, $P10) = rx442_cur."!mark_fail"(0)
    lt rx442_pos, -1, rx442_done
    eq rx442_pos, -1, rx442_fail
    jump $I10
  rx442_done:
    rx442_cur."!cursor_fail"()
    rx442_cur."!cursor_debug"("FAIL  ", "term:sym<lambda>")
    .return (rx442_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("110_1260829317.63188") :method
.annotate "line", 4
    new $P444, "ResizablePMCArray"
    push $P444, ""
    .return ($P444)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("111_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx447_tgt
    .local int rx447_pos
    .local int rx447_off
    .local int rx447_eos
    .local int rx447_rep
    .local pmc rx447_cur
    (rx447_cur, rx447_pos, rx447_tgt) = self."!cursor_start"()
    rx447_cur."!cursor_debug"("START ", "colonpair")
    rx447_cur."!cursor_caparray"("circumfix")
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
    ne $I10, -1, rxscan453_done
    goto rxscan453_scan
  rxscan453_loop:
    ($P10) = rx447_cur."from"()
    inc $P10
    set rx447_pos, $P10
    ge rx447_pos, rx447_eos, rxscan453_done
  rxscan453_scan:
    set_addr $I10, rxscan453_loop
    rx447_cur."!mark_push"(0, rx447_pos, $I10)
  rxscan453_done:
.annotate "line", 225
  # rx literal  ":"
    add $I11, rx447_pos, 1
    gt $I11, rx447_eos, rx447_fail
    sub $I11, rx447_pos, rx447_off
    substr $S10, rx447_tgt, $I11, 1
    ne $S10, ":", rx447_fail
    add rx447_pos, 1
  alt454_0:
.annotate "line", 226
    set_addr $I10, alt454_1
    rx447_cur."!mark_push"(0, rx447_pos, $I10)
.annotate "line", 227
  # rx subcapture "not"
    set_addr $I10, rxcap_455_fail
    rx447_cur."!mark_push"(0, rx447_pos, $I10)
  # rx literal  "!"
    add $I11, rx447_pos, 1
    gt $I11, rx447_eos, rx447_fail
    sub $I11, rx447_pos, rx447_off
    substr $S10, rx447_tgt, $I11, 1
    ne $S10, "!", rx447_fail
    add rx447_pos, 1
    set_addr $I10, rxcap_455_fail
    ($I12, $I11) = rx447_cur."!mark_peek"($I10)
    rx447_cur."!cursor_pos"($I11)
    ($P10) = rx447_cur."!cursor_start"()
    $P10."!cursor_pass"(rx447_pos, "")
    rx447_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_455_done
  rxcap_455_fail:
    goto rx447_fail
  rxcap_455_done:
  # rx subrule "identifier" subtype=capture negate=
    rx447_cur."!cursor_pos"(rx447_pos)
    $P10 = rx447_cur."identifier"()
    unless $P10, rx447_fail
    rx447_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx447_pos = $P10."pos"()
    goto alt454_end
  alt454_1:
    set_addr $I10, alt454_2
    rx447_cur."!mark_push"(0, rx447_pos, $I10)
.annotate "line", 228
  # rx subrule "identifier" subtype=capture negate=
    rx447_cur."!cursor_pos"(rx447_pos)
    $P10 = rx447_cur."identifier"()
    unless $P10, rx447_fail
    rx447_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx447_pos = $P10."pos"()
  # rx rxquantr456 ** 0..1
    set_addr $I457, rxquantr456_done
    rx447_cur."!mark_push"(0, rx447_pos, $I457)
  rxquantr456_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx447_cur."!cursor_pos"(rx447_pos)
    $P10 = rx447_cur."circumfix"()
    unless $P10, rx447_fail
    rx447_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx447_pos = $P10."pos"()
    (rx447_rep) = rx447_cur."!mark_commit"($I457)
  rxquantr456_done:
    goto alt454_end
  alt454_2:
.annotate "line", 229
  # rx subrule "circumfix" subtype=capture negate=
    rx447_cur."!cursor_pos"(rx447_pos)
    $P10 = rx447_cur."circumfix"()
    unless $P10, rx447_fail
    rx447_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx447_pos = $P10."pos"()
  alt454_end:
.annotate "line", 224
  # rx pass
    rx447_cur."!cursor_pass"(rx447_pos, "colonpair")
    rx447_cur."!cursor_debug"("PASS  ", "colonpair", " at pos=", rx447_pos)
    .return (rx447_cur)
  rx447_fail:
.annotate "line", 4
    (rx447_rep, rx447_pos, $I10, $P10) = rx447_cur."!mark_fail"(0)
    lt rx447_pos, -1, rx447_done
    eq rx447_pos, -1, rx447_fail
    jump $I10
  rx447_done:
    rx447_cur."!cursor_fail"()
    rx447_cur."!cursor_debug"("FAIL  ", "colonpair")
    .return (rx447_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("112_1260829317.63188") :method
.annotate "line", 4
    $P449 = self."!PREFIX__!subrule"("circumfix", ":")
    $P450 = self."!PREFIX__!subrule"("identifier", ":")
    $P451 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P452, "ResizablePMCArray"
    push $P452, $P449
    push $P452, $P450
    push $P452, $P451
    .return ($P452)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("113_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx459_tgt
    .local int rx459_pos
    .local int rx459_off
    .local int rx459_eos
    .local int rx459_rep
    .local pmc rx459_cur
    (rx459_cur, rx459_pos, rx459_tgt) = self."!cursor_start"()
    rx459_cur."!cursor_debug"("START ", "variable")
    rx459_cur."!cursor_caparray"("twigil")
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
    ne $I10, -1, rxscan464_done
    goto rxscan464_scan
  rxscan464_loop:
    ($P10) = rx459_cur."from"()
    inc $P10
    set rx459_pos, $P10
    ge rx459_pos, rx459_eos, rxscan464_done
  rxscan464_scan:
    set_addr $I10, rxscan464_loop
    rx459_cur."!mark_push"(0, rx459_pos, $I10)
  rxscan464_done:
  alt465_0:
.annotate "line", 233
    set_addr $I10, alt465_1
    rx459_cur."!mark_push"(0, rx459_pos, $I10)
.annotate "line", 234
  # rx subrule "sigil" subtype=capture negate=
    rx459_cur."!cursor_pos"(rx459_pos)
    $P10 = rx459_cur."sigil"()
    unless $P10, rx459_fail
    rx459_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx459_pos = $P10."pos"()
  # rx rxquantr466 ** 0..1
    set_addr $I467, rxquantr466_done
    rx459_cur."!mark_push"(0, rx459_pos, $I467)
  rxquantr466_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx459_cur."!cursor_pos"(rx459_pos)
    $P10 = rx459_cur."twigil"()
    unless $P10, rx459_fail
    rx459_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx459_pos = $P10."pos"()
    (rx459_rep) = rx459_cur."!mark_commit"($I467)
  rxquantr466_done:
  # rx subrule "name" subtype=capture negate=
    rx459_cur."!cursor_pos"(rx459_pos)
    $P10 = rx459_cur."name"()
    unless $P10, rx459_fail
    rx459_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx459_pos = $P10."pos"()
    goto alt465_end
  alt465_1:
    set_addr $I10, alt465_2
    rx459_cur."!mark_push"(0, rx459_pos, $I10)
.annotate "line", 235
  # rx subrule "sigil" subtype=capture negate=
    rx459_cur."!cursor_pos"(rx459_pos)
    $P10 = rx459_cur."sigil"()
    unless $P10, rx459_fail
    rx459_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx459_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx459_pos, rx459_eos, rx459_fail
    sub $I10, rx459_pos, rx459_off
    substr $S10, rx459_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx459_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx459_cur."!cursor_pos"(rx459_pos)
    $P10 = rx459_cur."postcircumfix"()
    unless $P10, rx459_fail
    rx459_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx459_pos = $P10."pos"()
    goto alt465_end
  alt465_2:
.annotate "line", 236
  # rx subcapture "sigil"
    set_addr $I10, rxcap_468_fail
    rx459_cur."!mark_push"(0, rx459_pos, $I10)
  # rx literal  "$"
    add $I11, rx459_pos, 1
    gt $I11, rx459_eos, rx459_fail
    sub $I11, rx459_pos, rx459_off
    substr $S10, rx459_tgt, $I11, 1
    ne $S10, "$", rx459_fail
    add rx459_pos, 1
    set_addr $I10, rxcap_468_fail
    ($I12, $I11) = rx459_cur."!mark_peek"($I10)
    rx459_cur."!cursor_pos"($I11)
    ($P10) = rx459_cur."!cursor_start"()
    $P10."!cursor_pass"(rx459_pos, "")
    rx459_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_468_done
  rxcap_468_fail:
    goto rx459_fail
  rxcap_468_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_469_fail
    rx459_cur."!mark_push"(0, rx459_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx459_pos, rx459_eos, rx459_fail
    sub $I10, rx459_pos, rx459_off
    substr $S10, rx459_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx459_fail
    inc rx459_pos
    set_addr $I10, rxcap_469_fail
    ($I12, $I11) = rx459_cur."!mark_peek"($I10)
    rx459_cur."!cursor_pos"($I11)
    ($P10) = rx459_cur."!cursor_start"()
    $P10."!cursor_pass"(rx459_pos, "")
    rx459_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_469_done
  rxcap_469_fail:
    goto rx459_fail
  rxcap_469_done:
  alt465_end:
.annotate "line", 233
  # rx pass
    rx459_cur."!cursor_pass"(rx459_pos, "variable")
    rx459_cur."!cursor_debug"("PASS  ", "variable", " at pos=", rx459_pos)
    .return (rx459_cur)
  rx459_fail:
.annotate "line", 4
    (rx459_rep, rx459_pos, $I10, $P10) = rx459_cur."!mark_fail"(0)
    lt rx459_pos, -1, rx459_done
    eq rx459_pos, -1, rx459_fail
    jump $I10
  rx459_done:
    rx459_cur."!cursor_fail"()
    rx459_cur."!cursor_debug"("FAIL  ", "variable")
    .return (rx459_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("114_1260829317.63188") :method
.annotate "line", 4
    $P461 = self."!PREFIX__!subrule"("sigil", "")
    $P462 = self."!PREFIX__!subrule"("sigil", "")
    new $P463, "ResizablePMCArray"
    push $P463, "$!"
    push $P463, "$_"
    push $P463, "$/"
    push $P463, $P461
    push $P463, $P462
    .return ($P463)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("115_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx471_tgt
    .local int rx471_pos
    .local int rx471_off
    .local int rx471_eos
    .local int rx471_rep
    .local pmc rx471_cur
    (rx471_cur, rx471_pos, rx471_tgt) = self."!cursor_start"()
    rx471_cur."!cursor_debug"("START ", "sigil")
    .lex unicode:"$\x{a2}", rx471_cur
    .local pmc match
    .lex "$/", match
    length rx471_eos, rx471_tgt
    set rx471_off, 0
    lt rx471_pos, 2, rx471_start
    sub rx471_off, rx471_pos, 1
    substr rx471_tgt, rx471_tgt, rx471_off
  rx471_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan474_done
    goto rxscan474_scan
  rxscan474_loop:
    ($P10) = rx471_cur."from"()
    inc $P10
    set rx471_pos, $P10
    ge rx471_pos, rx471_eos, rxscan474_done
  rxscan474_scan:
    set_addr $I10, rxscan474_loop
    rx471_cur."!mark_push"(0, rx471_pos, $I10)
  rxscan474_done:
.annotate "line", 239
  # rx enumcharlist negate=0 
    ge rx471_pos, rx471_eos, rx471_fail
    sub $I10, rx471_pos, rx471_off
    substr $S10, rx471_tgt, $I10, 1
    index $I11, "$@%&", $S10
    lt $I11, 0, rx471_fail
    inc rx471_pos
  # rx pass
    rx471_cur."!cursor_pass"(rx471_pos, "sigil")
    rx471_cur."!cursor_debug"("PASS  ", "sigil", " at pos=", rx471_pos)
    .return (rx471_cur)
  rx471_fail:
.annotate "line", 4
    (rx471_rep, rx471_pos, $I10, $P10) = rx471_cur."!mark_fail"(0)
    lt rx471_pos, -1, rx471_done
    eq rx471_pos, -1, rx471_fail
    jump $I10
  rx471_done:
    rx471_cur."!cursor_fail"()
    rx471_cur."!cursor_debug"("FAIL  ", "sigil")
    .return (rx471_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("116_1260829317.63188") :method
.annotate "line", 4
    new $P473, "ResizablePMCArray"
    push $P473, "&"
    push $P473, "%"
    push $P473, "@"
    push $P473, "$"
    .return ($P473)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("117_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx476_tgt
    .local int rx476_pos
    .local int rx476_off
    .local int rx476_eos
    .local int rx476_rep
    .local pmc rx476_cur
    (rx476_cur, rx476_pos, rx476_tgt) = self."!cursor_start"()
    rx476_cur."!cursor_debug"("START ", "twigil")
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
    ne $I10, -1, rxscan479_done
    goto rxscan479_scan
  rxscan479_loop:
    ($P10) = rx476_cur."from"()
    inc $P10
    set rx476_pos, $P10
    ge rx476_pos, rx476_eos, rxscan479_done
  rxscan479_scan:
    set_addr $I10, rxscan479_loop
    rx476_cur."!mark_push"(0, rx476_pos, $I10)
  rxscan479_done:
.annotate "line", 241
  # rx enumcharlist negate=0 
    ge rx476_pos, rx476_eos, rx476_fail
    sub $I10, rx476_pos, rx476_off
    substr $S10, rx476_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx476_fail
    inc rx476_pos
  # rx pass
    rx476_cur."!cursor_pass"(rx476_pos, "twigil")
    rx476_cur."!cursor_debug"("PASS  ", "twigil", " at pos=", rx476_pos)
    .return (rx476_cur)
  rx476_fail:
.annotate "line", 4
    (rx476_rep, rx476_pos, $I10, $P10) = rx476_cur."!mark_fail"(0)
    lt rx476_pos, -1, rx476_done
    eq rx476_pos, -1, rx476_fail
    jump $I10
  rx476_done:
    rx476_cur."!cursor_fail"()
    rx476_cur."!cursor_debug"("FAIL  ", "twigil")
    .return (rx476_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("118_1260829317.63188") :method
.annotate "line", 4
    new $P478, "ResizablePMCArray"
    push $P478, "?"
    push $P478, "!"
    push $P478, "*"
    .return ($P478)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("119_1260829317.63188") :method
.annotate "line", 243
    $P481 = self."!protoregex"("package_declarator")
    .return ($P481)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("120_1260829317.63188") :method
.annotate "line", 243
    $P483 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P483)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("121_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx485_tgt
    .local int rx485_pos
    .local int rx485_off
    .local int rx485_eos
    .local int rx485_rep
    .local pmc rx485_cur
    (rx485_cur, rx485_pos, rx485_tgt) = self."!cursor_start"()
    rx485_cur."!cursor_debug"("START ", "package_declarator:sym<module>")
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
    ne $I10, -1, rxscan489_done
    goto rxscan489_scan
  rxscan489_loop:
    ($P10) = rx485_cur."from"()
    inc $P10
    set rx485_pos, $P10
    ge rx485_pos, rx485_eos, rxscan489_done
  rxscan489_scan:
    set_addr $I10, rxscan489_loop
    rx485_cur."!mark_push"(0, rx485_pos, $I10)
  rxscan489_done:
.annotate "line", 244
  # rx subcapture "sym"
    set_addr $I10, rxcap_490_fail
    rx485_cur."!mark_push"(0, rx485_pos, $I10)
  # rx literal  "module"
    add $I11, rx485_pos, 6
    gt $I11, rx485_eos, rx485_fail
    sub $I11, rx485_pos, rx485_off
    substr $S10, rx485_tgt, $I11, 6
    ne $S10, "module", rx485_fail
    add rx485_pos, 6
    set_addr $I10, rxcap_490_fail
    ($I12, $I11) = rx485_cur."!mark_peek"($I10)
    rx485_cur."!cursor_pos"($I11)
    ($P10) = rx485_cur."!cursor_start"()
    $P10."!cursor_pass"(rx485_pos, "")
    rx485_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_490_done
  rxcap_490_fail:
    goto rx485_fail
  rxcap_490_done:
  # rx subrule "package_def" subtype=capture negate=
    rx485_cur."!cursor_pos"(rx485_pos)
    $P10 = rx485_cur."package_def"()
    unless $P10, rx485_fail
    rx485_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx485_pos = $P10."pos"()
  # rx pass
    rx485_cur."!cursor_pass"(rx485_pos, "package_declarator:sym<module>")
    rx485_cur."!cursor_debug"("PASS  ", "package_declarator:sym<module>", " at pos=", rx485_pos)
    .return (rx485_cur)
  rx485_fail:
.annotate "line", 4
    (rx485_rep, rx485_pos, $I10, $P10) = rx485_cur."!mark_fail"(0)
    lt rx485_pos, -1, rx485_done
    eq rx485_pos, -1, rx485_fail
    jump $I10
  rx485_done:
    rx485_cur."!cursor_fail"()
    rx485_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<module>")
    .return (rx485_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("122_1260829317.63188") :method
.annotate "line", 4
    $P487 = self."!PREFIX__!subrule"("package_def", "module")
    new $P488, "ResizablePMCArray"
    push $P488, $P487
    .return ($P488)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("123_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx492_tgt
    .local int rx492_pos
    .local int rx492_off
    .local int rx492_eos
    .local int rx492_rep
    .local pmc rx492_cur
    (rx492_cur, rx492_pos, rx492_tgt) = self."!cursor_start"()
    rx492_cur."!cursor_debug"("START ", "package_declarator:sym<class>")
    .lex unicode:"$\x{a2}", rx492_cur
    .local pmc match
    .lex "$/", match
    length rx492_eos, rx492_tgt
    set rx492_off, 0
    lt rx492_pos, 2, rx492_start
    sub rx492_off, rx492_pos, 1
    substr rx492_tgt, rx492_tgt, rx492_off
  rx492_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan497_done
    goto rxscan497_scan
  rxscan497_loop:
    ($P10) = rx492_cur."from"()
    inc $P10
    set rx492_pos, $P10
    ge rx492_pos, rx492_eos, rxscan497_done
  rxscan497_scan:
    set_addr $I10, rxscan497_loop
    rx492_cur."!mark_push"(0, rx492_pos, $I10)
  rxscan497_done:
.annotate "line", 245
  # rx subcapture "sym"
    set_addr $I10, rxcap_499_fail
    rx492_cur."!mark_push"(0, rx492_pos, $I10)
  alt498_0:
    set_addr $I10, alt498_1
    rx492_cur."!mark_push"(0, rx492_pos, $I10)
  # rx literal  "class"
    add $I11, rx492_pos, 5
    gt $I11, rx492_eos, rx492_fail
    sub $I11, rx492_pos, rx492_off
    substr $S10, rx492_tgt, $I11, 5
    ne $S10, "class", rx492_fail
    add rx492_pos, 5
    goto alt498_end
  alt498_1:
  # rx literal  "grammar"
    add $I11, rx492_pos, 7
    gt $I11, rx492_eos, rx492_fail
    sub $I11, rx492_pos, rx492_off
    substr $S10, rx492_tgt, $I11, 7
    ne $S10, "grammar", rx492_fail
    add rx492_pos, 7
  alt498_end:
    set_addr $I10, rxcap_499_fail
    ($I12, $I11) = rx492_cur."!mark_peek"($I10)
    rx492_cur."!cursor_pos"($I11)
    ($P10) = rx492_cur."!cursor_start"()
    $P10."!cursor_pass"(rx492_pos, "")
    rx492_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_499_done
  rxcap_499_fail:
    goto rx492_fail
  rxcap_499_done:
  # rx subrule "package_def" subtype=capture negate=
    rx492_cur."!cursor_pos"(rx492_pos)
    $P10 = rx492_cur."package_def"()
    unless $P10, rx492_fail
    rx492_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx492_pos = $P10."pos"()
  # rx pass
    rx492_cur."!cursor_pass"(rx492_pos, "package_declarator:sym<class>")
    rx492_cur."!cursor_debug"("PASS  ", "package_declarator:sym<class>", " at pos=", rx492_pos)
    .return (rx492_cur)
  rx492_fail:
.annotate "line", 4
    (rx492_rep, rx492_pos, $I10, $P10) = rx492_cur."!mark_fail"(0)
    lt rx492_pos, -1, rx492_done
    eq rx492_pos, -1, rx492_fail
    jump $I10
  rx492_done:
    rx492_cur."!cursor_fail"()
    rx492_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<class>")
    .return (rx492_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("124_1260829317.63188") :method
.annotate "line", 4
    $P494 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P495 = self."!PREFIX__!subrule"("package_def", "class")
    new $P496, "ResizablePMCArray"
    push $P496, $P494
    push $P496, $P495
    .return ($P496)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("125_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx501_tgt
    .local int rx501_pos
    .local int rx501_off
    .local int rx501_eos
    .local int rx501_rep
    .local pmc rx501_cur
    (rx501_cur, rx501_pos, rx501_tgt) = self."!cursor_start"()
    rx501_cur."!cursor_debug"("START ", "package_def")
    rx501_cur."!cursor_caparray"("parent")
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
.annotate "line", 247
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
.annotate "line", 248
  # rx subrule "name" subtype=capture negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."name"()
    unless $P10, rx501_fail
    rx501_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx501_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
.annotate "line", 249
  # rx rxquantr507 ** 0..1
    set_addr $I511, rxquantr507_done
    rx501_cur."!mark_push"(0, rx501_pos, $I511)
  rxquantr507_loop:
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx501_pos, 2
    gt $I11, rx501_eos, rx501_fail
    sub $I11, rx501_pos, rx501_off
    substr $S10, rx501_tgt, $I11, 2
    ne $S10, "is", rx501_fail
    add rx501_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."name"()
    unless $P10, rx501_fail
    rx501_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx501_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
    (rx501_rep) = rx501_cur."!mark_commit"($I511)
  rxquantr507_done:
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
  alt513_0:
.annotate "line", 250
    set_addr $I10, alt513_1
    rx501_cur."!mark_push"(0, rx501_pos, $I10)
.annotate "line", 251
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx501_pos, 1
    gt $I11, rx501_eos, rx501_fail
    sub $I11, rx501_pos, rx501_off
    substr $S10, rx501_tgt, $I11, 1
    ne $S10, ";", rx501_fail
    add rx501_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."comp_unit"()
    unless $P10, rx501_fail
    rx501_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx501_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
    goto alt513_end
  alt513_1:
    set_addr $I10, alt513_2
    rx501_cur."!mark_push"(0, rx501_pos, $I10)
.annotate "line", 252
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx501_pos, rx501_eos, rx501_fail
    sub $I10, rx501_pos, rx501_off
    substr $S10, rx501_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx501_fail
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."block"()
    unless $P10, rx501_fail
    rx501_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx501_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
    goto alt513_end
  alt513_2:
.annotate "line", 253
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."panic"("Malformed package declaration")
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
  alt513_end:
.annotate "line", 254
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
.annotate "line", 247
  # rx pass
    rx501_cur."!cursor_pass"(rx501_pos, "package_def")
    rx501_cur."!cursor_debug"("PASS  ", "package_def", " at pos=", rx501_pos)
    .return (rx501_cur)
  rx501_fail:
.annotate "line", 4
    (rx501_rep, rx501_pos, $I10, $P10) = rx501_cur."!mark_fail"(0)
    lt rx501_pos, -1, rx501_done
    eq rx501_pos, -1, rx501_fail
    jump $I10
  rx501_done:
    rx501_cur."!cursor_fail"()
    rx501_cur."!cursor_debug"("FAIL  ", "package_def")
    .return (rx501_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("126_1260829317.63188") :method
.annotate "line", 4
    new $P503, "ResizablePMCArray"
    push $P503, ""
    .return ($P503)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("127_1260829317.63188") :method
.annotate "line", 257
    $P524 = self."!protoregex"("scope_declarator")
    .return ($P524)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("128_1260829317.63188") :method
.annotate "line", 257
    $P526 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P526)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("129_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx528_tgt
    .local int rx528_pos
    .local int rx528_off
    .local int rx528_eos
    .local int rx528_rep
    .local pmc rx528_cur
    (rx528_cur, rx528_pos, rx528_tgt) = self."!cursor_start"()
    rx528_cur."!cursor_debug"("START ", "scope_declarator:sym<my>")
    .lex unicode:"$\x{a2}", rx528_cur
    .local pmc match
    .lex "$/", match
    length rx528_eos, rx528_tgt
    set rx528_off, 0
    lt rx528_pos, 2, rx528_start
    sub rx528_off, rx528_pos, 1
    substr rx528_tgt, rx528_tgt, rx528_off
  rx528_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan532_done
    goto rxscan532_scan
  rxscan532_loop:
    ($P10) = rx528_cur."from"()
    inc $P10
    set rx528_pos, $P10
    ge rx528_pos, rx528_eos, rxscan532_done
  rxscan532_scan:
    set_addr $I10, rxscan532_loop
    rx528_cur."!mark_push"(0, rx528_pos, $I10)
  rxscan532_done:
.annotate "line", 258
  # rx subcapture "sym"
    set_addr $I10, rxcap_533_fail
    rx528_cur."!mark_push"(0, rx528_pos, $I10)
  # rx literal  "my"
    add $I11, rx528_pos, 2
    gt $I11, rx528_eos, rx528_fail
    sub $I11, rx528_pos, rx528_off
    substr $S10, rx528_tgt, $I11, 2
    ne $S10, "my", rx528_fail
    add rx528_pos, 2
    set_addr $I10, rxcap_533_fail
    ($I12, $I11) = rx528_cur."!mark_peek"($I10)
    rx528_cur."!cursor_pos"($I11)
    ($P10) = rx528_cur."!cursor_start"()
    $P10."!cursor_pass"(rx528_pos, "")
    rx528_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_533_done
  rxcap_533_fail:
    goto rx528_fail
  rxcap_533_done:
  # rx subrule "scoped" subtype=capture negate=
    rx528_cur."!cursor_pos"(rx528_pos)
    $P10 = rx528_cur."scoped"("my")
    unless $P10, rx528_fail
    rx528_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx528_pos = $P10."pos"()
  # rx pass
    rx528_cur."!cursor_pass"(rx528_pos, "scope_declarator:sym<my>")
    rx528_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<my>", " at pos=", rx528_pos)
    .return (rx528_cur)
  rx528_fail:
.annotate "line", 4
    (rx528_rep, rx528_pos, $I10, $P10) = rx528_cur."!mark_fail"(0)
    lt rx528_pos, -1, rx528_done
    eq rx528_pos, -1, rx528_fail
    jump $I10
  rx528_done:
    rx528_cur."!cursor_fail"()
    rx528_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<my>")
    .return (rx528_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("130_1260829317.63188") :method
.annotate "line", 4
    $P530 = self."!PREFIX__!subrule"("scoped", "my")
    new $P531, "ResizablePMCArray"
    push $P531, $P530
    .return ($P531)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("131_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx535_tgt
    .local int rx535_pos
    .local int rx535_off
    .local int rx535_eos
    .local int rx535_rep
    .local pmc rx535_cur
    (rx535_cur, rx535_pos, rx535_tgt) = self."!cursor_start"()
    rx535_cur."!cursor_debug"("START ", "scope_declarator:sym<our>")
    .lex unicode:"$\x{a2}", rx535_cur
    .local pmc match
    .lex "$/", match
    length rx535_eos, rx535_tgt
    set rx535_off, 0
    lt rx535_pos, 2, rx535_start
    sub rx535_off, rx535_pos, 1
    substr rx535_tgt, rx535_tgt, rx535_off
  rx535_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan539_done
    goto rxscan539_scan
  rxscan539_loop:
    ($P10) = rx535_cur."from"()
    inc $P10
    set rx535_pos, $P10
    ge rx535_pos, rx535_eos, rxscan539_done
  rxscan539_scan:
    set_addr $I10, rxscan539_loop
    rx535_cur."!mark_push"(0, rx535_pos, $I10)
  rxscan539_done:
.annotate "line", 259
  # rx subcapture "sym"
    set_addr $I10, rxcap_540_fail
    rx535_cur."!mark_push"(0, rx535_pos, $I10)
  # rx literal  "our"
    add $I11, rx535_pos, 3
    gt $I11, rx535_eos, rx535_fail
    sub $I11, rx535_pos, rx535_off
    substr $S10, rx535_tgt, $I11, 3
    ne $S10, "our", rx535_fail
    add rx535_pos, 3
    set_addr $I10, rxcap_540_fail
    ($I12, $I11) = rx535_cur."!mark_peek"($I10)
    rx535_cur."!cursor_pos"($I11)
    ($P10) = rx535_cur."!cursor_start"()
    $P10."!cursor_pass"(rx535_pos, "")
    rx535_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_540_done
  rxcap_540_fail:
    goto rx535_fail
  rxcap_540_done:
  # rx subrule "scoped" subtype=capture negate=
    rx535_cur."!cursor_pos"(rx535_pos)
    $P10 = rx535_cur."scoped"("our")
    unless $P10, rx535_fail
    rx535_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx535_pos = $P10."pos"()
  # rx pass
    rx535_cur."!cursor_pass"(rx535_pos, "scope_declarator:sym<our>")
    rx535_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<our>", " at pos=", rx535_pos)
    .return (rx535_cur)
  rx535_fail:
.annotate "line", 4
    (rx535_rep, rx535_pos, $I10, $P10) = rx535_cur."!mark_fail"(0)
    lt rx535_pos, -1, rx535_done
    eq rx535_pos, -1, rx535_fail
    jump $I10
  rx535_done:
    rx535_cur."!cursor_fail"()
    rx535_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<our>")
    .return (rx535_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("132_1260829317.63188") :method
.annotate "line", 4
    $P537 = self."!PREFIX__!subrule"("scoped", "our")
    new $P538, "ResizablePMCArray"
    push $P538, $P537
    .return ($P538)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("133_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx542_tgt
    .local int rx542_pos
    .local int rx542_off
    .local int rx542_eos
    .local int rx542_rep
    .local pmc rx542_cur
    (rx542_cur, rx542_pos, rx542_tgt) = self."!cursor_start"()
    rx542_cur."!cursor_debug"("START ", "scope_declarator:sym<has>")
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
.annotate "line", 260
  # rx subcapture "sym"
    set_addr $I10, rxcap_547_fail
    rx542_cur."!mark_push"(0, rx542_pos, $I10)
  # rx literal  "has"
    add $I11, rx542_pos, 3
    gt $I11, rx542_eos, rx542_fail
    sub $I11, rx542_pos, rx542_off
    substr $S10, rx542_tgt, $I11, 3
    ne $S10, "has", rx542_fail
    add rx542_pos, 3
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
    $P10 = rx542_cur."scoped"("has")
    unless $P10, rx542_fail
    rx542_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx542_pos = $P10."pos"()
  # rx pass
    rx542_cur."!cursor_pass"(rx542_pos, "scope_declarator:sym<has>")
    rx542_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<has>", " at pos=", rx542_pos)
    .return (rx542_cur)
  rx542_fail:
.annotate "line", 4
    (rx542_rep, rx542_pos, $I10, $P10) = rx542_cur."!mark_fail"(0)
    lt rx542_pos, -1, rx542_done
    eq rx542_pos, -1, rx542_fail
    jump $I10
  rx542_done:
    rx542_cur."!cursor_fail"()
    rx542_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<has>")
    .return (rx542_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("134_1260829317.63188") :method
.annotate "line", 4
    $P544 = self."!PREFIX__!subrule"("scoped", "has")
    new $P545, "ResizablePMCArray"
    push $P545, $P544
    .return ($P545)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("135_1260829317.63188") :method :outer("11_1260829317.63188")
    .param pmc param_549
.annotate "line", 262
    .lex "$*SCOPE", param_549
.annotate "line", 4
    .local string rx550_tgt
    .local int rx550_pos
    .local int rx550_off
    .local int rx550_eos
    .local int rx550_rep
    .local pmc rx550_cur
    (rx550_cur, rx550_pos, rx550_tgt) = self."!cursor_start"()
    rx550_cur."!cursor_debug"("START ", "scoped")
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
    ne $I10, -1, rxscan553_done
    goto rxscan553_scan
  rxscan553_loop:
    ($P10) = rx550_cur."from"()
    inc $P10
    set rx550_pos, $P10
    ge rx550_pos, rx550_eos, rxscan553_done
  rxscan553_scan:
    set_addr $I10, rxscan553_loop
    rx550_cur."!mark_push"(0, rx550_pos, $I10)
  rxscan553_done:
  alt554_0:
.annotate "line", 262
    set_addr $I10, alt554_1
    rx550_cur."!mark_push"(0, rx550_pos, $I10)
.annotate "line", 263
  # rx subrule "ws" subtype=method negate=
    rx550_cur."!cursor_pos"(rx550_pos)
    $P10 = rx550_cur."ws"()
    unless $P10, rx550_fail
    rx550_pos = $P10."pos"()
  # rx subrule "variable_declarator" subtype=capture negate=
    rx550_cur."!cursor_pos"(rx550_pos)
    $P10 = rx550_cur."variable_declarator"()
    unless $P10, rx550_fail
    rx550_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx550_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx550_cur."!cursor_pos"(rx550_pos)
    $P10 = rx550_cur."ws"()
    unless $P10, rx550_fail
    rx550_pos = $P10."pos"()
    goto alt554_end
  alt554_1:
.annotate "line", 264
  # rx subrule "ws" subtype=method negate=
    rx550_cur."!cursor_pos"(rx550_pos)
    $P10 = rx550_cur."ws"()
    unless $P10, rx550_fail
    rx550_pos = $P10."pos"()
  # rx subrule "routine_declarator" subtype=capture negate=
    rx550_cur."!cursor_pos"(rx550_pos)
    $P10 = rx550_cur."routine_declarator"()
    unless $P10, rx550_fail
    rx550_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx550_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx550_cur."!cursor_pos"(rx550_pos)
    $P10 = rx550_cur."ws"()
    unless $P10, rx550_fail
    rx550_pos = $P10."pos"()
  alt554_end:
.annotate "line", 262
  # rx pass
    rx550_cur."!cursor_pass"(rx550_pos, "scoped")
    rx550_cur."!cursor_debug"("PASS  ", "scoped", " at pos=", rx550_pos)
    .return (rx550_cur)
  rx550_fail:
.annotate "line", 4
    (rx550_rep, rx550_pos, $I10, $P10) = rx550_cur."!mark_fail"(0)
    lt rx550_pos, -1, rx550_done
    eq rx550_pos, -1, rx550_fail
    jump $I10
  rx550_done:
    rx550_cur."!cursor_fail"()
    rx550_cur."!cursor_debug"("FAIL  ", "scoped")
    .return (rx550_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("136_1260829317.63188") :method
.annotate "line", 4
    new $P552, "ResizablePMCArray"
    push $P552, ""
    push $P552, ""
    .return ($P552)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("137_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx560_tgt
    .local int rx560_pos
    .local int rx560_off
    .local int rx560_eos
    .local int rx560_rep
    .local pmc rx560_cur
    (rx560_cur, rx560_pos, rx560_tgt) = self."!cursor_start"()
    rx560_cur."!cursor_debug"("START ", "variable_declarator")
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
.annotate "line", 267
  # rx subrule "variable" subtype=capture negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."variable"()
    unless $P10, rx560_fail
    rx560_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx560_pos = $P10."pos"()
  # rx pass
    rx560_cur."!cursor_pass"(rx560_pos, "variable_declarator")
    rx560_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx560_pos)
    .return (rx560_cur)
  rx560_fail:
.annotate "line", 4
    (rx560_rep, rx560_pos, $I10, $P10) = rx560_cur."!mark_fail"(0)
    lt rx560_pos, -1, rx560_done
    eq rx560_pos, -1, rx560_fail
    jump $I10
  rx560_done:
    rx560_cur."!cursor_fail"()
    rx560_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx560_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("138_1260829317.63188") :method
.annotate "line", 4
    $P562 = self."!PREFIX__!subrule"("variable", "")
    new $P563, "ResizablePMCArray"
    push $P563, $P562
    .return ($P563)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("139_1260829317.63188") :method
.annotate "line", 269
    $P566 = self."!protoregex"("routine_declarator")
    .return ($P566)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("140_1260829317.63188") :method
.annotate "line", 269
    $P568 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P568)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("141_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx570_tgt
    .local int rx570_pos
    .local int rx570_off
    .local int rx570_eos
    .local int rx570_rep
    .local pmc rx570_cur
    (rx570_cur, rx570_pos, rx570_tgt) = self."!cursor_start"()
    rx570_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
    .lex unicode:"$\x{a2}", rx570_cur
    .local pmc match
    .lex "$/", match
    length rx570_eos, rx570_tgt
    set rx570_off, 0
    lt rx570_pos, 2, rx570_start
    sub rx570_off, rx570_pos, 1
    substr rx570_tgt, rx570_tgt, rx570_off
  rx570_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan574_done
    goto rxscan574_scan
  rxscan574_loop:
    ($P10) = rx570_cur."from"()
    inc $P10
    set rx570_pos, $P10
    ge rx570_pos, rx570_eos, rxscan574_done
  rxscan574_scan:
    set_addr $I10, rxscan574_loop
    rx570_cur."!mark_push"(0, rx570_pos, $I10)
  rxscan574_done:
.annotate "line", 270
  # rx subcapture "sym"
    set_addr $I10, rxcap_575_fail
    rx570_cur."!mark_push"(0, rx570_pos, $I10)
  # rx literal  "sub"
    add $I11, rx570_pos, 3
    gt $I11, rx570_eos, rx570_fail
    sub $I11, rx570_pos, rx570_off
    substr $S10, rx570_tgt, $I11, 3
    ne $S10, "sub", rx570_fail
    add rx570_pos, 3
    set_addr $I10, rxcap_575_fail
    ($I12, $I11) = rx570_cur."!mark_peek"($I10)
    rx570_cur."!cursor_pos"($I11)
    ($P10) = rx570_cur."!cursor_start"()
    $P10."!cursor_pass"(rx570_pos, "")
    rx570_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_575_done
  rxcap_575_fail:
    goto rx570_fail
  rxcap_575_done:
  # rx subrule "routine_def" subtype=capture negate=
    rx570_cur."!cursor_pos"(rx570_pos)
    $P10 = rx570_cur."routine_def"()
    unless $P10, rx570_fail
    rx570_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx570_pos = $P10."pos"()
  # rx pass
    rx570_cur."!cursor_pass"(rx570_pos, "routine_declarator:sym<sub>")
    rx570_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx570_pos)
    .return (rx570_cur)
  rx570_fail:
.annotate "line", 4
    (rx570_rep, rx570_pos, $I10, $P10) = rx570_cur."!mark_fail"(0)
    lt rx570_pos, -1, rx570_done
    eq rx570_pos, -1, rx570_fail
    jump $I10
  rx570_done:
    rx570_cur."!cursor_fail"()
    rx570_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx570_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("142_1260829317.63188") :method
.annotate "line", 4
    $P572 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P573, "ResizablePMCArray"
    push $P573, $P572
    .return ($P573)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("143_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx577_tgt
    .local int rx577_pos
    .local int rx577_off
    .local int rx577_eos
    .local int rx577_rep
    .local pmc rx577_cur
    (rx577_cur, rx577_pos, rx577_tgt) = self."!cursor_start"()
    rx577_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
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
.annotate "line", 271
  # rx subcapture "sym"
    set_addr $I10, rxcap_582_fail
    rx577_cur."!mark_push"(0, rx577_pos, $I10)
  # rx literal  "method"
    add $I11, rx577_pos, 6
    gt $I11, rx577_eos, rx577_fail
    sub $I11, rx577_pos, rx577_off
    substr $S10, rx577_tgt, $I11, 6
    ne $S10, "method", rx577_fail
    add rx577_pos, 6
    set_addr $I10, rxcap_582_fail
    ($I12, $I11) = rx577_cur."!mark_peek"($I10)
    rx577_cur."!cursor_pos"($I11)
    ($P10) = rx577_cur."!cursor_start"()
    $P10."!cursor_pass"(rx577_pos, "")
    rx577_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_582_done
  rxcap_582_fail:
    goto rx577_fail
  rxcap_582_done:
  # rx subrule "method_def" subtype=capture negate=
    rx577_cur."!cursor_pos"(rx577_pos)
    $P10 = rx577_cur."method_def"()
    unless $P10, rx577_fail
    rx577_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx577_pos = $P10."pos"()
  # rx pass
    rx577_cur."!cursor_pass"(rx577_pos, "routine_declarator:sym<method>")
    rx577_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx577_pos)
    .return (rx577_cur)
  rx577_fail:
.annotate "line", 4
    (rx577_rep, rx577_pos, $I10, $P10) = rx577_cur."!mark_fail"(0)
    lt rx577_pos, -1, rx577_done
    eq rx577_pos, -1, rx577_fail
    jump $I10
  rx577_done:
    rx577_cur."!cursor_fail"()
    rx577_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx577_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("144_1260829317.63188") :method
.annotate "line", 4
    $P579 = self."!PREFIX__!subrule"("method_def", "method")
    new $P580, "ResizablePMCArray"
    push $P580, $P579
    .return ($P580)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("145_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx584_tgt
    .local int rx584_pos
    .local int rx584_off
    .local int rx584_eos
    .local int rx584_rep
    .local pmc rx584_cur
    (rx584_cur, rx584_pos, rx584_tgt) = self."!cursor_start"()
    rx584_cur."!cursor_debug"("START ", "routine_def")
    rx584_cur."!cursor_caparray"("deflongname", "sigil")
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
    ne $I10, -1, rxscan587_done
    goto rxscan587_scan
  rxscan587_loop:
    ($P10) = rx584_cur."from"()
    inc $P10
    set rx584_pos, $P10
    ge rx584_pos, rx584_eos, rxscan587_done
  rxscan587_scan:
    set_addr $I10, rxscan587_loop
    rx584_cur."!mark_push"(0, rx584_pos, $I10)
  rxscan587_done:
.annotate "line", 273
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
.annotate "line", 274
  # rx rxquantr589 ** 0..1
    set_addr $I595, rxquantr589_done
    rx584_cur."!mark_push"(0, rx584_pos, $I595)
  rxquantr589_loop:
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
  # rx subcapture "sigil"
    set_addr $I10, rxcap_593_fail
    rx584_cur."!mark_push"(0, rx584_pos, $I10)
  # rx rxquantr591 ** 0..1
    set_addr $I592, rxquantr591_done
    rx584_cur."!mark_push"(0, rx584_pos, $I592)
  rxquantr591_loop:
  # rx literal  "&"
    add $I11, rx584_pos, 1
    gt $I11, rx584_eos, rx584_fail
    sub $I11, rx584_pos, rx584_off
    substr $S10, rx584_tgt, $I11, 1
    ne $S10, "&", rx584_fail
    add rx584_pos, 1
    (rx584_rep) = rx584_cur."!mark_commit"($I592)
  rxquantr591_done:
    set_addr $I10, rxcap_593_fail
    ($I12, $I11) = rx584_cur."!mark_peek"($I10)
    rx584_cur."!cursor_pos"($I11)
    ($P10) = rx584_cur."!cursor_start"()
    $P10."!cursor_pass"(rx584_pos, "")
    rx584_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_593_done
  rxcap_593_fail:
    goto rx584_fail
  rxcap_593_done:
  # rx subrule "deflongname" subtype=capture negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."deflongname"()
    unless $P10, rx584_fail
    rx584_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx584_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
    (rx584_rep) = rx584_cur."!mark_commit"($I595)
  rxquantr589_done:
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
.annotate "line", 275
  # rx subrule "newpad" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."newpad"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
  alt598_0:
.annotate "line", 276
    set_addr $I10, alt598_1
    rx584_cur."!mark_push"(0, rx584_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx584_pos, 1
    gt $I11, rx584_eos, rx584_fail
    sub $I11, rx584_pos, rx584_off
    substr $S10, rx584_tgt, $I11, 1
    ne $S10, "(", rx584_fail
    add rx584_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."signature"()
    unless $P10, rx584_fail
    rx584_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx584_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx584_pos, 1
    gt $I11, rx584_eos, rx584_fail
    sub $I11, rx584_pos, rx584_off
    substr $S10, rx584_tgt, $I11, 1
    ne $S10, ")", rx584_fail
    add rx584_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
    goto alt598_end
  alt598_1:
.annotate "line", 277
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
  alt598_end:
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
.annotate "line", 278
  # rx subrule "blockoid" subtype=capture negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."blockoid"()
    unless $P10, rx584_fail
    rx584_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx584_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
.annotate "line", 273
  # rx pass
    rx584_cur."!cursor_pass"(rx584_pos, "routine_def")
    rx584_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx584_pos)
    .return (rx584_cur)
  rx584_fail:
.annotate "line", 4
    (rx584_rep, rx584_pos, $I10, $P10) = rx584_cur."!mark_fail"(0)
    lt rx584_pos, -1, rx584_done
    eq rx584_pos, -1, rx584_fail
    jump $I10
  rx584_done:
    rx584_cur."!cursor_fail"()
    rx584_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx584_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("146_1260829317.63188") :method
.annotate "line", 4
    new $P586, "ResizablePMCArray"
    push $P586, ""
    .return ($P586)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("147_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx608_tgt
    .local int rx608_pos
    .local int rx608_off
    .local int rx608_eos
    .local int rx608_rep
    .local pmc rx608_cur
    (rx608_cur, rx608_pos, rx608_tgt) = self."!cursor_start"()
    rx608_cur."!cursor_debug"("START ", "method_def")
    rx608_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx608_cur
    .local pmc match
    .lex "$/", match
    length rx608_eos, rx608_tgt
    set rx608_off, 0
    lt rx608_pos, 2, rx608_start
    sub rx608_off, rx608_pos, 1
    substr rx608_tgt, rx608_tgt, rx608_off
  rx608_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan611_done
    goto rxscan611_scan
  rxscan611_loop:
    ($P10) = rx608_cur."from"()
    inc $P10
    set rx608_pos, $P10
    ge rx608_pos, rx608_eos, rxscan611_done
  rxscan611_scan:
    set_addr $I10, rxscan611_loop
    rx608_cur."!mark_push"(0, rx608_pos, $I10)
  rxscan611_done:
.annotate "line", 281
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
.annotate "line", 282
  # rx rxquantr613 ** 0..1
    set_addr $I614, rxquantr613_done
    rx608_cur."!mark_push"(0, rx608_pos, $I614)
  rxquantr613_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."deflongname"()
    unless $P10, rx608_fail
    rx608_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx608_pos = $P10."pos"()
    (rx608_rep) = rx608_cur."!mark_commit"($I614)
  rxquantr613_done:
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
.annotate "line", 283
  # rx subrule "newpad" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."newpad"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
  alt617_0:
.annotate "line", 284
    set_addr $I10, alt617_1
    rx608_cur."!mark_push"(0, rx608_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx608_pos, 1
    gt $I11, rx608_eos, rx608_fail
    sub $I11, rx608_pos, rx608_off
    substr $S10, rx608_tgt, $I11, 1
    ne $S10, "(", rx608_fail
    add rx608_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."signature"()
    unless $P10, rx608_fail
    rx608_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx608_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx608_pos, 1
    gt $I11, rx608_eos, rx608_fail
    sub $I11, rx608_pos, rx608_off
    substr $S10, rx608_tgt, $I11, 1
    ne $S10, ")", rx608_fail
    add rx608_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
    goto alt617_end
  alt617_1:
.annotate "line", 285
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
  alt617_end:
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
.annotate "line", 286
  # rx subrule "blockoid" subtype=capture negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."blockoid"()
    unless $P10, rx608_fail
    rx608_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx608_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
.annotate "line", 281
  # rx pass
    rx608_cur."!cursor_pass"(rx608_pos, "method_def")
    rx608_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx608_pos)
    .return (rx608_cur)
  rx608_fail:
.annotate "line", 4
    (rx608_rep, rx608_pos, $I10, $P10) = rx608_cur."!mark_fail"(0)
    lt rx608_pos, -1, rx608_done
    eq rx608_pos, -1, rx608_fail
    jump $I10
  rx608_done:
    rx608_cur."!cursor_fail"()
    rx608_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx608_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("148_1260829317.63188") :method
.annotate "line", 4
    new $P610, "ResizablePMCArray"
    push $P610, ""
    .return ($P610)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("149_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx627_tgt
    .local int rx627_pos
    .local int rx627_off
    .local int rx627_eos
    .local int rx627_rep
    .local pmc rx627_cur
    (rx627_cur, rx627_pos, rx627_tgt) = self."!cursor_start"()
    rx627_cur."!cursor_debug"("START ", "signature")
    rx627_cur."!cursor_caparray"("parameter")
    .lex unicode:"$\x{a2}", rx627_cur
    .local pmc match
    .lex "$/", match
    length rx627_eos, rx627_tgt
    set rx627_off, 0
    lt rx627_pos, 2, rx627_start
    sub rx627_off, rx627_pos, 1
    substr rx627_tgt, rx627_tgt, rx627_off
  rx627_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan630_done
    goto rxscan630_scan
  rxscan630_loop:
    ($P10) = rx627_cur."from"()
    inc $P10
    set rx627_pos, $P10
    ge rx627_pos, rx627_eos, rxscan630_done
  rxscan630_scan:
    set_addr $I10, rxscan630_loop
    rx627_cur."!mark_push"(0, rx627_pos, $I10)
  rxscan630_done:
.annotate "line", 289
  # rx rxquantr631 ** 0..1
    set_addr $I634, rxquantr631_done
    rx627_cur."!mark_push"(0, rx627_pos, $I634)
  rxquantr631_loop:
  # rx rxquantr632 ** 1..*
    set_addr $I633, rxquantr632_done
    rx627_cur."!mark_push"(0, -1, $I633)
  rxquantr632_loop:
  # rx subrule "ws" subtype=method negate=
    rx627_cur."!cursor_pos"(rx627_pos)
    $P10 = rx627_cur."ws"()
    unless $P10, rx627_fail
    rx627_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx627_cur."!cursor_pos"(rx627_pos)
    $P10 = rx627_cur."parameter"()
    unless $P10, rx627_fail
    rx627_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx627_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx627_cur."!cursor_pos"(rx627_pos)
    $P10 = rx627_cur."ws"()
    unless $P10, rx627_fail
    rx627_pos = $P10."pos"()
    (rx627_rep) = rx627_cur."!mark_commit"($I633)
    rx627_cur."!mark_push"(rx627_rep, rx627_pos, $I633)
  # rx literal  ","
    add $I11, rx627_pos, 1
    gt $I11, rx627_eos, rx627_fail
    sub $I11, rx627_pos, rx627_off
    substr $S10, rx627_tgt, $I11, 1
    ne $S10, ",", rx627_fail
    add rx627_pos, 1
    goto rxquantr632_loop
  rxquantr632_done:
    (rx627_rep) = rx627_cur."!mark_commit"($I634)
  rxquantr631_done:
  # rx pass
    rx627_cur."!cursor_pass"(rx627_pos, "signature")
    rx627_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx627_pos)
    .return (rx627_cur)
  rx627_fail:
.annotate "line", 4
    (rx627_rep, rx627_pos, $I10, $P10) = rx627_cur."!mark_fail"(0)
    lt rx627_pos, -1, rx627_done
    eq rx627_pos, -1, rx627_fail
    jump $I10
  rx627_done:
    rx627_cur."!cursor_fail"()
    rx627_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx627_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("150_1260829317.63188") :method
.annotate "line", 4
    new $P629, "ResizablePMCArray"
    push $P629, ""
    .return ($P629)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("151_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx636_tgt
    .local int rx636_pos
    .local int rx636_off
    .local int rx636_eos
    .local int rx636_rep
    .local pmc rx636_cur
    (rx636_cur, rx636_pos, rx636_tgt) = self."!cursor_start"()
    rx636_cur."!cursor_debug"("START ", "parameter")
    rx636_cur."!cursor_caparray"("default_value")
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
    ne $I10, -1, rxscan642_done
    goto rxscan642_scan
  rxscan642_loop:
    ($P10) = rx636_cur."from"()
    inc $P10
    set rx636_pos, $P10
    ge rx636_pos, rx636_eos, rxscan642_done
  rxscan642_scan:
    set_addr $I10, rxscan642_loop
    rx636_cur."!mark_push"(0, rx636_pos, $I10)
  rxscan642_done:
  alt643_0:
.annotate "line", 292
    set_addr $I10, alt643_1
    rx636_cur."!mark_push"(0, rx636_pos, $I10)
.annotate "line", 293
  # rx subcapture "quant"
    set_addr $I10, rxcap_644_fail
    rx636_cur."!mark_push"(0, rx636_pos, $I10)
  # rx literal  "*"
    add $I11, rx636_pos, 1
    gt $I11, rx636_eos, rx636_fail
    sub $I11, rx636_pos, rx636_off
    substr $S10, rx636_tgt, $I11, 1
    ne $S10, "*", rx636_fail
    add rx636_pos, 1
    set_addr $I10, rxcap_644_fail
    ($I12, $I11) = rx636_cur."!mark_peek"($I10)
    rx636_cur."!cursor_pos"($I11)
    ($P10) = rx636_cur."!cursor_start"()
    $P10."!cursor_pass"(rx636_pos, "")
    rx636_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_644_done
  rxcap_644_fail:
    goto rx636_fail
  rxcap_644_done:
  # rx subrule "param_var" subtype=capture negate=
    rx636_cur."!cursor_pos"(rx636_pos)
    $P10 = rx636_cur."param_var"()
    unless $P10, rx636_fail
    rx636_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx636_pos = $P10."pos"()
    goto alt643_end
  alt643_1:
  alt645_0:
.annotate "line", 294
    set_addr $I10, alt645_1
    rx636_cur."!mark_push"(0, rx636_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx636_cur."!cursor_pos"(rx636_pos)
    $P10 = rx636_cur."param_var"()
    unless $P10, rx636_fail
    rx636_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx636_pos = $P10."pos"()
    goto alt645_end
  alt645_1:
  # rx subrule "named_param" subtype=capture negate=
    rx636_cur."!cursor_pos"(rx636_pos)
    $P10 = rx636_cur."named_param"()
    unless $P10, rx636_fail
    rx636_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx636_pos = $P10."pos"()
  alt645_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_647_fail
    rx636_cur."!mark_push"(0, rx636_pos, $I10)
  alt646_0:
    set_addr $I10, alt646_1
    rx636_cur."!mark_push"(0, rx636_pos, $I10)
  # rx literal  "?"
    add $I11, rx636_pos, 1
    gt $I11, rx636_eos, rx636_fail
    sub $I11, rx636_pos, rx636_off
    substr $S10, rx636_tgt, $I11, 1
    ne $S10, "?", rx636_fail
    add rx636_pos, 1
    goto alt646_end
  alt646_1:
    set_addr $I10, alt646_2
    rx636_cur."!mark_push"(0, rx636_pos, $I10)
  # rx literal  "!"
    add $I11, rx636_pos, 1
    gt $I11, rx636_eos, rx636_fail
    sub $I11, rx636_pos, rx636_off
    substr $S10, rx636_tgt, $I11, 1
    ne $S10, "!", rx636_fail
    add rx636_pos, 1
    goto alt646_end
  alt646_2:
  alt646_end:
    set_addr $I10, rxcap_647_fail
    ($I12, $I11) = rx636_cur."!mark_peek"($I10)
    rx636_cur."!cursor_pos"($I11)
    ($P10) = rx636_cur."!cursor_start"()
    $P10."!cursor_pass"(rx636_pos, "")
    rx636_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_647_done
  rxcap_647_fail:
    goto rx636_fail
  rxcap_647_done:
  alt643_end:
.annotate "line", 296
  # rx rxquantr648 ** 0..1
    set_addr $I649, rxquantr648_done
    rx636_cur."!mark_push"(0, rx636_pos, $I649)
  rxquantr648_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx636_cur."!cursor_pos"(rx636_pos)
    $P10 = rx636_cur."default_value"()
    unless $P10, rx636_fail
    rx636_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("default_value")
    rx636_pos = $P10."pos"()
    (rx636_rep) = rx636_cur."!mark_commit"($I649)
  rxquantr648_done:
.annotate "line", 291
  # rx pass
    rx636_cur."!cursor_pass"(rx636_pos, "parameter")
    rx636_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx636_pos)
    .return (rx636_cur)
  rx636_fail:
.annotate "line", 4
    (rx636_rep, rx636_pos, $I10, $P10) = rx636_cur."!mark_fail"(0)
    lt rx636_pos, -1, rx636_done
    eq rx636_pos, -1, rx636_fail
    jump $I10
  rx636_done:
    rx636_cur."!cursor_fail"()
    rx636_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx636_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("152_1260829317.63188") :method
.annotate "line", 4
    $P638 = self."!PREFIX__!subrule"("named_param", "")
    $P639 = self."!PREFIX__!subrule"("param_var", "")
    $P640 = self."!PREFIX__!subrule"("param_var", "*")
    new $P641, "ResizablePMCArray"
    push $P641, $P638
    push $P641, $P639
    push $P641, $P640
    .return ($P641)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("153_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx651_tgt
    .local int rx651_pos
    .local int rx651_off
    .local int rx651_eos
    .local int rx651_rep
    .local pmc rx651_cur
    (rx651_cur, rx651_pos, rx651_tgt) = self."!cursor_start"()
    rx651_cur."!cursor_debug"("START ", "param_var")
    rx651_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx651_cur
    .local pmc match
    .lex "$/", match
    length rx651_eos, rx651_tgt
    set rx651_off, 0
    lt rx651_pos, 2, rx651_start
    sub rx651_off, rx651_pos, 1
    substr rx651_tgt, rx651_tgt, rx651_off
  rx651_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan655_done
    goto rxscan655_scan
  rxscan655_loop:
    ($P10) = rx651_cur."from"()
    inc $P10
    set rx651_pos, $P10
    ge rx651_pos, rx651_eos, rxscan655_done
  rxscan655_scan:
    set_addr $I10, rxscan655_loop
    rx651_cur."!mark_push"(0, rx651_pos, $I10)
  rxscan655_done:
.annotate "line", 300
  # rx subrule "sigil" subtype=capture negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."sigil"()
    unless $P10, rx651_fail
    rx651_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx651_pos = $P10."pos"()
  # rx rxquantr656 ** 0..1
    set_addr $I657, rxquantr656_done
    rx651_cur."!mark_push"(0, rx651_pos, $I657)
  rxquantr656_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."twigil"()
    unless $P10, rx651_fail
    rx651_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx651_pos = $P10."pos"()
    (rx651_rep) = rx651_cur."!mark_commit"($I657)
  rxquantr656_done:
  alt658_0:
.annotate "line", 301
    set_addr $I10, alt658_1
    rx651_cur."!mark_push"(0, rx651_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."ident"()
    unless $P10, rx651_fail
    rx651_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx651_pos = $P10."pos"()
    goto alt658_end
  alt658_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_659_fail
    rx651_cur."!mark_push"(0, rx651_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx651_pos, rx651_eos, rx651_fail
    sub $I10, rx651_pos, rx651_off
    substr $S10, rx651_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx651_fail
    inc rx651_pos
    set_addr $I10, rxcap_659_fail
    ($I12, $I11) = rx651_cur."!mark_peek"($I10)
    rx651_cur."!cursor_pos"($I11)
    ($P10) = rx651_cur."!cursor_start"()
    $P10."!cursor_pass"(rx651_pos, "")
    rx651_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_659_done
  rxcap_659_fail:
    goto rx651_fail
  rxcap_659_done:
  alt658_end:
.annotate "line", 299
  # rx pass
    rx651_cur."!cursor_pass"(rx651_pos, "param_var")
    rx651_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx651_pos)
    .return (rx651_cur)
  rx651_fail:
.annotate "line", 4
    (rx651_rep, rx651_pos, $I10, $P10) = rx651_cur."!mark_fail"(0)
    lt rx651_pos, -1, rx651_done
    eq rx651_pos, -1, rx651_fail
    jump $I10
  rx651_done:
    rx651_cur."!cursor_fail"()
    rx651_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx651_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("154_1260829317.63188") :method
.annotate "line", 4
    $P653 = self."!PREFIX__!subrule"("sigil", "")
    new $P654, "ResizablePMCArray"
    push $P654, $P653
    .return ($P654)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("155_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx661_tgt
    .local int rx661_pos
    .local int rx661_off
    .local int rx661_eos
    .local int rx661_rep
    .local pmc rx661_cur
    (rx661_cur, rx661_pos, rx661_tgt) = self."!cursor_start"()
    rx661_cur."!cursor_debug"("START ", "named_param")
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
    ne $I10, -1, rxscan665_done
    goto rxscan665_scan
  rxscan665_loop:
    ($P10) = rx661_cur."from"()
    inc $P10
    set rx661_pos, $P10
    ge rx661_pos, rx661_eos, rxscan665_done
  rxscan665_scan:
    set_addr $I10, rxscan665_loop
    rx661_cur."!mark_push"(0, rx661_pos, $I10)
  rxscan665_done:
.annotate "line", 305
  # rx literal  ":"
    add $I11, rx661_pos, 1
    gt $I11, rx661_eos, rx661_fail
    sub $I11, rx661_pos, rx661_off
    substr $S10, rx661_tgt, $I11, 1
    ne $S10, ":", rx661_fail
    add rx661_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."param_var"()
    unless $P10, rx661_fail
    rx661_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx661_pos = $P10."pos"()
.annotate "line", 304
  # rx pass
    rx661_cur."!cursor_pass"(rx661_pos, "named_param")
    rx661_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx661_pos)
    .return (rx661_cur)
  rx661_fail:
.annotate "line", 4
    (rx661_rep, rx661_pos, $I10, $P10) = rx661_cur."!mark_fail"(0)
    lt rx661_pos, -1, rx661_done
    eq rx661_pos, -1, rx661_fail
    jump $I10
  rx661_done:
    rx661_cur."!cursor_fail"()
    rx661_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx661_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("156_1260829317.63188") :method
.annotate "line", 4
    $P663 = self."!PREFIX__!subrule"("param_var", ":")
    new $P664, "ResizablePMCArray"
    push $P664, $P663
    .return ($P664)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("157_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx667_tgt
    .local int rx667_pos
    .local int rx667_off
    .local int rx667_eos
    .local int rx667_rep
    .local pmc rx667_cur
    (rx667_cur, rx667_pos, rx667_tgt) = self."!cursor_start"()
    rx667_cur."!cursor_debug"("START ", "default_value")
    .lex unicode:"$\x{a2}", rx667_cur
    .local pmc match
    .lex "$/", match
    length rx667_eos, rx667_tgt
    set rx667_off, 0
    lt rx667_pos, 2, rx667_start
    sub rx667_off, rx667_pos, 1
    substr rx667_tgt, rx667_tgt, rx667_off
  rx667_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan670_done
    goto rxscan670_scan
  rxscan670_loop:
    ($P10) = rx667_cur."from"()
    inc $P10
    set rx667_pos, $P10
    ge rx667_pos, rx667_eos, rxscan670_done
  rxscan670_scan:
    set_addr $I10, rxscan670_loop
    rx667_cur."!mark_push"(0, rx667_pos, $I10)
  rxscan670_done:
.annotate "line", 308
  # rx subrule "ws" subtype=method negate=
    rx667_cur."!cursor_pos"(rx667_pos)
    $P10 = rx667_cur."ws"()
    unless $P10, rx667_fail
    rx667_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx667_pos, 1
    gt $I11, rx667_eos, rx667_fail
    sub $I11, rx667_pos, rx667_off
    substr $S10, rx667_tgt, $I11, 1
    ne $S10, "=", rx667_fail
    add rx667_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx667_cur."!cursor_pos"(rx667_pos)
    $P10 = rx667_cur."ws"()
    unless $P10, rx667_fail
    rx667_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx667_cur."!cursor_pos"(rx667_pos)
    $P10 = rx667_cur."EXPR"("i=")
    unless $P10, rx667_fail
    rx667_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx667_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx667_cur."!cursor_pos"(rx667_pos)
    $P10 = rx667_cur."ws"()
    unless $P10, rx667_fail
    rx667_pos = $P10."pos"()
  # rx pass
    rx667_cur."!cursor_pass"(rx667_pos, "default_value")
    rx667_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx667_pos)
    .return (rx667_cur)
  rx667_fail:
.annotate "line", 4
    (rx667_rep, rx667_pos, $I10, $P10) = rx667_cur."!mark_fail"(0)
    lt rx667_pos, -1, rx667_done
    eq rx667_pos, -1, rx667_fail
    jump $I10
  rx667_done:
    rx667_cur."!cursor_fail"()
    rx667_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx667_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("158_1260829317.63188") :method
.annotate "line", 4
    new $P669, "ResizablePMCArray"
    push $P669, ""
    .return ($P669)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("159_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx675_tgt
    .local int rx675_pos
    .local int rx675_off
    .local int rx675_eos
    .local int rx675_rep
    .local pmc rx675_cur
    (rx675_cur, rx675_pos, rx675_tgt) = self."!cursor_start"()
    rx675_cur."!cursor_debug"("START ", "regex_declarator")
    rx675_cur."!cursor_caparray"("signature")
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
    ne $I10, -1, rxscan678_done
    goto rxscan678_scan
  rxscan678_loop:
    ($P10) = rx675_cur."from"()
    inc $P10
    set rx675_pos, $P10
    ge rx675_pos, rx675_eos, rxscan678_done
  rxscan678_scan:
    set_addr $I10, rxscan678_loop
    rx675_cur."!mark_push"(0, rx675_pos, $I10)
  rxscan678_done:
.annotate "line", 310
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  alt680_0:
.annotate "line", 311
    set_addr $I10, alt680_1
    rx675_cur."!mark_push"(0, rx675_pos, $I10)
.annotate "line", 312
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_682_fail
    rx675_cur."!mark_push"(0, rx675_pos, $I10)
  # rx literal  "proto"
    add $I11, rx675_pos, 5
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 5
    ne $S10, "proto", rx675_fail
    add rx675_pos, 5
    set_addr $I10, rxcap_682_fail
    ($I12, $I11) = rx675_cur."!mark_peek"($I10)
    rx675_cur."!cursor_pos"($I11)
    ($P10) = rx675_cur."!cursor_start"()
    $P10."!cursor_pass"(rx675_pos, "")
    rx675_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_682_done
  rxcap_682_fail:
    goto rx675_fail
  rxcap_682_done:
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  alt684_0:
    set_addr $I10, alt684_1
    rx675_cur."!mark_push"(0, rx675_pos, $I10)
  # rx literal  "regex"
    add $I11, rx675_pos, 5
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 5
    ne $S10, "regex", rx675_fail
    add rx675_pos, 5
    goto alt684_end
  alt684_1:
    set_addr $I10, alt684_2
    rx675_cur."!mark_push"(0, rx675_pos, $I10)
  # rx literal  "token"
    add $I11, rx675_pos, 5
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 5
    ne $S10, "token", rx675_fail
    add rx675_pos, 5
    goto alt684_end
  alt684_2:
  # rx literal  "rule"
    add $I11, rx675_pos, 4
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 4
    ne $S10, "rule", rx675_fail
    add rx675_pos, 4
  alt684_end:
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
.annotate "line", 313
  # rx subrule "deflongname" subtype=capture negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."deflongname"()
    unless $P10, rx675_fail
    rx675_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx675_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
.annotate "line", 314
  # rx literal  "{"
    add $I11, rx675_pos, 1
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 1
    ne $S10, "{", rx675_fail
    add rx675_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx675_pos, 5
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 5
    ne $S10, "<...>", rx675_fail
    add rx675_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx675_pos, 1
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 1
    ne $S10, "}", rx675_fail
    add rx675_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ENDSTMT"()
    unless $P10, rx675_fail
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
.annotate "line", 312
    goto alt680_end
  alt680_1:
.annotate "line", 315
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_692_fail
    rx675_cur."!mark_push"(0, rx675_pos, $I10)
  alt691_0:
    set_addr $I10, alt691_1
    rx675_cur."!mark_push"(0, rx675_pos, $I10)
  # rx literal  "regex"
    add $I11, rx675_pos, 5
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 5
    ne $S10, "regex", rx675_fail
    add rx675_pos, 5
    goto alt691_end
  alt691_1:
    set_addr $I10, alt691_2
    rx675_cur."!mark_push"(0, rx675_pos, $I10)
  # rx literal  "token"
    add $I11, rx675_pos, 5
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 5
    ne $S10, "token", rx675_fail
    add rx675_pos, 5
    goto alt691_end
  alt691_2:
  # rx literal  "rule"
    add $I11, rx675_pos, 4
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 4
    ne $S10, "rule", rx675_fail
    add rx675_pos, 4
  alt691_end:
    set_addr $I10, rxcap_692_fail
    ($I12, $I11) = rx675_cur."!mark_peek"($I10)
    rx675_cur."!cursor_pos"($I11)
    ($P10) = rx675_cur."!cursor_start"()
    $P10."!cursor_pass"(rx675_pos, "")
    rx675_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_692_done
  rxcap_692_fail:
    goto rx675_fail
  rxcap_692_done:
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
.annotate "line", 316
  # rx subrule "deflongname" subtype=capture negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."deflongname"()
    unless $P10, rx675_fail
    rx675_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx675_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
.annotate "line", 317
  # rx subrule "newpad" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."newpad"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
.annotate "line", 318
  # rx rxquantr696 ** 0..1
    set_addr $I701, rxquantr696_done
    rx675_cur."!mark_push"(0, rx675_pos, $I701)
  rxquantr696_loop:
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx675_pos, 1
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 1
    ne $S10, "(", rx675_fail
    add rx675_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."signature"()
    unless $P10, rx675_fail
    rx675_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx675_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx675_pos, 1
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 1
    ne $S10, ")", rx675_fail
    add rx675_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
    (rx675_rep) = rx675_cur."!mark_commit"($I701)
  rxquantr696_done:
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
.annotate "line", 319
  # rx reduce name="regex_declarator" key="open"
    rx675_cur."!cursor_pos"(rx675_pos)
    rx675_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
.annotate "line", 320
  # rx literal  "{"
    add $I11, rx675_pos, 1
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 1
    ne $S10, "{", rx675_fail
    add rx675_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."LANG"("Regex", "nibbler")
    unless $P10, rx675_fail
    rx675_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx675_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx675_pos, 1
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 1
    ne $S10, "}", rx675_fail
    add rx675_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ENDSTMT"()
    unless $P10, rx675_fail
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  alt680_end:
.annotate "line", 321
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
.annotate "line", 310
  # rx pass
    rx675_cur."!cursor_pass"(rx675_pos, "regex_declarator")
    rx675_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx675_pos)
    .return (rx675_cur)
  rx675_fail:
.annotate "line", 4
    (rx675_rep, rx675_pos, $I10, $P10) = rx675_cur."!mark_fail"(0)
    lt rx675_pos, -1, rx675_done
    eq rx675_pos, -1, rx675_fail
    jump $I10
  rx675_done:
    rx675_cur."!cursor_fail"()
    rx675_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx675_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("160_1260829317.63188") :method
.annotate "line", 4
    new $P677, "ResizablePMCArray"
    push $P677, ""
    .return ($P677)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("161_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx707_tgt
    .local int rx707_pos
    .local int rx707_off
    .local int rx707_eos
    .local int rx707_rep
    .local pmc rx707_cur
    (rx707_cur, rx707_pos, rx707_tgt) = self."!cursor_start"()
    rx707_cur."!cursor_debug"("START ", "dotty")
    rx707_cur."!cursor_caparray"("args")
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
    ne $I10, -1, rxscan711_done
    goto rxscan711_scan
  rxscan711_loop:
    ($P10) = rx707_cur."from"()
    inc $P10
    set rx707_pos, $P10
    ge rx707_pos, rx707_eos, rxscan711_done
  rxscan711_scan:
    set_addr $I10, rxscan711_loop
    rx707_cur."!mark_push"(0, rx707_pos, $I10)
  rxscan711_done:
.annotate "line", 325
  # rx literal  "."
    add $I11, rx707_pos, 1
    gt $I11, rx707_eos, rx707_fail
    sub $I11, rx707_pos, rx707_off
    substr $S10, rx707_tgt, $I11, 1
    ne $S10, ".", rx707_fail
    add rx707_pos, 1
  alt712_0:
.annotate "line", 326
    set_addr $I10, alt712_1
    rx707_cur."!mark_push"(0, rx707_pos, $I10)
  # rx subrule "identifier" subtype=capture negate=
    rx707_cur."!cursor_pos"(rx707_pos)
    $P10 = rx707_cur."identifier"()
    unless $P10, rx707_fail
    rx707_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=identifier")
    rx707_pos = $P10."pos"()
    goto alt712_end
  alt712_1:
.annotate "line", 327
  # rx enumcharlist negate=0 zerowidth
    ge rx707_pos, rx707_eos, rx707_fail
    sub $I10, rx707_pos, rx707_off
    substr $S10, rx707_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx707_fail
  # rx subrule "quote" subtype=capture negate=
    rx707_cur."!cursor_pos"(rx707_pos)
    $P10 = rx707_cur."quote"()
    unless $P10, rx707_fail
    rx707_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx707_pos = $P10."pos"()
  alt713_0:
.annotate "line", 328
    set_addr $I10, alt713_1
    rx707_cur."!mark_push"(0, rx707_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx707_pos, rx707_eos, rx707_fail
    sub $I10, rx707_pos, rx707_off
    substr $S10, rx707_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx707_fail
    goto alt713_end
  alt713_1:
  # rx subrule "panic" subtype=method negate=
    rx707_cur."!cursor_pos"(rx707_pos)
    $P10 = rx707_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx707_fail
    rx707_pos = $P10."pos"()
  alt713_end:
  alt712_end:
.annotate "line", 334
  # rx rxquantr714 ** 0..1
    set_addr $I716, rxquantr714_done
    rx707_cur."!mark_push"(0, rx707_pos, $I716)
  rxquantr714_loop:
  alt715_0:
.annotate "line", 331
    set_addr $I10, alt715_1
    rx707_cur."!mark_push"(0, rx707_pos, $I10)
.annotate "line", 332
  # rx enumcharlist negate=0 zerowidth
    ge rx707_pos, rx707_eos, rx707_fail
    sub $I10, rx707_pos, rx707_off
    substr $S10, rx707_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx707_fail
  # rx subrule "args" subtype=capture negate=
    rx707_cur."!cursor_pos"(rx707_pos)
    $P10 = rx707_cur."args"()
    unless $P10, rx707_fail
    rx707_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx707_pos = $P10."pos"()
    goto alt715_end
  alt715_1:
.annotate "line", 333
  # rx literal  ":"
    add $I11, rx707_pos, 1
    gt $I11, rx707_eos, rx707_fail
    sub $I11, rx707_pos, rx707_off
    substr $S10, rx707_tgt, $I11, 1
    ne $S10, ":", rx707_fail
    add rx707_pos, 1
  # rx charclass s
    ge rx707_pos, rx707_eos, rx707_fail
    sub $I10, rx707_pos, rx707_off
    is_cclass $I11, 32, rx707_tgt, $I10
    unless $I11, rx707_fail
    inc rx707_pos
  # rx subrule "arglist" subtype=capture negate=
    rx707_cur."!cursor_pos"(rx707_pos)
    $P10 = rx707_cur."arglist"()
    unless $P10, rx707_fail
    rx707_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx707_pos = $P10."pos"()
  alt715_end:
.annotate "line", 334
    (rx707_rep) = rx707_cur."!mark_commit"($I716)
  rxquantr714_done:
.annotate "line", 324
  # rx pass
    rx707_cur."!cursor_pass"(rx707_pos, "dotty")
    rx707_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx707_pos)
    .return (rx707_cur)
  rx707_fail:
.annotate "line", 4
    (rx707_rep, rx707_pos, $I10, $P10) = rx707_cur."!mark_fail"(0)
    lt rx707_pos, -1, rx707_done
    eq rx707_pos, -1, rx707_fail
    jump $I10
  rx707_done:
    rx707_cur."!cursor_fail"()
    rx707_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx707_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("162_1260829317.63188") :method
.annotate "line", 4
    $P709 = self."!PREFIX__!subrule"("longname=identifier", ".")
    new $P710, "ResizablePMCArray"
    push $P710, "'"
    push $P710, "\""
    push $P710, $P709
    .return ($P710)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("163_1260829317.63188") :method
.annotate "line", 338
    $P718 = self."!protoregex"("term")
    .return ($P718)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("164_1260829317.63188") :method
.annotate "line", 338
    $P720 = self."!PREFIX__!protoregex"("term")
    .return ($P720)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("165_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx722_tgt
    .local int rx722_pos
    .local int rx722_off
    .local int rx722_eos
    .local int rx722_rep
    .local pmc rx722_cur
    (rx722_cur, rx722_pos, rx722_tgt) = self."!cursor_start"()
    rx722_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx722_cur
    .local pmc match
    .lex "$/", match
    length rx722_eos, rx722_tgt
    set rx722_off, 0
    lt rx722_pos, 2, rx722_start
    sub rx722_off, rx722_pos, 1
    substr rx722_tgt, rx722_tgt, rx722_off
  rx722_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan725_done
    goto rxscan725_scan
  rxscan725_loop:
    ($P10) = rx722_cur."from"()
    inc $P10
    set rx722_pos, $P10
    ge rx722_pos, rx722_eos, rxscan725_done
  rxscan725_scan:
    set_addr $I10, rxscan725_loop
    rx722_cur."!mark_push"(0, rx722_pos, $I10)
  rxscan725_done:
.annotate "line", 340
  # rx subcapture "sym"
    set_addr $I10, rxcap_726_fail
    rx722_cur."!mark_push"(0, rx722_pos, $I10)
  # rx literal  "self"
    add $I11, rx722_pos, 4
    gt $I11, rx722_eos, rx722_fail
    sub $I11, rx722_pos, rx722_off
    substr $S10, rx722_tgt, $I11, 4
    ne $S10, "self", rx722_fail
    add rx722_pos, 4
    set_addr $I10, rxcap_726_fail
    ($I12, $I11) = rx722_cur."!mark_peek"($I10)
    rx722_cur."!cursor_pos"($I11)
    ($P10) = rx722_cur."!cursor_start"()
    $P10."!cursor_pass"(rx722_pos, "")
    rx722_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_726_done
  rxcap_726_fail:
    goto rx722_fail
  rxcap_726_done:
  # rxanchor rwb
    le rx722_pos, 0, rx722_fail
    sub $I10, rx722_pos, rx722_off
    is_cclass $I11, 8192, rx722_tgt, $I10
    if $I11, rx722_fail
    dec $I10
    is_cclass $I11, 8192, rx722_tgt, $I10
    unless $I11, rx722_fail
  # rx pass
    rx722_cur."!cursor_pass"(rx722_pos, "term:sym<self>")
    rx722_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx722_pos)
    .return (rx722_cur)
  rx722_fail:
.annotate "line", 4
    (rx722_rep, rx722_pos, $I10, $P10) = rx722_cur."!mark_fail"(0)
    lt rx722_pos, -1, rx722_done
    eq rx722_pos, -1, rx722_fail
    jump $I10
  rx722_done:
    rx722_cur."!cursor_fail"()
    rx722_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx722_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("166_1260829317.63188") :method
.annotate "line", 4
    new $P724, "ResizablePMCArray"
    push $P724, "self"
    .return ($P724)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("167_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx728_tgt
    .local int rx728_pos
    .local int rx728_off
    .local int rx728_eos
    .local int rx728_rep
    .local pmc rx728_cur
    (rx728_cur, rx728_pos, rx728_tgt) = self."!cursor_start"()
    rx728_cur."!cursor_debug"("START ", "term:sym<identifier>")
    .lex unicode:"$\x{a2}", rx728_cur
    .local pmc match
    .lex "$/", match
    length rx728_eos, rx728_tgt
    set rx728_off, 0
    lt rx728_pos, 2, rx728_start
    sub rx728_off, rx728_pos, 1
    substr rx728_tgt, rx728_tgt, rx728_off
  rx728_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan732_done
    goto rxscan732_scan
  rxscan732_loop:
    ($P10) = rx728_cur."from"()
    inc $P10
    set rx728_pos, $P10
    ge rx728_pos, rx728_eos, rxscan732_done
  rxscan732_scan:
    set_addr $I10, rxscan732_loop
    rx728_cur."!mark_push"(0, rx728_pos, $I10)
  rxscan732_done:
.annotate "line", 343
  # rx subrule "identifier" subtype=capture negate=
    rx728_cur."!cursor_pos"(rx728_pos)
    $P10 = rx728_cur."identifier"()
    unless $P10, rx728_fail
    rx728_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx728_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx728_pos, rx728_eos, rx728_fail
    sub $I10, rx728_pos, rx728_off
    substr $S10, rx728_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx728_fail
  # rx subrule "args" subtype=capture negate=
    rx728_cur."!cursor_pos"(rx728_pos)
    $P10 = rx728_cur."args"()
    unless $P10, rx728_fail
    rx728_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx728_pos = $P10."pos"()
.annotate "line", 342
  # rx pass
    rx728_cur."!cursor_pass"(rx728_pos, "term:sym<identifier>")
    rx728_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx728_pos)
    .return (rx728_cur)
  rx728_fail:
.annotate "line", 4
    (rx728_rep, rx728_pos, $I10, $P10) = rx728_cur."!mark_fail"(0)
    lt rx728_pos, -1, rx728_done
    eq rx728_pos, -1, rx728_fail
    jump $I10
  rx728_done:
    rx728_cur."!cursor_fail"()
    rx728_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx728_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("168_1260829317.63188") :method
.annotate "line", 4
    $P730 = self."!PREFIX__!subrule"("identifier", "")
    new $P731, "ResizablePMCArray"
    push $P731, $P730
    .return ($P731)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("169_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx734_tgt
    .local int rx734_pos
    .local int rx734_off
    .local int rx734_eos
    .local int rx734_rep
    .local pmc rx734_cur
    (rx734_cur, rx734_pos, rx734_tgt) = self."!cursor_start"()
    rx734_cur."!cursor_debug"("START ", "term:sym<name>")
    rx734_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx734_cur
    .local pmc match
    .lex "$/", match
    length rx734_eos, rx734_tgt
    set rx734_off, 0
    lt rx734_pos, 2, rx734_start
    sub rx734_off, rx734_pos, 1
    substr rx734_tgt, rx734_tgt, rx734_off
  rx734_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan738_done
    goto rxscan738_scan
  rxscan738_loop:
    ($P10) = rx734_cur."from"()
    inc $P10
    set rx734_pos, $P10
    ge rx734_pos, rx734_eos, rxscan738_done
  rxscan738_scan:
    set_addr $I10, rxscan738_loop
    rx734_cur."!mark_push"(0, rx734_pos, $I10)
  rxscan738_done:
.annotate "line", 347
  # rx subrule "name" subtype=capture negate=
    rx734_cur."!cursor_pos"(rx734_pos)
    $P10 = rx734_cur."name"()
    unless $P10, rx734_fail
    rx734_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx734_pos = $P10."pos"()
  # rx rxquantr739 ** 0..1
    set_addr $I740, rxquantr739_done
    rx734_cur."!mark_push"(0, rx734_pos, $I740)
  rxquantr739_loop:
  # rx subrule "args" subtype=capture negate=
    rx734_cur."!cursor_pos"(rx734_pos)
    $P10 = rx734_cur."args"()
    unless $P10, rx734_fail
    rx734_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx734_pos = $P10."pos"()
    (rx734_rep) = rx734_cur."!mark_commit"($I740)
  rxquantr739_done:
.annotate "line", 346
  # rx pass
    rx734_cur."!cursor_pass"(rx734_pos, "term:sym<name>")
    rx734_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx734_pos)
    .return (rx734_cur)
  rx734_fail:
.annotate "line", 4
    (rx734_rep, rx734_pos, $I10, $P10) = rx734_cur."!mark_fail"(0)
    lt rx734_pos, -1, rx734_done
    eq rx734_pos, -1, rx734_fail
    jump $I10
  rx734_done:
    rx734_cur."!cursor_fail"()
    rx734_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx734_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("170_1260829317.63188") :method
.annotate "line", 4
    $P736 = self."!PREFIX__!subrule"("name", "")
    new $P737, "ResizablePMCArray"
    push $P737, $P736
    .return ($P737)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("171_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx742_tgt
    .local int rx742_pos
    .local int rx742_off
    .local int rx742_eos
    .local int rx742_rep
    .local pmc rx742_cur
    (rx742_cur, rx742_pos, rx742_tgt) = self."!cursor_start"()
    rx742_cur."!cursor_debug"("START ", "term:sym<pir::op>")
    rx742_cur."!cursor_caparray"("args")
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
    ne $I10, -1, rxscan745_done
    goto rxscan745_scan
  rxscan745_loop:
    ($P10) = rx742_cur."from"()
    inc $P10
    set rx742_pos, $P10
    ge rx742_pos, rx742_eos, rxscan745_done
  rxscan745_scan:
    set_addr $I10, rxscan745_loop
    rx742_cur."!mark_push"(0, rx742_pos, $I10)
  rxscan745_done:
.annotate "line", 351
  # rx literal  "pir::"
    add $I11, rx742_pos, 5
    gt $I11, rx742_eos, rx742_fail
    sub $I11, rx742_pos, rx742_off
    substr $S10, rx742_tgt, $I11, 5
    ne $S10, "pir::", rx742_fail
    add rx742_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_746_fail
    rx742_cur."!mark_push"(0, rx742_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx742_pos, rx742_off
    find_not_cclass $I11, 8192, rx742_tgt, $I10, rx742_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx742_fail
    add rx742_pos, rx742_off, $I11
    set_addr $I10, rxcap_746_fail
    ($I12, $I11) = rx742_cur."!mark_peek"($I10)
    rx742_cur."!cursor_pos"($I11)
    ($P10) = rx742_cur."!cursor_start"()
    $P10."!cursor_pass"(rx742_pos, "")
    rx742_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_746_done
  rxcap_746_fail:
    goto rx742_fail
  rxcap_746_done:
  # rx rxquantr747 ** 0..1
    set_addr $I748, rxquantr747_done
    rx742_cur."!mark_push"(0, rx742_pos, $I748)
  rxquantr747_loop:
  # rx subrule "args" subtype=capture negate=
    rx742_cur."!cursor_pos"(rx742_pos)
    $P10 = rx742_cur."args"()
    unless $P10, rx742_fail
    rx742_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx742_pos = $P10."pos"()
    (rx742_rep) = rx742_cur."!mark_commit"($I748)
  rxquantr747_done:
.annotate "line", 350
  # rx pass
    rx742_cur."!cursor_pass"(rx742_pos, "term:sym<pir::op>")
    rx742_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx742_pos)
    .return (rx742_cur)
  rx742_fail:
.annotate "line", 4
    (rx742_rep, rx742_pos, $I10, $P10) = rx742_cur."!mark_fail"(0)
    lt rx742_pos, -1, rx742_done
    eq rx742_pos, -1, rx742_fail
    jump $I10
  rx742_done:
    rx742_cur."!cursor_fail"()
    rx742_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx742_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("172_1260829317.63188") :method
.annotate "line", 4
    new $P744, "ResizablePMCArray"
    push $P744, "pir::"
    .return ($P744)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("173_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx750_tgt
    .local int rx750_pos
    .local int rx750_off
    .local int rx750_eos
    .local int rx750_rep
    .local pmc rx750_cur
    (rx750_cur, rx750_pos, rx750_tgt) = self."!cursor_start"()
    rx750_cur."!cursor_debug"("START ", "args")
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
.annotate "line", 355
  # rx literal  "("
    add $I11, rx750_pos, 1
    gt $I11, rx750_eos, rx750_fail
    sub $I11, rx750_pos, rx750_off
    substr $S10, rx750_tgt, $I11, 1
    ne $S10, "(", rx750_fail
    add rx750_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."arglist"()
    unless $P10, rx750_fail
    rx750_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx750_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx750_pos, 1
    gt $I11, rx750_eos, rx750_fail
    sub $I11, rx750_pos, rx750_off
    substr $S10, rx750_tgt, $I11, 1
    ne $S10, ")", rx750_fail
    add rx750_pos, 1
  # rx pass
    rx750_cur."!cursor_pass"(rx750_pos, "args")
    rx750_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx750_pos)
    .return (rx750_cur)
  rx750_fail:
.annotate "line", 4
    (rx750_rep, rx750_pos, $I10, $P10) = rx750_cur."!mark_fail"(0)
    lt rx750_pos, -1, rx750_done
    eq rx750_pos, -1, rx750_fail
    jump $I10
  rx750_done:
    rx750_cur."!cursor_fail"()
    rx750_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx750_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("174_1260829317.63188") :method
.annotate "line", 4
    $P752 = self."!PREFIX__!subrule"("arglist", "(")
    new $P753, "ResizablePMCArray"
    push $P753, $P752
    .return ($P753)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("175_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx756_tgt
    .local int rx756_pos
    .local int rx756_off
    .local int rx756_eos
    .local int rx756_rep
    .local pmc rx756_cur
    (rx756_cur, rx756_pos, rx756_tgt) = self."!cursor_start"()
    rx756_cur."!cursor_debug"("START ", "arglist")
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
.annotate "line", 359
  # rx subrule "ws" subtype=method negate=
    rx756_cur."!cursor_pos"(rx756_pos)
    $P10 = rx756_cur."ws"()
    unless $P10, rx756_fail
    rx756_pos = $P10."pos"()
  alt761_0:
.annotate "line", 360
    set_addr $I10, alt761_1
    rx756_cur."!mark_push"(0, rx756_pos, $I10)
.annotate "line", 361
  # rx subrule "EXPR" subtype=capture negate=
    rx756_cur."!cursor_pos"(rx756_pos)
    $P10 = rx756_cur."EXPR"("f=")
    unless $P10, rx756_fail
    rx756_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx756_pos = $P10."pos"()
    goto alt761_end
  alt761_1:
  alt761_end:
.annotate "line", 358
  # rx pass
    rx756_cur."!cursor_pass"(rx756_pos, "arglist")
    rx756_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx756_pos)
    .return (rx756_cur)
  rx756_fail:
.annotate "line", 4
    (rx756_rep, rx756_pos, $I10, $P10) = rx756_cur."!mark_fail"(0)
    lt rx756_pos, -1, rx756_done
    eq rx756_pos, -1, rx756_fail
    jump $I10
  rx756_done:
    rx756_cur."!cursor_fail"()
    rx756_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx756_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("176_1260829317.63188") :method
.annotate "line", 4
    $P758 = self."!PREFIX__!subrule"("", "")
    new $P759, "ResizablePMCArray"
    push $P759, $P758
    .return ($P759)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("177_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx763_tgt
    .local int rx763_pos
    .local int rx763_off
    .local int rx763_eos
    .local int rx763_rep
    .local pmc rx763_cur
    (rx763_cur, rx763_pos, rx763_tgt) = self."!cursor_start"()
    rx763_cur."!cursor_debug"("START ", "term:sym<value>")
    .lex unicode:"$\x{a2}", rx763_cur
    .local pmc match
    .lex "$/", match
    length rx763_eos, rx763_tgt
    set rx763_off, 0
    lt rx763_pos, 2, rx763_start
    sub rx763_off, rx763_pos, 1
    substr rx763_tgt, rx763_tgt, rx763_off
  rx763_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan767_done
    goto rxscan767_scan
  rxscan767_loop:
    ($P10) = rx763_cur."from"()
    inc $P10
    set rx763_pos, $P10
    ge rx763_pos, rx763_eos, rxscan767_done
  rxscan767_scan:
    set_addr $I10, rxscan767_loop
    rx763_cur."!mark_push"(0, rx763_pos, $I10)
  rxscan767_done:
.annotate "line", 367
  # rx subrule "value" subtype=capture negate=
    rx763_cur."!cursor_pos"(rx763_pos)
    $P10 = rx763_cur."value"()
    unless $P10, rx763_fail
    rx763_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx763_pos = $P10."pos"()
  # rx pass
    rx763_cur."!cursor_pass"(rx763_pos, "term:sym<value>")
    rx763_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx763_pos)
    .return (rx763_cur)
  rx763_fail:
.annotate "line", 4
    (rx763_rep, rx763_pos, $I10, $P10) = rx763_cur."!mark_fail"(0)
    lt rx763_pos, -1, rx763_done
    eq rx763_pos, -1, rx763_fail
    jump $I10
  rx763_done:
    rx763_cur."!cursor_fail"()
    rx763_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx763_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("178_1260829317.63188") :method
.annotate "line", 4
    $P765 = self."!PREFIX__!subrule"("value", "")
    new $P766, "ResizablePMCArray"
    push $P766, $P765
    .return ($P766)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("179_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx769_tgt
    .local int rx769_pos
    .local int rx769_off
    .local int rx769_eos
    .local int rx769_rep
    .local pmc rx769_cur
    (rx769_cur, rx769_pos, rx769_tgt) = self."!cursor_start"()
    rx769_cur."!cursor_debug"("START ", "value")
    .lex unicode:"$\x{a2}", rx769_cur
    .local pmc match
    .lex "$/", match
    length rx769_eos, rx769_tgt
    set rx769_off, 0
    lt rx769_pos, 2, rx769_start
    sub rx769_off, rx769_pos, 1
    substr rx769_tgt, rx769_tgt, rx769_off
  rx769_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan774_done
    goto rxscan774_scan
  rxscan774_loop:
    ($P10) = rx769_cur."from"()
    inc $P10
    set rx769_pos, $P10
    ge rx769_pos, rx769_eos, rxscan774_done
  rxscan774_scan:
    set_addr $I10, rxscan774_loop
    rx769_cur."!mark_push"(0, rx769_pos, $I10)
  rxscan774_done:
  alt775_0:
.annotate "line", 369
    set_addr $I10, alt775_1
    rx769_cur."!mark_push"(0, rx769_pos, $I10)
.annotate "line", 370
  # rx subrule "quote" subtype=capture negate=
    rx769_cur."!cursor_pos"(rx769_pos)
    $P10 = rx769_cur."quote"()
    unless $P10, rx769_fail
    rx769_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx769_pos = $P10."pos"()
    goto alt775_end
  alt775_1:
.annotate "line", 371
  # rx subrule "number" subtype=capture negate=
    rx769_cur."!cursor_pos"(rx769_pos)
    $P10 = rx769_cur."number"()
    unless $P10, rx769_fail
    rx769_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("number")
    rx769_pos = $P10."pos"()
  alt775_end:
.annotate "line", 369
  # rx pass
    rx769_cur."!cursor_pass"(rx769_pos, "value")
    rx769_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx769_pos)
    .return (rx769_cur)
  rx769_fail:
.annotate "line", 4
    (rx769_rep, rx769_pos, $I10, $P10) = rx769_cur."!mark_fail"(0)
    lt rx769_pos, -1, rx769_done
    eq rx769_pos, -1, rx769_fail
    jump $I10
  rx769_done:
    rx769_cur."!cursor_fail"()
    rx769_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx769_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("180_1260829317.63188") :method
.annotate "line", 4
    $P771 = self."!PREFIX__!subrule"("number", "")
    $P772 = self."!PREFIX__!subrule"("quote", "")
    new $P773, "ResizablePMCArray"
    push $P773, $P771
    push $P773, $P772
    .return ($P773)
.end


.namespace ["NQP";"Grammar"]
.sub "number"  :subid("181_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx777_tgt
    .local int rx777_pos
    .local int rx777_off
    .local int rx777_eos
    .local int rx777_rep
    .local pmc rx777_cur
    (rx777_cur, rx777_pos, rx777_tgt) = self."!cursor_start"()
    rx777_cur."!cursor_debug"("START ", "number")
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
.annotate "line", 375
  # rx subcapture "sign"
    set_addr $I10, rxcap_783_fail
    rx777_cur."!mark_push"(0, rx777_pos, $I10)
  # rx rxquantr781 ** 0..1
    set_addr $I782, rxquantr781_done
    rx777_cur."!mark_push"(0, rx777_pos, $I782)
  rxquantr781_loop:
  # rx enumcharlist negate=0 
    ge rx777_pos, rx777_eos, rx777_fail
    sub $I10, rx777_pos, rx777_off
    substr $S10, rx777_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rx777_fail
    inc rx777_pos
    (rx777_rep) = rx777_cur."!mark_commit"($I782)
  rxquantr781_done:
    set_addr $I10, rxcap_783_fail
    ($I12, $I11) = rx777_cur."!mark_peek"($I10)
    rx777_cur."!cursor_pos"($I11)
    ($P10) = rx777_cur."!cursor_start"()
    $P10."!cursor_pass"(rx777_pos, "")
    rx777_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_783_done
  rxcap_783_fail:
    goto rx777_fail
  rxcap_783_done:
  alt784_0:
.annotate "line", 376
    set_addr $I10, alt784_1
    rx777_cur."!mark_push"(0, rx777_pos, $I10)
  # rx subrule "dec_number" subtype=capture negate=
    rx777_cur."!cursor_pos"(rx777_pos)
    $P10 = rx777_cur."dec_number"()
    unless $P10, rx777_fail
    rx777_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx777_pos = $P10."pos"()
    goto alt784_end
  alt784_1:
  # rx subrule "integer" subtype=capture negate=
    rx777_cur."!cursor_pos"(rx777_pos)
    $P10 = rx777_cur."integer"()
    unless $P10, rx777_fail
    rx777_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx777_pos = $P10."pos"()
  alt784_end:
.annotate "line", 374
  # rx pass
    rx777_cur."!cursor_pass"(rx777_pos, "number")
    rx777_cur."!cursor_debug"("PASS  ", "number", " at pos=", rx777_pos)
    .return (rx777_cur)
  rx777_fail:
.annotate "line", 4
    (rx777_rep, rx777_pos, $I10, $P10) = rx777_cur."!mark_fail"(0)
    lt rx777_pos, -1, rx777_done
    eq rx777_pos, -1, rx777_fail
    jump $I10
  rx777_done:
    rx777_cur."!cursor_fail"()
    rx777_cur."!cursor_debug"("FAIL  ", "number")
    .return (rx777_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__number"  :subid("182_1260829317.63188") :method
.annotate "line", 4
    new $P779, "ResizablePMCArray"
    push $P779, ""
    .return ($P779)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("183_1260829317.63188") :method
.annotate "line", 379
    $P786 = self."!protoregex"("quote")
    .return ($P786)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("184_1260829317.63188") :method
.annotate "line", 379
    $P788 = self."!PREFIX__!protoregex"("quote")
    .return ($P788)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("185_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx790_tgt
    .local int rx790_pos
    .local int rx790_off
    .local int rx790_eos
    .local int rx790_rep
    .local pmc rx790_cur
    (rx790_cur, rx790_pos, rx790_tgt) = self."!cursor_start"()
    rx790_cur."!cursor_debug"("START ", "quote:sym<apos>")
    .lex unicode:"$\x{a2}", rx790_cur
    .local pmc match
    .lex "$/", match
    length rx790_eos, rx790_tgt
    set rx790_off, 0
    lt rx790_pos, 2, rx790_start
    sub rx790_off, rx790_pos, 1
    substr rx790_tgt, rx790_tgt, rx790_off
  rx790_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan793_done
    goto rxscan793_scan
  rxscan793_loop:
    ($P10) = rx790_cur."from"()
    inc $P10
    set rx790_pos, $P10
    ge rx790_pos, rx790_eos, rxscan793_done
  rxscan793_scan:
    set_addr $I10, rxscan793_loop
    rx790_cur."!mark_push"(0, rx790_pos, $I10)
  rxscan793_done:
.annotate "line", 380
  # rx enumcharlist negate=0 zerowidth
    ge rx790_pos, rx790_eos, rx790_fail
    sub $I10, rx790_pos, rx790_off
    substr $S10, rx790_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx790_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx790_cur."!cursor_pos"(rx790_pos)
    $P10 = rx790_cur."quote_EXPR"(":q")
    unless $P10, rx790_fail
    rx790_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx790_pos = $P10."pos"()
  # rx pass
    rx790_cur."!cursor_pass"(rx790_pos, "quote:sym<apos>")
    rx790_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx790_pos)
    .return (rx790_cur)
  rx790_fail:
.annotate "line", 4
    (rx790_rep, rx790_pos, $I10, $P10) = rx790_cur."!mark_fail"(0)
    lt rx790_pos, -1, rx790_done
    eq rx790_pos, -1, rx790_fail
    jump $I10
  rx790_done:
    rx790_cur."!cursor_fail"()
    rx790_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx790_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("186_1260829317.63188") :method
.annotate "line", 4
    new $P792, "ResizablePMCArray"
    push $P792, "'"
    .return ($P792)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("187_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx795_tgt
    .local int rx795_pos
    .local int rx795_off
    .local int rx795_eos
    .local int rx795_rep
    .local pmc rx795_cur
    (rx795_cur, rx795_pos, rx795_tgt) = self."!cursor_start"()
    rx795_cur."!cursor_debug"("START ", "quote:sym<dblq>")
    .lex unicode:"$\x{a2}", rx795_cur
    .local pmc match
    .lex "$/", match
    length rx795_eos, rx795_tgt
    set rx795_off, 0
    lt rx795_pos, 2, rx795_start
    sub rx795_off, rx795_pos, 1
    substr rx795_tgt, rx795_tgt, rx795_off
  rx795_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan798_done
    goto rxscan798_scan
  rxscan798_loop:
    ($P10) = rx795_cur."from"()
    inc $P10
    set rx795_pos, $P10
    ge rx795_pos, rx795_eos, rxscan798_done
  rxscan798_scan:
    set_addr $I10, rxscan798_loop
    rx795_cur."!mark_push"(0, rx795_pos, $I10)
  rxscan798_done:
.annotate "line", 381
  # rx enumcharlist negate=0 zerowidth
    ge rx795_pos, rx795_eos, rx795_fail
    sub $I10, rx795_pos, rx795_off
    substr $S10, rx795_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx795_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx795_cur."!cursor_pos"(rx795_pos)
    $P10 = rx795_cur."quote_EXPR"(":qq")
    unless $P10, rx795_fail
    rx795_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx795_pos = $P10."pos"()
  # rx pass
    rx795_cur."!cursor_pass"(rx795_pos, "quote:sym<dblq>")
    rx795_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx795_pos)
    .return (rx795_cur)
  rx795_fail:
.annotate "line", 4
    (rx795_rep, rx795_pos, $I10, $P10) = rx795_cur."!mark_fail"(0)
    lt rx795_pos, -1, rx795_done
    eq rx795_pos, -1, rx795_fail
    jump $I10
  rx795_done:
    rx795_cur."!cursor_fail"()
    rx795_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx795_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("188_1260829317.63188") :method
.annotate "line", 4
    new $P797, "ResizablePMCArray"
    push $P797, "\""
    .return ($P797)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("189_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx800_tgt
    .local int rx800_pos
    .local int rx800_off
    .local int rx800_eos
    .local int rx800_rep
    .local pmc rx800_cur
    (rx800_cur, rx800_pos, rx800_tgt) = self."!cursor_start"()
    rx800_cur."!cursor_debug"("START ", "quote:sym<q>")
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
.annotate "line", 382
  # rx literal  "q"
    add $I11, rx800_pos, 1
    gt $I11, rx800_eos, rx800_fail
    sub $I11, rx800_pos, rx800_off
    substr $S10, rx800_tgt, $I11, 1
    ne $S10, "q", rx800_fail
    add rx800_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx800_pos, rx800_eos, rx800_fail
    sub $I10, rx800_pos, rx800_off
    substr $S10, rx800_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx800_fail
  # rx subrule "ws" subtype=method negate=
    rx800_cur."!cursor_pos"(rx800_pos)
    $P10 = rx800_cur."ws"()
    unless $P10, rx800_fail
    rx800_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx800_cur."!cursor_pos"(rx800_pos)
    $P10 = rx800_cur."quote_EXPR"(":q")
    unless $P10, rx800_fail
    rx800_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx800_pos = $P10."pos"()
  # rx pass
    rx800_cur."!cursor_pass"(rx800_pos, "quote:sym<q>")
    rx800_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx800_pos)
    .return (rx800_cur)
  rx800_fail:
.annotate "line", 4
    (rx800_rep, rx800_pos, $I10, $P10) = rx800_cur."!mark_fail"(0)
    lt rx800_pos, -1, rx800_done
    eq rx800_pos, -1, rx800_fail
    jump $I10
  rx800_done:
    rx800_cur."!cursor_fail"()
    rx800_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx800_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("190_1260829317.63188") :method
.annotate "line", 4
    $P802 = self."!PREFIX__!subrule"("", "q")
    new $P803, "ResizablePMCArray"
    push $P803, $P802
    .return ($P803)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("191_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx806_tgt
    .local int rx806_pos
    .local int rx806_off
    .local int rx806_eos
    .local int rx806_rep
    .local pmc rx806_cur
    (rx806_cur, rx806_pos, rx806_tgt) = self."!cursor_start"()
    rx806_cur."!cursor_debug"("START ", "quote:sym<qq>")
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
    ne $I10, -1, rxscan810_done
    goto rxscan810_scan
  rxscan810_loop:
    ($P10) = rx806_cur."from"()
    inc $P10
    set rx806_pos, $P10
    ge rx806_pos, rx806_eos, rxscan810_done
  rxscan810_scan:
    set_addr $I10, rxscan810_loop
    rx806_cur."!mark_push"(0, rx806_pos, $I10)
  rxscan810_done:
.annotate "line", 383
  # rx literal  "qq"
    add $I11, rx806_pos, 2
    gt $I11, rx806_eos, rx806_fail
    sub $I11, rx806_pos, rx806_off
    substr $S10, rx806_tgt, $I11, 2
    ne $S10, "qq", rx806_fail
    add rx806_pos, 2
  # rx enumcharlist negate=1 zerowidth
    ge rx806_pos, rx806_eos, rx806_fail
    sub $I10, rx806_pos, rx806_off
    substr $S10, rx806_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx806_fail
  # rx subrule "ws" subtype=method negate=
    rx806_cur."!cursor_pos"(rx806_pos)
    $P10 = rx806_cur."ws"()
    unless $P10, rx806_fail
    rx806_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx806_cur."!cursor_pos"(rx806_pos)
    $P10 = rx806_cur."quote_EXPR"(":qq")
    unless $P10, rx806_fail
    rx806_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx806_pos = $P10."pos"()
  # rx pass
    rx806_cur."!cursor_pass"(rx806_pos, "quote:sym<qq>")
    rx806_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx806_pos)
    .return (rx806_cur)
  rx806_fail:
.annotate "line", 4
    (rx806_rep, rx806_pos, $I10, $P10) = rx806_cur."!mark_fail"(0)
    lt rx806_pos, -1, rx806_done
    eq rx806_pos, -1, rx806_fail
    jump $I10
  rx806_done:
    rx806_cur."!cursor_fail"()
    rx806_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx806_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("192_1260829317.63188") :method
.annotate "line", 4
    $P808 = self."!PREFIX__!subrule"("", "qq")
    new $P809, "ResizablePMCArray"
    push $P809, $P808
    .return ($P809)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("193_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx812_tgt
    .local int rx812_pos
    .local int rx812_off
    .local int rx812_eos
    .local int rx812_rep
    .local pmc rx812_cur
    (rx812_cur, rx812_pos, rx812_tgt) = self."!cursor_start"()
    rx812_cur."!cursor_debug"("START ", "quote:sym<Q>")
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
    ne $I10, -1, rxscan816_done
    goto rxscan816_scan
  rxscan816_loop:
    ($P10) = rx812_cur."from"()
    inc $P10
    set rx812_pos, $P10
    ge rx812_pos, rx812_eos, rxscan816_done
  rxscan816_scan:
    set_addr $I10, rxscan816_loop
    rx812_cur."!mark_push"(0, rx812_pos, $I10)
  rxscan816_done:
.annotate "line", 384
  # rx literal  "Q"
    add $I11, rx812_pos, 1
    gt $I11, rx812_eos, rx812_fail
    sub $I11, rx812_pos, rx812_off
    substr $S10, rx812_tgt, $I11, 1
    ne $S10, "Q", rx812_fail
    add rx812_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx812_pos, rx812_eos, rx812_fail
    sub $I10, rx812_pos, rx812_off
    substr $S10, rx812_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx812_fail
  # rx subrule "ws" subtype=method negate=
    rx812_cur."!cursor_pos"(rx812_pos)
    $P10 = rx812_cur."ws"()
    unless $P10, rx812_fail
    rx812_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx812_cur."!cursor_pos"(rx812_pos)
    $P10 = rx812_cur."quote_EXPR"()
    unless $P10, rx812_fail
    rx812_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx812_pos = $P10."pos"()
  # rx pass
    rx812_cur."!cursor_pass"(rx812_pos, "quote:sym<Q>")
    rx812_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx812_pos)
    .return (rx812_cur)
  rx812_fail:
.annotate "line", 4
    (rx812_rep, rx812_pos, $I10, $P10) = rx812_cur."!mark_fail"(0)
    lt rx812_pos, -1, rx812_done
    eq rx812_pos, -1, rx812_fail
    jump $I10
  rx812_done:
    rx812_cur."!cursor_fail"()
    rx812_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx812_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("194_1260829317.63188") :method
.annotate "line", 4
    $P814 = self."!PREFIX__!subrule"("", "Q")
    new $P815, "ResizablePMCArray"
    push $P815, $P814
    .return ($P815)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("195_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx818_tgt
    .local int rx818_pos
    .local int rx818_off
    .local int rx818_eos
    .local int rx818_rep
    .local pmc rx818_cur
    (rx818_cur, rx818_pos, rx818_tgt) = self."!cursor_start"()
    rx818_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
    .lex unicode:"$\x{a2}", rx818_cur
    .local pmc match
    .lex "$/", match
    length rx818_eos, rx818_tgt
    set rx818_off, 0
    lt rx818_pos, 2, rx818_start
    sub rx818_off, rx818_pos, 1
    substr rx818_tgt, rx818_tgt, rx818_off
  rx818_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan822_done
    goto rxscan822_scan
  rxscan822_loop:
    ($P10) = rx818_cur."from"()
    inc $P10
    set rx818_pos, $P10
    ge rx818_pos, rx818_eos, rxscan822_done
  rxscan822_scan:
    set_addr $I10, rxscan822_loop
    rx818_cur."!mark_push"(0, rx818_pos, $I10)
  rxscan822_done:
.annotate "line", 385
  # rx literal  "Q:PIR"
    add $I11, rx818_pos, 5
    gt $I11, rx818_eos, rx818_fail
    sub $I11, rx818_pos, rx818_off
    substr $S10, rx818_tgt, $I11, 5
    ne $S10, "Q:PIR", rx818_fail
    add rx818_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx818_cur."!cursor_pos"(rx818_pos)
    $P10 = rx818_cur."ws"()
    unless $P10, rx818_fail
    rx818_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx818_cur."!cursor_pos"(rx818_pos)
    $P10 = rx818_cur."quote_EXPR"()
    unless $P10, rx818_fail
    rx818_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx818_pos = $P10."pos"()
  # rx pass
    rx818_cur."!cursor_pass"(rx818_pos, "quote:sym<Q:PIR>")
    rx818_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx818_pos)
    .return (rx818_cur)
  rx818_fail:
.annotate "line", 4
    (rx818_rep, rx818_pos, $I10, $P10) = rx818_cur."!mark_fail"(0)
    lt rx818_pos, -1, rx818_done
    eq rx818_pos, -1, rx818_fail
    jump $I10
  rx818_done:
    rx818_cur."!cursor_fail"()
    rx818_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx818_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("196_1260829317.63188") :method
.annotate "line", 4
    $P820 = self."!PREFIX__!subrule"("", "Q:PIR")
    new $P821, "ResizablePMCArray"
    push $P821, $P820
    .return ($P821)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym</ />"  :subid("197_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx824_tgt
    .local int rx824_pos
    .local int rx824_off
    .local int rx824_eos
    .local int rx824_rep
    .local pmc rx824_cur
    (rx824_cur, rx824_pos, rx824_tgt) = self."!cursor_start"()
    rx824_cur."!cursor_debug"("START ", "quote:sym</ />")
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
.annotate "line", 387
  # rx literal  "/"
    add $I11, rx824_pos, 1
    gt $I11, rx824_eos, rx824_fail
    sub $I11, rx824_pos, rx824_off
    substr $S10, rx824_tgt, $I11, 1
    ne $S10, "/", rx824_fail
    add rx824_pos, 1
.annotate "line", 388
  # rx subrule "newpad" subtype=method negate=
    rx824_cur."!cursor_pos"(rx824_pos)
    $P10 = rx824_cur."newpad"()
    unless $P10, rx824_fail
    rx824_pos = $P10."pos"()
.annotate "line", 389
  # rx reduce name="quote:sym</ />" key="open"
    rx824_cur."!cursor_pos"(rx824_pos)
    rx824_cur."!reduce"("quote:sym</ />", "open")
.annotate "line", 390
  # rx subrule "LANG" subtype=capture negate=
    rx824_cur."!cursor_pos"(rx824_pos)
    $P10 = rx824_cur."LANG"("Regex", "nibbler")
    unless $P10, rx824_fail
    rx824_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx824_pos = $P10."pos"()
.annotate "line", 391
  # rx literal  "/"
    add $I11, rx824_pos, 1
    gt $I11, rx824_eos, rx824_fail
    sub $I11, rx824_pos, rx824_off
    substr $S10, rx824_tgt, $I11, 1
    ne $S10, "/", rx824_fail
    add rx824_pos, 1
.annotate "line", 386
  # rx pass
    rx824_cur."!cursor_pass"(rx824_pos, "quote:sym</ />")
    rx824_cur."!cursor_debug"("PASS  ", "quote:sym</ />", " at pos=", rx824_pos)
    .return (rx824_cur)
  rx824_fail:
.annotate "line", 4
    (rx824_rep, rx824_pos, $I10, $P10) = rx824_cur."!mark_fail"(0)
    lt rx824_pos, -1, rx824_done
    eq rx824_pos, -1, rx824_fail
    jump $I10
  rx824_done:
    rx824_cur."!cursor_fail"()
    rx824_cur."!cursor_debug"("FAIL  ", "quote:sym</ />")
    .return (rx824_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym</ />"  :subid("198_1260829317.63188") :method
.annotate "line", 4
    $P826 = self."!PREFIX__!subrule"("", "/")
    new $P827, "ResizablePMCArray"
    push $P827, $P826
    .return ($P827)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("199_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx830_tgt
    .local int rx830_pos
    .local int rx830_off
    .local int rx830_eos
    .local int rx830_rep
    .local pmc rx830_cur
    (rx830_cur, rx830_pos, rx830_tgt) = self."!cursor_start"()
    rx830_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
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
    ne $I10, -1, rxscan833_done
    goto rxscan833_scan
  rxscan833_loop:
    ($P10) = rx830_cur."from"()
    inc $P10
    set rx830_pos, $P10
    ge rx830_pos, rx830_eos, rxscan833_done
  rxscan833_scan:
    set_addr $I10, rxscan833_loop
    rx830_cur."!mark_push"(0, rx830_pos, $I10)
  rxscan833_done:
.annotate "line", 394
  # rx enumcharlist negate=0 zerowidth
    ge rx830_pos, rx830_eos, rx830_fail
    sub $I10, rx830_pos, rx830_off
    substr $S10, rx830_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx830_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx830_cur."!cursor_pos"(rx830_pos)
    $P10 = rx830_cur."quotemod_check"("s")
    unless $P10, rx830_fail
  # rx subrule "variable" subtype=capture negate=
    rx830_cur."!cursor_pos"(rx830_pos)
    $P10 = rx830_cur."variable"()
    unless $P10, rx830_fail
    rx830_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx830_pos = $P10."pos"()
  # rx pass
    rx830_cur."!cursor_pass"(rx830_pos, "quote_escape:sym<$>")
    rx830_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx830_pos)
    .return (rx830_cur)
  rx830_fail:
.annotate "line", 4
    (rx830_rep, rx830_pos, $I10, $P10) = rx830_cur."!mark_fail"(0)
    lt rx830_pos, -1, rx830_done
    eq rx830_pos, -1, rx830_fail
    jump $I10
  rx830_done:
    rx830_cur."!cursor_fail"()
    rx830_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx830_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("200_1260829317.63188") :method
.annotate "line", 4
    new $P832, "ResizablePMCArray"
    push $P832, "$"
    .return ($P832)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("201_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx835_tgt
    .local int rx835_pos
    .local int rx835_off
    .local int rx835_eos
    .local int rx835_rep
    .local pmc rx835_cur
    (rx835_cur, rx835_pos, rx835_tgt) = self."!cursor_start"()
    rx835_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
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
.annotate "line", 395
  # rx enumcharlist negate=0 zerowidth
    ge rx835_pos, rx835_eos, rx835_fail
    sub $I10, rx835_pos, rx835_off
    substr $S10, rx835_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx835_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx835_cur."!cursor_pos"(rx835_pos)
    $P10 = rx835_cur."quotemod_check"("c")
    unless $P10, rx835_fail
  # rx subrule "block" subtype=capture negate=
    rx835_cur."!cursor_pos"(rx835_pos)
    $P10 = rx835_cur."block"()
    unless $P10, rx835_fail
    rx835_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx835_pos = $P10."pos"()
  # rx pass
    rx835_cur."!cursor_pass"(rx835_pos, "quote_escape:sym<{ }>")
    rx835_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx835_pos)
    .return (rx835_cur)
  rx835_fail:
.annotate "line", 4
    (rx835_rep, rx835_pos, $I10, $P10) = rx835_cur."!mark_fail"(0)
    lt rx835_pos, -1, rx835_done
    eq rx835_pos, -1, rx835_fail
    jump $I10
  rx835_done:
    rx835_cur."!cursor_fail"()
    rx835_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx835_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("202_1260829317.63188") :method
.annotate "line", 4
    new $P837, "ResizablePMCArray"
    push $P837, "{"
    .return ($P837)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("203_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx840_tgt
    .local int rx840_pos
    .local int rx840_off
    .local int rx840_eos
    .local int rx840_rep
    .local pmc rx840_cur
    (rx840_cur, rx840_pos, rx840_tgt) = self."!cursor_start"()
    rx840_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx840_cur."!cursor_caparray"("EXPR")
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
.annotate "line", 397
  # rx literal  "("
    add $I11, rx840_pos, 1
    gt $I11, rx840_eos, rx840_fail
    sub $I11, rx840_pos, rx840_off
    substr $S10, rx840_tgt, $I11, 1
    ne $S10, "(", rx840_fail
    add rx840_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx840_cur."!cursor_pos"(rx840_pos)
    $P10 = rx840_cur."ws"()
    unless $P10, rx840_fail
    rx840_pos = $P10."pos"()
  # rx rxquantr845 ** 0..1
    set_addr $I846, rxquantr845_done
    rx840_cur."!mark_push"(0, rx840_pos, $I846)
  rxquantr845_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx840_cur."!cursor_pos"(rx840_pos)
    $P10 = rx840_cur."EXPR"()
    unless $P10, rx840_fail
    rx840_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx840_pos = $P10."pos"()
    (rx840_rep) = rx840_cur."!mark_commit"($I846)
  rxquantr845_done:
  # rx literal  ")"
    add $I11, rx840_pos, 1
    gt $I11, rx840_eos, rx840_fail
    sub $I11, rx840_pos, rx840_off
    substr $S10, rx840_tgt, $I11, 1
    ne $S10, ")", rx840_fail
    add rx840_pos, 1
  # rx pass
    rx840_cur."!cursor_pass"(rx840_pos, "circumfix:sym<( )>")
    rx840_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx840_pos)
    .return (rx840_cur)
  rx840_fail:
.annotate "line", 4
    (rx840_rep, rx840_pos, $I10, $P10) = rx840_cur."!mark_fail"(0)
    lt rx840_pos, -1, rx840_done
    eq rx840_pos, -1, rx840_fail
    jump $I10
  rx840_done:
    rx840_cur."!cursor_fail"()
    rx840_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx840_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("204_1260829317.63188") :method
.annotate "line", 4
    $P842 = self."!PREFIX__!subrule"("", "(")
    new $P843, "ResizablePMCArray"
    push $P843, $P842
    .return ($P843)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("205_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx848_tgt
    .local int rx848_pos
    .local int rx848_off
    .local int rx848_eos
    .local int rx848_rep
    .local pmc rx848_cur
    (rx848_cur, rx848_pos, rx848_tgt) = self."!cursor_start"()
    rx848_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
    rx848_cur."!cursor_caparray"("EXPR")
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
.annotate "line", 398
  # rx literal  "["
    add $I11, rx848_pos, 1
    gt $I11, rx848_eos, rx848_fail
    sub $I11, rx848_pos, rx848_off
    substr $S10, rx848_tgt, $I11, 1
    ne $S10, "[", rx848_fail
    add rx848_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx848_cur."!cursor_pos"(rx848_pos)
    $P10 = rx848_cur."ws"()
    unless $P10, rx848_fail
    rx848_pos = $P10."pos"()
  # rx rxquantr853 ** 0..1
    set_addr $I854, rxquantr853_done
    rx848_cur."!mark_push"(0, rx848_pos, $I854)
  rxquantr853_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx848_cur."!cursor_pos"(rx848_pos)
    $P10 = rx848_cur."EXPR"()
    unless $P10, rx848_fail
    rx848_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx848_pos = $P10."pos"()
    (rx848_rep) = rx848_cur."!mark_commit"($I854)
  rxquantr853_done:
  # rx literal  "]"
    add $I11, rx848_pos, 1
    gt $I11, rx848_eos, rx848_fail
    sub $I11, rx848_pos, rx848_off
    substr $S10, rx848_tgt, $I11, 1
    ne $S10, "]", rx848_fail
    add rx848_pos, 1
  # rx pass
    rx848_cur."!cursor_pass"(rx848_pos, "circumfix:sym<[ ]>")
    rx848_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx848_pos)
    .return (rx848_cur)
  rx848_fail:
.annotate "line", 4
    (rx848_rep, rx848_pos, $I10, $P10) = rx848_cur."!mark_fail"(0)
    lt rx848_pos, -1, rx848_done
    eq rx848_pos, -1, rx848_fail
    jump $I10
  rx848_done:
    rx848_cur."!cursor_fail"()
    rx848_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx848_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("206_1260829317.63188") :method
.annotate "line", 4
    $P850 = self."!PREFIX__!subrule"("", "[")
    new $P851, "ResizablePMCArray"
    push $P851, $P850
    .return ($P851)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("207_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx856_tgt
    .local int rx856_pos
    .local int rx856_off
    .local int rx856_eos
    .local int rx856_rep
    .local pmc rx856_cur
    (rx856_cur, rx856_pos, rx856_tgt) = self."!cursor_start"()
    rx856_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx856_cur
    .local pmc match
    .lex "$/", match
    length rx856_eos, rx856_tgt
    set rx856_off, 0
    lt rx856_pos, 2, rx856_start
    sub rx856_off, rx856_pos, 1
    substr rx856_tgt, rx856_tgt, rx856_off
  rx856_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan859_done
    goto rxscan859_scan
  rxscan859_loop:
    ($P10) = rx856_cur."from"()
    inc $P10
    set rx856_pos, $P10
    ge rx856_pos, rx856_eos, rxscan859_done
  rxscan859_scan:
    set_addr $I10, rxscan859_loop
    rx856_cur."!mark_push"(0, rx856_pos, $I10)
  rxscan859_done:
.annotate "line", 399
  # rx enumcharlist negate=0 zerowidth
    ge rx856_pos, rx856_eos, rx856_fail
    sub $I10, rx856_pos, rx856_off
    substr $S10, rx856_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx856_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx856_cur."!cursor_pos"(rx856_pos)
    $P10 = rx856_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx856_fail
    rx856_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx856_pos = $P10."pos"()
  # rx pass
    rx856_cur."!cursor_pass"(rx856_pos, "circumfix:sym<ang>")
    rx856_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx856_pos)
    .return (rx856_cur)
  rx856_fail:
.annotate "line", 4
    (rx856_rep, rx856_pos, $I10, $P10) = rx856_cur."!mark_fail"(0)
    lt rx856_pos, -1, rx856_done
    eq rx856_pos, -1, rx856_fail
    jump $I10
  rx856_done:
    rx856_cur."!cursor_fail"()
    rx856_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx856_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("208_1260829317.63188") :method
.annotate "line", 4
    new $P858, "ResizablePMCArray"
    push $P858, "<"
    .return ($P858)
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("209_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx861_tgt
    .local int rx861_pos
    .local int rx861_off
    .local int rx861_eos
    .local int rx861_rep
    .local pmc rx861_cur
    (rx861_cur, rx861_pos, rx861_tgt) = self."!cursor_start"()
    rx861_cur."!cursor_debug"("START ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
    .lex unicode:"$\x{a2}", rx861_cur
    .local pmc match
    .lex "$/", match
    length rx861_eos, rx861_tgt
    set rx861_off, 0
    lt rx861_pos, 2, rx861_start
    sub rx861_off, rx861_pos, 1
    substr rx861_tgt, rx861_tgt, rx861_off
  rx861_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan864_done
    goto rxscan864_scan
  rxscan864_loop:
    ($P10) = rx861_cur."from"()
    inc $P10
    set rx861_pos, $P10
    ge rx861_pos, rx861_eos, rxscan864_done
  rxscan864_scan:
    set_addr $I10, rxscan864_loop
    rx861_cur."!mark_push"(0, rx861_pos, $I10)
  rxscan864_done:
.annotate "line", 400
  # rx enumcharlist negate=0 zerowidth
    ge rx861_pos, rx861_eos, rx861_fail
    sub $I10, rx861_pos, rx861_off
    substr $S10, rx861_tgt, $I10, 1
    index $I11, unicode:"\x{ab}", $S10
    lt $I11, 0, rx861_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx861_cur."!cursor_pos"(rx861_pos)
    $P10 = rx861_cur."quote_EXPR"(":qq", ":w")
    unless $P10, rx861_fail
    rx861_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx861_pos = $P10."pos"()
  # rx pass
    rx861_cur."!cursor_pass"(rx861_pos, unicode:"circumfix:sym<\x{ab} \x{bb}>")
    rx861_cur."!cursor_debug"("PASS  ", unicode:"circumfix:sym<\x{ab} \x{bb}>", " at pos=", rx861_pos)
    .return (rx861_cur)
  rx861_fail:
.annotate "line", 4
    (rx861_rep, rx861_pos, $I10, $P10) = rx861_cur."!mark_fail"(0)
    lt rx861_pos, -1, rx861_done
    eq rx861_pos, -1, rx861_fail
    jump $I10
  rx861_done:
    rx861_cur."!cursor_fail"()
    rx861_cur."!cursor_debug"("FAIL  ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
    .return (rx861_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"!PREFIX__circumfix:sym<\x{ab} \x{bb}>"  :subid("210_1260829317.63188") :method
.annotate "line", 4
    new $P863, "ResizablePMCArray"
    push $P863, unicode:"\x{ab}"
    .return ($P863)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("211_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx866_tgt
    .local int rx866_pos
    .local int rx866_off
    .local int rx866_eos
    .local int rx866_rep
    .local pmc rx866_cur
    (rx866_cur, rx866_pos, rx866_tgt) = self."!cursor_start"()
    rx866_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx866_cur
    .local pmc match
    .lex "$/", match
    length rx866_eos, rx866_tgt
    set rx866_off, 0
    lt rx866_pos, 2, rx866_start
    sub rx866_off, rx866_pos, 1
    substr rx866_tgt, rx866_tgt, rx866_off
  rx866_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan869_done
    goto rxscan869_scan
  rxscan869_loop:
    ($P10) = rx866_cur."from"()
    inc $P10
    set rx866_pos, $P10
    ge rx866_pos, rx866_eos, rxscan869_done
  rxscan869_scan:
    set_addr $I10, rxscan869_loop
    rx866_cur."!mark_push"(0, rx866_pos, $I10)
  rxscan869_done:
.annotate "line", 401
  # rx enumcharlist negate=0 zerowidth
    ge rx866_pos, rx866_eos, rx866_fail
    sub $I10, rx866_pos, rx866_off
    substr $S10, rx866_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx866_fail
  # rx subrule "pblock" subtype=capture negate=
    rx866_cur."!cursor_pos"(rx866_pos)
    $P10 = rx866_cur."pblock"()
    unless $P10, rx866_fail
    rx866_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx866_pos = $P10."pos"()
  # rx pass
    rx866_cur."!cursor_pass"(rx866_pos, "circumfix:sym<{ }>")
    rx866_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx866_pos)
    .return (rx866_cur)
  rx866_fail:
.annotate "line", 4
    (rx866_rep, rx866_pos, $I10, $P10) = rx866_cur."!mark_fail"(0)
    lt rx866_pos, -1, rx866_done
    eq rx866_pos, -1, rx866_fail
    jump $I10
  rx866_done:
    rx866_cur."!cursor_fail"()
    rx866_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx866_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("212_1260829317.63188") :method
.annotate "line", 4
    new $P868, "ResizablePMCArray"
    push $P868, "{"
    .return ($P868)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("213_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx871_tgt
    .local int rx871_pos
    .local int rx871_off
    .local int rx871_eos
    .local int rx871_rep
    .local pmc rx871_cur
    (rx871_cur, rx871_pos, rx871_tgt) = self."!cursor_start"()
    rx871_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
    .lex unicode:"$\x{a2}", rx871_cur
    .local pmc match
    .lex "$/", match
    length rx871_eos, rx871_tgt
    set rx871_off, 0
    lt rx871_pos, 2, rx871_start
    sub rx871_off, rx871_pos, 1
    substr rx871_tgt, rx871_tgt, rx871_off
  rx871_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan875_done
    goto rxscan875_scan
  rxscan875_loop:
    ($P10) = rx871_cur."from"()
    inc $P10
    set rx871_pos, $P10
    ge rx871_pos, rx871_eos, rxscan875_done
  rxscan875_scan:
    set_addr $I10, rxscan875_loop
    rx871_cur."!mark_push"(0, rx871_pos, $I10)
  rxscan875_done:
.annotate "line", 402
  # rx subrule "sigil" subtype=capture negate=
    rx871_cur."!cursor_pos"(rx871_pos)
    $P10 = rx871_cur."sigil"()
    unless $P10, rx871_fail
    rx871_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx871_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx871_pos, 1
    gt $I11, rx871_eos, rx871_fail
    sub $I11, rx871_pos, rx871_off
    substr $S10, rx871_tgt, $I11, 1
    ne $S10, "(", rx871_fail
    add rx871_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx871_cur."!cursor_pos"(rx871_pos)
    $P10 = rx871_cur."semilist"()
    unless $P10, rx871_fail
    rx871_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx871_pos = $P10."pos"()
  alt876_0:
    set_addr $I10, alt876_1
    rx871_cur."!mark_push"(0, rx871_pos, $I10)
  # rx literal  ")"
    add $I11, rx871_pos, 1
    gt $I11, rx871_eos, rx871_fail
    sub $I11, rx871_pos, rx871_off
    substr $S10, rx871_tgt, $I11, 1
    ne $S10, ")", rx871_fail
    add rx871_pos, 1
    goto alt876_end
  alt876_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx871_cur."!cursor_pos"(rx871_pos)
    $P10 = rx871_cur."FAILGOAL"("')'")
    unless $P10, rx871_fail
    rx871_pos = $P10."pos"()
  alt876_end:
  # rx pass
    rx871_cur."!cursor_pass"(rx871_pos, "circumfix:sym<sigil>")
    rx871_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx871_pos)
    .return (rx871_cur)
  rx871_fail:
.annotate "line", 4
    (rx871_rep, rx871_pos, $I10, $P10) = rx871_cur."!mark_fail"(0)
    lt rx871_pos, -1, rx871_done
    eq rx871_pos, -1, rx871_fail
    jump $I10
  rx871_done:
    rx871_cur."!cursor_fail"()
    rx871_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx871_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("214_1260829317.63188") :method
.annotate "line", 4
    $P873 = self."!PREFIX__!subrule"("sigil", "")
    new $P874, "ResizablePMCArray"
    push $P874, $P873
    .return ($P874)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("215_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 4
    .local string rx879_tgt
    .local int rx879_pos
    .local int rx879_off
    .local int rx879_eos
    .local int rx879_rep
    .local pmc rx879_cur
    (rx879_cur, rx879_pos, rx879_tgt) = self."!cursor_start"()
    rx879_cur."!cursor_debug"("START ", "semilist")
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
.annotate "line", 404
  # rx subrule "ws" subtype=method negate=
    rx879_cur."!cursor_pos"(rx879_pos)
    $P10 = rx879_cur."ws"()
    unless $P10, rx879_fail
    rx879_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx879_cur."!cursor_pos"(rx879_pos)
    $P10 = rx879_cur."statement"()
    unless $P10, rx879_fail
    rx879_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx879_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx879_cur."!cursor_pos"(rx879_pos)
    $P10 = rx879_cur."ws"()
    unless $P10, rx879_fail
    rx879_pos = $P10."pos"()
  # rx pass
    rx879_cur."!cursor_pass"(rx879_pos, "semilist")
    rx879_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx879_pos)
    .return (rx879_cur)
  rx879_fail:
.annotate "line", 4
    (rx879_rep, rx879_pos, $I10, $P10) = rx879_cur."!mark_fail"(0)
    lt rx879_pos, -1, rx879_done
    eq rx879_pos, -1, rx879_fail
    jump $I10
  rx879_done:
    rx879_cur."!cursor_fail"()
    rx879_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx879_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("216_1260829317.63188") :method
.annotate "line", 4
    new $P881, "ResizablePMCArray"
    push $P881, ""
    .return ($P881)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("217_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx886_tgt
    .local int rx886_pos
    .local int rx886_off
    .local int rx886_eos
    .local int rx886_rep
    .local pmc rx886_cur
    (rx886_cur, rx886_pos, rx886_tgt) = self."!cursor_start"()
    rx886_cur."!cursor_debug"("START ", "infixish")
    .lex unicode:"$\x{a2}", rx886_cur
    .local pmc match
    .lex "$/", match
    length rx886_eos, rx886_tgt
    set rx886_off, 0
    lt rx886_pos, 2, rx886_start
    sub rx886_off, rx886_pos, 1
    substr rx886_tgt, rx886_tgt, rx886_off
  rx886_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan889_done
    goto rxscan889_scan
  rxscan889_loop:
    ($P10) = rx886_cur."from"()
    inc $P10
    set rx886_pos, $P10
    ge rx886_pos, rx886_eos, rxscan889_done
  rxscan889_scan:
    set_addr $I10, rxscan889_loop
    rx886_cur."!mark_push"(0, rx886_pos, $I10)
  rxscan889_done:
.annotate "line", 427
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx886_cur."!cursor_pos"(rx886_pos)
    $P10 = rx886_cur."infixstopper"()
    if $P10, rx886_fail
  # rx subrule "infix" subtype=capture negate=
    rx886_cur."!cursor_pos"(rx886_pos)
    $P10 = rx886_cur."infix"()
    unless $P10, rx886_fail
    rx886_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx886_pos = $P10."pos"()
  # rx pass
    rx886_cur."!cursor_pass"(rx886_pos, "infixish")
    rx886_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx886_pos)
    .return (rx886_cur)
  rx886_fail:
.annotate "line", 408
    (rx886_rep, rx886_pos, $I10, $P10) = rx886_cur."!mark_fail"(0)
    lt rx886_pos, -1, rx886_done
    eq rx886_pos, -1, rx886_fail
    jump $I10
  rx886_done:
    rx886_cur."!cursor_fail"()
    rx886_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx886_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("218_1260829317.63188") :method
.annotate "line", 408
    new $P888, "ResizablePMCArray"
    push $P888, ""
    .return ($P888)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("219_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx891_tgt
    .local int rx891_pos
    .local int rx891_off
    .local int rx891_eos
    .local int rx891_rep
    .local pmc rx891_cur
    (rx891_cur, rx891_pos, rx891_tgt) = self."!cursor_start"()
    rx891_cur."!cursor_debug"("START ", "infixstopper")
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
.annotate "line", 428
  # rx subrule "lambda" subtype=zerowidth negate=
    rx891_cur."!cursor_pos"(rx891_pos)
    $P10 = rx891_cur."lambda"()
    unless $P10, rx891_fail
  # rx pass
    rx891_cur."!cursor_pass"(rx891_pos, "infixstopper")
    rx891_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx891_pos)
    .return (rx891_cur)
  rx891_fail:
.annotate "line", 408
    (rx891_rep, rx891_pos, $I10, $P10) = rx891_cur."!mark_fail"(0)
    lt rx891_pos, -1, rx891_done
    eq rx891_pos, -1, rx891_fail
    jump $I10
  rx891_done:
    rx891_cur."!cursor_fail"()
    rx891_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx891_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("220_1260829317.63188") :method
.annotate "line", 408
    new $P893, "ResizablePMCArray"
    push $P893, ""
    .return ($P893)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("221_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx896_tgt
    .local int rx896_pos
    .local int rx896_off
    .local int rx896_eos
    .local int rx896_rep
    .local pmc rx896_cur
    (rx896_cur, rx896_pos, rx896_tgt) = self."!cursor_start"()
    rx896_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
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
.annotate "line", 431
  # rx literal  "["
    add $I11, rx896_pos, 1
    gt $I11, rx896_eos, rx896_fail
    sub $I11, rx896_pos, rx896_off
    substr $S10, rx896_tgt, $I11, 1
    ne $S10, "[", rx896_fail
    add rx896_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx896_cur."!cursor_pos"(rx896_pos)
    $P10 = rx896_cur."ws"()
    unless $P10, rx896_fail
    rx896_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx896_cur."!cursor_pos"(rx896_pos)
    $P10 = rx896_cur."EXPR"()
    unless $P10, rx896_fail
    rx896_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx896_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx896_pos, 1
    gt $I11, rx896_eos, rx896_fail
    sub $I11, rx896_pos, rx896_off
    substr $S10, rx896_tgt, $I11, 1
    ne $S10, "]", rx896_fail
    add rx896_pos, 1
.annotate "line", 432
  # rx subrule "O" subtype=capture negate=
    rx896_cur."!cursor_pos"(rx896_pos)
    $P10 = rx896_cur."O"("%methodop")
    unless $P10, rx896_fail
    rx896_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx896_pos = $P10."pos"()
.annotate "line", 430
  # rx pass
    rx896_cur."!cursor_pass"(rx896_pos, "postcircumfix:sym<[ ]>")
    rx896_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx896_pos)
    .return (rx896_cur)
  rx896_fail:
.annotate "line", 408
    (rx896_rep, rx896_pos, $I10, $P10) = rx896_cur."!mark_fail"(0)
    lt rx896_pos, -1, rx896_done
    eq rx896_pos, -1, rx896_fail
    jump $I10
  rx896_done:
    rx896_cur."!cursor_fail"()
    rx896_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx896_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("222_1260829317.63188") :method
.annotate "line", 408
    $P898 = self."!PREFIX__!subrule"("", "[")
    new $P899, "ResizablePMCArray"
    push $P899, $P898
    .return ($P899)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("223_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx902_tgt
    .local int rx902_pos
    .local int rx902_off
    .local int rx902_eos
    .local int rx902_rep
    .local pmc rx902_cur
    (rx902_cur, rx902_pos, rx902_tgt) = self."!cursor_start"()
    rx902_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx902_cur
    .local pmc match
    .lex "$/", match
    length rx902_eos, rx902_tgt
    set rx902_off, 0
    lt rx902_pos, 2, rx902_start
    sub rx902_off, rx902_pos, 1
    substr rx902_tgt, rx902_tgt, rx902_off
  rx902_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan906_done
    goto rxscan906_scan
  rxscan906_loop:
    ($P10) = rx902_cur."from"()
    inc $P10
    set rx902_pos, $P10
    ge rx902_pos, rx902_eos, rxscan906_done
  rxscan906_scan:
    set_addr $I10, rxscan906_loop
    rx902_cur."!mark_push"(0, rx902_pos, $I10)
  rxscan906_done:
.annotate "line", 436
  # rx literal  "{"
    add $I11, rx902_pos, 1
    gt $I11, rx902_eos, rx902_fail
    sub $I11, rx902_pos, rx902_off
    substr $S10, rx902_tgt, $I11, 1
    ne $S10, "{", rx902_fail
    add rx902_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx902_cur."!cursor_pos"(rx902_pos)
    $P10 = rx902_cur."ws"()
    unless $P10, rx902_fail
    rx902_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx902_cur."!cursor_pos"(rx902_pos)
    $P10 = rx902_cur."EXPR"()
    unless $P10, rx902_fail
    rx902_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx902_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx902_pos, 1
    gt $I11, rx902_eos, rx902_fail
    sub $I11, rx902_pos, rx902_off
    substr $S10, rx902_tgt, $I11, 1
    ne $S10, "}", rx902_fail
    add rx902_pos, 1
.annotate "line", 437
  # rx subrule "O" subtype=capture negate=
    rx902_cur."!cursor_pos"(rx902_pos)
    $P10 = rx902_cur."O"("%methodop")
    unless $P10, rx902_fail
    rx902_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx902_pos = $P10."pos"()
.annotate "line", 435
  # rx pass
    rx902_cur."!cursor_pass"(rx902_pos, "postcircumfix:sym<{ }>")
    rx902_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx902_pos)
    .return (rx902_cur)
  rx902_fail:
.annotate "line", 408
    (rx902_rep, rx902_pos, $I10, $P10) = rx902_cur."!mark_fail"(0)
    lt rx902_pos, -1, rx902_done
    eq rx902_pos, -1, rx902_fail
    jump $I10
  rx902_done:
    rx902_cur."!cursor_fail"()
    rx902_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx902_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("224_1260829317.63188") :method
.annotate "line", 408
    $P904 = self."!PREFIX__!subrule"("", "{")
    new $P905, "ResizablePMCArray"
    push $P905, $P904
    .return ($P905)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("225_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx908_tgt
    .local int rx908_pos
    .local int rx908_off
    .local int rx908_eos
    .local int rx908_rep
    .local pmc rx908_cur
    (rx908_cur, rx908_pos, rx908_tgt) = self."!cursor_start"()
    rx908_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
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
.annotate "line", 441
  # rx enumcharlist negate=0 zerowidth
    ge rx908_pos, rx908_eos, rx908_fail
    sub $I10, rx908_pos, rx908_off
    substr $S10, rx908_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx908_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx908_cur."!cursor_pos"(rx908_pos)
    $P10 = rx908_cur."quote_EXPR"(":q")
    unless $P10, rx908_fail
    rx908_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx908_pos = $P10."pos"()
.annotate "line", 442
  # rx subrule "O" subtype=capture negate=
    rx908_cur."!cursor_pos"(rx908_pos)
    $P10 = rx908_cur."O"("%methodop")
    unless $P10, rx908_fail
    rx908_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx908_pos = $P10."pos"()
.annotate "line", 440
  # rx pass
    rx908_cur."!cursor_pass"(rx908_pos, "postcircumfix:sym<ang>")
    rx908_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx908_pos)
    .return (rx908_cur)
  rx908_fail:
.annotate "line", 408
    (rx908_rep, rx908_pos, $I10, $P10) = rx908_cur."!mark_fail"(0)
    lt rx908_pos, -1, rx908_done
    eq rx908_pos, -1, rx908_fail
    jump $I10
  rx908_done:
    rx908_cur."!cursor_fail"()
    rx908_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx908_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("226_1260829317.63188") :method
.annotate "line", 408
    new $P910, "ResizablePMCArray"
    push $P910, "<"
    .return ($P910)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("227_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx913_tgt
    .local int rx913_pos
    .local int rx913_off
    .local int rx913_eos
    .local int rx913_rep
    .local pmc rx913_cur
    (rx913_cur, rx913_pos, rx913_tgt) = self."!cursor_start"()
    rx913_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
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
.annotate "line", 446
  # rx literal  "("
    add $I11, rx913_pos, 1
    gt $I11, rx913_eos, rx913_fail
    sub $I11, rx913_pos, rx913_off
    substr $S10, rx913_tgt, $I11, 1
    ne $S10, "(", rx913_fail
    add rx913_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx913_cur."!cursor_pos"(rx913_pos)
    $P10 = rx913_cur."ws"()
    unless $P10, rx913_fail
    rx913_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx913_cur."!cursor_pos"(rx913_pos)
    $P10 = rx913_cur."arglist"()
    unless $P10, rx913_fail
    rx913_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx913_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx913_pos, 1
    gt $I11, rx913_eos, rx913_fail
    sub $I11, rx913_pos, rx913_off
    substr $S10, rx913_tgt, $I11, 1
    ne $S10, ")", rx913_fail
    add rx913_pos, 1
.annotate "line", 447
  # rx subrule "O" subtype=capture negate=
    rx913_cur."!cursor_pos"(rx913_pos)
    $P10 = rx913_cur."O"("%methodop")
    unless $P10, rx913_fail
    rx913_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx913_pos = $P10."pos"()
.annotate "line", 445
  # rx pass
    rx913_cur."!cursor_pass"(rx913_pos, "postcircumfix:sym<( )>")
    rx913_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx913_pos)
    .return (rx913_cur)
  rx913_fail:
.annotate "line", 408
    (rx913_rep, rx913_pos, $I10, $P10) = rx913_cur."!mark_fail"(0)
    lt rx913_pos, -1, rx913_done
    eq rx913_pos, -1, rx913_fail
    jump $I10
  rx913_done:
    rx913_cur."!cursor_fail"()
    rx913_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx913_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("228_1260829317.63188") :method
.annotate "line", 408
    $P915 = self."!PREFIX__!subrule"("", "(")
    new $P916, "ResizablePMCArray"
    push $P916, $P915
    .return ($P916)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("229_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx919_tgt
    .local int rx919_pos
    .local int rx919_off
    .local int rx919_eos
    .local int rx919_rep
    .local pmc rx919_cur
    (rx919_cur, rx919_pos, rx919_tgt) = self."!cursor_start"()
    rx919_cur."!cursor_debug"("START ", "postfix:sym<.>")
    .lex unicode:"$\x{a2}", rx919_cur
    .local pmc match
    .lex "$/", match
    length rx919_eos, rx919_tgt
    set rx919_off, 0
    lt rx919_pos, 2, rx919_start
    sub rx919_off, rx919_pos, 1
    substr rx919_tgt, rx919_tgt, rx919_off
  rx919_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan923_done
    goto rxscan923_scan
  rxscan923_loop:
    ($P10) = rx919_cur."from"()
    inc $P10
    set rx919_pos, $P10
    ge rx919_pos, rx919_eos, rxscan923_done
  rxscan923_scan:
    set_addr $I10, rxscan923_loop
    rx919_cur."!mark_push"(0, rx919_pos, $I10)
  rxscan923_done:
.annotate "line", 450
  # rx subrule "dotty" subtype=capture negate=
    rx919_cur."!cursor_pos"(rx919_pos)
    $P10 = rx919_cur."dotty"()
    unless $P10, rx919_fail
    rx919_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx919_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx919_cur."!cursor_pos"(rx919_pos)
    $P10 = rx919_cur."O"("%methodop")
    unless $P10, rx919_fail
    rx919_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx919_pos = $P10."pos"()
  # rx pass
    rx919_cur."!cursor_pass"(rx919_pos, "postfix:sym<.>")
    rx919_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx919_pos)
    .return (rx919_cur)
  rx919_fail:
.annotate "line", 408
    (rx919_rep, rx919_pos, $I10, $P10) = rx919_cur."!mark_fail"(0)
    lt rx919_pos, -1, rx919_done
    eq rx919_pos, -1, rx919_fail
    jump $I10
  rx919_done:
    rx919_cur."!cursor_fail"()
    rx919_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx919_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("230_1260829317.63188") :method
.annotate "line", 408
    $P921 = self."!PREFIX__!subrule"("dotty", "")
    new $P922, "ResizablePMCArray"
    push $P922, $P921
    .return ($P922)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("231_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx925_tgt
    .local int rx925_pos
    .local int rx925_off
    .local int rx925_eos
    .local int rx925_rep
    .local pmc rx925_cur
    (rx925_cur, rx925_pos, rx925_tgt) = self."!cursor_start"()
    rx925_cur."!cursor_debug"("START ", "prefix:sym<++>")
    .lex unicode:"$\x{a2}", rx925_cur
    .local pmc match
    .lex "$/", match
    length rx925_eos, rx925_tgt
    set rx925_off, 0
    lt rx925_pos, 2, rx925_start
    sub rx925_off, rx925_pos, 1
    substr rx925_tgt, rx925_tgt, rx925_off
  rx925_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan929_done
    goto rxscan929_scan
  rxscan929_loop:
    ($P10) = rx925_cur."from"()
    inc $P10
    set rx925_pos, $P10
    ge rx925_pos, rx925_eos, rxscan929_done
  rxscan929_scan:
    set_addr $I10, rxscan929_loop
    rx925_cur."!mark_push"(0, rx925_pos, $I10)
  rxscan929_done:
.annotate "line", 452
  # rx subcapture "sym"
    set_addr $I10, rxcap_930_fail
    rx925_cur."!mark_push"(0, rx925_pos, $I10)
  # rx literal  "++"
    add $I11, rx925_pos, 2
    gt $I11, rx925_eos, rx925_fail
    sub $I11, rx925_pos, rx925_off
    substr $S10, rx925_tgt, $I11, 2
    ne $S10, "++", rx925_fail
    add rx925_pos, 2
    set_addr $I10, rxcap_930_fail
    ($I12, $I11) = rx925_cur."!mark_peek"($I10)
    rx925_cur."!cursor_pos"($I11)
    ($P10) = rx925_cur."!cursor_start"()
    $P10."!cursor_pass"(rx925_pos, "")
    rx925_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_930_done
  rxcap_930_fail:
    goto rx925_fail
  rxcap_930_done:
  # rx subrule "O" subtype=capture negate=
    rx925_cur."!cursor_pos"(rx925_pos)
    $P10 = rx925_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx925_fail
    rx925_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx925_pos = $P10."pos"()
  # rx pass
    rx925_cur."!cursor_pass"(rx925_pos, "prefix:sym<++>")
    rx925_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx925_pos)
    .return (rx925_cur)
  rx925_fail:
.annotate "line", 408
    (rx925_rep, rx925_pos, $I10, $P10) = rx925_cur."!mark_fail"(0)
    lt rx925_pos, -1, rx925_done
    eq rx925_pos, -1, rx925_fail
    jump $I10
  rx925_done:
    rx925_cur."!cursor_fail"()
    rx925_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx925_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("232_1260829317.63188") :method
.annotate "line", 408
    $P927 = self."!PREFIX__!subrule"("O", "++")
    new $P928, "ResizablePMCArray"
    push $P928, $P927
    .return ($P928)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("233_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx932_tgt
    .local int rx932_pos
    .local int rx932_off
    .local int rx932_eos
    .local int rx932_rep
    .local pmc rx932_cur
    (rx932_cur, rx932_pos, rx932_tgt) = self."!cursor_start"()
    rx932_cur."!cursor_debug"("START ", "prefix:sym<-->")
    .lex unicode:"$\x{a2}", rx932_cur
    .local pmc match
    .lex "$/", match
    length rx932_eos, rx932_tgt
    set rx932_off, 0
    lt rx932_pos, 2, rx932_start
    sub rx932_off, rx932_pos, 1
    substr rx932_tgt, rx932_tgt, rx932_off
  rx932_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan936_done
    goto rxscan936_scan
  rxscan936_loop:
    ($P10) = rx932_cur."from"()
    inc $P10
    set rx932_pos, $P10
    ge rx932_pos, rx932_eos, rxscan936_done
  rxscan936_scan:
    set_addr $I10, rxscan936_loop
    rx932_cur."!mark_push"(0, rx932_pos, $I10)
  rxscan936_done:
.annotate "line", 453
  # rx subcapture "sym"
    set_addr $I10, rxcap_937_fail
    rx932_cur."!mark_push"(0, rx932_pos, $I10)
  # rx literal  "--"
    add $I11, rx932_pos, 2
    gt $I11, rx932_eos, rx932_fail
    sub $I11, rx932_pos, rx932_off
    substr $S10, rx932_tgt, $I11, 2
    ne $S10, "--", rx932_fail
    add rx932_pos, 2
    set_addr $I10, rxcap_937_fail
    ($I12, $I11) = rx932_cur."!mark_peek"($I10)
    rx932_cur."!cursor_pos"($I11)
    ($P10) = rx932_cur."!cursor_start"()
    $P10."!cursor_pass"(rx932_pos, "")
    rx932_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_937_done
  rxcap_937_fail:
    goto rx932_fail
  rxcap_937_done:
  # rx subrule "O" subtype=capture negate=
    rx932_cur."!cursor_pos"(rx932_pos)
    $P10 = rx932_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx932_fail
    rx932_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx932_pos = $P10."pos"()
  # rx pass
    rx932_cur."!cursor_pass"(rx932_pos, "prefix:sym<-->")
    rx932_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx932_pos)
    .return (rx932_cur)
  rx932_fail:
.annotate "line", 408
    (rx932_rep, rx932_pos, $I10, $P10) = rx932_cur."!mark_fail"(0)
    lt rx932_pos, -1, rx932_done
    eq rx932_pos, -1, rx932_fail
    jump $I10
  rx932_done:
    rx932_cur."!cursor_fail"()
    rx932_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx932_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("234_1260829317.63188") :method
.annotate "line", 408
    $P934 = self."!PREFIX__!subrule"("O", "--")
    new $P935, "ResizablePMCArray"
    push $P935, $P934
    .return ($P935)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("235_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx939_tgt
    .local int rx939_pos
    .local int rx939_off
    .local int rx939_eos
    .local int rx939_rep
    .local pmc rx939_cur
    (rx939_cur, rx939_pos, rx939_tgt) = self."!cursor_start"()
    rx939_cur."!cursor_debug"("START ", "postfix:sym<++>")
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
.annotate "line", 456
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
    $P10 = rx939_cur."O"("%autoincrement")
    unless $P10, rx939_fail
    rx939_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx939_pos = $P10."pos"()
  # rx pass
    rx939_cur."!cursor_pass"(rx939_pos, "postfix:sym<++>")
    rx939_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx939_pos)
    .return (rx939_cur)
  rx939_fail:
.annotate "line", 408
    (rx939_rep, rx939_pos, $I10, $P10) = rx939_cur."!mark_fail"(0)
    lt rx939_pos, -1, rx939_done
    eq rx939_pos, -1, rx939_fail
    jump $I10
  rx939_done:
    rx939_cur."!cursor_fail"()
    rx939_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx939_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("236_1260829317.63188") :method
.annotate "line", 408
    $P941 = self."!PREFIX__!subrule"("O", "++")
    new $P942, "ResizablePMCArray"
    push $P942, $P941
    .return ($P942)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("237_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx946_tgt
    .local int rx946_pos
    .local int rx946_off
    .local int rx946_eos
    .local int rx946_rep
    .local pmc rx946_cur
    (rx946_cur, rx946_pos, rx946_tgt) = self."!cursor_start"()
    rx946_cur."!cursor_debug"("START ", "postfix:sym<-->")
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
.annotate "line", 457
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
    $P10 = rx946_cur."O"("%autoincrement")
    unless $P10, rx946_fail
    rx946_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx946_pos = $P10."pos"()
  # rx pass
    rx946_cur."!cursor_pass"(rx946_pos, "postfix:sym<-->")
    rx946_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx946_pos)
    .return (rx946_cur)
  rx946_fail:
.annotate "line", 408
    (rx946_rep, rx946_pos, $I10, $P10) = rx946_cur."!mark_fail"(0)
    lt rx946_pos, -1, rx946_done
    eq rx946_pos, -1, rx946_fail
    jump $I10
  rx946_done:
    rx946_cur."!cursor_fail"()
    rx946_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx946_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("238_1260829317.63188") :method
.annotate "line", 408
    $P948 = self."!PREFIX__!subrule"("O", "--")
    new $P949, "ResizablePMCArray"
    push $P949, $P948
    .return ($P949)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("239_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx953_tgt
    .local int rx953_pos
    .local int rx953_off
    .local int rx953_eos
    .local int rx953_rep
    .local pmc rx953_cur
    (rx953_cur, rx953_pos, rx953_tgt) = self."!cursor_start"()
    rx953_cur."!cursor_debug"("START ", "infix:sym<**>")
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
.annotate "line", 459
  # rx subcapture "sym"
    set_addr $I10, rxcap_958_fail
    rx953_cur."!mark_push"(0, rx953_pos, $I10)
  # rx literal  "**"
    add $I11, rx953_pos, 2
    gt $I11, rx953_eos, rx953_fail
    sub $I11, rx953_pos, rx953_off
    substr $S10, rx953_tgt, $I11, 2
    ne $S10, "**", rx953_fail
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
    $P10 = rx953_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx953_fail
    rx953_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx953_pos = $P10."pos"()
  # rx pass
    rx953_cur."!cursor_pass"(rx953_pos, "infix:sym<**>")
    rx953_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx953_pos)
    .return (rx953_cur)
  rx953_fail:
.annotate "line", 408
    (rx953_rep, rx953_pos, $I10, $P10) = rx953_cur."!mark_fail"(0)
    lt rx953_pos, -1, rx953_done
    eq rx953_pos, -1, rx953_fail
    jump $I10
  rx953_done:
    rx953_cur."!cursor_fail"()
    rx953_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx953_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("240_1260829317.63188") :method
.annotate "line", 408
    $P955 = self."!PREFIX__!subrule"("O", "**")
    new $P956, "ResizablePMCArray"
    push $P956, $P955
    .return ($P956)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("241_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx960_tgt
    .local int rx960_pos
    .local int rx960_off
    .local int rx960_eos
    .local int rx960_rep
    .local pmc rx960_cur
    (rx960_cur, rx960_pos, rx960_tgt) = self."!cursor_start"()
    rx960_cur."!cursor_debug"("START ", "prefix:sym<+>")
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
.annotate "line", 461
  # rx subcapture "sym"
    set_addr $I10, rxcap_965_fail
    rx960_cur."!mark_push"(0, rx960_pos, $I10)
  # rx literal  "+"
    add $I11, rx960_pos, 1
    gt $I11, rx960_eos, rx960_fail
    sub $I11, rx960_pos, rx960_off
    substr $S10, rx960_tgt, $I11, 1
    ne $S10, "+", rx960_fail
    add rx960_pos, 1
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
    $P10 = rx960_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx960_fail
    rx960_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx960_pos = $P10."pos"()
  # rx pass
    rx960_cur."!cursor_pass"(rx960_pos, "prefix:sym<+>")
    rx960_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx960_pos)
    .return (rx960_cur)
  rx960_fail:
.annotate "line", 408
    (rx960_rep, rx960_pos, $I10, $P10) = rx960_cur."!mark_fail"(0)
    lt rx960_pos, -1, rx960_done
    eq rx960_pos, -1, rx960_fail
    jump $I10
  rx960_done:
    rx960_cur."!cursor_fail"()
    rx960_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx960_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("242_1260829317.63188") :method
.annotate "line", 408
    $P962 = self."!PREFIX__!subrule"("O", "+")
    new $P963, "ResizablePMCArray"
    push $P963, $P962
    .return ($P963)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("243_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx967_tgt
    .local int rx967_pos
    .local int rx967_off
    .local int rx967_eos
    .local int rx967_rep
    .local pmc rx967_cur
    (rx967_cur, rx967_pos, rx967_tgt) = self."!cursor_start"()
    rx967_cur."!cursor_debug"("START ", "prefix:sym<~>")
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
.annotate "line", 462
  # rx subcapture "sym"
    set_addr $I10, rxcap_972_fail
    rx967_cur."!mark_push"(0, rx967_pos, $I10)
  # rx literal  "~"
    add $I11, rx967_pos, 1
    gt $I11, rx967_eos, rx967_fail
    sub $I11, rx967_pos, rx967_off
    substr $S10, rx967_tgt, $I11, 1
    ne $S10, "~", rx967_fail
    add rx967_pos, 1
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
    $P10 = rx967_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx967_fail
    rx967_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx967_pos = $P10."pos"()
  # rx pass
    rx967_cur."!cursor_pass"(rx967_pos, "prefix:sym<~>")
    rx967_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx967_pos)
    .return (rx967_cur)
  rx967_fail:
.annotate "line", 408
    (rx967_rep, rx967_pos, $I10, $P10) = rx967_cur."!mark_fail"(0)
    lt rx967_pos, -1, rx967_done
    eq rx967_pos, -1, rx967_fail
    jump $I10
  rx967_done:
    rx967_cur."!cursor_fail"()
    rx967_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx967_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("244_1260829317.63188") :method
.annotate "line", 408
    $P969 = self."!PREFIX__!subrule"("O", "~")
    new $P970, "ResizablePMCArray"
    push $P970, $P969
    .return ($P970)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("245_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx974_tgt
    .local int rx974_pos
    .local int rx974_off
    .local int rx974_eos
    .local int rx974_rep
    .local pmc rx974_cur
    (rx974_cur, rx974_pos, rx974_tgt) = self."!cursor_start"()
    rx974_cur."!cursor_debug"("START ", "prefix:sym<->")
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
    ne $I10, -1, rxscan977_done
    goto rxscan977_scan
  rxscan977_loop:
    ($P10) = rx974_cur."from"()
    inc $P10
    set rx974_pos, $P10
    ge rx974_pos, rx974_eos, rxscan977_done
  rxscan977_scan:
    set_addr $I10, rxscan977_loop
    rx974_cur."!mark_push"(0, rx974_pos, $I10)
  rxscan977_done:
.annotate "line", 463
  # rx subcapture "sym"
    set_addr $I10, rxcap_978_fail
    rx974_cur."!mark_push"(0, rx974_pos, $I10)
  # rx literal  "-"
    add $I11, rx974_pos, 1
    gt $I11, rx974_eos, rx974_fail
    sub $I11, rx974_pos, rx974_off
    substr $S10, rx974_tgt, $I11, 1
    ne $S10, "-", rx974_fail
    add rx974_pos, 1
    set_addr $I10, rxcap_978_fail
    ($I12, $I11) = rx974_cur."!mark_peek"($I10)
    rx974_cur."!cursor_pos"($I11)
    ($P10) = rx974_cur."!cursor_start"()
    $P10."!cursor_pass"(rx974_pos, "")
    rx974_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_978_done
  rxcap_978_fail:
    goto rx974_fail
  rxcap_978_done:
  # rx enumcharlist negate=1 zerowidth
    ge rx974_pos, rx974_eos, rx974_fail
    sub $I10, rx974_pos, rx974_off
    substr $S10, rx974_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx974_fail
  # rx subrule "number" subtype=zerowidth negate=1
    rx974_cur."!cursor_pos"(rx974_pos)
    $P10 = rx974_cur."number"()
    if $P10, rx974_fail
  # rx subrule "O" subtype=capture negate=
    rx974_cur."!cursor_pos"(rx974_pos)
    $P10 = rx974_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx974_fail
    rx974_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx974_pos = $P10."pos"()
  # rx pass
    rx974_cur."!cursor_pass"(rx974_pos, "prefix:sym<->")
    rx974_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx974_pos)
    .return (rx974_cur)
  rx974_fail:
.annotate "line", 408
    (rx974_rep, rx974_pos, $I10, $P10) = rx974_cur."!mark_fail"(0)
    lt rx974_pos, -1, rx974_done
    eq rx974_pos, -1, rx974_fail
    jump $I10
  rx974_done:
    rx974_cur."!cursor_fail"()
    rx974_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx974_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("246_1260829317.63188") :method
.annotate "line", 408
    new $P976, "ResizablePMCArray"
    push $P976, "-"
    .return ($P976)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("247_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx980_tgt
    .local int rx980_pos
    .local int rx980_off
    .local int rx980_eos
    .local int rx980_rep
    .local pmc rx980_cur
    (rx980_cur, rx980_pos, rx980_tgt) = self."!cursor_start"()
    rx980_cur."!cursor_debug"("START ", "prefix:sym<?>")
    .lex unicode:"$\x{a2}", rx980_cur
    .local pmc match
    .lex "$/", match
    length rx980_eos, rx980_tgt
    set rx980_off, 0
    lt rx980_pos, 2, rx980_start
    sub rx980_off, rx980_pos, 1
    substr rx980_tgt, rx980_tgt, rx980_off
  rx980_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan984_done
    goto rxscan984_scan
  rxscan984_loop:
    ($P10) = rx980_cur."from"()
    inc $P10
    set rx980_pos, $P10
    ge rx980_pos, rx980_eos, rxscan984_done
  rxscan984_scan:
    set_addr $I10, rxscan984_loop
    rx980_cur."!mark_push"(0, rx980_pos, $I10)
  rxscan984_done:
.annotate "line", 464
  # rx subcapture "sym"
    set_addr $I10, rxcap_985_fail
    rx980_cur."!mark_push"(0, rx980_pos, $I10)
  # rx literal  "?"
    add $I11, rx980_pos, 1
    gt $I11, rx980_eos, rx980_fail
    sub $I11, rx980_pos, rx980_off
    substr $S10, rx980_tgt, $I11, 1
    ne $S10, "?", rx980_fail
    add rx980_pos, 1
    set_addr $I10, rxcap_985_fail
    ($I12, $I11) = rx980_cur."!mark_peek"($I10)
    rx980_cur."!cursor_pos"($I11)
    ($P10) = rx980_cur."!cursor_start"()
    $P10."!cursor_pass"(rx980_pos, "")
    rx980_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_985_done
  rxcap_985_fail:
    goto rx980_fail
  rxcap_985_done:
  # rx subrule "O" subtype=capture negate=
    rx980_cur."!cursor_pos"(rx980_pos)
    $P10 = rx980_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx980_fail
    rx980_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx980_pos = $P10."pos"()
  # rx pass
    rx980_cur."!cursor_pass"(rx980_pos, "prefix:sym<?>")
    rx980_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx980_pos)
    .return (rx980_cur)
  rx980_fail:
.annotate "line", 408
    (rx980_rep, rx980_pos, $I10, $P10) = rx980_cur."!mark_fail"(0)
    lt rx980_pos, -1, rx980_done
    eq rx980_pos, -1, rx980_fail
    jump $I10
  rx980_done:
    rx980_cur."!cursor_fail"()
    rx980_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx980_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("248_1260829317.63188") :method
.annotate "line", 408
    $P982 = self."!PREFIX__!subrule"("O", "?")
    new $P983, "ResizablePMCArray"
    push $P983, $P982
    .return ($P983)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("249_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx987_tgt
    .local int rx987_pos
    .local int rx987_off
    .local int rx987_eos
    .local int rx987_rep
    .local pmc rx987_cur
    (rx987_cur, rx987_pos, rx987_tgt) = self."!cursor_start"()
    rx987_cur."!cursor_debug"("START ", "prefix:sym<!>")
    .lex unicode:"$\x{a2}", rx987_cur
    .local pmc match
    .lex "$/", match
    length rx987_eos, rx987_tgt
    set rx987_off, 0
    lt rx987_pos, 2, rx987_start
    sub rx987_off, rx987_pos, 1
    substr rx987_tgt, rx987_tgt, rx987_off
  rx987_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan991_done
    goto rxscan991_scan
  rxscan991_loop:
    ($P10) = rx987_cur."from"()
    inc $P10
    set rx987_pos, $P10
    ge rx987_pos, rx987_eos, rxscan991_done
  rxscan991_scan:
    set_addr $I10, rxscan991_loop
    rx987_cur."!mark_push"(0, rx987_pos, $I10)
  rxscan991_done:
.annotate "line", 465
  # rx subcapture "sym"
    set_addr $I10, rxcap_992_fail
    rx987_cur."!mark_push"(0, rx987_pos, $I10)
  # rx literal  "!"
    add $I11, rx987_pos, 1
    gt $I11, rx987_eos, rx987_fail
    sub $I11, rx987_pos, rx987_off
    substr $S10, rx987_tgt, $I11, 1
    ne $S10, "!", rx987_fail
    add rx987_pos, 1
    set_addr $I10, rxcap_992_fail
    ($I12, $I11) = rx987_cur."!mark_peek"($I10)
    rx987_cur."!cursor_pos"($I11)
    ($P10) = rx987_cur."!cursor_start"()
    $P10."!cursor_pass"(rx987_pos, "")
    rx987_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_992_done
  rxcap_992_fail:
    goto rx987_fail
  rxcap_992_done:
  # rx subrule "O" subtype=capture negate=
    rx987_cur."!cursor_pos"(rx987_pos)
    $P10 = rx987_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx987_fail
    rx987_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx987_pos = $P10."pos"()
  # rx pass
    rx987_cur."!cursor_pass"(rx987_pos, "prefix:sym<!>")
    rx987_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx987_pos)
    .return (rx987_cur)
  rx987_fail:
.annotate "line", 408
    (rx987_rep, rx987_pos, $I10, $P10) = rx987_cur."!mark_fail"(0)
    lt rx987_pos, -1, rx987_done
    eq rx987_pos, -1, rx987_fail
    jump $I10
  rx987_done:
    rx987_cur."!cursor_fail"()
    rx987_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx987_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("250_1260829317.63188") :method
.annotate "line", 408
    $P989 = self."!PREFIX__!subrule"("O", "!")
    new $P990, "ResizablePMCArray"
    push $P990, $P989
    .return ($P990)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("251_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx994_tgt
    .local int rx994_pos
    .local int rx994_off
    .local int rx994_eos
    .local int rx994_rep
    .local pmc rx994_cur
    (rx994_cur, rx994_pos, rx994_tgt) = self."!cursor_start"()
    rx994_cur."!cursor_debug"("START ", "prefix:sym<|>")
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
.annotate "line", 466
  # rx subcapture "sym"
    set_addr $I10, rxcap_999_fail
    rx994_cur."!mark_push"(0, rx994_pos, $I10)
  # rx literal  "|"
    add $I11, rx994_pos, 1
    gt $I11, rx994_eos, rx994_fail
    sub $I11, rx994_pos, rx994_off
    substr $S10, rx994_tgt, $I11, 1
    ne $S10, "|", rx994_fail
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
    $P10 = rx994_cur."O"("%symbolic_unary")
    unless $P10, rx994_fail
    rx994_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx994_pos = $P10."pos"()
  # rx pass
    rx994_cur."!cursor_pass"(rx994_pos, "prefix:sym<|>")
    rx994_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx994_pos)
    .return (rx994_cur)
  rx994_fail:
.annotate "line", 408
    (rx994_rep, rx994_pos, $I10, $P10) = rx994_cur."!mark_fail"(0)
    lt rx994_pos, -1, rx994_done
    eq rx994_pos, -1, rx994_fail
    jump $I10
  rx994_done:
    rx994_cur."!cursor_fail"()
    rx994_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx994_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("252_1260829317.63188") :method
.annotate "line", 408
    $P996 = self."!PREFIX__!subrule"("O", "|")
    new $P997, "ResizablePMCArray"
    push $P997, $P996
    .return ($P997)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("253_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1001_tgt
    .local int rx1001_pos
    .local int rx1001_off
    .local int rx1001_eos
    .local int rx1001_rep
    .local pmc rx1001_cur
    (rx1001_cur, rx1001_pos, rx1001_tgt) = self."!cursor_start"()
    rx1001_cur."!cursor_debug"("START ", "infix:sym<*>")
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
.annotate "line", 468
  # rx subcapture "sym"
    set_addr $I10, rxcap_1006_fail
    rx1001_cur."!mark_push"(0, rx1001_pos, $I10)
  # rx literal  "*"
    add $I11, rx1001_pos, 1
    gt $I11, rx1001_eos, rx1001_fail
    sub $I11, rx1001_pos, rx1001_off
    substr $S10, rx1001_tgt, $I11, 1
    ne $S10, "*", rx1001_fail
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
    $P10 = rx1001_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx1001_fail
    rx1001_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1001_pos = $P10."pos"()
  # rx pass
    rx1001_cur."!cursor_pass"(rx1001_pos, "infix:sym<*>")
    rx1001_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx1001_pos)
    .return (rx1001_cur)
  rx1001_fail:
.annotate "line", 408
    (rx1001_rep, rx1001_pos, $I10, $P10) = rx1001_cur."!mark_fail"(0)
    lt rx1001_pos, -1, rx1001_done
    eq rx1001_pos, -1, rx1001_fail
    jump $I10
  rx1001_done:
    rx1001_cur."!cursor_fail"()
    rx1001_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx1001_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("254_1260829317.63188") :method
.annotate "line", 408
    $P1003 = self."!PREFIX__!subrule"("O", "*")
    new $P1004, "ResizablePMCArray"
    push $P1004, $P1003
    .return ($P1004)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("255_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1008_tgt
    .local int rx1008_pos
    .local int rx1008_off
    .local int rx1008_eos
    .local int rx1008_rep
    .local pmc rx1008_cur
    (rx1008_cur, rx1008_pos, rx1008_tgt) = self."!cursor_start"()
    rx1008_cur."!cursor_debug"("START ", "infix:sym</>")
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
.annotate "line", 469
  # rx subcapture "sym"
    set_addr $I10, rxcap_1013_fail
    rx1008_cur."!mark_push"(0, rx1008_pos, $I10)
  # rx literal  "/"
    add $I11, rx1008_pos, 1
    gt $I11, rx1008_eos, rx1008_fail
    sub $I11, rx1008_pos, rx1008_off
    substr $S10, rx1008_tgt, $I11, 1
    ne $S10, "/", rx1008_fail
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
    $P10 = rx1008_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx1008_fail
    rx1008_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1008_pos = $P10."pos"()
  # rx pass
    rx1008_cur."!cursor_pass"(rx1008_pos, "infix:sym</>")
    rx1008_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx1008_pos)
    .return (rx1008_cur)
  rx1008_fail:
.annotate "line", 408
    (rx1008_rep, rx1008_pos, $I10, $P10) = rx1008_cur."!mark_fail"(0)
    lt rx1008_pos, -1, rx1008_done
    eq rx1008_pos, -1, rx1008_fail
    jump $I10
  rx1008_done:
    rx1008_cur."!cursor_fail"()
    rx1008_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx1008_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("256_1260829317.63188") :method
.annotate "line", 408
    $P1010 = self."!PREFIX__!subrule"("O", "/")
    new $P1011, "ResizablePMCArray"
    push $P1011, $P1010
    .return ($P1011)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("257_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1015_tgt
    .local int rx1015_pos
    .local int rx1015_off
    .local int rx1015_eos
    .local int rx1015_rep
    .local pmc rx1015_cur
    (rx1015_cur, rx1015_pos, rx1015_tgt) = self."!cursor_start"()
    rx1015_cur."!cursor_debug"("START ", "infix:sym<%>")
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
.annotate "line", 470
  # rx subcapture "sym"
    set_addr $I10, rxcap_1020_fail
    rx1015_cur."!mark_push"(0, rx1015_pos, $I10)
  # rx literal  "%"
    add $I11, rx1015_pos, 1
    gt $I11, rx1015_eos, rx1015_fail
    sub $I11, rx1015_pos, rx1015_off
    substr $S10, rx1015_tgt, $I11, 1
    ne $S10, "%", rx1015_fail
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
    $P10 = rx1015_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx1015_fail
    rx1015_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1015_pos = $P10."pos"()
  # rx pass
    rx1015_cur."!cursor_pass"(rx1015_pos, "infix:sym<%>")
    rx1015_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx1015_pos)
    .return (rx1015_cur)
  rx1015_fail:
.annotate "line", 408
    (rx1015_rep, rx1015_pos, $I10, $P10) = rx1015_cur."!mark_fail"(0)
    lt rx1015_pos, -1, rx1015_done
    eq rx1015_pos, -1, rx1015_fail
    jump $I10
  rx1015_done:
    rx1015_cur."!cursor_fail"()
    rx1015_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx1015_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("258_1260829317.63188") :method
.annotate "line", 408
    $P1017 = self."!PREFIX__!subrule"("O", "%")
    new $P1018, "ResizablePMCArray"
    push $P1018, $P1017
    .return ($P1018)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("259_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1022_tgt
    .local int rx1022_pos
    .local int rx1022_off
    .local int rx1022_eos
    .local int rx1022_rep
    .local pmc rx1022_cur
    (rx1022_cur, rx1022_pos, rx1022_tgt) = self."!cursor_start"()
    rx1022_cur."!cursor_debug"("START ", "infix:sym<+>")
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
.annotate "line", 472
  # rx subcapture "sym"
    set_addr $I10, rxcap_1027_fail
    rx1022_cur."!mark_push"(0, rx1022_pos, $I10)
  # rx literal  "+"
    add $I11, rx1022_pos, 1
    gt $I11, rx1022_eos, rx1022_fail
    sub $I11, rx1022_pos, rx1022_off
    substr $S10, rx1022_tgt, $I11, 1
    ne $S10, "+", rx1022_fail
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
    $P10 = rx1022_cur."O"("%additive, :pirop<add>")
    unless $P10, rx1022_fail
    rx1022_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1022_pos = $P10."pos"()
  # rx pass
    rx1022_cur."!cursor_pass"(rx1022_pos, "infix:sym<+>")
    rx1022_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx1022_pos)
    .return (rx1022_cur)
  rx1022_fail:
.annotate "line", 408
    (rx1022_rep, rx1022_pos, $I10, $P10) = rx1022_cur."!mark_fail"(0)
    lt rx1022_pos, -1, rx1022_done
    eq rx1022_pos, -1, rx1022_fail
    jump $I10
  rx1022_done:
    rx1022_cur."!cursor_fail"()
    rx1022_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx1022_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("260_1260829317.63188") :method
.annotate "line", 408
    $P1024 = self."!PREFIX__!subrule"("O", "+")
    new $P1025, "ResizablePMCArray"
    push $P1025, $P1024
    .return ($P1025)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("261_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1029_tgt
    .local int rx1029_pos
    .local int rx1029_off
    .local int rx1029_eos
    .local int rx1029_rep
    .local pmc rx1029_cur
    (rx1029_cur, rx1029_pos, rx1029_tgt) = self."!cursor_start"()
    rx1029_cur."!cursor_debug"("START ", "infix:sym<->")
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
.annotate "line", 473
  # rx subcapture "sym"
    set_addr $I10, rxcap_1034_fail
    rx1029_cur."!mark_push"(0, rx1029_pos, $I10)
  # rx literal  "-"
    add $I11, rx1029_pos, 1
    gt $I11, rx1029_eos, rx1029_fail
    sub $I11, rx1029_pos, rx1029_off
    substr $S10, rx1029_tgt, $I11, 1
    ne $S10, "-", rx1029_fail
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
    $P10 = rx1029_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx1029_fail
    rx1029_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1029_pos = $P10."pos"()
  # rx pass
    rx1029_cur."!cursor_pass"(rx1029_pos, "infix:sym<->")
    rx1029_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx1029_pos)
    .return (rx1029_cur)
  rx1029_fail:
.annotate "line", 408
    (rx1029_rep, rx1029_pos, $I10, $P10) = rx1029_cur."!mark_fail"(0)
    lt rx1029_pos, -1, rx1029_done
    eq rx1029_pos, -1, rx1029_fail
    jump $I10
  rx1029_done:
    rx1029_cur."!cursor_fail"()
    rx1029_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx1029_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("262_1260829317.63188") :method
.annotate "line", 408
    $P1031 = self."!PREFIX__!subrule"("O", "-")
    new $P1032, "ResizablePMCArray"
    push $P1032, $P1031
    .return ($P1032)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("263_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1036_tgt
    .local int rx1036_pos
    .local int rx1036_off
    .local int rx1036_eos
    .local int rx1036_rep
    .local pmc rx1036_cur
    (rx1036_cur, rx1036_pos, rx1036_tgt) = self."!cursor_start"()
    rx1036_cur."!cursor_debug"("START ", "infix:sym<~>")
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
.annotate "line", 475
  # rx subcapture "sym"
    set_addr $I10, rxcap_1041_fail
    rx1036_cur."!mark_push"(0, rx1036_pos, $I10)
  # rx literal  "~"
    add $I11, rx1036_pos, 1
    gt $I11, rx1036_eos, rx1036_fail
    sub $I11, rx1036_pos, rx1036_off
    substr $S10, rx1036_tgt, $I11, 1
    ne $S10, "~", rx1036_fail
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
    $P10 = rx1036_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx1036_fail
    rx1036_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1036_pos = $P10."pos"()
  # rx pass
    rx1036_cur."!cursor_pass"(rx1036_pos, "infix:sym<~>")
    rx1036_cur."!cursor_debug"("PASS  ", "infix:sym<~>", " at pos=", rx1036_pos)
    .return (rx1036_cur)
  rx1036_fail:
.annotate "line", 408
    (rx1036_rep, rx1036_pos, $I10, $P10) = rx1036_cur."!mark_fail"(0)
    lt rx1036_pos, -1, rx1036_done
    eq rx1036_pos, -1, rx1036_fail
    jump $I10
  rx1036_done:
    rx1036_cur."!cursor_fail"()
    rx1036_cur."!cursor_debug"("FAIL  ", "infix:sym<~>")
    .return (rx1036_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("264_1260829317.63188") :method
.annotate "line", 408
    $P1038 = self."!PREFIX__!subrule"("O", "~")
    new $P1039, "ResizablePMCArray"
    push $P1039, $P1038
    .return ($P1039)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("265_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1043_tgt
    .local int rx1043_pos
    .local int rx1043_off
    .local int rx1043_eos
    .local int rx1043_rep
    .local pmc rx1043_cur
    (rx1043_cur, rx1043_pos, rx1043_tgt) = self."!cursor_start"()
    rx1043_cur."!cursor_debug"("START ", "infix:sym<==>")
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
.annotate "line", 477
  # rx subcapture "sym"
    set_addr $I10, rxcap_1048_fail
    rx1043_cur."!mark_push"(0, rx1043_pos, $I10)
  # rx literal  "=="
    add $I11, rx1043_pos, 2
    gt $I11, rx1043_eos, rx1043_fail
    sub $I11, rx1043_pos, rx1043_off
    substr $S10, rx1043_tgt, $I11, 2
    ne $S10, "==", rx1043_fail
    add rx1043_pos, 2
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
    $P10 = rx1043_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx1043_fail
    rx1043_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1043_pos = $P10."pos"()
  # rx pass
    rx1043_cur."!cursor_pass"(rx1043_pos, "infix:sym<==>")
    rx1043_cur."!cursor_debug"("PASS  ", "infix:sym<==>", " at pos=", rx1043_pos)
    .return (rx1043_cur)
  rx1043_fail:
.annotate "line", 408
    (rx1043_rep, rx1043_pos, $I10, $P10) = rx1043_cur."!mark_fail"(0)
    lt rx1043_pos, -1, rx1043_done
    eq rx1043_pos, -1, rx1043_fail
    jump $I10
  rx1043_done:
    rx1043_cur."!cursor_fail"()
    rx1043_cur."!cursor_debug"("FAIL  ", "infix:sym<==>")
    .return (rx1043_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("266_1260829317.63188") :method
.annotate "line", 408
    $P1045 = self."!PREFIX__!subrule"("O", "==")
    new $P1046, "ResizablePMCArray"
    push $P1046, $P1045
    .return ($P1046)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("267_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1050_tgt
    .local int rx1050_pos
    .local int rx1050_off
    .local int rx1050_eos
    .local int rx1050_rep
    .local pmc rx1050_cur
    (rx1050_cur, rx1050_pos, rx1050_tgt) = self."!cursor_start"()
    rx1050_cur."!cursor_debug"("START ", "infix:sym<!=>")
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
.annotate "line", 478
  # rx subcapture "sym"
    set_addr $I10, rxcap_1055_fail
    rx1050_cur."!mark_push"(0, rx1050_pos, $I10)
  # rx literal  "!="
    add $I11, rx1050_pos, 2
    gt $I11, rx1050_eos, rx1050_fail
    sub $I11, rx1050_pos, rx1050_off
    substr $S10, rx1050_tgt, $I11, 2
    ne $S10, "!=", rx1050_fail
    add rx1050_pos, 2
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
    $P10 = rx1050_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx1050_fail
    rx1050_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1050_pos = $P10."pos"()
  # rx pass
    rx1050_cur."!cursor_pass"(rx1050_pos, "infix:sym<!=>")
    rx1050_cur."!cursor_debug"("PASS  ", "infix:sym<!=>", " at pos=", rx1050_pos)
    .return (rx1050_cur)
  rx1050_fail:
.annotate "line", 408
    (rx1050_rep, rx1050_pos, $I10, $P10) = rx1050_cur."!mark_fail"(0)
    lt rx1050_pos, -1, rx1050_done
    eq rx1050_pos, -1, rx1050_fail
    jump $I10
  rx1050_done:
    rx1050_cur."!cursor_fail"()
    rx1050_cur."!cursor_debug"("FAIL  ", "infix:sym<!=>")
    .return (rx1050_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("268_1260829317.63188") :method
.annotate "line", 408
    $P1052 = self."!PREFIX__!subrule"("O", "!=")
    new $P1053, "ResizablePMCArray"
    push $P1053, $P1052
    .return ($P1053)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("269_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1057_tgt
    .local int rx1057_pos
    .local int rx1057_off
    .local int rx1057_eos
    .local int rx1057_rep
    .local pmc rx1057_cur
    (rx1057_cur, rx1057_pos, rx1057_tgt) = self."!cursor_start"()
    rx1057_cur."!cursor_debug"("START ", "infix:sym<<=>")
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
.annotate "line", 479
  # rx subcapture "sym"
    set_addr $I10, rxcap_1062_fail
    rx1057_cur."!mark_push"(0, rx1057_pos, $I10)
  # rx literal  "<="
    add $I11, rx1057_pos, 2
    gt $I11, rx1057_eos, rx1057_fail
    sub $I11, rx1057_pos, rx1057_off
    substr $S10, rx1057_tgt, $I11, 2
    ne $S10, "<=", rx1057_fail
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
    $P10 = rx1057_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx1057_fail
    rx1057_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1057_pos = $P10."pos"()
  # rx pass
    rx1057_cur."!cursor_pass"(rx1057_pos, "infix:sym<<=>")
    rx1057_cur."!cursor_debug"("PASS  ", "infix:sym<<=>", " at pos=", rx1057_pos)
    .return (rx1057_cur)
  rx1057_fail:
.annotate "line", 408
    (rx1057_rep, rx1057_pos, $I10, $P10) = rx1057_cur."!mark_fail"(0)
    lt rx1057_pos, -1, rx1057_done
    eq rx1057_pos, -1, rx1057_fail
    jump $I10
  rx1057_done:
    rx1057_cur."!cursor_fail"()
    rx1057_cur."!cursor_debug"("FAIL  ", "infix:sym<<=>")
    .return (rx1057_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("270_1260829317.63188") :method
.annotate "line", 408
    $P1059 = self."!PREFIX__!subrule"("O", "<=")
    new $P1060, "ResizablePMCArray"
    push $P1060, $P1059
    .return ($P1060)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("271_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1064_tgt
    .local int rx1064_pos
    .local int rx1064_off
    .local int rx1064_eos
    .local int rx1064_rep
    .local pmc rx1064_cur
    (rx1064_cur, rx1064_pos, rx1064_tgt) = self."!cursor_start"()
    rx1064_cur."!cursor_debug"("START ", "infix:sym<>=>")
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
.annotate "line", 480
  # rx subcapture "sym"
    set_addr $I10, rxcap_1069_fail
    rx1064_cur."!mark_push"(0, rx1064_pos, $I10)
  # rx literal  ">="
    add $I11, rx1064_pos, 2
    gt $I11, rx1064_eos, rx1064_fail
    sub $I11, rx1064_pos, rx1064_off
    substr $S10, rx1064_tgt, $I11, 2
    ne $S10, ">=", rx1064_fail
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
    $P10 = rx1064_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx1064_fail
    rx1064_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1064_pos = $P10."pos"()
  # rx pass
    rx1064_cur."!cursor_pass"(rx1064_pos, "infix:sym<>=>")
    rx1064_cur."!cursor_debug"("PASS  ", "infix:sym<>=>", " at pos=", rx1064_pos)
    .return (rx1064_cur)
  rx1064_fail:
.annotate "line", 408
    (rx1064_rep, rx1064_pos, $I10, $P10) = rx1064_cur."!mark_fail"(0)
    lt rx1064_pos, -1, rx1064_done
    eq rx1064_pos, -1, rx1064_fail
    jump $I10
  rx1064_done:
    rx1064_cur."!cursor_fail"()
    rx1064_cur."!cursor_debug"("FAIL  ", "infix:sym<>=>")
    .return (rx1064_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("272_1260829317.63188") :method
.annotate "line", 408
    $P1066 = self."!PREFIX__!subrule"("O", ">=")
    new $P1067, "ResizablePMCArray"
    push $P1067, $P1066
    .return ($P1067)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("273_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1071_tgt
    .local int rx1071_pos
    .local int rx1071_off
    .local int rx1071_eos
    .local int rx1071_rep
    .local pmc rx1071_cur
    (rx1071_cur, rx1071_pos, rx1071_tgt) = self."!cursor_start"()
    rx1071_cur."!cursor_debug"("START ", "infix:sym<<>")
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
.annotate "line", 481
  # rx subcapture "sym"
    set_addr $I10, rxcap_1076_fail
    rx1071_cur."!mark_push"(0, rx1071_pos, $I10)
  # rx literal  "<"
    add $I11, rx1071_pos, 1
    gt $I11, rx1071_eos, rx1071_fail
    sub $I11, rx1071_pos, rx1071_off
    substr $S10, rx1071_tgt, $I11, 1
    ne $S10, "<", rx1071_fail
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
    $P10 = rx1071_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx1071_fail
    rx1071_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1071_pos = $P10."pos"()
  # rx pass
    rx1071_cur."!cursor_pass"(rx1071_pos, "infix:sym<<>")
    rx1071_cur."!cursor_debug"("PASS  ", "infix:sym<<>", " at pos=", rx1071_pos)
    .return (rx1071_cur)
  rx1071_fail:
.annotate "line", 408
    (rx1071_rep, rx1071_pos, $I10, $P10) = rx1071_cur."!mark_fail"(0)
    lt rx1071_pos, -1, rx1071_done
    eq rx1071_pos, -1, rx1071_fail
    jump $I10
  rx1071_done:
    rx1071_cur."!cursor_fail"()
    rx1071_cur."!cursor_debug"("FAIL  ", "infix:sym<<>")
    .return (rx1071_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("274_1260829317.63188") :method
.annotate "line", 408
    $P1073 = self."!PREFIX__!subrule"("O", "<")
    new $P1074, "ResizablePMCArray"
    push $P1074, $P1073
    .return ($P1074)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("275_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1078_tgt
    .local int rx1078_pos
    .local int rx1078_off
    .local int rx1078_eos
    .local int rx1078_rep
    .local pmc rx1078_cur
    (rx1078_cur, rx1078_pos, rx1078_tgt) = self."!cursor_start"()
    rx1078_cur."!cursor_debug"("START ", "infix:sym<>>")
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
.annotate "line", 482
  # rx subcapture "sym"
    set_addr $I10, rxcap_1083_fail
    rx1078_cur."!mark_push"(0, rx1078_pos, $I10)
  # rx literal  ">"
    add $I11, rx1078_pos, 1
    gt $I11, rx1078_eos, rx1078_fail
    sub $I11, rx1078_pos, rx1078_off
    substr $S10, rx1078_tgt, $I11, 1
    ne $S10, ">", rx1078_fail
    add rx1078_pos, 1
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
    $P10 = rx1078_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx1078_fail
    rx1078_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1078_pos = $P10."pos"()
  # rx pass
    rx1078_cur."!cursor_pass"(rx1078_pos, "infix:sym<>>")
    rx1078_cur."!cursor_debug"("PASS  ", "infix:sym<>>", " at pos=", rx1078_pos)
    .return (rx1078_cur)
  rx1078_fail:
.annotate "line", 408
    (rx1078_rep, rx1078_pos, $I10, $P10) = rx1078_cur."!mark_fail"(0)
    lt rx1078_pos, -1, rx1078_done
    eq rx1078_pos, -1, rx1078_fail
    jump $I10
  rx1078_done:
    rx1078_cur."!cursor_fail"()
    rx1078_cur."!cursor_debug"("FAIL  ", "infix:sym<>>")
    .return (rx1078_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("276_1260829317.63188") :method
.annotate "line", 408
    $P1080 = self."!PREFIX__!subrule"("O", ">")
    new $P1081, "ResizablePMCArray"
    push $P1081, $P1080
    .return ($P1081)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("277_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1085_tgt
    .local int rx1085_pos
    .local int rx1085_off
    .local int rx1085_eos
    .local int rx1085_rep
    .local pmc rx1085_cur
    (rx1085_cur, rx1085_pos, rx1085_tgt) = self."!cursor_start"()
    rx1085_cur."!cursor_debug"("START ", "infix:sym<eq>")
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
.annotate "line", 483
  # rx subcapture "sym"
    set_addr $I10, rxcap_1090_fail
    rx1085_cur."!mark_push"(0, rx1085_pos, $I10)
  # rx literal  "eq"
    add $I11, rx1085_pos, 2
    gt $I11, rx1085_eos, rx1085_fail
    sub $I11, rx1085_pos, rx1085_off
    substr $S10, rx1085_tgt, $I11, 2
    ne $S10, "eq", rx1085_fail
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
    $P10 = rx1085_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx1085_fail
    rx1085_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1085_pos = $P10."pos"()
  # rx pass
    rx1085_cur."!cursor_pass"(rx1085_pos, "infix:sym<eq>")
    rx1085_cur."!cursor_debug"("PASS  ", "infix:sym<eq>", " at pos=", rx1085_pos)
    .return (rx1085_cur)
  rx1085_fail:
.annotate "line", 408
    (rx1085_rep, rx1085_pos, $I10, $P10) = rx1085_cur."!mark_fail"(0)
    lt rx1085_pos, -1, rx1085_done
    eq rx1085_pos, -1, rx1085_fail
    jump $I10
  rx1085_done:
    rx1085_cur."!cursor_fail"()
    rx1085_cur."!cursor_debug"("FAIL  ", "infix:sym<eq>")
    .return (rx1085_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("278_1260829317.63188") :method
.annotate "line", 408
    $P1087 = self."!PREFIX__!subrule"("O", "eq")
    new $P1088, "ResizablePMCArray"
    push $P1088, $P1087
    .return ($P1088)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("279_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1092_tgt
    .local int rx1092_pos
    .local int rx1092_off
    .local int rx1092_eos
    .local int rx1092_rep
    .local pmc rx1092_cur
    (rx1092_cur, rx1092_pos, rx1092_tgt) = self."!cursor_start"()
    rx1092_cur."!cursor_debug"("START ", "infix:sym<ne>")
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
.annotate "line", 484
  # rx subcapture "sym"
    set_addr $I10, rxcap_1097_fail
    rx1092_cur."!mark_push"(0, rx1092_pos, $I10)
  # rx literal  "ne"
    add $I11, rx1092_pos, 2
    gt $I11, rx1092_eos, rx1092_fail
    sub $I11, rx1092_pos, rx1092_off
    substr $S10, rx1092_tgt, $I11, 2
    ne $S10, "ne", rx1092_fail
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
    $P10 = rx1092_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx1092_fail
    rx1092_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1092_pos = $P10."pos"()
  # rx pass
    rx1092_cur."!cursor_pass"(rx1092_pos, "infix:sym<ne>")
    rx1092_cur."!cursor_debug"("PASS  ", "infix:sym<ne>", " at pos=", rx1092_pos)
    .return (rx1092_cur)
  rx1092_fail:
.annotate "line", 408
    (rx1092_rep, rx1092_pos, $I10, $P10) = rx1092_cur."!mark_fail"(0)
    lt rx1092_pos, -1, rx1092_done
    eq rx1092_pos, -1, rx1092_fail
    jump $I10
  rx1092_done:
    rx1092_cur."!cursor_fail"()
    rx1092_cur."!cursor_debug"("FAIL  ", "infix:sym<ne>")
    .return (rx1092_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("280_1260829317.63188") :method
.annotate "line", 408
    $P1094 = self."!PREFIX__!subrule"("O", "ne")
    new $P1095, "ResizablePMCArray"
    push $P1095, $P1094
    .return ($P1095)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("281_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1099_tgt
    .local int rx1099_pos
    .local int rx1099_off
    .local int rx1099_eos
    .local int rx1099_rep
    .local pmc rx1099_cur
    (rx1099_cur, rx1099_pos, rx1099_tgt) = self."!cursor_start"()
    rx1099_cur."!cursor_debug"("START ", "infix:sym<le>")
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
.annotate "line", 485
  # rx subcapture "sym"
    set_addr $I10, rxcap_1104_fail
    rx1099_cur."!mark_push"(0, rx1099_pos, $I10)
  # rx literal  "le"
    add $I11, rx1099_pos, 2
    gt $I11, rx1099_eos, rx1099_fail
    sub $I11, rx1099_pos, rx1099_off
    substr $S10, rx1099_tgt, $I11, 2
    ne $S10, "le", rx1099_fail
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
    $P10 = rx1099_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx1099_fail
    rx1099_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1099_pos = $P10."pos"()
  # rx pass
    rx1099_cur."!cursor_pass"(rx1099_pos, "infix:sym<le>")
    rx1099_cur."!cursor_debug"("PASS  ", "infix:sym<le>", " at pos=", rx1099_pos)
    .return (rx1099_cur)
  rx1099_fail:
.annotate "line", 408
    (rx1099_rep, rx1099_pos, $I10, $P10) = rx1099_cur."!mark_fail"(0)
    lt rx1099_pos, -1, rx1099_done
    eq rx1099_pos, -1, rx1099_fail
    jump $I10
  rx1099_done:
    rx1099_cur."!cursor_fail"()
    rx1099_cur."!cursor_debug"("FAIL  ", "infix:sym<le>")
    .return (rx1099_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("282_1260829317.63188") :method
.annotate "line", 408
    $P1101 = self."!PREFIX__!subrule"("O", "le")
    new $P1102, "ResizablePMCArray"
    push $P1102, $P1101
    .return ($P1102)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("283_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1106_tgt
    .local int rx1106_pos
    .local int rx1106_off
    .local int rx1106_eos
    .local int rx1106_rep
    .local pmc rx1106_cur
    (rx1106_cur, rx1106_pos, rx1106_tgt) = self."!cursor_start"()
    rx1106_cur."!cursor_debug"("START ", "infix:sym<ge>")
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
.annotate "line", 486
  # rx subcapture "sym"
    set_addr $I10, rxcap_1111_fail
    rx1106_cur."!mark_push"(0, rx1106_pos, $I10)
  # rx literal  "ge"
    add $I11, rx1106_pos, 2
    gt $I11, rx1106_eos, rx1106_fail
    sub $I11, rx1106_pos, rx1106_off
    substr $S10, rx1106_tgt, $I11, 2
    ne $S10, "ge", rx1106_fail
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
    $P10 = rx1106_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx1106_fail
    rx1106_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1106_pos = $P10."pos"()
  # rx pass
    rx1106_cur."!cursor_pass"(rx1106_pos, "infix:sym<ge>")
    rx1106_cur."!cursor_debug"("PASS  ", "infix:sym<ge>", " at pos=", rx1106_pos)
    .return (rx1106_cur)
  rx1106_fail:
.annotate "line", 408
    (rx1106_rep, rx1106_pos, $I10, $P10) = rx1106_cur."!mark_fail"(0)
    lt rx1106_pos, -1, rx1106_done
    eq rx1106_pos, -1, rx1106_fail
    jump $I10
  rx1106_done:
    rx1106_cur."!cursor_fail"()
    rx1106_cur."!cursor_debug"("FAIL  ", "infix:sym<ge>")
    .return (rx1106_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("284_1260829317.63188") :method
.annotate "line", 408
    $P1108 = self."!PREFIX__!subrule"("O", "ge")
    new $P1109, "ResizablePMCArray"
    push $P1109, $P1108
    .return ($P1109)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("285_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1113_tgt
    .local int rx1113_pos
    .local int rx1113_off
    .local int rx1113_eos
    .local int rx1113_rep
    .local pmc rx1113_cur
    (rx1113_cur, rx1113_pos, rx1113_tgt) = self."!cursor_start"()
    rx1113_cur."!cursor_debug"("START ", "infix:sym<lt>")
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
.annotate "line", 487
  # rx subcapture "sym"
    set_addr $I10, rxcap_1118_fail
    rx1113_cur."!mark_push"(0, rx1113_pos, $I10)
  # rx literal  "lt"
    add $I11, rx1113_pos, 2
    gt $I11, rx1113_eos, rx1113_fail
    sub $I11, rx1113_pos, rx1113_off
    substr $S10, rx1113_tgt, $I11, 2
    ne $S10, "lt", rx1113_fail
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
    $P10 = rx1113_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx1113_fail
    rx1113_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1113_pos = $P10."pos"()
  # rx pass
    rx1113_cur."!cursor_pass"(rx1113_pos, "infix:sym<lt>")
    rx1113_cur."!cursor_debug"("PASS  ", "infix:sym<lt>", " at pos=", rx1113_pos)
    .return (rx1113_cur)
  rx1113_fail:
.annotate "line", 408
    (rx1113_rep, rx1113_pos, $I10, $P10) = rx1113_cur."!mark_fail"(0)
    lt rx1113_pos, -1, rx1113_done
    eq rx1113_pos, -1, rx1113_fail
    jump $I10
  rx1113_done:
    rx1113_cur."!cursor_fail"()
    rx1113_cur."!cursor_debug"("FAIL  ", "infix:sym<lt>")
    .return (rx1113_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("286_1260829317.63188") :method
.annotate "line", 408
    $P1115 = self."!PREFIX__!subrule"("O", "lt")
    new $P1116, "ResizablePMCArray"
    push $P1116, $P1115
    .return ($P1116)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("287_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1120_tgt
    .local int rx1120_pos
    .local int rx1120_off
    .local int rx1120_eos
    .local int rx1120_rep
    .local pmc rx1120_cur
    (rx1120_cur, rx1120_pos, rx1120_tgt) = self."!cursor_start"()
    rx1120_cur."!cursor_debug"("START ", "infix:sym<gt>")
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
.annotate "line", 488
  # rx subcapture "sym"
    set_addr $I10, rxcap_1125_fail
    rx1120_cur."!mark_push"(0, rx1120_pos, $I10)
  # rx literal  "gt"
    add $I11, rx1120_pos, 2
    gt $I11, rx1120_eos, rx1120_fail
    sub $I11, rx1120_pos, rx1120_off
    substr $S10, rx1120_tgt, $I11, 2
    ne $S10, "gt", rx1120_fail
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
    $P10 = rx1120_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx1120_fail
    rx1120_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1120_pos = $P10."pos"()
  # rx pass
    rx1120_cur."!cursor_pass"(rx1120_pos, "infix:sym<gt>")
    rx1120_cur."!cursor_debug"("PASS  ", "infix:sym<gt>", " at pos=", rx1120_pos)
    .return (rx1120_cur)
  rx1120_fail:
.annotate "line", 408
    (rx1120_rep, rx1120_pos, $I10, $P10) = rx1120_cur."!mark_fail"(0)
    lt rx1120_pos, -1, rx1120_done
    eq rx1120_pos, -1, rx1120_fail
    jump $I10
  rx1120_done:
    rx1120_cur."!cursor_fail"()
    rx1120_cur."!cursor_debug"("FAIL  ", "infix:sym<gt>")
    .return (rx1120_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("288_1260829317.63188") :method
.annotate "line", 408
    $P1122 = self."!PREFIX__!subrule"("O", "gt")
    new $P1123, "ResizablePMCArray"
    push $P1123, $P1122
    .return ($P1123)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("289_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1127_tgt
    .local int rx1127_pos
    .local int rx1127_off
    .local int rx1127_eos
    .local int rx1127_rep
    .local pmc rx1127_cur
    (rx1127_cur, rx1127_pos, rx1127_tgt) = self."!cursor_start"()
    rx1127_cur."!cursor_debug"("START ", "infix:sym<=:=>")
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
.annotate "line", 489
  # rx subcapture "sym"
    set_addr $I10, rxcap_1132_fail
    rx1127_cur."!mark_push"(0, rx1127_pos, $I10)
  # rx literal  "=:="
    add $I11, rx1127_pos, 3
    gt $I11, rx1127_eos, rx1127_fail
    sub $I11, rx1127_pos, rx1127_off
    substr $S10, rx1127_tgt, $I11, 3
    ne $S10, "=:=", rx1127_fail
    add rx1127_pos, 3
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
    $P10 = rx1127_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx1127_fail
    rx1127_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1127_pos = $P10."pos"()
  # rx pass
    rx1127_cur."!cursor_pass"(rx1127_pos, "infix:sym<=:=>")
    rx1127_cur."!cursor_debug"("PASS  ", "infix:sym<=:=>", " at pos=", rx1127_pos)
    .return (rx1127_cur)
  rx1127_fail:
.annotate "line", 408
    (rx1127_rep, rx1127_pos, $I10, $P10) = rx1127_cur."!mark_fail"(0)
    lt rx1127_pos, -1, rx1127_done
    eq rx1127_pos, -1, rx1127_fail
    jump $I10
  rx1127_done:
    rx1127_cur."!cursor_fail"()
    rx1127_cur."!cursor_debug"("FAIL  ", "infix:sym<=:=>")
    .return (rx1127_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("290_1260829317.63188") :method
.annotate "line", 408
    $P1129 = self."!PREFIX__!subrule"("O", "=:=")
    new $P1130, "ResizablePMCArray"
    push $P1130, $P1129
    .return ($P1130)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~~>"  :subid("291_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1134_tgt
    .local int rx1134_pos
    .local int rx1134_off
    .local int rx1134_eos
    .local int rx1134_rep
    .local pmc rx1134_cur
    (rx1134_cur, rx1134_pos, rx1134_tgt) = self."!cursor_start"()
    rx1134_cur."!cursor_debug"("START ", "infix:sym<~~>")
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
.annotate "line", 490
  # rx subcapture "sym"
    set_addr $I10, rxcap_1139_fail
    rx1134_cur."!mark_push"(0, rx1134_pos, $I10)
  # rx literal  "~~"
    add $I11, rx1134_pos, 2
    gt $I11, rx1134_eos, rx1134_fail
    sub $I11, rx1134_pos, rx1134_off
    substr $S10, rx1134_tgt, $I11, 2
    ne $S10, "~~", rx1134_fail
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
    $P10 = rx1134_cur."O"("%relational, :reducecheck<smartmatch>")
    unless $P10, rx1134_fail
    rx1134_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1134_pos = $P10."pos"()
  # rx pass
    rx1134_cur."!cursor_pass"(rx1134_pos, "infix:sym<~~>")
    rx1134_cur."!cursor_debug"("PASS  ", "infix:sym<~~>", " at pos=", rx1134_pos)
    .return (rx1134_cur)
  rx1134_fail:
.annotate "line", 408
    (rx1134_rep, rx1134_pos, $I10, $P10) = rx1134_cur."!mark_fail"(0)
    lt rx1134_pos, -1, rx1134_done
    eq rx1134_pos, -1, rx1134_fail
    jump $I10
  rx1134_done:
    rx1134_cur."!cursor_fail"()
    rx1134_cur."!cursor_debug"("FAIL  ", "infix:sym<~~>")
    .return (rx1134_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~~>"  :subid("292_1260829317.63188") :method
.annotate "line", 408
    $P1136 = self."!PREFIX__!subrule"("O", "~~")
    new $P1137, "ResizablePMCArray"
    push $P1137, $P1136
    .return ($P1137)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("293_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1141_tgt
    .local int rx1141_pos
    .local int rx1141_off
    .local int rx1141_eos
    .local int rx1141_rep
    .local pmc rx1141_cur
    (rx1141_cur, rx1141_pos, rx1141_tgt) = self."!cursor_start"()
    rx1141_cur."!cursor_debug"("START ", "infix:sym<&&>")
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
.annotate "line", 492
  # rx subcapture "sym"
    set_addr $I10, rxcap_1146_fail
    rx1141_cur."!mark_push"(0, rx1141_pos, $I10)
  # rx literal  "&&"
    add $I11, rx1141_pos, 2
    gt $I11, rx1141_eos, rx1141_fail
    sub $I11, rx1141_pos, rx1141_off
    substr $S10, rx1141_tgt, $I11, 2
    ne $S10, "&&", rx1141_fail
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
    $P10 = rx1141_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx1141_fail
    rx1141_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1141_pos = $P10."pos"()
  # rx pass
    rx1141_cur."!cursor_pass"(rx1141_pos, "infix:sym<&&>")
    rx1141_cur."!cursor_debug"("PASS  ", "infix:sym<&&>", " at pos=", rx1141_pos)
    .return (rx1141_cur)
  rx1141_fail:
.annotate "line", 408
    (rx1141_rep, rx1141_pos, $I10, $P10) = rx1141_cur."!mark_fail"(0)
    lt rx1141_pos, -1, rx1141_done
    eq rx1141_pos, -1, rx1141_fail
    jump $I10
  rx1141_done:
    rx1141_cur."!cursor_fail"()
    rx1141_cur."!cursor_debug"("FAIL  ", "infix:sym<&&>")
    .return (rx1141_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("294_1260829317.63188") :method
.annotate "line", 408
    $P1143 = self."!PREFIX__!subrule"("O", "&&")
    new $P1144, "ResizablePMCArray"
    push $P1144, $P1143
    .return ($P1144)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("295_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1148_tgt
    .local int rx1148_pos
    .local int rx1148_off
    .local int rx1148_eos
    .local int rx1148_rep
    .local pmc rx1148_cur
    (rx1148_cur, rx1148_pos, rx1148_tgt) = self."!cursor_start"()
    rx1148_cur."!cursor_debug"("START ", "infix:sym<||>")
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
.annotate "line", 494
  # rx subcapture "sym"
    set_addr $I10, rxcap_1153_fail
    rx1148_cur."!mark_push"(0, rx1148_pos, $I10)
  # rx literal  "||"
    add $I11, rx1148_pos, 2
    gt $I11, rx1148_eos, rx1148_fail
    sub $I11, rx1148_pos, rx1148_off
    substr $S10, rx1148_tgt, $I11, 2
    ne $S10, "||", rx1148_fail
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
    $P10 = rx1148_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx1148_fail
    rx1148_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1148_pos = $P10."pos"()
  # rx pass
    rx1148_cur."!cursor_pass"(rx1148_pos, "infix:sym<||>")
    rx1148_cur."!cursor_debug"("PASS  ", "infix:sym<||>", " at pos=", rx1148_pos)
    .return (rx1148_cur)
  rx1148_fail:
.annotate "line", 408
    (rx1148_rep, rx1148_pos, $I10, $P10) = rx1148_cur."!mark_fail"(0)
    lt rx1148_pos, -1, rx1148_done
    eq rx1148_pos, -1, rx1148_fail
    jump $I10
  rx1148_done:
    rx1148_cur."!cursor_fail"()
    rx1148_cur."!cursor_debug"("FAIL  ", "infix:sym<||>")
    .return (rx1148_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("296_1260829317.63188") :method
.annotate "line", 408
    $P1150 = self."!PREFIX__!subrule"("O", "||")
    new $P1151, "ResizablePMCArray"
    push $P1151, $P1150
    .return ($P1151)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("297_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1155_tgt
    .local int rx1155_pos
    .local int rx1155_off
    .local int rx1155_eos
    .local int rx1155_rep
    .local pmc rx1155_cur
    (rx1155_cur, rx1155_pos, rx1155_tgt) = self."!cursor_start"()
    rx1155_cur."!cursor_debug"("START ", "infix:sym<//>")
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
.annotate "line", 495
  # rx subcapture "sym"
    set_addr $I10, rxcap_1160_fail
    rx1155_cur."!mark_push"(0, rx1155_pos, $I10)
  # rx literal  "//"
    add $I11, rx1155_pos, 2
    gt $I11, rx1155_eos, rx1155_fail
    sub $I11, rx1155_pos, rx1155_off
    substr $S10, rx1155_tgt, $I11, 2
    ne $S10, "//", rx1155_fail
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
    $P10 = rx1155_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx1155_fail
    rx1155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1155_pos = $P10."pos"()
  # rx pass
    rx1155_cur."!cursor_pass"(rx1155_pos, "infix:sym<//>")
    rx1155_cur."!cursor_debug"("PASS  ", "infix:sym<//>", " at pos=", rx1155_pos)
    .return (rx1155_cur)
  rx1155_fail:
.annotate "line", 408
    (rx1155_rep, rx1155_pos, $I10, $P10) = rx1155_cur."!mark_fail"(0)
    lt rx1155_pos, -1, rx1155_done
    eq rx1155_pos, -1, rx1155_fail
    jump $I10
  rx1155_done:
    rx1155_cur."!cursor_fail"()
    rx1155_cur."!cursor_debug"("FAIL  ", "infix:sym<//>")
    .return (rx1155_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("298_1260829317.63188") :method
.annotate "line", 408
    $P1157 = self."!PREFIX__!subrule"("O", "//")
    new $P1158, "ResizablePMCArray"
    push $P1158, $P1157
    .return ($P1158)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("299_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1162_tgt
    .local int rx1162_pos
    .local int rx1162_off
    .local int rx1162_eos
    .local int rx1162_rep
    .local pmc rx1162_cur
    (rx1162_cur, rx1162_pos, rx1162_tgt) = self."!cursor_start"()
    rx1162_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
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
.annotate "line", 498
  # rx literal  "??"
    add $I11, rx1162_pos, 2
    gt $I11, rx1162_eos, rx1162_fail
    sub $I11, rx1162_pos, rx1162_off
    substr $S10, rx1162_tgt, $I11, 2
    ne $S10, "??", rx1162_fail
    add rx1162_pos, 2
.annotate "line", 499
  # rx subrule "ws" subtype=method negate=
    rx1162_cur."!cursor_pos"(rx1162_pos)
    $P10 = rx1162_cur."ws"()
    unless $P10, rx1162_fail
    rx1162_pos = $P10."pos"()
.annotate "line", 500
  # rx subrule "EXPR" subtype=capture negate=
    rx1162_cur."!cursor_pos"(rx1162_pos)
    $P10 = rx1162_cur."EXPR"("i=")
    unless $P10, rx1162_fail
    rx1162_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1162_pos = $P10."pos"()
.annotate "line", 501
  # rx literal  "!!"
    add $I11, rx1162_pos, 2
    gt $I11, rx1162_eos, rx1162_fail
    sub $I11, rx1162_pos, rx1162_off
    substr $S10, rx1162_tgt, $I11, 2
    ne $S10, "!!", rx1162_fail
    add rx1162_pos, 2
.annotate "line", 502
  # rx subrule "O" subtype=capture negate=
    rx1162_cur."!cursor_pos"(rx1162_pos)
    $P10 = rx1162_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx1162_fail
    rx1162_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1162_pos = $P10."pos"()
.annotate "line", 497
  # rx pass
    rx1162_cur."!cursor_pass"(rx1162_pos, "infix:sym<?? !!>")
    rx1162_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx1162_pos)
    .return (rx1162_cur)
  rx1162_fail:
.annotate "line", 408
    (rx1162_rep, rx1162_pos, $I10, $P10) = rx1162_cur."!mark_fail"(0)
    lt rx1162_pos, -1, rx1162_done
    eq rx1162_pos, -1, rx1162_fail
    jump $I10
  rx1162_done:
    rx1162_cur."!cursor_fail"()
    rx1162_cur."!cursor_debug"("FAIL  ", "infix:sym<?? !!>")
    .return (rx1162_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("300_1260829317.63188") :method
.annotate "line", 408
    $P1164 = self."!PREFIX__!subrule"("", "??")
    new $P1165, "ResizablePMCArray"
    push $P1165, $P1164
    .return ($P1165)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("301_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1168_tgt
    .local int rx1168_pos
    .local int rx1168_off
    .local int rx1168_eos
    .local int rx1168_rep
    .local pmc rx1168_cur
    (rx1168_cur, rx1168_pos, rx1168_tgt) = self."!cursor_start"()
    rx1168_cur."!cursor_debug"("START ", "infix:sym<=>")
    .lex unicode:"$\x{a2}", rx1168_cur
    .local pmc match
    .lex "$/", match
    length rx1168_eos, rx1168_tgt
    set rx1168_off, 0
    lt rx1168_pos, 2, rx1168_start
    sub rx1168_off, rx1168_pos, 1
    substr rx1168_tgt, rx1168_tgt, rx1168_off
  rx1168_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1172_done
    goto rxscan1172_scan
  rxscan1172_loop:
    ($P10) = rx1168_cur."from"()
    inc $P10
    set rx1168_pos, $P10
    ge rx1168_pos, rx1168_eos, rxscan1172_done
  rxscan1172_scan:
    set_addr $I10, rxscan1172_loop
    rx1168_cur."!mark_push"(0, rx1168_pos, $I10)
  rxscan1172_done:
.annotate "line", 506
  # rx subcapture "sym"
    set_addr $I10, rxcap_1173_fail
    rx1168_cur."!mark_push"(0, rx1168_pos, $I10)
  # rx literal  "="
    add $I11, rx1168_pos, 1
    gt $I11, rx1168_eos, rx1168_fail
    sub $I11, rx1168_pos, rx1168_off
    substr $S10, rx1168_tgt, $I11, 1
    ne $S10, "=", rx1168_fail
    add rx1168_pos, 1
    set_addr $I10, rxcap_1173_fail
    ($I12, $I11) = rx1168_cur."!mark_peek"($I10)
    rx1168_cur."!cursor_pos"($I11)
    ($P10) = rx1168_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1168_pos, "")
    rx1168_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1173_done
  rxcap_1173_fail:
    goto rx1168_fail
  rxcap_1173_done:
  # rx subrule "panic" subtype=method negate=
    rx1168_cur."!cursor_pos"(rx1168_pos)
    $P10 = rx1168_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx1168_fail
    rx1168_pos = $P10."pos"()
.annotate "line", 505
  # rx pass
    rx1168_cur."!cursor_pass"(rx1168_pos, "infix:sym<=>")
    rx1168_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx1168_pos)
    .return (rx1168_cur)
  rx1168_fail:
.annotate "line", 408
    (rx1168_rep, rx1168_pos, $I10, $P10) = rx1168_cur."!mark_fail"(0)
    lt rx1168_pos, -1, rx1168_done
    eq rx1168_pos, -1, rx1168_fail
    jump $I10
  rx1168_done:
    rx1168_cur."!cursor_fail"()
    rx1168_cur."!cursor_debug"("FAIL  ", "infix:sym<=>")
    .return (rx1168_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("302_1260829317.63188") :method
.annotate "line", 408
    $P1170 = self."!PREFIX__!subrule"("", "=")
    new $P1171, "ResizablePMCArray"
    push $P1171, $P1170
    .return ($P1171)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("303_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1175_tgt
    .local int rx1175_pos
    .local int rx1175_off
    .local int rx1175_eos
    .local int rx1175_rep
    .local pmc rx1175_cur
    (rx1175_cur, rx1175_pos, rx1175_tgt) = self."!cursor_start"()
    rx1175_cur."!cursor_debug"("START ", "infix:sym<:=>")
    .lex unicode:"$\x{a2}", rx1175_cur
    .local pmc match
    .lex "$/", match
    length rx1175_eos, rx1175_tgt
    set rx1175_off, 0
    lt rx1175_pos, 2, rx1175_start
    sub rx1175_off, rx1175_pos, 1
    substr rx1175_tgt, rx1175_tgt, rx1175_off
  rx1175_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1179_done
    goto rxscan1179_scan
  rxscan1179_loop:
    ($P10) = rx1175_cur."from"()
    inc $P10
    set rx1175_pos, $P10
    ge rx1175_pos, rx1175_eos, rxscan1179_done
  rxscan1179_scan:
    set_addr $I10, rxscan1179_loop
    rx1175_cur."!mark_push"(0, rx1175_pos, $I10)
  rxscan1179_done:
.annotate "line", 508
  # rx subcapture "sym"
    set_addr $I10, rxcap_1180_fail
    rx1175_cur."!mark_push"(0, rx1175_pos, $I10)
  # rx literal  ":="
    add $I11, rx1175_pos, 2
    gt $I11, rx1175_eos, rx1175_fail
    sub $I11, rx1175_pos, rx1175_off
    substr $S10, rx1175_tgt, $I11, 2
    ne $S10, ":=", rx1175_fail
    add rx1175_pos, 2
    set_addr $I10, rxcap_1180_fail
    ($I12, $I11) = rx1175_cur."!mark_peek"($I10)
    rx1175_cur."!cursor_pos"($I11)
    ($P10) = rx1175_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1175_pos, "")
    rx1175_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1180_done
  rxcap_1180_fail:
    goto rx1175_fail
  rxcap_1180_done:
  # rx subrule "O" subtype=capture negate=
    rx1175_cur."!cursor_pos"(rx1175_pos)
    $P10 = rx1175_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1175_fail
    rx1175_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1175_pos = $P10."pos"()
  # rx pass
    rx1175_cur."!cursor_pass"(rx1175_pos, "infix:sym<:=>")
    rx1175_cur."!cursor_debug"("PASS  ", "infix:sym<:=>", " at pos=", rx1175_pos)
    .return (rx1175_cur)
  rx1175_fail:
.annotate "line", 408
    (rx1175_rep, rx1175_pos, $I10, $P10) = rx1175_cur."!mark_fail"(0)
    lt rx1175_pos, -1, rx1175_done
    eq rx1175_pos, -1, rx1175_fail
    jump $I10
  rx1175_done:
    rx1175_cur."!cursor_fail"()
    rx1175_cur."!cursor_debug"("FAIL  ", "infix:sym<:=>")
    .return (rx1175_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("304_1260829317.63188") :method
.annotate "line", 408
    $P1177 = self."!PREFIX__!subrule"("O", ":=")
    new $P1178, "ResizablePMCArray"
    push $P1178, $P1177
    .return ($P1178)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("305_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1182_tgt
    .local int rx1182_pos
    .local int rx1182_off
    .local int rx1182_eos
    .local int rx1182_rep
    .local pmc rx1182_cur
    (rx1182_cur, rx1182_pos, rx1182_tgt) = self."!cursor_start"()
    rx1182_cur."!cursor_debug"("START ", "infix:sym<::=>")
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
.annotate "line", 509
  # rx subcapture "sym"
    set_addr $I10, rxcap_1187_fail
    rx1182_cur."!mark_push"(0, rx1182_pos, $I10)
  # rx literal  "::="
    add $I11, rx1182_pos, 3
    gt $I11, rx1182_eos, rx1182_fail
    sub $I11, rx1182_pos, rx1182_off
    substr $S10, rx1182_tgt, $I11, 3
    ne $S10, "::=", rx1182_fail
    add rx1182_pos, 3
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
  # rx subrule "O" subtype=capture negate=
    rx1182_cur."!cursor_pos"(rx1182_pos)
    $P10 = rx1182_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1182_fail
    rx1182_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1182_pos = $P10."pos"()
  # rx pass
    rx1182_cur."!cursor_pass"(rx1182_pos, "infix:sym<::=>")
    rx1182_cur."!cursor_debug"("PASS  ", "infix:sym<::=>", " at pos=", rx1182_pos)
    .return (rx1182_cur)
  rx1182_fail:
.annotate "line", 408
    (rx1182_rep, rx1182_pos, $I10, $P10) = rx1182_cur."!mark_fail"(0)
    lt rx1182_pos, -1, rx1182_done
    eq rx1182_pos, -1, rx1182_fail
    jump $I10
  rx1182_done:
    rx1182_cur."!cursor_fail"()
    rx1182_cur."!cursor_debug"("FAIL  ", "infix:sym<::=>")
    .return (rx1182_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("306_1260829317.63188") :method
.annotate "line", 408
    $P1184 = self."!PREFIX__!subrule"("O", "::=")
    new $P1185, "ResizablePMCArray"
    push $P1185, $P1184
    .return ($P1185)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("307_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1189_tgt
    .local int rx1189_pos
    .local int rx1189_off
    .local int rx1189_eos
    .local int rx1189_rep
    .local pmc rx1189_cur
    (rx1189_cur, rx1189_pos, rx1189_tgt) = self."!cursor_start"()
    rx1189_cur."!cursor_debug"("START ", "infix:sym<,>")
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
.annotate "line", 511
  # rx subcapture "sym"
    set_addr $I10, rxcap_1194_fail
    rx1189_cur."!mark_push"(0, rx1189_pos, $I10)
  # rx literal  ","
    add $I11, rx1189_pos, 1
    gt $I11, rx1189_eos, rx1189_fail
    sub $I11, rx1189_pos, rx1189_off
    substr $S10, rx1189_tgt, $I11, 1
    ne $S10, ",", rx1189_fail
    add rx1189_pos, 1
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
    $P10 = rx1189_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1189_fail
    rx1189_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1189_pos = $P10."pos"()
  # rx pass
    rx1189_cur."!cursor_pass"(rx1189_pos, "infix:sym<,>")
    rx1189_cur."!cursor_debug"("PASS  ", "infix:sym<,>", " at pos=", rx1189_pos)
    .return (rx1189_cur)
  rx1189_fail:
.annotate "line", 408
    (rx1189_rep, rx1189_pos, $I10, $P10) = rx1189_cur."!mark_fail"(0)
    lt rx1189_pos, -1, rx1189_done
    eq rx1189_pos, -1, rx1189_fail
    jump $I10
  rx1189_done:
    rx1189_cur."!cursor_fail"()
    rx1189_cur."!cursor_debug"("FAIL  ", "infix:sym<,>")
    .return (rx1189_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("308_1260829317.63188") :method
.annotate "line", 408
    $P1191 = self."!PREFIX__!subrule"("O", ",")
    new $P1192, "ResizablePMCArray"
    push $P1192, $P1191
    .return ($P1192)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("309_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1196_tgt
    .local int rx1196_pos
    .local int rx1196_off
    .local int rx1196_eos
    .local int rx1196_rep
    .local pmc rx1196_cur
    (rx1196_cur, rx1196_pos, rx1196_tgt) = self."!cursor_start"()
    rx1196_cur."!cursor_debug"("START ", "prefix:sym<return>")
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
.annotate "line", 513
  # rx subcapture "sym"
    set_addr $I10, rxcap_1200_fail
    rx1196_cur."!mark_push"(0, rx1196_pos, $I10)
  # rx literal  "return"
    add $I11, rx1196_pos, 6
    gt $I11, rx1196_eos, rx1196_fail
    sub $I11, rx1196_pos, rx1196_off
    substr $S10, rx1196_tgt, $I11, 6
    ne $S10, "return", rx1196_fail
    add rx1196_pos, 6
    set_addr $I10, rxcap_1200_fail
    ($I12, $I11) = rx1196_cur."!mark_peek"($I10)
    rx1196_cur."!cursor_pos"($I11)
    ($P10) = rx1196_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1196_pos, "")
    rx1196_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1200_done
  rxcap_1200_fail:
    goto rx1196_fail
  rxcap_1200_done:
  # rx charclass s
    ge rx1196_pos, rx1196_eos, rx1196_fail
    sub $I10, rx1196_pos, rx1196_off
    is_cclass $I11, 32, rx1196_tgt, $I10
    unless $I11, rx1196_fail
    inc rx1196_pos
  # rx subrule "O" subtype=capture negate=
    rx1196_cur."!cursor_pos"(rx1196_pos)
    $P10 = rx1196_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1196_fail
    rx1196_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1196_pos = $P10."pos"()
  # rx pass
    rx1196_cur."!cursor_pass"(rx1196_pos, "prefix:sym<return>")
    rx1196_cur."!cursor_debug"("PASS  ", "prefix:sym<return>", " at pos=", rx1196_pos)
    .return (rx1196_cur)
  rx1196_fail:
.annotate "line", 408
    (rx1196_rep, rx1196_pos, $I10, $P10) = rx1196_cur."!mark_fail"(0)
    lt rx1196_pos, -1, rx1196_done
    eq rx1196_pos, -1, rx1196_fail
    jump $I10
  rx1196_done:
    rx1196_cur."!cursor_fail"()
    rx1196_cur."!cursor_debug"("FAIL  ", "prefix:sym<return>")
    .return (rx1196_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("310_1260829317.63188") :method
.annotate "line", 408
    new $P1198, "ResizablePMCArray"
    push $P1198, "return"
    .return ($P1198)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("311_1260829317.63188") :method :outer("11_1260829317.63188")
.annotate "line", 408
    .local string rx1202_tgt
    .local int rx1202_pos
    .local int rx1202_off
    .local int rx1202_eos
    .local int rx1202_rep
    .local pmc rx1202_cur
    (rx1202_cur, rx1202_pos, rx1202_tgt) = self."!cursor_start"()
    rx1202_cur."!cursor_debug"("START ", "prefix:sym<make>")
    .lex unicode:"$\x{a2}", rx1202_cur
    .local pmc match
    .lex "$/", match
    length rx1202_eos, rx1202_tgt
    set rx1202_off, 0
    lt rx1202_pos, 2, rx1202_start
    sub rx1202_off, rx1202_pos, 1
    substr rx1202_tgt, rx1202_tgt, rx1202_off
  rx1202_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1205_done
    goto rxscan1205_scan
  rxscan1205_loop:
    ($P10) = rx1202_cur."from"()
    inc $P10
    set rx1202_pos, $P10
    ge rx1202_pos, rx1202_eos, rxscan1205_done
  rxscan1205_scan:
    set_addr $I10, rxscan1205_loop
    rx1202_cur."!mark_push"(0, rx1202_pos, $I10)
  rxscan1205_done:
.annotate "line", 514
  # rx subcapture "sym"
    set_addr $I10, rxcap_1206_fail
    rx1202_cur."!mark_push"(0, rx1202_pos, $I10)
  # rx literal  "make"
    add $I11, rx1202_pos, 4
    gt $I11, rx1202_eos, rx1202_fail
    sub $I11, rx1202_pos, rx1202_off
    substr $S10, rx1202_tgt, $I11, 4
    ne $S10, "make", rx1202_fail
    add rx1202_pos, 4
    set_addr $I10, rxcap_1206_fail
    ($I12, $I11) = rx1202_cur."!mark_peek"($I10)
    rx1202_cur."!cursor_pos"($I11)
    ($P10) = rx1202_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1202_pos, "")
    rx1202_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1206_done
  rxcap_1206_fail:
    goto rx1202_fail
  rxcap_1206_done:
  # rx charclass s
    ge rx1202_pos, rx1202_eos, rx1202_fail
    sub $I10, rx1202_pos, rx1202_off
    is_cclass $I11, 32, rx1202_tgt, $I10
    unless $I11, rx1202_fail
    inc rx1202_pos
  # rx subrule "O" subtype=capture negate=
    rx1202_cur."!cursor_pos"(rx1202_pos)
    $P10 = rx1202_cur."O"("%list_prefix")
    unless $P10, rx1202_fail
    rx1202_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1202_pos = $P10."pos"()
  # rx pass
    rx1202_cur."!cursor_pass"(rx1202_pos, "prefix:sym<make>")
    rx1202_cur."!cursor_debug"("PASS  ", "prefix:sym<make>", " at pos=", rx1202_pos)
    .return (rx1202_cur)
  rx1202_fail:
.annotate "line", 408
    (rx1202_rep, rx1202_pos, $I10, $P10) = rx1202_cur."!mark_fail"(0)
    lt rx1202_pos, -1, rx1202_done
    eq rx1202_pos, -1, rx1202_fail
    jump $I10
  rx1202_done:
    rx1202_cur."!cursor_fail"()
    rx1202_cur."!cursor_debug"("FAIL  ", "prefix:sym<make>")
    .return (rx1202_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("312_1260829317.63188") :method
.annotate "line", 408
    new $P1204, "ResizablePMCArray"
    push $P1204, "make"
    .return ($P1204)
.end


.namespace ["NQP";"Grammar"]
.sub "smartmatch"  :subid("313_1260829317.63188") :method :outer("11_1260829317.63188")
    .param pmc param_1210
.annotate "line", 516
    new $P1209, 'ExceptionHandler'
    set_addr $P1209, control_1208
    $P1209."handle_types"(58)
    push_eh $P1209
    .lex "self", self
    .lex "$/", param_1210
.annotate "line", 518
    new $P1211, "Undef"
    .lex "$t", $P1211
    find_lex $P1212, "$/"
    unless_null $P1212, vivify_339
    new $P1212, "ResizablePMCArray"
  vivify_339:
    set $P1213, $P1212[0]
    unless_null $P1213, vivify_340
    new $P1213, "Undef"
  vivify_340:
    store_lex "$t", $P1213
    find_lex $P1214, "$/"
    unless_null $P1214, vivify_341
    new $P1214, "ResizablePMCArray"
  vivify_341:
    set $P1215, $P1214[1]
    unless_null $P1215, vivify_342
    new $P1215, "Undef"
  vivify_342:
    find_lex $P1216, "$/"
    unless_null $P1216, vivify_343
    new $P1216, "ResizablePMCArray"
    store_lex "$/", $P1216
  vivify_343:
    set $P1216[0], $P1215
    find_lex $P1217, "$t"
    find_lex $P1218, "$/"
    unless_null $P1218, vivify_344
    new $P1218, "ResizablePMCArray"
    store_lex "$/", $P1218
  vivify_344:
    set $P1218[1], $P1217
.annotate "line", 516
    .return ($P1217)
  control_1208:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1219, exception, "payload"
    .return ($P1219)
.end


.namespace ["NQP";"Regex"]
.sub "_block1220"  :subid("314_1260829317.63188") :outer("11_1260829317.63188")
.annotate "line", 522
    .const 'Sub' $P1254 = "325_1260829317.63188" 
    capture_lex $P1254
    .const 'Sub' $P1241 = "322_1260829317.63188" 
    capture_lex $P1241
    .const 'Sub' $P1236 = "320_1260829317.63188" 
    capture_lex $P1236
    .const 'Sub' $P1231 = "318_1260829317.63188" 
    capture_lex $P1231
    .const 'Sub' $P1222 = "315_1260829317.63188" 
    capture_lex $P1222
    .const 'Sub' $P1254 = "325_1260829317.63188" 
    capture_lex $P1254
    .return ($P1254)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("315_1260829317.63188") :method :outer("314_1260829317.63188")
.annotate "line", 522
    .const 'Sub' $P1228 = "317_1260829317.63188" 
    capture_lex $P1228
    .local string rx1223_tgt
    .local int rx1223_pos
    .local int rx1223_off
    .local int rx1223_eos
    .local int rx1223_rep
    .local pmc rx1223_cur
    (rx1223_cur, rx1223_pos, rx1223_tgt) = self."!cursor_start"()
    rx1223_cur."!cursor_debug"("START ", "metachar:sym<:my>")
    .lex unicode:"$\x{a2}", rx1223_cur
    .local pmc match
    .lex "$/", match
    length rx1223_eos, rx1223_tgt
    set rx1223_off, 0
    lt rx1223_pos, 2, rx1223_start
    sub rx1223_off, rx1223_pos, 1
    substr rx1223_tgt, rx1223_tgt, rx1223_off
  rx1223_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1226_done
    goto rxscan1226_scan
  rxscan1226_loop:
    ($P10) = rx1223_cur."from"()
    inc $P10
    set rx1223_pos, $P10
    ge rx1223_pos, rx1223_eos, rxscan1226_done
  rxscan1226_scan:
    set_addr $I10, rxscan1226_loop
    rx1223_cur."!mark_push"(0, rx1223_pos, $I10)
  rxscan1226_done:
.annotate "line", 524
  # rx literal  ":"
    add $I11, rx1223_pos, 1
    gt $I11, rx1223_eos, rx1223_fail
    sub $I11, rx1223_pos, rx1223_off
    substr $S10, rx1223_tgt, $I11, 1
    ne $S10, ":", rx1223_fail
    add rx1223_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1223_cur."!cursor_pos"(rx1223_pos)
    .const 'Sub' $P1228 = "317_1260829317.63188" 
    capture_lex $P1228
    $P10 = rx1223_cur."before"($P1228)
    unless $P10, rx1223_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1223_cur."!cursor_pos"(rx1223_pos)
    $P10 = rx1223_cur."LANG"("MAIN", "statement")
    unless $P10, rx1223_fail
    rx1223_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1223_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1223_cur."!cursor_pos"(rx1223_pos)
    $P10 = rx1223_cur."ws"()
    unless $P10, rx1223_fail
    rx1223_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1223_pos, 1
    gt $I11, rx1223_eos, rx1223_fail
    sub $I11, rx1223_pos, rx1223_off
    substr $S10, rx1223_tgt, $I11, 1
    ne $S10, ";", rx1223_fail
    add rx1223_pos, 1
.annotate "line", 523
  # rx pass
    rx1223_cur."!cursor_pass"(rx1223_pos, "metachar:sym<:my>")
    rx1223_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1223_pos)
    .return (rx1223_cur)
  rx1223_fail:
.annotate "line", 522
    (rx1223_rep, rx1223_pos, $I10, $P10) = rx1223_cur."!mark_fail"(0)
    lt rx1223_pos, -1, rx1223_done
    eq rx1223_pos, -1, rx1223_fail
    jump $I10
  rx1223_done:
    rx1223_cur."!cursor_fail"()
    rx1223_cur."!cursor_debug"("FAIL  ", "metachar:sym<:my>")
    .return (rx1223_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("316_1260829317.63188") :method
.annotate "line", 522
    new $P1225, "ResizablePMCArray"
    push $P1225, ":"
    .return ($P1225)
.end


.namespace ["NQP";"Regex"]
.sub "_block1227"  :anon :subid("317_1260829317.63188") :method :outer("315_1260829317.63188")
.annotate "line", 524
    .local string rx1229_tgt
    .local int rx1229_pos
    .local int rx1229_off
    .local int rx1229_eos
    .local int rx1229_rep
    .local pmc rx1229_cur
    (rx1229_cur, rx1229_pos, rx1229_tgt) = self."!cursor_start"()
    rx1229_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1229_cur
    .local pmc match
    .lex "$/", match
    length rx1229_eos, rx1229_tgt
    set rx1229_off, 0
    lt rx1229_pos, 2, rx1229_start
    sub rx1229_off, rx1229_pos, 1
    substr rx1229_tgt, rx1229_tgt, rx1229_off
  rx1229_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1230_done
    goto rxscan1230_scan
  rxscan1230_loop:
    ($P10) = rx1229_cur."from"()
    inc $P10
    set rx1229_pos, $P10
    ge rx1229_pos, rx1229_eos, rxscan1230_done
  rxscan1230_scan:
    set_addr $I10, rxscan1230_loop
    rx1229_cur."!mark_push"(0, rx1229_pos, $I10)
  rxscan1230_done:
  # rx literal  "my"
    add $I11, rx1229_pos, 2
    gt $I11, rx1229_eos, rx1229_fail
    sub $I11, rx1229_pos, rx1229_off
    substr $S10, rx1229_tgt, $I11, 2
    ne $S10, "my", rx1229_fail
    add rx1229_pos, 2
  # rx pass
    rx1229_cur."!cursor_pass"(rx1229_pos, "")
    rx1229_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1229_pos)
    .return (rx1229_cur)
  rx1229_fail:
    (rx1229_rep, rx1229_pos, $I10, $P10) = rx1229_cur."!mark_fail"(0)
    lt rx1229_pos, -1, rx1229_done
    eq rx1229_pos, -1, rx1229_fail
    jump $I10
  rx1229_done:
    rx1229_cur."!cursor_fail"()
    rx1229_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1229_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("318_1260829317.63188") :method :outer("314_1260829317.63188")
.annotate "line", 522
    .local string rx1232_tgt
    .local int rx1232_pos
    .local int rx1232_off
    .local int rx1232_eos
    .local int rx1232_rep
    .local pmc rx1232_cur
    (rx1232_cur, rx1232_pos, rx1232_tgt) = self."!cursor_start"()
    rx1232_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1232_cur
    .local pmc match
    .lex "$/", match
    length rx1232_eos, rx1232_tgt
    set rx1232_off, 0
    lt rx1232_pos, 2, rx1232_start
    sub rx1232_off, rx1232_pos, 1
    substr rx1232_tgt, rx1232_tgt, rx1232_off
  rx1232_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1235_done
    goto rxscan1235_scan
  rxscan1235_loop:
    ($P10) = rx1232_cur."from"()
    inc $P10
    set rx1232_pos, $P10
    ge rx1232_pos, rx1232_eos, rxscan1235_done
  rxscan1235_scan:
    set_addr $I10, rxscan1235_loop
    rx1232_cur."!mark_push"(0, rx1232_pos, $I10)
  rxscan1235_done:
.annotate "line", 528
  # rx enumcharlist negate=0 zerowidth
    ge rx1232_pos, rx1232_eos, rx1232_fail
    sub $I10, rx1232_pos, rx1232_off
    substr $S10, rx1232_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1232_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1232_cur."!cursor_pos"(rx1232_pos)
    $P10 = rx1232_cur."codeblock"()
    unless $P10, rx1232_fail
    rx1232_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1232_pos = $P10."pos"()
.annotate "line", 527
  # rx pass
    rx1232_cur."!cursor_pass"(rx1232_pos, "metachar:sym<{ }>")
    rx1232_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1232_pos)
    .return (rx1232_cur)
  rx1232_fail:
.annotate "line", 522
    (rx1232_rep, rx1232_pos, $I10, $P10) = rx1232_cur."!mark_fail"(0)
    lt rx1232_pos, -1, rx1232_done
    eq rx1232_pos, -1, rx1232_fail
    jump $I10
  rx1232_done:
    rx1232_cur."!cursor_fail"()
    rx1232_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx1232_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("319_1260829317.63188") :method
.annotate "line", 522
    new $P1234, "ResizablePMCArray"
    push $P1234, "{"
    .return ($P1234)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("320_1260829317.63188") :method :outer("314_1260829317.63188")
.annotate "line", 522
    .local string rx1237_tgt
    .local int rx1237_pos
    .local int rx1237_off
    .local int rx1237_eos
    .local int rx1237_rep
    .local pmc rx1237_cur
    (rx1237_cur, rx1237_pos, rx1237_tgt) = self."!cursor_start"()
    rx1237_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
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
.annotate "line", 532
  # rx enumcharlist negate=0 zerowidth
    ge rx1237_pos, rx1237_eos, rx1237_fail
    sub $I10, rx1237_pos, rx1237_off
    substr $S10, rx1237_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1237_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1237_cur."!cursor_pos"(rx1237_pos)
    $P10 = rx1237_cur."codeblock"()
    unless $P10, rx1237_fail
    rx1237_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1237_pos = $P10."pos"()
.annotate "line", 531
  # rx pass
    rx1237_cur."!cursor_pass"(rx1237_pos, "assertion:sym<{ }>")
    rx1237_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1237_pos)
    .return (rx1237_cur)
  rx1237_fail:
.annotate "line", 522
    (rx1237_rep, rx1237_pos, $I10, $P10) = rx1237_cur."!mark_fail"(0)
    lt rx1237_pos, -1, rx1237_done
    eq rx1237_pos, -1, rx1237_fail
    jump $I10
  rx1237_done:
    rx1237_cur."!cursor_fail"()
    rx1237_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1237_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("321_1260829317.63188") :method
.annotate "line", 522
    new $P1239, "ResizablePMCArray"
    push $P1239, "{"
    .return ($P1239)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("322_1260829317.63188") :method :outer("314_1260829317.63188")
.annotate "line", 522
    .const 'Sub' $P1250 = "324_1260829317.63188" 
    capture_lex $P1250
    .local string rx1242_tgt
    .local int rx1242_pos
    .local int rx1242_off
    .local int rx1242_eos
    .local int rx1242_rep
    .local pmc rx1242_cur
    (rx1242_cur, rx1242_pos, rx1242_tgt) = self."!cursor_start"()
    rx1242_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1242_cur."!cursor_caparray"("assertion", "nibbler", "arglist")
    .lex unicode:"$\x{a2}", rx1242_cur
    .local pmc match
    .lex "$/", match
    length rx1242_eos, rx1242_tgt
    set rx1242_off, 0
    lt rx1242_pos, 2, rx1242_start
    sub rx1242_off, rx1242_pos, 1
    substr rx1242_tgt, rx1242_tgt, rx1242_off
  rx1242_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1245_done
    goto rxscan1245_scan
  rxscan1245_loop:
    ($P10) = rx1242_cur."from"()
    inc $P10
    set rx1242_pos, $P10
    ge rx1242_pos, rx1242_eos, rxscan1245_done
  rxscan1245_scan:
    set_addr $I10, rxscan1245_loop
    rx1242_cur."!mark_push"(0, rx1242_pos, $I10)
  rxscan1245_done:
.annotate "line", 536
  # rx subcapture "longname"
    set_addr $I10, rxcap_1246_fail
    rx1242_cur."!mark_push"(0, rx1242_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1242_pos, rx1242_off
    find_not_cclass $I11, 8192, rx1242_tgt, $I10, rx1242_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1242_fail
    add rx1242_pos, rx1242_off, $I11
    set_addr $I10, rxcap_1246_fail
    ($I12, $I11) = rx1242_cur."!mark_peek"($I10)
    rx1242_cur."!cursor_pos"($I11)
    ($P10) = rx1242_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1242_pos, "")
    rx1242_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_1246_done
  rxcap_1246_fail:
    goto rx1242_fail
  rxcap_1246_done:
.annotate "line", 543
  # rx rxquantr1247 ** 0..1
    set_addr $I1253, rxquantr1247_done
    rx1242_cur."!mark_push"(0, rx1242_pos, $I1253)
  rxquantr1247_loop:
  alt1248_0:
.annotate "line", 537
    set_addr $I10, alt1248_1
    rx1242_cur."!mark_push"(0, rx1242_pos, $I10)
.annotate "line", 538
  # rx subrule "before" subtype=zerowidth negate=
    rx1242_cur."!cursor_pos"(rx1242_pos)
    .const 'Sub' $P1250 = "324_1260829317.63188" 
    capture_lex $P1250
    $P10 = rx1242_cur."before"($P1250)
    unless $P10, rx1242_fail
    goto alt1248_end
  alt1248_1:
    set_addr $I10, alt1248_2
    rx1242_cur."!mark_push"(0, rx1242_pos, $I10)
.annotate "line", 539
  # rx literal  "="
    add $I11, rx1242_pos, 1
    gt $I11, rx1242_eos, rx1242_fail
    sub $I11, rx1242_pos, rx1242_off
    substr $S10, rx1242_tgt, $I11, 1
    ne $S10, "=", rx1242_fail
    add rx1242_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1242_cur."!cursor_pos"(rx1242_pos)
    $P10 = rx1242_cur."assertion"()
    unless $P10, rx1242_fail
    rx1242_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1242_pos = $P10."pos"()
    goto alt1248_end
  alt1248_2:
    set_addr $I10, alt1248_3
    rx1242_cur."!mark_push"(0, rx1242_pos, $I10)
.annotate "line", 540
  # rx literal  ":"
    add $I11, rx1242_pos, 1
    gt $I11, rx1242_eos, rx1242_fail
    sub $I11, rx1242_pos, rx1242_off
    substr $S10, rx1242_tgt, $I11, 1
    ne $S10, ":", rx1242_fail
    add rx1242_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1242_cur."!cursor_pos"(rx1242_pos)
    $P10 = rx1242_cur."arglist"()
    unless $P10, rx1242_fail
    rx1242_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1242_pos = $P10."pos"()
    goto alt1248_end
  alt1248_3:
    set_addr $I10, alt1248_4
    rx1242_cur."!mark_push"(0, rx1242_pos, $I10)
.annotate "line", 541
  # rx literal  "("
    add $I11, rx1242_pos, 1
    gt $I11, rx1242_eos, rx1242_fail
    sub $I11, rx1242_pos, rx1242_off
    substr $S10, rx1242_tgt, $I11, 1
    ne $S10, "(", rx1242_fail
    add rx1242_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1242_cur."!cursor_pos"(rx1242_pos)
    $P10 = rx1242_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1242_fail
    rx1242_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1242_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1242_pos, 1
    gt $I11, rx1242_eos, rx1242_fail
    sub $I11, rx1242_pos, rx1242_off
    substr $S10, rx1242_tgt, $I11, 1
    ne $S10, ")", rx1242_fail
    add rx1242_pos, 1
    goto alt1248_end
  alt1248_4:
.annotate "line", 542
  # rx subrule "normspace" subtype=method negate=
    rx1242_cur."!cursor_pos"(rx1242_pos)
    $P10 = rx1242_cur."normspace"()
    unless $P10, rx1242_fail
    rx1242_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1242_cur."!cursor_pos"(rx1242_pos)
    $P10 = rx1242_cur."nibbler"()
    unless $P10, rx1242_fail
    rx1242_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1242_pos = $P10."pos"()
  alt1248_end:
.annotate "line", 543
    (rx1242_rep) = rx1242_cur."!mark_commit"($I1253)
  rxquantr1247_done:
.annotate "line", 535
  # rx pass
    rx1242_cur."!cursor_pass"(rx1242_pos, "assertion:sym<name>")
    rx1242_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1242_pos)
    .return (rx1242_cur)
  rx1242_fail:
.annotate "line", 522
    (rx1242_rep, rx1242_pos, $I10, $P10) = rx1242_cur."!mark_fail"(0)
    lt rx1242_pos, -1, rx1242_done
    eq rx1242_pos, -1, rx1242_fail
    jump $I10
  rx1242_done:
    rx1242_cur."!cursor_fail"()
    rx1242_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1242_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("323_1260829317.63188") :method
.annotate "line", 522
    new $P1244, "ResizablePMCArray"
    push $P1244, ""
    .return ($P1244)
.end


.namespace ["NQP";"Regex"]
.sub "_block1249"  :anon :subid("324_1260829317.63188") :method :outer("322_1260829317.63188")
.annotate "line", 538
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
  # rx literal  ">"
    add $I11, rx1251_pos, 1
    gt $I11, rx1251_eos, rx1251_fail
    sub $I11, rx1251_pos, rx1251_off
    substr $S10, rx1251_tgt, $I11, 1
    ne $S10, ">", rx1251_fail
    add rx1251_pos, 1
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
.sub "codeblock"  :subid("325_1260829317.63188") :method :outer("314_1260829317.63188")
.annotate "line", 522
    .local string rx1255_tgt
    .local int rx1255_pos
    .local int rx1255_off
    .local int rx1255_eos
    .local int rx1255_rep
    .local pmc rx1255_cur
    (rx1255_cur, rx1255_pos, rx1255_tgt) = self."!cursor_start"()
    rx1255_cur."!cursor_debug"("START ", "codeblock")
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
    ne $I10, -1, rxscan1259_done
    goto rxscan1259_scan
  rxscan1259_loop:
    ($P10) = rx1255_cur."from"()
    inc $P10
    set rx1255_pos, $P10
    ge rx1255_pos, rx1255_eos, rxscan1259_done
  rxscan1259_scan:
    set_addr $I10, rxscan1259_loop
    rx1255_cur."!mark_push"(0, rx1255_pos, $I10)
  rxscan1259_done:
.annotate "line", 548
  # rx subrule "LANG" subtype=capture negate=
    rx1255_cur."!cursor_pos"(rx1255_pos)
    $P10 = rx1255_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1255_fail
    rx1255_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1255_pos = $P10."pos"()
.annotate "line", 547
  # rx pass
    rx1255_cur."!cursor_pass"(rx1255_pos, "codeblock")
    rx1255_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1255_pos)
    .return (rx1255_cur)
  rx1255_fail:
.annotate "line", 522
    (rx1255_rep, rx1255_pos, $I10, $P10) = rx1255_cur."!mark_fail"(0)
    lt rx1255_pos, -1, rx1255_done
    eq rx1255_pos, -1, rx1255_fail
    jump $I10
  rx1255_done:
    rx1255_cur."!cursor_fail"()
    rx1255_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1255_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("326_1260829317.63188") :method
.annotate "line", 522
    $P1257 = self."!PREFIX__!subrule"("block", "")
    new $P1258, "ResizablePMCArray"
    push $P1258, $P1257
    .return ($P1258)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1260829329.07487")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
    $P2139 = $P14()
.annotate "line", 1
    .return ($P2139)
.end


.namespace []
.sub "" :load :init :subid("post124") :outer("10_1260829329.07487")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1260829329.07487" 
    .local pmc block
    set block, $P12
    $P2140 = get_root_global ["parrot"], "P6metaclass"
    $P2140."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1260829329.07487") :outer("10_1260829329.07487")
.annotate "line", 3
    .const 'Sub' $P2135 = "123_1260829329.07487" 
    capture_lex $P2135
    get_hll_global $P2071, ["NQP";"RegexActions"], "_block2070" 
    capture_lex $P2071
    .const 'Sub' $P2060 = "117_1260829329.07487" 
    capture_lex $P2060
    .const 'Sub' $P2048 = "116_1260829329.07487" 
    capture_lex $P2048
    .const 'Sub' $P2038 = "115_1260829329.07487" 
    capture_lex $P2038
    .const 'Sub' $P2028 = "114_1260829329.07487" 
    capture_lex $P2028
    .const 'Sub' $P2018 = "113_1260829329.07487" 
    capture_lex $P2018
    .const 'Sub' $P2004 = "112_1260829329.07487" 
    capture_lex $P2004
    .const 'Sub' $P1994 = "111_1260829329.07487" 
    capture_lex $P1994
    .const 'Sub' $P1957 = "110_1260829329.07487" 
    capture_lex $P1957
    .const 'Sub' $P1943 = "109_1260829329.07487" 
    capture_lex $P1943
    .const 'Sub' $P1933 = "108_1260829329.07487" 
    capture_lex $P1933
    .const 'Sub' $P1923 = "107_1260829329.07487" 
    capture_lex $P1923
    .const 'Sub' $P1913 = "106_1260829329.07487" 
    capture_lex $P1913
    .const 'Sub' $P1903 = "105_1260829329.07487" 
    capture_lex $P1903
    .const 'Sub' $P1893 = "104_1260829329.07487" 
    capture_lex $P1893
    .const 'Sub' $P1865 = "103_1260829329.07487" 
    capture_lex $P1865
    .const 'Sub' $P1848 = "102_1260829329.07487" 
    capture_lex $P1848
    .const 'Sub' $P1838 = "101_1260829329.07487" 
    capture_lex $P1838
    .const 'Sub' $P1826 = "100_1260829329.07487" 
    capture_lex $P1826
    .const 'Sub' $P1814 = "99_1260829329.07487" 
    capture_lex $P1814
    .const 'Sub' $P1802 = "98_1260829329.07487" 
    capture_lex $P1802
    .const 'Sub' $P1792 = "97_1260829329.07487" 
    capture_lex $P1792
    .const 'Sub' $P1763 = "96_1260829329.07487" 
    capture_lex $P1763
    .const 'Sub' $P1741 = "95_1260829329.07487" 
    capture_lex $P1741
    .const 'Sub' $P1731 = "94_1260829329.07487" 
    capture_lex $P1731
    .const 'Sub' $P1721 = "93_1260829329.07487" 
    capture_lex $P1721
    .const 'Sub' $P1694 = "92_1260829329.07487" 
    capture_lex $P1694
    .const 'Sub' $P1676 = "91_1260829329.07487" 
    capture_lex $P1676
    .const 'Sub' $P1666 = "90_1260829329.07487" 
    capture_lex $P1666
    .const 'Sub' $P1582 = "87_1260829329.07487" 
    capture_lex $P1582
    .const 'Sub' $P1572 = "86_1260829329.07487" 
    capture_lex $P1572
    .const 'Sub' $P1543 = "85_1260829329.07487" 
    capture_lex $P1543
    .const 'Sub' $P1501 = "84_1260829329.07487" 
    capture_lex $P1501
    .const 'Sub' $P1485 = "83_1260829329.07487" 
    capture_lex $P1485
    .const 'Sub' $P1476 = "82_1260829329.07487" 
    capture_lex $P1476
    .const 'Sub' $P1444 = "81_1260829329.07487" 
    capture_lex $P1444
    .const 'Sub' $P1345 = "78_1260829329.07487" 
    capture_lex $P1345
    .const 'Sub' $P1328 = "77_1260829329.07487" 
    capture_lex $P1328
    .const 'Sub' $P1308 = "76_1260829329.07487" 
    capture_lex $P1308
    .const 'Sub' $P1224 = "75_1260829329.07487" 
    capture_lex $P1224
    .const 'Sub' $P1200 = "73_1260829329.07487" 
    capture_lex $P1200
    .const 'Sub' $P1166 = "71_1260829329.07487" 
    capture_lex $P1166
    .const 'Sub' $P1116 = "69_1260829329.07487" 
    capture_lex $P1116
    .const 'Sub' $P1106 = "68_1260829329.07487" 
    capture_lex $P1106
    .const 'Sub' $P1096 = "67_1260829329.07487" 
    capture_lex $P1096
    .const 'Sub' $P1025 = "65_1260829329.07487" 
    capture_lex $P1025
    .const 'Sub' $P1008 = "64_1260829329.07487" 
    capture_lex $P1008
    .const 'Sub' $P998 = "63_1260829329.07487" 
    capture_lex $P998
    .const 'Sub' $P988 = "62_1260829329.07487" 
    capture_lex $P988
    .const 'Sub' $P978 = "61_1260829329.07487" 
    capture_lex $P978
    .const 'Sub' $P954 = "60_1260829329.07487" 
    capture_lex $P954
    .const 'Sub' $P901 = "59_1260829329.07487" 
    capture_lex $P901
    .const 'Sub' $P891 = "58_1260829329.07487" 
    capture_lex $P891
    .const 'Sub' $P802 = "56_1260829329.07487" 
    capture_lex $P802
    .const 'Sub' $P776 = "55_1260829329.07487" 
    capture_lex $P776
    .const 'Sub' $P766 = "54_1260829329.07487" 
    capture_lex $P766
    .const 'Sub' $P756 = "53_1260829329.07487" 
    capture_lex $P756
    .const 'Sub' $P746 = "52_1260829329.07487" 
    capture_lex $P746
    .const 'Sub' $P736 = "51_1260829329.07487" 
    capture_lex $P736
    .const 'Sub' $P726 = "50_1260829329.07487" 
    capture_lex $P726
    .const 'Sub' $P716 = "49_1260829329.07487" 
    capture_lex $P716
    .const 'Sub' $P706 = "48_1260829329.07487" 
    capture_lex $P706
    .const 'Sub' $P696 = "47_1260829329.07487" 
    capture_lex $P696
    .const 'Sub' $P686 = "46_1260829329.07487" 
    capture_lex $P686
    .const 'Sub' $P676 = "45_1260829329.07487" 
    capture_lex $P676
    .const 'Sub' $P666 = "44_1260829329.07487" 
    capture_lex $P666
    .const 'Sub' $P656 = "43_1260829329.07487" 
    capture_lex $P656
    .const 'Sub' $P638 = "42_1260829329.07487" 
    capture_lex $P638
    .const 'Sub' $P603 = "41_1260829329.07487" 
    capture_lex $P603
    .const 'Sub' $P587 = "40_1260829329.07487" 
    capture_lex $P587
    .const 'Sub' $P566 = "39_1260829329.07487" 
    capture_lex $P566
    .const 'Sub' $P546 = "38_1260829329.07487" 
    capture_lex $P546
    .const 'Sub' $P533 = "37_1260829329.07487" 
    capture_lex $P533
    .const 'Sub' $P507 = "36_1260829329.07487" 
    capture_lex $P507
    .const 'Sub' $P471 = "35_1260829329.07487" 
    capture_lex $P471
    .const 'Sub' $P454 = "34_1260829329.07487" 
    capture_lex $P454
    .const 'Sub' $P440 = "33_1260829329.07487" 
    capture_lex $P440
    .const 'Sub' $P387 = "31_1260829329.07487" 
    capture_lex $P387
    .const 'Sub' $P374 = "30_1260829329.07487" 
    capture_lex $P374
    .const 'Sub' $P355 = "29_1260829329.07487" 
    capture_lex $P355
    .const 'Sub' $P345 = "28_1260829329.07487" 
    capture_lex $P345
    .const 'Sub' $P335 = "27_1260829329.07487" 
    capture_lex $P335
    .const 'Sub' $P319 = "26_1260829329.07487" 
    capture_lex $P319
    .const 'Sub' $P259 = "24_1260829329.07487" 
    capture_lex $P259
    .const 'Sub' $P210 = "22_1260829329.07487" 
    capture_lex $P210
    .const 'Sub' $P191 = "21_1260829329.07487" 
    capture_lex $P191
    .const 'Sub' $P158 = "20_1260829329.07487" 
    capture_lex $P158
    .const 'Sub' $P148 = "19_1260829329.07487" 
    capture_lex $P148
    .const 'Sub' $P94 = "18_1260829329.07487" 
    capture_lex $P94
    .const 'Sub' $P79 = "17_1260829329.07487" 
    capture_lex $P79
    .const 'Sub' $P61 = "16_1260829329.07487" 
    capture_lex $P61
    .const 'Sub' $P26 = "13_1260829329.07487" 
    capture_lex $P26
    .const 'Sub' $P16 = "12_1260829329.07487" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_127
    new $P15, "ResizablePMCArray"
    set_global "@BLOCK", $P15
  vivify_127:
.annotate "line", 9
    .const 'Sub' $P16 = "12_1260829329.07487" 
    capture_lex $P16
    .lex "xblock_immediate", $P16
.annotate "line", 14
    .const 'Sub' $P26 = "13_1260829329.07487" 
    capture_lex $P26
    .lex "block_immediate", $P26
.annotate "line", 24
    .const 'Sub' $P61 = "16_1260829329.07487" 
    capture_lex $P61
    .lex "sigiltype", $P61
.annotate "line", 40
    .const 'Sub' $P79 = "17_1260829329.07487" 
    capture_lex $P79
    .lex "colonpair_str", $P79
.annotate "line", 187
    .const 'Sub' $P94 = "18_1260829329.07487" 
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
.annotate "line", 758
    get_hll_global $P2071, ["NQP";"RegexActions"], "_block2070" 
    capture_lex $P2071
    $P2133 = $P2071()
.annotate "line", 3
    .return ($P2133)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post125") :outer("11_1260829329.07487")
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 5
    .const 'Sub' $P2135 = "123_1260829329.07487" 
    capture_lex $P2135
    $P2135()
    $P2138 = get_root_global ["parrot"], "P6metaclass"
    $P2138."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block2134"  :anon :subid("123_1260829329.07487") :outer("11_1260829329.07487")
.annotate "line", 6
    get_global $P2136, "@BLOCK"
    unless_null $P2136, vivify_126
    new $P2136, "ResizablePMCArray"
    set_global "@BLOCK", $P2136
  vivify_126:
 $P2137 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P2137
.annotate "line", 5
    .return ($P2137)
.end


.namespace ["NQP";"Actions"]
.sub "xblock_immediate"  :subid("12_1260829329.07487") :outer("11_1260829329.07487")
    .param pmc param_19
.annotate "line", 9
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(58)
    push_eh $P18
    .lex "$xblock", param_19
.annotate "line", 10
    find_lex $P20, "$xblock"
    unless_null $P20, vivify_128
    new $P20, "ResizablePMCArray"
  vivify_128:
    set $P21, $P20[1]
    unless_null $P21, vivify_129
    new $P21, "Undef"
  vivify_129:
    $P22 = "block_immediate"($P21)
    find_lex $P23, "$xblock"
    unless_null $P23, vivify_130
    new $P23, "ResizablePMCArray"
    store_lex "$xblock", $P23
  vivify_130:
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
.sub "block_immediate"  :subid("13_1260829329.07487") :outer("11_1260829329.07487")
    .param pmc param_29
.annotate "line", 14
    .const 'Sub' $P39 = "14_1260829329.07487" 
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
    .const 'Sub' $P39 = "14_1260829329.07487" 
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
.sub "_block38"  :anon :subid("14_1260829329.07487") :outer("13_1260829329.07487")
.annotate "line", 16
    .const 'Sub' $P50 = "15_1260829329.07487" 
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
    unless $I47, for_undef_131
    iter $P44, $P46
    new $P56, 'ExceptionHandler'
    set_addr $P56, loop55_handler
    $P56."handle_types"(65, 67, 66)
    push_eh $P56
  loop55_test:
    unless $P44, loop55_done
    shift $P48, $P44
  loop55_redo:
    .const 'Sub' $P50 = "15_1260829329.07487" 
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
  for_undef_131:
.annotate "line", 19
    find_lex $P58, "$stmts"
    store_lex "$block", $P58
.annotate "line", 16
    .return ($P58)
.end


.namespace ["NQP";"Actions"]
.sub "_block49"  :anon :subid("15_1260829329.07487") :outer("14_1260829329.07487")
    .param pmc param_51
.annotate "line", 18
    .lex "$_", param_51
    find_lex $P52, "$stmts"
    find_lex $P53, "$_"
    $P54 = $P52."push"($P53)
    .return ($P54)
.end


.namespace ["NQP";"Actions"]
.sub "sigiltype"  :subid("16_1260829329.07487") :outer("11_1260829329.07487")
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
.sub "colonpair_str"  :subid("17_1260829329.07487") :outer("11_1260829329.07487")
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
.sub "push_block_handler"  :subid("18_1260829329.07487") :outer("11_1260829329.07487")
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
    unless_null $P100, vivify_132
    new $P100, "ResizablePMCArray"
  vivify_132:
    set $P101, $P100[0]
    unless_null $P101, vivify_133
    new $P101, "Undef"
  vivify_133:
    $P102 = $P101."handlers"()
    if $P102, unless_99_end
.annotate "line", 189
    get_global $P103, "@BLOCK"
    unless_null $P103, vivify_134
    new $P103, "ResizablePMCArray"
  vivify_134:
    set $P104, $P103[0]
    unless_null $P104, vivify_135
    new $P104, "Undef"
  vivify_135:
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
    unless_null $P123, vivify_136
    new $P123, "ResizablePMCArray"
  vivify_136:
    set $P124, $P123[0]
    unless_null $P124, vivify_137
    new $P124, "Undef"
  vivify_137:
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
.sub "TOP"  :subid("19_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P153, vivify_138
    new $P153, "Hash"
  vivify_138:
    set $P154, $P153["comp_unit"]
    unless_null $P154, vivify_139
    new $P154, "Undef"
  vivify_139:
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
.sub "deflongname"  :subid("20_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P165, vivify_140
    new $P165, "Hash"
  vivify_140:
    set $P166, $P165["colonpair"]
    unless_null $P166, vivify_141
    new $P166, "Undef"
  vivify_141:
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
    unless_null $P167, vivify_142
    new $P167, "Hash"
  vivify_142:
    set $P168, $P167["identifier"]
    unless_null $P168, vivify_143
    new $P168, "Undef"
  vivify_143:
    set $S169, $P168
    new $P170, 'String'
    set $P170, $S169
    concat $P171, $P170, ":"
    find_lex $P172, "$/"
    unless_null $P172, vivify_144
    new $P172, "Hash"
  vivify_144:
    set $P173, $P172["colonpair"]
    unless_null $P173, vivify_145
    new $P173, "ResizablePMCArray"
  vivify_145:
    set $P174, $P173[0]
    unless_null $P174, vivify_146
    new $P174, "Undef"
  vivify_146:
    $P175 = $P174."ast"()
    $S176 = $P175."named"()
    concat $P177, $P171, $S176
    concat $P178, $P177, "<"
.annotate "line", 35
    find_lex $P179, "$/"
    unless_null $P179, vivify_147
    new $P179, "Hash"
  vivify_147:
    set $P180, $P179["colonpair"]
    unless_null $P180, vivify_148
    new $P180, "ResizablePMCArray"
  vivify_148:
    set $P181, $P180[0]
    unless_null $P181, vivify_149
    new $P181, "Undef"
  vivify_149:
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
.sub "comp_unit"  :subid("21_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P197, vivify_150
    new $P197, "Hash"
  vivify_150:
    set $P198, $P197["statementlist"]
    unless_null $P198, vivify_151
    new $P198, "Undef"
  vivify_151:
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
.sub "statementlist"  :subid("22_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_213
.annotate "line", 54
    .const 'Sub' $P227 = "23_1260829329.07487" 
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
    unless_null $P219, vivify_152
    new $P219, "Hash"
  vivify_152:
    set $P220, $P219["statement"]
    unless_null $P220, vivify_153
    new $P220, "Undef"
  vivify_153:
    unless $P220, if_218_end
.annotate "line", 57
    find_lex $P222, "$/"
    unless_null $P222, vivify_154
    new $P222, "Hash"
  vivify_154:
    set $P223, $P222["statement"]
    unless_null $P223, vivify_155
    new $P223, "Undef"
  vivify_155:
    defined $I224, $P223
    unless $I224, for_undef_156
    iter $P221, $P223
    new $P253, 'ExceptionHandler'
    set_addr $P253, loop252_handler
    $P253."handle_types"(65, 67, 66)
    push_eh $P253
  loop252_test:
    unless $P221, loop252_done
    shift $P225, $P221
  loop252_redo:
    .const 'Sub' $P227 = "23_1260829329.07487" 
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
  for_undef_156:
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
.sub "_block226"  :anon :subid("23_1260829329.07487") :outer("22_1260829329.07487")
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
    unless_null $P233, vivify_157
    new $P233, "Hash"
  vivify_157:
    set $P234, $P233["sink"]
    unless_null $P234, vivify_158
    new $P234, "Undef"
  vivify_158:
    defined $I235, $P234
    unless $I235, if_232_end
    find_lex $P236, "$ast"
    unless_null $P236, vivify_159
    new $P236, "Hash"
  vivify_159:
    set $P237, $P236["sink"]
    unless_null $P237, vivify_160
    new $P237, "Undef"
  vivify_160:
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
.sub "statement"  :subid("24_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_262
    .param pmc param_263 :optional
    .param int has_param_263 :opt_flag
.annotate "line", 69
    .const 'Sub' $P271 = "25_1260829329.07487" 
    capture_lex $P271
    new $P261, 'ExceptionHandler'
    set_addr $P261, control_260
    $P261."handle_types"(58)
    push_eh $P261
    .lex "self", self
    .lex "$/", param_262
    if has_param_263, optparam_161
    new $P264, "Undef"
    set param_263, $P264
  optparam_161:
    .lex "$key", param_263
.annotate "line", 70
    new $P265, "Undef"
    .lex "$past", $P265
.annotate "line", 69
    find_lex $P266, "$past"
.annotate "line", 71
    find_lex $P268, "$/"
    unless_null $P268, vivify_162
    new $P268, "Hash"
  vivify_162:
    set $P269, $P268["EXPR"]
    unless_null $P269, vivify_163
    new $P269, "Undef"
  vivify_163:
    if $P269, if_267
.annotate "line", 82
    find_lex $P309, "$/"
    unless_null $P309, vivify_164
    new $P309, "Hash"
  vivify_164:
    set $P310, $P309["statement_control"]
    unless_null $P310, vivify_165
    new $P310, "Undef"
  vivify_165:
    if $P310, if_308
.annotate "line", 83
    new $P314, "Integer"
    assign $P314, 0
    store_lex "$past", $P314
    goto if_308_end
  if_308:
.annotate "line", 82
    find_lex $P311, "$/"
    unless_null $P311, vivify_166
    new $P311, "Hash"
  vivify_166:
    set $P312, $P311["statement_control"]
    unless_null $P312, vivify_167
    new $P312, "Undef"
  vivify_167:
    $P313 = $P312."ast"()
    store_lex "$past", $P313
  if_308_end:
    goto if_267_end
  if_267:
.annotate "line", 71
    .const 'Sub' $P271 = "25_1260829329.07487" 
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
.sub "_block270"  :anon :subid("25_1260829329.07487") :outer("24_1260829329.07487")
.annotate "line", 72
    new $P272, "Undef"
    .lex "$mc", $P272
.annotate "line", 73
    new $P273, "Undef"
    .lex "$ml", $P273
.annotate "line", 72
    find_lex $P274, "$/"
    unless_null $P274, vivify_168
    new $P274, "Hash"
  vivify_168:
    set $P275, $P274["statement_mod_cond"]
    unless_null $P275, vivify_169
    new $P275, "ResizablePMCArray"
  vivify_169:
    set $P276, $P275[0]
    unless_null $P276, vivify_170
    new $P276, "Undef"
  vivify_170:
    store_lex "$mc", $P276
.annotate "line", 73
    find_lex $P277, "$/"
    unless_null $P277, vivify_171
    new $P277, "Hash"
  vivify_171:
    set $P278, $P277["statement_mod_loop"]
    unless_null $P278, vivify_172
    new $P278, "ResizablePMCArray"
  vivify_172:
    set $P279, $P278[0]
    unless_null $P279, vivify_173
    new $P279, "Undef"
  vivify_173:
    store_lex "$ml", $P279
.annotate "line", 74
    find_lex $P280, "$/"
    unless_null $P280, vivify_174
    new $P280, "Hash"
  vivify_174:
    set $P281, $P280["EXPR"]
    unless_null $P281, vivify_175
    new $P281, "Undef"
  vivify_175:
    $P282 = $P281."ast"()
    store_lex "$past", $P282
.annotate "line", 75
    find_lex $P284, "$mc"
    unless $P284, if_283_end
.annotate "line", 76
    get_hll_global $P285, ["PAST"], "Op"
    find_lex $P286, "$mc"
    unless_null $P286, vivify_176
    new $P286, "Hash"
  vivify_176:
    set $P287, $P286["cond"]
    unless_null $P287, vivify_177
    new $P287, "Undef"
  vivify_177:
    $P288 = $P287."ast"()
    find_lex $P289, "$past"
    find_lex $P290, "$mc"
    unless_null $P290, vivify_178
    new $P290, "Hash"
  vivify_178:
    set $P291, $P290["sym"]
    unless_null $P291, vivify_179
    new $P291, "Undef"
  vivify_179:
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
    unless_null $P299, vivify_180
    new $P299, "Hash"
  vivify_180:
    set $P300, $P299["cond"]
    unless_null $P300, vivify_181
    new $P300, "Undef"
  vivify_181:
    $P301 = $P300."ast"()
    find_lex $P302, "$past"
    find_lex $P303, "$ml"
    unless_null $P303, vivify_182
    new $P303, "Hash"
  vivify_182:
    set $P304, $P303["sym"]
    unless_null $P304, vivify_183
    new $P304, "Undef"
  vivify_183:
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
.sub "xblock"  :subid("26_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P325, vivify_184
    new $P325, "Hash"
  vivify_184:
    set $P326, $P325["EXPR"]
    unless_null $P326, vivify_185
    new $P326, "Undef"
  vivify_185:
    $P327 = $P326."ast"()
    find_lex $P328, "$/"
    unless_null $P328, vivify_186
    new $P328, "Hash"
  vivify_186:
    set $P329, $P328["pblock"]
    unless_null $P329, vivify_187
    new $P329, "Undef"
  vivify_187:
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
.sub "pblock"  :subid("27_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P340, vivify_188
    new $P340, "Hash"
  vivify_188:
    set $P341, $P340["blockoid"]
    unless_null $P341, vivify_189
    new $P341, "Undef"
  vivify_189:
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
.sub "block"  :subid("28_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P350, vivify_190
    new $P350, "Hash"
  vivify_190:
    set $P351, $P350["blockoid"]
    unless_null $P351, vivify_191
    new $P351, "Undef"
  vivify_191:
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
.sub "blockoid"  :subid("29_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P361, vivify_192
    new $P361, "Hash"
  vivify_192:
    set $P362, $P361["statementlist"]
    unless_null $P362, vivify_193
    new $P362, "Undef"
  vivify_193:
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
.sub "newpad"  :subid("30_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P378, vivify_194
    new $P378, "ResizablePMCArray"
    set_global "@BLOCK", $P378
  vivify_194:
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
.sub "statement_control:sym<if>"  :subid("31_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_390
.annotate "line", 114
    .const 'Sub' $P418 = "32_1260829329.07487" 
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
    unless_null $P393, vivify_195
    new $P393, "Hash"
  vivify_195:
    set $P394, $P393["xblock"]
    unless_null $P394, vivify_196
    new $P394, "Undef"
  vivify_196:
    set $N395, $P394
    new $P396, 'Float'
    set $P396, $N395
    sub $P397, $P396, 1
    store_lex "$count", $P397
.annotate "line", 116
    find_lex $P398, "$count"
    set $I399, $P398
    find_lex $P400, "$/"
    unless_null $P400, vivify_197
    new $P400, "Hash"
  vivify_197:
    set $P401, $P400["xblock"]
    unless_null $P401, vivify_198
    new $P401, "ResizablePMCArray"
  vivify_198:
    set $P402, $P401[$I399]
    unless_null $P402, vivify_199
    new $P402, "Undef"
  vivify_199:
    $P403 = $P402."ast"()
    $P404 = "xblock_immediate"($P403)
    store_lex "$past", $P404
.annotate "line", 117
    find_lex $P406, "$/"
    unless_null $P406, vivify_200
    new $P406, "Hash"
  vivify_200:
    set $P407, $P406["else"]
    unless_null $P407, vivify_201
    new $P407, "Undef"
  vivify_201:
    unless $P407, if_405_end
.annotate "line", 118
    find_lex $P408, "$past"
    find_lex $P409, "$/"
    unless_null $P409, vivify_202
    new $P409, "Hash"
  vivify_202:
    set $P410, $P409["else"]
    unless_null $P410, vivify_203
    new $P410, "ResizablePMCArray"
  vivify_203:
    set $P411, $P410[0]
    unless_null $P411, vivify_204
    new $P411, "Undef"
  vivify_204:
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
    .const 'Sub' $P418 = "32_1260829329.07487" 
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
.sub "_block417"  :anon :subid("32_1260829329.07487") :outer("31_1260829329.07487")
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
    unless_null $P425, vivify_205
    new $P425, "Hash"
  vivify_205:
    set $P426, $P425["xblock"]
    unless_null $P426, vivify_206
    new $P426, "ResizablePMCArray"
  vivify_206:
    set $P427, $P426[$I424]
    unless_null $P427, vivify_207
    new $P427, "Undef"
  vivify_207:
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
.sub "statement_control:sym<unless>"  :subid("33_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P445, vivify_208
    new $P445, "Hash"
  vivify_208:
    set $P446, $P445["xblock"]
    unless_null $P446, vivify_209
    new $P446, "Undef"
  vivify_209:
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
.sub "statement_control:sym<while>"  :subid("34_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P459, vivify_210
    new $P459, "Hash"
  vivify_210:
    set $P460, $P459["xblock"]
    unless_null $P460, vivify_211
    new $P460, "Undef"
  vivify_211:
    $P461 = $P460."ast"()
    $P462 = "xblock_immediate"($P461)
    store_lex "$past", $P462
.annotate "line", 138
    find_lex $P463, "$past"
    find_lex $P464, "$/"
    unless_null $P464, vivify_212
    new $P464, "Hash"
  vivify_212:
    set $P465, $P464["sym"]
    unless_null $P465, vivify_213
    new $P465, "Undef"
  vivify_213:
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
.sub "statement_control:sym<repeat>"  :subid("35_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P478, vivify_214
    new $P478, "Hash"
  vivify_214:
    set $P479, $P478["wu"]
    unless_null $P479, vivify_215
    new $P479, "Undef"
  vivify_215:
    set $S480, $P479
    concat $P481, $P477, $S480
    store_lex "$pasttype", $P481
    find_lex $P482, "$past"
.annotate "line", 145
    find_lex $P484, "$/"
    unless_null $P484, vivify_216
    new $P484, "Hash"
  vivify_216:
    set $P485, $P484["xblock"]
    unless_null $P485, vivify_217
    new $P485, "Undef"
  vivify_217:
    if $P485, if_483
.annotate "line", 150
    get_hll_global $P492, ["PAST"], "Op"
    find_lex $P493, "$/"
    unless_null $P493, vivify_218
    new $P493, "Hash"
  vivify_218:
    set $P494, $P493["EXPR"]
    unless_null $P494, vivify_219
    new $P494, "Undef"
  vivify_219:
    $P495 = $P494."ast"()
    find_lex $P496, "$/"
    unless_null $P496, vivify_220
    new $P496, "Hash"
  vivify_220:
    set $P497, $P496["pblock"]
    unless_null $P497, vivify_221
    new $P497, "Undef"
  vivify_221:
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
    unless_null $P486, vivify_222
    new $P486, "Hash"
  vivify_222:
    set $P487, $P486["xblock"]
    unless_null $P487, vivify_223
    new $P487, "Undef"
  vivify_223:
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
.sub "statement_control:sym<for>"  :subid("36_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P513, vivify_224
    new $P513, "Hash"
  vivify_224:
    set $P514, $P513["xblock"]
    unless_null $P514, vivify_225
    new $P514, "Undef"
  vivify_225:
    $P515 = $P514."ast"()
    store_lex "$past", $P515
.annotate "line", 158
    find_lex $P516, "$past"
    $P516."pasttype"("for")
.annotate "line", 159
    find_lex $P517, "$past"
    unless_null $P517, vivify_226
    new $P517, "ResizablePMCArray"
  vivify_226:
    set $P518, $P517[1]
    unless_null $P518, vivify_227
    new $P518, "Undef"
  vivify_227:
    store_lex "$block", $P518
.annotate "line", 160
    find_lex $P520, "$block"
    $P521 = $P520."arity"()
    if $P521, unless_519_end
.annotate "line", 161
    find_lex $P522, "$block"
    unless_null $P522, vivify_228
    new $P522, "ResizablePMCArray"
  vivify_228:
    set $P523, $P522[0]
    unless_null $P523, vivify_229
    new $P523, "Undef"
  vivify_229:
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
.sub "statement_control:sym<return>"  :subid("37_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P539, vivify_230
    new $P539, "Hash"
  vivify_230:
    set $P540, $P539["EXPR"]
    unless_null $P540, vivify_231
    new $P540, "Undef"
  vivify_231:
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
.sub "statement_control:sym<CATCH>"  :subid("38_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P551, vivify_232
    new $P551, "Hash"
  vivify_232:
    set $P552, $P551["block"]
    unless_null $P552, vivify_233
    new $P552, "Undef"
  vivify_233:
    $P553 = $P552."ast"()
    store_lex "$block", $P553
.annotate "line", 175
    find_lex $P554, "$/"
    find_lex $P555, "$block"
    "push_block_handler"($P554, $P555)
.annotate "line", 176
    get_global $P556, "@BLOCK"
    unless_null $P556, vivify_234
    new $P556, "ResizablePMCArray"
  vivify_234:
    set $P557, $P556[0]
    unless_null $P557, vivify_235
    new $P557, "Undef"
  vivify_235:
    $P558 = $P557."handlers"()
    set $P559, $P558[0]
    unless_null $P559, vivify_236
    new $P559, "Undef"
  vivify_236:
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
.sub "statement_control:sym<CONTROL>"  :subid("39_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P571, vivify_237
    new $P571, "Hash"
  vivify_237:
    set $P572, $P571["block"]
    unless_null $P572, vivify_238
    new $P572, "Undef"
  vivify_238:
    $P573 = $P572."ast"()
    store_lex "$block", $P573
.annotate "line", 182
    find_lex $P574, "$/"
    find_lex $P575, "$block"
    "push_block_handler"($P574, $P575)
.annotate "line", 183
    get_global $P576, "@BLOCK"
    unless_null $P576, vivify_239
    new $P576, "ResizablePMCArray"
  vivify_239:
    set $P577, $P576[0]
    unless_null $P577, vivify_240
    new $P577, "Undef"
  vivify_240:
    $P578 = $P577."handlers"()
    set $P579, $P578[0]
    unless_null $P579, vivify_241
    new $P579, "Undef"
  vivify_241:
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
.sub "statement_prefix:sym<INIT>"  :subid("40_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P591, vivify_242
    new $P591, "ResizablePMCArray"
  vivify_242:
    set $P592, $P591[0]
    unless_null $P592, vivify_243
    new $P592, "Undef"
  vivify_243:
    $P593 = $P592."loadinit"()
    find_lex $P594, "$/"
    unless_null $P594, vivify_244
    new $P594, "Hash"
  vivify_244:
    set $P595, $P594["blorst"]
    unless_null $P595, vivify_245
    new $P595, "Undef"
  vivify_245:
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
.sub "statement_prefix:sym<try>"  :subid("41_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P608, vivify_246
    new $P608, "Hash"
  vivify_246:
    set $P609, $P608["blorst"]
    unless_null $P609, vivify_247
    new $P609, "Undef"
  vivify_247:
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
.sub "blorst"  :subid("42_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P645, vivify_248
    new $P645, "Hash"
  vivify_248:
    set $P646, $P645["block"]
    unless_null $P646, vivify_249
    new $P646, "Undef"
  vivify_249:
    if $P646, if_644
.annotate "line", 255
    find_lex $P651, "$/"
    unless_null $P651, vivify_250
    new $P651, "Hash"
  vivify_250:
    set $P652, $P651["statement"]
    unless_null $P652, vivify_251
    new $P652, "Undef"
  vivify_251:
    $P653 = $P652."ast"()
    set $P643, $P653
.annotate "line", 254
    goto if_644_end
  if_644:
    find_lex $P647, "$/"
    unless_null $P647, vivify_252
    new $P647, "Hash"
  vivify_252:
    set $P648, $P647["block"]
    unless_null $P648, vivify_253
    new $P648, "Undef"
  vivify_253:
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
.sub "statement_mod_cond:sym<if>"  :subid("43_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P661, vivify_254
    new $P661, "Hash"
  vivify_254:
    set $P662, $P661["cond"]
    unless_null $P662, vivify_255
    new $P662, "Undef"
  vivify_255:
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
.sub "statement_mod_cond:sym<unless>"  :subid("44_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P671, vivify_256
    new $P671, "Hash"
  vivify_256:
    set $P672, $P671["cond"]
    unless_null $P672, vivify_257
    new $P672, "Undef"
  vivify_257:
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
.sub "statement_mod_loop:sym<while>"  :subid("45_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P681, vivify_258
    new $P681, "Hash"
  vivify_258:
    set $P682, $P681["cond"]
    unless_null $P682, vivify_259
    new $P682, "Undef"
  vivify_259:
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
.sub "statement_mod_loop:sym<until>"  :subid("46_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P691, vivify_260
    new $P691, "Hash"
  vivify_260:
    set $P692, $P691["cond"]
    unless_null $P692, vivify_261
    new $P692, "Undef"
  vivify_261:
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
.sub "term:sym<colonpair>"  :subid("47_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P701, vivify_262
    new $P701, "Hash"
  vivify_262:
    set $P702, $P701["colonpair"]
    unless_null $P702, vivify_263
    new $P702, "Undef"
  vivify_263:
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
.sub "term:sym<variable>"  :subid("48_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P711, vivify_264
    new $P711, "Hash"
  vivify_264:
    set $P712, $P711["variable"]
    unless_null $P712, vivify_265
    new $P712, "Undef"
  vivify_265:
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
.sub "term:sym<package_declarator>"  :subid("49_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P721, vivify_266
    new $P721, "Hash"
  vivify_266:
    set $P722, $P721["package_declarator"]
    unless_null $P722, vivify_267
    new $P722, "Undef"
  vivify_267:
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
.sub "term:sym<scope_declarator>"  :subid("50_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P731, vivify_268
    new $P731, "Hash"
  vivify_268:
    set $P732, $P731["scope_declarator"]
    unless_null $P732, vivify_269
    new $P732, "Undef"
  vivify_269:
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
.sub "term:sym<routine_declarator>"  :subid("51_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P741, vivify_270
    new $P741, "Hash"
  vivify_270:
    set $P742, $P741["routine_declarator"]
    unless_null $P742, vivify_271
    new $P742, "Undef"
  vivify_271:
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
.sub "term:sym<regex_declarator>"  :subid("52_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P751, vivify_272
    new $P751, "Hash"
  vivify_272:
    set $P752, $P751["regex_declarator"]
    unless_null $P752, vivify_273
    new $P752, "Undef"
  vivify_273:
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
.sub "term:sym<statement_prefix>"  :subid("53_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P761, vivify_274
    new $P761, "Hash"
  vivify_274:
    set $P762, $P761["statement_prefix"]
    unless_null $P762, vivify_275
    new $P762, "Undef"
  vivify_275:
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
.sub "term:sym<lambda>"  :subid("54_1260829329.07487") :method :outer("11_1260829329.07487")
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
    unless_null $P771, vivify_276
    new $P771, "Hash"
  vivify_276:
    set $P772, $P771["pblock"]
    unless_null $P772, vivify_277
    new $P772, "Undef"
  vivify_277:
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
.sub "colonpair"  :subid("55_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_779
.annotate "line", 277
    new $P778, 'ExceptionHandler'
    set_addr $P778, control_777
    $P778."handle_types"(58)
    push_eh $P778
    .lex "self", self
    .lex "$/", param_779
.annotate "line", 278
    new $P780, "Undef"
    .lex "$past", $P780
.annotate "line", 279
    find_lex $P783, "$/"
    unless_null $P783, vivify_278
    new $P783, "Hash"
  vivify_278:
    set $P784, $P783["circumfix"]
    unless_null $P784, vivify_279
    new $P784, "Undef"
  vivify_279:
    if $P784, if_782
.annotate "line", 280
    get_hll_global $P789, ["PAST"], "Val"
    find_lex $P790, "$/"
    unless_null $P790, vivify_280
    new $P790, "Hash"
  vivify_280:
    set $P791, $P790["not"]
    unless_null $P791, vivify_281
    new $P791, "Undef"
  vivify_281:
    isfalse $I792, $P791
    $P793 = $P789."new"($I792 :named("value"))
    set $P781, $P793
.annotate "line", 279
    goto if_782_end
  if_782:
    find_lex $P785, "$/"
    unless_null $P785, vivify_282
    new $P785, "Hash"
  vivify_282:
    set $P786, $P785["circumfix"]
    unless_null $P786, vivify_283
    new $P786, "ResizablePMCArray"
  vivify_283:
    set $P787, $P786[0]
    unless_null $P787, vivify_284
    new $P787, "Undef"
  vivify_284:
    $P788 = $P787."ast"()
    set $P781, $P788
  if_782_end:
    store_lex "$past", $P781
.annotate "line", 281
    find_lex $P794, "$past"
    find_lex $P795, "$/"
    unless_null $P795, vivify_285
    new $P795, "Hash"
  vivify_285:
    set $P796, $P795["identifier"]
    unless_null $P796, vivify_286
    new $P796, "Undef"
  vivify_286:
    set $S797, $P796
    $P794."named"($S797)
.annotate "line", 282
    find_lex $P798, "$/"
    find_lex $P799, "$past"
    $P800 = $P798."!make"($P799)
.annotate "line", 277
    .return ($P800)
  control_777:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P801, exception, "payload"
    .return ($P801)
.end


.namespace ["NQP";"Actions"]
.sub "variable"  :subid("56_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_805
.annotate "line", 285
    .const 'Sub' $P818 = "57_1260829329.07487" 
    capture_lex $P818
    new $P804, 'ExceptionHandler'
    set_addr $P804, control_803
    $P804."handle_types"(58)
    push_eh $P804
    .lex "self", self
    .lex "$/", param_805
.annotate "line", 286
    new $P806, "Undef"
    .lex "$past", $P806
.annotate "line", 285
    find_lex $P807, "$past"
.annotate "line", 287
    find_lex $P809, "$/"
    unless_null $P809, vivify_287
    new $P809, "Hash"
  vivify_287:
    set $P810, $P809["postcircumfix"]
    unless_null $P810, vivify_288
    new $P810, "Undef"
  vivify_288:
    if $P810, if_808
.annotate "line", 291
    .const 'Sub' $P818 = "57_1260829329.07487" 
    capture_lex $P818
    $P818()
    goto if_808_end
  if_808:
.annotate "line", 288
    find_lex $P811, "$/"
    unless_null $P811, vivify_305
    new $P811, "Hash"
  vivify_305:
    set $P812, $P811["postcircumfix"]
    unless_null $P812, vivify_306
    new $P812, "Undef"
  vivify_306:
    $P813 = $P812."ast"()
    store_lex "$past", $P813
.annotate "line", 289
    find_lex $P814, "$past"
    get_hll_global $P815, ["PAST"], "Var"
    $P816 = $P815."new"("$/" :named("name"))
    $P814."unshift"($P816)
  if_808_end:
.annotate "line", 320
    find_lex $P887, "$/"
    find_lex $P888, "$past"
    $P889 = $P887."!make"($P888)
.annotate "line", 285
    .return ($P889)
  control_803:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P890, exception, "payload"
    .return ($P890)
.end


.namespace ["NQP";"Actions"]
.sub "_block817"  :anon :subid("57_1260829329.07487") :outer("56_1260829329.07487")
.annotate "line", 292
    new $P819, "ResizablePMCArray"
    .lex "@name", $P819
    get_hll_global $P820, ["NQP"], "Compiler"
    find_lex $P821, "$/"
    set $S822, $P821
    $P823 = $P820."parse_name"($S822)
    store_lex "@name", $P823
.annotate "line", 293
    get_hll_global $P824, ["PAST"], "Var"
    find_lex $P825, "@name"
    $P826 = $P825."pop"()
    set $S827, $P826
    $P828 = $P824."new"($S827 :named("name"))
    store_lex "$past", $P828
.annotate "line", 294
    find_lex $P830, "@name"
    unless $P830, if_829_end
.annotate "line", 295
    find_lex $P832, "@name"
    unless_null $P832, vivify_289
    new $P832, "ResizablePMCArray"
  vivify_289:
    set $P833, $P832[0]
    unless_null $P833, vivify_290
    new $P833, "Undef"
  vivify_290:
    set $S834, $P833
    iseq $I835, $S834, "GLOBAL"
    unless $I835, if_831_end
    find_lex $P836, "@name"
    $P836."shift"()
  if_831_end:
.annotate "line", 296
    find_lex $P837, "$past"
    find_lex $P838, "@name"
    $P837."namespace"($P838)
.annotate "line", 297
    find_lex $P839, "$past"
    $P839."scope"("package")
.annotate "line", 298
    find_lex $P840, "$past"
    find_lex $P841, "$/"
    unless_null $P841, vivify_291
    new $P841, "Hash"
  vivify_291:
    set $P842, $P841["sigil"]
    unless_null $P842, vivify_292
    new $P842, "Undef"
  vivify_292:
    $P843 = "sigiltype"($P842)
    $P840."viviself"($P843)
.annotate "line", 299
    find_lex $P844, "$past"
    $P844."lvalue"(1)
  if_829_end:
.annotate "line", 301
    find_lex $P847, "$/"
    unless_null $P847, vivify_293
    new $P847, "Hash"
  vivify_293:
    set $P848, $P847["twigil"]
    unless_null $P848, vivify_294
    new $P848, "ResizablePMCArray"
  vivify_294:
    set $P849, $P848[0]
    unless_null $P849, vivify_295
    new $P849, "Undef"
  vivify_295:
    set $S850, $P849
    iseq $I851, $S850, "*"
    if $I851, if_846
.annotate "line", 314
    find_lex $P873, "$/"
    unless_null $P873, vivify_296
    new $P873, "Hash"
  vivify_296:
    set $P874, $P873["twigil"]
    unless_null $P874, vivify_297
    new $P874, "ResizablePMCArray"
  vivify_297:
    set $P875, $P874[0]
    unless_null $P875, vivify_298
    new $P875, "Undef"
  vivify_298:
    set $S876, $P875
    iseq $I877, $S876, "!"
    if $I877, if_872
    new $P871, 'Integer'
    set $P871, $I877
    goto if_872_end
  if_872:
.annotate "line", 315
    find_lex $P878, "$past"
    get_hll_global $P879, ["PAST"], "Var"
    $P880 = $P879."new"("self" :named("name"))
    $P878."push"($P880)
.annotate "line", 316
    find_lex $P881, "$past"
    $P881."scope"("attribute")
.annotate "line", 317
    find_lex $P882, "$past"
    find_lex $P883, "$/"
    unless_null $P883, vivify_299
    new $P883, "Hash"
  vivify_299:
    set $P884, $P883["sigil"]
    unless_null $P884, vivify_300
    new $P884, "Undef"
  vivify_300:
    $P885 = "sigiltype"($P884)
    $P886 = $P882."viviself"($P885)
.annotate "line", 314
    set $P871, $P886
  if_872_end:
    set $P845, $P871
.annotate "line", 301
    goto if_846_end
  if_846:
.annotate "line", 302
    find_lex $P852, "$past"
    $P852."scope"("contextual")
.annotate "line", 303
    find_lex $P853, "$past"
.annotate "line", 304
    get_hll_global $P854, ["PAST"], "Var"
.annotate "line", 306
    find_lex $P855, "$/"
    unless_null $P855, vivify_301
    new $P855, "Hash"
  vivify_301:
    set $P856, $P855["sigil"]
    unless_null $P856, vivify_302
    new $P856, "Undef"
  vivify_302:
    set $S857, $P856
    new $P858, 'String'
    set $P858, $S857
    find_lex $P859, "$/"
    unless_null $P859, vivify_303
    new $P859, "Hash"
  vivify_303:
    set $P860, $P859["desigilname"]
    unless_null $P860, vivify_304
    new $P860, "Undef"
  vivify_304:
    concat $P861, $P858, $P860
.annotate "line", 308
    get_hll_global $P862, ["PAST"], "Op"
    new $P863, "String"
    assign $P863, "Contextual "
    find_lex $P864, "$/"
    set $S865, $P864
    concat $P866, $P863, $S865
    concat $P867, $P866, " not found"
    $P868 = $P862."new"($P867, "die" :named("pirop"))
    $P869 = $P854."new"("package" :named("scope"), "" :named("namespace"), $P861 :named("name"), $P868 :named("viviself"))
.annotate "line", 304
    $P870 = $P853."viviself"($P869)
.annotate "line", 301
    set $P845, $P870
  if_846_end:
.annotate "line", 291
    .return ($P845)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<module>"  :subid("58_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_894
.annotate "line", 323
    new $P893, 'ExceptionHandler'
    set_addr $P893, control_892
    $P893."handle_types"(58)
    push_eh $P893
    .lex "self", self
    .lex "$/", param_894
    find_lex $P895, "$/"
    find_lex $P896, "$/"
    unless_null $P896, vivify_307
    new $P896, "Hash"
  vivify_307:
    set $P897, $P896["package_def"]
    unless_null $P897, vivify_308
    new $P897, "Undef"
  vivify_308:
    $P898 = $P897."ast"()
    $P899 = $P895."!make"($P898)
    .return ($P899)
  control_892:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P900, exception, "payload"
    .return ($P900)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<class>"  :subid("59_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_904
.annotate "line", 324
    new $P903, 'ExceptionHandler'
    set_addr $P903, control_902
    $P903."handle_types"(58)
    push_eh $P903
    .lex "self", self
    .lex "$/", param_904
.annotate "line", 325
    new $P905, "Undef"
    .lex "$past", $P905
.annotate "line", 326
    new $P906, "Undef"
    .lex "$classinit", $P906
.annotate "line", 335
    new $P907, "Undef"
    .lex "$parent", $P907
.annotate "line", 325
    find_lex $P908, "$/"
    unless_null $P908, vivify_309
    new $P908, "Hash"
  vivify_309:
    set $P909, $P908["package_def"]
    unless_null $P909, vivify_310
    new $P909, "Undef"
  vivify_310:
    $P910 = $P909."ast"()
    store_lex "$past", $P910
.annotate "line", 327
    get_hll_global $P911, ["PAST"], "Op"
.annotate "line", 328
    get_hll_global $P912, ["PAST"], "Op"
    $P913 = $P912."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate "line", 331
    find_lex $P914, "$/"
    unless_null $P914, vivify_311
    new $P914, "Hash"
  vivify_311:
    set $P915, $P914["package_def"]
    unless_null $P915, vivify_312
    new $P915, "Hash"
  vivify_312:
    set $P916, $P915["name"]
    unless_null $P916, vivify_313
    new $P916, "Undef"
  vivify_313:
    set $S917, $P916
    $P918 = $P911."new"($P913, $S917, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 327
    store_lex "$classinit", $P918
.annotate "line", 335
    find_lex $P921, "$/"
    unless_null $P921, vivify_314
    new $P921, "Hash"
  vivify_314:
    set $P922, $P921["package_def"]
    unless_null $P922, vivify_315
    new $P922, "Hash"
  vivify_315:
    set $P923, $P922["parent"]
    unless_null $P923, vivify_316
    new $P923, "ResizablePMCArray"
  vivify_316:
    set $P924, $P923[0]
    unless_null $P924, vivify_317
    new $P924, "Undef"
  vivify_317:
    set $S925, $P924
    unless $S925, unless_920
    new $P919, 'String'
    set $P919, $S925
    goto unless_920_end
  unless_920:
.annotate "line", 336
    find_lex $P928, "$/"
    unless_null $P928, vivify_318
    new $P928, "Hash"
  vivify_318:
    set $P929, $P928["sym"]
    unless_null $P929, vivify_319
    new $P929, "Undef"
  vivify_319:
    set $S930, $P929
    iseq $I931, $S930, "grammar"
    if $I931, if_927
    new $P933, "String"
    assign $P933, ""
    set $P926, $P933
    goto if_927_end
  if_927:
    new $P932, "String"
    assign $P932, "Regex::Cursor"
    set $P926, $P932
  if_927_end:
    set $P919, $P926
  unless_920_end:
    store_lex "$parent", $P919
.annotate "line", 337
    find_lex $P935, "$parent"
    unless $P935, if_934_end
.annotate "line", 338
    find_lex $P936, "$classinit"
    get_hll_global $P937, ["PAST"], "Val"
    find_lex $P938, "$parent"
    $P939 = $P937."new"($P938 :named("value"), "parent" :named("named"))
    $P936."push"($P939)
  if_934_end:
.annotate "line", 340
    find_lex $P941, "$past"
    unless_null $P941, vivify_320
    new $P941, "Hash"
  vivify_320:
    set $P942, $P941["attributes"]
    unless_null $P942, vivify_321
    new $P942, "Undef"
  vivify_321:
    unless $P942, if_940_end
.annotate "line", 341
    find_lex $P943, "$classinit"
    find_lex $P944, "$past"
    unless_null $P944, vivify_322
    new $P944, "Hash"
  vivify_322:
    set $P945, $P944["attributes"]
    unless_null $P945, vivify_323
    new $P945, "Undef"
  vivify_323:
    $P943."push"($P945)
  if_940_end:
.annotate "line", 343
    get_global $P946, "@BLOCK"
    unless_null $P946, vivify_324
    new $P946, "ResizablePMCArray"
  vivify_324:
    set $P947, $P946[0]
    unless_null $P947, vivify_325
    new $P947, "Undef"
  vivify_325:
    $P948 = $P947."loadinit"()
    find_lex $P949, "$classinit"
    $P948."push"($P949)
.annotate "line", 344
    find_lex $P950, "$/"
    find_lex $P951, "$past"
    $P952 = $P950."!make"($P951)
.annotate "line", 324
    .return ($P952)
  control_902:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P953, exception, "payload"
    .return ($P953)
.end


.namespace ["NQP";"Actions"]
.sub "package_def"  :subid("60_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_957
.annotate "line", 347
    new $P956, 'ExceptionHandler'
    set_addr $P956, control_955
    $P956."handle_types"(58)
    push_eh $P956
    .lex "self", self
    .lex "$/", param_957
.annotate "line", 348
    new $P958, "Undef"
    .lex "$past", $P958
    find_lex $P961, "$/"
    unless_null $P961, vivify_326
    new $P961, "Hash"
  vivify_326:
    set $P962, $P961["block"]
    unless_null $P962, vivify_327
    new $P962, "Undef"
  vivify_327:
    if $P962, if_960
    find_lex $P966, "$/"
    unless_null $P966, vivify_328
    new $P966, "Hash"
  vivify_328:
    set $P967, $P966["comp_unit"]
    unless_null $P967, vivify_329
    new $P967, "Undef"
  vivify_329:
    $P968 = $P967."ast"()
    set $P959, $P968
    goto if_960_end
  if_960:
    find_lex $P963, "$/"
    unless_null $P963, vivify_330
    new $P963, "Hash"
  vivify_330:
    set $P964, $P963["block"]
    unless_null $P964, vivify_331
    new $P964, "Undef"
  vivify_331:
    $P965 = $P964."ast"()
    set $P959, $P965
  if_960_end:
    store_lex "$past", $P959
.annotate "line", 349
    find_lex $P969, "$past"
    find_lex $P970, "$/"
    unless_null $P970, vivify_332
    new $P970, "Hash"
  vivify_332:
    set $P971, $P970["name"]
    unless_null $P971, vivify_333
    new $P971, "Hash"
  vivify_333:
    set $P972, $P971["identifier"]
    unless_null $P972, vivify_334
    new $P972, "Undef"
  vivify_334:
    $P969."namespace"($P972)
.annotate "line", 350
    find_lex $P973, "$past"
    $P973."blocktype"("immediate")
.annotate "line", 351
    find_lex $P974, "$/"
    find_lex $P975, "$past"
    $P976 = $P974."!make"($P975)
.annotate "line", 347
    .return ($P976)
  control_955:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P977, exception, "payload"
    .return ($P977)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<my>"  :subid("61_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_981
.annotate "line", 354
    new $P980, 'ExceptionHandler'
    set_addr $P980, control_979
    $P980."handle_types"(58)
    push_eh $P980
    .lex "self", self
    .lex "$/", param_981
    find_lex $P982, "$/"
    find_lex $P983, "$/"
    unless_null $P983, vivify_335
    new $P983, "Hash"
  vivify_335:
    set $P984, $P983["scoped"]
    unless_null $P984, vivify_336
    new $P984, "Undef"
  vivify_336:
    $P985 = $P984."ast"()
    $P986 = $P982."!make"($P985)
    .return ($P986)
  control_979:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P987, exception, "payload"
    .return ($P987)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<our>"  :subid("62_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_991
.annotate "line", 355
    new $P990, 'ExceptionHandler'
    set_addr $P990, control_989
    $P990."handle_types"(58)
    push_eh $P990
    .lex "self", self
    .lex "$/", param_991
    find_lex $P992, "$/"
    find_lex $P993, "$/"
    unless_null $P993, vivify_337
    new $P993, "Hash"
  vivify_337:
    set $P994, $P993["scoped"]
    unless_null $P994, vivify_338
    new $P994, "Undef"
  vivify_338:
    $P995 = $P994."ast"()
    $P996 = $P992."!make"($P995)
    .return ($P996)
  control_989:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P997, exception, "payload"
    .return ($P997)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<has>"  :subid("63_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1001
.annotate "line", 356
    new $P1000, 'ExceptionHandler'
    set_addr $P1000, control_999
    $P1000."handle_types"(58)
    push_eh $P1000
    .lex "self", self
    .lex "$/", param_1001
    find_lex $P1002, "$/"
    find_lex $P1003, "$/"
    unless_null $P1003, vivify_339
    new $P1003, "Hash"
  vivify_339:
    set $P1004, $P1003["scoped"]
    unless_null $P1004, vivify_340
    new $P1004, "Undef"
  vivify_340:
    $P1005 = $P1004."ast"()
    $P1006 = $P1002."!make"($P1005)
    .return ($P1006)
  control_999:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1007, exception, "payload"
    .return ($P1007)
.end


.namespace ["NQP";"Actions"]
.sub "scoped"  :subid("64_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1011
.annotate "line", 358
    new $P1010, 'ExceptionHandler'
    set_addr $P1010, control_1009
    $P1010."handle_types"(58)
    push_eh $P1010
    .lex "self", self
    .lex "$/", param_1011
.annotate "line", 359
    find_lex $P1012, "$/"
.annotate "line", 360
    find_lex $P1015, "$/"
    unless_null $P1015, vivify_341
    new $P1015, "Hash"
  vivify_341:
    set $P1016, $P1015["routine_declarator"]
    unless_null $P1016, vivify_342
    new $P1016, "Undef"
  vivify_342:
    if $P1016, if_1014
.annotate "line", 361
    find_lex $P1020, "$/"
    unless_null $P1020, vivify_343
    new $P1020, "Hash"
  vivify_343:
    set $P1021, $P1020["variable_declarator"]
    unless_null $P1021, vivify_344
    new $P1021, "Undef"
  vivify_344:
    $P1022 = $P1021."ast"()
    set $P1013, $P1022
.annotate "line", 360
    goto if_1014_end
  if_1014:
    find_lex $P1017, "$/"
    unless_null $P1017, vivify_345
    new $P1017, "Hash"
  vivify_345:
    set $P1018, $P1017["routine_declarator"]
    unless_null $P1018, vivify_346
    new $P1018, "Undef"
  vivify_346:
    $P1019 = $P1018."ast"()
    set $P1013, $P1019
  if_1014_end:
    $P1023 = $P1012."!make"($P1013)
.annotate "line", 358
    .return ($P1023)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1024, exception, "payload"
    .return ($P1024)
.end


.namespace ["NQP";"Actions"]
.sub "variable_declarator"  :subid("65_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1028
.annotate "line", 364
    .const 'Sub' $P1068 = "66_1260829329.07487" 
    capture_lex $P1068
    new $P1027, 'ExceptionHandler'
    set_addr $P1027, control_1026
    $P1027."handle_types"(58)
    push_eh $P1027
    .lex "self", self
    .lex "$/", param_1028
.annotate "line", 365
    new $P1029, "Undef"
    .lex "$past", $P1029
.annotate "line", 366
    new $P1030, "Undef"
    .lex "$sigil", $P1030
.annotate "line", 367
    new $P1031, "Undef"
    .lex "$name", $P1031
.annotate "line", 368
    new $P1032, "Undef"
    .lex "$BLOCK", $P1032
.annotate "line", 365
    find_lex $P1033, "$/"
    unless_null $P1033, vivify_347
    new $P1033, "Hash"
  vivify_347:
    set $P1034, $P1033["variable"]
    unless_null $P1034, vivify_348
    new $P1034, "Undef"
  vivify_348:
    $P1035 = $P1034."ast"()
    store_lex "$past", $P1035
.annotate "line", 366
    find_lex $P1036, "$/"
    unless_null $P1036, vivify_349
    new $P1036, "Hash"
  vivify_349:
    set $P1037, $P1036["variable"]
    unless_null $P1037, vivify_350
    new $P1037, "Hash"
  vivify_350:
    set $P1038, $P1037["sigil"]
    unless_null $P1038, vivify_351
    new $P1038, "Undef"
  vivify_351:
    store_lex "$sigil", $P1038
.annotate "line", 367
    find_lex $P1039, "$past"
    $P1040 = $P1039."name"()
    store_lex "$name", $P1040
.annotate "line", 368
    get_global $P1041, "@BLOCK"
    unless_null $P1041, vivify_352
    new $P1041, "ResizablePMCArray"
  vivify_352:
    set $P1042, $P1041[0]
    unless_null $P1042, vivify_353
    new $P1042, "Undef"
  vivify_353:
    store_lex "$BLOCK", $P1042
.annotate "line", 369
    find_lex $P1044, "$BLOCK"
    find_lex $P1045, "$name"
    $P1046 = $P1044."symbol"($P1045)
    unless $P1046, if_1043_end
.annotate "line", 370
    find_lex $P1047, "$/"
    $P1048 = $P1047."CURSOR"()
    find_lex $P1049, "$name"
    $P1048."panic"("Redeclaration of symbol ", $P1049)
  if_1043_end:
.annotate "line", 372
    find_dynamic_lex $P1051, "$*SCOPE"
    unless_null $P1051, vivify_354
    get_hll_global $P1051, "$SCOPE"
    unless_null $P1051, vivify_355
    die "Contextual $*SCOPE not found"
  vivify_355:
  vivify_354:
    set $S1052, $P1051
    iseq $I1053, $S1052, "has"
    if $I1053, if_1050
.annotate "line", 381
    .const 'Sub' $P1068 = "66_1260829329.07487" 
    capture_lex $P1068
    $P1068()
    goto if_1050_end
  if_1050:
.annotate "line", 373
    find_lex $P1054, "$BLOCK"
    find_lex $P1055, "$name"
    $P1054."symbol"($P1055, "attribute" :named("scope"))
.annotate "line", 374
    find_lex $P1057, "$BLOCK"
    unless_null $P1057, vivify_360
    new $P1057, "Hash"
  vivify_360:
    set $P1058, $P1057["attributes"]
    unless_null $P1058, vivify_361
    new $P1058, "Undef"
  vivify_361:
    if $P1058, unless_1056_end
.annotate "line", 376
    get_hll_global $P1059, ["PAST"], "Op"
    $P1060 = $P1059."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P1061, "$BLOCK"
    unless_null $P1061, vivify_362
    new $P1061, "Hash"
    store_lex "$BLOCK", $P1061
  vivify_362:
    set $P1061["attributes"], $P1060
  unless_1056_end:
.annotate "line", 378
    find_lex $P1062, "$BLOCK"
    unless_null $P1062, vivify_363
    new $P1062, "Hash"
  vivify_363:
    set $P1063, $P1062["attributes"]
    unless_null $P1063, vivify_364
    new $P1063, "Undef"
  vivify_364:
    find_lex $P1064, "$name"
    $P1063."push"($P1064)
.annotate "line", 379
    get_hll_global $P1065, ["PAST"], "Stmts"
    $P1066 = $P1065."new"()
    store_lex "$past", $P1066
  if_1050_end:
.annotate "line", 389
    find_lex $P1092, "$/"
    find_lex $P1093, "$past"
    $P1094 = $P1092."!make"($P1093)
.annotate "line", 364
    .return ($P1094)
  control_1026:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1095, exception, "payload"
    .return ($P1095)
.end


.namespace ["NQP";"Actions"]
.sub "_block1067"  :anon :subid("66_1260829329.07487") :outer("65_1260829329.07487")
.annotate "line", 382
    new $P1069, "Undef"
    .lex "$scope", $P1069
.annotate "line", 383
    new $P1070, "Undef"
    .lex "$decl", $P1070
.annotate "line", 382
    find_dynamic_lex $P1073, "$*SCOPE"
    unless_null $P1073, vivify_356
    get_hll_global $P1073, "$SCOPE"
    unless_null $P1073, vivify_357
    die "Contextual $*SCOPE not found"
  vivify_357:
  vivify_356:
    set $S1074, $P1073
    iseq $I1075, $S1074, "our"
    if $I1075, if_1072
    new $P1077, "String"
    assign $P1077, "lexical"
    set $P1071, $P1077
    goto if_1072_end
  if_1072:
    new $P1076, "String"
    assign $P1076, "package"
    set $P1071, $P1076
  if_1072_end:
    store_lex "$scope", $P1071
.annotate "line", 383
    get_hll_global $P1078, ["PAST"], "Var"
    find_lex $P1079, "$name"
    find_lex $P1080, "$scope"
.annotate "line", 384
    find_lex $P1081, "$sigil"
    $P1082 = "sigiltype"($P1081)
    find_lex $P1083, "$/"
    $P1084 = $P1078."new"($P1079 :named("name"), $P1080 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P1082 :named("viviself"), $P1083 :named("node"))
.annotate "line", 383
    store_lex "$decl", $P1084
.annotate "line", 386
    find_lex $P1085, "$BLOCK"
    find_lex $P1086, "$name"
    find_lex $P1087, "$scope"
    $P1085."symbol"($P1086, $P1087 :named("scope"))
.annotate "line", 387
    find_lex $P1088, "$BLOCK"
    unless_null $P1088, vivify_358
    new $P1088, "ResizablePMCArray"
  vivify_358:
    set $P1089, $P1088[0]
    unless_null $P1089, vivify_359
    new $P1089, "Undef"
  vivify_359:
    find_lex $P1090, "$decl"
    $P1091 = $P1089."push"($P1090)
.annotate "line", 381
    .return ($P1091)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<sub>"  :subid("67_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1099
.annotate "line", 392
    new $P1098, 'ExceptionHandler'
    set_addr $P1098, control_1097
    $P1098."handle_types"(58)
    push_eh $P1098
    .lex "self", self
    .lex "$/", param_1099
    find_lex $P1100, "$/"
    find_lex $P1101, "$/"
    unless_null $P1101, vivify_365
    new $P1101, "Hash"
  vivify_365:
    set $P1102, $P1101["routine_def"]
    unless_null $P1102, vivify_366
    new $P1102, "Undef"
  vivify_366:
    $P1103 = $P1102."ast"()
    $P1104 = $P1100."!make"($P1103)
    .return ($P1104)
  control_1097:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1105, exception, "payload"
    .return ($P1105)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<method>"  :subid("68_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1109
.annotate "line", 393
    new $P1108, 'ExceptionHandler'
    set_addr $P1108, control_1107
    $P1108."handle_types"(58)
    push_eh $P1108
    .lex "self", self
    .lex "$/", param_1109
    find_lex $P1110, "$/"
    find_lex $P1111, "$/"
    unless_null $P1111, vivify_367
    new $P1111, "Hash"
  vivify_367:
    set $P1112, $P1111["method_def"]
    unless_null $P1112, vivify_368
    new $P1112, "Undef"
  vivify_368:
    $P1113 = $P1112."ast"()
    $P1114 = $P1110."!make"($P1113)
    .return ($P1114)
  control_1107:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1115, exception, "payload"
    .return ($P1115)
.end


.namespace ["NQP";"Actions"]
.sub "routine_def"  :subid("69_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1119
.annotate "line", 395
    .const 'Sub' $P1130 = "70_1260829329.07487" 
    capture_lex $P1130
    new $P1118, 'ExceptionHandler'
    set_addr $P1118, control_1117
    $P1118."handle_types"(58)
    push_eh $P1118
    .lex "self", self
    .lex "$/", param_1119
.annotate "line", 396
    new $P1120, "Undef"
    .lex "$past", $P1120
    find_lex $P1121, "$/"
    unless_null $P1121, vivify_369
    new $P1121, "Hash"
  vivify_369:
    set $P1122, $P1121["blockoid"]
    unless_null $P1122, vivify_370
    new $P1122, "Undef"
  vivify_370:
    $P1123 = $P1122."ast"()
    store_lex "$past", $P1123
.annotate "line", 397
    find_lex $P1124, "$past"
    $P1124."blocktype"("declaration")
.annotate "line", 398
    find_lex $P1125, "$past"
    $P1125."control"("return_pir")
.annotate "line", 399
    find_lex $P1127, "$/"
    unless_null $P1127, vivify_371
    new $P1127, "Hash"
  vivify_371:
    set $P1128, $P1127["deflongname"]
    unless_null $P1128, vivify_372
    new $P1128, "Undef"
  vivify_372:
    unless $P1128, if_1126_end
    .const 'Sub' $P1130 = "70_1260829329.07487" 
    capture_lex $P1130
    $P1130()
  if_1126_end:
.annotate "line", 409
    find_lex $P1162, "$/"
    find_lex $P1163, "$past"
    $P1164 = $P1162."!make"($P1163)
.annotate "line", 395
    .return ($P1164)
  control_1117:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1165, exception, "payload"
    .return ($P1165)
.end


.namespace ["NQP";"Actions"]
.sub "_block1129"  :anon :subid("70_1260829329.07487") :outer("69_1260829329.07487")
.annotate "line", 400
    new $P1131, "Undef"
    .lex "$name", $P1131
    find_lex $P1132, "$/"
    unless_null $P1132, vivify_373
    new $P1132, "Hash"
  vivify_373:
    set $P1133, $P1132["sigil"]
    unless_null $P1133, vivify_374
    new $P1133, "ResizablePMCArray"
  vivify_374:
    set $P1134, $P1133[0]
    unless_null $P1134, vivify_375
    new $P1134, "Undef"
  vivify_375:
    set $S1135, $P1134
    new $P1136, 'String'
    set $P1136, $S1135
    find_lex $P1137, "$/"
    unless_null $P1137, vivify_376
    new $P1137, "Hash"
  vivify_376:
    set $P1138, $P1137["deflongname"]
    unless_null $P1138, vivify_377
    new $P1138, "ResizablePMCArray"
  vivify_377:
    set $P1139, $P1138[0]
    unless_null $P1139, vivify_378
    new $P1139, "Undef"
  vivify_378:
    $S1140 = $P1139."ast"()
    concat $P1141, $P1136, $S1140
    store_lex "$name", $P1141
.annotate "line", 401
    find_lex $P1142, "$past"
    find_lex $P1143, "$name"
    $P1142."name"($P1143)
.annotate "line", 402
    find_dynamic_lex $P1146, "$*SCOPE"
    unless_null $P1146, vivify_379
    get_hll_global $P1146, "$SCOPE"
    unless_null $P1146, vivify_380
    die "Contextual $*SCOPE not found"
  vivify_380:
  vivify_379:
    set $S1147, $P1146
    isne $I1148, $S1147, "our"
    if $I1148, if_1145
    new $P1144, 'Integer'
    set $P1144, $I1148
    goto if_1145_end
  if_1145:
.annotate "line", 403
    get_global $P1149, "@BLOCK"
    unless_null $P1149, vivify_381
    new $P1149, "ResizablePMCArray"
  vivify_381:
    set $P1150, $P1149[0]
    unless_null $P1150, vivify_382
    new $P1150, "ResizablePMCArray"
  vivify_382:
    set $P1151, $P1150[0]
    unless_null $P1151, vivify_383
    new $P1151, "Undef"
  vivify_383:
    get_hll_global $P1152, ["PAST"], "Var"
    find_lex $P1153, "$name"
    find_lex $P1154, "$past"
    $P1155 = $P1152."new"($P1153 :named("name"), 1 :named("isdecl"), $P1154 :named("viviself"), "lexical" :named("scope"))
    $P1151."push"($P1155)
.annotate "line", 405
    get_global $P1156, "@BLOCK"
    unless_null $P1156, vivify_384
    new $P1156, "ResizablePMCArray"
  vivify_384:
    set $P1157, $P1156[0]
    unless_null $P1157, vivify_385
    new $P1157, "Undef"
  vivify_385:
    find_lex $P1158, "$name"
    $P1157."symbol"($P1158, "lexical" :named("scope"))
.annotate "line", 406
    get_hll_global $P1159, ["PAST"], "Var"
    find_lex $P1160, "$name"
    $P1161 = $P1159."new"($P1160 :named("name"))
    store_lex "$past", $P1161
.annotate "line", 402
    set $P1144, $P1161
  if_1145_end:
.annotate "line", 399
    .return ($P1144)
.end


.namespace ["NQP";"Actions"]
.sub "method_def"  :subid("71_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1169
.annotate "line", 413
    .const 'Sub' $P1185 = "72_1260829329.07487" 
    capture_lex $P1185
    new $P1168, 'ExceptionHandler'
    set_addr $P1168, control_1167
    $P1168."handle_types"(58)
    push_eh $P1168
    .lex "self", self
    .lex "$/", param_1169
.annotate "line", 414
    new $P1170, "Undef"
    .lex "$past", $P1170
    find_lex $P1171, "$/"
    unless_null $P1171, vivify_386
    new $P1171, "Hash"
  vivify_386:
    set $P1172, $P1171["blockoid"]
    unless_null $P1172, vivify_387
    new $P1172, "Undef"
  vivify_387:
    $P1173 = $P1172."ast"()
    store_lex "$past", $P1173
.annotate "line", 415
    find_lex $P1174, "$past"
    $P1174."blocktype"("method")
.annotate "line", 416
    find_lex $P1175, "$past"
    $P1175."control"("return_pir")
.annotate "line", 417
    find_lex $P1176, "$past"
    unless_null $P1176, vivify_388
    new $P1176, "ResizablePMCArray"
  vivify_388:
    set $P1177, $P1176[0]
    unless_null $P1177, vivify_389
    new $P1177, "Undef"
  vivify_389:
    get_hll_global $P1178, ["PAST"], "Op"
    $P1179 = $P1178."new"("    .lex \"self\", self" :named("inline"))
    $P1177."unshift"($P1179)
.annotate "line", 418
    find_lex $P1180, "$past"
    $P1180."symbol"("self", "lexical" :named("scope"))
.annotate "line", 419
    find_lex $P1182, "$/"
    unless_null $P1182, vivify_390
    new $P1182, "Hash"
  vivify_390:
    set $P1183, $P1182["deflongname"]
    unless_null $P1183, vivify_391
    new $P1183, "Undef"
  vivify_391:
    unless $P1183, if_1181_end
    .const 'Sub' $P1185 = "72_1260829329.07487" 
    capture_lex $P1185
    $P1185()
  if_1181_end:
.annotate "line", 423
    find_lex $P1196, "$/"
    find_lex $P1197, "$past"
    $P1198 = $P1196."!make"($P1197)
.annotate "line", 413
    .return ($P1198)
  control_1167:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1199, exception, "payload"
    .return ($P1199)
.end


.namespace ["NQP";"Actions"]
.sub "_block1184"  :anon :subid("72_1260829329.07487") :outer("71_1260829329.07487")
.annotate "line", 420
    new $P1186, "Undef"
    .lex "$name", $P1186
    find_lex $P1187, "$/"
    unless_null $P1187, vivify_392
    new $P1187, "Hash"
  vivify_392:
    set $P1188, $P1187["deflongname"]
    unless_null $P1188, vivify_393
    new $P1188, "ResizablePMCArray"
  vivify_393:
    set $P1189, $P1188[0]
    unless_null $P1189, vivify_394
    new $P1189, "Undef"
  vivify_394:
    $P1190 = $P1189."ast"()
    set $S1191, $P1190
    new $P1192, 'String'
    set $P1192, $S1191
    store_lex "$name", $P1192
.annotate "line", 421
    find_lex $P1193, "$past"
    find_lex $P1194, "$name"
    $P1195 = $P1193."name"($P1194)
.annotate "line", 419
    .return ($P1195)
.end


.namespace ["NQP";"Actions"]
.sub "signature"  :subid("73_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1203
.annotate "line", 427
    .const 'Sub' $P1214 = "74_1260829329.07487" 
    capture_lex $P1214
    new $P1202, 'ExceptionHandler'
    set_addr $P1202, control_1201
    $P1202."handle_types"(58)
    push_eh $P1202
    .lex "self", self
    .lex "$/", param_1203
.annotate "line", 428
    new $P1204, "Undef"
    .lex "$BLOCKINIT", $P1204
    get_global $P1205, "@BLOCK"
    unless_null $P1205, vivify_395
    new $P1205, "ResizablePMCArray"
  vivify_395:
    set $P1206, $P1205[0]
    unless_null $P1206, vivify_396
    new $P1206, "ResizablePMCArray"
  vivify_396:
    set $P1207, $P1206[0]
    unless_null $P1207, vivify_397
    new $P1207, "Undef"
  vivify_397:
    store_lex "$BLOCKINIT", $P1207
.annotate "line", 429
    find_lex $P1209, "$/"
    unless_null $P1209, vivify_398
    new $P1209, "Hash"
  vivify_398:
    set $P1210, $P1209["parameter"]
    unless_null $P1210, vivify_399
    new $P1210, "Undef"
  vivify_399:
    defined $I1211, $P1210
    unless $I1211, for_undef_400
    iter $P1208, $P1210
    new $P1221, 'ExceptionHandler'
    set_addr $P1221, loop1220_handler
    $P1221."handle_types"(65, 67, 66)
    push_eh $P1221
  loop1220_test:
    unless $P1208, loop1220_done
    shift $P1212, $P1208
  loop1220_redo:
    .const 'Sub' $P1214 = "74_1260829329.07487" 
    capture_lex $P1214
    $P1214($P1212)
  loop1220_next:
    goto loop1220_test
  loop1220_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1222, exception, 'type'
    eq $P1222, 65, loop1220_next
    eq $P1222, 67, loop1220_redo
  loop1220_done:
    pop_eh 
  for_undef_400:
.annotate "line", 427
    .return ($P1208)
  control_1201:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1223, exception, "payload"
    .return ($P1223)
.end


.namespace ["NQP";"Actions"]
.sub "_block1213"  :anon :subid("74_1260829329.07487") :outer("73_1260829329.07487")
    .param pmc param_1215
.annotate "line", 429
    .lex "$_", param_1215
    find_lex $P1216, "$BLOCKINIT"
    find_lex $P1217, "$_"
    $P1218 = $P1217."ast"()
    $P1219 = $P1216."push"($P1218)
    .return ($P1219)
.end


.namespace ["NQP";"Actions"]
.sub "parameter"  :subid("75_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1227
.annotate "line", 432
    new $P1226, 'ExceptionHandler'
    set_addr $P1226, control_1225
    $P1226."handle_types"(58)
    push_eh $P1226
    .lex "self", self
    .lex "$/", param_1227
.annotate "line", 433
    new $P1228, "Undef"
    .lex "$quant", $P1228
.annotate "line", 434
    new $P1229, "Undef"
    .lex "$past", $P1229
.annotate "line", 433
    find_lex $P1230, "$/"
    unless_null $P1230, vivify_401
    new $P1230, "Hash"
  vivify_401:
    set $P1231, $P1230["quant"]
    unless_null $P1231, vivify_402
    new $P1231, "Undef"
  vivify_402:
    store_lex "$quant", $P1231
    find_lex $P1232, "$past"
.annotate "line", 435
    find_lex $P1234, "$/"
    unless_null $P1234, vivify_403
    new $P1234, "Hash"
  vivify_403:
    set $P1235, $P1234["named_param"]
    unless_null $P1235, vivify_404
    new $P1235, "Undef"
  vivify_404:
    if $P1235, if_1233
.annotate "line", 442
    find_lex $P1249, "$/"
    unless_null $P1249, vivify_405
    new $P1249, "Hash"
  vivify_405:
    set $P1250, $P1249["param_var"]
    unless_null $P1250, vivify_406
    new $P1250, "Undef"
  vivify_406:
    $P1251 = $P1250."ast"()
    store_lex "$past", $P1251
.annotate "line", 443
    find_lex $P1253, "$quant"
    set $S1254, $P1253
    iseq $I1255, $S1254, "*"
    if $I1255, if_1252
.annotate "line", 447
    find_lex $P1264, "$quant"
    set $S1265, $P1264
    iseq $I1266, $S1265, "?"
    unless $I1266, if_1263_end
.annotate "line", 448
    find_lex $P1267, "$past"
    find_lex $P1268, "$/"
    unless_null $P1268, vivify_407
    new $P1268, "Hash"
  vivify_407:
    set $P1269, $P1268["param_var"]
    unless_null $P1269, vivify_408
    new $P1269, "Hash"
  vivify_408:
    set $P1270, $P1269["sigil"]
    unless_null $P1270, vivify_409
    new $P1270, "Undef"
  vivify_409:
    $P1271 = "sigiltype"($P1270)
    $P1267."viviself"($P1271)
  if_1263_end:
.annotate "line", 447
    goto if_1252_end
  if_1252:
.annotate "line", 444
    find_lex $P1256, "$past"
    $P1256."slurpy"(1)
.annotate "line", 445
    find_lex $P1257, "$past"
    find_lex $P1258, "$/"
    unless_null $P1258, vivify_410
    new $P1258, "Hash"
  vivify_410:
    set $P1259, $P1258["param_var"]
    unless_null $P1259, vivify_411
    new $P1259, "Hash"
  vivify_411:
    set $P1260, $P1259["sigil"]
    unless_null $P1260, vivify_412
    new $P1260, "Undef"
  vivify_412:
    set $S1261, $P1260
    iseq $I1262, $S1261, "%"
    $P1257."named"($I1262)
  if_1252_end:
.annotate "line", 441
    goto if_1233_end
  if_1233:
.annotate "line", 436
    find_lex $P1236, "$/"
    unless_null $P1236, vivify_413
    new $P1236, "Hash"
  vivify_413:
    set $P1237, $P1236["named_param"]
    unless_null $P1237, vivify_414
    new $P1237, "Undef"
  vivify_414:
    $P1238 = $P1237."ast"()
    store_lex "$past", $P1238
.annotate "line", 437
    find_lex $P1240, "$quant"
    set $S1241, $P1240
    isne $I1242, $S1241, "!"
    unless $I1242, if_1239_end
.annotate "line", 438
    find_lex $P1243, "$past"
    find_lex $P1244, "$/"
    unless_null $P1244, vivify_415
    new $P1244, "Hash"
  vivify_415:
    set $P1245, $P1244["named_param"]
    unless_null $P1245, vivify_416
    new $P1245, "Hash"
  vivify_416:
    set $P1246, $P1245["param_var"]
    unless_null $P1246, vivify_417
    new $P1246, "Hash"
  vivify_417:
    set $P1247, $P1246["sigil"]
    unless_null $P1247, vivify_418
    new $P1247, "Undef"
  vivify_418:
    $P1248 = "sigiltype"($P1247)
    $P1243."viviself"($P1248)
  if_1239_end:
  if_1233_end:
.annotate "line", 451
    find_lex $P1273, "$/"
    unless_null $P1273, vivify_419
    new $P1273, "Hash"
  vivify_419:
    set $P1274, $P1273["default_value"]
    unless_null $P1274, vivify_420
    new $P1274, "Undef"
  vivify_420:
    unless $P1274, if_1272_end
.annotate "line", 452
    find_lex $P1276, "$quant"
    set $S1277, $P1276
    iseq $I1278, $S1277, "*"
    unless $I1278, if_1275_end
.annotate "line", 453
    find_lex $P1279, "$/"
    $P1280 = $P1279."CURSOR"()
    $P1280."panic"("Can't put default on slurpy parameter")
  if_1275_end:
.annotate "line", 455
    find_lex $P1282, "$quant"
    set $S1283, $P1282
    iseq $I1284, $S1283, "!"
    unless $I1284, if_1281_end
.annotate "line", 456
    find_lex $P1285, "$/"
    $P1286 = $P1285."CURSOR"()
    $P1286."panic"("Can't put default on required parameter")
  if_1281_end:
.annotate "line", 458
    find_lex $P1287, "$past"
    find_lex $P1288, "$/"
    unless_null $P1288, vivify_421
    new $P1288, "Hash"
  vivify_421:
    set $P1289, $P1288["default_value"]
    unless_null $P1289, vivify_422
    new $P1289, "ResizablePMCArray"
  vivify_422:
    set $P1290, $P1289[0]
    unless_null $P1290, vivify_423
    new $P1290, "Hash"
  vivify_423:
    set $P1291, $P1290["EXPR"]
    unless_null $P1291, vivify_424
    new $P1291, "Undef"
  vivify_424:
    $P1292 = $P1291."ast"()
    $P1287."viviself"($P1292)
  if_1272_end:
.annotate "line", 460
    find_lex $P1294, "$past"
    $P1295 = $P1294."viviself"()
    if $P1295, unless_1293_end
    get_global $P1296, "@BLOCK"
    unless_null $P1296, vivify_425
    new $P1296, "ResizablePMCArray"
  vivify_425:
    set $P1297, $P1296[0]
    unless_null $P1297, vivify_426
    new $P1297, "Undef"
  vivify_426:
    get_global $P1298, "@BLOCK"
    unless_null $P1298, vivify_427
    new $P1298, "ResizablePMCArray"
  vivify_427:
    set $P1299, $P1298[0]
    unless_null $P1299, vivify_428
    new $P1299, "Undef"
  vivify_428:
    $P1300 = $P1299."arity"()
    set $N1301, $P1300
    new $P1302, 'Float'
    set $P1302, $N1301
    add $P1303, $P1302, 1
    $P1297."arity"($P1303)
  unless_1293_end:
.annotate "line", 461
    find_lex $P1304, "$/"
    find_lex $P1305, "$past"
    $P1306 = $P1304."!make"($P1305)
.annotate "line", 432
    .return ($P1306)
  control_1225:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1307, exception, "payload"
    .return ($P1307)
.end


.namespace ["NQP";"Actions"]
.sub "param_var"  :subid("76_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1311
.annotate "line", 464
    new $P1310, 'ExceptionHandler'
    set_addr $P1310, control_1309
    $P1310."handle_types"(58)
    push_eh $P1310
    .lex "self", self
    .lex "$/", param_1311
.annotate "line", 465
    new $P1312, "Undef"
    .lex "$name", $P1312
.annotate "line", 466
    new $P1313, "Undef"
    .lex "$past", $P1313
.annotate "line", 465
    find_lex $P1314, "$/"
    set $S1315, $P1314
    new $P1316, 'String'
    set $P1316, $S1315
    store_lex "$name", $P1316
.annotate "line", 466
    get_hll_global $P1317, ["PAST"], "Var"
    find_lex $P1318, "$name"
    find_lex $P1319, "$/"
    $P1320 = $P1317."new"($P1318 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1319 :named("node"))
    store_lex "$past", $P1320
.annotate "line", 468
    get_global $P1321, "@BLOCK"
    unless_null $P1321, vivify_429
    new $P1321, "ResizablePMCArray"
  vivify_429:
    set $P1322, $P1321[0]
    unless_null $P1322, vivify_430
    new $P1322, "Undef"
  vivify_430:
    find_lex $P1323, "$name"
    $P1322."symbol"($P1323, "lexical" :named("scope"))
.annotate "line", 469
    find_lex $P1324, "$/"
    find_lex $P1325, "$past"
    $P1326 = $P1324."!make"($P1325)
.annotate "line", 464
    .return ($P1326)
  control_1309:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1327, exception, "payload"
    .return ($P1327)
.end


.namespace ["NQP";"Actions"]
.sub "named_param"  :subid("77_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1331
.annotate "line", 472
    new $P1330, 'ExceptionHandler'
    set_addr $P1330, control_1329
    $P1330."handle_types"(58)
    push_eh $P1330
    .lex "self", self
    .lex "$/", param_1331
.annotate "line", 473
    new $P1332, "Undef"
    .lex "$past", $P1332
    find_lex $P1333, "$/"
    unless_null $P1333, vivify_431
    new $P1333, "Hash"
  vivify_431:
    set $P1334, $P1333["param_var"]
    unless_null $P1334, vivify_432
    new $P1334, "Undef"
  vivify_432:
    $P1335 = $P1334."ast"()
    store_lex "$past", $P1335
.annotate "line", 474
    find_lex $P1336, "$past"
    find_lex $P1337, "$/"
    unless_null $P1337, vivify_433
    new $P1337, "Hash"
  vivify_433:
    set $P1338, $P1337["param_var"]
    unless_null $P1338, vivify_434
    new $P1338, "Hash"
  vivify_434:
    set $P1339, $P1338["name"]
    unless_null $P1339, vivify_435
    new $P1339, "Undef"
  vivify_435:
    set $S1340, $P1339
    $P1336."named"($S1340)
.annotate "line", 475
    find_lex $P1341, "$/"
    find_lex $P1342, "$past"
    $P1343 = $P1341."!make"($P1342)
.annotate "line", 472
    .return ($P1343)
  control_1329:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1344, exception, "payload"
    .return ($P1344)
.end


.namespace ["NQP";"Actions"]
.sub "regex_declarator"  :subid("78_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1348
    .param pmc param_1349 :optional
    .param int has_param_1349 :opt_flag
.annotate "line", 478
    .const 'Sub' $P1419 = "80_1260829329.07487" 
    capture_lex $P1419
    .const 'Sub' $P1391 = "79_1260829329.07487" 
    capture_lex $P1391
    new $P1347, 'ExceptionHandler'
    set_addr $P1347, control_1346
    $P1347."handle_types"(58)
    push_eh $P1347
    .lex "self", self
    .lex "$/", param_1348
    if has_param_1349, optparam_436
    new $P1350, "Undef"
    set param_1349, $P1350
  optparam_436:
    .lex "$key", param_1349
.annotate "line", 479
    new $P1351, "ResizablePMCArray"
    .lex "@MODIFIERS", $P1351
.annotate "line", 482
    new $P1352, "Undef"
    .lex "$name", $P1352
.annotate "line", 483
    new $P1353, "Undef"
    .lex "$past", $P1353
.annotate "line", 479

        $P1354 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1354
.annotate "line", 482
    find_lex $P1355, "$/"
    unless_null $P1355, vivify_437
    new $P1355, "Hash"
  vivify_437:
    set $P1356, $P1355["deflongname"]
    unless_null $P1356, vivify_438
    new $P1356, "Undef"
  vivify_438:
    $P1357 = $P1356."ast"()
    set $S1358, $P1357
    new $P1359, 'String'
    set $P1359, $S1358
    store_lex "$name", $P1359
    find_lex $P1360, "$past"
.annotate "line", 484
    find_lex $P1362, "$/"
    unless_null $P1362, vivify_439
    new $P1362, "Hash"
  vivify_439:
    set $P1363, $P1362["proto"]
    unless_null $P1363, vivify_440
    new $P1363, "Undef"
  vivify_440:
    if $P1363, if_1361
.annotate "line", 511
    find_lex $P1387, "$key"
    set $S1388, $P1387
    iseq $I1389, $S1388, "open"
    if $I1389, if_1386
.annotate "line", 524
    .const 'Sub' $P1419 = "80_1260829329.07487" 
    capture_lex $P1419
    $P1419()
    goto if_1386_end
  if_1386:
.annotate "line", 511
    .const 'Sub' $P1391 = "79_1260829329.07487" 
    capture_lex $P1391
    $P1391()
  if_1386_end:
    goto if_1361_end
  if_1361:
.annotate "line", 486
    get_hll_global $P1364, ["PAST"], "Stmts"
.annotate "line", 487
    get_hll_global $P1365, ["PAST"], "Block"
    find_lex $P1366, "$name"
.annotate "line", 488
    get_hll_global $P1367, ["PAST"], "Op"
.annotate "line", 489
    get_hll_global $P1368, ["PAST"], "Var"
    $P1369 = $P1368."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1370, "$name"
    $P1371 = $P1367."new"($P1369, $P1370, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 488
    find_lex $P1372, "$/"
    $P1373 = $P1365."new"($P1371, $P1366 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1372 :named("node"))
.annotate "line", 498
    get_hll_global $P1374, ["PAST"], "Block"
    new $P1375, "String"
    assign $P1375, "!PREFIX__"
    find_lex $P1376, "$name"
    concat $P1377, $P1375, $P1376
.annotate "line", 499
    get_hll_global $P1378, ["PAST"], "Op"
.annotate "line", 500
    get_hll_global $P1379, ["PAST"], "Var"
    $P1380 = $P1379."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1381, "$name"
    $P1382 = $P1378."new"($P1380, $P1381, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 499
    find_lex $P1383, "$/"
    $P1384 = $P1374."new"($P1382, $P1377 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1383 :named("node"))
.annotate "line", 498
    $P1385 = $P1364."new"($P1373, $P1384)
.annotate "line", 486
    store_lex "$past", $P1385
  if_1361_end:
.annotate "line", 538
    find_lex $P1440, "$/"
    find_lex $P1441, "$past"
    $P1442 = $P1440."!make"($P1441)
.annotate "line", 478
    .return ($P1442)
  control_1346:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1443, exception, "payload"
    .return ($P1443)
.end


.namespace ["NQP";"Actions"]
.sub "_block1418"  :anon :subid("80_1260829329.07487") :outer("78_1260829329.07487")
.annotate "line", 525
    new $P1420, "Undef"
    .lex "$regex", $P1420
.annotate "line", 526
    get_hll_global $P1421, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1422, "$/"
    unless_null $P1422, vivify_441
    new $P1422, "Hash"
  vivify_441:
    set $P1423, $P1422["p6regex"]
    unless_null $P1423, vivify_442
    new $P1423, "Undef"
  vivify_442:
    $P1424 = $P1423."ast"()
    get_global $P1425, "@BLOCK"
    $P1426 = $P1425."shift"()
    $P1427 = $P1421($P1424, $P1426)
    store_lex "$regex", $P1427
.annotate "line", 527
    find_lex $P1428, "$regex"
    find_lex $P1429, "$name"
    $P1428."name"($P1429)
.annotate "line", 529
    get_hll_global $P1430, ["PAST"], "Op"
.annotate "line", 531
    get_hll_global $P1431, ["PAST"], "Var"
    new $P1432, "ResizablePMCArray"
    push $P1432, "Regex"
    $P1433 = $P1431."new"("Method" :named("name"), $P1432 :named("namespace"), "package" :named("scope"))
    find_lex $P1434, "$regex"
    $P1435 = $P1430."new"($P1433, $P1434, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate "line", 529
    store_lex "$past", $P1435
.annotate "line", 535
    find_lex $P1436, "$regex"
    find_lex $P1437, "$past"
    unless_null $P1437, vivify_443
    new $P1437, "Hash"
    store_lex "$past", $P1437
  vivify_443:
    set $P1437["sink"], $P1436
.annotate "line", 536
    find_lex $P1438, "@MODIFIERS"
    $P1439 = $P1438."shift"()
.annotate "line", 524
    .return ($P1439)
.end


.namespace ["NQP";"Actions"]
.sub "_block1390"  :anon :subid("79_1260829329.07487") :outer("78_1260829329.07487")
.annotate "line", 512
    new $P1392, "Hash"
    .lex "%h", $P1392
.annotate "line", 511
    find_lex $P1393, "%h"
.annotate "line", 513
    find_lex $P1395, "$/"
    unless_null $P1395, vivify_444
    new $P1395, "Hash"
  vivify_444:
    set $P1396, $P1395["sym"]
    unless_null $P1396, vivify_445
    new $P1396, "Undef"
  vivify_445:
    set $S1397, $P1396
    iseq $I1398, $S1397, "token"
    unless $I1398, if_1394_end
    new $P1399, "Integer"
    assign $P1399, 1
    find_lex $P1400, "%h"
    unless_null $P1400, vivify_446
    new $P1400, "Hash"
    store_lex "%h", $P1400
  vivify_446:
    set $P1400["r"], $P1399
  if_1394_end:
.annotate "line", 514
    find_lex $P1402, "$/"
    unless_null $P1402, vivify_447
    new $P1402, "Hash"
  vivify_447:
    set $P1403, $P1402["sym"]
    unless_null $P1403, vivify_448
    new $P1403, "Undef"
  vivify_448:
    set $S1404, $P1403
    iseq $I1405, $S1404, "rule"
    unless $I1405, if_1401_end
    new $P1406, "Integer"
    assign $P1406, 1
    find_lex $P1407, "%h"
    unless_null $P1407, vivify_449
    new $P1407, "Hash"
    store_lex "%h", $P1407
  vivify_449:
    set $P1407["r"], $P1406
    new $P1408, "Integer"
    assign $P1408, 1
    find_lex $P1409, "%h"
    unless_null $P1409, vivify_450
    new $P1409, "Hash"
    store_lex "%h", $P1409
  vivify_450:
    set $P1409["s"], $P1408
  if_1401_end:
.annotate "line", 515
    find_lex $P1410, "@MODIFIERS"
    find_lex $P1411, "%h"
    $P1410."unshift"($P1411)
.annotate "line", 516

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate "line", 520
    get_global $P1412, "@BLOCK"
    unless_null $P1412, vivify_451
    new $P1412, "ResizablePMCArray"
  vivify_451:
    set $P1413, $P1412[0]
    unless_null $P1413, vivify_452
    new $P1413, "Undef"
  vivify_452:
    $P1413."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate "line", 521
    get_global $P1414, "@BLOCK"
    unless_null $P1414, vivify_453
    new $P1414, "ResizablePMCArray"
  vivify_453:
    set $P1415, $P1414[0]
    unless_null $P1415, vivify_454
    new $P1415, "Undef"
  vivify_454:
    $P1415."symbol"("$/", "lexical" :named("scope"))
.annotate "line", 522
    new $P1416, "Exception"
    set $P1416['type'], 58
    new $P1417, "Integer"
    assign $P1417, 0
    setattribute $P1416, 'payload', $P1417
    throw $P1416
.annotate "line", 511
    .return ()
.end


.namespace ["NQP";"Actions"]
.sub "dotty"  :subid("81_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1447
.annotate "line", 542
    new $P1446, 'ExceptionHandler'
    set_addr $P1446, control_1445
    $P1446."handle_types"(58)
    push_eh $P1446
    .lex "self", self
    .lex "$/", param_1447
.annotate "line", 543
    new $P1448, "Undef"
    .lex "$past", $P1448
    find_lex $P1451, "$/"
    unless_null $P1451, vivify_455
    new $P1451, "Hash"
  vivify_455:
    set $P1452, $P1451["args"]
    unless_null $P1452, vivify_456
    new $P1452, "Undef"
  vivify_456:
    if $P1452, if_1450
    get_hll_global $P1457, ["PAST"], "Op"
    find_lex $P1458, "$/"
    $P1459 = $P1457."new"($P1458 :named("node"))
    set $P1449, $P1459
    goto if_1450_end
  if_1450:
    find_lex $P1453, "$/"
    unless_null $P1453, vivify_457
    new $P1453, "Hash"
  vivify_457:
    set $P1454, $P1453["args"]
    unless_null $P1454, vivify_458
    new $P1454, "ResizablePMCArray"
  vivify_458:
    set $P1455, $P1454[0]
    unless_null $P1455, vivify_459
    new $P1455, "Undef"
  vivify_459:
    $P1456 = $P1455."ast"()
    set $P1449, $P1456
  if_1450_end:
    store_lex "$past", $P1449
.annotate "line", 544
    find_lex $P1460, "$past"
    find_lex $P1463, "$/"
    unless_null $P1463, vivify_460
    new $P1463, "Hash"
  vivify_460:
    set $P1464, $P1463["quote"]
    unless_null $P1464, vivify_461
    new $P1464, "Undef"
  vivify_461:
    if $P1464, if_1462
    find_lex $P1468, "$/"
    unless_null $P1468, vivify_462
    new $P1468, "Hash"
  vivify_462:
    set $P1469, $P1468["longname"]
    unless_null $P1469, vivify_463
    new $P1469, "Undef"
  vivify_463:
    set $S1470, $P1469
    new $P1461, 'String'
    set $P1461, $S1470
    goto if_1462_end
  if_1462:
    find_lex $P1465, "$/"
    unless_null $P1465, vivify_464
    new $P1465, "Hash"
  vivify_464:
    set $P1466, $P1465["quote"]
    unless_null $P1466, vivify_465
    new $P1466, "Undef"
  vivify_465:
    $P1467 = $P1466."ast"()
    set $P1461, $P1467
  if_1462_end:
    $P1460."name"($P1461)
.annotate "line", 545
    find_lex $P1471, "$past"
    $P1471."pasttype"("callmethod")
.annotate "line", 546
    find_lex $P1472, "$/"
    find_lex $P1473, "$past"
    $P1474 = $P1472."!make"($P1473)
.annotate "line", 542
    .return ($P1474)
  control_1445:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1475, exception, "payload"
    .return ($P1475)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<self>"  :subid("82_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1479
.annotate "line", 551
    new $P1478, 'ExceptionHandler'
    set_addr $P1478, control_1477
    $P1478."handle_types"(58)
    push_eh $P1478
    .lex "self", self
    .lex "$/", param_1479
.annotate "line", 552
    find_lex $P1480, "$/"
    get_hll_global $P1481, ["PAST"], "Var"
    $P1482 = $P1481."new"("self" :named("name"))
    $P1483 = $P1480."!make"($P1482)
.annotate "line", 551
    .return ($P1483)
  control_1477:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1484, exception, "payload"
    .return ($P1484)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<identifier>"  :subid("83_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1488
.annotate "line", 555
    new $P1487, 'ExceptionHandler'
    set_addr $P1487, control_1486
    $P1487."handle_types"(58)
    push_eh $P1487
    .lex "self", self
    .lex "$/", param_1488
.annotate "line", 556
    new $P1489, "Undef"
    .lex "$past", $P1489
    find_lex $P1490, "$/"
    unless_null $P1490, vivify_466
    new $P1490, "Hash"
  vivify_466:
    set $P1491, $P1490["args"]
    unless_null $P1491, vivify_467
    new $P1491, "Undef"
  vivify_467:
    $P1492 = $P1491."ast"()
    store_lex "$past", $P1492
.annotate "line", 557
    find_lex $P1493, "$past"
    find_lex $P1494, "$/"
    unless_null $P1494, vivify_468
    new $P1494, "Hash"
  vivify_468:
    set $P1495, $P1494["identifier"]
    unless_null $P1495, vivify_469
    new $P1495, "Undef"
  vivify_469:
    set $S1496, $P1495
    $P1493."name"($S1496)
.annotate "line", 558
    find_lex $P1497, "$/"
    find_lex $P1498, "$past"
    $P1499 = $P1497."!make"($P1498)
.annotate "line", 555
    .return ($P1499)
  control_1486:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1500, exception, "payload"
    .return ($P1500)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<name>"  :subid("84_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1504
.annotate "line", 561
    new $P1503, 'ExceptionHandler'
    set_addr $P1503, control_1502
    $P1503."handle_types"(58)
    push_eh $P1503
    .lex "self", self
    .lex "$/", param_1504
.annotate "line", 562
    new $P1505, "ResizablePMCArray"
    .lex "@ns", $P1505
.annotate "line", 563
    new $P1506, "Undef"
    .lex "$name", $P1506
.annotate "line", 565
    new $P1507, "Undef"
    .lex "$var", $P1507
.annotate "line", 567
    new $P1508, "Undef"
    .lex "$past", $P1508
.annotate "line", 562
    find_lex $P1509, "$/"
    unless_null $P1509, vivify_470
    new $P1509, "Hash"
  vivify_470:
    set $P1510, $P1509["name"]
    unless_null $P1510, vivify_471
    new $P1510, "Hash"
  vivify_471:
    set $P1511, $P1510["identifier"]
    unless_null $P1511, vivify_472
    new $P1511, "Undef"
  vivify_472:
    clone $P1512, $P1511
    store_lex "@ns", $P1512
.annotate "line", 563
    find_lex $P1513, "@ns"
    $P1514 = $P1513."pop"()
    store_lex "$name", $P1514
.annotate "line", 564
    find_lex $P1518, "@ns"
    if $P1518, if_1517
    set $P1516, $P1518
    goto if_1517_end
  if_1517:
    find_lex $P1519, "@ns"
    unless_null $P1519, vivify_473
    new $P1519, "ResizablePMCArray"
  vivify_473:
    set $P1520, $P1519[0]
    unless_null $P1520, vivify_474
    new $P1520, "Undef"
  vivify_474:
    set $S1521, $P1520
    iseq $I1522, $S1521, "GLOBAL"
    new $P1516, 'Integer'
    set $P1516, $I1522
  if_1517_end:
    unless $P1516, if_1515_end
    find_lex $P1523, "@ns"
    $P1523."shift"()
  if_1515_end:
.annotate "line", 566
    get_hll_global $P1524, ["PAST"], "Var"
    find_lex $P1525, "$name"
    set $S1526, $P1525
    find_lex $P1527, "@ns"
    $P1528 = $P1524."new"($S1526 :named("name"), $P1527 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1528
.annotate "line", 567
    find_lex $P1529, "$var"
    store_lex "$past", $P1529
.annotate "line", 568
    find_lex $P1531, "$/"
    unless_null $P1531, vivify_475
    new $P1531, "Hash"
  vivify_475:
    set $P1532, $P1531["args"]
    unless_null $P1532, vivify_476
    new $P1532, "Undef"
  vivify_476:
    unless $P1532, if_1530_end
.annotate "line", 569
    find_lex $P1533, "$/"
    unless_null $P1533, vivify_477
    new $P1533, "Hash"
  vivify_477:
    set $P1534, $P1533["args"]
    unless_null $P1534, vivify_478
    new $P1534, "ResizablePMCArray"
  vivify_478:
    set $P1535, $P1534[0]
    unless_null $P1535, vivify_479
    new $P1535, "Undef"
  vivify_479:
    $P1536 = $P1535."ast"()
    store_lex "$past", $P1536
.annotate "line", 570
    find_lex $P1537, "$past"
    find_lex $P1538, "$var"
    $P1537."unshift"($P1538)
  if_1530_end:
.annotate "line", 572
    find_lex $P1539, "$/"
    find_lex $P1540, "$past"
    $P1541 = $P1539."!make"($P1540)
.annotate "line", 561
    .return ($P1541)
  control_1502:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1542, exception, "payload"
    .return ($P1542)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<pir::op>"  :subid("85_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1546
.annotate "line", 575
    new $P1545, 'ExceptionHandler'
    set_addr $P1545, control_1544
    $P1545."handle_types"(58)
    push_eh $P1545
    .lex "self", self
    .lex "$/", param_1546
.annotate "line", 576
    new $P1547, "Undef"
    .lex "$past", $P1547
.annotate "line", 577
    new $P1548, "Undef"
    .lex "$pirop", $P1548
.annotate "line", 576
    find_lex $P1551, "$/"
    unless_null $P1551, vivify_480
    new $P1551, "Hash"
  vivify_480:
    set $P1552, $P1551["args"]
    unless_null $P1552, vivify_481
    new $P1552, "Undef"
  vivify_481:
    if $P1552, if_1550
    get_hll_global $P1557, ["PAST"], "Op"
    find_lex $P1558, "$/"
    $P1559 = $P1557."new"($P1558 :named("node"))
    set $P1549, $P1559
    goto if_1550_end
  if_1550:
    find_lex $P1553, "$/"
    unless_null $P1553, vivify_482
    new $P1553, "Hash"
  vivify_482:
    set $P1554, $P1553["args"]
    unless_null $P1554, vivify_483
    new $P1554, "ResizablePMCArray"
  vivify_483:
    set $P1555, $P1554[0]
    unless_null $P1555, vivify_484
    new $P1555, "Undef"
  vivify_484:
    $P1556 = $P1555."ast"()
    set $P1549, $P1556
  if_1550_end:
    store_lex "$past", $P1549
.annotate "line", 577
    find_lex $P1560, "$/"
    unless_null $P1560, vivify_485
    new $P1560, "Hash"
  vivify_485:
    set $P1561, $P1560["op"]
    unless_null $P1561, vivify_486
    new $P1561, "Undef"
  vivify_486:
    set $S1562, $P1561
    new $P1563, 'String'
    set $P1563, $S1562
    store_lex "$pirop", $P1563
.annotate "line", 578

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1564 = box $S0
    
    store_lex "$pirop", $P1564
.annotate "line", 585
    find_lex $P1565, "$past"
    find_lex $P1566, "$pirop"
    $P1565."pirop"($P1566)
.annotate "line", 586
    find_lex $P1567, "$past"
    $P1567."pasttype"("pirop")
.annotate "line", 587
    find_lex $P1568, "$/"
    find_lex $P1569, "$past"
    $P1570 = $P1568."!make"($P1569)
.annotate "line", 575
    .return ($P1570)
  control_1544:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1571, exception, "payload"
    .return ($P1571)
.end


.namespace ["NQP";"Actions"]
.sub "args"  :subid("86_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1575
.annotate "line", 590
    new $P1574, 'ExceptionHandler'
    set_addr $P1574, control_1573
    $P1574."handle_types"(58)
    push_eh $P1574
    .lex "self", self
    .lex "$/", param_1575
    find_lex $P1576, "$/"
    find_lex $P1577, "$/"
    unless_null $P1577, vivify_487
    new $P1577, "Hash"
  vivify_487:
    set $P1578, $P1577["arglist"]
    unless_null $P1578, vivify_488
    new $P1578, "Undef"
  vivify_488:
    $P1579 = $P1578."ast"()
    $P1580 = $P1576."!make"($P1579)
    .return ($P1580)
  control_1573:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1581, exception, "payload"
    .return ($P1581)
.end


.namespace ["NQP";"Actions"]
.sub "arglist"  :subid("87_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1585
.annotate "line", 592
    .const 'Sub' $P1596 = "88_1260829329.07487" 
    capture_lex $P1596
    new $P1584, 'ExceptionHandler'
    set_addr $P1584, control_1583
    $P1584."handle_types"(58)
    push_eh $P1584
    .lex "self", self
    .lex "$/", param_1585
.annotate "line", 593
    new $P1586, "Undef"
    .lex "$past", $P1586
.annotate "line", 601
    new $P1587, "Undef"
    .lex "$i", $P1587
.annotate "line", 602
    new $P1588, "Undef"
    .lex "$n", $P1588
.annotate "line", 593
    get_hll_global $P1589, ["PAST"], "Op"
    find_lex $P1590, "$/"
    $P1591 = $P1589."new"("call" :named("pasttype"), $P1590 :named("node"))
    store_lex "$past", $P1591
.annotate "line", 594
    find_lex $P1593, "$/"
    unless_null $P1593, vivify_489
    new $P1593, "Hash"
  vivify_489:
    set $P1594, $P1593["EXPR"]
    unless_null $P1594, vivify_490
    new $P1594, "Undef"
  vivify_490:
    unless $P1594, if_1592_end
    .const 'Sub' $P1596 = "88_1260829329.07487" 
    capture_lex $P1596
    $P1596()
  if_1592_end:
.annotate "line", 601
    new $P1628, "Integer"
    assign $P1628, 0
    store_lex "$i", $P1628
.annotate "line", 602
    find_lex $P1629, "$past"
    $P1630 = $P1629."list"()
    set $N1631, $P1630
    new $P1632, 'Float'
    set $P1632, $N1631
    store_lex "$n", $P1632
.annotate "line", 603
    new $P1660, 'ExceptionHandler'
    set_addr $P1660, loop1659_handler
    $P1660."handle_types"(65, 67, 66)
    push_eh $P1660
  loop1659_test:
    find_lex $P1633, "$i"
    set $N1634, $P1633
    find_lex $P1635, "$n"
    set $N1636, $P1635
    islt $I1637, $N1634, $N1636
    unless $I1637, loop1659_done
  loop1659_redo:
.annotate "line", 604
    find_lex $P1639, "$i"
    set $I1640, $P1639
    find_lex $P1641, "$past"
    unless_null $P1641, vivify_494
    new $P1641, "ResizablePMCArray"
  vivify_494:
    set $P1642, $P1641[$I1640]
    unless_null $P1642, vivify_495
    new $P1642, "Undef"
  vivify_495:
    $S1643 = $P1642."name"()
    iseq $I1644, $S1643, "&prefix:<|>"
    unless $I1644, if_1638_end
.annotate "line", 605
    find_lex $P1645, "$i"
    set $I1646, $P1645
    find_lex $P1647, "$past"
    unless_null $P1647, vivify_496
    new $P1647, "ResizablePMCArray"
  vivify_496:
    set $P1648, $P1647[$I1646]
    unless_null $P1648, vivify_497
    new $P1648, "ResizablePMCArray"
  vivify_497:
    set $P1649, $P1648[0]
    unless_null $P1649, vivify_498
    new $P1649, "Undef"
  vivify_498:
    find_lex $P1650, "$i"
    set $I1651, $P1650
    find_lex $P1652, "$past"
    unless_null $P1652, vivify_499
    new $P1652, "ResizablePMCArray"
    store_lex "$past", $P1652
  vivify_499:
    set $P1652[$I1651], $P1649
.annotate "line", 606
    find_lex $P1653, "$i"
    set $I1654, $P1653
    find_lex $P1655, "$past"
    unless_null $P1655, vivify_500
    new $P1655, "ResizablePMCArray"
  vivify_500:
    set $P1656, $P1655[$I1654]
    unless_null $P1656, vivify_501
    new $P1656, "Undef"
  vivify_501:
    $P1656."flat"(1)
  if_1638_end:
.annotate "line", 604
    find_lex $P1657, "$i"
    clone $P1658, $P1657
    inc $P1657
  loop1659_next:
.annotate "line", 603
    goto loop1659_test
  loop1659_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1661, exception, 'type'
    eq $P1661, 65, loop1659_next
    eq $P1661, 67, loop1659_redo
  loop1659_done:
    pop_eh 
.annotate "line", 610
    find_lex $P1662, "$/"
    find_lex $P1663, "$past"
    $P1664 = $P1662."!make"($P1663)
.annotate "line", 592
    .return ($P1664)
  control_1583:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1665, exception, "payload"
    .return ($P1665)
.end


.namespace ["NQP";"Actions"]
.sub "_block1595"  :anon :subid("88_1260829329.07487") :outer("87_1260829329.07487")
.annotate "line", 594
    .const 'Sub' $P1617 = "89_1260829329.07487" 
    capture_lex $P1617
.annotate "line", 595
    new $P1597, "Undef"
    .lex "$expr", $P1597
    find_lex $P1598, "$/"
    unless_null $P1598, vivify_491
    new $P1598, "Hash"
  vivify_491:
    set $P1599, $P1598["EXPR"]
    unless_null $P1599, vivify_492
    new $P1599, "Undef"
  vivify_492:
    $P1600 = $P1599."ast"()
    store_lex "$expr", $P1600
.annotate "line", 596
    find_lex $P1605, "$expr"
    $S1606 = $P1605."name"()
    iseq $I1607, $S1606, "&infix:<,>"
    if $I1607, if_1604
    new $P1603, 'Integer'
    set $P1603, $I1607
    goto if_1604_end
  if_1604:
    find_lex $P1608, "$expr"
    $P1609 = $P1608."named"()
    isfalse $I1610, $P1609
    new $P1603, 'Integer'
    set $P1603, $I1610
  if_1604_end:
    if $P1603, if_1602
.annotate "line", 599
    find_lex $P1625, "$past"
    find_lex $P1626, "$expr"
    $P1627 = $P1625."push"($P1626)
    set $P1601, $P1627
.annotate "line", 596
    goto if_1602_end
  if_1602:
.annotate "line", 597
    find_lex $P1612, "$expr"
    $P1613 = $P1612."list"()
    defined $I1614, $P1613
    unless $I1614, for_undef_493
    iter $P1611, $P1613
    new $P1623, 'ExceptionHandler'
    set_addr $P1623, loop1622_handler
    $P1623."handle_types"(65, 67, 66)
    push_eh $P1623
  loop1622_test:
    unless $P1611, loop1622_done
    shift $P1615, $P1611
  loop1622_redo:
    .const 'Sub' $P1617 = "89_1260829329.07487" 
    capture_lex $P1617
    $P1617($P1615)
  loop1622_next:
    goto loop1622_test
  loop1622_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1624, exception, 'type'
    eq $P1624, 65, loop1622_next
    eq $P1624, 67, loop1622_redo
  loop1622_done:
    pop_eh 
  for_undef_493:
.annotate "line", 596
    set $P1601, $P1611
  if_1602_end:
.annotate "line", 594
    .return ($P1601)
.end


.namespace ["NQP";"Actions"]
.sub "_block1616"  :anon :subid("89_1260829329.07487") :outer("88_1260829329.07487")
    .param pmc param_1618
.annotate "line", 597
    .lex "$_", param_1618
    find_lex $P1619, "$past"
    find_lex $P1620, "$_"
    $P1621 = $P1619."push"($P1620)
    .return ($P1621)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<value>"  :subid("90_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1669
.annotate "line", 614
    new $P1668, 'ExceptionHandler'
    set_addr $P1668, control_1667
    $P1668."handle_types"(58)
    push_eh $P1668
    .lex "self", self
    .lex "$/", param_1669
    find_lex $P1670, "$/"
    find_lex $P1671, "$/"
    unless_null $P1671, vivify_502
    new $P1671, "Hash"
  vivify_502:
    set $P1672, $P1671["value"]
    unless_null $P1672, vivify_503
    new $P1672, "Undef"
  vivify_503:
    $P1673 = $P1672."ast"()
    $P1674 = $P1670."!make"($P1673)
    .return ($P1674)
  control_1667:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1675, exception, "payload"
    .return ($P1675)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<( )>"  :subid("91_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1679
.annotate "line", 616
    new $P1678, 'ExceptionHandler'
    set_addr $P1678, control_1677
    $P1678."handle_types"(58)
    push_eh $P1678
    .lex "self", self
    .lex "$/", param_1679
.annotate "line", 617
    find_lex $P1680, "$/"
.annotate "line", 618
    find_lex $P1683, "$/"
    unless_null $P1683, vivify_504
    new $P1683, "Hash"
  vivify_504:
    set $P1684, $P1683["EXPR"]
    unless_null $P1684, vivify_505
    new $P1684, "Undef"
  vivify_505:
    if $P1684, if_1682
.annotate "line", 619
    get_hll_global $P1689, ["PAST"], "Op"
    find_lex $P1690, "$/"
    $P1691 = $P1689."new"("list" :named("pasttype"), $P1690 :named("node"))
    set $P1681, $P1691
.annotate "line", 618
    goto if_1682_end
  if_1682:
    find_lex $P1685, "$/"
    unless_null $P1685, vivify_506
    new $P1685, "Hash"
  vivify_506:
    set $P1686, $P1685["EXPR"]
    unless_null $P1686, vivify_507
    new $P1686, "ResizablePMCArray"
  vivify_507:
    set $P1687, $P1686[0]
    unless_null $P1687, vivify_508
    new $P1687, "Undef"
  vivify_508:
    $P1688 = $P1687."ast"()
    set $P1681, $P1688
  if_1682_end:
    $P1692 = $P1680."!make"($P1681)
.annotate "line", 616
    .return ($P1692)
  control_1677:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1693, exception, "payload"
    .return ($P1693)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<[ ]>"  :subid("92_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1697
.annotate "line", 622
    new $P1696, 'ExceptionHandler'
    set_addr $P1696, control_1695
    $P1696."handle_types"(58)
    push_eh $P1696
    .lex "self", self
    .lex "$/", param_1697
.annotate "line", 623
    new $P1698, "Undef"
    .lex "$past", $P1698
.annotate "line", 622
    find_lex $P1699, "$past"
.annotate "line", 624
    find_lex $P1701, "$/"
    unless_null $P1701, vivify_509
    new $P1701, "Hash"
  vivify_509:
    set $P1702, $P1701["EXPR"]
    unless_null $P1702, vivify_510
    new $P1702, "Undef"
  vivify_510:
    if $P1702, if_1700
.annotate "line", 631
    get_hll_global $P1714, ["PAST"], "Op"
    $P1715 = $P1714."new"("list" :named("pasttype"))
    store_lex "$past", $P1715
.annotate "line", 630
    goto if_1700_end
  if_1700:
.annotate "line", 625
    find_lex $P1703, "$/"
    unless_null $P1703, vivify_511
    new $P1703, "Hash"
  vivify_511:
    set $P1704, $P1703["EXPR"]
    unless_null $P1704, vivify_512
    new $P1704, "ResizablePMCArray"
  vivify_512:
    set $P1705, $P1704[0]
    unless_null $P1705, vivify_513
    new $P1705, "Undef"
  vivify_513:
    $P1706 = $P1705."ast"()
    store_lex "$past", $P1706
.annotate "line", 626
    find_lex $P1708, "$past"
    $S1709 = $P1708."name"()
    isne $I1710, $S1709, "&infix:<,>"
    unless $I1710, if_1707_end
.annotate "line", 627
    get_hll_global $P1711, ["PAST"], "Op"
    find_lex $P1712, "$past"
    $P1713 = $P1711."new"($P1712, "list" :named("pasttype"))
    store_lex "$past", $P1713
  if_1707_end:
  if_1700_end:
.annotate "line", 633
    find_lex $P1716, "$past"
    $P1716."name"("&circumfix:<[ ]>")
.annotate "line", 634
    find_lex $P1717, "$/"
    find_lex $P1718, "$past"
    $P1719 = $P1717."!make"($P1718)
.annotate "line", 622
    .return ($P1719)
  control_1695:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1720, exception, "payload"
    .return ($P1720)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<ang>"  :subid("93_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1724
.annotate "line", 637
    new $P1723, 'ExceptionHandler'
    set_addr $P1723, control_1722
    $P1723."handle_types"(58)
    push_eh $P1723
    .lex "self", self
    .lex "$/", param_1724
    find_lex $P1725, "$/"
    find_lex $P1726, "$/"
    unless_null $P1726, vivify_514
    new $P1726, "Hash"
  vivify_514:
    set $P1727, $P1726["quote_EXPR"]
    unless_null $P1727, vivify_515
    new $P1727, "Undef"
  vivify_515:
    $P1728 = $P1727."ast"()
    $P1729 = $P1725."!make"($P1728)
    .return ($P1729)
  control_1722:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1730, exception, "payload"
    .return ($P1730)
.end


.namespace ["NQP";"Actions"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("94_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1734
.annotate "line", 638
    new $P1733, 'ExceptionHandler'
    set_addr $P1733, control_1732
    $P1733."handle_types"(58)
    push_eh $P1733
    .lex "self", self
    .lex "$/", param_1734
    find_lex $P1735, "$/"
    find_lex $P1736, "$/"
    unless_null $P1736, vivify_516
    new $P1736, "Hash"
  vivify_516:
    set $P1737, $P1736["quote_EXPR"]
    unless_null $P1737, vivify_517
    new $P1737, "Undef"
  vivify_517:
    $P1738 = $P1737."ast"()
    $P1739 = $P1735."!make"($P1738)
    .return ($P1739)
  control_1732:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1740, exception, "payload"
    .return ($P1740)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<{ }>"  :subid("95_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1744
.annotate "line", 640
    new $P1743, 'ExceptionHandler'
    set_addr $P1743, control_1742
    $P1743."handle_types"(58)
    push_eh $P1743
    .lex "self", self
    .lex "$/", param_1744
.annotate "line", 641
    find_lex $P1745, "$/"
    find_lex $P1748, "$/"
    unless_null $P1748, vivify_518
    new $P1748, "Hash"
  vivify_518:
    set $P1749, $P1748["pblock"]
    unless_null $P1749, vivify_519
    new $P1749, "Hash"
  vivify_519:
    set $P1750, $P1749["blockoid"]
    unless_null $P1750, vivify_520
    new $P1750, "Hash"
  vivify_520:
    set $P1751, $P1750["statementlist"]
    unless_null $P1751, vivify_521
    new $P1751, "Hash"
  vivify_521:
    set $P1752, $P1751["statement"]
    unless_null $P1752, vivify_522
    new $P1752, "Undef"
  vivify_522:
    set $N1753, $P1752
    isgt $I1754, $N1753, 0.0
    if $I1754, if_1747
.annotate "line", 643
    get_hll_global $P1758, ["PAST"], "Op"
    find_lex $P1759, "$/"
    $P1760 = $P1758."new"("    %r = new [\"Hash\"]" :named("inline"), $P1759 :named("node"))
    set $P1746, $P1760
.annotate "line", 641
    goto if_1747_end
  if_1747:
.annotate "line", 642
    find_lex $P1755, "$/"
    unless_null $P1755, vivify_523
    new $P1755, "Hash"
  vivify_523:
    set $P1756, $P1755["pblock"]
    unless_null $P1756, vivify_524
    new $P1756, "Undef"
  vivify_524:
    $P1757 = $P1756."ast"()
    set $P1746, $P1757
  if_1747_end:
    $P1761 = $P1745."!make"($P1746)
.annotate "line", 640
    .return ($P1761)
  control_1742:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1762, exception, "payload"
    .return ($P1762)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<sigil>"  :subid("96_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1766
.annotate "line", 646
    new $P1765, 'ExceptionHandler'
    set_addr $P1765, control_1764
    $P1765."handle_types"(58)
    push_eh $P1765
    .lex "self", self
    .lex "$/", param_1766
.annotate "line", 647
    new $P1767, "Undef"
    .lex "$name", $P1767
    find_lex $P1770, "$/"
    unless_null $P1770, vivify_525
    new $P1770, "Hash"
  vivify_525:
    set $P1771, $P1770["sigil"]
    unless_null $P1771, vivify_526
    new $P1771, "Undef"
  vivify_526:
    set $S1772, $P1771
    iseq $I1773, $S1772, "@"
    if $I1773, if_1769
.annotate "line", 648
    find_lex $P1777, "$/"
    unless_null $P1777, vivify_527
    new $P1777, "Hash"
  vivify_527:
    set $P1778, $P1777["sigil"]
    unless_null $P1778, vivify_528
    new $P1778, "Undef"
  vivify_528:
    set $S1779, $P1778
    iseq $I1780, $S1779, "%"
    if $I1780, if_1776
    new $P1782, "String"
    assign $P1782, "item"
    set $P1775, $P1782
    goto if_1776_end
  if_1776:
    new $P1781, "String"
    assign $P1781, "hash"
    set $P1775, $P1781
  if_1776_end:
    set $P1768, $P1775
.annotate "line", 647
    goto if_1769_end
  if_1769:
    new $P1774, "String"
    assign $P1774, "list"
    set $P1768, $P1774
  if_1769_end:
    store_lex "$name", $P1768
.annotate "line", 650
    find_lex $P1783, "$/"
    get_hll_global $P1784, ["PAST"], "Op"
    find_lex $P1785, "$name"
    find_lex $P1786, "$/"
    unless_null $P1786, vivify_529
    new $P1786, "Hash"
  vivify_529:
    set $P1787, $P1786["semilist"]
    unless_null $P1787, vivify_530
    new $P1787, "Undef"
  vivify_530:
    $P1788 = $P1787."ast"()
    $P1789 = $P1784."new"($P1788, "callmethod" :named("pasttype"), $P1785 :named("name"))
    $P1790 = $P1783."!make"($P1789)
.annotate "line", 646
    .return ($P1790)
  control_1764:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1791, exception, "payload"
    .return ($P1791)
.end


.namespace ["NQP";"Actions"]
.sub "semilist"  :subid("97_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1795
.annotate "line", 653
    new $P1794, 'ExceptionHandler'
    set_addr $P1794, control_1793
    $P1794."handle_types"(58)
    push_eh $P1794
    .lex "self", self
    .lex "$/", param_1795
    find_lex $P1796, "$/"
    find_lex $P1797, "$/"
    unless_null $P1797, vivify_531
    new $P1797, "Hash"
  vivify_531:
    set $P1798, $P1797["statement"]
    unless_null $P1798, vivify_532
    new $P1798, "Undef"
  vivify_532:
    $P1799 = $P1798."ast"()
    $P1800 = $P1796."!make"($P1799)
    .return ($P1800)
  control_1793:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1801, exception, "payload"
    .return ($P1801)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<[ ]>"  :subid("98_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1805
.annotate "line", 655
    new $P1804, 'ExceptionHandler'
    set_addr $P1804, control_1803
    $P1804."handle_types"(58)
    push_eh $P1804
    .lex "self", self
    .lex "$/", param_1805
.annotate "line", 656
    find_lex $P1806, "$/"
    get_hll_global $P1807, ["PAST"], "Var"
    find_lex $P1808, "$/"
    unless_null $P1808, vivify_533
    new $P1808, "Hash"
  vivify_533:
    set $P1809, $P1808["EXPR"]
    unless_null $P1809, vivify_534
    new $P1809, "Undef"
  vivify_534:
    $P1810 = $P1809."ast"()
    $P1811 = $P1807."new"($P1810, "keyed_int" :named("scope"), "Undef" :named("viviself"), "ResizablePMCArray" :named("vivibase"))
    $P1812 = $P1806."!make"($P1811)
.annotate "line", 655
    .return ($P1812)
  control_1803:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1813, exception, "payload"
    .return ($P1813)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<{ }>"  :subid("99_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1817
.annotate "line", 661
    new $P1816, 'ExceptionHandler'
    set_addr $P1816, control_1815
    $P1816."handle_types"(58)
    push_eh $P1816
    .lex "self", self
    .lex "$/", param_1817
.annotate "line", 662
    find_lex $P1818, "$/"
    get_hll_global $P1819, ["PAST"], "Var"
    find_lex $P1820, "$/"
    unless_null $P1820, vivify_535
    new $P1820, "Hash"
  vivify_535:
    set $P1821, $P1820["EXPR"]
    unless_null $P1821, vivify_536
    new $P1821, "Undef"
  vivify_536:
    $P1822 = $P1821."ast"()
    $P1823 = $P1819."new"($P1822, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1824 = $P1818."!make"($P1823)
.annotate "line", 661
    .return ($P1824)
  control_1815:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1825, exception, "payload"
    .return ($P1825)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<ang>"  :subid("100_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1829
.annotate "line", 667
    new $P1828, 'ExceptionHandler'
    set_addr $P1828, control_1827
    $P1828."handle_types"(58)
    push_eh $P1828
    .lex "self", self
    .lex "$/", param_1829
.annotate "line", 668
    find_lex $P1830, "$/"
    get_hll_global $P1831, ["PAST"], "Var"
    find_lex $P1832, "$/"
    unless_null $P1832, vivify_537
    new $P1832, "Hash"
  vivify_537:
    set $P1833, $P1832["quote_EXPR"]
    unless_null $P1833, vivify_538
    new $P1833, "Undef"
  vivify_538:
    $P1834 = $P1833."ast"()
    $P1835 = $P1831."new"($P1834, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1836 = $P1830."!make"($P1835)
.annotate "line", 667
    .return ($P1836)
  control_1827:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1837, exception, "payload"
    .return ($P1837)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<( )>"  :subid("101_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1841
.annotate "line", 673
    new $P1840, 'ExceptionHandler'
    set_addr $P1840, control_1839
    $P1840."handle_types"(58)
    push_eh $P1840
    .lex "self", self
    .lex "$/", param_1841
.annotate "line", 674
    find_lex $P1842, "$/"
    find_lex $P1843, "$/"
    unless_null $P1843, vivify_539
    new $P1843, "Hash"
  vivify_539:
    set $P1844, $P1843["arglist"]
    unless_null $P1844, vivify_540
    new $P1844, "Undef"
  vivify_540:
    $P1845 = $P1844."ast"()
    $P1846 = $P1842."!make"($P1845)
.annotate "line", 673
    .return ($P1846)
  control_1839:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1847, exception, "payload"
    .return ($P1847)
.end


.namespace ["NQP";"Actions"]
.sub "value"  :subid("102_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1851
.annotate "line", 677
    new $P1850, 'ExceptionHandler'
    set_addr $P1850, control_1849
    $P1850."handle_types"(58)
    push_eh $P1850
    .lex "self", self
    .lex "$/", param_1851
.annotate "line", 678
    find_lex $P1852, "$/"
    find_lex $P1855, "$/"
    unless_null $P1855, vivify_541
    new $P1855, "Hash"
  vivify_541:
    set $P1856, $P1855["quote"]
    unless_null $P1856, vivify_542
    new $P1856, "Undef"
  vivify_542:
    if $P1856, if_1854
    find_lex $P1860, "$/"
    unless_null $P1860, vivify_543
    new $P1860, "Hash"
  vivify_543:
    set $P1861, $P1860["number"]
    unless_null $P1861, vivify_544
    new $P1861, "Undef"
  vivify_544:
    $P1862 = $P1861."ast"()
    set $P1853, $P1862
    goto if_1854_end
  if_1854:
    find_lex $P1857, "$/"
    unless_null $P1857, vivify_545
    new $P1857, "Hash"
  vivify_545:
    set $P1858, $P1857["quote"]
    unless_null $P1858, vivify_546
    new $P1858, "Undef"
  vivify_546:
    $P1859 = $P1858."ast"()
    set $P1853, $P1859
  if_1854_end:
    $P1863 = $P1852."!make"($P1853)
.annotate "line", 677
    .return ($P1863)
  control_1849:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1864, exception, "payload"
    .return ($P1864)
.end


.namespace ["NQP";"Actions"]
.sub "number"  :subid("103_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1868
.annotate "line", 681
    new $P1867, 'ExceptionHandler'
    set_addr $P1867, control_1866
    $P1867."handle_types"(58)
    push_eh $P1867
    .lex "self", self
    .lex "$/", param_1868
.annotate "line", 682
    new $P1869, "Undef"
    .lex "$value", $P1869
    find_lex $P1872, "$/"
    unless_null $P1872, vivify_547
    new $P1872, "Hash"
  vivify_547:
    set $P1873, $P1872["dec_number"]
    unless_null $P1873, vivify_548
    new $P1873, "Undef"
  vivify_548:
    if $P1873, if_1871
    find_lex $P1877, "$/"
    unless_null $P1877, vivify_549
    new $P1877, "Hash"
  vivify_549:
    set $P1878, $P1877["integer"]
    unless_null $P1878, vivify_550
    new $P1878, "Undef"
  vivify_550:
    $P1879 = $P1878."ast"()
    set $P1870, $P1879
    goto if_1871_end
  if_1871:
    find_lex $P1874, "$/"
    unless_null $P1874, vivify_551
    new $P1874, "Hash"
  vivify_551:
    set $P1875, $P1874["dec_number"]
    unless_null $P1875, vivify_552
    new $P1875, "Undef"
  vivify_552:
    $P1876 = $P1875."ast"()
    set $P1870, $P1876
  if_1871_end:
    store_lex "$value", $P1870
.annotate "line", 683
    find_lex $P1881, "$/"
    unless_null $P1881, vivify_553
    new $P1881, "Hash"
  vivify_553:
    set $P1882, $P1881["sign"]
    unless_null $P1882, vivify_554
    new $P1882, "Undef"
  vivify_554:
    set $S1883, $P1882
    iseq $I1884, $S1883, "-"
    unless $I1884, if_1880_end
    find_lex $P1885, "$value"
    neg $P1886, $P1885
    store_lex "$value", $P1886
  if_1880_end:
.annotate "line", 684
    find_lex $P1887, "$/"
    get_hll_global $P1888, ["PAST"], "Val"
    find_lex $P1889, "$value"
    $P1890 = $P1888."new"($P1889 :named("value"))
    $P1891 = $P1887."!make"($P1890)
.annotate "line", 681
    .return ($P1891)
  control_1866:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1892, exception, "payload"
    .return ($P1892)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<apos>"  :subid("104_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1896
.annotate "line", 687
    new $P1895, 'ExceptionHandler'
    set_addr $P1895, control_1894
    $P1895."handle_types"(58)
    push_eh $P1895
    .lex "self", self
    .lex "$/", param_1896
    find_lex $P1897, "$/"
    find_lex $P1898, "$/"
    unless_null $P1898, vivify_555
    new $P1898, "Hash"
  vivify_555:
    set $P1899, $P1898["quote_EXPR"]
    unless_null $P1899, vivify_556
    new $P1899, "Undef"
  vivify_556:
    $P1900 = $P1899."ast"()
    $P1901 = $P1897."!make"($P1900)
    .return ($P1901)
  control_1894:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1902, exception, "payload"
    .return ($P1902)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<dblq>"  :subid("105_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1906
.annotate "line", 688
    new $P1905, 'ExceptionHandler'
    set_addr $P1905, control_1904
    $P1905."handle_types"(58)
    push_eh $P1905
    .lex "self", self
    .lex "$/", param_1906
    find_lex $P1907, "$/"
    find_lex $P1908, "$/"
    unless_null $P1908, vivify_557
    new $P1908, "Hash"
  vivify_557:
    set $P1909, $P1908["quote_EXPR"]
    unless_null $P1909, vivify_558
    new $P1909, "Undef"
  vivify_558:
    $P1910 = $P1909."ast"()
    $P1911 = $P1907."!make"($P1910)
    .return ($P1911)
  control_1904:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1912, exception, "payload"
    .return ($P1912)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<qq>"  :subid("106_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1916
.annotate "line", 689
    new $P1915, 'ExceptionHandler'
    set_addr $P1915, control_1914
    $P1915."handle_types"(58)
    push_eh $P1915
    .lex "self", self
    .lex "$/", param_1916
    find_lex $P1917, "$/"
    find_lex $P1918, "$/"
    unless_null $P1918, vivify_559
    new $P1918, "Hash"
  vivify_559:
    set $P1919, $P1918["quote_EXPR"]
    unless_null $P1919, vivify_560
    new $P1919, "Undef"
  vivify_560:
    $P1920 = $P1919."ast"()
    $P1921 = $P1917."!make"($P1920)
    .return ($P1921)
  control_1914:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1922, exception, "payload"
    .return ($P1922)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<q>"  :subid("107_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1926
.annotate "line", 690
    new $P1925, 'ExceptionHandler'
    set_addr $P1925, control_1924
    $P1925."handle_types"(58)
    push_eh $P1925
    .lex "self", self
    .lex "$/", param_1926
    find_lex $P1927, "$/"
    find_lex $P1928, "$/"
    unless_null $P1928, vivify_561
    new $P1928, "Hash"
  vivify_561:
    set $P1929, $P1928["quote_EXPR"]
    unless_null $P1929, vivify_562
    new $P1929, "Undef"
  vivify_562:
    $P1930 = $P1929."ast"()
    $P1931 = $P1927."!make"($P1930)
    .return ($P1931)
  control_1924:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1932, exception, "payload"
    .return ($P1932)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q>"  :subid("108_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1936
.annotate "line", 691
    new $P1935, 'ExceptionHandler'
    set_addr $P1935, control_1934
    $P1935."handle_types"(58)
    push_eh $P1935
    .lex "self", self
    .lex "$/", param_1936
    find_lex $P1937, "$/"
    find_lex $P1938, "$/"
    unless_null $P1938, vivify_563
    new $P1938, "Hash"
  vivify_563:
    set $P1939, $P1938["quote_EXPR"]
    unless_null $P1939, vivify_564
    new $P1939, "Undef"
  vivify_564:
    $P1940 = $P1939."ast"()
    $P1941 = $P1937."!make"($P1940)
    .return ($P1941)
  control_1934:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1942, exception, "payload"
    .return ($P1942)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q:PIR>"  :subid("109_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1946
.annotate "line", 692
    new $P1945, 'ExceptionHandler'
    set_addr $P1945, control_1944
    $P1945."handle_types"(58)
    push_eh $P1945
    .lex "self", self
    .lex "$/", param_1946
.annotate "line", 693
    find_lex $P1947, "$/"
    get_hll_global $P1948, ["PAST"], "Op"
    find_lex $P1949, "$/"
    unless_null $P1949, vivify_565
    new $P1949, "Hash"
  vivify_565:
    set $P1950, $P1949["quote_EXPR"]
    unless_null $P1950, vivify_566
    new $P1950, "Undef"
  vivify_566:
    $P1951 = $P1950."ast"()
    $P1952 = $P1951."value"()
    find_lex $P1953, "$/"
    $P1954 = $P1948."new"($P1952 :named("inline"), "inline" :named("pasttype"), $P1953 :named("node"))
    $P1955 = $P1947."!make"($P1954)
.annotate "line", 692
    .return ($P1955)
  control_1944:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1956, exception, "payload"
    .return ($P1956)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym</ />"  :subid("110_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1960
    .param pmc param_1961 :optional
    .param int has_param_1961 :opt_flag
.annotate "line", 698
    new $P1959, 'ExceptionHandler'
    set_addr $P1959, control_1958
    $P1959."handle_types"(58)
    push_eh $P1959
    .lex "self", self
    .lex "$/", param_1960
    if has_param_1961, optparam_567
    new $P1962, "Undef"
    set param_1961, $P1962
  optparam_567:
    .lex "$key", param_1961
.annotate "line", 708
    new $P1963, "Undef"
    .lex "$regex", $P1963
.annotate "line", 710
    new $P1964, "Undef"
    .lex "$past", $P1964
.annotate "line", 699
    find_lex $P1966, "$key"
    set $S1967, $P1966
    iseq $I1968, $S1967, "open"
    unless $I1968, if_1965_end
.annotate "line", 700

            null $P0
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate "line", 704
    get_global $P1969, "@BLOCK"
    unless_null $P1969, vivify_568
    new $P1969, "ResizablePMCArray"
  vivify_568:
    set $P1970, $P1969[0]
    unless_null $P1970, vivify_569
    new $P1970, "Undef"
  vivify_569:
    $P1970."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate "line", 705
    get_global $P1971, "@BLOCK"
    unless_null $P1971, vivify_570
    new $P1971, "ResizablePMCArray"
  vivify_570:
    set $P1972, $P1971[0]
    unless_null $P1972, vivify_571
    new $P1972, "Undef"
  vivify_571:
    $P1972."symbol"("$/", "lexical" :named("scope"))
.annotate "line", 706
    new $P1973, "Exception"
    set $P1973['type'], 58
    new $P1974, "Integer"
    assign $P1974, 0
    setattribute $P1973, 'payload', $P1974
    throw $P1973
  if_1965_end:
.annotate "line", 709
    get_hll_global $P1975, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1976, "$/"
    unless_null $P1976, vivify_572
    new $P1976, "Hash"
  vivify_572:
    set $P1977, $P1976["p6regex"]
    unless_null $P1977, vivify_573
    new $P1977, "Undef"
  vivify_573:
    $P1978 = $P1977."ast"()
    get_global $P1979, "@BLOCK"
    $P1980 = $P1979."shift"()
    $P1981 = $P1975($P1978, $P1980)
    store_lex "$regex", $P1981
.annotate "line", 711
    get_hll_global $P1982, ["PAST"], "Op"
.annotate "line", 713
    get_hll_global $P1983, ["PAST"], "Var"
    new $P1984, "ResizablePMCArray"
    push $P1984, "Regex"
    $P1985 = $P1983."new"("Regex" :named("name"), $P1984 :named("namespace"), "package" :named("scope"))
    find_lex $P1986, "$regex"
    $P1987 = $P1982."new"($P1985, $P1986, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate "line", 711
    store_lex "$past", $P1987
.annotate "line", 717
    find_lex $P1988, "$regex"
    find_lex $P1989, "$past"
    unless_null $P1989, vivify_574
    new $P1989, "Hash"
    store_lex "$past", $P1989
  vivify_574:
    set $P1989["sink"], $P1988
.annotate "line", 718
    find_lex $P1990, "$/"
    find_lex $P1991, "$past"
    $P1992 = $P1990."!make"($P1991)
.annotate "line", 698
    .return ($P1992)
  control_1958:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1993, exception, "payload"
    .return ($P1993)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<$>"  :subid("111_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_1997
.annotate "line", 721
    new $P1996, 'ExceptionHandler'
    set_addr $P1996, control_1995
    $P1996."handle_types"(58)
    push_eh $P1996
    .lex "self", self
    .lex "$/", param_1997
    find_lex $P1998, "$/"
    find_lex $P1999, "$/"
    unless_null $P1999, vivify_575
    new $P1999, "Hash"
  vivify_575:
    set $P2000, $P1999["variable"]
    unless_null $P2000, vivify_576
    new $P2000, "Undef"
  vivify_576:
    $P2001 = $P2000."ast"()
    $P2002 = $P1998."!make"($P2001)
    .return ($P2002)
  control_1995:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2003, exception, "payload"
    .return ($P2003)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<{ }>"  :subid("112_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_2007
.annotate "line", 722
    new $P2006, 'ExceptionHandler'
    set_addr $P2006, control_2005
    $P2006."handle_types"(58)
    push_eh $P2006
    .lex "self", self
    .lex "$/", param_2007
.annotate "line", 723
    find_lex $P2008, "$/"
    get_hll_global $P2009, ["PAST"], "Op"
.annotate "line", 724
    find_lex $P2010, "$/"
    unless_null $P2010, vivify_577
    new $P2010, "Hash"
  vivify_577:
    set $P2011, $P2010["block"]
    unless_null $P2011, vivify_578
    new $P2011, "Undef"
  vivify_578:
    $P2012 = $P2011."ast"()
    $P2013 = "block_immediate"($P2012)
    find_lex $P2014, "$/"
    $P2015 = $P2009."new"($P2013, "set S*" :named("pirop"), $P2014 :named("node"))
.annotate "line", 723
    $P2016 = $P2008."!make"($P2015)
.annotate "line", 722
    .return ($P2016)
  control_2005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2017, exception, "payload"
    .return ($P2017)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<.>"  :subid("113_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_2021
.annotate "line", 730
    new $P2020, 'ExceptionHandler'
    set_addr $P2020, control_2019
    $P2020."handle_types"(58)
    push_eh $P2020
    .lex "self", self
    .lex "$/", param_2021
    find_lex $P2022, "$/"
    find_lex $P2023, "$/"
    unless_null $P2023, vivify_579
    new $P2023, "Hash"
  vivify_579:
    set $P2024, $P2023["dotty"]
    unless_null $P2024, vivify_580
    new $P2024, "Undef"
  vivify_580:
    $P2025 = $P2024."ast"()
    $P2026 = $P2022."!make"($P2025)
    .return ($P2026)
  control_2019:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2027, exception, "payload"
    .return ($P2027)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<++>"  :subid("114_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_2031
.annotate "line", 732
    new $P2030, 'ExceptionHandler'
    set_addr $P2030, control_2029
    $P2030."handle_types"(58)
    push_eh $P2030
    .lex "self", self
    .lex "$/", param_2031
.annotate "line", 733
    find_lex $P2032, "$/"
    get_hll_global $P2033, ["PAST"], "Op"
.annotate "line", 734
    new $P2034, "ResizablePMCArray"
    push $P2034, "    clone %r, %0"
    push $P2034, "    inc %0"
    $P2035 = $P2033."new"("postfix:<++>" :named("name"), $P2034 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 733
    $P2036 = $P2032."!make"($P2035)
.annotate "line", 732
    .return ($P2036)
  control_2029:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2037, exception, "payload"
    .return ($P2037)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<-->"  :subid("115_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_2041
.annotate "line", 738
    new $P2040, 'ExceptionHandler'
    set_addr $P2040, control_2039
    $P2040."handle_types"(58)
    push_eh $P2040
    .lex "self", self
    .lex "$/", param_2041
.annotate "line", 739
    find_lex $P2042, "$/"
    get_hll_global $P2043, ["PAST"], "Op"
.annotate "line", 740
    new $P2044, "ResizablePMCArray"
    push $P2044, "    clone %r, %0"
    push $P2044, "    dec %0"
    $P2045 = $P2043."new"("postfix:<-->" :named("name"), $P2044 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 739
    $P2046 = $P2042."!make"($P2045)
.annotate "line", 738
    .return ($P2046)
  control_2039:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2047, exception, "payload"
    .return ($P2047)
.end


.namespace ["NQP";"Actions"]
.sub "prefix:sym<make>"  :subid("116_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_2051
.annotate "line", 744
    new $P2050, 'ExceptionHandler'
    set_addr $P2050, control_2049
    $P2050."handle_types"(58)
    push_eh $P2050
    .lex "self", self
    .lex "$/", param_2051
.annotate "line", 745
    find_lex $P2052, "$/"
    get_hll_global $P2053, ["PAST"], "Op"
.annotate "line", 746
    get_hll_global $P2054, ["PAST"], "Var"
    $P2055 = $P2054."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P2056, "$/"
    $P2057 = $P2053."new"($P2055, "callmethod" :named("pasttype"), "!make" :named("name"), $P2056 :named("node"))
.annotate "line", 745
    $P2058 = $P2052."!make"($P2057)
.annotate "line", 744
    .return ($P2058)
  control_2049:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2059, exception, "payload"
    .return ($P2059)
.end


.namespace ["NQP";"Actions"]
.sub "infix:sym<~~>"  :subid("117_1260829329.07487") :method :outer("11_1260829329.07487")
    .param pmc param_2063
.annotate "line", 753
    new $P2062, 'ExceptionHandler'
    set_addr $P2062, control_2061
    $P2062."handle_types"(58)
    push_eh $P2062
    .lex "self", self
    .lex "$/", param_2063
.annotate "line", 754
    find_lex $P2064, "$/"
    get_hll_global $P2065, ["PAST"], "Op"
    find_lex $P2066, "$/"
    $P2067 = $P2065."new"("callmethod" :named("pasttype"), "ACCEPTS" :named("name"), $P2066 :named("node"))
    $P2068 = $P2064."!make"($P2067)
.annotate "line", 753
    .return ($P2068)
  control_2061:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2069, exception, "payload"
    .return ($P2069)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block2070"  :subid("118_1260829329.07487") :outer("11_1260829329.07487")
.annotate "line", 758
    .const 'Sub' $P2106 = "122_1260829329.07487" 
    capture_lex $P2106
    .const 'Sub' $P2096 = "121_1260829329.07487" 
    capture_lex $P2096
    .const 'Sub' $P2086 = "120_1260829329.07487" 
    capture_lex $P2086
    .const 'Sub' $P2072 = "119_1260829329.07487" 
    capture_lex $P2072
.annotate "line", 769
    .const 'Sub' $P2106 = "122_1260829329.07487" 
    capture_lex $P2106
.annotate "line", 758
    .return ($P2106)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<:my>"  :subid("119_1260829329.07487") :method :outer("118_1260829329.07487")
    .param pmc param_2075
.annotate "line", 760
    new $P2074, 'ExceptionHandler'
    set_addr $P2074, control_2073
    $P2074."handle_types"(58)
    push_eh $P2074
    .lex "self", self
    .lex "$/", param_2075
.annotate "line", 761
    new $P2076, "Undef"
    .lex "$past", $P2076
    find_lex $P2077, "$/"
    unless_null $P2077, vivify_581
    new $P2077, "Hash"
  vivify_581:
    set $P2078, $P2077["statement"]
    unless_null $P2078, vivify_582
    new $P2078, "Undef"
  vivify_582:
    $P2079 = $P2078."ast"()
    store_lex "$past", $P2079
.annotate "line", 762
    find_lex $P2080, "$/"
    get_hll_global $P2081, ["PAST"], "Regex"
    find_lex $P2082, "$past"
    $P2083 = $P2081."new"($P2082, "pastnode" :named("pasttype"))
    $P2084 = $P2080."!make"($P2083)
.annotate "line", 760
    .return ($P2084)
  control_2073:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2085, exception, "payload"
    .return ($P2085)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<{ }>"  :subid("120_1260829329.07487") :method :outer("118_1260829329.07487")
    .param pmc param_2089
.annotate "line", 765
    new $P2088, 'ExceptionHandler'
    set_addr $P2088, control_2087
    $P2088."handle_types"(58)
    push_eh $P2088
    .lex "self", self
    .lex "$/", param_2089
    find_lex $P2090, "$/"
    find_lex $P2091, "$/"
    unless_null $P2091, vivify_583
    new $P2091, "Hash"
  vivify_583:
    set $P2092, $P2091["codeblock"]
    unless_null $P2092, vivify_584
    new $P2092, "Undef"
  vivify_584:
    $P2093 = $P2092."ast"()
    $P2094 = $P2090."!make"($P2093)
    .return ($P2094)
  control_2087:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2095, exception, "payload"
    .return ($P2095)
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<{ }>"  :subid("121_1260829329.07487") :method :outer("118_1260829329.07487")
    .param pmc param_2099
.annotate "line", 767
    new $P2098, 'ExceptionHandler'
    set_addr $P2098, control_2097
    $P2098."handle_types"(58)
    push_eh $P2098
    .lex "self", self
    .lex "$/", param_2099
    find_lex $P2100, "$/"
    find_lex $P2101, "$/"
    unless_null $P2101, vivify_585
    new $P2101, "Hash"
  vivify_585:
    set $P2102, $P2101["codeblock"]
    unless_null $P2102, vivify_586
    new $P2102, "Undef"
  vivify_586:
    $P2103 = $P2102."ast"()
    $P2104 = $P2100."!make"($P2103)
    .return ($P2104)
  control_2097:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2105, exception, "payload"
    .return ($P2105)
.end


.namespace ["NQP";"RegexActions"]
.sub "codeblock"  :subid("122_1260829329.07487") :method :outer("118_1260829329.07487")
    .param pmc param_2109
.annotate "line", 769
    new $P2108, 'ExceptionHandler'
    set_addr $P2108, control_2107
    $P2108."handle_types"(58)
    push_eh $P2108
    .lex "self", self
    .lex "$/", param_2109
.annotate "line", 770
    new $P2110, "Undef"
    .lex "$block", $P2110
.annotate "line", 772
    new $P2111, "Undef"
    .lex "$past", $P2111
.annotate "line", 770
    find_lex $P2112, "$/"
    unless_null $P2112, vivify_587
    new $P2112, "Hash"
  vivify_587:
    set $P2113, $P2112["block"]
    unless_null $P2113, vivify_588
    new $P2113, "Undef"
  vivify_588:
    $P2114 = $P2113."ast"()
    store_lex "$block", $P2114
.annotate "line", 771
    find_lex $P2115, "$block"
    $P2115."blocktype"("immediate")
.annotate "line", 773
    get_hll_global $P2116, ["PAST"], "Regex"
.annotate "line", 774
    get_hll_global $P2117, ["PAST"], "Stmts"
.annotate "line", 775
    get_hll_global $P2118, ["PAST"], "Op"
.annotate "line", 776
    get_hll_global $P2119, ["PAST"], "Var"
    $P2120 = $P2119."new"("$/" :named("name"))
.annotate "line", 777
    get_hll_global $P2121, ["PAST"], "Op"
.annotate "line", 778
    get_hll_global $P2122, ["PAST"], "Var"
    $P2123 = $P2122."new"(unicode:"$\x{a2}" :named("name"))
    $P2124 = $P2121."new"($P2123, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 777
    $P2125 = $P2118."new"($P2120, $P2124, "bind" :named("pasttype"))
.annotate "line", 775
    find_lex $P2126, "$block"
    $P2127 = $P2117."new"($P2125, $P2126)
.annotate "line", 774
    $P2128 = $P2116."new"($P2127, "pastnode" :named("pasttype"))
.annotate "line", 773
    store_lex "$past", $P2128
.annotate "line", 788
    find_lex $P2129, "$/"
    find_lex $P2130, "$past"
    $P2131 = $P2129."!make"($P2130)
.annotate "line", 769
    .return ($P2131)
  control_2107:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2132, exception, "payload"
    .return ($P2132)
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
