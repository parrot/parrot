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
.sub "_block11"  :anon :subid("10_1274564776.41408")
.annotate 'line', 0
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
.annotate 'line', 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
    $P1394 = $P14()
.annotate 'line', 1
    .return ($P1394)
    .const 'Sub' $P1396 = "355_1274564776.41408" 
    .return ($P1396)
.end


.namespace []
.sub "" :load :init :subid("post356") :outer("10_1274564776.41408")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1274564776.41408" 
    .local pmc block
    set block, $P12
    $P1399 = get_root_global ["parrot"], "P6metaclass"
    $P1399."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1274564776.41408") :outer("10_1274564776.41408")
.annotate 'line', 4
    get_hll_global $P1290, ["NQP";"Regex"], "_block1289" 
    capture_lex $P1290
    .const 'Sub' $P1276 = "329_1274564776.41408" 
    capture_lex $P1276
    .const 'Sub' $P1270 = "327_1274564776.41408" 
    capture_lex $P1270
    .const 'Sub' $P1264 = "325_1274564776.41408" 
    capture_lex $P1264
    .const 'Sub' $P1258 = "323_1274564776.41408" 
    capture_lex $P1258
    .const 'Sub' $P1252 = "321_1274564776.41408" 
    capture_lex $P1252
    .const 'Sub' $P1246 = "319_1274564776.41408" 
    capture_lex $P1246
    .const 'Sub' $P1239 = "317_1274564776.41408" 
    capture_lex $P1239
    .const 'Sub' $P1232 = "315_1274564776.41408" 
    capture_lex $P1232
    .const 'Sub' $P1225 = "313_1274564776.41408" 
    capture_lex $P1225
    .const 'Sub' $P1218 = "311_1274564776.41408" 
    capture_lex $P1218
    .const 'Sub' $P1212 = "309_1274564776.41408" 
    capture_lex $P1212
    .const 'Sub' $P1205 = "307_1274564776.41408" 
    capture_lex $P1205
    .const 'Sub' $P1198 = "305_1274564776.41408" 
    capture_lex $P1198
    .const 'Sub' $P1191 = "303_1274564776.41408" 
    capture_lex $P1191
    .const 'Sub' $P1184 = "301_1274564776.41408" 
    capture_lex $P1184
    .const 'Sub' $P1177 = "299_1274564776.41408" 
    capture_lex $P1177
    .const 'Sub' $P1170 = "297_1274564776.41408" 
    capture_lex $P1170
    .const 'Sub' $P1163 = "295_1274564776.41408" 
    capture_lex $P1163
    .const 'Sub' $P1156 = "293_1274564776.41408" 
    capture_lex $P1156
    .const 'Sub' $P1149 = "291_1274564776.41408" 
    capture_lex $P1149
    .const 'Sub' $P1142 = "289_1274564776.41408" 
    capture_lex $P1142
    .const 'Sub' $P1135 = "287_1274564776.41408" 
    capture_lex $P1135
    .const 'Sub' $P1128 = "285_1274564776.41408" 
    capture_lex $P1128
    .const 'Sub' $P1121 = "283_1274564776.41408" 
    capture_lex $P1121
    .const 'Sub' $P1114 = "281_1274564776.41408" 
    capture_lex $P1114
    .const 'Sub' $P1107 = "279_1274564776.41408" 
    capture_lex $P1107
    .const 'Sub' $P1100 = "277_1274564776.41408" 
    capture_lex $P1100
    .const 'Sub' $P1093 = "275_1274564776.41408" 
    capture_lex $P1093
    .const 'Sub' $P1086 = "273_1274564776.41408" 
    capture_lex $P1086
    .const 'Sub' $P1079 = "271_1274564776.41408" 
    capture_lex $P1079
    .const 'Sub' $P1072 = "269_1274564776.41408" 
    capture_lex $P1072
    .const 'Sub' $P1065 = "267_1274564776.41408" 
    capture_lex $P1065
    .const 'Sub' $P1058 = "265_1274564776.41408" 
    capture_lex $P1058
    .const 'Sub' $P1051 = "263_1274564776.41408" 
    capture_lex $P1051
    .const 'Sub' $P1044 = "261_1274564776.41408" 
    capture_lex $P1044
    .const 'Sub' $P1037 = "259_1274564776.41408" 
    capture_lex $P1037
    .const 'Sub' $P1030 = "257_1274564776.41408" 
    capture_lex $P1030
    .const 'Sub' $P1024 = "255_1274564776.41408" 
    capture_lex $P1024
    .const 'Sub' $P1017 = "253_1274564776.41408" 
    capture_lex $P1017
    .const 'Sub' $P1010 = "251_1274564776.41408" 
    capture_lex $P1010
    .const 'Sub' $P1003 = "249_1274564776.41408" 
    capture_lex $P1003
    .const 'Sub' $P996 = "247_1274564776.41408" 
    capture_lex $P996
    .const 'Sub' $P989 = "245_1274564776.41408" 
    capture_lex $P989
    .const 'Sub' $P982 = "243_1274564776.41408" 
    capture_lex $P982
    .const 'Sub' $P975 = "241_1274564776.41408" 
    capture_lex $P975
    .const 'Sub' $P969 = "239_1274564776.41408" 
    capture_lex $P969
    .const 'Sub' $P963 = "237_1274564776.41408" 
    capture_lex $P963
    .const 'Sub' $P958 = "235_1274564776.41408" 
    capture_lex $P958
    .const 'Sub' $P952 = "233_1274564776.41408" 
    capture_lex $P952
    .const 'Sub' $P946 = "231_1274564776.41408" 
    capture_lex $P946
    .const 'Sub' $P941 = "229_1274564776.41408" 
    capture_lex $P941
    .const 'Sub' $P936 = "227_1274564776.41408" 
    capture_lex $P936
    .const 'Sub' $P929 = "225_1274564776.41408" 
    capture_lex $P929
    .const 'Sub' $P921 = "223_1274564776.41408" 
    capture_lex $P921
    .const 'Sub' $P916 = "221_1274564776.41408" 
    capture_lex $P916
    .const 'Sub' $P911 = "219_1274564776.41408" 
    capture_lex $P911
    .const 'Sub' $P906 = "217_1274564776.41408" 
    capture_lex $P906
    .const 'Sub' $P898 = "215_1274564776.41408" 
    capture_lex $P898
    .const 'Sub' $P890 = "213_1274564776.41408" 
    capture_lex $P890
    .const 'Sub' $P885 = "211_1274564776.41408" 
    capture_lex $P885
    .const 'Sub' $P880 = "209_1274564776.41408" 
    capture_lex $P880
    .const 'Sub' $P875 = "207_1274564776.41408" 
    capture_lex $P875
    .const 'Sub' $P869 = "205_1274564776.41408" 
    capture_lex $P869
    .const 'Sub' $P863 = "203_1274564776.41408" 
    capture_lex $P863
    .const 'Sub' $P857 = "201_1274564776.41408" 
    capture_lex $P857
    .const 'Sub' $P851 = "199_1274564776.41408" 
    capture_lex $P851
    .const 'Sub' $P845 = "197_1274564776.41408" 
    capture_lex $P845
    .const 'Sub' $P840 = "195_1274564776.41408" 
    capture_lex $P840
    .const 'Sub' $P835 = "193_1274564776.41408" 
    capture_lex $P835
    .const 'Sub' $P822 = "189_1274564776.41408" 
    capture_lex $P822
    .const 'Sub' $P814 = "187_1274564776.41408" 
    capture_lex $P814
    .const 'Sub' $P808 = "185_1274564776.41408" 
    capture_lex $P808
    .const 'Sub' $P801 = "183_1274564776.41408" 
    capture_lex $P801
    .const 'Sub' $P795 = "181_1274564776.41408" 
    capture_lex $P795
    .const 'Sub' $P787 = "179_1274564776.41408" 
    capture_lex $P787
    .const 'Sub' $P779 = "177_1274564776.41408" 
    capture_lex $P779
    .const 'Sub' $P773 = "175_1274564776.41408" 
    capture_lex $P773
    .const 'Sub' $P767 = "173_1274564776.41408" 
    capture_lex $P767
    .const 'Sub' $P752 = "169_1274564776.41408" 
    capture_lex $P752
    .const 'Sub' $P715 = "167_1274564776.41408" 
    capture_lex $P715
    .const 'Sub' $P707 = "165_1274564776.41408" 
    capture_lex $P707
    .const 'Sub' $P701 = "163_1274564776.41408" 
    capture_lex $P701
    .const 'Sub' $P691 = "161_1274564776.41408" 
    capture_lex $P691
    .const 'Sub' $P677 = "159_1274564776.41408" 
    capture_lex $P677
    .const 'Sub' $P668 = "157_1274564776.41408" 
    capture_lex $P668
    .const 'Sub' $P649 = "155_1274564776.41408" 
    capture_lex $P649
    .const 'Sub' $P625 = "153_1274564776.41408" 
    capture_lex $P625
    .const 'Sub' $P618 = "151_1274564776.41408" 
    capture_lex $P618
    .const 'Sub' $P611 = "149_1274564776.41408" 
    capture_lex $P611
    .const 'Sub' $P601 = "145_1274564776.41408" 
    capture_lex $P601
    .const 'Sub' $P593 = "143_1274564776.41408" 
    capture_lex $P593
    .const 'Sub' $P587 = "141_1274564776.41408" 
    capture_lex $P587
    .const 'Sub' $P573 = "139_1274564776.41408" 
    capture_lex $P573
    .const 'Sub' $P566 = "137_1274564776.41408" 
    capture_lex $P566
    .const 'Sub' $P559 = "135_1274564776.41408" 
    capture_lex $P559
    .const 'Sub' $P552 = "133_1274564776.41408" 
    capture_lex $P552
    .const 'Sub' $P525 = "129_1274564776.41408" 
    capture_lex $P525
    .const 'Sub' $P516 = "127_1274564776.41408" 
    capture_lex $P516
    .const 'Sub' $P509 = "125_1274564776.41408" 
    capture_lex $P509
    .const 'Sub' $P500 = "121_1274564776.41408" 
    capture_lex $P500
    .const 'Sub' $P495 = "119_1274564776.41408" 
    capture_lex $P495
    .const 'Sub' $P483 = "117_1274564776.41408" 
    capture_lex $P483
    .const 'Sub' $P471 = "115_1274564776.41408" 
    capture_lex $P471
    .const 'Sub' $P463 = "113_1274564776.41408" 
    capture_lex $P463
    .const 'Sub' $P458 = "111_1274564776.41408" 
    capture_lex $P458
    .const 'Sub' $P452 = "109_1274564776.41408" 
    capture_lex $P452
    .const 'Sub' $P446 = "107_1274564776.41408" 
    capture_lex $P446
    .const 'Sub' $P440 = "105_1274564776.41408" 
    capture_lex $P440
    .const 'Sub' $P434 = "103_1274564776.41408" 
    capture_lex $P434
    .const 'Sub' $P428 = "101_1274564776.41408" 
    capture_lex $P428
    .const 'Sub' $P422 = "99_1274564776.41408" 
    capture_lex $P422
    .const 'Sub' $P416 = "97_1274564776.41408" 
    capture_lex $P416
    .const 'Sub' $P410 = "95_1274564776.41408" 
    capture_lex $P410
    .const 'Sub' $P402 = "93_1274564776.41408" 
    capture_lex $P402
    .const 'Sub' $P394 = "91_1274564776.41408" 
    capture_lex $P394
    .const 'Sub' $P382 = "87_1274564776.41408" 
    capture_lex $P382
    .const 'Sub' $P374 = "85_1274564776.41408" 
    capture_lex $P374
    .const 'Sub' $P364 = "81_1274564776.41408" 
    capture_lex $P364
    .const 'Sub' $P357 = "79_1274564776.41408" 
    capture_lex $P357
    .const 'Sub' $P350 = "77_1274564776.41408" 
    capture_lex $P350
    .const 'Sub' $P338 = "73_1274564776.41408" 
    capture_lex $P338
    .const 'Sub' $P330 = "71_1274564776.41408" 
    capture_lex $P330
    .const 'Sub' $P322 = "69_1274564776.41408" 
    capture_lex $P322
    .const 'Sub' $P302 = "67_1274564776.41408" 
    capture_lex $P302
    .const 'Sub' $P293 = "65_1274564776.41408" 
    capture_lex $P293
    .const 'Sub' $P275 = "62_1274564776.41408" 
    capture_lex $P275
    .const 'Sub' $P255 = "60_1274564776.41408" 
    capture_lex $P255
    .const 'Sub' $P246 = "56_1274564776.41408" 
    capture_lex $P246
    .const 'Sub' $P241 = "54_1274564776.41408" 
    capture_lex $P241
    .const 'Sub' $P232 = "50_1274564776.41408" 
    capture_lex $P232
    .const 'Sub' $P227 = "48_1274564776.41408" 
    capture_lex $P227
    .const 'Sub' $P219 = "46_1274564776.41408" 
    capture_lex $P219
    .const 'Sub' $P212 = "44_1274564776.41408" 
    capture_lex $P212
    .const 'Sub' $P206 = "42_1274564776.41408" 
    capture_lex $P206
    .const 'Sub' $P198 = "40_1274564776.41408" 
    capture_lex $P198
    .const 'Sub' $P192 = "38_1274564776.41408" 
    capture_lex $P192
    .const 'Sub' $P186 = "36_1274564776.41408" 
    capture_lex $P186
    .const 'Sub' $P170 = "33_1274564776.41408" 
    capture_lex $P170
    .const 'Sub' $P157 = "31_1274564776.41408" 
    capture_lex $P157
    .const 'Sub' $P150 = "29_1274564776.41408" 
    capture_lex $P150
    .const 'Sub' $P100 = "26_1274564776.41408" 
    capture_lex $P100
    .const 'Sub' $P82 = "23_1274564776.41408" 
    capture_lex $P82
    .const 'Sub' $P68 = "21_1274564776.41408" 
    capture_lex $P68
    .const 'Sub' $P54 = "19_1274564776.41408" 
    capture_lex $P54
    .const 'Sub' $P46 = "17_1274564776.41408" 
    capture_lex $P46
    .const 'Sub' $P39 = "15_1274564776.41408" 
    capture_lex $P39
    .const 'Sub' $P33 = "13_1274564776.41408" 
    capture_lex $P33
    .const 'Sub' $P15 = "12_1274564776.41408" 
    capture_lex $P15
.annotate 'line', 548
    get_hll_global $P1290, ["NQP";"Regex"], "_block1289" 
    capture_lex $P1290
    $P1373 = $P1290()
.annotate 'line', 4
    .return ($P1373)
    .const 'Sub' $P1375 = "354_1274564776.41408" 
    .return ($P1375)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post357") :outer("11_1274564776.41408")
.annotate 'line', 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 432
    get_hll_global $P1378, ["NQP"], "Grammar"
    $P1378."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate 'line', 433
    get_hll_global $P1379, ["NQP"], "Grammar"
    $P1379."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate 'line', 434
    get_hll_global $P1380, ["NQP"], "Grammar"
    $P1380."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate 'line', 435
    get_hll_global $P1381, ["NQP"], "Grammar"
    $P1381."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate 'line', 436
    get_hll_global $P1382, ["NQP"], "Grammar"
    $P1382."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate 'line', 437
    get_hll_global $P1383, ["NQP"], "Grammar"
    $P1383."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate 'line', 438
    get_hll_global $P1384, ["NQP"], "Grammar"
    $P1384."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate 'line', 439
    get_hll_global $P1385, ["NQP"], "Grammar"
    $P1385."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate 'line', 440
    get_hll_global $P1386, ["NQP"], "Grammar"
    $P1386."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate 'line', 441
    get_hll_global $P1387, ["NQP"], "Grammar"
    $P1387."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate 'line', 442
    get_hll_global $P1388, ["NQP"], "Grammar"
    $P1388."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate 'line', 443
    get_hll_global $P1389, ["NQP"], "Grammar"
    $P1389."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate 'line', 444
    get_hll_global $P1390, ["NQP"], "Grammar"
    $P1390."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate 'line', 445
    get_hll_global $P1391, ["NQP"], "Grammar"
    $P1391."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate 'line', 446
    get_hll_global $P1392, ["NQP"], "Grammar"
    $P1392."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate 'line', 431
    $P1393 = get_root_global ["parrot"], "P6metaclass"
    $P1393."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "TOP"  :subid("12_1274564776.41408") :method :outer("11_1274564776.41408")
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
    unless_null $P20, vivify_358
    get_hll_global $P20, "%LANG"
    unless_null $P20, vivify_359
    die "Contextual %*LANG not found"
  vivify_359:
  vivify_358:
.annotate 'line', 6
    get_hll_global $P21, ["NQP"], "Regex"
    find_lex $P22, "%*LANG"
    unless_null $P22, vivify_360
    get_hll_global $P22, "%LANG"
    unless_null $P22, vivify_361
    die "Contextual %*LANG not found"
  vivify_361:
    store_lex "%*LANG", $P22
  vivify_360:
    set $P22["Regex"], $P21
.annotate 'line', 7
    get_hll_global $P23, ["NQP"], "RegexActions"
    find_lex $P24, "%*LANG"
    unless_null $P24, vivify_362
    get_hll_global $P24, "%LANG"
    unless_null $P24, vivify_363
    die "Contextual %*LANG not found"
  vivify_363:
    store_lex "%*LANG", $P24
  vivify_362:
    set $P24["Regex-actions"], $P23
.annotate 'line', 8
    get_hll_global $P25, ["NQP"], "Grammar"
    find_lex $P26, "%*LANG"
    unless_null $P26, vivify_364
    get_hll_global $P26, "%LANG"
    unless_null $P26, vivify_365
    die "Contextual %*LANG not found"
  vivify_365:
    store_lex "%*LANG", $P26
  vivify_364:
    set $P26["MAIN"], $P25
.annotate 'line', 9
    get_hll_global $P27, ["NQP"], "Actions"
    find_lex $P28, "%*LANG"
    unless_null $P28, vivify_366
    get_hll_global $P28, "%LANG"
    unless_null $P28, vivify_367
    die "Contextual %*LANG not found"
  vivify_367:
    store_lex "%*LANG", $P28
  vivify_366:
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
.sub "identifier"  :subid("13_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__identifier"  :subid("14_1274564776.41408") :method
.annotate 'line', 4
    $P36 = self."!PREFIX__!subrule"("ident", "")
    new $P37, "ResizablePMCArray"
    push $P37, $P36
    .return ($P37)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__name"  :subid("16_1274564776.41408") :method
.annotate 'line', 4
    new $P42, "ResizablePMCArray"
    push $P42, ""
    .return ($P42)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__deflongname"  :subid("18_1274564776.41408") :method
.annotate 'line', 4
    $P49 = self."!PREFIX__!subrule"("identifier", "")
    new $P50, "ResizablePMCArray"
    push $P50, $P49
    .return ($P50)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__ENDSTMT"  :subid("20_1274564776.41408") :method
.annotate 'line', 4
    new $P57, "ResizablePMCArray"
    push $P57, ""
    .return ($P57)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__ws"  :subid("22_1274564776.41408") :method
.annotate 'line', 4
    new $P71, "ResizablePMCArray"
    push $P71, ""
    push $P71, ""
    .return ($P71)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .const 'Sub' $P90 = "25_1274564776.41408" 
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
    .const 'Sub' $P90 = "25_1274564776.41408" 
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
.sub "!PREFIX__unv"  :subid("24_1274564776.41408") :method
.annotate 'line', 4
    new $P85, "ResizablePMCArray"
    push $P85, ""
    push $P85, ""
    push $P85, ""
    .return ($P85)
.end


.namespace ["NQP";"Grammar"]
.sub "_block89"  :anon :subid("25_1274564776.41408") :method :outer("23_1274564776.41408")
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
.sub "pod_comment"  :subid("26_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .const 'Sub' $P141 = "28_1274564776.41408" 
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
    .const 'Sub' $P141 = "28_1274564776.41408" 
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
.sub "!PREFIX__pod_comment"  :subid("27_1274564776.41408") :method
.annotate 'line', 4
    new $P103, "ResizablePMCArray"
    push $P103, ""
    .return ($P103)
.end


.namespace ["NQP";"Grammar"]
.sub "_block140"  :anon :subid("28_1274564776.41408") :method :outer("26_1274564776.41408")
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
.sub "comp_unit"  :subid("29_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__comp_unit"  :subid("30_1274564776.41408") :method
.annotate 'line', 4
    $P153 = self."!PREFIX__!subrule"("", "")
    new $P154, "ResizablePMCArray"
    push $P154, $P153
    .return ($P154)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__statementlist"  :subid("32_1274564776.41408") :method
.annotate 'line', 4
    new $P160, "ResizablePMCArray"
    push $P160, ""
    push $P160, ""
    .return ($P160)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .const 'Sub' $P176 = "35_1274564776.41408" 
    capture_lex $P176
    .local string rx171_tgt
    .local int rx171_pos
    .local int rx171_off
    .local int rx171_eos
    .local int rx171_rep
    .local pmc rx171_cur
    (rx171_cur, rx171_pos, rx171_tgt) = self."!cursor_start"()
    rx171_cur."!cursor_debug"("START ", "statement")
    rx171_cur."!cursor_caparray"("statement_mod_loop", "statement_mod_cond")
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
    .const 'Sub' $P176 = "35_1274564776.41408" 
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
.sub "!PREFIX__statement"  :subid("34_1274564776.41408") :method
.annotate 'line', 4
    new $P173, "ResizablePMCArray"
    push $P173, ""
    .return ($P173)
.end


.namespace ["NQP";"Grammar"]
.sub "_block175"  :anon :subid("35_1274564776.41408") :method :outer("33_1274564776.41408")
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
.sub "eat_terminator"  :subid("36_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__eat_terminator"  :subid("37_1274564776.41408") :method
.annotate 'line', 4
    new $P189, "ResizablePMCArray"
    push $P189, ""
    push $P189, ""
    push $P189, ""
    push $P189, ";"
    .return ($P189)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__xblock"  :subid("39_1274564776.41408") :method
.annotate 'line', 4
    $P195 = self."!PREFIX__!subrule"("EXPR", "")
    new $P196, "ResizablePMCArray"
    push $P196, $P195
    .return ($P196)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__pblock"  :subid("41_1274564776.41408") :method
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
.sub "lambda"  :subid("42_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__lambda"  :subid("43_1274564776.41408") :method
.annotate 'line', 4
    new $P209, "ResizablePMCArray"
    push $P209, "<->"
    push $P209, "->"
    .return ($P209)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__block"  :subid("45_1274564776.41408") :method
.annotate 'line', 4
    $P215 = self."!PREFIX__!subrule"("", "")
    new $P216, "ResizablePMCArray"
    push $P216, $P215
    push $P216, "{"
    .return ($P216)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__blockoid"  :subid("47_1274564776.41408") :method
.annotate 'line', 4
    $P222 = self."!PREFIX__!subrule"("", "")
    new $P223, "ResizablePMCArray"
    push $P223, $P222
    .return ($P223)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__newpad"  :subid("49_1274564776.41408") :method
.annotate 'line', 4
    new $P230, "ResizablePMCArray"
    push $P230, ""
    .return ($P230)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("50_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__finishpad"  :subid("51_1274564776.41408") :method
.annotate 'line', 4
    new $P235, "ResizablePMCArray"
    push $P235, ""
    .return ($P235)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("52_1274564776.41408") :method
.annotate 'line', 145
    $P238 = self."!protoregex"("terminator")
    .return ($P238)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("53_1274564776.41408") :method
.annotate 'line', 145
    $P240 = self."!PREFIX__!protoregex"("terminator")
    .return ($P240)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("54_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__terminator:sym<;>"  :subid("55_1274564776.41408") :method
.annotate 'line', 4
    new $P244, "ResizablePMCArray"
    push $P244, ";"
    .return ($P244)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("56_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__terminator:sym<}>"  :subid("57_1274564776.41408") :method
.annotate 'line', 4
    new $P249, "ResizablePMCArray"
    push $P249, "}"
    .return ($P249)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("58_1274564776.41408") :method
.annotate 'line', 152
    $P252 = self."!protoregex"("statement_control")
    .return ($P252)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("59_1274564776.41408") :method
.annotate 'line', 152
    $P254 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P254)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("60_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__statement_control:sym<if>"  :subid("61_1274564776.41408") :method
.annotate 'line', 4
    new $P258, "ResizablePMCArray"
    push $P258, "if"
    .return ($P258)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("62_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .const 'Sub' $P286 = "64_1274564776.41408" 
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
    .const 'Sub' $P286 = "64_1274564776.41408" 
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
.sub "!PREFIX__statement_control:sym<unless>"  :subid("63_1274564776.41408") :method
.annotate 'line', 4
    new $P278, "ResizablePMCArray"
    push $P278, "unless"
    .return ($P278)
.end


.namespace ["NQP";"Grammar"]
.sub "_block285"  :anon :subid("64_1274564776.41408") :method :outer("62_1274564776.41408")
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
.sub "statement_control:sym<while>"  :subid("65_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__statement_control:sym<while>"  :subid("66_1274564776.41408") :method
.annotate 'line', 4
    new $P296, "ResizablePMCArray"
    push $P296, "until"
    push $P296, "while"
    .return ($P296)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("67_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("68_1274564776.41408") :method
.annotate 'line', 4
    new $P305, "ResizablePMCArray"
    push $P305, "repeat"
    .return ($P305)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("69_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__statement_control:sym<for>"  :subid("70_1274564776.41408") :method
.annotate 'line', 4
    new $P325, "ResizablePMCArray"
    push $P325, "for"
    .return ($P325)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CATCH>"  :subid("71_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__statement_control:sym<CATCH>"  :subid("72_1274564776.41408") :method
.annotate 'line', 4
    new $P333, "ResizablePMCArray"
    push $P333, "CATCH"
    .return ($P333)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CONTROL>"  :subid("73_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__statement_control:sym<CONTROL>"  :subid("74_1274564776.41408") :method
.annotate 'line', 4
    new $P341, "ResizablePMCArray"
    push $P341, "CONTROL"
    .return ($P341)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("75_1274564776.41408") :method
.annotate 'line', 195
    $P347 = self."!protoregex"("statement_prefix")
    .return ($P347)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("76_1274564776.41408") :method
.annotate 'line', 195
    $P349 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P349)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("77_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("78_1274564776.41408") :method
.annotate 'line', 4
    $P353 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P354, "ResizablePMCArray"
    push $P354, $P353
    .return ($P354)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<try>"  :subid("79_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__statement_prefix:sym<try>"  :subid("80_1274564776.41408") :method
.annotate 'line', 4
    $P360 = self."!PREFIX__!subrule"("blorst", "try")
    new $P361, "ResizablePMCArray"
    push $P361, $P360
    .return ($P361)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("81_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__blorst"  :subid("82_1274564776.41408") :method
.annotate 'line', 4
    new $P367, "ResizablePMCArray"
    push $P367, ""
    .return ($P367)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("83_1274564776.41408") :method
.annotate 'line', 209
    $P371 = self."!protoregex"("statement_mod_cond")
    .return ($P371)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("84_1274564776.41408") :method
.annotate 'line', 209
    $P373 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P373)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("85_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("86_1274564776.41408") :method
.annotate 'line', 4
    new $P377, "ResizablePMCArray"
    push $P377, "if"
    .return ($P377)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("87_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("88_1274564776.41408") :method
.annotate 'line', 4
    new $P385, "ResizablePMCArray"
    push $P385, "unless"
    .return ($P385)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("89_1274564776.41408") :method
.annotate 'line', 214
    $P391 = self."!protoregex"("statement_mod_loop")
    .return ($P391)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("90_1274564776.41408") :method
.annotate 'line', 214
    $P393 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P393)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("91_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("92_1274564776.41408") :method
.annotate 'line', 4
    new $P397, "ResizablePMCArray"
    push $P397, "while"
    .return ($P397)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("93_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("94_1274564776.41408") :method
.annotate 'line', 4
    new $P405, "ResizablePMCArray"
    push $P405, "until"
    .return ($P405)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<fatarrow>"  :subid("95_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__term:sym<fatarrow>"  :subid("96_1274564776.41408") :method
.annotate 'line', 4
    $P413 = self."!PREFIX__!subrule"("fatarrow", "")
    new $P414, "ResizablePMCArray"
    push $P414, $P413
    .return ($P414)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("97_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__term:sym<colonpair>"  :subid("98_1274564776.41408") :method
.annotate 'line', 4
    $P419 = self."!PREFIX__!subrule"("colonpair", "")
    new $P420, "ResizablePMCArray"
    push $P420, $P419
    .return ($P420)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("99_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__term:sym<variable>"  :subid("100_1274564776.41408") :method
.annotate 'line', 4
    $P425 = self."!PREFIX__!subrule"("variable", "")
    new $P426, "ResizablePMCArray"
    push $P426, $P425
    .return ($P426)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("101_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__term:sym<package_declarator>"  :subid("102_1274564776.41408") :method
.annotate 'line', 4
    $P431 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P432, "ResizablePMCArray"
    push $P432, $P431
    .return ($P432)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("103_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("104_1274564776.41408") :method
.annotate 'line', 4
    $P437 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P438, "ResizablePMCArray"
    push $P438, $P437
    .return ($P438)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("105_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("106_1274564776.41408") :method
.annotate 'line', 4
    $P443 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P444, "ResizablePMCArray"
    push $P444, $P443
    .return ($P444)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("107_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("108_1274564776.41408") :method
.annotate 'line', 4
    $P449 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P450, "ResizablePMCArray"
    push $P450, $P449
    .return ($P450)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("109_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("110_1274564776.41408") :method
.annotate 'line', 4
    $P455 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P456, "ResizablePMCArray"
    push $P456, $P455
    .return ($P456)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("111_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__term:sym<lambda>"  :subid("112_1274564776.41408") :method
.annotate 'line', 4
    new $P461, "ResizablePMCArray"
    push $P461, ""
    .return ($P461)
.end


.namespace ["NQP";"Grammar"]
.sub "fatarrow"  :subid("113_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__fatarrow"  :subid("114_1274564776.41408") :method
.annotate 'line', 4
    $P466 = self."!PREFIX__!subrule"("key", "")
    new $P467, "ResizablePMCArray"
    push $P467, $P466
    .return ($P467)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("115_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__colonpair"  :subid("116_1274564776.41408") :method
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
.sub "variable"  :subid("117_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__variable"  :subid("118_1274564776.41408") :method
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
.sub "sigil"  :subid("119_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__sigil"  :subid("120_1274564776.41408") :method
.annotate 'line', 4
    new $P498, "ResizablePMCArray"
    push $P498, "&"
    push $P498, "%"
    push $P498, "@"
    push $P498, "$"
    .return ($P498)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("121_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__twigil"  :subid("122_1274564776.41408") :method
.annotate 'line', 4
    new $P503, "ResizablePMCArray"
    push $P503, "?"
    push $P503, "!"
    push $P503, "*"
    .return ($P503)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("123_1274564776.41408") :method
.annotate 'line', 254
    $P506 = self."!protoregex"("package_declarator")
    .return ($P506)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("124_1274564776.41408") :method
.annotate 'line', 254
    $P508 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P508)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("125_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__package_declarator:sym<module>"  :subid("126_1274564776.41408") :method
.annotate 'line', 4
    $P512 = self."!PREFIX__!subrule"("package_def", "module")
    new $P513, "ResizablePMCArray"
    push $P513, $P512
    .return ($P513)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("127_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__package_declarator:sym<class>"  :subid("128_1274564776.41408") :method
.annotate 'line', 4
    $P519 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P520 = self."!PREFIX__!subrule"("package_def", "class")
    new $P521, "ResizablePMCArray"
    push $P521, $P519
    push $P521, $P520
    .return ($P521)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("129_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__package_def"  :subid("130_1274564776.41408") :method
.annotate 'line', 4
    new $P528, "ResizablePMCArray"
    push $P528, ""
    .return ($P528)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("131_1274564776.41408") :method
.annotate 'line', 268
    $P549 = self."!protoregex"("scope_declarator")
    .return ($P549)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("132_1274564776.41408") :method
.annotate 'line', 268
    $P551 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P551)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("133_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("134_1274564776.41408") :method
.annotate 'line', 4
    $P555 = self."!PREFIX__!subrule"("scoped", "my")
    new $P556, "ResizablePMCArray"
    push $P556, $P555
    .return ($P556)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("135_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("136_1274564776.41408") :method
.annotate 'line', 4
    $P562 = self."!PREFIX__!subrule"("scoped", "our")
    new $P563, "ResizablePMCArray"
    push $P563, $P562
    .return ($P563)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("137_1274564776.41408") :method :outer("11_1274564776.41408")
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
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("138_1274564776.41408") :method
.annotate 'line', 4
    $P569 = self."!PREFIX__!subrule"("scoped", "has")
    new $P570, "ResizablePMCArray"
    push $P570, $P569
    .return ($P570)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("139_1274564776.41408") :method :outer("11_1274564776.41408")
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
    rx575_cur."!cursor_caparray"("typename")
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
  # rx subrule "declarator" subtype=capture negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."declarator"()
    unless $P10, rx575_fail
    rx575_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
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
  # rx rxquantr583 ** 1..*
    set_addr $I584, rxquantr583_done
    rx575_cur."!mark_push"(0, -1, $I584)
  rxquantr583_loop:
  # rx subrule "typename" subtype=capture negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."typename"()
    unless $P10, rx575_fail
    rx575_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("typename")
    rx575_pos = $P10."pos"()
    (rx575_rep) = rx575_cur."!mark_commit"($I584)
    rx575_cur."!mark_push"(rx575_rep, rx575_pos, $I584)
    goto rxquantr583_loop
  rxquantr583_done:
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
  # rx subrule "declarator" subtype=capture negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."declarator"()
    unless $P10, rx575_fail
    rx575_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
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
.sub "!PREFIX__scoped"  :subid("140_1274564776.41408") :method
.annotate 'line', 4
    new $P577, "ResizablePMCArray"
    push $P577, ""
    push $P577, ""
    .return ($P577)
.end


.namespace ["NQP";"Grammar"]
.sub "typename"  :subid("141_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx588_tgt
    .local int rx588_pos
    .local int rx588_off
    .local int rx588_eos
    .local int rx588_rep
    .local pmc rx588_cur
    (rx588_cur, rx588_pos, rx588_tgt) = self."!cursor_start"()
    rx588_cur."!cursor_debug"("START ", "typename")
    .lex unicode:"$\x{a2}", rx588_cur
    .local pmc match
    .lex "$/", match
    length rx588_eos, rx588_tgt
    set rx588_off, 0
    lt rx588_pos, 2, rx588_start
    sub rx588_off, rx588_pos, 1
    substr rx588_tgt, rx588_tgt, rx588_off
  rx588_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan592_done
    goto rxscan592_scan
  rxscan592_loop:
    ($P10) = rx588_cur."from"()
    inc $P10
    set rx588_pos, $P10
    ge rx588_pos, rx588_eos, rxscan592_done
  rxscan592_scan:
    set_addr $I10, rxscan592_loop
    rx588_cur."!mark_push"(0, rx588_pos, $I10)
  rxscan592_done:
.annotate 'line', 278
  # rx subrule "name" subtype=capture negate=
    rx588_cur."!cursor_pos"(rx588_pos)
    $P10 = rx588_cur."name"()
    unless $P10, rx588_fail
    rx588_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx588_pos = $P10."pos"()
  # rx pass
    rx588_cur."!cursor_pass"(rx588_pos, "typename")
    rx588_cur."!cursor_debug"("PASS  ", "typename", " at pos=", rx588_pos)
    .return (rx588_cur)
  rx588_fail:
.annotate 'line', 4
    (rx588_rep, rx588_pos, $I10, $P10) = rx588_cur."!mark_fail"(0)
    lt rx588_pos, -1, rx588_done
    eq rx588_pos, -1, rx588_fail
    jump $I10
  rx588_done:
    rx588_cur."!cursor_fail"()
    rx588_cur."!cursor_debug"("FAIL  ", "typename")
    .return (rx588_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__typename"  :subid("142_1274564776.41408") :method
.annotate 'line', 4
    $P590 = self."!PREFIX__!subrule"("name", "")
    new $P591, "ResizablePMCArray"
    push $P591, $P590
    .return ($P591)
.end


.namespace ["NQP";"Grammar"]
.sub "declarator"  :subid("143_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx594_tgt
    .local int rx594_pos
    .local int rx594_off
    .local int rx594_eos
    .local int rx594_rep
    .local pmc rx594_cur
    (rx594_cur, rx594_pos, rx594_tgt) = self."!cursor_start"()
    rx594_cur."!cursor_debug"("START ", "declarator")
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
    ne $I10, -1, rxscan599_done
    goto rxscan599_scan
  rxscan599_loop:
    ($P10) = rx594_cur."from"()
    inc $P10
    set rx594_pos, $P10
    ge rx594_pos, rx594_eos, rxscan599_done
  rxscan599_scan:
    set_addr $I10, rxscan599_loop
    rx594_cur."!mark_push"(0, rx594_pos, $I10)
  rxscan599_done:
  alt600_0:
.annotate 'line', 280
    set_addr $I10, alt600_1
    rx594_cur."!mark_push"(0, rx594_pos, $I10)
.annotate 'line', 281
  # rx subrule "variable_declarator" subtype=capture negate=
    rx594_cur."!cursor_pos"(rx594_pos)
    $P10 = rx594_cur."variable_declarator"()
    unless $P10, rx594_fail
    rx594_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx594_pos = $P10."pos"()
    goto alt600_end
  alt600_1:
.annotate 'line', 282
  # rx subrule "routine_declarator" subtype=capture negate=
    rx594_cur."!cursor_pos"(rx594_pos)
    $P10 = rx594_cur."routine_declarator"()
    unless $P10, rx594_fail
    rx594_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx594_pos = $P10."pos"()
  alt600_end:
.annotate 'line', 280
  # rx pass
    rx594_cur."!cursor_pass"(rx594_pos, "declarator")
    rx594_cur."!cursor_debug"("PASS  ", "declarator", " at pos=", rx594_pos)
    .return (rx594_cur)
  rx594_fail:
.annotate 'line', 4
    (rx594_rep, rx594_pos, $I10, $P10) = rx594_cur."!mark_fail"(0)
    lt rx594_pos, -1, rx594_done
    eq rx594_pos, -1, rx594_fail
    jump $I10
  rx594_done:
    rx594_cur."!cursor_fail"()
    rx594_cur."!cursor_debug"("FAIL  ", "declarator")
    .return (rx594_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__declarator"  :subid("144_1274564776.41408") :method
.annotate 'line', 4
    $P596 = self."!PREFIX__!subrule"("routine_declarator", "")
    $P597 = self."!PREFIX__!subrule"("variable_declarator", "")
    new $P598, "ResizablePMCArray"
    push $P598, $P596
    push $P598, $P597
    .return ($P598)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("145_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx602_tgt
    .local int rx602_pos
    .local int rx602_off
    .local int rx602_eos
    .local int rx602_rep
    .local pmc rx602_cur
    (rx602_cur, rx602_pos, rx602_tgt) = self."!cursor_start"()
    rx602_cur."!cursor_debug"("START ", "variable_declarator")
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
.annotate 'line', 285
  # rx subrule "variable" subtype=capture negate=
    rx602_cur."!cursor_pos"(rx602_pos)
    $P10 = rx602_cur."variable"()
    unless $P10, rx602_fail
    rx602_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx602_pos = $P10."pos"()
  # rx pass
    rx602_cur."!cursor_pass"(rx602_pos, "variable_declarator")
    rx602_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx602_pos)
    .return (rx602_cur)
  rx602_fail:
.annotate 'line', 4
    (rx602_rep, rx602_pos, $I10, $P10) = rx602_cur."!mark_fail"(0)
    lt rx602_pos, -1, rx602_done
    eq rx602_pos, -1, rx602_fail
    jump $I10
  rx602_done:
    rx602_cur."!cursor_fail"()
    rx602_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx602_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("146_1274564776.41408") :method
.annotate 'line', 4
    $P604 = self."!PREFIX__!subrule"("variable", "")
    new $P605, "ResizablePMCArray"
    push $P605, $P604
    .return ($P605)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("147_1274564776.41408") :method
.annotate 'line', 287
    $P608 = self."!protoregex"("routine_declarator")
    .return ($P608)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("148_1274564776.41408") :method
.annotate 'line', 287
    $P610 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P610)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("149_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx612_tgt
    .local int rx612_pos
    .local int rx612_off
    .local int rx612_eos
    .local int rx612_rep
    .local pmc rx612_cur
    (rx612_cur, rx612_pos, rx612_tgt) = self."!cursor_start"()
    rx612_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
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
    ne $I10, -1, rxscan616_done
    goto rxscan616_scan
  rxscan616_loop:
    ($P10) = rx612_cur."from"()
    inc $P10
    set rx612_pos, $P10
    ge rx612_pos, rx612_eos, rxscan616_done
  rxscan616_scan:
    set_addr $I10, rxscan616_loop
    rx612_cur."!mark_push"(0, rx612_pos, $I10)
  rxscan616_done:
.annotate 'line', 288
  # rx subcapture "sym"
    set_addr $I10, rxcap_617_fail
    rx612_cur."!mark_push"(0, rx612_pos, $I10)
  # rx literal  "sub"
    add $I11, rx612_pos, 3
    gt $I11, rx612_eos, rx612_fail
    sub $I11, rx612_pos, rx612_off
    substr $S10, rx612_tgt, $I11, 3
    ne $S10, "sub", rx612_fail
    add rx612_pos, 3
    set_addr $I10, rxcap_617_fail
    ($I12, $I11) = rx612_cur."!mark_peek"($I10)
    rx612_cur."!cursor_pos"($I11)
    ($P10) = rx612_cur."!cursor_start"()
    $P10."!cursor_pass"(rx612_pos, "")
    rx612_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_617_done
  rxcap_617_fail:
    goto rx612_fail
  rxcap_617_done:
  # rx subrule "routine_def" subtype=capture negate=
    rx612_cur."!cursor_pos"(rx612_pos)
    $P10 = rx612_cur."routine_def"()
    unless $P10, rx612_fail
    rx612_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx612_pos = $P10."pos"()
  # rx pass
    rx612_cur."!cursor_pass"(rx612_pos, "routine_declarator:sym<sub>")
    rx612_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx612_pos)
    .return (rx612_cur)
  rx612_fail:
.annotate 'line', 4
    (rx612_rep, rx612_pos, $I10, $P10) = rx612_cur."!mark_fail"(0)
    lt rx612_pos, -1, rx612_done
    eq rx612_pos, -1, rx612_fail
    jump $I10
  rx612_done:
    rx612_cur."!cursor_fail"()
    rx612_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx612_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("150_1274564776.41408") :method
.annotate 'line', 4
    $P614 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P615, "ResizablePMCArray"
    push $P615, $P614
    .return ($P615)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("151_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx619_tgt
    .local int rx619_pos
    .local int rx619_off
    .local int rx619_eos
    .local int rx619_rep
    .local pmc rx619_cur
    (rx619_cur, rx619_pos, rx619_tgt) = self."!cursor_start"()
    rx619_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
    .lex unicode:"$\x{a2}", rx619_cur
    .local pmc match
    .lex "$/", match
    length rx619_eos, rx619_tgt
    set rx619_off, 0
    lt rx619_pos, 2, rx619_start
    sub rx619_off, rx619_pos, 1
    substr rx619_tgt, rx619_tgt, rx619_off
  rx619_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan623_done
    goto rxscan623_scan
  rxscan623_loop:
    ($P10) = rx619_cur."from"()
    inc $P10
    set rx619_pos, $P10
    ge rx619_pos, rx619_eos, rxscan623_done
  rxscan623_scan:
    set_addr $I10, rxscan623_loop
    rx619_cur."!mark_push"(0, rx619_pos, $I10)
  rxscan623_done:
.annotate 'line', 289
  # rx subcapture "sym"
    set_addr $I10, rxcap_624_fail
    rx619_cur."!mark_push"(0, rx619_pos, $I10)
  # rx literal  "method"
    add $I11, rx619_pos, 6
    gt $I11, rx619_eos, rx619_fail
    sub $I11, rx619_pos, rx619_off
    substr $S10, rx619_tgt, $I11, 6
    ne $S10, "method", rx619_fail
    add rx619_pos, 6
    set_addr $I10, rxcap_624_fail
    ($I12, $I11) = rx619_cur."!mark_peek"($I10)
    rx619_cur."!cursor_pos"($I11)
    ($P10) = rx619_cur."!cursor_start"()
    $P10."!cursor_pass"(rx619_pos, "")
    rx619_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_624_done
  rxcap_624_fail:
    goto rx619_fail
  rxcap_624_done:
  # rx subrule "method_def" subtype=capture negate=
    rx619_cur."!cursor_pos"(rx619_pos)
    $P10 = rx619_cur."method_def"()
    unless $P10, rx619_fail
    rx619_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx619_pos = $P10."pos"()
  # rx pass
    rx619_cur."!cursor_pass"(rx619_pos, "routine_declarator:sym<method>")
    rx619_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx619_pos)
    .return (rx619_cur)
  rx619_fail:
.annotate 'line', 4
    (rx619_rep, rx619_pos, $I10, $P10) = rx619_cur."!mark_fail"(0)
    lt rx619_pos, -1, rx619_done
    eq rx619_pos, -1, rx619_fail
    jump $I10
  rx619_done:
    rx619_cur."!cursor_fail"()
    rx619_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx619_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("152_1274564776.41408") :method
.annotate 'line', 4
    $P621 = self."!PREFIX__!subrule"("method_def", "method")
    new $P622, "ResizablePMCArray"
    push $P622, $P621
    .return ($P622)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("153_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx626_tgt
    .local int rx626_pos
    .local int rx626_off
    .local int rx626_eos
    .local int rx626_rep
    .local pmc rx626_cur
    (rx626_cur, rx626_pos, rx626_tgt) = self."!cursor_start"()
    rx626_cur."!cursor_debug"("START ", "routine_def")
    rx626_cur."!cursor_caparray"("deflongname", "sigil")
    .lex unicode:"$\x{a2}", rx626_cur
    .local pmc match
    .lex "$/", match
    length rx626_eos, rx626_tgt
    set rx626_off, 0
    lt rx626_pos, 2, rx626_start
    sub rx626_off, rx626_pos, 1
    substr rx626_tgt, rx626_tgt, rx626_off
  rx626_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan629_done
    goto rxscan629_scan
  rxscan629_loop:
    ($P10) = rx626_cur."from"()
    inc $P10
    set rx626_pos, $P10
    ge rx626_pos, rx626_eos, rxscan629_done
  rxscan629_scan:
    set_addr $I10, rxscan629_loop
    rx626_cur."!mark_push"(0, rx626_pos, $I10)
  rxscan629_done:
.annotate 'line', 291
  # rx subrule "ws" subtype=method negate=
    rx626_cur."!cursor_pos"(rx626_pos)
    $P10 = rx626_cur."ws"()
    unless $P10, rx626_fail
    rx626_pos = $P10."pos"()
.annotate 'line', 292
  # rx rxquantr631 ** 0..1
    set_addr $I637, rxquantr631_done
    rx626_cur."!mark_push"(0, rx626_pos, $I637)
  rxquantr631_loop:
  # rx subrule "ws" subtype=method negate=
    rx626_cur."!cursor_pos"(rx626_pos)
    $P10 = rx626_cur."ws"()
    unless $P10, rx626_fail
    rx626_pos = $P10."pos"()
  # rx subcapture "sigil"
    set_addr $I10, rxcap_635_fail
    rx626_cur."!mark_push"(0, rx626_pos, $I10)
  # rx rxquantr633 ** 0..1
    set_addr $I634, rxquantr633_done
    rx626_cur."!mark_push"(0, rx626_pos, $I634)
  rxquantr633_loop:
  # rx literal  "&"
    add $I11, rx626_pos, 1
    gt $I11, rx626_eos, rx626_fail
    sub $I11, rx626_pos, rx626_off
    substr $S10, rx626_tgt, $I11, 1
    ne $S10, "&", rx626_fail
    add rx626_pos, 1
    (rx626_rep) = rx626_cur."!mark_commit"($I634)
  rxquantr633_done:
    set_addr $I10, rxcap_635_fail
    ($I12, $I11) = rx626_cur."!mark_peek"($I10)
    rx626_cur."!cursor_pos"($I11)
    ($P10) = rx626_cur."!cursor_start"()
    $P10."!cursor_pass"(rx626_pos, "")
    rx626_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_635_done
  rxcap_635_fail:
    goto rx626_fail
  rxcap_635_done:
  # rx subrule "deflongname" subtype=capture negate=
    rx626_cur."!cursor_pos"(rx626_pos)
    $P10 = rx626_cur."deflongname"()
    unless $P10, rx626_fail
    rx626_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx626_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx626_cur."!cursor_pos"(rx626_pos)
    $P10 = rx626_cur."ws"()
    unless $P10, rx626_fail
    rx626_pos = $P10."pos"()
    (rx626_rep) = rx626_cur."!mark_commit"($I637)
  rxquantr631_done:
  # rx subrule "ws" subtype=method negate=
    rx626_cur."!cursor_pos"(rx626_pos)
    $P10 = rx626_cur."ws"()
    unless $P10, rx626_fail
    rx626_pos = $P10."pos"()
.annotate 'line', 293
  # rx subrule "newpad" subtype=method negate=
    rx626_cur."!cursor_pos"(rx626_pos)
    $P10 = rx626_cur."newpad"()
    unless $P10, rx626_fail
    rx626_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx626_cur."!cursor_pos"(rx626_pos)
    $P10 = rx626_cur."ws"()
    unless $P10, rx626_fail
    rx626_pos = $P10."pos"()
  alt640_0:
.annotate 'line', 294
    set_addr $I10, alt640_1
    rx626_cur."!mark_push"(0, rx626_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx626_cur."!cursor_pos"(rx626_pos)
    $P10 = rx626_cur."ws"()
    unless $P10, rx626_fail
    rx626_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx626_pos, 1
    gt $I11, rx626_eos, rx626_fail
    sub $I11, rx626_pos, rx626_off
    substr $S10, rx626_tgt, $I11, 1
    ne $S10, "(", rx626_fail
    add rx626_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx626_cur."!cursor_pos"(rx626_pos)
    $P10 = rx626_cur."ws"()
    unless $P10, rx626_fail
    rx626_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx626_cur."!cursor_pos"(rx626_pos)
    $P10 = rx626_cur."signature"()
    unless $P10, rx626_fail
    rx626_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx626_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx626_cur."!cursor_pos"(rx626_pos)
    $P10 = rx626_cur."ws"()
    unless $P10, rx626_fail
    rx626_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx626_pos, 1
    gt $I11, rx626_eos, rx626_fail
    sub $I11, rx626_pos, rx626_off
    substr $S10, rx626_tgt, $I11, 1
    ne $S10, ")", rx626_fail
    add rx626_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx626_cur."!cursor_pos"(rx626_pos)
    $P10 = rx626_cur."ws"()
    unless $P10, rx626_fail
    rx626_pos = $P10."pos"()
    goto alt640_end
  alt640_1:
.annotate 'line', 295
  # rx subrule "ws" subtype=method negate=
    rx626_cur."!cursor_pos"(rx626_pos)
    $P10 = rx626_cur."ws"()
    unless $P10, rx626_fail
    rx626_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx626_cur."!cursor_pos"(rx626_pos)
    $P10 = rx626_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx626_fail
    rx626_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx626_cur."!cursor_pos"(rx626_pos)
    $P10 = rx626_cur."ws"()
    unless $P10, rx626_fail
    rx626_pos = $P10."pos"()
  alt640_end:
  # rx subrule "ws" subtype=method negate=
    rx626_cur."!cursor_pos"(rx626_pos)
    $P10 = rx626_cur."ws"()
    unless $P10, rx626_fail
    rx626_pos = $P10."pos"()
.annotate 'line', 296
  # rx subrule "blockoid" subtype=capture negate=
    rx626_cur."!cursor_pos"(rx626_pos)
    $P10 = rx626_cur."blockoid"()
    unless $P10, rx626_fail
    rx626_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx626_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx626_cur."!cursor_pos"(rx626_pos)
    $P10 = rx626_cur."ws"()
    unless $P10, rx626_fail
    rx626_pos = $P10."pos"()
.annotate 'line', 291
  # rx pass
    rx626_cur."!cursor_pass"(rx626_pos, "routine_def")
    rx626_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx626_pos)
    .return (rx626_cur)
  rx626_fail:
.annotate 'line', 4
    (rx626_rep, rx626_pos, $I10, $P10) = rx626_cur."!mark_fail"(0)
    lt rx626_pos, -1, rx626_done
    eq rx626_pos, -1, rx626_fail
    jump $I10
  rx626_done:
    rx626_cur."!cursor_fail"()
    rx626_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx626_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("154_1274564776.41408") :method
.annotate 'line', 4
    new $P628, "ResizablePMCArray"
    push $P628, ""
    .return ($P628)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("155_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx650_tgt
    .local int rx650_pos
    .local int rx650_off
    .local int rx650_eos
    .local int rx650_rep
    .local pmc rx650_cur
    (rx650_cur, rx650_pos, rx650_tgt) = self."!cursor_start"()
    rx650_cur."!cursor_debug"("START ", "method_def")
    rx650_cur."!cursor_caparray"("deflongname")
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
    ne $I10, -1, rxscan653_done
    goto rxscan653_scan
  rxscan653_loop:
    ($P10) = rx650_cur."from"()
    inc $P10
    set rx650_pos, $P10
    ge rx650_pos, rx650_eos, rxscan653_done
  rxscan653_scan:
    set_addr $I10, rxscan653_loop
    rx650_cur."!mark_push"(0, rx650_pos, $I10)
  rxscan653_done:
.annotate 'line', 299
  # rx subrule "ws" subtype=method negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."ws"()
    unless $P10, rx650_fail
    rx650_pos = $P10."pos"()
.annotate 'line', 300
  # rx rxquantr655 ** 0..1
    set_addr $I656, rxquantr655_done
    rx650_cur."!mark_push"(0, rx650_pos, $I656)
  rxquantr655_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."deflongname"()
    unless $P10, rx650_fail
    rx650_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx650_pos = $P10."pos"()
    (rx650_rep) = rx650_cur."!mark_commit"($I656)
  rxquantr655_done:
  # rx subrule "ws" subtype=method negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."ws"()
    unless $P10, rx650_fail
    rx650_pos = $P10."pos"()
.annotate 'line', 301
  # rx subrule "newpad" subtype=method negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."newpad"()
    unless $P10, rx650_fail
    rx650_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."ws"()
    unless $P10, rx650_fail
    rx650_pos = $P10."pos"()
  alt659_0:
.annotate 'line', 302
    set_addr $I10, alt659_1
    rx650_cur."!mark_push"(0, rx650_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."ws"()
    unless $P10, rx650_fail
    rx650_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx650_pos, 1
    gt $I11, rx650_eos, rx650_fail
    sub $I11, rx650_pos, rx650_off
    substr $S10, rx650_tgt, $I11, 1
    ne $S10, "(", rx650_fail
    add rx650_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."ws"()
    unless $P10, rx650_fail
    rx650_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."signature"()
    unless $P10, rx650_fail
    rx650_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx650_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."ws"()
    unless $P10, rx650_fail
    rx650_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx650_pos, 1
    gt $I11, rx650_eos, rx650_fail
    sub $I11, rx650_pos, rx650_off
    substr $S10, rx650_tgt, $I11, 1
    ne $S10, ")", rx650_fail
    add rx650_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."ws"()
    unless $P10, rx650_fail
    rx650_pos = $P10."pos"()
    goto alt659_end
  alt659_1:
.annotate 'line', 303
  # rx subrule "ws" subtype=method negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."ws"()
    unless $P10, rx650_fail
    rx650_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx650_fail
    rx650_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."ws"()
    unless $P10, rx650_fail
    rx650_pos = $P10."pos"()
  alt659_end:
  # rx subrule "ws" subtype=method negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."ws"()
    unless $P10, rx650_fail
    rx650_pos = $P10."pos"()
.annotate 'line', 304
  # rx subrule "blockoid" subtype=capture negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."blockoid"()
    unless $P10, rx650_fail
    rx650_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx650_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."ws"()
    unless $P10, rx650_fail
    rx650_pos = $P10."pos"()
.annotate 'line', 299
  # rx pass
    rx650_cur."!cursor_pass"(rx650_pos, "method_def")
    rx650_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx650_pos)
    .return (rx650_cur)
  rx650_fail:
.annotate 'line', 4
    (rx650_rep, rx650_pos, $I10, $P10) = rx650_cur."!mark_fail"(0)
    lt rx650_pos, -1, rx650_done
    eq rx650_pos, -1, rx650_fail
    jump $I10
  rx650_done:
    rx650_cur."!cursor_fail"()
    rx650_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx650_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("156_1274564776.41408") :method
.annotate 'line', 4
    new $P652, "ResizablePMCArray"
    push $P652, ""
    .return ($P652)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("157_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx669_tgt
    .local int rx669_pos
    .local int rx669_off
    .local int rx669_eos
    .local int rx669_rep
    .local pmc rx669_cur
    (rx669_cur, rx669_pos, rx669_tgt) = self."!cursor_start"()
    rx669_cur."!cursor_debug"("START ", "signature")
    rx669_cur."!cursor_caparray"("parameter")
    .lex unicode:"$\x{a2}", rx669_cur
    .local pmc match
    .lex "$/", match
    length rx669_eos, rx669_tgt
    set rx669_off, 0
    lt rx669_pos, 2, rx669_start
    sub rx669_off, rx669_pos, 1
    substr rx669_tgt, rx669_tgt, rx669_off
  rx669_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan672_done
    goto rxscan672_scan
  rxscan672_loop:
    ($P10) = rx669_cur."from"()
    inc $P10
    set rx669_pos, $P10
    ge rx669_pos, rx669_eos, rxscan672_done
  rxscan672_scan:
    set_addr $I10, rxscan672_loop
    rx669_cur."!mark_push"(0, rx669_pos, $I10)
  rxscan672_done:
.annotate 'line', 307
  # rx rxquantr673 ** 0..1
    set_addr $I676, rxquantr673_done
    rx669_cur."!mark_push"(0, rx669_pos, $I676)
  rxquantr673_loop:
  # rx rxquantr674 ** 1..*
    set_addr $I675, rxquantr674_done
    rx669_cur."!mark_push"(0, -1, $I675)
  rxquantr674_loop:
  # rx subrule "ws" subtype=method negate=
    rx669_cur."!cursor_pos"(rx669_pos)
    $P10 = rx669_cur."ws"()
    unless $P10, rx669_fail
    rx669_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx669_cur."!cursor_pos"(rx669_pos)
    $P10 = rx669_cur."parameter"()
    unless $P10, rx669_fail
    rx669_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx669_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx669_cur."!cursor_pos"(rx669_pos)
    $P10 = rx669_cur."ws"()
    unless $P10, rx669_fail
    rx669_pos = $P10."pos"()
    (rx669_rep) = rx669_cur."!mark_commit"($I675)
    rx669_cur."!mark_push"(rx669_rep, rx669_pos, $I675)
  # rx literal  ","
    add $I11, rx669_pos, 1
    gt $I11, rx669_eos, rx669_fail
    sub $I11, rx669_pos, rx669_off
    substr $S10, rx669_tgt, $I11, 1
    ne $S10, ",", rx669_fail
    add rx669_pos, 1
    goto rxquantr674_loop
  rxquantr674_done:
    (rx669_rep) = rx669_cur."!mark_commit"($I676)
  rxquantr673_done:
  # rx pass
    rx669_cur."!cursor_pass"(rx669_pos, "signature")
    rx669_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx669_pos)
    .return (rx669_cur)
  rx669_fail:
.annotate 'line', 4
    (rx669_rep, rx669_pos, $I10, $P10) = rx669_cur."!mark_fail"(0)
    lt rx669_pos, -1, rx669_done
    eq rx669_pos, -1, rx669_fail
    jump $I10
  rx669_done:
    rx669_cur."!cursor_fail"()
    rx669_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx669_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("158_1274564776.41408") :method
.annotate 'line', 4
    new $P671, "ResizablePMCArray"
    push $P671, ""
    .return ($P671)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("159_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx678_tgt
    .local int rx678_pos
    .local int rx678_off
    .local int rx678_eos
    .local int rx678_rep
    .local pmc rx678_cur
    (rx678_cur, rx678_pos, rx678_tgt) = self."!cursor_start"()
    rx678_cur."!cursor_debug"("START ", "parameter")
    rx678_cur."!cursor_caparray"("default_value", "typename")
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
    ne $I10, -1, rxscan681_done
    goto rxscan681_scan
  rxscan681_loop:
    ($P10) = rx678_cur."from"()
    inc $P10
    set rx678_pos, $P10
    ge rx678_pos, rx678_eos, rxscan681_done
  rxscan681_scan:
    set_addr $I10, rxscan681_loop
    rx678_cur."!mark_push"(0, rx678_pos, $I10)
  rxscan681_done:
.annotate 'line', 310
  # rx rxquantr682 ** 0..*
    set_addr $I683, rxquantr682_done
    rx678_cur."!mark_push"(0, rx678_pos, $I683)
  rxquantr682_loop:
  # rx subrule "typename" subtype=capture negate=
    rx678_cur."!cursor_pos"(rx678_pos)
    $P10 = rx678_cur."typename"()
    unless $P10, rx678_fail
    rx678_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("typename")
    rx678_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx678_cur."!cursor_pos"(rx678_pos)
    $P10 = rx678_cur."ws"()
    unless $P10, rx678_fail
    rx678_pos = $P10."pos"()
    (rx678_rep) = rx678_cur."!mark_commit"($I683)
    rx678_cur."!mark_push"(rx678_rep, rx678_pos, $I683)
    goto rxquantr682_loop
  rxquantr682_done:
  alt684_0:
.annotate 'line', 311
    set_addr $I10, alt684_1
    rx678_cur."!mark_push"(0, rx678_pos, $I10)
.annotate 'line', 312
  # rx subcapture "quant"
    set_addr $I10, rxcap_685_fail
    rx678_cur."!mark_push"(0, rx678_pos, $I10)
  # rx literal  "*"
    add $I11, rx678_pos, 1
    gt $I11, rx678_eos, rx678_fail
    sub $I11, rx678_pos, rx678_off
    substr $S10, rx678_tgt, $I11, 1
    ne $S10, "*", rx678_fail
    add rx678_pos, 1
    set_addr $I10, rxcap_685_fail
    ($I12, $I11) = rx678_cur."!mark_peek"($I10)
    rx678_cur."!cursor_pos"($I11)
    ($P10) = rx678_cur."!cursor_start"()
    $P10."!cursor_pass"(rx678_pos, "")
    rx678_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_685_done
  rxcap_685_fail:
    goto rx678_fail
  rxcap_685_done:
  # rx subrule "param_var" subtype=capture negate=
    rx678_cur."!cursor_pos"(rx678_pos)
    $P10 = rx678_cur."param_var"()
    unless $P10, rx678_fail
    rx678_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx678_pos = $P10."pos"()
    goto alt684_end
  alt684_1:
  alt686_0:
.annotate 'line', 313
    set_addr $I10, alt686_1
    rx678_cur."!mark_push"(0, rx678_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx678_cur."!cursor_pos"(rx678_pos)
    $P10 = rx678_cur."param_var"()
    unless $P10, rx678_fail
    rx678_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx678_pos = $P10."pos"()
    goto alt686_end
  alt686_1:
  # rx subrule "named_param" subtype=capture negate=
    rx678_cur."!cursor_pos"(rx678_pos)
    $P10 = rx678_cur."named_param"()
    unless $P10, rx678_fail
    rx678_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx678_pos = $P10."pos"()
  alt686_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_688_fail
    rx678_cur."!mark_push"(0, rx678_pos, $I10)
  alt687_0:
    set_addr $I10, alt687_1
    rx678_cur."!mark_push"(0, rx678_pos, $I10)
  # rx literal  "?"
    add $I11, rx678_pos, 1
    gt $I11, rx678_eos, rx678_fail
    sub $I11, rx678_pos, rx678_off
    substr $S10, rx678_tgt, $I11, 1
    ne $S10, "?", rx678_fail
    add rx678_pos, 1
    goto alt687_end
  alt687_1:
    set_addr $I10, alt687_2
    rx678_cur."!mark_push"(0, rx678_pos, $I10)
  # rx literal  "!"
    add $I11, rx678_pos, 1
    gt $I11, rx678_eos, rx678_fail
    sub $I11, rx678_pos, rx678_off
    substr $S10, rx678_tgt, $I11, 1
    ne $S10, "!", rx678_fail
    add rx678_pos, 1
    goto alt687_end
  alt687_2:
  alt687_end:
    set_addr $I10, rxcap_688_fail
    ($I12, $I11) = rx678_cur."!mark_peek"($I10)
    rx678_cur."!cursor_pos"($I11)
    ($P10) = rx678_cur."!cursor_start"()
    $P10."!cursor_pass"(rx678_pos, "")
    rx678_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_688_done
  rxcap_688_fail:
    goto rx678_fail
  rxcap_688_done:
  alt684_end:
.annotate 'line', 315
  # rx rxquantr689 ** 0..1
    set_addr $I690, rxquantr689_done
    rx678_cur."!mark_push"(0, rx678_pos, $I690)
  rxquantr689_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx678_cur."!cursor_pos"(rx678_pos)
    $P10 = rx678_cur."default_value"()
    unless $P10, rx678_fail
    rx678_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("default_value")
    rx678_pos = $P10."pos"()
    (rx678_rep) = rx678_cur."!mark_commit"($I690)
  rxquantr689_done:
.annotate 'line', 309
  # rx pass
    rx678_cur."!cursor_pass"(rx678_pos, "parameter")
    rx678_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx678_pos)
    .return (rx678_cur)
  rx678_fail:
.annotate 'line', 4
    (rx678_rep, rx678_pos, $I10, $P10) = rx678_cur."!mark_fail"(0)
    lt rx678_pos, -1, rx678_done
    eq rx678_pos, -1, rx678_fail
    jump $I10
  rx678_done:
    rx678_cur."!cursor_fail"()
    rx678_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx678_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("160_1274564776.41408") :method
.annotate 'line', 4
    new $P680, "ResizablePMCArray"
    push $P680, ""
    .return ($P680)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("161_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx692_tgt
    .local int rx692_pos
    .local int rx692_off
    .local int rx692_eos
    .local int rx692_rep
    .local pmc rx692_cur
    (rx692_cur, rx692_pos, rx692_tgt) = self."!cursor_start"()
    rx692_cur."!cursor_debug"("START ", "param_var")
    rx692_cur."!cursor_caparray"("twigil")
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
.annotate 'line', 319
  # rx subrule "sigil" subtype=capture negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."sigil"()
    unless $P10, rx692_fail
    rx692_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx692_pos = $P10."pos"()
  # rx rxquantr697 ** 0..1
    set_addr $I698, rxquantr697_done
    rx692_cur."!mark_push"(0, rx692_pos, $I698)
  rxquantr697_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."twigil"()
    unless $P10, rx692_fail
    rx692_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx692_pos = $P10."pos"()
    (rx692_rep) = rx692_cur."!mark_commit"($I698)
  rxquantr697_done:
  alt699_0:
.annotate 'line', 320
    set_addr $I10, alt699_1
    rx692_cur."!mark_push"(0, rx692_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."ident"()
    unless $P10, rx692_fail
    rx692_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx692_pos = $P10."pos"()
    goto alt699_end
  alt699_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_700_fail
    rx692_cur."!mark_push"(0, rx692_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx692_pos, rx692_eos, rx692_fail
    sub $I10, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx692_fail
    inc rx692_pos
    set_addr $I10, rxcap_700_fail
    ($I12, $I11) = rx692_cur."!mark_peek"($I10)
    rx692_cur."!cursor_pos"($I11)
    ($P10) = rx692_cur."!cursor_start"()
    $P10."!cursor_pass"(rx692_pos, "")
    rx692_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_700_done
  rxcap_700_fail:
    goto rx692_fail
  rxcap_700_done:
  alt699_end:
.annotate 'line', 318
  # rx pass
    rx692_cur."!cursor_pass"(rx692_pos, "param_var")
    rx692_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx692_pos)
    .return (rx692_cur)
  rx692_fail:
.annotate 'line', 4
    (rx692_rep, rx692_pos, $I10, $P10) = rx692_cur."!mark_fail"(0)
    lt rx692_pos, -1, rx692_done
    eq rx692_pos, -1, rx692_fail
    jump $I10
  rx692_done:
    rx692_cur."!cursor_fail"()
    rx692_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx692_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("162_1274564776.41408") :method
.annotate 'line', 4
    $P694 = self."!PREFIX__!subrule"("sigil", "")
    new $P695, "ResizablePMCArray"
    push $P695, $P694
    .return ($P695)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("163_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx702_tgt
    .local int rx702_pos
    .local int rx702_off
    .local int rx702_eos
    .local int rx702_rep
    .local pmc rx702_cur
    (rx702_cur, rx702_pos, rx702_tgt) = self."!cursor_start"()
    rx702_cur."!cursor_debug"("START ", "named_param")
    .lex unicode:"$\x{a2}", rx702_cur
    .local pmc match
    .lex "$/", match
    length rx702_eos, rx702_tgt
    set rx702_off, 0
    lt rx702_pos, 2, rx702_start
    sub rx702_off, rx702_pos, 1
    substr rx702_tgt, rx702_tgt, rx702_off
  rx702_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan706_done
    goto rxscan706_scan
  rxscan706_loop:
    ($P10) = rx702_cur."from"()
    inc $P10
    set rx702_pos, $P10
    ge rx702_pos, rx702_eos, rxscan706_done
  rxscan706_scan:
    set_addr $I10, rxscan706_loop
    rx702_cur."!mark_push"(0, rx702_pos, $I10)
  rxscan706_done:
.annotate 'line', 324
  # rx literal  ":"
    add $I11, rx702_pos, 1
    gt $I11, rx702_eos, rx702_fail
    sub $I11, rx702_pos, rx702_off
    substr $S10, rx702_tgt, $I11, 1
    ne $S10, ":", rx702_fail
    add rx702_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx702_cur."!cursor_pos"(rx702_pos)
    $P10 = rx702_cur."param_var"()
    unless $P10, rx702_fail
    rx702_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx702_pos = $P10."pos"()
.annotate 'line', 323
  # rx pass
    rx702_cur."!cursor_pass"(rx702_pos, "named_param")
    rx702_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx702_pos)
    .return (rx702_cur)
  rx702_fail:
.annotate 'line', 4
    (rx702_rep, rx702_pos, $I10, $P10) = rx702_cur."!mark_fail"(0)
    lt rx702_pos, -1, rx702_done
    eq rx702_pos, -1, rx702_fail
    jump $I10
  rx702_done:
    rx702_cur."!cursor_fail"()
    rx702_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx702_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("164_1274564776.41408") :method
.annotate 'line', 4
    $P704 = self."!PREFIX__!subrule"("param_var", ":")
    new $P705, "ResizablePMCArray"
    push $P705, $P704
    .return ($P705)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("165_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx708_tgt
    .local int rx708_pos
    .local int rx708_off
    .local int rx708_eos
    .local int rx708_rep
    .local pmc rx708_cur
    (rx708_cur, rx708_pos, rx708_tgt) = self."!cursor_start"()
    rx708_cur."!cursor_debug"("START ", "default_value")
    .lex unicode:"$\x{a2}", rx708_cur
    .local pmc match
    .lex "$/", match
    length rx708_eos, rx708_tgt
    set rx708_off, 0
    lt rx708_pos, 2, rx708_start
    sub rx708_off, rx708_pos, 1
    substr rx708_tgt, rx708_tgt, rx708_off
  rx708_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan711_done
    goto rxscan711_scan
  rxscan711_loop:
    ($P10) = rx708_cur."from"()
    inc $P10
    set rx708_pos, $P10
    ge rx708_pos, rx708_eos, rxscan711_done
  rxscan711_scan:
    set_addr $I10, rxscan711_loop
    rx708_cur."!mark_push"(0, rx708_pos, $I10)
  rxscan711_done:
.annotate 'line', 327
  # rx subrule "ws" subtype=method negate=
    rx708_cur."!cursor_pos"(rx708_pos)
    $P10 = rx708_cur."ws"()
    unless $P10, rx708_fail
    rx708_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx708_pos, 1
    gt $I11, rx708_eos, rx708_fail
    sub $I11, rx708_pos, rx708_off
    substr $S10, rx708_tgt, $I11, 1
    ne $S10, "=", rx708_fail
    add rx708_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx708_cur."!cursor_pos"(rx708_pos)
    $P10 = rx708_cur."ws"()
    unless $P10, rx708_fail
    rx708_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx708_cur."!cursor_pos"(rx708_pos)
    $P10 = rx708_cur."EXPR"("i=")
    unless $P10, rx708_fail
    rx708_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx708_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx708_cur."!cursor_pos"(rx708_pos)
    $P10 = rx708_cur."ws"()
    unless $P10, rx708_fail
    rx708_pos = $P10."pos"()
  # rx pass
    rx708_cur."!cursor_pass"(rx708_pos, "default_value")
    rx708_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx708_pos)
    .return (rx708_cur)
  rx708_fail:
.annotate 'line', 4
    (rx708_rep, rx708_pos, $I10, $P10) = rx708_cur."!mark_fail"(0)
    lt rx708_pos, -1, rx708_done
    eq rx708_pos, -1, rx708_fail
    jump $I10
  rx708_done:
    rx708_cur."!cursor_fail"()
    rx708_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx708_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("166_1274564776.41408") :method
.annotate 'line', 4
    new $P710, "ResizablePMCArray"
    push $P710, ""
    .return ($P710)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("167_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx716_tgt
    .local int rx716_pos
    .local int rx716_off
    .local int rx716_eos
    .local int rx716_rep
    .local pmc rx716_cur
    (rx716_cur, rx716_pos, rx716_tgt) = self."!cursor_start"()
    rx716_cur."!cursor_debug"("START ", "regex_declarator")
    rx716_cur."!cursor_caparray"("signature")
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
    ne $I10, -1, rxscan719_done
    goto rxscan719_scan
  rxscan719_loop:
    ($P10) = rx716_cur."from"()
    inc $P10
    set rx716_pos, $P10
    ge rx716_pos, rx716_eos, rxscan719_done
  rxscan719_scan:
    set_addr $I10, rxscan719_loop
    rx716_cur."!mark_push"(0, rx716_pos, $I10)
  rxscan719_done:
.annotate 'line', 329
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
  alt721_0:
.annotate 'line', 330
    set_addr $I10, alt721_1
    rx716_cur."!mark_push"(0, rx716_pos, $I10)
.annotate 'line', 331
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_723_fail
    rx716_cur."!mark_push"(0, rx716_pos, $I10)
  # rx literal  "proto"
    add $I11, rx716_pos, 5
    gt $I11, rx716_eos, rx716_fail
    sub $I11, rx716_pos, rx716_off
    substr $S10, rx716_tgt, $I11, 5
    ne $S10, "proto", rx716_fail
    add rx716_pos, 5
    set_addr $I10, rxcap_723_fail
    ($I12, $I11) = rx716_cur."!mark_peek"($I10)
    rx716_cur."!cursor_pos"($I11)
    ($P10) = rx716_cur."!cursor_start"()
    $P10."!cursor_pass"(rx716_pos, "")
    rx716_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_723_done
  rxcap_723_fail:
    goto rx716_fail
  rxcap_723_done:
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
  alt725_0:
    set_addr $I10, alt725_1
    rx716_cur."!mark_push"(0, rx716_pos, $I10)
  # rx literal  "regex"
    add $I11, rx716_pos, 5
    gt $I11, rx716_eos, rx716_fail
    sub $I11, rx716_pos, rx716_off
    substr $S10, rx716_tgt, $I11, 5
    ne $S10, "regex", rx716_fail
    add rx716_pos, 5
    goto alt725_end
  alt725_1:
    set_addr $I10, alt725_2
    rx716_cur."!mark_push"(0, rx716_pos, $I10)
  # rx literal  "token"
    add $I11, rx716_pos, 5
    gt $I11, rx716_eos, rx716_fail
    sub $I11, rx716_pos, rx716_off
    substr $S10, rx716_tgt, $I11, 5
    ne $S10, "token", rx716_fail
    add rx716_pos, 5
    goto alt725_end
  alt725_2:
  # rx literal  "rule"
    add $I11, rx716_pos, 4
    gt $I11, rx716_eos, rx716_fail
    sub $I11, rx716_pos, rx716_off
    substr $S10, rx716_tgt, $I11, 4
    ne $S10, "rule", rx716_fail
    add rx716_pos, 4
  alt725_end:
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
.annotate 'line', 332
  # rx subrule "deflongname" subtype=capture negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."deflongname"()
    unless $P10, rx716_fail
    rx716_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx716_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
  alt728_0:
.annotate 'line', 333
    set_addr $I10, alt728_1
    rx716_cur."!mark_push"(0, rx716_pos, $I10)
.annotate 'line', 334
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
  # rx literal  "{"
    add $I11, rx716_pos, 1
    gt $I11, rx716_eos, rx716_fail
    sub $I11, rx716_pos, rx716_off
    substr $S10, rx716_tgt, $I11, 1
    ne $S10, "{", rx716_fail
    add rx716_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx716_pos, 5
    gt $I11, rx716_eos, rx716_fail
    sub $I11, rx716_pos, rx716_off
    substr $S10, rx716_tgt, $I11, 5
    ne $S10, "<...>", rx716_fail
    add rx716_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx716_pos, 1
    gt $I11, rx716_eos, rx716_fail
    sub $I11, rx716_pos, rx716_off
    substr $S10, rx716_tgt, $I11, 1
    ne $S10, "}", rx716_fail
    add rx716_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ENDSTMT"()
    unless $P10, rx716_fail
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
    goto alt728_end
  alt728_1:
.annotate 'line', 335
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."panic"("Proto regex body must be <...>")
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
  alt728_end:
.annotate 'line', 336
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
.annotate 'line', 331
    goto alt721_end
  alt721_1:
.annotate 'line', 337
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_738_fail
    rx716_cur."!mark_push"(0, rx716_pos, $I10)
  alt737_0:
    set_addr $I10, alt737_1
    rx716_cur."!mark_push"(0, rx716_pos, $I10)
  # rx literal  "regex"
    add $I11, rx716_pos, 5
    gt $I11, rx716_eos, rx716_fail
    sub $I11, rx716_pos, rx716_off
    substr $S10, rx716_tgt, $I11, 5
    ne $S10, "regex", rx716_fail
    add rx716_pos, 5
    goto alt737_end
  alt737_1:
    set_addr $I10, alt737_2
    rx716_cur."!mark_push"(0, rx716_pos, $I10)
  # rx literal  "token"
    add $I11, rx716_pos, 5
    gt $I11, rx716_eos, rx716_fail
    sub $I11, rx716_pos, rx716_off
    substr $S10, rx716_tgt, $I11, 5
    ne $S10, "token", rx716_fail
    add rx716_pos, 5
    goto alt737_end
  alt737_2:
  # rx literal  "rule"
    add $I11, rx716_pos, 4
    gt $I11, rx716_eos, rx716_fail
    sub $I11, rx716_pos, rx716_off
    substr $S10, rx716_tgt, $I11, 4
    ne $S10, "rule", rx716_fail
    add rx716_pos, 4
  alt737_end:
    set_addr $I10, rxcap_738_fail
    ($I12, $I11) = rx716_cur."!mark_peek"($I10)
    rx716_cur."!cursor_pos"($I11)
    ($P10) = rx716_cur."!cursor_start"()
    $P10."!cursor_pass"(rx716_pos, "")
    rx716_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_738_done
  rxcap_738_fail:
    goto rx716_fail
  rxcap_738_done:
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
.annotate 'line', 338
  # rx subrule "deflongname" subtype=capture negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."deflongname"()
    unless $P10, rx716_fail
    rx716_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx716_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
.annotate 'line', 339
  # rx subrule "newpad" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."newpad"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
.annotate 'line', 340
  # rx rxquantr742 ** 0..1
    set_addr $I747, rxquantr742_done
    rx716_cur."!mark_push"(0, rx716_pos, $I747)
  rxquantr742_loop:
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx716_pos, 1
    gt $I11, rx716_eos, rx716_fail
    sub $I11, rx716_pos, rx716_off
    substr $S10, rx716_tgt, $I11, 1
    ne $S10, "(", rx716_fail
    add rx716_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."signature"()
    unless $P10, rx716_fail
    rx716_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx716_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx716_pos, 1
    gt $I11, rx716_eos, rx716_fail
    sub $I11, rx716_pos, rx716_off
    substr $S10, rx716_tgt, $I11, 1
    ne $S10, ")", rx716_fail
    add rx716_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
    (rx716_rep) = rx716_cur."!mark_commit"($I747)
  rxquantr742_done:
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
.annotate 'line', 341
  # rx reduce name="regex_declarator" key="open"
    rx716_cur."!cursor_pos"(rx716_pos)
    rx716_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
.annotate 'line', 342
  # rx literal  "{"
    add $I11, rx716_pos, 1
    gt $I11, rx716_eos, rx716_fail
    sub $I11, rx716_pos, rx716_off
    substr $S10, rx716_tgt, $I11, 1
    ne $S10, "{", rx716_fail
    add rx716_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."LANG"("Regex", "nibbler")
    unless $P10, rx716_fail
    rx716_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx716_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx716_pos, 1
    gt $I11, rx716_eos, rx716_fail
    sub $I11, rx716_pos, rx716_off
    substr $S10, rx716_tgt, $I11, 1
    ne $S10, "}", rx716_fail
    add rx716_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ENDSTMT"()
    unless $P10, rx716_fail
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
  alt721_end:
.annotate 'line', 343
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
.annotate 'line', 329
  # rx pass
    rx716_cur."!cursor_pass"(rx716_pos, "regex_declarator")
    rx716_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx716_pos)
    .return (rx716_cur)
  rx716_fail:
.annotate 'line', 4
    (rx716_rep, rx716_pos, $I10, $P10) = rx716_cur."!mark_fail"(0)
    lt rx716_pos, -1, rx716_done
    eq rx716_pos, -1, rx716_fail
    jump $I10
  rx716_done:
    rx716_cur."!cursor_fail"()
    rx716_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx716_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("168_1274564776.41408") :method
.annotate 'line', 4
    new $P718, "ResizablePMCArray"
    push $P718, ""
    .return ($P718)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("169_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx753_tgt
    .local int rx753_pos
    .local int rx753_off
    .local int rx753_eos
    .local int rx753_rep
    .local pmc rx753_cur
    (rx753_cur, rx753_pos, rx753_tgt) = self."!cursor_start"()
    rx753_cur."!cursor_debug"("START ", "dotty")
    rx753_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx753_cur
    .local pmc match
    .lex "$/", match
    length rx753_eos, rx753_tgt
    set rx753_off, 0
    lt rx753_pos, 2, rx753_start
    sub rx753_off, rx753_pos, 1
    substr rx753_tgt, rx753_tgt, rx753_off
  rx753_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan757_done
    goto rxscan757_scan
  rxscan757_loop:
    ($P10) = rx753_cur."from"()
    inc $P10
    set rx753_pos, $P10
    ge rx753_pos, rx753_eos, rxscan757_done
  rxscan757_scan:
    set_addr $I10, rxscan757_loop
    rx753_cur."!mark_push"(0, rx753_pos, $I10)
  rxscan757_done:
.annotate 'line', 347
  # rx literal  "."
    add $I11, rx753_pos, 1
    gt $I11, rx753_eos, rx753_fail
    sub $I11, rx753_pos, rx753_off
    substr $S10, rx753_tgt, $I11, 1
    ne $S10, ".", rx753_fail
    add rx753_pos, 1
  alt758_0:
.annotate 'line', 348
    set_addr $I10, alt758_1
    rx753_cur."!mark_push"(0, rx753_pos, $I10)
  # rx subrule "identifier" subtype=capture negate=
    rx753_cur."!cursor_pos"(rx753_pos)
    $P10 = rx753_cur."identifier"()
    unless $P10, rx753_fail
    rx753_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=identifier")
    rx753_pos = $P10."pos"()
    goto alt758_end
  alt758_1:
.annotate 'line', 349
  # rx enumcharlist negate=0 zerowidth
    ge rx753_pos, rx753_eos, rx753_fail
    sub $I10, rx753_pos, rx753_off
    substr $S10, rx753_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx753_fail
  # rx subrule "quote" subtype=capture negate=
    rx753_cur."!cursor_pos"(rx753_pos)
    $P10 = rx753_cur."quote"()
    unless $P10, rx753_fail
    rx753_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx753_pos = $P10."pos"()
  alt759_0:
.annotate 'line', 350
    set_addr $I10, alt759_1
    rx753_cur."!mark_push"(0, rx753_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx753_pos, rx753_eos, rx753_fail
    sub $I10, rx753_pos, rx753_off
    substr $S10, rx753_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx753_fail
    goto alt759_end
  alt759_1:
  # rx subrule "panic" subtype=method negate=
    rx753_cur."!cursor_pos"(rx753_pos)
    $P10 = rx753_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx753_fail
    rx753_pos = $P10."pos"()
  alt759_end:
  alt758_end:
.annotate 'line', 356
  # rx rxquantr760 ** 0..1
    set_addr $I762, rxquantr760_done
    rx753_cur."!mark_push"(0, rx753_pos, $I762)
  rxquantr760_loop:
  alt761_0:
.annotate 'line', 353
    set_addr $I10, alt761_1
    rx753_cur."!mark_push"(0, rx753_pos, $I10)
.annotate 'line', 354
  # rx enumcharlist negate=0 zerowidth
    ge rx753_pos, rx753_eos, rx753_fail
    sub $I10, rx753_pos, rx753_off
    substr $S10, rx753_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx753_fail
  # rx subrule "args" subtype=capture negate=
    rx753_cur."!cursor_pos"(rx753_pos)
    $P10 = rx753_cur."args"()
    unless $P10, rx753_fail
    rx753_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx753_pos = $P10."pos"()
    goto alt761_end
  alt761_1:
.annotate 'line', 355
  # rx literal  ":"
    add $I11, rx753_pos, 1
    gt $I11, rx753_eos, rx753_fail
    sub $I11, rx753_pos, rx753_off
    substr $S10, rx753_tgt, $I11, 1
    ne $S10, ":", rx753_fail
    add rx753_pos, 1
  # rx charclass s
    ge rx753_pos, rx753_eos, rx753_fail
    sub $I10, rx753_pos, rx753_off
    is_cclass $I11, 32, rx753_tgt, $I10
    unless $I11, rx753_fail
    inc rx753_pos
  # rx subrule "arglist" subtype=capture negate=
    rx753_cur."!cursor_pos"(rx753_pos)
    $P10 = rx753_cur."arglist"()
    unless $P10, rx753_fail
    rx753_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx753_pos = $P10."pos"()
  alt761_end:
.annotate 'line', 356
    (rx753_rep) = rx753_cur."!mark_commit"($I762)
  rxquantr760_done:
.annotate 'line', 346
  # rx pass
    rx753_cur."!cursor_pass"(rx753_pos, "dotty")
    rx753_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx753_pos)
    .return (rx753_cur)
  rx753_fail:
.annotate 'line', 4
    (rx753_rep, rx753_pos, $I10, $P10) = rx753_cur."!mark_fail"(0)
    lt rx753_pos, -1, rx753_done
    eq rx753_pos, -1, rx753_fail
    jump $I10
  rx753_done:
    rx753_cur."!cursor_fail"()
    rx753_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx753_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("170_1274564776.41408") :method
.annotate 'line', 4
    $P755 = self."!PREFIX__!subrule"("longname=identifier", ".")
    new $P756, "ResizablePMCArray"
    push $P756, "'"
    push $P756, "\""
    push $P756, $P755
    .return ($P756)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("171_1274564776.41408") :method
.annotate 'line', 360
    $P764 = self."!protoregex"("term")
    .return ($P764)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("172_1274564776.41408") :method
.annotate 'line', 360
    $P766 = self."!PREFIX__!protoregex"("term")
    .return ($P766)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("173_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx768_tgt
    .local int rx768_pos
    .local int rx768_off
    .local int rx768_eos
    .local int rx768_rep
    .local pmc rx768_cur
    (rx768_cur, rx768_pos, rx768_tgt) = self."!cursor_start"()
    rx768_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx768_cur
    .local pmc match
    .lex "$/", match
    length rx768_eos, rx768_tgt
    set rx768_off, 0
    lt rx768_pos, 2, rx768_start
    sub rx768_off, rx768_pos, 1
    substr rx768_tgt, rx768_tgt, rx768_off
  rx768_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan771_done
    goto rxscan771_scan
  rxscan771_loop:
    ($P10) = rx768_cur."from"()
    inc $P10
    set rx768_pos, $P10
    ge rx768_pos, rx768_eos, rxscan771_done
  rxscan771_scan:
    set_addr $I10, rxscan771_loop
    rx768_cur."!mark_push"(0, rx768_pos, $I10)
  rxscan771_done:
.annotate 'line', 362
  # rx subcapture "sym"
    set_addr $I10, rxcap_772_fail
    rx768_cur."!mark_push"(0, rx768_pos, $I10)
  # rx literal  "self"
    add $I11, rx768_pos, 4
    gt $I11, rx768_eos, rx768_fail
    sub $I11, rx768_pos, rx768_off
    substr $S10, rx768_tgt, $I11, 4
    ne $S10, "self", rx768_fail
    add rx768_pos, 4
    set_addr $I10, rxcap_772_fail
    ($I12, $I11) = rx768_cur."!mark_peek"($I10)
    rx768_cur."!cursor_pos"($I11)
    ($P10) = rx768_cur."!cursor_start"()
    $P10."!cursor_pass"(rx768_pos, "")
    rx768_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_772_done
  rxcap_772_fail:
    goto rx768_fail
  rxcap_772_done:
  # rxanchor rwb
    le rx768_pos, 0, rx768_fail
    sub $I10, rx768_pos, rx768_off
    is_cclass $I11, 8192, rx768_tgt, $I10
    if $I11, rx768_fail
    dec $I10
    is_cclass $I11, 8192, rx768_tgt, $I10
    unless $I11, rx768_fail
  # rx pass
    rx768_cur."!cursor_pass"(rx768_pos, "term:sym<self>")
    rx768_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx768_pos)
    .return (rx768_cur)
  rx768_fail:
.annotate 'line', 4
    (rx768_rep, rx768_pos, $I10, $P10) = rx768_cur."!mark_fail"(0)
    lt rx768_pos, -1, rx768_done
    eq rx768_pos, -1, rx768_fail
    jump $I10
  rx768_done:
    rx768_cur."!cursor_fail"()
    rx768_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx768_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("174_1274564776.41408") :method
.annotate 'line', 4
    new $P770, "ResizablePMCArray"
    push $P770, "self"
    .return ($P770)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("175_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx774_tgt
    .local int rx774_pos
    .local int rx774_off
    .local int rx774_eos
    .local int rx774_rep
    .local pmc rx774_cur
    (rx774_cur, rx774_pos, rx774_tgt) = self."!cursor_start"()
    rx774_cur."!cursor_debug"("START ", "term:sym<identifier>")
    .lex unicode:"$\x{a2}", rx774_cur
    .local pmc match
    .lex "$/", match
    length rx774_eos, rx774_tgt
    set rx774_off, 0
    lt rx774_pos, 2, rx774_start
    sub rx774_off, rx774_pos, 1
    substr rx774_tgt, rx774_tgt, rx774_off
  rx774_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan778_done
    goto rxscan778_scan
  rxscan778_loop:
    ($P10) = rx774_cur."from"()
    inc $P10
    set rx774_pos, $P10
    ge rx774_pos, rx774_eos, rxscan778_done
  rxscan778_scan:
    set_addr $I10, rxscan778_loop
    rx774_cur."!mark_push"(0, rx774_pos, $I10)
  rxscan778_done:
.annotate 'line', 365
  # rx subrule "identifier" subtype=capture negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."identifier"()
    unless $P10, rx774_fail
    rx774_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx774_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx774_pos, rx774_eos, rx774_fail
    sub $I10, rx774_pos, rx774_off
    substr $S10, rx774_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx774_fail
  # rx subrule "args" subtype=capture negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."args"()
    unless $P10, rx774_fail
    rx774_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx774_pos = $P10."pos"()
.annotate 'line', 364
  # rx pass
    rx774_cur."!cursor_pass"(rx774_pos, "term:sym<identifier>")
    rx774_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx774_pos)
    .return (rx774_cur)
  rx774_fail:
.annotate 'line', 4
    (rx774_rep, rx774_pos, $I10, $P10) = rx774_cur."!mark_fail"(0)
    lt rx774_pos, -1, rx774_done
    eq rx774_pos, -1, rx774_fail
    jump $I10
  rx774_done:
    rx774_cur."!cursor_fail"()
    rx774_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx774_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("176_1274564776.41408") :method
.annotate 'line', 4
    $P776 = self."!PREFIX__!subrule"("identifier", "")
    new $P777, "ResizablePMCArray"
    push $P777, $P776
    .return ($P777)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("177_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx780_tgt
    .local int rx780_pos
    .local int rx780_off
    .local int rx780_eos
    .local int rx780_rep
    .local pmc rx780_cur
    (rx780_cur, rx780_pos, rx780_tgt) = self."!cursor_start"()
    rx780_cur."!cursor_debug"("START ", "term:sym<name>")
    rx780_cur."!cursor_caparray"("args")
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
  # rx subrule "name" subtype=capture negate=
    rx780_cur."!cursor_pos"(rx780_pos)
    $P10 = rx780_cur."name"()
    unless $P10, rx780_fail
    rx780_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx780_pos = $P10."pos"()
  # rx rxquantr785 ** 0..1
    set_addr $I786, rxquantr785_done
    rx780_cur."!mark_push"(0, rx780_pos, $I786)
  rxquantr785_loop:
  # rx subrule "args" subtype=capture negate=
    rx780_cur."!cursor_pos"(rx780_pos)
    $P10 = rx780_cur."args"()
    unless $P10, rx780_fail
    rx780_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx780_pos = $P10."pos"()
    (rx780_rep) = rx780_cur."!mark_commit"($I786)
  rxquantr785_done:
.annotate 'line', 368
  # rx pass
    rx780_cur."!cursor_pass"(rx780_pos, "term:sym<name>")
    rx780_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx780_pos)
    .return (rx780_cur)
  rx780_fail:
.annotate 'line', 4
    (rx780_rep, rx780_pos, $I10, $P10) = rx780_cur."!mark_fail"(0)
    lt rx780_pos, -1, rx780_done
    eq rx780_pos, -1, rx780_fail
    jump $I10
  rx780_done:
    rx780_cur."!cursor_fail"()
    rx780_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx780_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("178_1274564776.41408") :method
.annotate 'line', 4
    $P782 = self."!PREFIX__!subrule"("name", "")
    new $P783, "ResizablePMCArray"
    push $P783, $P782
    .return ($P783)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("179_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx788_tgt
    .local int rx788_pos
    .local int rx788_off
    .local int rx788_eos
    .local int rx788_rep
    .local pmc rx788_cur
    (rx788_cur, rx788_pos, rx788_tgt) = self."!cursor_start"()
    rx788_cur."!cursor_debug"("START ", "term:sym<pir::op>")
    rx788_cur."!cursor_caparray"("args")
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
    ne $I10, -1, rxscan791_done
    goto rxscan791_scan
  rxscan791_loop:
    ($P10) = rx788_cur."from"()
    inc $P10
    set rx788_pos, $P10
    ge rx788_pos, rx788_eos, rxscan791_done
  rxscan791_scan:
    set_addr $I10, rxscan791_loop
    rx788_cur."!mark_push"(0, rx788_pos, $I10)
  rxscan791_done:
.annotate 'line', 373
  # rx literal  "pir::"
    add $I11, rx788_pos, 5
    gt $I11, rx788_eos, rx788_fail
    sub $I11, rx788_pos, rx788_off
    substr $S10, rx788_tgt, $I11, 5
    ne $S10, "pir::", rx788_fail
    add rx788_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_792_fail
    rx788_cur."!mark_push"(0, rx788_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx788_pos, rx788_off
    find_not_cclass $I11, 8192, rx788_tgt, $I10, rx788_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx788_fail
    add rx788_pos, rx788_off, $I11
    set_addr $I10, rxcap_792_fail
    ($I12, $I11) = rx788_cur."!mark_peek"($I10)
    rx788_cur."!cursor_pos"($I11)
    ($P10) = rx788_cur."!cursor_start"()
    $P10."!cursor_pass"(rx788_pos, "")
    rx788_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_792_done
  rxcap_792_fail:
    goto rx788_fail
  rxcap_792_done:
  # rx rxquantr793 ** 0..1
    set_addr $I794, rxquantr793_done
    rx788_cur."!mark_push"(0, rx788_pos, $I794)
  rxquantr793_loop:
  # rx subrule "args" subtype=capture negate=
    rx788_cur."!cursor_pos"(rx788_pos)
    $P10 = rx788_cur."args"()
    unless $P10, rx788_fail
    rx788_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx788_pos = $P10."pos"()
    (rx788_rep) = rx788_cur."!mark_commit"($I794)
  rxquantr793_done:
.annotate 'line', 372
  # rx pass
    rx788_cur."!cursor_pass"(rx788_pos, "term:sym<pir::op>")
    rx788_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx788_pos)
    .return (rx788_cur)
  rx788_fail:
.annotate 'line', 4
    (rx788_rep, rx788_pos, $I10, $P10) = rx788_cur."!mark_fail"(0)
    lt rx788_pos, -1, rx788_done
    eq rx788_pos, -1, rx788_fail
    jump $I10
  rx788_done:
    rx788_cur."!cursor_fail"()
    rx788_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx788_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("180_1274564776.41408") :method
.annotate 'line', 4
    new $P790, "ResizablePMCArray"
    push $P790, "pir::"
    .return ($P790)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("181_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx796_tgt
    .local int rx796_pos
    .local int rx796_off
    .local int rx796_eos
    .local int rx796_rep
    .local pmc rx796_cur
    (rx796_cur, rx796_pos, rx796_tgt) = self."!cursor_start"()
    rx796_cur."!cursor_debug"("START ", "args")
    .lex unicode:"$\x{a2}", rx796_cur
    .local pmc match
    .lex "$/", match
    length rx796_eos, rx796_tgt
    set rx796_off, 0
    lt rx796_pos, 2, rx796_start
    sub rx796_off, rx796_pos, 1
    substr rx796_tgt, rx796_tgt, rx796_off
  rx796_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan800_done
    goto rxscan800_scan
  rxscan800_loop:
    ($P10) = rx796_cur."from"()
    inc $P10
    set rx796_pos, $P10
    ge rx796_pos, rx796_eos, rxscan800_done
  rxscan800_scan:
    set_addr $I10, rxscan800_loop
    rx796_cur."!mark_push"(0, rx796_pos, $I10)
  rxscan800_done:
.annotate 'line', 377
  # rx literal  "("
    add $I11, rx796_pos, 1
    gt $I11, rx796_eos, rx796_fail
    sub $I11, rx796_pos, rx796_off
    substr $S10, rx796_tgt, $I11, 1
    ne $S10, "(", rx796_fail
    add rx796_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx796_cur."!cursor_pos"(rx796_pos)
    $P10 = rx796_cur."arglist"()
    unless $P10, rx796_fail
    rx796_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx796_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx796_pos, 1
    gt $I11, rx796_eos, rx796_fail
    sub $I11, rx796_pos, rx796_off
    substr $S10, rx796_tgt, $I11, 1
    ne $S10, ")", rx796_fail
    add rx796_pos, 1
  # rx pass
    rx796_cur."!cursor_pass"(rx796_pos, "args")
    rx796_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx796_pos)
    .return (rx796_cur)
  rx796_fail:
.annotate 'line', 4
    (rx796_rep, rx796_pos, $I10, $P10) = rx796_cur."!mark_fail"(0)
    lt rx796_pos, -1, rx796_done
    eq rx796_pos, -1, rx796_fail
    jump $I10
  rx796_done:
    rx796_cur."!cursor_fail"()
    rx796_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx796_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("182_1274564776.41408") :method
.annotate 'line', 4
    $P798 = self."!PREFIX__!subrule"("arglist", "(")
    new $P799, "ResizablePMCArray"
    push $P799, $P798
    .return ($P799)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("183_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx802_tgt
    .local int rx802_pos
    .local int rx802_off
    .local int rx802_eos
    .local int rx802_rep
    .local pmc rx802_cur
    (rx802_cur, rx802_pos, rx802_tgt) = self."!cursor_start"()
    rx802_cur."!cursor_debug"("START ", "arglist")
    .lex unicode:"$\x{a2}", rx802_cur
    .local pmc match
    .lex "$/", match
    length rx802_eos, rx802_tgt
    set rx802_off, 0
    lt rx802_pos, 2, rx802_start
    sub rx802_off, rx802_pos, 1
    substr rx802_tgt, rx802_tgt, rx802_off
  rx802_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan806_done
    goto rxscan806_scan
  rxscan806_loop:
    ($P10) = rx802_cur."from"()
    inc $P10
    set rx802_pos, $P10
    ge rx802_pos, rx802_eos, rxscan806_done
  rxscan806_scan:
    set_addr $I10, rxscan806_loop
    rx802_cur."!mark_push"(0, rx802_pos, $I10)
  rxscan806_done:
.annotate 'line', 381
  # rx subrule "ws" subtype=method negate=
    rx802_cur."!cursor_pos"(rx802_pos)
    $P10 = rx802_cur."ws"()
    unless $P10, rx802_fail
    rx802_pos = $P10."pos"()
  alt807_0:
.annotate 'line', 382
    set_addr $I10, alt807_1
    rx802_cur."!mark_push"(0, rx802_pos, $I10)
.annotate 'line', 383
  # rx subrule "EXPR" subtype=capture negate=
    rx802_cur."!cursor_pos"(rx802_pos)
    $P10 = rx802_cur."EXPR"("f=")
    unless $P10, rx802_fail
    rx802_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx802_pos = $P10."pos"()
    goto alt807_end
  alt807_1:
  alt807_end:
.annotate 'line', 380
  # rx pass
    rx802_cur."!cursor_pass"(rx802_pos, "arglist")
    rx802_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx802_pos)
    .return (rx802_cur)
  rx802_fail:
.annotate 'line', 4
    (rx802_rep, rx802_pos, $I10, $P10) = rx802_cur."!mark_fail"(0)
    lt rx802_pos, -1, rx802_done
    eq rx802_pos, -1, rx802_fail
    jump $I10
  rx802_done:
    rx802_cur."!cursor_fail"()
    rx802_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx802_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("184_1274564776.41408") :method
.annotate 'line', 4
    $P804 = self."!PREFIX__!subrule"("", "")
    new $P805, "ResizablePMCArray"
    push $P805, $P804
    .return ($P805)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("185_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx809_tgt
    .local int rx809_pos
    .local int rx809_off
    .local int rx809_eos
    .local int rx809_rep
    .local pmc rx809_cur
    (rx809_cur, rx809_pos, rx809_tgt) = self."!cursor_start"()
    rx809_cur."!cursor_debug"("START ", "term:sym<value>")
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
    ne $I10, -1, rxscan813_done
    goto rxscan813_scan
  rxscan813_loop:
    ($P10) = rx809_cur."from"()
    inc $P10
    set rx809_pos, $P10
    ge rx809_pos, rx809_eos, rxscan813_done
  rxscan813_scan:
    set_addr $I10, rxscan813_loop
    rx809_cur."!mark_push"(0, rx809_pos, $I10)
  rxscan813_done:
.annotate 'line', 389
  # rx subrule "value" subtype=capture negate=
    rx809_cur."!cursor_pos"(rx809_pos)
    $P10 = rx809_cur."value"()
    unless $P10, rx809_fail
    rx809_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx809_pos = $P10."pos"()
  # rx pass
    rx809_cur."!cursor_pass"(rx809_pos, "term:sym<value>")
    rx809_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx809_pos)
    .return (rx809_cur)
  rx809_fail:
.annotate 'line', 4
    (rx809_rep, rx809_pos, $I10, $P10) = rx809_cur."!mark_fail"(0)
    lt rx809_pos, -1, rx809_done
    eq rx809_pos, -1, rx809_fail
    jump $I10
  rx809_done:
    rx809_cur."!cursor_fail"()
    rx809_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx809_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("186_1274564776.41408") :method
.annotate 'line', 4
    $P811 = self."!PREFIX__!subrule"("value", "")
    new $P812, "ResizablePMCArray"
    push $P812, $P811
    .return ($P812)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("187_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx815_tgt
    .local int rx815_pos
    .local int rx815_off
    .local int rx815_eos
    .local int rx815_rep
    .local pmc rx815_cur
    (rx815_cur, rx815_pos, rx815_tgt) = self."!cursor_start"()
    rx815_cur."!cursor_debug"("START ", "value")
    .lex unicode:"$\x{a2}", rx815_cur
    .local pmc match
    .lex "$/", match
    length rx815_eos, rx815_tgt
    set rx815_off, 0
    lt rx815_pos, 2, rx815_start
    sub rx815_off, rx815_pos, 1
    substr rx815_tgt, rx815_tgt, rx815_off
  rx815_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan820_done
    goto rxscan820_scan
  rxscan820_loop:
    ($P10) = rx815_cur."from"()
    inc $P10
    set rx815_pos, $P10
    ge rx815_pos, rx815_eos, rxscan820_done
  rxscan820_scan:
    set_addr $I10, rxscan820_loop
    rx815_cur."!mark_push"(0, rx815_pos, $I10)
  rxscan820_done:
  alt821_0:
.annotate 'line', 391
    set_addr $I10, alt821_1
    rx815_cur."!mark_push"(0, rx815_pos, $I10)
.annotate 'line', 392
  # rx subrule "quote" subtype=capture negate=
    rx815_cur."!cursor_pos"(rx815_pos)
    $P10 = rx815_cur."quote"()
    unless $P10, rx815_fail
    rx815_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx815_pos = $P10."pos"()
    goto alt821_end
  alt821_1:
.annotate 'line', 393
  # rx subrule "number" subtype=capture negate=
    rx815_cur."!cursor_pos"(rx815_pos)
    $P10 = rx815_cur."number"()
    unless $P10, rx815_fail
    rx815_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("number")
    rx815_pos = $P10."pos"()
  alt821_end:
.annotate 'line', 391
  # rx pass
    rx815_cur."!cursor_pass"(rx815_pos, "value")
    rx815_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx815_pos)
    .return (rx815_cur)
  rx815_fail:
.annotate 'line', 4
    (rx815_rep, rx815_pos, $I10, $P10) = rx815_cur."!mark_fail"(0)
    lt rx815_pos, -1, rx815_done
    eq rx815_pos, -1, rx815_fail
    jump $I10
  rx815_done:
    rx815_cur."!cursor_fail"()
    rx815_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx815_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("188_1274564776.41408") :method
.annotate 'line', 4
    $P817 = self."!PREFIX__!subrule"("number", "")
    $P818 = self."!PREFIX__!subrule"("quote", "")
    new $P819, "ResizablePMCArray"
    push $P819, $P817
    push $P819, $P818
    .return ($P819)
.end


.namespace ["NQP";"Grammar"]
.sub "number"  :subid("189_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx823_tgt
    .local int rx823_pos
    .local int rx823_off
    .local int rx823_eos
    .local int rx823_rep
    .local pmc rx823_cur
    (rx823_cur, rx823_pos, rx823_tgt) = self."!cursor_start"()
    rx823_cur."!cursor_debug"("START ", "number")
    .lex unicode:"$\x{a2}", rx823_cur
    .local pmc match
    .lex "$/", match
    length rx823_eos, rx823_tgt
    set rx823_off, 0
    lt rx823_pos, 2, rx823_start
    sub rx823_off, rx823_pos, 1
    substr rx823_tgt, rx823_tgt, rx823_off
  rx823_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan826_done
    goto rxscan826_scan
  rxscan826_loop:
    ($P10) = rx823_cur."from"()
    inc $P10
    set rx823_pos, $P10
    ge rx823_pos, rx823_eos, rxscan826_done
  rxscan826_scan:
    set_addr $I10, rxscan826_loop
    rx823_cur."!mark_push"(0, rx823_pos, $I10)
  rxscan826_done:
.annotate 'line', 397
  # rx subcapture "sign"
    set_addr $I10, rxcap_829_fail
    rx823_cur."!mark_push"(0, rx823_pos, $I10)
  # rx rxquantr827 ** 0..1
    set_addr $I828, rxquantr827_done
    rx823_cur."!mark_push"(0, rx823_pos, $I828)
  rxquantr827_loop:
  # rx enumcharlist negate=0 
    ge rx823_pos, rx823_eos, rx823_fail
    sub $I10, rx823_pos, rx823_off
    substr $S10, rx823_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rx823_fail
    inc rx823_pos
    (rx823_rep) = rx823_cur."!mark_commit"($I828)
  rxquantr827_done:
    set_addr $I10, rxcap_829_fail
    ($I12, $I11) = rx823_cur."!mark_peek"($I10)
    rx823_cur."!cursor_pos"($I11)
    ($P10) = rx823_cur."!cursor_start"()
    $P10."!cursor_pass"(rx823_pos, "")
    rx823_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_829_done
  rxcap_829_fail:
    goto rx823_fail
  rxcap_829_done:
  alt830_0:
.annotate 'line', 398
    set_addr $I10, alt830_1
    rx823_cur."!mark_push"(0, rx823_pos, $I10)
  # rx subrule "dec_number" subtype=capture negate=
    rx823_cur."!cursor_pos"(rx823_pos)
    $P10 = rx823_cur."dec_number"()
    unless $P10, rx823_fail
    rx823_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx823_pos = $P10."pos"()
    goto alt830_end
  alt830_1:
  # rx subrule "integer" subtype=capture negate=
    rx823_cur."!cursor_pos"(rx823_pos)
    $P10 = rx823_cur."integer"()
    unless $P10, rx823_fail
    rx823_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx823_pos = $P10."pos"()
  alt830_end:
.annotate 'line', 396
  # rx pass
    rx823_cur."!cursor_pass"(rx823_pos, "number")
    rx823_cur."!cursor_debug"("PASS  ", "number", " at pos=", rx823_pos)
    .return (rx823_cur)
  rx823_fail:
.annotate 'line', 4
    (rx823_rep, rx823_pos, $I10, $P10) = rx823_cur."!mark_fail"(0)
    lt rx823_pos, -1, rx823_done
    eq rx823_pos, -1, rx823_fail
    jump $I10
  rx823_done:
    rx823_cur."!cursor_fail"()
    rx823_cur."!cursor_debug"("FAIL  ", "number")
    .return (rx823_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__number"  :subid("190_1274564776.41408") :method
.annotate 'line', 4
    new $P825, "ResizablePMCArray"
    push $P825, ""
    .return ($P825)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("191_1274564776.41408") :method
.annotate 'line', 401
    $P832 = self."!protoregex"("quote")
    .return ($P832)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("192_1274564776.41408") :method
.annotate 'line', 401
    $P834 = self."!PREFIX__!protoregex"("quote")
    .return ($P834)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("193_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx836_tgt
    .local int rx836_pos
    .local int rx836_off
    .local int rx836_eos
    .local int rx836_rep
    .local pmc rx836_cur
    (rx836_cur, rx836_pos, rx836_tgt) = self."!cursor_start"()
    rx836_cur."!cursor_debug"("START ", "quote:sym<apos>")
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
    ne $I10, -1, rxscan839_done
    goto rxscan839_scan
  rxscan839_loop:
    ($P10) = rx836_cur."from"()
    inc $P10
    set rx836_pos, $P10
    ge rx836_pos, rx836_eos, rxscan839_done
  rxscan839_scan:
    set_addr $I10, rxscan839_loop
    rx836_cur."!mark_push"(0, rx836_pos, $I10)
  rxscan839_done:
.annotate 'line', 402
  # rx enumcharlist negate=0 zerowidth
    ge rx836_pos, rx836_eos, rx836_fail
    sub $I10, rx836_pos, rx836_off
    substr $S10, rx836_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx836_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx836_cur."!cursor_pos"(rx836_pos)
    $P10 = rx836_cur."quote_EXPR"(":q")
    unless $P10, rx836_fail
    rx836_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx836_pos = $P10."pos"()
  # rx pass
    rx836_cur."!cursor_pass"(rx836_pos, "quote:sym<apos>")
    rx836_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx836_pos)
    .return (rx836_cur)
  rx836_fail:
.annotate 'line', 4
    (rx836_rep, rx836_pos, $I10, $P10) = rx836_cur."!mark_fail"(0)
    lt rx836_pos, -1, rx836_done
    eq rx836_pos, -1, rx836_fail
    jump $I10
  rx836_done:
    rx836_cur."!cursor_fail"()
    rx836_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx836_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("194_1274564776.41408") :method
.annotate 'line', 4
    new $P838, "ResizablePMCArray"
    push $P838, "'"
    .return ($P838)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("195_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx841_tgt
    .local int rx841_pos
    .local int rx841_off
    .local int rx841_eos
    .local int rx841_rep
    .local pmc rx841_cur
    (rx841_cur, rx841_pos, rx841_tgt) = self."!cursor_start"()
    rx841_cur."!cursor_debug"("START ", "quote:sym<dblq>")
    .lex unicode:"$\x{a2}", rx841_cur
    .local pmc match
    .lex "$/", match
    length rx841_eos, rx841_tgt
    set rx841_off, 0
    lt rx841_pos, 2, rx841_start
    sub rx841_off, rx841_pos, 1
    substr rx841_tgt, rx841_tgt, rx841_off
  rx841_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan844_done
    goto rxscan844_scan
  rxscan844_loop:
    ($P10) = rx841_cur."from"()
    inc $P10
    set rx841_pos, $P10
    ge rx841_pos, rx841_eos, rxscan844_done
  rxscan844_scan:
    set_addr $I10, rxscan844_loop
    rx841_cur."!mark_push"(0, rx841_pos, $I10)
  rxscan844_done:
.annotate 'line', 403
  # rx enumcharlist negate=0 zerowidth
    ge rx841_pos, rx841_eos, rx841_fail
    sub $I10, rx841_pos, rx841_off
    substr $S10, rx841_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx841_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx841_cur."!cursor_pos"(rx841_pos)
    $P10 = rx841_cur."quote_EXPR"(":qq")
    unless $P10, rx841_fail
    rx841_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx841_pos = $P10."pos"()
  # rx pass
    rx841_cur."!cursor_pass"(rx841_pos, "quote:sym<dblq>")
    rx841_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx841_pos)
    .return (rx841_cur)
  rx841_fail:
.annotate 'line', 4
    (rx841_rep, rx841_pos, $I10, $P10) = rx841_cur."!mark_fail"(0)
    lt rx841_pos, -1, rx841_done
    eq rx841_pos, -1, rx841_fail
    jump $I10
  rx841_done:
    rx841_cur."!cursor_fail"()
    rx841_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx841_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("196_1274564776.41408") :method
.annotate 'line', 4
    new $P843, "ResizablePMCArray"
    push $P843, "\""
    .return ($P843)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("197_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx846_tgt
    .local int rx846_pos
    .local int rx846_off
    .local int rx846_eos
    .local int rx846_rep
    .local pmc rx846_cur
    (rx846_cur, rx846_pos, rx846_tgt) = self."!cursor_start"()
    rx846_cur."!cursor_debug"("START ", "quote:sym<q>")
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
.annotate 'line', 404
  # rx literal  "q"
    add $I11, rx846_pos, 1
    gt $I11, rx846_eos, rx846_fail
    sub $I11, rx846_pos, rx846_off
    substr $S10, rx846_tgt, $I11, 1
    ne $S10, "q", rx846_fail
    add rx846_pos, 1
  # rxanchor rwb
    le rx846_pos, 0, rx846_fail
    sub $I10, rx846_pos, rx846_off
    is_cclass $I11, 8192, rx846_tgt, $I10
    if $I11, rx846_fail
    dec $I10
    is_cclass $I11, 8192, rx846_tgt, $I10
    unless $I11, rx846_fail
  # rx enumcharlist negate=1 zerowidth
    ge rx846_pos, rx846_eos, rx846_fail
    sub $I10, rx846_pos, rx846_off
    substr $S10, rx846_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx846_fail
  # rx subrule "ws" subtype=method negate=
    rx846_cur."!cursor_pos"(rx846_pos)
    $P10 = rx846_cur."ws"()
    unless $P10, rx846_fail
    rx846_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx846_cur."!cursor_pos"(rx846_pos)
    $P10 = rx846_cur."quote_EXPR"(":q")
    unless $P10, rx846_fail
    rx846_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx846_pos = $P10."pos"()
  # rx pass
    rx846_cur."!cursor_pass"(rx846_pos, "quote:sym<q>")
    rx846_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx846_pos)
    .return (rx846_cur)
  rx846_fail:
.annotate 'line', 4
    (rx846_rep, rx846_pos, $I10, $P10) = rx846_cur."!mark_fail"(0)
    lt rx846_pos, -1, rx846_done
    eq rx846_pos, -1, rx846_fail
    jump $I10
  rx846_done:
    rx846_cur."!cursor_fail"()
    rx846_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx846_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("198_1274564776.41408") :method
.annotate 'line', 4
    $P848 = self."!PREFIX__!subrule"("", "q")
    new $P849, "ResizablePMCArray"
    push $P849, $P848
    .return ($P849)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("199_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx852_tgt
    .local int rx852_pos
    .local int rx852_off
    .local int rx852_eos
    .local int rx852_rep
    .local pmc rx852_cur
    (rx852_cur, rx852_pos, rx852_tgt) = self."!cursor_start"()
    rx852_cur."!cursor_debug"("START ", "quote:sym<qq>")
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
    ne $I10, -1, rxscan856_done
    goto rxscan856_scan
  rxscan856_loop:
    ($P10) = rx852_cur."from"()
    inc $P10
    set rx852_pos, $P10
    ge rx852_pos, rx852_eos, rxscan856_done
  rxscan856_scan:
    set_addr $I10, rxscan856_loop
    rx852_cur."!mark_push"(0, rx852_pos, $I10)
  rxscan856_done:
.annotate 'line', 405
  # rx literal  "qq"
    add $I11, rx852_pos, 2
    gt $I11, rx852_eos, rx852_fail
    sub $I11, rx852_pos, rx852_off
    substr $S10, rx852_tgt, $I11, 2
    ne $S10, "qq", rx852_fail
    add rx852_pos, 2
  # rxanchor rwb
    le rx852_pos, 0, rx852_fail
    sub $I10, rx852_pos, rx852_off
    is_cclass $I11, 8192, rx852_tgt, $I10
    if $I11, rx852_fail
    dec $I10
    is_cclass $I11, 8192, rx852_tgt, $I10
    unless $I11, rx852_fail
  # rx enumcharlist negate=1 zerowidth
    ge rx852_pos, rx852_eos, rx852_fail
    sub $I10, rx852_pos, rx852_off
    substr $S10, rx852_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx852_fail
  # rx subrule "ws" subtype=method negate=
    rx852_cur."!cursor_pos"(rx852_pos)
    $P10 = rx852_cur."ws"()
    unless $P10, rx852_fail
    rx852_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx852_cur."!cursor_pos"(rx852_pos)
    $P10 = rx852_cur."quote_EXPR"(":qq")
    unless $P10, rx852_fail
    rx852_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx852_pos = $P10."pos"()
  # rx pass
    rx852_cur."!cursor_pass"(rx852_pos, "quote:sym<qq>")
    rx852_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx852_pos)
    .return (rx852_cur)
  rx852_fail:
.annotate 'line', 4
    (rx852_rep, rx852_pos, $I10, $P10) = rx852_cur."!mark_fail"(0)
    lt rx852_pos, -1, rx852_done
    eq rx852_pos, -1, rx852_fail
    jump $I10
  rx852_done:
    rx852_cur."!cursor_fail"()
    rx852_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx852_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("200_1274564776.41408") :method
.annotate 'line', 4
    $P854 = self."!PREFIX__!subrule"("", "qq")
    new $P855, "ResizablePMCArray"
    push $P855, $P854
    .return ($P855)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("201_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx858_tgt
    .local int rx858_pos
    .local int rx858_off
    .local int rx858_eos
    .local int rx858_rep
    .local pmc rx858_cur
    (rx858_cur, rx858_pos, rx858_tgt) = self."!cursor_start"()
    rx858_cur."!cursor_debug"("START ", "quote:sym<Q>")
    .lex unicode:"$\x{a2}", rx858_cur
    .local pmc match
    .lex "$/", match
    length rx858_eos, rx858_tgt
    set rx858_off, 0
    lt rx858_pos, 2, rx858_start
    sub rx858_off, rx858_pos, 1
    substr rx858_tgt, rx858_tgt, rx858_off
  rx858_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan862_done
    goto rxscan862_scan
  rxscan862_loop:
    ($P10) = rx858_cur."from"()
    inc $P10
    set rx858_pos, $P10
    ge rx858_pos, rx858_eos, rxscan862_done
  rxscan862_scan:
    set_addr $I10, rxscan862_loop
    rx858_cur."!mark_push"(0, rx858_pos, $I10)
  rxscan862_done:
.annotate 'line', 406
  # rx literal  "Q"
    add $I11, rx858_pos, 1
    gt $I11, rx858_eos, rx858_fail
    sub $I11, rx858_pos, rx858_off
    substr $S10, rx858_tgt, $I11, 1
    ne $S10, "Q", rx858_fail
    add rx858_pos, 1
  # rxanchor rwb
    le rx858_pos, 0, rx858_fail
    sub $I10, rx858_pos, rx858_off
    is_cclass $I11, 8192, rx858_tgt, $I10
    if $I11, rx858_fail
    dec $I10
    is_cclass $I11, 8192, rx858_tgt, $I10
    unless $I11, rx858_fail
  # rx enumcharlist negate=1 zerowidth
    ge rx858_pos, rx858_eos, rx858_fail
    sub $I10, rx858_pos, rx858_off
    substr $S10, rx858_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx858_fail
  # rx subrule "ws" subtype=method negate=
    rx858_cur."!cursor_pos"(rx858_pos)
    $P10 = rx858_cur."ws"()
    unless $P10, rx858_fail
    rx858_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx858_cur."!cursor_pos"(rx858_pos)
    $P10 = rx858_cur."quote_EXPR"()
    unless $P10, rx858_fail
    rx858_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx858_pos = $P10."pos"()
  # rx pass
    rx858_cur."!cursor_pass"(rx858_pos, "quote:sym<Q>")
    rx858_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx858_pos)
    .return (rx858_cur)
  rx858_fail:
.annotate 'line', 4
    (rx858_rep, rx858_pos, $I10, $P10) = rx858_cur."!mark_fail"(0)
    lt rx858_pos, -1, rx858_done
    eq rx858_pos, -1, rx858_fail
    jump $I10
  rx858_done:
    rx858_cur."!cursor_fail"()
    rx858_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx858_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("202_1274564776.41408") :method
.annotate 'line', 4
    $P860 = self."!PREFIX__!subrule"("", "Q")
    new $P861, "ResizablePMCArray"
    push $P861, $P860
    .return ($P861)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("203_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx864_tgt
    .local int rx864_pos
    .local int rx864_off
    .local int rx864_eos
    .local int rx864_rep
    .local pmc rx864_cur
    (rx864_cur, rx864_pos, rx864_tgt) = self."!cursor_start"()
    rx864_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
    .lex unicode:"$\x{a2}", rx864_cur
    .local pmc match
    .lex "$/", match
    length rx864_eos, rx864_tgt
    set rx864_off, 0
    lt rx864_pos, 2, rx864_start
    sub rx864_off, rx864_pos, 1
    substr rx864_tgt, rx864_tgt, rx864_off
  rx864_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan868_done
    goto rxscan868_scan
  rxscan868_loop:
    ($P10) = rx864_cur."from"()
    inc $P10
    set rx864_pos, $P10
    ge rx864_pos, rx864_eos, rxscan868_done
  rxscan868_scan:
    set_addr $I10, rxscan868_loop
    rx864_cur."!mark_push"(0, rx864_pos, $I10)
  rxscan868_done:
.annotate 'line', 407
  # rx literal  "Q:PIR"
    add $I11, rx864_pos, 5
    gt $I11, rx864_eos, rx864_fail
    sub $I11, rx864_pos, rx864_off
    substr $S10, rx864_tgt, $I11, 5
    ne $S10, "Q:PIR", rx864_fail
    add rx864_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx864_cur."!cursor_pos"(rx864_pos)
    $P10 = rx864_cur."ws"()
    unless $P10, rx864_fail
    rx864_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx864_cur."!cursor_pos"(rx864_pos)
    $P10 = rx864_cur."quote_EXPR"()
    unless $P10, rx864_fail
    rx864_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx864_pos = $P10."pos"()
  # rx pass
    rx864_cur."!cursor_pass"(rx864_pos, "quote:sym<Q:PIR>")
    rx864_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx864_pos)
    .return (rx864_cur)
  rx864_fail:
.annotate 'line', 4
    (rx864_rep, rx864_pos, $I10, $P10) = rx864_cur."!mark_fail"(0)
    lt rx864_pos, -1, rx864_done
    eq rx864_pos, -1, rx864_fail
    jump $I10
  rx864_done:
    rx864_cur."!cursor_fail"()
    rx864_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx864_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("204_1274564776.41408") :method
.annotate 'line', 4
    $P866 = self."!PREFIX__!subrule"("", "Q:PIR")
    new $P867, "ResizablePMCArray"
    push $P867, $P866
    .return ($P867)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym</ />"  :subid("205_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx870_tgt
    .local int rx870_pos
    .local int rx870_off
    .local int rx870_eos
    .local int rx870_rep
    .local pmc rx870_cur
    (rx870_cur, rx870_pos, rx870_tgt) = self."!cursor_start"()
    rx870_cur."!cursor_debug"("START ", "quote:sym</ />")
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
.annotate 'line', 409
  # rx literal  "/"
    add $I11, rx870_pos, 1
    gt $I11, rx870_eos, rx870_fail
    sub $I11, rx870_pos, rx870_off
    substr $S10, rx870_tgt, $I11, 1
    ne $S10, "/", rx870_fail
    add rx870_pos, 1
.annotate 'line', 410
  # rx subrule "newpad" subtype=method negate=
    rx870_cur."!cursor_pos"(rx870_pos)
    $P10 = rx870_cur."newpad"()
    unless $P10, rx870_fail
    rx870_pos = $P10."pos"()
.annotate 'line', 411
  # rx reduce name="quote:sym</ />" key="open"
    rx870_cur."!cursor_pos"(rx870_pos)
    rx870_cur."!reduce"("quote:sym</ />", "open")
.annotate 'line', 412
  # rx subrule "LANG" subtype=capture negate=
    rx870_cur."!cursor_pos"(rx870_pos)
    $P10 = rx870_cur."LANG"("Regex", "nibbler")
    unless $P10, rx870_fail
    rx870_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx870_pos = $P10."pos"()
.annotate 'line', 413
  # rx literal  "/"
    add $I11, rx870_pos, 1
    gt $I11, rx870_eos, rx870_fail
    sub $I11, rx870_pos, rx870_off
    substr $S10, rx870_tgt, $I11, 1
    ne $S10, "/", rx870_fail
    add rx870_pos, 1
.annotate 'line', 408
  # rx pass
    rx870_cur."!cursor_pass"(rx870_pos, "quote:sym</ />")
    rx870_cur."!cursor_debug"("PASS  ", "quote:sym</ />", " at pos=", rx870_pos)
    .return (rx870_cur)
  rx870_fail:
.annotate 'line', 4
    (rx870_rep, rx870_pos, $I10, $P10) = rx870_cur."!mark_fail"(0)
    lt rx870_pos, -1, rx870_done
    eq rx870_pos, -1, rx870_fail
    jump $I10
  rx870_done:
    rx870_cur."!cursor_fail"()
    rx870_cur."!cursor_debug"("FAIL  ", "quote:sym</ />")
    .return (rx870_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym</ />"  :subid("206_1274564776.41408") :method
.annotate 'line', 4
    $P872 = self."!PREFIX__!subrule"("", "/")
    new $P873, "ResizablePMCArray"
    push $P873, $P872
    .return ($P873)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("207_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx876_tgt
    .local int rx876_pos
    .local int rx876_off
    .local int rx876_eos
    .local int rx876_rep
    .local pmc rx876_cur
    (rx876_cur, rx876_pos, rx876_tgt) = self."!cursor_start"()
    rx876_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
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
    ne $I10, -1, rxscan879_done
    goto rxscan879_scan
  rxscan879_loop:
    ($P10) = rx876_cur."from"()
    inc $P10
    set rx876_pos, $P10
    ge rx876_pos, rx876_eos, rxscan879_done
  rxscan879_scan:
    set_addr $I10, rxscan879_loop
    rx876_cur."!mark_push"(0, rx876_pos, $I10)
  rxscan879_done:
.annotate 'line', 416
  # rx enumcharlist negate=0 zerowidth
    ge rx876_pos, rx876_eos, rx876_fail
    sub $I10, rx876_pos, rx876_off
    substr $S10, rx876_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx876_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx876_cur."!cursor_pos"(rx876_pos)
    $P10 = rx876_cur."quotemod_check"("s")
    unless $P10, rx876_fail
  # rx subrule "variable" subtype=capture negate=
    rx876_cur."!cursor_pos"(rx876_pos)
    $P10 = rx876_cur."variable"()
    unless $P10, rx876_fail
    rx876_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx876_pos = $P10."pos"()
  # rx pass
    rx876_cur."!cursor_pass"(rx876_pos, "quote_escape:sym<$>")
    rx876_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx876_pos)
    .return (rx876_cur)
  rx876_fail:
.annotate 'line', 4
    (rx876_rep, rx876_pos, $I10, $P10) = rx876_cur."!mark_fail"(0)
    lt rx876_pos, -1, rx876_done
    eq rx876_pos, -1, rx876_fail
    jump $I10
  rx876_done:
    rx876_cur."!cursor_fail"()
    rx876_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx876_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("208_1274564776.41408") :method
.annotate 'line', 4
    new $P878, "ResizablePMCArray"
    push $P878, "$"
    .return ($P878)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("209_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx881_tgt
    .local int rx881_pos
    .local int rx881_off
    .local int rx881_eos
    .local int rx881_rep
    .local pmc rx881_cur
    (rx881_cur, rx881_pos, rx881_tgt) = self."!cursor_start"()
    rx881_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
    .lex unicode:"$\x{a2}", rx881_cur
    .local pmc match
    .lex "$/", match
    length rx881_eos, rx881_tgt
    set rx881_off, 0
    lt rx881_pos, 2, rx881_start
    sub rx881_off, rx881_pos, 1
    substr rx881_tgt, rx881_tgt, rx881_off
  rx881_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan884_done
    goto rxscan884_scan
  rxscan884_loop:
    ($P10) = rx881_cur."from"()
    inc $P10
    set rx881_pos, $P10
    ge rx881_pos, rx881_eos, rxscan884_done
  rxscan884_scan:
    set_addr $I10, rxscan884_loop
    rx881_cur."!mark_push"(0, rx881_pos, $I10)
  rxscan884_done:
.annotate 'line', 417
  # rx enumcharlist negate=0 zerowidth
    ge rx881_pos, rx881_eos, rx881_fail
    sub $I10, rx881_pos, rx881_off
    substr $S10, rx881_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx881_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx881_cur."!cursor_pos"(rx881_pos)
    $P10 = rx881_cur."quotemod_check"("c")
    unless $P10, rx881_fail
  # rx subrule "block" subtype=capture negate=
    rx881_cur."!cursor_pos"(rx881_pos)
    $P10 = rx881_cur."block"()
    unless $P10, rx881_fail
    rx881_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx881_pos = $P10."pos"()
  # rx pass
    rx881_cur."!cursor_pass"(rx881_pos, "quote_escape:sym<{ }>")
    rx881_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx881_pos)
    .return (rx881_cur)
  rx881_fail:
.annotate 'line', 4
    (rx881_rep, rx881_pos, $I10, $P10) = rx881_cur."!mark_fail"(0)
    lt rx881_pos, -1, rx881_done
    eq rx881_pos, -1, rx881_fail
    jump $I10
  rx881_done:
    rx881_cur."!cursor_fail"()
    rx881_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx881_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("210_1274564776.41408") :method
.annotate 'line', 4
    new $P883, "ResizablePMCArray"
    push $P883, "{"
    .return ($P883)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<esc>"  :subid("211_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx886_tgt
    .local int rx886_pos
    .local int rx886_off
    .local int rx886_eos
    .local int rx886_rep
    .local pmc rx886_cur
    (rx886_cur, rx886_pos, rx886_tgt) = self."!cursor_start"()
    rx886_cur."!cursor_debug"("START ", "quote_escape:sym<esc>")
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
.annotate 'line', 418
  # rx literal  "\\e"
    add $I11, rx886_pos, 2
    gt $I11, rx886_eos, rx886_fail
    sub $I11, rx886_pos, rx886_off
    substr $S10, rx886_tgt, $I11, 2
    ne $S10, "\\e", rx886_fail
    add rx886_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx886_cur."!cursor_pos"(rx886_pos)
    $P10 = rx886_cur."quotemod_check"("b")
    unless $P10, rx886_fail
  # rx pass
    rx886_cur."!cursor_pass"(rx886_pos, "quote_escape:sym<esc>")
    rx886_cur."!cursor_debug"("PASS  ", "quote_escape:sym<esc>", " at pos=", rx886_pos)
    .return (rx886_cur)
  rx886_fail:
.annotate 'line', 4
    (rx886_rep, rx886_pos, $I10, $P10) = rx886_cur."!mark_fail"(0)
    lt rx886_pos, -1, rx886_done
    eq rx886_pos, -1, rx886_fail
    jump $I10
  rx886_done:
    rx886_cur."!cursor_fail"()
    rx886_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<esc>")
    .return (rx886_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<esc>"  :subid("212_1274564776.41408") :method
.annotate 'line', 4
    new $P888, "ResizablePMCArray"
    push $P888, "\\e"
    .return ($P888)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("213_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx891_tgt
    .local int rx891_pos
    .local int rx891_off
    .local int rx891_eos
    .local int rx891_rep
    .local pmc rx891_cur
    (rx891_cur, rx891_pos, rx891_tgt) = self."!cursor_start"()
    rx891_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx891_cur."!cursor_caparray"("EXPR")
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
    ne $I10, -1, rxscan895_done
    goto rxscan895_scan
  rxscan895_loop:
    ($P10) = rx891_cur."from"()
    inc $P10
    set rx891_pos, $P10
    ge rx891_pos, rx891_eos, rxscan895_done
  rxscan895_scan:
    set_addr $I10, rxscan895_loop
    rx891_cur."!mark_push"(0, rx891_pos, $I10)
  rxscan895_done:
.annotate 'line', 420
  # rx literal  "("
    add $I11, rx891_pos, 1
    gt $I11, rx891_eos, rx891_fail
    sub $I11, rx891_pos, rx891_off
    substr $S10, rx891_tgt, $I11, 1
    ne $S10, "(", rx891_fail
    add rx891_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx891_cur."!cursor_pos"(rx891_pos)
    $P10 = rx891_cur."ws"()
    unless $P10, rx891_fail
    rx891_pos = $P10."pos"()
  # rx rxquantr896 ** 0..1
    set_addr $I897, rxquantr896_done
    rx891_cur."!mark_push"(0, rx891_pos, $I897)
  rxquantr896_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx891_cur."!cursor_pos"(rx891_pos)
    $P10 = rx891_cur."EXPR"()
    unless $P10, rx891_fail
    rx891_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx891_pos = $P10."pos"()
    (rx891_rep) = rx891_cur."!mark_commit"($I897)
  rxquantr896_done:
  # rx literal  ")"
    add $I11, rx891_pos, 1
    gt $I11, rx891_eos, rx891_fail
    sub $I11, rx891_pos, rx891_off
    substr $S10, rx891_tgt, $I11, 1
    ne $S10, ")", rx891_fail
    add rx891_pos, 1
  # rx pass
    rx891_cur."!cursor_pass"(rx891_pos, "circumfix:sym<( )>")
    rx891_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx891_pos)
    .return (rx891_cur)
  rx891_fail:
.annotate 'line', 4
    (rx891_rep, rx891_pos, $I10, $P10) = rx891_cur."!mark_fail"(0)
    lt rx891_pos, -1, rx891_done
    eq rx891_pos, -1, rx891_fail
    jump $I10
  rx891_done:
    rx891_cur."!cursor_fail"()
    rx891_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx891_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("214_1274564776.41408") :method
.annotate 'line', 4
    $P893 = self."!PREFIX__!subrule"("", "(")
    new $P894, "ResizablePMCArray"
    push $P894, $P893
    .return ($P894)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("215_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx899_tgt
    .local int rx899_pos
    .local int rx899_off
    .local int rx899_eos
    .local int rx899_rep
    .local pmc rx899_cur
    (rx899_cur, rx899_pos, rx899_tgt) = self."!cursor_start"()
    rx899_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
    rx899_cur."!cursor_caparray"("EXPR")
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
.annotate 'line', 421
  # rx literal  "["
    add $I11, rx899_pos, 1
    gt $I11, rx899_eos, rx899_fail
    sub $I11, rx899_pos, rx899_off
    substr $S10, rx899_tgt, $I11, 1
    ne $S10, "[", rx899_fail
    add rx899_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx899_cur."!cursor_pos"(rx899_pos)
    $P10 = rx899_cur."ws"()
    unless $P10, rx899_fail
    rx899_pos = $P10."pos"()
  # rx rxquantr904 ** 0..1
    set_addr $I905, rxquantr904_done
    rx899_cur."!mark_push"(0, rx899_pos, $I905)
  rxquantr904_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx899_cur."!cursor_pos"(rx899_pos)
    $P10 = rx899_cur."EXPR"()
    unless $P10, rx899_fail
    rx899_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx899_pos = $P10."pos"()
    (rx899_rep) = rx899_cur."!mark_commit"($I905)
  rxquantr904_done:
  # rx literal  "]"
    add $I11, rx899_pos, 1
    gt $I11, rx899_eos, rx899_fail
    sub $I11, rx899_pos, rx899_off
    substr $S10, rx899_tgt, $I11, 1
    ne $S10, "]", rx899_fail
    add rx899_pos, 1
  # rx pass
    rx899_cur."!cursor_pass"(rx899_pos, "circumfix:sym<[ ]>")
    rx899_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx899_pos)
    .return (rx899_cur)
  rx899_fail:
.annotate 'line', 4
    (rx899_rep, rx899_pos, $I10, $P10) = rx899_cur."!mark_fail"(0)
    lt rx899_pos, -1, rx899_done
    eq rx899_pos, -1, rx899_fail
    jump $I10
  rx899_done:
    rx899_cur."!cursor_fail"()
    rx899_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx899_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("216_1274564776.41408") :method
.annotate 'line', 4
    $P901 = self."!PREFIX__!subrule"("", "[")
    new $P902, "ResizablePMCArray"
    push $P902, $P901
    .return ($P902)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("217_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx907_tgt
    .local int rx907_pos
    .local int rx907_off
    .local int rx907_eos
    .local int rx907_rep
    .local pmc rx907_cur
    (rx907_cur, rx907_pos, rx907_tgt) = self."!cursor_start"()
    rx907_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx907_cur
    .local pmc match
    .lex "$/", match
    length rx907_eos, rx907_tgt
    set rx907_off, 0
    lt rx907_pos, 2, rx907_start
    sub rx907_off, rx907_pos, 1
    substr rx907_tgt, rx907_tgt, rx907_off
  rx907_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan910_done
    goto rxscan910_scan
  rxscan910_loop:
    ($P10) = rx907_cur."from"()
    inc $P10
    set rx907_pos, $P10
    ge rx907_pos, rx907_eos, rxscan910_done
  rxscan910_scan:
    set_addr $I10, rxscan910_loop
    rx907_cur."!mark_push"(0, rx907_pos, $I10)
  rxscan910_done:
.annotate 'line', 422
  # rx enumcharlist negate=0 zerowidth
    ge rx907_pos, rx907_eos, rx907_fail
    sub $I10, rx907_pos, rx907_off
    substr $S10, rx907_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx907_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx907_cur."!cursor_pos"(rx907_pos)
    $P10 = rx907_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx907_fail
    rx907_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx907_pos = $P10."pos"()
  # rx pass
    rx907_cur."!cursor_pass"(rx907_pos, "circumfix:sym<ang>")
    rx907_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx907_pos)
    .return (rx907_cur)
  rx907_fail:
.annotate 'line', 4
    (rx907_rep, rx907_pos, $I10, $P10) = rx907_cur."!mark_fail"(0)
    lt rx907_pos, -1, rx907_done
    eq rx907_pos, -1, rx907_fail
    jump $I10
  rx907_done:
    rx907_cur."!cursor_fail"()
    rx907_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx907_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("218_1274564776.41408") :method
.annotate 'line', 4
    new $P909, "ResizablePMCArray"
    push $P909, "<"
    .return ($P909)
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("219_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx912_tgt
    .local int rx912_pos
    .local int rx912_off
    .local int rx912_eos
    .local int rx912_rep
    .local pmc rx912_cur
    (rx912_cur, rx912_pos, rx912_tgt) = self."!cursor_start"()
    rx912_cur."!cursor_debug"("START ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
    .lex unicode:"$\x{a2}", rx912_cur
    .local pmc match
    .lex "$/", match
    length rx912_eos, rx912_tgt
    set rx912_off, 0
    lt rx912_pos, 2, rx912_start
    sub rx912_off, rx912_pos, 1
    substr rx912_tgt, rx912_tgt, rx912_off
  rx912_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan915_done
    goto rxscan915_scan
  rxscan915_loop:
    ($P10) = rx912_cur."from"()
    inc $P10
    set rx912_pos, $P10
    ge rx912_pos, rx912_eos, rxscan915_done
  rxscan915_scan:
    set_addr $I10, rxscan915_loop
    rx912_cur."!mark_push"(0, rx912_pos, $I10)
  rxscan915_done:
.annotate 'line', 423
  # rx enumcharlist negate=0 zerowidth
    ge rx912_pos, rx912_eos, rx912_fail
    sub $I10, rx912_pos, rx912_off
    substr $S10, rx912_tgt, $I10, 1
    index $I11, unicode:"\x{ab}", $S10
    lt $I11, 0, rx912_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx912_cur."!cursor_pos"(rx912_pos)
    $P10 = rx912_cur."quote_EXPR"(":qq", ":w")
    unless $P10, rx912_fail
    rx912_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx912_pos = $P10."pos"()
  # rx pass
    rx912_cur."!cursor_pass"(rx912_pos, unicode:"circumfix:sym<\x{ab} \x{bb}>")
    rx912_cur."!cursor_debug"("PASS  ", unicode:"circumfix:sym<\x{ab} \x{bb}>", " at pos=", rx912_pos)
    .return (rx912_cur)
  rx912_fail:
.annotate 'line', 4
    (rx912_rep, rx912_pos, $I10, $P10) = rx912_cur."!mark_fail"(0)
    lt rx912_pos, -1, rx912_done
    eq rx912_pos, -1, rx912_fail
    jump $I10
  rx912_done:
    rx912_cur."!cursor_fail"()
    rx912_cur."!cursor_debug"("FAIL  ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
    .return (rx912_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"!PREFIX__circumfix:sym<\x{ab} \x{bb}>"  :subid("220_1274564776.41408") :method
.annotate 'line', 4
    new $P914, "ResizablePMCArray"
    push $P914, unicode:"\x{ab}"
    .return ($P914)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("221_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx917_tgt
    .local int rx917_pos
    .local int rx917_off
    .local int rx917_eos
    .local int rx917_rep
    .local pmc rx917_cur
    (rx917_cur, rx917_pos, rx917_tgt) = self."!cursor_start"()
    rx917_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
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
    ne $I10, -1, rxscan920_done
    goto rxscan920_scan
  rxscan920_loop:
    ($P10) = rx917_cur."from"()
    inc $P10
    set rx917_pos, $P10
    ge rx917_pos, rx917_eos, rxscan920_done
  rxscan920_scan:
    set_addr $I10, rxscan920_loop
    rx917_cur."!mark_push"(0, rx917_pos, $I10)
  rxscan920_done:
.annotate 'line', 424
  # rx enumcharlist negate=0 zerowidth
    ge rx917_pos, rx917_eos, rx917_fail
    sub $I10, rx917_pos, rx917_off
    substr $S10, rx917_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx917_fail
  # rx subrule "pblock" subtype=capture negate=
    rx917_cur."!cursor_pos"(rx917_pos)
    $P10 = rx917_cur."pblock"()
    unless $P10, rx917_fail
    rx917_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx917_pos = $P10."pos"()
  # rx pass
    rx917_cur."!cursor_pass"(rx917_pos, "circumfix:sym<{ }>")
    rx917_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx917_pos)
    .return (rx917_cur)
  rx917_fail:
.annotate 'line', 4
    (rx917_rep, rx917_pos, $I10, $P10) = rx917_cur."!mark_fail"(0)
    lt rx917_pos, -1, rx917_done
    eq rx917_pos, -1, rx917_fail
    jump $I10
  rx917_done:
    rx917_cur."!cursor_fail"()
    rx917_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx917_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("222_1274564776.41408") :method
.annotate 'line', 4
    new $P919, "ResizablePMCArray"
    push $P919, "{"
    .return ($P919)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("223_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx922_tgt
    .local int rx922_pos
    .local int rx922_off
    .local int rx922_eos
    .local int rx922_rep
    .local pmc rx922_cur
    (rx922_cur, rx922_pos, rx922_tgt) = self."!cursor_start"()
    rx922_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
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
    ne $I10, -1, rxscan926_done
    goto rxscan926_scan
  rxscan926_loop:
    ($P10) = rx922_cur."from"()
    inc $P10
    set rx922_pos, $P10
    ge rx922_pos, rx922_eos, rxscan926_done
  rxscan926_scan:
    set_addr $I10, rxscan926_loop
    rx922_cur."!mark_push"(0, rx922_pos, $I10)
  rxscan926_done:
.annotate 'line', 425
  # rx subrule "sigil" subtype=capture negate=
    rx922_cur."!cursor_pos"(rx922_pos)
    $P10 = rx922_cur."sigil"()
    unless $P10, rx922_fail
    rx922_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx922_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx922_pos, 1
    gt $I11, rx922_eos, rx922_fail
    sub $I11, rx922_pos, rx922_off
    substr $S10, rx922_tgt, $I11, 1
    ne $S10, "(", rx922_fail
    add rx922_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx922_cur."!cursor_pos"(rx922_pos)
    $P10 = rx922_cur."semilist"()
    unless $P10, rx922_fail
    rx922_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx922_pos = $P10."pos"()
  alt927_0:
    set_addr $I10, alt927_1
    rx922_cur."!mark_push"(0, rx922_pos, $I10)
  # rx literal  ")"
    add $I11, rx922_pos, 1
    gt $I11, rx922_eos, rx922_fail
    sub $I11, rx922_pos, rx922_off
    substr $S10, rx922_tgt, $I11, 1
    ne $S10, ")", rx922_fail
    add rx922_pos, 1
    goto alt927_end
  alt927_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx922_cur."!cursor_pos"(rx922_pos)
    $P10 = rx922_cur."FAILGOAL"("')'")
    unless $P10, rx922_fail
    rx922_pos = $P10."pos"()
  alt927_end:
  # rx pass
    rx922_cur."!cursor_pass"(rx922_pos, "circumfix:sym<sigil>")
    rx922_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx922_pos)
    .return (rx922_cur)
  rx922_fail:
.annotate 'line', 4
    (rx922_rep, rx922_pos, $I10, $P10) = rx922_cur."!mark_fail"(0)
    lt rx922_pos, -1, rx922_done
    eq rx922_pos, -1, rx922_fail
    jump $I10
  rx922_done:
    rx922_cur."!cursor_fail"()
    rx922_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx922_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("224_1274564776.41408") :method
.annotate 'line', 4
    $P924 = self."!PREFIX__!subrule"("sigil", "")
    new $P925, "ResizablePMCArray"
    push $P925, $P924
    .return ($P925)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("225_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 4
    .local string rx930_tgt
    .local int rx930_pos
    .local int rx930_off
    .local int rx930_eos
    .local int rx930_rep
    .local pmc rx930_cur
    (rx930_cur, rx930_pos, rx930_tgt) = self."!cursor_start"()
    rx930_cur."!cursor_debug"("START ", "semilist")
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
.annotate 'line', 427
  # rx subrule "ws" subtype=method negate=
    rx930_cur."!cursor_pos"(rx930_pos)
    $P10 = rx930_cur."ws"()
    unless $P10, rx930_fail
    rx930_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx930_cur."!cursor_pos"(rx930_pos)
    $P10 = rx930_cur."statement"()
    unless $P10, rx930_fail
    rx930_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx930_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx930_cur."!cursor_pos"(rx930_pos)
    $P10 = rx930_cur."ws"()
    unless $P10, rx930_fail
    rx930_pos = $P10."pos"()
  # rx pass
    rx930_cur."!cursor_pass"(rx930_pos, "semilist")
    rx930_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx930_pos)
    .return (rx930_cur)
  rx930_fail:
.annotate 'line', 4
    (rx930_rep, rx930_pos, $I10, $P10) = rx930_cur."!mark_fail"(0)
    lt rx930_pos, -1, rx930_done
    eq rx930_pos, -1, rx930_fail
    jump $I10
  rx930_done:
    rx930_cur."!cursor_fail"()
    rx930_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx930_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("226_1274564776.41408") :method
.annotate 'line', 4
    new $P932, "ResizablePMCArray"
    push $P932, ""
    .return ($P932)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("227_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx937_tgt
    .local int rx937_pos
    .local int rx937_off
    .local int rx937_eos
    .local int rx937_rep
    .local pmc rx937_cur
    (rx937_cur, rx937_pos, rx937_tgt) = self."!cursor_start"()
    rx937_cur."!cursor_debug"("START ", "infixish")
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
    ne $I10, -1, rxscan940_done
    goto rxscan940_scan
  rxscan940_loop:
    ($P10) = rx937_cur."from"()
    inc $P10
    set rx937_pos, $P10
    ge rx937_pos, rx937_eos, rxscan940_done
  rxscan940_scan:
    set_addr $I10, rxscan940_loop
    rx937_cur."!mark_push"(0, rx937_pos, $I10)
  rxscan940_done:
.annotate 'line', 450
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx937_cur."!cursor_pos"(rx937_pos)
    $P10 = rx937_cur."infixstopper"()
    if $P10, rx937_fail
  # rx subrule "infix" subtype=capture negate=
    rx937_cur."!cursor_pos"(rx937_pos)
    $P10 = rx937_cur."infix"()
    unless $P10, rx937_fail
    rx937_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx937_pos = $P10."pos"()
  # rx pass
    rx937_cur."!cursor_pass"(rx937_pos, "infixish")
    rx937_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx937_pos)
    .return (rx937_cur)
  rx937_fail:
.annotate 'line', 431
    (rx937_rep, rx937_pos, $I10, $P10) = rx937_cur."!mark_fail"(0)
    lt rx937_pos, -1, rx937_done
    eq rx937_pos, -1, rx937_fail
    jump $I10
  rx937_done:
    rx937_cur."!cursor_fail"()
    rx937_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx937_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("228_1274564776.41408") :method
.annotate 'line', 431
    new $P939, "ResizablePMCArray"
    push $P939, ""
    .return ($P939)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("229_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx942_tgt
    .local int rx942_pos
    .local int rx942_off
    .local int rx942_eos
    .local int rx942_rep
    .local pmc rx942_cur
    (rx942_cur, rx942_pos, rx942_tgt) = self."!cursor_start"()
    rx942_cur."!cursor_debug"("START ", "infixstopper")
    .lex unicode:"$\x{a2}", rx942_cur
    .local pmc match
    .lex "$/", match
    length rx942_eos, rx942_tgt
    set rx942_off, 0
    lt rx942_pos, 2, rx942_start
    sub rx942_off, rx942_pos, 1
    substr rx942_tgt, rx942_tgt, rx942_off
  rx942_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan945_done
    goto rxscan945_scan
  rxscan945_loop:
    ($P10) = rx942_cur."from"()
    inc $P10
    set rx942_pos, $P10
    ge rx942_pos, rx942_eos, rxscan945_done
  rxscan945_scan:
    set_addr $I10, rxscan945_loop
    rx942_cur."!mark_push"(0, rx942_pos, $I10)
  rxscan945_done:
.annotate 'line', 451
  # rx subrule "lambda" subtype=zerowidth negate=
    rx942_cur."!cursor_pos"(rx942_pos)
    $P10 = rx942_cur."lambda"()
    unless $P10, rx942_fail
  # rx pass
    rx942_cur."!cursor_pass"(rx942_pos, "infixstopper")
    rx942_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx942_pos)
    .return (rx942_cur)
  rx942_fail:
.annotate 'line', 431
    (rx942_rep, rx942_pos, $I10, $P10) = rx942_cur."!mark_fail"(0)
    lt rx942_pos, -1, rx942_done
    eq rx942_pos, -1, rx942_fail
    jump $I10
  rx942_done:
    rx942_cur."!cursor_fail"()
    rx942_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx942_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("230_1274564776.41408") :method
.annotate 'line', 431
    new $P944, "ResizablePMCArray"
    push $P944, ""
    .return ($P944)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("231_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx947_tgt
    .local int rx947_pos
    .local int rx947_off
    .local int rx947_eos
    .local int rx947_rep
    .local pmc rx947_cur
    (rx947_cur, rx947_pos, rx947_tgt) = self."!cursor_start"()
    rx947_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
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
.annotate 'line', 454
  # rx literal  "["
    add $I11, rx947_pos, 1
    gt $I11, rx947_eos, rx947_fail
    sub $I11, rx947_pos, rx947_off
    substr $S10, rx947_tgt, $I11, 1
    ne $S10, "[", rx947_fail
    add rx947_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx947_cur."!cursor_pos"(rx947_pos)
    $P10 = rx947_cur."ws"()
    unless $P10, rx947_fail
    rx947_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx947_cur."!cursor_pos"(rx947_pos)
    $P10 = rx947_cur."EXPR"()
    unless $P10, rx947_fail
    rx947_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx947_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx947_pos, 1
    gt $I11, rx947_eos, rx947_fail
    sub $I11, rx947_pos, rx947_off
    substr $S10, rx947_tgt, $I11, 1
    ne $S10, "]", rx947_fail
    add rx947_pos, 1
.annotate 'line', 455
  # rx subrule "O" subtype=capture negate=
    rx947_cur."!cursor_pos"(rx947_pos)
    $P10 = rx947_cur."O"("%methodop")
    unless $P10, rx947_fail
    rx947_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx947_pos = $P10."pos"()
.annotate 'line', 453
  # rx pass
    rx947_cur."!cursor_pass"(rx947_pos, "postcircumfix:sym<[ ]>")
    rx947_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx947_pos)
    .return (rx947_cur)
  rx947_fail:
.annotate 'line', 431
    (rx947_rep, rx947_pos, $I10, $P10) = rx947_cur."!mark_fail"(0)
    lt rx947_pos, -1, rx947_done
    eq rx947_pos, -1, rx947_fail
    jump $I10
  rx947_done:
    rx947_cur."!cursor_fail"()
    rx947_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx947_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("232_1274564776.41408") :method
.annotate 'line', 431
    $P949 = self."!PREFIX__!subrule"("", "[")
    new $P950, "ResizablePMCArray"
    push $P950, $P949
    .return ($P950)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("233_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx953_tgt
    .local int rx953_pos
    .local int rx953_off
    .local int rx953_eos
    .local int rx953_rep
    .local pmc rx953_cur
    (rx953_cur, rx953_pos, rx953_tgt) = self."!cursor_start"()
    rx953_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
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
.annotate 'line', 459
  # rx literal  "{"
    add $I11, rx953_pos, 1
    gt $I11, rx953_eos, rx953_fail
    sub $I11, rx953_pos, rx953_off
    substr $S10, rx953_tgt, $I11, 1
    ne $S10, "{", rx953_fail
    add rx953_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx953_cur."!cursor_pos"(rx953_pos)
    $P10 = rx953_cur."ws"()
    unless $P10, rx953_fail
    rx953_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx953_cur."!cursor_pos"(rx953_pos)
    $P10 = rx953_cur."EXPR"()
    unless $P10, rx953_fail
    rx953_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx953_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx953_pos, 1
    gt $I11, rx953_eos, rx953_fail
    sub $I11, rx953_pos, rx953_off
    substr $S10, rx953_tgt, $I11, 1
    ne $S10, "}", rx953_fail
    add rx953_pos, 1
.annotate 'line', 460
  # rx subrule "O" subtype=capture negate=
    rx953_cur."!cursor_pos"(rx953_pos)
    $P10 = rx953_cur."O"("%methodop")
    unless $P10, rx953_fail
    rx953_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx953_pos = $P10."pos"()
.annotate 'line', 458
  # rx pass
    rx953_cur."!cursor_pass"(rx953_pos, "postcircumfix:sym<{ }>")
    rx953_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx953_pos)
    .return (rx953_cur)
  rx953_fail:
.annotate 'line', 431
    (rx953_rep, rx953_pos, $I10, $P10) = rx953_cur."!mark_fail"(0)
    lt rx953_pos, -1, rx953_done
    eq rx953_pos, -1, rx953_fail
    jump $I10
  rx953_done:
    rx953_cur."!cursor_fail"()
    rx953_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx953_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("234_1274564776.41408") :method
.annotate 'line', 431
    $P955 = self."!PREFIX__!subrule"("", "{")
    new $P956, "ResizablePMCArray"
    push $P956, $P955
    .return ($P956)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("235_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx959_tgt
    .local int rx959_pos
    .local int rx959_off
    .local int rx959_eos
    .local int rx959_rep
    .local pmc rx959_cur
    (rx959_cur, rx959_pos, rx959_tgt) = self."!cursor_start"()
    rx959_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx959_cur
    .local pmc match
    .lex "$/", match
    length rx959_eos, rx959_tgt
    set rx959_off, 0
    lt rx959_pos, 2, rx959_start
    sub rx959_off, rx959_pos, 1
    substr rx959_tgt, rx959_tgt, rx959_off
  rx959_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan962_done
    goto rxscan962_scan
  rxscan962_loop:
    ($P10) = rx959_cur."from"()
    inc $P10
    set rx959_pos, $P10
    ge rx959_pos, rx959_eos, rxscan962_done
  rxscan962_scan:
    set_addr $I10, rxscan962_loop
    rx959_cur."!mark_push"(0, rx959_pos, $I10)
  rxscan962_done:
.annotate 'line', 464
  # rx enumcharlist negate=0 zerowidth
    ge rx959_pos, rx959_eos, rx959_fail
    sub $I10, rx959_pos, rx959_off
    substr $S10, rx959_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx959_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx959_cur."!cursor_pos"(rx959_pos)
    $P10 = rx959_cur."quote_EXPR"(":q")
    unless $P10, rx959_fail
    rx959_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx959_pos = $P10."pos"()
.annotate 'line', 465
  # rx subrule "O" subtype=capture negate=
    rx959_cur."!cursor_pos"(rx959_pos)
    $P10 = rx959_cur."O"("%methodop")
    unless $P10, rx959_fail
    rx959_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx959_pos = $P10."pos"()
.annotate 'line', 463
  # rx pass
    rx959_cur."!cursor_pass"(rx959_pos, "postcircumfix:sym<ang>")
    rx959_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx959_pos)
    .return (rx959_cur)
  rx959_fail:
.annotate 'line', 431
    (rx959_rep, rx959_pos, $I10, $P10) = rx959_cur."!mark_fail"(0)
    lt rx959_pos, -1, rx959_done
    eq rx959_pos, -1, rx959_fail
    jump $I10
  rx959_done:
    rx959_cur."!cursor_fail"()
    rx959_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx959_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("236_1274564776.41408") :method
.annotate 'line', 431
    new $P961, "ResizablePMCArray"
    push $P961, "<"
    .return ($P961)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("237_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx964_tgt
    .local int rx964_pos
    .local int rx964_off
    .local int rx964_eos
    .local int rx964_rep
    .local pmc rx964_cur
    (rx964_cur, rx964_pos, rx964_tgt) = self."!cursor_start"()
    rx964_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
    .lex unicode:"$\x{a2}", rx964_cur
    .local pmc match
    .lex "$/", match
    length rx964_eos, rx964_tgt
    set rx964_off, 0
    lt rx964_pos, 2, rx964_start
    sub rx964_off, rx964_pos, 1
    substr rx964_tgt, rx964_tgt, rx964_off
  rx964_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan968_done
    goto rxscan968_scan
  rxscan968_loop:
    ($P10) = rx964_cur."from"()
    inc $P10
    set rx964_pos, $P10
    ge rx964_pos, rx964_eos, rxscan968_done
  rxscan968_scan:
    set_addr $I10, rxscan968_loop
    rx964_cur."!mark_push"(0, rx964_pos, $I10)
  rxscan968_done:
.annotate 'line', 469
  # rx literal  "("
    add $I11, rx964_pos, 1
    gt $I11, rx964_eos, rx964_fail
    sub $I11, rx964_pos, rx964_off
    substr $S10, rx964_tgt, $I11, 1
    ne $S10, "(", rx964_fail
    add rx964_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx964_cur."!cursor_pos"(rx964_pos)
    $P10 = rx964_cur."ws"()
    unless $P10, rx964_fail
    rx964_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx964_cur."!cursor_pos"(rx964_pos)
    $P10 = rx964_cur."arglist"()
    unless $P10, rx964_fail
    rx964_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx964_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx964_pos, 1
    gt $I11, rx964_eos, rx964_fail
    sub $I11, rx964_pos, rx964_off
    substr $S10, rx964_tgt, $I11, 1
    ne $S10, ")", rx964_fail
    add rx964_pos, 1
.annotate 'line', 470
  # rx subrule "O" subtype=capture negate=
    rx964_cur."!cursor_pos"(rx964_pos)
    $P10 = rx964_cur."O"("%methodop")
    unless $P10, rx964_fail
    rx964_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx964_pos = $P10."pos"()
.annotate 'line', 468
  # rx pass
    rx964_cur."!cursor_pass"(rx964_pos, "postcircumfix:sym<( )>")
    rx964_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx964_pos)
    .return (rx964_cur)
  rx964_fail:
.annotate 'line', 431
    (rx964_rep, rx964_pos, $I10, $P10) = rx964_cur."!mark_fail"(0)
    lt rx964_pos, -1, rx964_done
    eq rx964_pos, -1, rx964_fail
    jump $I10
  rx964_done:
    rx964_cur."!cursor_fail"()
    rx964_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx964_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("238_1274564776.41408") :method
.annotate 'line', 431
    $P966 = self."!PREFIX__!subrule"("", "(")
    new $P967, "ResizablePMCArray"
    push $P967, $P966
    .return ($P967)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("239_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx970_tgt
    .local int rx970_pos
    .local int rx970_off
    .local int rx970_eos
    .local int rx970_rep
    .local pmc rx970_cur
    (rx970_cur, rx970_pos, rx970_tgt) = self."!cursor_start"()
    rx970_cur."!cursor_debug"("START ", "postfix:sym<.>")
    .lex unicode:"$\x{a2}", rx970_cur
    .local pmc match
    .lex "$/", match
    length rx970_eos, rx970_tgt
    set rx970_off, 0
    lt rx970_pos, 2, rx970_start
    sub rx970_off, rx970_pos, 1
    substr rx970_tgt, rx970_tgt, rx970_off
  rx970_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan974_done
    goto rxscan974_scan
  rxscan974_loop:
    ($P10) = rx970_cur."from"()
    inc $P10
    set rx970_pos, $P10
    ge rx970_pos, rx970_eos, rxscan974_done
  rxscan974_scan:
    set_addr $I10, rxscan974_loop
    rx970_cur."!mark_push"(0, rx970_pos, $I10)
  rxscan974_done:
.annotate 'line', 473
  # rx subrule "dotty" subtype=capture negate=
    rx970_cur."!cursor_pos"(rx970_pos)
    $P10 = rx970_cur."dotty"()
    unless $P10, rx970_fail
    rx970_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx970_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx970_cur."!cursor_pos"(rx970_pos)
    $P10 = rx970_cur."O"("%methodop")
    unless $P10, rx970_fail
    rx970_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx970_pos = $P10."pos"()
  # rx pass
    rx970_cur."!cursor_pass"(rx970_pos, "postfix:sym<.>")
    rx970_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx970_pos)
    .return (rx970_cur)
  rx970_fail:
.annotate 'line', 431
    (rx970_rep, rx970_pos, $I10, $P10) = rx970_cur."!mark_fail"(0)
    lt rx970_pos, -1, rx970_done
    eq rx970_pos, -1, rx970_fail
    jump $I10
  rx970_done:
    rx970_cur."!cursor_fail"()
    rx970_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx970_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("240_1274564776.41408") :method
.annotate 'line', 431
    $P972 = self."!PREFIX__!subrule"("dotty", "")
    new $P973, "ResizablePMCArray"
    push $P973, $P972
    .return ($P973)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("241_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx976_tgt
    .local int rx976_pos
    .local int rx976_off
    .local int rx976_eos
    .local int rx976_rep
    .local pmc rx976_cur
    (rx976_cur, rx976_pos, rx976_tgt) = self."!cursor_start"()
    rx976_cur."!cursor_debug"("START ", "prefix:sym<++>")
    .lex unicode:"$\x{a2}", rx976_cur
    .local pmc match
    .lex "$/", match
    length rx976_eos, rx976_tgt
    set rx976_off, 0
    lt rx976_pos, 2, rx976_start
    sub rx976_off, rx976_pos, 1
    substr rx976_tgt, rx976_tgt, rx976_off
  rx976_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan980_done
    goto rxscan980_scan
  rxscan980_loop:
    ($P10) = rx976_cur."from"()
    inc $P10
    set rx976_pos, $P10
    ge rx976_pos, rx976_eos, rxscan980_done
  rxscan980_scan:
    set_addr $I10, rxscan980_loop
    rx976_cur."!mark_push"(0, rx976_pos, $I10)
  rxscan980_done:
.annotate 'line', 475
  # rx subcapture "sym"
    set_addr $I10, rxcap_981_fail
    rx976_cur."!mark_push"(0, rx976_pos, $I10)
  # rx literal  "++"
    add $I11, rx976_pos, 2
    gt $I11, rx976_eos, rx976_fail
    sub $I11, rx976_pos, rx976_off
    substr $S10, rx976_tgt, $I11, 2
    ne $S10, "++", rx976_fail
    add rx976_pos, 2
    set_addr $I10, rxcap_981_fail
    ($I12, $I11) = rx976_cur."!mark_peek"($I10)
    rx976_cur."!cursor_pos"($I11)
    ($P10) = rx976_cur."!cursor_start"()
    $P10."!cursor_pass"(rx976_pos, "")
    rx976_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_981_done
  rxcap_981_fail:
    goto rx976_fail
  rxcap_981_done:
  # rx subrule "O" subtype=capture negate=
    rx976_cur."!cursor_pos"(rx976_pos)
    $P10 = rx976_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx976_fail
    rx976_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx976_pos = $P10."pos"()
  # rx pass
    rx976_cur."!cursor_pass"(rx976_pos, "prefix:sym<++>")
    rx976_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx976_pos)
    .return (rx976_cur)
  rx976_fail:
.annotate 'line', 431
    (rx976_rep, rx976_pos, $I10, $P10) = rx976_cur."!mark_fail"(0)
    lt rx976_pos, -1, rx976_done
    eq rx976_pos, -1, rx976_fail
    jump $I10
  rx976_done:
    rx976_cur."!cursor_fail"()
    rx976_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx976_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("242_1274564776.41408") :method
.annotate 'line', 431
    $P978 = self."!PREFIX__!subrule"("O", "++")
    new $P979, "ResizablePMCArray"
    push $P979, $P978
    .return ($P979)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("243_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx983_tgt
    .local int rx983_pos
    .local int rx983_off
    .local int rx983_eos
    .local int rx983_rep
    .local pmc rx983_cur
    (rx983_cur, rx983_pos, rx983_tgt) = self."!cursor_start"()
    rx983_cur."!cursor_debug"("START ", "prefix:sym<-->")
    .lex unicode:"$\x{a2}", rx983_cur
    .local pmc match
    .lex "$/", match
    length rx983_eos, rx983_tgt
    set rx983_off, 0
    lt rx983_pos, 2, rx983_start
    sub rx983_off, rx983_pos, 1
    substr rx983_tgt, rx983_tgt, rx983_off
  rx983_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan987_done
    goto rxscan987_scan
  rxscan987_loop:
    ($P10) = rx983_cur."from"()
    inc $P10
    set rx983_pos, $P10
    ge rx983_pos, rx983_eos, rxscan987_done
  rxscan987_scan:
    set_addr $I10, rxscan987_loop
    rx983_cur."!mark_push"(0, rx983_pos, $I10)
  rxscan987_done:
.annotate 'line', 476
  # rx subcapture "sym"
    set_addr $I10, rxcap_988_fail
    rx983_cur."!mark_push"(0, rx983_pos, $I10)
  # rx literal  "--"
    add $I11, rx983_pos, 2
    gt $I11, rx983_eos, rx983_fail
    sub $I11, rx983_pos, rx983_off
    substr $S10, rx983_tgt, $I11, 2
    ne $S10, "--", rx983_fail
    add rx983_pos, 2
    set_addr $I10, rxcap_988_fail
    ($I12, $I11) = rx983_cur."!mark_peek"($I10)
    rx983_cur."!cursor_pos"($I11)
    ($P10) = rx983_cur."!cursor_start"()
    $P10."!cursor_pass"(rx983_pos, "")
    rx983_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_988_done
  rxcap_988_fail:
    goto rx983_fail
  rxcap_988_done:
  # rx subrule "O" subtype=capture negate=
    rx983_cur."!cursor_pos"(rx983_pos)
    $P10 = rx983_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx983_fail
    rx983_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx983_pos = $P10."pos"()
  # rx pass
    rx983_cur."!cursor_pass"(rx983_pos, "prefix:sym<-->")
    rx983_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx983_pos)
    .return (rx983_cur)
  rx983_fail:
.annotate 'line', 431
    (rx983_rep, rx983_pos, $I10, $P10) = rx983_cur."!mark_fail"(0)
    lt rx983_pos, -1, rx983_done
    eq rx983_pos, -1, rx983_fail
    jump $I10
  rx983_done:
    rx983_cur."!cursor_fail"()
    rx983_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx983_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("244_1274564776.41408") :method
.annotate 'line', 431
    $P985 = self."!PREFIX__!subrule"("O", "--")
    new $P986, "ResizablePMCArray"
    push $P986, $P985
    .return ($P986)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("245_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx990_tgt
    .local int rx990_pos
    .local int rx990_off
    .local int rx990_eos
    .local int rx990_rep
    .local pmc rx990_cur
    (rx990_cur, rx990_pos, rx990_tgt) = self."!cursor_start"()
    rx990_cur."!cursor_debug"("START ", "postfix:sym<++>")
    .lex unicode:"$\x{a2}", rx990_cur
    .local pmc match
    .lex "$/", match
    length rx990_eos, rx990_tgt
    set rx990_off, 0
    lt rx990_pos, 2, rx990_start
    sub rx990_off, rx990_pos, 1
    substr rx990_tgt, rx990_tgt, rx990_off
  rx990_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan994_done
    goto rxscan994_scan
  rxscan994_loop:
    ($P10) = rx990_cur."from"()
    inc $P10
    set rx990_pos, $P10
    ge rx990_pos, rx990_eos, rxscan994_done
  rxscan994_scan:
    set_addr $I10, rxscan994_loop
    rx990_cur."!mark_push"(0, rx990_pos, $I10)
  rxscan994_done:
.annotate 'line', 479
  # rx subcapture "sym"
    set_addr $I10, rxcap_995_fail
    rx990_cur."!mark_push"(0, rx990_pos, $I10)
  # rx literal  "++"
    add $I11, rx990_pos, 2
    gt $I11, rx990_eos, rx990_fail
    sub $I11, rx990_pos, rx990_off
    substr $S10, rx990_tgt, $I11, 2
    ne $S10, "++", rx990_fail
    add rx990_pos, 2
    set_addr $I10, rxcap_995_fail
    ($I12, $I11) = rx990_cur."!mark_peek"($I10)
    rx990_cur."!cursor_pos"($I11)
    ($P10) = rx990_cur."!cursor_start"()
    $P10."!cursor_pass"(rx990_pos, "")
    rx990_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_995_done
  rxcap_995_fail:
    goto rx990_fail
  rxcap_995_done:
  # rx subrule "O" subtype=capture negate=
    rx990_cur."!cursor_pos"(rx990_pos)
    $P10 = rx990_cur."O"("%autoincrement")
    unless $P10, rx990_fail
    rx990_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx990_pos = $P10."pos"()
  # rx pass
    rx990_cur."!cursor_pass"(rx990_pos, "postfix:sym<++>")
    rx990_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx990_pos)
    .return (rx990_cur)
  rx990_fail:
.annotate 'line', 431
    (rx990_rep, rx990_pos, $I10, $P10) = rx990_cur."!mark_fail"(0)
    lt rx990_pos, -1, rx990_done
    eq rx990_pos, -1, rx990_fail
    jump $I10
  rx990_done:
    rx990_cur."!cursor_fail"()
    rx990_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx990_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("246_1274564776.41408") :method
.annotate 'line', 431
    $P992 = self."!PREFIX__!subrule"("O", "++")
    new $P993, "ResizablePMCArray"
    push $P993, $P992
    .return ($P993)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("247_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx997_tgt
    .local int rx997_pos
    .local int rx997_off
    .local int rx997_eos
    .local int rx997_rep
    .local pmc rx997_cur
    (rx997_cur, rx997_pos, rx997_tgt) = self."!cursor_start"()
    rx997_cur."!cursor_debug"("START ", "postfix:sym<-->")
    .lex unicode:"$\x{a2}", rx997_cur
    .local pmc match
    .lex "$/", match
    length rx997_eos, rx997_tgt
    set rx997_off, 0
    lt rx997_pos, 2, rx997_start
    sub rx997_off, rx997_pos, 1
    substr rx997_tgt, rx997_tgt, rx997_off
  rx997_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1001_done
    goto rxscan1001_scan
  rxscan1001_loop:
    ($P10) = rx997_cur."from"()
    inc $P10
    set rx997_pos, $P10
    ge rx997_pos, rx997_eos, rxscan1001_done
  rxscan1001_scan:
    set_addr $I10, rxscan1001_loop
    rx997_cur."!mark_push"(0, rx997_pos, $I10)
  rxscan1001_done:
.annotate 'line', 480
  # rx subcapture "sym"
    set_addr $I10, rxcap_1002_fail
    rx997_cur."!mark_push"(0, rx997_pos, $I10)
  # rx literal  "--"
    add $I11, rx997_pos, 2
    gt $I11, rx997_eos, rx997_fail
    sub $I11, rx997_pos, rx997_off
    substr $S10, rx997_tgt, $I11, 2
    ne $S10, "--", rx997_fail
    add rx997_pos, 2
    set_addr $I10, rxcap_1002_fail
    ($I12, $I11) = rx997_cur."!mark_peek"($I10)
    rx997_cur."!cursor_pos"($I11)
    ($P10) = rx997_cur."!cursor_start"()
    $P10."!cursor_pass"(rx997_pos, "")
    rx997_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1002_done
  rxcap_1002_fail:
    goto rx997_fail
  rxcap_1002_done:
  # rx subrule "O" subtype=capture negate=
    rx997_cur."!cursor_pos"(rx997_pos)
    $P10 = rx997_cur."O"("%autoincrement")
    unless $P10, rx997_fail
    rx997_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx997_pos = $P10."pos"()
  # rx pass
    rx997_cur."!cursor_pass"(rx997_pos, "postfix:sym<-->")
    rx997_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx997_pos)
    .return (rx997_cur)
  rx997_fail:
.annotate 'line', 431
    (rx997_rep, rx997_pos, $I10, $P10) = rx997_cur."!mark_fail"(0)
    lt rx997_pos, -1, rx997_done
    eq rx997_pos, -1, rx997_fail
    jump $I10
  rx997_done:
    rx997_cur."!cursor_fail"()
    rx997_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx997_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("248_1274564776.41408") :method
.annotate 'line', 431
    $P999 = self."!PREFIX__!subrule"("O", "--")
    new $P1000, "ResizablePMCArray"
    push $P1000, $P999
    .return ($P1000)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("249_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1004_tgt
    .local int rx1004_pos
    .local int rx1004_off
    .local int rx1004_eos
    .local int rx1004_rep
    .local pmc rx1004_cur
    (rx1004_cur, rx1004_pos, rx1004_tgt) = self."!cursor_start"()
    rx1004_cur."!cursor_debug"("START ", "infix:sym<**>")
    .lex unicode:"$\x{a2}", rx1004_cur
    .local pmc match
    .lex "$/", match
    length rx1004_eos, rx1004_tgt
    set rx1004_off, 0
    lt rx1004_pos, 2, rx1004_start
    sub rx1004_off, rx1004_pos, 1
    substr rx1004_tgt, rx1004_tgt, rx1004_off
  rx1004_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1008_done
    goto rxscan1008_scan
  rxscan1008_loop:
    ($P10) = rx1004_cur."from"()
    inc $P10
    set rx1004_pos, $P10
    ge rx1004_pos, rx1004_eos, rxscan1008_done
  rxscan1008_scan:
    set_addr $I10, rxscan1008_loop
    rx1004_cur."!mark_push"(0, rx1004_pos, $I10)
  rxscan1008_done:
.annotate 'line', 482
  # rx subcapture "sym"
    set_addr $I10, rxcap_1009_fail
    rx1004_cur."!mark_push"(0, rx1004_pos, $I10)
  # rx literal  "**"
    add $I11, rx1004_pos, 2
    gt $I11, rx1004_eos, rx1004_fail
    sub $I11, rx1004_pos, rx1004_off
    substr $S10, rx1004_tgt, $I11, 2
    ne $S10, "**", rx1004_fail
    add rx1004_pos, 2
    set_addr $I10, rxcap_1009_fail
    ($I12, $I11) = rx1004_cur."!mark_peek"($I10)
    rx1004_cur."!cursor_pos"($I11)
    ($P10) = rx1004_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1004_pos, "")
    rx1004_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1009_done
  rxcap_1009_fail:
    goto rx1004_fail
  rxcap_1009_done:
  # rx subrule "O" subtype=capture negate=
    rx1004_cur."!cursor_pos"(rx1004_pos)
    $P10 = rx1004_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx1004_fail
    rx1004_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1004_pos = $P10."pos"()
  # rx pass
    rx1004_cur."!cursor_pass"(rx1004_pos, "infix:sym<**>")
    rx1004_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx1004_pos)
    .return (rx1004_cur)
  rx1004_fail:
.annotate 'line', 431
    (rx1004_rep, rx1004_pos, $I10, $P10) = rx1004_cur."!mark_fail"(0)
    lt rx1004_pos, -1, rx1004_done
    eq rx1004_pos, -1, rx1004_fail
    jump $I10
  rx1004_done:
    rx1004_cur."!cursor_fail"()
    rx1004_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx1004_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("250_1274564776.41408") :method
.annotate 'line', 431
    $P1006 = self."!PREFIX__!subrule"("O", "**")
    new $P1007, "ResizablePMCArray"
    push $P1007, $P1006
    .return ($P1007)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("251_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1011_tgt
    .local int rx1011_pos
    .local int rx1011_off
    .local int rx1011_eos
    .local int rx1011_rep
    .local pmc rx1011_cur
    (rx1011_cur, rx1011_pos, rx1011_tgt) = self."!cursor_start"()
    rx1011_cur."!cursor_debug"("START ", "prefix:sym<+>")
    .lex unicode:"$\x{a2}", rx1011_cur
    .local pmc match
    .lex "$/", match
    length rx1011_eos, rx1011_tgt
    set rx1011_off, 0
    lt rx1011_pos, 2, rx1011_start
    sub rx1011_off, rx1011_pos, 1
    substr rx1011_tgt, rx1011_tgt, rx1011_off
  rx1011_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1015_done
    goto rxscan1015_scan
  rxscan1015_loop:
    ($P10) = rx1011_cur."from"()
    inc $P10
    set rx1011_pos, $P10
    ge rx1011_pos, rx1011_eos, rxscan1015_done
  rxscan1015_scan:
    set_addr $I10, rxscan1015_loop
    rx1011_cur."!mark_push"(0, rx1011_pos, $I10)
  rxscan1015_done:
.annotate 'line', 484
  # rx subcapture "sym"
    set_addr $I10, rxcap_1016_fail
    rx1011_cur."!mark_push"(0, rx1011_pos, $I10)
  # rx literal  "+"
    add $I11, rx1011_pos, 1
    gt $I11, rx1011_eos, rx1011_fail
    sub $I11, rx1011_pos, rx1011_off
    substr $S10, rx1011_tgt, $I11, 1
    ne $S10, "+", rx1011_fail
    add rx1011_pos, 1
    set_addr $I10, rxcap_1016_fail
    ($I12, $I11) = rx1011_cur."!mark_peek"($I10)
    rx1011_cur."!cursor_pos"($I11)
    ($P10) = rx1011_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1011_pos, "")
    rx1011_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1016_done
  rxcap_1016_fail:
    goto rx1011_fail
  rxcap_1016_done:
  # rx subrule "O" subtype=capture negate=
    rx1011_cur."!cursor_pos"(rx1011_pos)
    $P10 = rx1011_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx1011_fail
    rx1011_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1011_pos = $P10."pos"()
  # rx pass
    rx1011_cur."!cursor_pass"(rx1011_pos, "prefix:sym<+>")
    rx1011_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx1011_pos)
    .return (rx1011_cur)
  rx1011_fail:
.annotate 'line', 431
    (rx1011_rep, rx1011_pos, $I10, $P10) = rx1011_cur."!mark_fail"(0)
    lt rx1011_pos, -1, rx1011_done
    eq rx1011_pos, -1, rx1011_fail
    jump $I10
  rx1011_done:
    rx1011_cur."!cursor_fail"()
    rx1011_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx1011_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("252_1274564776.41408") :method
.annotate 'line', 431
    $P1013 = self."!PREFIX__!subrule"("O", "+")
    new $P1014, "ResizablePMCArray"
    push $P1014, $P1013
    .return ($P1014)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("253_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1018_tgt
    .local int rx1018_pos
    .local int rx1018_off
    .local int rx1018_eos
    .local int rx1018_rep
    .local pmc rx1018_cur
    (rx1018_cur, rx1018_pos, rx1018_tgt) = self."!cursor_start"()
    rx1018_cur."!cursor_debug"("START ", "prefix:sym<~>")
    .lex unicode:"$\x{a2}", rx1018_cur
    .local pmc match
    .lex "$/", match
    length rx1018_eos, rx1018_tgt
    set rx1018_off, 0
    lt rx1018_pos, 2, rx1018_start
    sub rx1018_off, rx1018_pos, 1
    substr rx1018_tgt, rx1018_tgt, rx1018_off
  rx1018_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1022_done
    goto rxscan1022_scan
  rxscan1022_loop:
    ($P10) = rx1018_cur."from"()
    inc $P10
    set rx1018_pos, $P10
    ge rx1018_pos, rx1018_eos, rxscan1022_done
  rxscan1022_scan:
    set_addr $I10, rxscan1022_loop
    rx1018_cur."!mark_push"(0, rx1018_pos, $I10)
  rxscan1022_done:
.annotate 'line', 485
  # rx subcapture "sym"
    set_addr $I10, rxcap_1023_fail
    rx1018_cur."!mark_push"(0, rx1018_pos, $I10)
  # rx literal  "~"
    add $I11, rx1018_pos, 1
    gt $I11, rx1018_eos, rx1018_fail
    sub $I11, rx1018_pos, rx1018_off
    substr $S10, rx1018_tgt, $I11, 1
    ne $S10, "~", rx1018_fail
    add rx1018_pos, 1
    set_addr $I10, rxcap_1023_fail
    ($I12, $I11) = rx1018_cur."!mark_peek"($I10)
    rx1018_cur."!cursor_pos"($I11)
    ($P10) = rx1018_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1018_pos, "")
    rx1018_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1023_done
  rxcap_1023_fail:
    goto rx1018_fail
  rxcap_1023_done:
  # rx subrule "O" subtype=capture negate=
    rx1018_cur."!cursor_pos"(rx1018_pos)
    $P10 = rx1018_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx1018_fail
    rx1018_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1018_pos = $P10."pos"()
  # rx pass
    rx1018_cur."!cursor_pass"(rx1018_pos, "prefix:sym<~>")
    rx1018_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx1018_pos)
    .return (rx1018_cur)
  rx1018_fail:
.annotate 'line', 431
    (rx1018_rep, rx1018_pos, $I10, $P10) = rx1018_cur."!mark_fail"(0)
    lt rx1018_pos, -1, rx1018_done
    eq rx1018_pos, -1, rx1018_fail
    jump $I10
  rx1018_done:
    rx1018_cur."!cursor_fail"()
    rx1018_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx1018_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("254_1274564776.41408") :method
.annotate 'line', 431
    $P1020 = self."!PREFIX__!subrule"("O", "~")
    new $P1021, "ResizablePMCArray"
    push $P1021, $P1020
    .return ($P1021)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("255_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1025_tgt
    .local int rx1025_pos
    .local int rx1025_off
    .local int rx1025_eos
    .local int rx1025_rep
    .local pmc rx1025_cur
    (rx1025_cur, rx1025_pos, rx1025_tgt) = self."!cursor_start"()
    rx1025_cur."!cursor_debug"("START ", "prefix:sym<->")
    .lex unicode:"$\x{a2}", rx1025_cur
    .local pmc match
    .lex "$/", match
    length rx1025_eos, rx1025_tgt
    set rx1025_off, 0
    lt rx1025_pos, 2, rx1025_start
    sub rx1025_off, rx1025_pos, 1
    substr rx1025_tgt, rx1025_tgt, rx1025_off
  rx1025_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1028_done
    goto rxscan1028_scan
  rxscan1028_loop:
    ($P10) = rx1025_cur."from"()
    inc $P10
    set rx1025_pos, $P10
    ge rx1025_pos, rx1025_eos, rxscan1028_done
  rxscan1028_scan:
    set_addr $I10, rxscan1028_loop
    rx1025_cur."!mark_push"(0, rx1025_pos, $I10)
  rxscan1028_done:
.annotate 'line', 486
  # rx subcapture "sym"
    set_addr $I10, rxcap_1029_fail
    rx1025_cur."!mark_push"(0, rx1025_pos, $I10)
  # rx literal  "-"
    add $I11, rx1025_pos, 1
    gt $I11, rx1025_eos, rx1025_fail
    sub $I11, rx1025_pos, rx1025_off
    substr $S10, rx1025_tgt, $I11, 1
    ne $S10, "-", rx1025_fail
    add rx1025_pos, 1
    set_addr $I10, rxcap_1029_fail
    ($I12, $I11) = rx1025_cur."!mark_peek"($I10)
    rx1025_cur."!cursor_pos"($I11)
    ($P10) = rx1025_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1025_pos, "")
    rx1025_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1029_done
  rxcap_1029_fail:
    goto rx1025_fail
  rxcap_1029_done:
  # rx enumcharlist negate=1 zerowidth
    ge rx1025_pos, rx1025_eos, rx1025_fail
    sub $I10, rx1025_pos, rx1025_off
    substr $S10, rx1025_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx1025_fail
  # rx subrule "number" subtype=zerowidth negate=1
    rx1025_cur."!cursor_pos"(rx1025_pos)
    $P10 = rx1025_cur."number"()
    if $P10, rx1025_fail
  # rx subrule "O" subtype=capture negate=
    rx1025_cur."!cursor_pos"(rx1025_pos)
    $P10 = rx1025_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx1025_fail
    rx1025_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1025_pos = $P10."pos"()
  # rx pass
    rx1025_cur."!cursor_pass"(rx1025_pos, "prefix:sym<->")
    rx1025_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx1025_pos)
    .return (rx1025_cur)
  rx1025_fail:
.annotate 'line', 431
    (rx1025_rep, rx1025_pos, $I10, $P10) = rx1025_cur."!mark_fail"(0)
    lt rx1025_pos, -1, rx1025_done
    eq rx1025_pos, -1, rx1025_fail
    jump $I10
  rx1025_done:
    rx1025_cur."!cursor_fail"()
    rx1025_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx1025_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("256_1274564776.41408") :method
.annotate 'line', 431
    new $P1027, "ResizablePMCArray"
    push $P1027, "-"
    .return ($P1027)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("257_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1031_tgt
    .local int rx1031_pos
    .local int rx1031_off
    .local int rx1031_eos
    .local int rx1031_rep
    .local pmc rx1031_cur
    (rx1031_cur, rx1031_pos, rx1031_tgt) = self."!cursor_start"()
    rx1031_cur."!cursor_debug"("START ", "prefix:sym<?>")
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
.annotate 'line', 487
  # rx subcapture "sym"
    set_addr $I10, rxcap_1036_fail
    rx1031_cur."!mark_push"(0, rx1031_pos, $I10)
  # rx literal  "?"
    add $I11, rx1031_pos, 1
    gt $I11, rx1031_eos, rx1031_fail
    sub $I11, rx1031_pos, rx1031_off
    substr $S10, rx1031_tgt, $I11, 1
    ne $S10, "?", rx1031_fail
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
    $P10 = rx1031_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx1031_fail
    rx1031_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1031_pos = $P10."pos"()
  # rx pass
    rx1031_cur."!cursor_pass"(rx1031_pos, "prefix:sym<?>")
    rx1031_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx1031_pos)
    .return (rx1031_cur)
  rx1031_fail:
.annotate 'line', 431
    (rx1031_rep, rx1031_pos, $I10, $P10) = rx1031_cur."!mark_fail"(0)
    lt rx1031_pos, -1, rx1031_done
    eq rx1031_pos, -1, rx1031_fail
    jump $I10
  rx1031_done:
    rx1031_cur."!cursor_fail"()
    rx1031_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx1031_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("258_1274564776.41408") :method
.annotate 'line', 431
    $P1033 = self."!PREFIX__!subrule"("O", "?")
    new $P1034, "ResizablePMCArray"
    push $P1034, $P1033
    .return ($P1034)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("259_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1038_tgt
    .local int rx1038_pos
    .local int rx1038_off
    .local int rx1038_eos
    .local int rx1038_rep
    .local pmc rx1038_cur
    (rx1038_cur, rx1038_pos, rx1038_tgt) = self."!cursor_start"()
    rx1038_cur."!cursor_debug"("START ", "prefix:sym<!>")
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
.annotate 'line', 488
  # rx subcapture "sym"
    set_addr $I10, rxcap_1043_fail
    rx1038_cur."!mark_push"(0, rx1038_pos, $I10)
  # rx literal  "!"
    add $I11, rx1038_pos, 1
    gt $I11, rx1038_eos, rx1038_fail
    sub $I11, rx1038_pos, rx1038_off
    substr $S10, rx1038_tgt, $I11, 1
    ne $S10, "!", rx1038_fail
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
    $P10 = rx1038_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx1038_fail
    rx1038_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1038_pos = $P10."pos"()
  # rx pass
    rx1038_cur."!cursor_pass"(rx1038_pos, "prefix:sym<!>")
    rx1038_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx1038_pos)
    .return (rx1038_cur)
  rx1038_fail:
.annotate 'line', 431
    (rx1038_rep, rx1038_pos, $I10, $P10) = rx1038_cur."!mark_fail"(0)
    lt rx1038_pos, -1, rx1038_done
    eq rx1038_pos, -1, rx1038_fail
    jump $I10
  rx1038_done:
    rx1038_cur."!cursor_fail"()
    rx1038_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx1038_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("260_1274564776.41408") :method
.annotate 'line', 431
    $P1040 = self."!PREFIX__!subrule"("O", "!")
    new $P1041, "ResizablePMCArray"
    push $P1041, $P1040
    .return ($P1041)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("261_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1045_tgt
    .local int rx1045_pos
    .local int rx1045_off
    .local int rx1045_eos
    .local int rx1045_rep
    .local pmc rx1045_cur
    (rx1045_cur, rx1045_pos, rx1045_tgt) = self."!cursor_start"()
    rx1045_cur."!cursor_debug"("START ", "prefix:sym<|>")
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
.annotate 'line', 489
  # rx subcapture "sym"
    set_addr $I10, rxcap_1050_fail
    rx1045_cur."!mark_push"(0, rx1045_pos, $I10)
  # rx literal  "|"
    add $I11, rx1045_pos, 1
    gt $I11, rx1045_eos, rx1045_fail
    sub $I11, rx1045_pos, rx1045_off
    substr $S10, rx1045_tgt, $I11, 1
    ne $S10, "|", rx1045_fail
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
    $P10 = rx1045_cur."O"("%symbolic_unary")
    unless $P10, rx1045_fail
    rx1045_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1045_pos = $P10."pos"()
  # rx pass
    rx1045_cur."!cursor_pass"(rx1045_pos, "prefix:sym<|>")
    rx1045_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx1045_pos)
    .return (rx1045_cur)
  rx1045_fail:
.annotate 'line', 431
    (rx1045_rep, rx1045_pos, $I10, $P10) = rx1045_cur."!mark_fail"(0)
    lt rx1045_pos, -1, rx1045_done
    eq rx1045_pos, -1, rx1045_fail
    jump $I10
  rx1045_done:
    rx1045_cur."!cursor_fail"()
    rx1045_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx1045_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("262_1274564776.41408") :method
.annotate 'line', 431
    $P1047 = self."!PREFIX__!subrule"("O", "|")
    new $P1048, "ResizablePMCArray"
    push $P1048, $P1047
    .return ($P1048)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("263_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1052_tgt
    .local int rx1052_pos
    .local int rx1052_off
    .local int rx1052_eos
    .local int rx1052_rep
    .local pmc rx1052_cur
    (rx1052_cur, rx1052_pos, rx1052_tgt) = self."!cursor_start"()
    rx1052_cur."!cursor_debug"("START ", "infix:sym<*>")
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
.annotate 'line', 491
  # rx subcapture "sym"
    set_addr $I10, rxcap_1057_fail
    rx1052_cur."!mark_push"(0, rx1052_pos, $I10)
  # rx literal  "*"
    add $I11, rx1052_pos, 1
    gt $I11, rx1052_eos, rx1052_fail
    sub $I11, rx1052_pos, rx1052_off
    substr $S10, rx1052_tgt, $I11, 1
    ne $S10, "*", rx1052_fail
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
    $P10 = rx1052_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx1052_fail
    rx1052_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1052_pos = $P10."pos"()
  # rx pass
    rx1052_cur."!cursor_pass"(rx1052_pos, "infix:sym<*>")
    rx1052_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx1052_pos)
    .return (rx1052_cur)
  rx1052_fail:
.annotate 'line', 431
    (rx1052_rep, rx1052_pos, $I10, $P10) = rx1052_cur."!mark_fail"(0)
    lt rx1052_pos, -1, rx1052_done
    eq rx1052_pos, -1, rx1052_fail
    jump $I10
  rx1052_done:
    rx1052_cur."!cursor_fail"()
    rx1052_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx1052_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("264_1274564776.41408") :method
.annotate 'line', 431
    $P1054 = self."!PREFIX__!subrule"("O", "*")
    new $P1055, "ResizablePMCArray"
    push $P1055, $P1054
    .return ($P1055)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("265_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1059_tgt
    .local int rx1059_pos
    .local int rx1059_off
    .local int rx1059_eos
    .local int rx1059_rep
    .local pmc rx1059_cur
    (rx1059_cur, rx1059_pos, rx1059_tgt) = self."!cursor_start"()
    rx1059_cur."!cursor_debug"("START ", "infix:sym</>")
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
.annotate 'line', 492
  # rx subcapture "sym"
    set_addr $I10, rxcap_1064_fail
    rx1059_cur."!mark_push"(0, rx1059_pos, $I10)
  # rx literal  "/"
    add $I11, rx1059_pos, 1
    gt $I11, rx1059_eos, rx1059_fail
    sub $I11, rx1059_pos, rx1059_off
    substr $S10, rx1059_tgt, $I11, 1
    ne $S10, "/", rx1059_fail
    add rx1059_pos, 1
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
    $P10 = rx1059_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx1059_fail
    rx1059_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1059_pos = $P10."pos"()
  # rx pass
    rx1059_cur."!cursor_pass"(rx1059_pos, "infix:sym</>")
    rx1059_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx1059_pos)
    .return (rx1059_cur)
  rx1059_fail:
.annotate 'line', 431
    (rx1059_rep, rx1059_pos, $I10, $P10) = rx1059_cur."!mark_fail"(0)
    lt rx1059_pos, -1, rx1059_done
    eq rx1059_pos, -1, rx1059_fail
    jump $I10
  rx1059_done:
    rx1059_cur."!cursor_fail"()
    rx1059_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx1059_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("266_1274564776.41408") :method
.annotate 'line', 431
    $P1061 = self."!PREFIX__!subrule"("O", "/")
    new $P1062, "ResizablePMCArray"
    push $P1062, $P1061
    .return ($P1062)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("267_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1066_tgt
    .local int rx1066_pos
    .local int rx1066_off
    .local int rx1066_eos
    .local int rx1066_rep
    .local pmc rx1066_cur
    (rx1066_cur, rx1066_pos, rx1066_tgt) = self."!cursor_start"()
    rx1066_cur."!cursor_debug"("START ", "infix:sym<%>")
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
.annotate 'line', 493
  # rx subcapture "sym"
    set_addr $I10, rxcap_1071_fail
    rx1066_cur."!mark_push"(0, rx1066_pos, $I10)
  # rx literal  "%"
    add $I11, rx1066_pos, 1
    gt $I11, rx1066_eos, rx1066_fail
    sub $I11, rx1066_pos, rx1066_off
    substr $S10, rx1066_tgt, $I11, 1
    ne $S10, "%", rx1066_fail
    add rx1066_pos, 1
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
    $P10 = rx1066_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx1066_fail
    rx1066_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1066_pos = $P10."pos"()
  # rx pass
    rx1066_cur."!cursor_pass"(rx1066_pos, "infix:sym<%>")
    rx1066_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx1066_pos)
    .return (rx1066_cur)
  rx1066_fail:
.annotate 'line', 431
    (rx1066_rep, rx1066_pos, $I10, $P10) = rx1066_cur."!mark_fail"(0)
    lt rx1066_pos, -1, rx1066_done
    eq rx1066_pos, -1, rx1066_fail
    jump $I10
  rx1066_done:
    rx1066_cur."!cursor_fail"()
    rx1066_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx1066_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("268_1274564776.41408") :method
.annotate 'line', 431
    $P1068 = self."!PREFIX__!subrule"("O", "%")
    new $P1069, "ResizablePMCArray"
    push $P1069, $P1068
    .return ($P1069)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("269_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1073_tgt
    .local int rx1073_pos
    .local int rx1073_off
    .local int rx1073_eos
    .local int rx1073_rep
    .local pmc rx1073_cur
    (rx1073_cur, rx1073_pos, rx1073_tgt) = self."!cursor_start"()
    rx1073_cur."!cursor_debug"("START ", "infix:sym<+>")
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
.annotate 'line', 495
  # rx subcapture "sym"
    set_addr $I10, rxcap_1078_fail
    rx1073_cur."!mark_push"(0, rx1073_pos, $I10)
  # rx literal  "+"
    add $I11, rx1073_pos, 1
    gt $I11, rx1073_eos, rx1073_fail
    sub $I11, rx1073_pos, rx1073_off
    substr $S10, rx1073_tgt, $I11, 1
    ne $S10, "+", rx1073_fail
    add rx1073_pos, 1
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
    $P10 = rx1073_cur."O"("%additive, :pirop<add>")
    unless $P10, rx1073_fail
    rx1073_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1073_pos = $P10."pos"()
  # rx pass
    rx1073_cur."!cursor_pass"(rx1073_pos, "infix:sym<+>")
    rx1073_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx1073_pos)
    .return (rx1073_cur)
  rx1073_fail:
.annotate 'line', 431
    (rx1073_rep, rx1073_pos, $I10, $P10) = rx1073_cur."!mark_fail"(0)
    lt rx1073_pos, -1, rx1073_done
    eq rx1073_pos, -1, rx1073_fail
    jump $I10
  rx1073_done:
    rx1073_cur."!cursor_fail"()
    rx1073_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx1073_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("270_1274564776.41408") :method
.annotate 'line', 431
    $P1075 = self."!PREFIX__!subrule"("O", "+")
    new $P1076, "ResizablePMCArray"
    push $P1076, $P1075
    .return ($P1076)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("271_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1080_tgt
    .local int rx1080_pos
    .local int rx1080_off
    .local int rx1080_eos
    .local int rx1080_rep
    .local pmc rx1080_cur
    (rx1080_cur, rx1080_pos, rx1080_tgt) = self."!cursor_start"()
    rx1080_cur."!cursor_debug"("START ", "infix:sym<->")
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
.annotate 'line', 496
  # rx subcapture "sym"
    set_addr $I10, rxcap_1085_fail
    rx1080_cur."!mark_push"(0, rx1080_pos, $I10)
  # rx literal  "-"
    add $I11, rx1080_pos, 1
    gt $I11, rx1080_eos, rx1080_fail
    sub $I11, rx1080_pos, rx1080_off
    substr $S10, rx1080_tgt, $I11, 1
    ne $S10, "-", rx1080_fail
    add rx1080_pos, 1
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
    $P10 = rx1080_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx1080_fail
    rx1080_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1080_pos = $P10."pos"()
  # rx pass
    rx1080_cur."!cursor_pass"(rx1080_pos, "infix:sym<->")
    rx1080_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx1080_pos)
    .return (rx1080_cur)
  rx1080_fail:
.annotate 'line', 431
    (rx1080_rep, rx1080_pos, $I10, $P10) = rx1080_cur."!mark_fail"(0)
    lt rx1080_pos, -1, rx1080_done
    eq rx1080_pos, -1, rx1080_fail
    jump $I10
  rx1080_done:
    rx1080_cur."!cursor_fail"()
    rx1080_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx1080_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("272_1274564776.41408") :method
.annotate 'line', 431
    $P1082 = self."!PREFIX__!subrule"("O", "-")
    new $P1083, "ResizablePMCArray"
    push $P1083, $P1082
    .return ($P1083)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("273_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1087_tgt
    .local int rx1087_pos
    .local int rx1087_off
    .local int rx1087_eos
    .local int rx1087_rep
    .local pmc rx1087_cur
    (rx1087_cur, rx1087_pos, rx1087_tgt) = self."!cursor_start"()
    rx1087_cur."!cursor_debug"("START ", "infix:sym<~>")
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
.annotate 'line', 498
  # rx subcapture "sym"
    set_addr $I10, rxcap_1092_fail
    rx1087_cur."!mark_push"(0, rx1087_pos, $I10)
  # rx literal  "~"
    add $I11, rx1087_pos, 1
    gt $I11, rx1087_eos, rx1087_fail
    sub $I11, rx1087_pos, rx1087_off
    substr $S10, rx1087_tgt, $I11, 1
    ne $S10, "~", rx1087_fail
    add rx1087_pos, 1
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
    $P10 = rx1087_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx1087_fail
    rx1087_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1087_pos = $P10."pos"()
  # rx pass
    rx1087_cur."!cursor_pass"(rx1087_pos, "infix:sym<~>")
    rx1087_cur."!cursor_debug"("PASS  ", "infix:sym<~>", " at pos=", rx1087_pos)
    .return (rx1087_cur)
  rx1087_fail:
.annotate 'line', 431
    (rx1087_rep, rx1087_pos, $I10, $P10) = rx1087_cur."!mark_fail"(0)
    lt rx1087_pos, -1, rx1087_done
    eq rx1087_pos, -1, rx1087_fail
    jump $I10
  rx1087_done:
    rx1087_cur."!cursor_fail"()
    rx1087_cur."!cursor_debug"("FAIL  ", "infix:sym<~>")
    .return (rx1087_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("274_1274564776.41408") :method
.annotate 'line', 431
    $P1089 = self."!PREFIX__!subrule"("O", "~")
    new $P1090, "ResizablePMCArray"
    push $P1090, $P1089
    .return ($P1090)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("275_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1094_tgt
    .local int rx1094_pos
    .local int rx1094_off
    .local int rx1094_eos
    .local int rx1094_rep
    .local pmc rx1094_cur
    (rx1094_cur, rx1094_pos, rx1094_tgt) = self."!cursor_start"()
    rx1094_cur."!cursor_debug"("START ", "infix:sym<==>")
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
.annotate 'line', 500
  # rx subcapture "sym"
    set_addr $I10, rxcap_1099_fail
    rx1094_cur."!mark_push"(0, rx1094_pos, $I10)
  # rx literal  "=="
    add $I11, rx1094_pos, 2
    gt $I11, rx1094_eos, rx1094_fail
    sub $I11, rx1094_pos, rx1094_off
    substr $S10, rx1094_tgt, $I11, 2
    ne $S10, "==", rx1094_fail
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
    $P10 = rx1094_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx1094_fail
    rx1094_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1094_pos = $P10."pos"()
  # rx pass
    rx1094_cur."!cursor_pass"(rx1094_pos, "infix:sym<==>")
    rx1094_cur."!cursor_debug"("PASS  ", "infix:sym<==>", " at pos=", rx1094_pos)
    .return (rx1094_cur)
  rx1094_fail:
.annotate 'line', 431
    (rx1094_rep, rx1094_pos, $I10, $P10) = rx1094_cur."!mark_fail"(0)
    lt rx1094_pos, -1, rx1094_done
    eq rx1094_pos, -1, rx1094_fail
    jump $I10
  rx1094_done:
    rx1094_cur."!cursor_fail"()
    rx1094_cur."!cursor_debug"("FAIL  ", "infix:sym<==>")
    .return (rx1094_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("276_1274564776.41408") :method
.annotate 'line', 431
    $P1096 = self."!PREFIX__!subrule"("O", "==")
    new $P1097, "ResizablePMCArray"
    push $P1097, $P1096
    .return ($P1097)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("277_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1101_tgt
    .local int rx1101_pos
    .local int rx1101_off
    .local int rx1101_eos
    .local int rx1101_rep
    .local pmc rx1101_cur
    (rx1101_cur, rx1101_pos, rx1101_tgt) = self."!cursor_start"()
    rx1101_cur."!cursor_debug"("START ", "infix:sym<!=>")
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
.annotate 'line', 501
  # rx subcapture "sym"
    set_addr $I10, rxcap_1106_fail
    rx1101_cur."!mark_push"(0, rx1101_pos, $I10)
  # rx literal  "!="
    add $I11, rx1101_pos, 2
    gt $I11, rx1101_eos, rx1101_fail
    sub $I11, rx1101_pos, rx1101_off
    substr $S10, rx1101_tgt, $I11, 2
    ne $S10, "!=", rx1101_fail
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
    $P10 = rx1101_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx1101_fail
    rx1101_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1101_pos = $P10."pos"()
  # rx pass
    rx1101_cur."!cursor_pass"(rx1101_pos, "infix:sym<!=>")
    rx1101_cur."!cursor_debug"("PASS  ", "infix:sym<!=>", " at pos=", rx1101_pos)
    .return (rx1101_cur)
  rx1101_fail:
.annotate 'line', 431
    (rx1101_rep, rx1101_pos, $I10, $P10) = rx1101_cur."!mark_fail"(0)
    lt rx1101_pos, -1, rx1101_done
    eq rx1101_pos, -1, rx1101_fail
    jump $I10
  rx1101_done:
    rx1101_cur."!cursor_fail"()
    rx1101_cur."!cursor_debug"("FAIL  ", "infix:sym<!=>")
    .return (rx1101_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("278_1274564776.41408") :method
.annotate 'line', 431
    $P1103 = self."!PREFIX__!subrule"("O", "!=")
    new $P1104, "ResizablePMCArray"
    push $P1104, $P1103
    .return ($P1104)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("279_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1108_tgt
    .local int rx1108_pos
    .local int rx1108_off
    .local int rx1108_eos
    .local int rx1108_rep
    .local pmc rx1108_cur
    (rx1108_cur, rx1108_pos, rx1108_tgt) = self."!cursor_start"()
    rx1108_cur."!cursor_debug"("START ", "infix:sym<<=>")
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
.annotate 'line', 502
  # rx subcapture "sym"
    set_addr $I10, rxcap_1113_fail
    rx1108_cur."!mark_push"(0, rx1108_pos, $I10)
  # rx literal  "<="
    add $I11, rx1108_pos, 2
    gt $I11, rx1108_eos, rx1108_fail
    sub $I11, rx1108_pos, rx1108_off
    substr $S10, rx1108_tgt, $I11, 2
    ne $S10, "<=", rx1108_fail
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
    $P10 = rx1108_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx1108_fail
    rx1108_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1108_pos = $P10."pos"()
  # rx pass
    rx1108_cur."!cursor_pass"(rx1108_pos, "infix:sym<<=>")
    rx1108_cur."!cursor_debug"("PASS  ", "infix:sym<<=>", " at pos=", rx1108_pos)
    .return (rx1108_cur)
  rx1108_fail:
.annotate 'line', 431
    (rx1108_rep, rx1108_pos, $I10, $P10) = rx1108_cur."!mark_fail"(0)
    lt rx1108_pos, -1, rx1108_done
    eq rx1108_pos, -1, rx1108_fail
    jump $I10
  rx1108_done:
    rx1108_cur."!cursor_fail"()
    rx1108_cur."!cursor_debug"("FAIL  ", "infix:sym<<=>")
    .return (rx1108_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("280_1274564776.41408") :method
.annotate 'line', 431
    $P1110 = self."!PREFIX__!subrule"("O", "<=")
    new $P1111, "ResizablePMCArray"
    push $P1111, $P1110
    .return ($P1111)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("281_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1115_tgt
    .local int rx1115_pos
    .local int rx1115_off
    .local int rx1115_eos
    .local int rx1115_rep
    .local pmc rx1115_cur
    (rx1115_cur, rx1115_pos, rx1115_tgt) = self."!cursor_start"()
    rx1115_cur."!cursor_debug"("START ", "infix:sym<>=>")
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
.annotate 'line', 503
  # rx subcapture "sym"
    set_addr $I10, rxcap_1120_fail
    rx1115_cur."!mark_push"(0, rx1115_pos, $I10)
  # rx literal  ">="
    add $I11, rx1115_pos, 2
    gt $I11, rx1115_eos, rx1115_fail
    sub $I11, rx1115_pos, rx1115_off
    substr $S10, rx1115_tgt, $I11, 2
    ne $S10, ">=", rx1115_fail
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
    $P10 = rx1115_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx1115_fail
    rx1115_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1115_pos = $P10."pos"()
  # rx pass
    rx1115_cur."!cursor_pass"(rx1115_pos, "infix:sym<>=>")
    rx1115_cur."!cursor_debug"("PASS  ", "infix:sym<>=>", " at pos=", rx1115_pos)
    .return (rx1115_cur)
  rx1115_fail:
.annotate 'line', 431
    (rx1115_rep, rx1115_pos, $I10, $P10) = rx1115_cur."!mark_fail"(0)
    lt rx1115_pos, -1, rx1115_done
    eq rx1115_pos, -1, rx1115_fail
    jump $I10
  rx1115_done:
    rx1115_cur."!cursor_fail"()
    rx1115_cur."!cursor_debug"("FAIL  ", "infix:sym<>=>")
    .return (rx1115_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("282_1274564776.41408") :method
.annotate 'line', 431
    $P1117 = self."!PREFIX__!subrule"("O", ">=")
    new $P1118, "ResizablePMCArray"
    push $P1118, $P1117
    .return ($P1118)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("283_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1122_tgt
    .local int rx1122_pos
    .local int rx1122_off
    .local int rx1122_eos
    .local int rx1122_rep
    .local pmc rx1122_cur
    (rx1122_cur, rx1122_pos, rx1122_tgt) = self."!cursor_start"()
    rx1122_cur."!cursor_debug"("START ", "infix:sym<<>")
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
.annotate 'line', 504
  # rx subcapture "sym"
    set_addr $I10, rxcap_1127_fail
    rx1122_cur."!mark_push"(0, rx1122_pos, $I10)
  # rx literal  "<"
    add $I11, rx1122_pos, 1
    gt $I11, rx1122_eos, rx1122_fail
    sub $I11, rx1122_pos, rx1122_off
    substr $S10, rx1122_tgt, $I11, 1
    ne $S10, "<", rx1122_fail
    add rx1122_pos, 1
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
    $P10 = rx1122_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx1122_fail
    rx1122_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1122_pos = $P10."pos"()
  # rx pass
    rx1122_cur."!cursor_pass"(rx1122_pos, "infix:sym<<>")
    rx1122_cur."!cursor_debug"("PASS  ", "infix:sym<<>", " at pos=", rx1122_pos)
    .return (rx1122_cur)
  rx1122_fail:
.annotate 'line', 431
    (rx1122_rep, rx1122_pos, $I10, $P10) = rx1122_cur."!mark_fail"(0)
    lt rx1122_pos, -1, rx1122_done
    eq rx1122_pos, -1, rx1122_fail
    jump $I10
  rx1122_done:
    rx1122_cur."!cursor_fail"()
    rx1122_cur."!cursor_debug"("FAIL  ", "infix:sym<<>")
    .return (rx1122_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("284_1274564776.41408") :method
.annotate 'line', 431
    $P1124 = self."!PREFIX__!subrule"("O", "<")
    new $P1125, "ResizablePMCArray"
    push $P1125, $P1124
    .return ($P1125)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("285_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1129_tgt
    .local int rx1129_pos
    .local int rx1129_off
    .local int rx1129_eos
    .local int rx1129_rep
    .local pmc rx1129_cur
    (rx1129_cur, rx1129_pos, rx1129_tgt) = self."!cursor_start"()
    rx1129_cur."!cursor_debug"("START ", "infix:sym<>>")
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
.annotate 'line', 505
  # rx subcapture "sym"
    set_addr $I10, rxcap_1134_fail
    rx1129_cur."!mark_push"(0, rx1129_pos, $I10)
  # rx literal  ">"
    add $I11, rx1129_pos, 1
    gt $I11, rx1129_eos, rx1129_fail
    sub $I11, rx1129_pos, rx1129_off
    substr $S10, rx1129_tgt, $I11, 1
    ne $S10, ">", rx1129_fail
    add rx1129_pos, 1
    set_addr $I10, rxcap_1134_fail
    ($I12, $I11) = rx1129_cur."!mark_peek"($I10)
    rx1129_cur."!cursor_pos"($I11)
    ($P10) = rx1129_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1129_pos, "")
    rx1129_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1134_done
  rxcap_1134_fail:
    goto rx1129_fail
  rxcap_1134_done:
  # rx subrule "O" subtype=capture negate=
    rx1129_cur."!cursor_pos"(rx1129_pos)
    $P10 = rx1129_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx1129_fail
    rx1129_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1129_pos = $P10."pos"()
  # rx pass
    rx1129_cur."!cursor_pass"(rx1129_pos, "infix:sym<>>")
    rx1129_cur."!cursor_debug"("PASS  ", "infix:sym<>>", " at pos=", rx1129_pos)
    .return (rx1129_cur)
  rx1129_fail:
.annotate 'line', 431
    (rx1129_rep, rx1129_pos, $I10, $P10) = rx1129_cur."!mark_fail"(0)
    lt rx1129_pos, -1, rx1129_done
    eq rx1129_pos, -1, rx1129_fail
    jump $I10
  rx1129_done:
    rx1129_cur."!cursor_fail"()
    rx1129_cur."!cursor_debug"("FAIL  ", "infix:sym<>>")
    .return (rx1129_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("286_1274564776.41408") :method
.annotate 'line', 431
    $P1131 = self."!PREFIX__!subrule"("O", ">")
    new $P1132, "ResizablePMCArray"
    push $P1132, $P1131
    .return ($P1132)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("287_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1136_tgt
    .local int rx1136_pos
    .local int rx1136_off
    .local int rx1136_eos
    .local int rx1136_rep
    .local pmc rx1136_cur
    (rx1136_cur, rx1136_pos, rx1136_tgt) = self."!cursor_start"()
    rx1136_cur."!cursor_debug"("START ", "infix:sym<eq>")
    .lex unicode:"$\x{a2}", rx1136_cur
    .local pmc match
    .lex "$/", match
    length rx1136_eos, rx1136_tgt
    set rx1136_off, 0
    lt rx1136_pos, 2, rx1136_start
    sub rx1136_off, rx1136_pos, 1
    substr rx1136_tgt, rx1136_tgt, rx1136_off
  rx1136_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1140_done
    goto rxscan1140_scan
  rxscan1140_loop:
    ($P10) = rx1136_cur."from"()
    inc $P10
    set rx1136_pos, $P10
    ge rx1136_pos, rx1136_eos, rxscan1140_done
  rxscan1140_scan:
    set_addr $I10, rxscan1140_loop
    rx1136_cur."!mark_push"(0, rx1136_pos, $I10)
  rxscan1140_done:
.annotate 'line', 506
  # rx subcapture "sym"
    set_addr $I10, rxcap_1141_fail
    rx1136_cur."!mark_push"(0, rx1136_pos, $I10)
  # rx literal  "eq"
    add $I11, rx1136_pos, 2
    gt $I11, rx1136_eos, rx1136_fail
    sub $I11, rx1136_pos, rx1136_off
    substr $S10, rx1136_tgt, $I11, 2
    ne $S10, "eq", rx1136_fail
    add rx1136_pos, 2
    set_addr $I10, rxcap_1141_fail
    ($I12, $I11) = rx1136_cur."!mark_peek"($I10)
    rx1136_cur."!cursor_pos"($I11)
    ($P10) = rx1136_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1136_pos, "")
    rx1136_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1141_done
  rxcap_1141_fail:
    goto rx1136_fail
  rxcap_1141_done:
  # rx subrule "O" subtype=capture negate=
    rx1136_cur."!cursor_pos"(rx1136_pos)
    $P10 = rx1136_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx1136_fail
    rx1136_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1136_pos = $P10."pos"()
  # rx pass
    rx1136_cur."!cursor_pass"(rx1136_pos, "infix:sym<eq>")
    rx1136_cur."!cursor_debug"("PASS  ", "infix:sym<eq>", " at pos=", rx1136_pos)
    .return (rx1136_cur)
  rx1136_fail:
.annotate 'line', 431
    (rx1136_rep, rx1136_pos, $I10, $P10) = rx1136_cur."!mark_fail"(0)
    lt rx1136_pos, -1, rx1136_done
    eq rx1136_pos, -1, rx1136_fail
    jump $I10
  rx1136_done:
    rx1136_cur."!cursor_fail"()
    rx1136_cur."!cursor_debug"("FAIL  ", "infix:sym<eq>")
    .return (rx1136_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("288_1274564776.41408") :method
.annotate 'line', 431
    $P1138 = self."!PREFIX__!subrule"("O", "eq")
    new $P1139, "ResizablePMCArray"
    push $P1139, $P1138
    .return ($P1139)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("289_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1143_tgt
    .local int rx1143_pos
    .local int rx1143_off
    .local int rx1143_eos
    .local int rx1143_rep
    .local pmc rx1143_cur
    (rx1143_cur, rx1143_pos, rx1143_tgt) = self."!cursor_start"()
    rx1143_cur."!cursor_debug"("START ", "infix:sym<ne>")
    .lex unicode:"$\x{a2}", rx1143_cur
    .local pmc match
    .lex "$/", match
    length rx1143_eos, rx1143_tgt
    set rx1143_off, 0
    lt rx1143_pos, 2, rx1143_start
    sub rx1143_off, rx1143_pos, 1
    substr rx1143_tgt, rx1143_tgt, rx1143_off
  rx1143_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1147_done
    goto rxscan1147_scan
  rxscan1147_loop:
    ($P10) = rx1143_cur."from"()
    inc $P10
    set rx1143_pos, $P10
    ge rx1143_pos, rx1143_eos, rxscan1147_done
  rxscan1147_scan:
    set_addr $I10, rxscan1147_loop
    rx1143_cur."!mark_push"(0, rx1143_pos, $I10)
  rxscan1147_done:
.annotate 'line', 507
  # rx subcapture "sym"
    set_addr $I10, rxcap_1148_fail
    rx1143_cur."!mark_push"(0, rx1143_pos, $I10)
  # rx literal  "ne"
    add $I11, rx1143_pos, 2
    gt $I11, rx1143_eos, rx1143_fail
    sub $I11, rx1143_pos, rx1143_off
    substr $S10, rx1143_tgt, $I11, 2
    ne $S10, "ne", rx1143_fail
    add rx1143_pos, 2
    set_addr $I10, rxcap_1148_fail
    ($I12, $I11) = rx1143_cur."!mark_peek"($I10)
    rx1143_cur."!cursor_pos"($I11)
    ($P10) = rx1143_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1143_pos, "")
    rx1143_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1148_done
  rxcap_1148_fail:
    goto rx1143_fail
  rxcap_1148_done:
  # rx subrule "O" subtype=capture negate=
    rx1143_cur."!cursor_pos"(rx1143_pos)
    $P10 = rx1143_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx1143_fail
    rx1143_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1143_pos = $P10."pos"()
  # rx pass
    rx1143_cur."!cursor_pass"(rx1143_pos, "infix:sym<ne>")
    rx1143_cur."!cursor_debug"("PASS  ", "infix:sym<ne>", " at pos=", rx1143_pos)
    .return (rx1143_cur)
  rx1143_fail:
.annotate 'line', 431
    (rx1143_rep, rx1143_pos, $I10, $P10) = rx1143_cur."!mark_fail"(0)
    lt rx1143_pos, -1, rx1143_done
    eq rx1143_pos, -1, rx1143_fail
    jump $I10
  rx1143_done:
    rx1143_cur."!cursor_fail"()
    rx1143_cur."!cursor_debug"("FAIL  ", "infix:sym<ne>")
    .return (rx1143_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("290_1274564776.41408") :method
.annotate 'line', 431
    $P1145 = self."!PREFIX__!subrule"("O", "ne")
    new $P1146, "ResizablePMCArray"
    push $P1146, $P1145
    .return ($P1146)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("291_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1150_tgt
    .local int rx1150_pos
    .local int rx1150_off
    .local int rx1150_eos
    .local int rx1150_rep
    .local pmc rx1150_cur
    (rx1150_cur, rx1150_pos, rx1150_tgt) = self."!cursor_start"()
    rx1150_cur."!cursor_debug"("START ", "infix:sym<le>")
    .lex unicode:"$\x{a2}", rx1150_cur
    .local pmc match
    .lex "$/", match
    length rx1150_eos, rx1150_tgt
    set rx1150_off, 0
    lt rx1150_pos, 2, rx1150_start
    sub rx1150_off, rx1150_pos, 1
    substr rx1150_tgt, rx1150_tgt, rx1150_off
  rx1150_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1154_done
    goto rxscan1154_scan
  rxscan1154_loop:
    ($P10) = rx1150_cur."from"()
    inc $P10
    set rx1150_pos, $P10
    ge rx1150_pos, rx1150_eos, rxscan1154_done
  rxscan1154_scan:
    set_addr $I10, rxscan1154_loop
    rx1150_cur."!mark_push"(0, rx1150_pos, $I10)
  rxscan1154_done:
.annotate 'line', 508
  # rx subcapture "sym"
    set_addr $I10, rxcap_1155_fail
    rx1150_cur."!mark_push"(0, rx1150_pos, $I10)
  # rx literal  "le"
    add $I11, rx1150_pos, 2
    gt $I11, rx1150_eos, rx1150_fail
    sub $I11, rx1150_pos, rx1150_off
    substr $S10, rx1150_tgt, $I11, 2
    ne $S10, "le", rx1150_fail
    add rx1150_pos, 2
    set_addr $I10, rxcap_1155_fail
    ($I12, $I11) = rx1150_cur."!mark_peek"($I10)
    rx1150_cur."!cursor_pos"($I11)
    ($P10) = rx1150_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1150_pos, "")
    rx1150_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1155_done
  rxcap_1155_fail:
    goto rx1150_fail
  rxcap_1155_done:
  # rx subrule "O" subtype=capture negate=
    rx1150_cur."!cursor_pos"(rx1150_pos)
    $P10 = rx1150_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx1150_fail
    rx1150_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1150_pos = $P10."pos"()
  # rx pass
    rx1150_cur."!cursor_pass"(rx1150_pos, "infix:sym<le>")
    rx1150_cur."!cursor_debug"("PASS  ", "infix:sym<le>", " at pos=", rx1150_pos)
    .return (rx1150_cur)
  rx1150_fail:
.annotate 'line', 431
    (rx1150_rep, rx1150_pos, $I10, $P10) = rx1150_cur."!mark_fail"(0)
    lt rx1150_pos, -1, rx1150_done
    eq rx1150_pos, -1, rx1150_fail
    jump $I10
  rx1150_done:
    rx1150_cur."!cursor_fail"()
    rx1150_cur."!cursor_debug"("FAIL  ", "infix:sym<le>")
    .return (rx1150_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("292_1274564776.41408") :method
.annotate 'line', 431
    $P1152 = self."!PREFIX__!subrule"("O", "le")
    new $P1153, "ResizablePMCArray"
    push $P1153, $P1152
    .return ($P1153)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("293_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1157_tgt
    .local int rx1157_pos
    .local int rx1157_off
    .local int rx1157_eos
    .local int rx1157_rep
    .local pmc rx1157_cur
    (rx1157_cur, rx1157_pos, rx1157_tgt) = self."!cursor_start"()
    rx1157_cur."!cursor_debug"("START ", "infix:sym<ge>")
    .lex unicode:"$\x{a2}", rx1157_cur
    .local pmc match
    .lex "$/", match
    length rx1157_eos, rx1157_tgt
    set rx1157_off, 0
    lt rx1157_pos, 2, rx1157_start
    sub rx1157_off, rx1157_pos, 1
    substr rx1157_tgt, rx1157_tgt, rx1157_off
  rx1157_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1161_done
    goto rxscan1161_scan
  rxscan1161_loop:
    ($P10) = rx1157_cur."from"()
    inc $P10
    set rx1157_pos, $P10
    ge rx1157_pos, rx1157_eos, rxscan1161_done
  rxscan1161_scan:
    set_addr $I10, rxscan1161_loop
    rx1157_cur."!mark_push"(0, rx1157_pos, $I10)
  rxscan1161_done:
.annotate 'line', 509
  # rx subcapture "sym"
    set_addr $I10, rxcap_1162_fail
    rx1157_cur."!mark_push"(0, rx1157_pos, $I10)
  # rx literal  "ge"
    add $I11, rx1157_pos, 2
    gt $I11, rx1157_eos, rx1157_fail
    sub $I11, rx1157_pos, rx1157_off
    substr $S10, rx1157_tgt, $I11, 2
    ne $S10, "ge", rx1157_fail
    add rx1157_pos, 2
    set_addr $I10, rxcap_1162_fail
    ($I12, $I11) = rx1157_cur."!mark_peek"($I10)
    rx1157_cur."!cursor_pos"($I11)
    ($P10) = rx1157_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1157_pos, "")
    rx1157_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1162_done
  rxcap_1162_fail:
    goto rx1157_fail
  rxcap_1162_done:
  # rx subrule "O" subtype=capture negate=
    rx1157_cur."!cursor_pos"(rx1157_pos)
    $P10 = rx1157_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx1157_fail
    rx1157_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1157_pos = $P10."pos"()
  # rx pass
    rx1157_cur."!cursor_pass"(rx1157_pos, "infix:sym<ge>")
    rx1157_cur."!cursor_debug"("PASS  ", "infix:sym<ge>", " at pos=", rx1157_pos)
    .return (rx1157_cur)
  rx1157_fail:
.annotate 'line', 431
    (rx1157_rep, rx1157_pos, $I10, $P10) = rx1157_cur."!mark_fail"(0)
    lt rx1157_pos, -1, rx1157_done
    eq rx1157_pos, -1, rx1157_fail
    jump $I10
  rx1157_done:
    rx1157_cur."!cursor_fail"()
    rx1157_cur."!cursor_debug"("FAIL  ", "infix:sym<ge>")
    .return (rx1157_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("294_1274564776.41408") :method
.annotate 'line', 431
    $P1159 = self."!PREFIX__!subrule"("O", "ge")
    new $P1160, "ResizablePMCArray"
    push $P1160, $P1159
    .return ($P1160)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("295_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1164_tgt
    .local int rx1164_pos
    .local int rx1164_off
    .local int rx1164_eos
    .local int rx1164_rep
    .local pmc rx1164_cur
    (rx1164_cur, rx1164_pos, rx1164_tgt) = self."!cursor_start"()
    rx1164_cur."!cursor_debug"("START ", "infix:sym<lt>")
    .lex unicode:"$\x{a2}", rx1164_cur
    .local pmc match
    .lex "$/", match
    length rx1164_eos, rx1164_tgt
    set rx1164_off, 0
    lt rx1164_pos, 2, rx1164_start
    sub rx1164_off, rx1164_pos, 1
    substr rx1164_tgt, rx1164_tgt, rx1164_off
  rx1164_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1168_done
    goto rxscan1168_scan
  rxscan1168_loop:
    ($P10) = rx1164_cur."from"()
    inc $P10
    set rx1164_pos, $P10
    ge rx1164_pos, rx1164_eos, rxscan1168_done
  rxscan1168_scan:
    set_addr $I10, rxscan1168_loop
    rx1164_cur."!mark_push"(0, rx1164_pos, $I10)
  rxscan1168_done:
.annotate 'line', 510
  # rx subcapture "sym"
    set_addr $I10, rxcap_1169_fail
    rx1164_cur."!mark_push"(0, rx1164_pos, $I10)
  # rx literal  "lt"
    add $I11, rx1164_pos, 2
    gt $I11, rx1164_eos, rx1164_fail
    sub $I11, rx1164_pos, rx1164_off
    substr $S10, rx1164_tgt, $I11, 2
    ne $S10, "lt", rx1164_fail
    add rx1164_pos, 2
    set_addr $I10, rxcap_1169_fail
    ($I12, $I11) = rx1164_cur."!mark_peek"($I10)
    rx1164_cur."!cursor_pos"($I11)
    ($P10) = rx1164_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1164_pos, "")
    rx1164_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1169_done
  rxcap_1169_fail:
    goto rx1164_fail
  rxcap_1169_done:
  # rx subrule "O" subtype=capture negate=
    rx1164_cur."!cursor_pos"(rx1164_pos)
    $P10 = rx1164_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx1164_fail
    rx1164_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1164_pos = $P10."pos"()
  # rx pass
    rx1164_cur."!cursor_pass"(rx1164_pos, "infix:sym<lt>")
    rx1164_cur."!cursor_debug"("PASS  ", "infix:sym<lt>", " at pos=", rx1164_pos)
    .return (rx1164_cur)
  rx1164_fail:
.annotate 'line', 431
    (rx1164_rep, rx1164_pos, $I10, $P10) = rx1164_cur."!mark_fail"(0)
    lt rx1164_pos, -1, rx1164_done
    eq rx1164_pos, -1, rx1164_fail
    jump $I10
  rx1164_done:
    rx1164_cur."!cursor_fail"()
    rx1164_cur."!cursor_debug"("FAIL  ", "infix:sym<lt>")
    .return (rx1164_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("296_1274564776.41408") :method
.annotate 'line', 431
    $P1166 = self."!PREFIX__!subrule"("O", "lt")
    new $P1167, "ResizablePMCArray"
    push $P1167, $P1166
    .return ($P1167)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("297_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1171_tgt
    .local int rx1171_pos
    .local int rx1171_off
    .local int rx1171_eos
    .local int rx1171_rep
    .local pmc rx1171_cur
    (rx1171_cur, rx1171_pos, rx1171_tgt) = self."!cursor_start"()
    rx1171_cur."!cursor_debug"("START ", "infix:sym<gt>")
    .lex unicode:"$\x{a2}", rx1171_cur
    .local pmc match
    .lex "$/", match
    length rx1171_eos, rx1171_tgt
    set rx1171_off, 0
    lt rx1171_pos, 2, rx1171_start
    sub rx1171_off, rx1171_pos, 1
    substr rx1171_tgt, rx1171_tgt, rx1171_off
  rx1171_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1175_done
    goto rxscan1175_scan
  rxscan1175_loop:
    ($P10) = rx1171_cur."from"()
    inc $P10
    set rx1171_pos, $P10
    ge rx1171_pos, rx1171_eos, rxscan1175_done
  rxscan1175_scan:
    set_addr $I10, rxscan1175_loop
    rx1171_cur."!mark_push"(0, rx1171_pos, $I10)
  rxscan1175_done:
.annotate 'line', 511
  # rx subcapture "sym"
    set_addr $I10, rxcap_1176_fail
    rx1171_cur."!mark_push"(0, rx1171_pos, $I10)
  # rx literal  "gt"
    add $I11, rx1171_pos, 2
    gt $I11, rx1171_eos, rx1171_fail
    sub $I11, rx1171_pos, rx1171_off
    substr $S10, rx1171_tgt, $I11, 2
    ne $S10, "gt", rx1171_fail
    add rx1171_pos, 2
    set_addr $I10, rxcap_1176_fail
    ($I12, $I11) = rx1171_cur."!mark_peek"($I10)
    rx1171_cur."!cursor_pos"($I11)
    ($P10) = rx1171_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1171_pos, "")
    rx1171_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1176_done
  rxcap_1176_fail:
    goto rx1171_fail
  rxcap_1176_done:
  # rx subrule "O" subtype=capture negate=
    rx1171_cur."!cursor_pos"(rx1171_pos)
    $P10 = rx1171_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx1171_fail
    rx1171_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1171_pos = $P10."pos"()
  # rx pass
    rx1171_cur."!cursor_pass"(rx1171_pos, "infix:sym<gt>")
    rx1171_cur."!cursor_debug"("PASS  ", "infix:sym<gt>", " at pos=", rx1171_pos)
    .return (rx1171_cur)
  rx1171_fail:
.annotate 'line', 431
    (rx1171_rep, rx1171_pos, $I10, $P10) = rx1171_cur."!mark_fail"(0)
    lt rx1171_pos, -1, rx1171_done
    eq rx1171_pos, -1, rx1171_fail
    jump $I10
  rx1171_done:
    rx1171_cur."!cursor_fail"()
    rx1171_cur."!cursor_debug"("FAIL  ", "infix:sym<gt>")
    .return (rx1171_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("298_1274564776.41408") :method
.annotate 'line', 431
    $P1173 = self."!PREFIX__!subrule"("O", "gt")
    new $P1174, "ResizablePMCArray"
    push $P1174, $P1173
    .return ($P1174)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("299_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1178_tgt
    .local int rx1178_pos
    .local int rx1178_off
    .local int rx1178_eos
    .local int rx1178_rep
    .local pmc rx1178_cur
    (rx1178_cur, rx1178_pos, rx1178_tgt) = self."!cursor_start"()
    rx1178_cur."!cursor_debug"("START ", "infix:sym<=:=>")
    .lex unicode:"$\x{a2}", rx1178_cur
    .local pmc match
    .lex "$/", match
    length rx1178_eos, rx1178_tgt
    set rx1178_off, 0
    lt rx1178_pos, 2, rx1178_start
    sub rx1178_off, rx1178_pos, 1
    substr rx1178_tgt, rx1178_tgt, rx1178_off
  rx1178_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1182_done
    goto rxscan1182_scan
  rxscan1182_loop:
    ($P10) = rx1178_cur."from"()
    inc $P10
    set rx1178_pos, $P10
    ge rx1178_pos, rx1178_eos, rxscan1182_done
  rxscan1182_scan:
    set_addr $I10, rxscan1182_loop
    rx1178_cur."!mark_push"(0, rx1178_pos, $I10)
  rxscan1182_done:
.annotate 'line', 512
  # rx subcapture "sym"
    set_addr $I10, rxcap_1183_fail
    rx1178_cur."!mark_push"(0, rx1178_pos, $I10)
  # rx literal  "=:="
    add $I11, rx1178_pos, 3
    gt $I11, rx1178_eos, rx1178_fail
    sub $I11, rx1178_pos, rx1178_off
    substr $S10, rx1178_tgt, $I11, 3
    ne $S10, "=:=", rx1178_fail
    add rx1178_pos, 3
    set_addr $I10, rxcap_1183_fail
    ($I12, $I11) = rx1178_cur."!mark_peek"($I10)
    rx1178_cur."!cursor_pos"($I11)
    ($P10) = rx1178_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1178_pos, "")
    rx1178_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1183_done
  rxcap_1183_fail:
    goto rx1178_fail
  rxcap_1183_done:
  # rx subrule "O" subtype=capture negate=
    rx1178_cur."!cursor_pos"(rx1178_pos)
    $P10 = rx1178_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx1178_fail
    rx1178_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1178_pos = $P10."pos"()
  # rx pass
    rx1178_cur."!cursor_pass"(rx1178_pos, "infix:sym<=:=>")
    rx1178_cur."!cursor_debug"("PASS  ", "infix:sym<=:=>", " at pos=", rx1178_pos)
    .return (rx1178_cur)
  rx1178_fail:
.annotate 'line', 431
    (rx1178_rep, rx1178_pos, $I10, $P10) = rx1178_cur."!mark_fail"(0)
    lt rx1178_pos, -1, rx1178_done
    eq rx1178_pos, -1, rx1178_fail
    jump $I10
  rx1178_done:
    rx1178_cur."!cursor_fail"()
    rx1178_cur."!cursor_debug"("FAIL  ", "infix:sym<=:=>")
    .return (rx1178_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("300_1274564776.41408") :method
.annotate 'line', 431
    $P1180 = self."!PREFIX__!subrule"("O", "=:=")
    new $P1181, "ResizablePMCArray"
    push $P1181, $P1180
    .return ($P1181)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~~>"  :subid("301_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1185_tgt
    .local int rx1185_pos
    .local int rx1185_off
    .local int rx1185_eos
    .local int rx1185_rep
    .local pmc rx1185_cur
    (rx1185_cur, rx1185_pos, rx1185_tgt) = self."!cursor_start"()
    rx1185_cur."!cursor_debug"("START ", "infix:sym<~~>")
    .lex unicode:"$\x{a2}", rx1185_cur
    .local pmc match
    .lex "$/", match
    length rx1185_eos, rx1185_tgt
    set rx1185_off, 0
    lt rx1185_pos, 2, rx1185_start
    sub rx1185_off, rx1185_pos, 1
    substr rx1185_tgt, rx1185_tgt, rx1185_off
  rx1185_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1189_done
    goto rxscan1189_scan
  rxscan1189_loop:
    ($P10) = rx1185_cur."from"()
    inc $P10
    set rx1185_pos, $P10
    ge rx1185_pos, rx1185_eos, rxscan1189_done
  rxscan1189_scan:
    set_addr $I10, rxscan1189_loop
    rx1185_cur."!mark_push"(0, rx1185_pos, $I10)
  rxscan1189_done:
.annotate 'line', 513
  # rx subcapture "sym"
    set_addr $I10, rxcap_1190_fail
    rx1185_cur."!mark_push"(0, rx1185_pos, $I10)
  # rx literal  "~~"
    add $I11, rx1185_pos, 2
    gt $I11, rx1185_eos, rx1185_fail
    sub $I11, rx1185_pos, rx1185_off
    substr $S10, rx1185_tgt, $I11, 2
    ne $S10, "~~", rx1185_fail
    add rx1185_pos, 2
    set_addr $I10, rxcap_1190_fail
    ($I12, $I11) = rx1185_cur."!mark_peek"($I10)
    rx1185_cur."!cursor_pos"($I11)
    ($P10) = rx1185_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1185_pos, "")
    rx1185_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1190_done
  rxcap_1190_fail:
    goto rx1185_fail
  rxcap_1190_done:
  # rx subrule "O" subtype=capture negate=
    rx1185_cur."!cursor_pos"(rx1185_pos)
    $P10 = rx1185_cur."O"("%relational, :reducecheck<smartmatch>")
    unless $P10, rx1185_fail
    rx1185_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1185_pos = $P10."pos"()
  # rx pass
    rx1185_cur."!cursor_pass"(rx1185_pos, "infix:sym<~~>")
    rx1185_cur."!cursor_debug"("PASS  ", "infix:sym<~~>", " at pos=", rx1185_pos)
    .return (rx1185_cur)
  rx1185_fail:
.annotate 'line', 431
    (rx1185_rep, rx1185_pos, $I10, $P10) = rx1185_cur."!mark_fail"(0)
    lt rx1185_pos, -1, rx1185_done
    eq rx1185_pos, -1, rx1185_fail
    jump $I10
  rx1185_done:
    rx1185_cur."!cursor_fail"()
    rx1185_cur."!cursor_debug"("FAIL  ", "infix:sym<~~>")
    .return (rx1185_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~~>"  :subid("302_1274564776.41408") :method
.annotate 'line', 431
    $P1187 = self."!PREFIX__!subrule"("O", "~~")
    new $P1188, "ResizablePMCArray"
    push $P1188, $P1187
    .return ($P1188)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("303_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1192_tgt
    .local int rx1192_pos
    .local int rx1192_off
    .local int rx1192_eos
    .local int rx1192_rep
    .local pmc rx1192_cur
    (rx1192_cur, rx1192_pos, rx1192_tgt) = self."!cursor_start"()
    rx1192_cur."!cursor_debug"("START ", "infix:sym<&&>")
    .lex unicode:"$\x{a2}", rx1192_cur
    .local pmc match
    .lex "$/", match
    length rx1192_eos, rx1192_tgt
    set rx1192_off, 0
    lt rx1192_pos, 2, rx1192_start
    sub rx1192_off, rx1192_pos, 1
    substr rx1192_tgt, rx1192_tgt, rx1192_off
  rx1192_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1196_done
    goto rxscan1196_scan
  rxscan1196_loop:
    ($P10) = rx1192_cur."from"()
    inc $P10
    set rx1192_pos, $P10
    ge rx1192_pos, rx1192_eos, rxscan1196_done
  rxscan1196_scan:
    set_addr $I10, rxscan1196_loop
    rx1192_cur."!mark_push"(0, rx1192_pos, $I10)
  rxscan1196_done:
.annotate 'line', 515
  # rx subcapture "sym"
    set_addr $I10, rxcap_1197_fail
    rx1192_cur."!mark_push"(0, rx1192_pos, $I10)
  # rx literal  "&&"
    add $I11, rx1192_pos, 2
    gt $I11, rx1192_eos, rx1192_fail
    sub $I11, rx1192_pos, rx1192_off
    substr $S10, rx1192_tgt, $I11, 2
    ne $S10, "&&", rx1192_fail
    add rx1192_pos, 2
    set_addr $I10, rxcap_1197_fail
    ($I12, $I11) = rx1192_cur."!mark_peek"($I10)
    rx1192_cur."!cursor_pos"($I11)
    ($P10) = rx1192_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1192_pos, "")
    rx1192_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1197_done
  rxcap_1197_fail:
    goto rx1192_fail
  rxcap_1197_done:
  # rx subrule "O" subtype=capture negate=
    rx1192_cur."!cursor_pos"(rx1192_pos)
    $P10 = rx1192_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx1192_fail
    rx1192_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1192_pos = $P10."pos"()
  # rx pass
    rx1192_cur."!cursor_pass"(rx1192_pos, "infix:sym<&&>")
    rx1192_cur."!cursor_debug"("PASS  ", "infix:sym<&&>", " at pos=", rx1192_pos)
    .return (rx1192_cur)
  rx1192_fail:
.annotate 'line', 431
    (rx1192_rep, rx1192_pos, $I10, $P10) = rx1192_cur."!mark_fail"(0)
    lt rx1192_pos, -1, rx1192_done
    eq rx1192_pos, -1, rx1192_fail
    jump $I10
  rx1192_done:
    rx1192_cur."!cursor_fail"()
    rx1192_cur."!cursor_debug"("FAIL  ", "infix:sym<&&>")
    .return (rx1192_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("304_1274564776.41408") :method
.annotate 'line', 431
    $P1194 = self."!PREFIX__!subrule"("O", "&&")
    new $P1195, "ResizablePMCArray"
    push $P1195, $P1194
    .return ($P1195)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("305_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1199_tgt
    .local int rx1199_pos
    .local int rx1199_off
    .local int rx1199_eos
    .local int rx1199_rep
    .local pmc rx1199_cur
    (rx1199_cur, rx1199_pos, rx1199_tgt) = self."!cursor_start"()
    rx1199_cur."!cursor_debug"("START ", "infix:sym<||>")
    .lex unicode:"$\x{a2}", rx1199_cur
    .local pmc match
    .lex "$/", match
    length rx1199_eos, rx1199_tgt
    set rx1199_off, 0
    lt rx1199_pos, 2, rx1199_start
    sub rx1199_off, rx1199_pos, 1
    substr rx1199_tgt, rx1199_tgt, rx1199_off
  rx1199_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1203_done
    goto rxscan1203_scan
  rxscan1203_loop:
    ($P10) = rx1199_cur."from"()
    inc $P10
    set rx1199_pos, $P10
    ge rx1199_pos, rx1199_eos, rxscan1203_done
  rxscan1203_scan:
    set_addr $I10, rxscan1203_loop
    rx1199_cur."!mark_push"(0, rx1199_pos, $I10)
  rxscan1203_done:
.annotate 'line', 517
  # rx subcapture "sym"
    set_addr $I10, rxcap_1204_fail
    rx1199_cur."!mark_push"(0, rx1199_pos, $I10)
  # rx literal  "||"
    add $I11, rx1199_pos, 2
    gt $I11, rx1199_eos, rx1199_fail
    sub $I11, rx1199_pos, rx1199_off
    substr $S10, rx1199_tgt, $I11, 2
    ne $S10, "||", rx1199_fail
    add rx1199_pos, 2
    set_addr $I10, rxcap_1204_fail
    ($I12, $I11) = rx1199_cur."!mark_peek"($I10)
    rx1199_cur."!cursor_pos"($I11)
    ($P10) = rx1199_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1199_pos, "")
    rx1199_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1204_done
  rxcap_1204_fail:
    goto rx1199_fail
  rxcap_1204_done:
  # rx subrule "O" subtype=capture negate=
    rx1199_cur."!cursor_pos"(rx1199_pos)
    $P10 = rx1199_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx1199_fail
    rx1199_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1199_pos = $P10."pos"()
  # rx pass
    rx1199_cur."!cursor_pass"(rx1199_pos, "infix:sym<||>")
    rx1199_cur."!cursor_debug"("PASS  ", "infix:sym<||>", " at pos=", rx1199_pos)
    .return (rx1199_cur)
  rx1199_fail:
.annotate 'line', 431
    (rx1199_rep, rx1199_pos, $I10, $P10) = rx1199_cur."!mark_fail"(0)
    lt rx1199_pos, -1, rx1199_done
    eq rx1199_pos, -1, rx1199_fail
    jump $I10
  rx1199_done:
    rx1199_cur."!cursor_fail"()
    rx1199_cur."!cursor_debug"("FAIL  ", "infix:sym<||>")
    .return (rx1199_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("306_1274564776.41408") :method
.annotate 'line', 431
    $P1201 = self."!PREFIX__!subrule"("O", "||")
    new $P1202, "ResizablePMCArray"
    push $P1202, $P1201
    .return ($P1202)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("307_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1206_tgt
    .local int rx1206_pos
    .local int rx1206_off
    .local int rx1206_eos
    .local int rx1206_rep
    .local pmc rx1206_cur
    (rx1206_cur, rx1206_pos, rx1206_tgt) = self."!cursor_start"()
    rx1206_cur."!cursor_debug"("START ", "infix:sym<//>")
    .lex unicode:"$\x{a2}", rx1206_cur
    .local pmc match
    .lex "$/", match
    length rx1206_eos, rx1206_tgt
    set rx1206_off, 0
    lt rx1206_pos, 2, rx1206_start
    sub rx1206_off, rx1206_pos, 1
    substr rx1206_tgt, rx1206_tgt, rx1206_off
  rx1206_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1210_done
    goto rxscan1210_scan
  rxscan1210_loop:
    ($P10) = rx1206_cur."from"()
    inc $P10
    set rx1206_pos, $P10
    ge rx1206_pos, rx1206_eos, rxscan1210_done
  rxscan1210_scan:
    set_addr $I10, rxscan1210_loop
    rx1206_cur."!mark_push"(0, rx1206_pos, $I10)
  rxscan1210_done:
.annotate 'line', 518
  # rx subcapture "sym"
    set_addr $I10, rxcap_1211_fail
    rx1206_cur."!mark_push"(0, rx1206_pos, $I10)
  # rx literal  "//"
    add $I11, rx1206_pos, 2
    gt $I11, rx1206_eos, rx1206_fail
    sub $I11, rx1206_pos, rx1206_off
    substr $S10, rx1206_tgt, $I11, 2
    ne $S10, "//", rx1206_fail
    add rx1206_pos, 2
    set_addr $I10, rxcap_1211_fail
    ($I12, $I11) = rx1206_cur."!mark_peek"($I10)
    rx1206_cur."!cursor_pos"($I11)
    ($P10) = rx1206_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1206_pos, "")
    rx1206_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1211_done
  rxcap_1211_fail:
    goto rx1206_fail
  rxcap_1211_done:
  # rx subrule "O" subtype=capture negate=
    rx1206_cur."!cursor_pos"(rx1206_pos)
    $P10 = rx1206_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx1206_fail
    rx1206_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1206_pos = $P10."pos"()
  # rx pass
    rx1206_cur."!cursor_pass"(rx1206_pos, "infix:sym<//>")
    rx1206_cur."!cursor_debug"("PASS  ", "infix:sym<//>", " at pos=", rx1206_pos)
    .return (rx1206_cur)
  rx1206_fail:
.annotate 'line', 431
    (rx1206_rep, rx1206_pos, $I10, $P10) = rx1206_cur."!mark_fail"(0)
    lt rx1206_pos, -1, rx1206_done
    eq rx1206_pos, -1, rx1206_fail
    jump $I10
  rx1206_done:
    rx1206_cur."!cursor_fail"()
    rx1206_cur."!cursor_debug"("FAIL  ", "infix:sym<//>")
    .return (rx1206_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("308_1274564776.41408") :method
.annotate 'line', 431
    $P1208 = self."!PREFIX__!subrule"("O", "//")
    new $P1209, "ResizablePMCArray"
    push $P1209, $P1208
    .return ($P1209)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("309_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1213_tgt
    .local int rx1213_pos
    .local int rx1213_off
    .local int rx1213_eos
    .local int rx1213_rep
    .local pmc rx1213_cur
    (rx1213_cur, rx1213_pos, rx1213_tgt) = self."!cursor_start"()
    rx1213_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
    .lex unicode:"$\x{a2}", rx1213_cur
    .local pmc match
    .lex "$/", match
    length rx1213_eos, rx1213_tgt
    set rx1213_off, 0
    lt rx1213_pos, 2, rx1213_start
    sub rx1213_off, rx1213_pos, 1
    substr rx1213_tgt, rx1213_tgt, rx1213_off
  rx1213_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1217_done
    goto rxscan1217_scan
  rxscan1217_loop:
    ($P10) = rx1213_cur."from"()
    inc $P10
    set rx1213_pos, $P10
    ge rx1213_pos, rx1213_eos, rxscan1217_done
  rxscan1217_scan:
    set_addr $I10, rxscan1217_loop
    rx1213_cur."!mark_push"(0, rx1213_pos, $I10)
  rxscan1217_done:
.annotate 'line', 521
  # rx literal  "??"
    add $I11, rx1213_pos, 2
    gt $I11, rx1213_eos, rx1213_fail
    sub $I11, rx1213_pos, rx1213_off
    substr $S10, rx1213_tgt, $I11, 2
    ne $S10, "??", rx1213_fail
    add rx1213_pos, 2
.annotate 'line', 522
  # rx subrule "ws" subtype=method negate=
    rx1213_cur."!cursor_pos"(rx1213_pos)
    $P10 = rx1213_cur."ws"()
    unless $P10, rx1213_fail
    rx1213_pos = $P10."pos"()
.annotate 'line', 523
  # rx subrule "EXPR" subtype=capture negate=
    rx1213_cur."!cursor_pos"(rx1213_pos)
    $P10 = rx1213_cur."EXPR"("i=")
    unless $P10, rx1213_fail
    rx1213_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1213_pos = $P10."pos"()
.annotate 'line', 524
  # rx literal  "!!"
    add $I11, rx1213_pos, 2
    gt $I11, rx1213_eos, rx1213_fail
    sub $I11, rx1213_pos, rx1213_off
    substr $S10, rx1213_tgt, $I11, 2
    ne $S10, "!!", rx1213_fail
    add rx1213_pos, 2
.annotate 'line', 525
  # rx subrule "O" subtype=capture negate=
    rx1213_cur."!cursor_pos"(rx1213_pos)
    $P10 = rx1213_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx1213_fail
    rx1213_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1213_pos = $P10."pos"()
.annotate 'line', 520
  # rx pass
    rx1213_cur."!cursor_pass"(rx1213_pos, "infix:sym<?? !!>")
    rx1213_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx1213_pos)
    .return (rx1213_cur)
  rx1213_fail:
.annotate 'line', 431
    (rx1213_rep, rx1213_pos, $I10, $P10) = rx1213_cur."!mark_fail"(0)
    lt rx1213_pos, -1, rx1213_done
    eq rx1213_pos, -1, rx1213_fail
    jump $I10
  rx1213_done:
    rx1213_cur."!cursor_fail"()
    rx1213_cur."!cursor_debug"("FAIL  ", "infix:sym<?? !!>")
    .return (rx1213_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("310_1274564776.41408") :method
.annotate 'line', 431
    $P1215 = self."!PREFIX__!subrule"("", "??")
    new $P1216, "ResizablePMCArray"
    push $P1216, $P1215
    .return ($P1216)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("311_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1219_tgt
    .local int rx1219_pos
    .local int rx1219_off
    .local int rx1219_eos
    .local int rx1219_rep
    .local pmc rx1219_cur
    (rx1219_cur, rx1219_pos, rx1219_tgt) = self."!cursor_start"()
    rx1219_cur."!cursor_debug"("START ", "infix:sym<=>")
    .lex unicode:"$\x{a2}", rx1219_cur
    .local pmc match
    .lex "$/", match
    length rx1219_eos, rx1219_tgt
    set rx1219_off, 0
    lt rx1219_pos, 2, rx1219_start
    sub rx1219_off, rx1219_pos, 1
    substr rx1219_tgt, rx1219_tgt, rx1219_off
  rx1219_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1223_done
    goto rxscan1223_scan
  rxscan1223_loop:
    ($P10) = rx1219_cur."from"()
    inc $P10
    set rx1219_pos, $P10
    ge rx1219_pos, rx1219_eos, rxscan1223_done
  rxscan1223_scan:
    set_addr $I10, rxscan1223_loop
    rx1219_cur."!mark_push"(0, rx1219_pos, $I10)
  rxscan1223_done:
.annotate 'line', 529
  # rx subcapture "sym"
    set_addr $I10, rxcap_1224_fail
    rx1219_cur."!mark_push"(0, rx1219_pos, $I10)
  # rx literal  "="
    add $I11, rx1219_pos, 1
    gt $I11, rx1219_eos, rx1219_fail
    sub $I11, rx1219_pos, rx1219_off
    substr $S10, rx1219_tgt, $I11, 1
    ne $S10, "=", rx1219_fail
    add rx1219_pos, 1
    set_addr $I10, rxcap_1224_fail
    ($I12, $I11) = rx1219_cur."!mark_peek"($I10)
    rx1219_cur."!cursor_pos"($I11)
    ($P10) = rx1219_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1219_pos, "")
    rx1219_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1224_done
  rxcap_1224_fail:
    goto rx1219_fail
  rxcap_1224_done:
  # rx subrule "panic" subtype=method negate=
    rx1219_cur."!cursor_pos"(rx1219_pos)
    $P10 = rx1219_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx1219_fail
    rx1219_pos = $P10."pos"()
.annotate 'line', 528
  # rx pass
    rx1219_cur."!cursor_pass"(rx1219_pos, "infix:sym<=>")
    rx1219_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx1219_pos)
    .return (rx1219_cur)
  rx1219_fail:
.annotate 'line', 431
    (rx1219_rep, rx1219_pos, $I10, $P10) = rx1219_cur."!mark_fail"(0)
    lt rx1219_pos, -1, rx1219_done
    eq rx1219_pos, -1, rx1219_fail
    jump $I10
  rx1219_done:
    rx1219_cur."!cursor_fail"()
    rx1219_cur."!cursor_debug"("FAIL  ", "infix:sym<=>")
    .return (rx1219_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("312_1274564776.41408") :method
.annotate 'line', 431
    $P1221 = self."!PREFIX__!subrule"("", "=")
    new $P1222, "ResizablePMCArray"
    push $P1222, $P1221
    .return ($P1222)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("313_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1226_tgt
    .local int rx1226_pos
    .local int rx1226_off
    .local int rx1226_eos
    .local int rx1226_rep
    .local pmc rx1226_cur
    (rx1226_cur, rx1226_pos, rx1226_tgt) = self."!cursor_start"()
    rx1226_cur."!cursor_debug"("START ", "infix:sym<:=>")
    .lex unicode:"$\x{a2}", rx1226_cur
    .local pmc match
    .lex "$/", match
    length rx1226_eos, rx1226_tgt
    set rx1226_off, 0
    lt rx1226_pos, 2, rx1226_start
    sub rx1226_off, rx1226_pos, 1
    substr rx1226_tgt, rx1226_tgt, rx1226_off
  rx1226_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1230_done
    goto rxscan1230_scan
  rxscan1230_loop:
    ($P10) = rx1226_cur."from"()
    inc $P10
    set rx1226_pos, $P10
    ge rx1226_pos, rx1226_eos, rxscan1230_done
  rxscan1230_scan:
    set_addr $I10, rxscan1230_loop
    rx1226_cur."!mark_push"(0, rx1226_pos, $I10)
  rxscan1230_done:
.annotate 'line', 531
  # rx subcapture "sym"
    set_addr $I10, rxcap_1231_fail
    rx1226_cur."!mark_push"(0, rx1226_pos, $I10)
  # rx literal  ":="
    add $I11, rx1226_pos, 2
    gt $I11, rx1226_eos, rx1226_fail
    sub $I11, rx1226_pos, rx1226_off
    substr $S10, rx1226_tgt, $I11, 2
    ne $S10, ":=", rx1226_fail
    add rx1226_pos, 2
    set_addr $I10, rxcap_1231_fail
    ($I12, $I11) = rx1226_cur."!mark_peek"($I10)
    rx1226_cur."!cursor_pos"($I11)
    ($P10) = rx1226_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1226_pos, "")
    rx1226_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1231_done
  rxcap_1231_fail:
    goto rx1226_fail
  rxcap_1231_done:
  # rx subrule "O" subtype=capture negate=
    rx1226_cur."!cursor_pos"(rx1226_pos)
    $P10 = rx1226_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1226_fail
    rx1226_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1226_pos = $P10."pos"()
  # rx pass
    rx1226_cur."!cursor_pass"(rx1226_pos, "infix:sym<:=>")
    rx1226_cur."!cursor_debug"("PASS  ", "infix:sym<:=>", " at pos=", rx1226_pos)
    .return (rx1226_cur)
  rx1226_fail:
.annotate 'line', 431
    (rx1226_rep, rx1226_pos, $I10, $P10) = rx1226_cur."!mark_fail"(0)
    lt rx1226_pos, -1, rx1226_done
    eq rx1226_pos, -1, rx1226_fail
    jump $I10
  rx1226_done:
    rx1226_cur."!cursor_fail"()
    rx1226_cur."!cursor_debug"("FAIL  ", "infix:sym<:=>")
    .return (rx1226_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("314_1274564776.41408") :method
.annotate 'line', 431
    $P1228 = self."!PREFIX__!subrule"("O", ":=")
    new $P1229, "ResizablePMCArray"
    push $P1229, $P1228
    .return ($P1229)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("315_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1233_tgt
    .local int rx1233_pos
    .local int rx1233_off
    .local int rx1233_eos
    .local int rx1233_rep
    .local pmc rx1233_cur
    (rx1233_cur, rx1233_pos, rx1233_tgt) = self."!cursor_start"()
    rx1233_cur."!cursor_debug"("START ", "infix:sym<::=>")
    .lex unicode:"$\x{a2}", rx1233_cur
    .local pmc match
    .lex "$/", match
    length rx1233_eos, rx1233_tgt
    set rx1233_off, 0
    lt rx1233_pos, 2, rx1233_start
    sub rx1233_off, rx1233_pos, 1
    substr rx1233_tgt, rx1233_tgt, rx1233_off
  rx1233_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1237_done
    goto rxscan1237_scan
  rxscan1237_loop:
    ($P10) = rx1233_cur."from"()
    inc $P10
    set rx1233_pos, $P10
    ge rx1233_pos, rx1233_eos, rxscan1237_done
  rxscan1237_scan:
    set_addr $I10, rxscan1237_loop
    rx1233_cur."!mark_push"(0, rx1233_pos, $I10)
  rxscan1237_done:
.annotate 'line', 532
  # rx subcapture "sym"
    set_addr $I10, rxcap_1238_fail
    rx1233_cur."!mark_push"(0, rx1233_pos, $I10)
  # rx literal  "::="
    add $I11, rx1233_pos, 3
    gt $I11, rx1233_eos, rx1233_fail
    sub $I11, rx1233_pos, rx1233_off
    substr $S10, rx1233_tgt, $I11, 3
    ne $S10, "::=", rx1233_fail
    add rx1233_pos, 3
    set_addr $I10, rxcap_1238_fail
    ($I12, $I11) = rx1233_cur."!mark_peek"($I10)
    rx1233_cur."!cursor_pos"($I11)
    ($P10) = rx1233_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1233_pos, "")
    rx1233_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1238_done
  rxcap_1238_fail:
    goto rx1233_fail
  rxcap_1238_done:
  # rx subrule "O" subtype=capture negate=
    rx1233_cur."!cursor_pos"(rx1233_pos)
    $P10 = rx1233_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1233_fail
    rx1233_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1233_pos = $P10."pos"()
  # rx pass
    rx1233_cur."!cursor_pass"(rx1233_pos, "infix:sym<::=>")
    rx1233_cur."!cursor_debug"("PASS  ", "infix:sym<::=>", " at pos=", rx1233_pos)
    .return (rx1233_cur)
  rx1233_fail:
.annotate 'line', 431
    (rx1233_rep, rx1233_pos, $I10, $P10) = rx1233_cur."!mark_fail"(0)
    lt rx1233_pos, -1, rx1233_done
    eq rx1233_pos, -1, rx1233_fail
    jump $I10
  rx1233_done:
    rx1233_cur."!cursor_fail"()
    rx1233_cur."!cursor_debug"("FAIL  ", "infix:sym<::=>")
    .return (rx1233_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("316_1274564776.41408") :method
.annotate 'line', 431
    $P1235 = self."!PREFIX__!subrule"("O", "::=")
    new $P1236, "ResizablePMCArray"
    push $P1236, $P1235
    .return ($P1236)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("317_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1240_tgt
    .local int rx1240_pos
    .local int rx1240_off
    .local int rx1240_eos
    .local int rx1240_rep
    .local pmc rx1240_cur
    (rx1240_cur, rx1240_pos, rx1240_tgt) = self."!cursor_start"()
    rx1240_cur."!cursor_debug"("START ", "infix:sym<,>")
    .lex unicode:"$\x{a2}", rx1240_cur
    .local pmc match
    .lex "$/", match
    length rx1240_eos, rx1240_tgt
    set rx1240_off, 0
    lt rx1240_pos, 2, rx1240_start
    sub rx1240_off, rx1240_pos, 1
    substr rx1240_tgt, rx1240_tgt, rx1240_off
  rx1240_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1244_done
    goto rxscan1244_scan
  rxscan1244_loop:
    ($P10) = rx1240_cur."from"()
    inc $P10
    set rx1240_pos, $P10
    ge rx1240_pos, rx1240_eos, rxscan1244_done
  rxscan1244_scan:
    set_addr $I10, rxscan1244_loop
    rx1240_cur."!mark_push"(0, rx1240_pos, $I10)
  rxscan1244_done:
.annotate 'line', 534
  # rx subcapture "sym"
    set_addr $I10, rxcap_1245_fail
    rx1240_cur."!mark_push"(0, rx1240_pos, $I10)
  # rx literal  ","
    add $I11, rx1240_pos, 1
    gt $I11, rx1240_eos, rx1240_fail
    sub $I11, rx1240_pos, rx1240_off
    substr $S10, rx1240_tgt, $I11, 1
    ne $S10, ",", rx1240_fail
    add rx1240_pos, 1
    set_addr $I10, rxcap_1245_fail
    ($I12, $I11) = rx1240_cur."!mark_peek"($I10)
    rx1240_cur."!cursor_pos"($I11)
    ($P10) = rx1240_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1240_pos, "")
    rx1240_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1245_done
  rxcap_1245_fail:
    goto rx1240_fail
  rxcap_1245_done:
  # rx subrule "O" subtype=capture negate=
    rx1240_cur."!cursor_pos"(rx1240_pos)
    $P10 = rx1240_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1240_fail
    rx1240_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1240_pos = $P10."pos"()
  # rx pass
    rx1240_cur."!cursor_pass"(rx1240_pos, "infix:sym<,>")
    rx1240_cur."!cursor_debug"("PASS  ", "infix:sym<,>", " at pos=", rx1240_pos)
    .return (rx1240_cur)
  rx1240_fail:
.annotate 'line', 431
    (rx1240_rep, rx1240_pos, $I10, $P10) = rx1240_cur."!mark_fail"(0)
    lt rx1240_pos, -1, rx1240_done
    eq rx1240_pos, -1, rx1240_fail
    jump $I10
  rx1240_done:
    rx1240_cur."!cursor_fail"()
    rx1240_cur."!cursor_debug"("FAIL  ", "infix:sym<,>")
    .return (rx1240_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("318_1274564776.41408") :method
.annotate 'line', 431
    $P1242 = self."!PREFIX__!subrule"("O", ",")
    new $P1243, "ResizablePMCArray"
    push $P1243, $P1242
    .return ($P1243)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("319_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1247_tgt
    .local int rx1247_pos
    .local int rx1247_off
    .local int rx1247_eos
    .local int rx1247_rep
    .local pmc rx1247_cur
    (rx1247_cur, rx1247_pos, rx1247_tgt) = self."!cursor_start"()
    rx1247_cur."!cursor_debug"("START ", "prefix:sym<return>")
    .lex unicode:"$\x{a2}", rx1247_cur
    .local pmc match
    .lex "$/", match
    length rx1247_eos, rx1247_tgt
    set rx1247_off, 0
    lt rx1247_pos, 2, rx1247_start
    sub rx1247_off, rx1247_pos, 1
    substr rx1247_tgt, rx1247_tgt, rx1247_off
  rx1247_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1250_done
    goto rxscan1250_scan
  rxscan1250_loop:
    ($P10) = rx1247_cur."from"()
    inc $P10
    set rx1247_pos, $P10
    ge rx1247_pos, rx1247_eos, rxscan1250_done
  rxscan1250_scan:
    set_addr $I10, rxscan1250_loop
    rx1247_cur."!mark_push"(0, rx1247_pos, $I10)
  rxscan1250_done:
.annotate 'line', 536
  # rx subcapture "sym"
    set_addr $I10, rxcap_1251_fail
    rx1247_cur."!mark_push"(0, rx1247_pos, $I10)
  # rx literal  "return"
    add $I11, rx1247_pos, 6
    gt $I11, rx1247_eos, rx1247_fail
    sub $I11, rx1247_pos, rx1247_off
    substr $S10, rx1247_tgt, $I11, 6
    ne $S10, "return", rx1247_fail
    add rx1247_pos, 6
    set_addr $I10, rxcap_1251_fail
    ($I12, $I11) = rx1247_cur."!mark_peek"($I10)
    rx1247_cur."!cursor_pos"($I11)
    ($P10) = rx1247_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1247_pos, "")
    rx1247_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1251_done
  rxcap_1251_fail:
    goto rx1247_fail
  rxcap_1251_done:
  # rx charclass s
    ge rx1247_pos, rx1247_eos, rx1247_fail
    sub $I10, rx1247_pos, rx1247_off
    is_cclass $I11, 32, rx1247_tgt, $I10
    unless $I11, rx1247_fail
    inc rx1247_pos
  # rx subrule "O" subtype=capture negate=
    rx1247_cur."!cursor_pos"(rx1247_pos)
    $P10 = rx1247_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1247_fail
    rx1247_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1247_pos = $P10."pos"()
  # rx pass
    rx1247_cur."!cursor_pass"(rx1247_pos, "prefix:sym<return>")
    rx1247_cur."!cursor_debug"("PASS  ", "prefix:sym<return>", " at pos=", rx1247_pos)
    .return (rx1247_cur)
  rx1247_fail:
.annotate 'line', 431
    (rx1247_rep, rx1247_pos, $I10, $P10) = rx1247_cur."!mark_fail"(0)
    lt rx1247_pos, -1, rx1247_done
    eq rx1247_pos, -1, rx1247_fail
    jump $I10
  rx1247_done:
    rx1247_cur."!cursor_fail"()
    rx1247_cur."!cursor_debug"("FAIL  ", "prefix:sym<return>")
    .return (rx1247_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("320_1274564776.41408") :method
.annotate 'line', 431
    new $P1249, "ResizablePMCArray"
    push $P1249, "return"
    .return ($P1249)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("321_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1253_tgt
    .local int rx1253_pos
    .local int rx1253_off
    .local int rx1253_eos
    .local int rx1253_rep
    .local pmc rx1253_cur
    (rx1253_cur, rx1253_pos, rx1253_tgt) = self."!cursor_start"()
    rx1253_cur."!cursor_debug"("START ", "prefix:sym<make>")
    .lex unicode:"$\x{a2}", rx1253_cur
    .local pmc match
    .lex "$/", match
    length rx1253_eos, rx1253_tgt
    set rx1253_off, 0
    lt rx1253_pos, 2, rx1253_start
    sub rx1253_off, rx1253_pos, 1
    substr rx1253_tgt, rx1253_tgt, rx1253_off
  rx1253_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1256_done
    goto rxscan1256_scan
  rxscan1256_loop:
    ($P10) = rx1253_cur."from"()
    inc $P10
    set rx1253_pos, $P10
    ge rx1253_pos, rx1253_eos, rxscan1256_done
  rxscan1256_scan:
    set_addr $I10, rxscan1256_loop
    rx1253_cur."!mark_push"(0, rx1253_pos, $I10)
  rxscan1256_done:
.annotate 'line', 537
  # rx subcapture "sym"
    set_addr $I10, rxcap_1257_fail
    rx1253_cur."!mark_push"(0, rx1253_pos, $I10)
  # rx literal  "make"
    add $I11, rx1253_pos, 4
    gt $I11, rx1253_eos, rx1253_fail
    sub $I11, rx1253_pos, rx1253_off
    substr $S10, rx1253_tgt, $I11, 4
    ne $S10, "make", rx1253_fail
    add rx1253_pos, 4
    set_addr $I10, rxcap_1257_fail
    ($I12, $I11) = rx1253_cur."!mark_peek"($I10)
    rx1253_cur."!cursor_pos"($I11)
    ($P10) = rx1253_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1253_pos, "")
    rx1253_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1257_done
  rxcap_1257_fail:
    goto rx1253_fail
  rxcap_1257_done:
  # rx charclass s
    ge rx1253_pos, rx1253_eos, rx1253_fail
    sub $I10, rx1253_pos, rx1253_off
    is_cclass $I11, 32, rx1253_tgt, $I10
    unless $I11, rx1253_fail
    inc rx1253_pos
  # rx subrule "O" subtype=capture negate=
    rx1253_cur."!cursor_pos"(rx1253_pos)
    $P10 = rx1253_cur."O"("%list_prefix")
    unless $P10, rx1253_fail
    rx1253_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1253_pos = $P10."pos"()
  # rx pass
    rx1253_cur."!cursor_pass"(rx1253_pos, "prefix:sym<make>")
    rx1253_cur."!cursor_debug"("PASS  ", "prefix:sym<make>", " at pos=", rx1253_pos)
    .return (rx1253_cur)
  rx1253_fail:
.annotate 'line', 431
    (rx1253_rep, rx1253_pos, $I10, $P10) = rx1253_cur."!mark_fail"(0)
    lt rx1253_pos, -1, rx1253_done
    eq rx1253_pos, -1, rx1253_fail
    jump $I10
  rx1253_done:
    rx1253_cur."!cursor_fail"()
    rx1253_cur."!cursor_debug"("FAIL  ", "prefix:sym<make>")
    .return (rx1253_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("322_1274564776.41408") :method
.annotate 'line', 431
    new $P1255, "ResizablePMCArray"
    push $P1255, "make"
    .return ($P1255)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<last>"  :subid("323_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1259_tgt
    .local int rx1259_pos
    .local int rx1259_off
    .local int rx1259_eos
    .local int rx1259_rep
    .local pmc rx1259_cur
    (rx1259_cur, rx1259_pos, rx1259_tgt) = self."!cursor_start"()
    rx1259_cur."!cursor_debug"("START ", "term:sym<last>")
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
.annotate 'line', 538
  # rx subcapture "sym"
    set_addr $I10, rxcap_1263_fail
    rx1259_cur."!mark_push"(0, rx1259_pos, $I10)
  # rx literal  "last"
    add $I11, rx1259_pos, 4
    gt $I11, rx1259_eos, rx1259_fail
    sub $I11, rx1259_pos, rx1259_off
    substr $S10, rx1259_tgt, $I11, 4
    ne $S10, "last", rx1259_fail
    add rx1259_pos, 4
    set_addr $I10, rxcap_1263_fail
    ($I12, $I11) = rx1259_cur."!mark_peek"($I10)
    rx1259_cur."!cursor_pos"($I11)
    ($P10) = rx1259_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1259_pos, "")
    rx1259_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1263_done
  rxcap_1263_fail:
    goto rx1259_fail
  rxcap_1263_done:
  # rx pass
    rx1259_cur."!cursor_pass"(rx1259_pos, "term:sym<last>")
    rx1259_cur."!cursor_debug"("PASS  ", "term:sym<last>", " at pos=", rx1259_pos)
    .return (rx1259_cur)
  rx1259_fail:
.annotate 'line', 431
    (rx1259_rep, rx1259_pos, $I10, $P10) = rx1259_cur."!mark_fail"(0)
    lt rx1259_pos, -1, rx1259_done
    eq rx1259_pos, -1, rx1259_fail
    jump $I10
  rx1259_done:
    rx1259_cur."!cursor_fail"()
    rx1259_cur."!cursor_debug"("FAIL  ", "term:sym<last>")
    .return (rx1259_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<last>"  :subid("324_1274564776.41408") :method
.annotate 'line', 431
    new $P1261, "ResizablePMCArray"
    push $P1261, "last"
    .return ($P1261)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<next>"  :subid("325_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1265_tgt
    .local int rx1265_pos
    .local int rx1265_off
    .local int rx1265_eos
    .local int rx1265_rep
    .local pmc rx1265_cur
    (rx1265_cur, rx1265_pos, rx1265_tgt) = self."!cursor_start"()
    rx1265_cur."!cursor_debug"("START ", "term:sym<next>")
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
    ne $I10, -1, rxscan1268_done
    goto rxscan1268_scan
  rxscan1268_loop:
    ($P10) = rx1265_cur."from"()
    inc $P10
    set rx1265_pos, $P10
    ge rx1265_pos, rx1265_eos, rxscan1268_done
  rxscan1268_scan:
    set_addr $I10, rxscan1268_loop
    rx1265_cur."!mark_push"(0, rx1265_pos, $I10)
  rxscan1268_done:
.annotate 'line', 539
  # rx subcapture "sym"
    set_addr $I10, rxcap_1269_fail
    rx1265_cur."!mark_push"(0, rx1265_pos, $I10)
  # rx literal  "next"
    add $I11, rx1265_pos, 4
    gt $I11, rx1265_eos, rx1265_fail
    sub $I11, rx1265_pos, rx1265_off
    substr $S10, rx1265_tgt, $I11, 4
    ne $S10, "next", rx1265_fail
    add rx1265_pos, 4
    set_addr $I10, rxcap_1269_fail
    ($I12, $I11) = rx1265_cur."!mark_peek"($I10)
    rx1265_cur."!cursor_pos"($I11)
    ($P10) = rx1265_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1265_pos, "")
    rx1265_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1269_done
  rxcap_1269_fail:
    goto rx1265_fail
  rxcap_1269_done:
  # rx pass
    rx1265_cur."!cursor_pass"(rx1265_pos, "term:sym<next>")
    rx1265_cur."!cursor_debug"("PASS  ", "term:sym<next>", " at pos=", rx1265_pos)
    .return (rx1265_cur)
  rx1265_fail:
.annotate 'line', 431
    (rx1265_rep, rx1265_pos, $I10, $P10) = rx1265_cur."!mark_fail"(0)
    lt rx1265_pos, -1, rx1265_done
    eq rx1265_pos, -1, rx1265_fail
    jump $I10
  rx1265_done:
    rx1265_cur."!cursor_fail"()
    rx1265_cur."!cursor_debug"("FAIL  ", "term:sym<next>")
    .return (rx1265_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<next>"  :subid("326_1274564776.41408") :method
.annotate 'line', 431
    new $P1267, "ResizablePMCArray"
    push $P1267, "next"
    .return ($P1267)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<redo>"  :subid("327_1274564776.41408") :method :outer("11_1274564776.41408")
.annotate 'line', 431
    .local string rx1271_tgt
    .local int rx1271_pos
    .local int rx1271_off
    .local int rx1271_eos
    .local int rx1271_rep
    .local pmc rx1271_cur
    (rx1271_cur, rx1271_pos, rx1271_tgt) = self."!cursor_start"()
    rx1271_cur."!cursor_debug"("START ", "term:sym<redo>")
    .lex unicode:"$\x{a2}", rx1271_cur
    .local pmc match
    .lex "$/", match
    length rx1271_eos, rx1271_tgt
    set rx1271_off, 0
    lt rx1271_pos, 2, rx1271_start
    sub rx1271_off, rx1271_pos, 1
    substr rx1271_tgt, rx1271_tgt, rx1271_off
  rx1271_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1274_done
    goto rxscan1274_scan
  rxscan1274_loop:
    ($P10) = rx1271_cur."from"()
    inc $P10
    set rx1271_pos, $P10
    ge rx1271_pos, rx1271_eos, rxscan1274_done
  rxscan1274_scan:
    set_addr $I10, rxscan1274_loop
    rx1271_cur."!mark_push"(0, rx1271_pos, $I10)
  rxscan1274_done:
.annotate 'line', 540
  # rx subcapture "sym"
    set_addr $I10, rxcap_1275_fail
    rx1271_cur."!mark_push"(0, rx1271_pos, $I10)
  # rx literal  "redo"
    add $I11, rx1271_pos, 4
    gt $I11, rx1271_eos, rx1271_fail
    sub $I11, rx1271_pos, rx1271_off
    substr $S10, rx1271_tgt, $I11, 4
    ne $S10, "redo", rx1271_fail
    add rx1271_pos, 4
    set_addr $I10, rxcap_1275_fail
    ($I12, $I11) = rx1271_cur."!mark_peek"($I10)
    rx1271_cur."!cursor_pos"($I11)
    ($P10) = rx1271_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1271_pos, "")
    rx1271_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1275_done
  rxcap_1275_fail:
    goto rx1271_fail
  rxcap_1275_done:
  # rx pass
    rx1271_cur."!cursor_pass"(rx1271_pos, "term:sym<redo>")
    rx1271_cur."!cursor_debug"("PASS  ", "term:sym<redo>", " at pos=", rx1271_pos)
    .return (rx1271_cur)
  rx1271_fail:
.annotate 'line', 431
    (rx1271_rep, rx1271_pos, $I10, $P10) = rx1271_cur."!mark_fail"(0)
    lt rx1271_pos, -1, rx1271_done
    eq rx1271_pos, -1, rx1271_fail
    jump $I10
  rx1271_done:
    rx1271_cur."!cursor_fail"()
    rx1271_cur."!cursor_debug"("FAIL  ", "term:sym<redo>")
    .return (rx1271_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<redo>"  :subid("328_1274564776.41408") :method
.annotate 'line', 431
    new $P1273, "ResizablePMCArray"
    push $P1273, "redo"
    .return ($P1273)
.end


.namespace ["NQP";"Grammar"]
.sub "smartmatch"  :subid("329_1274564776.41408") :method :outer("11_1274564776.41408")
    .param pmc param_1279
.annotate 'line', 542
    new $P1278, 'ExceptionHandler'
    set_addr $P1278, control_1277
    $P1278."handle_types"(57)
    push_eh $P1278
    .lex "self", self
    .lex "$/", param_1279
.annotate 'line', 544
    new $P1280, "Undef"
    .lex "$t", $P1280
    find_lex $P1281, "$/"
    unless_null $P1281, vivify_368
    $P1281 = root_new ['parrot';'ResizablePMCArray']
  vivify_368:
    set $P1282, $P1281[0]
    unless_null $P1282, vivify_369
    new $P1282, "Undef"
  vivify_369:
    store_lex "$t", $P1282
    find_lex $P1283, "$/"
    unless_null $P1283, vivify_370
    $P1283 = root_new ['parrot';'ResizablePMCArray']
  vivify_370:
    set $P1284, $P1283[1]
    unless_null $P1284, vivify_371
    new $P1284, "Undef"
  vivify_371:
    find_lex $P1285, "$/"
    unless_null $P1285, vivify_372
    $P1285 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1285
  vivify_372:
    set $P1285[0], $P1284
    find_lex $P1286, "$t"
    find_lex $P1287, "$/"
    unless_null $P1287, vivify_373
    $P1287 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1287
  vivify_373:
    set $P1287[1], $P1286
.annotate 'line', 542
    .return ($P1286)
  control_1277:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1288, exception, "payload"
    .return ($P1288)
.end


.namespace ["NQP";"Regex"]
.sub "_block1289"  :subid("330_1274564776.41408") :outer("11_1274564776.41408")
.annotate 'line', 548
    .const 'Sub' $P1367 = "352_1274564776.41408" 
    capture_lex $P1367
    .const 'Sub' $P1354 = "349_1274564776.41408" 
    capture_lex $P1354
    .const 'Sub' $P1349 = "347_1274564776.41408" 
    capture_lex $P1349
    .const 'Sub' $P1344 = "345_1274564776.41408" 
    capture_lex $P1344
    .const 'Sub' $P1330 = "341_1274564776.41408" 
    capture_lex $P1330
    .const 'Sub' $P1310 = "337_1274564776.41408" 
    capture_lex $P1310
    .const 'Sub' $P1300 = "334_1274564776.41408" 
    capture_lex $P1300
    .const 'Sub' $P1291 = "331_1274564776.41408" 
    capture_lex $P1291
    .const 'Sub' $P1367 = "352_1274564776.41408" 
    capture_lex $P1367
    .return ($P1367)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("331_1274564776.41408") :method :outer("330_1274564776.41408")
.annotate 'line', 548
    .const 'Sub' $P1297 = "333_1274564776.41408" 
    capture_lex $P1297
    .local string rx1292_tgt
    .local int rx1292_pos
    .local int rx1292_off
    .local int rx1292_eos
    .local int rx1292_rep
    .local pmc rx1292_cur
    (rx1292_cur, rx1292_pos, rx1292_tgt) = self."!cursor_start"()
    rx1292_cur."!cursor_debug"("START ", "metachar:sym<:my>")
    .lex unicode:"$\x{a2}", rx1292_cur
    .local pmc match
    .lex "$/", match
    length rx1292_eos, rx1292_tgt
    set rx1292_off, 0
    lt rx1292_pos, 2, rx1292_start
    sub rx1292_off, rx1292_pos, 1
    substr rx1292_tgt, rx1292_tgt, rx1292_off
  rx1292_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1295_done
    goto rxscan1295_scan
  rxscan1295_loop:
    ($P10) = rx1292_cur."from"()
    inc $P10
    set rx1292_pos, $P10
    ge rx1292_pos, rx1292_eos, rxscan1295_done
  rxscan1295_scan:
    set_addr $I10, rxscan1295_loop
    rx1292_cur."!mark_push"(0, rx1292_pos, $I10)
  rxscan1295_done:
.annotate 'line', 550
  # rx literal  ":"
    add $I11, rx1292_pos, 1
    gt $I11, rx1292_eos, rx1292_fail
    sub $I11, rx1292_pos, rx1292_off
    substr $S10, rx1292_tgt, $I11, 1
    ne $S10, ":", rx1292_fail
    add rx1292_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1292_cur."!cursor_pos"(rx1292_pos)
    .const 'Sub' $P1297 = "333_1274564776.41408" 
    capture_lex $P1297
    $P10 = rx1292_cur."before"($P1297)
    unless $P10, rx1292_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1292_cur."!cursor_pos"(rx1292_pos)
    $P10 = rx1292_cur."LANG"("MAIN", "statement")
    unless $P10, rx1292_fail
    rx1292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1292_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1292_cur."!cursor_pos"(rx1292_pos)
    $P10 = rx1292_cur."ws"()
    unless $P10, rx1292_fail
    rx1292_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1292_pos, 1
    gt $I11, rx1292_eos, rx1292_fail
    sub $I11, rx1292_pos, rx1292_off
    substr $S10, rx1292_tgt, $I11, 1
    ne $S10, ";", rx1292_fail
    add rx1292_pos, 1
.annotate 'line', 549
  # rx pass
    rx1292_cur."!cursor_pass"(rx1292_pos, "metachar:sym<:my>")
    rx1292_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1292_pos)
    .return (rx1292_cur)
  rx1292_fail:
.annotate 'line', 548
    (rx1292_rep, rx1292_pos, $I10, $P10) = rx1292_cur."!mark_fail"(0)
    lt rx1292_pos, -1, rx1292_done
    eq rx1292_pos, -1, rx1292_fail
    jump $I10
  rx1292_done:
    rx1292_cur."!cursor_fail"()
    rx1292_cur."!cursor_debug"("FAIL  ", "metachar:sym<:my>")
    .return (rx1292_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("332_1274564776.41408") :method
.annotate 'line', 548
    new $P1294, "ResizablePMCArray"
    push $P1294, ":"
    .return ($P1294)
.end


.namespace ["NQP";"Regex"]
.sub "_block1296"  :anon :subid("333_1274564776.41408") :method :outer("331_1274564776.41408")
.annotate 'line', 550
    .local string rx1298_tgt
    .local int rx1298_pos
    .local int rx1298_off
    .local int rx1298_eos
    .local int rx1298_rep
    .local pmc rx1298_cur
    (rx1298_cur, rx1298_pos, rx1298_tgt) = self."!cursor_start"()
    rx1298_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1298_cur
    .local pmc match
    .lex "$/", match
    length rx1298_eos, rx1298_tgt
    set rx1298_off, 0
    lt rx1298_pos, 2, rx1298_start
    sub rx1298_off, rx1298_pos, 1
    substr rx1298_tgt, rx1298_tgt, rx1298_off
  rx1298_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1299_done
    goto rxscan1299_scan
  rxscan1299_loop:
    ($P10) = rx1298_cur."from"()
    inc $P10
    set rx1298_pos, $P10
    ge rx1298_pos, rx1298_eos, rxscan1299_done
  rxscan1299_scan:
    set_addr $I10, rxscan1299_loop
    rx1298_cur."!mark_push"(0, rx1298_pos, $I10)
  rxscan1299_done:
  # rx literal  "my"
    add $I11, rx1298_pos, 2
    gt $I11, rx1298_eos, rx1298_fail
    sub $I11, rx1298_pos, rx1298_off
    substr $S10, rx1298_tgt, $I11, 2
    ne $S10, "my", rx1298_fail
    add rx1298_pos, 2
  # rx pass
    rx1298_cur."!cursor_pass"(rx1298_pos, "")
    rx1298_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1298_pos)
    .return (rx1298_cur)
  rx1298_fail:
    (rx1298_rep, rx1298_pos, $I10, $P10) = rx1298_cur."!mark_fail"(0)
    lt rx1298_pos, -1, rx1298_done
    eq rx1298_pos, -1, rx1298_fail
    jump $I10
  rx1298_done:
    rx1298_cur."!cursor_fail"()
    rx1298_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1298_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<$>"  :subid("334_1274564776.41408") :method :outer("330_1274564776.41408")
.annotate 'line', 548
    .const 'Sub' $P1307 = "336_1274564776.41408" 
    capture_lex $P1307
    .local string rx1301_tgt
    .local int rx1301_pos
    .local int rx1301_off
    .local int rx1301_eos
    .local int rx1301_rep
    .local pmc rx1301_cur
    (rx1301_cur, rx1301_pos, rx1301_tgt) = self."!cursor_start"()
    rx1301_cur."!cursor_debug"("START ", "metachar:sym<$>")
    .lex unicode:"$\x{a2}", rx1301_cur
    .local pmc match
    .lex "$/", match
    length rx1301_eos, rx1301_tgt
    set rx1301_off, 0
    lt rx1301_pos, 2, rx1301_start
    sub rx1301_off, rx1301_pos, 1
    substr rx1301_tgt, rx1301_tgt, rx1301_off
  rx1301_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1304_done
    goto rxscan1304_scan
  rxscan1304_loop:
    ($P10) = rx1301_cur."from"()
    inc $P10
    set rx1301_pos, $P10
    ge rx1301_pos, rx1301_eos, rxscan1304_done
  rxscan1304_scan:
    set_addr $I10, rxscan1304_loop
    rx1301_cur."!mark_push"(0, rx1301_pos, $I10)
  rxscan1304_done:
.annotate 'line', 554
  # rx subcapture "sym"
    set_addr $I10, rxcap_1305_fail
    rx1301_cur."!mark_push"(0, rx1301_pos, $I10)
  # rx literal  "$"
    add $I11, rx1301_pos, 1
    gt $I11, rx1301_eos, rx1301_fail
    sub $I11, rx1301_pos, rx1301_off
    substr $S10, rx1301_tgt, $I11, 1
    ne $S10, "$", rx1301_fail
    add rx1301_pos, 1
    set_addr $I10, rxcap_1305_fail
    ($I12, $I11) = rx1301_cur."!mark_peek"($I10)
    rx1301_cur."!cursor_pos"($I11)
    ($P10) = rx1301_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1301_pos, "")
    rx1301_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1305_done
  rxcap_1305_fail:
    goto rx1301_fail
  rxcap_1305_done:
  # rx subrule "before" subtype=zerowidth negate=1
    rx1301_cur."!cursor_pos"(rx1301_pos)
    .const 'Sub' $P1307 = "336_1274564776.41408" 
    capture_lex $P1307
    $P10 = rx1301_cur."before"($P1307)
    if $P10, rx1301_fail
.annotate 'line', 553
  # rx pass
    rx1301_cur."!cursor_pass"(rx1301_pos, "metachar:sym<$>")
    rx1301_cur."!cursor_debug"("PASS  ", "metachar:sym<$>", " at pos=", rx1301_pos)
    .return (rx1301_cur)
  rx1301_fail:
.annotate 'line', 548
    (rx1301_rep, rx1301_pos, $I10, $P10) = rx1301_cur."!mark_fail"(0)
    lt rx1301_pos, -1, rx1301_done
    eq rx1301_pos, -1, rx1301_fail
    jump $I10
  rx1301_done:
    rx1301_cur."!cursor_fail"()
    rx1301_cur."!cursor_debug"("FAIL  ", "metachar:sym<$>")
    .return (rx1301_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<$>"  :subid("335_1274564776.41408") :method
.annotate 'line', 548
    new $P1303, "ResizablePMCArray"
    push $P1303, "$"
    .return ($P1303)
.end


.namespace ["NQP";"Regex"]
.sub "_block1306"  :anon :subid("336_1274564776.41408") :method :outer("334_1274564776.41408")
.annotate 'line', 554
    .local string rx1308_tgt
    .local int rx1308_pos
    .local int rx1308_off
    .local int rx1308_eos
    .local int rx1308_rep
    .local pmc rx1308_cur
    (rx1308_cur, rx1308_pos, rx1308_tgt) = self."!cursor_start"()
    rx1308_cur."!cursor_debug"("START ", "")
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
    ne $I10, -1, rxscan1309_done
    goto rxscan1309_scan
  rxscan1309_loop:
    ($P10) = rx1308_cur."from"()
    inc $P10
    set rx1308_pos, $P10
    ge rx1308_pos, rx1308_eos, rxscan1309_done
  rxscan1309_scan:
    set_addr $I10, rxscan1309_loop
    rx1308_cur."!mark_push"(0, rx1308_pos, $I10)
  rxscan1309_done:
  # rx charclass w
    ge rx1308_pos, rx1308_eos, rx1308_fail
    sub $I10, rx1308_pos, rx1308_off
    is_cclass $I11, 8192, rx1308_tgt, $I10
    unless $I11, rx1308_fail
    inc rx1308_pos
  # rx pass
    rx1308_cur."!cursor_pass"(rx1308_pos, "")
    rx1308_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1308_pos)
    .return (rx1308_cur)
  rx1308_fail:
    (rx1308_rep, rx1308_pos, $I10, $P10) = rx1308_cur."!mark_fail"(0)
    lt rx1308_pos, -1, rx1308_done
    eq rx1308_pos, -1, rx1308_fail
    jump $I10
  rx1308_done:
    rx1308_cur."!cursor_fail"()
    rx1308_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1308_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<var>"  :subid("337_1274564776.41408") :method :outer("330_1274564776.41408")
.annotate 'line', 548
    .const 'Sub' $P1325 = "340_1274564776.41408" 
    capture_lex $P1325
    .const 'Sub' $P1321 = "339_1274564776.41408" 
    capture_lex $P1321
    .local string rx1311_tgt
    .local int rx1311_pos
    .local int rx1311_off
    .local int rx1311_eos
    .local int rx1311_rep
    .local pmc rx1311_cur
    (rx1311_cur, rx1311_pos, rx1311_tgt) = self."!cursor_start"()
    rx1311_cur."!cursor_debug"("START ", "metachar:sym<var>")
    rx1311_cur."!cursor_caparray"("quantified_atom")
    .lex unicode:"$\x{a2}", rx1311_cur
    .local pmc match
    .lex "$/", match
    length rx1311_eos, rx1311_tgt
    set rx1311_off, 0
    lt rx1311_pos, 2, rx1311_start
    sub rx1311_off, rx1311_pos, 1
    substr rx1311_tgt, rx1311_tgt, rx1311_off
  rx1311_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1314_done
    goto rxscan1314_scan
  rxscan1314_loop:
    ($P10) = rx1311_cur."from"()
    inc $P10
    set rx1311_pos, $P10
    ge rx1311_pos, rx1311_eos, rxscan1314_done
  rxscan1314_scan:
    set_addr $I10, rxscan1314_loop
    rx1311_cur."!mark_push"(0, rx1311_pos, $I10)
  rxscan1314_done:
  alt1315_0:
.annotate 'line', 558
    set_addr $I10, alt1315_1
    rx1311_cur."!mark_push"(0, rx1311_pos, $I10)
.annotate 'line', 559
  # rx literal  "$<"
    add $I11, rx1311_pos, 2
    gt $I11, rx1311_eos, rx1311_fail
    sub $I11, rx1311_pos, rx1311_off
    substr $S10, rx1311_tgt, $I11, 2
    ne $S10, "$<", rx1311_fail
    add rx1311_pos, 2
  # rx subcapture "name"
    set_addr $I10, rxcap_1318_fail
    rx1311_cur."!mark_push"(0, rx1311_pos, $I10)
  # rx rxquantr1316 ** 1..*
    set_addr $I1317, rxquantr1316_done
    rx1311_cur."!mark_push"(0, -1, $I1317)
  rxquantr1316_loop:
  # rx enumcharlist negate=1 
    ge rx1311_pos, rx1311_eos, rx1311_fail
    sub $I10, rx1311_pos, rx1311_off
    substr $S10, rx1311_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx1311_fail
    inc rx1311_pos
    (rx1311_rep) = rx1311_cur."!mark_commit"($I1317)
    rx1311_cur."!mark_push"(rx1311_rep, rx1311_pos, $I1317)
    goto rxquantr1316_loop
  rxquantr1316_done:
    set_addr $I10, rxcap_1318_fail
    ($I12, $I11) = rx1311_cur."!mark_peek"($I10)
    rx1311_cur."!cursor_pos"($I11)
    ($P10) = rx1311_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1311_pos, "")
    rx1311_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_1318_done
  rxcap_1318_fail:
    goto rx1311_fail
  rxcap_1318_done:
  # rx literal  ">"
    add $I11, rx1311_pos, 1
    gt $I11, rx1311_eos, rx1311_fail
    sub $I11, rx1311_pos, rx1311_off
    substr $S10, rx1311_tgt, $I11, 1
    ne $S10, ">", rx1311_fail
    add rx1311_pos, 1
    goto alt1315_end
  alt1315_1:
    set_addr $I10, alt1315_2
    rx1311_cur."!mark_push"(0, rx1311_pos, $I10)
.annotate 'line', 560
  # rx literal  "$"
    add $I11, rx1311_pos, 1
    gt $I11, rx1311_eos, rx1311_fail
    sub $I11, rx1311_pos, rx1311_off
    substr $S10, rx1311_tgt, $I11, 1
    ne $S10, "$", rx1311_fail
    add rx1311_pos, 1
  # rx subcapture "pos"
    set_addr $I10, rxcap_1319_fail
    rx1311_cur."!mark_push"(0, rx1311_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx1311_pos, rx1311_off
    find_not_cclass $I11, 8, rx1311_tgt, $I10, rx1311_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1311_fail
    add rx1311_pos, rx1311_off, $I11
    set_addr $I10, rxcap_1319_fail
    ($I12, $I11) = rx1311_cur."!mark_peek"($I10)
    rx1311_cur."!cursor_pos"($I11)
    ($P10) = rx1311_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1311_pos, "")
    rx1311_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pos")
    goto rxcap_1319_done
  rxcap_1319_fail:
    goto rx1311_fail
  rxcap_1319_done:
    goto alt1315_end
  alt1315_2:
    set_addr $I10, alt1315_3
    rx1311_cur."!mark_push"(0, rx1311_pos, $I10)
.annotate 'line', 561
  # rx subrule "before" subtype=zerowidth negate=
    rx1311_cur."!cursor_pos"(rx1311_pos)
    .const 'Sub' $P1321 = "339_1274564776.41408" 
    capture_lex $P1321
    $P10 = rx1311_cur."before"($P1321)
    unless $P10, rx1311_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1311_cur."!cursor_pos"(rx1311_pos)
    $P10 = rx1311_cur."LANG"("MAIN", "variable")
    unless $P10, rx1311_fail
    rx1311_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("var")
    rx1311_pos = $P10."pos"()
    goto alt1315_end
  alt1315_3:
.annotate 'line', 562
  # rx subrule "before" subtype=zerowidth negate=
    rx1311_cur."!cursor_pos"(rx1311_pos)
    .const 'Sub' $P1325 = "340_1274564776.41408" 
    capture_lex $P1325
    $P10 = rx1311_cur."before"($P1325)
    unless $P10, rx1311_fail
  # rx subrule "panic" subtype=method negate=
    rx1311_cur."!cursor_pos"(rx1311_pos)
    $P10 = rx1311_cur."panic"("Use of hash variable in patterns is reserved")
    unless $P10, rx1311_fail
    rx1311_pos = $P10."pos"()
  alt1315_end:
.annotate 'line', 565
  # rx rxquantr1328 ** 0..1
    set_addr $I1329, rxquantr1328_done
    rx1311_cur."!mark_push"(0, rx1311_pos, $I1329)
  rxquantr1328_loop:
  # rx subrule "ws" subtype=method negate=
    rx1311_cur."!cursor_pos"(rx1311_pos)
    $P10 = rx1311_cur."ws"()
    unless $P10, rx1311_fail
    rx1311_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx1311_pos, 1
    gt $I11, rx1311_eos, rx1311_fail
    sub $I11, rx1311_pos, rx1311_off
    substr $S10, rx1311_tgt, $I11, 1
    ne $S10, "=", rx1311_fail
    add rx1311_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1311_cur."!cursor_pos"(rx1311_pos)
    $P10 = rx1311_cur."ws"()
    unless $P10, rx1311_fail
    rx1311_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx1311_cur."!cursor_pos"(rx1311_pos)
    $P10 = rx1311_cur."quantified_atom"()
    unless $P10, rx1311_fail
    rx1311_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx1311_pos = $P10."pos"()
    (rx1311_rep) = rx1311_cur."!mark_commit"($I1329)
  rxquantr1328_done:
.annotate 'line', 557
  # rx pass
    rx1311_cur."!cursor_pass"(rx1311_pos, "metachar:sym<var>")
    rx1311_cur."!cursor_debug"("PASS  ", "metachar:sym<var>", " at pos=", rx1311_pos)
    .return (rx1311_cur)
  rx1311_fail:
.annotate 'line', 548
    (rx1311_rep, rx1311_pos, $I10, $P10) = rx1311_cur."!mark_fail"(0)
    lt rx1311_pos, -1, rx1311_done
    eq rx1311_pos, -1, rx1311_fail
    jump $I10
  rx1311_done:
    rx1311_cur."!cursor_fail"()
    rx1311_cur."!cursor_debug"("FAIL  ", "metachar:sym<var>")
    .return (rx1311_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<var>"  :subid("338_1274564776.41408") :method
.annotate 'line', 548
    new $P1313, "ResizablePMCArray"
    push $P1313, ""
    push $P1313, ""
    push $P1313, "$"
    push $P1313, "$<"
    .return ($P1313)
.end


.namespace ["NQP";"Regex"]
.sub "_block1320"  :anon :subid("339_1274564776.41408") :method :outer("337_1274564776.41408")
.annotate 'line', 561
    .local string rx1322_tgt
    .local int rx1322_pos
    .local int rx1322_off
    .local int rx1322_eos
    .local int rx1322_rep
    .local pmc rx1322_cur
    (rx1322_cur, rx1322_pos, rx1322_tgt) = self."!cursor_start"()
    rx1322_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1322_cur
    .local pmc match
    .lex "$/", match
    length rx1322_eos, rx1322_tgt
    set rx1322_off, 0
    lt rx1322_pos, 2, rx1322_start
    sub rx1322_off, rx1322_pos, 1
    substr rx1322_tgt, rx1322_tgt, rx1322_off
  rx1322_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1323_done
    goto rxscan1323_scan
  rxscan1323_loop:
    ($P10) = rx1322_cur."from"()
    inc $P10
    set rx1322_pos, $P10
    ge rx1322_pos, rx1322_eos, rxscan1323_done
  rxscan1323_scan:
    set_addr $I10, rxscan1323_loop
    rx1322_cur."!mark_push"(0, rx1322_pos, $I10)
  rxscan1323_done:
  # rx enumcharlist negate=0 
    ge rx1322_pos, rx1322_eos, rx1322_fail
    sub $I10, rx1322_pos, rx1322_off
    substr $S10, rx1322_tgt, $I10, 1
    index $I11, "$@", $S10
    lt $I11, 0, rx1322_fail
    inc rx1322_pos
  # rx charclass w
    ge rx1322_pos, rx1322_eos, rx1322_fail
    sub $I10, rx1322_pos, rx1322_off
    is_cclass $I11, 8192, rx1322_tgt, $I10
    unless $I11, rx1322_fail
    inc rx1322_pos
  # rx pass
    rx1322_cur."!cursor_pass"(rx1322_pos, "")
    rx1322_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1322_pos)
    .return (rx1322_cur)
  rx1322_fail:
    (rx1322_rep, rx1322_pos, $I10, $P10) = rx1322_cur."!mark_fail"(0)
    lt rx1322_pos, -1, rx1322_done
    eq rx1322_pos, -1, rx1322_fail
    jump $I10
  rx1322_done:
    rx1322_cur."!cursor_fail"()
    rx1322_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1322_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "_block1324"  :anon :subid("340_1274564776.41408") :method :outer("337_1274564776.41408")
.annotate 'line', 562
    .local string rx1326_tgt
    .local int rx1326_pos
    .local int rx1326_off
    .local int rx1326_eos
    .local int rx1326_rep
    .local pmc rx1326_cur
    (rx1326_cur, rx1326_pos, rx1326_tgt) = self."!cursor_start"()
    rx1326_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1326_cur
    .local pmc match
    .lex "$/", match
    length rx1326_eos, rx1326_tgt
    set rx1326_off, 0
    lt rx1326_pos, 2, rx1326_start
    sub rx1326_off, rx1326_pos, 1
    substr rx1326_tgt, rx1326_tgt, rx1326_off
  rx1326_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1327_done
    goto rxscan1327_scan
  rxscan1327_loop:
    ($P10) = rx1326_cur."from"()
    inc $P10
    set rx1326_pos, $P10
    ge rx1326_pos, rx1326_eos, rxscan1327_done
  rxscan1327_scan:
    set_addr $I10, rxscan1327_loop
    rx1326_cur."!mark_push"(0, rx1326_pos, $I10)
  rxscan1327_done:
  # rx literal  "%"
    add $I11, rx1326_pos, 1
    gt $I11, rx1326_eos, rx1326_fail
    sub $I11, rx1326_pos, rx1326_off
    substr $S10, rx1326_tgt, $I11, 1
    ne $S10, "%", rx1326_fail
    add rx1326_pos, 1
  # rx charclass w
    ge rx1326_pos, rx1326_eos, rx1326_fail
    sub $I10, rx1326_pos, rx1326_off
    is_cclass $I11, 8192, rx1326_tgt, $I10
    unless $I11, rx1326_fail
    inc rx1326_pos
  # rx pass
    rx1326_cur."!cursor_pass"(rx1326_pos, "")
    rx1326_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1326_pos)
    .return (rx1326_cur)
  rx1326_fail:
    (rx1326_rep, rx1326_pos, $I10, $P10) = rx1326_cur."!mark_fail"(0)
    lt rx1326_pos, -1, rx1326_done
    eq rx1326_pos, -1, rx1326_fail
    jump $I10
  rx1326_done:
    rx1326_cur."!cursor_fail"()
    rx1326_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1326_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<var>"  :subid("341_1274564776.41408") :method :outer("330_1274564776.41408")
.annotate 'line', 548
    .const 'Sub' $P1341 = "344_1274564776.41408" 
    capture_lex $P1341
    .const 'Sub' $P1337 = "343_1274564776.41408" 
    capture_lex $P1337
    .local string rx1331_tgt
    .local int rx1331_pos
    .local int rx1331_off
    .local int rx1331_eos
    .local int rx1331_rep
    .local pmc rx1331_cur
    (rx1331_cur, rx1331_pos, rx1331_tgt) = self."!cursor_start"()
    rx1331_cur."!cursor_debug"("START ", "assertion:sym<var>")
    .lex unicode:"$\x{a2}", rx1331_cur
    .local pmc match
    .lex "$/", match
    length rx1331_eos, rx1331_tgt
    set rx1331_off, 0
    lt rx1331_pos, 2, rx1331_start
    sub rx1331_off, rx1331_pos, 1
    substr rx1331_tgt, rx1331_tgt, rx1331_off
  rx1331_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1334_done
    goto rxscan1334_scan
  rxscan1334_loop:
    ($P10) = rx1331_cur."from"()
    inc $P10
    set rx1331_pos, $P10
    ge rx1331_pos, rx1331_eos, rxscan1334_done
  rxscan1334_scan:
    set_addr $I10, rxscan1334_loop
    rx1331_cur."!mark_push"(0, rx1331_pos, $I10)
  rxscan1334_done:
  alt1335_0:
.annotate 'line', 568
    set_addr $I10, alt1335_1
    rx1331_cur."!mark_push"(0, rx1331_pos, $I10)
.annotate 'line', 569
  # rx subrule "before" subtype=zerowidth negate=
    rx1331_cur."!cursor_pos"(rx1331_pos)
    .const 'Sub' $P1337 = "343_1274564776.41408" 
    capture_lex $P1337
    $P10 = rx1331_cur."before"($P1337)
    unless $P10, rx1331_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1331_cur."!cursor_pos"(rx1331_pos)
    $P10 = rx1331_cur."LANG"("MAIN", "variable")
    unless $P10, rx1331_fail
    rx1331_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("var")
    rx1331_pos = $P10."pos"()
    goto alt1335_end
  alt1335_1:
.annotate 'line', 570
  # rx subrule "before" subtype=zerowidth negate=
    rx1331_cur."!cursor_pos"(rx1331_pos)
    .const 'Sub' $P1341 = "344_1274564776.41408" 
    capture_lex $P1341
    $P10 = rx1331_cur."before"($P1341)
    unless $P10, rx1331_fail
  # rx subrule "panic" subtype=method negate=
    rx1331_cur."!cursor_pos"(rx1331_pos)
    $P10 = rx1331_cur."panic"("Use of hash variable in patterns is reserved")
    unless $P10, rx1331_fail
    rx1331_pos = $P10."pos"()
  alt1335_end:
.annotate 'line', 568
  # rx pass
    rx1331_cur."!cursor_pass"(rx1331_pos, "assertion:sym<var>")
    rx1331_cur."!cursor_debug"("PASS  ", "assertion:sym<var>", " at pos=", rx1331_pos)
    .return (rx1331_cur)
  rx1331_fail:
.annotate 'line', 548
    (rx1331_rep, rx1331_pos, $I10, $P10) = rx1331_cur."!mark_fail"(0)
    lt rx1331_pos, -1, rx1331_done
    eq rx1331_pos, -1, rx1331_fail
    jump $I10
  rx1331_done:
    rx1331_cur."!cursor_fail"()
    rx1331_cur."!cursor_debug"("FAIL  ", "assertion:sym<var>")
    .return (rx1331_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<var>"  :subid("342_1274564776.41408") :method
.annotate 'line', 548
    new $P1333, "ResizablePMCArray"
    push $P1333, ""
    push $P1333, ""
    .return ($P1333)
.end


.namespace ["NQP";"Regex"]
.sub "_block1336"  :anon :subid("343_1274564776.41408") :method :outer("341_1274564776.41408")
.annotate 'line', 569
    .local string rx1338_tgt
    .local int rx1338_pos
    .local int rx1338_off
    .local int rx1338_eos
    .local int rx1338_rep
    .local pmc rx1338_cur
    (rx1338_cur, rx1338_pos, rx1338_tgt) = self."!cursor_start"()
    rx1338_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1338_cur
    .local pmc match
    .lex "$/", match
    length rx1338_eos, rx1338_tgt
    set rx1338_off, 0
    lt rx1338_pos, 2, rx1338_start
    sub rx1338_off, rx1338_pos, 1
    substr rx1338_tgt, rx1338_tgt, rx1338_off
  rx1338_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1339_done
    goto rxscan1339_scan
  rxscan1339_loop:
    ($P10) = rx1338_cur."from"()
    inc $P10
    set rx1338_pos, $P10
    ge rx1338_pos, rx1338_eos, rxscan1339_done
  rxscan1339_scan:
    set_addr $I10, rxscan1339_loop
    rx1338_cur."!mark_push"(0, rx1338_pos, $I10)
  rxscan1339_done:
  # rx enumcharlist negate=0 
    ge rx1338_pos, rx1338_eos, rx1338_fail
    sub $I10, rx1338_pos, rx1338_off
    substr $S10, rx1338_tgt, $I10, 1
    index $I11, "$@", $S10
    lt $I11, 0, rx1338_fail
    inc rx1338_pos
  # rx charclass w
    ge rx1338_pos, rx1338_eos, rx1338_fail
    sub $I10, rx1338_pos, rx1338_off
    is_cclass $I11, 8192, rx1338_tgt, $I10
    unless $I11, rx1338_fail
    inc rx1338_pos
  # rx pass
    rx1338_cur."!cursor_pass"(rx1338_pos, "")
    rx1338_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1338_pos)
    .return (rx1338_cur)
  rx1338_fail:
    (rx1338_rep, rx1338_pos, $I10, $P10) = rx1338_cur."!mark_fail"(0)
    lt rx1338_pos, -1, rx1338_done
    eq rx1338_pos, -1, rx1338_fail
    jump $I10
  rx1338_done:
    rx1338_cur."!cursor_fail"()
    rx1338_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1338_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "_block1340"  :anon :subid("344_1274564776.41408") :method :outer("341_1274564776.41408")
.annotate 'line', 570
    .local string rx1342_tgt
    .local int rx1342_pos
    .local int rx1342_off
    .local int rx1342_eos
    .local int rx1342_rep
    .local pmc rx1342_cur
    (rx1342_cur, rx1342_pos, rx1342_tgt) = self."!cursor_start"()
    rx1342_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1342_cur
    .local pmc match
    .lex "$/", match
    length rx1342_eos, rx1342_tgt
    set rx1342_off, 0
    lt rx1342_pos, 2, rx1342_start
    sub rx1342_off, rx1342_pos, 1
    substr rx1342_tgt, rx1342_tgt, rx1342_off
  rx1342_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1343_done
    goto rxscan1343_scan
  rxscan1343_loop:
    ($P10) = rx1342_cur."from"()
    inc $P10
    set rx1342_pos, $P10
    ge rx1342_pos, rx1342_eos, rxscan1343_done
  rxscan1343_scan:
    set_addr $I10, rxscan1343_loop
    rx1342_cur."!mark_push"(0, rx1342_pos, $I10)
  rxscan1343_done:
  # rx literal  "%"
    add $I11, rx1342_pos, 1
    gt $I11, rx1342_eos, rx1342_fail
    sub $I11, rx1342_pos, rx1342_off
    substr $S10, rx1342_tgt, $I11, 1
    ne $S10, "%", rx1342_fail
    add rx1342_pos, 1
  # rx charclass w
    ge rx1342_pos, rx1342_eos, rx1342_fail
    sub $I10, rx1342_pos, rx1342_off
    is_cclass $I11, 8192, rx1342_tgt, $I10
    unless $I11, rx1342_fail
    inc rx1342_pos
  # rx pass
    rx1342_cur."!cursor_pass"(rx1342_pos, "")
    rx1342_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1342_pos)
    .return (rx1342_cur)
  rx1342_fail:
    (rx1342_rep, rx1342_pos, $I10, $P10) = rx1342_cur."!mark_fail"(0)
    lt rx1342_pos, -1, rx1342_done
    eq rx1342_pos, -1, rx1342_fail
    jump $I10
  rx1342_done:
    rx1342_cur."!cursor_fail"()
    rx1342_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1342_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("345_1274564776.41408") :method :outer("330_1274564776.41408")
.annotate 'line', 548
    .local string rx1345_tgt
    .local int rx1345_pos
    .local int rx1345_off
    .local int rx1345_eos
    .local int rx1345_rep
    .local pmc rx1345_cur
    (rx1345_cur, rx1345_pos, rx1345_tgt) = self."!cursor_start"()
    rx1345_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1345_cur
    .local pmc match
    .lex "$/", match
    length rx1345_eos, rx1345_tgt
    set rx1345_off, 0
    lt rx1345_pos, 2, rx1345_start
    sub rx1345_off, rx1345_pos, 1
    substr rx1345_tgt, rx1345_tgt, rx1345_off
  rx1345_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1348_done
    goto rxscan1348_scan
  rxscan1348_loop:
    ($P10) = rx1345_cur."from"()
    inc $P10
    set rx1345_pos, $P10
    ge rx1345_pos, rx1345_eos, rxscan1348_done
  rxscan1348_scan:
    set_addr $I10, rxscan1348_loop
    rx1345_cur."!mark_push"(0, rx1345_pos, $I10)
  rxscan1348_done:
.annotate 'line', 574
  # rx enumcharlist negate=0 zerowidth
    ge rx1345_pos, rx1345_eos, rx1345_fail
    sub $I10, rx1345_pos, rx1345_off
    substr $S10, rx1345_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1345_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1345_cur."!cursor_pos"(rx1345_pos)
    $P10 = rx1345_cur."codeblock"()
    unless $P10, rx1345_fail
    rx1345_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1345_pos = $P10."pos"()
.annotate 'line', 573
  # rx pass
    rx1345_cur."!cursor_pass"(rx1345_pos, "metachar:sym<{ }>")
    rx1345_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1345_pos)
    .return (rx1345_cur)
  rx1345_fail:
.annotate 'line', 548
    (rx1345_rep, rx1345_pos, $I10, $P10) = rx1345_cur."!mark_fail"(0)
    lt rx1345_pos, -1, rx1345_done
    eq rx1345_pos, -1, rx1345_fail
    jump $I10
  rx1345_done:
    rx1345_cur."!cursor_fail"()
    rx1345_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx1345_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("346_1274564776.41408") :method
.annotate 'line', 548
    new $P1347, "ResizablePMCArray"
    push $P1347, "{"
    .return ($P1347)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("347_1274564776.41408") :method :outer("330_1274564776.41408")
.annotate 'line', 548
    .local string rx1350_tgt
    .local int rx1350_pos
    .local int rx1350_off
    .local int rx1350_eos
    .local int rx1350_rep
    .local pmc rx1350_cur
    (rx1350_cur, rx1350_pos, rx1350_tgt) = self."!cursor_start"()
    rx1350_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1350_cur
    .local pmc match
    .lex "$/", match
    length rx1350_eos, rx1350_tgt
    set rx1350_off, 0
    lt rx1350_pos, 2, rx1350_start
    sub rx1350_off, rx1350_pos, 1
    substr rx1350_tgt, rx1350_tgt, rx1350_off
  rx1350_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1353_done
    goto rxscan1353_scan
  rxscan1353_loop:
    ($P10) = rx1350_cur."from"()
    inc $P10
    set rx1350_pos, $P10
    ge rx1350_pos, rx1350_eos, rxscan1353_done
  rxscan1353_scan:
    set_addr $I10, rxscan1353_loop
    rx1350_cur."!mark_push"(0, rx1350_pos, $I10)
  rxscan1353_done:
.annotate 'line', 578
  # rx enumcharlist negate=0 zerowidth
    ge rx1350_pos, rx1350_eos, rx1350_fail
    sub $I10, rx1350_pos, rx1350_off
    substr $S10, rx1350_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1350_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1350_cur."!cursor_pos"(rx1350_pos)
    $P10 = rx1350_cur."codeblock"()
    unless $P10, rx1350_fail
    rx1350_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1350_pos = $P10."pos"()
.annotate 'line', 577
  # rx pass
    rx1350_cur."!cursor_pass"(rx1350_pos, "assertion:sym<{ }>")
    rx1350_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1350_pos)
    .return (rx1350_cur)
  rx1350_fail:
.annotate 'line', 548
    (rx1350_rep, rx1350_pos, $I10, $P10) = rx1350_cur."!mark_fail"(0)
    lt rx1350_pos, -1, rx1350_done
    eq rx1350_pos, -1, rx1350_fail
    jump $I10
  rx1350_done:
    rx1350_cur."!cursor_fail"()
    rx1350_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1350_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("348_1274564776.41408") :method
.annotate 'line', 548
    new $P1352, "ResizablePMCArray"
    push $P1352, "{"
    .return ($P1352)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("349_1274564776.41408") :method :outer("330_1274564776.41408")
.annotate 'line', 548
    .const 'Sub' $P1363 = "351_1274564776.41408" 
    capture_lex $P1363
    .local string rx1355_tgt
    .local int rx1355_pos
    .local int rx1355_off
    .local int rx1355_eos
    .local int rx1355_rep
    .local pmc rx1355_cur
    (rx1355_cur, rx1355_pos, rx1355_tgt) = self."!cursor_start"()
    rx1355_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1355_cur."!cursor_caparray"("assertion", "nibbler", "arglist")
    .lex unicode:"$\x{a2}", rx1355_cur
    .local pmc match
    .lex "$/", match
    length rx1355_eos, rx1355_tgt
    set rx1355_off, 0
    lt rx1355_pos, 2, rx1355_start
    sub rx1355_off, rx1355_pos, 1
    substr rx1355_tgt, rx1355_tgt, rx1355_off
  rx1355_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1358_done
    goto rxscan1358_scan
  rxscan1358_loop:
    ($P10) = rx1355_cur."from"()
    inc $P10
    set rx1355_pos, $P10
    ge rx1355_pos, rx1355_eos, rxscan1358_done
  rxscan1358_scan:
    set_addr $I10, rxscan1358_loop
    rx1355_cur."!mark_push"(0, rx1355_pos, $I10)
  rxscan1358_done:
.annotate 'line', 582
  # rx subcapture "longname"
    set_addr $I10, rxcap_1359_fail
    rx1355_cur."!mark_push"(0, rx1355_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1355_pos, rx1355_off
    find_not_cclass $I11, 8192, rx1355_tgt, $I10, rx1355_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1355_fail
    add rx1355_pos, rx1355_off, $I11
    set_addr $I10, rxcap_1359_fail
    ($I12, $I11) = rx1355_cur."!mark_peek"($I10)
    rx1355_cur."!cursor_pos"($I11)
    ($P10) = rx1355_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1355_pos, "")
    rx1355_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_1359_done
  rxcap_1359_fail:
    goto rx1355_fail
  rxcap_1359_done:
.annotate 'line', 589
  # rx rxquantr1360 ** 0..1
    set_addr $I1366, rxquantr1360_done
    rx1355_cur."!mark_push"(0, rx1355_pos, $I1366)
  rxquantr1360_loop:
  alt1361_0:
.annotate 'line', 583
    set_addr $I10, alt1361_1
    rx1355_cur."!mark_push"(0, rx1355_pos, $I10)
.annotate 'line', 584
  # rx subrule "before" subtype=zerowidth negate=
    rx1355_cur."!cursor_pos"(rx1355_pos)
    .const 'Sub' $P1363 = "351_1274564776.41408" 
    capture_lex $P1363
    $P10 = rx1355_cur."before"($P1363)
    unless $P10, rx1355_fail
    goto alt1361_end
  alt1361_1:
    set_addr $I10, alt1361_2
    rx1355_cur."!mark_push"(0, rx1355_pos, $I10)
.annotate 'line', 585
  # rx literal  "="
    add $I11, rx1355_pos, 1
    gt $I11, rx1355_eos, rx1355_fail
    sub $I11, rx1355_pos, rx1355_off
    substr $S10, rx1355_tgt, $I11, 1
    ne $S10, "=", rx1355_fail
    add rx1355_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1355_cur."!cursor_pos"(rx1355_pos)
    $P10 = rx1355_cur."assertion"()
    unless $P10, rx1355_fail
    rx1355_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1355_pos = $P10."pos"()
    goto alt1361_end
  alt1361_2:
    set_addr $I10, alt1361_3
    rx1355_cur."!mark_push"(0, rx1355_pos, $I10)
.annotate 'line', 586
  # rx literal  ":"
    add $I11, rx1355_pos, 1
    gt $I11, rx1355_eos, rx1355_fail
    sub $I11, rx1355_pos, rx1355_off
    substr $S10, rx1355_tgt, $I11, 1
    ne $S10, ":", rx1355_fail
    add rx1355_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1355_cur."!cursor_pos"(rx1355_pos)
    $P10 = rx1355_cur."arglist"()
    unless $P10, rx1355_fail
    rx1355_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1355_pos = $P10."pos"()
    goto alt1361_end
  alt1361_3:
    set_addr $I10, alt1361_4
    rx1355_cur."!mark_push"(0, rx1355_pos, $I10)
.annotate 'line', 587
  # rx literal  "("
    add $I11, rx1355_pos, 1
    gt $I11, rx1355_eos, rx1355_fail
    sub $I11, rx1355_pos, rx1355_off
    substr $S10, rx1355_tgt, $I11, 1
    ne $S10, "(", rx1355_fail
    add rx1355_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1355_cur."!cursor_pos"(rx1355_pos)
    $P10 = rx1355_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1355_fail
    rx1355_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1355_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1355_pos, 1
    gt $I11, rx1355_eos, rx1355_fail
    sub $I11, rx1355_pos, rx1355_off
    substr $S10, rx1355_tgt, $I11, 1
    ne $S10, ")", rx1355_fail
    add rx1355_pos, 1
    goto alt1361_end
  alt1361_4:
.annotate 'line', 588
  # rx subrule "normspace" subtype=method negate=
    rx1355_cur."!cursor_pos"(rx1355_pos)
    $P10 = rx1355_cur."normspace"()
    unless $P10, rx1355_fail
    rx1355_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1355_cur."!cursor_pos"(rx1355_pos)
    $P10 = rx1355_cur."nibbler"()
    unless $P10, rx1355_fail
    rx1355_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1355_pos = $P10."pos"()
  alt1361_end:
.annotate 'line', 589
    (rx1355_rep) = rx1355_cur."!mark_commit"($I1366)
  rxquantr1360_done:
.annotate 'line', 581
  # rx pass
    rx1355_cur."!cursor_pass"(rx1355_pos, "assertion:sym<name>")
    rx1355_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1355_pos)
    .return (rx1355_cur)
  rx1355_fail:
.annotate 'line', 548
    (rx1355_rep, rx1355_pos, $I10, $P10) = rx1355_cur."!mark_fail"(0)
    lt rx1355_pos, -1, rx1355_done
    eq rx1355_pos, -1, rx1355_fail
    jump $I10
  rx1355_done:
    rx1355_cur."!cursor_fail"()
    rx1355_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1355_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("350_1274564776.41408") :method
.annotate 'line', 548
    new $P1357, "ResizablePMCArray"
    push $P1357, ""
    .return ($P1357)
.end


.namespace ["NQP";"Regex"]
.sub "_block1362"  :anon :subid("351_1274564776.41408") :method :outer("349_1274564776.41408")
.annotate 'line', 584
    .local string rx1364_tgt
    .local int rx1364_pos
    .local int rx1364_off
    .local int rx1364_eos
    .local int rx1364_rep
    .local pmc rx1364_cur
    (rx1364_cur, rx1364_pos, rx1364_tgt) = self."!cursor_start"()
    rx1364_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1364_cur
    .local pmc match
    .lex "$/", match
    length rx1364_eos, rx1364_tgt
    set rx1364_off, 0
    lt rx1364_pos, 2, rx1364_start
    sub rx1364_off, rx1364_pos, 1
    substr rx1364_tgt, rx1364_tgt, rx1364_off
  rx1364_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1365_done
    goto rxscan1365_scan
  rxscan1365_loop:
    ($P10) = rx1364_cur."from"()
    inc $P10
    set rx1364_pos, $P10
    ge rx1364_pos, rx1364_eos, rxscan1365_done
  rxscan1365_scan:
    set_addr $I10, rxscan1365_loop
    rx1364_cur."!mark_push"(0, rx1364_pos, $I10)
  rxscan1365_done:
  # rx literal  ">"
    add $I11, rx1364_pos, 1
    gt $I11, rx1364_eos, rx1364_fail
    sub $I11, rx1364_pos, rx1364_off
    substr $S10, rx1364_tgt, $I11, 1
    ne $S10, ">", rx1364_fail
    add rx1364_pos, 1
  # rx pass
    rx1364_cur."!cursor_pass"(rx1364_pos, "")
    rx1364_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1364_pos)
    .return (rx1364_cur)
  rx1364_fail:
    (rx1364_rep, rx1364_pos, $I10, $P10) = rx1364_cur."!mark_fail"(0)
    lt rx1364_pos, -1, rx1364_done
    eq rx1364_pos, -1, rx1364_fail
    jump $I10
  rx1364_done:
    rx1364_cur."!cursor_fail"()
    rx1364_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1364_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("352_1274564776.41408") :method :outer("330_1274564776.41408")
.annotate 'line', 548
    .local string rx1368_tgt
    .local int rx1368_pos
    .local int rx1368_off
    .local int rx1368_eos
    .local int rx1368_rep
    .local pmc rx1368_cur
    (rx1368_cur, rx1368_pos, rx1368_tgt) = self."!cursor_start"()
    rx1368_cur."!cursor_debug"("START ", "codeblock")
    .lex unicode:"$\x{a2}", rx1368_cur
    .local pmc match
    .lex "$/", match
    length rx1368_eos, rx1368_tgt
    set rx1368_off, 0
    lt rx1368_pos, 2, rx1368_start
    sub rx1368_off, rx1368_pos, 1
    substr rx1368_tgt, rx1368_tgt, rx1368_off
  rx1368_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1372_done
    goto rxscan1372_scan
  rxscan1372_loop:
    ($P10) = rx1368_cur."from"()
    inc $P10
    set rx1368_pos, $P10
    ge rx1368_pos, rx1368_eos, rxscan1372_done
  rxscan1372_scan:
    set_addr $I10, rxscan1372_loop
    rx1368_cur."!mark_push"(0, rx1368_pos, $I10)
  rxscan1372_done:
.annotate 'line', 594
  # rx subrule "LANG" subtype=capture negate=
    rx1368_cur."!cursor_pos"(rx1368_pos)
    $P10 = rx1368_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1368_fail
    rx1368_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1368_pos = $P10."pos"()
.annotate 'line', 593
  # rx pass
    rx1368_cur."!cursor_pass"(rx1368_pos, "codeblock")
    rx1368_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1368_pos)
    .return (rx1368_cur)
  rx1368_fail:
.annotate 'line', 548
    (rx1368_rep, rx1368_pos, $I10, $P10) = rx1368_cur."!mark_fail"(0)
    lt rx1368_pos, -1, rx1368_done
    eq rx1368_pos, -1, rx1368_fail
    jump $I10
  rx1368_done:
    rx1368_cur."!cursor_fail"()
    rx1368_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1368_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("353_1274564776.41408") :method
.annotate 'line', 548
    $P1370 = self."!PREFIX__!subrule"("block", "")
    new $P1371, "ResizablePMCArray"
    push $P1371, $P1370
    .return ($P1371)
.end


.namespace ["NQP";"Grammar"]
.sub "_block1374" :load :anon :subid("354_1274564776.41408")
.annotate 'line', 4
    .const 'Sub' $P1376 = "11_1274564776.41408" 
    $P1377 = $P1376()
    .return ($P1377)
.end


.namespace []
.sub "_block1395" :load :anon :subid("355_1274564776.41408")
.annotate 'line', 1
    .const 'Sub' $P1397 = "10_1274564776.41408" 
    $P1398 = $P1397()
    .return ($P1398)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1274564782.90592")
.annotate 'line', 0
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
.annotate 'line', 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
    $P2370 = $P14()
.annotate 'line', 1
    .return ($P2370)
    .const 'Sub' $P2372 = "137_1274564782.90592" 
    .return ($P2372)
.end


.namespace []
.sub "" :load :init :subid("post138") :outer("10_1274564782.90592")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1274564782.90592" 
    .local pmc block
    set block, $P12
    $P2375 = get_root_global ["parrot"], "P6metaclass"
    $P2375."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1274564782.90592") :outer("10_1274564782.90592")
.annotate 'line', 3
    .const 'Sub' $P2366 = "136_1274564782.90592" 
    capture_lex $P2366
    get_hll_global $P2189, ["NQP";"RegexActions"], "_block2188" 
    capture_lex $P2189
    .const 'Sub' $P2178 = "125_1274564782.90592" 
    capture_lex $P2178
    .const 'Sub' $P2171 = "124_1274564782.90592" 
    capture_lex $P2171
    .const 'Sub' $P2164 = "123_1274564782.90592" 
    capture_lex $P2164
    .const 'Sub' $P2157 = "122_1274564782.90592" 
    capture_lex $P2157
    .const 'Sub' $P2144 = "121_1274564782.90592" 
    capture_lex $P2144
    .const 'Sub' $P2134 = "120_1274564782.90592" 
    capture_lex $P2134
    .const 'Sub' $P2124 = "119_1274564782.90592" 
    capture_lex $P2124
    .const 'Sub' $P2114 = "118_1274564782.90592" 
    capture_lex $P2114
    .const 'Sub' $P2107 = "117_1274564782.90592" 
    capture_lex $P2107
    .const 'Sub' $P2093 = "116_1274564782.90592" 
    capture_lex $P2093
    .const 'Sub' $P2083 = "115_1274564782.90592" 
    capture_lex $P2083
    .const 'Sub' $P2046 = "114_1274564782.90592" 
    capture_lex $P2046
    .const 'Sub' $P2032 = "113_1274564782.90592" 
    capture_lex $P2032
    .const 'Sub' $P2022 = "112_1274564782.90592" 
    capture_lex $P2022
    .const 'Sub' $P2012 = "111_1274564782.90592" 
    capture_lex $P2012
    .const 'Sub' $P2002 = "110_1274564782.90592" 
    capture_lex $P2002
    .const 'Sub' $P1992 = "109_1274564782.90592" 
    capture_lex $P1992
    .const 'Sub' $P1982 = "108_1274564782.90592" 
    capture_lex $P1982
    .const 'Sub' $P1954 = "107_1274564782.90592" 
    capture_lex $P1954
    .const 'Sub' $P1937 = "106_1274564782.90592" 
    capture_lex $P1937
    .const 'Sub' $P1927 = "105_1274564782.90592" 
    capture_lex $P1927
    .const 'Sub' $P1914 = "104_1274564782.90592" 
    capture_lex $P1914
    .const 'Sub' $P1901 = "103_1274564782.90592" 
    capture_lex $P1901
    .const 'Sub' $P1888 = "102_1274564782.90592" 
    capture_lex $P1888
    .const 'Sub' $P1878 = "101_1274564782.90592" 
    capture_lex $P1878
    .const 'Sub' $P1849 = "100_1274564782.90592" 
    capture_lex $P1849
    .const 'Sub' $P1825 = "99_1274564782.90592" 
    capture_lex $P1825
    .const 'Sub' $P1815 = "98_1274564782.90592" 
    capture_lex $P1815
    .const 'Sub' $P1805 = "97_1274564782.90592" 
    capture_lex $P1805
    .const 'Sub' $P1778 = "96_1274564782.90592" 
    capture_lex $P1778
    .const 'Sub' $P1760 = "95_1274564782.90592" 
    capture_lex $P1760
    .const 'Sub' $P1750 = "94_1274564782.90592" 
    capture_lex $P1750
    .const 'Sub' $P1646 = "91_1274564782.90592" 
    capture_lex $P1646
    .const 'Sub' $P1636 = "90_1274564782.90592" 
    capture_lex $P1636
    .const 'Sub' $P1607 = "89_1274564782.90592" 
    capture_lex $P1607
    .const 'Sub' $P1565 = "88_1274564782.90592" 
    capture_lex $P1565
    .const 'Sub' $P1549 = "87_1274564782.90592" 
    capture_lex $P1549
    .const 'Sub' $P1540 = "86_1274564782.90592" 
    capture_lex $P1540
    .const 'Sub' $P1508 = "85_1274564782.90592" 
    capture_lex $P1508
    .const 'Sub' $P1409 = "82_1274564782.90592" 
    capture_lex $P1409
    .const 'Sub' $P1392 = "81_1274564782.90592" 
    capture_lex $P1392
    .const 'Sub' $P1372 = "80_1274564782.90592" 
    capture_lex $P1372
    .const 'Sub' $P1288 = "79_1274564782.90592" 
    capture_lex $P1288
    .const 'Sub' $P1264 = "77_1274564782.90592" 
    capture_lex $P1264
    .const 'Sub' $P1230 = "75_1274564782.90592" 
    capture_lex $P1230
    .const 'Sub' $P1180 = "73_1274564782.90592" 
    capture_lex $P1180
    .const 'Sub' $P1170 = "72_1274564782.90592" 
    capture_lex $P1170
    .const 'Sub' $P1160 = "71_1274564782.90592" 
    capture_lex $P1160
    .const 'Sub' $P1089 = "69_1274564782.90592" 
    capture_lex $P1089
    .const 'Sub' $P1072 = "68_1274564782.90592" 
    capture_lex $P1072
    .const 'Sub' $P1062 = "67_1274564782.90592" 
    capture_lex $P1062
    .const 'Sub' $P1052 = "66_1274564782.90592" 
    capture_lex $P1052
    .const 'Sub' $P1042 = "65_1274564782.90592" 
    capture_lex $P1042
    .const 'Sub' $P1032 = "64_1274564782.90592" 
    capture_lex $P1032
    .const 'Sub' $P1008 = "63_1274564782.90592" 
    capture_lex $P1008
    .const 'Sub' $P955 = "62_1274564782.90592" 
    capture_lex $P955
    .const 'Sub' $P945 = "61_1274564782.90592" 
    capture_lex $P945
    .const 'Sub' $P856 = "59_1274564782.90592" 
    capture_lex $P856
    .const 'Sub' $P830 = "58_1274564782.90592" 
    capture_lex $P830
    .const 'Sub' $P814 = "57_1274564782.90592" 
    capture_lex $P814
    .const 'Sub' $P804 = "56_1274564782.90592" 
    capture_lex $P804
    .const 'Sub' $P794 = "55_1274564782.90592" 
    capture_lex $P794
    .const 'Sub' $P784 = "54_1274564782.90592" 
    capture_lex $P784
    .const 'Sub' $P774 = "53_1274564782.90592" 
    capture_lex $P774
    .const 'Sub' $P764 = "52_1274564782.90592" 
    capture_lex $P764
    .const 'Sub' $P754 = "51_1274564782.90592" 
    capture_lex $P754
    .const 'Sub' $P744 = "50_1274564782.90592" 
    capture_lex $P744
    .const 'Sub' $P734 = "49_1274564782.90592" 
    capture_lex $P734
    .const 'Sub' $P724 = "48_1274564782.90592" 
    capture_lex $P724
    .const 'Sub' $P714 = "47_1274564782.90592" 
    capture_lex $P714
    .const 'Sub' $P704 = "46_1274564782.90592" 
    capture_lex $P704
    .const 'Sub' $P694 = "45_1274564782.90592" 
    capture_lex $P694
    .const 'Sub' $P684 = "44_1274564782.90592" 
    capture_lex $P684
    .const 'Sub' $P666 = "43_1274564782.90592" 
    capture_lex $P666
    .const 'Sub' $P631 = "42_1274564782.90592" 
    capture_lex $P631
    .const 'Sub' $P615 = "41_1274564782.90592" 
    capture_lex $P615
    .const 'Sub' $P594 = "40_1274564782.90592" 
    capture_lex $P594
    .const 'Sub' $P574 = "39_1274564782.90592" 
    capture_lex $P574
    .const 'Sub' $P561 = "38_1274564782.90592" 
    capture_lex $P561
    .const 'Sub' $P535 = "37_1274564782.90592" 
    capture_lex $P535
    .const 'Sub' $P499 = "36_1274564782.90592" 
    capture_lex $P499
    .const 'Sub' $P482 = "35_1274564782.90592" 
    capture_lex $P482
    .const 'Sub' $P468 = "34_1274564782.90592" 
    capture_lex $P468
    .const 'Sub' $P415 = "32_1274564782.90592" 
    capture_lex $P415
    .const 'Sub' $P402 = "31_1274564782.90592" 
    capture_lex $P402
    .const 'Sub' $P382 = "30_1274564782.90592" 
    capture_lex $P382
    .const 'Sub' $P372 = "29_1274564782.90592" 
    capture_lex $P372
    .const 'Sub' $P362 = "28_1274564782.90592" 
    capture_lex $P362
    .const 'Sub' $P346 = "27_1274564782.90592" 
    capture_lex $P346
    .const 'Sub' $P286 = "25_1274564782.90592" 
    capture_lex $P286
    .const 'Sub' $P243 = "23_1274564782.90592" 
    capture_lex $P243
    .const 'Sub' $P214 = "22_1274564782.90592" 
    capture_lex $P214
    .const 'Sub' $P181 = "21_1274564782.90592" 
    capture_lex $P181
    .const 'Sub' $P171 = "20_1274564782.90592" 
    capture_lex $P171
    .const 'Sub' $P151 = "19_1274564782.90592" 
    capture_lex $P151
    .const 'Sub' $P100 = "18_1274564782.90592" 
    capture_lex $P100
    .const 'Sub' $P84 = "17_1274564782.90592" 
    capture_lex $P84
    .const 'Sub' $P63 = "16_1274564782.90592" 
    capture_lex $P63
    .const 'Sub' $P27 = "13_1274564782.90592" 
    capture_lex $P27
    .const 'Sub' $P16 = "12_1274564782.90592" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_141
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P15
  vivify_141:
.annotate 'line', 9
    .const 'Sub' $P16 = "12_1274564782.90592" 
    newclosure $P26, $P16
    .lex "xblock_immediate", $P26
.annotate 'line', 14
    .const 'Sub' $P27 = "13_1274564782.90592" 
    newclosure $P62, $P27
    .lex "block_immediate", $P62
.annotate 'line', 24
    .const 'Sub' $P63 = "16_1274564782.90592" 
    newclosure $P83, $P63
    .lex "vivitype", $P83
.annotate 'line', 43
    .const 'Sub' $P84 = "17_1274564782.90592" 
    newclosure $P99, $P84
    .lex "colonpair_str", $P99
.annotate 'line', 204
    .const 'Sub' $P100 = "18_1274564782.90592" 
    newclosure $P150, $P100
    .lex "push_block_handler", $P150
.annotate 'line', 788
    .const 'Sub' $P151 = "19_1274564782.90592" 
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
.annotate 'line', 197
    find_lex $P614, "push_block_handler"
.annotate 'line', 779
    find_lex $P2156, "control"
.annotate 'line', 810
    get_hll_global $P2189, ["NQP";"RegexActions"], "_block2188" 
    capture_lex $P2189
    $P2360 = $P2189()
.annotate 'line', 3
    .return ($P2360)
    .const 'Sub' $P2362 = "135_1274564782.90592" 
    .return ($P2362)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post139") :outer("11_1274564782.90592")
.annotate 'line', 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 5
    .const 'Sub' $P2366 = "136_1274564782.90592" 
    capture_lex $P2366
    $P2366()
    $P2369 = get_root_global ["parrot"], "P6metaclass"
    $P2369."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block2365"  :anon :subid("136_1274564782.90592") :outer("11_1274564782.90592")
.annotate 'line', 6
    get_global $P2367, "@BLOCK"
    unless_null $P2367, vivify_140
    $P2367 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P2367
  vivify_140:
 $P2368 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P2368
.annotate 'line', 5
    .return ($P2368)
.end


.namespace ["NQP";"Actions"]
.sub "xblock_immediate"  :subid("12_1274564782.90592") :outer("11_1274564782.90592")
    .param pmc param_19
.annotate 'line', 9
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(57)
    push_eh $P18
    .lex "$xblock", param_19
.annotate 'line', 10
    find_lex $P20, "$xblock"
    unless_null $P20, vivify_142
    $P20 = root_new ['parrot';'ResizablePMCArray']
  vivify_142:
    set $P21, $P20[1]
    unless_null $P21, vivify_143
    new $P21, "Undef"
  vivify_143:
    $P22 = "block_immediate"($P21)
    find_lex $P23, "$xblock"
    unless_null $P23, vivify_144
    $P23 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$xblock", $P23
  vivify_144:
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
.sub "block_immediate"  :subid("13_1274564782.90592") :outer("11_1274564782.90592")
    .param pmc param_30
.annotate 'line', 14
    .const 'Sub' $P40 = "14_1274564782.90592" 
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
    .const 'Sub' $P40 = "14_1274564782.90592" 
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
.sub "_block39"  :anon :subid("14_1274564782.90592") :outer("13_1274564782.90592")
.annotate 'line', 16
    .const 'Sub' $P51 = "15_1274564782.90592" 
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
    unless $I48, for_undef_145
    iter $P45, $P47
    new $P57, 'ExceptionHandler'
    set_addr $P57, loop56_handler
    $P57."handle_types"(64, 66, 65)
    push_eh $P57
  loop56_test:
    unless $P45, loop56_done
    shift $P49, $P45
  loop56_redo:
    .const 'Sub' $P51 = "15_1274564782.90592" 
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
  for_undef_145:
.annotate 'line', 19
    find_lex $P59, "$stmts"
    store_lex "$block", $P59
.annotate 'line', 16
    .return ($P59)
.end


.namespace ["NQP";"Actions"]
.sub "_block50"  :anon :subid("15_1274564782.90592") :outer("14_1274564782.90592")
    .param pmc param_52
.annotate 'line', 18
    .lex "$_", param_52
    find_lex $P53, "$stmts"
    find_lex $P54, "$_"
    $P55 = $P53."push"($P54)
    .return ($P55)
.end


.namespace ["NQP";"Actions"]
.sub "vivitype"  :subid("16_1274564782.90592") :outer("11_1274564782.90592")
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
.sub "colonpair_str"  :subid("17_1274564782.90592") :outer("11_1274564782.90592")
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
.sub "push_block_handler"  :subid("18_1274564782.90592") :outer("11_1274564782.90592")
    .param pmc param_103
    .param pmc param_104
.annotate 'line', 204
    new $P102, 'ExceptionHandler'
    set_addr $P102, control_101
    $P102."handle_types"(57)
    push_eh $P102
    .lex "$/", param_103
    .lex "$block", param_104
.annotate 'line', 205
    get_global $P106, "@BLOCK"
    unless_null $P106, vivify_146
    $P106 = root_new ['parrot';'ResizablePMCArray']
  vivify_146:
    set $P107, $P106[0]
    unless_null $P107, vivify_147
    new $P107, "Undef"
  vivify_147:
    $P108 = $P107."handlers"()
    if $P108, unless_105_end
.annotate 'line', 206
    get_global $P109, "@BLOCK"
    unless_null $P109, vivify_148
    $P109 = root_new ['parrot';'ResizablePMCArray']
  vivify_148:
    set $P110, $P109[0]
    unless_null $P110, vivify_149
    new $P110, "Undef"
  vivify_149:
    new $P111, "ResizablePMCArray"
    $P110."handlers"($P111)
  unless_105_end:
.annotate 'line', 208
    find_lex $P113, "$block"
    $P114 = $P113."arity"()
    if $P114, unless_112_end
.annotate 'line', 209
    find_lex $P115, "$block"
.annotate 'line', 210
    get_hll_global $P116, ["PAST"], "Op"
.annotate 'line', 211
    get_hll_global $P117, ["PAST"], "Var"
    $P118 = $P117."new"("lexical" :named("scope"), "$!" :named("name"), 1 :named("isdecl"))
.annotate 'line', 212
    get_hll_global $P119, ["PAST"], "Var"
    $P120 = $P119."new"("lexical" :named("scope"), "$_" :named("name"))
    $P121 = $P116."new"($P118, $P120, "bind" :named("pasttype"))
.annotate 'line', 210
    $P115."unshift"($P121)
.annotate 'line', 215
    find_lex $P122, "$block"
    get_hll_global $P123, ["PAST"], "Var"
    $P124 = $P123."new"("$_" :named("name"), "parameter" :named("scope"))
    $P122."unshift"($P124)
.annotate 'line', 216
    find_lex $P125, "$block"
    $P125."symbol"("$_", "lexical" :named("scope"))
.annotate 'line', 217
    find_lex $P126, "$block"
    $P126."symbol"("$!", "lexical" :named("scope"))
.annotate 'line', 218
    find_lex $P127, "$block"
    $P127."arity"(1)
  unless_112_end:
.annotate 'line', 220
    find_lex $P128, "$block"
    $P128."blocktype"("declaration")
.annotate 'line', 221
    get_global $P129, "@BLOCK"
    unless_null $P129, vivify_150
    $P129 = root_new ['parrot';'ResizablePMCArray']
  vivify_150:
    set $P130, $P129[0]
    unless_null $P130, vivify_151
    new $P130, "Undef"
  vivify_151:
    $P131 = $P130."handlers"()
.annotate 'line', 222
    get_hll_global $P132, ["PAST"], "Control"
    find_lex $P133, "$/"
.annotate 'line', 224
    get_hll_global $P134, ["PAST"], "Stmts"
.annotate 'line', 225
    get_hll_global $P135, ["PAST"], "Op"
    find_lex $P136, "$block"
.annotate 'line', 227
    get_hll_global $P137, ["PAST"], "Var"
    $P138 = $P137."new"("register" :named("scope"), "exception" :named("name"))
    $P139 = $P135."new"($P136, $P138, "call" :named("pasttype"))
.annotate 'line', 229
    get_hll_global $P140, ["PAST"], "Op"
.annotate 'line', 230
    get_hll_global $P141, ["PAST"], "Var"
.annotate 'line', 231
    get_hll_global $P142, ["PAST"], "Var"
    $P143 = $P142."new"("register" :named("scope"), "exception" :named("name"))
    $P144 = $P141."new"($P143, "handled", "keyed" :named("scope"))
.annotate 'line', 230
    $P145 = $P140."new"($P144, 1, "bind" :named("pasttype"))
.annotate 'line', 229
    $P146 = $P134."new"($P139, $P145)
.annotate 'line', 224
    $P147 = $P132."new"($P146, $P133 :named("node"))
.annotate 'line', 222
    $P148 = $P131."unshift"($P147)
.annotate 'line', 204
    .return ($P148)
  control_101:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P149, exception, "payload"
    .return ($P149)
.end


.namespace ["NQP";"Actions"]
.sub "control"  :subid("19_1274564782.90592") :outer("11_1274564782.90592")
    .param pmc param_154
    .param pmc param_155
.annotate 'line', 788
    new $P153, 'ExceptionHandler'
    set_addr $P153, control_152
    $P153."handle_types"(57)
    push_eh $P153
    .lex "$/", param_154
    .lex "$id", param_155
.annotate 'line', 789
    find_lex $P156, "$/"
    get_hll_global $P157, ["PAST"], "Op"
    find_lex $P158, "$/"
.annotate 'line', 795
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
.annotate 'line', 789
    $P164 = $P156."!make"($P163)
.annotate 'line', 788
    .return ($P164)
  control_152:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P165, exception, "payload"
    .return ($P165)
.end


.namespace ["NQP";"Actions"]
.sub "TOP"  :subid("20_1274564782.90592") :method :outer("11_1274564782.90592")
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
    unless_null $P176, vivify_152
    $P176 = root_new ['parrot';'Hash']
  vivify_152:
    set $P177, $P176["comp_unit"]
    unless_null $P177, vivify_153
    new $P177, "Undef"
  vivify_153:
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
.sub "deflongname"  :subid("21_1274564782.90592") :method :outer("11_1274564782.90592")
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
    unless_null $P188, vivify_154
    $P188 = root_new ['parrot';'Hash']
  vivify_154:
    set $P189, $P188["colonpair"]
    unless_null $P189, vivify_155
    new $P189, "Undef"
  vivify_155:
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
    unless_null $P190, vivify_156
    $P190 = root_new ['parrot';'Hash']
  vivify_156:
    set $P191, $P190["identifier"]
    unless_null $P191, vivify_157
    new $P191, "Undef"
  vivify_157:
    set $S192, $P191
    new $P193, 'String'
    set $P193, $S192
    concat $P194, $P193, ":"
    find_lex $P195, "$/"
    unless_null $P195, vivify_158
    $P195 = root_new ['parrot';'Hash']
  vivify_158:
    set $P196, $P195["colonpair"]
    unless_null $P196, vivify_159
    $P196 = root_new ['parrot';'ResizablePMCArray']
  vivify_159:
    set $P197, $P196[0]
    unless_null $P197, vivify_160
    new $P197, "Undef"
  vivify_160:
    $P198 = $P197."ast"()
    $S199 = $P198."named"()
    concat $P200, $P194, $S199
    concat $P201, $P200, "<"
.annotate 'line', 38
    find_lex $P202, "$/"
    unless_null $P202, vivify_161
    $P202 = root_new ['parrot';'Hash']
  vivify_161:
    set $P203, $P202["colonpair"]
    unless_null $P203, vivify_162
    $P203 = root_new ['parrot';'ResizablePMCArray']
  vivify_162:
    set $P204, $P203[0]
    unless_null $P204, vivify_163
    new $P204, "Undef"
  vivify_163:
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
.sub "comp_unit"  :subid("22_1274564782.90592") :method :outer("11_1274564782.90592")
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
    .lex "$mainline", $P218
.annotate 'line', 51
    new $P219, "Undef"
    .lex "$unit", $P219
.annotate 'line', 50
    find_lex $P220, "$/"
    unless_null $P220, vivify_164
    $P220 = root_new ['parrot';'Hash']
  vivify_164:
    set $P221, $P220["statementlist"]
    unless_null $P221, vivify_165
    new $P221, "Undef"
  vivify_165:
    $P222 = $P221."ast"()
    store_lex "$mainline", $P222
.annotate 'line', 51
    get_global $P223, "@BLOCK"
    $P224 = $P223."shift"()
    store_lex "$unit", $P224
.annotate 'line', 56
    find_lex $P225, "$unit"
.annotate 'line', 57
    get_hll_global $P226, ["PAST"], "Op"
    find_lex $P227, "$mainline"
    $P228 = $P226."new"($P227, "return" :named("pirop"))
    $P225."push"($P228)
.annotate 'line', 62
    find_lex $P229, "$unit"
.annotate 'line', 63
    get_hll_global $P230, ["PAST"], "Block"
.annotate 'line', 65
    get_hll_global $P231, ["PAST"], "Op"
    get_hll_global $P232, ["PAST"], "Val"
    find_lex $P233, "$unit"
    $P234 = $P232."new"($P233 :named("value"))
    $P235 = $P231."new"($P234, "call" :named("pasttype"))
    $P236 = $P230."new"($P235, ":load" :named("pirflags"), 0 :named("lexical"), "" :named("namespace"))
.annotate 'line', 63
    $P229."push"($P236)
.annotate 'line', 68
    find_lex $P237, "$unit"
    find_lex $P238, "$/"
    $P237."node"($P238)
.annotate 'line', 69
    find_lex $P239, "$/"
    find_lex $P240, "$unit"
    $P241 = $P239."!make"($P240)
.annotate 'line', 49
    .return ($P241)
  control_215:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P242, exception, "payload"
    .return ($P242)
.end


.namespace ["NQP";"Actions"]
.sub "statementlist"  :subid("23_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_246
.annotate 'line', 72
    .const 'Sub' $P260 = "24_1274564782.90592" 
    capture_lex $P260
    new $P245, 'ExceptionHandler'
    set_addr $P245, control_244
    $P245."handle_types"(57)
    push_eh $P245
    .lex "self", self
    .lex "$/", param_246
.annotate 'line', 73
    new $P247, "Undef"
    .lex "$past", $P247
    get_hll_global $P248, ["PAST"], "Stmts"
    find_lex $P249, "$/"
    $P250 = $P248."new"($P249 :named("node"))
    store_lex "$past", $P250
.annotate 'line', 74
    find_lex $P252, "$/"
    unless_null $P252, vivify_166
    $P252 = root_new ['parrot';'Hash']
  vivify_166:
    set $P253, $P252["statement"]
    unless_null $P253, vivify_167
    new $P253, "Undef"
  vivify_167:
    unless $P253, if_251_end
.annotate 'line', 75
    find_lex $P255, "$/"
    unless_null $P255, vivify_168
    $P255 = root_new ['parrot';'Hash']
  vivify_168:
    set $P256, $P255["statement"]
    unless_null $P256, vivify_169
    new $P256, "Undef"
  vivify_169:
    defined $I257, $P256
    unless $I257, for_undef_170
    iter $P254, $P256
    new $P280, 'ExceptionHandler'
    set_addr $P280, loop279_handler
    $P280."handle_types"(64, 66, 65)
    push_eh $P280
  loop279_test:
    unless $P254, loop279_done
    shift $P258, $P254
  loop279_redo:
    .const 'Sub' $P260 = "24_1274564782.90592" 
    capture_lex $P260
    $P260($P258)
  loop279_next:
    goto loop279_test
  loop279_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P281, exception, 'type'
    eq $P281, 64, loop279_next
    eq $P281, 66, loop279_redo
  loop279_done:
    pop_eh 
  for_undef_170:
  if_251_end:
.annotate 'line', 82
    find_lex $P282, "$/"
    find_lex $P283, "$past"
    $P284 = $P282."!make"($P283)
.annotate 'line', 72
    .return ($P284)
  control_244:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P285, exception, "payload"
    .return ($P285)
.end


.namespace ["NQP";"Actions"]
.sub "_block259"  :anon :subid("24_1274564782.90592") :outer("23_1274564782.90592")
    .param pmc param_262
.annotate 'line', 76
    new $P261, "Undef"
    .lex "$ast", $P261
    .lex "$_", param_262
    find_lex $P263, "$_"
    $P264 = $P263."ast"()
    store_lex "$ast", $P264
.annotate 'line', 77
    find_lex $P266, "$ast"
    unless_null $P266, vivify_171
    $P266 = root_new ['parrot';'Hash']
  vivify_171:
    set $P267, $P266["sink"]
    unless_null $P267, vivify_172
    new $P267, "Undef"
  vivify_172:
    defined $I268, $P267
    unless $I268, if_265_end
    find_lex $P269, "$ast"
    unless_null $P269, vivify_173
    $P269 = root_new ['parrot';'Hash']
  vivify_173:
    set $P270, $P269["sink"]
    unless_null $P270, vivify_174
    new $P270, "Undef"
  vivify_174:
    store_lex "$ast", $P270
  if_265_end:
.annotate 'line', 78
    find_lex $P272, "$ast"
    unless_null $P272, vivify_175
    $P272 = root_new ['parrot';'Hash']
  vivify_175:
    set $P273, $P272["bareblock"]
    unless_null $P273, vivify_176
    new $P273, "Undef"
  vivify_176:
    unless $P273, if_271_end
    find_lex $P274, "$ast"
    $P275 = "block_immediate"($P274)
    store_lex "$ast", $P275
  if_271_end:
.annotate 'line', 79
    find_lex $P276, "$past"
    find_lex $P277, "$ast"
    $P278 = $P276."push"($P277)
.annotate 'line', 75
    .return ($P278)
.end


.namespace ["NQP";"Actions"]
.sub "statement"  :subid("25_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_289
    .param pmc param_290 :optional
    .param int has_param_290 :opt_flag
.annotate 'line', 85
    .const 'Sub' $P298 = "26_1274564782.90592" 
    capture_lex $P298
    new $P288, 'ExceptionHandler'
    set_addr $P288, control_287
    $P288."handle_types"(57)
    push_eh $P288
    .lex "self", self
    .lex "$/", param_289
    if has_param_290, optparam_177
    new $P291, "Undef"
    set param_290, $P291
  optparam_177:
    .lex "$key", param_290
.annotate 'line', 86
    new $P292, "Undef"
    .lex "$past", $P292
.annotate 'line', 85
    find_lex $P293, "$past"
.annotate 'line', 87
    find_lex $P295, "$/"
    unless_null $P295, vivify_178
    $P295 = root_new ['parrot';'Hash']
  vivify_178:
    set $P296, $P295["EXPR"]
    unless_null $P296, vivify_179
    new $P296, "Undef"
  vivify_179:
    if $P296, if_294
.annotate 'line', 98
    find_lex $P336, "$/"
    unless_null $P336, vivify_180
    $P336 = root_new ['parrot';'Hash']
  vivify_180:
    set $P337, $P336["statement_control"]
    unless_null $P337, vivify_181
    new $P337, "Undef"
  vivify_181:
    if $P337, if_335
.annotate 'line', 99
    new $P341, "Integer"
    assign $P341, 0
    store_lex "$past", $P341
    goto if_335_end
  if_335:
.annotate 'line', 98
    find_lex $P338, "$/"
    unless_null $P338, vivify_182
    $P338 = root_new ['parrot';'Hash']
  vivify_182:
    set $P339, $P338["statement_control"]
    unless_null $P339, vivify_183
    new $P339, "Undef"
  vivify_183:
    $P340 = $P339."ast"()
    store_lex "$past", $P340
  if_335_end:
    goto if_294_end
  if_294:
.annotate 'line', 87
    .const 'Sub' $P298 = "26_1274564782.90592" 
    capture_lex $P298
    $P298()
  if_294_end:
.annotate 'line', 100
    find_lex $P342, "$/"
    find_lex $P343, "$past"
    $P344 = $P342."!make"($P343)
.annotate 'line', 85
    .return ($P344)
  control_287:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P345, exception, "payload"
    .return ($P345)
.end


.namespace ["NQP";"Actions"]
.sub "_block297"  :anon :subid("26_1274564782.90592") :outer("25_1274564782.90592")
.annotate 'line', 88
    new $P299, "Undef"
    .lex "$mc", $P299
.annotate 'line', 89
    new $P300, "Undef"
    .lex "$ml", $P300
.annotate 'line', 88
    find_lex $P301, "$/"
    unless_null $P301, vivify_184
    $P301 = root_new ['parrot';'Hash']
  vivify_184:
    set $P302, $P301["statement_mod_cond"]
    unless_null $P302, vivify_185
    $P302 = root_new ['parrot';'ResizablePMCArray']
  vivify_185:
    set $P303, $P302[0]
    unless_null $P303, vivify_186
    new $P303, "Undef"
  vivify_186:
    store_lex "$mc", $P303
.annotate 'line', 89
    find_lex $P304, "$/"
    unless_null $P304, vivify_187
    $P304 = root_new ['parrot';'Hash']
  vivify_187:
    set $P305, $P304["statement_mod_loop"]
    unless_null $P305, vivify_188
    $P305 = root_new ['parrot';'ResizablePMCArray']
  vivify_188:
    set $P306, $P305[0]
    unless_null $P306, vivify_189
    new $P306, "Undef"
  vivify_189:
    store_lex "$ml", $P306
.annotate 'line', 90
    find_lex $P307, "$/"
    unless_null $P307, vivify_190
    $P307 = root_new ['parrot';'Hash']
  vivify_190:
    set $P308, $P307["EXPR"]
    unless_null $P308, vivify_191
    new $P308, "Undef"
  vivify_191:
    $P309 = $P308."ast"()
    store_lex "$past", $P309
.annotate 'line', 91
    find_lex $P311, "$mc"
    unless $P311, if_310_end
.annotate 'line', 92
    get_hll_global $P312, ["PAST"], "Op"
    find_lex $P313, "$mc"
    unless_null $P313, vivify_192
    $P313 = root_new ['parrot';'Hash']
  vivify_192:
    set $P314, $P313["cond"]
    unless_null $P314, vivify_193
    new $P314, "Undef"
  vivify_193:
    $P315 = $P314."ast"()
    find_lex $P316, "$past"
    find_lex $P317, "$mc"
    unless_null $P317, vivify_194
    $P317 = root_new ['parrot';'Hash']
  vivify_194:
    set $P318, $P317["sym"]
    unless_null $P318, vivify_195
    new $P318, "Undef"
  vivify_195:
    set $S319, $P318
    find_lex $P320, "$/"
    $P321 = $P312."new"($P315, $P316, $S319 :named("pasttype"), $P320 :named("node"))
    store_lex "$past", $P321
  if_310_end:
.annotate 'line', 94
    find_lex $P324, "$ml"
    if $P324, if_323
    set $P322, $P324
    goto if_323_end
  if_323:
.annotate 'line', 95
    get_hll_global $P325, ["PAST"], "Op"
    find_lex $P326, "$ml"
    unless_null $P326, vivify_196
    $P326 = root_new ['parrot';'Hash']
  vivify_196:
    set $P327, $P326["cond"]
    unless_null $P327, vivify_197
    new $P327, "Undef"
  vivify_197:
    $P328 = $P327."ast"()
    find_lex $P329, "$past"
    find_lex $P330, "$ml"
    unless_null $P330, vivify_198
    $P330 = root_new ['parrot';'Hash']
  vivify_198:
    set $P331, $P330["sym"]
    unless_null $P331, vivify_199
    new $P331, "Undef"
  vivify_199:
    set $S332, $P331
    find_lex $P333, "$/"
    $P334 = $P325."new"($P328, $P329, $S332 :named("pasttype"), $P333 :named("node"))
    store_lex "$past", $P334
.annotate 'line', 94
    set $P322, $P334
  if_323_end:
.annotate 'line', 87
    .return ($P322)
.end


.namespace ["NQP";"Actions"]
.sub "xblock"  :subid("27_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_349
.annotate 'line', 103
    new $P348, 'ExceptionHandler'
    set_addr $P348, control_347
    $P348."handle_types"(57)
    push_eh $P348
    .lex "self", self
    .lex "$/", param_349
.annotate 'line', 104
    find_lex $P350, "$/"
    get_hll_global $P351, ["PAST"], "Op"
    find_lex $P352, "$/"
    unless_null $P352, vivify_200
    $P352 = root_new ['parrot';'Hash']
  vivify_200:
    set $P353, $P352["EXPR"]
    unless_null $P353, vivify_201
    new $P353, "Undef"
  vivify_201:
    $P354 = $P353."ast"()
    find_lex $P355, "$/"
    unless_null $P355, vivify_202
    $P355 = root_new ['parrot';'Hash']
  vivify_202:
    set $P356, $P355["pblock"]
    unless_null $P356, vivify_203
    new $P356, "Undef"
  vivify_203:
    $P357 = $P356."ast"()
    find_lex $P358, "$/"
    $P359 = $P351."new"($P354, $P357, "if" :named("pasttype"), $P358 :named("node"))
    $P360 = $P350."!make"($P359)
.annotate 'line', 103
    .return ($P360)
  control_347:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P361, exception, "payload"
    .return ($P361)
.end


.namespace ["NQP";"Actions"]
.sub "pblock"  :subid("28_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_365
.annotate 'line', 107
    new $P364, 'ExceptionHandler'
    set_addr $P364, control_363
    $P364."handle_types"(57)
    push_eh $P364
    .lex "self", self
    .lex "$/", param_365
.annotate 'line', 108
    find_lex $P366, "$/"
    find_lex $P367, "$/"
    unless_null $P367, vivify_204
    $P367 = root_new ['parrot';'Hash']
  vivify_204:
    set $P368, $P367["blockoid"]
    unless_null $P368, vivify_205
    new $P368, "Undef"
  vivify_205:
    $P369 = $P368."ast"()
    $P370 = $P366."!make"($P369)
.annotate 'line', 107
    .return ($P370)
  control_363:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P371, exception, "payload"
    .return ($P371)
.end


.namespace ["NQP";"Actions"]
.sub "block"  :subid("29_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_375
.annotate 'line', 111
    new $P374, 'ExceptionHandler'
    set_addr $P374, control_373
    $P374."handle_types"(57)
    push_eh $P374
    .lex "self", self
    .lex "$/", param_375
.annotate 'line', 112
    find_lex $P376, "$/"
    find_lex $P377, "$/"
    unless_null $P377, vivify_206
    $P377 = root_new ['parrot';'Hash']
  vivify_206:
    set $P378, $P377["blockoid"]
    unless_null $P378, vivify_207
    new $P378, "Undef"
  vivify_207:
    $P379 = $P378."ast"()
    $P380 = $P376."!make"($P379)
.annotate 'line', 111
    .return ($P380)
  control_373:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P381, exception, "payload"
    .return ($P381)
.end


.namespace ["NQP";"Actions"]
.sub "blockoid"  :subid("30_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_385
.annotate 'line', 115
    new $P384, 'ExceptionHandler'
    set_addr $P384, control_383
    $P384."handle_types"(57)
    push_eh $P384
    .lex "self", self
    .lex "$/", param_385
.annotate 'line', 116
    new $P386, "Undef"
    .lex "$past", $P386
.annotate 'line', 117
    new $P387, "Undef"
    .lex "$BLOCK", $P387
.annotate 'line', 116
    find_lex $P388, "$/"
    unless_null $P388, vivify_208
    $P388 = root_new ['parrot';'Hash']
  vivify_208:
    set $P389, $P388["statementlist"]
    unless_null $P389, vivify_209
    new $P389, "Undef"
  vivify_209:
    $P390 = $P389."ast"()
    store_lex "$past", $P390
.annotate 'line', 117
    get_global $P391, "@BLOCK"
    $P392 = $P391."shift"()
    store_lex "$BLOCK", $P392
.annotate 'line', 118
    find_lex $P393, "$BLOCK"
    find_lex $P394, "$past"
    $P393."push"($P394)
.annotate 'line', 119
    find_lex $P395, "$BLOCK"
    find_lex $P396, "$/"
    $P395."node"($P396)
.annotate 'line', 120
    find_lex $P397, "$BLOCK"
    $P397."closure"(1)
.annotate 'line', 121
    find_lex $P398, "$/"
    find_lex $P399, "$BLOCK"
    $P400 = $P398."!make"($P399)
.annotate 'line', 115
    .return ($P400)
  control_383:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P401, exception, "payload"
    .return ($P401)
.end


.namespace ["NQP";"Actions"]
.sub "newpad"  :subid("31_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_405
.annotate 'line', 124
    new $P404, 'ExceptionHandler'
    set_addr $P404, control_403
    $P404."handle_types"(57)
    push_eh $P404
    .lex "self", self
    .lex "$/", param_405
.annotate 'line', 125
    get_global $P406, "@BLOCK"
    unless_null $P406, vivify_210
    $P406 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P406
  vivify_210:
.annotate 'line', 124
    get_global $P407, "@BLOCK"
.annotate 'line', 126
    get_global $P408, "@BLOCK"
    get_hll_global $P409, ["PAST"], "Block"
    get_hll_global $P410, ["PAST"], "Stmts"
    $P411 = $P410."new"()
    $P412 = $P409."new"($P411)
    $P413 = $P408."unshift"($P412)
.annotate 'line', 124
    .return ($P413)
  control_403:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P414, exception, "payload"
    .return ($P414)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<if>"  :subid("32_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_418
.annotate 'line', 131
    .const 'Sub' $P446 = "33_1274564782.90592" 
    capture_lex $P446
    new $P417, 'ExceptionHandler'
    set_addr $P417, control_416
    $P417."handle_types"(57)
    push_eh $P417
    .lex "self", self
    .lex "$/", param_418
.annotate 'line', 132
    new $P419, "Undef"
    .lex "$count", $P419
.annotate 'line', 133
    new $P420, "Undef"
    .lex "$past", $P420
.annotate 'line', 132
    find_lex $P421, "$/"
    unless_null $P421, vivify_211
    $P421 = root_new ['parrot';'Hash']
  vivify_211:
    set $P422, $P421["xblock"]
    unless_null $P422, vivify_212
    new $P422, "Undef"
  vivify_212:
    set $N423, $P422
    new $P424, 'Float'
    set $P424, $N423
    sub $P425, $P424, 1
    store_lex "$count", $P425
.annotate 'line', 133
    find_lex $P426, "$count"
    set $I427, $P426
    find_lex $P428, "$/"
    unless_null $P428, vivify_213
    $P428 = root_new ['parrot';'Hash']
  vivify_213:
    set $P429, $P428["xblock"]
    unless_null $P429, vivify_214
    $P429 = root_new ['parrot';'ResizablePMCArray']
  vivify_214:
    set $P430, $P429[$I427]
    unless_null $P430, vivify_215
    new $P430, "Undef"
  vivify_215:
    $P431 = $P430."ast"()
    $P432 = "xblock_immediate"($P431)
    store_lex "$past", $P432
.annotate 'line', 134
    find_lex $P434, "$/"
    unless_null $P434, vivify_216
    $P434 = root_new ['parrot';'Hash']
  vivify_216:
    set $P435, $P434["else"]
    unless_null $P435, vivify_217
    new $P435, "Undef"
  vivify_217:
    unless $P435, if_433_end
.annotate 'line', 135
    find_lex $P436, "$past"
    find_lex $P437, "$/"
    unless_null $P437, vivify_218
    $P437 = root_new ['parrot';'Hash']
  vivify_218:
    set $P438, $P437["else"]
    unless_null $P438, vivify_219
    $P438 = root_new ['parrot';'ResizablePMCArray']
  vivify_219:
    set $P439, $P438[0]
    unless_null $P439, vivify_220
    new $P439, "Undef"
  vivify_220:
    $P440 = $P439."ast"()
    $P441 = "block_immediate"($P440)
    $P436."push"($P441)
  if_433_end:
.annotate 'line', 138
    new $P462, 'ExceptionHandler'
    set_addr $P462, loop461_handler
    $P462."handle_types"(64, 66, 65)
    push_eh $P462
  loop461_test:
    find_lex $P442, "$count"
    set $N443, $P442
    isgt $I444, $N443, 0.0
    unless $I444, loop461_done
  loop461_redo:
    .const 'Sub' $P446 = "33_1274564782.90592" 
    capture_lex $P446
    $P446()
  loop461_next:
    goto loop461_test
  loop461_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P463, exception, 'type'
    eq $P463, 64, loop461_next
    eq $P463, 66, loop461_redo
  loop461_done:
    pop_eh 
.annotate 'line', 144
    find_lex $P464, "$/"
    find_lex $P465, "$past"
    $P466 = $P464."!make"($P465)
.annotate 'line', 131
    .return ($P466)
  control_416:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P467, exception, "payload"
    .return ($P467)
.end


.namespace ["NQP";"Actions"]
.sub "_block445"  :anon :subid("33_1274564782.90592") :outer("32_1274564782.90592")
.annotate 'line', 140
    new $P447, "Undef"
    .lex "$else", $P447
.annotate 'line', 138
    find_lex $P448, "$count"
    clone $P449, $P448
    dec $P448
.annotate 'line', 140
    find_lex $P450, "$past"
    store_lex "$else", $P450
.annotate 'line', 141
    find_lex $P451, "$count"
    set $I452, $P451
    find_lex $P453, "$/"
    unless_null $P453, vivify_221
    $P453 = root_new ['parrot';'Hash']
  vivify_221:
    set $P454, $P453["xblock"]
    unless_null $P454, vivify_222
    $P454 = root_new ['parrot';'ResizablePMCArray']
  vivify_222:
    set $P455, $P454[$I452]
    unless_null $P455, vivify_223
    new $P455, "Undef"
  vivify_223:
    $P456 = $P455."ast"()
    $P457 = "xblock_immediate"($P456)
    store_lex "$past", $P457
.annotate 'line', 142
    find_lex $P458, "$past"
    find_lex $P459, "$else"
    $P460 = $P458."push"($P459)
.annotate 'line', 138
    .return ($P460)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<unless>"  :subid("34_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_471
.annotate 'line', 147
    new $P470, 'ExceptionHandler'
    set_addr $P470, control_469
    $P470."handle_types"(57)
    push_eh $P470
    .lex "self", self
    .lex "$/", param_471
.annotate 'line', 148
    new $P472, "Undef"
    .lex "$past", $P472
    find_lex $P473, "$/"
    unless_null $P473, vivify_224
    $P473 = root_new ['parrot';'Hash']
  vivify_224:
    set $P474, $P473["xblock"]
    unless_null $P474, vivify_225
    new $P474, "Undef"
  vivify_225:
    $P475 = $P474."ast"()
    $P476 = "xblock_immediate"($P475)
    store_lex "$past", $P476
.annotate 'line', 149
    find_lex $P477, "$past"
    $P477."pasttype"("unless")
.annotate 'line', 150
    find_lex $P478, "$/"
    find_lex $P479, "$past"
    $P480 = $P478."!make"($P479)
.annotate 'line', 147
    .return ($P480)
  control_469:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P481, exception, "payload"
    .return ($P481)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<while>"  :subid("35_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_485
.annotate 'line', 153
    new $P484, 'ExceptionHandler'
    set_addr $P484, control_483
    $P484."handle_types"(57)
    push_eh $P484
    .lex "self", self
    .lex "$/", param_485
.annotate 'line', 154
    new $P486, "Undef"
    .lex "$past", $P486
    find_lex $P487, "$/"
    unless_null $P487, vivify_226
    $P487 = root_new ['parrot';'Hash']
  vivify_226:
    set $P488, $P487["xblock"]
    unless_null $P488, vivify_227
    new $P488, "Undef"
  vivify_227:
    $P489 = $P488."ast"()
    $P490 = "xblock_immediate"($P489)
    store_lex "$past", $P490
.annotate 'line', 155
    find_lex $P491, "$past"
    find_lex $P492, "$/"
    unless_null $P492, vivify_228
    $P492 = root_new ['parrot';'Hash']
  vivify_228:
    set $P493, $P492["sym"]
    unless_null $P493, vivify_229
    new $P493, "Undef"
  vivify_229:
    set $S494, $P493
    $P491."pasttype"($S494)
.annotate 'line', 156
    find_lex $P495, "$/"
    find_lex $P496, "$past"
    $P497 = $P495."!make"($P496)
.annotate 'line', 153
    .return ($P497)
  control_483:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P498, exception, "payload"
    .return ($P498)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<repeat>"  :subid("36_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_502
.annotate 'line', 159
    new $P501, 'ExceptionHandler'
    set_addr $P501, control_500
    $P501."handle_types"(57)
    push_eh $P501
    .lex "self", self
    .lex "$/", param_502
.annotate 'line', 160
    new $P503, "Undef"
    .lex "$pasttype", $P503
.annotate 'line', 161
    new $P504, "Undef"
    .lex "$past", $P504
.annotate 'line', 160
    new $P505, "String"
    assign $P505, "repeat_"
    find_lex $P506, "$/"
    unless_null $P506, vivify_230
    $P506 = root_new ['parrot';'Hash']
  vivify_230:
    set $P507, $P506["wu"]
    unless_null $P507, vivify_231
    new $P507, "Undef"
  vivify_231:
    set $S508, $P507
    concat $P509, $P505, $S508
    store_lex "$pasttype", $P509
    find_lex $P510, "$past"
.annotate 'line', 162
    find_lex $P512, "$/"
    unless_null $P512, vivify_232
    $P512 = root_new ['parrot';'Hash']
  vivify_232:
    set $P513, $P512["xblock"]
    unless_null $P513, vivify_233
    new $P513, "Undef"
  vivify_233:
    if $P513, if_511
.annotate 'line', 167
    get_hll_global $P520, ["PAST"], "Op"
    find_lex $P521, "$/"
    unless_null $P521, vivify_234
    $P521 = root_new ['parrot';'Hash']
  vivify_234:
    set $P522, $P521["EXPR"]
    unless_null $P522, vivify_235
    new $P522, "Undef"
  vivify_235:
    $P523 = $P522."ast"()
    find_lex $P524, "$/"
    unless_null $P524, vivify_236
    $P524 = root_new ['parrot';'Hash']
  vivify_236:
    set $P525, $P524["pblock"]
    unless_null $P525, vivify_237
    new $P525, "Undef"
  vivify_237:
    $P526 = $P525."ast"()
    $P527 = "block_immediate"($P526)
    find_lex $P528, "$pasttype"
    find_lex $P529, "$/"
    $P530 = $P520."new"($P523, $P527, $P528 :named("pasttype"), $P529 :named("node"))
    store_lex "$past", $P530
.annotate 'line', 166
    goto if_511_end
  if_511:
.annotate 'line', 163
    find_lex $P514, "$/"
    unless_null $P514, vivify_238
    $P514 = root_new ['parrot';'Hash']
  vivify_238:
    set $P515, $P514["xblock"]
    unless_null $P515, vivify_239
    new $P515, "Undef"
  vivify_239:
    $P516 = $P515."ast"()
    $P517 = "xblock_immediate"($P516)
    store_lex "$past", $P517
.annotate 'line', 164
    find_lex $P518, "$past"
    find_lex $P519, "$pasttype"
    $P518."pasttype"($P519)
  if_511_end:
.annotate 'line', 170
    find_lex $P531, "$/"
    find_lex $P532, "$past"
    $P533 = $P531."!make"($P532)
.annotate 'line', 159
    .return ($P533)
  control_500:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P534, exception, "payload"
    .return ($P534)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<for>"  :subid("37_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_538
.annotate 'line', 173
    new $P537, 'ExceptionHandler'
    set_addr $P537, control_536
    $P537."handle_types"(57)
    push_eh $P537
    .lex "self", self
    .lex "$/", param_538
.annotate 'line', 174
    new $P539, "Undef"
    .lex "$past", $P539
.annotate 'line', 176
    new $P540, "Undef"
    .lex "$block", $P540
.annotate 'line', 174
    find_lex $P541, "$/"
    unless_null $P541, vivify_240
    $P541 = root_new ['parrot';'Hash']
  vivify_240:
    set $P542, $P541["xblock"]
    unless_null $P542, vivify_241
    new $P542, "Undef"
  vivify_241:
    $P543 = $P542."ast"()
    store_lex "$past", $P543
.annotate 'line', 175
    find_lex $P544, "$past"
    $P544."pasttype"("for")
.annotate 'line', 176
    find_lex $P545, "$past"
    unless_null $P545, vivify_242
    $P545 = root_new ['parrot';'ResizablePMCArray']
  vivify_242:
    set $P546, $P545[1]
    unless_null $P546, vivify_243
    new $P546, "Undef"
  vivify_243:
    store_lex "$block", $P546
.annotate 'line', 177
    find_lex $P548, "$block"
    $P549 = $P548."arity"()
    if $P549, unless_547_end
.annotate 'line', 178
    find_lex $P550, "$block"
    unless_null $P550, vivify_244
    $P550 = root_new ['parrot';'ResizablePMCArray']
  vivify_244:
    set $P551, $P550[0]
    unless_null $P551, vivify_245
    new $P551, "Undef"
  vivify_245:
    get_hll_global $P552, ["PAST"], "Var"
    $P553 = $P552."new"("$_" :named("name"), "parameter" :named("scope"))
    $P551."push"($P553)
.annotate 'line', 179
    find_lex $P554, "$block"
    $P554."symbol"("$_", "lexical" :named("scope"))
.annotate 'line', 180
    find_lex $P555, "$block"
    $P555."arity"(1)
  unless_547_end:
.annotate 'line', 182
    find_lex $P556, "$block"
    $P556."blocktype"("immediate")
.annotate 'line', 183
    find_lex $P557, "$/"
    find_lex $P558, "$past"
    $P559 = $P557."!make"($P558)
.annotate 'line', 173
    .return ($P559)
  control_536:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P560, exception, "payload"
    .return ($P560)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<return>"  :subid("38_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_564
.annotate 'line', 186
    new $P563, 'ExceptionHandler'
    set_addr $P563, control_562
    $P563."handle_types"(57)
    push_eh $P563
    .lex "self", self
    .lex "$/", param_564
.annotate 'line', 187
    find_lex $P565, "$/"
    get_hll_global $P566, ["PAST"], "Op"
    find_lex $P567, "$/"
    unless_null $P567, vivify_246
    $P567 = root_new ['parrot';'Hash']
  vivify_246:
    set $P568, $P567["EXPR"]
    unless_null $P568, vivify_247
    new $P568, "Undef"
  vivify_247:
    $P569 = $P568."ast"()
    find_lex $P570, "$/"
    $P571 = $P566."new"($P569, "return" :named("pasttype"), $P570 :named("node"))
    $P572 = $P565."!make"($P571)
.annotate 'line', 186
    .return ($P572)
  control_562:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P573, exception, "payload"
    .return ($P573)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<CATCH>"  :subid("39_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_577
.annotate 'line', 190
    new $P576, 'ExceptionHandler'
    set_addr $P576, control_575
    $P576."handle_types"(57)
    push_eh $P576
    .lex "self", self
    .lex "$/", param_577
.annotate 'line', 191
    new $P578, "Undef"
    .lex "$block", $P578
    find_lex $P579, "$/"
    unless_null $P579, vivify_248
    $P579 = root_new ['parrot';'Hash']
  vivify_248:
    set $P580, $P579["block"]
    unless_null $P580, vivify_249
    new $P580, "Undef"
  vivify_249:
    $P581 = $P580."ast"()
    store_lex "$block", $P581
.annotate 'line', 192
    find_lex $P582, "$/"
    find_lex $P583, "$block"
    "push_block_handler"($P582, $P583)
.annotate 'line', 193
    get_global $P584, "@BLOCK"
    unless_null $P584, vivify_250
    $P584 = root_new ['parrot';'ResizablePMCArray']
  vivify_250:
    set $P585, $P584[0]
    unless_null $P585, vivify_251
    new $P585, "Undef"
  vivify_251:
    $P586 = $P585."handlers"()
    set $P587, $P586[0]
    unless_null $P587, vivify_252
    new $P587, "Undef"
  vivify_252:
    $P587."handle_types_except"("CONTROL")
.annotate 'line', 194
    find_lex $P588, "$/"
    get_hll_global $P589, ["PAST"], "Stmts"
    find_lex $P590, "$/"
    $P591 = $P589."new"($P590 :named("node"))
    $P592 = $P588."!make"($P591)
.annotate 'line', 190
    .return ($P592)
  control_575:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P593, exception, "payload"
    .return ($P593)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<CONTROL>"  :subid("40_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_597
.annotate 'line', 197
    new $P596, 'ExceptionHandler'
    set_addr $P596, control_595
    $P596."handle_types"(57)
    push_eh $P596
    .lex "self", self
    .lex "$/", param_597
.annotate 'line', 198
    new $P598, "Undef"
    .lex "$block", $P598
    find_lex $P599, "$/"
    unless_null $P599, vivify_253
    $P599 = root_new ['parrot';'Hash']
  vivify_253:
    set $P600, $P599["block"]
    unless_null $P600, vivify_254
    new $P600, "Undef"
  vivify_254:
    $P601 = $P600."ast"()
    store_lex "$block", $P601
.annotate 'line', 199
    find_lex $P602, "$/"
    find_lex $P603, "$block"
    "push_block_handler"($P602, $P603)
.annotate 'line', 200
    get_global $P604, "@BLOCK"
    unless_null $P604, vivify_255
    $P604 = root_new ['parrot';'ResizablePMCArray']
  vivify_255:
    set $P605, $P604[0]
    unless_null $P605, vivify_256
    new $P605, "Undef"
  vivify_256:
    $P606 = $P605."handlers"()
    set $P607, $P606[0]
    unless_null $P607, vivify_257
    new $P607, "Undef"
  vivify_257:
    $P607."handle_types"("CONTROL")
.annotate 'line', 201
    find_lex $P608, "$/"
    get_hll_global $P609, ["PAST"], "Stmts"
    find_lex $P610, "$/"
    $P611 = $P609."new"($P610 :named("node"))
    $P612 = $P608."!make"($P611)
.annotate 'line', 197
    .return ($P612)
  control_595:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P613, exception, "payload"
    .return ($P613)
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<INIT>"  :subid("41_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_618
.annotate 'line', 241
    new $P617, 'ExceptionHandler'
    set_addr $P617, control_616
    $P617."handle_types"(57)
    push_eh $P617
    .lex "self", self
    .lex "$/", param_618
.annotate 'line', 242
    get_global $P619, "@BLOCK"
    unless_null $P619, vivify_258
    $P619 = root_new ['parrot';'ResizablePMCArray']
  vivify_258:
    set $P620, $P619[0]
    unless_null $P620, vivify_259
    new $P620, "Undef"
  vivify_259:
    $P621 = $P620."loadinit"()
    find_lex $P622, "$/"
    unless_null $P622, vivify_260
    $P622 = root_new ['parrot';'Hash']
  vivify_260:
    set $P623, $P622["blorst"]
    unless_null $P623, vivify_261
    new $P623, "Undef"
  vivify_261:
    $P624 = $P623."ast"()
    $P621."push"($P624)
.annotate 'line', 243
    find_lex $P625, "$/"
    get_hll_global $P626, ["PAST"], "Stmts"
    find_lex $P627, "$/"
    $P628 = $P626."new"($P627 :named("node"))
    $P629 = $P625."!make"($P628)
.annotate 'line', 241
    .return ($P629)
  control_616:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P630, exception, "payload"
    .return ($P630)
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<try>"  :subid("42_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_634
.annotate 'line', 246
    new $P633, 'ExceptionHandler'
    set_addr $P633, control_632
    $P633."handle_types"(57)
    push_eh $P633
    .lex "self", self
    .lex "$/", param_634
.annotate 'line', 247
    new $P635, "Undef"
    .lex "$past", $P635
    find_lex $P636, "$/"
    unless_null $P636, vivify_262
    $P636 = root_new ['parrot';'Hash']
  vivify_262:
    set $P637, $P636["blorst"]
    unless_null $P637, vivify_263
    new $P637, "Undef"
  vivify_263:
    $P638 = $P637."ast"()
    store_lex "$past", $P638
.annotate 'line', 248
    find_lex $P640, "$past"
    $S641 = $P640."WHAT"()
    isne $I642, $S641, "PAST::Block()"
    unless $I642, if_639_end
.annotate 'line', 249
    get_hll_global $P643, ["PAST"], "Block"
    find_lex $P644, "$past"
    find_lex $P645, "$/"
    $P646 = $P643."new"($P644, "immediate" :named("blocktype"), $P645 :named("node"))
    store_lex "$past", $P646
  if_639_end:
.annotate 'line', 251
    find_lex $P648, "$past"
    $P649 = $P648."handlers"()
    if $P649, unless_647_end
.annotate 'line', 252
    find_lex $P650, "$past"
    get_hll_global $P651, ["PAST"], "Control"
.annotate 'line', 254
    get_hll_global $P652, ["PAST"], "Stmts"
.annotate 'line', 255
    get_hll_global $P653, ["PAST"], "Op"
.annotate 'line', 256
    get_hll_global $P654, ["PAST"], "Var"
.annotate 'line', 257
    get_hll_global $P655, ["PAST"], "Var"
    $P656 = $P655."new"("register" :named("scope"), "exception" :named("name"))
    $P657 = $P654."new"($P656, "handled", "keyed" :named("scope"))
.annotate 'line', 256
    $P658 = $P653."new"($P657, 1, "bind" :named("pasttype"))
.annotate 'line', 255
    $P659 = $P652."new"($P658)
.annotate 'line', 254
    $P660 = $P651."new"($P659, "CONTROL" :named("handle_types_except"))
.annotate 'line', 252
    new $P661, "ResizablePMCArray"
    push $P661, $P660
    $P650."handlers"($P661)
  unless_647_end:
.annotate 'line', 266
    find_lex $P662, "$/"
    find_lex $P663, "$past"
    $P664 = $P662."!make"($P663)
.annotate 'line', 246
    .return ($P664)
  control_632:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P665, exception, "payload"
    .return ($P665)
.end


.namespace ["NQP";"Actions"]
.sub "blorst"  :subid("43_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_669
.annotate 'line', 269
    new $P668, 'ExceptionHandler'
    set_addr $P668, control_667
    $P668."handle_types"(57)
    push_eh $P668
    .lex "self", self
    .lex "$/", param_669
.annotate 'line', 270
    find_lex $P670, "$/"
.annotate 'line', 271
    find_lex $P673, "$/"
    unless_null $P673, vivify_264
    $P673 = root_new ['parrot';'Hash']
  vivify_264:
    set $P674, $P673["block"]
    unless_null $P674, vivify_265
    new $P674, "Undef"
  vivify_265:
    if $P674, if_672
.annotate 'line', 272
    find_lex $P679, "$/"
    unless_null $P679, vivify_266
    $P679 = root_new ['parrot';'Hash']
  vivify_266:
    set $P680, $P679["statement"]
    unless_null $P680, vivify_267
    new $P680, "Undef"
  vivify_267:
    $P681 = $P680."ast"()
    set $P671, $P681
.annotate 'line', 271
    goto if_672_end
  if_672:
    find_lex $P675, "$/"
    unless_null $P675, vivify_268
    $P675 = root_new ['parrot';'Hash']
  vivify_268:
    set $P676, $P675["block"]
    unless_null $P676, vivify_269
    new $P676, "Undef"
  vivify_269:
    $P677 = $P676."ast"()
    $P678 = "block_immediate"($P677)
    set $P671, $P678
  if_672_end:
    $P682 = $P670."!make"($P671)
.annotate 'line', 269
    .return ($P682)
  control_667:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P683, exception, "payload"
    .return ($P683)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<if>"  :subid("44_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_687
.annotate 'line', 277
    new $P686, 'ExceptionHandler'
    set_addr $P686, control_685
    $P686."handle_types"(57)
    push_eh $P686
    .lex "self", self
    .lex "$/", param_687
    find_lex $P688, "$/"
    find_lex $P689, "$/"
    unless_null $P689, vivify_270
    $P689 = root_new ['parrot';'Hash']
  vivify_270:
    set $P690, $P689["cond"]
    unless_null $P690, vivify_271
    new $P690, "Undef"
  vivify_271:
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
.sub "statement_mod_cond:sym<unless>"  :subid("45_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_697
.annotate 'line', 278
    new $P696, 'ExceptionHandler'
    set_addr $P696, control_695
    $P696."handle_types"(57)
    push_eh $P696
    .lex "self", self
    .lex "$/", param_697
    find_lex $P698, "$/"
    find_lex $P699, "$/"
    unless_null $P699, vivify_272
    $P699 = root_new ['parrot';'Hash']
  vivify_272:
    set $P700, $P699["cond"]
    unless_null $P700, vivify_273
    new $P700, "Undef"
  vivify_273:
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
.sub "statement_mod_loop:sym<while>"  :subid("46_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_707
.annotate 'line', 280
    new $P706, 'ExceptionHandler'
    set_addr $P706, control_705
    $P706."handle_types"(57)
    push_eh $P706
    .lex "self", self
    .lex "$/", param_707
    find_lex $P708, "$/"
    find_lex $P709, "$/"
    unless_null $P709, vivify_274
    $P709 = root_new ['parrot';'Hash']
  vivify_274:
    set $P710, $P709["cond"]
    unless_null $P710, vivify_275
    new $P710, "Undef"
  vivify_275:
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
.sub "statement_mod_loop:sym<until>"  :subid("47_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_717
.annotate 'line', 281
    new $P716, 'ExceptionHandler'
    set_addr $P716, control_715
    $P716."handle_types"(57)
    push_eh $P716
    .lex "self", self
    .lex "$/", param_717
    find_lex $P718, "$/"
    find_lex $P719, "$/"
    unless_null $P719, vivify_276
    $P719 = root_new ['parrot';'Hash']
  vivify_276:
    set $P720, $P719["cond"]
    unless_null $P720, vivify_277
    new $P720, "Undef"
  vivify_277:
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
.sub "term:sym<fatarrow>"  :subid("48_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_727
.annotate 'line', 285
    new $P726, 'ExceptionHandler'
    set_addr $P726, control_725
    $P726."handle_types"(57)
    push_eh $P726
    .lex "self", self
    .lex "$/", param_727
    find_lex $P728, "$/"
    find_lex $P729, "$/"
    unless_null $P729, vivify_278
    $P729 = root_new ['parrot';'Hash']
  vivify_278:
    set $P730, $P729["fatarrow"]
    unless_null $P730, vivify_279
    new $P730, "Undef"
  vivify_279:
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
.sub "term:sym<colonpair>"  :subid("49_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_737
.annotate 'line', 286
    new $P736, 'ExceptionHandler'
    set_addr $P736, control_735
    $P736."handle_types"(57)
    push_eh $P736
    .lex "self", self
    .lex "$/", param_737
    find_lex $P738, "$/"
    find_lex $P739, "$/"
    unless_null $P739, vivify_280
    $P739 = root_new ['parrot';'Hash']
  vivify_280:
    set $P740, $P739["colonpair"]
    unless_null $P740, vivify_281
    new $P740, "Undef"
  vivify_281:
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
.sub "term:sym<variable>"  :subid("50_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_747
.annotate 'line', 287
    new $P746, 'ExceptionHandler'
    set_addr $P746, control_745
    $P746."handle_types"(57)
    push_eh $P746
    .lex "self", self
    .lex "$/", param_747
    find_lex $P748, "$/"
    find_lex $P749, "$/"
    unless_null $P749, vivify_282
    $P749 = root_new ['parrot';'Hash']
  vivify_282:
    set $P750, $P749["variable"]
    unless_null $P750, vivify_283
    new $P750, "Undef"
  vivify_283:
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
.sub "term:sym<package_declarator>"  :subid("51_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_757
.annotate 'line', 288
    new $P756, 'ExceptionHandler'
    set_addr $P756, control_755
    $P756."handle_types"(57)
    push_eh $P756
    .lex "self", self
    .lex "$/", param_757
    find_lex $P758, "$/"
    find_lex $P759, "$/"
    unless_null $P759, vivify_284
    $P759 = root_new ['parrot';'Hash']
  vivify_284:
    set $P760, $P759["package_declarator"]
    unless_null $P760, vivify_285
    new $P760, "Undef"
  vivify_285:
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
.sub "term:sym<scope_declarator>"  :subid("52_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_767
.annotate 'line', 289
    new $P766, 'ExceptionHandler'
    set_addr $P766, control_765
    $P766."handle_types"(57)
    push_eh $P766
    .lex "self", self
    .lex "$/", param_767
    find_lex $P768, "$/"
    find_lex $P769, "$/"
    unless_null $P769, vivify_286
    $P769 = root_new ['parrot';'Hash']
  vivify_286:
    set $P770, $P769["scope_declarator"]
    unless_null $P770, vivify_287
    new $P770, "Undef"
  vivify_287:
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
.sub "term:sym<routine_declarator>"  :subid("53_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_777
.annotate 'line', 290
    new $P776, 'ExceptionHandler'
    set_addr $P776, control_775
    $P776."handle_types"(57)
    push_eh $P776
    .lex "self", self
    .lex "$/", param_777
    find_lex $P778, "$/"
    find_lex $P779, "$/"
    unless_null $P779, vivify_288
    $P779 = root_new ['parrot';'Hash']
  vivify_288:
    set $P780, $P779["routine_declarator"]
    unless_null $P780, vivify_289
    new $P780, "Undef"
  vivify_289:
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
.sub "term:sym<regex_declarator>"  :subid("54_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_787
.annotate 'line', 291
    new $P786, 'ExceptionHandler'
    set_addr $P786, control_785
    $P786."handle_types"(57)
    push_eh $P786
    .lex "self", self
    .lex "$/", param_787
    find_lex $P788, "$/"
    find_lex $P789, "$/"
    unless_null $P789, vivify_290
    $P789 = root_new ['parrot';'Hash']
  vivify_290:
    set $P790, $P789["regex_declarator"]
    unless_null $P790, vivify_291
    new $P790, "Undef"
  vivify_291:
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
.sub "term:sym<statement_prefix>"  :subid("55_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_797
.annotate 'line', 292
    new $P796, 'ExceptionHandler'
    set_addr $P796, control_795
    $P796."handle_types"(57)
    push_eh $P796
    .lex "self", self
    .lex "$/", param_797
    find_lex $P798, "$/"
    find_lex $P799, "$/"
    unless_null $P799, vivify_292
    $P799 = root_new ['parrot';'Hash']
  vivify_292:
    set $P800, $P799["statement_prefix"]
    unless_null $P800, vivify_293
    new $P800, "Undef"
  vivify_293:
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
.sub "term:sym<lambda>"  :subid("56_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_807
.annotate 'line', 293
    new $P806, 'ExceptionHandler'
    set_addr $P806, control_805
    $P806."handle_types"(57)
    push_eh $P806
    .lex "self", self
    .lex "$/", param_807
    find_lex $P808, "$/"
    find_lex $P809, "$/"
    unless_null $P809, vivify_294
    $P809 = root_new ['parrot';'Hash']
  vivify_294:
    set $P810, $P809["pblock"]
    unless_null $P810, vivify_295
    new $P810, "Undef"
  vivify_295:
    $P811 = $P810."ast"()
    $P812 = $P808."!make"($P811)
    .return ($P812)
  control_805:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P813, exception, "payload"
    .return ($P813)
.end


.namespace ["NQP";"Actions"]
.sub "fatarrow"  :subid("57_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_817
.annotate 'line', 295
    new $P816, 'ExceptionHandler'
    set_addr $P816, control_815
    $P816."handle_types"(57)
    push_eh $P816
    .lex "self", self
    .lex "$/", param_817
.annotate 'line', 296
    new $P818, "Undef"
    .lex "$past", $P818
    find_lex $P819, "$/"
    unless_null $P819, vivify_296
    $P819 = root_new ['parrot';'Hash']
  vivify_296:
    set $P820, $P819["val"]
    unless_null $P820, vivify_297
    new $P820, "Undef"
  vivify_297:
    $P821 = $P820."ast"()
    store_lex "$past", $P821
.annotate 'line', 297
    find_lex $P822, "$past"
    find_lex $P823, "$/"
    unless_null $P823, vivify_298
    $P823 = root_new ['parrot';'Hash']
  vivify_298:
    set $P824, $P823["key"]
    unless_null $P824, vivify_299
    new $P824, "Undef"
  vivify_299:
    $P825 = $P824."Str"()
    $P822."named"($P825)
.annotate 'line', 298
    find_lex $P826, "$/"
    find_lex $P827, "$past"
    $P828 = $P826."!make"($P827)
.annotate 'line', 295
    .return ($P828)
  control_815:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P829, exception, "payload"
    .return ($P829)
.end


.namespace ["NQP";"Actions"]
.sub "colonpair"  :subid("58_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_833
.annotate 'line', 301
    new $P832, 'ExceptionHandler'
    set_addr $P832, control_831
    $P832."handle_types"(57)
    push_eh $P832
    .lex "self", self
    .lex "$/", param_833
.annotate 'line', 302
    new $P834, "Undef"
    .lex "$past", $P834
.annotate 'line', 303
    find_lex $P837, "$/"
    unless_null $P837, vivify_300
    $P837 = root_new ['parrot';'Hash']
  vivify_300:
    set $P838, $P837["circumfix"]
    unless_null $P838, vivify_301
    new $P838, "Undef"
  vivify_301:
    if $P838, if_836
.annotate 'line', 304
    get_hll_global $P843, ["PAST"], "Val"
    find_lex $P844, "$/"
    unless_null $P844, vivify_302
    $P844 = root_new ['parrot';'Hash']
  vivify_302:
    set $P845, $P844["not"]
    unless_null $P845, vivify_303
    new $P845, "Undef"
  vivify_303:
    isfalse $I846, $P845
    $P847 = $P843."new"($I846 :named("value"))
    set $P835, $P847
.annotate 'line', 303
    goto if_836_end
  if_836:
    find_lex $P839, "$/"
    unless_null $P839, vivify_304
    $P839 = root_new ['parrot';'Hash']
  vivify_304:
    set $P840, $P839["circumfix"]
    unless_null $P840, vivify_305
    $P840 = root_new ['parrot';'ResizablePMCArray']
  vivify_305:
    set $P841, $P840[0]
    unless_null $P841, vivify_306
    new $P841, "Undef"
  vivify_306:
    $P842 = $P841."ast"()
    set $P835, $P842
  if_836_end:
    store_lex "$past", $P835
.annotate 'line', 305
    find_lex $P848, "$past"
    find_lex $P849, "$/"
    unless_null $P849, vivify_307
    $P849 = root_new ['parrot';'Hash']
  vivify_307:
    set $P850, $P849["identifier"]
    unless_null $P850, vivify_308
    new $P850, "Undef"
  vivify_308:
    set $S851, $P850
    $P848."named"($S851)
.annotate 'line', 306
    find_lex $P852, "$/"
    find_lex $P853, "$past"
    $P854 = $P852."!make"($P853)
.annotate 'line', 301
    .return ($P854)
  control_831:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P855, exception, "payload"
    .return ($P855)
.end


.namespace ["NQP";"Actions"]
.sub "variable"  :subid("59_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_859
.annotate 'line', 309
    .const 'Sub' $P872 = "60_1274564782.90592" 
    capture_lex $P872
    new $P858, 'ExceptionHandler'
    set_addr $P858, control_857
    $P858."handle_types"(57)
    push_eh $P858
    .lex "self", self
    .lex "$/", param_859
.annotate 'line', 310
    new $P860, "Undef"
    .lex "$past", $P860
.annotate 'line', 309
    find_lex $P861, "$past"
.annotate 'line', 311
    find_lex $P863, "$/"
    unless_null $P863, vivify_309
    $P863 = root_new ['parrot';'Hash']
  vivify_309:
    set $P864, $P863["postcircumfix"]
    unless_null $P864, vivify_310
    new $P864, "Undef"
  vivify_310:
    if $P864, if_862
.annotate 'line', 315
    .const 'Sub' $P872 = "60_1274564782.90592" 
    capture_lex $P872
    $P872()
    goto if_862_end
  if_862:
.annotate 'line', 312
    find_lex $P865, "$/"
    unless_null $P865, vivify_327
    $P865 = root_new ['parrot';'Hash']
  vivify_327:
    set $P866, $P865["postcircumfix"]
    unless_null $P866, vivify_328
    new $P866, "Undef"
  vivify_328:
    $P867 = $P866."ast"()
    store_lex "$past", $P867
.annotate 'line', 313
    find_lex $P868, "$past"
    get_hll_global $P869, ["PAST"], "Var"
    $P870 = $P869."new"("$/" :named("name"))
    $P868."unshift"($P870)
  if_862_end:
.annotate 'line', 344
    find_lex $P941, "$/"
    find_lex $P942, "$past"
    $P943 = $P941."!make"($P942)
.annotate 'line', 309
    .return ($P943)
  control_857:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P944, exception, "payload"
    .return ($P944)
.end


.namespace ["NQP";"Actions"]
.sub "_block871"  :anon :subid("60_1274564782.90592") :outer("59_1274564782.90592")
.annotate 'line', 316
    $P873 = root_new ['parrot';'ResizablePMCArray']
    .lex "@name", $P873
    get_hll_global $P874, ["NQP"], "Compiler"
    find_lex $P875, "$/"
    set $S876, $P875
    $P877 = $P874."parse_name"($S876)
    store_lex "@name", $P877
.annotate 'line', 317
    get_hll_global $P878, ["PAST"], "Var"
    find_lex $P879, "@name"
    $P880 = $P879."pop"()
    set $S881, $P880
    $P882 = $P878."new"($S881 :named("name"))
    store_lex "$past", $P882
.annotate 'line', 318
    find_lex $P884, "@name"
    unless $P884, if_883_end
.annotate 'line', 319
    find_lex $P886, "@name"
    unless_null $P886, vivify_311
    $P886 = root_new ['parrot';'ResizablePMCArray']
  vivify_311:
    set $P887, $P886[0]
    unless_null $P887, vivify_312
    new $P887, "Undef"
  vivify_312:
    set $S888, $P887
    iseq $I889, $S888, "GLOBAL"
    unless $I889, if_885_end
    find_lex $P890, "@name"
    $P890."shift"()
  if_885_end:
.annotate 'line', 320
    find_lex $P891, "$past"
    find_lex $P892, "@name"
    $P891."namespace"($P892)
.annotate 'line', 321
    find_lex $P893, "$past"
    $P893."scope"("package")
.annotate 'line', 322
    find_lex $P894, "$past"
    find_lex $P895, "$/"
    unless_null $P895, vivify_313
    $P895 = root_new ['parrot';'Hash']
  vivify_313:
    set $P896, $P895["sigil"]
    unless_null $P896, vivify_314
    new $P896, "Undef"
  vivify_314:
    $P897 = "vivitype"($P896)
    $P894."viviself"($P897)
.annotate 'line', 323
    find_lex $P898, "$past"
    $P898."lvalue"(1)
  if_883_end:
.annotate 'line', 325
    find_lex $P901, "$/"
    unless_null $P901, vivify_315
    $P901 = root_new ['parrot';'Hash']
  vivify_315:
    set $P902, $P901["twigil"]
    unless_null $P902, vivify_316
    $P902 = root_new ['parrot';'ResizablePMCArray']
  vivify_316:
    set $P903, $P902[0]
    unless_null $P903, vivify_317
    new $P903, "Undef"
  vivify_317:
    set $S904, $P903
    iseq $I905, $S904, "*"
    if $I905, if_900
.annotate 'line', 338
    find_lex $P927, "$/"
    unless_null $P927, vivify_318
    $P927 = root_new ['parrot';'Hash']
  vivify_318:
    set $P928, $P927["twigil"]
    unless_null $P928, vivify_319
    $P928 = root_new ['parrot';'ResizablePMCArray']
  vivify_319:
    set $P929, $P928[0]
    unless_null $P929, vivify_320
    new $P929, "Undef"
  vivify_320:
    set $S930, $P929
    iseq $I931, $S930, "!"
    if $I931, if_926
    new $P925, 'Integer'
    set $P925, $I931
    goto if_926_end
  if_926:
.annotate 'line', 339
    find_lex $P932, "$past"
    get_hll_global $P933, ["PAST"], "Var"
    $P934 = $P933."new"("self" :named("name"))
    $P932."push"($P934)
.annotate 'line', 340
    find_lex $P935, "$past"
    $P935."scope"("attribute")
.annotate 'line', 341
    find_lex $P936, "$past"
    find_lex $P937, "$/"
    unless_null $P937, vivify_321
    $P937 = root_new ['parrot';'Hash']
  vivify_321:
    set $P938, $P937["sigil"]
    unless_null $P938, vivify_322
    new $P938, "Undef"
  vivify_322:
    $P939 = "vivitype"($P938)
    $P940 = $P936."viviself"($P939)
.annotate 'line', 338
    set $P925, $P940
  if_926_end:
    set $P899, $P925
.annotate 'line', 325
    goto if_900_end
  if_900:
.annotate 'line', 326
    find_lex $P906, "$past"
    $P906."scope"("contextual")
.annotate 'line', 327
    find_lex $P907, "$past"
.annotate 'line', 328
    get_hll_global $P908, ["PAST"], "Var"
.annotate 'line', 330
    find_lex $P909, "$/"
    unless_null $P909, vivify_323
    $P909 = root_new ['parrot';'Hash']
  vivify_323:
    set $P910, $P909["sigil"]
    unless_null $P910, vivify_324
    new $P910, "Undef"
  vivify_324:
    set $S911, $P910
    new $P912, 'String'
    set $P912, $S911
    find_lex $P913, "$/"
    unless_null $P913, vivify_325
    $P913 = root_new ['parrot';'Hash']
  vivify_325:
    set $P914, $P913["desigilname"]
    unless_null $P914, vivify_326
    new $P914, "Undef"
  vivify_326:
    concat $P915, $P912, $P914
.annotate 'line', 332
    get_hll_global $P916, ["PAST"], "Op"
    new $P917, "String"
    assign $P917, "Contextual "
    find_lex $P918, "$/"
    set $S919, $P918
    concat $P920, $P917, $S919
    concat $P921, $P920, " not found"
    $P922 = $P916."new"($P921, "die" :named("pirop"))
    $P923 = $P908."new"("package" :named("scope"), "" :named("namespace"), $P915 :named("name"), $P922 :named("viviself"))
.annotate 'line', 328
    $P924 = $P907."viviself"($P923)
.annotate 'line', 325
    set $P899, $P924
  if_900_end:
.annotate 'line', 315
    .return ($P899)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<module>"  :subid("61_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_948
.annotate 'line', 347
    new $P947, 'ExceptionHandler'
    set_addr $P947, control_946
    $P947."handle_types"(57)
    push_eh $P947
    .lex "self", self
    .lex "$/", param_948
    find_lex $P949, "$/"
    find_lex $P950, "$/"
    unless_null $P950, vivify_329
    $P950 = root_new ['parrot';'Hash']
  vivify_329:
    set $P951, $P950["package_def"]
    unless_null $P951, vivify_330
    new $P951, "Undef"
  vivify_330:
    $P952 = $P951."ast"()
    $P953 = $P949."!make"($P952)
    .return ($P953)
  control_946:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P954, exception, "payload"
    .return ($P954)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<class>"  :subid("62_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_958
.annotate 'line', 348
    new $P957, 'ExceptionHandler'
    set_addr $P957, control_956
    $P957."handle_types"(57)
    push_eh $P957
    .lex "self", self
    .lex "$/", param_958
.annotate 'line', 349
    new $P959, "Undef"
    .lex "$past", $P959
.annotate 'line', 350
    new $P960, "Undef"
    .lex "$classinit", $P960
.annotate 'line', 359
    new $P961, "Undef"
    .lex "$parent", $P961
.annotate 'line', 349
    find_lex $P962, "$/"
    unless_null $P962, vivify_331
    $P962 = root_new ['parrot';'Hash']
  vivify_331:
    set $P963, $P962["package_def"]
    unless_null $P963, vivify_332
    new $P963, "Undef"
  vivify_332:
    $P964 = $P963."ast"()
    store_lex "$past", $P964
.annotate 'line', 351
    get_hll_global $P965, ["PAST"], "Op"
.annotate 'line', 352
    get_hll_global $P966, ["PAST"], "Op"
    $P967 = $P966."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate 'line', 355
    find_lex $P968, "$/"
    unless_null $P968, vivify_333
    $P968 = root_new ['parrot';'Hash']
  vivify_333:
    set $P969, $P968["package_def"]
    unless_null $P969, vivify_334
    $P969 = root_new ['parrot';'Hash']
  vivify_334:
    set $P970, $P969["name"]
    unless_null $P970, vivify_335
    new $P970, "Undef"
  vivify_335:
    set $S971, $P970
    $P972 = $P965."new"($P967, $S971, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 351
    store_lex "$classinit", $P972
.annotate 'line', 359
    find_lex $P975, "$/"
    unless_null $P975, vivify_336
    $P975 = root_new ['parrot';'Hash']
  vivify_336:
    set $P976, $P975["package_def"]
    unless_null $P976, vivify_337
    $P976 = root_new ['parrot';'Hash']
  vivify_337:
    set $P977, $P976["parent"]
    unless_null $P977, vivify_338
    $P977 = root_new ['parrot';'ResizablePMCArray']
  vivify_338:
    set $P978, $P977[0]
    unless_null $P978, vivify_339
    new $P978, "Undef"
  vivify_339:
    set $S979, $P978
    unless $S979, unless_974
    new $P973, 'String'
    set $P973, $S979
    goto unless_974_end
  unless_974:
.annotate 'line', 360
    find_lex $P982, "$/"
    unless_null $P982, vivify_340
    $P982 = root_new ['parrot';'Hash']
  vivify_340:
    set $P983, $P982["sym"]
    unless_null $P983, vivify_341
    new $P983, "Undef"
  vivify_341:
    set $S984, $P983
    iseq $I985, $S984, "grammar"
    if $I985, if_981
    new $P987, "String"
    assign $P987, ""
    set $P980, $P987
    goto if_981_end
  if_981:
    new $P986, "String"
    assign $P986, "Regex::Cursor"
    set $P980, $P986
  if_981_end:
    set $P973, $P980
  unless_974_end:
    store_lex "$parent", $P973
.annotate 'line', 361
    find_lex $P989, "$parent"
    unless $P989, if_988_end
.annotate 'line', 362
    find_lex $P990, "$classinit"
    get_hll_global $P991, ["PAST"], "Val"
    find_lex $P992, "$parent"
    $P993 = $P991."new"($P992 :named("value"), "parent" :named("named"))
    $P990."push"($P993)
  if_988_end:
.annotate 'line', 364
    find_lex $P995, "$past"
    unless_null $P995, vivify_342
    $P995 = root_new ['parrot';'Hash']
  vivify_342:
    set $P996, $P995["attributes"]
    unless_null $P996, vivify_343
    new $P996, "Undef"
  vivify_343:
    unless $P996, if_994_end
.annotate 'line', 365
    find_lex $P997, "$classinit"
    find_lex $P998, "$past"
    unless_null $P998, vivify_344
    $P998 = root_new ['parrot';'Hash']
  vivify_344:
    set $P999, $P998["attributes"]
    unless_null $P999, vivify_345
    new $P999, "Undef"
  vivify_345:
    $P997."push"($P999)
  if_994_end:
.annotate 'line', 367
    get_global $P1000, "@BLOCK"
    unless_null $P1000, vivify_346
    $P1000 = root_new ['parrot';'ResizablePMCArray']
  vivify_346:
    set $P1001, $P1000[0]
    unless_null $P1001, vivify_347
    new $P1001, "Undef"
  vivify_347:
    $P1002 = $P1001."loadinit"()
    find_lex $P1003, "$classinit"
    $P1002."push"($P1003)
.annotate 'line', 368
    find_lex $P1004, "$/"
    find_lex $P1005, "$past"
    $P1006 = $P1004."!make"($P1005)
.annotate 'line', 348
    .return ($P1006)
  control_956:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1007, exception, "payload"
    .return ($P1007)
.end


.namespace ["NQP";"Actions"]
.sub "package_def"  :subid("63_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1011
.annotate 'line', 371
    new $P1010, 'ExceptionHandler'
    set_addr $P1010, control_1009
    $P1010."handle_types"(57)
    push_eh $P1010
    .lex "self", self
    .lex "$/", param_1011
.annotate 'line', 372
    new $P1012, "Undef"
    .lex "$past", $P1012
    find_lex $P1015, "$/"
    unless_null $P1015, vivify_348
    $P1015 = root_new ['parrot';'Hash']
  vivify_348:
    set $P1016, $P1015["block"]
    unless_null $P1016, vivify_349
    new $P1016, "Undef"
  vivify_349:
    if $P1016, if_1014
    find_lex $P1020, "$/"
    unless_null $P1020, vivify_350
    $P1020 = root_new ['parrot';'Hash']
  vivify_350:
    set $P1021, $P1020["comp_unit"]
    unless_null $P1021, vivify_351
    new $P1021, "Undef"
  vivify_351:
    $P1022 = $P1021."ast"()
    set $P1013, $P1022
    goto if_1014_end
  if_1014:
    find_lex $P1017, "$/"
    unless_null $P1017, vivify_352
    $P1017 = root_new ['parrot';'Hash']
  vivify_352:
    set $P1018, $P1017["block"]
    unless_null $P1018, vivify_353
    new $P1018, "Undef"
  vivify_353:
    $P1019 = $P1018."ast"()
    set $P1013, $P1019
  if_1014_end:
    store_lex "$past", $P1013
.annotate 'line', 373
    find_lex $P1023, "$past"
    find_lex $P1024, "$/"
    unless_null $P1024, vivify_354
    $P1024 = root_new ['parrot';'Hash']
  vivify_354:
    set $P1025, $P1024["name"]
    unless_null $P1025, vivify_355
    $P1025 = root_new ['parrot';'Hash']
  vivify_355:
    set $P1026, $P1025["identifier"]
    unless_null $P1026, vivify_356
    new $P1026, "Undef"
  vivify_356:
    $P1023."namespace"($P1026)
.annotate 'line', 374
    find_lex $P1027, "$past"
    $P1027."blocktype"("immediate")
.annotate 'line', 375
    find_lex $P1028, "$/"
    find_lex $P1029, "$past"
    $P1030 = $P1028."!make"($P1029)
.annotate 'line', 371
    .return ($P1030)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1031, exception, "payload"
    .return ($P1031)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<my>"  :subid("64_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1035
.annotate 'line', 378
    new $P1034, 'ExceptionHandler'
    set_addr $P1034, control_1033
    $P1034."handle_types"(57)
    push_eh $P1034
    .lex "self", self
    .lex "$/", param_1035
    find_lex $P1036, "$/"
    find_lex $P1037, "$/"
    unless_null $P1037, vivify_357
    $P1037 = root_new ['parrot';'Hash']
  vivify_357:
    set $P1038, $P1037["scoped"]
    unless_null $P1038, vivify_358
    new $P1038, "Undef"
  vivify_358:
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
.sub "scope_declarator:sym<our>"  :subid("65_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1045
.annotate 'line', 379
    new $P1044, 'ExceptionHandler'
    set_addr $P1044, control_1043
    $P1044."handle_types"(57)
    push_eh $P1044
    .lex "self", self
    .lex "$/", param_1045
    find_lex $P1046, "$/"
    find_lex $P1047, "$/"
    unless_null $P1047, vivify_359
    $P1047 = root_new ['parrot';'Hash']
  vivify_359:
    set $P1048, $P1047["scoped"]
    unless_null $P1048, vivify_360
    new $P1048, "Undef"
  vivify_360:
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
.sub "scope_declarator:sym<has>"  :subid("66_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1055
.annotate 'line', 380
    new $P1054, 'ExceptionHandler'
    set_addr $P1054, control_1053
    $P1054."handle_types"(57)
    push_eh $P1054
    .lex "self", self
    .lex "$/", param_1055
    find_lex $P1056, "$/"
    find_lex $P1057, "$/"
    unless_null $P1057, vivify_361
    $P1057 = root_new ['parrot';'Hash']
  vivify_361:
    set $P1058, $P1057["scoped"]
    unless_null $P1058, vivify_362
    new $P1058, "Undef"
  vivify_362:
    $P1059 = $P1058."ast"()
    $P1060 = $P1056."!make"($P1059)
    .return ($P1060)
  control_1053:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1061, exception, "payload"
    .return ($P1061)
.end


.namespace ["NQP";"Actions"]
.sub "scoped"  :subid("67_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1065
.annotate 'line', 382
    new $P1064, 'ExceptionHandler'
    set_addr $P1064, control_1063
    $P1064."handle_types"(57)
    push_eh $P1064
    .lex "self", self
    .lex "$/", param_1065
.annotate 'line', 383
    find_lex $P1066, "$/"
    find_lex $P1067, "$/"
    unless_null $P1067, vivify_363
    $P1067 = root_new ['parrot';'Hash']
  vivify_363:
    set $P1068, $P1067["declarator"]
    unless_null $P1068, vivify_364
    new $P1068, "Undef"
  vivify_364:
    $P1069 = $P1068."ast"()
    $P1070 = $P1066."!make"($P1069)
.annotate 'line', 382
    .return ($P1070)
  control_1063:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1071, exception, "payload"
    .return ($P1071)
.end


.namespace ["NQP";"Actions"]
.sub "declarator"  :subid("68_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1075
.annotate 'line', 386
    new $P1074, 'ExceptionHandler'
    set_addr $P1074, control_1073
    $P1074."handle_types"(57)
    push_eh $P1074
    .lex "self", self
    .lex "$/", param_1075
.annotate 'line', 387
    find_lex $P1076, "$/"
.annotate 'line', 388
    find_lex $P1079, "$/"
    unless_null $P1079, vivify_365
    $P1079 = root_new ['parrot';'Hash']
  vivify_365:
    set $P1080, $P1079["routine_declarator"]
    unless_null $P1080, vivify_366
    new $P1080, "Undef"
  vivify_366:
    if $P1080, if_1078
.annotate 'line', 389
    find_lex $P1084, "$/"
    unless_null $P1084, vivify_367
    $P1084 = root_new ['parrot';'Hash']
  vivify_367:
    set $P1085, $P1084["variable_declarator"]
    unless_null $P1085, vivify_368
    new $P1085, "Undef"
  vivify_368:
    $P1086 = $P1085."ast"()
    set $P1077, $P1086
.annotate 'line', 388
    goto if_1078_end
  if_1078:
    find_lex $P1081, "$/"
    unless_null $P1081, vivify_369
    $P1081 = root_new ['parrot';'Hash']
  vivify_369:
    set $P1082, $P1081["routine_declarator"]
    unless_null $P1082, vivify_370
    new $P1082, "Undef"
  vivify_370:
    $P1083 = $P1082."ast"()
    set $P1077, $P1083
  if_1078_end:
    $P1087 = $P1076."!make"($P1077)
.annotate 'line', 386
    .return ($P1087)
  control_1073:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1088, exception, "payload"
    .return ($P1088)
.end


.namespace ["NQP";"Actions"]
.sub "variable_declarator"  :subid("69_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1092
.annotate 'line', 392
    .const 'Sub' $P1132 = "70_1274564782.90592" 
    capture_lex $P1132
    new $P1091, 'ExceptionHandler'
    set_addr $P1091, control_1090
    $P1091."handle_types"(57)
    push_eh $P1091
    .lex "self", self
    .lex "$/", param_1092
.annotate 'line', 393
    new $P1093, "Undef"
    .lex "$past", $P1093
.annotate 'line', 394
    new $P1094, "Undef"
    .lex "$sigil", $P1094
.annotate 'line', 395
    new $P1095, "Undef"
    .lex "$name", $P1095
.annotate 'line', 396
    new $P1096, "Undef"
    .lex "$BLOCK", $P1096
.annotate 'line', 393
    find_lex $P1097, "$/"
    unless_null $P1097, vivify_371
    $P1097 = root_new ['parrot';'Hash']
  vivify_371:
    set $P1098, $P1097["variable"]
    unless_null $P1098, vivify_372
    new $P1098, "Undef"
  vivify_372:
    $P1099 = $P1098."ast"()
    store_lex "$past", $P1099
.annotate 'line', 394
    find_lex $P1100, "$/"
    unless_null $P1100, vivify_373
    $P1100 = root_new ['parrot';'Hash']
  vivify_373:
    set $P1101, $P1100["variable"]
    unless_null $P1101, vivify_374
    $P1101 = root_new ['parrot';'Hash']
  vivify_374:
    set $P1102, $P1101["sigil"]
    unless_null $P1102, vivify_375
    new $P1102, "Undef"
  vivify_375:
    store_lex "$sigil", $P1102
.annotate 'line', 395
    find_lex $P1103, "$past"
    $P1104 = $P1103."name"()
    store_lex "$name", $P1104
.annotate 'line', 396
    get_global $P1105, "@BLOCK"
    unless_null $P1105, vivify_376
    $P1105 = root_new ['parrot';'ResizablePMCArray']
  vivify_376:
    set $P1106, $P1105[0]
    unless_null $P1106, vivify_377
    new $P1106, "Undef"
  vivify_377:
    store_lex "$BLOCK", $P1106
.annotate 'line', 397
    find_lex $P1108, "$BLOCK"
    find_lex $P1109, "$name"
    $P1110 = $P1108."symbol"($P1109)
    unless $P1110, if_1107_end
.annotate 'line', 398
    find_lex $P1111, "$/"
    $P1112 = $P1111."CURSOR"()
    find_lex $P1113, "$name"
    $P1112."panic"("Redeclaration of symbol ", $P1113)
  if_1107_end:
.annotate 'line', 400
    find_dynamic_lex $P1115, "$*SCOPE"
    unless_null $P1115, vivify_378
    get_hll_global $P1115, "$SCOPE"
    unless_null $P1115, vivify_379
    die "Contextual $*SCOPE not found"
  vivify_379:
  vivify_378:
    set $S1116, $P1115
    iseq $I1117, $S1116, "has"
    if $I1117, if_1114
.annotate 'line', 409
    .const 'Sub' $P1132 = "70_1274564782.90592" 
    capture_lex $P1132
    $P1132()
    goto if_1114_end
  if_1114:
.annotate 'line', 401
    find_lex $P1118, "$BLOCK"
    find_lex $P1119, "$name"
    $P1118."symbol"($P1119, "attribute" :named("scope"))
.annotate 'line', 402
    find_lex $P1121, "$BLOCK"
    unless_null $P1121, vivify_384
    $P1121 = root_new ['parrot';'Hash']
  vivify_384:
    set $P1122, $P1121["attributes"]
    unless_null $P1122, vivify_385
    new $P1122, "Undef"
  vivify_385:
    if $P1122, unless_1120_end
.annotate 'line', 404
    get_hll_global $P1123, ["PAST"], "Op"
    $P1124 = $P1123."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P1125, "$BLOCK"
    unless_null $P1125, vivify_386
    $P1125 = root_new ['parrot';'Hash']
    store_lex "$BLOCK", $P1125
  vivify_386:
    set $P1125["attributes"], $P1124
  unless_1120_end:
.annotate 'line', 406
    find_lex $P1126, "$BLOCK"
    unless_null $P1126, vivify_387
    $P1126 = root_new ['parrot';'Hash']
  vivify_387:
    set $P1127, $P1126["attributes"]
    unless_null $P1127, vivify_388
    new $P1127, "Undef"
  vivify_388:
    find_lex $P1128, "$name"
    $P1127."push"($P1128)
.annotate 'line', 407
    get_hll_global $P1129, ["PAST"], "Stmts"
    $P1130 = $P1129."new"()
    store_lex "$past", $P1130
  if_1114_end:
.annotate 'line', 417
    find_lex $P1156, "$/"
    find_lex $P1157, "$past"
    $P1158 = $P1156."!make"($P1157)
.annotate 'line', 392
    .return ($P1158)
  control_1090:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1159, exception, "payload"
    .return ($P1159)
.end


.namespace ["NQP";"Actions"]
.sub "_block1131"  :anon :subid("70_1274564782.90592") :outer("69_1274564782.90592")
.annotate 'line', 410
    new $P1133, "Undef"
    .lex "$scope", $P1133
.annotate 'line', 411
    new $P1134, "Undef"
    .lex "$decl", $P1134
.annotate 'line', 410
    find_dynamic_lex $P1137, "$*SCOPE"
    unless_null $P1137, vivify_380
    get_hll_global $P1137, "$SCOPE"
    unless_null $P1137, vivify_381
    die "Contextual $*SCOPE not found"
  vivify_381:
  vivify_380:
    set $S1138, $P1137
    iseq $I1139, $S1138, "our"
    if $I1139, if_1136
    new $P1141, "String"
    assign $P1141, "lexical"
    set $P1135, $P1141
    goto if_1136_end
  if_1136:
    new $P1140, "String"
    assign $P1140, "package"
    set $P1135, $P1140
  if_1136_end:
    store_lex "$scope", $P1135
.annotate 'line', 411
    get_hll_global $P1142, ["PAST"], "Var"
    find_lex $P1143, "$name"
    find_lex $P1144, "$scope"
.annotate 'line', 412
    find_lex $P1145, "$sigil"
    $P1146 = "vivitype"($P1145)
    find_lex $P1147, "$/"
    $P1148 = $P1142."new"($P1143 :named("name"), $P1144 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P1146 :named("viviself"), $P1147 :named("node"))
.annotate 'line', 411
    store_lex "$decl", $P1148
.annotate 'line', 414
    find_lex $P1149, "$BLOCK"
    find_lex $P1150, "$name"
    find_lex $P1151, "$scope"
    $P1149."symbol"($P1150, $P1151 :named("scope"))
.annotate 'line', 415
    find_lex $P1152, "$BLOCK"
    unless_null $P1152, vivify_382
    $P1152 = root_new ['parrot';'ResizablePMCArray']
  vivify_382:
    set $P1153, $P1152[0]
    unless_null $P1153, vivify_383
    new $P1153, "Undef"
  vivify_383:
    find_lex $P1154, "$decl"
    $P1155 = $P1153."push"($P1154)
.annotate 'line', 409
    .return ($P1155)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<sub>"  :subid("71_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1163
.annotate 'line', 420
    new $P1162, 'ExceptionHandler'
    set_addr $P1162, control_1161
    $P1162."handle_types"(57)
    push_eh $P1162
    .lex "self", self
    .lex "$/", param_1163
    find_lex $P1164, "$/"
    find_lex $P1165, "$/"
    unless_null $P1165, vivify_389
    $P1165 = root_new ['parrot';'Hash']
  vivify_389:
    set $P1166, $P1165["routine_def"]
    unless_null $P1166, vivify_390
    new $P1166, "Undef"
  vivify_390:
    $P1167 = $P1166."ast"()
    $P1168 = $P1164."!make"($P1167)
    .return ($P1168)
  control_1161:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1169, exception, "payload"
    .return ($P1169)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<method>"  :subid("72_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1173
.annotate 'line', 421
    new $P1172, 'ExceptionHandler'
    set_addr $P1172, control_1171
    $P1172."handle_types"(57)
    push_eh $P1172
    .lex "self", self
    .lex "$/", param_1173
    find_lex $P1174, "$/"
    find_lex $P1175, "$/"
    unless_null $P1175, vivify_391
    $P1175 = root_new ['parrot';'Hash']
  vivify_391:
    set $P1176, $P1175["method_def"]
    unless_null $P1176, vivify_392
    new $P1176, "Undef"
  vivify_392:
    $P1177 = $P1176."ast"()
    $P1178 = $P1174."!make"($P1177)
    .return ($P1178)
  control_1171:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1179, exception, "payload"
    .return ($P1179)
.end


.namespace ["NQP";"Actions"]
.sub "routine_def"  :subid("73_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1183
.annotate 'line', 423
    .const 'Sub' $P1194 = "74_1274564782.90592" 
    capture_lex $P1194
    new $P1182, 'ExceptionHandler'
    set_addr $P1182, control_1181
    $P1182."handle_types"(57)
    push_eh $P1182
    .lex "self", self
    .lex "$/", param_1183
.annotate 'line', 424
    new $P1184, "Undef"
    .lex "$past", $P1184
    find_lex $P1185, "$/"
    unless_null $P1185, vivify_393
    $P1185 = root_new ['parrot';'Hash']
  vivify_393:
    set $P1186, $P1185["blockoid"]
    unless_null $P1186, vivify_394
    new $P1186, "Undef"
  vivify_394:
    $P1187 = $P1186."ast"()
    store_lex "$past", $P1187
.annotate 'line', 425
    find_lex $P1188, "$past"
    $P1188."blocktype"("declaration")
.annotate 'line', 426
    find_lex $P1189, "$past"
    $P1189."control"("return_pir")
.annotate 'line', 427
    find_lex $P1191, "$/"
    unless_null $P1191, vivify_395
    $P1191 = root_new ['parrot';'Hash']
  vivify_395:
    set $P1192, $P1191["deflongname"]
    unless_null $P1192, vivify_396
    new $P1192, "Undef"
  vivify_396:
    unless $P1192, if_1190_end
    .const 'Sub' $P1194 = "74_1274564782.90592" 
    capture_lex $P1194
    $P1194()
  if_1190_end:
.annotate 'line', 437
    find_lex $P1226, "$/"
    find_lex $P1227, "$past"
    $P1228 = $P1226."!make"($P1227)
.annotate 'line', 423
    .return ($P1228)
  control_1181:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1229, exception, "payload"
    .return ($P1229)
.end


.namespace ["NQP";"Actions"]
.sub "_block1193"  :anon :subid("74_1274564782.90592") :outer("73_1274564782.90592")
.annotate 'line', 428
    new $P1195, "Undef"
    .lex "$name", $P1195
    find_lex $P1196, "$/"
    unless_null $P1196, vivify_397
    $P1196 = root_new ['parrot';'Hash']
  vivify_397:
    set $P1197, $P1196["sigil"]
    unless_null $P1197, vivify_398
    $P1197 = root_new ['parrot';'ResizablePMCArray']
  vivify_398:
    set $P1198, $P1197[0]
    unless_null $P1198, vivify_399
    new $P1198, "Undef"
  vivify_399:
    set $S1199, $P1198
    new $P1200, 'String'
    set $P1200, $S1199
    find_lex $P1201, "$/"
    unless_null $P1201, vivify_400
    $P1201 = root_new ['parrot';'Hash']
  vivify_400:
    set $P1202, $P1201["deflongname"]
    unless_null $P1202, vivify_401
    $P1202 = root_new ['parrot';'ResizablePMCArray']
  vivify_401:
    set $P1203, $P1202[0]
    unless_null $P1203, vivify_402
    new $P1203, "Undef"
  vivify_402:
    $S1204 = $P1203."ast"()
    concat $P1205, $P1200, $S1204
    store_lex "$name", $P1205
.annotate 'line', 429
    find_lex $P1206, "$past"
    find_lex $P1207, "$name"
    $P1206."name"($P1207)
.annotate 'line', 430
    find_dynamic_lex $P1210, "$*SCOPE"
    unless_null $P1210, vivify_403
    get_hll_global $P1210, "$SCOPE"
    unless_null $P1210, vivify_404
    die "Contextual $*SCOPE not found"
  vivify_404:
  vivify_403:
    set $S1211, $P1210
    isne $I1212, $S1211, "our"
    if $I1212, if_1209
    new $P1208, 'Integer'
    set $P1208, $I1212
    goto if_1209_end
  if_1209:
.annotate 'line', 431
    get_global $P1213, "@BLOCK"
    unless_null $P1213, vivify_405
    $P1213 = root_new ['parrot';'ResizablePMCArray']
  vivify_405:
    set $P1214, $P1213[0]
    unless_null $P1214, vivify_406
    $P1214 = root_new ['parrot';'ResizablePMCArray']
  vivify_406:
    set $P1215, $P1214[0]
    unless_null $P1215, vivify_407
    new $P1215, "Undef"
  vivify_407:
    get_hll_global $P1216, ["PAST"], "Var"
    find_lex $P1217, "$name"
    find_lex $P1218, "$past"
    $P1219 = $P1216."new"($P1217 :named("name"), 1 :named("isdecl"), $P1218 :named("viviself"), "lexical" :named("scope"))
    $P1215."push"($P1219)
.annotate 'line', 433
    get_global $P1220, "@BLOCK"
    unless_null $P1220, vivify_408
    $P1220 = root_new ['parrot';'ResizablePMCArray']
  vivify_408:
    set $P1221, $P1220[0]
    unless_null $P1221, vivify_409
    new $P1221, "Undef"
  vivify_409:
    find_lex $P1222, "$name"
    $P1221."symbol"($P1222, "lexical" :named("scope"))
.annotate 'line', 434
    get_hll_global $P1223, ["PAST"], "Var"
    find_lex $P1224, "$name"
    $P1225 = $P1223."new"($P1224 :named("name"))
    store_lex "$past", $P1225
.annotate 'line', 430
    set $P1208, $P1225
  if_1209_end:
.annotate 'line', 427
    .return ($P1208)
.end


.namespace ["NQP";"Actions"]
.sub "method_def"  :subid("75_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1233
.annotate 'line', 441
    .const 'Sub' $P1249 = "76_1274564782.90592" 
    capture_lex $P1249
    new $P1232, 'ExceptionHandler'
    set_addr $P1232, control_1231
    $P1232."handle_types"(57)
    push_eh $P1232
    .lex "self", self
    .lex "$/", param_1233
.annotate 'line', 442
    new $P1234, "Undef"
    .lex "$past", $P1234
    find_lex $P1235, "$/"
    unless_null $P1235, vivify_410
    $P1235 = root_new ['parrot';'Hash']
  vivify_410:
    set $P1236, $P1235["blockoid"]
    unless_null $P1236, vivify_411
    new $P1236, "Undef"
  vivify_411:
    $P1237 = $P1236."ast"()
    store_lex "$past", $P1237
.annotate 'line', 443
    find_lex $P1238, "$past"
    $P1238."blocktype"("method")
.annotate 'line', 444
    find_lex $P1239, "$past"
    $P1239."control"("return_pir")
.annotate 'line', 445
    find_lex $P1240, "$past"
    unless_null $P1240, vivify_412
    $P1240 = root_new ['parrot';'ResizablePMCArray']
  vivify_412:
    set $P1241, $P1240[0]
    unless_null $P1241, vivify_413
    new $P1241, "Undef"
  vivify_413:
    get_hll_global $P1242, ["PAST"], "Op"
    $P1243 = $P1242."new"("    .lex \"self\", self" :named("inline"))
    $P1241."unshift"($P1243)
.annotate 'line', 446
    find_lex $P1244, "$past"
    $P1244."symbol"("self", "lexical" :named("scope"))
.annotate 'line', 447
    find_lex $P1246, "$/"
    unless_null $P1246, vivify_414
    $P1246 = root_new ['parrot';'Hash']
  vivify_414:
    set $P1247, $P1246["deflongname"]
    unless_null $P1247, vivify_415
    new $P1247, "Undef"
  vivify_415:
    unless $P1247, if_1245_end
    .const 'Sub' $P1249 = "76_1274564782.90592" 
    capture_lex $P1249
    $P1249()
  if_1245_end:
.annotate 'line', 451
    find_lex $P1260, "$/"
    find_lex $P1261, "$past"
    $P1262 = $P1260."!make"($P1261)
.annotate 'line', 441
    .return ($P1262)
  control_1231:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1263, exception, "payload"
    .return ($P1263)
.end


.namespace ["NQP";"Actions"]
.sub "_block1248"  :anon :subid("76_1274564782.90592") :outer("75_1274564782.90592")
.annotate 'line', 448
    new $P1250, "Undef"
    .lex "$name", $P1250
    find_lex $P1251, "$/"
    unless_null $P1251, vivify_416
    $P1251 = root_new ['parrot';'Hash']
  vivify_416:
    set $P1252, $P1251["deflongname"]
    unless_null $P1252, vivify_417
    $P1252 = root_new ['parrot';'ResizablePMCArray']
  vivify_417:
    set $P1253, $P1252[0]
    unless_null $P1253, vivify_418
    new $P1253, "Undef"
  vivify_418:
    $P1254 = $P1253."ast"()
    set $S1255, $P1254
    new $P1256, 'String'
    set $P1256, $S1255
    store_lex "$name", $P1256
.annotate 'line', 449
    find_lex $P1257, "$past"
    find_lex $P1258, "$name"
    $P1259 = $P1257."name"($P1258)
.annotate 'line', 447
    .return ($P1259)
.end


.namespace ["NQP";"Actions"]
.sub "signature"  :subid("77_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1267
.annotate 'line', 455
    .const 'Sub' $P1278 = "78_1274564782.90592" 
    capture_lex $P1278
    new $P1266, 'ExceptionHandler'
    set_addr $P1266, control_1265
    $P1266."handle_types"(57)
    push_eh $P1266
    .lex "self", self
    .lex "$/", param_1267
.annotate 'line', 456
    new $P1268, "Undef"
    .lex "$BLOCKINIT", $P1268
    get_global $P1269, "@BLOCK"
    unless_null $P1269, vivify_419
    $P1269 = root_new ['parrot';'ResizablePMCArray']
  vivify_419:
    set $P1270, $P1269[0]
    unless_null $P1270, vivify_420
    $P1270 = root_new ['parrot';'ResizablePMCArray']
  vivify_420:
    set $P1271, $P1270[0]
    unless_null $P1271, vivify_421
    new $P1271, "Undef"
  vivify_421:
    store_lex "$BLOCKINIT", $P1271
.annotate 'line', 457
    find_lex $P1273, "$/"
    unless_null $P1273, vivify_422
    $P1273 = root_new ['parrot';'Hash']
  vivify_422:
    set $P1274, $P1273["parameter"]
    unless_null $P1274, vivify_423
    new $P1274, "Undef"
  vivify_423:
    defined $I1275, $P1274
    unless $I1275, for_undef_424
    iter $P1272, $P1274
    new $P1285, 'ExceptionHandler'
    set_addr $P1285, loop1284_handler
    $P1285."handle_types"(64, 66, 65)
    push_eh $P1285
  loop1284_test:
    unless $P1272, loop1284_done
    shift $P1276, $P1272
  loop1284_redo:
    .const 'Sub' $P1278 = "78_1274564782.90592" 
    capture_lex $P1278
    $P1278($P1276)
  loop1284_next:
    goto loop1284_test
  loop1284_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1286, exception, 'type'
    eq $P1286, 64, loop1284_next
    eq $P1286, 66, loop1284_redo
  loop1284_done:
    pop_eh 
  for_undef_424:
.annotate 'line', 455
    .return ($P1272)
  control_1265:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1287, exception, "payload"
    .return ($P1287)
.end


.namespace ["NQP";"Actions"]
.sub "_block1277"  :anon :subid("78_1274564782.90592") :outer("77_1274564782.90592")
    .param pmc param_1279
.annotate 'line', 457
    .lex "$_", param_1279
    find_lex $P1280, "$BLOCKINIT"
    find_lex $P1281, "$_"
    $P1282 = $P1281."ast"()
    $P1283 = $P1280."push"($P1282)
    .return ($P1283)
.end


.namespace ["NQP";"Actions"]
.sub "parameter"  :subid("79_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1291
.annotate 'line', 460
    new $P1290, 'ExceptionHandler'
    set_addr $P1290, control_1289
    $P1290."handle_types"(57)
    push_eh $P1290
    .lex "self", self
    .lex "$/", param_1291
.annotate 'line', 461
    new $P1292, "Undef"
    .lex "$quant", $P1292
.annotate 'line', 462
    new $P1293, "Undef"
    .lex "$past", $P1293
.annotate 'line', 461
    find_lex $P1294, "$/"
    unless_null $P1294, vivify_425
    $P1294 = root_new ['parrot';'Hash']
  vivify_425:
    set $P1295, $P1294["quant"]
    unless_null $P1295, vivify_426
    new $P1295, "Undef"
  vivify_426:
    store_lex "$quant", $P1295
    find_lex $P1296, "$past"
.annotate 'line', 463
    find_lex $P1298, "$/"
    unless_null $P1298, vivify_427
    $P1298 = root_new ['parrot';'Hash']
  vivify_427:
    set $P1299, $P1298["named_param"]
    unless_null $P1299, vivify_428
    new $P1299, "Undef"
  vivify_428:
    if $P1299, if_1297
.annotate 'line', 470
    find_lex $P1313, "$/"
    unless_null $P1313, vivify_429
    $P1313 = root_new ['parrot';'Hash']
  vivify_429:
    set $P1314, $P1313["param_var"]
    unless_null $P1314, vivify_430
    new $P1314, "Undef"
  vivify_430:
    $P1315 = $P1314."ast"()
    store_lex "$past", $P1315
.annotate 'line', 471
    find_lex $P1317, "$quant"
    set $S1318, $P1317
    iseq $I1319, $S1318, "*"
    if $I1319, if_1316
.annotate 'line', 475
    find_lex $P1328, "$quant"
    set $S1329, $P1328
    iseq $I1330, $S1329, "?"
    unless $I1330, if_1327_end
.annotate 'line', 476
    find_lex $P1331, "$past"
    find_lex $P1332, "$/"
    unless_null $P1332, vivify_431
    $P1332 = root_new ['parrot';'Hash']
  vivify_431:
    set $P1333, $P1332["param_var"]
    unless_null $P1333, vivify_432
    $P1333 = root_new ['parrot';'Hash']
  vivify_432:
    set $P1334, $P1333["sigil"]
    unless_null $P1334, vivify_433
    new $P1334, "Undef"
  vivify_433:
    $P1335 = "vivitype"($P1334)
    $P1331."viviself"($P1335)
  if_1327_end:
.annotate 'line', 475
    goto if_1316_end
  if_1316:
.annotate 'line', 472
    find_lex $P1320, "$past"
    $P1320."slurpy"(1)
.annotate 'line', 473
    find_lex $P1321, "$past"
    find_lex $P1322, "$/"
    unless_null $P1322, vivify_434
    $P1322 = root_new ['parrot';'Hash']
  vivify_434:
    set $P1323, $P1322["param_var"]
    unless_null $P1323, vivify_435
    $P1323 = root_new ['parrot';'Hash']
  vivify_435:
    set $P1324, $P1323["sigil"]
    unless_null $P1324, vivify_436
    new $P1324, "Undef"
  vivify_436:
    set $S1325, $P1324
    iseq $I1326, $S1325, "%"
    $P1321."named"($I1326)
  if_1316_end:
.annotate 'line', 469
    goto if_1297_end
  if_1297:
.annotate 'line', 464
    find_lex $P1300, "$/"
    unless_null $P1300, vivify_437
    $P1300 = root_new ['parrot';'Hash']
  vivify_437:
    set $P1301, $P1300["named_param"]
    unless_null $P1301, vivify_438
    new $P1301, "Undef"
  vivify_438:
    $P1302 = $P1301."ast"()
    store_lex "$past", $P1302
.annotate 'line', 465
    find_lex $P1304, "$quant"
    set $S1305, $P1304
    isne $I1306, $S1305, "!"
    unless $I1306, if_1303_end
.annotate 'line', 466
    find_lex $P1307, "$past"
    find_lex $P1308, "$/"
    unless_null $P1308, vivify_439
    $P1308 = root_new ['parrot';'Hash']
  vivify_439:
    set $P1309, $P1308["named_param"]
    unless_null $P1309, vivify_440
    $P1309 = root_new ['parrot';'Hash']
  vivify_440:
    set $P1310, $P1309["param_var"]
    unless_null $P1310, vivify_441
    $P1310 = root_new ['parrot';'Hash']
  vivify_441:
    set $P1311, $P1310["sigil"]
    unless_null $P1311, vivify_442
    new $P1311, "Undef"
  vivify_442:
    $P1312 = "vivitype"($P1311)
    $P1307."viviself"($P1312)
  if_1303_end:
  if_1297_end:
.annotate 'line', 479
    find_lex $P1337, "$/"
    unless_null $P1337, vivify_443
    $P1337 = root_new ['parrot';'Hash']
  vivify_443:
    set $P1338, $P1337["default_value"]
    unless_null $P1338, vivify_444
    new $P1338, "Undef"
  vivify_444:
    unless $P1338, if_1336_end
.annotate 'line', 480
    find_lex $P1340, "$quant"
    set $S1341, $P1340
    iseq $I1342, $S1341, "*"
    unless $I1342, if_1339_end
.annotate 'line', 481
    find_lex $P1343, "$/"
    $P1344 = $P1343."CURSOR"()
    $P1344."panic"("Can't put default on slurpy parameter")
  if_1339_end:
.annotate 'line', 483
    find_lex $P1346, "$quant"
    set $S1347, $P1346
    iseq $I1348, $S1347, "!"
    unless $I1348, if_1345_end
.annotate 'line', 484
    find_lex $P1349, "$/"
    $P1350 = $P1349."CURSOR"()
    $P1350."panic"("Can't put default on required parameter")
  if_1345_end:
.annotate 'line', 486
    find_lex $P1351, "$past"
    find_lex $P1352, "$/"
    unless_null $P1352, vivify_445
    $P1352 = root_new ['parrot';'Hash']
  vivify_445:
    set $P1353, $P1352["default_value"]
    unless_null $P1353, vivify_446
    $P1353 = root_new ['parrot';'ResizablePMCArray']
  vivify_446:
    set $P1354, $P1353[0]
    unless_null $P1354, vivify_447
    $P1354 = root_new ['parrot';'Hash']
  vivify_447:
    set $P1355, $P1354["EXPR"]
    unless_null $P1355, vivify_448
    new $P1355, "Undef"
  vivify_448:
    $P1356 = $P1355."ast"()
    $P1351."viviself"($P1356)
  if_1336_end:
.annotate 'line', 488
    find_lex $P1358, "$past"
    $P1359 = $P1358."viviself"()
    if $P1359, unless_1357_end
    get_global $P1360, "@BLOCK"
    unless_null $P1360, vivify_449
    $P1360 = root_new ['parrot';'ResizablePMCArray']
  vivify_449:
    set $P1361, $P1360[0]
    unless_null $P1361, vivify_450
    new $P1361, "Undef"
  vivify_450:
    get_global $P1362, "@BLOCK"
    unless_null $P1362, vivify_451
    $P1362 = root_new ['parrot';'ResizablePMCArray']
  vivify_451:
    set $P1363, $P1362[0]
    unless_null $P1363, vivify_452
    new $P1363, "Undef"
  vivify_452:
    $P1364 = $P1363."arity"()
    set $N1365, $P1364
    new $P1366, 'Float'
    set $P1366, $N1365
    add $P1367, $P1366, 1
    $P1361."arity"($P1367)
  unless_1357_end:
.annotate 'line', 489
    find_lex $P1368, "$/"
    find_lex $P1369, "$past"
    $P1370 = $P1368."!make"($P1369)
.annotate 'line', 460
    .return ($P1370)
  control_1289:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1371, exception, "payload"
    .return ($P1371)
.end


.namespace ["NQP";"Actions"]
.sub "param_var"  :subid("80_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1375
.annotate 'line', 492
    new $P1374, 'ExceptionHandler'
    set_addr $P1374, control_1373
    $P1374."handle_types"(57)
    push_eh $P1374
    .lex "self", self
    .lex "$/", param_1375
.annotate 'line', 493
    new $P1376, "Undef"
    .lex "$name", $P1376
.annotate 'line', 494
    new $P1377, "Undef"
    .lex "$past", $P1377
.annotate 'line', 493
    find_lex $P1378, "$/"
    set $S1379, $P1378
    new $P1380, 'String'
    set $P1380, $S1379
    store_lex "$name", $P1380
.annotate 'line', 494
    get_hll_global $P1381, ["PAST"], "Var"
    find_lex $P1382, "$name"
    find_lex $P1383, "$/"
    $P1384 = $P1381."new"($P1382 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1383 :named("node"))
    store_lex "$past", $P1384
.annotate 'line', 496
    get_global $P1385, "@BLOCK"
    unless_null $P1385, vivify_453
    $P1385 = root_new ['parrot';'ResizablePMCArray']
  vivify_453:
    set $P1386, $P1385[0]
    unless_null $P1386, vivify_454
    new $P1386, "Undef"
  vivify_454:
    find_lex $P1387, "$name"
    $P1386."symbol"($P1387, "lexical" :named("scope"))
.annotate 'line', 497
    find_lex $P1388, "$/"
    find_lex $P1389, "$past"
    $P1390 = $P1388."!make"($P1389)
.annotate 'line', 492
    .return ($P1390)
  control_1373:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1391, exception, "payload"
    .return ($P1391)
.end


.namespace ["NQP";"Actions"]
.sub "named_param"  :subid("81_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1395
.annotate 'line', 500
    new $P1394, 'ExceptionHandler'
    set_addr $P1394, control_1393
    $P1394."handle_types"(57)
    push_eh $P1394
    .lex "self", self
    .lex "$/", param_1395
.annotate 'line', 501
    new $P1396, "Undef"
    .lex "$past", $P1396
    find_lex $P1397, "$/"
    unless_null $P1397, vivify_455
    $P1397 = root_new ['parrot';'Hash']
  vivify_455:
    set $P1398, $P1397["param_var"]
    unless_null $P1398, vivify_456
    new $P1398, "Undef"
  vivify_456:
    $P1399 = $P1398."ast"()
    store_lex "$past", $P1399
.annotate 'line', 502
    find_lex $P1400, "$past"
    find_lex $P1401, "$/"
    unless_null $P1401, vivify_457
    $P1401 = root_new ['parrot';'Hash']
  vivify_457:
    set $P1402, $P1401["param_var"]
    unless_null $P1402, vivify_458
    $P1402 = root_new ['parrot';'Hash']
  vivify_458:
    set $P1403, $P1402["name"]
    unless_null $P1403, vivify_459
    new $P1403, "Undef"
  vivify_459:
    set $S1404, $P1403
    $P1400."named"($S1404)
.annotate 'line', 503
    find_lex $P1405, "$/"
    find_lex $P1406, "$past"
    $P1407 = $P1405."!make"($P1406)
.annotate 'line', 500
    .return ($P1407)
  control_1393:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1408, exception, "payload"
    .return ($P1408)
.end


.namespace ["NQP";"Actions"]
.sub "regex_declarator"  :subid("82_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1412
    .param pmc param_1413 :optional
    .param int has_param_1413 :opt_flag
.annotate 'line', 506
    .const 'Sub' $P1483 = "84_1274564782.90592" 
    capture_lex $P1483
    .const 'Sub' $P1455 = "83_1274564782.90592" 
    capture_lex $P1455
    new $P1411, 'ExceptionHandler'
    set_addr $P1411, control_1410
    $P1411."handle_types"(57)
    push_eh $P1411
    .lex "self", self
    .lex "$/", param_1412
    if has_param_1413, optparam_460
    new $P1414, "Undef"
    set param_1413, $P1414
  optparam_460:
    .lex "$key", param_1413
.annotate 'line', 507
    $P1415 = root_new ['parrot';'ResizablePMCArray']
    .lex "@MODIFIERS", $P1415
.annotate 'line', 510
    new $P1416, "Undef"
    .lex "$name", $P1416
.annotate 'line', 511
    new $P1417, "Undef"
    .lex "$past", $P1417
.annotate 'line', 507

        $P1418 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1418
.annotate 'line', 510
    find_lex $P1419, "$/"
    unless_null $P1419, vivify_461
    $P1419 = root_new ['parrot';'Hash']
  vivify_461:
    set $P1420, $P1419["deflongname"]
    unless_null $P1420, vivify_462
    new $P1420, "Undef"
  vivify_462:
    $P1421 = $P1420."ast"()
    set $S1422, $P1421
    new $P1423, 'String'
    set $P1423, $S1422
    store_lex "$name", $P1423
    find_lex $P1424, "$past"
.annotate 'line', 512
    find_lex $P1426, "$/"
    unless_null $P1426, vivify_463
    $P1426 = root_new ['parrot';'Hash']
  vivify_463:
    set $P1427, $P1426["proto"]
    unless_null $P1427, vivify_464
    new $P1427, "Undef"
  vivify_464:
    if $P1427, if_1425
.annotate 'line', 539
    find_lex $P1451, "$key"
    set $S1452, $P1451
    iseq $I1453, $S1452, "open"
    if $I1453, if_1450
.annotate 'line', 552
    .const 'Sub' $P1483 = "84_1274564782.90592" 
    capture_lex $P1483
    $P1483()
    goto if_1450_end
  if_1450:
.annotate 'line', 539
    .const 'Sub' $P1455 = "83_1274564782.90592" 
    capture_lex $P1455
    $P1455()
  if_1450_end:
    goto if_1425_end
  if_1425:
.annotate 'line', 514
    get_hll_global $P1428, ["PAST"], "Stmts"
.annotate 'line', 515
    get_hll_global $P1429, ["PAST"], "Block"
    find_lex $P1430, "$name"
.annotate 'line', 516
    get_hll_global $P1431, ["PAST"], "Op"
.annotate 'line', 517
    get_hll_global $P1432, ["PAST"], "Var"
    $P1433 = $P1432."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1434, "$name"
    $P1435 = $P1431."new"($P1433, $P1434, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 516
    find_lex $P1436, "$/"
    $P1437 = $P1429."new"($P1435, $P1430 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1436 :named("node"))
.annotate 'line', 526
    get_hll_global $P1438, ["PAST"], "Block"
    new $P1439, "String"
    assign $P1439, "!PREFIX__"
    find_lex $P1440, "$name"
    concat $P1441, $P1439, $P1440
.annotate 'line', 527
    get_hll_global $P1442, ["PAST"], "Op"
.annotate 'line', 528
    get_hll_global $P1443, ["PAST"], "Var"
    $P1444 = $P1443."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1445, "$name"
    $P1446 = $P1442."new"($P1444, $P1445, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 527
    find_lex $P1447, "$/"
    $P1448 = $P1438."new"($P1446, $P1441 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1447 :named("node"))
.annotate 'line', 526
    $P1449 = $P1428."new"($P1437, $P1448)
.annotate 'line', 514
    store_lex "$past", $P1449
  if_1425_end:
.annotate 'line', 566
    find_lex $P1504, "$/"
    find_lex $P1505, "$past"
    $P1506 = $P1504."!make"($P1505)
.annotate 'line', 506
    .return ($P1506)
  control_1410:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1507, exception, "payload"
    .return ($P1507)
.end


.namespace ["NQP";"Actions"]
.sub "_block1482"  :anon :subid("84_1274564782.90592") :outer("82_1274564782.90592")
.annotate 'line', 553
    new $P1484, "Undef"
    .lex "$regex", $P1484
.annotate 'line', 554
    get_hll_global $P1485, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1486, "$/"
    unless_null $P1486, vivify_465
    $P1486 = root_new ['parrot';'Hash']
  vivify_465:
    set $P1487, $P1486["p6regex"]
    unless_null $P1487, vivify_466
    new $P1487, "Undef"
  vivify_466:
    $P1488 = $P1487."ast"()
    get_global $P1489, "@BLOCK"
    $P1490 = $P1489."shift"()
    $P1491 = $P1485($P1488, $P1490)
    store_lex "$regex", $P1491
.annotate 'line', 555
    find_lex $P1492, "$regex"
    find_lex $P1493, "$name"
    $P1492."name"($P1493)
.annotate 'line', 557
    get_hll_global $P1494, ["PAST"], "Op"
.annotate 'line', 559
    get_hll_global $P1495, ["PAST"], "Var"
    new $P1496, "ResizablePMCArray"
    push $P1496, "Regex"
    $P1497 = $P1495."new"("Method" :named("name"), $P1496 :named("namespace"), "package" :named("scope"))
    find_lex $P1498, "$regex"
    $P1499 = $P1494."new"($P1497, $P1498, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate 'line', 557
    store_lex "$past", $P1499
.annotate 'line', 563
    find_lex $P1500, "$regex"
    find_lex $P1501, "$past"
    unless_null $P1501, vivify_467
    $P1501 = root_new ['parrot';'Hash']
    store_lex "$past", $P1501
  vivify_467:
    set $P1501["sink"], $P1500
.annotate 'line', 564
    find_lex $P1502, "@MODIFIERS"
    $P1503 = $P1502."shift"()
.annotate 'line', 552
    .return ($P1503)
.end


.namespace ["NQP";"Actions"]
.sub "_block1454"  :anon :subid("83_1274564782.90592") :outer("82_1274564782.90592")
.annotate 'line', 540
    $P1456 = root_new ['parrot';'Hash']
    .lex "%h", $P1456
.annotate 'line', 539
    find_lex $P1457, "%h"
.annotate 'line', 541
    find_lex $P1459, "$/"
    unless_null $P1459, vivify_468
    $P1459 = root_new ['parrot';'Hash']
  vivify_468:
    set $P1460, $P1459["sym"]
    unless_null $P1460, vivify_469
    new $P1460, "Undef"
  vivify_469:
    set $S1461, $P1460
    iseq $I1462, $S1461, "token"
    unless $I1462, if_1458_end
    new $P1463, "Integer"
    assign $P1463, 1
    find_lex $P1464, "%h"
    unless_null $P1464, vivify_470
    $P1464 = root_new ['parrot';'Hash']
    store_lex "%h", $P1464
  vivify_470:
    set $P1464["r"], $P1463
  if_1458_end:
.annotate 'line', 542
    find_lex $P1466, "$/"
    unless_null $P1466, vivify_471
    $P1466 = root_new ['parrot';'Hash']
  vivify_471:
    set $P1467, $P1466["sym"]
    unless_null $P1467, vivify_472
    new $P1467, "Undef"
  vivify_472:
    set $S1468, $P1467
    iseq $I1469, $S1468, "rule"
    unless $I1469, if_1465_end
    new $P1470, "Integer"
    assign $P1470, 1
    find_lex $P1471, "%h"
    unless_null $P1471, vivify_473
    $P1471 = root_new ['parrot';'Hash']
    store_lex "%h", $P1471
  vivify_473:
    set $P1471["r"], $P1470
    new $P1472, "Integer"
    assign $P1472, 1
    find_lex $P1473, "%h"
    unless_null $P1473, vivify_474
    $P1473 = root_new ['parrot';'Hash']
    store_lex "%h", $P1473
  vivify_474:
    set $P1473["s"], $P1472
  if_1465_end:
.annotate 'line', 543
    find_lex $P1474, "@MODIFIERS"
    find_lex $P1475, "%h"
    $P1474."unshift"($P1475)
.annotate 'line', 544

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate 'line', 548
    get_global $P1476, "@BLOCK"
    unless_null $P1476, vivify_475
    $P1476 = root_new ['parrot';'ResizablePMCArray']
  vivify_475:
    set $P1477, $P1476[0]
    unless_null $P1477, vivify_476
    new $P1477, "Undef"
  vivify_476:
    $P1477."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate 'line', 549
    get_global $P1478, "@BLOCK"
    unless_null $P1478, vivify_477
    $P1478 = root_new ['parrot';'ResizablePMCArray']
  vivify_477:
    set $P1479, $P1478[0]
    unless_null $P1479, vivify_478
    new $P1479, "Undef"
  vivify_478:
    $P1479."symbol"("$/", "lexical" :named("scope"))
.annotate 'line', 550
    new $P1480, "Exception"
    set $P1480['type'], 57
    new $P1481, "Integer"
    assign $P1481, 0
    setattribute $P1480, 'payload', $P1481
    throw $P1480
.annotate 'line', 539
    .return ()
.end


.namespace ["NQP";"Actions"]
.sub "dotty"  :subid("85_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1511
.annotate 'line', 570
    new $P1510, 'ExceptionHandler'
    set_addr $P1510, control_1509
    $P1510."handle_types"(57)
    push_eh $P1510
    .lex "self", self
    .lex "$/", param_1511
.annotate 'line', 571
    new $P1512, "Undef"
    .lex "$past", $P1512
    find_lex $P1515, "$/"
    unless_null $P1515, vivify_479
    $P1515 = root_new ['parrot';'Hash']
  vivify_479:
    set $P1516, $P1515["args"]
    unless_null $P1516, vivify_480
    new $P1516, "Undef"
  vivify_480:
    if $P1516, if_1514
    get_hll_global $P1521, ["PAST"], "Op"
    find_lex $P1522, "$/"
    $P1523 = $P1521."new"($P1522 :named("node"))
    set $P1513, $P1523
    goto if_1514_end
  if_1514:
    find_lex $P1517, "$/"
    unless_null $P1517, vivify_481
    $P1517 = root_new ['parrot';'Hash']
  vivify_481:
    set $P1518, $P1517["args"]
    unless_null $P1518, vivify_482
    $P1518 = root_new ['parrot';'ResizablePMCArray']
  vivify_482:
    set $P1519, $P1518[0]
    unless_null $P1519, vivify_483
    new $P1519, "Undef"
  vivify_483:
    $P1520 = $P1519."ast"()
    set $P1513, $P1520
  if_1514_end:
    store_lex "$past", $P1513
.annotate 'line', 572
    find_lex $P1524, "$past"
    find_lex $P1527, "$/"
    unless_null $P1527, vivify_484
    $P1527 = root_new ['parrot';'Hash']
  vivify_484:
    set $P1528, $P1527["quote"]
    unless_null $P1528, vivify_485
    new $P1528, "Undef"
  vivify_485:
    if $P1528, if_1526
    find_lex $P1532, "$/"
    unless_null $P1532, vivify_486
    $P1532 = root_new ['parrot';'Hash']
  vivify_486:
    set $P1533, $P1532["longname"]
    unless_null $P1533, vivify_487
    new $P1533, "Undef"
  vivify_487:
    set $S1534, $P1533
    new $P1525, 'String'
    set $P1525, $S1534
    goto if_1526_end
  if_1526:
    find_lex $P1529, "$/"
    unless_null $P1529, vivify_488
    $P1529 = root_new ['parrot';'Hash']
  vivify_488:
    set $P1530, $P1529["quote"]
    unless_null $P1530, vivify_489
    new $P1530, "Undef"
  vivify_489:
    $P1531 = $P1530."ast"()
    set $P1525, $P1531
  if_1526_end:
    $P1524."name"($P1525)
.annotate 'line', 573
    find_lex $P1535, "$past"
    $P1535."pasttype"("callmethod")
.annotate 'line', 574
    find_lex $P1536, "$/"
    find_lex $P1537, "$past"
    $P1538 = $P1536."!make"($P1537)
.annotate 'line', 570
    .return ($P1538)
  control_1509:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1539, exception, "payload"
    .return ($P1539)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<self>"  :subid("86_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1543
.annotate 'line', 579
    new $P1542, 'ExceptionHandler'
    set_addr $P1542, control_1541
    $P1542."handle_types"(57)
    push_eh $P1542
    .lex "self", self
    .lex "$/", param_1543
.annotate 'line', 580
    find_lex $P1544, "$/"
    get_hll_global $P1545, ["PAST"], "Var"
    $P1546 = $P1545."new"("self" :named("name"))
    $P1547 = $P1544."!make"($P1546)
.annotate 'line', 579
    .return ($P1547)
  control_1541:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1548, exception, "payload"
    .return ($P1548)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<identifier>"  :subid("87_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1552
.annotate 'line', 583
    new $P1551, 'ExceptionHandler'
    set_addr $P1551, control_1550
    $P1551."handle_types"(57)
    push_eh $P1551
    .lex "self", self
    .lex "$/", param_1552
.annotate 'line', 584
    new $P1553, "Undef"
    .lex "$past", $P1553
    find_lex $P1554, "$/"
    unless_null $P1554, vivify_490
    $P1554 = root_new ['parrot';'Hash']
  vivify_490:
    set $P1555, $P1554["args"]
    unless_null $P1555, vivify_491
    new $P1555, "Undef"
  vivify_491:
    $P1556 = $P1555."ast"()
    store_lex "$past", $P1556
.annotate 'line', 585
    find_lex $P1557, "$past"
    find_lex $P1558, "$/"
    unless_null $P1558, vivify_492
    $P1558 = root_new ['parrot';'Hash']
  vivify_492:
    set $P1559, $P1558["identifier"]
    unless_null $P1559, vivify_493
    new $P1559, "Undef"
  vivify_493:
    set $S1560, $P1559
    $P1557."name"($S1560)
.annotate 'line', 586
    find_lex $P1561, "$/"
    find_lex $P1562, "$past"
    $P1563 = $P1561."!make"($P1562)
.annotate 'line', 583
    .return ($P1563)
  control_1550:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1564, exception, "payload"
    .return ($P1564)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<name>"  :subid("88_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1568
.annotate 'line', 589
    new $P1567, 'ExceptionHandler'
    set_addr $P1567, control_1566
    $P1567."handle_types"(57)
    push_eh $P1567
    .lex "self", self
    .lex "$/", param_1568
.annotate 'line', 590
    $P1569 = root_new ['parrot';'ResizablePMCArray']
    .lex "@ns", $P1569
.annotate 'line', 591
    new $P1570, "Undef"
    .lex "$name", $P1570
.annotate 'line', 593
    new $P1571, "Undef"
    .lex "$var", $P1571
.annotate 'line', 595
    new $P1572, "Undef"
    .lex "$past", $P1572
.annotate 'line', 590
    find_lex $P1573, "$/"
    unless_null $P1573, vivify_494
    $P1573 = root_new ['parrot';'Hash']
  vivify_494:
    set $P1574, $P1573["name"]
    unless_null $P1574, vivify_495
    $P1574 = root_new ['parrot';'Hash']
  vivify_495:
    set $P1575, $P1574["identifier"]
    unless_null $P1575, vivify_496
    new $P1575, "Undef"
  vivify_496:
    clone $P1576, $P1575
    store_lex "@ns", $P1576
.annotate 'line', 591
    find_lex $P1577, "@ns"
    $P1578 = $P1577."pop"()
    store_lex "$name", $P1578
.annotate 'line', 592
    find_lex $P1582, "@ns"
    if $P1582, if_1581
    set $P1580, $P1582
    goto if_1581_end
  if_1581:
    find_lex $P1583, "@ns"
    unless_null $P1583, vivify_497
    $P1583 = root_new ['parrot';'ResizablePMCArray']
  vivify_497:
    set $P1584, $P1583[0]
    unless_null $P1584, vivify_498
    new $P1584, "Undef"
  vivify_498:
    set $S1585, $P1584
    iseq $I1586, $S1585, "GLOBAL"
    new $P1580, 'Integer'
    set $P1580, $I1586
  if_1581_end:
    unless $P1580, if_1579_end
    find_lex $P1587, "@ns"
    $P1587."shift"()
  if_1579_end:
.annotate 'line', 594
    get_hll_global $P1588, ["PAST"], "Var"
    find_lex $P1589, "$name"
    set $S1590, $P1589
    find_lex $P1591, "@ns"
    $P1592 = $P1588."new"($S1590 :named("name"), $P1591 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1592
.annotate 'line', 595
    find_lex $P1593, "$var"
    store_lex "$past", $P1593
.annotate 'line', 596
    find_lex $P1595, "$/"
    unless_null $P1595, vivify_499
    $P1595 = root_new ['parrot';'Hash']
  vivify_499:
    set $P1596, $P1595["args"]
    unless_null $P1596, vivify_500
    new $P1596, "Undef"
  vivify_500:
    unless $P1596, if_1594_end
.annotate 'line', 597
    find_lex $P1597, "$/"
    unless_null $P1597, vivify_501
    $P1597 = root_new ['parrot';'Hash']
  vivify_501:
    set $P1598, $P1597["args"]
    unless_null $P1598, vivify_502
    $P1598 = root_new ['parrot';'ResizablePMCArray']
  vivify_502:
    set $P1599, $P1598[0]
    unless_null $P1599, vivify_503
    new $P1599, "Undef"
  vivify_503:
    $P1600 = $P1599."ast"()
    store_lex "$past", $P1600
.annotate 'line', 598
    find_lex $P1601, "$past"
    find_lex $P1602, "$var"
    $P1601."unshift"($P1602)
  if_1594_end:
.annotate 'line', 600
    find_lex $P1603, "$/"
    find_lex $P1604, "$past"
    $P1605 = $P1603."!make"($P1604)
.annotate 'line', 589
    .return ($P1605)
  control_1566:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1606, exception, "payload"
    .return ($P1606)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<pir::op>"  :subid("89_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1610
.annotate 'line', 603
    new $P1609, 'ExceptionHandler'
    set_addr $P1609, control_1608
    $P1609."handle_types"(57)
    push_eh $P1609
    .lex "self", self
    .lex "$/", param_1610
.annotate 'line', 604
    new $P1611, "Undef"
    .lex "$past", $P1611
.annotate 'line', 605
    new $P1612, "Undef"
    .lex "$pirop", $P1612
.annotate 'line', 604
    find_lex $P1615, "$/"
    unless_null $P1615, vivify_504
    $P1615 = root_new ['parrot';'Hash']
  vivify_504:
    set $P1616, $P1615["args"]
    unless_null $P1616, vivify_505
    new $P1616, "Undef"
  vivify_505:
    if $P1616, if_1614
    get_hll_global $P1621, ["PAST"], "Op"
    find_lex $P1622, "$/"
    $P1623 = $P1621."new"($P1622 :named("node"))
    set $P1613, $P1623
    goto if_1614_end
  if_1614:
    find_lex $P1617, "$/"
    unless_null $P1617, vivify_506
    $P1617 = root_new ['parrot';'Hash']
  vivify_506:
    set $P1618, $P1617["args"]
    unless_null $P1618, vivify_507
    $P1618 = root_new ['parrot';'ResizablePMCArray']
  vivify_507:
    set $P1619, $P1618[0]
    unless_null $P1619, vivify_508
    new $P1619, "Undef"
  vivify_508:
    $P1620 = $P1619."ast"()
    set $P1613, $P1620
  if_1614_end:
    store_lex "$past", $P1613
.annotate 'line', 605
    find_lex $P1624, "$/"
    unless_null $P1624, vivify_509
    $P1624 = root_new ['parrot';'Hash']
  vivify_509:
    set $P1625, $P1624["op"]
    unless_null $P1625, vivify_510
    new $P1625, "Undef"
  vivify_510:
    set $S1626, $P1625
    new $P1627, 'String'
    set $P1627, $S1626
    store_lex "$pirop", $P1627
.annotate 'line', 606

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1628 = box $S0
    
    store_lex "$pirop", $P1628
.annotate 'line', 613
    find_lex $P1629, "$past"
    find_lex $P1630, "$pirop"
    $P1629."pirop"($P1630)
.annotate 'line', 614
    find_lex $P1631, "$past"
    $P1631."pasttype"("pirop")
.annotate 'line', 615
    find_lex $P1632, "$/"
    find_lex $P1633, "$past"
    $P1634 = $P1632."!make"($P1633)
.annotate 'line', 603
    .return ($P1634)
  control_1608:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1635, exception, "payload"
    .return ($P1635)
.end


.namespace ["NQP";"Actions"]
.sub "args"  :subid("90_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1639
.annotate 'line', 618
    new $P1638, 'ExceptionHandler'
    set_addr $P1638, control_1637
    $P1638."handle_types"(57)
    push_eh $P1638
    .lex "self", self
    .lex "$/", param_1639
    find_lex $P1640, "$/"
    find_lex $P1641, "$/"
    unless_null $P1641, vivify_511
    $P1641 = root_new ['parrot';'Hash']
  vivify_511:
    set $P1642, $P1641["arglist"]
    unless_null $P1642, vivify_512
    new $P1642, "Undef"
  vivify_512:
    $P1643 = $P1642."ast"()
    $P1644 = $P1640."!make"($P1643)
    .return ($P1644)
  control_1637:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1645, exception, "payload"
    .return ($P1645)
.end


.namespace ["NQP";"Actions"]
.sub "arglist"  :subid("91_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1649
.annotate 'line', 620
    .const 'Sub' $P1660 = "92_1274564782.90592" 
    capture_lex $P1660
    new $P1648, 'ExceptionHandler'
    set_addr $P1648, control_1647
    $P1648."handle_types"(57)
    push_eh $P1648
    .lex "self", self
    .lex "$/", param_1649
.annotate 'line', 621
    new $P1650, "Undef"
    .lex "$past", $P1650
.annotate 'line', 629
    new $P1651, "Undef"
    .lex "$i", $P1651
.annotate 'line', 630
    new $P1652, "Undef"
    .lex "$n", $P1652
.annotate 'line', 621
    get_hll_global $P1653, ["PAST"], "Op"
    find_lex $P1654, "$/"
    $P1655 = $P1653."new"("call" :named("pasttype"), $P1654 :named("node"))
    store_lex "$past", $P1655
.annotate 'line', 622
    find_lex $P1657, "$/"
    unless_null $P1657, vivify_513
    $P1657 = root_new ['parrot';'Hash']
  vivify_513:
    set $P1658, $P1657["EXPR"]
    unless_null $P1658, vivify_514
    new $P1658, "Undef"
  vivify_514:
    unless $P1658, if_1656_end
    .const 'Sub' $P1660 = "92_1274564782.90592" 
    capture_lex $P1660
    $P1660()
  if_1656_end:
.annotate 'line', 629
    new $P1692, "Integer"
    assign $P1692, 0
    store_lex "$i", $P1692
.annotate 'line', 630
    find_lex $P1693, "$past"
    $P1694 = $P1693."list"()
    set $N1695, $P1694
    new $P1696, 'Float'
    set $P1696, $N1695
    store_lex "$n", $P1696
.annotate 'line', 631
    new $P1744, 'ExceptionHandler'
    set_addr $P1744, loop1743_handler
    $P1744."handle_types"(64, 66, 65)
    push_eh $P1744
  loop1743_test:
    find_lex $P1697, "$i"
    set $N1698, $P1697
    find_lex $P1699, "$n"
    set $N1700, $P1699
    islt $I1701, $N1698, $N1700
    unless $I1701, loop1743_done
  loop1743_redo:
.annotate 'line', 632
    find_lex $P1703, "$i"
    set $I1704, $P1703
    find_lex $P1705, "$past"
    unless_null $P1705, vivify_518
    $P1705 = root_new ['parrot';'ResizablePMCArray']
  vivify_518:
    set $P1706, $P1705[$I1704]
    unless_null $P1706, vivify_519
    new $P1706, "Undef"
  vivify_519:
    $S1707 = $P1706."name"()
    iseq $I1708, $S1707, "&prefix:<|>"
    unless $I1708, if_1702_end
.annotate 'line', 633
    find_lex $P1709, "$i"
    set $I1710, $P1709
    find_lex $P1711, "$past"
    unless_null $P1711, vivify_520
    $P1711 = root_new ['parrot';'ResizablePMCArray']
  vivify_520:
    set $P1712, $P1711[$I1710]
    unless_null $P1712, vivify_521
    $P1712 = root_new ['parrot';'ResizablePMCArray']
  vivify_521:
    set $P1713, $P1712[0]
    unless_null $P1713, vivify_522
    new $P1713, "Undef"
  vivify_522:
    find_lex $P1714, "$i"
    set $I1715, $P1714
    find_lex $P1716, "$past"
    unless_null $P1716, vivify_523
    $P1716 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$past", $P1716
  vivify_523:
    set $P1716[$I1715], $P1713
.annotate 'line', 634
    find_lex $P1717, "$i"
    set $I1718, $P1717
    find_lex $P1719, "$past"
    unless_null $P1719, vivify_524
    $P1719 = root_new ['parrot';'ResizablePMCArray']
  vivify_524:
    set $P1720, $P1719[$I1718]
    unless_null $P1720, vivify_525
    new $P1720, "Undef"
  vivify_525:
    $P1720."flat"(1)
.annotate 'line', 635
    find_lex $P1724, "$i"
    set $I1725, $P1724
    find_lex $P1726, "$past"
    unless_null $P1726, vivify_526
    $P1726 = root_new ['parrot';'ResizablePMCArray']
  vivify_526:
    set $P1727, $P1726[$I1725]
    unless_null $P1727, vivify_527
    new $P1727, "Undef"
  vivify_527:
    get_hll_global $P1728, ["PAST"], "Val"
    $P1729 = $P1727."isa"($P1728)
    if $P1729, if_1723
    set $P1722, $P1729
    goto if_1723_end
  if_1723:
.annotate 'line', 636
    find_lex $P1730, "$i"
    set $I1731, $P1730
    find_lex $P1732, "$past"
    unless_null $P1732, vivify_528
    $P1732 = root_new ['parrot';'ResizablePMCArray']
  vivify_528:
    set $P1733, $P1732[$I1731]
    unless_null $P1733, vivify_529
    new $P1733, "Undef"
  vivify_529:
    $S1734 = $P1733."name"()
    substr $S1735, $S1734, 0, 1
    iseq $I1736, $S1735, "%"
    new $P1722, 'Integer'
    set $P1722, $I1736
  if_1723_end:
    unless $P1722, if_1721_end
.annotate 'line', 637
    find_lex $P1737, "$i"
    set $I1738, $P1737
    find_lex $P1739, "$past"
    unless_null $P1739, vivify_530
    $P1739 = root_new ['parrot';'ResizablePMCArray']
  vivify_530:
    set $P1740, $P1739[$I1738]
    unless_null $P1740, vivify_531
    new $P1740, "Undef"
  vivify_531:
    $P1740."named"(1)
  if_1721_end:
  if_1702_end:
.annotate 'line', 632
    find_lex $P1741, "$i"
    clone $P1742, $P1741
    inc $P1741
  loop1743_next:
.annotate 'line', 631
    goto loop1743_test
  loop1743_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1745, exception, 'type'
    eq $P1745, 64, loop1743_next
    eq $P1745, 66, loop1743_redo
  loop1743_done:
    pop_eh 
.annotate 'line', 642
    find_lex $P1746, "$/"
    find_lex $P1747, "$past"
    $P1748 = $P1746."!make"($P1747)
.annotate 'line', 620
    .return ($P1748)
  control_1647:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1749, exception, "payload"
    .return ($P1749)
.end


.namespace ["NQP";"Actions"]
.sub "_block1659"  :anon :subid("92_1274564782.90592") :outer("91_1274564782.90592")
.annotate 'line', 622
    .const 'Sub' $P1681 = "93_1274564782.90592" 
    capture_lex $P1681
.annotate 'line', 623
    new $P1661, "Undef"
    .lex "$expr", $P1661
    find_lex $P1662, "$/"
    unless_null $P1662, vivify_515
    $P1662 = root_new ['parrot';'Hash']
  vivify_515:
    set $P1663, $P1662["EXPR"]
    unless_null $P1663, vivify_516
    new $P1663, "Undef"
  vivify_516:
    $P1664 = $P1663."ast"()
    store_lex "$expr", $P1664
.annotate 'line', 624
    find_lex $P1669, "$expr"
    $S1670 = $P1669."name"()
    iseq $I1671, $S1670, "&infix:<,>"
    if $I1671, if_1668
    new $P1667, 'Integer'
    set $P1667, $I1671
    goto if_1668_end
  if_1668:
    find_lex $P1672, "$expr"
    $P1673 = $P1672."named"()
    isfalse $I1674, $P1673
    new $P1667, 'Integer'
    set $P1667, $I1674
  if_1668_end:
    if $P1667, if_1666
.annotate 'line', 627
    find_lex $P1689, "$past"
    find_lex $P1690, "$expr"
    $P1691 = $P1689."push"($P1690)
    set $P1665, $P1691
.annotate 'line', 624
    goto if_1666_end
  if_1666:
.annotate 'line', 625
    find_lex $P1676, "$expr"
    $P1677 = $P1676."list"()
    defined $I1678, $P1677
    unless $I1678, for_undef_517
    iter $P1675, $P1677
    new $P1687, 'ExceptionHandler'
    set_addr $P1687, loop1686_handler
    $P1687."handle_types"(64, 66, 65)
    push_eh $P1687
  loop1686_test:
    unless $P1675, loop1686_done
    shift $P1679, $P1675
  loop1686_redo:
    .const 'Sub' $P1681 = "93_1274564782.90592" 
    capture_lex $P1681
    $P1681($P1679)
  loop1686_next:
    goto loop1686_test
  loop1686_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1688, exception, 'type'
    eq $P1688, 64, loop1686_next
    eq $P1688, 66, loop1686_redo
  loop1686_done:
    pop_eh 
  for_undef_517:
.annotate 'line', 624
    set $P1665, $P1675
  if_1666_end:
.annotate 'line', 622
    .return ($P1665)
.end


.namespace ["NQP";"Actions"]
.sub "_block1680"  :anon :subid("93_1274564782.90592") :outer("92_1274564782.90592")
    .param pmc param_1682
.annotate 'line', 625
    .lex "$_", param_1682
    find_lex $P1683, "$past"
    find_lex $P1684, "$_"
    $P1685 = $P1683."push"($P1684)
    .return ($P1685)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<value>"  :subid("94_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1753
.annotate 'line', 646
    new $P1752, 'ExceptionHandler'
    set_addr $P1752, control_1751
    $P1752."handle_types"(57)
    push_eh $P1752
    .lex "self", self
    .lex "$/", param_1753
    find_lex $P1754, "$/"
    find_lex $P1755, "$/"
    unless_null $P1755, vivify_532
    $P1755 = root_new ['parrot';'Hash']
  vivify_532:
    set $P1756, $P1755["value"]
    unless_null $P1756, vivify_533
    new $P1756, "Undef"
  vivify_533:
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
.sub "circumfix:sym<( )>"  :subid("95_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1763
.annotate 'line', 648
    new $P1762, 'ExceptionHandler'
    set_addr $P1762, control_1761
    $P1762."handle_types"(57)
    push_eh $P1762
    .lex "self", self
    .lex "$/", param_1763
.annotate 'line', 649
    find_lex $P1764, "$/"
.annotate 'line', 650
    find_lex $P1767, "$/"
    unless_null $P1767, vivify_534
    $P1767 = root_new ['parrot';'Hash']
  vivify_534:
    set $P1768, $P1767["EXPR"]
    unless_null $P1768, vivify_535
    new $P1768, "Undef"
  vivify_535:
    if $P1768, if_1766
.annotate 'line', 651
    get_hll_global $P1773, ["PAST"], "Op"
    find_lex $P1774, "$/"
    $P1775 = $P1773."new"("list" :named("pasttype"), $P1774 :named("node"))
    set $P1765, $P1775
.annotate 'line', 650
    goto if_1766_end
  if_1766:
    find_lex $P1769, "$/"
    unless_null $P1769, vivify_536
    $P1769 = root_new ['parrot';'Hash']
  vivify_536:
    set $P1770, $P1769["EXPR"]
    unless_null $P1770, vivify_537
    $P1770 = root_new ['parrot';'ResizablePMCArray']
  vivify_537:
    set $P1771, $P1770[0]
    unless_null $P1771, vivify_538
    new $P1771, "Undef"
  vivify_538:
    $P1772 = $P1771."ast"()
    set $P1765, $P1772
  if_1766_end:
    $P1776 = $P1764."!make"($P1765)
.annotate 'line', 648
    .return ($P1776)
  control_1761:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1777, exception, "payload"
    .return ($P1777)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<[ ]>"  :subid("96_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1781
.annotate 'line', 654
    new $P1780, 'ExceptionHandler'
    set_addr $P1780, control_1779
    $P1780."handle_types"(57)
    push_eh $P1780
    .lex "self", self
    .lex "$/", param_1781
.annotate 'line', 655
    new $P1782, "Undef"
    .lex "$past", $P1782
.annotate 'line', 654
    find_lex $P1783, "$past"
.annotate 'line', 656
    find_lex $P1785, "$/"
    unless_null $P1785, vivify_539
    $P1785 = root_new ['parrot';'Hash']
  vivify_539:
    set $P1786, $P1785["EXPR"]
    unless_null $P1786, vivify_540
    new $P1786, "Undef"
  vivify_540:
    if $P1786, if_1784
.annotate 'line', 663
    get_hll_global $P1798, ["PAST"], "Op"
    $P1799 = $P1798."new"("list" :named("pasttype"))
    store_lex "$past", $P1799
.annotate 'line', 662
    goto if_1784_end
  if_1784:
.annotate 'line', 657
    find_lex $P1787, "$/"
    unless_null $P1787, vivify_541
    $P1787 = root_new ['parrot';'Hash']
  vivify_541:
    set $P1788, $P1787["EXPR"]
    unless_null $P1788, vivify_542
    $P1788 = root_new ['parrot';'ResizablePMCArray']
  vivify_542:
    set $P1789, $P1788[0]
    unless_null $P1789, vivify_543
    new $P1789, "Undef"
  vivify_543:
    $P1790 = $P1789."ast"()
    store_lex "$past", $P1790
.annotate 'line', 658
    find_lex $P1792, "$past"
    $S1793 = $P1792."name"()
    isne $I1794, $S1793, "&infix:<,>"
    unless $I1794, if_1791_end
.annotate 'line', 659
    get_hll_global $P1795, ["PAST"], "Op"
    find_lex $P1796, "$past"
    $P1797 = $P1795."new"($P1796, "list" :named("pasttype"))
    store_lex "$past", $P1797
  if_1791_end:
  if_1784_end:
.annotate 'line', 665
    find_lex $P1800, "$past"
    $P1800."name"("&circumfix:<[ ]>")
.annotate 'line', 666
    find_lex $P1801, "$/"
    find_lex $P1802, "$past"
    $P1803 = $P1801."!make"($P1802)
.annotate 'line', 654
    .return ($P1803)
  control_1779:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1804, exception, "payload"
    .return ($P1804)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<ang>"  :subid("97_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1808
.annotate 'line', 669
    new $P1807, 'ExceptionHandler'
    set_addr $P1807, control_1806
    $P1807."handle_types"(57)
    push_eh $P1807
    .lex "self", self
    .lex "$/", param_1808
    find_lex $P1809, "$/"
    find_lex $P1810, "$/"
    unless_null $P1810, vivify_544
    $P1810 = root_new ['parrot';'Hash']
  vivify_544:
    set $P1811, $P1810["quote_EXPR"]
    unless_null $P1811, vivify_545
    new $P1811, "Undef"
  vivify_545:
    $P1812 = $P1811."ast"()
    $P1813 = $P1809."!make"($P1812)
    .return ($P1813)
  control_1806:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1814, exception, "payload"
    .return ($P1814)
.end


.namespace ["NQP";"Actions"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("98_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1818
.annotate 'line', 670
    new $P1817, 'ExceptionHandler'
    set_addr $P1817, control_1816
    $P1817."handle_types"(57)
    push_eh $P1817
    .lex "self", self
    .lex "$/", param_1818
    find_lex $P1819, "$/"
    find_lex $P1820, "$/"
    unless_null $P1820, vivify_546
    $P1820 = root_new ['parrot';'Hash']
  vivify_546:
    set $P1821, $P1820["quote_EXPR"]
    unless_null $P1821, vivify_547
    new $P1821, "Undef"
  vivify_547:
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
.sub "circumfix:sym<{ }>"  :subid("99_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1828
.annotate 'line', 672
    new $P1827, 'ExceptionHandler'
    set_addr $P1827, control_1826
    $P1827."handle_types"(57)
    push_eh $P1827
    .lex "self", self
    .lex "$/", param_1828
.annotate 'line', 673
    new $P1829, "Undef"
    .lex "$past", $P1829
    find_lex $P1832, "$/"
    unless_null $P1832, vivify_548
    $P1832 = root_new ['parrot';'Hash']
  vivify_548:
    set $P1833, $P1832["pblock"]
    unless_null $P1833, vivify_549
    $P1833 = root_new ['parrot';'Hash']
  vivify_549:
    set $P1834, $P1833["blockoid"]
    unless_null $P1834, vivify_550
    $P1834 = root_new ['parrot';'Hash']
  vivify_550:
    set $P1835, $P1834["statementlist"]
    unless_null $P1835, vivify_551
    $P1835 = root_new ['parrot';'Hash']
  vivify_551:
    set $P1836, $P1835["statement"]
    unless_null $P1836, vivify_552
    new $P1836, "Undef"
  vivify_552:
    set $N1837, $P1836
    isgt $I1838, $N1837, 0.0
    if $I1838, if_1831
.annotate 'line', 675
    $P1842 = "vivitype"("%")
    set $P1830, $P1842
.annotate 'line', 673
    goto if_1831_end
  if_1831:
.annotate 'line', 674
    find_lex $P1839, "$/"
    unless_null $P1839, vivify_553
    $P1839 = root_new ['parrot';'Hash']
  vivify_553:
    set $P1840, $P1839["pblock"]
    unless_null $P1840, vivify_554
    new $P1840, "Undef"
  vivify_554:
    $P1841 = $P1840."ast"()
    set $P1830, $P1841
  if_1831_end:
    store_lex "$past", $P1830
.annotate 'line', 676
    new $P1843, "Integer"
    assign $P1843, 1
    find_lex $P1844, "$past"
    unless_null $P1844, vivify_555
    $P1844 = root_new ['parrot';'Hash']
    store_lex "$past", $P1844
  vivify_555:
    set $P1844["bareblock"], $P1843
.annotate 'line', 677
    find_lex $P1845, "$/"
    find_lex $P1846, "$past"
    $P1847 = $P1845."!make"($P1846)
.annotate 'line', 672
    .return ($P1847)
  control_1826:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1848, exception, "payload"
    .return ($P1848)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<sigil>"  :subid("100_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1852
.annotate 'line', 680
    new $P1851, 'ExceptionHandler'
    set_addr $P1851, control_1850
    $P1851."handle_types"(57)
    push_eh $P1851
    .lex "self", self
    .lex "$/", param_1852
.annotate 'line', 681
    new $P1853, "Undef"
    .lex "$name", $P1853
    find_lex $P1856, "$/"
    unless_null $P1856, vivify_556
    $P1856 = root_new ['parrot';'Hash']
  vivify_556:
    set $P1857, $P1856["sigil"]
    unless_null $P1857, vivify_557
    new $P1857, "Undef"
  vivify_557:
    set $S1858, $P1857
    iseq $I1859, $S1858, "@"
    if $I1859, if_1855
.annotate 'line', 682
    find_lex $P1863, "$/"
    unless_null $P1863, vivify_558
    $P1863 = root_new ['parrot';'Hash']
  vivify_558:
    set $P1864, $P1863["sigil"]
    unless_null $P1864, vivify_559
    new $P1864, "Undef"
  vivify_559:
    set $S1865, $P1864
    iseq $I1866, $S1865, "%"
    if $I1866, if_1862
    new $P1868, "String"
    assign $P1868, "item"
    set $P1861, $P1868
    goto if_1862_end
  if_1862:
    new $P1867, "String"
    assign $P1867, "hash"
    set $P1861, $P1867
  if_1862_end:
    set $P1854, $P1861
.annotate 'line', 681
    goto if_1855_end
  if_1855:
    new $P1860, "String"
    assign $P1860, "list"
    set $P1854, $P1860
  if_1855_end:
    store_lex "$name", $P1854
.annotate 'line', 684
    find_lex $P1869, "$/"
    get_hll_global $P1870, ["PAST"], "Op"
    find_lex $P1871, "$name"
    find_lex $P1872, "$/"
    unless_null $P1872, vivify_560
    $P1872 = root_new ['parrot';'Hash']
  vivify_560:
    set $P1873, $P1872["semilist"]
    unless_null $P1873, vivify_561
    new $P1873, "Undef"
  vivify_561:
    $P1874 = $P1873."ast"()
    $P1875 = $P1870."new"($P1874, "callmethod" :named("pasttype"), $P1871 :named("name"))
    $P1876 = $P1869."!make"($P1875)
.annotate 'line', 680
    .return ($P1876)
  control_1850:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1877, exception, "payload"
    .return ($P1877)
.end


.namespace ["NQP";"Actions"]
.sub "semilist"  :subid("101_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1881
.annotate 'line', 687
    new $P1880, 'ExceptionHandler'
    set_addr $P1880, control_1879
    $P1880."handle_types"(57)
    push_eh $P1880
    .lex "self", self
    .lex "$/", param_1881
    find_lex $P1882, "$/"
    find_lex $P1883, "$/"
    unless_null $P1883, vivify_562
    $P1883 = root_new ['parrot';'Hash']
  vivify_562:
    set $P1884, $P1883["statement"]
    unless_null $P1884, vivify_563
    new $P1884, "Undef"
  vivify_563:
    $P1885 = $P1884."ast"()
    $P1886 = $P1882."!make"($P1885)
    .return ($P1886)
  control_1879:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1887, exception, "payload"
    .return ($P1887)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<[ ]>"  :subid("102_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1891
.annotate 'line', 689
    new $P1890, 'ExceptionHandler'
    set_addr $P1890, control_1889
    $P1890."handle_types"(57)
    push_eh $P1890
    .lex "self", self
    .lex "$/", param_1891
.annotate 'line', 690
    find_lex $P1892, "$/"
    get_hll_global $P1893, ["PAST"], "Var"
    find_lex $P1894, "$/"
    unless_null $P1894, vivify_564
    $P1894 = root_new ['parrot';'Hash']
  vivify_564:
    set $P1895, $P1894["EXPR"]
    unless_null $P1895, vivify_565
    new $P1895, "Undef"
  vivify_565:
    $P1896 = $P1895."ast"()
.annotate 'line', 692
    $P1897 = "vivitype"("@")
    $P1898 = $P1893."new"($P1896, "keyed_int" :named("scope"), "Undef" :named("viviself"), $P1897 :named("vivibase"))
.annotate 'line', 690
    $P1899 = $P1892."!make"($P1898)
.annotate 'line', 689
    .return ($P1899)
  control_1889:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1900, exception, "payload"
    .return ($P1900)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<{ }>"  :subid("103_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1904
.annotate 'line', 695
    new $P1903, 'ExceptionHandler'
    set_addr $P1903, control_1902
    $P1903."handle_types"(57)
    push_eh $P1903
    .lex "self", self
    .lex "$/", param_1904
.annotate 'line', 696
    find_lex $P1905, "$/"
    get_hll_global $P1906, ["PAST"], "Var"
    find_lex $P1907, "$/"
    unless_null $P1907, vivify_566
    $P1907 = root_new ['parrot';'Hash']
  vivify_566:
    set $P1908, $P1907["EXPR"]
    unless_null $P1908, vivify_567
    new $P1908, "Undef"
  vivify_567:
    $P1909 = $P1908."ast"()
.annotate 'line', 698
    $P1910 = "vivitype"("%")
    $P1911 = $P1906."new"($P1909, "keyed" :named("scope"), "Undef" :named("viviself"), $P1910 :named("vivibase"))
.annotate 'line', 696
    $P1912 = $P1905."!make"($P1911)
.annotate 'line', 695
    .return ($P1912)
  control_1902:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1913, exception, "payload"
    .return ($P1913)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<ang>"  :subid("104_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1917
.annotate 'line', 701
    new $P1916, 'ExceptionHandler'
    set_addr $P1916, control_1915
    $P1916."handle_types"(57)
    push_eh $P1916
    .lex "self", self
    .lex "$/", param_1917
.annotate 'line', 702
    find_lex $P1918, "$/"
    get_hll_global $P1919, ["PAST"], "Var"
    find_lex $P1920, "$/"
    unless_null $P1920, vivify_568
    $P1920 = root_new ['parrot';'Hash']
  vivify_568:
    set $P1921, $P1920["quote_EXPR"]
    unless_null $P1921, vivify_569
    new $P1921, "Undef"
  vivify_569:
    $P1922 = $P1921."ast"()
.annotate 'line', 704
    $P1923 = "vivitype"("%")
    $P1924 = $P1919."new"($P1922, "keyed" :named("scope"), "Undef" :named("viviself"), $P1923 :named("vivibase"))
.annotate 'line', 702
    $P1925 = $P1918."!make"($P1924)
.annotate 'line', 701
    .return ($P1925)
  control_1915:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1926, exception, "payload"
    .return ($P1926)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<( )>"  :subid("105_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1930
.annotate 'line', 707
    new $P1929, 'ExceptionHandler'
    set_addr $P1929, control_1928
    $P1929."handle_types"(57)
    push_eh $P1929
    .lex "self", self
    .lex "$/", param_1930
.annotate 'line', 708
    find_lex $P1931, "$/"
    find_lex $P1932, "$/"
    unless_null $P1932, vivify_570
    $P1932 = root_new ['parrot';'Hash']
  vivify_570:
    set $P1933, $P1932["arglist"]
    unless_null $P1933, vivify_571
    new $P1933, "Undef"
  vivify_571:
    $P1934 = $P1933."ast"()
    $P1935 = $P1931."!make"($P1934)
.annotate 'line', 707
    .return ($P1935)
  control_1928:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1936, exception, "payload"
    .return ($P1936)
.end


.namespace ["NQP";"Actions"]
.sub "value"  :subid("106_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1940
.annotate 'line', 711
    new $P1939, 'ExceptionHandler'
    set_addr $P1939, control_1938
    $P1939."handle_types"(57)
    push_eh $P1939
    .lex "self", self
    .lex "$/", param_1940
.annotate 'line', 712
    find_lex $P1941, "$/"
    find_lex $P1944, "$/"
    unless_null $P1944, vivify_572
    $P1944 = root_new ['parrot';'Hash']
  vivify_572:
    set $P1945, $P1944["quote"]
    unless_null $P1945, vivify_573
    new $P1945, "Undef"
  vivify_573:
    if $P1945, if_1943
    find_lex $P1949, "$/"
    unless_null $P1949, vivify_574
    $P1949 = root_new ['parrot';'Hash']
  vivify_574:
    set $P1950, $P1949["number"]
    unless_null $P1950, vivify_575
    new $P1950, "Undef"
  vivify_575:
    $P1951 = $P1950."ast"()
    set $P1942, $P1951
    goto if_1943_end
  if_1943:
    find_lex $P1946, "$/"
    unless_null $P1946, vivify_576
    $P1946 = root_new ['parrot';'Hash']
  vivify_576:
    set $P1947, $P1946["quote"]
    unless_null $P1947, vivify_577
    new $P1947, "Undef"
  vivify_577:
    $P1948 = $P1947."ast"()
    set $P1942, $P1948
  if_1943_end:
    $P1952 = $P1941."!make"($P1942)
.annotate 'line', 711
    .return ($P1952)
  control_1938:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1953, exception, "payload"
    .return ($P1953)
.end


.namespace ["NQP";"Actions"]
.sub "number"  :subid("107_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1957
.annotate 'line', 715
    new $P1956, 'ExceptionHandler'
    set_addr $P1956, control_1955
    $P1956."handle_types"(57)
    push_eh $P1956
    .lex "self", self
    .lex "$/", param_1957
.annotate 'line', 716
    new $P1958, "Undef"
    .lex "$value", $P1958
    find_lex $P1961, "$/"
    unless_null $P1961, vivify_578
    $P1961 = root_new ['parrot';'Hash']
  vivify_578:
    set $P1962, $P1961["dec_number"]
    unless_null $P1962, vivify_579
    new $P1962, "Undef"
  vivify_579:
    if $P1962, if_1960
    find_lex $P1966, "$/"
    unless_null $P1966, vivify_580
    $P1966 = root_new ['parrot';'Hash']
  vivify_580:
    set $P1967, $P1966["integer"]
    unless_null $P1967, vivify_581
    new $P1967, "Undef"
  vivify_581:
    $P1968 = $P1967."ast"()
    set $P1959, $P1968
    goto if_1960_end
  if_1960:
    find_lex $P1963, "$/"
    unless_null $P1963, vivify_582
    $P1963 = root_new ['parrot';'Hash']
  vivify_582:
    set $P1964, $P1963["dec_number"]
    unless_null $P1964, vivify_583
    new $P1964, "Undef"
  vivify_583:
    $P1965 = $P1964."ast"()
    set $P1959, $P1965
  if_1960_end:
    store_lex "$value", $P1959
.annotate 'line', 717
    find_lex $P1970, "$/"
    unless_null $P1970, vivify_584
    $P1970 = root_new ['parrot';'Hash']
  vivify_584:
    set $P1971, $P1970["sign"]
    unless_null $P1971, vivify_585
    new $P1971, "Undef"
  vivify_585:
    set $S1972, $P1971
    iseq $I1973, $S1972, "-"
    unless $I1973, if_1969_end
    find_lex $P1974, "$value"
    neg $P1975, $P1974
    store_lex "$value", $P1975
  if_1969_end:
.annotate 'line', 718
    find_lex $P1976, "$/"
    get_hll_global $P1977, ["PAST"], "Val"
    find_lex $P1978, "$value"
    $P1979 = $P1977."new"($P1978 :named("value"))
    $P1980 = $P1976."!make"($P1979)
.annotate 'line', 715
    .return ($P1980)
  control_1955:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1981, exception, "payload"
    .return ($P1981)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<apos>"  :subid("108_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1985
.annotate 'line', 721
    new $P1984, 'ExceptionHandler'
    set_addr $P1984, control_1983
    $P1984."handle_types"(57)
    push_eh $P1984
    .lex "self", self
    .lex "$/", param_1985
    find_lex $P1986, "$/"
    find_lex $P1987, "$/"
    unless_null $P1987, vivify_586
    $P1987 = root_new ['parrot';'Hash']
  vivify_586:
    set $P1988, $P1987["quote_EXPR"]
    unless_null $P1988, vivify_587
    new $P1988, "Undef"
  vivify_587:
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
.sub "quote:sym<dblq>"  :subid("109_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_1995
.annotate 'line', 722
    new $P1994, 'ExceptionHandler'
    set_addr $P1994, control_1993
    $P1994."handle_types"(57)
    push_eh $P1994
    .lex "self", self
    .lex "$/", param_1995
    find_lex $P1996, "$/"
    find_lex $P1997, "$/"
    unless_null $P1997, vivify_588
    $P1997 = root_new ['parrot';'Hash']
  vivify_588:
    set $P1998, $P1997["quote_EXPR"]
    unless_null $P1998, vivify_589
    new $P1998, "Undef"
  vivify_589:
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
.sub "quote:sym<qq>"  :subid("110_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_2005
.annotate 'line', 723
    new $P2004, 'ExceptionHandler'
    set_addr $P2004, control_2003
    $P2004."handle_types"(57)
    push_eh $P2004
    .lex "self", self
    .lex "$/", param_2005
    find_lex $P2006, "$/"
    find_lex $P2007, "$/"
    unless_null $P2007, vivify_590
    $P2007 = root_new ['parrot';'Hash']
  vivify_590:
    set $P2008, $P2007["quote_EXPR"]
    unless_null $P2008, vivify_591
    new $P2008, "Undef"
  vivify_591:
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
.sub "quote:sym<q>"  :subid("111_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_2015
.annotate 'line', 724
    new $P2014, 'ExceptionHandler'
    set_addr $P2014, control_2013
    $P2014."handle_types"(57)
    push_eh $P2014
    .lex "self", self
    .lex "$/", param_2015
    find_lex $P2016, "$/"
    find_lex $P2017, "$/"
    unless_null $P2017, vivify_592
    $P2017 = root_new ['parrot';'Hash']
  vivify_592:
    set $P2018, $P2017["quote_EXPR"]
    unless_null $P2018, vivify_593
    new $P2018, "Undef"
  vivify_593:
    $P2019 = $P2018."ast"()
    $P2020 = $P2016."!make"($P2019)
    .return ($P2020)
  control_2013:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2021, exception, "payload"
    .return ($P2021)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q>"  :subid("112_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_2025
.annotate 'line', 725
    new $P2024, 'ExceptionHandler'
    set_addr $P2024, control_2023
    $P2024."handle_types"(57)
    push_eh $P2024
    .lex "self", self
    .lex "$/", param_2025
    find_lex $P2026, "$/"
    find_lex $P2027, "$/"
    unless_null $P2027, vivify_594
    $P2027 = root_new ['parrot';'Hash']
  vivify_594:
    set $P2028, $P2027["quote_EXPR"]
    unless_null $P2028, vivify_595
    new $P2028, "Undef"
  vivify_595:
    $P2029 = $P2028."ast"()
    $P2030 = $P2026."!make"($P2029)
    .return ($P2030)
  control_2023:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2031, exception, "payload"
    .return ($P2031)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q:PIR>"  :subid("113_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_2035
.annotate 'line', 726
    new $P2034, 'ExceptionHandler'
    set_addr $P2034, control_2033
    $P2034."handle_types"(57)
    push_eh $P2034
    .lex "self", self
    .lex "$/", param_2035
.annotate 'line', 727
    find_lex $P2036, "$/"
    get_hll_global $P2037, ["PAST"], "Op"
    find_lex $P2038, "$/"
    unless_null $P2038, vivify_596
    $P2038 = root_new ['parrot';'Hash']
  vivify_596:
    set $P2039, $P2038["quote_EXPR"]
    unless_null $P2039, vivify_597
    new $P2039, "Undef"
  vivify_597:
    $P2040 = $P2039."ast"()
    $P2041 = $P2040."value"()
    find_lex $P2042, "$/"
    $P2043 = $P2037."new"($P2041 :named("inline"), "inline" :named("pasttype"), $P2042 :named("node"))
    $P2044 = $P2036."!make"($P2043)
.annotate 'line', 726
    .return ($P2044)
  control_2033:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2045, exception, "payload"
    .return ($P2045)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym</ />"  :subid("114_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_2049
    .param pmc param_2050 :optional
    .param int has_param_2050 :opt_flag
.annotate 'line', 732
    new $P2048, 'ExceptionHandler'
    set_addr $P2048, control_2047
    $P2048."handle_types"(57)
    push_eh $P2048
    .lex "self", self
    .lex "$/", param_2049
    if has_param_2050, optparam_598
    new $P2051, "Undef"
    set param_2050, $P2051
  optparam_598:
    .lex "$key", param_2050
.annotate 'line', 742
    new $P2052, "Undef"
    .lex "$regex", $P2052
.annotate 'line', 744
    new $P2053, "Undef"
    .lex "$past", $P2053
.annotate 'line', 733
    find_lex $P2055, "$key"
    set $S2056, $P2055
    iseq $I2057, $S2056, "open"
    unless $I2057, if_2054_end
.annotate 'line', 734

            null $P0
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate 'line', 738
    get_global $P2058, "@BLOCK"
    unless_null $P2058, vivify_599
    $P2058 = root_new ['parrot';'ResizablePMCArray']
  vivify_599:
    set $P2059, $P2058[0]
    unless_null $P2059, vivify_600
    new $P2059, "Undef"
  vivify_600:
    $P2059."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate 'line', 739
    get_global $P2060, "@BLOCK"
    unless_null $P2060, vivify_601
    $P2060 = root_new ['parrot';'ResizablePMCArray']
  vivify_601:
    set $P2061, $P2060[0]
    unless_null $P2061, vivify_602
    new $P2061, "Undef"
  vivify_602:
    $P2061."symbol"("$/", "lexical" :named("scope"))
.annotate 'line', 740
    new $P2062, "Exception"
    set $P2062['type'], 57
    new $P2063, "Integer"
    assign $P2063, 0
    setattribute $P2062, 'payload', $P2063
    throw $P2062
  if_2054_end:
.annotate 'line', 743
    get_hll_global $P2064, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P2065, "$/"
    unless_null $P2065, vivify_603
    $P2065 = root_new ['parrot';'Hash']
  vivify_603:
    set $P2066, $P2065["p6regex"]
    unless_null $P2066, vivify_604
    new $P2066, "Undef"
  vivify_604:
    $P2067 = $P2066."ast"()
    get_global $P2068, "@BLOCK"
    $P2069 = $P2068."shift"()
    $P2070 = $P2064($P2067, $P2069)
    store_lex "$regex", $P2070
.annotate 'line', 745
    get_hll_global $P2071, ["PAST"], "Op"
.annotate 'line', 747
    get_hll_global $P2072, ["PAST"], "Var"
    new $P2073, "ResizablePMCArray"
    push $P2073, "Regex"
    $P2074 = $P2072."new"("Regex" :named("name"), $P2073 :named("namespace"), "package" :named("scope"))
    find_lex $P2075, "$regex"
    $P2076 = $P2071."new"($P2074, $P2075, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate 'line', 745
    store_lex "$past", $P2076
.annotate 'line', 751
    find_lex $P2077, "$regex"
    find_lex $P2078, "$past"
    unless_null $P2078, vivify_605
    $P2078 = root_new ['parrot';'Hash']
    store_lex "$past", $P2078
  vivify_605:
    set $P2078["sink"], $P2077
.annotate 'line', 752
    find_lex $P2079, "$/"
    find_lex $P2080, "$past"
    $P2081 = $P2079."!make"($P2080)
.annotate 'line', 732
    .return ($P2081)
  control_2047:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2082, exception, "payload"
    .return ($P2082)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<$>"  :subid("115_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_2086
.annotate 'line', 755
    new $P2085, 'ExceptionHandler'
    set_addr $P2085, control_2084
    $P2085."handle_types"(57)
    push_eh $P2085
    .lex "self", self
    .lex "$/", param_2086
    find_lex $P2087, "$/"
    find_lex $P2088, "$/"
    unless_null $P2088, vivify_606
    $P2088 = root_new ['parrot';'Hash']
  vivify_606:
    set $P2089, $P2088["variable"]
    unless_null $P2089, vivify_607
    new $P2089, "Undef"
  vivify_607:
    $P2090 = $P2089."ast"()
    $P2091 = $P2087."!make"($P2090)
    .return ($P2091)
  control_2084:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2092, exception, "payload"
    .return ($P2092)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<{ }>"  :subid("116_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_2096
.annotate 'line', 756
    new $P2095, 'ExceptionHandler'
    set_addr $P2095, control_2094
    $P2095."handle_types"(57)
    push_eh $P2095
    .lex "self", self
    .lex "$/", param_2096
.annotate 'line', 757
    find_lex $P2097, "$/"
    get_hll_global $P2098, ["PAST"], "Op"
.annotate 'line', 758
    find_lex $P2099, "$/"
    unless_null $P2099, vivify_608
    $P2099 = root_new ['parrot';'Hash']
  vivify_608:
    set $P2100, $P2099["block"]
    unless_null $P2100, vivify_609
    new $P2100, "Undef"
  vivify_609:
    $P2101 = $P2100."ast"()
    $P2102 = "block_immediate"($P2101)
    find_lex $P2103, "$/"
    $P2104 = $P2098."new"($P2102, "set S*" :named("pirop"), $P2103 :named("node"))
.annotate 'line', 757
    $P2105 = $P2097."!make"($P2104)
.annotate 'line', 756
    .return ($P2105)
  control_2094:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2106, exception, "payload"
    .return ($P2106)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<esc>"  :subid("117_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_2110
.annotate 'line', 761
    new $P2109, 'ExceptionHandler'
    set_addr $P2109, control_2108
    $P2109."handle_types"(57)
    push_eh $P2109
    .lex "self", self
    .lex "$/", param_2110
    find_lex $P2111, "$/"
    $P2112 = $P2111."!make"("\e")
    .return ($P2112)
  control_2108:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2113, exception, "payload"
    .return ($P2113)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<.>"  :subid("118_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_2117
.annotate 'line', 765
    new $P2116, 'ExceptionHandler'
    set_addr $P2116, control_2115
    $P2116."handle_types"(57)
    push_eh $P2116
    .lex "self", self
    .lex "$/", param_2117
    find_lex $P2118, "$/"
    find_lex $P2119, "$/"
    unless_null $P2119, vivify_610
    $P2119 = root_new ['parrot';'Hash']
  vivify_610:
    set $P2120, $P2119["dotty"]
    unless_null $P2120, vivify_611
    new $P2120, "Undef"
  vivify_611:
    $P2121 = $P2120."ast"()
    $P2122 = $P2118."!make"($P2121)
    .return ($P2122)
  control_2115:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2123, exception, "payload"
    .return ($P2123)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<++>"  :subid("119_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_2127
.annotate 'line', 767
    new $P2126, 'ExceptionHandler'
    set_addr $P2126, control_2125
    $P2126."handle_types"(57)
    push_eh $P2126
    .lex "self", self
    .lex "$/", param_2127
.annotate 'line', 768
    find_lex $P2128, "$/"
    get_hll_global $P2129, ["PAST"], "Op"
.annotate 'line', 769
    new $P2130, "ResizablePMCArray"
    push $P2130, "    clone %r, %0"
    push $P2130, "    inc %0"
    $P2131 = $P2129."new"("postfix:<++>" :named("name"), $P2130 :named("inline"), "inline" :named("pasttype"))
.annotate 'line', 768
    $P2132 = $P2128."!make"($P2131)
.annotate 'line', 767
    .return ($P2132)
  control_2125:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2133, exception, "payload"
    .return ($P2133)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<-->"  :subid("120_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_2137
.annotate 'line', 773
    new $P2136, 'ExceptionHandler'
    set_addr $P2136, control_2135
    $P2136."handle_types"(57)
    push_eh $P2136
    .lex "self", self
    .lex "$/", param_2137
.annotate 'line', 774
    find_lex $P2138, "$/"
    get_hll_global $P2139, ["PAST"], "Op"
.annotate 'line', 775
    new $P2140, "ResizablePMCArray"
    push $P2140, "    clone %r, %0"
    push $P2140, "    dec %0"
    $P2141 = $P2139."new"("postfix:<-->" :named("name"), $P2140 :named("inline"), "inline" :named("pasttype"))
.annotate 'line', 774
    $P2142 = $P2138."!make"($P2141)
.annotate 'line', 773
    .return ($P2142)
  control_2135:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2143, exception, "payload"
    .return ($P2143)
.end


.namespace ["NQP";"Actions"]
.sub "prefix:sym<make>"  :subid("121_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_2147
.annotate 'line', 779
    new $P2146, 'ExceptionHandler'
    set_addr $P2146, control_2145
    $P2146."handle_types"(57)
    push_eh $P2146
    .lex "self", self
    .lex "$/", param_2147
.annotate 'line', 780
    find_lex $P2148, "$/"
    get_hll_global $P2149, ["PAST"], "Op"
.annotate 'line', 781
    get_hll_global $P2150, ["PAST"], "Var"
    $P2151 = $P2150."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P2152, "$/"
    $P2153 = $P2149."new"($P2151, "callmethod" :named("pasttype"), "!make" :named("name"), $P2152 :named("node"))
.annotate 'line', 780
    $P2154 = $P2148."!make"($P2153)
.annotate 'line', 779
    .return ($P2154)
  control_2145:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2155, exception, "payload"
    .return ($P2155)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<next>"  :subid("122_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_2160
.annotate 'line', 801
    new $P2159, 'ExceptionHandler'
    set_addr $P2159, control_2158
    $P2159."handle_types"(57)
    push_eh $P2159
    .lex "self", self
    .lex "$/", param_2160
    find_lex $P2161, "$/"
    $P2162 = "control"($P2161, ".CONTROL_LOOP_NEXT")
    .return ($P2162)
  control_2158:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2163, exception, "payload"
    .return ($P2163)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<last>"  :subid("123_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_2167
.annotate 'line', 802
    new $P2166, 'ExceptionHandler'
    set_addr $P2166, control_2165
    $P2166."handle_types"(57)
    push_eh $P2166
    .lex "self", self
    .lex "$/", param_2167
    find_lex $P2168, "$/"
    $P2169 = "control"($P2168, ".CONTROL_LOOP_LAST")
    .return ($P2169)
  control_2165:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2170, exception, "payload"
    .return ($P2170)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<redo>"  :subid("124_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_2174
.annotate 'line', 803
    new $P2173, 'ExceptionHandler'
    set_addr $P2173, control_2172
    $P2173."handle_types"(57)
    push_eh $P2173
    .lex "self", self
    .lex "$/", param_2174
    find_lex $P2175, "$/"
    $P2176 = "control"($P2175, ".CONTROL_LOOP_REDO")
    .return ($P2176)
  control_2172:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2177, exception, "payload"
    .return ($P2177)
.end


.namespace ["NQP";"Actions"]
.sub "infix:sym<~~>"  :subid("125_1274564782.90592") :method :outer("11_1274564782.90592")
    .param pmc param_2181
.annotate 'line', 805
    new $P2180, 'ExceptionHandler'
    set_addr $P2180, control_2179
    $P2180."handle_types"(57)
    push_eh $P2180
    .lex "self", self
    .lex "$/", param_2181
.annotate 'line', 806
    find_lex $P2182, "$/"
    get_hll_global $P2183, ["PAST"], "Op"
    find_lex $P2184, "$/"
    $P2185 = $P2183."new"("callmethod" :named("pasttype"), "ACCEPTS" :named("name"), $P2184 :named("node"))
    $P2186 = $P2182."!make"($P2185)
.annotate 'line', 805
    .return ($P2186)
  control_2179:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2187, exception, "payload"
    .return ($P2187)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block2188"  :subid("126_1274564782.90592") :outer("11_1274564782.90592")
.annotate 'line', 810
    .const 'Sub' $P2345 = "134_1274564782.90592" 
    capture_lex $P2345
    .const 'Sub' $P2332 = "133_1274564782.90592" 
    capture_lex $P2332
    .const 'Sub' $P2319 = "132_1274564782.90592" 
    capture_lex $P2319
    .const 'Sub' $P2306 = "131_1274564782.90592" 
    capture_lex $P2306
    .const 'Sub' $P2221 = "129_1274564782.90592" 
    capture_lex $P2221
    .const 'Sub' $P2207 = "128_1274564782.90592" 
    capture_lex $P2207
    .const 'Sub' $P2190 = "127_1274564782.90592" 
    capture_lex $P2190
.annotate 'line', 870
    .const 'Sub' $P2190 = "127_1274564782.90592" 
    newclosure $P2206, $P2190
    .lex "bindmatch", $P2206
.annotate 'line', 864
    find_lex $P2359, "bindmatch"
.annotate 'line', 810
    .return ($P2359)
.end


.namespace ["NQP";"RegexActions"]
.sub "bindmatch"  :subid("127_1274564782.90592") :outer("126_1274564782.90592")
    .param pmc param_2193
.annotate 'line', 870
    new $P2192, 'ExceptionHandler'
    set_addr $P2192, control_2191
    $P2192."handle_types"(57)
    push_eh $P2192
    .lex "$past", param_2193
.annotate 'line', 871
    get_hll_global $P2194, ["PAST"], "Stmts"
.annotate 'line', 872
    get_hll_global $P2195, ["PAST"], "Op"
.annotate 'line', 873
    get_hll_global $P2196, ["PAST"], "Var"
    $P2197 = $P2196."new"("$/" :named("name"))
.annotate 'line', 874
    get_hll_global $P2198, ["PAST"], "Op"
.annotate 'line', 875
    get_hll_global $P2199, ["PAST"], "Var"
    $P2200 = $P2199."new"(unicode:"$\x{a2}" :named("name"))
    $P2201 = $P2198."new"($P2200, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 874
    $P2202 = $P2195."new"($P2197, $P2201, "bind" :named("pasttype"))
.annotate 'line', 872
    find_lex $P2203, "$past"
    $P2204 = $P2194."new"($P2202, $P2203)
.annotate 'line', 870
    .return ($P2204)
  control_2191:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2205, exception, "payload"
    .return ($P2205)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<:my>"  :subid("128_1274564782.90592") :method :outer("126_1274564782.90592")
    .param pmc param_2210
.annotate 'line', 812
    new $P2209, 'ExceptionHandler'
    set_addr $P2209, control_2208
    $P2209."handle_types"(57)
    push_eh $P2209
    .lex "self", self
    .lex "$/", param_2210
.annotate 'line', 813
    new $P2211, "Undef"
    .lex "$past", $P2211
    find_lex $P2212, "$/"
    unless_null $P2212, vivify_612
    $P2212 = root_new ['parrot';'Hash']
  vivify_612:
    set $P2213, $P2212["statement"]
    unless_null $P2213, vivify_613
    new $P2213, "Undef"
  vivify_613:
    $P2214 = $P2213."ast"()
    store_lex "$past", $P2214
.annotate 'line', 814
    find_lex $P2215, "$/"
    get_hll_global $P2216, ["PAST"], "Regex"
    find_lex $P2217, "$past"
    $P2218 = $P2216."new"($P2217, "pastnode" :named("pasttype"))
    $P2219 = $P2215."!make"($P2218)
.annotate 'line', 812
    .return ($P2219)
  control_2208:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2220, exception, "payload"
    .return ($P2220)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<var>"  :subid("129_1274564782.90592") :method :outer("126_1274564782.90592")
    .param pmc param_2224
.annotate 'line', 817
    .const 'Sub' $P2280 = "130_1274564782.90592" 
    capture_lex $P2280
    new $P2223, 'ExceptionHandler'
    set_addr $P2223, control_2222
    $P2223."handle_types"(57)
    push_eh $P2223
    .lex "self", self
    .lex "$/", param_2224
.annotate 'line', 818
    new $P2225, "Undef"
    .lex "$past", $P2225
.annotate 'line', 819
    new $P2226, "Undef"
    .lex "$name", $P2226
.annotate 'line', 817
    find_lex $P2227, "$past"
.annotate 'line', 819
    find_lex $P2230, "$/"
    unless_null $P2230, vivify_614
    $P2230 = root_new ['parrot';'Hash']
  vivify_614:
    set $P2231, $P2230["pos"]
    unless_null $P2231, vivify_615
    new $P2231, "Undef"
  vivify_615:
    if $P2231, if_2229
    find_lex $P2235, "$/"
    unless_null $P2235, vivify_616
    $P2235 = root_new ['parrot';'Hash']
  vivify_616:
    set $P2236, $P2235["name"]
    unless_null $P2236, vivify_617
    new $P2236, "Undef"
  vivify_617:
    set $S2237, $P2236
    new $P2228, 'String'
    set $P2228, $S2237
    goto if_2229_end
  if_2229:
    find_lex $P2232, "$/"
    unless_null $P2232, vivify_618
    $P2232 = root_new ['parrot';'Hash']
  vivify_618:
    set $P2233, $P2232["pos"]
    unless_null $P2233, vivify_619
    new $P2233, "Undef"
  vivify_619:
    set $N2234, $P2233
    new $P2228, 'Float'
    set $P2228, $N2234
  if_2229_end:
    store_lex "$name", $P2228
.annotate 'line', 820
    find_lex $P2239, "$/"
    unless_null $P2239, vivify_620
    $P2239 = root_new ['parrot';'Hash']
  vivify_620:
    set $P2240, $P2239["quantified_atom"]
    unless_null $P2240, vivify_621
    new $P2240, "Undef"
  vivify_621:
    if $P2240, if_2238
.annotate 'line', 834
    find_lex $P2277, "$/"
    unless_null $P2277, vivify_622
    $P2277 = root_new ['parrot';'Hash']
  vivify_622:
    set $P2278, $P2277["var"]
    unless_null $P2278, vivify_623
    new $P2278, "Undef"
  vivify_623:
    if $P2278, if_2276
.annotate 'line', 842
    get_hll_global $P2298, ["PAST"], "Regex"
    find_lex $P2299, "$name"
    find_lex $P2300, "$/"
    $P2301 = $P2298."new"("!BACKREF", $P2299, "subrule" :named("pasttype"), "method" :named("subtype"), $P2300 :named("node"))
    store_lex "$past", $P2301
.annotate 'line', 841
    goto if_2276_end
  if_2276:
.annotate 'line', 834
    .const 'Sub' $P2280 = "130_1274564782.90592" 
    capture_lex $P2280
    $P2280()
  if_2276_end:
.annotate 'line', 833
    goto if_2238_end
  if_2238:
.annotate 'line', 821
    find_lex $P2242, "$/"
    unless_null $P2242, vivify_629
    $P2242 = root_new ['parrot';'Hash']
  vivify_629:
    set $P2243, $P2242["var"]
    unless_null $P2243, vivify_630
    new $P2243, "Undef"
  vivify_630:
    unless $P2243, if_2241_end
.annotate 'line', 822
    find_lex $P2244, "$/"
    $P2245 = $P2244."CURSOR"()
    $P2245."panic"("\"$var = \" syntax not yet supported in regexes")
  if_2241_end:
.annotate 'line', 824
    find_lex $P2246, "$/"
    unless_null $P2246, vivify_631
    $P2246 = root_new ['parrot';'Hash']
  vivify_631:
    set $P2247, $P2246["quantified_atom"]
    unless_null $P2247, vivify_632
    $P2247 = root_new ['parrot';'ResizablePMCArray']
  vivify_632:
    set $P2248, $P2247[0]
    unless_null $P2248, vivify_633
    new $P2248, "Undef"
  vivify_633:
    $P2249 = $P2248."ast"()
    store_lex "$past", $P2249
.annotate 'line', 825
    find_lex $P2253, "$past"
    $S2254 = $P2253."pasttype"()
    iseq $I2255, $S2254, "quant"
    if $I2255, if_2252
    new $P2251, 'Integer'
    set $P2251, $I2255
    goto if_2252_end
  if_2252:
    find_lex $P2256, "$past"
    unless_null $P2256, vivify_634
    $P2256 = root_new ['parrot';'ResizablePMCArray']
  vivify_634:
    set $P2257, $P2256[0]
    unless_null $P2257, vivify_635
    new $P2257, "Undef"
  vivify_635:
    $S2258 = $P2257."pasttype"()
    iseq $I2259, $S2258, "subrule"
    new $P2251, 'Integer'
    set $P2251, $I2259
  if_2252_end:
    if $P2251, if_2250
.annotate 'line', 828
    find_lex $P2265, "$past"
    $S2266 = $P2265."pasttype"()
    iseq $I2267, $S2266, "subrule"
    if $I2267, if_2264
.annotate 'line', 830
    get_hll_global $P2271, ["PAST"], "Regex"
    find_lex $P2272, "$past"
    find_lex $P2273, "$name"
    find_lex $P2274, "$/"
    $P2275 = $P2271."new"($P2272, $P2273 :named("name"), "subcapture" :named("pasttype"), $P2274 :named("node"))
    store_lex "$past", $P2275
.annotate 'line', 829
    goto if_2264_end
  if_2264:
.annotate 'line', 828
    get_hll_global $P2268, ["Regex";"P6Regex";"Actions"], "subrule_alias"
    find_lex $P2269, "$past"
    find_lex $P2270, "$name"
    $P2268($P2269, $P2270)
  if_2264_end:
    goto if_2250_end
  if_2250:
.annotate 'line', 826
    get_hll_global $P2260, ["Regex";"P6Regex";"Actions"], "subrule_alias"
    find_lex $P2261, "$past"
    unless_null $P2261, vivify_636
    $P2261 = root_new ['parrot';'ResizablePMCArray']
  vivify_636:
    set $P2262, $P2261[0]
    unless_null $P2262, vivify_637
    new $P2262, "Undef"
  vivify_637:
    find_lex $P2263, "$name"
    $P2260($P2262, $P2263)
  if_2250_end:
  if_2238_end:
.annotate 'line', 846
    find_lex $P2302, "$/"
    find_lex $P2303, "$past"
    $P2304 = $P2302."!make"($P2303)
.annotate 'line', 817
    .return ($P2304)
  control_2222:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2305, exception, "payload"
    .return ($P2305)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block2279"  :anon :subid("130_1274564782.90592") :outer("129_1274564782.90592")
.annotate 'line', 835
    $P2281 = root_new ['parrot';'ResizablePMCArray']
    .lex "@MODIFIERS", $P2281
.annotate 'line', 838
    new $P2282, "Undef"
    .lex "$subtype", $P2282
.annotate 'line', 835

                    $P2283 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
                
    store_lex "@MODIFIERS", $P2283
.annotate 'line', 838
    find_lex $P2286, "@MODIFIERS"
    unless_null $P2286, vivify_624
    $P2286 = root_new ['parrot';'ResizablePMCArray']
  vivify_624:
    set $P2287, $P2286[0]
    unless_null $P2287, vivify_625
    $P2287 = root_new ['parrot';'Hash']
  vivify_625:
    set $P2288, $P2287["i"]
    unless_null $P2288, vivify_626
    new $P2288, "Undef"
  vivify_626:
    if $P2288, if_2285
    new $P2290, "String"
    assign $P2290, "interp_literal"
    set $P2284, $P2290
    goto if_2285_end
  if_2285:
    new $P2289, "String"
    assign $P2289, "interp_literal_i"
    set $P2284, $P2289
  if_2285_end:
    store_lex "$subtype", $P2284
.annotate 'line', 839
    get_hll_global $P2291, ["PAST"], "Regex"
    find_lex $P2292, "$/"
    unless_null $P2292, vivify_627
    $P2292 = root_new ['parrot';'Hash']
  vivify_627:
    set $P2293, $P2292["var"]
    unless_null $P2293, vivify_628
    new $P2293, "Undef"
  vivify_628:
    $P2294 = $P2293."ast"()
    find_lex $P2295, "$subtype"
    find_lex $P2296, "$/"
    $P2297 = $P2291."new"($P2294, "pastnode" :named("pasttype"), $P2295 :named("subtype"), $P2296 :named("node"))
    store_lex "$past", $P2297
.annotate 'line', 834
    .return ($P2297)
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<var>"  :subid("131_1274564782.90592") :method :outer("126_1274564782.90592")
    .param pmc param_2309
.annotate 'line', 849
    new $P2308, 'ExceptionHandler'
    set_addr $P2308, control_2307
    $P2308."handle_types"(57)
    push_eh $P2308
    .lex "self", self
    .lex "$/", param_2309
.annotate 'line', 850
    find_lex $P2310, "$/"
    get_hll_global $P2311, ["PAST"], "Regex"
    find_lex $P2312, "$/"
    unless_null $P2312, vivify_638
    $P2312 = root_new ['parrot';'Hash']
  vivify_638:
    set $P2313, $P2312["var"]
    unless_null $P2313, vivify_639
    new $P2313, "Undef"
  vivify_639:
    $P2314 = $P2313."ast"()
    find_lex $P2315, "$/"
    $P2316 = $P2311."new"($P2314, "pastnode" :named("pasttype"), "interp_regex" :named("subtype"), $P2315 :named("node"))
    $P2317 = $P2310."!make"($P2316)
.annotate 'line', 849
    .return ($P2317)
  control_2307:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2318, exception, "payload"
    .return ($P2318)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<{ }>"  :subid("132_1274564782.90592") :method :outer("126_1274564782.90592")
    .param pmc param_2322
.annotate 'line', 855
    new $P2321, 'ExceptionHandler'
    set_addr $P2321, control_2320
    $P2321."handle_types"(57)
    push_eh $P2321
    .lex "self", self
    .lex "$/", param_2322
.annotate 'line', 856
    find_lex $P2323, "$/"
    get_hll_global $P2324, ["PAST"], "Regex"
    find_lex $P2325, "$/"
    find_lex $P2326, "$/"
    unless_null $P2326, vivify_640
    $P2326 = root_new ['parrot';'Hash']
  vivify_640:
    set $P2327, $P2326["codeblock"]
    unless_null $P2327, vivify_641
    new $P2327, "Undef"
  vivify_641:
    $P2328 = $P2327."ast"()
    $P2329 = $P2324."new"($P2328, $P2325 :named("node"), "pastnode" :named("pasttype"))
    $P2330 = $P2323."!make"($P2329)
.annotate 'line', 855
    .return ($P2330)
  control_2320:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2331, exception, "payload"
    .return ($P2331)
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<{ }>"  :subid("133_1274564782.90592") :method :outer("126_1274564782.90592")
    .param pmc param_2335
.annotate 'line', 859
    new $P2334, 'ExceptionHandler'
    set_addr $P2334, control_2333
    $P2334."handle_types"(57)
    push_eh $P2334
    .lex "self", self
    .lex "$/", param_2335
.annotate 'line', 860
    find_lex $P2336, "$/"
    get_hll_global $P2337, ["PAST"], "Regex"
    find_lex $P2338, "$/"
.annotate 'line', 861
    find_lex $P2339, "$/"
    unless_null $P2339, vivify_642
    $P2339 = root_new ['parrot';'Hash']
  vivify_642:
    set $P2340, $P2339["codeblock"]
    unless_null $P2340, vivify_643
    new $P2340, "Undef"
  vivify_643:
    $P2341 = $P2340."ast"()
    $P2342 = $P2337."new"($P2341, $P2338 :named("node"), "pastnode" :named("pasttype"), "interp_regex" :named("subtype"))
.annotate 'line', 860
    $P2343 = $P2336."!make"($P2342)
.annotate 'line', 859
    .return ($P2343)
  control_2333:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2344, exception, "payload"
    .return ($P2344)
.end


.namespace ["NQP";"RegexActions"]
.sub "codeblock"  :subid("134_1274564782.90592") :method :outer("126_1274564782.90592")
    .param pmc param_2348
.annotate 'line', 864
    new $P2347, 'ExceptionHandler'
    set_addr $P2347, control_2346
    $P2347."handle_types"(57)
    push_eh $P2347
    .lex "self", self
    .lex "$/", param_2348
.annotate 'line', 865
    new $P2349, "Undef"
    .lex "$block", $P2349
    find_lex $P2350, "$/"
    unless_null $P2350, vivify_644
    $P2350 = root_new ['parrot';'Hash']
  vivify_644:
    set $P2351, $P2350["block"]
    unless_null $P2351, vivify_645
    new $P2351, "Undef"
  vivify_645:
    $P2352 = $P2351."ast"()
    store_lex "$block", $P2352
.annotate 'line', 866
    find_lex $P2353, "$block"
    $P2353."blocktype"("immediate")
.annotate 'line', 867
    find_lex $P2354, "$/"
    find_lex $P2355, "$block"
    $P2356 = "bindmatch"($P2355)
    $P2357 = $P2354."!make"($P2356)
.annotate 'line', 864
    .return ($P2357)
  control_2346:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2358, exception, "payload"
    .return ($P2358)
.end


.namespace ["NQP";"Actions"]
.sub "_block2361" :load :anon :subid("135_1274564782.90592")
.annotate 'line', 3
    .const 'Sub' $P2363 = "11_1274564782.90592" 
    $P2364 = $P2363()
    .return ($P2364)
.end


.namespace []
.sub "_block2371" :load :anon :subid("137_1274564782.90592")
.annotate 'line', 1
    .const 'Sub' $P2373 = "10_1274564782.90592" 
    $P2374 = $P2373()
    .return ($P2374)
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
