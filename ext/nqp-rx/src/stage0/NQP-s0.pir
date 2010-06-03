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
.sub "_block11"  :anon :subid("10_1275600007.84296")
.annotate 'line', 0
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
    $P1408 = $P14()
.annotate 'line', 1
    .return ($P1408)
    .const 'Sub' $P1410 = "363_1275600007.84296" 
    .return ($P1410)
.end


.namespace []
.sub "" :load :init :subid("post364") :outer("10_1275600007.84296")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1275600007.84296" 
    .local pmc block
    set block, $P12
    $P1413 = get_root_global ["parrot"], "P6metaclass"
    $P1413."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1275600007.84296") :outer("10_1275600007.84296")
.annotate 'line', 4
    get_hll_global $P1324, ["NQP";"Regex"], "_block1323" 
    capture_lex $P1324
    .const 'Sub' $P1310 = "340_1275600007.84296" 
    capture_lex $P1310
    .const 'Sub' $P1304 = "338_1275600007.84296" 
    capture_lex $P1304
    .const 'Sub' $P1298 = "336_1275600007.84296" 
    capture_lex $P1298
    .const 'Sub' $P1292 = "334_1275600007.84296" 
    capture_lex $P1292
    .const 'Sub' $P1286 = "332_1275600007.84296" 
    capture_lex $P1286
    .const 'Sub' $P1280 = "330_1275600007.84296" 
    capture_lex $P1280
    .const 'Sub' $P1273 = "328_1275600007.84296" 
    capture_lex $P1273
    .const 'Sub' $P1266 = "326_1275600007.84296" 
    capture_lex $P1266
    .const 'Sub' $P1259 = "324_1275600007.84296" 
    capture_lex $P1259
    .const 'Sub' $P1252 = "322_1275600007.84296" 
    capture_lex $P1252
    .const 'Sub' $P1246 = "320_1275600007.84296" 
    capture_lex $P1246
    .const 'Sub' $P1239 = "318_1275600007.84296" 
    capture_lex $P1239
    .const 'Sub' $P1232 = "316_1275600007.84296" 
    capture_lex $P1232
    .const 'Sub' $P1225 = "314_1275600007.84296" 
    capture_lex $P1225
    .const 'Sub' $P1218 = "312_1275600007.84296" 
    capture_lex $P1218
    .const 'Sub' $P1211 = "310_1275600007.84296" 
    capture_lex $P1211
    .const 'Sub' $P1204 = "308_1275600007.84296" 
    capture_lex $P1204
    .const 'Sub' $P1197 = "306_1275600007.84296" 
    capture_lex $P1197
    .const 'Sub' $P1190 = "304_1275600007.84296" 
    capture_lex $P1190
    .const 'Sub' $P1183 = "302_1275600007.84296" 
    capture_lex $P1183
    .const 'Sub' $P1176 = "300_1275600007.84296" 
    capture_lex $P1176
    .const 'Sub' $P1169 = "298_1275600007.84296" 
    capture_lex $P1169
    .const 'Sub' $P1162 = "296_1275600007.84296" 
    capture_lex $P1162
    .const 'Sub' $P1155 = "294_1275600007.84296" 
    capture_lex $P1155
    .const 'Sub' $P1148 = "292_1275600007.84296" 
    capture_lex $P1148
    .const 'Sub' $P1141 = "290_1275600007.84296" 
    capture_lex $P1141
    .const 'Sub' $P1134 = "288_1275600007.84296" 
    capture_lex $P1134
    .const 'Sub' $P1127 = "286_1275600007.84296" 
    capture_lex $P1127
    .const 'Sub' $P1120 = "284_1275600007.84296" 
    capture_lex $P1120
    .const 'Sub' $P1113 = "282_1275600007.84296" 
    capture_lex $P1113
    .const 'Sub' $P1106 = "280_1275600007.84296" 
    capture_lex $P1106
    .const 'Sub' $P1099 = "278_1275600007.84296" 
    capture_lex $P1099
    .const 'Sub' $P1092 = "276_1275600007.84296" 
    capture_lex $P1092
    .const 'Sub' $P1085 = "274_1275600007.84296" 
    capture_lex $P1085
    .const 'Sub' $P1078 = "272_1275600007.84296" 
    capture_lex $P1078
    .const 'Sub' $P1071 = "270_1275600007.84296" 
    capture_lex $P1071
    .const 'Sub' $P1064 = "268_1275600007.84296" 
    capture_lex $P1064
    .const 'Sub' $P1058 = "266_1275600007.84296" 
    capture_lex $P1058
    .const 'Sub' $P1051 = "264_1275600007.84296" 
    capture_lex $P1051
    .const 'Sub' $P1044 = "262_1275600007.84296" 
    capture_lex $P1044
    .const 'Sub' $P1037 = "260_1275600007.84296" 
    capture_lex $P1037
    .const 'Sub' $P1030 = "258_1275600007.84296" 
    capture_lex $P1030
    .const 'Sub' $P1023 = "256_1275600007.84296" 
    capture_lex $P1023
    .const 'Sub' $P1016 = "254_1275600007.84296" 
    capture_lex $P1016
    .const 'Sub' $P1009 = "252_1275600007.84296" 
    capture_lex $P1009
    .const 'Sub' $P1003 = "250_1275600007.84296" 
    capture_lex $P1003
    .const 'Sub' $P997 = "248_1275600007.84296" 
    capture_lex $P997
    .const 'Sub' $P992 = "246_1275600007.84296" 
    capture_lex $P992
    .const 'Sub' $P986 = "244_1275600007.84296" 
    capture_lex $P986
    .const 'Sub' $P980 = "242_1275600007.84296" 
    capture_lex $P980
    .const 'Sub' $P975 = "240_1275600007.84296" 
    capture_lex $P975
    .const 'Sub' $P970 = "238_1275600007.84296" 
    capture_lex $P970
    .const 'Sub' $P963 = "236_1275600007.84296" 
    capture_lex $P963
    .const 'Sub' $P955 = "234_1275600007.84296" 
    capture_lex $P955
    .const 'Sub' $P950 = "232_1275600007.84296" 
    capture_lex $P950
    .const 'Sub' $P945 = "230_1275600007.84296" 
    capture_lex $P945
    .const 'Sub' $P940 = "228_1275600007.84296" 
    capture_lex $P940
    .const 'Sub' $P932 = "226_1275600007.84296" 
    capture_lex $P932
    .const 'Sub' $P924 = "224_1275600007.84296" 
    capture_lex $P924
    .const 'Sub' $P919 = "222_1275600007.84296" 
    capture_lex $P919
    .const 'Sub' $P914 = "220_1275600007.84296" 
    capture_lex $P914
    .const 'Sub' $P909 = "218_1275600007.84296" 
    capture_lex $P909
    .const 'Sub' $P903 = "216_1275600007.84296" 
    capture_lex $P903
    .const 'Sub' $P897 = "214_1275600007.84296" 
    capture_lex $P897
    .const 'Sub' $P891 = "212_1275600007.84296" 
    capture_lex $P891
    .const 'Sub' $P885 = "210_1275600007.84296" 
    capture_lex $P885
    .const 'Sub' $P879 = "208_1275600007.84296" 
    capture_lex $P879
    .const 'Sub' $P874 = "206_1275600007.84296" 
    capture_lex $P874
    .const 'Sub' $P869 = "204_1275600007.84296" 
    capture_lex $P869
    .const 'Sub' $P856 = "200_1275600007.84296" 
    capture_lex $P856
    .const 'Sub' $P848 = "198_1275600007.84296" 
    capture_lex $P848
    .const 'Sub' $P842 = "196_1275600007.84296" 
    capture_lex $P842
    .const 'Sub' $P835 = "194_1275600007.84296" 
    capture_lex $P835
    .const 'Sub' $P829 = "192_1275600007.84296" 
    capture_lex $P829
    .const 'Sub' $P821 = "190_1275600007.84296" 
    capture_lex $P821
    .const 'Sub' $P813 = "188_1275600007.84296" 
    capture_lex $P813
    .const 'Sub' $P807 = "186_1275600007.84296" 
    capture_lex $P807
    .const 'Sub' $P801 = "184_1275600007.84296" 
    capture_lex $P801
    .const 'Sub' $P786 = "180_1275600007.84296" 
    capture_lex $P786
    .const 'Sub' $P749 = "178_1275600007.84296" 
    capture_lex $P749
    .const 'Sub' $P741 = "176_1275600007.84296" 
    capture_lex $P741
    .const 'Sub' $P735 = "174_1275600007.84296" 
    capture_lex $P735
    .const 'Sub' $P725 = "172_1275600007.84296" 
    capture_lex $P725
    .const 'Sub' $P711 = "170_1275600007.84296" 
    capture_lex $P711
    .const 'Sub' $P702 = "168_1275600007.84296" 
    capture_lex $P702
    .const 'Sub' $P695 = "166_1275600007.84296" 
    capture_lex $P695
    .const 'Sub' $P686 = "164_1275600007.84296" 
    capture_lex $P686
    .const 'Sub' $P663 = "160_1275600007.84296" 
    capture_lex $P663
    .const 'Sub' $P639 = "158_1275600007.84296" 
    capture_lex $P639
    .const 'Sub' $P632 = "156_1275600007.84296" 
    capture_lex $P632
    .const 'Sub' $P625 = "154_1275600007.84296" 
    capture_lex $P625
    .const 'Sub' $P615 = "150_1275600007.84296" 
    capture_lex $P615
    .const 'Sub' $P607 = "148_1275600007.84296" 
    capture_lex $P607
    .const 'Sub' $P601 = "146_1275600007.84296" 
    capture_lex $P601
    .const 'Sub' $P590 = "144_1275600007.84296" 
    capture_lex $P590
    .const 'Sub' $P583 = "142_1275600007.84296" 
    capture_lex $P583
    .const 'Sub' $P576 = "140_1275600007.84296" 
    capture_lex $P576
    .const 'Sub' $P569 = "138_1275600007.84296" 
    capture_lex $P569
    .const 'Sub' $P542 = "134_1275600007.84296" 
    capture_lex $P542
    .const 'Sub' $P533 = "132_1275600007.84296" 
    capture_lex $P533
    .const 'Sub' $P526 = "130_1275600007.84296" 
    capture_lex $P526
    .const 'Sub' $P517 = "126_1275600007.84296" 
    capture_lex $P517
    .const 'Sub' $P512 = "124_1275600007.84296" 
    capture_lex $P512
    .const 'Sub' $P500 = "122_1275600007.84296" 
    capture_lex $P500
    .const 'Sub' $P488 = "120_1275600007.84296" 
    capture_lex $P488
    .const 'Sub' $P480 = "118_1275600007.84296" 
    capture_lex $P480
    .const 'Sub' $P475 = "116_1275600007.84296" 
    capture_lex $P475
    .const 'Sub' $P469 = "114_1275600007.84296" 
    capture_lex $P469
    .const 'Sub' $P463 = "112_1275600007.84296" 
    capture_lex $P463
    .const 'Sub' $P453 = "109_1275600007.84296" 
    capture_lex $P453
    .const 'Sub' $P447 = "107_1275600007.84296" 
    capture_lex $P447
    .const 'Sub' $P441 = "105_1275600007.84296" 
    capture_lex $P441
    .const 'Sub' $P435 = "103_1275600007.84296" 
    capture_lex $P435
    .const 'Sub' $P429 = "101_1275600007.84296" 
    capture_lex $P429
    .const 'Sub' $P423 = "99_1275600007.84296" 
    capture_lex $P423
    .const 'Sub' $P417 = "97_1275600007.84296" 
    capture_lex $P417
    .const 'Sub' $P409 = "95_1275600007.84296" 
    capture_lex $P409
    .const 'Sub' $P401 = "93_1275600007.84296" 
    capture_lex $P401
    .const 'Sub' $P389 = "89_1275600007.84296" 
    capture_lex $P389
    .const 'Sub' $P381 = "87_1275600007.84296" 
    capture_lex $P381
    .const 'Sub' $P371 = "83_1275600007.84296" 
    capture_lex $P371
    .const 'Sub' $P364 = "81_1275600007.84296" 
    capture_lex $P364
    .const 'Sub' $P357 = "79_1275600007.84296" 
    capture_lex $P357
    .const 'Sub' $P345 = "75_1275600007.84296" 
    capture_lex $P345
    .const 'Sub' $P337 = "73_1275600007.84296" 
    capture_lex $P337
    .const 'Sub' $P329 = "71_1275600007.84296" 
    capture_lex $P329
    .const 'Sub' $P309 = "69_1275600007.84296" 
    capture_lex $P309
    .const 'Sub' $P300 = "67_1275600007.84296" 
    capture_lex $P300
    .const 'Sub' $P282 = "64_1275600007.84296" 
    capture_lex $P282
    .const 'Sub' $P262 = "62_1275600007.84296" 
    capture_lex $P262
    .const 'Sub' $P253 = "58_1275600007.84296" 
    capture_lex $P253
    .const 'Sub' $P248 = "56_1275600007.84296" 
    capture_lex $P248
    .const 'Sub' $P239 = "52_1275600007.84296" 
    capture_lex $P239
    .const 'Sub' $P234 = "50_1275600007.84296" 
    capture_lex $P234
    .const 'Sub' $P229 = "48_1275600007.84296" 
    capture_lex $P229
    .const 'Sub' $P221 = "46_1275600007.84296" 
    capture_lex $P221
    .const 'Sub' $P214 = "44_1275600007.84296" 
    capture_lex $P214
    .const 'Sub' $P208 = "42_1275600007.84296" 
    capture_lex $P208
    .const 'Sub' $P200 = "40_1275600007.84296" 
    capture_lex $P200
    .const 'Sub' $P194 = "38_1275600007.84296" 
    capture_lex $P194
    .const 'Sub' $P188 = "36_1275600007.84296" 
    capture_lex $P188
    .const 'Sub' $P172 = "33_1275600007.84296" 
    capture_lex $P172
    .const 'Sub' $P159 = "31_1275600007.84296" 
    capture_lex $P159
    .const 'Sub' $P152 = "29_1275600007.84296" 
    capture_lex $P152
    .const 'Sub' $P102 = "26_1275600007.84296" 
    capture_lex $P102
    .const 'Sub' $P84 = "23_1275600007.84296" 
    capture_lex $P84
    .const 'Sub' $P70 = "21_1275600007.84296" 
    capture_lex $P70
    .const 'Sub' $P56 = "19_1275600007.84296" 
    capture_lex $P56
    .const 'Sub' $P48 = "17_1275600007.84296" 
    capture_lex $P48
    .const 'Sub' $P41 = "15_1275600007.84296" 
    capture_lex $P41
    .const 'Sub' $P35 = "13_1275600007.84296" 
    capture_lex $P35
    .const 'Sub' $P15 = "12_1275600007.84296" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 562
    get_hll_global $P1324, ["NQP";"Regex"], "_block1323" 
    capture_lex $P1324
    $P1387 = $P1324()
.annotate 'line', 4
    .return ($P1387)
    .const 'Sub' $P1389 = "362_1275600007.84296" 
    .return ($P1389)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post365") :outer("11_1275600007.84296")
.annotate 'line', 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 446
    get_hll_global $P1392, ["NQP"], "Grammar"
    $P1392."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate 'line', 447
    get_hll_global $P1393, ["NQP"], "Grammar"
    $P1393."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate 'line', 448
    get_hll_global $P1394, ["NQP"], "Grammar"
    $P1394."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate 'line', 449
    get_hll_global $P1395, ["NQP"], "Grammar"
    $P1395."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate 'line', 450
    get_hll_global $P1396, ["NQP"], "Grammar"
    $P1396."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate 'line', 451
    get_hll_global $P1397, ["NQP"], "Grammar"
    $P1397."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate 'line', 452
    get_hll_global $P1398, ["NQP"], "Grammar"
    $P1398."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate 'line', 453
    get_hll_global $P1399, ["NQP"], "Grammar"
    $P1399."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate 'line', 454
    get_hll_global $P1400, ["NQP"], "Grammar"
    $P1400."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate 'line', 455
    get_hll_global $P1401, ["NQP"], "Grammar"
    $P1401."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate 'line', 456
    get_hll_global $P1402, ["NQP"], "Grammar"
    $P1402."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate 'line', 457
    get_hll_global $P1403, ["NQP"], "Grammar"
    $P1403."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate 'line', 458
    get_hll_global $P1404, ["NQP"], "Grammar"
    $P1404."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate 'line', 459
    get_hll_global $P1405, ["NQP"], "Grammar"
    $P1405."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate 'line', 460
    get_hll_global $P1406, ["NQP"], "Grammar"
    $P1406."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate 'line', 445
    $P1407 = get_root_global ["parrot"], "P6metaclass"
    $P1407."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "TOP"  :subid("12_1275600007.84296") :method :outer("11_1275600007.84296")
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
.annotate 'line', 11
    new $P20, "Undef"
    .lex "$*MULTINESS", $P20
.annotate 'line', 4
    find_lex $P21, "%*LANG"
    unless_null $P21, vivify_366
    get_hll_global $P21, "%LANG"
    unless_null $P21, vivify_367
    die "Contextual %*LANG not found"
  vivify_367:
  vivify_366:
.annotate 'line', 6
    get_hll_global $P22, ["NQP"], "Regex"
    find_lex $P23, "%*LANG"
    unless_null $P23, vivify_368
    get_hll_global $P23, "%LANG"
    unless_null $P23, vivify_369
    die "Contextual %*LANG not found"
  vivify_369:
    store_lex "%*LANG", $P23
  vivify_368:
    set $P23["Regex"], $P22
.annotate 'line', 7
    get_hll_global $P24, ["NQP"], "RegexActions"
    find_lex $P25, "%*LANG"
    unless_null $P25, vivify_370
    get_hll_global $P25, "%LANG"
    unless_null $P25, vivify_371
    die "Contextual %*LANG not found"
  vivify_371:
    store_lex "%*LANG", $P25
  vivify_370:
    set $P25["Regex-actions"], $P24
.annotate 'line', 8
    get_hll_global $P26, ["NQP"], "Grammar"
    find_lex $P27, "%*LANG"
    unless_null $P27, vivify_372
    get_hll_global $P27, "%LANG"
    unless_null $P27, vivify_373
    die "Contextual %*LANG not found"
  vivify_373:
    store_lex "%*LANG", $P27
  vivify_372:
    set $P27["MAIN"], $P26
.annotate 'line', 9
    get_hll_global $P28, ["NQP"], "Actions"
    find_lex $P29, "%*LANG"
    unless_null $P29, vivify_374
    get_hll_global $P29, "%LANG"
    unless_null $P29, vivify_375
    die "Contextual %*LANG not found"
  vivify_375:
    store_lex "%*LANG", $P29
  vivify_374:
    set $P29["MAIN-actions"], $P28
.annotate 'line', 10
    new $P30, "String"
    assign $P30, ""
    store_lex "$*SCOPE", $P30
.annotate 'line', 11
    new $P31, "String"
    assign $P31, ""
    store_lex "$*MULTINESS", $P31
.annotate 'line', 12
    find_lex $P32, "self"
    $P33 = $P32."comp_unit"()
.annotate 'line', 4
    .return ($P33)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P34, exception, "payload"
    .return ($P34)
.end


.namespace ["NQP";"Grammar"]
.sub "identifier"  :subid("13_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx36_tgt
    .local int rx36_pos
    .local int rx36_off
    .local int rx36_eos
    .local int rx36_rep
    .local pmc rx36_cur
    (rx36_cur, rx36_pos, rx36_tgt) = self."!cursor_start"()
    rx36_cur."!cursor_debug"("START ", "identifier")
    .lex unicode:"$\x{a2}", rx36_cur
    .local pmc match
    .lex "$/", match
    length rx36_eos, rx36_tgt
    gt rx36_pos, rx36_eos, rx36_done
    set rx36_off, 0
    lt rx36_pos, 2, rx36_start
    sub rx36_off, rx36_pos, 1
    substr rx36_tgt, rx36_tgt, rx36_off
  rx36_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan40_done
    goto rxscan40_scan
  rxscan40_loop:
    ($P10) = rx36_cur."from"()
    inc $P10
    set rx36_pos, $P10
    ge rx36_pos, rx36_eos, rxscan40_done
  rxscan40_scan:
    set_addr $I10, rxscan40_loop
    rx36_cur."!mark_push"(0, rx36_pos, $I10)
  rxscan40_done:
.annotate 'line', 17
  # rx subrule "ident" subtype=capture negate=
    rx36_cur."!cursor_pos"(rx36_pos)
    $P10 = rx36_cur."ident"()
    unless $P10, rx36_fail
    rx36_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("ident")
    rx36_pos = $P10."pos"()
  # rx pass
    rx36_cur."!cursor_pass"(rx36_pos, "identifier")
    rx36_cur."!cursor_debug"("PASS  ", "identifier", " at pos=", rx36_pos)
    .return (rx36_cur)
  rx36_fail:
.annotate 'line', 4
    (rx36_rep, rx36_pos, $I10, $P10) = rx36_cur."!mark_fail"(0)
    lt rx36_pos, -1, rx36_done
    eq rx36_pos, -1, rx36_fail
    jump $I10
  rx36_done:
    rx36_cur."!cursor_fail"()
    rx36_cur."!cursor_debug"("FAIL  ", "identifier")
    .return (rx36_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__identifier"  :subid("14_1275600007.84296") :method
.annotate 'line', 4
    $P38 = self."!PREFIX__!subrule"("ident", "")
    new $P39, "ResizablePMCArray"
    push $P39, $P38
    .return ($P39)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx42_tgt
    .local int rx42_pos
    .local int rx42_off
    .local int rx42_eos
    .local int rx42_rep
    .local pmc rx42_cur
    (rx42_cur, rx42_pos, rx42_tgt) = self."!cursor_start"()
    rx42_cur."!cursor_debug"("START ", "name")
    rx42_cur."!cursor_caparray"("identifier")
    .lex unicode:"$\x{a2}", rx42_cur
    .local pmc match
    .lex "$/", match
    length rx42_eos, rx42_tgt
    gt rx42_pos, rx42_eos, rx42_done
    set rx42_off, 0
    lt rx42_pos, 2, rx42_start
    sub rx42_off, rx42_pos, 1
    substr rx42_tgt, rx42_tgt, rx42_off
  rx42_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan45_done
    goto rxscan45_scan
  rxscan45_loop:
    ($P10) = rx42_cur."from"()
    inc $P10
    set rx42_pos, $P10
    ge rx42_pos, rx42_eos, rxscan45_done
  rxscan45_scan:
    set_addr $I10, rxscan45_loop
    rx42_cur."!mark_push"(0, rx42_pos, $I10)
  rxscan45_done:
.annotate 'line', 19
  # rx rxquantr46 ** 1..*
    set_addr $I47, rxquantr46_done
    rx42_cur."!mark_push"(0, -1, $I47)
  rxquantr46_loop:
  # rx subrule "identifier" subtype=capture negate=
    rx42_cur."!cursor_pos"(rx42_pos)
    $P10 = rx42_cur."identifier"()
    unless $P10, rx42_fail
    rx42_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx42_pos = $P10."pos"()
    (rx42_rep) = rx42_cur."!mark_commit"($I47)
    rx42_cur."!mark_push"(rx42_rep, rx42_pos, $I47)
  # rx literal  "::"
    add $I11, rx42_pos, 2
    gt $I11, rx42_eos, rx42_fail
    sub $I11, rx42_pos, rx42_off
    substr $S10, rx42_tgt, $I11, 2
    ne $S10, "::", rx42_fail
    add rx42_pos, 2
    goto rxquantr46_loop
  rxquantr46_done:
  # rx pass
    rx42_cur."!cursor_pass"(rx42_pos, "name")
    rx42_cur."!cursor_debug"("PASS  ", "name", " at pos=", rx42_pos)
    .return (rx42_cur)
  rx42_fail:
.annotate 'line', 4
    (rx42_rep, rx42_pos, $I10, $P10) = rx42_cur."!mark_fail"(0)
    lt rx42_pos, -1, rx42_done
    eq rx42_pos, -1, rx42_fail
    jump $I10
  rx42_done:
    rx42_cur."!cursor_fail"()
    rx42_cur."!cursor_debug"("FAIL  ", "name")
    .return (rx42_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__name"  :subid("16_1275600007.84296") :method
.annotate 'line', 4
    new $P44, "ResizablePMCArray"
    push $P44, ""
    .return ($P44)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx49_tgt
    .local int rx49_pos
    .local int rx49_off
    .local int rx49_eos
    .local int rx49_rep
    .local pmc rx49_cur
    (rx49_cur, rx49_pos, rx49_tgt) = self."!cursor_start"()
    rx49_cur."!cursor_debug"("START ", "deflongname")
    rx49_cur."!cursor_caparray"("colonpair")
    .lex unicode:"$\x{a2}", rx49_cur
    .local pmc match
    .lex "$/", match
    length rx49_eos, rx49_tgt
    gt rx49_pos, rx49_eos, rx49_done
    set rx49_off, 0
    lt rx49_pos, 2, rx49_start
    sub rx49_off, rx49_pos, 1
    substr rx49_tgt, rx49_tgt, rx49_off
  rx49_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan53_done
    goto rxscan53_scan
  rxscan53_loop:
    ($P10) = rx49_cur."from"()
    inc $P10
    set rx49_pos, $P10
    ge rx49_pos, rx49_eos, rxscan53_done
  rxscan53_scan:
    set_addr $I10, rxscan53_loop
    rx49_cur."!mark_push"(0, rx49_pos, $I10)
  rxscan53_done:
.annotate 'line', 22
  # rx subrule "identifier" subtype=capture negate=
    rx49_cur."!cursor_pos"(rx49_pos)
    $P10 = rx49_cur."identifier"()
    unless $P10, rx49_fail
    rx49_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx49_pos = $P10."pos"()
  # rx rxquantr54 ** 0..1
    set_addr $I55, rxquantr54_done
    rx49_cur."!mark_push"(0, rx49_pos, $I55)
  rxquantr54_loop:
  # rx subrule "colonpair" subtype=capture negate=
    rx49_cur."!cursor_pos"(rx49_pos)
    $P10 = rx49_cur."colonpair"()
    unless $P10, rx49_fail
    rx49_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx49_pos = $P10."pos"()
    (rx49_rep) = rx49_cur."!mark_commit"($I55)
  rxquantr54_done:
.annotate 'line', 21
  # rx pass
    rx49_cur."!cursor_pass"(rx49_pos, "deflongname")
    rx49_cur."!cursor_debug"("PASS  ", "deflongname", " at pos=", rx49_pos)
    .return (rx49_cur)
  rx49_fail:
.annotate 'line', 4
    (rx49_rep, rx49_pos, $I10, $P10) = rx49_cur."!mark_fail"(0)
    lt rx49_pos, -1, rx49_done
    eq rx49_pos, -1, rx49_fail
    jump $I10
  rx49_done:
    rx49_cur."!cursor_fail"()
    rx49_cur."!cursor_debug"("FAIL  ", "deflongname")
    .return (rx49_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__deflongname"  :subid("18_1275600007.84296") :method
.annotate 'line', 4
    $P51 = self."!PREFIX__!subrule"("identifier", "")
    new $P52, "ResizablePMCArray"
    push $P52, $P51
    .return ($P52)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx57_tgt
    .local int rx57_pos
    .local int rx57_off
    .local int rx57_eos
    .local int rx57_rep
    .local pmc rx57_cur
    (rx57_cur, rx57_pos, rx57_tgt) = self."!cursor_start"()
    rx57_cur."!cursor_debug"("START ", "ENDSTMT")
    .lex unicode:"$\x{a2}", rx57_cur
    .local pmc match
    .lex "$/", match
    length rx57_eos, rx57_tgt
    gt rx57_pos, rx57_eos, rx57_done
    set rx57_off, 0
    lt rx57_pos, 2, rx57_start
    sub rx57_off, rx57_pos, 1
    substr rx57_tgt, rx57_tgt, rx57_off
  rx57_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan60_done
    goto rxscan60_scan
  rxscan60_loop:
    ($P10) = rx57_cur."from"()
    inc $P10
    set rx57_pos, $P10
    ge rx57_pos, rx57_eos, rxscan60_done
  rxscan60_scan:
    set_addr $I10, rxscan60_loop
    rx57_cur."!mark_push"(0, rx57_pos, $I10)
  rxscan60_done:
.annotate 'line', 29
  # rx rxquantr61 ** 0..1
    set_addr $I69, rxquantr61_done
    rx57_cur."!mark_push"(0, rx57_pos, $I69)
  rxquantr61_loop:
  alt62_0:
.annotate 'line', 26
    set_addr $I10, alt62_1
    rx57_cur."!mark_push"(0, rx57_pos, $I10)
.annotate 'line', 27
  # rx rxquantr63 ** 0..*
    set_addr $I64, rxquantr63_done
    rx57_cur."!mark_push"(0, rx57_pos, $I64)
  rxquantr63_loop:
  # rx enumcharlist negate=0 
    ge rx57_pos, rx57_eos, rx57_fail
    sub $I10, rx57_pos, rx57_off
    substr $S10, rx57_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx57_fail
    inc rx57_pos
    (rx57_rep) = rx57_cur."!mark_commit"($I64)
    rx57_cur."!mark_push"(rx57_rep, rx57_pos, $I64)
    goto rxquantr63_loop
  rxquantr63_done:
  # rxanchor eol
    sub $I10, rx57_pos, rx57_off
    is_cclass $I11, 4096, rx57_tgt, $I10
    if $I11, rxanchor65_done
    ne rx57_pos, rx57_eos, rx57_fail
    eq rx57_pos, 0, rxanchor65_done
    dec $I10
    is_cclass $I11, 4096, rx57_tgt, $I10
    if $I11, rx57_fail
  rxanchor65_done:
  # rx subrule "ws" subtype=method negate=
    rx57_cur."!cursor_pos"(rx57_pos)
    $P10 = rx57_cur."ws"()
    unless $P10, rx57_fail
    rx57_pos = $P10."pos"()
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx57_cur."!cursor_pos"(rx57_pos)
    $P10 = rx57_cur."MARKER"("endstmt")
    unless $P10, rx57_fail
    goto alt62_end
  alt62_1:
.annotate 'line', 28
  # rx rxquantr66 ** 0..1
    set_addr $I67, rxquantr66_done
    rx57_cur."!mark_push"(0, rx57_pos, $I67)
  rxquantr66_loop:
  # rx subrule "unv" subtype=method negate=
    rx57_cur."!cursor_pos"(rx57_pos)
    $P10 = rx57_cur."unv"()
    unless $P10, rx57_fail
    rx57_pos = $P10."pos"()
    (rx57_rep) = rx57_cur."!mark_commit"($I67)
  rxquantr66_done:
  # rxanchor eol
    sub $I10, rx57_pos, rx57_off
    is_cclass $I11, 4096, rx57_tgt, $I10
    if $I11, rxanchor68_done
    ne rx57_pos, rx57_eos, rx57_fail
    eq rx57_pos, 0, rxanchor68_done
    dec $I10
    is_cclass $I11, 4096, rx57_tgt, $I10
    if $I11, rx57_fail
  rxanchor68_done:
  # rx subrule "ws" subtype=method negate=
    rx57_cur."!cursor_pos"(rx57_pos)
    $P10 = rx57_cur."ws"()
    unless $P10, rx57_fail
    rx57_pos = $P10."pos"()
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx57_cur."!cursor_pos"(rx57_pos)
    $P10 = rx57_cur."MARKER"("endstmt")
    unless $P10, rx57_fail
  alt62_end:
.annotate 'line', 29
    (rx57_rep) = rx57_cur."!mark_commit"($I69)
  rxquantr61_done:
.annotate 'line', 25
  # rx pass
    rx57_cur."!cursor_pass"(rx57_pos, "ENDSTMT")
    rx57_cur."!cursor_debug"("PASS  ", "ENDSTMT", " at pos=", rx57_pos)
    .return (rx57_cur)
  rx57_fail:
.annotate 'line', 4
    (rx57_rep, rx57_pos, $I10, $P10) = rx57_cur."!mark_fail"(0)
    lt rx57_pos, -1, rx57_done
    eq rx57_pos, -1, rx57_fail
    jump $I10
  rx57_done:
    rx57_cur."!cursor_fail"()
    rx57_cur."!cursor_debug"("FAIL  ", "ENDSTMT")
    .return (rx57_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__ENDSTMT"  :subid("20_1275600007.84296") :method
.annotate 'line', 4
    new $P59, "ResizablePMCArray"
    push $P59, ""
    .return ($P59)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx71_tgt
    .local int rx71_pos
    .local int rx71_off
    .local int rx71_eos
    .local int rx71_rep
    .local pmc rx71_cur
    (rx71_cur, rx71_pos, rx71_tgt) = self."!cursor_start"()
    rx71_cur."!cursor_debug"("START ", "ws")
    .lex unicode:"$\x{a2}", rx71_cur
    .local pmc match
    .lex "$/", match
    length rx71_eos, rx71_tgt
    gt rx71_pos, rx71_eos, rx71_done
    set rx71_off, 0
    lt rx71_pos, 2, rx71_start
    sub rx71_off, rx71_pos, 1
    substr rx71_tgt, rx71_tgt, rx71_off
  rx71_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan74_done
    goto rxscan74_scan
  rxscan74_loop:
    ($P10) = rx71_cur."from"()
    inc $P10
    set rx71_pos, $P10
    ge rx71_pos, rx71_eos, rxscan74_done
  rxscan74_scan:
    set_addr $I10, rxscan74_loop
    rx71_cur."!mark_push"(0, rx71_pos, $I10)
  rxscan74_done:
  alt75_0:
.annotate 'line', 32
    set_addr $I10, alt75_1
    rx71_cur."!mark_push"(0, rx71_pos, $I10)
.annotate 'line', 33
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx71_cur."!cursor_pos"(rx71_pos)
    $P10 = rx71_cur."MARKED"("ws")
    unless $P10, rx71_fail
    goto alt75_end
  alt75_1:
.annotate 'line', 34
  # rx subrule "ww" subtype=zerowidth negate=1
    rx71_cur."!cursor_pos"(rx71_pos)
    $P10 = rx71_cur."ww"()
    if $P10, rx71_fail
.annotate 'line', 39
  # rx rxquantr76 ** 0..*
    set_addr $I83, rxquantr76_done
    rx71_cur."!mark_push"(0, rx71_pos, $I83)
  rxquantr76_loop:
  alt77_0:
.annotate 'line', 35
    set_addr $I10, alt77_1
    rx71_cur."!mark_push"(0, rx71_pos, $I10)
  # rx rxquantr78 ** 1..*
    set_addr $I79, rxquantr78_done
    rx71_cur."!mark_push"(0, -1, $I79)
  rxquantr78_loop:
  # rx enumcharlist negate=0 
    ge rx71_pos, rx71_eos, rx71_fail
    sub $I10, rx71_pos, rx71_off
    substr $S10, rx71_tgt, $I10, 1
    index $I11, unicode:"\n\x{b}\f\r\x{85}\u2028\u2029", $S10
    lt $I11, 0, rx71_fail
    inc rx71_pos
    (rx71_rep) = rx71_cur."!mark_commit"($I79)
    rx71_cur."!mark_push"(rx71_rep, rx71_pos, $I79)
    goto rxquantr78_loop
  rxquantr78_done:
    goto alt77_end
  alt77_1:
    set_addr $I10, alt77_2
    rx71_cur."!mark_push"(0, rx71_pos, $I10)
.annotate 'line', 36
  # rx literal  "#"
    add $I11, rx71_pos, 1
    gt $I11, rx71_eos, rx71_fail
    sub $I11, rx71_pos, rx71_off
    substr $S10, rx71_tgt, $I11, 1
    ne $S10, "#", rx71_fail
    add rx71_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx71_pos, rx71_off
    find_cclass $I11, 4096, rx71_tgt, $I10, rx71_eos
    add rx71_pos, rx71_off, $I11
    goto alt77_end
  alt77_2:
    set_addr $I10, alt77_3
    rx71_cur."!mark_push"(0, rx71_pos, $I10)
.annotate 'line', 37
  # rxanchor bol
    eq rx71_pos, 0, rxanchor80_done
    ge rx71_pos, rx71_eos, rx71_fail
    sub $I10, rx71_pos, rx71_off
    dec $I10
    is_cclass $I11, 4096, rx71_tgt, $I10
    unless $I11, rx71_fail
  rxanchor80_done:
  # rx subrule "pod_comment" subtype=method negate=
    rx71_cur."!cursor_pos"(rx71_pos)
    $P10 = rx71_cur."pod_comment"()
    unless $P10, rx71_fail
    rx71_pos = $P10."pos"()
    goto alt77_end
  alt77_3:
.annotate 'line', 38
  # rx rxquantr81 ** 1..*
    set_addr $I82, rxquantr81_done
    rx71_cur."!mark_push"(0, -1, $I82)
  rxquantr81_loop:
  # rx enumcharlist negate=0 
    ge rx71_pos, rx71_eos, rx71_fail
    sub $I10, rx71_pos, rx71_off
    substr $S10, rx71_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx71_fail
    inc rx71_pos
    (rx71_rep) = rx71_cur."!mark_commit"($I82)
    rx71_cur."!mark_push"(rx71_rep, rx71_pos, $I82)
    goto rxquantr81_loop
  rxquantr81_done:
  alt77_end:
.annotate 'line', 39
    (rx71_rep) = rx71_cur."!mark_commit"($I83)
    rx71_cur."!mark_push"(rx71_rep, rx71_pos, $I83)
    goto rxquantr76_loop
  rxquantr76_done:
.annotate 'line', 40
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx71_cur."!cursor_pos"(rx71_pos)
    $P10 = rx71_cur."MARKER"("ws")
    unless $P10, rx71_fail
  alt75_end:
.annotate 'line', 32
  # rx pass
    rx71_cur."!cursor_pass"(rx71_pos, "ws")
    rx71_cur."!cursor_debug"("PASS  ", "ws", " at pos=", rx71_pos)
    .return (rx71_cur)
  rx71_fail:
.annotate 'line', 4
    (rx71_rep, rx71_pos, $I10, $P10) = rx71_cur."!mark_fail"(0)
    lt rx71_pos, -1, rx71_done
    eq rx71_pos, -1, rx71_fail
    jump $I10
  rx71_done:
    rx71_cur."!cursor_fail"()
    rx71_cur."!cursor_debug"("FAIL  ", "ws")
    .return (rx71_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__ws"  :subid("22_1275600007.84296") :method
.annotate 'line', 4
    new $P73, "ResizablePMCArray"
    push $P73, ""
    push $P73, ""
    .return ($P73)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .const 'Sub' $P92 = "25_1275600007.84296" 
    capture_lex $P92
    .local string rx85_tgt
    .local int rx85_pos
    .local int rx85_off
    .local int rx85_eos
    .local int rx85_rep
    .local pmc rx85_cur
    (rx85_cur, rx85_pos, rx85_tgt) = self."!cursor_start"()
    rx85_cur."!cursor_debug"("START ", "unv")
    .lex unicode:"$\x{a2}", rx85_cur
    .local pmc match
    .lex "$/", match
    length rx85_eos, rx85_tgt
    gt rx85_pos, rx85_eos, rx85_done
    set rx85_off, 0
    lt rx85_pos, 2, rx85_start
    sub rx85_off, rx85_pos, 1
    substr rx85_tgt, rx85_tgt, rx85_off
  rx85_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan88_done
    goto rxscan88_scan
  rxscan88_loop:
    ($P10) = rx85_cur."from"()
    inc $P10
    set rx85_pos, $P10
    ge rx85_pos, rx85_eos, rxscan88_done
  rxscan88_scan:
    set_addr $I10, rxscan88_loop
    rx85_cur."!mark_push"(0, rx85_pos, $I10)
  rxscan88_done:
  alt89_0:
.annotate 'line', 45
    set_addr $I10, alt89_1
    rx85_cur."!mark_push"(0, rx85_pos, $I10)
.annotate 'line', 46
  # rxanchor bol
    eq rx85_pos, 0, rxanchor90_done
    ge rx85_pos, rx85_eos, rx85_fail
    sub $I10, rx85_pos, rx85_off
    dec $I10
    is_cclass $I11, 4096, rx85_tgt, $I10
    unless $I11, rx85_fail
  rxanchor90_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx85_cur."!cursor_pos"(rx85_pos)
    .const 'Sub' $P92 = "25_1275600007.84296" 
    capture_lex $P92
    $P10 = rx85_cur."before"($P92)
    unless $P10, rx85_fail
  # rx subrule "pod_comment" subtype=method negate=
    rx85_cur."!cursor_pos"(rx85_pos)
    $P10 = rx85_cur."pod_comment"()
    unless $P10, rx85_fail
    rx85_pos = $P10."pos"()
    goto alt89_end
  alt89_1:
    set_addr $I10, alt89_2
    rx85_cur."!mark_push"(0, rx85_pos, $I10)
.annotate 'line', 47
  # rx rxquantr98 ** 0..*
    set_addr $I99, rxquantr98_done
    rx85_cur."!mark_push"(0, rx85_pos, $I99)
  rxquantr98_loop:
  # rx enumcharlist negate=0 
    ge rx85_pos, rx85_eos, rx85_fail
    sub $I10, rx85_pos, rx85_off
    substr $S10, rx85_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx85_fail
    inc rx85_pos
    (rx85_rep) = rx85_cur."!mark_commit"($I99)
    rx85_cur."!mark_push"(rx85_rep, rx85_pos, $I99)
    goto rxquantr98_loop
  rxquantr98_done:
  # rx literal  "#"
    add $I11, rx85_pos, 1
    gt $I11, rx85_eos, rx85_fail
    sub $I11, rx85_pos, rx85_off
    substr $S10, rx85_tgt, $I11, 1
    ne $S10, "#", rx85_fail
    add rx85_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx85_pos, rx85_off
    find_cclass $I11, 4096, rx85_tgt, $I10, rx85_eos
    add rx85_pos, rx85_off, $I11
    goto alt89_end
  alt89_2:
.annotate 'line', 48
  # rx rxquantr100 ** 1..*
    set_addr $I101, rxquantr100_done
    rx85_cur."!mark_push"(0, -1, $I101)
  rxquantr100_loop:
  # rx enumcharlist negate=0 
    ge rx85_pos, rx85_eos, rx85_fail
    sub $I10, rx85_pos, rx85_off
    substr $S10, rx85_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx85_fail
    inc rx85_pos
    (rx85_rep) = rx85_cur."!mark_commit"($I101)
    rx85_cur."!mark_push"(rx85_rep, rx85_pos, $I101)
    goto rxquantr100_loop
  rxquantr100_done:
  alt89_end:
.annotate 'line', 43
  # rx pass
    rx85_cur."!cursor_pass"(rx85_pos, "unv")
    rx85_cur."!cursor_debug"("PASS  ", "unv", " at pos=", rx85_pos)
    .return (rx85_cur)
  rx85_fail:
.annotate 'line', 4
    (rx85_rep, rx85_pos, $I10, $P10) = rx85_cur."!mark_fail"(0)
    lt rx85_pos, -1, rx85_done
    eq rx85_pos, -1, rx85_fail
    jump $I10
  rx85_done:
    rx85_cur."!cursor_fail"()
    rx85_cur."!cursor_debug"("FAIL  ", "unv")
    .return (rx85_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__unv"  :subid("24_1275600007.84296") :method
.annotate 'line', 4
    new $P87, "ResizablePMCArray"
    push $P87, ""
    push $P87, ""
    push $P87, ""
    .return ($P87)
.end


.namespace ["NQP";"Grammar"]
.sub "_block91"  :anon :subid("25_1275600007.84296") :method :outer("23_1275600007.84296")
.annotate 'line', 46
    .local string rx93_tgt
    .local int rx93_pos
    .local int rx93_off
    .local int rx93_eos
    .local int rx93_rep
    .local pmc rx93_cur
    (rx93_cur, rx93_pos, rx93_tgt) = self."!cursor_start"()
    rx93_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx93_cur
    .local pmc match
    .lex "$/", match
    length rx93_eos, rx93_tgt
    gt rx93_pos, rx93_eos, rx93_done
    set rx93_off, 0
    lt rx93_pos, 2, rx93_start
    sub rx93_off, rx93_pos, 1
    substr rx93_tgt, rx93_tgt, rx93_off
  rx93_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan94_done
    goto rxscan94_scan
  rxscan94_loop:
    ($P10) = rx93_cur."from"()
    inc $P10
    set rx93_pos, $P10
    ge rx93_pos, rx93_eos, rxscan94_done
  rxscan94_scan:
    set_addr $I10, rxscan94_loop
    rx93_cur."!mark_push"(0, rx93_pos, $I10)
  rxscan94_done:
  # rx rxquantr95 ** 0..*
    set_addr $I96, rxquantr95_done
    rx93_cur."!mark_push"(0, rx93_pos, $I96)
  rxquantr95_loop:
  # rx enumcharlist negate=0 
    ge rx93_pos, rx93_eos, rx93_fail
    sub $I10, rx93_pos, rx93_off
    substr $S10, rx93_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx93_fail
    inc rx93_pos
    (rx93_rep) = rx93_cur."!mark_commit"($I96)
    rx93_cur."!mark_push"(rx93_rep, rx93_pos, $I96)
    goto rxquantr95_loop
  rxquantr95_done:
  # rx literal  "="
    add $I11, rx93_pos, 1
    gt $I11, rx93_eos, rx93_fail
    sub $I11, rx93_pos, rx93_off
    substr $S10, rx93_tgt, $I11, 1
    ne $S10, "=", rx93_fail
    add rx93_pos, 1
  alt97_0:
    set_addr $I10, alt97_1
    rx93_cur."!mark_push"(0, rx93_pos, $I10)
  # rx charclass w
    ge rx93_pos, rx93_eos, rx93_fail
    sub $I10, rx93_pos, rx93_off
    is_cclass $I11, 8192, rx93_tgt, $I10
    unless $I11, rx93_fail
    inc rx93_pos
    goto alt97_end
  alt97_1:
  # rx literal  "\\"
    add $I11, rx93_pos, 1
    gt $I11, rx93_eos, rx93_fail
    sub $I11, rx93_pos, rx93_off
    substr $S10, rx93_tgt, $I11, 1
    ne $S10, "\\", rx93_fail
    add rx93_pos, 1
  alt97_end:
  # rx pass
    rx93_cur."!cursor_pass"(rx93_pos, "")
    rx93_cur."!cursor_debug"("PASS  ", "", " at pos=", rx93_pos)
    .return (rx93_cur)
  rx93_fail:
    (rx93_rep, rx93_pos, $I10, $P10) = rx93_cur."!mark_fail"(0)
    lt rx93_pos, -1, rx93_done
    eq rx93_pos, -1, rx93_fail
    jump $I10
  rx93_done:
    rx93_cur."!cursor_fail"()
    rx93_cur."!cursor_debug"("FAIL  ", "")
    .return (rx93_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "pod_comment"  :subid("26_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .const 'Sub' $P143 = "28_1275600007.84296" 
    capture_lex $P143
    .local string rx103_tgt
    .local int rx103_pos
    .local int rx103_off
    .local int rx103_eos
    .local int rx103_rep
    .local pmc rx103_cur
    (rx103_cur, rx103_pos, rx103_tgt) = self."!cursor_start"()
    rx103_cur."!cursor_debug"("START ", "pod_comment")
    .lex unicode:"$\x{a2}", rx103_cur
    .local pmc match
    .lex "$/", match
    length rx103_eos, rx103_tgt
    gt rx103_pos, rx103_eos, rx103_done
    set rx103_off, 0
    lt rx103_pos, 2, rx103_start
    sub rx103_off, rx103_pos, 1
    substr rx103_tgt, rx103_tgt, rx103_off
  rx103_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan106_done
    goto rxscan106_scan
  rxscan106_loop:
    ($P10) = rx103_cur."from"()
    inc $P10
    set rx103_pos, $P10
    ge rx103_pos, rx103_eos, rxscan106_done
  rxscan106_scan:
    set_addr $I10, rxscan106_loop
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
  rxscan106_done:
.annotate 'line', 53
  # rxanchor bol
    eq rx103_pos, 0, rxanchor107_done
    ge rx103_pos, rx103_eos, rx103_fail
    sub $I10, rx103_pos, rx103_off
    dec $I10
    is_cclass $I11, 4096, rx103_tgt, $I10
    unless $I11, rx103_fail
  rxanchor107_done:
  # rx rxquantr108 ** 0..*
    set_addr $I109, rxquantr108_done
    rx103_cur."!mark_push"(0, rx103_pos, $I109)
  rxquantr108_loop:
  # rx enumcharlist negate=0 
    ge rx103_pos, rx103_eos, rx103_fail
    sub $I10, rx103_pos, rx103_off
    substr $S10, rx103_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx103_fail
    inc rx103_pos
    (rx103_rep) = rx103_cur."!mark_commit"($I109)
    rx103_cur."!mark_push"(rx103_rep, rx103_pos, $I109)
    goto rxquantr108_loop
  rxquantr108_done:
  # rx literal  "="
    add $I11, rx103_pos, 1
    gt $I11, rx103_eos, rx103_fail
    sub $I11, rx103_pos, rx103_off
    substr $S10, rx103_tgt, $I11, 1
    ne $S10, "=", rx103_fail
    add rx103_pos, 1
  alt110_0:
.annotate 'line', 54
    set_addr $I10, alt110_1
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
.annotate 'line', 55
  # rx literal  "begin"
    add $I11, rx103_pos, 5
    gt $I11, rx103_eos, rx103_fail
    sub $I11, rx103_pos, rx103_off
    substr $S10, rx103_tgt, $I11, 5
    ne $S10, "begin", rx103_fail
    add rx103_pos, 5
  # rx rxquantr111 ** 1..*
    set_addr $I112, rxquantr111_done
    rx103_cur."!mark_push"(0, -1, $I112)
  rxquantr111_loop:
  # rx enumcharlist negate=0 
    ge rx103_pos, rx103_eos, rx103_fail
    sub $I10, rx103_pos, rx103_off
    substr $S10, rx103_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx103_fail
    inc rx103_pos
    (rx103_rep) = rx103_cur."!mark_commit"($I112)
    rx103_cur."!mark_push"(rx103_rep, rx103_pos, $I112)
    goto rxquantr111_loop
  rxquantr111_done:
  # rx literal  "END"
    add $I11, rx103_pos, 3
    gt $I11, rx103_eos, rx103_fail
    sub $I11, rx103_pos, rx103_off
    substr $S10, rx103_tgt, $I11, 3
    ne $S10, "END", rx103_fail
    add rx103_pos, 3
  # rxanchor rwb
    le rx103_pos, 0, rx103_fail
    sub $I10, rx103_pos, rx103_off
    is_cclass $I11, 8192, rx103_tgt, $I10
    if $I11, rx103_fail
    dec $I10
    is_cclass $I11, 8192, rx103_tgt, $I10
    unless $I11, rx103_fail
  alt113_0:
.annotate 'line', 56
    set_addr $I10, alt113_1
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
  # rx rxquantf114 ** 0..*
    set_addr $I10, rxquantf114_loop
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
    goto rxquantf114_done
  rxquantf114_loop:
  # rx charclass .
    ge rx103_pos, rx103_eos, rx103_fail
    inc rx103_pos
    set_addr $I10, rxquantf114_loop
    rx103_cur."!mark_push"($I115, rx103_pos, $I10)
  rxquantf114_done:
  # rx charclass nl
    ge rx103_pos, rx103_eos, rx103_fail
    sub $I10, rx103_pos, rx103_off
    is_cclass $I11, 4096, rx103_tgt, $I10
    unless $I11, rx103_fail
    substr $S10, rx103_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx103_pos, $I11
    inc rx103_pos
  # rx rxquantr116 ** 0..*
    set_addr $I117, rxquantr116_done
    rx103_cur."!mark_push"(0, rx103_pos, $I117)
  rxquantr116_loop:
  # rx enumcharlist negate=0 
    ge rx103_pos, rx103_eos, rx103_fail
    sub $I10, rx103_pos, rx103_off
    substr $S10, rx103_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx103_fail
    inc rx103_pos
    (rx103_rep) = rx103_cur."!mark_commit"($I117)
    rx103_cur."!mark_push"(rx103_rep, rx103_pos, $I117)
    goto rxquantr116_loop
  rxquantr116_done:
  # rx literal  "=end"
    add $I11, rx103_pos, 4
    gt $I11, rx103_eos, rx103_fail
    sub $I11, rx103_pos, rx103_off
    substr $S10, rx103_tgt, $I11, 4
    ne $S10, "=end", rx103_fail
    add rx103_pos, 4
  # rx rxquantr118 ** 1..*
    set_addr $I119, rxquantr118_done
    rx103_cur."!mark_push"(0, -1, $I119)
  rxquantr118_loop:
  # rx enumcharlist negate=0 
    ge rx103_pos, rx103_eos, rx103_fail
    sub $I10, rx103_pos, rx103_off
    substr $S10, rx103_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx103_fail
    inc rx103_pos
    (rx103_rep) = rx103_cur."!mark_commit"($I119)
    rx103_cur."!mark_push"(rx103_rep, rx103_pos, $I119)
    goto rxquantr118_loop
  rxquantr118_done:
  # rx literal  "END"
    add $I11, rx103_pos, 3
    gt $I11, rx103_eos, rx103_fail
    sub $I11, rx103_pos, rx103_off
    substr $S10, rx103_tgt, $I11, 3
    ne $S10, "END", rx103_fail
    add rx103_pos, 3
  # rxanchor rwb
    le rx103_pos, 0, rx103_fail
    sub $I10, rx103_pos, rx103_off
    is_cclass $I11, 8192, rx103_tgt, $I10
    if $I11, rx103_fail
    dec $I10
    is_cclass $I11, 8192, rx103_tgt, $I10
    unless $I11, rx103_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx103_pos, rx103_off
    find_cclass $I11, 4096, rx103_tgt, $I10, rx103_eos
    add rx103_pos, rx103_off, $I11
    goto alt113_end
  alt113_1:
  # rx charclass_q . r 0..-1
    sub $I10, rx103_pos, rx103_off
    find_not_cclass $I11, 65535, rx103_tgt, $I10, rx103_eos
    add rx103_pos, rx103_off, $I11
  alt113_end:
.annotate 'line', 55
    goto alt110_end
  alt110_1:
    set_addr $I10, alt110_2
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
.annotate 'line', 57
  # rx literal  "begin"
    add $I11, rx103_pos, 5
    gt $I11, rx103_eos, rx103_fail
    sub $I11, rx103_pos, rx103_off
    substr $S10, rx103_tgt, $I11, 5
    ne $S10, "begin", rx103_fail
    add rx103_pos, 5
  # rx rxquantr120 ** 1..*
    set_addr $I121, rxquantr120_done
    rx103_cur."!mark_push"(0, -1, $I121)
  rxquantr120_loop:
  # rx enumcharlist negate=0 
    ge rx103_pos, rx103_eos, rx103_fail
    sub $I10, rx103_pos, rx103_off
    substr $S10, rx103_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx103_fail
    inc rx103_pos
    (rx103_rep) = rx103_cur."!mark_commit"($I121)
    rx103_cur."!mark_push"(rx103_rep, rx103_pos, $I121)
    goto rxquantr120_loop
  rxquantr120_done:
  # rx subrule "identifier" subtype=capture negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."identifier"()
    unless $P10, rx103_fail
    rx103_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx103_pos = $P10."pos"()
  alt122_0:
.annotate 'line', 58
    set_addr $I10, alt122_1
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
.annotate 'line', 59
  # rx rxquantf123 ** 0..*
    set_addr $I10, rxquantf123_loop
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
    goto rxquantf123_done
  rxquantf123_loop:
  # rx charclass .
    ge rx103_pos, rx103_eos, rx103_fail
    inc rx103_pos
    set_addr $I10, rxquantf123_loop
    rx103_cur."!mark_push"($I124, rx103_pos, $I10)
  rxquantf123_done:
  # rx charclass nl
    ge rx103_pos, rx103_eos, rx103_fail
    sub $I10, rx103_pos, rx103_off
    is_cclass $I11, 4096, rx103_tgt, $I10
    unless $I11, rx103_fail
    substr $S10, rx103_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx103_pos, $I11
    inc rx103_pos
  # rx rxquantr125 ** 0..*
    set_addr $I126, rxquantr125_done
    rx103_cur."!mark_push"(0, rx103_pos, $I126)
  rxquantr125_loop:
  # rx enumcharlist negate=0 
    ge rx103_pos, rx103_eos, rx103_fail
    sub $I10, rx103_pos, rx103_off
    substr $S10, rx103_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx103_fail
    inc rx103_pos
    (rx103_rep) = rx103_cur."!mark_commit"($I126)
    rx103_cur."!mark_push"(rx103_rep, rx103_pos, $I126)
    goto rxquantr125_loop
  rxquantr125_done:
  # rx literal  "=end"
    add $I11, rx103_pos, 4
    gt $I11, rx103_eos, rx103_fail
    sub $I11, rx103_pos, rx103_off
    substr $S10, rx103_tgt, $I11, 4
    ne $S10, "=end", rx103_fail
    add rx103_pos, 4
  # rx rxquantr127 ** 1..*
    set_addr $I128, rxquantr127_done
    rx103_cur."!mark_push"(0, -1, $I128)
  rxquantr127_loop:
  # rx enumcharlist negate=0 
    ge rx103_pos, rx103_eos, rx103_fail
    sub $I10, rx103_pos, rx103_off
    substr $S10, rx103_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx103_fail
    inc rx103_pos
    (rx103_rep) = rx103_cur."!mark_commit"($I128)
    rx103_cur."!mark_push"(rx103_rep, rx103_pos, $I128)
    goto rxquantr127_loop
  rxquantr127_done:
  # rx subrule "!BACKREF" subtype=method negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."!BACKREF"("identifier")
    unless $P10, rx103_fail
    rx103_pos = $P10."pos"()
  # rxanchor rwb
    le rx103_pos, 0, rx103_fail
    sub $I10, rx103_pos, rx103_off
    is_cclass $I11, 8192, rx103_tgt, $I10
    if $I11, rx103_fail
    dec $I10
    is_cclass $I11, 8192, rx103_tgt, $I10
    unless $I11, rx103_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx103_pos, rx103_off
    find_cclass $I11, 4096, rx103_tgt, $I10, rx103_eos
    add rx103_pos, rx103_off, $I11
    goto alt122_end
  alt122_1:
.annotate 'line', 60
  # rx subrule "panic" subtype=method negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."panic"("=begin without matching =end")
    unless $P10, rx103_fail
    rx103_pos = $P10."pos"()
  alt122_end:
.annotate 'line', 57
    goto alt110_end
  alt110_2:
    set_addr $I10, alt110_3
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
.annotate 'line', 62
  # rx literal  "begin"
    add $I11, rx103_pos, 5
    gt $I11, rx103_eos, rx103_fail
    sub $I11, rx103_pos, rx103_off
    substr $S10, rx103_tgt, $I11, 5
    ne $S10, "begin", rx103_fail
    add rx103_pos, 5
  # rxanchor rwb
    le rx103_pos, 0, rx103_fail
    sub $I10, rx103_pos, rx103_off
    is_cclass $I11, 8192, rx103_tgt, $I10
    if $I11, rx103_fail
    dec $I10
    is_cclass $I11, 8192, rx103_tgt, $I10
    unless $I11, rx103_fail
  # rx rxquantr130 ** 0..*
    set_addr $I131, rxquantr130_done
    rx103_cur."!mark_push"(0, rx103_pos, $I131)
  rxquantr130_loop:
  # rx enumcharlist negate=0 
    ge rx103_pos, rx103_eos, rx103_fail
    sub $I10, rx103_pos, rx103_off
    substr $S10, rx103_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx103_fail
    inc rx103_pos
    (rx103_rep) = rx103_cur."!mark_commit"($I131)
    rx103_cur."!mark_push"(rx103_rep, rx103_pos, $I131)
    goto rxquantr130_loop
  rxquantr130_done:
  alt132_0:
.annotate 'line', 63
    set_addr $I10, alt132_1
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
  # rxanchor eol
    sub $I10, rx103_pos, rx103_off
    is_cclass $I11, 4096, rx103_tgt, $I10
    if $I11, rxanchor133_done
    ne rx103_pos, rx103_eos, rx103_fail
    eq rx103_pos, 0, rxanchor133_done
    dec $I10
    is_cclass $I11, 4096, rx103_tgt, $I10
    if $I11, rx103_fail
  rxanchor133_done:
    goto alt132_end
  alt132_1:
    set_addr $I10, alt132_2
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
  # rx literal  "#"
    add $I11, rx103_pos, 1
    gt $I11, rx103_eos, rx103_fail
    sub $I11, rx103_pos, rx103_off
    substr $S10, rx103_tgt, $I11, 1
    ne $S10, "#", rx103_fail
    add rx103_pos, 1
    goto alt132_end
  alt132_2:
  # rx subrule "panic" subtype=method negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."panic"("Unrecognized token after =begin")
    unless $P10, rx103_fail
    rx103_pos = $P10."pos"()
  alt132_end:
  alt134_0:
.annotate 'line', 64
    set_addr $I10, alt134_1
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
.annotate 'line', 65
  # rx rxquantf135 ** 0..*
    set_addr $I10, rxquantf135_loop
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
    goto rxquantf135_done
  rxquantf135_loop:
  # rx charclass .
    ge rx103_pos, rx103_eos, rx103_fail
    inc rx103_pos
    set_addr $I10, rxquantf135_loop
    rx103_cur."!mark_push"($I136, rx103_pos, $I10)
  rxquantf135_done:
  # rx charclass nl
    ge rx103_pos, rx103_eos, rx103_fail
    sub $I10, rx103_pos, rx103_off
    is_cclass $I11, 4096, rx103_tgt, $I10
    unless $I11, rx103_fail
    substr $S10, rx103_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx103_pos, $I11
    inc rx103_pos
  # rx rxquantr137 ** 0..*
    set_addr $I138, rxquantr137_done
    rx103_cur."!mark_push"(0, rx103_pos, $I138)
  rxquantr137_loop:
  # rx enumcharlist negate=0 
    ge rx103_pos, rx103_eos, rx103_fail
    sub $I10, rx103_pos, rx103_off
    substr $S10, rx103_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx103_fail
    inc rx103_pos
    (rx103_rep) = rx103_cur."!mark_commit"($I138)
    rx103_cur."!mark_push"(rx103_rep, rx103_pos, $I138)
    goto rxquantr137_loop
  rxquantr137_done:
  # rx literal  "=end"
    add $I11, rx103_pos, 4
    gt $I11, rx103_eos, rx103_fail
    sub $I11, rx103_pos, rx103_off
    substr $S10, rx103_tgt, $I11, 4
    ne $S10, "=end", rx103_fail
    add rx103_pos, 4
  # rxanchor rwb
    le rx103_pos, 0, rx103_fail
    sub $I10, rx103_pos, rx103_off
    is_cclass $I11, 8192, rx103_tgt, $I10
    if $I11, rx103_fail
    dec $I10
    is_cclass $I11, 8192, rx103_tgt, $I10
    unless $I11, rx103_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx103_pos, rx103_off
    find_cclass $I11, 4096, rx103_tgt, $I10, rx103_eos
    add rx103_pos, rx103_off, $I11
    goto alt134_end
  alt134_1:
.annotate 'line', 66
  # rx subrule "panic" subtype=method negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."panic"("=begin without matching =end")
    unless $P10, rx103_fail
    rx103_pos = $P10."pos"()
  alt134_end:
.annotate 'line', 62
    goto alt110_end
  alt110_3:
    set_addr $I10, alt110_4
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
.annotate 'line', 68
  # rx subrule "identifier" subtype=capture negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."identifier"()
    unless $P10, rx103_fail
    rx103_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx103_pos = $P10."pos"()
.annotate 'line', 69
  # rx rxquantf139 ** 0..*
    set_addr $I10, rxquantf139_loop
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
    goto rxquantf139_done
  rxquantf139_loop:
  # rx charclass .
    ge rx103_pos, rx103_eos, rx103_fail
    inc rx103_pos
    set_addr $I10, rxquantf139_loop
    rx103_cur."!mark_push"($I140, rx103_pos, $I10)
  rxquantf139_done:
  # rxanchor bol
    eq rx103_pos, 0, rxanchor141_done
    ge rx103_pos, rx103_eos, rx103_fail
    sub $I10, rx103_pos, rx103_off
    dec $I10
    is_cclass $I11, 4096, rx103_tgt, $I10
    unless $I11, rx103_fail
  rxanchor141_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    .const 'Sub' $P143 = "28_1275600007.84296" 
    capture_lex $P143
    $P10 = rx103_cur."before"($P143)
    unless $P10, rx103_fail
.annotate 'line', 68
    goto alt110_end
  alt110_4:
  alt151_0:
.annotate 'line', 75
    set_addr $I10, alt151_1
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
  # rx charclass s
    ge rx103_pos, rx103_eos, rx103_fail
    sub $I10, rx103_pos, rx103_off
    is_cclass $I11, 32, rx103_tgt, $I10
    unless $I11, rx103_fail
    inc rx103_pos
    goto alt151_end
  alt151_1:
  # rx subrule "panic" subtype=method negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."panic"("Illegal pod directive")
    unless $P10, rx103_fail
    rx103_pos = $P10."pos"()
  alt151_end:
.annotate 'line', 76
  # rx charclass_q N r 0..-1
    sub $I10, rx103_pos, rx103_off
    find_cclass $I11, 4096, rx103_tgt, $I10, rx103_eos
    add rx103_pos, rx103_off, $I11
  alt110_end:
.annotate 'line', 52
  # rx pass
    rx103_cur."!cursor_pass"(rx103_pos, "pod_comment")
    rx103_cur."!cursor_debug"("PASS  ", "pod_comment", " at pos=", rx103_pos)
    .return (rx103_cur)
  rx103_fail:
.annotate 'line', 4
    (rx103_rep, rx103_pos, $I10, $P10) = rx103_cur."!mark_fail"(0)
    lt rx103_pos, -1, rx103_done
    eq rx103_pos, -1, rx103_fail
    jump $I10
  rx103_done:
    rx103_cur."!cursor_fail"()
    rx103_cur."!cursor_debug"("FAIL  ", "pod_comment")
    .return (rx103_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pod_comment"  :subid("27_1275600007.84296") :method
.annotate 'line', 4
    new $P105, "ResizablePMCArray"
    push $P105, ""
    .return ($P105)
.end


.namespace ["NQP";"Grammar"]
.sub "_block142"  :anon :subid("28_1275600007.84296") :method :outer("26_1275600007.84296")
.annotate 'line', 69
    .local string rx144_tgt
    .local int rx144_pos
    .local int rx144_off
    .local int rx144_eos
    .local int rx144_rep
    .local pmc rx144_cur
    (rx144_cur, rx144_pos, rx144_tgt) = self."!cursor_start"()
    rx144_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx144_cur
    .local pmc match
    .lex "$/", match
    length rx144_eos, rx144_tgt
    gt rx144_pos, rx144_eos, rx144_done
    set rx144_off, 0
    lt rx144_pos, 2, rx144_start
    sub rx144_off, rx144_pos, 1
    substr rx144_tgt, rx144_tgt, rx144_off
  rx144_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan145_done
    goto rxscan145_scan
  rxscan145_loop:
    ($P10) = rx144_cur."from"()
    inc $P10
    set rx144_pos, $P10
    ge rx144_pos, rx144_eos, rxscan145_done
  rxscan145_scan:
    set_addr $I10, rxscan145_loop
    rx144_cur."!mark_push"(0, rx144_pos, $I10)
  rxscan145_done:
  # rx rxquantr146 ** 0..*
    set_addr $I147, rxquantr146_done
    rx144_cur."!mark_push"(0, rx144_pos, $I147)
  rxquantr146_loop:
  # rx enumcharlist negate=0 
    ge rx144_pos, rx144_eos, rx144_fail
    sub $I10, rx144_pos, rx144_off
    substr $S10, rx144_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx144_fail
    inc rx144_pos
    (rx144_rep) = rx144_cur."!mark_commit"($I147)
    rx144_cur."!mark_push"(rx144_rep, rx144_pos, $I147)
    goto rxquantr146_loop
  rxquantr146_done:
  alt148_0:
    set_addr $I10, alt148_1
    rx144_cur."!mark_push"(0, rx144_pos, $I10)
.annotate 'line', 70
  # rx literal  "="
    add $I11, rx144_pos, 1
    gt $I11, rx144_eos, rx144_fail
    sub $I11, rx144_pos, rx144_off
    substr $S10, rx144_tgt, $I11, 1
    ne $S10, "=", rx144_fail
    add rx144_pos, 1
.annotate 'line', 72
  # rx rxquantr149 ** 0..1
    set_addr $I150, rxquantr149_done
    rx144_cur."!mark_push"(0, rx144_pos, $I150)
  rxquantr149_loop:
.annotate 'line', 71
  # rx literal  "cut"
    add $I11, rx144_pos, 3
    gt $I11, rx144_eos, rx144_fail
    sub $I11, rx144_pos, rx144_off
    substr $S10, rx144_tgt, $I11, 3
    ne $S10, "cut", rx144_fail
    add rx144_pos, 3
  # rxanchor rwb
    le rx144_pos, 0, rx144_fail
    sub $I10, rx144_pos, rx144_off
    is_cclass $I11, 8192, rx144_tgt, $I10
    if $I11, rx144_fail
    dec $I10
    is_cclass $I11, 8192, rx144_tgt, $I10
    unless $I11, rx144_fail
.annotate 'line', 72
  # rx subrule "panic" subtype=method negate=
    rx144_cur."!cursor_pos"(rx144_pos)
    $P10 = rx144_cur."panic"("Obsolete pod format, please use =begin/=end instead")
    unless $P10, rx144_fail
    rx144_pos = $P10."pos"()
    (rx144_rep) = rx144_cur."!mark_commit"($I150)
  rxquantr149_done:
.annotate 'line', 69
    goto alt148_end
  alt148_1:
.annotate 'line', 73
  # rx charclass nl
    ge rx144_pos, rx144_eos, rx144_fail
    sub $I10, rx144_pos, rx144_off
    is_cclass $I11, 4096, rx144_tgt, $I10
    unless $I11, rx144_fail
    substr $S10, rx144_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx144_pos, $I11
    inc rx144_pos
  alt148_end:
.annotate 'line', 69
  # rx pass
    rx144_cur."!cursor_pass"(rx144_pos, "")
    rx144_cur."!cursor_debug"("PASS  ", "", " at pos=", rx144_pos)
    .return (rx144_cur)
  rx144_fail:
    (rx144_rep, rx144_pos, $I10, $P10) = rx144_cur."!mark_fail"(0)
    lt rx144_pos, -1, rx144_done
    eq rx144_pos, -1, rx144_fail
    jump $I10
  rx144_done:
    rx144_cur."!cursor_fail"()
    rx144_cur."!cursor_debug"("FAIL  ", "")
    .return (rx144_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "comp_unit"  :subid("29_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx153_tgt
    .local int rx153_pos
    .local int rx153_off
    .local int rx153_eos
    .local int rx153_rep
    .local pmc rx153_cur
    (rx153_cur, rx153_pos, rx153_tgt) = self."!cursor_start"()
    rx153_cur."!cursor_debug"("START ", "comp_unit")
    .lex unicode:"$\x{a2}", rx153_cur
    .local pmc match
    .lex "$/", match
    length rx153_eos, rx153_tgt
    gt rx153_pos, rx153_eos, rx153_done
    set rx153_off, 0
    lt rx153_pos, 2, rx153_start
    sub rx153_off, rx153_pos, 1
    substr rx153_tgt, rx153_tgt, rx153_off
  rx153_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan157_done
    goto rxscan157_scan
  rxscan157_loop:
    ($P10) = rx153_cur."from"()
    inc $P10
    set rx153_pos, $P10
    ge rx153_pos, rx153_eos, rxscan157_done
  rxscan157_scan:
    set_addr $I10, rxscan157_loop
    rx153_cur."!mark_push"(0, rx153_pos, $I10)
  rxscan157_done:
.annotate 'line', 84
  # rx subrule "newpad" subtype=method negate=
    rx153_cur."!cursor_pos"(rx153_pos)
    $P10 = rx153_cur."newpad"()
    unless $P10, rx153_fail
    rx153_pos = $P10."pos"()
.annotate 'line', 85
  # rx subrule "outerctx" subtype=method negate=
    rx153_cur."!cursor_pos"(rx153_pos)
    $P10 = rx153_cur."outerctx"()
    unless $P10, rx153_fail
    rx153_pos = $P10."pos"()
.annotate 'line', 86
  # rx subrule "statementlist" subtype=capture negate=
    rx153_cur."!cursor_pos"(rx153_pos)
    $P10 = rx153_cur."statementlist"()
    unless $P10, rx153_fail
    rx153_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx153_pos = $P10."pos"()
  alt158_0:
.annotate 'line', 87
    set_addr $I10, alt158_1
    rx153_cur."!mark_push"(0, rx153_pos, $I10)
  # rxanchor eos
    ne rx153_pos, rx153_eos, rx153_fail
    goto alt158_end
  alt158_1:
  # rx subrule "panic" subtype=method negate=
    rx153_cur."!cursor_pos"(rx153_pos)
    $P10 = rx153_cur."panic"("Confused")
    unless $P10, rx153_fail
    rx153_pos = $P10."pos"()
  alt158_end:
.annotate 'line', 83
  # rx pass
    rx153_cur."!cursor_pass"(rx153_pos, "comp_unit")
    rx153_cur."!cursor_debug"("PASS  ", "comp_unit", " at pos=", rx153_pos)
    .return (rx153_cur)
  rx153_fail:
.annotate 'line', 4
    (rx153_rep, rx153_pos, $I10, $P10) = rx153_cur."!mark_fail"(0)
    lt rx153_pos, -1, rx153_done
    eq rx153_pos, -1, rx153_fail
    jump $I10
  rx153_done:
    rx153_cur."!cursor_fail"()
    rx153_cur."!cursor_debug"("FAIL  ", "comp_unit")
    .return (rx153_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__comp_unit"  :subid("30_1275600007.84296") :method
.annotate 'line', 4
    $P155 = self."!PREFIX__!subrule"("", "")
    new $P156, "ResizablePMCArray"
    push $P156, $P155
    .return ($P156)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx160_tgt
    .local int rx160_pos
    .local int rx160_off
    .local int rx160_eos
    .local int rx160_rep
    .local pmc rx160_cur
    (rx160_cur, rx160_pos, rx160_tgt) = self."!cursor_start"()
    rx160_cur."!cursor_debug"("START ", "statementlist")
    rx160_cur."!cursor_caparray"("statement")
    .lex unicode:"$\x{a2}", rx160_cur
    .local pmc match
    .lex "$/", match
    length rx160_eos, rx160_tgt
    gt rx160_pos, rx160_eos, rx160_done
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
  alt164_0:
.annotate 'line', 90
    set_addr $I10, alt164_1
    rx160_cur."!mark_push"(0, rx160_pos, $I10)
.annotate 'line', 91
  # rx subrule "ws" subtype=method negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."ws"()
    unless $P10, rx160_fail
    rx160_pos = $P10."pos"()
  # rxanchor eos
    ne rx160_pos, rx160_eos, rx160_fail
  # rx subrule "ws" subtype=method negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."ws"()
    unless $P10, rx160_fail
    rx160_pos = $P10."pos"()
    goto alt164_end
  alt164_1:
.annotate 'line', 92
  # rx subrule "ws" subtype=method negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."ws"()
    unless $P10, rx160_fail
    rx160_pos = $P10."pos"()
  # rx rxquantr168 ** 0..*
    set_addr $I170, rxquantr168_done
    rx160_cur."!mark_push"(0, rx160_pos, $I170)
  rxquantr168_loop:
  # rx subrule "statement" subtype=capture negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."statement"()
    unless $P10, rx160_fail
    rx160_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx160_pos = $P10."pos"()
  # rx subrule "eat_terminator" subtype=method negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."eat_terminator"()
    unless $P10, rx160_fail
    rx160_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."ws"()
    unless $P10, rx160_fail
    rx160_pos = $P10."pos"()
    (rx160_rep) = rx160_cur."!mark_commit"($I170)
    rx160_cur."!mark_push"(rx160_rep, rx160_pos, $I170)
    goto rxquantr168_loop
  rxquantr168_done:
  # rx subrule "ws" subtype=method negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."ws"()
    unless $P10, rx160_fail
    rx160_pos = $P10."pos"()
  alt164_end:
.annotate 'line', 90
  # rx pass
    rx160_cur."!cursor_pass"(rx160_pos, "statementlist")
    rx160_cur."!cursor_debug"("PASS  ", "statementlist", " at pos=", rx160_pos)
    .return (rx160_cur)
  rx160_fail:
.annotate 'line', 4
    (rx160_rep, rx160_pos, $I10, $P10) = rx160_cur."!mark_fail"(0)
    lt rx160_pos, -1, rx160_done
    eq rx160_pos, -1, rx160_fail
    jump $I10
  rx160_done:
    rx160_cur."!cursor_fail"()
    rx160_cur."!cursor_debug"("FAIL  ", "statementlist")
    .return (rx160_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statementlist"  :subid("32_1275600007.84296") :method
.annotate 'line', 4
    new $P162, "ResizablePMCArray"
    push $P162, ""
    push $P162, ""
    .return ($P162)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .const 'Sub' $P178 = "35_1275600007.84296" 
    capture_lex $P178
    .local string rx173_tgt
    .local int rx173_pos
    .local int rx173_off
    .local int rx173_eos
    .local int rx173_rep
    .local pmc rx173_cur
    (rx173_cur, rx173_pos, rx173_tgt) = self."!cursor_start"()
    rx173_cur."!cursor_debug"("START ", "statement")
    rx173_cur."!cursor_caparray"("statement_mod_loop", "statement_mod_cond")
    .lex unicode:"$\x{a2}", rx173_cur
    .local pmc match
    .lex "$/", match
    length rx173_eos, rx173_tgt
    gt rx173_pos, rx173_eos, rx173_done
    set rx173_off, 0
    lt rx173_pos, 2, rx173_start
    sub rx173_off, rx173_pos, 1
    substr rx173_tgt, rx173_tgt, rx173_off
  rx173_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan176_done
    goto rxscan176_scan
  rxscan176_loop:
    ($P10) = rx173_cur."from"()
    inc $P10
    set rx173_pos, $P10
    ge rx173_pos, rx173_eos, rxscan176_done
  rxscan176_scan:
    set_addr $I10, rxscan176_loop
    rx173_cur."!mark_push"(0, rx173_pos, $I10)
  rxscan176_done:
.annotate 'line', 96
  # rx subrule "before" subtype=zerowidth negate=1
    rx173_cur."!cursor_pos"(rx173_pos)
    .const 'Sub' $P178 = "35_1275600007.84296" 
    capture_lex $P178
    $P10 = rx173_cur."before"($P178)
    if $P10, rx173_fail
  alt182_0:
.annotate 'line', 97
    set_addr $I10, alt182_1
    rx173_cur."!mark_push"(0, rx173_pos, $I10)
.annotate 'line', 98
  # rx subrule "statement_control" subtype=capture negate=
    rx173_cur."!cursor_pos"(rx173_pos)
    $P10 = rx173_cur."statement_control"()
    unless $P10, rx173_fail
    rx173_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_control")
    rx173_pos = $P10."pos"()
    goto alt182_end
  alt182_1:
.annotate 'line', 99
  # rx subrule "EXPR" subtype=capture negate=
    rx173_cur."!cursor_pos"(rx173_pos)
    $P10 = rx173_cur."EXPR"()
    unless $P10, rx173_fail
    rx173_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx173_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx173_cur."!cursor_pos"(rx173_pos)
    $P10 = rx173_cur."ws"()
    unless $P10, rx173_fail
    rx173_pos = $P10."pos"()
.annotate 'line', 104
  # rx rxquantr183 ** 0..1
    set_addr $I187, rxquantr183_done
    rx173_cur."!mark_push"(0, rx173_pos, $I187)
  rxquantr183_loop:
  alt184_0:
.annotate 'line', 100
    set_addr $I10, alt184_1
    rx173_cur."!mark_push"(0, rx173_pos, $I10)
.annotate 'line', 101
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx173_cur."!cursor_pos"(rx173_pos)
    $P10 = rx173_cur."MARKED"("endstmt")
    unless $P10, rx173_fail
    goto alt184_end
  alt184_1:
    set_addr $I10, alt184_2
    rx173_cur."!mark_push"(0, rx173_pos, $I10)
.annotate 'line', 102
  # rx subrule "statement_mod_cond" subtype=capture negate=
    rx173_cur."!cursor_pos"(rx173_pos)
    $P10 = rx173_cur."statement_mod_cond"()
    unless $P10, rx173_fail
    rx173_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_cond")
    rx173_pos = $P10."pos"()
  # rx rxquantr185 ** 0..1
    set_addr $I186, rxquantr185_done
    rx173_cur."!mark_push"(0, rx173_pos, $I186)
  rxquantr185_loop:
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx173_cur."!cursor_pos"(rx173_pos)
    $P10 = rx173_cur."statement_mod_loop"()
    unless $P10, rx173_fail
    rx173_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx173_pos = $P10."pos"()
    (rx173_rep) = rx173_cur."!mark_commit"($I186)
  rxquantr185_done:
    goto alt184_end
  alt184_2:
.annotate 'line', 103
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx173_cur."!cursor_pos"(rx173_pos)
    $P10 = rx173_cur."statement_mod_loop"()
    unless $P10, rx173_fail
    rx173_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx173_pos = $P10."pos"()
  alt184_end:
.annotate 'line', 104
    (rx173_rep) = rx173_cur."!mark_commit"($I187)
  rxquantr183_done:
  alt182_end:
.annotate 'line', 95
  # rx pass
    rx173_cur."!cursor_pass"(rx173_pos, "statement")
    rx173_cur."!cursor_debug"("PASS  ", "statement", " at pos=", rx173_pos)
    .return (rx173_cur)
  rx173_fail:
.annotate 'line', 4
    (rx173_rep, rx173_pos, $I10, $P10) = rx173_cur."!mark_fail"(0)
    lt rx173_pos, -1, rx173_done
    eq rx173_pos, -1, rx173_fail
    jump $I10
  rx173_done:
    rx173_cur."!cursor_fail"()
    rx173_cur."!cursor_debug"("FAIL  ", "statement")
    .return (rx173_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement"  :subid("34_1275600007.84296") :method
.annotate 'line', 4
    new $P175, "ResizablePMCArray"
    push $P175, ""
    .return ($P175)
.end


.namespace ["NQP";"Grammar"]
.sub "_block177"  :anon :subid("35_1275600007.84296") :method :outer("33_1275600007.84296")
.annotate 'line', 96
    .local string rx179_tgt
    .local int rx179_pos
    .local int rx179_off
    .local int rx179_eos
    .local int rx179_rep
    .local pmc rx179_cur
    (rx179_cur, rx179_pos, rx179_tgt) = self."!cursor_start"()
    rx179_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx179_cur
    .local pmc match
    .lex "$/", match
    length rx179_eos, rx179_tgt
    gt rx179_pos, rx179_eos, rx179_done
    set rx179_off, 0
    lt rx179_pos, 2, rx179_start
    sub rx179_off, rx179_pos, 1
    substr rx179_tgt, rx179_tgt, rx179_off
  rx179_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan180_done
    goto rxscan180_scan
  rxscan180_loop:
    ($P10) = rx179_cur."from"()
    inc $P10
    set rx179_pos, $P10
    ge rx179_pos, rx179_eos, rxscan180_done
  rxscan180_scan:
    set_addr $I10, rxscan180_loop
    rx179_cur."!mark_push"(0, rx179_pos, $I10)
  rxscan180_done:
  alt181_0:
    set_addr $I10, alt181_1
    rx179_cur."!mark_push"(0, rx179_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx179_pos, rx179_eos, rx179_fail
    sub $I10, rx179_pos, rx179_off
    substr $S10, rx179_tgt, $I10, 1
    index $I11, "])}", $S10
    lt $I11, 0, rx179_fail
    inc rx179_pos
    goto alt181_end
  alt181_1:
  # rxanchor eos
    ne rx179_pos, rx179_eos, rx179_fail
  alt181_end:
  # rx pass
    rx179_cur."!cursor_pass"(rx179_pos, "")
    rx179_cur."!cursor_debug"("PASS  ", "", " at pos=", rx179_pos)
    .return (rx179_cur)
  rx179_fail:
    (rx179_rep, rx179_pos, $I10, $P10) = rx179_cur."!mark_fail"(0)
    lt rx179_pos, -1, rx179_done
    eq rx179_pos, -1, rx179_fail
    jump $I10
  rx179_done:
    rx179_cur."!cursor_fail"()
    rx179_cur."!cursor_debug"("FAIL  ", "")
    .return (rx179_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "eat_terminator"  :subid("36_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx189_tgt
    .local int rx189_pos
    .local int rx189_off
    .local int rx189_eos
    .local int rx189_rep
    .local pmc rx189_cur
    (rx189_cur, rx189_pos, rx189_tgt) = self."!cursor_start"()
    rx189_cur."!cursor_debug"("START ", "eat_terminator")
    .lex unicode:"$\x{a2}", rx189_cur
    .local pmc match
    .lex "$/", match
    length rx189_eos, rx189_tgt
    gt rx189_pos, rx189_eos, rx189_done
    set rx189_off, 0
    lt rx189_pos, 2, rx189_start
    sub rx189_off, rx189_pos, 1
    substr rx189_tgt, rx189_tgt, rx189_off
  rx189_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan192_done
    goto rxscan192_scan
  rxscan192_loop:
    ($P10) = rx189_cur."from"()
    inc $P10
    set rx189_pos, $P10
    ge rx189_pos, rx189_eos, rxscan192_done
  rxscan192_scan:
    set_addr $I10, rxscan192_loop
    rx189_cur."!mark_push"(0, rx189_pos, $I10)
  rxscan192_done:
  alt193_0:
.annotate 'line', 108
    set_addr $I10, alt193_1
    rx189_cur."!mark_push"(0, rx189_pos, $I10)
.annotate 'line', 109
  # rx literal  ";"
    add $I11, rx189_pos, 1
    gt $I11, rx189_eos, rx189_fail
    sub $I11, rx189_pos, rx189_off
    substr $S10, rx189_tgt, $I11, 1
    ne $S10, ";", rx189_fail
    add rx189_pos, 1
    goto alt193_end
  alt193_1:
    set_addr $I10, alt193_2
    rx189_cur."!mark_push"(0, rx189_pos, $I10)
.annotate 'line', 110
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx189_cur."!cursor_pos"(rx189_pos)
    $P10 = rx189_cur."MARKED"("endstmt")
    unless $P10, rx189_fail
    goto alt193_end
  alt193_2:
    set_addr $I10, alt193_3
    rx189_cur."!mark_push"(0, rx189_pos, $I10)
.annotate 'line', 111
  # rx subrule "terminator" subtype=zerowidth negate=
    rx189_cur."!cursor_pos"(rx189_pos)
    $P10 = rx189_cur."terminator"()
    unless $P10, rx189_fail
    goto alt193_end
  alt193_3:
.annotate 'line', 112
  # rxanchor eos
    ne rx189_pos, rx189_eos, rx189_fail
  alt193_end:
.annotate 'line', 108
  # rx pass
    rx189_cur."!cursor_pass"(rx189_pos, "eat_terminator")
    rx189_cur."!cursor_debug"("PASS  ", "eat_terminator", " at pos=", rx189_pos)
    .return (rx189_cur)
  rx189_fail:
.annotate 'line', 4
    (rx189_rep, rx189_pos, $I10, $P10) = rx189_cur."!mark_fail"(0)
    lt rx189_pos, -1, rx189_done
    eq rx189_pos, -1, rx189_fail
    jump $I10
  rx189_done:
    rx189_cur."!cursor_fail"()
    rx189_cur."!cursor_debug"("FAIL  ", "eat_terminator")
    .return (rx189_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__eat_terminator"  :subid("37_1275600007.84296") :method
.annotate 'line', 4
    new $P191, "ResizablePMCArray"
    push $P191, ""
    push $P191, ""
    push $P191, ""
    push $P191, ";"
    .return ($P191)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx195_tgt
    .local int rx195_pos
    .local int rx195_off
    .local int rx195_eos
    .local int rx195_rep
    .local pmc rx195_cur
    (rx195_cur, rx195_pos, rx195_tgt) = self."!cursor_start"()
    rx195_cur."!cursor_debug"("START ", "xblock")
    .lex unicode:"$\x{a2}", rx195_cur
    .local pmc match
    .lex "$/", match
    length rx195_eos, rx195_tgt
    gt rx195_pos, rx195_eos, rx195_done
    set rx195_off, 0
    lt rx195_pos, 2, rx195_start
    sub rx195_off, rx195_pos, 1
    substr rx195_tgt, rx195_tgt, rx195_off
  rx195_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan199_done
    goto rxscan199_scan
  rxscan199_loop:
    ($P10) = rx195_cur."from"()
    inc $P10
    set rx195_pos, $P10
    ge rx195_pos, rx195_eos, rxscan199_done
  rxscan199_scan:
    set_addr $I10, rxscan199_loop
    rx195_cur."!mark_push"(0, rx195_pos, $I10)
  rxscan199_done:
.annotate 'line', 116
  # rx subrule "EXPR" subtype=capture negate=
    rx195_cur."!cursor_pos"(rx195_pos)
    $P10 = rx195_cur."EXPR"()
    unless $P10, rx195_fail
    rx195_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx195_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx195_cur."!cursor_pos"(rx195_pos)
    $P10 = rx195_cur."ws"()
    unless $P10, rx195_fail
    rx195_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx195_cur."!cursor_pos"(rx195_pos)
    $P10 = rx195_cur."pblock"()
    unless $P10, rx195_fail
    rx195_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx195_pos = $P10."pos"()
.annotate 'line', 115
  # rx pass
    rx195_cur."!cursor_pass"(rx195_pos, "xblock")
    rx195_cur."!cursor_debug"("PASS  ", "xblock", " at pos=", rx195_pos)
    .return (rx195_cur)
  rx195_fail:
.annotate 'line', 4
    (rx195_rep, rx195_pos, $I10, $P10) = rx195_cur."!mark_fail"(0)
    lt rx195_pos, -1, rx195_done
    eq rx195_pos, -1, rx195_fail
    jump $I10
  rx195_done:
    rx195_cur."!cursor_fail"()
    rx195_cur."!cursor_debug"("FAIL  ", "xblock")
    .return (rx195_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__xblock"  :subid("39_1275600007.84296") :method
.annotate 'line', 4
    $P197 = self."!PREFIX__!subrule"("EXPR", "")
    new $P198, "ResizablePMCArray"
    push $P198, $P197
    .return ($P198)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx201_tgt
    .local int rx201_pos
    .local int rx201_off
    .local int rx201_eos
    .local int rx201_rep
    .local pmc rx201_cur
    (rx201_cur, rx201_pos, rx201_tgt) = self."!cursor_start"()
    rx201_cur."!cursor_debug"("START ", "pblock")
    .lex unicode:"$\x{a2}", rx201_cur
    .local pmc match
    .lex "$/", match
    length rx201_eos, rx201_tgt
    gt rx201_pos, rx201_eos, rx201_done
    set rx201_off, 0
    lt rx201_pos, 2, rx201_start
    sub rx201_off, rx201_pos, 1
    substr rx201_tgt, rx201_tgt, rx201_off
  rx201_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan206_done
    goto rxscan206_scan
  rxscan206_loop:
    ($P10) = rx201_cur."from"()
    inc $P10
    set rx201_pos, $P10
    ge rx201_pos, rx201_eos, rxscan206_done
  rxscan206_scan:
    set_addr $I10, rxscan206_loop
    rx201_cur."!mark_push"(0, rx201_pos, $I10)
  rxscan206_done:
  alt207_0:
.annotate 'line', 119
    set_addr $I10, alt207_1
    rx201_cur."!mark_push"(0, rx201_pos, $I10)
.annotate 'line', 120
  # rx subrule "lambda" subtype=method negate=
    rx201_cur."!cursor_pos"(rx201_pos)
    $P10 = rx201_cur."lambda"()
    unless $P10, rx201_fail
    rx201_pos = $P10."pos"()
.annotate 'line', 121
  # rx subrule "newpad" subtype=method negate=
    rx201_cur."!cursor_pos"(rx201_pos)
    $P10 = rx201_cur."newpad"()
    unless $P10, rx201_fail
    rx201_pos = $P10."pos"()
.annotate 'line', 122
  # rx subrule "signature" subtype=capture negate=
    rx201_cur."!cursor_pos"(rx201_pos)
    $P10 = rx201_cur."signature"()
    unless $P10, rx201_fail
    rx201_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx201_pos = $P10."pos"()
.annotate 'line', 123
  # rx subrule "blockoid" subtype=capture negate=
    rx201_cur."!cursor_pos"(rx201_pos)
    $P10 = rx201_cur."blockoid"()
    unless $P10, rx201_fail
    rx201_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx201_pos = $P10."pos"()
.annotate 'line', 120
    goto alt207_end
  alt207_1:
    set_addr $I10, alt207_2
    rx201_cur."!mark_push"(0, rx201_pos, $I10)
.annotate 'line', 124
  # rx enumcharlist negate=0 zerowidth
    ge rx201_pos, rx201_eos, rx201_fail
    sub $I10, rx201_pos, rx201_off
    substr $S10, rx201_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx201_fail
.annotate 'line', 125
  # rx subrule "newpad" subtype=method negate=
    rx201_cur."!cursor_pos"(rx201_pos)
    $P10 = rx201_cur."newpad"()
    unless $P10, rx201_fail
    rx201_pos = $P10."pos"()
.annotate 'line', 126
  # rx subrule "blockoid" subtype=capture negate=
    rx201_cur."!cursor_pos"(rx201_pos)
    $P10 = rx201_cur."blockoid"()
    unless $P10, rx201_fail
    rx201_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx201_pos = $P10."pos"()
.annotate 'line', 124
    goto alt207_end
  alt207_2:
.annotate 'line', 127
  # rx subrule "panic" subtype=method negate=
    rx201_cur."!cursor_pos"(rx201_pos)
    $P10 = rx201_cur."panic"("Missing block")
    unless $P10, rx201_fail
    rx201_pos = $P10."pos"()
  alt207_end:
.annotate 'line', 119
  # rx pass
    rx201_cur."!cursor_pass"(rx201_pos, "pblock")
    rx201_cur."!cursor_debug"("PASS  ", "pblock", " at pos=", rx201_pos)
    .return (rx201_cur)
  rx201_fail:
.annotate 'line', 4
    (rx201_rep, rx201_pos, $I10, $P10) = rx201_cur."!mark_fail"(0)
    lt rx201_pos, -1, rx201_done
    eq rx201_pos, -1, rx201_fail
    jump $I10
  rx201_done:
    rx201_cur."!cursor_fail"()
    rx201_cur."!cursor_debug"("FAIL  ", "pblock")
    .return (rx201_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pblock"  :subid("41_1275600007.84296") :method
.annotate 'line', 4
    $P203 = self."!PREFIX__!subrule"("", "")
    $P204 = self."!PREFIX__!subrule"("", "")
    new $P205, "ResizablePMCArray"
    push $P205, $P203
    push $P205, "{"
    push $P205, $P204
    .return ($P205)
.end


.namespace ["NQP";"Grammar"]
.sub "lambda"  :subid("42_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx209_tgt
    .local int rx209_pos
    .local int rx209_off
    .local int rx209_eos
    .local int rx209_rep
    .local pmc rx209_cur
    (rx209_cur, rx209_pos, rx209_tgt) = self."!cursor_start"()
    rx209_cur."!cursor_debug"("START ", "lambda")
    .lex unicode:"$\x{a2}", rx209_cur
    .local pmc match
    .lex "$/", match
    length rx209_eos, rx209_tgt
    gt rx209_pos, rx209_eos, rx209_done
    set rx209_off, 0
    lt rx209_pos, 2, rx209_start
    sub rx209_off, rx209_pos, 1
    substr rx209_tgt, rx209_tgt, rx209_off
  rx209_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan212_done
    goto rxscan212_scan
  rxscan212_loop:
    ($P10) = rx209_cur."from"()
    inc $P10
    set rx209_pos, $P10
    ge rx209_pos, rx209_eos, rxscan212_done
  rxscan212_scan:
    set_addr $I10, rxscan212_loop
    rx209_cur."!mark_push"(0, rx209_pos, $I10)
  rxscan212_done:
  alt213_0:
.annotate 'line', 130
    set_addr $I10, alt213_1
    rx209_cur."!mark_push"(0, rx209_pos, $I10)
  # rx literal  "->"
    add $I11, rx209_pos, 2
    gt $I11, rx209_eos, rx209_fail
    sub $I11, rx209_pos, rx209_off
    substr $S10, rx209_tgt, $I11, 2
    ne $S10, "->", rx209_fail
    add rx209_pos, 2
    goto alt213_end
  alt213_1:
  # rx literal  "<->"
    add $I11, rx209_pos, 3
    gt $I11, rx209_eos, rx209_fail
    sub $I11, rx209_pos, rx209_off
    substr $S10, rx209_tgt, $I11, 3
    ne $S10, "<->", rx209_fail
    add rx209_pos, 3
  alt213_end:
  # rx pass
    rx209_cur."!cursor_pass"(rx209_pos, "lambda")
    rx209_cur."!cursor_debug"("PASS  ", "lambda", " at pos=", rx209_pos)
    .return (rx209_cur)
  rx209_fail:
.annotate 'line', 4
    (rx209_rep, rx209_pos, $I10, $P10) = rx209_cur."!mark_fail"(0)
    lt rx209_pos, -1, rx209_done
    eq rx209_pos, -1, rx209_fail
    jump $I10
  rx209_done:
    rx209_cur."!cursor_fail"()
    rx209_cur."!cursor_debug"("FAIL  ", "lambda")
    .return (rx209_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__lambda"  :subid("43_1275600007.84296") :method
.annotate 'line', 4
    new $P211, "ResizablePMCArray"
    push $P211, "<->"
    push $P211, "->"
    .return ($P211)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx215_tgt
    .local int rx215_pos
    .local int rx215_off
    .local int rx215_eos
    .local int rx215_rep
    .local pmc rx215_cur
    (rx215_cur, rx215_pos, rx215_tgt) = self."!cursor_start"()
    rx215_cur."!cursor_debug"("START ", "block")
    .lex unicode:"$\x{a2}", rx215_cur
    .local pmc match
    .lex "$/", match
    length rx215_eos, rx215_tgt
    gt rx215_pos, rx215_eos, rx215_done
    set rx215_off, 0
    lt rx215_pos, 2, rx215_start
    sub rx215_off, rx215_pos, 1
    substr rx215_tgt, rx215_tgt, rx215_off
  rx215_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan219_done
    goto rxscan219_scan
  rxscan219_loop:
    ($P10) = rx215_cur."from"()
    inc $P10
    set rx215_pos, $P10
    ge rx215_pos, rx215_eos, rxscan219_done
  rxscan219_scan:
    set_addr $I10, rxscan219_loop
    rx215_cur."!mark_push"(0, rx215_pos, $I10)
  rxscan219_done:
  alt220_0:
.annotate 'line', 133
    set_addr $I10, alt220_1
    rx215_cur."!mark_push"(0, rx215_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx215_pos, rx215_eos, rx215_fail
    sub $I10, rx215_pos, rx215_off
    substr $S10, rx215_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx215_fail
    goto alt220_end
  alt220_1:
  # rx subrule "panic" subtype=method negate=
    rx215_cur."!cursor_pos"(rx215_pos)
    $P10 = rx215_cur."panic"("Missing block")
    unless $P10, rx215_fail
    rx215_pos = $P10."pos"()
  alt220_end:
.annotate 'line', 134
  # rx subrule "newpad" subtype=method negate=
    rx215_cur."!cursor_pos"(rx215_pos)
    $P10 = rx215_cur."newpad"()
    unless $P10, rx215_fail
    rx215_pos = $P10."pos"()
.annotate 'line', 135
  # rx subrule "blockoid" subtype=capture negate=
    rx215_cur."!cursor_pos"(rx215_pos)
    $P10 = rx215_cur."blockoid"()
    unless $P10, rx215_fail
    rx215_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx215_pos = $P10."pos"()
.annotate 'line', 132
  # rx pass
    rx215_cur."!cursor_pass"(rx215_pos, "block")
    rx215_cur."!cursor_debug"("PASS  ", "block", " at pos=", rx215_pos)
    .return (rx215_cur)
  rx215_fail:
.annotate 'line', 4
    (rx215_rep, rx215_pos, $I10, $P10) = rx215_cur."!mark_fail"(0)
    lt rx215_pos, -1, rx215_done
    eq rx215_pos, -1, rx215_fail
    jump $I10
  rx215_done:
    rx215_cur."!cursor_fail"()
    rx215_cur."!cursor_debug"("FAIL  ", "block")
    .return (rx215_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__block"  :subid("45_1275600007.84296") :method
.annotate 'line', 4
    $P217 = self."!PREFIX__!subrule"("", "")
    new $P218, "ResizablePMCArray"
    push $P218, $P217
    push $P218, "{"
    .return ($P218)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx222_tgt
    .local int rx222_pos
    .local int rx222_off
    .local int rx222_eos
    .local int rx222_rep
    .local pmc rx222_cur
    (rx222_cur, rx222_pos, rx222_tgt) = self."!cursor_start"()
    rx222_cur."!cursor_debug"("START ", "blockoid")
    .lex unicode:"$\x{a2}", rx222_cur
    .local pmc match
    .lex "$/", match
    length rx222_eos, rx222_tgt
    gt rx222_pos, rx222_eos, rx222_done
    set rx222_off, 0
    lt rx222_pos, 2, rx222_start
    sub rx222_off, rx222_pos, 1
    substr rx222_tgt, rx222_tgt, rx222_off
  rx222_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan226_done
    goto rxscan226_scan
  rxscan226_loop:
    ($P10) = rx222_cur."from"()
    inc $P10
    set rx222_pos, $P10
    ge rx222_pos, rx222_eos, rxscan226_done
  rxscan226_scan:
    set_addr $I10, rxscan226_loop
    rx222_cur."!mark_push"(0, rx222_pos, $I10)
  rxscan226_done:
.annotate 'line', 139
  # rx subrule "finishpad" subtype=method negate=
    rx222_cur."!cursor_pos"(rx222_pos)
    $P10 = rx222_cur."finishpad"()
    unless $P10, rx222_fail
    rx222_pos = $P10."pos"()
.annotate 'line', 140
  # rx literal  "{"
    add $I11, rx222_pos, 1
    gt $I11, rx222_eos, rx222_fail
    sub $I11, rx222_pos, rx222_off
    substr $S10, rx222_tgt, $I11, 1
    ne $S10, "{", rx222_fail
    add rx222_pos, 1
  # rx subrule "statementlist" subtype=capture negate=
    rx222_cur."!cursor_pos"(rx222_pos)
    $P10 = rx222_cur."statementlist"()
    unless $P10, rx222_fail
    rx222_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx222_pos = $P10."pos"()
  alt227_0:
    set_addr $I10, alt227_1
    rx222_cur."!mark_push"(0, rx222_pos, $I10)
  # rx literal  "}"
    add $I11, rx222_pos, 1
    gt $I11, rx222_eos, rx222_fail
    sub $I11, rx222_pos, rx222_off
    substr $S10, rx222_tgt, $I11, 1
    ne $S10, "}", rx222_fail
    add rx222_pos, 1
    goto alt227_end
  alt227_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx222_cur."!cursor_pos"(rx222_pos)
    $P10 = rx222_cur."FAILGOAL"("'}'")
    unless $P10, rx222_fail
    rx222_pos = $P10."pos"()
  alt227_end:
.annotate 'line', 141
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx222_cur."!cursor_pos"(rx222_pos)
    $P10 = rx222_cur."ENDSTMT"()
    unless $P10, rx222_fail
.annotate 'line', 138
  # rx pass
    rx222_cur."!cursor_pass"(rx222_pos, "blockoid")
    rx222_cur."!cursor_debug"("PASS  ", "blockoid", " at pos=", rx222_pos)
    .return (rx222_cur)
  rx222_fail:
.annotate 'line', 4
    (rx222_rep, rx222_pos, $I10, $P10) = rx222_cur."!mark_fail"(0)
    lt rx222_pos, -1, rx222_done
    eq rx222_pos, -1, rx222_fail
    jump $I10
  rx222_done:
    rx222_cur."!cursor_fail"()
    rx222_cur."!cursor_debug"("FAIL  ", "blockoid")
    .return (rx222_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blockoid"  :subid("47_1275600007.84296") :method
.annotate 'line', 4
    $P224 = self."!PREFIX__!subrule"("", "")
    new $P225, "ResizablePMCArray"
    push $P225, $P224
    .return ($P225)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx230_tgt
    .local int rx230_pos
    .local int rx230_off
    .local int rx230_eos
    .local int rx230_rep
    .local pmc rx230_cur
    (rx230_cur, rx230_pos, rx230_tgt) = self."!cursor_start"()
    rx230_cur."!cursor_debug"("START ", "newpad")
    .lex unicode:"$\x{a2}", rx230_cur
    .local pmc match
    .lex "$/", match
    length rx230_eos, rx230_tgt
    gt rx230_pos, rx230_eos, rx230_done
    set rx230_off, 0
    lt rx230_pos, 2, rx230_start
    sub rx230_off, rx230_pos, 1
    substr rx230_tgt, rx230_tgt, rx230_off
  rx230_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan233_done
    goto rxscan233_scan
  rxscan233_loop:
    ($P10) = rx230_cur."from"()
    inc $P10
    set rx230_pos, $P10
    ge rx230_pos, rx230_eos, rxscan233_done
  rxscan233_scan:
    set_addr $I10, rxscan233_loop
    rx230_cur."!mark_push"(0, rx230_pos, $I10)
  rxscan233_done:
.annotate 'line', 144
  # rx pass
    rx230_cur."!cursor_pass"(rx230_pos, "newpad")
    rx230_cur."!cursor_debug"("PASS  ", "newpad", " at pos=", rx230_pos)
    .return (rx230_cur)
  rx230_fail:
.annotate 'line', 4
    (rx230_rep, rx230_pos, $I10, $P10) = rx230_cur."!mark_fail"(0)
    lt rx230_pos, -1, rx230_done
    eq rx230_pos, -1, rx230_fail
    jump $I10
  rx230_done:
    rx230_cur."!cursor_fail"()
    rx230_cur."!cursor_debug"("FAIL  ", "newpad")
    .return (rx230_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__newpad"  :subid("49_1275600007.84296") :method
.annotate 'line', 4
    new $P232, "ResizablePMCArray"
    push $P232, ""
    .return ($P232)
.end


.namespace ["NQP";"Grammar"]
.sub "outerctx"  :subid("50_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx235_tgt
    .local int rx235_pos
    .local int rx235_off
    .local int rx235_eos
    .local int rx235_rep
    .local pmc rx235_cur
    (rx235_cur, rx235_pos, rx235_tgt) = self."!cursor_start"()
    rx235_cur."!cursor_debug"("START ", "outerctx")
    .lex unicode:"$\x{a2}", rx235_cur
    .local pmc match
    .lex "$/", match
    length rx235_eos, rx235_tgt
    gt rx235_pos, rx235_eos, rx235_done
    set rx235_off, 0
    lt rx235_pos, 2, rx235_start
    sub rx235_off, rx235_pos, 1
    substr rx235_tgt, rx235_tgt, rx235_off
  rx235_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan238_done
    goto rxscan238_scan
  rxscan238_loop:
    ($P10) = rx235_cur."from"()
    inc $P10
    set rx235_pos, $P10
    ge rx235_pos, rx235_eos, rxscan238_done
  rxscan238_scan:
    set_addr $I10, rxscan238_loop
    rx235_cur."!mark_push"(0, rx235_pos, $I10)
  rxscan238_done:
.annotate 'line', 145
  # rx pass
    rx235_cur."!cursor_pass"(rx235_pos, "outerctx")
    rx235_cur."!cursor_debug"("PASS  ", "outerctx", " at pos=", rx235_pos)
    .return (rx235_cur)
  rx235_fail:
.annotate 'line', 4
    (rx235_rep, rx235_pos, $I10, $P10) = rx235_cur."!mark_fail"(0)
    lt rx235_pos, -1, rx235_done
    eq rx235_pos, -1, rx235_fail
    jump $I10
  rx235_done:
    rx235_cur."!cursor_fail"()
    rx235_cur."!cursor_debug"("FAIL  ", "outerctx")
    .return (rx235_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__outerctx"  :subid("51_1275600007.84296") :method
.annotate 'line', 4
    new $P237, "ResizablePMCArray"
    push $P237, ""
    .return ($P237)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("52_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx240_tgt
    .local int rx240_pos
    .local int rx240_off
    .local int rx240_eos
    .local int rx240_rep
    .local pmc rx240_cur
    (rx240_cur, rx240_pos, rx240_tgt) = self."!cursor_start"()
    rx240_cur."!cursor_debug"("START ", "finishpad")
    .lex unicode:"$\x{a2}", rx240_cur
    .local pmc match
    .lex "$/", match
    length rx240_eos, rx240_tgt
    gt rx240_pos, rx240_eos, rx240_done
    set rx240_off, 0
    lt rx240_pos, 2, rx240_start
    sub rx240_off, rx240_pos, 1
    substr rx240_tgt, rx240_tgt, rx240_off
  rx240_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan243_done
    goto rxscan243_scan
  rxscan243_loop:
    ($P10) = rx240_cur."from"()
    inc $P10
    set rx240_pos, $P10
    ge rx240_pos, rx240_eos, rxscan243_done
  rxscan243_scan:
    set_addr $I10, rxscan243_loop
    rx240_cur."!mark_push"(0, rx240_pos, $I10)
  rxscan243_done:
.annotate 'line', 146
  # rx pass
    rx240_cur."!cursor_pass"(rx240_pos, "finishpad")
    rx240_cur."!cursor_debug"("PASS  ", "finishpad", " at pos=", rx240_pos)
    .return (rx240_cur)
  rx240_fail:
.annotate 'line', 4
    (rx240_rep, rx240_pos, $I10, $P10) = rx240_cur."!mark_fail"(0)
    lt rx240_pos, -1, rx240_done
    eq rx240_pos, -1, rx240_fail
    jump $I10
  rx240_done:
    rx240_cur."!cursor_fail"()
    rx240_cur."!cursor_debug"("FAIL  ", "finishpad")
    .return (rx240_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__finishpad"  :subid("53_1275600007.84296") :method
.annotate 'line', 4
    new $P242, "ResizablePMCArray"
    push $P242, ""
    .return ($P242)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("54_1275600007.84296") :method
.annotate 'line', 148
    $P245 = self."!protoregex"("terminator")
    .return ($P245)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("55_1275600007.84296") :method
.annotate 'line', 148
    $P247 = self."!PREFIX__!protoregex"("terminator")
    .return ($P247)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("56_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx249_tgt
    .local int rx249_pos
    .local int rx249_off
    .local int rx249_eos
    .local int rx249_rep
    .local pmc rx249_cur
    (rx249_cur, rx249_pos, rx249_tgt) = self."!cursor_start"()
    rx249_cur."!cursor_debug"("START ", "terminator:sym<;>")
    .lex unicode:"$\x{a2}", rx249_cur
    .local pmc match
    .lex "$/", match
    length rx249_eos, rx249_tgt
    gt rx249_pos, rx249_eos, rx249_done
    set rx249_off, 0
    lt rx249_pos, 2, rx249_start
    sub rx249_off, rx249_pos, 1
    substr rx249_tgt, rx249_tgt, rx249_off
  rx249_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan252_done
    goto rxscan252_scan
  rxscan252_loop:
    ($P10) = rx249_cur."from"()
    inc $P10
    set rx249_pos, $P10
    ge rx249_pos, rx249_eos, rxscan252_done
  rxscan252_scan:
    set_addr $I10, rxscan252_loop
    rx249_cur."!mark_push"(0, rx249_pos, $I10)
  rxscan252_done:
.annotate 'line', 150
  # rx enumcharlist negate=0 zerowidth
    ge rx249_pos, rx249_eos, rx249_fail
    sub $I10, rx249_pos, rx249_off
    substr $S10, rx249_tgt, $I10, 1
    index $I11, ";", $S10
    lt $I11, 0, rx249_fail
  # rx pass
    rx249_cur."!cursor_pass"(rx249_pos, "terminator:sym<;>")
    rx249_cur."!cursor_debug"("PASS  ", "terminator:sym<;>", " at pos=", rx249_pos)
    .return (rx249_cur)
  rx249_fail:
.annotate 'line', 4
    (rx249_rep, rx249_pos, $I10, $P10) = rx249_cur."!mark_fail"(0)
    lt rx249_pos, -1, rx249_done
    eq rx249_pos, -1, rx249_fail
    jump $I10
  rx249_done:
    rx249_cur."!cursor_fail"()
    rx249_cur."!cursor_debug"("FAIL  ", "terminator:sym<;>")
    .return (rx249_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<;>"  :subid("57_1275600007.84296") :method
.annotate 'line', 4
    new $P251, "ResizablePMCArray"
    push $P251, ";"
    .return ($P251)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("58_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx254_tgt
    .local int rx254_pos
    .local int rx254_off
    .local int rx254_eos
    .local int rx254_rep
    .local pmc rx254_cur
    (rx254_cur, rx254_pos, rx254_tgt) = self."!cursor_start"()
    rx254_cur."!cursor_debug"("START ", "terminator:sym<}>")
    .lex unicode:"$\x{a2}", rx254_cur
    .local pmc match
    .lex "$/", match
    length rx254_eos, rx254_tgt
    gt rx254_pos, rx254_eos, rx254_done
    set rx254_off, 0
    lt rx254_pos, 2, rx254_start
    sub rx254_off, rx254_pos, 1
    substr rx254_tgt, rx254_tgt, rx254_off
  rx254_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan257_done
    goto rxscan257_scan
  rxscan257_loop:
    ($P10) = rx254_cur."from"()
    inc $P10
    set rx254_pos, $P10
    ge rx254_pos, rx254_eos, rxscan257_done
  rxscan257_scan:
    set_addr $I10, rxscan257_loop
    rx254_cur."!mark_push"(0, rx254_pos, $I10)
  rxscan257_done:
.annotate 'line', 151
  # rx enumcharlist negate=0 zerowidth
    ge rx254_pos, rx254_eos, rx254_fail
    sub $I10, rx254_pos, rx254_off
    substr $S10, rx254_tgt, $I10, 1
    index $I11, "}", $S10
    lt $I11, 0, rx254_fail
  # rx pass
    rx254_cur."!cursor_pass"(rx254_pos, "terminator:sym<}>")
    rx254_cur."!cursor_debug"("PASS  ", "terminator:sym<}>", " at pos=", rx254_pos)
    .return (rx254_cur)
  rx254_fail:
.annotate 'line', 4
    (rx254_rep, rx254_pos, $I10, $P10) = rx254_cur."!mark_fail"(0)
    lt rx254_pos, -1, rx254_done
    eq rx254_pos, -1, rx254_fail
    jump $I10
  rx254_done:
    rx254_cur."!cursor_fail"()
    rx254_cur."!cursor_debug"("FAIL  ", "terminator:sym<}>")
    .return (rx254_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<}>"  :subid("59_1275600007.84296") :method
.annotate 'line', 4
    new $P256, "ResizablePMCArray"
    push $P256, "}"
    .return ($P256)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("60_1275600007.84296") :method
.annotate 'line', 155
    $P259 = self."!protoregex"("statement_control")
    .return ($P259)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("61_1275600007.84296") :method
.annotate 'line', 155
    $P261 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P261)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("62_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx263_tgt
    .local int rx263_pos
    .local int rx263_off
    .local int rx263_eos
    .local int rx263_rep
    .local pmc rx263_cur
    (rx263_cur, rx263_pos, rx263_tgt) = self."!cursor_start"()
    rx263_cur."!cursor_debug"("START ", "statement_control:sym<if>")
    rx263_cur."!cursor_caparray"("else", "xblock")
    .lex unicode:"$\x{a2}", rx263_cur
    .local pmc match
    .lex "$/", match
    length rx263_eos, rx263_tgt
    gt rx263_pos, rx263_eos, rx263_done
    set rx263_off, 0
    lt rx263_pos, 2, rx263_start
    sub rx263_off, rx263_pos, 1
    substr rx263_tgt, rx263_tgt, rx263_off
  rx263_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan266_done
    goto rxscan266_scan
  rxscan266_loop:
    ($P10) = rx263_cur."from"()
    inc $P10
    set rx263_pos, $P10
    ge rx263_pos, rx263_eos, rxscan266_done
  rxscan266_scan:
    set_addr $I10, rxscan266_loop
    rx263_cur."!mark_push"(0, rx263_pos, $I10)
  rxscan266_done:
.annotate 'line', 158
  # rx subcapture "sym"
    set_addr $I10, rxcap_267_fail
    rx263_cur."!mark_push"(0, rx263_pos, $I10)
  # rx literal  "if"
    add $I11, rx263_pos, 2
    gt $I11, rx263_eos, rx263_fail
    sub $I11, rx263_pos, rx263_off
    substr $S10, rx263_tgt, $I11, 2
    ne $S10, "if", rx263_fail
    add rx263_pos, 2
    set_addr $I10, rxcap_267_fail
    ($I12, $I11) = rx263_cur."!mark_peek"($I10)
    rx263_cur."!cursor_pos"($I11)
    ($P10) = rx263_cur."!cursor_start"()
    $P10."!cursor_pass"(rx263_pos, "")
    rx263_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_267_done
  rxcap_267_fail:
    goto rx263_fail
  rxcap_267_done:
  # rx charclass s
    ge rx263_pos, rx263_eos, rx263_fail
    sub $I10, rx263_pos, rx263_off
    is_cclass $I11, 32, rx263_tgt, $I10
    unless $I11, rx263_fail
    inc rx263_pos
  # rx subrule "ws" subtype=method negate=
    rx263_cur."!cursor_pos"(rx263_pos)
    $P10 = rx263_cur."ws"()
    unless $P10, rx263_fail
    rx263_pos = $P10."pos"()
.annotate 'line', 159
  # rx subrule "xblock" subtype=capture negate=
    rx263_cur."!cursor_pos"(rx263_pos)
    $P10 = rx263_cur."xblock"()
    unless $P10, rx263_fail
    rx263_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx263_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx263_cur."!cursor_pos"(rx263_pos)
    $P10 = rx263_cur."ws"()
    unless $P10, rx263_fail
    rx263_pos = $P10."pos"()
.annotate 'line', 160
  # rx rxquantr270 ** 0..*
    set_addr $I274, rxquantr270_done
    rx263_cur."!mark_push"(0, rx263_pos, $I274)
  rxquantr270_loop:
  # rx subrule "ws" subtype=method negate=
    rx263_cur."!cursor_pos"(rx263_pos)
    $P10 = rx263_cur."ws"()
    unless $P10, rx263_fail
    rx263_pos = $P10."pos"()
  # rx literal  "elsif"
    add $I11, rx263_pos, 5
    gt $I11, rx263_eos, rx263_fail
    sub $I11, rx263_pos, rx263_off
    substr $S10, rx263_tgt, $I11, 5
    ne $S10, "elsif", rx263_fail
    add rx263_pos, 5
  # rx charclass s
    ge rx263_pos, rx263_eos, rx263_fail
    sub $I10, rx263_pos, rx263_off
    is_cclass $I11, 32, rx263_tgt, $I10
    unless $I11, rx263_fail
    inc rx263_pos
  # rx subrule "ws" subtype=method negate=
    rx263_cur."!cursor_pos"(rx263_pos)
    $P10 = rx263_cur."ws"()
    unless $P10, rx263_fail
    rx263_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx263_cur."!cursor_pos"(rx263_pos)
    $P10 = rx263_cur."xblock"()
    unless $P10, rx263_fail
    rx263_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx263_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx263_cur."!cursor_pos"(rx263_pos)
    $P10 = rx263_cur."ws"()
    unless $P10, rx263_fail
    rx263_pos = $P10."pos"()
    (rx263_rep) = rx263_cur."!mark_commit"($I274)
    rx263_cur."!mark_push"(rx263_rep, rx263_pos, $I274)
    goto rxquantr270_loop
  rxquantr270_done:
  # rx subrule "ws" subtype=method negate=
    rx263_cur."!cursor_pos"(rx263_pos)
    $P10 = rx263_cur."ws"()
    unless $P10, rx263_fail
    rx263_pos = $P10."pos"()
.annotate 'line', 161
  # rx rxquantr276 ** 0..1
    set_addr $I280, rxquantr276_done
    rx263_cur."!mark_push"(0, rx263_pos, $I280)
  rxquantr276_loop:
  # rx subrule "ws" subtype=method negate=
    rx263_cur."!cursor_pos"(rx263_pos)
    $P10 = rx263_cur."ws"()
    unless $P10, rx263_fail
    rx263_pos = $P10."pos"()
  # rx literal  "else"
    add $I11, rx263_pos, 4
    gt $I11, rx263_eos, rx263_fail
    sub $I11, rx263_pos, rx263_off
    substr $S10, rx263_tgt, $I11, 4
    ne $S10, "else", rx263_fail
    add rx263_pos, 4
  # rx charclass s
    ge rx263_pos, rx263_eos, rx263_fail
    sub $I10, rx263_pos, rx263_off
    is_cclass $I11, 32, rx263_tgt, $I10
    unless $I11, rx263_fail
    inc rx263_pos
  # rx subrule "ws" subtype=method negate=
    rx263_cur."!cursor_pos"(rx263_pos)
    $P10 = rx263_cur."ws"()
    unless $P10, rx263_fail
    rx263_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx263_cur."!cursor_pos"(rx263_pos)
    $P10 = rx263_cur."pblock"()
    unless $P10, rx263_fail
    rx263_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("else")
    rx263_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx263_cur."!cursor_pos"(rx263_pos)
    $P10 = rx263_cur."ws"()
    unless $P10, rx263_fail
    rx263_pos = $P10."pos"()
    (rx263_rep) = rx263_cur."!mark_commit"($I280)
  rxquantr276_done:
  # rx subrule "ws" subtype=method negate=
    rx263_cur."!cursor_pos"(rx263_pos)
    $P10 = rx263_cur."ws"()
    unless $P10, rx263_fail
    rx263_pos = $P10."pos"()
.annotate 'line', 157
  # rx pass
    rx263_cur."!cursor_pass"(rx263_pos, "statement_control:sym<if>")
    rx263_cur."!cursor_debug"("PASS  ", "statement_control:sym<if>", " at pos=", rx263_pos)
    .return (rx263_cur)
  rx263_fail:
.annotate 'line', 4
    (rx263_rep, rx263_pos, $I10, $P10) = rx263_cur."!mark_fail"(0)
    lt rx263_pos, -1, rx263_done
    eq rx263_pos, -1, rx263_fail
    jump $I10
  rx263_done:
    rx263_cur."!cursor_fail"()
    rx263_cur."!cursor_debug"("FAIL  ", "statement_control:sym<if>")
    .return (rx263_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<if>"  :subid("63_1275600007.84296") :method
.annotate 'line', 4
    new $P265, "ResizablePMCArray"
    push $P265, "if"
    .return ($P265)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("64_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .const 'Sub' $P293 = "66_1275600007.84296" 
    capture_lex $P293
    .local string rx283_tgt
    .local int rx283_pos
    .local int rx283_off
    .local int rx283_eos
    .local int rx283_rep
    .local pmc rx283_cur
    (rx283_cur, rx283_pos, rx283_tgt) = self."!cursor_start"()
    rx283_cur."!cursor_debug"("START ", "statement_control:sym<unless>")
    .lex unicode:"$\x{a2}", rx283_cur
    .local pmc match
    .lex "$/", match
    length rx283_eos, rx283_tgt
    gt rx283_pos, rx283_eos, rx283_done
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
.annotate 'line', 165
  # rx subcapture "sym"
    set_addr $I10, rxcap_287_fail
    rx283_cur."!mark_push"(0, rx283_pos, $I10)
  # rx literal  "unless"
    add $I11, rx283_pos, 6
    gt $I11, rx283_eos, rx283_fail
    sub $I11, rx283_pos, rx283_off
    substr $S10, rx283_tgt, $I11, 6
    ne $S10, "unless", rx283_fail
    add rx283_pos, 6
    set_addr $I10, rxcap_287_fail
    ($I12, $I11) = rx283_cur."!mark_peek"($I10)
    rx283_cur."!cursor_pos"($I11)
    ($P10) = rx283_cur."!cursor_start"()
    $P10."!cursor_pass"(rx283_pos, "")
    rx283_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_287_done
  rxcap_287_fail:
    goto rx283_fail
  rxcap_287_done:
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
.annotate 'line', 166
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
  alt290_0:
.annotate 'line', 167
    set_addr $I10, alt290_1
    rx283_cur."!mark_push"(0, rx283_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx283_cur."!cursor_pos"(rx283_pos)
    $P10 = rx283_cur."ws"()
    unless $P10, rx283_fail
    rx283_pos = $P10."pos"()
  # rx subrule "before" subtype=zerowidth negate=1
    rx283_cur."!cursor_pos"(rx283_pos)
    .const 'Sub' $P293 = "66_1275600007.84296" 
    capture_lex $P293
    $P10 = rx283_cur."before"($P293)
    if $P10, rx283_fail
  # rx subrule "ws" subtype=method negate=
    rx283_cur."!cursor_pos"(rx283_pos)
    $P10 = rx283_cur."ws"()
    unless $P10, rx283_fail
    rx283_pos = $P10."pos"()
    goto alt290_end
  alt290_1:
  # rx subrule "ws" subtype=method negate=
    rx283_cur."!cursor_pos"(rx283_pos)
    $P10 = rx283_cur."ws"()
    unless $P10, rx283_fail
    rx283_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx283_cur."!cursor_pos"(rx283_pos)
    $P10 = rx283_cur."panic"("unless does not take \"else\", please rewrite using \"if\"")
    unless $P10, rx283_fail
    rx283_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx283_cur."!cursor_pos"(rx283_pos)
    $P10 = rx283_cur."ws"()
    unless $P10, rx283_fail
    rx283_pos = $P10."pos"()
  alt290_end:
  # rx subrule "ws" subtype=method negate=
    rx283_cur."!cursor_pos"(rx283_pos)
    $P10 = rx283_cur."ws"()
    unless $P10, rx283_fail
    rx283_pos = $P10."pos"()
.annotate 'line', 164
  # rx pass
    rx283_cur."!cursor_pass"(rx283_pos, "statement_control:sym<unless>")
    rx283_cur."!cursor_debug"("PASS  ", "statement_control:sym<unless>", " at pos=", rx283_pos)
    .return (rx283_cur)
  rx283_fail:
.annotate 'line', 4
    (rx283_rep, rx283_pos, $I10, $P10) = rx283_cur."!mark_fail"(0)
    lt rx283_pos, -1, rx283_done
    eq rx283_pos, -1, rx283_fail
    jump $I10
  rx283_done:
    rx283_cur."!cursor_fail"()
    rx283_cur."!cursor_debug"("FAIL  ", "statement_control:sym<unless>")
    .return (rx283_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<unless>"  :subid("65_1275600007.84296") :method
.annotate 'line', 4
    new $P285, "ResizablePMCArray"
    push $P285, "unless"
    .return ($P285)
.end


.namespace ["NQP";"Grammar"]
.sub "_block292"  :anon :subid("66_1275600007.84296") :method :outer("64_1275600007.84296")
.annotate 'line', 167
    .local string rx294_tgt
    .local int rx294_pos
    .local int rx294_off
    .local int rx294_eos
    .local int rx294_rep
    .local pmc rx294_cur
    (rx294_cur, rx294_pos, rx294_tgt) = self."!cursor_start"()
    rx294_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx294_cur
    .local pmc match
    .lex "$/", match
    length rx294_eos, rx294_tgt
    gt rx294_pos, rx294_eos, rx294_done
    set rx294_off, 0
    lt rx294_pos, 2, rx294_start
    sub rx294_off, rx294_pos, 1
    substr rx294_tgt, rx294_tgt, rx294_off
  rx294_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan295_done
    goto rxscan295_scan
  rxscan295_loop:
    ($P10) = rx294_cur."from"()
    inc $P10
    set rx294_pos, $P10
    ge rx294_pos, rx294_eos, rxscan295_done
  rxscan295_scan:
    set_addr $I10, rxscan295_loop
    rx294_cur."!mark_push"(0, rx294_pos, $I10)
  rxscan295_done:
  # rx literal  "else"
    add $I11, rx294_pos, 4
    gt $I11, rx294_eos, rx294_fail
    sub $I11, rx294_pos, rx294_off
    substr $S10, rx294_tgt, $I11, 4
    ne $S10, "else", rx294_fail
    add rx294_pos, 4
  # rx pass
    rx294_cur."!cursor_pass"(rx294_pos, "")
    rx294_cur."!cursor_debug"("PASS  ", "", " at pos=", rx294_pos)
    .return (rx294_cur)
  rx294_fail:
    (rx294_rep, rx294_pos, $I10, $P10) = rx294_cur."!mark_fail"(0)
    lt rx294_pos, -1, rx294_done
    eq rx294_pos, -1, rx294_fail
    jump $I10
  rx294_done:
    rx294_cur."!cursor_fail"()
    rx294_cur."!cursor_debug"("FAIL  ", "")
    .return (rx294_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<while>"  :subid("67_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx301_tgt
    .local int rx301_pos
    .local int rx301_off
    .local int rx301_eos
    .local int rx301_rep
    .local pmc rx301_cur
    (rx301_cur, rx301_pos, rx301_tgt) = self."!cursor_start"()
    rx301_cur."!cursor_debug"("START ", "statement_control:sym<while>")
    .lex unicode:"$\x{a2}", rx301_cur
    .local pmc match
    .lex "$/", match
    length rx301_eos, rx301_tgt
    gt rx301_pos, rx301_eos, rx301_done
    set rx301_off, 0
    lt rx301_pos, 2, rx301_start
    sub rx301_off, rx301_pos, 1
    substr rx301_tgt, rx301_tgt, rx301_off
  rx301_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan304_done
    goto rxscan304_scan
  rxscan304_loop:
    ($P10) = rx301_cur."from"()
    inc $P10
    set rx301_pos, $P10
    ge rx301_pos, rx301_eos, rxscan304_done
  rxscan304_scan:
    set_addr $I10, rxscan304_loop
    rx301_cur."!mark_push"(0, rx301_pos, $I10)
  rxscan304_done:
.annotate 'line', 171
  # rx subcapture "sym"
    set_addr $I10, rxcap_306_fail
    rx301_cur."!mark_push"(0, rx301_pos, $I10)
  alt305_0:
    set_addr $I10, alt305_1
    rx301_cur."!mark_push"(0, rx301_pos, $I10)
  # rx literal  "while"
    add $I11, rx301_pos, 5
    gt $I11, rx301_eos, rx301_fail
    sub $I11, rx301_pos, rx301_off
    substr $S10, rx301_tgt, $I11, 5
    ne $S10, "while", rx301_fail
    add rx301_pos, 5
    goto alt305_end
  alt305_1:
  # rx literal  "until"
    add $I11, rx301_pos, 5
    gt $I11, rx301_eos, rx301_fail
    sub $I11, rx301_pos, rx301_off
    substr $S10, rx301_tgt, $I11, 5
    ne $S10, "until", rx301_fail
    add rx301_pos, 5
  alt305_end:
    set_addr $I10, rxcap_306_fail
    ($I12, $I11) = rx301_cur."!mark_peek"($I10)
    rx301_cur."!cursor_pos"($I11)
    ($P10) = rx301_cur."!cursor_start"()
    $P10."!cursor_pass"(rx301_pos, "")
    rx301_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_306_done
  rxcap_306_fail:
    goto rx301_fail
  rxcap_306_done:
  # rx charclass s
    ge rx301_pos, rx301_eos, rx301_fail
    sub $I10, rx301_pos, rx301_off
    is_cclass $I11, 32, rx301_tgt, $I10
    unless $I11, rx301_fail
    inc rx301_pos
  # rx subrule "ws" subtype=method negate=
    rx301_cur."!cursor_pos"(rx301_pos)
    $P10 = rx301_cur."ws"()
    unless $P10, rx301_fail
    rx301_pos = $P10."pos"()
.annotate 'line', 172
  # rx subrule "xblock" subtype=capture negate=
    rx301_cur."!cursor_pos"(rx301_pos)
    $P10 = rx301_cur."xblock"()
    unless $P10, rx301_fail
    rx301_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx301_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx301_cur."!cursor_pos"(rx301_pos)
    $P10 = rx301_cur."ws"()
    unless $P10, rx301_fail
    rx301_pos = $P10."pos"()
.annotate 'line', 170
  # rx pass
    rx301_cur."!cursor_pass"(rx301_pos, "statement_control:sym<while>")
    rx301_cur."!cursor_debug"("PASS  ", "statement_control:sym<while>", " at pos=", rx301_pos)
    .return (rx301_cur)
  rx301_fail:
.annotate 'line', 4
    (rx301_rep, rx301_pos, $I10, $P10) = rx301_cur."!mark_fail"(0)
    lt rx301_pos, -1, rx301_done
    eq rx301_pos, -1, rx301_fail
    jump $I10
  rx301_done:
    rx301_cur."!cursor_fail"()
    rx301_cur."!cursor_debug"("FAIL  ", "statement_control:sym<while>")
    .return (rx301_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<while>"  :subid("68_1275600007.84296") :method
.annotate 'line', 4
    new $P303, "ResizablePMCArray"
    push $P303, "until"
    push $P303, "while"
    .return ($P303)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("69_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx310_tgt
    .local int rx310_pos
    .local int rx310_off
    .local int rx310_eos
    .local int rx310_rep
    .local pmc rx310_cur
    (rx310_cur, rx310_pos, rx310_tgt) = self."!cursor_start"()
    rx310_cur."!cursor_debug"("START ", "statement_control:sym<repeat>")
    .lex unicode:"$\x{a2}", rx310_cur
    .local pmc match
    .lex "$/", match
    length rx310_eos, rx310_tgt
    gt rx310_pos, rx310_eos, rx310_done
    set rx310_off, 0
    lt rx310_pos, 2, rx310_start
    sub rx310_off, rx310_pos, 1
    substr rx310_tgt, rx310_tgt, rx310_off
  rx310_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan313_done
    goto rxscan313_scan
  rxscan313_loop:
    ($P10) = rx310_cur."from"()
    inc $P10
    set rx310_pos, $P10
    ge rx310_pos, rx310_eos, rxscan313_done
  rxscan313_scan:
    set_addr $I10, rxscan313_loop
    rx310_cur."!mark_push"(0, rx310_pos, $I10)
  rxscan313_done:
.annotate 'line', 176
  # rx subcapture "sym"
    set_addr $I10, rxcap_314_fail
    rx310_cur."!mark_push"(0, rx310_pos, $I10)
  # rx literal  "repeat"
    add $I11, rx310_pos, 6
    gt $I11, rx310_eos, rx310_fail
    sub $I11, rx310_pos, rx310_off
    substr $S10, rx310_tgt, $I11, 6
    ne $S10, "repeat", rx310_fail
    add rx310_pos, 6
    set_addr $I10, rxcap_314_fail
    ($I12, $I11) = rx310_cur."!mark_peek"($I10)
    rx310_cur."!cursor_pos"($I11)
    ($P10) = rx310_cur."!cursor_start"()
    $P10."!cursor_pass"(rx310_pos, "")
    rx310_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_314_done
  rxcap_314_fail:
    goto rx310_fail
  rxcap_314_done:
  # rx charclass s
    ge rx310_pos, rx310_eos, rx310_fail
    sub $I10, rx310_pos, rx310_off
    is_cclass $I11, 32, rx310_tgt, $I10
    unless $I11, rx310_fail
    inc rx310_pos
  # rx subrule "ws" subtype=method negate=
    rx310_cur."!cursor_pos"(rx310_pos)
    $P10 = rx310_cur."ws"()
    unless $P10, rx310_fail
    rx310_pos = $P10."pos"()
  alt316_0:
.annotate 'line', 177
    set_addr $I10, alt316_1
    rx310_cur."!mark_push"(0, rx310_pos, $I10)
.annotate 'line', 178
  # rx subrule "ws" subtype=method negate=
    rx310_cur."!cursor_pos"(rx310_pos)
    $P10 = rx310_cur."ws"()
    unless $P10, rx310_fail
    rx310_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_319_fail
    rx310_cur."!mark_push"(0, rx310_pos, $I10)
  alt318_0:
    set_addr $I10, alt318_1
    rx310_cur."!mark_push"(0, rx310_pos, $I10)
  # rx literal  "while"
    add $I11, rx310_pos, 5
    gt $I11, rx310_eos, rx310_fail
    sub $I11, rx310_pos, rx310_off
    substr $S10, rx310_tgt, $I11, 5
    ne $S10, "while", rx310_fail
    add rx310_pos, 5
    goto alt318_end
  alt318_1:
  # rx literal  "until"
    add $I11, rx310_pos, 5
    gt $I11, rx310_eos, rx310_fail
    sub $I11, rx310_pos, rx310_off
    substr $S10, rx310_tgt, $I11, 5
    ne $S10, "until", rx310_fail
    add rx310_pos, 5
  alt318_end:
    set_addr $I10, rxcap_319_fail
    ($I12, $I11) = rx310_cur."!mark_peek"($I10)
    rx310_cur."!cursor_pos"($I11)
    ($P10) = rx310_cur."!cursor_start"()
    $P10."!cursor_pass"(rx310_pos, "")
    rx310_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_319_done
  rxcap_319_fail:
    goto rx310_fail
  rxcap_319_done:
  # rx charclass s
    ge rx310_pos, rx310_eos, rx310_fail
    sub $I10, rx310_pos, rx310_off
    is_cclass $I11, 32, rx310_tgt, $I10
    unless $I11, rx310_fail
    inc rx310_pos
  # rx subrule "ws" subtype=method negate=
    rx310_cur."!cursor_pos"(rx310_pos)
    $P10 = rx310_cur."ws"()
    unless $P10, rx310_fail
    rx310_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx310_cur."!cursor_pos"(rx310_pos)
    $P10 = rx310_cur."xblock"()
    unless $P10, rx310_fail
    rx310_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx310_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx310_cur."!cursor_pos"(rx310_pos)
    $P10 = rx310_cur."ws"()
    unless $P10, rx310_fail
    rx310_pos = $P10."pos"()
    goto alt316_end
  alt316_1:
.annotate 'line', 179
  # rx subrule "ws" subtype=method negate=
    rx310_cur."!cursor_pos"(rx310_pos)
    $P10 = rx310_cur."ws"()
    unless $P10, rx310_fail
    rx310_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx310_cur."!cursor_pos"(rx310_pos)
    $P10 = rx310_cur."pblock"()
    unless $P10, rx310_fail
    rx310_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx310_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx310_cur."!cursor_pos"(rx310_pos)
    $P10 = rx310_cur."ws"()
    unless $P10, rx310_fail
    rx310_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_325_fail
    rx310_cur."!mark_push"(0, rx310_pos, $I10)
  alt324_0:
    set_addr $I10, alt324_1
    rx310_cur."!mark_push"(0, rx310_pos, $I10)
  # rx literal  "while"
    add $I11, rx310_pos, 5
    gt $I11, rx310_eos, rx310_fail
    sub $I11, rx310_pos, rx310_off
    substr $S10, rx310_tgt, $I11, 5
    ne $S10, "while", rx310_fail
    add rx310_pos, 5
    goto alt324_end
  alt324_1:
  # rx literal  "until"
    add $I11, rx310_pos, 5
    gt $I11, rx310_eos, rx310_fail
    sub $I11, rx310_pos, rx310_off
    substr $S10, rx310_tgt, $I11, 5
    ne $S10, "until", rx310_fail
    add rx310_pos, 5
  alt324_end:
    set_addr $I10, rxcap_325_fail
    ($I12, $I11) = rx310_cur."!mark_peek"($I10)
    rx310_cur."!cursor_pos"($I11)
    ($P10) = rx310_cur."!cursor_start"()
    $P10."!cursor_pass"(rx310_pos, "")
    rx310_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_325_done
  rxcap_325_fail:
    goto rx310_fail
  rxcap_325_done:
  # rx charclass s
    ge rx310_pos, rx310_eos, rx310_fail
    sub $I10, rx310_pos, rx310_off
    is_cclass $I11, 32, rx310_tgt, $I10
    unless $I11, rx310_fail
    inc rx310_pos
  # rx subrule "ws" subtype=method negate=
    rx310_cur."!cursor_pos"(rx310_pos)
    $P10 = rx310_cur."ws"()
    unless $P10, rx310_fail
    rx310_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx310_cur."!cursor_pos"(rx310_pos)
    $P10 = rx310_cur."EXPR"()
    unless $P10, rx310_fail
    rx310_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx310_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx310_cur."!cursor_pos"(rx310_pos)
    $P10 = rx310_cur."ws"()
    unless $P10, rx310_fail
    rx310_pos = $P10."pos"()
  alt316_end:
.annotate 'line', 180
  # rx subrule "ws" subtype=method negate=
    rx310_cur."!cursor_pos"(rx310_pos)
    $P10 = rx310_cur."ws"()
    unless $P10, rx310_fail
    rx310_pos = $P10."pos"()
.annotate 'line', 175
  # rx pass
    rx310_cur."!cursor_pass"(rx310_pos, "statement_control:sym<repeat>")
    rx310_cur."!cursor_debug"("PASS  ", "statement_control:sym<repeat>", " at pos=", rx310_pos)
    .return (rx310_cur)
  rx310_fail:
.annotate 'line', 4
    (rx310_rep, rx310_pos, $I10, $P10) = rx310_cur."!mark_fail"(0)
    lt rx310_pos, -1, rx310_done
    eq rx310_pos, -1, rx310_fail
    jump $I10
  rx310_done:
    rx310_cur."!cursor_fail"()
    rx310_cur."!cursor_debug"("FAIL  ", "statement_control:sym<repeat>")
    .return (rx310_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("70_1275600007.84296") :method
.annotate 'line', 4
    new $P312, "ResizablePMCArray"
    push $P312, "repeat"
    .return ($P312)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("71_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx330_tgt
    .local int rx330_pos
    .local int rx330_off
    .local int rx330_eos
    .local int rx330_rep
    .local pmc rx330_cur
    (rx330_cur, rx330_pos, rx330_tgt) = self."!cursor_start"()
    rx330_cur."!cursor_debug"("START ", "statement_control:sym<for>")
    .lex unicode:"$\x{a2}", rx330_cur
    .local pmc match
    .lex "$/", match
    length rx330_eos, rx330_tgt
    gt rx330_pos, rx330_eos, rx330_done
    set rx330_off, 0
    lt rx330_pos, 2, rx330_start
    sub rx330_off, rx330_pos, 1
    substr rx330_tgt, rx330_tgt, rx330_off
  rx330_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan333_done
    goto rxscan333_scan
  rxscan333_loop:
    ($P10) = rx330_cur."from"()
    inc $P10
    set rx330_pos, $P10
    ge rx330_pos, rx330_eos, rxscan333_done
  rxscan333_scan:
    set_addr $I10, rxscan333_loop
    rx330_cur."!mark_push"(0, rx330_pos, $I10)
  rxscan333_done:
.annotate 'line', 184
  # rx subcapture "sym"
    set_addr $I10, rxcap_334_fail
    rx330_cur."!mark_push"(0, rx330_pos, $I10)
  # rx literal  "for"
    add $I11, rx330_pos, 3
    gt $I11, rx330_eos, rx330_fail
    sub $I11, rx330_pos, rx330_off
    substr $S10, rx330_tgt, $I11, 3
    ne $S10, "for", rx330_fail
    add rx330_pos, 3
    set_addr $I10, rxcap_334_fail
    ($I12, $I11) = rx330_cur."!mark_peek"($I10)
    rx330_cur."!cursor_pos"($I11)
    ($P10) = rx330_cur."!cursor_start"()
    $P10."!cursor_pass"(rx330_pos, "")
    rx330_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_334_done
  rxcap_334_fail:
    goto rx330_fail
  rxcap_334_done:
  # rx charclass s
    ge rx330_pos, rx330_eos, rx330_fail
    sub $I10, rx330_pos, rx330_off
    is_cclass $I11, 32, rx330_tgt, $I10
    unless $I11, rx330_fail
    inc rx330_pos
  # rx subrule "ws" subtype=method negate=
    rx330_cur."!cursor_pos"(rx330_pos)
    $P10 = rx330_cur."ws"()
    unless $P10, rx330_fail
    rx330_pos = $P10."pos"()
.annotate 'line', 185
  # rx subrule "xblock" subtype=capture negate=
    rx330_cur."!cursor_pos"(rx330_pos)
    $P10 = rx330_cur."xblock"()
    unless $P10, rx330_fail
    rx330_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx330_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx330_cur."!cursor_pos"(rx330_pos)
    $P10 = rx330_cur."ws"()
    unless $P10, rx330_fail
    rx330_pos = $P10."pos"()
.annotate 'line', 183
  # rx pass
    rx330_cur."!cursor_pass"(rx330_pos, "statement_control:sym<for>")
    rx330_cur."!cursor_debug"("PASS  ", "statement_control:sym<for>", " at pos=", rx330_pos)
    .return (rx330_cur)
  rx330_fail:
.annotate 'line', 4
    (rx330_rep, rx330_pos, $I10, $P10) = rx330_cur."!mark_fail"(0)
    lt rx330_pos, -1, rx330_done
    eq rx330_pos, -1, rx330_fail
    jump $I10
  rx330_done:
    rx330_cur."!cursor_fail"()
    rx330_cur."!cursor_debug"("FAIL  ", "statement_control:sym<for>")
    .return (rx330_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<for>"  :subid("72_1275600007.84296") :method
.annotate 'line', 4
    new $P332, "ResizablePMCArray"
    push $P332, "for"
    .return ($P332)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CATCH>"  :subid("73_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx338_tgt
    .local int rx338_pos
    .local int rx338_off
    .local int rx338_eos
    .local int rx338_rep
    .local pmc rx338_cur
    (rx338_cur, rx338_pos, rx338_tgt) = self."!cursor_start"()
    rx338_cur."!cursor_debug"("START ", "statement_control:sym<CATCH>")
    .lex unicode:"$\x{a2}", rx338_cur
    .local pmc match
    .lex "$/", match
    length rx338_eos, rx338_tgt
    gt rx338_pos, rx338_eos, rx338_done
    set rx338_off, 0
    lt rx338_pos, 2, rx338_start
    sub rx338_off, rx338_pos, 1
    substr rx338_tgt, rx338_tgt, rx338_off
  rx338_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan341_done
    goto rxscan341_scan
  rxscan341_loop:
    ($P10) = rx338_cur."from"()
    inc $P10
    set rx338_pos, $P10
    ge rx338_pos, rx338_eos, rxscan341_done
  rxscan341_scan:
    set_addr $I10, rxscan341_loop
    rx338_cur."!mark_push"(0, rx338_pos, $I10)
  rxscan341_done:
.annotate 'line', 189
  # rx subcapture "sym"
    set_addr $I10, rxcap_342_fail
    rx338_cur."!mark_push"(0, rx338_pos, $I10)
  # rx literal  "CATCH"
    add $I11, rx338_pos, 5
    gt $I11, rx338_eos, rx338_fail
    sub $I11, rx338_pos, rx338_off
    substr $S10, rx338_tgt, $I11, 5
    ne $S10, "CATCH", rx338_fail
    add rx338_pos, 5
    set_addr $I10, rxcap_342_fail
    ($I12, $I11) = rx338_cur."!mark_peek"($I10)
    rx338_cur."!cursor_pos"($I11)
    ($P10) = rx338_cur."!cursor_start"()
    $P10."!cursor_pass"(rx338_pos, "")
    rx338_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_342_done
  rxcap_342_fail:
    goto rx338_fail
  rxcap_342_done:
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
.annotate 'line', 190
  # rx subrule "block" subtype=capture negate=
    rx338_cur."!cursor_pos"(rx338_pos)
    $P10 = rx338_cur."block"()
    unless $P10, rx338_fail
    rx338_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx338_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx338_cur."!cursor_pos"(rx338_pos)
    $P10 = rx338_cur."ws"()
    unless $P10, rx338_fail
    rx338_pos = $P10."pos"()
.annotate 'line', 188
  # rx pass
    rx338_cur."!cursor_pass"(rx338_pos, "statement_control:sym<CATCH>")
    rx338_cur."!cursor_debug"("PASS  ", "statement_control:sym<CATCH>", " at pos=", rx338_pos)
    .return (rx338_cur)
  rx338_fail:
.annotate 'line', 4
    (rx338_rep, rx338_pos, $I10, $P10) = rx338_cur."!mark_fail"(0)
    lt rx338_pos, -1, rx338_done
    eq rx338_pos, -1, rx338_fail
    jump $I10
  rx338_done:
    rx338_cur."!cursor_fail"()
    rx338_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CATCH>")
    .return (rx338_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CATCH>"  :subid("74_1275600007.84296") :method
.annotate 'line', 4
    new $P340, "ResizablePMCArray"
    push $P340, "CATCH"
    .return ($P340)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CONTROL>"  :subid("75_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx346_tgt
    .local int rx346_pos
    .local int rx346_off
    .local int rx346_eos
    .local int rx346_rep
    .local pmc rx346_cur
    (rx346_cur, rx346_pos, rx346_tgt) = self."!cursor_start"()
    rx346_cur."!cursor_debug"("START ", "statement_control:sym<CONTROL>")
    .lex unicode:"$\x{a2}", rx346_cur
    .local pmc match
    .lex "$/", match
    length rx346_eos, rx346_tgt
    gt rx346_pos, rx346_eos, rx346_done
    set rx346_off, 0
    lt rx346_pos, 2, rx346_start
    sub rx346_off, rx346_pos, 1
    substr rx346_tgt, rx346_tgt, rx346_off
  rx346_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan349_done
    goto rxscan349_scan
  rxscan349_loop:
    ($P10) = rx346_cur."from"()
    inc $P10
    set rx346_pos, $P10
    ge rx346_pos, rx346_eos, rxscan349_done
  rxscan349_scan:
    set_addr $I10, rxscan349_loop
    rx346_cur."!mark_push"(0, rx346_pos, $I10)
  rxscan349_done:
.annotate 'line', 194
  # rx subcapture "sym"
    set_addr $I10, rxcap_350_fail
    rx346_cur."!mark_push"(0, rx346_pos, $I10)
  # rx literal  "CONTROL"
    add $I11, rx346_pos, 7
    gt $I11, rx346_eos, rx346_fail
    sub $I11, rx346_pos, rx346_off
    substr $S10, rx346_tgt, $I11, 7
    ne $S10, "CONTROL", rx346_fail
    add rx346_pos, 7
    set_addr $I10, rxcap_350_fail
    ($I12, $I11) = rx346_cur."!mark_peek"($I10)
    rx346_cur."!cursor_pos"($I11)
    ($P10) = rx346_cur."!cursor_start"()
    $P10."!cursor_pass"(rx346_pos, "")
    rx346_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_350_done
  rxcap_350_fail:
    goto rx346_fail
  rxcap_350_done:
  # rx charclass s
    ge rx346_pos, rx346_eos, rx346_fail
    sub $I10, rx346_pos, rx346_off
    is_cclass $I11, 32, rx346_tgt, $I10
    unless $I11, rx346_fail
    inc rx346_pos
  # rx subrule "ws" subtype=method negate=
    rx346_cur."!cursor_pos"(rx346_pos)
    $P10 = rx346_cur."ws"()
    unless $P10, rx346_fail
    rx346_pos = $P10."pos"()
.annotate 'line', 195
  # rx subrule "block" subtype=capture negate=
    rx346_cur."!cursor_pos"(rx346_pos)
    $P10 = rx346_cur."block"()
    unless $P10, rx346_fail
    rx346_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx346_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx346_cur."!cursor_pos"(rx346_pos)
    $P10 = rx346_cur."ws"()
    unless $P10, rx346_fail
    rx346_pos = $P10."pos"()
.annotate 'line', 193
  # rx pass
    rx346_cur."!cursor_pass"(rx346_pos, "statement_control:sym<CONTROL>")
    rx346_cur."!cursor_debug"("PASS  ", "statement_control:sym<CONTROL>", " at pos=", rx346_pos)
    .return (rx346_cur)
  rx346_fail:
.annotate 'line', 4
    (rx346_rep, rx346_pos, $I10, $P10) = rx346_cur."!mark_fail"(0)
    lt rx346_pos, -1, rx346_done
    eq rx346_pos, -1, rx346_fail
    jump $I10
  rx346_done:
    rx346_cur."!cursor_fail"()
    rx346_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CONTROL>")
    .return (rx346_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CONTROL>"  :subid("76_1275600007.84296") :method
.annotate 'line', 4
    new $P348, "ResizablePMCArray"
    push $P348, "CONTROL"
    .return ($P348)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("77_1275600007.84296") :method
.annotate 'line', 198
    $P354 = self."!protoregex"("statement_prefix")
    .return ($P354)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("78_1275600007.84296") :method
.annotate 'line', 198
    $P356 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P356)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("79_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx358_tgt
    .local int rx358_pos
    .local int rx358_off
    .local int rx358_eos
    .local int rx358_rep
    .local pmc rx358_cur
    (rx358_cur, rx358_pos, rx358_tgt) = self."!cursor_start"()
    rx358_cur."!cursor_debug"("START ", "statement_prefix:sym<INIT>")
    .lex unicode:"$\x{a2}", rx358_cur
    .local pmc match
    .lex "$/", match
    length rx358_eos, rx358_tgt
    gt rx358_pos, rx358_eos, rx358_done
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
  # rx literal  "INIT"
    add $I11, rx358_pos, 4
    gt $I11, rx358_eos, rx358_fail
    sub $I11, rx358_pos, rx358_off
    substr $S10, rx358_tgt, $I11, 4
    ne $S10, "INIT", rx358_fail
    add rx358_pos, 4
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
  # rx subrule "blorst" subtype=capture negate=
    rx358_cur."!cursor_pos"(rx358_pos)
    $P10 = rx358_cur."blorst"()
    unless $P10, rx358_fail
    rx358_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx358_pos = $P10."pos"()
  # rx pass
    rx358_cur."!cursor_pass"(rx358_pos, "statement_prefix:sym<INIT>")
    rx358_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<INIT>", " at pos=", rx358_pos)
    .return (rx358_cur)
  rx358_fail:
.annotate 'line', 4
    (rx358_rep, rx358_pos, $I10, $P10) = rx358_cur."!mark_fail"(0)
    lt rx358_pos, -1, rx358_done
    eq rx358_pos, -1, rx358_fail
    jump $I10
  rx358_done:
    rx358_cur."!cursor_fail"()
    rx358_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<INIT>")
    .return (rx358_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("80_1275600007.84296") :method
.annotate 'line', 4
    $P360 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P361, "ResizablePMCArray"
    push $P361, $P360
    .return ($P361)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<try>"  :subid("81_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx365_tgt
    .local int rx365_pos
    .local int rx365_off
    .local int rx365_eos
    .local int rx365_rep
    .local pmc rx365_cur
    (rx365_cur, rx365_pos, rx365_tgt) = self."!cursor_start"()
    rx365_cur."!cursor_debug"("START ", "statement_prefix:sym<try>")
    .lex unicode:"$\x{a2}", rx365_cur
    .local pmc match
    .lex "$/", match
    length rx365_eos, rx365_tgt
    gt rx365_pos, rx365_eos, rx365_done
    set rx365_off, 0
    lt rx365_pos, 2, rx365_start
    sub rx365_off, rx365_pos, 1
    substr rx365_tgt, rx365_tgt, rx365_off
  rx365_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan369_done
    goto rxscan369_scan
  rxscan369_loop:
    ($P10) = rx365_cur."from"()
    inc $P10
    set rx365_pos, $P10
    ge rx365_pos, rx365_eos, rxscan369_done
  rxscan369_scan:
    set_addr $I10, rxscan369_loop
    rx365_cur."!mark_push"(0, rx365_pos, $I10)
  rxscan369_done:
.annotate 'line', 202
  # rx subcapture "sym"
    set_addr $I10, rxcap_370_fail
    rx365_cur."!mark_push"(0, rx365_pos, $I10)
  # rx literal  "try"
    add $I11, rx365_pos, 3
    gt $I11, rx365_eos, rx365_fail
    sub $I11, rx365_pos, rx365_off
    substr $S10, rx365_tgt, $I11, 3
    ne $S10, "try", rx365_fail
    add rx365_pos, 3
    set_addr $I10, rxcap_370_fail
    ($I12, $I11) = rx365_cur."!mark_peek"($I10)
    rx365_cur."!cursor_pos"($I11)
    ($P10) = rx365_cur."!cursor_start"()
    $P10."!cursor_pass"(rx365_pos, "")
    rx365_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_370_done
  rxcap_370_fail:
    goto rx365_fail
  rxcap_370_done:
.annotate 'line', 203
  # rx subrule "blorst" subtype=capture negate=
    rx365_cur."!cursor_pos"(rx365_pos)
    $P10 = rx365_cur."blorst"()
    unless $P10, rx365_fail
    rx365_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx365_pos = $P10."pos"()
.annotate 'line', 201
  # rx pass
    rx365_cur."!cursor_pass"(rx365_pos, "statement_prefix:sym<try>")
    rx365_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<try>", " at pos=", rx365_pos)
    .return (rx365_cur)
  rx365_fail:
.annotate 'line', 4
    (rx365_rep, rx365_pos, $I10, $P10) = rx365_cur."!mark_fail"(0)
    lt rx365_pos, -1, rx365_done
    eq rx365_pos, -1, rx365_fail
    jump $I10
  rx365_done:
    rx365_cur."!cursor_fail"()
    rx365_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<try>")
    .return (rx365_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<try>"  :subid("82_1275600007.84296") :method
.annotate 'line', 4
    $P367 = self."!PREFIX__!subrule"("blorst", "try")
    new $P368, "ResizablePMCArray"
    push $P368, $P367
    .return ($P368)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("83_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx372_tgt
    .local int rx372_pos
    .local int rx372_off
    .local int rx372_eos
    .local int rx372_rep
    .local pmc rx372_cur
    (rx372_cur, rx372_pos, rx372_tgt) = self."!cursor_start"()
    rx372_cur."!cursor_debug"("START ", "blorst")
    .lex unicode:"$\x{a2}", rx372_cur
    .local pmc match
    .lex "$/", match
    length rx372_eos, rx372_tgt
    gt rx372_pos, rx372_eos, rx372_done
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
.annotate 'line', 207
  # rx charclass s
    ge rx372_pos, rx372_eos, rx372_fail
    sub $I10, rx372_pos, rx372_off
    is_cclass $I11, 32, rx372_tgt, $I10
    unless $I11, rx372_fail
    inc rx372_pos
  # rx subrule "ws" subtype=method negate=
    rx372_cur."!cursor_pos"(rx372_pos)
    $P10 = rx372_cur."ws"()
    unless $P10, rx372_fail
    rx372_pos = $P10."pos"()
  alt376_0:
    set_addr $I10, alt376_1
    rx372_cur."!mark_push"(0, rx372_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx372_pos, rx372_eos, rx372_fail
    sub $I10, rx372_pos, rx372_off
    substr $S10, rx372_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx372_fail
  # rx subrule "block" subtype=capture negate=
    rx372_cur."!cursor_pos"(rx372_pos)
    $P10 = rx372_cur."block"()
    unless $P10, rx372_fail
    rx372_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx372_pos = $P10."pos"()
    goto alt376_end
  alt376_1:
  # rx subrule "statement" subtype=capture negate=
    rx372_cur."!cursor_pos"(rx372_pos)
    $P10 = rx372_cur."statement"()
    unless $P10, rx372_fail
    rx372_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx372_pos = $P10."pos"()
  alt376_end:
.annotate 'line', 206
  # rx pass
    rx372_cur."!cursor_pass"(rx372_pos, "blorst")
    rx372_cur."!cursor_debug"("PASS  ", "blorst", " at pos=", rx372_pos)
    .return (rx372_cur)
  rx372_fail:
.annotate 'line', 4
    (rx372_rep, rx372_pos, $I10, $P10) = rx372_cur."!mark_fail"(0)
    lt rx372_pos, -1, rx372_done
    eq rx372_pos, -1, rx372_fail
    jump $I10
  rx372_done:
    rx372_cur."!cursor_fail"()
    rx372_cur."!cursor_debug"("FAIL  ", "blorst")
    .return (rx372_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blorst"  :subid("84_1275600007.84296") :method
.annotate 'line', 4
    new $P374, "ResizablePMCArray"
    push $P374, ""
    .return ($P374)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("85_1275600007.84296") :method
.annotate 'line', 212
    $P378 = self."!protoregex"("statement_mod_cond")
    .return ($P378)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("86_1275600007.84296") :method
.annotate 'line', 212
    $P380 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P380)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("87_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx382_tgt
    .local int rx382_pos
    .local int rx382_off
    .local int rx382_eos
    .local int rx382_rep
    .local pmc rx382_cur
    (rx382_cur, rx382_pos, rx382_tgt) = self."!cursor_start"()
    rx382_cur."!cursor_debug"("START ", "statement_mod_cond:sym<if>")
    .lex unicode:"$\x{a2}", rx382_cur
    .local pmc match
    .lex "$/", match
    length rx382_eos, rx382_tgt
    gt rx382_pos, rx382_eos, rx382_done
    set rx382_off, 0
    lt rx382_pos, 2, rx382_start
    sub rx382_off, rx382_pos, 1
    substr rx382_tgt, rx382_tgt, rx382_off
  rx382_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan385_done
    goto rxscan385_scan
  rxscan385_loop:
    ($P10) = rx382_cur."from"()
    inc $P10
    set rx382_pos, $P10
    ge rx382_pos, rx382_eos, rxscan385_done
  rxscan385_scan:
    set_addr $I10, rxscan385_loop
    rx382_cur."!mark_push"(0, rx382_pos, $I10)
  rxscan385_done:
.annotate 'line', 214
  # rx subcapture "sym"
    set_addr $I10, rxcap_386_fail
    rx382_cur."!mark_push"(0, rx382_pos, $I10)
  # rx literal  "if"
    add $I11, rx382_pos, 2
    gt $I11, rx382_eos, rx382_fail
    sub $I11, rx382_pos, rx382_off
    substr $S10, rx382_tgt, $I11, 2
    ne $S10, "if", rx382_fail
    add rx382_pos, 2
    set_addr $I10, rxcap_386_fail
    ($I12, $I11) = rx382_cur."!mark_peek"($I10)
    rx382_cur."!cursor_pos"($I11)
    ($P10) = rx382_cur."!cursor_start"()
    $P10."!cursor_pass"(rx382_pos, "")
    rx382_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_386_done
  rxcap_386_fail:
    goto rx382_fail
  rxcap_386_done:
  # rx subrule "ws" subtype=method negate=
    rx382_cur."!cursor_pos"(rx382_pos)
    $P10 = rx382_cur."ws"()
    unless $P10, rx382_fail
    rx382_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx382_cur."!cursor_pos"(rx382_pos)
    $P10 = rx382_cur."EXPR"()
    unless $P10, rx382_fail
    rx382_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx382_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx382_cur."!cursor_pos"(rx382_pos)
    $P10 = rx382_cur."ws"()
    unless $P10, rx382_fail
    rx382_pos = $P10."pos"()
  # rx pass
    rx382_cur."!cursor_pass"(rx382_pos, "statement_mod_cond:sym<if>")
    rx382_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<if>", " at pos=", rx382_pos)
    .return (rx382_cur)
  rx382_fail:
.annotate 'line', 4
    (rx382_rep, rx382_pos, $I10, $P10) = rx382_cur."!mark_fail"(0)
    lt rx382_pos, -1, rx382_done
    eq rx382_pos, -1, rx382_fail
    jump $I10
  rx382_done:
    rx382_cur."!cursor_fail"()
    rx382_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<if>")
    .return (rx382_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("88_1275600007.84296") :method
.annotate 'line', 4
    new $P384, "ResizablePMCArray"
    push $P384, "if"
    .return ($P384)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("89_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx390_tgt
    .local int rx390_pos
    .local int rx390_off
    .local int rx390_eos
    .local int rx390_rep
    .local pmc rx390_cur
    (rx390_cur, rx390_pos, rx390_tgt) = self."!cursor_start"()
    rx390_cur."!cursor_debug"("START ", "statement_mod_cond:sym<unless>")
    .lex unicode:"$\x{a2}", rx390_cur
    .local pmc match
    .lex "$/", match
    length rx390_eos, rx390_tgt
    gt rx390_pos, rx390_eos, rx390_done
    set rx390_off, 0
    lt rx390_pos, 2, rx390_start
    sub rx390_off, rx390_pos, 1
    substr rx390_tgt, rx390_tgt, rx390_off
  rx390_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan393_done
    goto rxscan393_scan
  rxscan393_loop:
    ($P10) = rx390_cur."from"()
    inc $P10
    set rx390_pos, $P10
    ge rx390_pos, rx390_eos, rxscan393_done
  rxscan393_scan:
    set_addr $I10, rxscan393_loop
    rx390_cur."!mark_push"(0, rx390_pos, $I10)
  rxscan393_done:
.annotate 'line', 215
  # rx subcapture "sym"
    set_addr $I10, rxcap_394_fail
    rx390_cur."!mark_push"(0, rx390_pos, $I10)
  # rx literal  "unless"
    add $I11, rx390_pos, 6
    gt $I11, rx390_eos, rx390_fail
    sub $I11, rx390_pos, rx390_off
    substr $S10, rx390_tgt, $I11, 6
    ne $S10, "unless", rx390_fail
    add rx390_pos, 6
    set_addr $I10, rxcap_394_fail
    ($I12, $I11) = rx390_cur."!mark_peek"($I10)
    rx390_cur."!cursor_pos"($I11)
    ($P10) = rx390_cur."!cursor_start"()
    $P10."!cursor_pass"(rx390_pos, "")
    rx390_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_394_done
  rxcap_394_fail:
    goto rx390_fail
  rxcap_394_done:
  # rx subrule "ws" subtype=method negate=
    rx390_cur."!cursor_pos"(rx390_pos)
    $P10 = rx390_cur."ws"()
    unless $P10, rx390_fail
    rx390_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx390_cur."!cursor_pos"(rx390_pos)
    $P10 = rx390_cur."EXPR"()
    unless $P10, rx390_fail
    rx390_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx390_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx390_cur."!cursor_pos"(rx390_pos)
    $P10 = rx390_cur."ws"()
    unless $P10, rx390_fail
    rx390_pos = $P10."pos"()
  # rx pass
    rx390_cur."!cursor_pass"(rx390_pos, "statement_mod_cond:sym<unless>")
    rx390_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<unless>", " at pos=", rx390_pos)
    .return (rx390_cur)
  rx390_fail:
.annotate 'line', 4
    (rx390_rep, rx390_pos, $I10, $P10) = rx390_cur."!mark_fail"(0)
    lt rx390_pos, -1, rx390_done
    eq rx390_pos, -1, rx390_fail
    jump $I10
  rx390_done:
    rx390_cur."!cursor_fail"()
    rx390_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<unless>")
    .return (rx390_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("90_1275600007.84296") :method
.annotate 'line', 4
    new $P392, "ResizablePMCArray"
    push $P392, "unless"
    .return ($P392)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("91_1275600007.84296") :method
.annotate 'line', 217
    $P398 = self."!protoregex"("statement_mod_loop")
    .return ($P398)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("92_1275600007.84296") :method
.annotate 'line', 217
    $P400 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P400)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("93_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx402_tgt
    .local int rx402_pos
    .local int rx402_off
    .local int rx402_eos
    .local int rx402_rep
    .local pmc rx402_cur
    (rx402_cur, rx402_pos, rx402_tgt) = self."!cursor_start"()
    rx402_cur."!cursor_debug"("START ", "statement_mod_loop:sym<while>")
    .lex unicode:"$\x{a2}", rx402_cur
    .local pmc match
    .lex "$/", match
    length rx402_eos, rx402_tgt
    gt rx402_pos, rx402_eos, rx402_done
    set rx402_off, 0
    lt rx402_pos, 2, rx402_start
    sub rx402_off, rx402_pos, 1
    substr rx402_tgt, rx402_tgt, rx402_off
  rx402_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan405_done
    goto rxscan405_scan
  rxscan405_loop:
    ($P10) = rx402_cur."from"()
    inc $P10
    set rx402_pos, $P10
    ge rx402_pos, rx402_eos, rxscan405_done
  rxscan405_scan:
    set_addr $I10, rxscan405_loop
    rx402_cur."!mark_push"(0, rx402_pos, $I10)
  rxscan405_done:
.annotate 'line', 219
  # rx subcapture "sym"
    set_addr $I10, rxcap_406_fail
    rx402_cur."!mark_push"(0, rx402_pos, $I10)
  # rx literal  "while"
    add $I11, rx402_pos, 5
    gt $I11, rx402_eos, rx402_fail
    sub $I11, rx402_pos, rx402_off
    substr $S10, rx402_tgt, $I11, 5
    ne $S10, "while", rx402_fail
    add rx402_pos, 5
    set_addr $I10, rxcap_406_fail
    ($I12, $I11) = rx402_cur."!mark_peek"($I10)
    rx402_cur."!cursor_pos"($I11)
    ($P10) = rx402_cur."!cursor_start"()
    $P10."!cursor_pass"(rx402_pos, "")
    rx402_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_406_done
  rxcap_406_fail:
    goto rx402_fail
  rxcap_406_done:
  # rx subrule "ws" subtype=method negate=
    rx402_cur."!cursor_pos"(rx402_pos)
    $P10 = rx402_cur."ws"()
    unless $P10, rx402_fail
    rx402_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx402_cur."!cursor_pos"(rx402_pos)
    $P10 = rx402_cur."EXPR"()
    unless $P10, rx402_fail
    rx402_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx402_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx402_cur."!cursor_pos"(rx402_pos)
    $P10 = rx402_cur."ws"()
    unless $P10, rx402_fail
    rx402_pos = $P10."pos"()
  # rx pass
    rx402_cur."!cursor_pass"(rx402_pos, "statement_mod_loop:sym<while>")
    rx402_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<while>", " at pos=", rx402_pos)
    .return (rx402_cur)
  rx402_fail:
.annotate 'line', 4
    (rx402_rep, rx402_pos, $I10, $P10) = rx402_cur."!mark_fail"(0)
    lt rx402_pos, -1, rx402_done
    eq rx402_pos, -1, rx402_fail
    jump $I10
  rx402_done:
    rx402_cur."!cursor_fail"()
    rx402_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<while>")
    .return (rx402_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("94_1275600007.84296") :method
.annotate 'line', 4
    new $P404, "ResizablePMCArray"
    push $P404, "while"
    .return ($P404)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("95_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx410_tgt
    .local int rx410_pos
    .local int rx410_off
    .local int rx410_eos
    .local int rx410_rep
    .local pmc rx410_cur
    (rx410_cur, rx410_pos, rx410_tgt) = self."!cursor_start"()
    rx410_cur."!cursor_debug"("START ", "statement_mod_loop:sym<until>")
    .lex unicode:"$\x{a2}", rx410_cur
    .local pmc match
    .lex "$/", match
    length rx410_eos, rx410_tgt
    gt rx410_pos, rx410_eos, rx410_done
    set rx410_off, 0
    lt rx410_pos, 2, rx410_start
    sub rx410_off, rx410_pos, 1
    substr rx410_tgt, rx410_tgt, rx410_off
  rx410_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan413_done
    goto rxscan413_scan
  rxscan413_loop:
    ($P10) = rx410_cur."from"()
    inc $P10
    set rx410_pos, $P10
    ge rx410_pos, rx410_eos, rxscan413_done
  rxscan413_scan:
    set_addr $I10, rxscan413_loop
    rx410_cur."!mark_push"(0, rx410_pos, $I10)
  rxscan413_done:
.annotate 'line', 220
  # rx subcapture "sym"
    set_addr $I10, rxcap_414_fail
    rx410_cur."!mark_push"(0, rx410_pos, $I10)
  # rx literal  "until"
    add $I11, rx410_pos, 5
    gt $I11, rx410_eos, rx410_fail
    sub $I11, rx410_pos, rx410_off
    substr $S10, rx410_tgt, $I11, 5
    ne $S10, "until", rx410_fail
    add rx410_pos, 5
    set_addr $I10, rxcap_414_fail
    ($I12, $I11) = rx410_cur."!mark_peek"($I10)
    rx410_cur."!cursor_pos"($I11)
    ($P10) = rx410_cur."!cursor_start"()
    $P10."!cursor_pass"(rx410_pos, "")
    rx410_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_414_done
  rxcap_414_fail:
    goto rx410_fail
  rxcap_414_done:
  # rx subrule "ws" subtype=method negate=
    rx410_cur."!cursor_pos"(rx410_pos)
    $P10 = rx410_cur."ws"()
    unless $P10, rx410_fail
    rx410_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx410_cur."!cursor_pos"(rx410_pos)
    $P10 = rx410_cur."EXPR"()
    unless $P10, rx410_fail
    rx410_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx410_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx410_cur."!cursor_pos"(rx410_pos)
    $P10 = rx410_cur."ws"()
    unless $P10, rx410_fail
    rx410_pos = $P10."pos"()
  # rx pass
    rx410_cur."!cursor_pass"(rx410_pos, "statement_mod_loop:sym<until>")
    rx410_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<until>", " at pos=", rx410_pos)
    .return (rx410_cur)
  rx410_fail:
.annotate 'line', 4
    (rx410_rep, rx410_pos, $I10, $P10) = rx410_cur."!mark_fail"(0)
    lt rx410_pos, -1, rx410_done
    eq rx410_pos, -1, rx410_fail
    jump $I10
  rx410_done:
    rx410_cur."!cursor_fail"()
    rx410_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<until>")
    .return (rx410_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("96_1275600007.84296") :method
.annotate 'line', 4
    new $P412, "ResizablePMCArray"
    push $P412, "until"
    .return ($P412)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<fatarrow>"  :subid("97_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx418_tgt
    .local int rx418_pos
    .local int rx418_off
    .local int rx418_eos
    .local int rx418_rep
    .local pmc rx418_cur
    (rx418_cur, rx418_pos, rx418_tgt) = self."!cursor_start"()
    rx418_cur."!cursor_debug"("START ", "term:sym<fatarrow>")
    .lex unicode:"$\x{a2}", rx418_cur
    .local pmc match
    .lex "$/", match
    length rx418_eos, rx418_tgt
    gt rx418_pos, rx418_eos, rx418_done
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
.annotate 'line', 224
  # rx subrule "fatarrow" subtype=capture negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."fatarrow"()
    unless $P10, rx418_fail
    rx418_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("fatarrow")
    rx418_pos = $P10."pos"()
  # rx pass
    rx418_cur."!cursor_pass"(rx418_pos, "term:sym<fatarrow>")
    rx418_cur."!cursor_debug"("PASS  ", "term:sym<fatarrow>", " at pos=", rx418_pos)
    .return (rx418_cur)
  rx418_fail:
.annotate 'line', 4
    (rx418_rep, rx418_pos, $I10, $P10) = rx418_cur."!mark_fail"(0)
    lt rx418_pos, -1, rx418_done
    eq rx418_pos, -1, rx418_fail
    jump $I10
  rx418_done:
    rx418_cur."!cursor_fail"()
    rx418_cur."!cursor_debug"("FAIL  ", "term:sym<fatarrow>")
    .return (rx418_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<fatarrow>"  :subid("98_1275600007.84296") :method
.annotate 'line', 4
    $P420 = self."!PREFIX__!subrule"("fatarrow", "")
    new $P421, "ResizablePMCArray"
    push $P421, $P420
    .return ($P421)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("99_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx424_tgt
    .local int rx424_pos
    .local int rx424_off
    .local int rx424_eos
    .local int rx424_rep
    .local pmc rx424_cur
    (rx424_cur, rx424_pos, rx424_tgt) = self."!cursor_start"()
    rx424_cur."!cursor_debug"("START ", "term:sym<colonpair>")
    .lex unicode:"$\x{a2}", rx424_cur
    .local pmc match
    .lex "$/", match
    length rx424_eos, rx424_tgt
    gt rx424_pos, rx424_eos, rx424_done
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
.annotate 'line', 225
  # rx subrule "colonpair" subtype=capture negate=
    rx424_cur."!cursor_pos"(rx424_pos)
    $P10 = rx424_cur."colonpair"()
    unless $P10, rx424_fail
    rx424_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx424_pos = $P10."pos"()
  # rx pass
    rx424_cur."!cursor_pass"(rx424_pos, "term:sym<colonpair>")
    rx424_cur."!cursor_debug"("PASS  ", "term:sym<colonpair>", " at pos=", rx424_pos)
    .return (rx424_cur)
  rx424_fail:
.annotate 'line', 4
    (rx424_rep, rx424_pos, $I10, $P10) = rx424_cur."!mark_fail"(0)
    lt rx424_pos, -1, rx424_done
    eq rx424_pos, -1, rx424_fail
    jump $I10
  rx424_done:
    rx424_cur."!cursor_fail"()
    rx424_cur."!cursor_debug"("FAIL  ", "term:sym<colonpair>")
    .return (rx424_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("100_1275600007.84296") :method
.annotate 'line', 4
    $P426 = self."!PREFIX__!subrule"("colonpair", "")
    new $P427, "ResizablePMCArray"
    push $P427, $P426
    .return ($P427)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("101_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx430_tgt
    .local int rx430_pos
    .local int rx430_off
    .local int rx430_eos
    .local int rx430_rep
    .local pmc rx430_cur
    (rx430_cur, rx430_pos, rx430_tgt) = self."!cursor_start"()
    rx430_cur."!cursor_debug"("START ", "term:sym<variable>")
    .lex unicode:"$\x{a2}", rx430_cur
    .local pmc match
    .lex "$/", match
    length rx430_eos, rx430_tgt
    gt rx430_pos, rx430_eos, rx430_done
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
.annotate 'line', 226
  # rx subrule "variable" subtype=capture negate=
    rx430_cur."!cursor_pos"(rx430_pos)
    $P10 = rx430_cur."variable"()
    unless $P10, rx430_fail
    rx430_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx430_pos = $P10."pos"()
  # rx pass
    rx430_cur."!cursor_pass"(rx430_pos, "term:sym<variable>")
    rx430_cur."!cursor_debug"("PASS  ", "term:sym<variable>", " at pos=", rx430_pos)
    .return (rx430_cur)
  rx430_fail:
.annotate 'line', 4
    (rx430_rep, rx430_pos, $I10, $P10) = rx430_cur."!mark_fail"(0)
    lt rx430_pos, -1, rx430_done
    eq rx430_pos, -1, rx430_fail
    jump $I10
  rx430_done:
    rx430_cur."!cursor_fail"()
    rx430_cur."!cursor_debug"("FAIL  ", "term:sym<variable>")
    .return (rx430_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("102_1275600007.84296") :method
.annotate 'line', 4
    $P432 = self."!PREFIX__!subrule"("variable", "")
    new $P433, "ResizablePMCArray"
    push $P433, $P432
    .return ($P433)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("103_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx436_tgt
    .local int rx436_pos
    .local int rx436_off
    .local int rx436_eos
    .local int rx436_rep
    .local pmc rx436_cur
    (rx436_cur, rx436_pos, rx436_tgt) = self."!cursor_start"()
    rx436_cur."!cursor_debug"("START ", "term:sym<package_declarator>")
    .lex unicode:"$\x{a2}", rx436_cur
    .local pmc match
    .lex "$/", match
    length rx436_eos, rx436_tgt
    gt rx436_pos, rx436_eos, rx436_done
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
.annotate 'line', 227
  # rx subrule "package_declarator" subtype=capture negate=
    rx436_cur."!cursor_pos"(rx436_pos)
    $P10 = rx436_cur."package_declarator"()
    unless $P10, rx436_fail
    rx436_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx436_pos = $P10."pos"()
  # rx pass
    rx436_cur."!cursor_pass"(rx436_pos, "term:sym<package_declarator>")
    rx436_cur."!cursor_debug"("PASS  ", "term:sym<package_declarator>", " at pos=", rx436_pos)
    .return (rx436_cur)
  rx436_fail:
.annotate 'line', 4
    (rx436_rep, rx436_pos, $I10, $P10) = rx436_cur."!mark_fail"(0)
    lt rx436_pos, -1, rx436_done
    eq rx436_pos, -1, rx436_fail
    jump $I10
  rx436_done:
    rx436_cur."!cursor_fail"()
    rx436_cur."!cursor_debug"("FAIL  ", "term:sym<package_declarator>")
    .return (rx436_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("104_1275600007.84296") :method
.annotate 'line', 4
    $P438 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P439, "ResizablePMCArray"
    push $P439, $P438
    .return ($P439)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("105_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx442_tgt
    .local int rx442_pos
    .local int rx442_off
    .local int rx442_eos
    .local int rx442_rep
    .local pmc rx442_cur
    (rx442_cur, rx442_pos, rx442_tgt) = self."!cursor_start"()
    rx442_cur."!cursor_debug"("START ", "term:sym<scope_declarator>")
    .lex unicode:"$\x{a2}", rx442_cur
    .local pmc match
    .lex "$/", match
    length rx442_eos, rx442_tgt
    gt rx442_pos, rx442_eos, rx442_done
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
.annotate 'line', 228
  # rx subrule "scope_declarator" subtype=capture negate=
    rx442_cur."!cursor_pos"(rx442_pos)
    $P10 = rx442_cur."scope_declarator"()
    unless $P10, rx442_fail
    rx442_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx442_pos = $P10."pos"()
  # rx pass
    rx442_cur."!cursor_pass"(rx442_pos, "term:sym<scope_declarator>")
    rx442_cur."!cursor_debug"("PASS  ", "term:sym<scope_declarator>", " at pos=", rx442_pos)
    .return (rx442_cur)
  rx442_fail:
.annotate 'line', 4
    (rx442_rep, rx442_pos, $I10, $P10) = rx442_cur."!mark_fail"(0)
    lt rx442_pos, -1, rx442_done
    eq rx442_pos, -1, rx442_fail
    jump $I10
  rx442_done:
    rx442_cur."!cursor_fail"()
    rx442_cur."!cursor_debug"("FAIL  ", "term:sym<scope_declarator>")
    .return (rx442_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("106_1275600007.84296") :method
.annotate 'line', 4
    $P444 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P445, "ResizablePMCArray"
    push $P445, $P444
    .return ($P445)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("107_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx448_tgt
    .local int rx448_pos
    .local int rx448_off
    .local int rx448_eos
    .local int rx448_rep
    .local pmc rx448_cur
    (rx448_cur, rx448_pos, rx448_tgt) = self."!cursor_start"()
    rx448_cur."!cursor_debug"("START ", "term:sym<routine_declarator>")
    .lex unicode:"$\x{a2}", rx448_cur
    .local pmc match
    .lex "$/", match
    length rx448_eos, rx448_tgt
    gt rx448_pos, rx448_eos, rx448_done
    set rx448_off, 0
    lt rx448_pos, 2, rx448_start
    sub rx448_off, rx448_pos, 1
    substr rx448_tgt, rx448_tgt, rx448_off
  rx448_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan452_done
    goto rxscan452_scan
  rxscan452_loop:
    ($P10) = rx448_cur."from"()
    inc $P10
    set rx448_pos, $P10
    ge rx448_pos, rx448_eos, rxscan452_done
  rxscan452_scan:
    set_addr $I10, rxscan452_loop
    rx448_cur."!mark_push"(0, rx448_pos, $I10)
  rxscan452_done:
.annotate 'line', 229
  # rx subrule "routine_declarator" subtype=capture negate=
    rx448_cur."!cursor_pos"(rx448_pos)
    $P10 = rx448_cur."routine_declarator"()
    unless $P10, rx448_fail
    rx448_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx448_pos = $P10."pos"()
  # rx pass
    rx448_cur."!cursor_pass"(rx448_pos, "term:sym<routine_declarator>")
    rx448_cur."!cursor_debug"("PASS  ", "term:sym<routine_declarator>", " at pos=", rx448_pos)
    .return (rx448_cur)
  rx448_fail:
.annotate 'line', 4
    (rx448_rep, rx448_pos, $I10, $P10) = rx448_cur."!mark_fail"(0)
    lt rx448_pos, -1, rx448_done
    eq rx448_pos, -1, rx448_fail
    jump $I10
  rx448_done:
    rx448_cur."!cursor_fail"()
    rx448_cur."!cursor_debug"("FAIL  ", "term:sym<routine_declarator>")
    .return (rx448_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("108_1275600007.84296") :method
.annotate 'line', 4
    $P450 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P451, "ResizablePMCArray"
    push $P451, $P450
    .return ($P451)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<multi_declarator>"  :subid("109_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .const 'Sub' $P459 = "111_1275600007.84296" 
    capture_lex $P459
    .local string rx454_tgt
    .local int rx454_pos
    .local int rx454_off
    .local int rx454_eos
    .local int rx454_rep
    .local pmc rx454_cur
    (rx454_cur, rx454_pos, rx454_tgt) = self."!cursor_start"()
    rx454_cur."!cursor_debug"("START ", "term:sym<multi_declarator>")
    .lex unicode:"$\x{a2}", rx454_cur
    .local pmc match
    .lex "$/", match
    length rx454_eos, rx454_tgt
    gt rx454_pos, rx454_eos, rx454_done
    set rx454_off, 0
    lt rx454_pos, 2, rx454_start
    sub rx454_off, rx454_pos, 1
    substr rx454_tgt, rx454_tgt, rx454_off
  rx454_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan457_done
    goto rxscan457_scan
  rxscan457_loop:
    ($P10) = rx454_cur."from"()
    inc $P10
    set rx454_pos, $P10
    ge rx454_pos, rx454_eos, rxscan457_done
  rxscan457_scan:
    set_addr $I10, rxscan457_loop
    rx454_cur."!mark_push"(0, rx454_pos, $I10)
  rxscan457_done:
.annotate 'line', 230
  # rx subrule "before" subtype=zerowidth negate=
    rx454_cur."!cursor_pos"(rx454_pos)
    .const 'Sub' $P459 = "111_1275600007.84296" 
    capture_lex $P459
    $P10 = rx454_cur."before"($P459)
    unless $P10, rx454_fail
  # rx subrule "multi_declarator" subtype=capture negate=
    rx454_cur."!cursor_pos"(rx454_pos)
    $P10 = rx454_cur."multi_declarator"()
    unless $P10, rx454_fail
    rx454_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("multi_declarator")
    rx454_pos = $P10."pos"()
  # rx pass
    rx454_cur."!cursor_pass"(rx454_pos, "term:sym<multi_declarator>")
    rx454_cur."!cursor_debug"("PASS  ", "term:sym<multi_declarator>", " at pos=", rx454_pos)
    .return (rx454_cur)
  rx454_fail:
.annotate 'line', 4
    (rx454_rep, rx454_pos, $I10, $P10) = rx454_cur."!mark_fail"(0)
    lt rx454_pos, -1, rx454_done
    eq rx454_pos, -1, rx454_fail
    jump $I10
  rx454_done:
    rx454_cur."!cursor_fail"()
    rx454_cur."!cursor_debug"("FAIL  ", "term:sym<multi_declarator>")
    .return (rx454_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<multi_declarator>"  :subid("110_1275600007.84296") :method
.annotate 'line', 4
    new $P456, "ResizablePMCArray"
    push $P456, ""
    .return ($P456)
.end


.namespace ["NQP";"Grammar"]
.sub "_block458"  :anon :subid("111_1275600007.84296") :method :outer("109_1275600007.84296")
.annotate 'line', 230
    .local string rx460_tgt
    .local int rx460_pos
    .local int rx460_off
    .local int rx460_eos
    .local int rx460_rep
    .local pmc rx460_cur
    (rx460_cur, rx460_pos, rx460_tgt) = self."!cursor_start"()
    rx460_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx460_cur
    .local pmc match
    .lex "$/", match
    length rx460_eos, rx460_tgt
    gt rx460_pos, rx460_eos, rx460_done
    set rx460_off, 0
    lt rx460_pos, 2, rx460_start
    sub rx460_off, rx460_pos, 1
    substr rx460_tgt, rx460_tgt, rx460_off
  rx460_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan461_done
    goto rxscan461_scan
  rxscan461_loop:
    ($P10) = rx460_cur."from"()
    inc $P10
    set rx460_pos, $P10
    ge rx460_pos, rx460_eos, rxscan461_done
  rxscan461_scan:
    set_addr $I10, rxscan461_loop
    rx460_cur."!mark_push"(0, rx460_pos, $I10)
  rxscan461_done:
  alt462_0:
    set_addr $I10, alt462_1
    rx460_cur."!mark_push"(0, rx460_pos, $I10)
  # rx literal  "multi"
    add $I11, rx460_pos, 5
    gt $I11, rx460_eos, rx460_fail
    sub $I11, rx460_pos, rx460_off
    substr $S10, rx460_tgt, $I11, 5
    ne $S10, "multi", rx460_fail
    add rx460_pos, 5
    goto alt462_end
  alt462_1:
    set_addr $I10, alt462_2
    rx460_cur."!mark_push"(0, rx460_pos, $I10)
  # rx literal  "proto"
    add $I11, rx460_pos, 5
    gt $I11, rx460_eos, rx460_fail
    sub $I11, rx460_pos, rx460_off
    substr $S10, rx460_tgt, $I11, 5
    ne $S10, "proto", rx460_fail
    add rx460_pos, 5
    goto alt462_end
  alt462_2:
  # rx literal  "only"
    add $I11, rx460_pos, 4
    gt $I11, rx460_eos, rx460_fail
    sub $I11, rx460_pos, rx460_off
    substr $S10, rx460_tgt, $I11, 4
    ne $S10, "only", rx460_fail
    add rx460_pos, 4
  alt462_end:
  # rx pass
    rx460_cur."!cursor_pass"(rx460_pos, "")
    rx460_cur."!cursor_debug"("PASS  ", "", " at pos=", rx460_pos)
    .return (rx460_cur)
  rx460_fail:
    (rx460_rep, rx460_pos, $I10, $P10) = rx460_cur."!mark_fail"(0)
    lt rx460_pos, -1, rx460_done
    eq rx460_pos, -1, rx460_fail
    jump $I10
  rx460_done:
    rx460_cur."!cursor_fail"()
    rx460_cur."!cursor_debug"("FAIL  ", "")
    .return (rx460_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("112_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx464_tgt
    .local int rx464_pos
    .local int rx464_off
    .local int rx464_eos
    .local int rx464_rep
    .local pmc rx464_cur
    (rx464_cur, rx464_pos, rx464_tgt) = self."!cursor_start"()
    rx464_cur."!cursor_debug"("START ", "term:sym<regex_declarator>")
    .lex unicode:"$\x{a2}", rx464_cur
    .local pmc match
    .lex "$/", match
    length rx464_eos, rx464_tgt
    gt rx464_pos, rx464_eos, rx464_done
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
.annotate 'line', 231
  # rx subrule "regex_declarator" subtype=capture negate=
    rx464_cur."!cursor_pos"(rx464_pos)
    $P10 = rx464_cur."regex_declarator"()
    unless $P10, rx464_fail
    rx464_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx464_pos = $P10."pos"()
  # rx pass
    rx464_cur."!cursor_pass"(rx464_pos, "term:sym<regex_declarator>")
    rx464_cur."!cursor_debug"("PASS  ", "term:sym<regex_declarator>", " at pos=", rx464_pos)
    .return (rx464_cur)
  rx464_fail:
.annotate 'line', 4
    (rx464_rep, rx464_pos, $I10, $P10) = rx464_cur."!mark_fail"(0)
    lt rx464_pos, -1, rx464_done
    eq rx464_pos, -1, rx464_fail
    jump $I10
  rx464_done:
    rx464_cur."!cursor_fail"()
    rx464_cur."!cursor_debug"("FAIL  ", "term:sym<regex_declarator>")
    .return (rx464_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("113_1275600007.84296") :method
.annotate 'line', 4
    $P466 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P467, "ResizablePMCArray"
    push $P467, $P466
    .return ($P467)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("114_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx470_tgt
    .local int rx470_pos
    .local int rx470_off
    .local int rx470_eos
    .local int rx470_rep
    .local pmc rx470_cur
    (rx470_cur, rx470_pos, rx470_tgt) = self."!cursor_start"()
    rx470_cur."!cursor_debug"("START ", "term:sym<statement_prefix>")
    .lex unicode:"$\x{a2}", rx470_cur
    .local pmc match
    .lex "$/", match
    length rx470_eos, rx470_tgt
    gt rx470_pos, rx470_eos, rx470_done
    set rx470_off, 0
    lt rx470_pos, 2, rx470_start
    sub rx470_off, rx470_pos, 1
    substr rx470_tgt, rx470_tgt, rx470_off
  rx470_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan474_done
    goto rxscan474_scan
  rxscan474_loop:
    ($P10) = rx470_cur."from"()
    inc $P10
    set rx470_pos, $P10
    ge rx470_pos, rx470_eos, rxscan474_done
  rxscan474_scan:
    set_addr $I10, rxscan474_loop
    rx470_cur."!mark_push"(0, rx470_pos, $I10)
  rxscan474_done:
.annotate 'line', 232
  # rx subrule "statement_prefix" subtype=capture negate=
    rx470_cur."!cursor_pos"(rx470_pos)
    $P10 = rx470_cur."statement_prefix"()
    unless $P10, rx470_fail
    rx470_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx470_pos = $P10."pos"()
  # rx pass
    rx470_cur."!cursor_pass"(rx470_pos, "term:sym<statement_prefix>")
    rx470_cur."!cursor_debug"("PASS  ", "term:sym<statement_prefix>", " at pos=", rx470_pos)
    .return (rx470_cur)
  rx470_fail:
.annotate 'line', 4
    (rx470_rep, rx470_pos, $I10, $P10) = rx470_cur."!mark_fail"(0)
    lt rx470_pos, -1, rx470_done
    eq rx470_pos, -1, rx470_fail
    jump $I10
  rx470_done:
    rx470_cur."!cursor_fail"()
    rx470_cur."!cursor_debug"("FAIL  ", "term:sym<statement_prefix>")
    .return (rx470_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("115_1275600007.84296") :method
.annotate 'line', 4
    $P472 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P473, "ResizablePMCArray"
    push $P473, $P472
    .return ($P473)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("116_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx476_tgt
    .local int rx476_pos
    .local int rx476_off
    .local int rx476_eos
    .local int rx476_rep
    .local pmc rx476_cur
    (rx476_cur, rx476_pos, rx476_tgt) = self."!cursor_start"()
    rx476_cur."!cursor_debug"("START ", "term:sym<lambda>")
    .lex unicode:"$\x{a2}", rx476_cur
    .local pmc match
    .lex "$/", match
    length rx476_eos, rx476_tgt
    gt rx476_pos, rx476_eos, rx476_done
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
.annotate 'line', 233
  # rx subrule "lambda" subtype=zerowidth negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."lambda"()
    unless $P10, rx476_fail
  # rx subrule "pblock" subtype=capture negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."pblock"()
    unless $P10, rx476_fail
    rx476_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx476_pos = $P10."pos"()
  # rx pass
    rx476_cur."!cursor_pass"(rx476_pos, "term:sym<lambda>")
    rx476_cur."!cursor_debug"("PASS  ", "term:sym<lambda>", " at pos=", rx476_pos)
    .return (rx476_cur)
  rx476_fail:
.annotate 'line', 4
    (rx476_rep, rx476_pos, $I10, $P10) = rx476_cur."!mark_fail"(0)
    lt rx476_pos, -1, rx476_done
    eq rx476_pos, -1, rx476_fail
    jump $I10
  rx476_done:
    rx476_cur."!cursor_fail"()
    rx476_cur."!cursor_debug"("FAIL  ", "term:sym<lambda>")
    .return (rx476_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("117_1275600007.84296") :method
.annotate 'line', 4
    new $P478, "ResizablePMCArray"
    push $P478, ""
    .return ($P478)
.end


.namespace ["NQP";"Grammar"]
.sub "fatarrow"  :subid("118_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx481_tgt
    .local int rx481_pos
    .local int rx481_off
    .local int rx481_eos
    .local int rx481_rep
    .local pmc rx481_cur
    (rx481_cur, rx481_pos, rx481_tgt) = self."!cursor_start"()
    rx481_cur."!cursor_debug"("START ", "fatarrow")
    .lex unicode:"$\x{a2}", rx481_cur
    .local pmc match
    .lex "$/", match
    length rx481_eos, rx481_tgt
    gt rx481_pos, rx481_eos, rx481_done
    set rx481_off, 0
    lt rx481_pos, 2, rx481_start
    sub rx481_off, rx481_pos, 1
    substr rx481_tgt, rx481_tgt, rx481_off
  rx481_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan485_done
    goto rxscan485_scan
  rxscan485_loop:
    ($P10) = rx481_cur."from"()
    inc $P10
    set rx481_pos, $P10
    ge rx481_pos, rx481_eos, rxscan485_done
  rxscan485_scan:
    set_addr $I10, rxscan485_loop
    rx481_cur."!mark_push"(0, rx481_pos, $I10)
  rxscan485_done:
.annotate 'line', 236
  # rx subrule "identifier" subtype=capture negate=
    rx481_cur."!cursor_pos"(rx481_pos)
    $P10 = rx481_cur."identifier"()
    unless $P10, rx481_fail
    rx481_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    rx481_pos = $P10."pos"()
  # rx rxquantr486 ** 0..*
    set_addr $I487, rxquantr486_done
    rx481_cur."!mark_push"(0, rx481_pos, $I487)
  rxquantr486_loop:
  # rx enumcharlist negate=0 
    ge rx481_pos, rx481_eos, rx481_fail
    sub $I10, rx481_pos, rx481_off
    substr $S10, rx481_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx481_fail
    inc rx481_pos
    (rx481_rep) = rx481_cur."!mark_commit"($I487)
    rx481_cur."!mark_push"(rx481_rep, rx481_pos, $I487)
    goto rxquantr486_loop
  rxquantr486_done:
  # rx literal  "=>"
    add $I11, rx481_pos, 2
    gt $I11, rx481_eos, rx481_fail
    sub $I11, rx481_pos, rx481_off
    substr $S10, rx481_tgt, $I11, 2
    ne $S10, "=>", rx481_fail
    add rx481_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx481_cur."!cursor_pos"(rx481_pos)
    $P10 = rx481_cur."ws"()
    unless $P10, rx481_fail
    rx481_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx481_cur."!cursor_pos"(rx481_pos)
    $P10 = rx481_cur."EXPR"("i=")
    unless $P10, rx481_fail
    rx481_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("val")
    rx481_pos = $P10."pos"()
.annotate 'line', 235
  # rx pass
    rx481_cur."!cursor_pass"(rx481_pos, "fatarrow")
    rx481_cur."!cursor_debug"("PASS  ", "fatarrow", " at pos=", rx481_pos)
    .return (rx481_cur)
  rx481_fail:
.annotate 'line', 4
    (rx481_rep, rx481_pos, $I10, $P10) = rx481_cur."!mark_fail"(0)
    lt rx481_pos, -1, rx481_done
    eq rx481_pos, -1, rx481_fail
    jump $I10
  rx481_done:
    rx481_cur."!cursor_fail"()
    rx481_cur."!cursor_debug"("FAIL  ", "fatarrow")
    .return (rx481_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__fatarrow"  :subid("119_1275600007.84296") :method
.annotate 'line', 4
    $P483 = self."!PREFIX__!subrule"("key", "")
    new $P484, "ResizablePMCArray"
    push $P484, $P483
    .return ($P484)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("120_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx489_tgt
    .local int rx489_pos
    .local int rx489_off
    .local int rx489_eos
    .local int rx489_rep
    .local pmc rx489_cur
    (rx489_cur, rx489_pos, rx489_tgt) = self."!cursor_start"()
    rx489_cur."!cursor_debug"("START ", "colonpair")
    rx489_cur."!cursor_caparray"("circumfix")
    .lex unicode:"$\x{a2}", rx489_cur
    .local pmc match
    .lex "$/", match
    length rx489_eos, rx489_tgt
    gt rx489_pos, rx489_eos, rx489_done
    set rx489_off, 0
    lt rx489_pos, 2, rx489_start
    sub rx489_off, rx489_pos, 1
    substr rx489_tgt, rx489_tgt, rx489_off
  rx489_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan495_done
    goto rxscan495_scan
  rxscan495_loop:
    ($P10) = rx489_cur."from"()
    inc $P10
    set rx489_pos, $P10
    ge rx489_pos, rx489_eos, rxscan495_done
  rxscan495_scan:
    set_addr $I10, rxscan495_loop
    rx489_cur."!mark_push"(0, rx489_pos, $I10)
  rxscan495_done:
.annotate 'line', 240
  # rx literal  ":"
    add $I11, rx489_pos, 1
    gt $I11, rx489_eos, rx489_fail
    sub $I11, rx489_pos, rx489_off
    substr $S10, rx489_tgt, $I11, 1
    ne $S10, ":", rx489_fail
    add rx489_pos, 1
  alt496_0:
.annotate 'line', 241
    set_addr $I10, alt496_1
    rx489_cur."!mark_push"(0, rx489_pos, $I10)
.annotate 'line', 242
  # rx subcapture "not"
    set_addr $I10, rxcap_497_fail
    rx489_cur."!mark_push"(0, rx489_pos, $I10)
  # rx literal  "!"
    add $I11, rx489_pos, 1
    gt $I11, rx489_eos, rx489_fail
    sub $I11, rx489_pos, rx489_off
    substr $S10, rx489_tgt, $I11, 1
    ne $S10, "!", rx489_fail
    add rx489_pos, 1
    set_addr $I10, rxcap_497_fail
    ($I12, $I11) = rx489_cur."!mark_peek"($I10)
    rx489_cur."!cursor_pos"($I11)
    ($P10) = rx489_cur."!cursor_start"()
    $P10."!cursor_pass"(rx489_pos, "")
    rx489_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_497_done
  rxcap_497_fail:
    goto rx489_fail
  rxcap_497_done:
  # rx subrule "identifier" subtype=capture negate=
    rx489_cur."!cursor_pos"(rx489_pos)
    $P10 = rx489_cur."identifier"()
    unless $P10, rx489_fail
    rx489_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx489_pos = $P10."pos"()
    goto alt496_end
  alt496_1:
    set_addr $I10, alt496_2
    rx489_cur."!mark_push"(0, rx489_pos, $I10)
.annotate 'line', 243
  # rx subrule "identifier" subtype=capture negate=
    rx489_cur."!cursor_pos"(rx489_pos)
    $P10 = rx489_cur."identifier"()
    unless $P10, rx489_fail
    rx489_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx489_pos = $P10."pos"()
  # rx rxquantr498 ** 0..1
    set_addr $I499, rxquantr498_done
    rx489_cur."!mark_push"(0, rx489_pos, $I499)
  rxquantr498_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx489_cur."!cursor_pos"(rx489_pos)
    $P10 = rx489_cur."circumfix"()
    unless $P10, rx489_fail
    rx489_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx489_pos = $P10."pos"()
    (rx489_rep) = rx489_cur."!mark_commit"($I499)
  rxquantr498_done:
    goto alt496_end
  alt496_2:
.annotate 'line', 244
  # rx subrule "circumfix" subtype=capture negate=
    rx489_cur."!cursor_pos"(rx489_pos)
    $P10 = rx489_cur."circumfix"()
    unless $P10, rx489_fail
    rx489_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx489_pos = $P10."pos"()
  alt496_end:
.annotate 'line', 239
  # rx pass
    rx489_cur."!cursor_pass"(rx489_pos, "colonpair")
    rx489_cur."!cursor_debug"("PASS  ", "colonpair", " at pos=", rx489_pos)
    .return (rx489_cur)
  rx489_fail:
.annotate 'line', 4
    (rx489_rep, rx489_pos, $I10, $P10) = rx489_cur."!mark_fail"(0)
    lt rx489_pos, -1, rx489_done
    eq rx489_pos, -1, rx489_fail
    jump $I10
  rx489_done:
    rx489_cur."!cursor_fail"()
    rx489_cur."!cursor_debug"("FAIL  ", "colonpair")
    .return (rx489_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("121_1275600007.84296") :method
.annotate 'line', 4
    $P491 = self."!PREFIX__!subrule"("circumfix", ":")
    $P492 = self."!PREFIX__!subrule"("identifier", ":")
    $P493 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P494, "ResizablePMCArray"
    push $P494, $P491
    push $P494, $P492
    push $P494, $P493
    .return ($P494)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("122_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx501_tgt
    .local int rx501_pos
    .local int rx501_off
    .local int rx501_eos
    .local int rx501_rep
    .local pmc rx501_cur
    (rx501_cur, rx501_pos, rx501_tgt) = self."!cursor_start"()
    rx501_cur."!cursor_debug"("START ", "variable")
    rx501_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx501_cur
    .local pmc match
    .lex "$/", match
    length rx501_eos, rx501_tgt
    gt rx501_pos, rx501_eos, rx501_done
    set rx501_off, 0
    lt rx501_pos, 2, rx501_start
    sub rx501_off, rx501_pos, 1
    substr rx501_tgt, rx501_tgt, rx501_off
  rx501_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan506_done
    goto rxscan506_scan
  rxscan506_loop:
    ($P10) = rx501_cur."from"()
    inc $P10
    set rx501_pos, $P10
    ge rx501_pos, rx501_eos, rxscan506_done
  rxscan506_scan:
    set_addr $I10, rxscan506_loop
    rx501_cur."!mark_push"(0, rx501_pos, $I10)
  rxscan506_done:
  alt507_0:
.annotate 'line', 248
    set_addr $I10, alt507_1
    rx501_cur."!mark_push"(0, rx501_pos, $I10)
.annotate 'line', 249
  # rx subrule "sigil" subtype=capture negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."sigil"()
    unless $P10, rx501_fail
    rx501_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx501_pos = $P10."pos"()
  # rx rxquantr508 ** 0..1
    set_addr $I509, rxquantr508_done
    rx501_cur."!mark_push"(0, rx501_pos, $I509)
  rxquantr508_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."twigil"()
    unless $P10, rx501_fail
    rx501_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx501_pos = $P10."pos"()
    (rx501_rep) = rx501_cur."!mark_commit"($I509)
  rxquantr508_done:
  # rx subrule "name" subtype=capture negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."name"()
    unless $P10, rx501_fail
    rx501_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx501_pos = $P10."pos"()
    goto alt507_end
  alt507_1:
    set_addr $I10, alt507_2
    rx501_cur."!mark_push"(0, rx501_pos, $I10)
.annotate 'line', 250
  # rx subrule "sigil" subtype=capture negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."sigil"()
    unless $P10, rx501_fail
    rx501_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx501_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx501_pos, rx501_eos, rx501_fail
    sub $I10, rx501_pos, rx501_off
    substr $S10, rx501_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx501_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."postcircumfix"()
    unless $P10, rx501_fail
    rx501_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx501_pos = $P10."pos"()
    goto alt507_end
  alt507_2:
.annotate 'line', 251
  # rx subcapture "sigil"
    set_addr $I10, rxcap_510_fail
    rx501_cur."!mark_push"(0, rx501_pos, $I10)
  # rx literal  "$"
    add $I11, rx501_pos, 1
    gt $I11, rx501_eos, rx501_fail
    sub $I11, rx501_pos, rx501_off
    substr $S10, rx501_tgt, $I11, 1
    ne $S10, "$", rx501_fail
    add rx501_pos, 1
    set_addr $I10, rxcap_510_fail
    ($I12, $I11) = rx501_cur."!mark_peek"($I10)
    rx501_cur."!cursor_pos"($I11)
    ($P10) = rx501_cur."!cursor_start"()
    $P10."!cursor_pass"(rx501_pos, "")
    rx501_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_510_done
  rxcap_510_fail:
    goto rx501_fail
  rxcap_510_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_511_fail
    rx501_cur."!mark_push"(0, rx501_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx501_pos, rx501_eos, rx501_fail
    sub $I10, rx501_pos, rx501_off
    substr $S10, rx501_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx501_fail
    inc rx501_pos
    set_addr $I10, rxcap_511_fail
    ($I12, $I11) = rx501_cur."!mark_peek"($I10)
    rx501_cur."!cursor_pos"($I11)
    ($P10) = rx501_cur."!cursor_start"()
    $P10."!cursor_pass"(rx501_pos, "")
    rx501_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_511_done
  rxcap_511_fail:
    goto rx501_fail
  rxcap_511_done:
  alt507_end:
.annotate 'line', 248
  # rx pass
    rx501_cur."!cursor_pass"(rx501_pos, "variable")
    rx501_cur."!cursor_debug"("PASS  ", "variable", " at pos=", rx501_pos)
    .return (rx501_cur)
  rx501_fail:
.annotate 'line', 4
    (rx501_rep, rx501_pos, $I10, $P10) = rx501_cur."!mark_fail"(0)
    lt rx501_pos, -1, rx501_done
    eq rx501_pos, -1, rx501_fail
    jump $I10
  rx501_done:
    rx501_cur."!cursor_fail"()
    rx501_cur."!cursor_debug"("FAIL  ", "variable")
    .return (rx501_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("123_1275600007.84296") :method
.annotate 'line', 4
    $P503 = self."!PREFIX__!subrule"("sigil", "")
    $P504 = self."!PREFIX__!subrule"("sigil", "")
    new $P505, "ResizablePMCArray"
    push $P505, "$!"
    push $P505, "$_"
    push $P505, "$/"
    push $P505, $P503
    push $P505, $P504
    .return ($P505)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("124_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx513_tgt
    .local int rx513_pos
    .local int rx513_off
    .local int rx513_eos
    .local int rx513_rep
    .local pmc rx513_cur
    (rx513_cur, rx513_pos, rx513_tgt) = self."!cursor_start"()
    rx513_cur."!cursor_debug"("START ", "sigil")
    .lex unicode:"$\x{a2}", rx513_cur
    .local pmc match
    .lex "$/", match
    length rx513_eos, rx513_tgt
    gt rx513_pos, rx513_eos, rx513_done
    set rx513_off, 0
    lt rx513_pos, 2, rx513_start
    sub rx513_off, rx513_pos, 1
    substr rx513_tgt, rx513_tgt, rx513_off
  rx513_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan516_done
    goto rxscan516_scan
  rxscan516_loop:
    ($P10) = rx513_cur."from"()
    inc $P10
    set rx513_pos, $P10
    ge rx513_pos, rx513_eos, rxscan516_done
  rxscan516_scan:
    set_addr $I10, rxscan516_loop
    rx513_cur."!mark_push"(0, rx513_pos, $I10)
  rxscan516_done:
.annotate 'line', 254
  # rx enumcharlist negate=0 
    ge rx513_pos, rx513_eos, rx513_fail
    sub $I10, rx513_pos, rx513_off
    substr $S10, rx513_tgt, $I10, 1
    index $I11, "$@%&", $S10
    lt $I11, 0, rx513_fail
    inc rx513_pos
  # rx pass
    rx513_cur."!cursor_pass"(rx513_pos, "sigil")
    rx513_cur."!cursor_debug"("PASS  ", "sigil", " at pos=", rx513_pos)
    .return (rx513_cur)
  rx513_fail:
.annotate 'line', 4
    (rx513_rep, rx513_pos, $I10, $P10) = rx513_cur."!mark_fail"(0)
    lt rx513_pos, -1, rx513_done
    eq rx513_pos, -1, rx513_fail
    jump $I10
  rx513_done:
    rx513_cur."!cursor_fail"()
    rx513_cur."!cursor_debug"("FAIL  ", "sigil")
    .return (rx513_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("125_1275600007.84296") :method
.annotate 'line', 4
    new $P515, "ResizablePMCArray"
    push $P515, "&"
    push $P515, "%"
    push $P515, "@"
    push $P515, "$"
    .return ($P515)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("126_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx518_tgt
    .local int rx518_pos
    .local int rx518_off
    .local int rx518_eos
    .local int rx518_rep
    .local pmc rx518_cur
    (rx518_cur, rx518_pos, rx518_tgt) = self."!cursor_start"()
    rx518_cur."!cursor_debug"("START ", "twigil")
    .lex unicode:"$\x{a2}", rx518_cur
    .local pmc match
    .lex "$/", match
    length rx518_eos, rx518_tgt
    gt rx518_pos, rx518_eos, rx518_done
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
.annotate 'line', 256
  # rx enumcharlist negate=0 
    ge rx518_pos, rx518_eos, rx518_fail
    sub $I10, rx518_pos, rx518_off
    substr $S10, rx518_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx518_fail
    inc rx518_pos
  # rx pass
    rx518_cur."!cursor_pass"(rx518_pos, "twigil")
    rx518_cur."!cursor_debug"("PASS  ", "twigil", " at pos=", rx518_pos)
    .return (rx518_cur)
  rx518_fail:
.annotate 'line', 4
    (rx518_rep, rx518_pos, $I10, $P10) = rx518_cur."!mark_fail"(0)
    lt rx518_pos, -1, rx518_done
    eq rx518_pos, -1, rx518_fail
    jump $I10
  rx518_done:
    rx518_cur."!cursor_fail"()
    rx518_cur."!cursor_debug"("FAIL  ", "twigil")
    .return (rx518_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("127_1275600007.84296") :method
.annotate 'line', 4
    new $P520, "ResizablePMCArray"
    push $P520, "?"
    push $P520, "!"
    push $P520, "*"
    .return ($P520)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("128_1275600007.84296") :method
.annotate 'line', 258
    $P523 = self."!protoregex"("package_declarator")
    .return ($P523)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("129_1275600007.84296") :method
.annotate 'line', 258
    $P525 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P525)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("130_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx527_tgt
    .local int rx527_pos
    .local int rx527_off
    .local int rx527_eos
    .local int rx527_rep
    .local pmc rx527_cur
    (rx527_cur, rx527_pos, rx527_tgt) = self."!cursor_start"()
    rx527_cur."!cursor_debug"("START ", "package_declarator:sym<module>")
    .lex unicode:"$\x{a2}", rx527_cur
    .local pmc match
    .lex "$/", match
    length rx527_eos, rx527_tgt
    gt rx527_pos, rx527_eos, rx527_done
    set rx527_off, 0
    lt rx527_pos, 2, rx527_start
    sub rx527_off, rx527_pos, 1
    substr rx527_tgt, rx527_tgt, rx527_off
  rx527_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan531_done
    goto rxscan531_scan
  rxscan531_loop:
    ($P10) = rx527_cur."from"()
    inc $P10
    set rx527_pos, $P10
    ge rx527_pos, rx527_eos, rxscan531_done
  rxscan531_scan:
    set_addr $I10, rxscan531_loop
    rx527_cur."!mark_push"(0, rx527_pos, $I10)
  rxscan531_done:
.annotate 'line', 259
  # rx subcapture "sym"
    set_addr $I10, rxcap_532_fail
    rx527_cur."!mark_push"(0, rx527_pos, $I10)
  # rx literal  "module"
    add $I11, rx527_pos, 6
    gt $I11, rx527_eos, rx527_fail
    sub $I11, rx527_pos, rx527_off
    substr $S10, rx527_tgt, $I11, 6
    ne $S10, "module", rx527_fail
    add rx527_pos, 6
    set_addr $I10, rxcap_532_fail
    ($I12, $I11) = rx527_cur."!mark_peek"($I10)
    rx527_cur."!cursor_pos"($I11)
    ($P10) = rx527_cur."!cursor_start"()
    $P10."!cursor_pass"(rx527_pos, "")
    rx527_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_532_done
  rxcap_532_fail:
    goto rx527_fail
  rxcap_532_done:
  # rx subrule "package_def" subtype=capture negate=
    rx527_cur."!cursor_pos"(rx527_pos)
    $P10 = rx527_cur."package_def"()
    unless $P10, rx527_fail
    rx527_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx527_pos = $P10."pos"()
  # rx pass
    rx527_cur."!cursor_pass"(rx527_pos, "package_declarator:sym<module>")
    rx527_cur."!cursor_debug"("PASS  ", "package_declarator:sym<module>", " at pos=", rx527_pos)
    .return (rx527_cur)
  rx527_fail:
.annotate 'line', 4
    (rx527_rep, rx527_pos, $I10, $P10) = rx527_cur."!mark_fail"(0)
    lt rx527_pos, -1, rx527_done
    eq rx527_pos, -1, rx527_fail
    jump $I10
  rx527_done:
    rx527_cur."!cursor_fail"()
    rx527_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<module>")
    .return (rx527_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("131_1275600007.84296") :method
.annotate 'line', 4
    $P529 = self."!PREFIX__!subrule"("package_def", "module")
    new $P530, "ResizablePMCArray"
    push $P530, $P529
    .return ($P530)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("132_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx534_tgt
    .local int rx534_pos
    .local int rx534_off
    .local int rx534_eos
    .local int rx534_rep
    .local pmc rx534_cur
    (rx534_cur, rx534_pos, rx534_tgt) = self."!cursor_start"()
    rx534_cur."!cursor_debug"("START ", "package_declarator:sym<class>")
    .lex unicode:"$\x{a2}", rx534_cur
    .local pmc match
    .lex "$/", match
    length rx534_eos, rx534_tgt
    gt rx534_pos, rx534_eos, rx534_done
    set rx534_off, 0
    lt rx534_pos, 2, rx534_start
    sub rx534_off, rx534_pos, 1
    substr rx534_tgt, rx534_tgt, rx534_off
  rx534_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan539_done
    goto rxscan539_scan
  rxscan539_loop:
    ($P10) = rx534_cur."from"()
    inc $P10
    set rx534_pos, $P10
    ge rx534_pos, rx534_eos, rxscan539_done
  rxscan539_scan:
    set_addr $I10, rxscan539_loop
    rx534_cur."!mark_push"(0, rx534_pos, $I10)
  rxscan539_done:
.annotate 'line', 260
  # rx subcapture "sym"
    set_addr $I10, rxcap_541_fail
    rx534_cur."!mark_push"(0, rx534_pos, $I10)
  alt540_0:
    set_addr $I10, alt540_1
    rx534_cur."!mark_push"(0, rx534_pos, $I10)
  # rx literal  "class"
    add $I11, rx534_pos, 5
    gt $I11, rx534_eos, rx534_fail
    sub $I11, rx534_pos, rx534_off
    substr $S10, rx534_tgt, $I11, 5
    ne $S10, "class", rx534_fail
    add rx534_pos, 5
    goto alt540_end
  alt540_1:
  # rx literal  "grammar"
    add $I11, rx534_pos, 7
    gt $I11, rx534_eos, rx534_fail
    sub $I11, rx534_pos, rx534_off
    substr $S10, rx534_tgt, $I11, 7
    ne $S10, "grammar", rx534_fail
    add rx534_pos, 7
  alt540_end:
    set_addr $I10, rxcap_541_fail
    ($I12, $I11) = rx534_cur."!mark_peek"($I10)
    rx534_cur."!cursor_pos"($I11)
    ($P10) = rx534_cur."!cursor_start"()
    $P10."!cursor_pass"(rx534_pos, "")
    rx534_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_541_done
  rxcap_541_fail:
    goto rx534_fail
  rxcap_541_done:
  # rx subrule "package_def" subtype=capture negate=
    rx534_cur."!cursor_pos"(rx534_pos)
    $P10 = rx534_cur."package_def"()
    unless $P10, rx534_fail
    rx534_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx534_pos = $P10."pos"()
  # rx pass
    rx534_cur."!cursor_pass"(rx534_pos, "package_declarator:sym<class>")
    rx534_cur."!cursor_debug"("PASS  ", "package_declarator:sym<class>", " at pos=", rx534_pos)
    .return (rx534_cur)
  rx534_fail:
.annotate 'line', 4
    (rx534_rep, rx534_pos, $I10, $P10) = rx534_cur."!mark_fail"(0)
    lt rx534_pos, -1, rx534_done
    eq rx534_pos, -1, rx534_fail
    jump $I10
  rx534_done:
    rx534_cur."!cursor_fail"()
    rx534_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<class>")
    .return (rx534_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("133_1275600007.84296") :method
.annotate 'line', 4
    $P536 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P537 = self."!PREFIX__!subrule"("package_def", "class")
    new $P538, "ResizablePMCArray"
    push $P538, $P536
    push $P538, $P537
    .return ($P538)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("134_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx543_tgt
    .local int rx543_pos
    .local int rx543_off
    .local int rx543_eos
    .local int rx543_rep
    .local pmc rx543_cur
    (rx543_cur, rx543_pos, rx543_tgt) = self."!cursor_start"()
    rx543_cur."!cursor_debug"("START ", "package_def")
    rx543_cur."!cursor_caparray"("parent")
    .lex unicode:"$\x{a2}", rx543_cur
    .local pmc match
    .lex "$/", match
    length rx543_eos, rx543_tgt
    gt rx543_pos, rx543_eos, rx543_done
    set rx543_off, 0
    lt rx543_pos, 2, rx543_start
    sub rx543_off, rx543_pos, 1
    substr rx543_tgt, rx543_tgt, rx543_off
  rx543_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan546_done
    goto rxscan546_scan
  rxscan546_loop:
    ($P10) = rx543_cur."from"()
    inc $P10
    set rx543_pos, $P10
    ge rx543_pos, rx543_eos, rxscan546_done
  rxscan546_scan:
    set_addr $I10, rxscan546_loop
    rx543_cur."!mark_push"(0, rx543_pos, $I10)
  rxscan546_done:
.annotate 'line', 262
  # rx subrule "ws" subtype=method negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."ws"()
    unless $P10, rx543_fail
    rx543_pos = $P10."pos"()
.annotate 'line', 263
  # rx subrule "name" subtype=capture negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."name"()
    unless $P10, rx543_fail
    rx543_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx543_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."ws"()
    unless $P10, rx543_fail
    rx543_pos = $P10."pos"()
.annotate 'line', 264
  # rx rxquantr549 ** 0..1
    set_addr $I553, rxquantr549_done
    rx543_cur."!mark_push"(0, rx543_pos, $I553)
  rxquantr549_loop:
  # rx subrule "ws" subtype=method negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."ws"()
    unless $P10, rx543_fail
    rx543_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx543_pos, 2
    gt $I11, rx543_eos, rx543_fail
    sub $I11, rx543_pos, rx543_off
    substr $S10, rx543_tgt, $I11, 2
    ne $S10, "is", rx543_fail
    add rx543_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."ws"()
    unless $P10, rx543_fail
    rx543_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."name"()
    unless $P10, rx543_fail
    rx543_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx543_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."ws"()
    unless $P10, rx543_fail
    rx543_pos = $P10."pos"()
    (rx543_rep) = rx543_cur."!mark_commit"($I553)
  rxquantr549_done:
  # rx subrule "ws" subtype=method negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."ws"()
    unless $P10, rx543_fail
    rx543_pos = $P10."pos"()
  alt555_0:
.annotate 'line', 265
    set_addr $I10, alt555_1
    rx543_cur."!mark_push"(0, rx543_pos, $I10)
.annotate 'line', 266
  # rx subrule "ws" subtype=method negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."ws"()
    unless $P10, rx543_fail
    rx543_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx543_pos, 1
    gt $I11, rx543_eos, rx543_fail
    sub $I11, rx543_pos, rx543_off
    substr $S10, rx543_tgt, $I11, 1
    ne $S10, ";", rx543_fail
    add rx543_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."ws"()
    unless $P10, rx543_fail
    rx543_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."comp_unit"()
    unless $P10, rx543_fail
    rx543_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx543_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."ws"()
    unless $P10, rx543_fail
    rx543_pos = $P10."pos"()
    goto alt555_end
  alt555_1:
    set_addr $I10, alt555_2
    rx543_cur."!mark_push"(0, rx543_pos, $I10)
.annotate 'line', 267
  # rx subrule "ws" subtype=method negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."ws"()
    unless $P10, rx543_fail
    rx543_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx543_pos, rx543_eos, rx543_fail
    sub $I10, rx543_pos, rx543_off
    substr $S10, rx543_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx543_fail
  # rx subrule "ws" subtype=method negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."ws"()
    unless $P10, rx543_fail
    rx543_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."block"()
    unless $P10, rx543_fail
    rx543_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx543_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."ws"()
    unless $P10, rx543_fail
    rx543_pos = $P10."pos"()
    goto alt555_end
  alt555_2:
.annotate 'line', 268
  # rx subrule "ws" subtype=method negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."ws"()
    unless $P10, rx543_fail
    rx543_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."panic"("Malformed package declaration")
    unless $P10, rx543_fail
    rx543_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."ws"()
    unless $P10, rx543_fail
    rx543_pos = $P10."pos"()
  alt555_end:
.annotate 'line', 269
  # rx subrule "ws" subtype=method negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."ws"()
    unless $P10, rx543_fail
    rx543_pos = $P10."pos"()
.annotate 'line', 262
  # rx pass
    rx543_cur."!cursor_pass"(rx543_pos, "package_def")
    rx543_cur."!cursor_debug"("PASS  ", "package_def", " at pos=", rx543_pos)
    .return (rx543_cur)
  rx543_fail:
.annotate 'line', 4
    (rx543_rep, rx543_pos, $I10, $P10) = rx543_cur."!mark_fail"(0)
    lt rx543_pos, -1, rx543_done
    eq rx543_pos, -1, rx543_fail
    jump $I10
  rx543_done:
    rx543_cur."!cursor_fail"()
    rx543_cur."!cursor_debug"("FAIL  ", "package_def")
    .return (rx543_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("135_1275600007.84296") :method
.annotate 'line', 4
    new $P545, "ResizablePMCArray"
    push $P545, ""
    .return ($P545)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("136_1275600007.84296") :method
.annotate 'line', 272
    $P566 = self."!protoregex"("scope_declarator")
    .return ($P566)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("137_1275600007.84296") :method
.annotate 'line', 272
    $P568 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P568)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("138_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx570_tgt
    .local int rx570_pos
    .local int rx570_off
    .local int rx570_eos
    .local int rx570_rep
    .local pmc rx570_cur
    (rx570_cur, rx570_pos, rx570_tgt) = self."!cursor_start"()
    rx570_cur."!cursor_debug"("START ", "scope_declarator:sym<my>")
    .lex unicode:"$\x{a2}", rx570_cur
    .local pmc match
    .lex "$/", match
    length rx570_eos, rx570_tgt
    gt rx570_pos, rx570_eos, rx570_done
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
.annotate 'line', 273
  # rx subcapture "sym"
    set_addr $I10, rxcap_575_fail
    rx570_cur."!mark_push"(0, rx570_pos, $I10)
  # rx literal  "my"
    add $I11, rx570_pos, 2
    gt $I11, rx570_eos, rx570_fail
    sub $I11, rx570_pos, rx570_off
    substr $S10, rx570_tgt, $I11, 2
    ne $S10, "my", rx570_fail
    add rx570_pos, 2
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
  # rx subrule "scoped" subtype=capture negate=
    rx570_cur."!cursor_pos"(rx570_pos)
    $P10 = rx570_cur."scoped"("my")
    unless $P10, rx570_fail
    rx570_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx570_pos = $P10."pos"()
  # rx pass
    rx570_cur."!cursor_pass"(rx570_pos, "scope_declarator:sym<my>")
    rx570_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<my>", " at pos=", rx570_pos)
    .return (rx570_cur)
  rx570_fail:
.annotate 'line', 4
    (rx570_rep, rx570_pos, $I10, $P10) = rx570_cur."!mark_fail"(0)
    lt rx570_pos, -1, rx570_done
    eq rx570_pos, -1, rx570_fail
    jump $I10
  rx570_done:
    rx570_cur."!cursor_fail"()
    rx570_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<my>")
    .return (rx570_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("139_1275600007.84296") :method
.annotate 'line', 4
    $P572 = self."!PREFIX__!subrule"("scoped", "my")
    new $P573, "ResizablePMCArray"
    push $P573, $P572
    .return ($P573)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("140_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx577_tgt
    .local int rx577_pos
    .local int rx577_off
    .local int rx577_eos
    .local int rx577_rep
    .local pmc rx577_cur
    (rx577_cur, rx577_pos, rx577_tgt) = self."!cursor_start"()
    rx577_cur."!cursor_debug"("START ", "scope_declarator:sym<our>")
    .lex unicode:"$\x{a2}", rx577_cur
    .local pmc match
    .lex "$/", match
    length rx577_eos, rx577_tgt
    gt rx577_pos, rx577_eos, rx577_done
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
.annotate 'line', 274
  # rx subcapture "sym"
    set_addr $I10, rxcap_582_fail
    rx577_cur."!mark_push"(0, rx577_pos, $I10)
  # rx literal  "our"
    add $I11, rx577_pos, 3
    gt $I11, rx577_eos, rx577_fail
    sub $I11, rx577_pos, rx577_off
    substr $S10, rx577_tgt, $I11, 3
    ne $S10, "our", rx577_fail
    add rx577_pos, 3
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
  # rx subrule "scoped" subtype=capture negate=
    rx577_cur."!cursor_pos"(rx577_pos)
    $P10 = rx577_cur."scoped"("our")
    unless $P10, rx577_fail
    rx577_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx577_pos = $P10."pos"()
  # rx pass
    rx577_cur."!cursor_pass"(rx577_pos, "scope_declarator:sym<our>")
    rx577_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<our>", " at pos=", rx577_pos)
    .return (rx577_cur)
  rx577_fail:
.annotate 'line', 4
    (rx577_rep, rx577_pos, $I10, $P10) = rx577_cur."!mark_fail"(0)
    lt rx577_pos, -1, rx577_done
    eq rx577_pos, -1, rx577_fail
    jump $I10
  rx577_done:
    rx577_cur."!cursor_fail"()
    rx577_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<our>")
    .return (rx577_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("141_1275600007.84296") :method
.annotate 'line', 4
    $P579 = self."!PREFIX__!subrule"("scoped", "our")
    new $P580, "ResizablePMCArray"
    push $P580, $P579
    .return ($P580)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("142_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx584_tgt
    .local int rx584_pos
    .local int rx584_off
    .local int rx584_eos
    .local int rx584_rep
    .local pmc rx584_cur
    (rx584_cur, rx584_pos, rx584_tgt) = self."!cursor_start"()
    rx584_cur."!cursor_debug"("START ", "scope_declarator:sym<has>")
    .lex unicode:"$\x{a2}", rx584_cur
    .local pmc match
    .lex "$/", match
    length rx584_eos, rx584_tgt
    gt rx584_pos, rx584_eos, rx584_done
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
.annotate 'line', 275
  # rx subcapture "sym"
    set_addr $I10, rxcap_589_fail
    rx584_cur."!mark_push"(0, rx584_pos, $I10)
  # rx literal  "has"
    add $I11, rx584_pos, 3
    gt $I11, rx584_eos, rx584_fail
    sub $I11, rx584_pos, rx584_off
    substr $S10, rx584_tgt, $I11, 3
    ne $S10, "has", rx584_fail
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
  # rx subrule "scoped" subtype=capture negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."scoped"("has")
    unless $P10, rx584_fail
    rx584_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx584_pos = $P10."pos"()
  # rx pass
    rx584_cur."!cursor_pass"(rx584_pos, "scope_declarator:sym<has>")
    rx584_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<has>", " at pos=", rx584_pos)
    .return (rx584_cur)
  rx584_fail:
.annotate 'line', 4
    (rx584_rep, rx584_pos, $I10, $P10) = rx584_cur."!mark_fail"(0)
    lt rx584_pos, -1, rx584_done
    eq rx584_pos, -1, rx584_fail
    jump $I10
  rx584_done:
    rx584_cur."!cursor_fail"()
    rx584_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<has>")
    .return (rx584_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("143_1275600007.84296") :method
.annotate 'line', 4
    $P586 = self."!PREFIX__!subrule"("scoped", "has")
    new $P587, "ResizablePMCArray"
    push $P587, $P586
    .return ($P587)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("144_1275600007.84296") :method :outer("11_1275600007.84296")
    .param pmc param_591
.annotate 'line', 277
    .lex "$*SCOPE", param_591
.annotate 'line', 4
    .local string rx592_tgt
    .local int rx592_pos
    .local int rx592_off
    .local int rx592_eos
    .local int rx592_rep
    .local pmc rx592_cur
    (rx592_cur, rx592_pos, rx592_tgt) = self."!cursor_start"()
    rx592_cur."!cursor_debug"("START ", "scoped")
    .lex unicode:"$\x{a2}", rx592_cur
    .local pmc match
    .lex "$/", match
    length rx592_eos, rx592_tgt
    gt rx592_pos, rx592_eos, rx592_done
    set rx592_off, 0
    lt rx592_pos, 2, rx592_start
    sub rx592_off, rx592_pos, 1
    substr rx592_tgt, rx592_tgt, rx592_off
  rx592_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan595_done
    goto rxscan595_scan
  rxscan595_loop:
    ($P10) = rx592_cur."from"()
    inc $P10
    set rx592_pos, $P10
    ge rx592_pos, rx592_eos, rxscan595_done
  rxscan595_scan:
    set_addr $I10, rxscan595_loop
    rx592_cur."!mark_push"(0, rx592_pos, $I10)
  rxscan595_done:
  alt596_0:
.annotate 'line', 277
    set_addr $I10, alt596_1
    rx592_cur."!mark_push"(0, rx592_pos, $I10)
.annotate 'line', 278
  # rx subrule "ws" subtype=method negate=
    rx592_cur."!cursor_pos"(rx592_pos)
    $P10 = rx592_cur."ws"()
    unless $P10, rx592_fail
    rx592_pos = $P10."pos"()
  # rx subrule "declarator" subtype=capture negate=
    rx592_cur."!cursor_pos"(rx592_pos)
    $P10 = rx592_cur."declarator"()
    unless $P10, rx592_fail
    rx592_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx592_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx592_cur."!cursor_pos"(rx592_pos)
    $P10 = rx592_cur."ws"()
    unless $P10, rx592_fail
    rx592_pos = $P10."pos"()
    goto alt596_end
  alt596_1:
.annotate 'line', 279
  # rx subrule "ws" subtype=method negate=
    rx592_cur."!cursor_pos"(rx592_pos)
    $P10 = rx592_cur."ws"()
    unless $P10, rx592_fail
    rx592_pos = $P10."pos"()
  # rx subrule "multi_declarator" subtype=capture negate=
    rx592_cur."!cursor_pos"(rx592_pos)
    $P10 = rx592_cur."multi_declarator"()
    unless $P10, rx592_fail
    rx592_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("multi_declarator")
    rx592_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx592_cur."!cursor_pos"(rx592_pos)
    $P10 = rx592_cur."ws"()
    unless $P10, rx592_fail
    rx592_pos = $P10."pos"()
  alt596_end:
.annotate 'line', 277
  # rx pass
    rx592_cur."!cursor_pass"(rx592_pos, "scoped")
    rx592_cur."!cursor_debug"("PASS  ", "scoped", " at pos=", rx592_pos)
    .return (rx592_cur)
  rx592_fail:
.annotate 'line', 4
    (rx592_rep, rx592_pos, $I10, $P10) = rx592_cur."!mark_fail"(0)
    lt rx592_pos, -1, rx592_done
    eq rx592_pos, -1, rx592_fail
    jump $I10
  rx592_done:
    rx592_cur."!cursor_fail"()
    rx592_cur."!cursor_debug"("FAIL  ", "scoped")
    .return (rx592_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("145_1275600007.84296") :method
.annotate 'line', 4
    new $P594, "ResizablePMCArray"
    push $P594, ""
    push $P594, ""
    .return ($P594)
.end


.namespace ["NQP";"Grammar"]
.sub "typename"  :subid("146_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx602_tgt
    .local int rx602_pos
    .local int rx602_off
    .local int rx602_eos
    .local int rx602_rep
    .local pmc rx602_cur
    (rx602_cur, rx602_pos, rx602_tgt) = self."!cursor_start"()
    rx602_cur."!cursor_debug"("START ", "typename")
    .lex unicode:"$\x{a2}", rx602_cur
    .local pmc match
    .lex "$/", match
    length rx602_eos, rx602_tgt
    gt rx602_pos, rx602_eos, rx602_done
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
  # rx subrule "name" subtype=capture negate=
    rx602_cur."!cursor_pos"(rx602_pos)
    $P10 = rx602_cur."name"()
    unless $P10, rx602_fail
    rx602_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx602_pos = $P10."pos"()
  # rx pass
    rx602_cur."!cursor_pass"(rx602_pos, "typename")
    rx602_cur."!cursor_debug"("PASS  ", "typename", " at pos=", rx602_pos)
    .return (rx602_cur)
  rx602_fail:
.annotate 'line', 4
    (rx602_rep, rx602_pos, $I10, $P10) = rx602_cur."!mark_fail"(0)
    lt rx602_pos, -1, rx602_done
    eq rx602_pos, -1, rx602_fail
    jump $I10
  rx602_done:
    rx602_cur."!cursor_fail"()
    rx602_cur."!cursor_debug"("FAIL  ", "typename")
    .return (rx602_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__typename"  :subid("147_1275600007.84296") :method
.annotate 'line', 4
    $P604 = self."!PREFIX__!subrule"("name", "")
    new $P605, "ResizablePMCArray"
    push $P605, $P604
    .return ($P605)
.end


.namespace ["NQP";"Grammar"]
.sub "declarator"  :subid("148_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx608_tgt
    .local int rx608_pos
    .local int rx608_off
    .local int rx608_eos
    .local int rx608_rep
    .local pmc rx608_cur
    (rx608_cur, rx608_pos, rx608_tgt) = self."!cursor_start"()
    rx608_cur."!cursor_debug"("START ", "declarator")
    .lex unicode:"$\x{a2}", rx608_cur
    .local pmc match
    .lex "$/", match
    length rx608_eos, rx608_tgt
    gt rx608_pos, rx608_eos, rx608_done
    set rx608_off, 0
    lt rx608_pos, 2, rx608_start
    sub rx608_off, rx608_pos, 1
    substr rx608_tgt, rx608_tgt, rx608_off
  rx608_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan613_done
    goto rxscan613_scan
  rxscan613_loop:
    ($P10) = rx608_cur."from"()
    inc $P10
    set rx608_pos, $P10
    ge rx608_pos, rx608_eos, rxscan613_done
  rxscan613_scan:
    set_addr $I10, rxscan613_loop
    rx608_cur."!mark_push"(0, rx608_pos, $I10)
  rxscan613_done:
  alt614_0:
.annotate 'line', 284
    set_addr $I10, alt614_1
    rx608_cur."!mark_push"(0, rx608_pos, $I10)
.annotate 'line', 285
  # rx subrule "variable_declarator" subtype=capture negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."variable_declarator"()
    unless $P10, rx608_fail
    rx608_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx608_pos = $P10."pos"()
    goto alt614_end
  alt614_1:
.annotate 'line', 286
  # rx subrule "routine_declarator" subtype=capture negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."routine_declarator"()
    unless $P10, rx608_fail
    rx608_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx608_pos = $P10."pos"()
  alt614_end:
.annotate 'line', 284
  # rx pass
    rx608_cur."!cursor_pass"(rx608_pos, "declarator")
    rx608_cur."!cursor_debug"("PASS  ", "declarator", " at pos=", rx608_pos)
    .return (rx608_cur)
  rx608_fail:
.annotate 'line', 4
    (rx608_rep, rx608_pos, $I10, $P10) = rx608_cur."!mark_fail"(0)
    lt rx608_pos, -1, rx608_done
    eq rx608_pos, -1, rx608_fail
    jump $I10
  rx608_done:
    rx608_cur."!cursor_fail"()
    rx608_cur."!cursor_debug"("FAIL  ", "declarator")
    .return (rx608_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__declarator"  :subid("149_1275600007.84296") :method
.annotate 'line', 4
    $P610 = self."!PREFIX__!subrule"("routine_declarator", "")
    $P611 = self."!PREFIX__!subrule"("variable_declarator", "")
    new $P612, "ResizablePMCArray"
    push $P612, $P610
    push $P612, $P611
    .return ($P612)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("150_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx616_tgt
    .local int rx616_pos
    .local int rx616_off
    .local int rx616_eos
    .local int rx616_rep
    .local pmc rx616_cur
    (rx616_cur, rx616_pos, rx616_tgt) = self."!cursor_start"()
    rx616_cur."!cursor_debug"("START ", "variable_declarator")
    .lex unicode:"$\x{a2}", rx616_cur
    .local pmc match
    .lex "$/", match
    length rx616_eos, rx616_tgt
    gt rx616_pos, rx616_eos, rx616_done
    set rx616_off, 0
    lt rx616_pos, 2, rx616_start
    sub rx616_off, rx616_pos, 1
    substr rx616_tgt, rx616_tgt, rx616_off
  rx616_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan620_done
    goto rxscan620_scan
  rxscan620_loop:
    ($P10) = rx616_cur."from"()
    inc $P10
    set rx616_pos, $P10
    ge rx616_pos, rx616_eos, rxscan620_done
  rxscan620_scan:
    set_addr $I10, rxscan620_loop
    rx616_cur."!mark_push"(0, rx616_pos, $I10)
  rxscan620_done:
.annotate 'line', 289
  # rx subrule "variable" subtype=capture negate=
    rx616_cur."!cursor_pos"(rx616_pos)
    $P10 = rx616_cur."variable"()
    unless $P10, rx616_fail
    rx616_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx616_pos = $P10."pos"()
  # rx pass
    rx616_cur."!cursor_pass"(rx616_pos, "variable_declarator")
    rx616_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx616_pos)
    .return (rx616_cur)
  rx616_fail:
.annotate 'line', 4
    (rx616_rep, rx616_pos, $I10, $P10) = rx616_cur."!mark_fail"(0)
    lt rx616_pos, -1, rx616_done
    eq rx616_pos, -1, rx616_fail
    jump $I10
  rx616_done:
    rx616_cur."!cursor_fail"()
    rx616_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx616_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("151_1275600007.84296") :method
.annotate 'line', 4
    $P618 = self."!PREFIX__!subrule"("variable", "")
    new $P619, "ResizablePMCArray"
    push $P619, $P618
    .return ($P619)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("152_1275600007.84296") :method
.annotate 'line', 291
    $P622 = self."!protoregex"("routine_declarator")
    .return ($P622)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("153_1275600007.84296") :method
.annotate 'line', 291
    $P624 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P624)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("154_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx626_tgt
    .local int rx626_pos
    .local int rx626_off
    .local int rx626_eos
    .local int rx626_rep
    .local pmc rx626_cur
    (rx626_cur, rx626_pos, rx626_tgt) = self."!cursor_start"()
    rx626_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
    .lex unicode:"$\x{a2}", rx626_cur
    .local pmc match
    .lex "$/", match
    length rx626_eos, rx626_tgt
    gt rx626_pos, rx626_eos, rx626_done
    set rx626_off, 0
    lt rx626_pos, 2, rx626_start
    sub rx626_off, rx626_pos, 1
    substr rx626_tgt, rx626_tgt, rx626_off
  rx626_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan630_done
    goto rxscan630_scan
  rxscan630_loop:
    ($P10) = rx626_cur."from"()
    inc $P10
    set rx626_pos, $P10
    ge rx626_pos, rx626_eos, rxscan630_done
  rxscan630_scan:
    set_addr $I10, rxscan630_loop
    rx626_cur."!mark_push"(0, rx626_pos, $I10)
  rxscan630_done:
.annotate 'line', 292
  # rx subcapture "sym"
    set_addr $I10, rxcap_631_fail
    rx626_cur."!mark_push"(0, rx626_pos, $I10)
  # rx literal  "sub"
    add $I11, rx626_pos, 3
    gt $I11, rx626_eos, rx626_fail
    sub $I11, rx626_pos, rx626_off
    substr $S10, rx626_tgt, $I11, 3
    ne $S10, "sub", rx626_fail
    add rx626_pos, 3
    set_addr $I10, rxcap_631_fail
    ($I12, $I11) = rx626_cur."!mark_peek"($I10)
    rx626_cur."!cursor_pos"($I11)
    ($P10) = rx626_cur."!cursor_start"()
    $P10."!cursor_pass"(rx626_pos, "")
    rx626_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_631_done
  rxcap_631_fail:
    goto rx626_fail
  rxcap_631_done:
  # rx subrule "routine_def" subtype=capture negate=
    rx626_cur."!cursor_pos"(rx626_pos)
    $P10 = rx626_cur."routine_def"()
    unless $P10, rx626_fail
    rx626_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx626_pos = $P10."pos"()
  # rx pass
    rx626_cur."!cursor_pass"(rx626_pos, "routine_declarator:sym<sub>")
    rx626_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx626_pos)
    .return (rx626_cur)
  rx626_fail:
.annotate 'line', 4
    (rx626_rep, rx626_pos, $I10, $P10) = rx626_cur."!mark_fail"(0)
    lt rx626_pos, -1, rx626_done
    eq rx626_pos, -1, rx626_fail
    jump $I10
  rx626_done:
    rx626_cur."!cursor_fail"()
    rx626_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx626_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("155_1275600007.84296") :method
.annotate 'line', 4
    $P628 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P629, "ResizablePMCArray"
    push $P629, $P628
    .return ($P629)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("156_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx633_tgt
    .local int rx633_pos
    .local int rx633_off
    .local int rx633_eos
    .local int rx633_rep
    .local pmc rx633_cur
    (rx633_cur, rx633_pos, rx633_tgt) = self."!cursor_start"()
    rx633_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
    .lex unicode:"$\x{a2}", rx633_cur
    .local pmc match
    .lex "$/", match
    length rx633_eos, rx633_tgt
    gt rx633_pos, rx633_eos, rx633_done
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
.annotate 'line', 293
  # rx subcapture "sym"
    set_addr $I10, rxcap_638_fail
    rx633_cur."!mark_push"(0, rx633_pos, $I10)
  # rx literal  "method"
    add $I11, rx633_pos, 6
    gt $I11, rx633_eos, rx633_fail
    sub $I11, rx633_pos, rx633_off
    substr $S10, rx633_tgt, $I11, 6
    ne $S10, "method", rx633_fail
    add rx633_pos, 6
    set_addr $I10, rxcap_638_fail
    ($I12, $I11) = rx633_cur."!mark_peek"($I10)
    rx633_cur."!cursor_pos"($I11)
    ($P10) = rx633_cur."!cursor_start"()
    $P10."!cursor_pass"(rx633_pos, "")
    rx633_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_638_done
  rxcap_638_fail:
    goto rx633_fail
  rxcap_638_done:
  # rx subrule "method_def" subtype=capture negate=
    rx633_cur."!cursor_pos"(rx633_pos)
    $P10 = rx633_cur."method_def"()
    unless $P10, rx633_fail
    rx633_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx633_pos = $P10."pos"()
  # rx pass
    rx633_cur."!cursor_pass"(rx633_pos, "routine_declarator:sym<method>")
    rx633_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx633_pos)
    .return (rx633_cur)
  rx633_fail:
.annotate 'line', 4
    (rx633_rep, rx633_pos, $I10, $P10) = rx633_cur."!mark_fail"(0)
    lt rx633_pos, -1, rx633_done
    eq rx633_pos, -1, rx633_fail
    jump $I10
  rx633_done:
    rx633_cur."!cursor_fail"()
    rx633_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx633_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("157_1275600007.84296") :method
.annotate 'line', 4
    $P635 = self."!PREFIX__!subrule"("method_def", "method")
    new $P636, "ResizablePMCArray"
    push $P636, $P635
    .return ($P636)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("158_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx640_tgt
    .local int rx640_pos
    .local int rx640_off
    .local int rx640_eos
    .local int rx640_rep
    .local pmc rx640_cur
    (rx640_cur, rx640_pos, rx640_tgt) = self."!cursor_start"()
    rx640_cur."!cursor_debug"("START ", "routine_def")
    rx640_cur."!cursor_caparray"("deflongname", "sigil")
    .lex unicode:"$\x{a2}", rx640_cur
    .local pmc match
    .lex "$/", match
    length rx640_eos, rx640_tgt
    gt rx640_pos, rx640_eos, rx640_done
    set rx640_off, 0
    lt rx640_pos, 2, rx640_start
    sub rx640_off, rx640_pos, 1
    substr rx640_tgt, rx640_tgt, rx640_off
  rx640_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan643_done
    goto rxscan643_scan
  rxscan643_loop:
    ($P10) = rx640_cur."from"()
    inc $P10
    set rx640_pos, $P10
    ge rx640_pos, rx640_eos, rxscan643_done
  rxscan643_scan:
    set_addr $I10, rxscan643_loop
    rx640_cur."!mark_push"(0, rx640_pos, $I10)
  rxscan643_done:
.annotate 'line', 295
  # rx subrule "ws" subtype=method negate=
    rx640_cur."!cursor_pos"(rx640_pos)
    $P10 = rx640_cur."ws"()
    unless $P10, rx640_fail
    rx640_pos = $P10."pos"()
.annotate 'line', 296
  # rx rxquantr645 ** 0..1
    set_addr $I651, rxquantr645_done
    rx640_cur."!mark_push"(0, rx640_pos, $I651)
  rxquantr645_loop:
  # rx subrule "ws" subtype=method negate=
    rx640_cur."!cursor_pos"(rx640_pos)
    $P10 = rx640_cur."ws"()
    unless $P10, rx640_fail
    rx640_pos = $P10."pos"()
  # rx subcapture "sigil"
    set_addr $I10, rxcap_649_fail
    rx640_cur."!mark_push"(0, rx640_pos, $I10)
  # rx rxquantr647 ** 0..1
    set_addr $I648, rxquantr647_done
    rx640_cur."!mark_push"(0, rx640_pos, $I648)
  rxquantr647_loop:
  # rx literal  "&"
    add $I11, rx640_pos, 1
    gt $I11, rx640_eos, rx640_fail
    sub $I11, rx640_pos, rx640_off
    substr $S10, rx640_tgt, $I11, 1
    ne $S10, "&", rx640_fail
    add rx640_pos, 1
    (rx640_rep) = rx640_cur."!mark_commit"($I648)
  rxquantr647_done:
    set_addr $I10, rxcap_649_fail
    ($I12, $I11) = rx640_cur."!mark_peek"($I10)
    rx640_cur."!cursor_pos"($I11)
    ($P10) = rx640_cur."!cursor_start"()
    $P10."!cursor_pass"(rx640_pos, "")
    rx640_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_649_done
  rxcap_649_fail:
    goto rx640_fail
  rxcap_649_done:
  # rx subrule "deflongname" subtype=capture negate=
    rx640_cur."!cursor_pos"(rx640_pos)
    $P10 = rx640_cur."deflongname"()
    unless $P10, rx640_fail
    rx640_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx640_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx640_cur."!cursor_pos"(rx640_pos)
    $P10 = rx640_cur."ws"()
    unless $P10, rx640_fail
    rx640_pos = $P10."pos"()
    (rx640_rep) = rx640_cur."!mark_commit"($I651)
  rxquantr645_done:
  # rx subrule "ws" subtype=method negate=
    rx640_cur."!cursor_pos"(rx640_pos)
    $P10 = rx640_cur."ws"()
    unless $P10, rx640_fail
    rx640_pos = $P10."pos"()
.annotate 'line', 297
  # rx subrule "newpad" subtype=method negate=
    rx640_cur."!cursor_pos"(rx640_pos)
    $P10 = rx640_cur."newpad"()
    unless $P10, rx640_fail
    rx640_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx640_cur."!cursor_pos"(rx640_pos)
    $P10 = rx640_cur."ws"()
    unless $P10, rx640_fail
    rx640_pos = $P10."pos"()
  alt654_0:
.annotate 'line', 298
    set_addr $I10, alt654_1
    rx640_cur."!mark_push"(0, rx640_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx640_cur."!cursor_pos"(rx640_pos)
    $P10 = rx640_cur."ws"()
    unless $P10, rx640_fail
    rx640_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx640_pos, 1
    gt $I11, rx640_eos, rx640_fail
    sub $I11, rx640_pos, rx640_off
    substr $S10, rx640_tgt, $I11, 1
    ne $S10, "(", rx640_fail
    add rx640_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx640_cur."!cursor_pos"(rx640_pos)
    $P10 = rx640_cur."ws"()
    unless $P10, rx640_fail
    rx640_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx640_cur."!cursor_pos"(rx640_pos)
    $P10 = rx640_cur."signature"()
    unless $P10, rx640_fail
    rx640_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx640_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx640_cur."!cursor_pos"(rx640_pos)
    $P10 = rx640_cur."ws"()
    unless $P10, rx640_fail
    rx640_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx640_pos, 1
    gt $I11, rx640_eos, rx640_fail
    sub $I11, rx640_pos, rx640_off
    substr $S10, rx640_tgt, $I11, 1
    ne $S10, ")", rx640_fail
    add rx640_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx640_cur."!cursor_pos"(rx640_pos)
    $P10 = rx640_cur."ws"()
    unless $P10, rx640_fail
    rx640_pos = $P10."pos"()
    goto alt654_end
  alt654_1:
.annotate 'line', 299
  # rx subrule "ws" subtype=method negate=
    rx640_cur."!cursor_pos"(rx640_pos)
    $P10 = rx640_cur."ws"()
    unless $P10, rx640_fail
    rx640_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx640_cur."!cursor_pos"(rx640_pos)
    $P10 = rx640_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx640_fail
    rx640_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx640_cur."!cursor_pos"(rx640_pos)
    $P10 = rx640_cur."ws"()
    unless $P10, rx640_fail
    rx640_pos = $P10."pos"()
  alt654_end:
  # rx subrule "ws" subtype=method negate=
    rx640_cur."!cursor_pos"(rx640_pos)
    $P10 = rx640_cur."ws"()
    unless $P10, rx640_fail
    rx640_pos = $P10."pos"()
.annotate 'line', 300
  # rx subrule "blockoid" subtype=capture negate=
    rx640_cur."!cursor_pos"(rx640_pos)
    $P10 = rx640_cur."blockoid"()
    unless $P10, rx640_fail
    rx640_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx640_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx640_cur."!cursor_pos"(rx640_pos)
    $P10 = rx640_cur."ws"()
    unless $P10, rx640_fail
    rx640_pos = $P10."pos"()
.annotate 'line', 295
  # rx pass
    rx640_cur."!cursor_pass"(rx640_pos, "routine_def")
    rx640_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx640_pos)
    .return (rx640_cur)
  rx640_fail:
.annotate 'line', 4
    (rx640_rep, rx640_pos, $I10, $P10) = rx640_cur."!mark_fail"(0)
    lt rx640_pos, -1, rx640_done
    eq rx640_pos, -1, rx640_fail
    jump $I10
  rx640_done:
    rx640_cur."!cursor_fail"()
    rx640_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx640_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("159_1275600007.84296") :method
.annotate 'line', 4
    new $P642, "ResizablePMCArray"
    push $P642, ""
    .return ($P642)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("160_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx664_tgt
    .local int rx664_pos
    .local int rx664_off
    .local int rx664_eos
    .local int rx664_rep
    .local pmc rx664_cur
    (rx664_cur, rx664_pos, rx664_tgt) = self."!cursor_start"()
    rx664_cur."!cursor_debug"("START ", "method_def")
    rx664_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx664_cur
    .local pmc match
    .lex "$/", match
    length rx664_eos, rx664_tgt
    gt rx664_pos, rx664_eos, rx664_done
    set rx664_off, 0
    lt rx664_pos, 2, rx664_start
    sub rx664_off, rx664_pos, 1
    substr rx664_tgt, rx664_tgt, rx664_off
  rx664_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan667_done
    goto rxscan667_scan
  rxscan667_loop:
    ($P10) = rx664_cur."from"()
    inc $P10
    set rx664_pos, $P10
    ge rx664_pos, rx664_eos, rxscan667_done
  rxscan667_scan:
    set_addr $I10, rxscan667_loop
    rx664_cur."!mark_push"(0, rx664_pos, $I10)
  rxscan667_done:
.annotate 'line', 303
  # rx subrule "ws" subtype=method negate=
    rx664_cur."!cursor_pos"(rx664_pos)
    $P10 = rx664_cur."ws"()
    unless $P10, rx664_fail
    rx664_pos = $P10."pos"()
.annotate 'line', 304
  # rx rxquantr669 ** 0..1
    set_addr $I670, rxquantr669_done
    rx664_cur."!mark_push"(0, rx664_pos, $I670)
  rxquantr669_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx664_cur."!cursor_pos"(rx664_pos)
    $P10 = rx664_cur."deflongname"()
    unless $P10, rx664_fail
    rx664_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx664_pos = $P10."pos"()
    (rx664_rep) = rx664_cur."!mark_commit"($I670)
  rxquantr669_done:
  # rx subrule "ws" subtype=method negate=
    rx664_cur."!cursor_pos"(rx664_pos)
    $P10 = rx664_cur."ws"()
    unless $P10, rx664_fail
    rx664_pos = $P10."pos"()
.annotate 'line', 305
  # rx subrule "newpad" subtype=method negate=
    rx664_cur."!cursor_pos"(rx664_pos)
    $P10 = rx664_cur."newpad"()
    unless $P10, rx664_fail
    rx664_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx664_cur."!cursor_pos"(rx664_pos)
    $P10 = rx664_cur."ws"()
    unless $P10, rx664_fail
    rx664_pos = $P10."pos"()
  alt673_0:
.annotate 'line', 306
    set_addr $I10, alt673_1
    rx664_cur."!mark_push"(0, rx664_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx664_cur."!cursor_pos"(rx664_pos)
    $P10 = rx664_cur."ws"()
    unless $P10, rx664_fail
    rx664_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx664_pos, 1
    gt $I11, rx664_eos, rx664_fail
    sub $I11, rx664_pos, rx664_off
    substr $S10, rx664_tgt, $I11, 1
    ne $S10, "(", rx664_fail
    add rx664_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx664_cur."!cursor_pos"(rx664_pos)
    $P10 = rx664_cur."ws"()
    unless $P10, rx664_fail
    rx664_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx664_cur."!cursor_pos"(rx664_pos)
    $P10 = rx664_cur."signature"()
    unless $P10, rx664_fail
    rx664_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx664_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx664_cur."!cursor_pos"(rx664_pos)
    $P10 = rx664_cur."ws"()
    unless $P10, rx664_fail
    rx664_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx664_pos, 1
    gt $I11, rx664_eos, rx664_fail
    sub $I11, rx664_pos, rx664_off
    substr $S10, rx664_tgt, $I11, 1
    ne $S10, ")", rx664_fail
    add rx664_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx664_cur."!cursor_pos"(rx664_pos)
    $P10 = rx664_cur."ws"()
    unless $P10, rx664_fail
    rx664_pos = $P10."pos"()
    goto alt673_end
  alt673_1:
.annotate 'line', 307
  # rx subrule "ws" subtype=method negate=
    rx664_cur."!cursor_pos"(rx664_pos)
    $P10 = rx664_cur."ws"()
    unless $P10, rx664_fail
    rx664_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx664_cur."!cursor_pos"(rx664_pos)
    $P10 = rx664_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx664_fail
    rx664_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx664_cur."!cursor_pos"(rx664_pos)
    $P10 = rx664_cur."ws"()
    unless $P10, rx664_fail
    rx664_pos = $P10."pos"()
  alt673_end:
  # rx subrule "ws" subtype=method negate=
    rx664_cur."!cursor_pos"(rx664_pos)
    $P10 = rx664_cur."ws"()
    unless $P10, rx664_fail
    rx664_pos = $P10."pos"()
.annotate 'line', 308
  # rx subrule "blockoid" subtype=capture negate=
    rx664_cur."!cursor_pos"(rx664_pos)
    $P10 = rx664_cur."blockoid"()
    unless $P10, rx664_fail
    rx664_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx664_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx664_cur."!cursor_pos"(rx664_pos)
    $P10 = rx664_cur."ws"()
    unless $P10, rx664_fail
    rx664_pos = $P10."pos"()
.annotate 'line', 303
  # rx pass
    rx664_cur."!cursor_pass"(rx664_pos, "method_def")
    rx664_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx664_pos)
    .return (rx664_cur)
  rx664_fail:
.annotate 'line', 4
    (rx664_rep, rx664_pos, $I10, $P10) = rx664_cur."!mark_fail"(0)
    lt rx664_pos, -1, rx664_done
    eq rx664_pos, -1, rx664_fail
    jump $I10
  rx664_done:
    rx664_cur."!cursor_fail"()
    rx664_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx664_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("161_1275600007.84296") :method
.annotate 'line', 4
    new $P666, "ResizablePMCArray"
    push $P666, ""
    .return ($P666)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator"  :subid("162_1275600007.84296") :method
.annotate 'line', 311
    $P683 = self."!protoregex"("multi_declarator")
    .return ($P683)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator"  :subid("163_1275600007.84296") :method
.annotate 'line', 311
    $P685 = self."!PREFIX__!protoregex"("multi_declarator")
    .return ($P685)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator:sym<multi>"  :subid("164_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 313
    new $P687, "Undef"
    .lex "$*MULTINESS", $P687
.annotate 'line', 4
    .local string rx688_tgt
    .local int rx688_pos
    .local int rx688_off
    .local int rx688_eos
    .local int rx688_rep
    .local pmc rx688_cur
    (rx688_cur, rx688_pos, rx688_tgt) = self."!cursor_start"()
    rx688_cur."!cursor_debug"("START ", "multi_declarator:sym<multi>")
    .lex unicode:"$\x{a2}", rx688_cur
    .local pmc match
    .lex "$/", match
    length rx688_eos, rx688_tgt
    gt rx688_pos, rx688_eos, rx688_done
    set rx688_off, 0
    lt rx688_pos, 2, rx688_start
    sub rx688_off, rx688_pos, 1
    substr rx688_tgt, rx688_tgt, rx688_off
  rx688_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan691_done
    goto rxscan691_scan
  rxscan691_loop:
    ($P10) = rx688_cur."from"()
    inc $P10
    set rx688_pos, $P10
    ge rx688_pos, rx688_eos, rxscan691_done
  rxscan691_scan:
    set_addr $I10, rxscan691_loop
    rx688_cur."!mark_push"(0, rx688_pos, $I10)
  rxscan691_done:
.annotate 'line', 313
  # rx subcapture "sym"
    set_addr $I10, rxcap_692_fail
    rx688_cur."!mark_push"(0, rx688_pos, $I10)
  # rx literal  "multi"
    add $I11, rx688_pos, 5
    gt $I11, rx688_eos, rx688_fail
    sub $I11, rx688_pos, rx688_off
    substr $S10, rx688_tgt, $I11, 5
    ne $S10, "multi", rx688_fail
    add rx688_pos, 5
    set_addr $I10, rxcap_692_fail
    ($I12, $I11) = rx688_cur."!mark_peek"($I10)
    rx688_cur."!cursor_pos"($I11)
    ($P10) = rx688_cur."!cursor_start"()
    $P10."!cursor_pass"(rx688_pos, "")
    rx688_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_692_done
  rxcap_692_fail:
    goto rx688_fail
  rxcap_692_done:
    rx688_cur."!cursor_pos"(rx688_pos)
    new $P693, "String"
    assign $P693, "multi"
    store_lex "$*MULTINESS", $P693
.annotate 'line', 314
  # rx subrule "ws" subtype=method negate=
    rx688_cur."!cursor_pos"(rx688_pos)
    $P10 = rx688_cur."ws"()
    unless $P10, rx688_fail
    rx688_pos = $P10."pos"()
  alt694_0:
    set_addr $I10, alt694_1
    rx688_cur."!mark_push"(0, rx688_pos, $I10)
  # rx subrule "declarator" subtype=capture negate=
    rx688_cur."!cursor_pos"(rx688_pos)
    $P10 = rx688_cur."declarator"()
    unless $P10, rx688_fail
    rx688_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx688_pos = $P10."pos"()
    goto alt694_end
  alt694_1:
    set_addr $I10, alt694_2
    rx688_cur."!mark_push"(0, rx688_pos, $I10)
  # rx subrule "routine_def" subtype=capture negate=
    rx688_cur."!cursor_pos"(rx688_pos)
    $P10 = rx688_cur."routine_def"()
    unless $P10, rx688_fail
    rx688_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx688_pos = $P10."pos"()
    goto alt694_end
  alt694_2:
  # rx subrule "panic" subtype=method negate=
    rx688_cur."!cursor_pos"(rx688_pos)
    $P10 = rx688_cur."panic"("Malformed multi")
    unless $P10, rx688_fail
    rx688_pos = $P10."pos"()
  alt694_end:
.annotate 'line', 312
  # rx pass
    rx688_cur."!cursor_pass"(rx688_pos, "multi_declarator:sym<multi>")
    rx688_cur."!cursor_debug"("PASS  ", "multi_declarator:sym<multi>", " at pos=", rx688_pos)
    .return (rx688_cur)
  rx688_fail:
.annotate 'line', 4
    (rx688_rep, rx688_pos, $I10, $P10) = rx688_cur."!mark_fail"(0)
    lt rx688_pos, -1, rx688_done
    eq rx688_pos, -1, rx688_fail
    jump $I10
  rx688_done:
    rx688_cur."!cursor_fail"()
    rx688_cur."!cursor_debug"("FAIL  ", "multi_declarator:sym<multi>")
    .return (rx688_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator:sym<multi>"  :subid("165_1275600007.84296") :method
.annotate 'line', 4
    new $P690, "ResizablePMCArray"
    push $P690, "multi"
    .return ($P690)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator:sym<null>"  :subid("166_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 317
    new $P696, "Undef"
    .lex "$*MULTINESS", $P696
.annotate 'line', 4
    .local string rx697_tgt
    .local int rx697_pos
    .local int rx697_off
    .local int rx697_eos
    .local int rx697_rep
    .local pmc rx697_cur
    (rx697_cur, rx697_pos, rx697_tgt) = self."!cursor_start"()
    rx697_cur."!cursor_debug"("START ", "multi_declarator:sym<null>")
    .lex unicode:"$\x{a2}", rx697_cur
    .local pmc match
    .lex "$/", match
    length rx697_eos, rx697_tgt
    gt rx697_pos, rx697_eos, rx697_done
    set rx697_off, 0
    lt rx697_pos, 2, rx697_start
    sub rx697_off, rx697_pos, 1
    substr rx697_tgt, rx697_tgt, rx697_off
  rx697_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan700_done
    goto rxscan700_scan
  rxscan700_loop:
    ($P10) = rx697_cur."from"()
    inc $P10
    set rx697_pos, $P10
    ge rx697_pos, rx697_eos, rxscan700_done
  rxscan700_scan:
    set_addr $I10, rxscan700_loop
    rx697_cur."!mark_push"(0, rx697_pos, $I10)
  rxscan700_done:
.annotate 'line', 316
    rx697_cur."!cursor_pos"(rx697_pos)
.annotate 'line', 317
    new $P701, "String"
    assign $P701, ""
    store_lex "$*MULTINESS", $P701
.annotate 'line', 318
  # rx subrule "declarator" subtype=capture negate=
    rx697_cur."!cursor_pos"(rx697_pos)
    $P10 = rx697_cur."declarator"()
    unless $P10, rx697_fail
    rx697_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx697_pos = $P10."pos"()
.annotate 'line', 316
  # rx pass
    rx697_cur."!cursor_pass"(rx697_pos, "multi_declarator:sym<null>")
    rx697_cur."!cursor_debug"("PASS  ", "multi_declarator:sym<null>", " at pos=", rx697_pos)
    .return (rx697_cur)
  rx697_fail:
.annotate 'line', 4
    (rx697_rep, rx697_pos, $I10, $P10) = rx697_cur."!mark_fail"(0)
    lt rx697_pos, -1, rx697_done
    eq rx697_pos, -1, rx697_fail
    jump $I10
  rx697_done:
    rx697_cur."!cursor_fail"()
    rx697_cur."!cursor_debug"("FAIL  ", "multi_declarator:sym<null>")
    .return (rx697_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator:sym<null>"  :subid("167_1275600007.84296") :method
.annotate 'line', 4
    new $P699, "ResizablePMCArray"
    push $P699, ""
    .return ($P699)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("168_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx703_tgt
    .local int rx703_pos
    .local int rx703_off
    .local int rx703_eos
    .local int rx703_rep
    .local pmc rx703_cur
    (rx703_cur, rx703_pos, rx703_tgt) = self."!cursor_start"()
    rx703_cur."!cursor_debug"("START ", "signature")
    rx703_cur."!cursor_caparray"("parameter")
    .lex unicode:"$\x{a2}", rx703_cur
    .local pmc match
    .lex "$/", match
    length rx703_eos, rx703_tgt
    gt rx703_pos, rx703_eos, rx703_done
    set rx703_off, 0
    lt rx703_pos, 2, rx703_start
    sub rx703_off, rx703_pos, 1
    substr rx703_tgt, rx703_tgt, rx703_off
  rx703_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan706_done
    goto rxscan706_scan
  rxscan706_loop:
    ($P10) = rx703_cur."from"()
    inc $P10
    set rx703_pos, $P10
    ge rx703_pos, rx703_eos, rxscan706_done
  rxscan706_scan:
    set_addr $I10, rxscan706_loop
    rx703_cur."!mark_push"(0, rx703_pos, $I10)
  rxscan706_done:
.annotate 'line', 321
  # rx rxquantr707 ** 0..1
    set_addr $I710, rxquantr707_done
    rx703_cur."!mark_push"(0, rx703_pos, $I710)
  rxquantr707_loop:
  # rx rxquantr708 ** 1..*
    set_addr $I709, rxquantr708_done
    rx703_cur."!mark_push"(0, -1, $I709)
  rxquantr708_loop:
  # rx subrule "ws" subtype=method negate=
    rx703_cur."!cursor_pos"(rx703_pos)
    $P10 = rx703_cur."ws"()
    unless $P10, rx703_fail
    rx703_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx703_cur."!cursor_pos"(rx703_pos)
    $P10 = rx703_cur."parameter"()
    unless $P10, rx703_fail
    rx703_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx703_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx703_cur."!cursor_pos"(rx703_pos)
    $P10 = rx703_cur."ws"()
    unless $P10, rx703_fail
    rx703_pos = $P10."pos"()
    (rx703_rep) = rx703_cur."!mark_commit"($I709)
    rx703_cur."!mark_push"(rx703_rep, rx703_pos, $I709)
  # rx literal  ","
    add $I11, rx703_pos, 1
    gt $I11, rx703_eos, rx703_fail
    sub $I11, rx703_pos, rx703_off
    substr $S10, rx703_tgt, $I11, 1
    ne $S10, ",", rx703_fail
    add rx703_pos, 1
    goto rxquantr708_loop
  rxquantr708_done:
    (rx703_rep) = rx703_cur."!mark_commit"($I710)
  rxquantr707_done:
  # rx pass
    rx703_cur."!cursor_pass"(rx703_pos, "signature")
    rx703_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx703_pos)
    .return (rx703_cur)
  rx703_fail:
.annotate 'line', 4
    (rx703_rep, rx703_pos, $I10, $P10) = rx703_cur."!mark_fail"(0)
    lt rx703_pos, -1, rx703_done
    eq rx703_pos, -1, rx703_fail
    jump $I10
  rx703_done:
    rx703_cur."!cursor_fail"()
    rx703_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx703_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("169_1275600007.84296") :method
.annotate 'line', 4
    new $P705, "ResizablePMCArray"
    push $P705, ""
    .return ($P705)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("170_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx712_tgt
    .local int rx712_pos
    .local int rx712_off
    .local int rx712_eos
    .local int rx712_rep
    .local pmc rx712_cur
    (rx712_cur, rx712_pos, rx712_tgt) = self."!cursor_start"()
    rx712_cur."!cursor_debug"("START ", "parameter")
    rx712_cur."!cursor_caparray"("default_value", "typename")
    .lex unicode:"$\x{a2}", rx712_cur
    .local pmc match
    .lex "$/", match
    length rx712_eos, rx712_tgt
    gt rx712_pos, rx712_eos, rx712_done
    set rx712_off, 0
    lt rx712_pos, 2, rx712_start
    sub rx712_off, rx712_pos, 1
    substr rx712_tgt, rx712_tgt, rx712_off
  rx712_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan715_done
    goto rxscan715_scan
  rxscan715_loop:
    ($P10) = rx712_cur."from"()
    inc $P10
    set rx712_pos, $P10
    ge rx712_pos, rx712_eos, rxscan715_done
  rxscan715_scan:
    set_addr $I10, rxscan715_loop
    rx712_cur."!mark_push"(0, rx712_pos, $I10)
  rxscan715_done:
.annotate 'line', 324
  # rx rxquantr716 ** 0..*
    set_addr $I717, rxquantr716_done
    rx712_cur."!mark_push"(0, rx712_pos, $I717)
  rxquantr716_loop:
  # rx subrule "typename" subtype=capture negate=
    rx712_cur."!cursor_pos"(rx712_pos)
    $P10 = rx712_cur."typename"()
    unless $P10, rx712_fail
    rx712_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("typename")
    rx712_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx712_cur."!cursor_pos"(rx712_pos)
    $P10 = rx712_cur."ws"()
    unless $P10, rx712_fail
    rx712_pos = $P10."pos"()
    (rx712_rep) = rx712_cur."!mark_commit"($I717)
    rx712_cur."!mark_push"(rx712_rep, rx712_pos, $I717)
    goto rxquantr716_loop
  rxquantr716_done:
  alt718_0:
.annotate 'line', 325
    set_addr $I10, alt718_1
    rx712_cur."!mark_push"(0, rx712_pos, $I10)
.annotate 'line', 326
  # rx subcapture "quant"
    set_addr $I10, rxcap_719_fail
    rx712_cur."!mark_push"(0, rx712_pos, $I10)
  # rx literal  "*"
    add $I11, rx712_pos, 1
    gt $I11, rx712_eos, rx712_fail
    sub $I11, rx712_pos, rx712_off
    substr $S10, rx712_tgt, $I11, 1
    ne $S10, "*", rx712_fail
    add rx712_pos, 1
    set_addr $I10, rxcap_719_fail
    ($I12, $I11) = rx712_cur."!mark_peek"($I10)
    rx712_cur."!cursor_pos"($I11)
    ($P10) = rx712_cur."!cursor_start"()
    $P10."!cursor_pass"(rx712_pos, "")
    rx712_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_719_done
  rxcap_719_fail:
    goto rx712_fail
  rxcap_719_done:
  # rx subrule "param_var" subtype=capture negate=
    rx712_cur."!cursor_pos"(rx712_pos)
    $P10 = rx712_cur."param_var"()
    unless $P10, rx712_fail
    rx712_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx712_pos = $P10."pos"()
    goto alt718_end
  alt718_1:
  alt720_0:
.annotate 'line', 327
    set_addr $I10, alt720_1
    rx712_cur."!mark_push"(0, rx712_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx712_cur."!cursor_pos"(rx712_pos)
    $P10 = rx712_cur."param_var"()
    unless $P10, rx712_fail
    rx712_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx712_pos = $P10."pos"()
    goto alt720_end
  alt720_1:
  # rx subrule "named_param" subtype=capture negate=
    rx712_cur."!cursor_pos"(rx712_pos)
    $P10 = rx712_cur."named_param"()
    unless $P10, rx712_fail
    rx712_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx712_pos = $P10."pos"()
  alt720_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_722_fail
    rx712_cur."!mark_push"(0, rx712_pos, $I10)
  alt721_0:
    set_addr $I10, alt721_1
    rx712_cur."!mark_push"(0, rx712_pos, $I10)
  # rx literal  "?"
    add $I11, rx712_pos, 1
    gt $I11, rx712_eos, rx712_fail
    sub $I11, rx712_pos, rx712_off
    substr $S10, rx712_tgt, $I11, 1
    ne $S10, "?", rx712_fail
    add rx712_pos, 1
    goto alt721_end
  alt721_1:
    set_addr $I10, alt721_2
    rx712_cur."!mark_push"(0, rx712_pos, $I10)
  # rx literal  "!"
    add $I11, rx712_pos, 1
    gt $I11, rx712_eos, rx712_fail
    sub $I11, rx712_pos, rx712_off
    substr $S10, rx712_tgt, $I11, 1
    ne $S10, "!", rx712_fail
    add rx712_pos, 1
    goto alt721_end
  alt721_2:
  alt721_end:
    set_addr $I10, rxcap_722_fail
    ($I12, $I11) = rx712_cur."!mark_peek"($I10)
    rx712_cur."!cursor_pos"($I11)
    ($P10) = rx712_cur."!cursor_start"()
    $P10."!cursor_pass"(rx712_pos, "")
    rx712_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_722_done
  rxcap_722_fail:
    goto rx712_fail
  rxcap_722_done:
  alt718_end:
.annotate 'line', 329
  # rx rxquantr723 ** 0..1
    set_addr $I724, rxquantr723_done
    rx712_cur."!mark_push"(0, rx712_pos, $I724)
  rxquantr723_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx712_cur."!cursor_pos"(rx712_pos)
    $P10 = rx712_cur."default_value"()
    unless $P10, rx712_fail
    rx712_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("default_value")
    rx712_pos = $P10."pos"()
    (rx712_rep) = rx712_cur."!mark_commit"($I724)
  rxquantr723_done:
.annotate 'line', 323
  # rx pass
    rx712_cur."!cursor_pass"(rx712_pos, "parameter")
    rx712_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx712_pos)
    .return (rx712_cur)
  rx712_fail:
.annotate 'line', 4
    (rx712_rep, rx712_pos, $I10, $P10) = rx712_cur."!mark_fail"(0)
    lt rx712_pos, -1, rx712_done
    eq rx712_pos, -1, rx712_fail
    jump $I10
  rx712_done:
    rx712_cur."!cursor_fail"()
    rx712_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx712_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("171_1275600007.84296") :method
.annotate 'line', 4
    new $P714, "ResizablePMCArray"
    push $P714, ""
    .return ($P714)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("172_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx726_tgt
    .local int rx726_pos
    .local int rx726_off
    .local int rx726_eos
    .local int rx726_rep
    .local pmc rx726_cur
    (rx726_cur, rx726_pos, rx726_tgt) = self."!cursor_start"()
    rx726_cur."!cursor_debug"("START ", "param_var")
    rx726_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx726_cur
    .local pmc match
    .lex "$/", match
    length rx726_eos, rx726_tgt
    gt rx726_pos, rx726_eos, rx726_done
    set rx726_off, 0
    lt rx726_pos, 2, rx726_start
    sub rx726_off, rx726_pos, 1
    substr rx726_tgt, rx726_tgt, rx726_off
  rx726_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan730_done
    goto rxscan730_scan
  rxscan730_loop:
    ($P10) = rx726_cur."from"()
    inc $P10
    set rx726_pos, $P10
    ge rx726_pos, rx726_eos, rxscan730_done
  rxscan730_scan:
    set_addr $I10, rxscan730_loop
    rx726_cur."!mark_push"(0, rx726_pos, $I10)
  rxscan730_done:
.annotate 'line', 333
  # rx subrule "sigil" subtype=capture negate=
    rx726_cur."!cursor_pos"(rx726_pos)
    $P10 = rx726_cur."sigil"()
    unless $P10, rx726_fail
    rx726_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx726_pos = $P10."pos"()
  # rx rxquantr731 ** 0..1
    set_addr $I732, rxquantr731_done
    rx726_cur."!mark_push"(0, rx726_pos, $I732)
  rxquantr731_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx726_cur."!cursor_pos"(rx726_pos)
    $P10 = rx726_cur."twigil"()
    unless $P10, rx726_fail
    rx726_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx726_pos = $P10."pos"()
    (rx726_rep) = rx726_cur."!mark_commit"($I732)
  rxquantr731_done:
  alt733_0:
.annotate 'line', 334
    set_addr $I10, alt733_1
    rx726_cur."!mark_push"(0, rx726_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx726_cur."!cursor_pos"(rx726_pos)
    $P10 = rx726_cur."ident"()
    unless $P10, rx726_fail
    rx726_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx726_pos = $P10."pos"()
    goto alt733_end
  alt733_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_734_fail
    rx726_cur."!mark_push"(0, rx726_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx726_pos, rx726_eos, rx726_fail
    sub $I10, rx726_pos, rx726_off
    substr $S10, rx726_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx726_fail
    inc rx726_pos
    set_addr $I10, rxcap_734_fail
    ($I12, $I11) = rx726_cur."!mark_peek"($I10)
    rx726_cur."!cursor_pos"($I11)
    ($P10) = rx726_cur."!cursor_start"()
    $P10."!cursor_pass"(rx726_pos, "")
    rx726_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_734_done
  rxcap_734_fail:
    goto rx726_fail
  rxcap_734_done:
  alt733_end:
.annotate 'line', 332
  # rx pass
    rx726_cur."!cursor_pass"(rx726_pos, "param_var")
    rx726_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx726_pos)
    .return (rx726_cur)
  rx726_fail:
.annotate 'line', 4
    (rx726_rep, rx726_pos, $I10, $P10) = rx726_cur."!mark_fail"(0)
    lt rx726_pos, -1, rx726_done
    eq rx726_pos, -1, rx726_fail
    jump $I10
  rx726_done:
    rx726_cur."!cursor_fail"()
    rx726_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx726_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("173_1275600007.84296") :method
.annotate 'line', 4
    $P728 = self."!PREFIX__!subrule"("sigil", "")
    new $P729, "ResizablePMCArray"
    push $P729, $P728
    .return ($P729)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("174_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx736_tgt
    .local int rx736_pos
    .local int rx736_off
    .local int rx736_eos
    .local int rx736_rep
    .local pmc rx736_cur
    (rx736_cur, rx736_pos, rx736_tgt) = self."!cursor_start"()
    rx736_cur."!cursor_debug"("START ", "named_param")
    .lex unicode:"$\x{a2}", rx736_cur
    .local pmc match
    .lex "$/", match
    length rx736_eos, rx736_tgt
    gt rx736_pos, rx736_eos, rx736_done
    set rx736_off, 0
    lt rx736_pos, 2, rx736_start
    sub rx736_off, rx736_pos, 1
    substr rx736_tgt, rx736_tgt, rx736_off
  rx736_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan740_done
    goto rxscan740_scan
  rxscan740_loop:
    ($P10) = rx736_cur."from"()
    inc $P10
    set rx736_pos, $P10
    ge rx736_pos, rx736_eos, rxscan740_done
  rxscan740_scan:
    set_addr $I10, rxscan740_loop
    rx736_cur."!mark_push"(0, rx736_pos, $I10)
  rxscan740_done:
.annotate 'line', 338
  # rx literal  ":"
    add $I11, rx736_pos, 1
    gt $I11, rx736_eos, rx736_fail
    sub $I11, rx736_pos, rx736_off
    substr $S10, rx736_tgt, $I11, 1
    ne $S10, ":", rx736_fail
    add rx736_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx736_cur."!cursor_pos"(rx736_pos)
    $P10 = rx736_cur."param_var"()
    unless $P10, rx736_fail
    rx736_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx736_pos = $P10."pos"()
.annotate 'line', 337
  # rx pass
    rx736_cur."!cursor_pass"(rx736_pos, "named_param")
    rx736_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx736_pos)
    .return (rx736_cur)
  rx736_fail:
.annotate 'line', 4
    (rx736_rep, rx736_pos, $I10, $P10) = rx736_cur."!mark_fail"(0)
    lt rx736_pos, -1, rx736_done
    eq rx736_pos, -1, rx736_fail
    jump $I10
  rx736_done:
    rx736_cur."!cursor_fail"()
    rx736_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx736_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("175_1275600007.84296") :method
.annotate 'line', 4
    $P738 = self."!PREFIX__!subrule"("param_var", ":")
    new $P739, "ResizablePMCArray"
    push $P739, $P738
    .return ($P739)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("176_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx742_tgt
    .local int rx742_pos
    .local int rx742_off
    .local int rx742_eos
    .local int rx742_rep
    .local pmc rx742_cur
    (rx742_cur, rx742_pos, rx742_tgt) = self."!cursor_start"()
    rx742_cur."!cursor_debug"("START ", "default_value")
    .lex unicode:"$\x{a2}", rx742_cur
    .local pmc match
    .lex "$/", match
    length rx742_eos, rx742_tgt
    gt rx742_pos, rx742_eos, rx742_done
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
.annotate 'line', 341
  # rx subrule "ws" subtype=method negate=
    rx742_cur."!cursor_pos"(rx742_pos)
    $P10 = rx742_cur."ws"()
    unless $P10, rx742_fail
    rx742_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx742_pos, 1
    gt $I11, rx742_eos, rx742_fail
    sub $I11, rx742_pos, rx742_off
    substr $S10, rx742_tgt, $I11, 1
    ne $S10, "=", rx742_fail
    add rx742_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx742_cur."!cursor_pos"(rx742_pos)
    $P10 = rx742_cur."ws"()
    unless $P10, rx742_fail
    rx742_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx742_cur."!cursor_pos"(rx742_pos)
    $P10 = rx742_cur."EXPR"("i=")
    unless $P10, rx742_fail
    rx742_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx742_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx742_cur."!cursor_pos"(rx742_pos)
    $P10 = rx742_cur."ws"()
    unless $P10, rx742_fail
    rx742_pos = $P10."pos"()
  # rx pass
    rx742_cur."!cursor_pass"(rx742_pos, "default_value")
    rx742_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx742_pos)
    .return (rx742_cur)
  rx742_fail:
.annotate 'line', 4
    (rx742_rep, rx742_pos, $I10, $P10) = rx742_cur."!mark_fail"(0)
    lt rx742_pos, -1, rx742_done
    eq rx742_pos, -1, rx742_fail
    jump $I10
  rx742_done:
    rx742_cur."!cursor_fail"()
    rx742_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx742_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("177_1275600007.84296") :method
.annotate 'line', 4
    new $P744, "ResizablePMCArray"
    push $P744, ""
    .return ($P744)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("178_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx750_tgt
    .local int rx750_pos
    .local int rx750_off
    .local int rx750_eos
    .local int rx750_rep
    .local pmc rx750_cur
    (rx750_cur, rx750_pos, rx750_tgt) = self."!cursor_start"()
    rx750_cur."!cursor_debug"("START ", "regex_declarator")
    rx750_cur."!cursor_caparray"("signature")
    .lex unicode:"$\x{a2}", rx750_cur
    .local pmc match
    .lex "$/", match
    length rx750_eos, rx750_tgt
    gt rx750_pos, rx750_eos, rx750_done
    set rx750_off, 0
    lt rx750_pos, 2, rx750_start
    sub rx750_off, rx750_pos, 1
    substr rx750_tgt, rx750_tgt, rx750_off
  rx750_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan753_done
    goto rxscan753_scan
  rxscan753_loop:
    ($P10) = rx750_cur."from"()
    inc $P10
    set rx750_pos, $P10
    ge rx750_pos, rx750_eos, rxscan753_done
  rxscan753_scan:
    set_addr $I10, rxscan753_loop
    rx750_cur."!mark_push"(0, rx750_pos, $I10)
  rxscan753_done:
.annotate 'line', 343
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
  alt755_0:
.annotate 'line', 344
    set_addr $I10, alt755_1
    rx750_cur."!mark_push"(0, rx750_pos, $I10)
.annotate 'line', 345
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_757_fail
    rx750_cur."!mark_push"(0, rx750_pos, $I10)
  # rx literal  "proto"
    add $I11, rx750_pos, 5
    gt $I11, rx750_eos, rx750_fail
    sub $I11, rx750_pos, rx750_off
    substr $S10, rx750_tgt, $I11, 5
    ne $S10, "proto", rx750_fail
    add rx750_pos, 5
    set_addr $I10, rxcap_757_fail
    ($I12, $I11) = rx750_cur."!mark_peek"($I10)
    rx750_cur."!cursor_pos"($I11)
    ($P10) = rx750_cur."!cursor_start"()
    $P10."!cursor_pass"(rx750_pos, "")
    rx750_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_757_done
  rxcap_757_fail:
    goto rx750_fail
  rxcap_757_done:
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
  alt759_0:
    set_addr $I10, alt759_1
    rx750_cur."!mark_push"(0, rx750_pos, $I10)
  # rx literal  "regex"
    add $I11, rx750_pos, 5
    gt $I11, rx750_eos, rx750_fail
    sub $I11, rx750_pos, rx750_off
    substr $S10, rx750_tgt, $I11, 5
    ne $S10, "regex", rx750_fail
    add rx750_pos, 5
    goto alt759_end
  alt759_1:
    set_addr $I10, alt759_2
    rx750_cur."!mark_push"(0, rx750_pos, $I10)
  # rx literal  "token"
    add $I11, rx750_pos, 5
    gt $I11, rx750_eos, rx750_fail
    sub $I11, rx750_pos, rx750_off
    substr $S10, rx750_tgt, $I11, 5
    ne $S10, "token", rx750_fail
    add rx750_pos, 5
    goto alt759_end
  alt759_2:
  # rx literal  "rule"
    add $I11, rx750_pos, 4
    gt $I11, rx750_eos, rx750_fail
    sub $I11, rx750_pos, rx750_off
    substr $S10, rx750_tgt, $I11, 4
    ne $S10, "rule", rx750_fail
    add rx750_pos, 4
  alt759_end:
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
.annotate 'line', 346
  # rx subrule "deflongname" subtype=capture negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."deflongname"()
    unless $P10, rx750_fail
    rx750_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx750_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
  alt762_0:
.annotate 'line', 347
    set_addr $I10, alt762_1
    rx750_cur."!mark_push"(0, rx750_pos, $I10)
.annotate 'line', 348
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
  # rx literal  "{"
    add $I11, rx750_pos, 1
    gt $I11, rx750_eos, rx750_fail
    sub $I11, rx750_pos, rx750_off
    substr $S10, rx750_tgt, $I11, 1
    ne $S10, "{", rx750_fail
    add rx750_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx750_pos, 5
    gt $I11, rx750_eos, rx750_fail
    sub $I11, rx750_pos, rx750_off
    substr $S10, rx750_tgt, $I11, 5
    ne $S10, "<...>", rx750_fail
    add rx750_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx750_pos, 1
    gt $I11, rx750_eos, rx750_fail
    sub $I11, rx750_pos, rx750_off
    substr $S10, rx750_tgt, $I11, 1
    ne $S10, "}", rx750_fail
    add rx750_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ENDSTMT"()
    unless $P10, rx750_fail
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
    goto alt762_end
  alt762_1:
.annotate 'line', 349
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."panic"("Proto regex body must be <...>")
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
  alt762_end:
.annotate 'line', 350
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
.annotate 'line', 345
    goto alt755_end
  alt755_1:
.annotate 'line', 351
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_772_fail
    rx750_cur."!mark_push"(0, rx750_pos, $I10)
  alt771_0:
    set_addr $I10, alt771_1
    rx750_cur."!mark_push"(0, rx750_pos, $I10)
  # rx literal  "regex"
    add $I11, rx750_pos, 5
    gt $I11, rx750_eos, rx750_fail
    sub $I11, rx750_pos, rx750_off
    substr $S10, rx750_tgt, $I11, 5
    ne $S10, "regex", rx750_fail
    add rx750_pos, 5
    goto alt771_end
  alt771_1:
    set_addr $I10, alt771_2
    rx750_cur."!mark_push"(0, rx750_pos, $I10)
  # rx literal  "token"
    add $I11, rx750_pos, 5
    gt $I11, rx750_eos, rx750_fail
    sub $I11, rx750_pos, rx750_off
    substr $S10, rx750_tgt, $I11, 5
    ne $S10, "token", rx750_fail
    add rx750_pos, 5
    goto alt771_end
  alt771_2:
  # rx literal  "rule"
    add $I11, rx750_pos, 4
    gt $I11, rx750_eos, rx750_fail
    sub $I11, rx750_pos, rx750_off
    substr $S10, rx750_tgt, $I11, 4
    ne $S10, "rule", rx750_fail
    add rx750_pos, 4
  alt771_end:
    set_addr $I10, rxcap_772_fail
    ($I12, $I11) = rx750_cur."!mark_peek"($I10)
    rx750_cur."!cursor_pos"($I11)
    ($P10) = rx750_cur."!cursor_start"()
    $P10."!cursor_pass"(rx750_pos, "")
    rx750_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_772_done
  rxcap_772_fail:
    goto rx750_fail
  rxcap_772_done:
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
.annotate 'line', 352
  # rx subrule "deflongname" subtype=capture negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."deflongname"()
    unless $P10, rx750_fail
    rx750_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx750_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
.annotate 'line', 353
  # rx subrule "newpad" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."newpad"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
.annotate 'line', 354
  # rx rxquantr776 ** 0..1
    set_addr $I781, rxquantr776_done
    rx750_cur."!mark_push"(0, rx750_pos, $I781)
  rxquantr776_loop:
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx750_pos, 1
    gt $I11, rx750_eos, rx750_fail
    sub $I11, rx750_pos, rx750_off
    substr $S10, rx750_tgt, $I11, 1
    ne $S10, "(", rx750_fail
    add rx750_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."signature"()
    unless $P10, rx750_fail
    rx750_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx750_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx750_pos, 1
    gt $I11, rx750_eos, rx750_fail
    sub $I11, rx750_pos, rx750_off
    substr $S10, rx750_tgt, $I11, 1
    ne $S10, ")", rx750_fail
    add rx750_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
    (rx750_rep) = rx750_cur."!mark_commit"($I781)
  rxquantr776_done:
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
.annotate 'line', 355
  # rx reduce name="regex_declarator" key="open"
    rx750_cur."!cursor_pos"(rx750_pos)
    rx750_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
.annotate 'line', 356
  # rx literal  "{"
    add $I11, rx750_pos, 1
    gt $I11, rx750_eos, rx750_fail
    sub $I11, rx750_pos, rx750_off
    substr $S10, rx750_tgt, $I11, 1
    ne $S10, "{", rx750_fail
    add rx750_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."LANG"("Regex", "nibbler")
    unless $P10, rx750_fail
    rx750_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx750_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx750_pos, 1
    gt $I11, rx750_eos, rx750_fail
    sub $I11, rx750_pos, rx750_off
    substr $S10, rx750_tgt, $I11, 1
    ne $S10, "}", rx750_fail
    add rx750_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ENDSTMT"()
    unless $P10, rx750_fail
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
  alt755_end:
.annotate 'line', 357
  # rx subrule "ws" subtype=method negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ws"()
    unless $P10, rx750_fail
    rx750_pos = $P10."pos"()
.annotate 'line', 343
  # rx pass
    rx750_cur."!cursor_pass"(rx750_pos, "regex_declarator")
    rx750_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx750_pos)
    .return (rx750_cur)
  rx750_fail:
.annotate 'line', 4
    (rx750_rep, rx750_pos, $I10, $P10) = rx750_cur."!mark_fail"(0)
    lt rx750_pos, -1, rx750_done
    eq rx750_pos, -1, rx750_fail
    jump $I10
  rx750_done:
    rx750_cur."!cursor_fail"()
    rx750_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx750_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("179_1275600007.84296") :method
.annotate 'line', 4
    new $P752, "ResizablePMCArray"
    push $P752, ""
    .return ($P752)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("180_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx787_tgt
    .local int rx787_pos
    .local int rx787_off
    .local int rx787_eos
    .local int rx787_rep
    .local pmc rx787_cur
    (rx787_cur, rx787_pos, rx787_tgt) = self."!cursor_start"()
    rx787_cur."!cursor_debug"("START ", "dotty")
    rx787_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx787_cur
    .local pmc match
    .lex "$/", match
    length rx787_eos, rx787_tgt
    gt rx787_pos, rx787_eos, rx787_done
    set rx787_off, 0
    lt rx787_pos, 2, rx787_start
    sub rx787_off, rx787_pos, 1
    substr rx787_tgt, rx787_tgt, rx787_off
  rx787_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan791_done
    goto rxscan791_scan
  rxscan791_loop:
    ($P10) = rx787_cur."from"()
    inc $P10
    set rx787_pos, $P10
    ge rx787_pos, rx787_eos, rxscan791_done
  rxscan791_scan:
    set_addr $I10, rxscan791_loop
    rx787_cur."!mark_push"(0, rx787_pos, $I10)
  rxscan791_done:
.annotate 'line', 361
  # rx literal  "."
    add $I11, rx787_pos, 1
    gt $I11, rx787_eos, rx787_fail
    sub $I11, rx787_pos, rx787_off
    substr $S10, rx787_tgt, $I11, 1
    ne $S10, ".", rx787_fail
    add rx787_pos, 1
  alt792_0:
.annotate 'line', 362
    set_addr $I10, alt792_1
    rx787_cur."!mark_push"(0, rx787_pos, $I10)
  # rx subrule "identifier" subtype=capture negate=
    rx787_cur."!cursor_pos"(rx787_pos)
    $P10 = rx787_cur."identifier"()
    unless $P10, rx787_fail
    rx787_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=identifier")
    rx787_pos = $P10."pos"()
    goto alt792_end
  alt792_1:
.annotate 'line', 363
  # rx enumcharlist negate=0 zerowidth
    ge rx787_pos, rx787_eos, rx787_fail
    sub $I10, rx787_pos, rx787_off
    substr $S10, rx787_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx787_fail
  # rx subrule "quote" subtype=capture negate=
    rx787_cur."!cursor_pos"(rx787_pos)
    $P10 = rx787_cur."quote"()
    unless $P10, rx787_fail
    rx787_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx787_pos = $P10."pos"()
  alt793_0:
.annotate 'line', 364
    set_addr $I10, alt793_1
    rx787_cur."!mark_push"(0, rx787_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx787_pos, rx787_eos, rx787_fail
    sub $I10, rx787_pos, rx787_off
    substr $S10, rx787_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx787_fail
    goto alt793_end
  alt793_1:
  # rx subrule "panic" subtype=method negate=
    rx787_cur."!cursor_pos"(rx787_pos)
    $P10 = rx787_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx787_fail
    rx787_pos = $P10."pos"()
  alt793_end:
  alt792_end:
.annotate 'line', 370
  # rx rxquantr794 ** 0..1
    set_addr $I796, rxquantr794_done
    rx787_cur."!mark_push"(0, rx787_pos, $I796)
  rxquantr794_loop:
  alt795_0:
.annotate 'line', 367
    set_addr $I10, alt795_1
    rx787_cur."!mark_push"(0, rx787_pos, $I10)
.annotate 'line', 368
  # rx enumcharlist negate=0 zerowidth
    ge rx787_pos, rx787_eos, rx787_fail
    sub $I10, rx787_pos, rx787_off
    substr $S10, rx787_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx787_fail
  # rx subrule "args" subtype=capture negate=
    rx787_cur."!cursor_pos"(rx787_pos)
    $P10 = rx787_cur."args"()
    unless $P10, rx787_fail
    rx787_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx787_pos = $P10."pos"()
    goto alt795_end
  alt795_1:
.annotate 'line', 369
  # rx literal  ":"
    add $I11, rx787_pos, 1
    gt $I11, rx787_eos, rx787_fail
    sub $I11, rx787_pos, rx787_off
    substr $S10, rx787_tgt, $I11, 1
    ne $S10, ":", rx787_fail
    add rx787_pos, 1
  # rx charclass s
    ge rx787_pos, rx787_eos, rx787_fail
    sub $I10, rx787_pos, rx787_off
    is_cclass $I11, 32, rx787_tgt, $I10
    unless $I11, rx787_fail
    inc rx787_pos
  # rx subrule "arglist" subtype=capture negate=
    rx787_cur."!cursor_pos"(rx787_pos)
    $P10 = rx787_cur."arglist"()
    unless $P10, rx787_fail
    rx787_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx787_pos = $P10."pos"()
  alt795_end:
.annotate 'line', 370
    (rx787_rep) = rx787_cur."!mark_commit"($I796)
  rxquantr794_done:
.annotate 'line', 360
  # rx pass
    rx787_cur."!cursor_pass"(rx787_pos, "dotty")
    rx787_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx787_pos)
    .return (rx787_cur)
  rx787_fail:
.annotate 'line', 4
    (rx787_rep, rx787_pos, $I10, $P10) = rx787_cur."!mark_fail"(0)
    lt rx787_pos, -1, rx787_done
    eq rx787_pos, -1, rx787_fail
    jump $I10
  rx787_done:
    rx787_cur."!cursor_fail"()
    rx787_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx787_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("181_1275600007.84296") :method
.annotate 'line', 4
    $P789 = self."!PREFIX__!subrule"("longname=identifier", ".")
    new $P790, "ResizablePMCArray"
    push $P790, "'"
    push $P790, "\""
    push $P790, $P789
    .return ($P790)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("182_1275600007.84296") :method
.annotate 'line', 374
    $P798 = self."!protoregex"("term")
    .return ($P798)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("183_1275600007.84296") :method
.annotate 'line', 374
    $P800 = self."!PREFIX__!protoregex"("term")
    .return ($P800)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("184_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx802_tgt
    .local int rx802_pos
    .local int rx802_off
    .local int rx802_eos
    .local int rx802_rep
    .local pmc rx802_cur
    (rx802_cur, rx802_pos, rx802_tgt) = self."!cursor_start"()
    rx802_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx802_cur
    .local pmc match
    .lex "$/", match
    length rx802_eos, rx802_tgt
    gt rx802_pos, rx802_eos, rx802_done
    set rx802_off, 0
    lt rx802_pos, 2, rx802_start
    sub rx802_off, rx802_pos, 1
    substr rx802_tgt, rx802_tgt, rx802_off
  rx802_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan805_done
    goto rxscan805_scan
  rxscan805_loop:
    ($P10) = rx802_cur."from"()
    inc $P10
    set rx802_pos, $P10
    ge rx802_pos, rx802_eos, rxscan805_done
  rxscan805_scan:
    set_addr $I10, rxscan805_loop
    rx802_cur."!mark_push"(0, rx802_pos, $I10)
  rxscan805_done:
.annotate 'line', 376
  # rx subcapture "sym"
    set_addr $I10, rxcap_806_fail
    rx802_cur."!mark_push"(0, rx802_pos, $I10)
  # rx literal  "self"
    add $I11, rx802_pos, 4
    gt $I11, rx802_eos, rx802_fail
    sub $I11, rx802_pos, rx802_off
    substr $S10, rx802_tgt, $I11, 4
    ne $S10, "self", rx802_fail
    add rx802_pos, 4
    set_addr $I10, rxcap_806_fail
    ($I12, $I11) = rx802_cur."!mark_peek"($I10)
    rx802_cur."!cursor_pos"($I11)
    ($P10) = rx802_cur."!cursor_start"()
    $P10."!cursor_pass"(rx802_pos, "")
    rx802_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_806_done
  rxcap_806_fail:
    goto rx802_fail
  rxcap_806_done:
  # rxanchor rwb
    le rx802_pos, 0, rx802_fail
    sub $I10, rx802_pos, rx802_off
    is_cclass $I11, 8192, rx802_tgt, $I10
    if $I11, rx802_fail
    dec $I10
    is_cclass $I11, 8192, rx802_tgt, $I10
    unless $I11, rx802_fail
  # rx pass
    rx802_cur."!cursor_pass"(rx802_pos, "term:sym<self>")
    rx802_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx802_pos)
    .return (rx802_cur)
  rx802_fail:
.annotate 'line', 4
    (rx802_rep, rx802_pos, $I10, $P10) = rx802_cur."!mark_fail"(0)
    lt rx802_pos, -1, rx802_done
    eq rx802_pos, -1, rx802_fail
    jump $I10
  rx802_done:
    rx802_cur."!cursor_fail"()
    rx802_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx802_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("185_1275600007.84296") :method
.annotate 'line', 4
    new $P804, "ResizablePMCArray"
    push $P804, "self"
    .return ($P804)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("186_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx808_tgt
    .local int rx808_pos
    .local int rx808_off
    .local int rx808_eos
    .local int rx808_rep
    .local pmc rx808_cur
    (rx808_cur, rx808_pos, rx808_tgt) = self."!cursor_start"()
    rx808_cur."!cursor_debug"("START ", "term:sym<identifier>")
    .lex unicode:"$\x{a2}", rx808_cur
    .local pmc match
    .lex "$/", match
    length rx808_eos, rx808_tgt
    gt rx808_pos, rx808_eos, rx808_done
    set rx808_off, 0
    lt rx808_pos, 2, rx808_start
    sub rx808_off, rx808_pos, 1
    substr rx808_tgt, rx808_tgt, rx808_off
  rx808_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan812_done
    goto rxscan812_scan
  rxscan812_loop:
    ($P10) = rx808_cur."from"()
    inc $P10
    set rx808_pos, $P10
    ge rx808_pos, rx808_eos, rxscan812_done
  rxscan812_scan:
    set_addr $I10, rxscan812_loop
    rx808_cur."!mark_push"(0, rx808_pos, $I10)
  rxscan812_done:
.annotate 'line', 379
  # rx subrule "identifier" subtype=capture negate=
    rx808_cur."!cursor_pos"(rx808_pos)
    $P10 = rx808_cur."identifier"()
    unless $P10, rx808_fail
    rx808_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx808_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx808_pos, rx808_eos, rx808_fail
    sub $I10, rx808_pos, rx808_off
    substr $S10, rx808_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx808_fail
  # rx subrule "args" subtype=capture negate=
    rx808_cur."!cursor_pos"(rx808_pos)
    $P10 = rx808_cur."args"()
    unless $P10, rx808_fail
    rx808_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx808_pos = $P10."pos"()
.annotate 'line', 378
  # rx pass
    rx808_cur."!cursor_pass"(rx808_pos, "term:sym<identifier>")
    rx808_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx808_pos)
    .return (rx808_cur)
  rx808_fail:
.annotate 'line', 4
    (rx808_rep, rx808_pos, $I10, $P10) = rx808_cur."!mark_fail"(0)
    lt rx808_pos, -1, rx808_done
    eq rx808_pos, -1, rx808_fail
    jump $I10
  rx808_done:
    rx808_cur."!cursor_fail"()
    rx808_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx808_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("187_1275600007.84296") :method
.annotate 'line', 4
    $P810 = self."!PREFIX__!subrule"("identifier", "")
    new $P811, "ResizablePMCArray"
    push $P811, $P810
    .return ($P811)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("188_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx814_tgt
    .local int rx814_pos
    .local int rx814_off
    .local int rx814_eos
    .local int rx814_rep
    .local pmc rx814_cur
    (rx814_cur, rx814_pos, rx814_tgt) = self."!cursor_start"()
    rx814_cur."!cursor_debug"("START ", "term:sym<name>")
    rx814_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx814_cur
    .local pmc match
    .lex "$/", match
    length rx814_eos, rx814_tgt
    gt rx814_pos, rx814_eos, rx814_done
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
.annotate 'line', 383
  # rx subrule "name" subtype=capture negate=
    rx814_cur."!cursor_pos"(rx814_pos)
    $P10 = rx814_cur."name"()
    unless $P10, rx814_fail
    rx814_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx814_pos = $P10."pos"()
  # rx rxquantr819 ** 0..1
    set_addr $I820, rxquantr819_done
    rx814_cur."!mark_push"(0, rx814_pos, $I820)
  rxquantr819_loop:
  # rx subrule "args" subtype=capture negate=
    rx814_cur."!cursor_pos"(rx814_pos)
    $P10 = rx814_cur."args"()
    unless $P10, rx814_fail
    rx814_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx814_pos = $P10."pos"()
    (rx814_rep) = rx814_cur."!mark_commit"($I820)
  rxquantr819_done:
.annotate 'line', 382
  # rx pass
    rx814_cur."!cursor_pass"(rx814_pos, "term:sym<name>")
    rx814_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx814_pos)
    .return (rx814_cur)
  rx814_fail:
.annotate 'line', 4
    (rx814_rep, rx814_pos, $I10, $P10) = rx814_cur."!mark_fail"(0)
    lt rx814_pos, -1, rx814_done
    eq rx814_pos, -1, rx814_fail
    jump $I10
  rx814_done:
    rx814_cur."!cursor_fail"()
    rx814_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx814_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("189_1275600007.84296") :method
.annotate 'line', 4
    $P816 = self."!PREFIX__!subrule"("name", "")
    new $P817, "ResizablePMCArray"
    push $P817, $P816
    .return ($P817)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("190_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx822_tgt
    .local int rx822_pos
    .local int rx822_off
    .local int rx822_eos
    .local int rx822_rep
    .local pmc rx822_cur
    (rx822_cur, rx822_pos, rx822_tgt) = self."!cursor_start"()
    rx822_cur."!cursor_debug"("START ", "term:sym<pir::op>")
    rx822_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx822_cur
    .local pmc match
    .lex "$/", match
    length rx822_eos, rx822_tgt
    gt rx822_pos, rx822_eos, rx822_done
    set rx822_off, 0
    lt rx822_pos, 2, rx822_start
    sub rx822_off, rx822_pos, 1
    substr rx822_tgt, rx822_tgt, rx822_off
  rx822_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan825_done
    goto rxscan825_scan
  rxscan825_loop:
    ($P10) = rx822_cur."from"()
    inc $P10
    set rx822_pos, $P10
    ge rx822_pos, rx822_eos, rxscan825_done
  rxscan825_scan:
    set_addr $I10, rxscan825_loop
    rx822_cur."!mark_push"(0, rx822_pos, $I10)
  rxscan825_done:
.annotate 'line', 387
  # rx literal  "pir::"
    add $I11, rx822_pos, 5
    gt $I11, rx822_eos, rx822_fail
    sub $I11, rx822_pos, rx822_off
    substr $S10, rx822_tgt, $I11, 5
    ne $S10, "pir::", rx822_fail
    add rx822_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_826_fail
    rx822_cur."!mark_push"(0, rx822_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx822_pos, rx822_off
    find_not_cclass $I11, 8192, rx822_tgt, $I10, rx822_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx822_fail
    add rx822_pos, rx822_off, $I11
    set_addr $I10, rxcap_826_fail
    ($I12, $I11) = rx822_cur."!mark_peek"($I10)
    rx822_cur."!cursor_pos"($I11)
    ($P10) = rx822_cur."!cursor_start"()
    $P10."!cursor_pass"(rx822_pos, "")
    rx822_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_826_done
  rxcap_826_fail:
    goto rx822_fail
  rxcap_826_done:
  # rx rxquantr827 ** 0..1
    set_addr $I828, rxquantr827_done
    rx822_cur."!mark_push"(0, rx822_pos, $I828)
  rxquantr827_loop:
  # rx subrule "args" subtype=capture negate=
    rx822_cur."!cursor_pos"(rx822_pos)
    $P10 = rx822_cur."args"()
    unless $P10, rx822_fail
    rx822_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx822_pos = $P10."pos"()
    (rx822_rep) = rx822_cur."!mark_commit"($I828)
  rxquantr827_done:
.annotate 'line', 386
  # rx pass
    rx822_cur."!cursor_pass"(rx822_pos, "term:sym<pir::op>")
    rx822_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx822_pos)
    .return (rx822_cur)
  rx822_fail:
.annotate 'line', 4
    (rx822_rep, rx822_pos, $I10, $P10) = rx822_cur."!mark_fail"(0)
    lt rx822_pos, -1, rx822_done
    eq rx822_pos, -1, rx822_fail
    jump $I10
  rx822_done:
    rx822_cur."!cursor_fail"()
    rx822_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx822_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("191_1275600007.84296") :method
.annotate 'line', 4
    new $P824, "ResizablePMCArray"
    push $P824, "pir::"
    .return ($P824)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("192_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx830_tgt
    .local int rx830_pos
    .local int rx830_off
    .local int rx830_eos
    .local int rx830_rep
    .local pmc rx830_cur
    (rx830_cur, rx830_pos, rx830_tgt) = self."!cursor_start"()
    rx830_cur."!cursor_debug"("START ", "args")
    .lex unicode:"$\x{a2}", rx830_cur
    .local pmc match
    .lex "$/", match
    length rx830_eos, rx830_tgt
    gt rx830_pos, rx830_eos, rx830_done
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
.annotate 'line', 391
  # rx literal  "("
    add $I11, rx830_pos, 1
    gt $I11, rx830_eos, rx830_fail
    sub $I11, rx830_pos, rx830_off
    substr $S10, rx830_tgt, $I11, 1
    ne $S10, "(", rx830_fail
    add rx830_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx830_cur."!cursor_pos"(rx830_pos)
    $P10 = rx830_cur."arglist"()
    unless $P10, rx830_fail
    rx830_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx830_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx830_pos, 1
    gt $I11, rx830_eos, rx830_fail
    sub $I11, rx830_pos, rx830_off
    substr $S10, rx830_tgt, $I11, 1
    ne $S10, ")", rx830_fail
    add rx830_pos, 1
  # rx pass
    rx830_cur."!cursor_pass"(rx830_pos, "args")
    rx830_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx830_pos)
    .return (rx830_cur)
  rx830_fail:
.annotate 'line', 4
    (rx830_rep, rx830_pos, $I10, $P10) = rx830_cur."!mark_fail"(0)
    lt rx830_pos, -1, rx830_done
    eq rx830_pos, -1, rx830_fail
    jump $I10
  rx830_done:
    rx830_cur."!cursor_fail"()
    rx830_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx830_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("193_1275600007.84296") :method
.annotate 'line', 4
    $P832 = self."!PREFIX__!subrule"("arglist", "(")
    new $P833, "ResizablePMCArray"
    push $P833, $P832
    .return ($P833)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("194_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx836_tgt
    .local int rx836_pos
    .local int rx836_off
    .local int rx836_eos
    .local int rx836_rep
    .local pmc rx836_cur
    (rx836_cur, rx836_pos, rx836_tgt) = self."!cursor_start"()
    rx836_cur."!cursor_debug"("START ", "arglist")
    .lex unicode:"$\x{a2}", rx836_cur
    .local pmc match
    .lex "$/", match
    length rx836_eos, rx836_tgt
    gt rx836_pos, rx836_eos, rx836_done
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
.annotate 'line', 395
  # rx subrule "ws" subtype=method negate=
    rx836_cur."!cursor_pos"(rx836_pos)
    $P10 = rx836_cur."ws"()
    unless $P10, rx836_fail
    rx836_pos = $P10."pos"()
  alt841_0:
.annotate 'line', 396
    set_addr $I10, alt841_1
    rx836_cur."!mark_push"(0, rx836_pos, $I10)
.annotate 'line', 397
  # rx subrule "EXPR" subtype=capture negate=
    rx836_cur."!cursor_pos"(rx836_pos)
    $P10 = rx836_cur."EXPR"("f=")
    unless $P10, rx836_fail
    rx836_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx836_pos = $P10."pos"()
    goto alt841_end
  alt841_1:
  alt841_end:
.annotate 'line', 394
  # rx pass
    rx836_cur."!cursor_pass"(rx836_pos, "arglist")
    rx836_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx836_pos)
    .return (rx836_cur)
  rx836_fail:
.annotate 'line', 4
    (rx836_rep, rx836_pos, $I10, $P10) = rx836_cur."!mark_fail"(0)
    lt rx836_pos, -1, rx836_done
    eq rx836_pos, -1, rx836_fail
    jump $I10
  rx836_done:
    rx836_cur."!cursor_fail"()
    rx836_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx836_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("195_1275600007.84296") :method
.annotate 'line', 4
    $P838 = self."!PREFIX__!subrule"("", "")
    new $P839, "ResizablePMCArray"
    push $P839, $P838
    .return ($P839)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("196_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx843_tgt
    .local int rx843_pos
    .local int rx843_off
    .local int rx843_eos
    .local int rx843_rep
    .local pmc rx843_cur
    (rx843_cur, rx843_pos, rx843_tgt) = self."!cursor_start"()
    rx843_cur."!cursor_debug"("START ", "term:sym<value>")
    .lex unicode:"$\x{a2}", rx843_cur
    .local pmc match
    .lex "$/", match
    length rx843_eos, rx843_tgt
    gt rx843_pos, rx843_eos, rx843_done
    set rx843_off, 0
    lt rx843_pos, 2, rx843_start
    sub rx843_off, rx843_pos, 1
    substr rx843_tgt, rx843_tgt, rx843_off
  rx843_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan847_done
    goto rxscan847_scan
  rxscan847_loop:
    ($P10) = rx843_cur."from"()
    inc $P10
    set rx843_pos, $P10
    ge rx843_pos, rx843_eos, rxscan847_done
  rxscan847_scan:
    set_addr $I10, rxscan847_loop
    rx843_cur."!mark_push"(0, rx843_pos, $I10)
  rxscan847_done:
.annotate 'line', 403
  # rx subrule "value" subtype=capture negate=
    rx843_cur."!cursor_pos"(rx843_pos)
    $P10 = rx843_cur."value"()
    unless $P10, rx843_fail
    rx843_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx843_pos = $P10."pos"()
  # rx pass
    rx843_cur."!cursor_pass"(rx843_pos, "term:sym<value>")
    rx843_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx843_pos)
    .return (rx843_cur)
  rx843_fail:
.annotate 'line', 4
    (rx843_rep, rx843_pos, $I10, $P10) = rx843_cur."!mark_fail"(0)
    lt rx843_pos, -1, rx843_done
    eq rx843_pos, -1, rx843_fail
    jump $I10
  rx843_done:
    rx843_cur."!cursor_fail"()
    rx843_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx843_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("197_1275600007.84296") :method
.annotate 'line', 4
    $P845 = self."!PREFIX__!subrule"("value", "")
    new $P846, "ResizablePMCArray"
    push $P846, $P845
    .return ($P846)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("198_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx849_tgt
    .local int rx849_pos
    .local int rx849_off
    .local int rx849_eos
    .local int rx849_rep
    .local pmc rx849_cur
    (rx849_cur, rx849_pos, rx849_tgt) = self."!cursor_start"()
    rx849_cur."!cursor_debug"("START ", "value")
    .lex unicode:"$\x{a2}", rx849_cur
    .local pmc match
    .lex "$/", match
    length rx849_eos, rx849_tgt
    gt rx849_pos, rx849_eos, rx849_done
    set rx849_off, 0
    lt rx849_pos, 2, rx849_start
    sub rx849_off, rx849_pos, 1
    substr rx849_tgt, rx849_tgt, rx849_off
  rx849_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan854_done
    goto rxscan854_scan
  rxscan854_loop:
    ($P10) = rx849_cur."from"()
    inc $P10
    set rx849_pos, $P10
    ge rx849_pos, rx849_eos, rxscan854_done
  rxscan854_scan:
    set_addr $I10, rxscan854_loop
    rx849_cur."!mark_push"(0, rx849_pos, $I10)
  rxscan854_done:
  alt855_0:
.annotate 'line', 405
    set_addr $I10, alt855_1
    rx849_cur."!mark_push"(0, rx849_pos, $I10)
.annotate 'line', 406
  # rx subrule "quote" subtype=capture negate=
    rx849_cur."!cursor_pos"(rx849_pos)
    $P10 = rx849_cur."quote"()
    unless $P10, rx849_fail
    rx849_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx849_pos = $P10."pos"()
    goto alt855_end
  alt855_1:
.annotate 'line', 407
  # rx subrule "number" subtype=capture negate=
    rx849_cur."!cursor_pos"(rx849_pos)
    $P10 = rx849_cur."number"()
    unless $P10, rx849_fail
    rx849_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("number")
    rx849_pos = $P10."pos"()
  alt855_end:
.annotate 'line', 405
  # rx pass
    rx849_cur."!cursor_pass"(rx849_pos, "value")
    rx849_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx849_pos)
    .return (rx849_cur)
  rx849_fail:
.annotate 'line', 4
    (rx849_rep, rx849_pos, $I10, $P10) = rx849_cur."!mark_fail"(0)
    lt rx849_pos, -1, rx849_done
    eq rx849_pos, -1, rx849_fail
    jump $I10
  rx849_done:
    rx849_cur."!cursor_fail"()
    rx849_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx849_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("199_1275600007.84296") :method
.annotate 'line', 4
    $P851 = self."!PREFIX__!subrule"("number", "")
    $P852 = self."!PREFIX__!subrule"("quote", "")
    new $P853, "ResizablePMCArray"
    push $P853, $P851
    push $P853, $P852
    .return ($P853)
.end


.namespace ["NQP";"Grammar"]
.sub "number"  :subid("200_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx857_tgt
    .local int rx857_pos
    .local int rx857_off
    .local int rx857_eos
    .local int rx857_rep
    .local pmc rx857_cur
    (rx857_cur, rx857_pos, rx857_tgt) = self."!cursor_start"()
    rx857_cur."!cursor_debug"("START ", "number")
    .lex unicode:"$\x{a2}", rx857_cur
    .local pmc match
    .lex "$/", match
    length rx857_eos, rx857_tgt
    gt rx857_pos, rx857_eos, rx857_done
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
.annotate 'line', 411
  # rx subcapture "sign"
    set_addr $I10, rxcap_863_fail
    rx857_cur."!mark_push"(0, rx857_pos, $I10)
  # rx rxquantr861 ** 0..1
    set_addr $I862, rxquantr861_done
    rx857_cur."!mark_push"(0, rx857_pos, $I862)
  rxquantr861_loop:
  # rx enumcharlist negate=0 
    ge rx857_pos, rx857_eos, rx857_fail
    sub $I10, rx857_pos, rx857_off
    substr $S10, rx857_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rx857_fail
    inc rx857_pos
    (rx857_rep) = rx857_cur."!mark_commit"($I862)
  rxquantr861_done:
    set_addr $I10, rxcap_863_fail
    ($I12, $I11) = rx857_cur."!mark_peek"($I10)
    rx857_cur."!cursor_pos"($I11)
    ($P10) = rx857_cur."!cursor_start"()
    $P10."!cursor_pass"(rx857_pos, "")
    rx857_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_863_done
  rxcap_863_fail:
    goto rx857_fail
  rxcap_863_done:
  alt864_0:
.annotate 'line', 412
    set_addr $I10, alt864_1
    rx857_cur."!mark_push"(0, rx857_pos, $I10)
  # rx subrule "dec_number" subtype=capture negate=
    rx857_cur."!cursor_pos"(rx857_pos)
    $P10 = rx857_cur."dec_number"()
    unless $P10, rx857_fail
    rx857_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx857_pos = $P10."pos"()
    goto alt864_end
  alt864_1:
  # rx subrule "integer" subtype=capture negate=
    rx857_cur."!cursor_pos"(rx857_pos)
    $P10 = rx857_cur."integer"()
    unless $P10, rx857_fail
    rx857_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx857_pos = $P10."pos"()
  alt864_end:
.annotate 'line', 410
  # rx pass
    rx857_cur."!cursor_pass"(rx857_pos, "number")
    rx857_cur."!cursor_debug"("PASS  ", "number", " at pos=", rx857_pos)
    .return (rx857_cur)
  rx857_fail:
.annotate 'line', 4
    (rx857_rep, rx857_pos, $I10, $P10) = rx857_cur."!mark_fail"(0)
    lt rx857_pos, -1, rx857_done
    eq rx857_pos, -1, rx857_fail
    jump $I10
  rx857_done:
    rx857_cur."!cursor_fail"()
    rx857_cur."!cursor_debug"("FAIL  ", "number")
    .return (rx857_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__number"  :subid("201_1275600007.84296") :method
.annotate 'line', 4
    new $P859, "ResizablePMCArray"
    push $P859, ""
    .return ($P859)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("202_1275600007.84296") :method
.annotate 'line', 415
    $P866 = self."!protoregex"("quote")
    .return ($P866)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("203_1275600007.84296") :method
.annotate 'line', 415
    $P868 = self."!PREFIX__!protoregex"("quote")
    .return ($P868)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("204_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx870_tgt
    .local int rx870_pos
    .local int rx870_off
    .local int rx870_eos
    .local int rx870_rep
    .local pmc rx870_cur
    (rx870_cur, rx870_pos, rx870_tgt) = self."!cursor_start"()
    rx870_cur."!cursor_debug"("START ", "quote:sym<apos>")
    .lex unicode:"$\x{a2}", rx870_cur
    .local pmc match
    .lex "$/", match
    length rx870_eos, rx870_tgt
    gt rx870_pos, rx870_eos, rx870_done
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
.annotate 'line', 416
  # rx enumcharlist negate=0 zerowidth
    ge rx870_pos, rx870_eos, rx870_fail
    sub $I10, rx870_pos, rx870_off
    substr $S10, rx870_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx870_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx870_cur."!cursor_pos"(rx870_pos)
    $P10 = rx870_cur."quote_EXPR"(":q")
    unless $P10, rx870_fail
    rx870_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx870_pos = $P10."pos"()
  # rx pass
    rx870_cur."!cursor_pass"(rx870_pos, "quote:sym<apos>")
    rx870_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx870_pos)
    .return (rx870_cur)
  rx870_fail:
.annotate 'line', 4
    (rx870_rep, rx870_pos, $I10, $P10) = rx870_cur."!mark_fail"(0)
    lt rx870_pos, -1, rx870_done
    eq rx870_pos, -1, rx870_fail
    jump $I10
  rx870_done:
    rx870_cur."!cursor_fail"()
    rx870_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx870_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("205_1275600007.84296") :method
.annotate 'line', 4
    new $P872, "ResizablePMCArray"
    push $P872, "'"
    .return ($P872)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("206_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx875_tgt
    .local int rx875_pos
    .local int rx875_off
    .local int rx875_eos
    .local int rx875_rep
    .local pmc rx875_cur
    (rx875_cur, rx875_pos, rx875_tgt) = self."!cursor_start"()
    rx875_cur."!cursor_debug"("START ", "quote:sym<dblq>")
    .lex unicode:"$\x{a2}", rx875_cur
    .local pmc match
    .lex "$/", match
    length rx875_eos, rx875_tgt
    gt rx875_pos, rx875_eos, rx875_done
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
.annotate 'line', 417
  # rx enumcharlist negate=0 zerowidth
    ge rx875_pos, rx875_eos, rx875_fail
    sub $I10, rx875_pos, rx875_off
    substr $S10, rx875_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx875_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx875_cur."!cursor_pos"(rx875_pos)
    $P10 = rx875_cur."quote_EXPR"(":qq")
    unless $P10, rx875_fail
    rx875_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx875_pos = $P10."pos"()
  # rx pass
    rx875_cur."!cursor_pass"(rx875_pos, "quote:sym<dblq>")
    rx875_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx875_pos)
    .return (rx875_cur)
  rx875_fail:
.annotate 'line', 4
    (rx875_rep, rx875_pos, $I10, $P10) = rx875_cur."!mark_fail"(0)
    lt rx875_pos, -1, rx875_done
    eq rx875_pos, -1, rx875_fail
    jump $I10
  rx875_done:
    rx875_cur."!cursor_fail"()
    rx875_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx875_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("207_1275600007.84296") :method
.annotate 'line', 4
    new $P877, "ResizablePMCArray"
    push $P877, "\""
    .return ($P877)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("208_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx880_tgt
    .local int rx880_pos
    .local int rx880_off
    .local int rx880_eos
    .local int rx880_rep
    .local pmc rx880_cur
    (rx880_cur, rx880_pos, rx880_tgt) = self."!cursor_start"()
    rx880_cur."!cursor_debug"("START ", "quote:sym<q>")
    .lex unicode:"$\x{a2}", rx880_cur
    .local pmc match
    .lex "$/", match
    length rx880_eos, rx880_tgt
    gt rx880_pos, rx880_eos, rx880_done
    set rx880_off, 0
    lt rx880_pos, 2, rx880_start
    sub rx880_off, rx880_pos, 1
    substr rx880_tgt, rx880_tgt, rx880_off
  rx880_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan884_done
    goto rxscan884_scan
  rxscan884_loop:
    ($P10) = rx880_cur."from"()
    inc $P10
    set rx880_pos, $P10
    ge rx880_pos, rx880_eos, rxscan884_done
  rxscan884_scan:
    set_addr $I10, rxscan884_loop
    rx880_cur."!mark_push"(0, rx880_pos, $I10)
  rxscan884_done:
.annotate 'line', 418
  # rx literal  "q"
    add $I11, rx880_pos, 1
    gt $I11, rx880_eos, rx880_fail
    sub $I11, rx880_pos, rx880_off
    substr $S10, rx880_tgt, $I11, 1
    ne $S10, "q", rx880_fail
    add rx880_pos, 1
  # rxanchor rwb
    le rx880_pos, 0, rx880_fail
    sub $I10, rx880_pos, rx880_off
    is_cclass $I11, 8192, rx880_tgt, $I10
    if $I11, rx880_fail
    dec $I10
    is_cclass $I11, 8192, rx880_tgt, $I10
    unless $I11, rx880_fail
  # rx enumcharlist negate=1 zerowidth
    ge rx880_pos, rx880_eos, rx880_fail
    sub $I10, rx880_pos, rx880_off
    substr $S10, rx880_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx880_fail
  # rx subrule "ws" subtype=method negate=
    rx880_cur."!cursor_pos"(rx880_pos)
    $P10 = rx880_cur."ws"()
    unless $P10, rx880_fail
    rx880_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx880_cur."!cursor_pos"(rx880_pos)
    $P10 = rx880_cur."quote_EXPR"(":q")
    unless $P10, rx880_fail
    rx880_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx880_pos = $P10."pos"()
  # rx pass
    rx880_cur."!cursor_pass"(rx880_pos, "quote:sym<q>")
    rx880_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx880_pos)
    .return (rx880_cur)
  rx880_fail:
.annotate 'line', 4
    (rx880_rep, rx880_pos, $I10, $P10) = rx880_cur."!mark_fail"(0)
    lt rx880_pos, -1, rx880_done
    eq rx880_pos, -1, rx880_fail
    jump $I10
  rx880_done:
    rx880_cur."!cursor_fail"()
    rx880_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx880_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("209_1275600007.84296") :method
.annotate 'line', 4
    $P882 = self."!PREFIX__!subrule"("", "q")
    new $P883, "ResizablePMCArray"
    push $P883, $P882
    .return ($P883)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("210_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx886_tgt
    .local int rx886_pos
    .local int rx886_off
    .local int rx886_eos
    .local int rx886_rep
    .local pmc rx886_cur
    (rx886_cur, rx886_pos, rx886_tgt) = self."!cursor_start"()
    rx886_cur."!cursor_debug"("START ", "quote:sym<qq>")
    .lex unicode:"$\x{a2}", rx886_cur
    .local pmc match
    .lex "$/", match
    length rx886_eos, rx886_tgt
    gt rx886_pos, rx886_eos, rx886_done
    set rx886_off, 0
    lt rx886_pos, 2, rx886_start
    sub rx886_off, rx886_pos, 1
    substr rx886_tgt, rx886_tgt, rx886_off
  rx886_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan890_done
    goto rxscan890_scan
  rxscan890_loop:
    ($P10) = rx886_cur."from"()
    inc $P10
    set rx886_pos, $P10
    ge rx886_pos, rx886_eos, rxscan890_done
  rxscan890_scan:
    set_addr $I10, rxscan890_loop
    rx886_cur."!mark_push"(0, rx886_pos, $I10)
  rxscan890_done:
.annotate 'line', 419
  # rx literal  "qq"
    add $I11, rx886_pos, 2
    gt $I11, rx886_eos, rx886_fail
    sub $I11, rx886_pos, rx886_off
    substr $S10, rx886_tgt, $I11, 2
    ne $S10, "qq", rx886_fail
    add rx886_pos, 2
  # rxanchor rwb
    le rx886_pos, 0, rx886_fail
    sub $I10, rx886_pos, rx886_off
    is_cclass $I11, 8192, rx886_tgt, $I10
    if $I11, rx886_fail
    dec $I10
    is_cclass $I11, 8192, rx886_tgt, $I10
    unless $I11, rx886_fail
  # rx enumcharlist negate=1 zerowidth
    ge rx886_pos, rx886_eos, rx886_fail
    sub $I10, rx886_pos, rx886_off
    substr $S10, rx886_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx886_fail
  # rx subrule "ws" subtype=method negate=
    rx886_cur."!cursor_pos"(rx886_pos)
    $P10 = rx886_cur."ws"()
    unless $P10, rx886_fail
    rx886_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx886_cur."!cursor_pos"(rx886_pos)
    $P10 = rx886_cur."quote_EXPR"(":qq")
    unless $P10, rx886_fail
    rx886_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx886_pos = $P10."pos"()
  # rx pass
    rx886_cur."!cursor_pass"(rx886_pos, "quote:sym<qq>")
    rx886_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx886_pos)
    .return (rx886_cur)
  rx886_fail:
.annotate 'line', 4
    (rx886_rep, rx886_pos, $I10, $P10) = rx886_cur."!mark_fail"(0)
    lt rx886_pos, -1, rx886_done
    eq rx886_pos, -1, rx886_fail
    jump $I10
  rx886_done:
    rx886_cur."!cursor_fail"()
    rx886_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx886_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("211_1275600007.84296") :method
.annotate 'line', 4
    $P888 = self."!PREFIX__!subrule"("", "qq")
    new $P889, "ResizablePMCArray"
    push $P889, $P888
    .return ($P889)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("212_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx892_tgt
    .local int rx892_pos
    .local int rx892_off
    .local int rx892_eos
    .local int rx892_rep
    .local pmc rx892_cur
    (rx892_cur, rx892_pos, rx892_tgt) = self."!cursor_start"()
    rx892_cur."!cursor_debug"("START ", "quote:sym<Q>")
    .lex unicode:"$\x{a2}", rx892_cur
    .local pmc match
    .lex "$/", match
    length rx892_eos, rx892_tgt
    gt rx892_pos, rx892_eos, rx892_done
    set rx892_off, 0
    lt rx892_pos, 2, rx892_start
    sub rx892_off, rx892_pos, 1
    substr rx892_tgt, rx892_tgt, rx892_off
  rx892_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan896_done
    goto rxscan896_scan
  rxscan896_loop:
    ($P10) = rx892_cur."from"()
    inc $P10
    set rx892_pos, $P10
    ge rx892_pos, rx892_eos, rxscan896_done
  rxscan896_scan:
    set_addr $I10, rxscan896_loop
    rx892_cur."!mark_push"(0, rx892_pos, $I10)
  rxscan896_done:
.annotate 'line', 420
  # rx literal  "Q"
    add $I11, rx892_pos, 1
    gt $I11, rx892_eos, rx892_fail
    sub $I11, rx892_pos, rx892_off
    substr $S10, rx892_tgt, $I11, 1
    ne $S10, "Q", rx892_fail
    add rx892_pos, 1
  # rxanchor rwb
    le rx892_pos, 0, rx892_fail
    sub $I10, rx892_pos, rx892_off
    is_cclass $I11, 8192, rx892_tgt, $I10
    if $I11, rx892_fail
    dec $I10
    is_cclass $I11, 8192, rx892_tgt, $I10
    unless $I11, rx892_fail
  # rx enumcharlist negate=1 zerowidth
    ge rx892_pos, rx892_eos, rx892_fail
    sub $I10, rx892_pos, rx892_off
    substr $S10, rx892_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx892_fail
  # rx subrule "ws" subtype=method negate=
    rx892_cur."!cursor_pos"(rx892_pos)
    $P10 = rx892_cur."ws"()
    unless $P10, rx892_fail
    rx892_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx892_cur."!cursor_pos"(rx892_pos)
    $P10 = rx892_cur."quote_EXPR"()
    unless $P10, rx892_fail
    rx892_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx892_pos = $P10."pos"()
  # rx pass
    rx892_cur."!cursor_pass"(rx892_pos, "quote:sym<Q>")
    rx892_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx892_pos)
    .return (rx892_cur)
  rx892_fail:
.annotate 'line', 4
    (rx892_rep, rx892_pos, $I10, $P10) = rx892_cur."!mark_fail"(0)
    lt rx892_pos, -1, rx892_done
    eq rx892_pos, -1, rx892_fail
    jump $I10
  rx892_done:
    rx892_cur."!cursor_fail"()
    rx892_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx892_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("213_1275600007.84296") :method
.annotate 'line', 4
    $P894 = self."!PREFIX__!subrule"("", "Q")
    new $P895, "ResizablePMCArray"
    push $P895, $P894
    .return ($P895)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("214_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx898_tgt
    .local int rx898_pos
    .local int rx898_off
    .local int rx898_eos
    .local int rx898_rep
    .local pmc rx898_cur
    (rx898_cur, rx898_pos, rx898_tgt) = self."!cursor_start"()
    rx898_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
    .lex unicode:"$\x{a2}", rx898_cur
    .local pmc match
    .lex "$/", match
    length rx898_eos, rx898_tgt
    gt rx898_pos, rx898_eos, rx898_done
    set rx898_off, 0
    lt rx898_pos, 2, rx898_start
    sub rx898_off, rx898_pos, 1
    substr rx898_tgt, rx898_tgt, rx898_off
  rx898_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan902_done
    goto rxscan902_scan
  rxscan902_loop:
    ($P10) = rx898_cur."from"()
    inc $P10
    set rx898_pos, $P10
    ge rx898_pos, rx898_eos, rxscan902_done
  rxscan902_scan:
    set_addr $I10, rxscan902_loop
    rx898_cur."!mark_push"(0, rx898_pos, $I10)
  rxscan902_done:
.annotate 'line', 421
  # rx literal  "Q:PIR"
    add $I11, rx898_pos, 5
    gt $I11, rx898_eos, rx898_fail
    sub $I11, rx898_pos, rx898_off
    substr $S10, rx898_tgt, $I11, 5
    ne $S10, "Q:PIR", rx898_fail
    add rx898_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx898_cur."!cursor_pos"(rx898_pos)
    $P10 = rx898_cur."ws"()
    unless $P10, rx898_fail
    rx898_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx898_cur."!cursor_pos"(rx898_pos)
    $P10 = rx898_cur."quote_EXPR"()
    unless $P10, rx898_fail
    rx898_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx898_pos = $P10."pos"()
  # rx pass
    rx898_cur."!cursor_pass"(rx898_pos, "quote:sym<Q:PIR>")
    rx898_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx898_pos)
    .return (rx898_cur)
  rx898_fail:
.annotate 'line', 4
    (rx898_rep, rx898_pos, $I10, $P10) = rx898_cur."!mark_fail"(0)
    lt rx898_pos, -1, rx898_done
    eq rx898_pos, -1, rx898_fail
    jump $I10
  rx898_done:
    rx898_cur."!cursor_fail"()
    rx898_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx898_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("215_1275600007.84296") :method
.annotate 'line', 4
    $P900 = self."!PREFIX__!subrule"("", "Q:PIR")
    new $P901, "ResizablePMCArray"
    push $P901, $P900
    .return ($P901)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym</ />"  :subid("216_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx904_tgt
    .local int rx904_pos
    .local int rx904_off
    .local int rx904_eos
    .local int rx904_rep
    .local pmc rx904_cur
    (rx904_cur, rx904_pos, rx904_tgt) = self."!cursor_start"()
    rx904_cur."!cursor_debug"("START ", "quote:sym</ />")
    .lex unicode:"$\x{a2}", rx904_cur
    .local pmc match
    .lex "$/", match
    length rx904_eos, rx904_tgt
    gt rx904_pos, rx904_eos, rx904_done
    set rx904_off, 0
    lt rx904_pos, 2, rx904_start
    sub rx904_off, rx904_pos, 1
    substr rx904_tgt, rx904_tgt, rx904_off
  rx904_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan908_done
    goto rxscan908_scan
  rxscan908_loop:
    ($P10) = rx904_cur."from"()
    inc $P10
    set rx904_pos, $P10
    ge rx904_pos, rx904_eos, rxscan908_done
  rxscan908_scan:
    set_addr $I10, rxscan908_loop
    rx904_cur."!mark_push"(0, rx904_pos, $I10)
  rxscan908_done:
.annotate 'line', 423
  # rx literal  "/"
    add $I11, rx904_pos, 1
    gt $I11, rx904_eos, rx904_fail
    sub $I11, rx904_pos, rx904_off
    substr $S10, rx904_tgt, $I11, 1
    ne $S10, "/", rx904_fail
    add rx904_pos, 1
.annotate 'line', 424
  # rx subrule "newpad" subtype=method negate=
    rx904_cur."!cursor_pos"(rx904_pos)
    $P10 = rx904_cur."newpad"()
    unless $P10, rx904_fail
    rx904_pos = $P10."pos"()
.annotate 'line', 425
  # rx reduce name="quote:sym</ />" key="open"
    rx904_cur."!cursor_pos"(rx904_pos)
    rx904_cur."!reduce"("quote:sym</ />", "open")
.annotate 'line', 426
  # rx subrule "LANG" subtype=capture negate=
    rx904_cur."!cursor_pos"(rx904_pos)
    $P10 = rx904_cur."LANG"("Regex", "nibbler")
    unless $P10, rx904_fail
    rx904_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx904_pos = $P10."pos"()
.annotate 'line', 427
  # rx literal  "/"
    add $I11, rx904_pos, 1
    gt $I11, rx904_eos, rx904_fail
    sub $I11, rx904_pos, rx904_off
    substr $S10, rx904_tgt, $I11, 1
    ne $S10, "/", rx904_fail
    add rx904_pos, 1
.annotate 'line', 422
  # rx pass
    rx904_cur."!cursor_pass"(rx904_pos, "quote:sym</ />")
    rx904_cur."!cursor_debug"("PASS  ", "quote:sym</ />", " at pos=", rx904_pos)
    .return (rx904_cur)
  rx904_fail:
.annotate 'line', 4
    (rx904_rep, rx904_pos, $I10, $P10) = rx904_cur."!mark_fail"(0)
    lt rx904_pos, -1, rx904_done
    eq rx904_pos, -1, rx904_fail
    jump $I10
  rx904_done:
    rx904_cur."!cursor_fail"()
    rx904_cur."!cursor_debug"("FAIL  ", "quote:sym</ />")
    .return (rx904_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym</ />"  :subid("217_1275600007.84296") :method
.annotate 'line', 4
    $P906 = self."!PREFIX__!subrule"("", "/")
    new $P907, "ResizablePMCArray"
    push $P907, $P906
    .return ($P907)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("218_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx910_tgt
    .local int rx910_pos
    .local int rx910_off
    .local int rx910_eos
    .local int rx910_rep
    .local pmc rx910_cur
    (rx910_cur, rx910_pos, rx910_tgt) = self."!cursor_start"()
    rx910_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
    .lex unicode:"$\x{a2}", rx910_cur
    .local pmc match
    .lex "$/", match
    length rx910_eos, rx910_tgt
    gt rx910_pos, rx910_eos, rx910_done
    set rx910_off, 0
    lt rx910_pos, 2, rx910_start
    sub rx910_off, rx910_pos, 1
    substr rx910_tgt, rx910_tgt, rx910_off
  rx910_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan913_done
    goto rxscan913_scan
  rxscan913_loop:
    ($P10) = rx910_cur."from"()
    inc $P10
    set rx910_pos, $P10
    ge rx910_pos, rx910_eos, rxscan913_done
  rxscan913_scan:
    set_addr $I10, rxscan913_loop
    rx910_cur."!mark_push"(0, rx910_pos, $I10)
  rxscan913_done:
.annotate 'line', 430
  # rx enumcharlist negate=0 zerowidth
    ge rx910_pos, rx910_eos, rx910_fail
    sub $I10, rx910_pos, rx910_off
    substr $S10, rx910_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx910_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx910_cur."!cursor_pos"(rx910_pos)
    $P10 = rx910_cur."quotemod_check"("s")
    unless $P10, rx910_fail
  # rx subrule "variable" subtype=capture negate=
    rx910_cur."!cursor_pos"(rx910_pos)
    $P10 = rx910_cur."variable"()
    unless $P10, rx910_fail
    rx910_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx910_pos = $P10."pos"()
  # rx pass
    rx910_cur."!cursor_pass"(rx910_pos, "quote_escape:sym<$>")
    rx910_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx910_pos)
    .return (rx910_cur)
  rx910_fail:
.annotate 'line', 4
    (rx910_rep, rx910_pos, $I10, $P10) = rx910_cur."!mark_fail"(0)
    lt rx910_pos, -1, rx910_done
    eq rx910_pos, -1, rx910_fail
    jump $I10
  rx910_done:
    rx910_cur."!cursor_fail"()
    rx910_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx910_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("219_1275600007.84296") :method
.annotate 'line', 4
    new $P912, "ResizablePMCArray"
    push $P912, "$"
    .return ($P912)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("220_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx915_tgt
    .local int rx915_pos
    .local int rx915_off
    .local int rx915_eos
    .local int rx915_rep
    .local pmc rx915_cur
    (rx915_cur, rx915_pos, rx915_tgt) = self."!cursor_start"()
    rx915_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
    .lex unicode:"$\x{a2}", rx915_cur
    .local pmc match
    .lex "$/", match
    length rx915_eos, rx915_tgt
    gt rx915_pos, rx915_eos, rx915_done
    set rx915_off, 0
    lt rx915_pos, 2, rx915_start
    sub rx915_off, rx915_pos, 1
    substr rx915_tgt, rx915_tgt, rx915_off
  rx915_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan918_done
    goto rxscan918_scan
  rxscan918_loop:
    ($P10) = rx915_cur."from"()
    inc $P10
    set rx915_pos, $P10
    ge rx915_pos, rx915_eos, rxscan918_done
  rxscan918_scan:
    set_addr $I10, rxscan918_loop
    rx915_cur."!mark_push"(0, rx915_pos, $I10)
  rxscan918_done:
.annotate 'line', 431
  # rx enumcharlist negate=0 zerowidth
    ge rx915_pos, rx915_eos, rx915_fail
    sub $I10, rx915_pos, rx915_off
    substr $S10, rx915_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx915_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx915_cur."!cursor_pos"(rx915_pos)
    $P10 = rx915_cur."quotemod_check"("c")
    unless $P10, rx915_fail
  # rx subrule "block" subtype=capture negate=
    rx915_cur."!cursor_pos"(rx915_pos)
    $P10 = rx915_cur."block"()
    unless $P10, rx915_fail
    rx915_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx915_pos = $P10."pos"()
  # rx pass
    rx915_cur."!cursor_pass"(rx915_pos, "quote_escape:sym<{ }>")
    rx915_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx915_pos)
    .return (rx915_cur)
  rx915_fail:
.annotate 'line', 4
    (rx915_rep, rx915_pos, $I10, $P10) = rx915_cur."!mark_fail"(0)
    lt rx915_pos, -1, rx915_done
    eq rx915_pos, -1, rx915_fail
    jump $I10
  rx915_done:
    rx915_cur."!cursor_fail"()
    rx915_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx915_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("221_1275600007.84296") :method
.annotate 'line', 4
    new $P917, "ResizablePMCArray"
    push $P917, "{"
    .return ($P917)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<esc>"  :subid("222_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx920_tgt
    .local int rx920_pos
    .local int rx920_off
    .local int rx920_eos
    .local int rx920_rep
    .local pmc rx920_cur
    (rx920_cur, rx920_pos, rx920_tgt) = self."!cursor_start"()
    rx920_cur."!cursor_debug"("START ", "quote_escape:sym<esc>")
    .lex unicode:"$\x{a2}", rx920_cur
    .local pmc match
    .lex "$/", match
    length rx920_eos, rx920_tgt
    gt rx920_pos, rx920_eos, rx920_done
    set rx920_off, 0
    lt rx920_pos, 2, rx920_start
    sub rx920_off, rx920_pos, 1
    substr rx920_tgt, rx920_tgt, rx920_off
  rx920_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan923_done
    goto rxscan923_scan
  rxscan923_loop:
    ($P10) = rx920_cur."from"()
    inc $P10
    set rx920_pos, $P10
    ge rx920_pos, rx920_eos, rxscan923_done
  rxscan923_scan:
    set_addr $I10, rxscan923_loop
    rx920_cur."!mark_push"(0, rx920_pos, $I10)
  rxscan923_done:
.annotate 'line', 432
  # rx literal  "\\e"
    add $I11, rx920_pos, 2
    gt $I11, rx920_eos, rx920_fail
    sub $I11, rx920_pos, rx920_off
    substr $S10, rx920_tgt, $I11, 2
    ne $S10, "\\e", rx920_fail
    add rx920_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx920_cur."!cursor_pos"(rx920_pos)
    $P10 = rx920_cur."quotemod_check"("b")
    unless $P10, rx920_fail
  # rx pass
    rx920_cur."!cursor_pass"(rx920_pos, "quote_escape:sym<esc>")
    rx920_cur."!cursor_debug"("PASS  ", "quote_escape:sym<esc>", " at pos=", rx920_pos)
    .return (rx920_cur)
  rx920_fail:
.annotate 'line', 4
    (rx920_rep, rx920_pos, $I10, $P10) = rx920_cur."!mark_fail"(0)
    lt rx920_pos, -1, rx920_done
    eq rx920_pos, -1, rx920_fail
    jump $I10
  rx920_done:
    rx920_cur."!cursor_fail"()
    rx920_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<esc>")
    .return (rx920_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<esc>"  :subid("223_1275600007.84296") :method
.annotate 'line', 4
    new $P922, "ResizablePMCArray"
    push $P922, "\\e"
    .return ($P922)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("224_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx925_tgt
    .local int rx925_pos
    .local int rx925_off
    .local int rx925_eos
    .local int rx925_rep
    .local pmc rx925_cur
    (rx925_cur, rx925_pos, rx925_tgt) = self."!cursor_start"()
    rx925_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx925_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx925_cur
    .local pmc match
    .lex "$/", match
    length rx925_eos, rx925_tgt
    gt rx925_pos, rx925_eos, rx925_done
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
.annotate 'line', 434
  # rx literal  "("
    add $I11, rx925_pos, 1
    gt $I11, rx925_eos, rx925_fail
    sub $I11, rx925_pos, rx925_off
    substr $S10, rx925_tgt, $I11, 1
    ne $S10, "(", rx925_fail
    add rx925_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx925_cur."!cursor_pos"(rx925_pos)
    $P10 = rx925_cur."ws"()
    unless $P10, rx925_fail
    rx925_pos = $P10."pos"()
  # rx rxquantr930 ** 0..1
    set_addr $I931, rxquantr930_done
    rx925_cur."!mark_push"(0, rx925_pos, $I931)
  rxquantr930_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx925_cur."!cursor_pos"(rx925_pos)
    $P10 = rx925_cur."EXPR"()
    unless $P10, rx925_fail
    rx925_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx925_pos = $P10."pos"()
    (rx925_rep) = rx925_cur."!mark_commit"($I931)
  rxquantr930_done:
  # rx literal  ")"
    add $I11, rx925_pos, 1
    gt $I11, rx925_eos, rx925_fail
    sub $I11, rx925_pos, rx925_off
    substr $S10, rx925_tgt, $I11, 1
    ne $S10, ")", rx925_fail
    add rx925_pos, 1
  # rx pass
    rx925_cur."!cursor_pass"(rx925_pos, "circumfix:sym<( )>")
    rx925_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx925_pos)
    .return (rx925_cur)
  rx925_fail:
.annotate 'line', 4
    (rx925_rep, rx925_pos, $I10, $P10) = rx925_cur."!mark_fail"(0)
    lt rx925_pos, -1, rx925_done
    eq rx925_pos, -1, rx925_fail
    jump $I10
  rx925_done:
    rx925_cur."!cursor_fail"()
    rx925_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx925_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("225_1275600007.84296") :method
.annotate 'line', 4
    $P927 = self."!PREFIX__!subrule"("", "(")
    new $P928, "ResizablePMCArray"
    push $P928, $P927
    .return ($P928)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("226_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx933_tgt
    .local int rx933_pos
    .local int rx933_off
    .local int rx933_eos
    .local int rx933_rep
    .local pmc rx933_cur
    (rx933_cur, rx933_pos, rx933_tgt) = self."!cursor_start"()
    rx933_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
    rx933_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx933_cur
    .local pmc match
    .lex "$/", match
    length rx933_eos, rx933_tgt
    gt rx933_pos, rx933_eos, rx933_done
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
.annotate 'line', 435
  # rx literal  "["
    add $I11, rx933_pos, 1
    gt $I11, rx933_eos, rx933_fail
    sub $I11, rx933_pos, rx933_off
    substr $S10, rx933_tgt, $I11, 1
    ne $S10, "[", rx933_fail
    add rx933_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx933_cur."!cursor_pos"(rx933_pos)
    $P10 = rx933_cur."ws"()
    unless $P10, rx933_fail
    rx933_pos = $P10."pos"()
  # rx rxquantr938 ** 0..1
    set_addr $I939, rxquantr938_done
    rx933_cur."!mark_push"(0, rx933_pos, $I939)
  rxquantr938_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx933_cur."!cursor_pos"(rx933_pos)
    $P10 = rx933_cur."EXPR"()
    unless $P10, rx933_fail
    rx933_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx933_pos = $P10."pos"()
    (rx933_rep) = rx933_cur."!mark_commit"($I939)
  rxquantr938_done:
  # rx literal  "]"
    add $I11, rx933_pos, 1
    gt $I11, rx933_eos, rx933_fail
    sub $I11, rx933_pos, rx933_off
    substr $S10, rx933_tgt, $I11, 1
    ne $S10, "]", rx933_fail
    add rx933_pos, 1
  # rx pass
    rx933_cur."!cursor_pass"(rx933_pos, "circumfix:sym<[ ]>")
    rx933_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx933_pos)
    .return (rx933_cur)
  rx933_fail:
.annotate 'line', 4
    (rx933_rep, rx933_pos, $I10, $P10) = rx933_cur."!mark_fail"(0)
    lt rx933_pos, -1, rx933_done
    eq rx933_pos, -1, rx933_fail
    jump $I10
  rx933_done:
    rx933_cur."!cursor_fail"()
    rx933_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx933_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("227_1275600007.84296") :method
.annotate 'line', 4
    $P935 = self."!PREFIX__!subrule"("", "[")
    new $P936, "ResizablePMCArray"
    push $P936, $P935
    .return ($P936)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("228_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx941_tgt
    .local int rx941_pos
    .local int rx941_off
    .local int rx941_eos
    .local int rx941_rep
    .local pmc rx941_cur
    (rx941_cur, rx941_pos, rx941_tgt) = self."!cursor_start"()
    rx941_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx941_cur
    .local pmc match
    .lex "$/", match
    length rx941_eos, rx941_tgt
    gt rx941_pos, rx941_eos, rx941_done
    set rx941_off, 0
    lt rx941_pos, 2, rx941_start
    sub rx941_off, rx941_pos, 1
    substr rx941_tgt, rx941_tgt, rx941_off
  rx941_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan944_done
    goto rxscan944_scan
  rxscan944_loop:
    ($P10) = rx941_cur."from"()
    inc $P10
    set rx941_pos, $P10
    ge rx941_pos, rx941_eos, rxscan944_done
  rxscan944_scan:
    set_addr $I10, rxscan944_loop
    rx941_cur."!mark_push"(0, rx941_pos, $I10)
  rxscan944_done:
.annotate 'line', 436
  # rx enumcharlist negate=0 zerowidth
    ge rx941_pos, rx941_eos, rx941_fail
    sub $I10, rx941_pos, rx941_off
    substr $S10, rx941_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx941_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx941_cur."!cursor_pos"(rx941_pos)
    $P10 = rx941_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx941_fail
    rx941_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx941_pos = $P10."pos"()
  # rx pass
    rx941_cur."!cursor_pass"(rx941_pos, "circumfix:sym<ang>")
    rx941_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx941_pos)
    .return (rx941_cur)
  rx941_fail:
.annotate 'line', 4
    (rx941_rep, rx941_pos, $I10, $P10) = rx941_cur."!mark_fail"(0)
    lt rx941_pos, -1, rx941_done
    eq rx941_pos, -1, rx941_fail
    jump $I10
  rx941_done:
    rx941_cur."!cursor_fail"()
    rx941_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx941_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("229_1275600007.84296") :method
.annotate 'line', 4
    new $P943, "ResizablePMCArray"
    push $P943, "<"
    .return ($P943)
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("230_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx946_tgt
    .local int rx946_pos
    .local int rx946_off
    .local int rx946_eos
    .local int rx946_rep
    .local pmc rx946_cur
    (rx946_cur, rx946_pos, rx946_tgt) = self."!cursor_start"()
    rx946_cur."!cursor_debug"("START ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
    .lex unicode:"$\x{a2}", rx946_cur
    .local pmc match
    .lex "$/", match
    length rx946_eos, rx946_tgt
    gt rx946_pos, rx946_eos, rx946_done
    set rx946_off, 0
    lt rx946_pos, 2, rx946_start
    sub rx946_off, rx946_pos, 1
    substr rx946_tgt, rx946_tgt, rx946_off
  rx946_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan949_done
    goto rxscan949_scan
  rxscan949_loop:
    ($P10) = rx946_cur."from"()
    inc $P10
    set rx946_pos, $P10
    ge rx946_pos, rx946_eos, rxscan949_done
  rxscan949_scan:
    set_addr $I10, rxscan949_loop
    rx946_cur."!mark_push"(0, rx946_pos, $I10)
  rxscan949_done:
.annotate 'line', 437
  # rx enumcharlist negate=0 zerowidth
    ge rx946_pos, rx946_eos, rx946_fail
    sub $I10, rx946_pos, rx946_off
    substr $S10, rx946_tgt, $I10, 1
    index $I11, unicode:"\x{ab}", $S10
    lt $I11, 0, rx946_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx946_cur."!cursor_pos"(rx946_pos)
    $P10 = rx946_cur."quote_EXPR"(":qq", ":w")
    unless $P10, rx946_fail
    rx946_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx946_pos = $P10."pos"()
  # rx pass
    rx946_cur."!cursor_pass"(rx946_pos, unicode:"circumfix:sym<\x{ab} \x{bb}>")
    rx946_cur."!cursor_debug"("PASS  ", unicode:"circumfix:sym<\x{ab} \x{bb}>", " at pos=", rx946_pos)
    .return (rx946_cur)
  rx946_fail:
.annotate 'line', 4
    (rx946_rep, rx946_pos, $I10, $P10) = rx946_cur."!mark_fail"(0)
    lt rx946_pos, -1, rx946_done
    eq rx946_pos, -1, rx946_fail
    jump $I10
  rx946_done:
    rx946_cur."!cursor_fail"()
    rx946_cur."!cursor_debug"("FAIL  ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
    .return (rx946_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"!PREFIX__circumfix:sym<\x{ab} \x{bb}>"  :subid("231_1275600007.84296") :method
.annotate 'line', 4
    new $P948, "ResizablePMCArray"
    push $P948, unicode:"\x{ab}"
    .return ($P948)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("232_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx951_tgt
    .local int rx951_pos
    .local int rx951_off
    .local int rx951_eos
    .local int rx951_rep
    .local pmc rx951_cur
    (rx951_cur, rx951_pos, rx951_tgt) = self."!cursor_start"()
    rx951_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx951_cur
    .local pmc match
    .lex "$/", match
    length rx951_eos, rx951_tgt
    gt rx951_pos, rx951_eos, rx951_done
    set rx951_off, 0
    lt rx951_pos, 2, rx951_start
    sub rx951_off, rx951_pos, 1
    substr rx951_tgt, rx951_tgt, rx951_off
  rx951_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan954_done
    goto rxscan954_scan
  rxscan954_loop:
    ($P10) = rx951_cur."from"()
    inc $P10
    set rx951_pos, $P10
    ge rx951_pos, rx951_eos, rxscan954_done
  rxscan954_scan:
    set_addr $I10, rxscan954_loop
    rx951_cur."!mark_push"(0, rx951_pos, $I10)
  rxscan954_done:
.annotate 'line', 438
  # rx enumcharlist negate=0 zerowidth
    ge rx951_pos, rx951_eos, rx951_fail
    sub $I10, rx951_pos, rx951_off
    substr $S10, rx951_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx951_fail
  # rx subrule "pblock" subtype=capture negate=
    rx951_cur."!cursor_pos"(rx951_pos)
    $P10 = rx951_cur."pblock"()
    unless $P10, rx951_fail
    rx951_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx951_pos = $P10."pos"()
  # rx pass
    rx951_cur."!cursor_pass"(rx951_pos, "circumfix:sym<{ }>")
    rx951_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx951_pos)
    .return (rx951_cur)
  rx951_fail:
.annotate 'line', 4
    (rx951_rep, rx951_pos, $I10, $P10) = rx951_cur."!mark_fail"(0)
    lt rx951_pos, -1, rx951_done
    eq rx951_pos, -1, rx951_fail
    jump $I10
  rx951_done:
    rx951_cur."!cursor_fail"()
    rx951_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx951_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("233_1275600007.84296") :method
.annotate 'line', 4
    new $P953, "ResizablePMCArray"
    push $P953, "{"
    .return ($P953)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("234_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx956_tgt
    .local int rx956_pos
    .local int rx956_off
    .local int rx956_eos
    .local int rx956_rep
    .local pmc rx956_cur
    (rx956_cur, rx956_pos, rx956_tgt) = self."!cursor_start"()
    rx956_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
    .lex unicode:"$\x{a2}", rx956_cur
    .local pmc match
    .lex "$/", match
    length rx956_eos, rx956_tgt
    gt rx956_pos, rx956_eos, rx956_done
    set rx956_off, 0
    lt rx956_pos, 2, rx956_start
    sub rx956_off, rx956_pos, 1
    substr rx956_tgt, rx956_tgt, rx956_off
  rx956_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan960_done
    goto rxscan960_scan
  rxscan960_loop:
    ($P10) = rx956_cur."from"()
    inc $P10
    set rx956_pos, $P10
    ge rx956_pos, rx956_eos, rxscan960_done
  rxscan960_scan:
    set_addr $I10, rxscan960_loop
    rx956_cur."!mark_push"(0, rx956_pos, $I10)
  rxscan960_done:
.annotate 'line', 439
  # rx subrule "sigil" subtype=capture negate=
    rx956_cur."!cursor_pos"(rx956_pos)
    $P10 = rx956_cur."sigil"()
    unless $P10, rx956_fail
    rx956_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx956_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx956_pos, 1
    gt $I11, rx956_eos, rx956_fail
    sub $I11, rx956_pos, rx956_off
    substr $S10, rx956_tgt, $I11, 1
    ne $S10, "(", rx956_fail
    add rx956_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx956_cur."!cursor_pos"(rx956_pos)
    $P10 = rx956_cur."semilist"()
    unless $P10, rx956_fail
    rx956_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx956_pos = $P10."pos"()
  alt961_0:
    set_addr $I10, alt961_1
    rx956_cur."!mark_push"(0, rx956_pos, $I10)
  # rx literal  ")"
    add $I11, rx956_pos, 1
    gt $I11, rx956_eos, rx956_fail
    sub $I11, rx956_pos, rx956_off
    substr $S10, rx956_tgt, $I11, 1
    ne $S10, ")", rx956_fail
    add rx956_pos, 1
    goto alt961_end
  alt961_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx956_cur."!cursor_pos"(rx956_pos)
    $P10 = rx956_cur."FAILGOAL"("')'")
    unless $P10, rx956_fail
    rx956_pos = $P10."pos"()
  alt961_end:
  # rx pass
    rx956_cur."!cursor_pass"(rx956_pos, "circumfix:sym<sigil>")
    rx956_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx956_pos)
    .return (rx956_cur)
  rx956_fail:
.annotate 'line', 4
    (rx956_rep, rx956_pos, $I10, $P10) = rx956_cur."!mark_fail"(0)
    lt rx956_pos, -1, rx956_done
    eq rx956_pos, -1, rx956_fail
    jump $I10
  rx956_done:
    rx956_cur."!cursor_fail"()
    rx956_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx956_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("235_1275600007.84296") :method
.annotate 'line', 4
    $P958 = self."!PREFIX__!subrule"("sigil", "")
    new $P959, "ResizablePMCArray"
    push $P959, $P958
    .return ($P959)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("236_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 4
    .local string rx964_tgt
    .local int rx964_pos
    .local int rx964_off
    .local int rx964_eos
    .local int rx964_rep
    .local pmc rx964_cur
    (rx964_cur, rx964_pos, rx964_tgt) = self."!cursor_start"()
    rx964_cur."!cursor_debug"("START ", "semilist")
    .lex unicode:"$\x{a2}", rx964_cur
    .local pmc match
    .lex "$/", match
    length rx964_eos, rx964_tgt
    gt rx964_pos, rx964_eos, rx964_done
    set rx964_off, 0
    lt rx964_pos, 2, rx964_start
    sub rx964_off, rx964_pos, 1
    substr rx964_tgt, rx964_tgt, rx964_off
  rx964_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan967_done
    goto rxscan967_scan
  rxscan967_loop:
    ($P10) = rx964_cur."from"()
    inc $P10
    set rx964_pos, $P10
    ge rx964_pos, rx964_eos, rxscan967_done
  rxscan967_scan:
    set_addr $I10, rxscan967_loop
    rx964_cur."!mark_push"(0, rx964_pos, $I10)
  rxscan967_done:
.annotate 'line', 441
  # rx subrule "ws" subtype=method negate=
    rx964_cur."!cursor_pos"(rx964_pos)
    $P10 = rx964_cur."ws"()
    unless $P10, rx964_fail
    rx964_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx964_cur."!cursor_pos"(rx964_pos)
    $P10 = rx964_cur."statement"()
    unless $P10, rx964_fail
    rx964_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx964_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx964_cur."!cursor_pos"(rx964_pos)
    $P10 = rx964_cur."ws"()
    unless $P10, rx964_fail
    rx964_pos = $P10."pos"()
  # rx pass
    rx964_cur."!cursor_pass"(rx964_pos, "semilist")
    rx964_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx964_pos)
    .return (rx964_cur)
  rx964_fail:
.annotate 'line', 4
    (rx964_rep, rx964_pos, $I10, $P10) = rx964_cur."!mark_fail"(0)
    lt rx964_pos, -1, rx964_done
    eq rx964_pos, -1, rx964_fail
    jump $I10
  rx964_done:
    rx964_cur."!cursor_fail"()
    rx964_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx964_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("237_1275600007.84296") :method
.annotate 'line', 4
    new $P966, "ResizablePMCArray"
    push $P966, ""
    .return ($P966)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("238_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx971_tgt
    .local int rx971_pos
    .local int rx971_off
    .local int rx971_eos
    .local int rx971_rep
    .local pmc rx971_cur
    (rx971_cur, rx971_pos, rx971_tgt) = self."!cursor_start"()
    rx971_cur."!cursor_debug"("START ", "infixish")
    .lex unicode:"$\x{a2}", rx971_cur
    .local pmc match
    .lex "$/", match
    length rx971_eos, rx971_tgt
    gt rx971_pos, rx971_eos, rx971_done
    set rx971_off, 0
    lt rx971_pos, 2, rx971_start
    sub rx971_off, rx971_pos, 1
    substr rx971_tgt, rx971_tgt, rx971_off
  rx971_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan974_done
    goto rxscan974_scan
  rxscan974_loop:
    ($P10) = rx971_cur."from"()
    inc $P10
    set rx971_pos, $P10
    ge rx971_pos, rx971_eos, rxscan974_done
  rxscan974_scan:
    set_addr $I10, rxscan974_loop
    rx971_cur."!mark_push"(0, rx971_pos, $I10)
  rxscan974_done:
.annotate 'line', 464
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx971_cur."!cursor_pos"(rx971_pos)
    $P10 = rx971_cur."infixstopper"()
    if $P10, rx971_fail
  # rx subrule "infix" subtype=capture negate=
    rx971_cur."!cursor_pos"(rx971_pos)
    $P10 = rx971_cur."infix"()
    unless $P10, rx971_fail
    rx971_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx971_pos = $P10."pos"()
  # rx pass
    rx971_cur."!cursor_pass"(rx971_pos, "infixish")
    rx971_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx971_pos)
    .return (rx971_cur)
  rx971_fail:
.annotate 'line', 445
    (rx971_rep, rx971_pos, $I10, $P10) = rx971_cur."!mark_fail"(0)
    lt rx971_pos, -1, rx971_done
    eq rx971_pos, -1, rx971_fail
    jump $I10
  rx971_done:
    rx971_cur."!cursor_fail"()
    rx971_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx971_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("239_1275600007.84296") :method
.annotate 'line', 445
    new $P973, "ResizablePMCArray"
    push $P973, ""
    .return ($P973)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("240_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx976_tgt
    .local int rx976_pos
    .local int rx976_off
    .local int rx976_eos
    .local int rx976_rep
    .local pmc rx976_cur
    (rx976_cur, rx976_pos, rx976_tgt) = self."!cursor_start"()
    rx976_cur."!cursor_debug"("START ", "infixstopper")
    .lex unicode:"$\x{a2}", rx976_cur
    .local pmc match
    .lex "$/", match
    length rx976_eos, rx976_tgt
    gt rx976_pos, rx976_eos, rx976_done
    set rx976_off, 0
    lt rx976_pos, 2, rx976_start
    sub rx976_off, rx976_pos, 1
    substr rx976_tgt, rx976_tgt, rx976_off
  rx976_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan979_done
    goto rxscan979_scan
  rxscan979_loop:
    ($P10) = rx976_cur."from"()
    inc $P10
    set rx976_pos, $P10
    ge rx976_pos, rx976_eos, rxscan979_done
  rxscan979_scan:
    set_addr $I10, rxscan979_loop
    rx976_cur."!mark_push"(0, rx976_pos, $I10)
  rxscan979_done:
.annotate 'line', 465
  # rx subrule "lambda" subtype=zerowidth negate=
    rx976_cur."!cursor_pos"(rx976_pos)
    $P10 = rx976_cur."lambda"()
    unless $P10, rx976_fail
  # rx pass
    rx976_cur."!cursor_pass"(rx976_pos, "infixstopper")
    rx976_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx976_pos)
    .return (rx976_cur)
  rx976_fail:
.annotate 'line', 445
    (rx976_rep, rx976_pos, $I10, $P10) = rx976_cur."!mark_fail"(0)
    lt rx976_pos, -1, rx976_done
    eq rx976_pos, -1, rx976_fail
    jump $I10
  rx976_done:
    rx976_cur."!cursor_fail"()
    rx976_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx976_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("241_1275600007.84296") :method
.annotate 'line', 445
    new $P978, "ResizablePMCArray"
    push $P978, ""
    .return ($P978)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("242_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx981_tgt
    .local int rx981_pos
    .local int rx981_off
    .local int rx981_eos
    .local int rx981_rep
    .local pmc rx981_cur
    (rx981_cur, rx981_pos, rx981_tgt) = self."!cursor_start"()
    rx981_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
    .lex unicode:"$\x{a2}", rx981_cur
    .local pmc match
    .lex "$/", match
    length rx981_eos, rx981_tgt
    gt rx981_pos, rx981_eos, rx981_done
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
.annotate 'line', 468
  # rx literal  "["
    add $I11, rx981_pos, 1
    gt $I11, rx981_eos, rx981_fail
    sub $I11, rx981_pos, rx981_off
    substr $S10, rx981_tgt, $I11, 1
    ne $S10, "[", rx981_fail
    add rx981_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx981_cur."!cursor_pos"(rx981_pos)
    $P10 = rx981_cur."ws"()
    unless $P10, rx981_fail
    rx981_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx981_cur."!cursor_pos"(rx981_pos)
    $P10 = rx981_cur."EXPR"()
    unless $P10, rx981_fail
    rx981_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx981_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx981_pos, 1
    gt $I11, rx981_eos, rx981_fail
    sub $I11, rx981_pos, rx981_off
    substr $S10, rx981_tgt, $I11, 1
    ne $S10, "]", rx981_fail
    add rx981_pos, 1
.annotate 'line', 469
  # rx subrule "O" subtype=capture negate=
    rx981_cur."!cursor_pos"(rx981_pos)
    $P10 = rx981_cur."O"("%methodop")
    unless $P10, rx981_fail
    rx981_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx981_pos = $P10."pos"()
.annotate 'line', 467
  # rx pass
    rx981_cur."!cursor_pass"(rx981_pos, "postcircumfix:sym<[ ]>")
    rx981_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx981_pos)
    .return (rx981_cur)
  rx981_fail:
.annotate 'line', 445
    (rx981_rep, rx981_pos, $I10, $P10) = rx981_cur."!mark_fail"(0)
    lt rx981_pos, -1, rx981_done
    eq rx981_pos, -1, rx981_fail
    jump $I10
  rx981_done:
    rx981_cur."!cursor_fail"()
    rx981_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx981_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("243_1275600007.84296") :method
.annotate 'line', 445
    $P983 = self."!PREFIX__!subrule"("", "[")
    new $P984, "ResizablePMCArray"
    push $P984, $P983
    .return ($P984)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("244_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx987_tgt
    .local int rx987_pos
    .local int rx987_off
    .local int rx987_eos
    .local int rx987_rep
    .local pmc rx987_cur
    (rx987_cur, rx987_pos, rx987_tgt) = self."!cursor_start"()
    rx987_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx987_cur
    .local pmc match
    .lex "$/", match
    length rx987_eos, rx987_tgt
    gt rx987_pos, rx987_eos, rx987_done
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
.annotate 'line', 473
  # rx literal  "{"
    add $I11, rx987_pos, 1
    gt $I11, rx987_eos, rx987_fail
    sub $I11, rx987_pos, rx987_off
    substr $S10, rx987_tgt, $I11, 1
    ne $S10, "{", rx987_fail
    add rx987_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx987_cur."!cursor_pos"(rx987_pos)
    $P10 = rx987_cur."ws"()
    unless $P10, rx987_fail
    rx987_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx987_cur."!cursor_pos"(rx987_pos)
    $P10 = rx987_cur."EXPR"()
    unless $P10, rx987_fail
    rx987_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx987_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx987_pos, 1
    gt $I11, rx987_eos, rx987_fail
    sub $I11, rx987_pos, rx987_off
    substr $S10, rx987_tgt, $I11, 1
    ne $S10, "}", rx987_fail
    add rx987_pos, 1
.annotate 'line', 474
  # rx subrule "O" subtype=capture negate=
    rx987_cur."!cursor_pos"(rx987_pos)
    $P10 = rx987_cur."O"("%methodop")
    unless $P10, rx987_fail
    rx987_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx987_pos = $P10."pos"()
.annotate 'line', 472
  # rx pass
    rx987_cur."!cursor_pass"(rx987_pos, "postcircumfix:sym<{ }>")
    rx987_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx987_pos)
    .return (rx987_cur)
  rx987_fail:
.annotate 'line', 445
    (rx987_rep, rx987_pos, $I10, $P10) = rx987_cur."!mark_fail"(0)
    lt rx987_pos, -1, rx987_done
    eq rx987_pos, -1, rx987_fail
    jump $I10
  rx987_done:
    rx987_cur."!cursor_fail"()
    rx987_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx987_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("245_1275600007.84296") :method
.annotate 'line', 445
    $P989 = self."!PREFIX__!subrule"("", "{")
    new $P990, "ResizablePMCArray"
    push $P990, $P989
    .return ($P990)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("246_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx993_tgt
    .local int rx993_pos
    .local int rx993_off
    .local int rx993_eos
    .local int rx993_rep
    .local pmc rx993_cur
    (rx993_cur, rx993_pos, rx993_tgt) = self."!cursor_start"()
    rx993_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx993_cur
    .local pmc match
    .lex "$/", match
    length rx993_eos, rx993_tgt
    gt rx993_pos, rx993_eos, rx993_done
    set rx993_off, 0
    lt rx993_pos, 2, rx993_start
    sub rx993_off, rx993_pos, 1
    substr rx993_tgt, rx993_tgt, rx993_off
  rx993_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan996_done
    goto rxscan996_scan
  rxscan996_loop:
    ($P10) = rx993_cur."from"()
    inc $P10
    set rx993_pos, $P10
    ge rx993_pos, rx993_eos, rxscan996_done
  rxscan996_scan:
    set_addr $I10, rxscan996_loop
    rx993_cur."!mark_push"(0, rx993_pos, $I10)
  rxscan996_done:
.annotate 'line', 478
  # rx enumcharlist negate=0 zerowidth
    ge rx993_pos, rx993_eos, rx993_fail
    sub $I10, rx993_pos, rx993_off
    substr $S10, rx993_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx993_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx993_cur."!cursor_pos"(rx993_pos)
    $P10 = rx993_cur."quote_EXPR"(":q")
    unless $P10, rx993_fail
    rx993_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx993_pos = $P10."pos"()
.annotate 'line', 479
  # rx subrule "O" subtype=capture negate=
    rx993_cur."!cursor_pos"(rx993_pos)
    $P10 = rx993_cur."O"("%methodop")
    unless $P10, rx993_fail
    rx993_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx993_pos = $P10."pos"()
.annotate 'line', 477
  # rx pass
    rx993_cur."!cursor_pass"(rx993_pos, "postcircumfix:sym<ang>")
    rx993_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx993_pos)
    .return (rx993_cur)
  rx993_fail:
.annotate 'line', 445
    (rx993_rep, rx993_pos, $I10, $P10) = rx993_cur."!mark_fail"(0)
    lt rx993_pos, -1, rx993_done
    eq rx993_pos, -1, rx993_fail
    jump $I10
  rx993_done:
    rx993_cur."!cursor_fail"()
    rx993_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx993_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("247_1275600007.84296") :method
.annotate 'line', 445
    new $P995, "ResizablePMCArray"
    push $P995, "<"
    .return ($P995)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("248_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx998_tgt
    .local int rx998_pos
    .local int rx998_off
    .local int rx998_eos
    .local int rx998_rep
    .local pmc rx998_cur
    (rx998_cur, rx998_pos, rx998_tgt) = self."!cursor_start"()
    rx998_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
    .lex unicode:"$\x{a2}", rx998_cur
    .local pmc match
    .lex "$/", match
    length rx998_eos, rx998_tgt
    gt rx998_pos, rx998_eos, rx998_done
    set rx998_off, 0
    lt rx998_pos, 2, rx998_start
    sub rx998_off, rx998_pos, 1
    substr rx998_tgt, rx998_tgt, rx998_off
  rx998_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1002_done
    goto rxscan1002_scan
  rxscan1002_loop:
    ($P10) = rx998_cur."from"()
    inc $P10
    set rx998_pos, $P10
    ge rx998_pos, rx998_eos, rxscan1002_done
  rxscan1002_scan:
    set_addr $I10, rxscan1002_loop
    rx998_cur."!mark_push"(0, rx998_pos, $I10)
  rxscan1002_done:
.annotate 'line', 483
  # rx literal  "("
    add $I11, rx998_pos, 1
    gt $I11, rx998_eos, rx998_fail
    sub $I11, rx998_pos, rx998_off
    substr $S10, rx998_tgt, $I11, 1
    ne $S10, "(", rx998_fail
    add rx998_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx998_cur."!cursor_pos"(rx998_pos)
    $P10 = rx998_cur."ws"()
    unless $P10, rx998_fail
    rx998_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx998_cur."!cursor_pos"(rx998_pos)
    $P10 = rx998_cur."arglist"()
    unless $P10, rx998_fail
    rx998_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx998_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx998_pos, 1
    gt $I11, rx998_eos, rx998_fail
    sub $I11, rx998_pos, rx998_off
    substr $S10, rx998_tgt, $I11, 1
    ne $S10, ")", rx998_fail
    add rx998_pos, 1
.annotate 'line', 484
  # rx subrule "O" subtype=capture negate=
    rx998_cur."!cursor_pos"(rx998_pos)
    $P10 = rx998_cur."O"("%methodop")
    unless $P10, rx998_fail
    rx998_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx998_pos = $P10."pos"()
.annotate 'line', 482
  # rx pass
    rx998_cur."!cursor_pass"(rx998_pos, "postcircumfix:sym<( )>")
    rx998_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx998_pos)
    .return (rx998_cur)
  rx998_fail:
.annotate 'line', 445
    (rx998_rep, rx998_pos, $I10, $P10) = rx998_cur."!mark_fail"(0)
    lt rx998_pos, -1, rx998_done
    eq rx998_pos, -1, rx998_fail
    jump $I10
  rx998_done:
    rx998_cur."!cursor_fail"()
    rx998_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx998_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("249_1275600007.84296") :method
.annotate 'line', 445
    $P1000 = self."!PREFIX__!subrule"("", "(")
    new $P1001, "ResizablePMCArray"
    push $P1001, $P1000
    .return ($P1001)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("250_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1004_tgt
    .local int rx1004_pos
    .local int rx1004_off
    .local int rx1004_eos
    .local int rx1004_rep
    .local pmc rx1004_cur
    (rx1004_cur, rx1004_pos, rx1004_tgt) = self."!cursor_start"()
    rx1004_cur."!cursor_debug"("START ", "postfix:sym<.>")
    .lex unicode:"$\x{a2}", rx1004_cur
    .local pmc match
    .lex "$/", match
    length rx1004_eos, rx1004_tgt
    gt rx1004_pos, rx1004_eos, rx1004_done
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
.annotate 'line', 487
  # rx subrule "dotty" subtype=capture negate=
    rx1004_cur."!cursor_pos"(rx1004_pos)
    $P10 = rx1004_cur."dotty"()
    unless $P10, rx1004_fail
    rx1004_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx1004_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx1004_cur."!cursor_pos"(rx1004_pos)
    $P10 = rx1004_cur."O"("%methodop")
    unless $P10, rx1004_fail
    rx1004_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1004_pos = $P10."pos"()
  # rx pass
    rx1004_cur."!cursor_pass"(rx1004_pos, "postfix:sym<.>")
    rx1004_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx1004_pos)
    .return (rx1004_cur)
  rx1004_fail:
.annotate 'line', 445
    (rx1004_rep, rx1004_pos, $I10, $P10) = rx1004_cur."!mark_fail"(0)
    lt rx1004_pos, -1, rx1004_done
    eq rx1004_pos, -1, rx1004_fail
    jump $I10
  rx1004_done:
    rx1004_cur."!cursor_fail"()
    rx1004_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx1004_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("251_1275600007.84296") :method
.annotate 'line', 445
    $P1006 = self."!PREFIX__!subrule"("dotty", "")
    new $P1007, "ResizablePMCArray"
    push $P1007, $P1006
    .return ($P1007)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("252_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1010_tgt
    .local int rx1010_pos
    .local int rx1010_off
    .local int rx1010_eos
    .local int rx1010_rep
    .local pmc rx1010_cur
    (rx1010_cur, rx1010_pos, rx1010_tgt) = self."!cursor_start"()
    rx1010_cur."!cursor_debug"("START ", "prefix:sym<++>")
    .lex unicode:"$\x{a2}", rx1010_cur
    .local pmc match
    .lex "$/", match
    length rx1010_eos, rx1010_tgt
    gt rx1010_pos, rx1010_eos, rx1010_done
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
.annotate 'line', 489
  # rx subcapture "sym"
    set_addr $I10, rxcap_1015_fail
    rx1010_cur."!mark_push"(0, rx1010_pos, $I10)
  # rx literal  "++"
    add $I11, rx1010_pos, 2
    gt $I11, rx1010_eos, rx1010_fail
    sub $I11, rx1010_pos, rx1010_off
    substr $S10, rx1010_tgt, $I11, 2
    ne $S10, "++", rx1010_fail
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
    $P10 = rx1010_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx1010_fail
    rx1010_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1010_pos = $P10."pos"()
  # rx pass
    rx1010_cur."!cursor_pass"(rx1010_pos, "prefix:sym<++>")
    rx1010_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx1010_pos)
    .return (rx1010_cur)
  rx1010_fail:
.annotate 'line', 445
    (rx1010_rep, rx1010_pos, $I10, $P10) = rx1010_cur."!mark_fail"(0)
    lt rx1010_pos, -1, rx1010_done
    eq rx1010_pos, -1, rx1010_fail
    jump $I10
  rx1010_done:
    rx1010_cur."!cursor_fail"()
    rx1010_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx1010_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("253_1275600007.84296") :method
.annotate 'line', 445
    $P1012 = self."!PREFIX__!subrule"("O", "++")
    new $P1013, "ResizablePMCArray"
    push $P1013, $P1012
    .return ($P1013)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("254_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1017_tgt
    .local int rx1017_pos
    .local int rx1017_off
    .local int rx1017_eos
    .local int rx1017_rep
    .local pmc rx1017_cur
    (rx1017_cur, rx1017_pos, rx1017_tgt) = self."!cursor_start"()
    rx1017_cur."!cursor_debug"("START ", "prefix:sym<-->")
    .lex unicode:"$\x{a2}", rx1017_cur
    .local pmc match
    .lex "$/", match
    length rx1017_eos, rx1017_tgt
    gt rx1017_pos, rx1017_eos, rx1017_done
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
.annotate 'line', 490
  # rx subcapture "sym"
    set_addr $I10, rxcap_1022_fail
    rx1017_cur."!mark_push"(0, rx1017_pos, $I10)
  # rx literal  "--"
    add $I11, rx1017_pos, 2
    gt $I11, rx1017_eos, rx1017_fail
    sub $I11, rx1017_pos, rx1017_off
    substr $S10, rx1017_tgt, $I11, 2
    ne $S10, "--", rx1017_fail
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
    $P10 = rx1017_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx1017_fail
    rx1017_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1017_pos = $P10."pos"()
  # rx pass
    rx1017_cur."!cursor_pass"(rx1017_pos, "prefix:sym<-->")
    rx1017_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx1017_pos)
    .return (rx1017_cur)
  rx1017_fail:
.annotate 'line', 445
    (rx1017_rep, rx1017_pos, $I10, $P10) = rx1017_cur."!mark_fail"(0)
    lt rx1017_pos, -1, rx1017_done
    eq rx1017_pos, -1, rx1017_fail
    jump $I10
  rx1017_done:
    rx1017_cur."!cursor_fail"()
    rx1017_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx1017_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("255_1275600007.84296") :method
.annotate 'line', 445
    $P1019 = self."!PREFIX__!subrule"("O", "--")
    new $P1020, "ResizablePMCArray"
    push $P1020, $P1019
    .return ($P1020)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("256_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1024_tgt
    .local int rx1024_pos
    .local int rx1024_off
    .local int rx1024_eos
    .local int rx1024_rep
    .local pmc rx1024_cur
    (rx1024_cur, rx1024_pos, rx1024_tgt) = self."!cursor_start"()
    rx1024_cur."!cursor_debug"("START ", "postfix:sym<++>")
    .lex unicode:"$\x{a2}", rx1024_cur
    .local pmc match
    .lex "$/", match
    length rx1024_eos, rx1024_tgt
    gt rx1024_pos, rx1024_eos, rx1024_done
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
.annotate 'line', 493
  # rx subcapture "sym"
    set_addr $I10, rxcap_1029_fail
    rx1024_cur."!mark_push"(0, rx1024_pos, $I10)
  # rx literal  "++"
    add $I11, rx1024_pos, 2
    gt $I11, rx1024_eos, rx1024_fail
    sub $I11, rx1024_pos, rx1024_off
    substr $S10, rx1024_tgt, $I11, 2
    ne $S10, "++", rx1024_fail
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
    $P10 = rx1024_cur."O"("%autoincrement")
    unless $P10, rx1024_fail
    rx1024_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1024_pos = $P10."pos"()
  # rx pass
    rx1024_cur."!cursor_pass"(rx1024_pos, "postfix:sym<++>")
    rx1024_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx1024_pos)
    .return (rx1024_cur)
  rx1024_fail:
.annotate 'line', 445
    (rx1024_rep, rx1024_pos, $I10, $P10) = rx1024_cur."!mark_fail"(0)
    lt rx1024_pos, -1, rx1024_done
    eq rx1024_pos, -1, rx1024_fail
    jump $I10
  rx1024_done:
    rx1024_cur."!cursor_fail"()
    rx1024_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx1024_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("257_1275600007.84296") :method
.annotate 'line', 445
    $P1026 = self."!PREFIX__!subrule"("O", "++")
    new $P1027, "ResizablePMCArray"
    push $P1027, $P1026
    .return ($P1027)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("258_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1031_tgt
    .local int rx1031_pos
    .local int rx1031_off
    .local int rx1031_eos
    .local int rx1031_rep
    .local pmc rx1031_cur
    (rx1031_cur, rx1031_pos, rx1031_tgt) = self."!cursor_start"()
    rx1031_cur."!cursor_debug"("START ", "postfix:sym<-->")
    .lex unicode:"$\x{a2}", rx1031_cur
    .local pmc match
    .lex "$/", match
    length rx1031_eos, rx1031_tgt
    gt rx1031_pos, rx1031_eos, rx1031_done
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
.annotate 'line', 494
  # rx subcapture "sym"
    set_addr $I10, rxcap_1036_fail
    rx1031_cur."!mark_push"(0, rx1031_pos, $I10)
  # rx literal  "--"
    add $I11, rx1031_pos, 2
    gt $I11, rx1031_eos, rx1031_fail
    sub $I11, rx1031_pos, rx1031_off
    substr $S10, rx1031_tgt, $I11, 2
    ne $S10, "--", rx1031_fail
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
    $P10 = rx1031_cur."O"("%autoincrement")
    unless $P10, rx1031_fail
    rx1031_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1031_pos = $P10."pos"()
  # rx pass
    rx1031_cur."!cursor_pass"(rx1031_pos, "postfix:sym<-->")
    rx1031_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx1031_pos)
    .return (rx1031_cur)
  rx1031_fail:
.annotate 'line', 445
    (rx1031_rep, rx1031_pos, $I10, $P10) = rx1031_cur."!mark_fail"(0)
    lt rx1031_pos, -1, rx1031_done
    eq rx1031_pos, -1, rx1031_fail
    jump $I10
  rx1031_done:
    rx1031_cur."!cursor_fail"()
    rx1031_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx1031_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("259_1275600007.84296") :method
.annotate 'line', 445
    $P1033 = self."!PREFIX__!subrule"("O", "--")
    new $P1034, "ResizablePMCArray"
    push $P1034, $P1033
    .return ($P1034)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("260_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1038_tgt
    .local int rx1038_pos
    .local int rx1038_off
    .local int rx1038_eos
    .local int rx1038_rep
    .local pmc rx1038_cur
    (rx1038_cur, rx1038_pos, rx1038_tgt) = self."!cursor_start"()
    rx1038_cur."!cursor_debug"("START ", "infix:sym<**>")
    .lex unicode:"$\x{a2}", rx1038_cur
    .local pmc match
    .lex "$/", match
    length rx1038_eos, rx1038_tgt
    gt rx1038_pos, rx1038_eos, rx1038_done
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
.annotate 'line', 496
  # rx subcapture "sym"
    set_addr $I10, rxcap_1043_fail
    rx1038_cur."!mark_push"(0, rx1038_pos, $I10)
  # rx literal  "**"
    add $I11, rx1038_pos, 2
    gt $I11, rx1038_eos, rx1038_fail
    sub $I11, rx1038_pos, rx1038_off
    substr $S10, rx1038_tgt, $I11, 2
    ne $S10, "**", rx1038_fail
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
    $P10 = rx1038_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx1038_fail
    rx1038_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1038_pos = $P10."pos"()
  # rx pass
    rx1038_cur."!cursor_pass"(rx1038_pos, "infix:sym<**>")
    rx1038_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx1038_pos)
    .return (rx1038_cur)
  rx1038_fail:
.annotate 'line', 445
    (rx1038_rep, rx1038_pos, $I10, $P10) = rx1038_cur."!mark_fail"(0)
    lt rx1038_pos, -1, rx1038_done
    eq rx1038_pos, -1, rx1038_fail
    jump $I10
  rx1038_done:
    rx1038_cur."!cursor_fail"()
    rx1038_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx1038_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("261_1275600007.84296") :method
.annotate 'line', 445
    $P1040 = self."!PREFIX__!subrule"("O", "**")
    new $P1041, "ResizablePMCArray"
    push $P1041, $P1040
    .return ($P1041)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("262_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1045_tgt
    .local int rx1045_pos
    .local int rx1045_off
    .local int rx1045_eos
    .local int rx1045_rep
    .local pmc rx1045_cur
    (rx1045_cur, rx1045_pos, rx1045_tgt) = self."!cursor_start"()
    rx1045_cur."!cursor_debug"("START ", "prefix:sym<+>")
    .lex unicode:"$\x{a2}", rx1045_cur
    .local pmc match
    .lex "$/", match
    length rx1045_eos, rx1045_tgt
    gt rx1045_pos, rx1045_eos, rx1045_done
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
.annotate 'line', 498
  # rx subcapture "sym"
    set_addr $I10, rxcap_1050_fail
    rx1045_cur."!mark_push"(0, rx1045_pos, $I10)
  # rx literal  "+"
    add $I11, rx1045_pos, 1
    gt $I11, rx1045_eos, rx1045_fail
    sub $I11, rx1045_pos, rx1045_off
    substr $S10, rx1045_tgt, $I11, 1
    ne $S10, "+", rx1045_fail
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
    $P10 = rx1045_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx1045_fail
    rx1045_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1045_pos = $P10."pos"()
  # rx pass
    rx1045_cur."!cursor_pass"(rx1045_pos, "prefix:sym<+>")
    rx1045_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx1045_pos)
    .return (rx1045_cur)
  rx1045_fail:
.annotate 'line', 445
    (rx1045_rep, rx1045_pos, $I10, $P10) = rx1045_cur."!mark_fail"(0)
    lt rx1045_pos, -1, rx1045_done
    eq rx1045_pos, -1, rx1045_fail
    jump $I10
  rx1045_done:
    rx1045_cur."!cursor_fail"()
    rx1045_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx1045_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("263_1275600007.84296") :method
.annotate 'line', 445
    $P1047 = self."!PREFIX__!subrule"("O", "+")
    new $P1048, "ResizablePMCArray"
    push $P1048, $P1047
    .return ($P1048)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("264_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1052_tgt
    .local int rx1052_pos
    .local int rx1052_off
    .local int rx1052_eos
    .local int rx1052_rep
    .local pmc rx1052_cur
    (rx1052_cur, rx1052_pos, rx1052_tgt) = self."!cursor_start"()
    rx1052_cur."!cursor_debug"("START ", "prefix:sym<~>")
    .lex unicode:"$\x{a2}", rx1052_cur
    .local pmc match
    .lex "$/", match
    length rx1052_eos, rx1052_tgt
    gt rx1052_pos, rx1052_eos, rx1052_done
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
.annotate 'line', 499
  # rx subcapture "sym"
    set_addr $I10, rxcap_1057_fail
    rx1052_cur."!mark_push"(0, rx1052_pos, $I10)
  # rx literal  "~"
    add $I11, rx1052_pos, 1
    gt $I11, rx1052_eos, rx1052_fail
    sub $I11, rx1052_pos, rx1052_off
    substr $S10, rx1052_tgt, $I11, 1
    ne $S10, "~", rx1052_fail
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
    $P10 = rx1052_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx1052_fail
    rx1052_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1052_pos = $P10."pos"()
  # rx pass
    rx1052_cur."!cursor_pass"(rx1052_pos, "prefix:sym<~>")
    rx1052_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx1052_pos)
    .return (rx1052_cur)
  rx1052_fail:
.annotate 'line', 445
    (rx1052_rep, rx1052_pos, $I10, $P10) = rx1052_cur."!mark_fail"(0)
    lt rx1052_pos, -1, rx1052_done
    eq rx1052_pos, -1, rx1052_fail
    jump $I10
  rx1052_done:
    rx1052_cur."!cursor_fail"()
    rx1052_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx1052_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("265_1275600007.84296") :method
.annotate 'line', 445
    $P1054 = self."!PREFIX__!subrule"("O", "~")
    new $P1055, "ResizablePMCArray"
    push $P1055, $P1054
    .return ($P1055)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("266_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1059_tgt
    .local int rx1059_pos
    .local int rx1059_off
    .local int rx1059_eos
    .local int rx1059_rep
    .local pmc rx1059_cur
    (rx1059_cur, rx1059_pos, rx1059_tgt) = self."!cursor_start"()
    rx1059_cur."!cursor_debug"("START ", "prefix:sym<->")
    .lex unicode:"$\x{a2}", rx1059_cur
    .local pmc match
    .lex "$/", match
    length rx1059_eos, rx1059_tgt
    gt rx1059_pos, rx1059_eos, rx1059_done
    set rx1059_off, 0
    lt rx1059_pos, 2, rx1059_start
    sub rx1059_off, rx1059_pos, 1
    substr rx1059_tgt, rx1059_tgt, rx1059_off
  rx1059_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1062_done
    goto rxscan1062_scan
  rxscan1062_loop:
    ($P10) = rx1059_cur."from"()
    inc $P10
    set rx1059_pos, $P10
    ge rx1059_pos, rx1059_eos, rxscan1062_done
  rxscan1062_scan:
    set_addr $I10, rxscan1062_loop
    rx1059_cur."!mark_push"(0, rx1059_pos, $I10)
  rxscan1062_done:
.annotate 'line', 500
  # rx subcapture "sym"
    set_addr $I10, rxcap_1063_fail
    rx1059_cur."!mark_push"(0, rx1059_pos, $I10)
  # rx literal  "-"
    add $I11, rx1059_pos, 1
    gt $I11, rx1059_eos, rx1059_fail
    sub $I11, rx1059_pos, rx1059_off
    substr $S10, rx1059_tgt, $I11, 1
    ne $S10, "-", rx1059_fail
    add rx1059_pos, 1
    set_addr $I10, rxcap_1063_fail
    ($I12, $I11) = rx1059_cur."!mark_peek"($I10)
    rx1059_cur."!cursor_pos"($I11)
    ($P10) = rx1059_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1059_pos, "")
    rx1059_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1063_done
  rxcap_1063_fail:
    goto rx1059_fail
  rxcap_1063_done:
  # rx enumcharlist negate=1 zerowidth
    ge rx1059_pos, rx1059_eos, rx1059_fail
    sub $I10, rx1059_pos, rx1059_off
    substr $S10, rx1059_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx1059_fail
  # rx subrule "number" subtype=zerowidth negate=1
    rx1059_cur."!cursor_pos"(rx1059_pos)
    $P10 = rx1059_cur."number"()
    if $P10, rx1059_fail
  # rx subrule "O" subtype=capture negate=
    rx1059_cur."!cursor_pos"(rx1059_pos)
    $P10 = rx1059_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx1059_fail
    rx1059_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1059_pos = $P10."pos"()
  # rx pass
    rx1059_cur."!cursor_pass"(rx1059_pos, "prefix:sym<->")
    rx1059_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx1059_pos)
    .return (rx1059_cur)
  rx1059_fail:
.annotate 'line', 445
    (rx1059_rep, rx1059_pos, $I10, $P10) = rx1059_cur."!mark_fail"(0)
    lt rx1059_pos, -1, rx1059_done
    eq rx1059_pos, -1, rx1059_fail
    jump $I10
  rx1059_done:
    rx1059_cur."!cursor_fail"()
    rx1059_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx1059_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("267_1275600007.84296") :method
.annotate 'line', 445
    new $P1061, "ResizablePMCArray"
    push $P1061, "-"
    .return ($P1061)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("268_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1065_tgt
    .local int rx1065_pos
    .local int rx1065_off
    .local int rx1065_eos
    .local int rx1065_rep
    .local pmc rx1065_cur
    (rx1065_cur, rx1065_pos, rx1065_tgt) = self."!cursor_start"()
    rx1065_cur."!cursor_debug"("START ", "prefix:sym<?>")
    .lex unicode:"$\x{a2}", rx1065_cur
    .local pmc match
    .lex "$/", match
    length rx1065_eos, rx1065_tgt
    gt rx1065_pos, rx1065_eos, rx1065_done
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
.annotate 'line', 501
  # rx subcapture "sym"
    set_addr $I10, rxcap_1070_fail
    rx1065_cur."!mark_push"(0, rx1065_pos, $I10)
  # rx literal  "?"
    add $I11, rx1065_pos, 1
    gt $I11, rx1065_eos, rx1065_fail
    sub $I11, rx1065_pos, rx1065_off
    substr $S10, rx1065_tgt, $I11, 1
    ne $S10, "?", rx1065_fail
    add rx1065_pos, 1
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
    $P10 = rx1065_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx1065_fail
    rx1065_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1065_pos = $P10."pos"()
  # rx pass
    rx1065_cur."!cursor_pass"(rx1065_pos, "prefix:sym<?>")
    rx1065_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx1065_pos)
    .return (rx1065_cur)
  rx1065_fail:
.annotate 'line', 445
    (rx1065_rep, rx1065_pos, $I10, $P10) = rx1065_cur."!mark_fail"(0)
    lt rx1065_pos, -1, rx1065_done
    eq rx1065_pos, -1, rx1065_fail
    jump $I10
  rx1065_done:
    rx1065_cur."!cursor_fail"()
    rx1065_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx1065_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("269_1275600007.84296") :method
.annotate 'line', 445
    $P1067 = self."!PREFIX__!subrule"("O", "?")
    new $P1068, "ResizablePMCArray"
    push $P1068, $P1067
    .return ($P1068)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("270_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1072_tgt
    .local int rx1072_pos
    .local int rx1072_off
    .local int rx1072_eos
    .local int rx1072_rep
    .local pmc rx1072_cur
    (rx1072_cur, rx1072_pos, rx1072_tgt) = self."!cursor_start"()
    rx1072_cur."!cursor_debug"("START ", "prefix:sym<!>")
    .lex unicode:"$\x{a2}", rx1072_cur
    .local pmc match
    .lex "$/", match
    length rx1072_eos, rx1072_tgt
    gt rx1072_pos, rx1072_eos, rx1072_done
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
.annotate 'line', 502
  # rx subcapture "sym"
    set_addr $I10, rxcap_1077_fail
    rx1072_cur."!mark_push"(0, rx1072_pos, $I10)
  # rx literal  "!"
    add $I11, rx1072_pos, 1
    gt $I11, rx1072_eos, rx1072_fail
    sub $I11, rx1072_pos, rx1072_off
    substr $S10, rx1072_tgt, $I11, 1
    ne $S10, "!", rx1072_fail
    add rx1072_pos, 1
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
    $P10 = rx1072_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx1072_fail
    rx1072_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1072_pos = $P10."pos"()
  # rx pass
    rx1072_cur."!cursor_pass"(rx1072_pos, "prefix:sym<!>")
    rx1072_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx1072_pos)
    .return (rx1072_cur)
  rx1072_fail:
.annotate 'line', 445
    (rx1072_rep, rx1072_pos, $I10, $P10) = rx1072_cur."!mark_fail"(0)
    lt rx1072_pos, -1, rx1072_done
    eq rx1072_pos, -1, rx1072_fail
    jump $I10
  rx1072_done:
    rx1072_cur."!cursor_fail"()
    rx1072_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx1072_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("271_1275600007.84296") :method
.annotate 'line', 445
    $P1074 = self."!PREFIX__!subrule"("O", "!")
    new $P1075, "ResizablePMCArray"
    push $P1075, $P1074
    .return ($P1075)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("272_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1079_tgt
    .local int rx1079_pos
    .local int rx1079_off
    .local int rx1079_eos
    .local int rx1079_rep
    .local pmc rx1079_cur
    (rx1079_cur, rx1079_pos, rx1079_tgt) = self."!cursor_start"()
    rx1079_cur."!cursor_debug"("START ", "prefix:sym<|>")
    .lex unicode:"$\x{a2}", rx1079_cur
    .local pmc match
    .lex "$/", match
    length rx1079_eos, rx1079_tgt
    gt rx1079_pos, rx1079_eos, rx1079_done
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
.annotate 'line', 503
  # rx subcapture "sym"
    set_addr $I10, rxcap_1084_fail
    rx1079_cur."!mark_push"(0, rx1079_pos, $I10)
  # rx literal  "|"
    add $I11, rx1079_pos, 1
    gt $I11, rx1079_eos, rx1079_fail
    sub $I11, rx1079_pos, rx1079_off
    substr $S10, rx1079_tgt, $I11, 1
    ne $S10, "|", rx1079_fail
    add rx1079_pos, 1
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
    $P10 = rx1079_cur."O"("%symbolic_unary")
    unless $P10, rx1079_fail
    rx1079_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1079_pos = $P10."pos"()
  # rx pass
    rx1079_cur."!cursor_pass"(rx1079_pos, "prefix:sym<|>")
    rx1079_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx1079_pos)
    .return (rx1079_cur)
  rx1079_fail:
.annotate 'line', 445
    (rx1079_rep, rx1079_pos, $I10, $P10) = rx1079_cur."!mark_fail"(0)
    lt rx1079_pos, -1, rx1079_done
    eq rx1079_pos, -1, rx1079_fail
    jump $I10
  rx1079_done:
    rx1079_cur."!cursor_fail"()
    rx1079_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx1079_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("273_1275600007.84296") :method
.annotate 'line', 445
    $P1081 = self."!PREFIX__!subrule"("O", "|")
    new $P1082, "ResizablePMCArray"
    push $P1082, $P1081
    .return ($P1082)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("274_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1086_tgt
    .local int rx1086_pos
    .local int rx1086_off
    .local int rx1086_eos
    .local int rx1086_rep
    .local pmc rx1086_cur
    (rx1086_cur, rx1086_pos, rx1086_tgt) = self."!cursor_start"()
    rx1086_cur."!cursor_debug"("START ", "infix:sym<*>")
    .lex unicode:"$\x{a2}", rx1086_cur
    .local pmc match
    .lex "$/", match
    length rx1086_eos, rx1086_tgt
    gt rx1086_pos, rx1086_eos, rx1086_done
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
.annotate 'line', 505
  # rx subcapture "sym"
    set_addr $I10, rxcap_1091_fail
    rx1086_cur."!mark_push"(0, rx1086_pos, $I10)
  # rx literal  "*"
    add $I11, rx1086_pos, 1
    gt $I11, rx1086_eos, rx1086_fail
    sub $I11, rx1086_pos, rx1086_off
    substr $S10, rx1086_tgt, $I11, 1
    ne $S10, "*", rx1086_fail
    add rx1086_pos, 1
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
    $P10 = rx1086_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx1086_fail
    rx1086_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1086_pos = $P10."pos"()
  # rx pass
    rx1086_cur."!cursor_pass"(rx1086_pos, "infix:sym<*>")
    rx1086_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx1086_pos)
    .return (rx1086_cur)
  rx1086_fail:
.annotate 'line', 445
    (rx1086_rep, rx1086_pos, $I10, $P10) = rx1086_cur."!mark_fail"(0)
    lt rx1086_pos, -1, rx1086_done
    eq rx1086_pos, -1, rx1086_fail
    jump $I10
  rx1086_done:
    rx1086_cur."!cursor_fail"()
    rx1086_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx1086_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("275_1275600007.84296") :method
.annotate 'line', 445
    $P1088 = self."!PREFIX__!subrule"("O", "*")
    new $P1089, "ResizablePMCArray"
    push $P1089, $P1088
    .return ($P1089)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("276_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1093_tgt
    .local int rx1093_pos
    .local int rx1093_off
    .local int rx1093_eos
    .local int rx1093_rep
    .local pmc rx1093_cur
    (rx1093_cur, rx1093_pos, rx1093_tgt) = self."!cursor_start"()
    rx1093_cur."!cursor_debug"("START ", "infix:sym</>")
    .lex unicode:"$\x{a2}", rx1093_cur
    .local pmc match
    .lex "$/", match
    length rx1093_eos, rx1093_tgt
    gt rx1093_pos, rx1093_eos, rx1093_done
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
.annotate 'line', 506
  # rx subcapture "sym"
    set_addr $I10, rxcap_1098_fail
    rx1093_cur."!mark_push"(0, rx1093_pos, $I10)
  # rx literal  "/"
    add $I11, rx1093_pos, 1
    gt $I11, rx1093_eos, rx1093_fail
    sub $I11, rx1093_pos, rx1093_off
    substr $S10, rx1093_tgt, $I11, 1
    ne $S10, "/", rx1093_fail
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
    $P10 = rx1093_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx1093_fail
    rx1093_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1093_pos = $P10."pos"()
  # rx pass
    rx1093_cur."!cursor_pass"(rx1093_pos, "infix:sym</>")
    rx1093_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx1093_pos)
    .return (rx1093_cur)
  rx1093_fail:
.annotate 'line', 445
    (rx1093_rep, rx1093_pos, $I10, $P10) = rx1093_cur."!mark_fail"(0)
    lt rx1093_pos, -1, rx1093_done
    eq rx1093_pos, -1, rx1093_fail
    jump $I10
  rx1093_done:
    rx1093_cur."!cursor_fail"()
    rx1093_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx1093_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("277_1275600007.84296") :method
.annotate 'line', 445
    $P1095 = self."!PREFIX__!subrule"("O", "/")
    new $P1096, "ResizablePMCArray"
    push $P1096, $P1095
    .return ($P1096)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("278_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1100_tgt
    .local int rx1100_pos
    .local int rx1100_off
    .local int rx1100_eos
    .local int rx1100_rep
    .local pmc rx1100_cur
    (rx1100_cur, rx1100_pos, rx1100_tgt) = self."!cursor_start"()
    rx1100_cur."!cursor_debug"("START ", "infix:sym<%>")
    .lex unicode:"$\x{a2}", rx1100_cur
    .local pmc match
    .lex "$/", match
    length rx1100_eos, rx1100_tgt
    gt rx1100_pos, rx1100_eos, rx1100_done
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
.annotate 'line', 507
  # rx subcapture "sym"
    set_addr $I10, rxcap_1105_fail
    rx1100_cur."!mark_push"(0, rx1100_pos, $I10)
  # rx literal  "%"
    add $I11, rx1100_pos, 1
    gt $I11, rx1100_eos, rx1100_fail
    sub $I11, rx1100_pos, rx1100_off
    substr $S10, rx1100_tgt, $I11, 1
    ne $S10, "%", rx1100_fail
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
    $P10 = rx1100_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx1100_fail
    rx1100_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1100_pos = $P10."pos"()
  # rx pass
    rx1100_cur."!cursor_pass"(rx1100_pos, "infix:sym<%>")
    rx1100_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx1100_pos)
    .return (rx1100_cur)
  rx1100_fail:
.annotate 'line', 445
    (rx1100_rep, rx1100_pos, $I10, $P10) = rx1100_cur."!mark_fail"(0)
    lt rx1100_pos, -1, rx1100_done
    eq rx1100_pos, -1, rx1100_fail
    jump $I10
  rx1100_done:
    rx1100_cur."!cursor_fail"()
    rx1100_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx1100_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("279_1275600007.84296") :method
.annotate 'line', 445
    $P1102 = self."!PREFIX__!subrule"("O", "%")
    new $P1103, "ResizablePMCArray"
    push $P1103, $P1102
    .return ($P1103)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("280_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1107_tgt
    .local int rx1107_pos
    .local int rx1107_off
    .local int rx1107_eos
    .local int rx1107_rep
    .local pmc rx1107_cur
    (rx1107_cur, rx1107_pos, rx1107_tgt) = self."!cursor_start"()
    rx1107_cur."!cursor_debug"("START ", "infix:sym<+>")
    .lex unicode:"$\x{a2}", rx1107_cur
    .local pmc match
    .lex "$/", match
    length rx1107_eos, rx1107_tgt
    gt rx1107_pos, rx1107_eos, rx1107_done
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
.annotate 'line', 509
  # rx subcapture "sym"
    set_addr $I10, rxcap_1112_fail
    rx1107_cur."!mark_push"(0, rx1107_pos, $I10)
  # rx literal  "+"
    add $I11, rx1107_pos, 1
    gt $I11, rx1107_eos, rx1107_fail
    sub $I11, rx1107_pos, rx1107_off
    substr $S10, rx1107_tgt, $I11, 1
    ne $S10, "+", rx1107_fail
    add rx1107_pos, 1
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
    $P10 = rx1107_cur."O"("%additive, :pirop<add>")
    unless $P10, rx1107_fail
    rx1107_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1107_pos = $P10."pos"()
  # rx pass
    rx1107_cur."!cursor_pass"(rx1107_pos, "infix:sym<+>")
    rx1107_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx1107_pos)
    .return (rx1107_cur)
  rx1107_fail:
.annotate 'line', 445
    (rx1107_rep, rx1107_pos, $I10, $P10) = rx1107_cur."!mark_fail"(0)
    lt rx1107_pos, -1, rx1107_done
    eq rx1107_pos, -1, rx1107_fail
    jump $I10
  rx1107_done:
    rx1107_cur."!cursor_fail"()
    rx1107_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx1107_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("281_1275600007.84296") :method
.annotate 'line', 445
    $P1109 = self."!PREFIX__!subrule"("O", "+")
    new $P1110, "ResizablePMCArray"
    push $P1110, $P1109
    .return ($P1110)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("282_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1114_tgt
    .local int rx1114_pos
    .local int rx1114_off
    .local int rx1114_eos
    .local int rx1114_rep
    .local pmc rx1114_cur
    (rx1114_cur, rx1114_pos, rx1114_tgt) = self."!cursor_start"()
    rx1114_cur."!cursor_debug"("START ", "infix:sym<->")
    .lex unicode:"$\x{a2}", rx1114_cur
    .local pmc match
    .lex "$/", match
    length rx1114_eos, rx1114_tgt
    gt rx1114_pos, rx1114_eos, rx1114_done
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
.annotate 'line', 510
  # rx subcapture "sym"
    set_addr $I10, rxcap_1119_fail
    rx1114_cur."!mark_push"(0, rx1114_pos, $I10)
  # rx literal  "-"
    add $I11, rx1114_pos, 1
    gt $I11, rx1114_eos, rx1114_fail
    sub $I11, rx1114_pos, rx1114_off
    substr $S10, rx1114_tgt, $I11, 1
    ne $S10, "-", rx1114_fail
    add rx1114_pos, 1
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
    $P10 = rx1114_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx1114_fail
    rx1114_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1114_pos = $P10."pos"()
  # rx pass
    rx1114_cur."!cursor_pass"(rx1114_pos, "infix:sym<->")
    rx1114_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx1114_pos)
    .return (rx1114_cur)
  rx1114_fail:
.annotate 'line', 445
    (rx1114_rep, rx1114_pos, $I10, $P10) = rx1114_cur."!mark_fail"(0)
    lt rx1114_pos, -1, rx1114_done
    eq rx1114_pos, -1, rx1114_fail
    jump $I10
  rx1114_done:
    rx1114_cur."!cursor_fail"()
    rx1114_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx1114_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("283_1275600007.84296") :method
.annotate 'line', 445
    $P1116 = self."!PREFIX__!subrule"("O", "-")
    new $P1117, "ResizablePMCArray"
    push $P1117, $P1116
    .return ($P1117)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("284_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1121_tgt
    .local int rx1121_pos
    .local int rx1121_off
    .local int rx1121_eos
    .local int rx1121_rep
    .local pmc rx1121_cur
    (rx1121_cur, rx1121_pos, rx1121_tgt) = self."!cursor_start"()
    rx1121_cur."!cursor_debug"("START ", "infix:sym<~>")
    .lex unicode:"$\x{a2}", rx1121_cur
    .local pmc match
    .lex "$/", match
    length rx1121_eos, rx1121_tgt
    gt rx1121_pos, rx1121_eos, rx1121_done
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
.annotate 'line', 512
  # rx subcapture "sym"
    set_addr $I10, rxcap_1126_fail
    rx1121_cur."!mark_push"(0, rx1121_pos, $I10)
  # rx literal  "~"
    add $I11, rx1121_pos, 1
    gt $I11, rx1121_eos, rx1121_fail
    sub $I11, rx1121_pos, rx1121_off
    substr $S10, rx1121_tgt, $I11, 1
    ne $S10, "~", rx1121_fail
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
  # rx subrule "O" subtype=capture negate=
    rx1121_cur."!cursor_pos"(rx1121_pos)
    $P10 = rx1121_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx1121_fail
    rx1121_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1121_pos = $P10."pos"()
  # rx pass
    rx1121_cur."!cursor_pass"(rx1121_pos, "infix:sym<~>")
    rx1121_cur."!cursor_debug"("PASS  ", "infix:sym<~>", " at pos=", rx1121_pos)
    .return (rx1121_cur)
  rx1121_fail:
.annotate 'line', 445
    (rx1121_rep, rx1121_pos, $I10, $P10) = rx1121_cur."!mark_fail"(0)
    lt rx1121_pos, -1, rx1121_done
    eq rx1121_pos, -1, rx1121_fail
    jump $I10
  rx1121_done:
    rx1121_cur."!cursor_fail"()
    rx1121_cur."!cursor_debug"("FAIL  ", "infix:sym<~>")
    .return (rx1121_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("285_1275600007.84296") :method
.annotate 'line', 445
    $P1123 = self."!PREFIX__!subrule"("O", "~")
    new $P1124, "ResizablePMCArray"
    push $P1124, $P1123
    .return ($P1124)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("286_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1128_tgt
    .local int rx1128_pos
    .local int rx1128_off
    .local int rx1128_eos
    .local int rx1128_rep
    .local pmc rx1128_cur
    (rx1128_cur, rx1128_pos, rx1128_tgt) = self."!cursor_start"()
    rx1128_cur."!cursor_debug"("START ", "infix:sym<==>")
    .lex unicode:"$\x{a2}", rx1128_cur
    .local pmc match
    .lex "$/", match
    length rx1128_eos, rx1128_tgt
    gt rx1128_pos, rx1128_eos, rx1128_done
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
.annotate 'line', 514
  # rx subcapture "sym"
    set_addr $I10, rxcap_1133_fail
    rx1128_cur."!mark_push"(0, rx1128_pos, $I10)
  # rx literal  "=="
    add $I11, rx1128_pos, 2
    gt $I11, rx1128_eos, rx1128_fail
    sub $I11, rx1128_pos, rx1128_off
    substr $S10, rx1128_tgt, $I11, 2
    ne $S10, "==", rx1128_fail
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
    $P10 = rx1128_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx1128_fail
    rx1128_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1128_pos = $P10."pos"()
  # rx pass
    rx1128_cur."!cursor_pass"(rx1128_pos, "infix:sym<==>")
    rx1128_cur."!cursor_debug"("PASS  ", "infix:sym<==>", " at pos=", rx1128_pos)
    .return (rx1128_cur)
  rx1128_fail:
.annotate 'line', 445
    (rx1128_rep, rx1128_pos, $I10, $P10) = rx1128_cur."!mark_fail"(0)
    lt rx1128_pos, -1, rx1128_done
    eq rx1128_pos, -1, rx1128_fail
    jump $I10
  rx1128_done:
    rx1128_cur."!cursor_fail"()
    rx1128_cur."!cursor_debug"("FAIL  ", "infix:sym<==>")
    .return (rx1128_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("287_1275600007.84296") :method
.annotate 'line', 445
    $P1130 = self."!PREFIX__!subrule"("O", "==")
    new $P1131, "ResizablePMCArray"
    push $P1131, $P1130
    .return ($P1131)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("288_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1135_tgt
    .local int rx1135_pos
    .local int rx1135_off
    .local int rx1135_eos
    .local int rx1135_rep
    .local pmc rx1135_cur
    (rx1135_cur, rx1135_pos, rx1135_tgt) = self."!cursor_start"()
    rx1135_cur."!cursor_debug"("START ", "infix:sym<!=>")
    .lex unicode:"$\x{a2}", rx1135_cur
    .local pmc match
    .lex "$/", match
    length rx1135_eos, rx1135_tgt
    gt rx1135_pos, rx1135_eos, rx1135_done
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
.annotate 'line', 515
  # rx subcapture "sym"
    set_addr $I10, rxcap_1140_fail
    rx1135_cur."!mark_push"(0, rx1135_pos, $I10)
  # rx literal  "!="
    add $I11, rx1135_pos, 2
    gt $I11, rx1135_eos, rx1135_fail
    sub $I11, rx1135_pos, rx1135_off
    substr $S10, rx1135_tgt, $I11, 2
    ne $S10, "!=", rx1135_fail
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
    $P10 = rx1135_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx1135_fail
    rx1135_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1135_pos = $P10."pos"()
  # rx pass
    rx1135_cur."!cursor_pass"(rx1135_pos, "infix:sym<!=>")
    rx1135_cur."!cursor_debug"("PASS  ", "infix:sym<!=>", " at pos=", rx1135_pos)
    .return (rx1135_cur)
  rx1135_fail:
.annotate 'line', 445
    (rx1135_rep, rx1135_pos, $I10, $P10) = rx1135_cur."!mark_fail"(0)
    lt rx1135_pos, -1, rx1135_done
    eq rx1135_pos, -1, rx1135_fail
    jump $I10
  rx1135_done:
    rx1135_cur."!cursor_fail"()
    rx1135_cur."!cursor_debug"("FAIL  ", "infix:sym<!=>")
    .return (rx1135_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("289_1275600007.84296") :method
.annotate 'line', 445
    $P1137 = self."!PREFIX__!subrule"("O", "!=")
    new $P1138, "ResizablePMCArray"
    push $P1138, $P1137
    .return ($P1138)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("290_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1142_tgt
    .local int rx1142_pos
    .local int rx1142_off
    .local int rx1142_eos
    .local int rx1142_rep
    .local pmc rx1142_cur
    (rx1142_cur, rx1142_pos, rx1142_tgt) = self."!cursor_start"()
    rx1142_cur."!cursor_debug"("START ", "infix:sym<<=>")
    .lex unicode:"$\x{a2}", rx1142_cur
    .local pmc match
    .lex "$/", match
    length rx1142_eos, rx1142_tgt
    gt rx1142_pos, rx1142_eos, rx1142_done
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
.annotate 'line', 516
  # rx subcapture "sym"
    set_addr $I10, rxcap_1147_fail
    rx1142_cur."!mark_push"(0, rx1142_pos, $I10)
  # rx literal  "<="
    add $I11, rx1142_pos, 2
    gt $I11, rx1142_eos, rx1142_fail
    sub $I11, rx1142_pos, rx1142_off
    substr $S10, rx1142_tgt, $I11, 2
    ne $S10, "<=", rx1142_fail
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
    $P10 = rx1142_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx1142_fail
    rx1142_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1142_pos = $P10."pos"()
  # rx pass
    rx1142_cur."!cursor_pass"(rx1142_pos, "infix:sym<<=>")
    rx1142_cur."!cursor_debug"("PASS  ", "infix:sym<<=>", " at pos=", rx1142_pos)
    .return (rx1142_cur)
  rx1142_fail:
.annotate 'line', 445
    (rx1142_rep, rx1142_pos, $I10, $P10) = rx1142_cur."!mark_fail"(0)
    lt rx1142_pos, -1, rx1142_done
    eq rx1142_pos, -1, rx1142_fail
    jump $I10
  rx1142_done:
    rx1142_cur."!cursor_fail"()
    rx1142_cur."!cursor_debug"("FAIL  ", "infix:sym<<=>")
    .return (rx1142_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("291_1275600007.84296") :method
.annotate 'line', 445
    $P1144 = self."!PREFIX__!subrule"("O", "<=")
    new $P1145, "ResizablePMCArray"
    push $P1145, $P1144
    .return ($P1145)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("292_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1149_tgt
    .local int rx1149_pos
    .local int rx1149_off
    .local int rx1149_eos
    .local int rx1149_rep
    .local pmc rx1149_cur
    (rx1149_cur, rx1149_pos, rx1149_tgt) = self."!cursor_start"()
    rx1149_cur."!cursor_debug"("START ", "infix:sym<>=>")
    .lex unicode:"$\x{a2}", rx1149_cur
    .local pmc match
    .lex "$/", match
    length rx1149_eos, rx1149_tgt
    gt rx1149_pos, rx1149_eos, rx1149_done
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
.annotate 'line', 517
  # rx subcapture "sym"
    set_addr $I10, rxcap_1154_fail
    rx1149_cur."!mark_push"(0, rx1149_pos, $I10)
  # rx literal  ">="
    add $I11, rx1149_pos, 2
    gt $I11, rx1149_eos, rx1149_fail
    sub $I11, rx1149_pos, rx1149_off
    substr $S10, rx1149_tgt, $I11, 2
    ne $S10, ">=", rx1149_fail
    add rx1149_pos, 2
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
    $P10 = rx1149_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx1149_fail
    rx1149_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1149_pos = $P10."pos"()
  # rx pass
    rx1149_cur."!cursor_pass"(rx1149_pos, "infix:sym<>=>")
    rx1149_cur."!cursor_debug"("PASS  ", "infix:sym<>=>", " at pos=", rx1149_pos)
    .return (rx1149_cur)
  rx1149_fail:
.annotate 'line', 445
    (rx1149_rep, rx1149_pos, $I10, $P10) = rx1149_cur."!mark_fail"(0)
    lt rx1149_pos, -1, rx1149_done
    eq rx1149_pos, -1, rx1149_fail
    jump $I10
  rx1149_done:
    rx1149_cur."!cursor_fail"()
    rx1149_cur."!cursor_debug"("FAIL  ", "infix:sym<>=>")
    .return (rx1149_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("293_1275600007.84296") :method
.annotate 'line', 445
    $P1151 = self."!PREFIX__!subrule"("O", ">=")
    new $P1152, "ResizablePMCArray"
    push $P1152, $P1151
    .return ($P1152)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("294_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1156_tgt
    .local int rx1156_pos
    .local int rx1156_off
    .local int rx1156_eos
    .local int rx1156_rep
    .local pmc rx1156_cur
    (rx1156_cur, rx1156_pos, rx1156_tgt) = self."!cursor_start"()
    rx1156_cur."!cursor_debug"("START ", "infix:sym<<>")
    .lex unicode:"$\x{a2}", rx1156_cur
    .local pmc match
    .lex "$/", match
    length rx1156_eos, rx1156_tgt
    gt rx1156_pos, rx1156_eos, rx1156_done
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
.annotate 'line', 518
  # rx subcapture "sym"
    set_addr $I10, rxcap_1161_fail
    rx1156_cur."!mark_push"(0, rx1156_pos, $I10)
  # rx literal  "<"
    add $I11, rx1156_pos, 1
    gt $I11, rx1156_eos, rx1156_fail
    sub $I11, rx1156_pos, rx1156_off
    substr $S10, rx1156_tgt, $I11, 1
    ne $S10, "<", rx1156_fail
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
    $P10 = rx1156_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx1156_fail
    rx1156_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1156_pos = $P10."pos"()
  # rx pass
    rx1156_cur."!cursor_pass"(rx1156_pos, "infix:sym<<>")
    rx1156_cur."!cursor_debug"("PASS  ", "infix:sym<<>", " at pos=", rx1156_pos)
    .return (rx1156_cur)
  rx1156_fail:
.annotate 'line', 445
    (rx1156_rep, rx1156_pos, $I10, $P10) = rx1156_cur."!mark_fail"(0)
    lt rx1156_pos, -1, rx1156_done
    eq rx1156_pos, -1, rx1156_fail
    jump $I10
  rx1156_done:
    rx1156_cur."!cursor_fail"()
    rx1156_cur."!cursor_debug"("FAIL  ", "infix:sym<<>")
    .return (rx1156_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("295_1275600007.84296") :method
.annotate 'line', 445
    $P1158 = self."!PREFIX__!subrule"("O", "<")
    new $P1159, "ResizablePMCArray"
    push $P1159, $P1158
    .return ($P1159)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("296_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1163_tgt
    .local int rx1163_pos
    .local int rx1163_off
    .local int rx1163_eos
    .local int rx1163_rep
    .local pmc rx1163_cur
    (rx1163_cur, rx1163_pos, rx1163_tgt) = self."!cursor_start"()
    rx1163_cur."!cursor_debug"("START ", "infix:sym<>>")
    .lex unicode:"$\x{a2}", rx1163_cur
    .local pmc match
    .lex "$/", match
    length rx1163_eos, rx1163_tgt
    gt rx1163_pos, rx1163_eos, rx1163_done
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
.annotate 'line', 519
  # rx subcapture "sym"
    set_addr $I10, rxcap_1168_fail
    rx1163_cur."!mark_push"(0, rx1163_pos, $I10)
  # rx literal  ">"
    add $I11, rx1163_pos, 1
    gt $I11, rx1163_eos, rx1163_fail
    sub $I11, rx1163_pos, rx1163_off
    substr $S10, rx1163_tgt, $I11, 1
    ne $S10, ">", rx1163_fail
    add rx1163_pos, 1
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
    $P10 = rx1163_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx1163_fail
    rx1163_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1163_pos = $P10."pos"()
  # rx pass
    rx1163_cur."!cursor_pass"(rx1163_pos, "infix:sym<>>")
    rx1163_cur."!cursor_debug"("PASS  ", "infix:sym<>>", " at pos=", rx1163_pos)
    .return (rx1163_cur)
  rx1163_fail:
.annotate 'line', 445
    (rx1163_rep, rx1163_pos, $I10, $P10) = rx1163_cur."!mark_fail"(0)
    lt rx1163_pos, -1, rx1163_done
    eq rx1163_pos, -1, rx1163_fail
    jump $I10
  rx1163_done:
    rx1163_cur."!cursor_fail"()
    rx1163_cur."!cursor_debug"("FAIL  ", "infix:sym<>>")
    .return (rx1163_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("297_1275600007.84296") :method
.annotate 'line', 445
    $P1165 = self."!PREFIX__!subrule"("O", ">")
    new $P1166, "ResizablePMCArray"
    push $P1166, $P1165
    .return ($P1166)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("298_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1170_tgt
    .local int rx1170_pos
    .local int rx1170_off
    .local int rx1170_eos
    .local int rx1170_rep
    .local pmc rx1170_cur
    (rx1170_cur, rx1170_pos, rx1170_tgt) = self."!cursor_start"()
    rx1170_cur."!cursor_debug"("START ", "infix:sym<eq>")
    .lex unicode:"$\x{a2}", rx1170_cur
    .local pmc match
    .lex "$/", match
    length rx1170_eos, rx1170_tgt
    gt rx1170_pos, rx1170_eos, rx1170_done
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
.annotate 'line', 520
  # rx subcapture "sym"
    set_addr $I10, rxcap_1175_fail
    rx1170_cur."!mark_push"(0, rx1170_pos, $I10)
  # rx literal  "eq"
    add $I11, rx1170_pos, 2
    gt $I11, rx1170_eos, rx1170_fail
    sub $I11, rx1170_pos, rx1170_off
    substr $S10, rx1170_tgt, $I11, 2
    ne $S10, "eq", rx1170_fail
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
    $P10 = rx1170_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx1170_fail
    rx1170_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1170_pos = $P10."pos"()
  # rx pass
    rx1170_cur."!cursor_pass"(rx1170_pos, "infix:sym<eq>")
    rx1170_cur."!cursor_debug"("PASS  ", "infix:sym<eq>", " at pos=", rx1170_pos)
    .return (rx1170_cur)
  rx1170_fail:
.annotate 'line', 445
    (rx1170_rep, rx1170_pos, $I10, $P10) = rx1170_cur."!mark_fail"(0)
    lt rx1170_pos, -1, rx1170_done
    eq rx1170_pos, -1, rx1170_fail
    jump $I10
  rx1170_done:
    rx1170_cur."!cursor_fail"()
    rx1170_cur."!cursor_debug"("FAIL  ", "infix:sym<eq>")
    .return (rx1170_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("299_1275600007.84296") :method
.annotate 'line', 445
    $P1172 = self."!PREFIX__!subrule"("O", "eq")
    new $P1173, "ResizablePMCArray"
    push $P1173, $P1172
    .return ($P1173)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("300_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1177_tgt
    .local int rx1177_pos
    .local int rx1177_off
    .local int rx1177_eos
    .local int rx1177_rep
    .local pmc rx1177_cur
    (rx1177_cur, rx1177_pos, rx1177_tgt) = self."!cursor_start"()
    rx1177_cur."!cursor_debug"("START ", "infix:sym<ne>")
    .lex unicode:"$\x{a2}", rx1177_cur
    .local pmc match
    .lex "$/", match
    length rx1177_eos, rx1177_tgt
    gt rx1177_pos, rx1177_eos, rx1177_done
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
.annotate 'line', 521
  # rx subcapture "sym"
    set_addr $I10, rxcap_1182_fail
    rx1177_cur."!mark_push"(0, rx1177_pos, $I10)
  # rx literal  "ne"
    add $I11, rx1177_pos, 2
    gt $I11, rx1177_eos, rx1177_fail
    sub $I11, rx1177_pos, rx1177_off
    substr $S10, rx1177_tgt, $I11, 2
    ne $S10, "ne", rx1177_fail
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
    $P10 = rx1177_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx1177_fail
    rx1177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1177_pos = $P10."pos"()
  # rx pass
    rx1177_cur."!cursor_pass"(rx1177_pos, "infix:sym<ne>")
    rx1177_cur."!cursor_debug"("PASS  ", "infix:sym<ne>", " at pos=", rx1177_pos)
    .return (rx1177_cur)
  rx1177_fail:
.annotate 'line', 445
    (rx1177_rep, rx1177_pos, $I10, $P10) = rx1177_cur."!mark_fail"(0)
    lt rx1177_pos, -1, rx1177_done
    eq rx1177_pos, -1, rx1177_fail
    jump $I10
  rx1177_done:
    rx1177_cur."!cursor_fail"()
    rx1177_cur."!cursor_debug"("FAIL  ", "infix:sym<ne>")
    .return (rx1177_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("301_1275600007.84296") :method
.annotate 'line', 445
    $P1179 = self."!PREFIX__!subrule"("O", "ne")
    new $P1180, "ResizablePMCArray"
    push $P1180, $P1179
    .return ($P1180)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("302_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1184_tgt
    .local int rx1184_pos
    .local int rx1184_off
    .local int rx1184_eos
    .local int rx1184_rep
    .local pmc rx1184_cur
    (rx1184_cur, rx1184_pos, rx1184_tgt) = self."!cursor_start"()
    rx1184_cur."!cursor_debug"("START ", "infix:sym<le>")
    .lex unicode:"$\x{a2}", rx1184_cur
    .local pmc match
    .lex "$/", match
    length rx1184_eos, rx1184_tgt
    gt rx1184_pos, rx1184_eos, rx1184_done
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
.annotate 'line', 522
  # rx subcapture "sym"
    set_addr $I10, rxcap_1189_fail
    rx1184_cur."!mark_push"(0, rx1184_pos, $I10)
  # rx literal  "le"
    add $I11, rx1184_pos, 2
    gt $I11, rx1184_eos, rx1184_fail
    sub $I11, rx1184_pos, rx1184_off
    substr $S10, rx1184_tgt, $I11, 2
    ne $S10, "le", rx1184_fail
    add rx1184_pos, 2
    set_addr $I10, rxcap_1189_fail
    ($I12, $I11) = rx1184_cur."!mark_peek"($I10)
    rx1184_cur."!cursor_pos"($I11)
    ($P10) = rx1184_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1184_pos, "")
    rx1184_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1189_done
  rxcap_1189_fail:
    goto rx1184_fail
  rxcap_1189_done:
  # rx subrule "O" subtype=capture negate=
    rx1184_cur."!cursor_pos"(rx1184_pos)
    $P10 = rx1184_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx1184_fail
    rx1184_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1184_pos = $P10."pos"()
  # rx pass
    rx1184_cur."!cursor_pass"(rx1184_pos, "infix:sym<le>")
    rx1184_cur."!cursor_debug"("PASS  ", "infix:sym<le>", " at pos=", rx1184_pos)
    .return (rx1184_cur)
  rx1184_fail:
.annotate 'line', 445
    (rx1184_rep, rx1184_pos, $I10, $P10) = rx1184_cur."!mark_fail"(0)
    lt rx1184_pos, -1, rx1184_done
    eq rx1184_pos, -1, rx1184_fail
    jump $I10
  rx1184_done:
    rx1184_cur."!cursor_fail"()
    rx1184_cur."!cursor_debug"("FAIL  ", "infix:sym<le>")
    .return (rx1184_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("303_1275600007.84296") :method
.annotate 'line', 445
    $P1186 = self."!PREFIX__!subrule"("O", "le")
    new $P1187, "ResizablePMCArray"
    push $P1187, $P1186
    .return ($P1187)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("304_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1191_tgt
    .local int rx1191_pos
    .local int rx1191_off
    .local int rx1191_eos
    .local int rx1191_rep
    .local pmc rx1191_cur
    (rx1191_cur, rx1191_pos, rx1191_tgt) = self."!cursor_start"()
    rx1191_cur."!cursor_debug"("START ", "infix:sym<ge>")
    .lex unicode:"$\x{a2}", rx1191_cur
    .local pmc match
    .lex "$/", match
    length rx1191_eos, rx1191_tgt
    gt rx1191_pos, rx1191_eos, rx1191_done
    set rx1191_off, 0
    lt rx1191_pos, 2, rx1191_start
    sub rx1191_off, rx1191_pos, 1
    substr rx1191_tgt, rx1191_tgt, rx1191_off
  rx1191_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1195_done
    goto rxscan1195_scan
  rxscan1195_loop:
    ($P10) = rx1191_cur."from"()
    inc $P10
    set rx1191_pos, $P10
    ge rx1191_pos, rx1191_eos, rxscan1195_done
  rxscan1195_scan:
    set_addr $I10, rxscan1195_loop
    rx1191_cur."!mark_push"(0, rx1191_pos, $I10)
  rxscan1195_done:
.annotate 'line', 523
  # rx subcapture "sym"
    set_addr $I10, rxcap_1196_fail
    rx1191_cur."!mark_push"(0, rx1191_pos, $I10)
  # rx literal  "ge"
    add $I11, rx1191_pos, 2
    gt $I11, rx1191_eos, rx1191_fail
    sub $I11, rx1191_pos, rx1191_off
    substr $S10, rx1191_tgt, $I11, 2
    ne $S10, "ge", rx1191_fail
    add rx1191_pos, 2
    set_addr $I10, rxcap_1196_fail
    ($I12, $I11) = rx1191_cur."!mark_peek"($I10)
    rx1191_cur."!cursor_pos"($I11)
    ($P10) = rx1191_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1191_pos, "")
    rx1191_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1196_done
  rxcap_1196_fail:
    goto rx1191_fail
  rxcap_1196_done:
  # rx subrule "O" subtype=capture negate=
    rx1191_cur."!cursor_pos"(rx1191_pos)
    $P10 = rx1191_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx1191_fail
    rx1191_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1191_pos = $P10."pos"()
  # rx pass
    rx1191_cur."!cursor_pass"(rx1191_pos, "infix:sym<ge>")
    rx1191_cur."!cursor_debug"("PASS  ", "infix:sym<ge>", " at pos=", rx1191_pos)
    .return (rx1191_cur)
  rx1191_fail:
.annotate 'line', 445
    (rx1191_rep, rx1191_pos, $I10, $P10) = rx1191_cur."!mark_fail"(0)
    lt rx1191_pos, -1, rx1191_done
    eq rx1191_pos, -1, rx1191_fail
    jump $I10
  rx1191_done:
    rx1191_cur."!cursor_fail"()
    rx1191_cur."!cursor_debug"("FAIL  ", "infix:sym<ge>")
    .return (rx1191_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("305_1275600007.84296") :method
.annotate 'line', 445
    $P1193 = self."!PREFIX__!subrule"("O", "ge")
    new $P1194, "ResizablePMCArray"
    push $P1194, $P1193
    .return ($P1194)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("306_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1198_tgt
    .local int rx1198_pos
    .local int rx1198_off
    .local int rx1198_eos
    .local int rx1198_rep
    .local pmc rx1198_cur
    (rx1198_cur, rx1198_pos, rx1198_tgt) = self."!cursor_start"()
    rx1198_cur."!cursor_debug"("START ", "infix:sym<lt>")
    .lex unicode:"$\x{a2}", rx1198_cur
    .local pmc match
    .lex "$/", match
    length rx1198_eos, rx1198_tgt
    gt rx1198_pos, rx1198_eos, rx1198_done
    set rx1198_off, 0
    lt rx1198_pos, 2, rx1198_start
    sub rx1198_off, rx1198_pos, 1
    substr rx1198_tgt, rx1198_tgt, rx1198_off
  rx1198_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1202_done
    goto rxscan1202_scan
  rxscan1202_loop:
    ($P10) = rx1198_cur."from"()
    inc $P10
    set rx1198_pos, $P10
    ge rx1198_pos, rx1198_eos, rxscan1202_done
  rxscan1202_scan:
    set_addr $I10, rxscan1202_loop
    rx1198_cur."!mark_push"(0, rx1198_pos, $I10)
  rxscan1202_done:
.annotate 'line', 524
  # rx subcapture "sym"
    set_addr $I10, rxcap_1203_fail
    rx1198_cur."!mark_push"(0, rx1198_pos, $I10)
  # rx literal  "lt"
    add $I11, rx1198_pos, 2
    gt $I11, rx1198_eos, rx1198_fail
    sub $I11, rx1198_pos, rx1198_off
    substr $S10, rx1198_tgt, $I11, 2
    ne $S10, "lt", rx1198_fail
    add rx1198_pos, 2
    set_addr $I10, rxcap_1203_fail
    ($I12, $I11) = rx1198_cur."!mark_peek"($I10)
    rx1198_cur."!cursor_pos"($I11)
    ($P10) = rx1198_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1198_pos, "")
    rx1198_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1203_done
  rxcap_1203_fail:
    goto rx1198_fail
  rxcap_1203_done:
  # rx subrule "O" subtype=capture negate=
    rx1198_cur."!cursor_pos"(rx1198_pos)
    $P10 = rx1198_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx1198_fail
    rx1198_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1198_pos = $P10."pos"()
  # rx pass
    rx1198_cur."!cursor_pass"(rx1198_pos, "infix:sym<lt>")
    rx1198_cur."!cursor_debug"("PASS  ", "infix:sym<lt>", " at pos=", rx1198_pos)
    .return (rx1198_cur)
  rx1198_fail:
.annotate 'line', 445
    (rx1198_rep, rx1198_pos, $I10, $P10) = rx1198_cur."!mark_fail"(0)
    lt rx1198_pos, -1, rx1198_done
    eq rx1198_pos, -1, rx1198_fail
    jump $I10
  rx1198_done:
    rx1198_cur."!cursor_fail"()
    rx1198_cur."!cursor_debug"("FAIL  ", "infix:sym<lt>")
    .return (rx1198_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("307_1275600007.84296") :method
.annotate 'line', 445
    $P1200 = self."!PREFIX__!subrule"("O", "lt")
    new $P1201, "ResizablePMCArray"
    push $P1201, $P1200
    .return ($P1201)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("308_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1205_tgt
    .local int rx1205_pos
    .local int rx1205_off
    .local int rx1205_eos
    .local int rx1205_rep
    .local pmc rx1205_cur
    (rx1205_cur, rx1205_pos, rx1205_tgt) = self."!cursor_start"()
    rx1205_cur."!cursor_debug"("START ", "infix:sym<gt>")
    .lex unicode:"$\x{a2}", rx1205_cur
    .local pmc match
    .lex "$/", match
    length rx1205_eos, rx1205_tgt
    gt rx1205_pos, rx1205_eos, rx1205_done
    set rx1205_off, 0
    lt rx1205_pos, 2, rx1205_start
    sub rx1205_off, rx1205_pos, 1
    substr rx1205_tgt, rx1205_tgt, rx1205_off
  rx1205_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1209_done
    goto rxscan1209_scan
  rxscan1209_loop:
    ($P10) = rx1205_cur."from"()
    inc $P10
    set rx1205_pos, $P10
    ge rx1205_pos, rx1205_eos, rxscan1209_done
  rxscan1209_scan:
    set_addr $I10, rxscan1209_loop
    rx1205_cur."!mark_push"(0, rx1205_pos, $I10)
  rxscan1209_done:
.annotate 'line', 525
  # rx subcapture "sym"
    set_addr $I10, rxcap_1210_fail
    rx1205_cur."!mark_push"(0, rx1205_pos, $I10)
  # rx literal  "gt"
    add $I11, rx1205_pos, 2
    gt $I11, rx1205_eos, rx1205_fail
    sub $I11, rx1205_pos, rx1205_off
    substr $S10, rx1205_tgt, $I11, 2
    ne $S10, "gt", rx1205_fail
    add rx1205_pos, 2
    set_addr $I10, rxcap_1210_fail
    ($I12, $I11) = rx1205_cur."!mark_peek"($I10)
    rx1205_cur."!cursor_pos"($I11)
    ($P10) = rx1205_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1205_pos, "")
    rx1205_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1210_done
  rxcap_1210_fail:
    goto rx1205_fail
  rxcap_1210_done:
  # rx subrule "O" subtype=capture negate=
    rx1205_cur."!cursor_pos"(rx1205_pos)
    $P10 = rx1205_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx1205_fail
    rx1205_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1205_pos = $P10."pos"()
  # rx pass
    rx1205_cur."!cursor_pass"(rx1205_pos, "infix:sym<gt>")
    rx1205_cur."!cursor_debug"("PASS  ", "infix:sym<gt>", " at pos=", rx1205_pos)
    .return (rx1205_cur)
  rx1205_fail:
.annotate 'line', 445
    (rx1205_rep, rx1205_pos, $I10, $P10) = rx1205_cur."!mark_fail"(0)
    lt rx1205_pos, -1, rx1205_done
    eq rx1205_pos, -1, rx1205_fail
    jump $I10
  rx1205_done:
    rx1205_cur."!cursor_fail"()
    rx1205_cur."!cursor_debug"("FAIL  ", "infix:sym<gt>")
    .return (rx1205_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("309_1275600007.84296") :method
.annotate 'line', 445
    $P1207 = self."!PREFIX__!subrule"("O", "gt")
    new $P1208, "ResizablePMCArray"
    push $P1208, $P1207
    .return ($P1208)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("310_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1212_tgt
    .local int rx1212_pos
    .local int rx1212_off
    .local int rx1212_eos
    .local int rx1212_rep
    .local pmc rx1212_cur
    (rx1212_cur, rx1212_pos, rx1212_tgt) = self."!cursor_start"()
    rx1212_cur."!cursor_debug"("START ", "infix:sym<=:=>")
    .lex unicode:"$\x{a2}", rx1212_cur
    .local pmc match
    .lex "$/", match
    length rx1212_eos, rx1212_tgt
    gt rx1212_pos, rx1212_eos, rx1212_done
    set rx1212_off, 0
    lt rx1212_pos, 2, rx1212_start
    sub rx1212_off, rx1212_pos, 1
    substr rx1212_tgt, rx1212_tgt, rx1212_off
  rx1212_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1216_done
    goto rxscan1216_scan
  rxscan1216_loop:
    ($P10) = rx1212_cur."from"()
    inc $P10
    set rx1212_pos, $P10
    ge rx1212_pos, rx1212_eos, rxscan1216_done
  rxscan1216_scan:
    set_addr $I10, rxscan1216_loop
    rx1212_cur."!mark_push"(0, rx1212_pos, $I10)
  rxscan1216_done:
.annotate 'line', 526
  # rx subcapture "sym"
    set_addr $I10, rxcap_1217_fail
    rx1212_cur."!mark_push"(0, rx1212_pos, $I10)
  # rx literal  "=:="
    add $I11, rx1212_pos, 3
    gt $I11, rx1212_eos, rx1212_fail
    sub $I11, rx1212_pos, rx1212_off
    substr $S10, rx1212_tgt, $I11, 3
    ne $S10, "=:=", rx1212_fail
    add rx1212_pos, 3
    set_addr $I10, rxcap_1217_fail
    ($I12, $I11) = rx1212_cur."!mark_peek"($I10)
    rx1212_cur."!cursor_pos"($I11)
    ($P10) = rx1212_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1212_pos, "")
    rx1212_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1217_done
  rxcap_1217_fail:
    goto rx1212_fail
  rxcap_1217_done:
  # rx subrule "O" subtype=capture negate=
    rx1212_cur."!cursor_pos"(rx1212_pos)
    $P10 = rx1212_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx1212_fail
    rx1212_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1212_pos = $P10."pos"()
  # rx pass
    rx1212_cur."!cursor_pass"(rx1212_pos, "infix:sym<=:=>")
    rx1212_cur."!cursor_debug"("PASS  ", "infix:sym<=:=>", " at pos=", rx1212_pos)
    .return (rx1212_cur)
  rx1212_fail:
.annotate 'line', 445
    (rx1212_rep, rx1212_pos, $I10, $P10) = rx1212_cur."!mark_fail"(0)
    lt rx1212_pos, -1, rx1212_done
    eq rx1212_pos, -1, rx1212_fail
    jump $I10
  rx1212_done:
    rx1212_cur."!cursor_fail"()
    rx1212_cur."!cursor_debug"("FAIL  ", "infix:sym<=:=>")
    .return (rx1212_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("311_1275600007.84296") :method
.annotate 'line', 445
    $P1214 = self."!PREFIX__!subrule"("O", "=:=")
    new $P1215, "ResizablePMCArray"
    push $P1215, $P1214
    .return ($P1215)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~~>"  :subid("312_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1219_tgt
    .local int rx1219_pos
    .local int rx1219_off
    .local int rx1219_eos
    .local int rx1219_rep
    .local pmc rx1219_cur
    (rx1219_cur, rx1219_pos, rx1219_tgt) = self."!cursor_start"()
    rx1219_cur."!cursor_debug"("START ", "infix:sym<~~>")
    .lex unicode:"$\x{a2}", rx1219_cur
    .local pmc match
    .lex "$/", match
    length rx1219_eos, rx1219_tgt
    gt rx1219_pos, rx1219_eos, rx1219_done
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
.annotate 'line', 527
  # rx subcapture "sym"
    set_addr $I10, rxcap_1224_fail
    rx1219_cur."!mark_push"(0, rx1219_pos, $I10)
  # rx literal  "~~"
    add $I11, rx1219_pos, 2
    gt $I11, rx1219_eos, rx1219_fail
    sub $I11, rx1219_pos, rx1219_off
    substr $S10, rx1219_tgt, $I11, 2
    ne $S10, "~~", rx1219_fail
    add rx1219_pos, 2
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
  # rx subrule "O" subtype=capture negate=
    rx1219_cur."!cursor_pos"(rx1219_pos)
    $P10 = rx1219_cur."O"("%relational, :reducecheck<smartmatch>")
    unless $P10, rx1219_fail
    rx1219_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1219_pos = $P10."pos"()
  # rx pass
    rx1219_cur."!cursor_pass"(rx1219_pos, "infix:sym<~~>")
    rx1219_cur."!cursor_debug"("PASS  ", "infix:sym<~~>", " at pos=", rx1219_pos)
    .return (rx1219_cur)
  rx1219_fail:
.annotate 'line', 445
    (rx1219_rep, rx1219_pos, $I10, $P10) = rx1219_cur."!mark_fail"(0)
    lt rx1219_pos, -1, rx1219_done
    eq rx1219_pos, -1, rx1219_fail
    jump $I10
  rx1219_done:
    rx1219_cur."!cursor_fail"()
    rx1219_cur."!cursor_debug"("FAIL  ", "infix:sym<~~>")
    .return (rx1219_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~~>"  :subid("313_1275600007.84296") :method
.annotate 'line', 445
    $P1221 = self."!PREFIX__!subrule"("O", "~~")
    new $P1222, "ResizablePMCArray"
    push $P1222, $P1221
    .return ($P1222)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("314_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1226_tgt
    .local int rx1226_pos
    .local int rx1226_off
    .local int rx1226_eos
    .local int rx1226_rep
    .local pmc rx1226_cur
    (rx1226_cur, rx1226_pos, rx1226_tgt) = self."!cursor_start"()
    rx1226_cur."!cursor_debug"("START ", "infix:sym<&&>")
    .lex unicode:"$\x{a2}", rx1226_cur
    .local pmc match
    .lex "$/", match
    length rx1226_eos, rx1226_tgt
    gt rx1226_pos, rx1226_eos, rx1226_done
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
.annotate 'line', 529
  # rx subcapture "sym"
    set_addr $I10, rxcap_1231_fail
    rx1226_cur."!mark_push"(0, rx1226_pos, $I10)
  # rx literal  "&&"
    add $I11, rx1226_pos, 2
    gt $I11, rx1226_eos, rx1226_fail
    sub $I11, rx1226_pos, rx1226_off
    substr $S10, rx1226_tgt, $I11, 2
    ne $S10, "&&", rx1226_fail
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
    $P10 = rx1226_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx1226_fail
    rx1226_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1226_pos = $P10."pos"()
  # rx pass
    rx1226_cur."!cursor_pass"(rx1226_pos, "infix:sym<&&>")
    rx1226_cur."!cursor_debug"("PASS  ", "infix:sym<&&>", " at pos=", rx1226_pos)
    .return (rx1226_cur)
  rx1226_fail:
.annotate 'line', 445
    (rx1226_rep, rx1226_pos, $I10, $P10) = rx1226_cur."!mark_fail"(0)
    lt rx1226_pos, -1, rx1226_done
    eq rx1226_pos, -1, rx1226_fail
    jump $I10
  rx1226_done:
    rx1226_cur."!cursor_fail"()
    rx1226_cur."!cursor_debug"("FAIL  ", "infix:sym<&&>")
    .return (rx1226_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("315_1275600007.84296") :method
.annotate 'line', 445
    $P1228 = self."!PREFIX__!subrule"("O", "&&")
    new $P1229, "ResizablePMCArray"
    push $P1229, $P1228
    .return ($P1229)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("316_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1233_tgt
    .local int rx1233_pos
    .local int rx1233_off
    .local int rx1233_eos
    .local int rx1233_rep
    .local pmc rx1233_cur
    (rx1233_cur, rx1233_pos, rx1233_tgt) = self."!cursor_start"()
    rx1233_cur."!cursor_debug"("START ", "infix:sym<||>")
    .lex unicode:"$\x{a2}", rx1233_cur
    .local pmc match
    .lex "$/", match
    length rx1233_eos, rx1233_tgt
    gt rx1233_pos, rx1233_eos, rx1233_done
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
.annotate 'line', 531
  # rx subcapture "sym"
    set_addr $I10, rxcap_1238_fail
    rx1233_cur."!mark_push"(0, rx1233_pos, $I10)
  # rx literal  "||"
    add $I11, rx1233_pos, 2
    gt $I11, rx1233_eos, rx1233_fail
    sub $I11, rx1233_pos, rx1233_off
    substr $S10, rx1233_tgt, $I11, 2
    ne $S10, "||", rx1233_fail
    add rx1233_pos, 2
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
    $P10 = rx1233_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx1233_fail
    rx1233_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1233_pos = $P10."pos"()
  # rx pass
    rx1233_cur."!cursor_pass"(rx1233_pos, "infix:sym<||>")
    rx1233_cur."!cursor_debug"("PASS  ", "infix:sym<||>", " at pos=", rx1233_pos)
    .return (rx1233_cur)
  rx1233_fail:
.annotate 'line', 445
    (rx1233_rep, rx1233_pos, $I10, $P10) = rx1233_cur."!mark_fail"(0)
    lt rx1233_pos, -1, rx1233_done
    eq rx1233_pos, -1, rx1233_fail
    jump $I10
  rx1233_done:
    rx1233_cur."!cursor_fail"()
    rx1233_cur."!cursor_debug"("FAIL  ", "infix:sym<||>")
    .return (rx1233_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("317_1275600007.84296") :method
.annotate 'line', 445
    $P1235 = self."!PREFIX__!subrule"("O", "||")
    new $P1236, "ResizablePMCArray"
    push $P1236, $P1235
    .return ($P1236)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("318_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1240_tgt
    .local int rx1240_pos
    .local int rx1240_off
    .local int rx1240_eos
    .local int rx1240_rep
    .local pmc rx1240_cur
    (rx1240_cur, rx1240_pos, rx1240_tgt) = self."!cursor_start"()
    rx1240_cur."!cursor_debug"("START ", "infix:sym<//>")
    .lex unicode:"$\x{a2}", rx1240_cur
    .local pmc match
    .lex "$/", match
    length rx1240_eos, rx1240_tgt
    gt rx1240_pos, rx1240_eos, rx1240_done
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
.annotate 'line', 532
  # rx subcapture "sym"
    set_addr $I10, rxcap_1245_fail
    rx1240_cur."!mark_push"(0, rx1240_pos, $I10)
  # rx literal  "//"
    add $I11, rx1240_pos, 2
    gt $I11, rx1240_eos, rx1240_fail
    sub $I11, rx1240_pos, rx1240_off
    substr $S10, rx1240_tgt, $I11, 2
    ne $S10, "//", rx1240_fail
    add rx1240_pos, 2
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
    $P10 = rx1240_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx1240_fail
    rx1240_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1240_pos = $P10."pos"()
  # rx pass
    rx1240_cur."!cursor_pass"(rx1240_pos, "infix:sym<//>")
    rx1240_cur."!cursor_debug"("PASS  ", "infix:sym<//>", " at pos=", rx1240_pos)
    .return (rx1240_cur)
  rx1240_fail:
.annotate 'line', 445
    (rx1240_rep, rx1240_pos, $I10, $P10) = rx1240_cur."!mark_fail"(0)
    lt rx1240_pos, -1, rx1240_done
    eq rx1240_pos, -1, rx1240_fail
    jump $I10
  rx1240_done:
    rx1240_cur."!cursor_fail"()
    rx1240_cur."!cursor_debug"("FAIL  ", "infix:sym<//>")
    .return (rx1240_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("319_1275600007.84296") :method
.annotate 'line', 445
    $P1242 = self."!PREFIX__!subrule"("O", "//")
    new $P1243, "ResizablePMCArray"
    push $P1243, $P1242
    .return ($P1243)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("320_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1247_tgt
    .local int rx1247_pos
    .local int rx1247_off
    .local int rx1247_eos
    .local int rx1247_rep
    .local pmc rx1247_cur
    (rx1247_cur, rx1247_pos, rx1247_tgt) = self."!cursor_start"()
    rx1247_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
    .lex unicode:"$\x{a2}", rx1247_cur
    .local pmc match
    .lex "$/", match
    length rx1247_eos, rx1247_tgt
    gt rx1247_pos, rx1247_eos, rx1247_done
    set rx1247_off, 0
    lt rx1247_pos, 2, rx1247_start
    sub rx1247_off, rx1247_pos, 1
    substr rx1247_tgt, rx1247_tgt, rx1247_off
  rx1247_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1251_done
    goto rxscan1251_scan
  rxscan1251_loop:
    ($P10) = rx1247_cur."from"()
    inc $P10
    set rx1247_pos, $P10
    ge rx1247_pos, rx1247_eos, rxscan1251_done
  rxscan1251_scan:
    set_addr $I10, rxscan1251_loop
    rx1247_cur."!mark_push"(0, rx1247_pos, $I10)
  rxscan1251_done:
.annotate 'line', 535
  # rx literal  "??"
    add $I11, rx1247_pos, 2
    gt $I11, rx1247_eos, rx1247_fail
    sub $I11, rx1247_pos, rx1247_off
    substr $S10, rx1247_tgt, $I11, 2
    ne $S10, "??", rx1247_fail
    add rx1247_pos, 2
.annotate 'line', 536
  # rx subrule "ws" subtype=method negate=
    rx1247_cur."!cursor_pos"(rx1247_pos)
    $P10 = rx1247_cur."ws"()
    unless $P10, rx1247_fail
    rx1247_pos = $P10."pos"()
.annotate 'line', 537
  # rx subrule "EXPR" subtype=capture negate=
    rx1247_cur."!cursor_pos"(rx1247_pos)
    $P10 = rx1247_cur."EXPR"("i=")
    unless $P10, rx1247_fail
    rx1247_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1247_pos = $P10."pos"()
.annotate 'line', 538
  # rx literal  "!!"
    add $I11, rx1247_pos, 2
    gt $I11, rx1247_eos, rx1247_fail
    sub $I11, rx1247_pos, rx1247_off
    substr $S10, rx1247_tgt, $I11, 2
    ne $S10, "!!", rx1247_fail
    add rx1247_pos, 2
.annotate 'line', 539
  # rx subrule "O" subtype=capture negate=
    rx1247_cur."!cursor_pos"(rx1247_pos)
    $P10 = rx1247_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx1247_fail
    rx1247_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1247_pos = $P10."pos"()
.annotate 'line', 534
  # rx pass
    rx1247_cur."!cursor_pass"(rx1247_pos, "infix:sym<?? !!>")
    rx1247_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx1247_pos)
    .return (rx1247_cur)
  rx1247_fail:
.annotate 'line', 445
    (rx1247_rep, rx1247_pos, $I10, $P10) = rx1247_cur."!mark_fail"(0)
    lt rx1247_pos, -1, rx1247_done
    eq rx1247_pos, -1, rx1247_fail
    jump $I10
  rx1247_done:
    rx1247_cur."!cursor_fail"()
    rx1247_cur."!cursor_debug"("FAIL  ", "infix:sym<?? !!>")
    .return (rx1247_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("321_1275600007.84296") :method
.annotate 'line', 445
    $P1249 = self."!PREFIX__!subrule"("", "??")
    new $P1250, "ResizablePMCArray"
    push $P1250, $P1249
    .return ($P1250)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("322_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1253_tgt
    .local int rx1253_pos
    .local int rx1253_off
    .local int rx1253_eos
    .local int rx1253_rep
    .local pmc rx1253_cur
    (rx1253_cur, rx1253_pos, rx1253_tgt) = self."!cursor_start"()
    rx1253_cur."!cursor_debug"("START ", "infix:sym<=>")
    .lex unicode:"$\x{a2}", rx1253_cur
    .local pmc match
    .lex "$/", match
    length rx1253_eos, rx1253_tgt
    gt rx1253_pos, rx1253_eos, rx1253_done
    set rx1253_off, 0
    lt rx1253_pos, 2, rx1253_start
    sub rx1253_off, rx1253_pos, 1
    substr rx1253_tgt, rx1253_tgt, rx1253_off
  rx1253_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1257_done
    goto rxscan1257_scan
  rxscan1257_loop:
    ($P10) = rx1253_cur."from"()
    inc $P10
    set rx1253_pos, $P10
    ge rx1253_pos, rx1253_eos, rxscan1257_done
  rxscan1257_scan:
    set_addr $I10, rxscan1257_loop
    rx1253_cur."!mark_push"(0, rx1253_pos, $I10)
  rxscan1257_done:
.annotate 'line', 543
  # rx subcapture "sym"
    set_addr $I10, rxcap_1258_fail
    rx1253_cur."!mark_push"(0, rx1253_pos, $I10)
  # rx literal  "="
    add $I11, rx1253_pos, 1
    gt $I11, rx1253_eos, rx1253_fail
    sub $I11, rx1253_pos, rx1253_off
    substr $S10, rx1253_tgt, $I11, 1
    ne $S10, "=", rx1253_fail
    add rx1253_pos, 1
    set_addr $I10, rxcap_1258_fail
    ($I12, $I11) = rx1253_cur."!mark_peek"($I10)
    rx1253_cur."!cursor_pos"($I11)
    ($P10) = rx1253_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1253_pos, "")
    rx1253_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1258_done
  rxcap_1258_fail:
    goto rx1253_fail
  rxcap_1258_done:
  # rx subrule "panic" subtype=method negate=
    rx1253_cur."!cursor_pos"(rx1253_pos)
    $P10 = rx1253_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx1253_fail
    rx1253_pos = $P10."pos"()
.annotate 'line', 542
  # rx pass
    rx1253_cur."!cursor_pass"(rx1253_pos, "infix:sym<=>")
    rx1253_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx1253_pos)
    .return (rx1253_cur)
  rx1253_fail:
.annotate 'line', 445
    (rx1253_rep, rx1253_pos, $I10, $P10) = rx1253_cur."!mark_fail"(0)
    lt rx1253_pos, -1, rx1253_done
    eq rx1253_pos, -1, rx1253_fail
    jump $I10
  rx1253_done:
    rx1253_cur."!cursor_fail"()
    rx1253_cur."!cursor_debug"("FAIL  ", "infix:sym<=>")
    .return (rx1253_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("323_1275600007.84296") :method
.annotate 'line', 445
    $P1255 = self."!PREFIX__!subrule"("", "=")
    new $P1256, "ResizablePMCArray"
    push $P1256, $P1255
    .return ($P1256)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("324_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1260_tgt
    .local int rx1260_pos
    .local int rx1260_off
    .local int rx1260_eos
    .local int rx1260_rep
    .local pmc rx1260_cur
    (rx1260_cur, rx1260_pos, rx1260_tgt) = self."!cursor_start"()
    rx1260_cur."!cursor_debug"("START ", "infix:sym<:=>")
    .lex unicode:"$\x{a2}", rx1260_cur
    .local pmc match
    .lex "$/", match
    length rx1260_eos, rx1260_tgt
    gt rx1260_pos, rx1260_eos, rx1260_done
    set rx1260_off, 0
    lt rx1260_pos, 2, rx1260_start
    sub rx1260_off, rx1260_pos, 1
    substr rx1260_tgt, rx1260_tgt, rx1260_off
  rx1260_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1264_done
    goto rxscan1264_scan
  rxscan1264_loop:
    ($P10) = rx1260_cur."from"()
    inc $P10
    set rx1260_pos, $P10
    ge rx1260_pos, rx1260_eos, rxscan1264_done
  rxscan1264_scan:
    set_addr $I10, rxscan1264_loop
    rx1260_cur."!mark_push"(0, rx1260_pos, $I10)
  rxscan1264_done:
.annotate 'line', 545
  # rx subcapture "sym"
    set_addr $I10, rxcap_1265_fail
    rx1260_cur."!mark_push"(0, rx1260_pos, $I10)
  # rx literal  ":="
    add $I11, rx1260_pos, 2
    gt $I11, rx1260_eos, rx1260_fail
    sub $I11, rx1260_pos, rx1260_off
    substr $S10, rx1260_tgt, $I11, 2
    ne $S10, ":=", rx1260_fail
    add rx1260_pos, 2
    set_addr $I10, rxcap_1265_fail
    ($I12, $I11) = rx1260_cur."!mark_peek"($I10)
    rx1260_cur."!cursor_pos"($I11)
    ($P10) = rx1260_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1260_pos, "")
    rx1260_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1265_done
  rxcap_1265_fail:
    goto rx1260_fail
  rxcap_1265_done:
  # rx subrule "O" subtype=capture negate=
    rx1260_cur."!cursor_pos"(rx1260_pos)
    $P10 = rx1260_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1260_fail
    rx1260_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1260_pos = $P10."pos"()
  # rx pass
    rx1260_cur."!cursor_pass"(rx1260_pos, "infix:sym<:=>")
    rx1260_cur."!cursor_debug"("PASS  ", "infix:sym<:=>", " at pos=", rx1260_pos)
    .return (rx1260_cur)
  rx1260_fail:
.annotate 'line', 445
    (rx1260_rep, rx1260_pos, $I10, $P10) = rx1260_cur."!mark_fail"(0)
    lt rx1260_pos, -1, rx1260_done
    eq rx1260_pos, -1, rx1260_fail
    jump $I10
  rx1260_done:
    rx1260_cur."!cursor_fail"()
    rx1260_cur."!cursor_debug"("FAIL  ", "infix:sym<:=>")
    .return (rx1260_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("325_1275600007.84296") :method
.annotate 'line', 445
    $P1262 = self."!PREFIX__!subrule"("O", ":=")
    new $P1263, "ResizablePMCArray"
    push $P1263, $P1262
    .return ($P1263)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("326_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1267_tgt
    .local int rx1267_pos
    .local int rx1267_off
    .local int rx1267_eos
    .local int rx1267_rep
    .local pmc rx1267_cur
    (rx1267_cur, rx1267_pos, rx1267_tgt) = self."!cursor_start"()
    rx1267_cur."!cursor_debug"("START ", "infix:sym<::=>")
    .lex unicode:"$\x{a2}", rx1267_cur
    .local pmc match
    .lex "$/", match
    length rx1267_eos, rx1267_tgt
    gt rx1267_pos, rx1267_eos, rx1267_done
    set rx1267_off, 0
    lt rx1267_pos, 2, rx1267_start
    sub rx1267_off, rx1267_pos, 1
    substr rx1267_tgt, rx1267_tgt, rx1267_off
  rx1267_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1271_done
    goto rxscan1271_scan
  rxscan1271_loop:
    ($P10) = rx1267_cur."from"()
    inc $P10
    set rx1267_pos, $P10
    ge rx1267_pos, rx1267_eos, rxscan1271_done
  rxscan1271_scan:
    set_addr $I10, rxscan1271_loop
    rx1267_cur."!mark_push"(0, rx1267_pos, $I10)
  rxscan1271_done:
.annotate 'line', 546
  # rx subcapture "sym"
    set_addr $I10, rxcap_1272_fail
    rx1267_cur."!mark_push"(0, rx1267_pos, $I10)
  # rx literal  "::="
    add $I11, rx1267_pos, 3
    gt $I11, rx1267_eos, rx1267_fail
    sub $I11, rx1267_pos, rx1267_off
    substr $S10, rx1267_tgt, $I11, 3
    ne $S10, "::=", rx1267_fail
    add rx1267_pos, 3
    set_addr $I10, rxcap_1272_fail
    ($I12, $I11) = rx1267_cur."!mark_peek"($I10)
    rx1267_cur."!cursor_pos"($I11)
    ($P10) = rx1267_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1267_pos, "")
    rx1267_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1272_done
  rxcap_1272_fail:
    goto rx1267_fail
  rxcap_1272_done:
  # rx subrule "O" subtype=capture negate=
    rx1267_cur."!cursor_pos"(rx1267_pos)
    $P10 = rx1267_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1267_fail
    rx1267_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1267_pos = $P10."pos"()
  # rx pass
    rx1267_cur."!cursor_pass"(rx1267_pos, "infix:sym<::=>")
    rx1267_cur."!cursor_debug"("PASS  ", "infix:sym<::=>", " at pos=", rx1267_pos)
    .return (rx1267_cur)
  rx1267_fail:
.annotate 'line', 445
    (rx1267_rep, rx1267_pos, $I10, $P10) = rx1267_cur."!mark_fail"(0)
    lt rx1267_pos, -1, rx1267_done
    eq rx1267_pos, -1, rx1267_fail
    jump $I10
  rx1267_done:
    rx1267_cur."!cursor_fail"()
    rx1267_cur."!cursor_debug"("FAIL  ", "infix:sym<::=>")
    .return (rx1267_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("327_1275600007.84296") :method
.annotate 'line', 445
    $P1269 = self."!PREFIX__!subrule"("O", "::=")
    new $P1270, "ResizablePMCArray"
    push $P1270, $P1269
    .return ($P1270)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("328_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1274_tgt
    .local int rx1274_pos
    .local int rx1274_off
    .local int rx1274_eos
    .local int rx1274_rep
    .local pmc rx1274_cur
    (rx1274_cur, rx1274_pos, rx1274_tgt) = self."!cursor_start"()
    rx1274_cur."!cursor_debug"("START ", "infix:sym<,>")
    .lex unicode:"$\x{a2}", rx1274_cur
    .local pmc match
    .lex "$/", match
    length rx1274_eos, rx1274_tgt
    gt rx1274_pos, rx1274_eos, rx1274_done
    set rx1274_off, 0
    lt rx1274_pos, 2, rx1274_start
    sub rx1274_off, rx1274_pos, 1
    substr rx1274_tgt, rx1274_tgt, rx1274_off
  rx1274_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1278_done
    goto rxscan1278_scan
  rxscan1278_loop:
    ($P10) = rx1274_cur."from"()
    inc $P10
    set rx1274_pos, $P10
    ge rx1274_pos, rx1274_eos, rxscan1278_done
  rxscan1278_scan:
    set_addr $I10, rxscan1278_loop
    rx1274_cur."!mark_push"(0, rx1274_pos, $I10)
  rxscan1278_done:
.annotate 'line', 548
  # rx subcapture "sym"
    set_addr $I10, rxcap_1279_fail
    rx1274_cur."!mark_push"(0, rx1274_pos, $I10)
  # rx literal  ","
    add $I11, rx1274_pos, 1
    gt $I11, rx1274_eos, rx1274_fail
    sub $I11, rx1274_pos, rx1274_off
    substr $S10, rx1274_tgt, $I11, 1
    ne $S10, ",", rx1274_fail
    add rx1274_pos, 1
    set_addr $I10, rxcap_1279_fail
    ($I12, $I11) = rx1274_cur."!mark_peek"($I10)
    rx1274_cur."!cursor_pos"($I11)
    ($P10) = rx1274_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1274_pos, "")
    rx1274_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1279_done
  rxcap_1279_fail:
    goto rx1274_fail
  rxcap_1279_done:
  # rx subrule "O" subtype=capture negate=
    rx1274_cur."!cursor_pos"(rx1274_pos)
    $P10 = rx1274_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1274_fail
    rx1274_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1274_pos = $P10."pos"()
  # rx pass
    rx1274_cur."!cursor_pass"(rx1274_pos, "infix:sym<,>")
    rx1274_cur."!cursor_debug"("PASS  ", "infix:sym<,>", " at pos=", rx1274_pos)
    .return (rx1274_cur)
  rx1274_fail:
.annotate 'line', 445
    (rx1274_rep, rx1274_pos, $I10, $P10) = rx1274_cur."!mark_fail"(0)
    lt rx1274_pos, -1, rx1274_done
    eq rx1274_pos, -1, rx1274_fail
    jump $I10
  rx1274_done:
    rx1274_cur."!cursor_fail"()
    rx1274_cur."!cursor_debug"("FAIL  ", "infix:sym<,>")
    .return (rx1274_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("329_1275600007.84296") :method
.annotate 'line', 445
    $P1276 = self."!PREFIX__!subrule"("O", ",")
    new $P1277, "ResizablePMCArray"
    push $P1277, $P1276
    .return ($P1277)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("330_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1281_tgt
    .local int rx1281_pos
    .local int rx1281_off
    .local int rx1281_eos
    .local int rx1281_rep
    .local pmc rx1281_cur
    (rx1281_cur, rx1281_pos, rx1281_tgt) = self."!cursor_start"()
    rx1281_cur."!cursor_debug"("START ", "prefix:sym<return>")
    .lex unicode:"$\x{a2}", rx1281_cur
    .local pmc match
    .lex "$/", match
    length rx1281_eos, rx1281_tgt
    gt rx1281_pos, rx1281_eos, rx1281_done
    set rx1281_off, 0
    lt rx1281_pos, 2, rx1281_start
    sub rx1281_off, rx1281_pos, 1
    substr rx1281_tgt, rx1281_tgt, rx1281_off
  rx1281_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1284_done
    goto rxscan1284_scan
  rxscan1284_loop:
    ($P10) = rx1281_cur."from"()
    inc $P10
    set rx1281_pos, $P10
    ge rx1281_pos, rx1281_eos, rxscan1284_done
  rxscan1284_scan:
    set_addr $I10, rxscan1284_loop
    rx1281_cur."!mark_push"(0, rx1281_pos, $I10)
  rxscan1284_done:
.annotate 'line', 550
  # rx subcapture "sym"
    set_addr $I10, rxcap_1285_fail
    rx1281_cur."!mark_push"(0, rx1281_pos, $I10)
  # rx literal  "return"
    add $I11, rx1281_pos, 6
    gt $I11, rx1281_eos, rx1281_fail
    sub $I11, rx1281_pos, rx1281_off
    substr $S10, rx1281_tgt, $I11, 6
    ne $S10, "return", rx1281_fail
    add rx1281_pos, 6
    set_addr $I10, rxcap_1285_fail
    ($I12, $I11) = rx1281_cur."!mark_peek"($I10)
    rx1281_cur."!cursor_pos"($I11)
    ($P10) = rx1281_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1281_pos, "")
    rx1281_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1285_done
  rxcap_1285_fail:
    goto rx1281_fail
  rxcap_1285_done:
  # rx charclass s
    ge rx1281_pos, rx1281_eos, rx1281_fail
    sub $I10, rx1281_pos, rx1281_off
    is_cclass $I11, 32, rx1281_tgt, $I10
    unless $I11, rx1281_fail
    inc rx1281_pos
  # rx subrule "O" subtype=capture negate=
    rx1281_cur."!cursor_pos"(rx1281_pos)
    $P10 = rx1281_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1281_fail
    rx1281_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1281_pos = $P10."pos"()
  # rx pass
    rx1281_cur."!cursor_pass"(rx1281_pos, "prefix:sym<return>")
    rx1281_cur."!cursor_debug"("PASS  ", "prefix:sym<return>", " at pos=", rx1281_pos)
    .return (rx1281_cur)
  rx1281_fail:
.annotate 'line', 445
    (rx1281_rep, rx1281_pos, $I10, $P10) = rx1281_cur."!mark_fail"(0)
    lt rx1281_pos, -1, rx1281_done
    eq rx1281_pos, -1, rx1281_fail
    jump $I10
  rx1281_done:
    rx1281_cur."!cursor_fail"()
    rx1281_cur."!cursor_debug"("FAIL  ", "prefix:sym<return>")
    .return (rx1281_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("331_1275600007.84296") :method
.annotate 'line', 445
    new $P1283, "ResizablePMCArray"
    push $P1283, "return"
    .return ($P1283)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("332_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1287_tgt
    .local int rx1287_pos
    .local int rx1287_off
    .local int rx1287_eos
    .local int rx1287_rep
    .local pmc rx1287_cur
    (rx1287_cur, rx1287_pos, rx1287_tgt) = self."!cursor_start"()
    rx1287_cur."!cursor_debug"("START ", "prefix:sym<make>")
    .lex unicode:"$\x{a2}", rx1287_cur
    .local pmc match
    .lex "$/", match
    length rx1287_eos, rx1287_tgt
    gt rx1287_pos, rx1287_eos, rx1287_done
    set rx1287_off, 0
    lt rx1287_pos, 2, rx1287_start
    sub rx1287_off, rx1287_pos, 1
    substr rx1287_tgt, rx1287_tgt, rx1287_off
  rx1287_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1290_done
    goto rxscan1290_scan
  rxscan1290_loop:
    ($P10) = rx1287_cur."from"()
    inc $P10
    set rx1287_pos, $P10
    ge rx1287_pos, rx1287_eos, rxscan1290_done
  rxscan1290_scan:
    set_addr $I10, rxscan1290_loop
    rx1287_cur."!mark_push"(0, rx1287_pos, $I10)
  rxscan1290_done:
.annotate 'line', 551
  # rx subcapture "sym"
    set_addr $I10, rxcap_1291_fail
    rx1287_cur."!mark_push"(0, rx1287_pos, $I10)
  # rx literal  "make"
    add $I11, rx1287_pos, 4
    gt $I11, rx1287_eos, rx1287_fail
    sub $I11, rx1287_pos, rx1287_off
    substr $S10, rx1287_tgt, $I11, 4
    ne $S10, "make", rx1287_fail
    add rx1287_pos, 4
    set_addr $I10, rxcap_1291_fail
    ($I12, $I11) = rx1287_cur."!mark_peek"($I10)
    rx1287_cur."!cursor_pos"($I11)
    ($P10) = rx1287_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1287_pos, "")
    rx1287_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1291_done
  rxcap_1291_fail:
    goto rx1287_fail
  rxcap_1291_done:
  # rx charclass s
    ge rx1287_pos, rx1287_eos, rx1287_fail
    sub $I10, rx1287_pos, rx1287_off
    is_cclass $I11, 32, rx1287_tgt, $I10
    unless $I11, rx1287_fail
    inc rx1287_pos
  # rx subrule "O" subtype=capture negate=
    rx1287_cur."!cursor_pos"(rx1287_pos)
    $P10 = rx1287_cur."O"("%list_prefix")
    unless $P10, rx1287_fail
    rx1287_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1287_pos = $P10."pos"()
  # rx pass
    rx1287_cur."!cursor_pass"(rx1287_pos, "prefix:sym<make>")
    rx1287_cur."!cursor_debug"("PASS  ", "prefix:sym<make>", " at pos=", rx1287_pos)
    .return (rx1287_cur)
  rx1287_fail:
.annotate 'line', 445
    (rx1287_rep, rx1287_pos, $I10, $P10) = rx1287_cur."!mark_fail"(0)
    lt rx1287_pos, -1, rx1287_done
    eq rx1287_pos, -1, rx1287_fail
    jump $I10
  rx1287_done:
    rx1287_cur."!cursor_fail"()
    rx1287_cur."!cursor_debug"("FAIL  ", "prefix:sym<make>")
    .return (rx1287_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("333_1275600007.84296") :method
.annotate 'line', 445
    new $P1289, "ResizablePMCArray"
    push $P1289, "make"
    .return ($P1289)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<last>"  :subid("334_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1293_tgt
    .local int rx1293_pos
    .local int rx1293_off
    .local int rx1293_eos
    .local int rx1293_rep
    .local pmc rx1293_cur
    (rx1293_cur, rx1293_pos, rx1293_tgt) = self."!cursor_start"()
    rx1293_cur."!cursor_debug"("START ", "term:sym<last>")
    .lex unicode:"$\x{a2}", rx1293_cur
    .local pmc match
    .lex "$/", match
    length rx1293_eos, rx1293_tgt
    gt rx1293_pos, rx1293_eos, rx1293_done
    set rx1293_off, 0
    lt rx1293_pos, 2, rx1293_start
    sub rx1293_off, rx1293_pos, 1
    substr rx1293_tgt, rx1293_tgt, rx1293_off
  rx1293_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1296_done
    goto rxscan1296_scan
  rxscan1296_loop:
    ($P10) = rx1293_cur."from"()
    inc $P10
    set rx1293_pos, $P10
    ge rx1293_pos, rx1293_eos, rxscan1296_done
  rxscan1296_scan:
    set_addr $I10, rxscan1296_loop
    rx1293_cur."!mark_push"(0, rx1293_pos, $I10)
  rxscan1296_done:
.annotate 'line', 552
  # rx subcapture "sym"
    set_addr $I10, rxcap_1297_fail
    rx1293_cur."!mark_push"(0, rx1293_pos, $I10)
  # rx literal  "last"
    add $I11, rx1293_pos, 4
    gt $I11, rx1293_eos, rx1293_fail
    sub $I11, rx1293_pos, rx1293_off
    substr $S10, rx1293_tgt, $I11, 4
    ne $S10, "last", rx1293_fail
    add rx1293_pos, 4
    set_addr $I10, rxcap_1297_fail
    ($I12, $I11) = rx1293_cur."!mark_peek"($I10)
    rx1293_cur."!cursor_pos"($I11)
    ($P10) = rx1293_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1293_pos, "")
    rx1293_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1297_done
  rxcap_1297_fail:
    goto rx1293_fail
  rxcap_1297_done:
  # rx pass
    rx1293_cur."!cursor_pass"(rx1293_pos, "term:sym<last>")
    rx1293_cur."!cursor_debug"("PASS  ", "term:sym<last>", " at pos=", rx1293_pos)
    .return (rx1293_cur)
  rx1293_fail:
.annotate 'line', 445
    (rx1293_rep, rx1293_pos, $I10, $P10) = rx1293_cur."!mark_fail"(0)
    lt rx1293_pos, -1, rx1293_done
    eq rx1293_pos, -1, rx1293_fail
    jump $I10
  rx1293_done:
    rx1293_cur."!cursor_fail"()
    rx1293_cur."!cursor_debug"("FAIL  ", "term:sym<last>")
    .return (rx1293_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<last>"  :subid("335_1275600007.84296") :method
.annotate 'line', 445
    new $P1295, "ResizablePMCArray"
    push $P1295, "last"
    .return ($P1295)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<next>"  :subid("336_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1299_tgt
    .local int rx1299_pos
    .local int rx1299_off
    .local int rx1299_eos
    .local int rx1299_rep
    .local pmc rx1299_cur
    (rx1299_cur, rx1299_pos, rx1299_tgt) = self."!cursor_start"()
    rx1299_cur."!cursor_debug"("START ", "term:sym<next>")
    .lex unicode:"$\x{a2}", rx1299_cur
    .local pmc match
    .lex "$/", match
    length rx1299_eos, rx1299_tgt
    gt rx1299_pos, rx1299_eos, rx1299_done
    set rx1299_off, 0
    lt rx1299_pos, 2, rx1299_start
    sub rx1299_off, rx1299_pos, 1
    substr rx1299_tgt, rx1299_tgt, rx1299_off
  rx1299_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1302_done
    goto rxscan1302_scan
  rxscan1302_loop:
    ($P10) = rx1299_cur."from"()
    inc $P10
    set rx1299_pos, $P10
    ge rx1299_pos, rx1299_eos, rxscan1302_done
  rxscan1302_scan:
    set_addr $I10, rxscan1302_loop
    rx1299_cur."!mark_push"(0, rx1299_pos, $I10)
  rxscan1302_done:
.annotate 'line', 553
  # rx subcapture "sym"
    set_addr $I10, rxcap_1303_fail
    rx1299_cur."!mark_push"(0, rx1299_pos, $I10)
  # rx literal  "next"
    add $I11, rx1299_pos, 4
    gt $I11, rx1299_eos, rx1299_fail
    sub $I11, rx1299_pos, rx1299_off
    substr $S10, rx1299_tgt, $I11, 4
    ne $S10, "next", rx1299_fail
    add rx1299_pos, 4
    set_addr $I10, rxcap_1303_fail
    ($I12, $I11) = rx1299_cur."!mark_peek"($I10)
    rx1299_cur."!cursor_pos"($I11)
    ($P10) = rx1299_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1299_pos, "")
    rx1299_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1303_done
  rxcap_1303_fail:
    goto rx1299_fail
  rxcap_1303_done:
  # rx pass
    rx1299_cur."!cursor_pass"(rx1299_pos, "term:sym<next>")
    rx1299_cur."!cursor_debug"("PASS  ", "term:sym<next>", " at pos=", rx1299_pos)
    .return (rx1299_cur)
  rx1299_fail:
.annotate 'line', 445
    (rx1299_rep, rx1299_pos, $I10, $P10) = rx1299_cur."!mark_fail"(0)
    lt rx1299_pos, -1, rx1299_done
    eq rx1299_pos, -1, rx1299_fail
    jump $I10
  rx1299_done:
    rx1299_cur."!cursor_fail"()
    rx1299_cur."!cursor_debug"("FAIL  ", "term:sym<next>")
    .return (rx1299_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<next>"  :subid("337_1275600007.84296") :method
.annotate 'line', 445
    new $P1301, "ResizablePMCArray"
    push $P1301, "next"
    .return ($P1301)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<redo>"  :subid("338_1275600007.84296") :method :outer("11_1275600007.84296")
.annotate 'line', 445
    .local string rx1305_tgt
    .local int rx1305_pos
    .local int rx1305_off
    .local int rx1305_eos
    .local int rx1305_rep
    .local pmc rx1305_cur
    (rx1305_cur, rx1305_pos, rx1305_tgt) = self."!cursor_start"()
    rx1305_cur."!cursor_debug"("START ", "term:sym<redo>")
    .lex unicode:"$\x{a2}", rx1305_cur
    .local pmc match
    .lex "$/", match
    length rx1305_eos, rx1305_tgt
    gt rx1305_pos, rx1305_eos, rx1305_done
    set rx1305_off, 0
    lt rx1305_pos, 2, rx1305_start
    sub rx1305_off, rx1305_pos, 1
    substr rx1305_tgt, rx1305_tgt, rx1305_off
  rx1305_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1308_done
    goto rxscan1308_scan
  rxscan1308_loop:
    ($P10) = rx1305_cur."from"()
    inc $P10
    set rx1305_pos, $P10
    ge rx1305_pos, rx1305_eos, rxscan1308_done
  rxscan1308_scan:
    set_addr $I10, rxscan1308_loop
    rx1305_cur."!mark_push"(0, rx1305_pos, $I10)
  rxscan1308_done:
.annotate 'line', 554
  # rx subcapture "sym"
    set_addr $I10, rxcap_1309_fail
    rx1305_cur."!mark_push"(0, rx1305_pos, $I10)
  # rx literal  "redo"
    add $I11, rx1305_pos, 4
    gt $I11, rx1305_eos, rx1305_fail
    sub $I11, rx1305_pos, rx1305_off
    substr $S10, rx1305_tgt, $I11, 4
    ne $S10, "redo", rx1305_fail
    add rx1305_pos, 4
    set_addr $I10, rxcap_1309_fail
    ($I12, $I11) = rx1305_cur."!mark_peek"($I10)
    rx1305_cur."!cursor_pos"($I11)
    ($P10) = rx1305_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1305_pos, "")
    rx1305_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1309_done
  rxcap_1309_fail:
    goto rx1305_fail
  rxcap_1309_done:
  # rx pass
    rx1305_cur."!cursor_pass"(rx1305_pos, "term:sym<redo>")
    rx1305_cur."!cursor_debug"("PASS  ", "term:sym<redo>", " at pos=", rx1305_pos)
    .return (rx1305_cur)
  rx1305_fail:
.annotate 'line', 445
    (rx1305_rep, rx1305_pos, $I10, $P10) = rx1305_cur."!mark_fail"(0)
    lt rx1305_pos, -1, rx1305_done
    eq rx1305_pos, -1, rx1305_fail
    jump $I10
  rx1305_done:
    rx1305_cur."!cursor_fail"()
    rx1305_cur."!cursor_debug"("FAIL  ", "term:sym<redo>")
    .return (rx1305_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<redo>"  :subid("339_1275600007.84296") :method
.annotate 'line', 445
    new $P1307, "ResizablePMCArray"
    push $P1307, "redo"
    .return ($P1307)
.end


.namespace ["NQP";"Grammar"]
.sub "smartmatch"  :subid("340_1275600007.84296") :method :outer("11_1275600007.84296")
    .param pmc param_1313
.annotate 'line', 556
    new $P1312, 'ExceptionHandler'
    set_addr $P1312, control_1311
    $P1312."handle_types"(57)
    push_eh $P1312
    .lex "self", self
    .lex "$/", param_1313
.annotate 'line', 558
    new $P1314, "Undef"
    .lex "$t", $P1314
    find_lex $P1315, "$/"
    unless_null $P1315, vivify_376
    $P1315 = root_new ['parrot';'ResizablePMCArray']
  vivify_376:
    set $P1316, $P1315[0]
    unless_null $P1316, vivify_377
    new $P1316, "Undef"
  vivify_377:
    store_lex "$t", $P1316
    find_lex $P1317, "$/"
    unless_null $P1317, vivify_378
    $P1317 = root_new ['parrot';'ResizablePMCArray']
  vivify_378:
    set $P1318, $P1317[1]
    unless_null $P1318, vivify_379
    new $P1318, "Undef"
  vivify_379:
    find_lex $P1319, "$/"
    unless_null $P1319, vivify_380
    $P1319 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1319
  vivify_380:
    set $P1319[0], $P1318
    find_lex $P1320, "$t"
    find_lex $P1321, "$/"
    unless_null $P1321, vivify_381
    $P1321 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1321
  vivify_381:
    set $P1321[1], $P1320
.annotate 'line', 556
    .return ($P1320)
  control_1311:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1322, exception, "payload"
    .return ($P1322)
.end


.namespace ["NQP";"Regex"]
.sub "_block1323"  :subid("341_1275600007.84296") :outer("11_1275600007.84296")
.annotate 'line', 562
    .const 'Sub' $P1381 = "360_1275600007.84296" 
    capture_lex $P1381
    .const 'Sub' $P1376 = "358_1275600007.84296" 
    capture_lex $P1376
    .const 'Sub' $P1363 = "355_1275600007.84296" 
    capture_lex $P1363
    .const 'Sub' $P1353 = "352_1275600007.84296" 
    capture_lex $P1353
    .const 'Sub' $P1348 = "350_1275600007.84296" 
    capture_lex $P1348
    .const 'Sub' $P1339 = "347_1275600007.84296" 
    capture_lex $P1339
    .const 'Sub' $P1334 = "345_1275600007.84296" 
    capture_lex $P1334
    .const 'Sub' $P1325 = "342_1275600007.84296" 
    capture_lex $P1325
    .const 'Sub' $P1381 = "360_1275600007.84296" 
    capture_lex $P1381
    .return ($P1381)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("342_1275600007.84296") :method :outer("341_1275600007.84296")
.annotate 'line', 562
    .const 'Sub' $P1331 = "344_1275600007.84296" 
    capture_lex $P1331
    .local string rx1326_tgt
    .local int rx1326_pos
    .local int rx1326_off
    .local int rx1326_eos
    .local int rx1326_rep
    .local pmc rx1326_cur
    (rx1326_cur, rx1326_pos, rx1326_tgt) = self."!cursor_start"()
    rx1326_cur."!cursor_debug"("START ", "metachar:sym<:my>")
    .lex unicode:"$\x{a2}", rx1326_cur
    .local pmc match
    .lex "$/", match
    length rx1326_eos, rx1326_tgt
    gt rx1326_pos, rx1326_eos, rx1326_done
    set rx1326_off, 0
    lt rx1326_pos, 2, rx1326_start
    sub rx1326_off, rx1326_pos, 1
    substr rx1326_tgt, rx1326_tgt, rx1326_off
  rx1326_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1329_done
    goto rxscan1329_scan
  rxscan1329_loop:
    ($P10) = rx1326_cur."from"()
    inc $P10
    set rx1326_pos, $P10
    ge rx1326_pos, rx1326_eos, rxscan1329_done
  rxscan1329_scan:
    set_addr $I10, rxscan1329_loop
    rx1326_cur."!mark_push"(0, rx1326_pos, $I10)
  rxscan1329_done:
.annotate 'line', 564
  # rx literal  ":"
    add $I11, rx1326_pos, 1
    gt $I11, rx1326_eos, rx1326_fail
    sub $I11, rx1326_pos, rx1326_off
    substr $S10, rx1326_tgt, $I11, 1
    ne $S10, ":", rx1326_fail
    add rx1326_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1326_cur."!cursor_pos"(rx1326_pos)
    .const 'Sub' $P1331 = "344_1275600007.84296" 
    capture_lex $P1331
    $P10 = rx1326_cur."before"($P1331)
    unless $P10, rx1326_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1326_cur."!cursor_pos"(rx1326_pos)
    $P10 = rx1326_cur."LANG"("MAIN", "statement")
    unless $P10, rx1326_fail
    rx1326_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1326_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1326_cur."!cursor_pos"(rx1326_pos)
    $P10 = rx1326_cur."ws"()
    unless $P10, rx1326_fail
    rx1326_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1326_pos, 1
    gt $I11, rx1326_eos, rx1326_fail
    sub $I11, rx1326_pos, rx1326_off
    substr $S10, rx1326_tgt, $I11, 1
    ne $S10, ";", rx1326_fail
    add rx1326_pos, 1
.annotate 'line', 563
  # rx pass
    rx1326_cur."!cursor_pass"(rx1326_pos, "metachar:sym<:my>")
    rx1326_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1326_pos)
    .return (rx1326_cur)
  rx1326_fail:
.annotate 'line', 562
    (rx1326_rep, rx1326_pos, $I10, $P10) = rx1326_cur."!mark_fail"(0)
    lt rx1326_pos, -1, rx1326_done
    eq rx1326_pos, -1, rx1326_fail
    jump $I10
  rx1326_done:
    rx1326_cur."!cursor_fail"()
    rx1326_cur."!cursor_debug"("FAIL  ", "metachar:sym<:my>")
    .return (rx1326_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("343_1275600007.84296") :method
.annotate 'line', 562
    new $P1328, "ResizablePMCArray"
    push $P1328, ":"
    .return ($P1328)
.end


.namespace ["NQP";"Regex"]
.sub "_block1330"  :anon :subid("344_1275600007.84296") :method :outer("342_1275600007.84296")
.annotate 'line', 564
    .local string rx1332_tgt
    .local int rx1332_pos
    .local int rx1332_off
    .local int rx1332_eos
    .local int rx1332_rep
    .local pmc rx1332_cur
    (rx1332_cur, rx1332_pos, rx1332_tgt) = self."!cursor_start"()
    rx1332_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1332_cur
    .local pmc match
    .lex "$/", match
    length rx1332_eos, rx1332_tgt
    gt rx1332_pos, rx1332_eos, rx1332_done
    set rx1332_off, 0
    lt rx1332_pos, 2, rx1332_start
    sub rx1332_off, rx1332_pos, 1
    substr rx1332_tgt, rx1332_tgt, rx1332_off
  rx1332_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1333_done
    goto rxscan1333_scan
  rxscan1333_loop:
    ($P10) = rx1332_cur."from"()
    inc $P10
    set rx1332_pos, $P10
    ge rx1332_pos, rx1332_eos, rxscan1333_done
  rxscan1333_scan:
    set_addr $I10, rxscan1333_loop
    rx1332_cur."!mark_push"(0, rx1332_pos, $I10)
  rxscan1333_done:
  # rx literal  "my"
    add $I11, rx1332_pos, 2
    gt $I11, rx1332_eos, rx1332_fail
    sub $I11, rx1332_pos, rx1332_off
    substr $S10, rx1332_tgt, $I11, 2
    ne $S10, "my", rx1332_fail
    add rx1332_pos, 2
  # rx pass
    rx1332_cur."!cursor_pass"(rx1332_pos, "")
    rx1332_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1332_pos)
    .return (rx1332_cur)
  rx1332_fail:
    (rx1332_rep, rx1332_pos, $I10, $P10) = rx1332_cur."!mark_fail"(0)
    lt rx1332_pos, -1, rx1332_done
    eq rx1332_pos, -1, rx1332_fail
    jump $I10
  rx1332_done:
    rx1332_cur."!cursor_fail"()
    rx1332_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1332_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("345_1275600007.84296") :method :outer("341_1275600007.84296")
.annotate 'line', 562
    .local string rx1335_tgt
    .local int rx1335_pos
    .local int rx1335_off
    .local int rx1335_eos
    .local int rx1335_rep
    .local pmc rx1335_cur
    (rx1335_cur, rx1335_pos, rx1335_tgt) = self."!cursor_start"()
    rx1335_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1335_cur
    .local pmc match
    .lex "$/", match
    length rx1335_eos, rx1335_tgt
    gt rx1335_pos, rx1335_eos, rx1335_done
    set rx1335_off, 0
    lt rx1335_pos, 2, rx1335_start
    sub rx1335_off, rx1335_pos, 1
    substr rx1335_tgt, rx1335_tgt, rx1335_off
  rx1335_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1338_done
    goto rxscan1338_scan
  rxscan1338_loop:
    ($P10) = rx1335_cur."from"()
    inc $P10
    set rx1335_pos, $P10
    ge rx1335_pos, rx1335_eos, rxscan1338_done
  rxscan1338_scan:
    set_addr $I10, rxscan1338_loop
    rx1335_cur."!mark_push"(0, rx1335_pos, $I10)
  rxscan1338_done:
.annotate 'line', 568
  # rx enumcharlist negate=0 zerowidth
    ge rx1335_pos, rx1335_eos, rx1335_fail
    sub $I10, rx1335_pos, rx1335_off
    substr $S10, rx1335_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1335_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1335_cur."!cursor_pos"(rx1335_pos)
    $P10 = rx1335_cur."codeblock"()
    unless $P10, rx1335_fail
    rx1335_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1335_pos = $P10."pos"()
.annotate 'line', 567
  # rx pass
    rx1335_cur."!cursor_pass"(rx1335_pos, "metachar:sym<{ }>")
    rx1335_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1335_pos)
    .return (rx1335_cur)
  rx1335_fail:
.annotate 'line', 562
    (rx1335_rep, rx1335_pos, $I10, $P10) = rx1335_cur."!mark_fail"(0)
    lt rx1335_pos, -1, rx1335_done
    eq rx1335_pos, -1, rx1335_fail
    jump $I10
  rx1335_done:
    rx1335_cur."!cursor_fail"()
    rx1335_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx1335_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("346_1275600007.84296") :method
.annotate 'line', 562
    new $P1337, "ResizablePMCArray"
    push $P1337, "{"
    .return ($P1337)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<nqpvar>"  :subid("347_1275600007.84296") :method :outer("341_1275600007.84296")
.annotate 'line', 562
    .const 'Sub' $P1345 = "349_1275600007.84296" 
    capture_lex $P1345
    .local string rx1340_tgt
    .local int rx1340_pos
    .local int rx1340_off
    .local int rx1340_eos
    .local int rx1340_rep
    .local pmc rx1340_cur
    (rx1340_cur, rx1340_pos, rx1340_tgt) = self."!cursor_start"()
    rx1340_cur."!cursor_debug"("START ", "metachar:sym<nqpvar>")
    .lex unicode:"$\x{a2}", rx1340_cur
    .local pmc match
    .lex "$/", match
    length rx1340_eos, rx1340_tgt
    gt rx1340_pos, rx1340_eos, rx1340_done
    set rx1340_off, 0
    lt rx1340_pos, 2, rx1340_start
    sub rx1340_off, rx1340_pos, 1
    substr rx1340_tgt, rx1340_tgt, rx1340_off
  rx1340_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1343_done
    goto rxscan1343_scan
  rxscan1343_loop:
    ($P10) = rx1340_cur."from"()
    inc $P10
    set rx1340_pos, $P10
    ge rx1340_pos, rx1340_eos, rxscan1343_done
  rxscan1343_scan:
    set_addr $I10, rxscan1343_loop
    rx1340_cur."!mark_push"(0, rx1340_pos, $I10)
  rxscan1343_done:
.annotate 'line', 572
  # rx enumcharlist negate=0 zerowidth
    ge rx1340_pos, rx1340_eos, rx1340_fail
    sub $I10, rx1340_pos, rx1340_off
    substr $S10, rx1340_tgt, $I10, 1
    index $I11, "$@", $S10
    lt $I11, 0, rx1340_fail
  # rx subrule "before" subtype=zerowidth negate=
    rx1340_cur."!cursor_pos"(rx1340_pos)
    .const 'Sub' $P1345 = "349_1275600007.84296" 
    capture_lex $P1345
    $P10 = rx1340_cur."before"($P1345)
    unless $P10, rx1340_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1340_cur."!cursor_pos"(rx1340_pos)
    $P10 = rx1340_cur."LANG"("MAIN", "variable")
    unless $P10, rx1340_fail
    rx1340_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("var")
    rx1340_pos = $P10."pos"()
.annotate 'line', 571
  # rx pass
    rx1340_cur."!cursor_pass"(rx1340_pos, "metachar:sym<nqpvar>")
    rx1340_cur."!cursor_debug"("PASS  ", "metachar:sym<nqpvar>", " at pos=", rx1340_pos)
    .return (rx1340_cur)
  rx1340_fail:
.annotate 'line', 562
    (rx1340_rep, rx1340_pos, $I10, $P10) = rx1340_cur."!mark_fail"(0)
    lt rx1340_pos, -1, rx1340_done
    eq rx1340_pos, -1, rx1340_fail
    jump $I10
  rx1340_done:
    rx1340_cur."!cursor_fail"()
    rx1340_cur."!cursor_debug"("FAIL  ", "metachar:sym<nqpvar>")
    .return (rx1340_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<nqpvar>"  :subid("348_1275600007.84296") :method
.annotate 'line', 562
    new $P1342, "ResizablePMCArray"
    push $P1342, "$"
    push $P1342, "@"
    .return ($P1342)
.end


.namespace ["NQP";"Regex"]
.sub "_block1344"  :anon :subid("349_1275600007.84296") :method :outer("347_1275600007.84296")
.annotate 'line', 572
    .local string rx1346_tgt
    .local int rx1346_pos
    .local int rx1346_off
    .local int rx1346_eos
    .local int rx1346_rep
    .local pmc rx1346_cur
    (rx1346_cur, rx1346_pos, rx1346_tgt) = self."!cursor_start"()
    rx1346_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1346_cur
    .local pmc match
    .lex "$/", match
    length rx1346_eos, rx1346_tgt
    gt rx1346_pos, rx1346_eos, rx1346_done
    set rx1346_off, 0
    lt rx1346_pos, 2, rx1346_start
    sub rx1346_off, rx1346_pos, 1
    substr rx1346_tgt, rx1346_tgt, rx1346_off
  rx1346_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1347_done
    goto rxscan1347_scan
  rxscan1347_loop:
    ($P10) = rx1346_cur."from"()
    inc $P10
    set rx1346_pos, $P10
    ge rx1346_pos, rx1346_eos, rxscan1347_done
  rxscan1347_scan:
    set_addr $I10, rxscan1347_loop
    rx1346_cur."!mark_push"(0, rx1346_pos, $I10)
  rxscan1347_done:
  # rx charclass .
    ge rx1346_pos, rx1346_eos, rx1346_fail
    inc rx1346_pos
  # rx charclass w
    ge rx1346_pos, rx1346_eos, rx1346_fail
    sub $I10, rx1346_pos, rx1346_off
    is_cclass $I11, 8192, rx1346_tgt, $I10
    unless $I11, rx1346_fail
    inc rx1346_pos
  # rx pass
    rx1346_cur."!cursor_pass"(rx1346_pos, "")
    rx1346_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1346_pos)
    .return (rx1346_cur)
  rx1346_fail:
    (rx1346_rep, rx1346_pos, $I10, $P10) = rx1346_cur."!mark_fail"(0)
    lt rx1346_pos, -1, rx1346_done
    eq rx1346_pos, -1, rx1346_fail
    jump $I10
  rx1346_done:
    rx1346_cur."!cursor_fail"()
    rx1346_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1346_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("350_1275600007.84296") :method :outer("341_1275600007.84296")
.annotate 'line', 562
    .local string rx1349_tgt
    .local int rx1349_pos
    .local int rx1349_off
    .local int rx1349_eos
    .local int rx1349_rep
    .local pmc rx1349_cur
    (rx1349_cur, rx1349_pos, rx1349_tgt) = self."!cursor_start"()
    rx1349_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1349_cur
    .local pmc match
    .lex "$/", match
    length rx1349_eos, rx1349_tgt
    gt rx1349_pos, rx1349_eos, rx1349_done
    set rx1349_off, 0
    lt rx1349_pos, 2, rx1349_start
    sub rx1349_off, rx1349_pos, 1
    substr rx1349_tgt, rx1349_tgt, rx1349_off
  rx1349_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1352_done
    goto rxscan1352_scan
  rxscan1352_loop:
    ($P10) = rx1349_cur."from"()
    inc $P10
    set rx1349_pos, $P10
    ge rx1349_pos, rx1349_eos, rxscan1352_done
  rxscan1352_scan:
    set_addr $I10, rxscan1352_loop
    rx1349_cur."!mark_push"(0, rx1349_pos, $I10)
  rxscan1352_done:
.annotate 'line', 576
  # rx enumcharlist negate=0 zerowidth
    ge rx1349_pos, rx1349_eos, rx1349_fail
    sub $I10, rx1349_pos, rx1349_off
    substr $S10, rx1349_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1349_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1349_cur."!cursor_pos"(rx1349_pos)
    $P10 = rx1349_cur."codeblock"()
    unless $P10, rx1349_fail
    rx1349_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1349_pos = $P10."pos"()
.annotate 'line', 575
  # rx pass
    rx1349_cur."!cursor_pass"(rx1349_pos, "assertion:sym<{ }>")
    rx1349_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1349_pos)
    .return (rx1349_cur)
  rx1349_fail:
.annotate 'line', 562
    (rx1349_rep, rx1349_pos, $I10, $P10) = rx1349_cur."!mark_fail"(0)
    lt rx1349_pos, -1, rx1349_done
    eq rx1349_pos, -1, rx1349_fail
    jump $I10
  rx1349_done:
    rx1349_cur."!cursor_fail"()
    rx1349_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1349_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("351_1275600007.84296") :method
.annotate 'line', 562
    new $P1351, "ResizablePMCArray"
    push $P1351, "{"
    .return ($P1351)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<?{ }>"  :subid("352_1275600007.84296") :method :outer("341_1275600007.84296")
.annotate 'line', 562
    .const 'Sub' $P1359 = "354_1275600007.84296" 
    capture_lex $P1359
    .local string rx1354_tgt
    .local int rx1354_pos
    .local int rx1354_off
    .local int rx1354_eos
    .local int rx1354_rep
    .local pmc rx1354_cur
    (rx1354_cur, rx1354_pos, rx1354_tgt) = self."!cursor_start"()
    rx1354_cur."!cursor_debug"("START ", "assertion:sym<?{ }>")
    .lex unicode:"$\x{a2}", rx1354_cur
    .local pmc match
    .lex "$/", match
    length rx1354_eos, rx1354_tgt
    gt rx1354_pos, rx1354_eos, rx1354_done
    set rx1354_off, 0
    lt rx1354_pos, 2, rx1354_start
    sub rx1354_off, rx1354_pos, 1
    substr rx1354_tgt, rx1354_tgt, rx1354_off
  rx1354_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1357_done
    goto rxscan1357_scan
  rxscan1357_loop:
    ($P10) = rx1354_cur."from"()
    inc $P10
    set rx1354_pos, $P10
    ge rx1354_pos, rx1354_eos, rxscan1357_done
  rxscan1357_scan:
    set_addr $I10, rxscan1357_loop
    rx1354_cur."!mark_push"(0, rx1354_pos, $I10)
  rxscan1357_done:
.annotate 'line', 580
  # rx subcapture "zw"
    set_addr $I10, rxcap_1362_fail
    rx1354_cur."!mark_push"(0, rx1354_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx1354_pos, rx1354_eos, rx1354_fail
    sub $I10, rx1354_pos, rx1354_off
    substr $S10, rx1354_tgt, $I10, 1
    index $I11, "?!", $S10
    lt $I11, 0, rx1354_fail
    inc rx1354_pos
  # rx subrule "before" subtype=zerowidth negate=
    rx1354_cur."!cursor_pos"(rx1354_pos)
    .const 'Sub' $P1359 = "354_1275600007.84296" 
    capture_lex $P1359
    $P10 = rx1354_cur."before"($P1359)
    unless $P10, rx1354_fail
    set_addr $I10, rxcap_1362_fail
    ($I12, $I11) = rx1354_cur."!mark_peek"($I10)
    rx1354_cur."!cursor_pos"($I11)
    ($P10) = rx1354_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1354_pos, "")
    rx1354_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("zw")
    goto rxcap_1362_done
  rxcap_1362_fail:
    goto rx1354_fail
  rxcap_1362_done:
  # rx subrule "codeblock" subtype=capture negate=
    rx1354_cur."!cursor_pos"(rx1354_pos)
    $P10 = rx1354_cur."codeblock"()
    unless $P10, rx1354_fail
    rx1354_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1354_pos = $P10."pos"()
.annotate 'line', 579
  # rx pass
    rx1354_cur."!cursor_pass"(rx1354_pos, "assertion:sym<?{ }>")
    rx1354_cur."!cursor_debug"("PASS  ", "assertion:sym<?{ }>", " at pos=", rx1354_pos)
    .return (rx1354_cur)
  rx1354_fail:
.annotate 'line', 562
    (rx1354_rep, rx1354_pos, $I10, $P10) = rx1354_cur."!mark_fail"(0)
    lt rx1354_pos, -1, rx1354_done
    eq rx1354_pos, -1, rx1354_fail
    jump $I10
  rx1354_done:
    rx1354_cur."!cursor_fail"()
    rx1354_cur."!cursor_debug"("FAIL  ", "assertion:sym<?{ }>")
    .return (rx1354_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<?{ }>"  :subid("353_1275600007.84296") :method
.annotate 'line', 562
    new $P1356, "ResizablePMCArray"
    push $P1356, "!"
    push $P1356, "?"
    .return ($P1356)
.end


.namespace ["NQP";"Regex"]
.sub "_block1358"  :anon :subid("354_1275600007.84296") :method :outer("352_1275600007.84296")
.annotate 'line', 580
    .local string rx1360_tgt
    .local int rx1360_pos
    .local int rx1360_off
    .local int rx1360_eos
    .local int rx1360_rep
    .local pmc rx1360_cur
    (rx1360_cur, rx1360_pos, rx1360_tgt) = self."!cursor_start"()
    rx1360_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1360_cur
    .local pmc match
    .lex "$/", match
    length rx1360_eos, rx1360_tgt
    gt rx1360_pos, rx1360_eos, rx1360_done
    set rx1360_off, 0
    lt rx1360_pos, 2, rx1360_start
    sub rx1360_off, rx1360_pos, 1
    substr rx1360_tgt, rx1360_tgt, rx1360_off
  rx1360_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1361_done
    goto rxscan1361_scan
  rxscan1361_loop:
    ($P10) = rx1360_cur."from"()
    inc $P10
    set rx1360_pos, $P10
    ge rx1360_pos, rx1360_eos, rxscan1361_done
  rxscan1361_scan:
    set_addr $I10, rxscan1361_loop
    rx1360_cur."!mark_push"(0, rx1360_pos, $I10)
  rxscan1361_done:
  # rx literal  "{"
    add $I11, rx1360_pos, 1
    gt $I11, rx1360_eos, rx1360_fail
    sub $I11, rx1360_pos, rx1360_off
    substr $S10, rx1360_tgt, $I11, 1
    ne $S10, "{", rx1360_fail
    add rx1360_pos, 1
  # rx pass
    rx1360_cur."!cursor_pass"(rx1360_pos, "")
    rx1360_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1360_pos)
    .return (rx1360_cur)
  rx1360_fail:
    (rx1360_rep, rx1360_pos, $I10, $P10) = rx1360_cur."!mark_fail"(0)
    lt rx1360_pos, -1, rx1360_done
    eq rx1360_pos, -1, rx1360_fail
    jump $I10
  rx1360_done:
    rx1360_cur."!cursor_fail"()
    rx1360_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1360_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("355_1275600007.84296") :method :outer("341_1275600007.84296")
.annotate 'line', 562
    .const 'Sub' $P1372 = "357_1275600007.84296" 
    capture_lex $P1372
    .local string rx1364_tgt
    .local int rx1364_pos
    .local int rx1364_off
    .local int rx1364_eos
    .local int rx1364_rep
    .local pmc rx1364_cur
    (rx1364_cur, rx1364_pos, rx1364_tgt) = self."!cursor_start"()
    rx1364_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1364_cur."!cursor_caparray"("nibbler", "arglist", "assertion")
    .lex unicode:"$\x{a2}", rx1364_cur
    .local pmc match
    .lex "$/", match
    length rx1364_eos, rx1364_tgt
    gt rx1364_pos, rx1364_eos, rx1364_done
    set rx1364_off, 0
    lt rx1364_pos, 2, rx1364_start
    sub rx1364_off, rx1364_pos, 1
    substr rx1364_tgt, rx1364_tgt, rx1364_off
  rx1364_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1367_done
    goto rxscan1367_scan
  rxscan1367_loop:
    ($P10) = rx1364_cur."from"()
    inc $P10
    set rx1364_pos, $P10
    ge rx1364_pos, rx1364_eos, rxscan1367_done
  rxscan1367_scan:
    set_addr $I10, rxscan1367_loop
    rx1364_cur."!mark_push"(0, rx1364_pos, $I10)
  rxscan1367_done:
.annotate 'line', 584
  # rx subcapture "longname"
    set_addr $I10, rxcap_1368_fail
    rx1364_cur."!mark_push"(0, rx1364_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1364_pos, rx1364_off
    find_not_cclass $I11, 8192, rx1364_tgt, $I10, rx1364_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1364_fail
    add rx1364_pos, rx1364_off, $I11
    set_addr $I10, rxcap_1368_fail
    ($I12, $I11) = rx1364_cur."!mark_peek"($I10)
    rx1364_cur."!cursor_pos"($I11)
    ($P10) = rx1364_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1364_pos, "")
    rx1364_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_1368_done
  rxcap_1368_fail:
    goto rx1364_fail
  rxcap_1368_done:
.annotate 'line', 591
  # rx rxquantr1369 ** 0..1
    set_addr $I1375, rxquantr1369_done
    rx1364_cur."!mark_push"(0, rx1364_pos, $I1375)
  rxquantr1369_loop:
  alt1370_0:
.annotate 'line', 585
    set_addr $I10, alt1370_1
    rx1364_cur."!mark_push"(0, rx1364_pos, $I10)
.annotate 'line', 586
  # rx subrule "before" subtype=zerowidth negate=
    rx1364_cur."!cursor_pos"(rx1364_pos)
    .const 'Sub' $P1372 = "357_1275600007.84296" 
    capture_lex $P1372
    $P10 = rx1364_cur."before"($P1372)
    unless $P10, rx1364_fail
    goto alt1370_end
  alt1370_1:
    set_addr $I10, alt1370_2
    rx1364_cur."!mark_push"(0, rx1364_pos, $I10)
.annotate 'line', 587
  # rx literal  "="
    add $I11, rx1364_pos, 1
    gt $I11, rx1364_eos, rx1364_fail
    sub $I11, rx1364_pos, rx1364_off
    substr $S10, rx1364_tgt, $I11, 1
    ne $S10, "=", rx1364_fail
    add rx1364_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1364_cur."!cursor_pos"(rx1364_pos)
    $P10 = rx1364_cur."assertion"()
    unless $P10, rx1364_fail
    rx1364_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1364_pos = $P10."pos"()
    goto alt1370_end
  alt1370_2:
    set_addr $I10, alt1370_3
    rx1364_cur."!mark_push"(0, rx1364_pos, $I10)
.annotate 'line', 588
  # rx literal  ":"
    add $I11, rx1364_pos, 1
    gt $I11, rx1364_eos, rx1364_fail
    sub $I11, rx1364_pos, rx1364_off
    substr $S10, rx1364_tgt, $I11, 1
    ne $S10, ":", rx1364_fail
    add rx1364_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1364_cur."!cursor_pos"(rx1364_pos)
    $P10 = rx1364_cur."arglist"()
    unless $P10, rx1364_fail
    rx1364_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1364_pos = $P10."pos"()
    goto alt1370_end
  alt1370_3:
    set_addr $I10, alt1370_4
    rx1364_cur."!mark_push"(0, rx1364_pos, $I10)
.annotate 'line', 589
  # rx literal  "("
    add $I11, rx1364_pos, 1
    gt $I11, rx1364_eos, rx1364_fail
    sub $I11, rx1364_pos, rx1364_off
    substr $S10, rx1364_tgt, $I11, 1
    ne $S10, "(", rx1364_fail
    add rx1364_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1364_cur."!cursor_pos"(rx1364_pos)
    $P10 = rx1364_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1364_fail
    rx1364_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1364_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1364_pos, 1
    gt $I11, rx1364_eos, rx1364_fail
    sub $I11, rx1364_pos, rx1364_off
    substr $S10, rx1364_tgt, $I11, 1
    ne $S10, ")", rx1364_fail
    add rx1364_pos, 1
    goto alt1370_end
  alt1370_4:
.annotate 'line', 590
  # rx subrule "normspace" subtype=method negate=
    rx1364_cur."!cursor_pos"(rx1364_pos)
    $P10 = rx1364_cur."normspace"()
    unless $P10, rx1364_fail
    rx1364_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1364_cur."!cursor_pos"(rx1364_pos)
    $P10 = rx1364_cur."nibbler"()
    unless $P10, rx1364_fail
    rx1364_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1364_pos = $P10."pos"()
  alt1370_end:
.annotate 'line', 591
    (rx1364_rep) = rx1364_cur."!mark_commit"($I1375)
  rxquantr1369_done:
.annotate 'line', 583
  # rx pass
    rx1364_cur."!cursor_pass"(rx1364_pos, "assertion:sym<name>")
    rx1364_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1364_pos)
    .return (rx1364_cur)
  rx1364_fail:
.annotate 'line', 562
    (rx1364_rep, rx1364_pos, $I10, $P10) = rx1364_cur."!mark_fail"(0)
    lt rx1364_pos, -1, rx1364_done
    eq rx1364_pos, -1, rx1364_fail
    jump $I10
  rx1364_done:
    rx1364_cur."!cursor_fail"()
    rx1364_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1364_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("356_1275600007.84296") :method
.annotate 'line', 562
    new $P1366, "ResizablePMCArray"
    push $P1366, ""
    .return ($P1366)
.end


.namespace ["NQP";"Regex"]
.sub "_block1371"  :anon :subid("357_1275600007.84296") :method :outer("355_1275600007.84296")
.annotate 'line', 586
    .local string rx1373_tgt
    .local int rx1373_pos
    .local int rx1373_off
    .local int rx1373_eos
    .local int rx1373_rep
    .local pmc rx1373_cur
    (rx1373_cur, rx1373_pos, rx1373_tgt) = self."!cursor_start"()
    rx1373_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1373_cur
    .local pmc match
    .lex "$/", match
    length rx1373_eos, rx1373_tgt
    gt rx1373_pos, rx1373_eos, rx1373_done
    set rx1373_off, 0
    lt rx1373_pos, 2, rx1373_start
    sub rx1373_off, rx1373_pos, 1
    substr rx1373_tgt, rx1373_tgt, rx1373_off
  rx1373_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1374_done
    goto rxscan1374_scan
  rxscan1374_loop:
    ($P10) = rx1373_cur."from"()
    inc $P10
    set rx1373_pos, $P10
    ge rx1373_pos, rx1373_eos, rxscan1374_done
  rxscan1374_scan:
    set_addr $I10, rxscan1374_loop
    rx1373_cur."!mark_push"(0, rx1373_pos, $I10)
  rxscan1374_done:
  # rx literal  ">"
    add $I11, rx1373_pos, 1
    gt $I11, rx1373_eos, rx1373_fail
    sub $I11, rx1373_pos, rx1373_off
    substr $S10, rx1373_tgt, $I11, 1
    ne $S10, ">", rx1373_fail
    add rx1373_pos, 1
  # rx pass
    rx1373_cur."!cursor_pass"(rx1373_pos, "")
    rx1373_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1373_pos)
    .return (rx1373_cur)
  rx1373_fail:
    (rx1373_rep, rx1373_pos, $I10, $P10) = rx1373_cur."!mark_fail"(0)
    lt rx1373_pos, -1, rx1373_done
    eq rx1373_pos, -1, rx1373_fail
    jump $I10
  rx1373_done:
    rx1373_cur."!cursor_fail"()
    rx1373_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1373_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<var>"  :subid("358_1275600007.84296") :method :outer("341_1275600007.84296")
.annotate 'line', 562
    .local string rx1377_tgt
    .local int rx1377_pos
    .local int rx1377_off
    .local int rx1377_eos
    .local int rx1377_rep
    .local pmc rx1377_cur
    (rx1377_cur, rx1377_pos, rx1377_tgt) = self."!cursor_start"()
    rx1377_cur."!cursor_debug"("START ", "assertion:sym<var>")
    .lex unicode:"$\x{a2}", rx1377_cur
    .local pmc match
    .lex "$/", match
    length rx1377_eos, rx1377_tgt
    gt rx1377_pos, rx1377_eos, rx1377_done
    set rx1377_off, 0
    lt rx1377_pos, 2, rx1377_start
    sub rx1377_off, rx1377_pos, 1
    substr rx1377_tgt, rx1377_tgt, rx1377_off
  rx1377_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1380_done
    goto rxscan1380_scan
  rxscan1380_loop:
    ($P10) = rx1377_cur."from"()
    inc $P10
    set rx1377_pos, $P10
    ge rx1377_pos, rx1377_eos, rxscan1380_done
  rxscan1380_scan:
    set_addr $I10, rxscan1380_loop
    rx1377_cur."!mark_push"(0, rx1377_pos, $I10)
  rxscan1380_done:
.annotate 'line', 595
  # rx enumcharlist negate=0 zerowidth
    ge rx1377_pos, rx1377_eos, rx1377_fail
    sub $I10, rx1377_pos, rx1377_off
    substr $S10, rx1377_tgt, $I10, 1
    index $I11, "$@", $S10
    lt $I11, 0, rx1377_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1377_cur."!cursor_pos"(rx1377_pos)
    $P10 = rx1377_cur."LANG"("MAIN", "variable")
    unless $P10, rx1377_fail
    rx1377_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("var")
    rx1377_pos = $P10."pos"()
.annotate 'line', 594
  # rx pass
    rx1377_cur."!cursor_pass"(rx1377_pos, "assertion:sym<var>")
    rx1377_cur."!cursor_debug"("PASS  ", "assertion:sym<var>", " at pos=", rx1377_pos)
    .return (rx1377_cur)
  rx1377_fail:
.annotate 'line', 562
    (rx1377_rep, rx1377_pos, $I10, $P10) = rx1377_cur."!mark_fail"(0)
    lt rx1377_pos, -1, rx1377_done
    eq rx1377_pos, -1, rx1377_fail
    jump $I10
  rx1377_done:
    rx1377_cur."!cursor_fail"()
    rx1377_cur."!cursor_debug"("FAIL  ", "assertion:sym<var>")
    .return (rx1377_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<var>"  :subid("359_1275600007.84296") :method
.annotate 'line', 562
    new $P1379, "ResizablePMCArray"
    push $P1379, "$"
    push $P1379, "@"
    .return ($P1379)
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("360_1275600007.84296") :method :outer("341_1275600007.84296")
.annotate 'line', 562
    .local string rx1382_tgt
    .local int rx1382_pos
    .local int rx1382_off
    .local int rx1382_eos
    .local int rx1382_rep
    .local pmc rx1382_cur
    (rx1382_cur, rx1382_pos, rx1382_tgt) = self."!cursor_start"()
    rx1382_cur."!cursor_debug"("START ", "codeblock")
    .lex unicode:"$\x{a2}", rx1382_cur
    .local pmc match
    .lex "$/", match
    length rx1382_eos, rx1382_tgt
    gt rx1382_pos, rx1382_eos, rx1382_done
    set rx1382_off, 0
    lt rx1382_pos, 2, rx1382_start
    sub rx1382_off, rx1382_pos, 1
    substr rx1382_tgt, rx1382_tgt, rx1382_off
  rx1382_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1386_done
    goto rxscan1386_scan
  rxscan1386_loop:
    ($P10) = rx1382_cur."from"()
    inc $P10
    set rx1382_pos, $P10
    ge rx1382_pos, rx1382_eos, rxscan1386_done
  rxscan1386_scan:
    set_addr $I10, rxscan1386_loop
    rx1382_cur."!mark_push"(0, rx1382_pos, $I10)
  rxscan1386_done:
.annotate 'line', 599
  # rx subrule "LANG" subtype=capture negate=
    rx1382_cur."!cursor_pos"(rx1382_pos)
    $P10 = rx1382_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1382_fail
    rx1382_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1382_pos = $P10."pos"()
.annotate 'line', 598
  # rx pass
    rx1382_cur."!cursor_pass"(rx1382_pos, "codeblock")
    rx1382_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1382_pos)
    .return (rx1382_cur)
  rx1382_fail:
.annotate 'line', 562
    (rx1382_rep, rx1382_pos, $I10, $P10) = rx1382_cur."!mark_fail"(0)
    lt rx1382_pos, -1, rx1382_done
    eq rx1382_pos, -1, rx1382_fail
    jump $I10
  rx1382_done:
    rx1382_cur."!cursor_fail"()
    rx1382_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1382_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("361_1275600007.84296") :method
.annotate 'line', 562
    $P1384 = self."!PREFIX__!subrule"("block", "")
    new $P1385, "ResizablePMCArray"
    push $P1385, $P1384
    .return ($P1385)
.end


.namespace ["NQP";"Grammar"]
.sub "_block1388" :load :anon :subid("362_1275600007.84296")
.annotate 'line', 4
    .const 'Sub' $P1390 = "11_1275600007.84296" 
    $P1391 = $P1390()
    .return ($P1391)
.end


.namespace []
.sub "_block1409" :load :anon :subid("363_1275600007.84296")
.annotate 'line', 1
    .const 'Sub' $P1411 = "10_1275600007.84296" 
    $P1412 = $P1411()
    .return ($P1412)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1275600017.58296")
.annotate 'line', 0
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
    $P2424 = $P14()
.annotate 'line', 1
    .return ($P2424)
    .const 'Sub' $P2426 = "143_1275600017.58296" 
    .return ($P2426)
.end


.namespace []
.sub "" :load :init :subid("post144") :outer("10_1275600017.58296")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1275600017.58296" 
    .local pmc block
    set block, $P12
    $P2429 = get_root_global ["parrot"], "P6metaclass"
    $P2429."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1275600017.58296") :outer("10_1275600017.58296")
.annotate 'line', 3
    .const 'Sub' $P2420 = "142_1275600017.58296" 
    capture_lex $P2420
    get_hll_global $P2304, ["NQP";"RegexActions"], "_block2303" 
    capture_lex $P2304
    .const 'Sub' $P2293 = "132_1275600017.58296" 
    capture_lex $P2293
    .const 'Sub' $P2286 = "131_1275600017.58296" 
    capture_lex $P2286
    .const 'Sub' $P2279 = "130_1275600017.58296" 
    capture_lex $P2279
    .const 'Sub' $P2272 = "129_1275600017.58296" 
    capture_lex $P2272
    .const 'Sub' $P2259 = "128_1275600017.58296" 
    capture_lex $P2259
    .const 'Sub' $P2249 = "127_1275600017.58296" 
    capture_lex $P2249
    .const 'Sub' $P2239 = "126_1275600017.58296" 
    capture_lex $P2239
    .const 'Sub' $P2229 = "125_1275600017.58296" 
    capture_lex $P2229
    .const 'Sub' $P2222 = "124_1275600017.58296" 
    capture_lex $P2222
    .const 'Sub' $P2208 = "123_1275600017.58296" 
    capture_lex $P2208
    .const 'Sub' $P2198 = "122_1275600017.58296" 
    capture_lex $P2198
    .const 'Sub' $P2161 = "121_1275600017.58296" 
    capture_lex $P2161
    .const 'Sub' $P2147 = "120_1275600017.58296" 
    capture_lex $P2147
    .const 'Sub' $P2137 = "119_1275600017.58296" 
    capture_lex $P2137
    .const 'Sub' $P2127 = "118_1275600017.58296" 
    capture_lex $P2127
    .const 'Sub' $P2117 = "117_1275600017.58296" 
    capture_lex $P2117
    .const 'Sub' $P2107 = "116_1275600017.58296" 
    capture_lex $P2107
    .const 'Sub' $P2097 = "115_1275600017.58296" 
    capture_lex $P2097
    .const 'Sub' $P2069 = "114_1275600017.58296" 
    capture_lex $P2069
    .const 'Sub' $P2052 = "113_1275600017.58296" 
    capture_lex $P2052
    .const 'Sub' $P2042 = "112_1275600017.58296" 
    capture_lex $P2042
    .const 'Sub' $P2029 = "111_1275600017.58296" 
    capture_lex $P2029
    .const 'Sub' $P2016 = "110_1275600017.58296" 
    capture_lex $P2016
    .const 'Sub' $P2003 = "109_1275600017.58296" 
    capture_lex $P2003
    .const 'Sub' $P1993 = "108_1275600017.58296" 
    capture_lex $P1993
    .const 'Sub' $P1964 = "107_1275600017.58296" 
    capture_lex $P1964
    .const 'Sub' $P1940 = "106_1275600017.58296" 
    capture_lex $P1940
    .const 'Sub' $P1930 = "105_1275600017.58296" 
    capture_lex $P1930
    .const 'Sub' $P1920 = "104_1275600017.58296" 
    capture_lex $P1920
    .const 'Sub' $P1893 = "103_1275600017.58296" 
    capture_lex $P1893
    .const 'Sub' $P1875 = "102_1275600017.58296" 
    capture_lex $P1875
    .const 'Sub' $P1865 = "101_1275600017.58296" 
    capture_lex $P1865
    .const 'Sub' $P1761 = "98_1275600017.58296" 
    capture_lex $P1761
    .const 'Sub' $P1751 = "97_1275600017.58296" 
    capture_lex $P1751
    .const 'Sub' $P1722 = "96_1275600017.58296" 
    capture_lex $P1722
    .const 'Sub' $P1680 = "95_1275600017.58296" 
    capture_lex $P1680
    .const 'Sub' $P1664 = "94_1275600017.58296" 
    capture_lex $P1664
    .const 'Sub' $P1655 = "93_1275600017.58296" 
    capture_lex $P1655
    .const 'Sub' $P1623 = "92_1275600017.58296" 
    capture_lex $P1623
    .const 'Sub' $P1524 = "89_1275600017.58296" 
    capture_lex $P1524
    .const 'Sub' $P1507 = "88_1275600017.58296" 
    capture_lex $P1507
    .const 'Sub' $P1487 = "87_1275600017.58296" 
    capture_lex $P1487
    .const 'Sub' $P1375 = "84_1275600017.58296" 
    capture_lex $P1375
    .const 'Sub' $P1318 = "80_1275600017.58296" 
    capture_lex $P1318
    .const 'Sub' $P1278 = "78_1275600017.58296" 
    capture_lex $P1278
    .const 'Sub' $P1228 = "76_1275600017.58296" 
    capture_lex $P1228
    .const 'Sub' $P1218 = "75_1275600017.58296" 
    capture_lex $P1218
    .const 'Sub' $P1208 = "74_1275600017.58296" 
    capture_lex $P1208
    .const 'Sub' $P1137 = "72_1275600017.58296" 
    capture_lex $P1137
    .const 'Sub' $P1127 = "71_1275600017.58296" 
    capture_lex $P1127
    .const 'Sub' $P1110 = "70_1275600017.58296" 
    capture_lex $P1110
    .const 'Sub' $P1093 = "69_1275600017.58296" 
    capture_lex $P1093
    .const 'Sub' $P1076 = "68_1275600017.58296" 
    capture_lex $P1076
    .const 'Sub' $P1066 = "67_1275600017.58296" 
    capture_lex $P1066
    .const 'Sub' $P1056 = "66_1275600017.58296" 
    capture_lex $P1056
    .const 'Sub' $P1046 = "65_1275600017.58296" 
    capture_lex $P1046
    .const 'Sub' $P1022 = "64_1275600017.58296" 
    capture_lex $P1022
    .const 'Sub' $P969 = "63_1275600017.58296" 
    capture_lex $P969
    .const 'Sub' $P959 = "62_1275600017.58296" 
    capture_lex $P959
    .const 'Sub' $P870 = "60_1275600017.58296" 
    capture_lex $P870
    .const 'Sub' $P844 = "59_1275600017.58296" 
    capture_lex $P844
    .const 'Sub' $P828 = "58_1275600017.58296" 
    capture_lex $P828
    .const 'Sub' $P818 = "57_1275600017.58296" 
    capture_lex $P818
    .const 'Sub' $P808 = "56_1275600017.58296" 
    capture_lex $P808
    .const 'Sub' $P798 = "55_1275600017.58296" 
    capture_lex $P798
    .const 'Sub' $P788 = "54_1275600017.58296" 
    capture_lex $P788
    .const 'Sub' $P778 = "53_1275600017.58296" 
    capture_lex $P778
    .const 'Sub' $P768 = "52_1275600017.58296" 
    capture_lex $P768
    .const 'Sub' $P758 = "51_1275600017.58296" 
    capture_lex $P758
    .const 'Sub' $P748 = "50_1275600017.58296" 
    capture_lex $P748
    .const 'Sub' $P738 = "49_1275600017.58296" 
    capture_lex $P738
    .const 'Sub' $P728 = "48_1275600017.58296" 
    capture_lex $P728
    .const 'Sub' $P718 = "47_1275600017.58296" 
    capture_lex $P718
    .const 'Sub' $P708 = "46_1275600017.58296" 
    capture_lex $P708
    .const 'Sub' $P698 = "45_1275600017.58296" 
    capture_lex $P698
    .const 'Sub' $P680 = "44_1275600017.58296" 
    capture_lex $P680
    .const 'Sub' $P645 = "43_1275600017.58296" 
    capture_lex $P645
    .const 'Sub' $P629 = "42_1275600017.58296" 
    capture_lex $P629
    .const 'Sub' $P608 = "41_1275600017.58296" 
    capture_lex $P608
    .const 'Sub' $P588 = "40_1275600017.58296" 
    capture_lex $P588
    .const 'Sub' $P575 = "39_1275600017.58296" 
    capture_lex $P575
    .const 'Sub' $P549 = "38_1275600017.58296" 
    capture_lex $P549
    .const 'Sub' $P513 = "37_1275600017.58296" 
    capture_lex $P513
    .const 'Sub' $P496 = "36_1275600017.58296" 
    capture_lex $P496
    .const 'Sub' $P482 = "35_1275600017.58296" 
    capture_lex $P482
    .const 'Sub' $P429 = "33_1275600017.58296" 
    capture_lex $P429
    .const 'Sub' $P418 = "32_1275600017.58296" 
    capture_lex $P418
    .const 'Sub' $P405 = "31_1275600017.58296" 
    capture_lex $P405
    .const 'Sub' $P385 = "30_1275600017.58296" 
    capture_lex $P385
    .const 'Sub' $P375 = "29_1275600017.58296" 
    capture_lex $P375
    .const 'Sub' $P365 = "28_1275600017.58296" 
    capture_lex $P365
    .const 'Sub' $P349 = "27_1275600017.58296" 
    capture_lex $P349
    .const 'Sub' $P289 = "25_1275600017.58296" 
    capture_lex $P289
    .const 'Sub' $P246 = "23_1275600017.58296" 
    capture_lex $P246
    .const 'Sub' $P214 = "22_1275600017.58296" 
    capture_lex $P214
    .const 'Sub' $P181 = "21_1275600017.58296" 
    capture_lex $P181
    .const 'Sub' $P171 = "20_1275600017.58296" 
    capture_lex $P171
    .const 'Sub' $P151 = "19_1275600017.58296" 
    capture_lex $P151
    .const 'Sub' $P100 = "18_1275600017.58296" 
    capture_lex $P100
    .const 'Sub' $P84 = "17_1275600017.58296" 
    capture_lex $P84
    .const 'Sub' $P63 = "16_1275600017.58296" 
    capture_lex $P63
    .const 'Sub' $P27 = "13_1275600017.58296" 
    capture_lex $P27
    .const 'Sub' $P16 = "12_1275600017.58296" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_147
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P15
  vivify_147:
.annotate 'line', 9
    .const 'Sub' $P16 = "12_1275600017.58296" 
    newclosure $P26, $P16
    .lex "xblock_immediate", $P26
.annotate 'line', 14
    .const 'Sub' $P27 = "13_1275600017.58296" 
    newclosure $P62, $P27
    .lex "block_immediate", $P62
.annotate 'line', 24
    .const 'Sub' $P63 = "16_1275600017.58296" 
    newclosure $P83, $P63
    .lex "vivitype", $P83
.annotate 'line', 43
    .const 'Sub' $P84 = "17_1275600017.58296" 
    newclosure $P99, $P84
    .lex "colonpair_str", $P99
.annotate 'line', 213
    .const 'Sub' $P100 = "18_1275600017.58296" 
    newclosure $P150, $P100
    .lex "push_block_handler", $P150
.annotate 'line', 822
    .const 'Sub' $P151 = "19_1275600017.58296" 
    newclosure $P166, $P151
    .lex "control", $P166
.annotate 'line', 3
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    get_global $P167, "@BLOCK"
.annotate 'line', 5
    find_lex $P168, "xblock_immediate"
    find_lex $P169, "block_immediate"
    find_lex $P170, "vivitype"
.annotate 'line', 35
    find_lex $P213, "colonpair_str"
.annotate 'line', 206
    find_lex $P628, "push_block_handler"
.annotate 'line', 813
    find_lex $P2271, "control"
.annotate 'line', 844
    get_hll_global $P2304, ["NQP";"RegexActions"], "_block2303" 
    capture_lex $P2304
    $P2414 = $P2304()
.annotate 'line', 3
    .return ($P2414)
    .const 'Sub' $P2416 = "141_1275600017.58296" 
    .return ($P2416)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post145") :outer("11_1275600017.58296")
.annotate 'line', 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 5
    .const 'Sub' $P2420 = "142_1275600017.58296" 
    capture_lex $P2420
    $P2420()
    $P2423 = get_root_global ["parrot"], "P6metaclass"
    $P2423."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block2419"  :anon :subid("142_1275600017.58296") :outer("11_1275600017.58296")
.annotate 'line', 6
    get_global $P2421, "@BLOCK"
    unless_null $P2421, vivify_146
    $P2421 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P2421
  vivify_146:
 $P2422 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P2422
.annotate 'line', 5
    .return ($P2422)
.end


.namespace ["NQP";"Actions"]
.sub "xblock_immediate"  :subid("12_1275600017.58296") :outer("11_1275600017.58296")
    .param pmc param_19
.annotate 'line', 9
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(57)
    push_eh $P18
    .lex "$xblock", param_19
.annotate 'line', 10
    find_lex $P20, "$xblock"
    unless_null $P20, vivify_148
    $P20 = root_new ['parrot';'ResizablePMCArray']
  vivify_148:
    set $P21, $P20[1]
    unless_null $P21, vivify_149
    new $P21, "Undef"
  vivify_149:
    $P22 = "block_immediate"($P21)
    find_lex $P23, "$xblock"
    unless_null $P23, vivify_150
    $P23 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$xblock", $P23
  vivify_150:
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
.sub "block_immediate"  :subid("13_1275600017.58296") :outer("11_1275600017.58296")
    .param pmc param_30
.annotate 'line', 14
    .const 'Sub' $P40 = "14_1275600017.58296" 
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
    .const 'Sub' $P40 = "14_1275600017.58296" 
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
.sub "_block39"  :anon :subid("14_1275600017.58296") :outer("13_1275600017.58296")
.annotate 'line', 16
    .const 'Sub' $P51 = "15_1275600017.58296" 
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
    unless $I48, for_undef_151
    iter $P45, $P47
    new $P57, 'ExceptionHandler'
    set_addr $P57, loop56_handler
    $P57."handle_types"(64, 66, 65)
    push_eh $P57
  loop56_test:
    unless $P45, loop56_done
    shift $P49, $P45
  loop56_redo:
    .const 'Sub' $P51 = "15_1275600017.58296" 
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
  for_undef_151:
.annotate 'line', 19
    find_lex $P59, "$stmts"
    store_lex "$block", $P59
.annotate 'line', 16
    .return ($P59)
.end


.namespace ["NQP";"Actions"]
.sub "_block50"  :anon :subid("15_1275600017.58296") :outer("14_1275600017.58296")
    .param pmc param_52
.annotate 'line', 18
    .lex "$_", param_52
    find_lex $P53, "$stmts"
    find_lex $P54, "$_"
    $P55 = $P53."push"($P54)
    .return ($P55)
.end


.namespace ["NQP";"Actions"]
.sub "vivitype"  :subid("16_1275600017.58296") :outer("11_1275600017.58296")
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
.sub "colonpair_str"  :subid("17_1275600017.58296") :outer("11_1275600017.58296")
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
.sub "push_block_handler"  :subid("18_1275600017.58296") :outer("11_1275600017.58296")
    .param pmc param_103
    .param pmc param_104
.annotate 'line', 213
    new $P102, 'ExceptionHandler'
    set_addr $P102, control_101
    $P102."handle_types"(57)
    push_eh $P102
    .lex "$/", param_103
    .lex "$block", param_104
.annotate 'line', 214
    get_global $P106, "@BLOCK"
    unless_null $P106, vivify_152
    $P106 = root_new ['parrot';'ResizablePMCArray']
  vivify_152:
    set $P107, $P106[0]
    unless_null $P107, vivify_153
    new $P107, "Undef"
  vivify_153:
    $P108 = $P107."handlers"()
    if $P108, unless_105_end
.annotate 'line', 215
    get_global $P109, "@BLOCK"
    unless_null $P109, vivify_154
    $P109 = root_new ['parrot';'ResizablePMCArray']
  vivify_154:
    set $P110, $P109[0]
    unless_null $P110, vivify_155
    new $P110, "Undef"
  vivify_155:
    new $P111, "ResizablePMCArray"
    $P110."handlers"($P111)
  unless_105_end:
.annotate 'line', 217
    find_lex $P113, "$block"
    $P114 = $P113."arity"()
    if $P114, unless_112_end
.annotate 'line', 218
    find_lex $P115, "$block"
.annotate 'line', 219
    get_hll_global $P116, ["PAST"], "Op"
.annotate 'line', 220
    get_hll_global $P117, ["PAST"], "Var"
    $P118 = $P117."new"("lexical" :named("scope"), "$!" :named("name"), 1 :named("isdecl"))
.annotate 'line', 221
    get_hll_global $P119, ["PAST"], "Var"
    $P120 = $P119."new"("lexical" :named("scope"), "$_" :named("name"))
    $P121 = $P116."new"($P118, $P120, "bind" :named("pasttype"))
.annotate 'line', 219
    $P115."unshift"($P121)
.annotate 'line', 224
    find_lex $P122, "$block"
    get_hll_global $P123, ["PAST"], "Var"
    $P124 = $P123."new"("$_" :named("name"), "parameter" :named("scope"))
    $P122."unshift"($P124)
.annotate 'line', 225
    find_lex $P125, "$block"
    $P125."symbol"("$_", "lexical" :named("scope"))
.annotate 'line', 226
    find_lex $P126, "$block"
    $P126."symbol"("$!", "lexical" :named("scope"))
.annotate 'line', 227
    find_lex $P127, "$block"
    $P127."arity"(1)
  unless_112_end:
.annotate 'line', 229
    find_lex $P128, "$block"
    $P128."blocktype"("declaration")
.annotate 'line', 230
    get_global $P129, "@BLOCK"
    unless_null $P129, vivify_156
    $P129 = root_new ['parrot';'ResizablePMCArray']
  vivify_156:
    set $P130, $P129[0]
    unless_null $P130, vivify_157
    new $P130, "Undef"
  vivify_157:
    $P131 = $P130."handlers"()
.annotate 'line', 231
    get_hll_global $P132, ["PAST"], "Control"
    find_lex $P133, "$/"
.annotate 'line', 233
    get_hll_global $P134, ["PAST"], "Stmts"
.annotate 'line', 234
    get_hll_global $P135, ["PAST"], "Op"
    find_lex $P136, "$block"
.annotate 'line', 236
    get_hll_global $P137, ["PAST"], "Var"
    $P138 = $P137."new"("register" :named("scope"), "exception" :named("name"))
    $P139 = $P135."new"($P136, $P138, "call" :named("pasttype"))
.annotate 'line', 238
    get_hll_global $P140, ["PAST"], "Op"
.annotate 'line', 239
    get_hll_global $P141, ["PAST"], "Var"
.annotate 'line', 240
    get_hll_global $P142, ["PAST"], "Var"
    $P143 = $P142."new"("register" :named("scope"), "exception" :named("name"))
    $P144 = $P141."new"($P143, "handled", "keyed" :named("scope"))
.annotate 'line', 239
    $P145 = $P140."new"($P144, 1, "bind" :named("pasttype"))
.annotate 'line', 238
    $P146 = $P134."new"($P139, $P145)
.annotate 'line', 233
    $P147 = $P132."new"($P146, $P133 :named("node"))
.annotate 'line', 231
    $P148 = $P131."unshift"($P147)
.annotate 'line', 213
    .return ($P148)
  control_101:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P149, exception, "payload"
    .return ($P149)
.end


.namespace ["NQP";"Actions"]
.sub "control"  :subid("19_1275600017.58296") :outer("11_1275600017.58296")
    .param pmc param_154
    .param pmc param_155
.annotate 'line', 822
    new $P153, 'ExceptionHandler'
    set_addr $P153, control_152
    $P153."handle_types"(57)
    push_eh $P153
    .lex "$/", param_154
    .lex "$id", param_155
.annotate 'line', 823
    find_lex $P156, "$/"
    get_hll_global $P157, ["PAST"], "Op"
    find_lex $P158, "$/"
.annotate 'line', 829
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
.annotate 'line', 823
    $P164 = $P156."!make"($P163)
.annotate 'line', 822
    .return ($P164)
  control_152:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P165, exception, "payload"
    .return ($P165)
.end


.namespace ["NQP";"Actions"]
.sub "TOP"  :subid("20_1275600017.58296") :method :outer("11_1275600017.58296")
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
    unless_null $P176, vivify_158
    $P176 = root_new ['parrot';'Hash']
  vivify_158:
    set $P177, $P176["comp_unit"]
    unless_null $P177, vivify_159
    new $P177, "Undef"
  vivify_159:
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
.sub "deflongname"  :subid("21_1275600017.58296") :method :outer("11_1275600017.58296")
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
    unless_null $P188, vivify_160
    $P188 = root_new ['parrot';'Hash']
  vivify_160:
    set $P189, $P188["colonpair"]
    unless_null $P189, vivify_161
    new $P189, "Undef"
  vivify_161:
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
    unless_null $P190, vivify_162
    $P190 = root_new ['parrot';'Hash']
  vivify_162:
    set $P191, $P190["identifier"]
    unless_null $P191, vivify_163
    new $P191, "Undef"
  vivify_163:
    set $S192, $P191
    new $P193, 'String'
    set $P193, $S192
    concat $P194, $P193, ":"
    find_lex $P195, "$/"
    unless_null $P195, vivify_164
    $P195 = root_new ['parrot';'Hash']
  vivify_164:
    set $P196, $P195["colonpair"]
    unless_null $P196, vivify_165
    $P196 = root_new ['parrot';'ResizablePMCArray']
  vivify_165:
    set $P197, $P196[0]
    unless_null $P197, vivify_166
    new $P197, "Undef"
  vivify_166:
    $P198 = $P197."ast"()
    $S199 = $P198."named"()
    concat $P200, $P194, $S199
    concat $P201, $P200, "<"
.annotate 'line', 38
    find_lex $P202, "$/"
    unless_null $P202, vivify_167
    $P202 = root_new ['parrot';'Hash']
  vivify_167:
    set $P203, $P202["colonpair"]
    unless_null $P203, vivify_168
    $P203 = root_new ['parrot';'ResizablePMCArray']
  vivify_168:
    set $P204, $P203[0]
    unless_null $P204, vivify_169
    new $P204, "Undef"
  vivify_169:
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
.sub "comp_unit"  :subid("22_1275600017.58296") :method :outer("11_1275600017.58296")
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
    unless_null $P220, vivify_170
    $P220 = root_new ['parrot';'Hash']
  vivify_170:
    set $P221, $P220["statementlist"]
    unless_null $P221, vivify_171
    new $P221, "Undef"
  vivify_171:
    $P222 = $P221."ast"()
    store_lex "$mainline", $P222
.annotate 'line', 51
    get_global $P223, "@BLOCK"
    $P224 = $P223."shift"()
    store_lex "$unit", $P224
.annotate 'line', 55
    find_lex $P225, "$unit"
    find_lex $P226, "self"
    $P227 = $P226."CTXSAVE"()
    $P225."push"($P227)
.annotate 'line', 60
    find_lex $P228, "$unit"
.annotate 'line', 61
    get_hll_global $P229, ["PAST"], "Op"
    find_lex $P230, "$mainline"
    $P231 = $P229."new"($P230, "return" :named("pirop"))
    $P228."push"($P231)
.annotate 'line', 66
    find_lex $P232, "$unit"
.annotate 'line', 67
    get_hll_global $P233, ["PAST"], "Block"
.annotate 'line', 69
    get_hll_global $P234, ["PAST"], "Op"
    get_hll_global $P235, ["PAST"], "Val"
    find_lex $P236, "$unit"
    $P237 = $P235."new"($P236 :named("value"))
    $P238 = $P234."new"($P237, "call" :named("pasttype"))
    $P239 = $P233."new"($P238, ":load" :named("pirflags"), 0 :named("lexical"), "" :named("namespace"))
.annotate 'line', 67
    $P232."push"($P239)
.annotate 'line', 72
    find_lex $P240, "$unit"
    find_lex $P241, "$/"
    $P240."node"($P241)
.annotate 'line', 73
    find_lex $P242, "$/"
    find_lex $P243, "$unit"
    $P244 = $P242."!make"($P243)
.annotate 'line', 49
    .return ($P244)
  control_215:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P245, exception, "payload"
    .return ($P245)
.end


.namespace ["NQP";"Actions"]
.sub "statementlist"  :subid("23_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_249
.annotate 'line', 76
    .const 'Sub' $P263 = "24_1275600017.58296" 
    capture_lex $P263
    new $P248, 'ExceptionHandler'
    set_addr $P248, control_247
    $P248."handle_types"(57)
    push_eh $P248
    .lex "self", self
    .lex "$/", param_249
.annotate 'line', 77
    new $P250, "Undef"
    .lex "$past", $P250
    get_hll_global $P251, ["PAST"], "Stmts"
    find_lex $P252, "$/"
    $P253 = $P251."new"($P252 :named("node"))
    store_lex "$past", $P253
.annotate 'line', 78
    find_lex $P255, "$/"
    unless_null $P255, vivify_172
    $P255 = root_new ['parrot';'Hash']
  vivify_172:
    set $P256, $P255["statement"]
    unless_null $P256, vivify_173
    new $P256, "Undef"
  vivify_173:
    unless $P256, if_254_end
.annotate 'line', 79
    find_lex $P258, "$/"
    unless_null $P258, vivify_174
    $P258 = root_new ['parrot';'Hash']
  vivify_174:
    set $P259, $P258["statement"]
    unless_null $P259, vivify_175
    new $P259, "Undef"
  vivify_175:
    defined $I260, $P259
    unless $I260, for_undef_176
    iter $P257, $P259
    new $P283, 'ExceptionHandler'
    set_addr $P283, loop282_handler
    $P283."handle_types"(64, 66, 65)
    push_eh $P283
  loop282_test:
    unless $P257, loop282_done
    shift $P261, $P257
  loop282_redo:
    .const 'Sub' $P263 = "24_1275600017.58296" 
    capture_lex $P263
    $P263($P261)
  loop282_next:
    goto loop282_test
  loop282_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P284, exception, 'type'
    eq $P284, 64, loop282_next
    eq $P284, 66, loop282_redo
  loop282_done:
    pop_eh 
  for_undef_176:
  if_254_end:
.annotate 'line', 86
    find_lex $P285, "$/"
    find_lex $P286, "$past"
    $P287 = $P285."!make"($P286)
.annotate 'line', 76
    .return ($P287)
  control_247:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P288, exception, "payload"
    .return ($P288)
.end


.namespace ["NQP";"Actions"]
.sub "_block262"  :anon :subid("24_1275600017.58296") :outer("23_1275600017.58296")
    .param pmc param_265
.annotate 'line', 80
    new $P264, "Undef"
    .lex "$ast", $P264
    .lex "$_", param_265
    find_lex $P266, "$_"
    $P267 = $P266."ast"()
    store_lex "$ast", $P267
.annotate 'line', 81
    find_lex $P269, "$ast"
    unless_null $P269, vivify_177
    $P269 = root_new ['parrot';'Hash']
  vivify_177:
    set $P270, $P269["sink"]
    unless_null $P270, vivify_178
    new $P270, "Undef"
  vivify_178:
    defined $I271, $P270
    unless $I271, if_268_end
    find_lex $P272, "$ast"
    unless_null $P272, vivify_179
    $P272 = root_new ['parrot';'Hash']
  vivify_179:
    set $P273, $P272["sink"]
    unless_null $P273, vivify_180
    new $P273, "Undef"
  vivify_180:
    store_lex "$ast", $P273
  if_268_end:
.annotate 'line', 82
    find_lex $P275, "$ast"
    unless_null $P275, vivify_181
    $P275 = root_new ['parrot';'Hash']
  vivify_181:
    set $P276, $P275["bareblock"]
    unless_null $P276, vivify_182
    new $P276, "Undef"
  vivify_182:
    unless $P276, if_274_end
    find_lex $P277, "$ast"
    $P278 = "block_immediate"($P277)
    store_lex "$ast", $P278
  if_274_end:
.annotate 'line', 83
    find_lex $P279, "$past"
    find_lex $P280, "$ast"
    $P281 = $P279."push"($P280)
.annotate 'line', 79
    .return ($P281)
.end


.namespace ["NQP";"Actions"]
.sub "statement"  :subid("25_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_292
    .param pmc param_293 :optional
    .param int has_param_293 :opt_flag
.annotate 'line', 89
    .const 'Sub' $P301 = "26_1275600017.58296" 
    capture_lex $P301
    new $P291, 'ExceptionHandler'
    set_addr $P291, control_290
    $P291."handle_types"(57)
    push_eh $P291
    .lex "self", self
    .lex "$/", param_292
    if has_param_293, optparam_183
    new $P294, "Undef"
    set param_293, $P294
  optparam_183:
    .lex "$key", param_293
.annotate 'line', 90
    new $P295, "Undef"
    .lex "$past", $P295
.annotate 'line', 89
    find_lex $P296, "$past"
.annotate 'line', 91
    find_lex $P298, "$/"
    unless_null $P298, vivify_184
    $P298 = root_new ['parrot';'Hash']
  vivify_184:
    set $P299, $P298["EXPR"]
    unless_null $P299, vivify_185
    new $P299, "Undef"
  vivify_185:
    if $P299, if_297
.annotate 'line', 102
    find_lex $P339, "$/"
    unless_null $P339, vivify_186
    $P339 = root_new ['parrot';'Hash']
  vivify_186:
    set $P340, $P339["statement_control"]
    unless_null $P340, vivify_187
    new $P340, "Undef"
  vivify_187:
    if $P340, if_338
.annotate 'line', 103
    new $P344, "Integer"
    assign $P344, 0
    store_lex "$past", $P344
    goto if_338_end
  if_338:
.annotate 'line', 102
    find_lex $P341, "$/"
    unless_null $P341, vivify_188
    $P341 = root_new ['parrot';'Hash']
  vivify_188:
    set $P342, $P341["statement_control"]
    unless_null $P342, vivify_189
    new $P342, "Undef"
  vivify_189:
    $P343 = $P342."ast"()
    store_lex "$past", $P343
  if_338_end:
    goto if_297_end
  if_297:
.annotate 'line', 91
    .const 'Sub' $P301 = "26_1275600017.58296" 
    capture_lex $P301
    $P301()
  if_297_end:
.annotate 'line', 104
    find_lex $P345, "$/"
    find_lex $P346, "$past"
    $P347 = $P345."!make"($P346)
.annotate 'line', 89
    .return ($P347)
  control_290:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P348, exception, "payload"
    .return ($P348)
.end


.namespace ["NQP";"Actions"]
.sub "_block300"  :anon :subid("26_1275600017.58296") :outer("25_1275600017.58296")
.annotate 'line', 92
    new $P302, "Undef"
    .lex "$mc", $P302
.annotate 'line', 93
    new $P303, "Undef"
    .lex "$ml", $P303
.annotate 'line', 92
    find_lex $P304, "$/"
    unless_null $P304, vivify_190
    $P304 = root_new ['parrot';'Hash']
  vivify_190:
    set $P305, $P304["statement_mod_cond"]
    unless_null $P305, vivify_191
    $P305 = root_new ['parrot';'ResizablePMCArray']
  vivify_191:
    set $P306, $P305[0]
    unless_null $P306, vivify_192
    new $P306, "Undef"
  vivify_192:
    store_lex "$mc", $P306
.annotate 'line', 93
    find_lex $P307, "$/"
    unless_null $P307, vivify_193
    $P307 = root_new ['parrot';'Hash']
  vivify_193:
    set $P308, $P307["statement_mod_loop"]
    unless_null $P308, vivify_194
    $P308 = root_new ['parrot';'ResizablePMCArray']
  vivify_194:
    set $P309, $P308[0]
    unless_null $P309, vivify_195
    new $P309, "Undef"
  vivify_195:
    store_lex "$ml", $P309
.annotate 'line', 94
    find_lex $P310, "$/"
    unless_null $P310, vivify_196
    $P310 = root_new ['parrot';'Hash']
  vivify_196:
    set $P311, $P310["EXPR"]
    unless_null $P311, vivify_197
    new $P311, "Undef"
  vivify_197:
    $P312 = $P311."ast"()
    store_lex "$past", $P312
.annotate 'line', 95
    find_lex $P314, "$mc"
    unless $P314, if_313_end
.annotate 'line', 96
    get_hll_global $P315, ["PAST"], "Op"
    find_lex $P316, "$mc"
    unless_null $P316, vivify_198
    $P316 = root_new ['parrot';'Hash']
  vivify_198:
    set $P317, $P316["cond"]
    unless_null $P317, vivify_199
    new $P317, "Undef"
  vivify_199:
    $P318 = $P317."ast"()
    find_lex $P319, "$past"
    find_lex $P320, "$mc"
    unless_null $P320, vivify_200
    $P320 = root_new ['parrot';'Hash']
  vivify_200:
    set $P321, $P320["sym"]
    unless_null $P321, vivify_201
    new $P321, "Undef"
  vivify_201:
    set $S322, $P321
    find_lex $P323, "$/"
    $P324 = $P315."new"($P318, $P319, $S322 :named("pasttype"), $P323 :named("node"))
    store_lex "$past", $P324
  if_313_end:
.annotate 'line', 98
    find_lex $P327, "$ml"
    if $P327, if_326
    set $P325, $P327
    goto if_326_end
  if_326:
.annotate 'line', 99
    get_hll_global $P328, ["PAST"], "Op"
    find_lex $P329, "$ml"
    unless_null $P329, vivify_202
    $P329 = root_new ['parrot';'Hash']
  vivify_202:
    set $P330, $P329["cond"]
    unless_null $P330, vivify_203
    new $P330, "Undef"
  vivify_203:
    $P331 = $P330."ast"()
    find_lex $P332, "$past"
    find_lex $P333, "$ml"
    unless_null $P333, vivify_204
    $P333 = root_new ['parrot';'Hash']
  vivify_204:
    set $P334, $P333["sym"]
    unless_null $P334, vivify_205
    new $P334, "Undef"
  vivify_205:
    set $S335, $P334
    find_lex $P336, "$/"
    $P337 = $P328."new"($P331, $P332, $S335 :named("pasttype"), $P336 :named("node"))
    store_lex "$past", $P337
.annotate 'line', 98
    set $P325, $P337
  if_326_end:
.annotate 'line', 91
    .return ($P325)
.end


.namespace ["NQP";"Actions"]
.sub "xblock"  :subid("27_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_352
.annotate 'line', 107
    new $P351, 'ExceptionHandler'
    set_addr $P351, control_350
    $P351."handle_types"(57)
    push_eh $P351
    .lex "self", self
    .lex "$/", param_352
.annotate 'line', 108
    find_lex $P353, "$/"
    get_hll_global $P354, ["PAST"], "Op"
    find_lex $P355, "$/"
    unless_null $P355, vivify_206
    $P355 = root_new ['parrot';'Hash']
  vivify_206:
    set $P356, $P355["EXPR"]
    unless_null $P356, vivify_207
    new $P356, "Undef"
  vivify_207:
    $P357 = $P356."ast"()
    find_lex $P358, "$/"
    unless_null $P358, vivify_208
    $P358 = root_new ['parrot';'Hash']
  vivify_208:
    set $P359, $P358["pblock"]
    unless_null $P359, vivify_209
    new $P359, "Undef"
  vivify_209:
    $P360 = $P359."ast"()
    find_lex $P361, "$/"
    $P362 = $P354."new"($P357, $P360, "if" :named("pasttype"), $P361 :named("node"))
    $P363 = $P353."!make"($P362)
.annotate 'line', 107
    .return ($P363)
  control_350:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P364, exception, "payload"
    .return ($P364)
.end


.namespace ["NQP";"Actions"]
.sub "pblock"  :subid("28_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_368
.annotate 'line', 111
    new $P367, 'ExceptionHandler'
    set_addr $P367, control_366
    $P367."handle_types"(57)
    push_eh $P367
    .lex "self", self
    .lex "$/", param_368
.annotate 'line', 112
    find_lex $P369, "$/"
    find_lex $P370, "$/"
    unless_null $P370, vivify_210
    $P370 = root_new ['parrot';'Hash']
  vivify_210:
    set $P371, $P370["blockoid"]
    unless_null $P371, vivify_211
    new $P371, "Undef"
  vivify_211:
    $P372 = $P371."ast"()
    $P373 = $P369."!make"($P372)
.annotate 'line', 111
    .return ($P373)
  control_366:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P374, exception, "payload"
    .return ($P374)
.end


.namespace ["NQP";"Actions"]
.sub "block"  :subid("29_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_378
.annotate 'line', 115
    new $P377, 'ExceptionHandler'
    set_addr $P377, control_376
    $P377."handle_types"(57)
    push_eh $P377
    .lex "self", self
    .lex "$/", param_378
.annotate 'line', 116
    find_lex $P379, "$/"
    find_lex $P380, "$/"
    unless_null $P380, vivify_212
    $P380 = root_new ['parrot';'Hash']
  vivify_212:
    set $P381, $P380["blockoid"]
    unless_null $P381, vivify_213
    new $P381, "Undef"
  vivify_213:
    $P382 = $P381."ast"()
    $P383 = $P379."!make"($P382)
.annotate 'line', 115
    .return ($P383)
  control_376:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P384, exception, "payload"
    .return ($P384)
.end


.namespace ["NQP";"Actions"]
.sub "blockoid"  :subid("30_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_388
.annotate 'line', 119
    new $P387, 'ExceptionHandler'
    set_addr $P387, control_386
    $P387."handle_types"(57)
    push_eh $P387
    .lex "self", self
    .lex "$/", param_388
.annotate 'line', 120
    new $P389, "Undef"
    .lex "$past", $P389
.annotate 'line', 121
    new $P390, "Undef"
    .lex "$BLOCK", $P390
.annotate 'line', 120
    find_lex $P391, "$/"
    unless_null $P391, vivify_214
    $P391 = root_new ['parrot';'Hash']
  vivify_214:
    set $P392, $P391["statementlist"]
    unless_null $P392, vivify_215
    new $P392, "Undef"
  vivify_215:
    $P393 = $P392."ast"()
    store_lex "$past", $P393
.annotate 'line', 121
    get_global $P394, "@BLOCK"
    $P395 = $P394."shift"()
    store_lex "$BLOCK", $P395
.annotate 'line', 122
    find_lex $P396, "$BLOCK"
    find_lex $P397, "$past"
    $P396."push"($P397)
.annotate 'line', 123
    find_lex $P398, "$BLOCK"
    find_lex $P399, "$/"
    $P398."node"($P399)
.annotate 'line', 124
    find_lex $P400, "$BLOCK"
    $P400."closure"(1)
.annotate 'line', 125
    find_lex $P401, "$/"
    find_lex $P402, "$BLOCK"
    $P403 = $P401."!make"($P402)
.annotate 'line', 119
    .return ($P403)
  control_386:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P404, exception, "payload"
    .return ($P404)
.end


.namespace ["NQP";"Actions"]
.sub "newpad"  :subid("31_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_408
.annotate 'line', 128
    new $P407, 'ExceptionHandler'
    set_addr $P407, control_406
    $P407."handle_types"(57)
    push_eh $P407
    .lex "self", self
    .lex "$/", param_408
.annotate 'line', 129
    get_global $P409, "@BLOCK"
    unless_null $P409, vivify_216
    $P409 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P409
  vivify_216:
.annotate 'line', 128
    get_global $P410, "@BLOCK"
.annotate 'line', 130
    get_global $P411, "@BLOCK"
    get_hll_global $P412, ["PAST"], "Block"
    get_hll_global $P413, ["PAST"], "Stmts"
    $P414 = $P413."new"()
    $P415 = $P412."new"($P414)
    $P416 = $P411."unshift"($P415)
.annotate 'line', 128
    .return ($P416)
  control_406:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P417, exception, "payload"
    .return ($P417)
.end


.namespace ["NQP";"Actions"]
.sub "outerctx"  :subid("32_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_421
.annotate 'line', 133
    new $P420, 'ExceptionHandler'
    set_addr $P420, control_419
    $P420."handle_types"(57)
    push_eh $P420
    .lex "self", self
    .lex "$/", param_421
.annotate 'line', 134
    get_global $P422, "@BLOCK"
    unless_null $P422, vivify_217
    $P422 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P422
  vivify_217:
.annotate 'line', 133
    get_global $P423, "@BLOCK"
.annotate 'line', 135
    find_lex $P424, "self"
    get_global $P425, "@BLOCK"
    unless_null $P425, vivify_218
    $P425 = root_new ['parrot';'ResizablePMCArray']
  vivify_218:
    set $P426, $P425[0]
    unless_null $P426, vivify_219
    new $P426, "Undef"
  vivify_219:
    $P427 = $P424."SET_BLOCK_OUTER_CTX"($P426)
.annotate 'line', 133
    .return ($P427)
  control_419:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P428, exception, "payload"
    .return ($P428)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<if>"  :subid("33_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_432
.annotate 'line', 140
    .const 'Sub' $P460 = "34_1275600017.58296" 
    capture_lex $P460
    new $P431, 'ExceptionHandler'
    set_addr $P431, control_430
    $P431."handle_types"(57)
    push_eh $P431
    .lex "self", self
    .lex "$/", param_432
.annotate 'line', 141
    new $P433, "Undef"
    .lex "$count", $P433
.annotate 'line', 142
    new $P434, "Undef"
    .lex "$past", $P434
.annotate 'line', 141
    find_lex $P435, "$/"
    unless_null $P435, vivify_220
    $P435 = root_new ['parrot';'Hash']
  vivify_220:
    set $P436, $P435["xblock"]
    unless_null $P436, vivify_221
    new $P436, "Undef"
  vivify_221:
    set $N437, $P436
    new $P438, 'Float'
    set $P438, $N437
    sub $P439, $P438, 1
    store_lex "$count", $P439
.annotate 'line', 142
    find_lex $P440, "$count"
    set $I441, $P440
    find_lex $P442, "$/"
    unless_null $P442, vivify_222
    $P442 = root_new ['parrot';'Hash']
  vivify_222:
    set $P443, $P442["xblock"]
    unless_null $P443, vivify_223
    $P443 = root_new ['parrot';'ResizablePMCArray']
  vivify_223:
    set $P444, $P443[$I441]
    unless_null $P444, vivify_224
    new $P444, "Undef"
  vivify_224:
    $P445 = $P444."ast"()
    $P446 = "xblock_immediate"($P445)
    store_lex "$past", $P446
.annotate 'line', 143
    find_lex $P448, "$/"
    unless_null $P448, vivify_225
    $P448 = root_new ['parrot';'Hash']
  vivify_225:
    set $P449, $P448["else"]
    unless_null $P449, vivify_226
    new $P449, "Undef"
  vivify_226:
    unless $P449, if_447_end
.annotate 'line', 144
    find_lex $P450, "$past"
    find_lex $P451, "$/"
    unless_null $P451, vivify_227
    $P451 = root_new ['parrot';'Hash']
  vivify_227:
    set $P452, $P451["else"]
    unless_null $P452, vivify_228
    $P452 = root_new ['parrot';'ResizablePMCArray']
  vivify_228:
    set $P453, $P452[0]
    unless_null $P453, vivify_229
    new $P453, "Undef"
  vivify_229:
    $P454 = $P453."ast"()
    $P455 = "block_immediate"($P454)
    $P450."push"($P455)
  if_447_end:
.annotate 'line', 147
    new $P476, 'ExceptionHandler'
    set_addr $P476, loop475_handler
    $P476."handle_types"(64, 66, 65)
    push_eh $P476
  loop475_test:
    find_lex $P456, "$count"
    set $N457, $P456
    isgt $I458, $N457, 0.0
    unless $I458, loop475_done
  loop475_redo:
    .const 'Sub' $P460 = "34_1275600017.58296" 
    capture_lex $P460
    $P460()
  loop475_next:
    goto loop475_test
  loop475_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P477, exception, 'type'
    eq $P477, 64, loop475_next
    eq $P477, 66, loop475_redo
  loop475_done:
    pop_eh 
.annotate 'line', 153
    find_lex $P478, "$/"
    find_lex $P479, "$past"
    $P480 = $P478."!make"($P479)
.annotate 'line', 140
    .return ($P480)
  control_430:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P481, exception, "payload"
    .return ($P481)
.end


.namespace ["NQP";"Actions"]
.sub "_block459"  :anon :subid("34_1275600017.58296") :outer("33_1275600017.58296")
.annotate 'line', 149
    new $P461, "Undef"
    .lex "$else", $P461
.annotate 'line', 147
    find_lex $P462, "$count"
    clone $P463, $P462
    dec $P462
.annotate 'line', 149
    find_lex $P464, "$past"
    store_lex "$else", $P464
.annotate 'line', 150
    find_lex $P465, "$count"
    set $I466, $P465
    find_lex $P467, "$/"
    unless_null $P467, vivify_230
    $P467 = root_new ['parrot';'Hash']
  vivify_230:
    set $P468, $P467["xblock"]
    unless_null $P468, vivify_231
    $P468 = root_new ['parrot';'ResizablePMCArray']
  vivify_231:
    set $P469, $P468[$I466]
    unless_null $P469, vivify_232
    new $P469, "Undef"
  vivify_232:
    $P470 = $P469."ast"()
    $P471 = "xblock_immediate"($P470)
    store_lex "$past", $P471
.annotate 'line', 151
    find_lex $P472, "$past"
    find_lex $P473, "$else"
    $P474 = $P472."push"($P473)
.annotate 'line', 147
    .return ($P474)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<unless>"  :subid("35_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_485
.annotate 'line', 156
    new $P484, 'ExceptionHandler'
    set_addr $P484, control_483
    $P484."handle_types"(57)
    push_eh $P484
    .lex "self", self
    .lex "$/", param_485
.annotate 'line', 157
    new $P486, "Undef"
    .lex "$past", $P486
    find_lex $P487, "$/"
    unless_null $P487, vivify_233
    $P487 = root_new ['parrot';'Hash']
  vivify_233:
    set $P488, $P487["xblock"]
    unless_null $P488, vivify_234
    new $P488, "Undef"
  vivify_234:
    $P489 = $P488."ast"()
    $P490 = "xblock_immediate"($P489)
    store_lex "$past", $P490
.annotate 'line', 158
    find_lex $P491, "$past"
    $P491."pasttype"("unless")
.annotate 'line', 159
    find_lex $P492, "$/"
    find_lex $P493, "$past"
    $P494 = $P492."!make"($P493)
.annotate 'line', 156
    .return ($P494)
  control_483:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P495, exception, "payload"
    .return ($P495)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<while>"  :subid("36_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_499
.annotate 'line', 162
    new $P498, 'ExceptionHandler'
    set_addr $P498, control_497
    $P498."handle_types"(57)
    push_eh $P498
    .lex "self", self
    .lex "$/", param_499
.annotate 'line', 163
    new $P500, "Undef"
    .lex "$past", $P500
    find_lex $P501, "$/"
    unless_null $P501, vivify_235
    $P501 = root_new ['parrot';'Hash']
  vivify_235:
    set $P502, $P501["xblock"]
    unless_null $P502, vivify_236
    new $P502, "Undef"
  vivify_236:
    $P503 = $P502."ast"()
    $P504 = "xblock_immediate"($P503)
    store_lex "$past", $P504
.annotate 'line', 164
    find_lex $P505, "$past"
    find_lex $P506, "$/"
    unless_null $P506, vivify_237
    $P506 = root_new ['parrot';'Hash']
  vivify_237:
    set $P507, $P506["sym"]
    unless_null $P507, vivify_238
    new $P507, "Undef"
  vivify_238:
    set $S508, $P507
    $P505."pasttype"($S508)
.annotate 'line', 165
    find_lex $P509, "$/"
    find_lex $P510, "$past"
    $P511 = $P509."!make"($P510)
.annotate 'line', 162
    .return ($P511)
  control_497:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P512, exception, "payload"
    .return ($P512)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<repeat>"  :subid("37_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_516
.annotate 'line', 168
    new $P515, 'ExceptionHandler'
    set_addr $P515, control_514
    $P515."handle_types"(57)
    push_eh $P515
    .lex "self", self
    .lex "$/", param_516
.annotate 'line', 169
    new $P517, "Undef"
    .lex "$pasttype", $P517
.annotate 'line', 170
    new $P518, "Undef"
    .lex "$past", $P518
.annotate 'line', 169
    new $P519, "String"
    assign $P519, "repeat_"
    find_lex $P520, "$/"
    unless_null $P520, vivify_239
    $P520 = root_new ['parrot';'Hash']
  vivify_239:
    set $P521, $P520["wu"]
    unless_null $P521, vivify_240
    new $P521, "Undef"
  vivify_240:
    set $S522, $P521
    concat $P523, $P519, $S522
    store_lex "$pasttype", $P523
    find_lex $P524, "$past"
.annotate 'line', 171
    find_lex $P526, "$/"
    unless_null $P526, vivify_241
    $P526 = root_new ['parrot';'Hash']
  vivify_241:
    set $P527, $P526["xblock"]
    unless_null $P527, vivify_242
    new $P527, "Undef"
  vivify_242:
    if $P527, if_525
.annotate 'line', 176
    get_hll_global $P534, ["PAST"], "Op"
    find_lex $P535, "$/"
    unless_null $P535, vivify_243
    $P535 = root_new ['parrot';'Hash']
  vivify_243:
    set $P536, $P535["EXPR"]
    unless_null $P536, vivify_244
    new $P536, "Undef"
  vivify_244:
    $P537 = $P536."ast"()
    find_lex $P538, "$/"
    unless_null $P538, vivify_245
    $P538 = root_new ['parrot';'Hash']
  vivify_245:
    set $P539, $P538["pblock"]
    unless_null $P539, vivify_246
    new $P539, "Undef"
  vivify_246:
    $P540 = $P539."ast"()
    $P541 = "block_immediate"($P540)
    find_lex $P542, "$pasttype"
    find_lex $P543, "$/"
    $P544 = $P534."new"($P537, $P541, $P542 :named("pasttype"), $P543 :named("node"))
    store_lex "$past", $P544
.annotate 'line', 175
    goto if_525_end
  if_525:
.annotate 'line', 172
    find_lex $P528, "$/"
    unless_null $P528, vivify_247
    $P528 = root_new ['parrot';'Hash']
  vivify_247:
    set $P529, $P528["xblock"]
    unless_null $P529, vivify_248
    new $P529, "Undef"
  vivify_248:
    $P530 = $P529."ast"()
    $P531 = "xblock_immediate"($P530)
    store_lex "$past", $P531
.annotate 'line', 173
    find_lex $P532, "$past"
    find_lex $P533, "$pasttype"
    $P532."pasttype"($P533)
  if_525_end:
.annotate 'line', 179
    find_lex $P545, "$/"
    find_lex $P546, "$past"
    $P547 = $P545."!make"($P546)
.annotate 'line', 168
    .return ($P547)
  control_514:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P548, exception, "payload"
    .return ($P548)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<for>"  :subid("38_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_552
.annotate 'line', 182
    new $P551, 'ExceptionHandler'
    set_addr $P551, control_550
    $P551."handle_types"(57)
    push_eh $P551
    .lex "self", self
    .lex "$/", param_552
.annotate 'line', 183
    new $P553, "Undef"
    .lex "$past", $P553
.annotate 'line', 185
    new $P554, "Undef"
    .lex "$block", $P554
.annotate 'line', 183
    find_lex $P555, "$/"
    unless_null $P555, vivify_249
    $P555 = root_new ['parrot';'Hash']
  vivify_249:
    set $P556, $P555["xblock"]
    unless_null $P556, vivify_250
    new $P556, "Undef"
  vivify_250:
    $P557 = $P556."ast"()
    store_lex "$past", $P557
.annotate 'line', 184
    find_lex $P558, "$past"
    $P558."pasttype"("for")
.annotate 'line', 185
    find_lex $P559, "$past"
    unless_null $P559, vivify_251
    $P559 = root_new ['parrot';'ResizablePMCArray']
  vivify_251:
    set $P560, $P559[1]
    unless_null $P560, vivify_252
    new $P560, "Undef"
  vivify_252:
    store_lex "$block", $P560
.annotate 'line', 186
    find_lex $P562, "$block"
    $P563 = $P562."arity"()
    if $P563, unless_561_end
.annotate 'line', 187
    find_lex $P564, "$block"
    unless_null $P564, vivify_253
    $P564 = root_new ['parrot';'ResizablePMCArray']
  vivify_253:
    set $P565, $P564[0]
    unless_null $P565, vivify_254
    new $P565, "Undef"
  vivify_254:
    get_hll_global $P566, ["PAST"], "Var"
    $P567 = $P566."new"("$_" :named("name"), "parameter" :named("scope"))
    $P565."push"($P567)
.annotate 'line', 188
    find_lex $P568, "$block"
    $P568."symbol"("$_", "lexical" :named("scope"))
.annotate 'line', 189
    find_lex $P569, "$block"
    $P569."arity"(1)
  unless_561_end:
.annotate 'line', 191
    find_lex $P570, "$block"
    $P570."blocktype"("immediate")
.annotate 'line', 192
    find_lex $P571, "$/"
    find_lex $P572, "$past"
    $P573 = $P571."!make"($P572)
.annotate 'line', 182
    .return ($P573)
  control_550:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P574, exception, "payload"
    .return ($P574)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<return>"  :subid("39_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_578
.annotate 'line', 195
    new $P577, 'ExceptionHandler'
    set_addr $P577, control_576
    $P577."handle_types"(57)
    push_eh $P577
    .lex "self", self
    .lex "$/", param_578
.annotate 'line', 196
    find_lex $P579, "$/"
    get_hll_global $P580, ["PAST"], "Op"
    find_lex $P581, "$/"
    unless_null $P581, vivify_255
    $P581 = root_new ['parrot';'Hash']
  vivify_255:
    set $P582, $P581["EXPR"]
    unless_null $P582, vivify_256
    new $P582, "Undef"
  vivify_256:
    $P583 = $P582."ast"()
    find_lex $P584, "$/"
    $P585 = $P580."new"($P583, "return" :named("pasttype"), $P584 :named("node"))
    $P586 = $P579."!make"($P585)
.annotate 'line', 195
    .return ($P586)
  control_576:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P587, exception, "payload"
    .return ($P587)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<CATCH>"  :subid("40_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_591
.annotate 'line', 199
    new $P590, 'ExceptionHandler'
    set_addr $P590, control_589
    $P590."handle_types"(57)
    push_eh $P590
    .lex "self", self
    .lex "$/", param_591
.annotate 'line', 200
    new $P592, "Undef"
    .lex "$block", $P592
    find_lex $P593, "$/"
    unless_null $P593, vivify_257
    $P593 = root_new ['parrot';'Hash']
  vivify_257:
    set $P594, $P593["block"]
    unless_null $P594, vivify_258
    new $P594, "Undef"
  vivify_258:
    $P595 = $P594."ast"()
    store_lex "$block", $P595
.annotate 'line', 201
    find_lex $P596, "$/"
    find_lex $P597, "$block"
    "push_block_handler"($P596, $P597)
.annotate 'line', 202
    get_global $P598, "@BLOCK"
    unless_null $P598, vivify_259
    $P598 = root_new ['parrot';'ResizablePMCArray']
  vivify_259:
    set $P599, $P598[0]
    unless_null $P599, vivify_260
    new $P599, "Undef"
  vivify_260:
    $P600 = $P599."handlers"()
    set $P601, $P600[0]
    unless_null $P601, vivify_261
    new $P601, "Undef"
  vivify_261:
    $P601."handle_types_except"("CONTROL")
.annotate 'line', 203
    find_lex $P602, "$/"
    get_hll_global $P603, ["PAST"], "Stmts"
    find_lex $P604, "$/"
    $P605 = $P603."new"($P604 :named("node"))
    $P606 = $P602."!make"($P605)
.annotate 'line', 199
    .return ($P606)
  control_589:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P607, exception, "payload"
    .return ($P607)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<CONTROL>"  :subid("41_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_611
.annotate 'line', 206
    new $P610, 'ExceptionHandler'
    set_addr $P610, control_609
    $P610."handle_types"(57)
    push_eh $P610
    .lex "self", self
    .lex "$/", param_611
.annotate 'line', 207
    new $P612, "Undef"
    .lex "$block", $P612
    find_lex $P613, "$/"
    unless_null $P613, vivify_262
    $P613 = root_new ['parrot';'Hash']
  vivify_262:
    set $P614, $P613["block"]
    unless_null $P614, vivify_263
    new $P614, "Undef"
  vivify_263:
    $P615 = $P614."ast"()
    store_lex "$block", $P615
.annotate 'line', 208
    find_lex $P616, "$/"
    find_lex $P617, "$block"
    "push_block_handler"($P616, $P617)
.annotate 'line', 209
    get_global $P618, "@BLOCK"
    unless_null $P618, vivify_264
    $P618 = root_new ['parrot';'ResizablePMCArray']
  vivify_264:
    set $P619, $P618[0]
    unless_null $P619, vivify_265
    new $P619, "Undef"
  vivify_265:
    $P620 = $P619."handlers"()
    set $P621, $P620[0]
    unless_null $P621, vivify_266
    new $P621, "Undef"
  vivify_266:
    $P621."handle_types"("CONTROL")
.annotate 'line', 210
    find_lex $P622, "$/"
    get_hll_global $P623, ["PAST"], "Stmts"
    find_lex $P624, "$/"
    $P625 = $P623."new"($P624 :named("node"))
    $P626 = $P622."!make"($P625)
.annotate 'line', 206
    .return ($P626)
  control_609:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P627, exception, "payload"
    .return ($P627)
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<INIT>"  :subid("42_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_632
.annotate 'line', 250
    new $P631, 'ExceptionHandler'
    set_addr $P631, control_630
    $P631."handle_types"(57)
    push_eh $P631
    .lex "self", self
    .lex "$/", param_632
.annotate 'line', 251
    get_global $P633, "@BLOCK"
    unless_null $P633, vivify_267
    $P633 = root_new ['parrot';'ResizablePMCArray']
  vivify_267:
    set $P634, $P633[0]
    unless_null $P634, vivify_268
    new $P634, "Undef"
  vivify_268:
    $P635 = $P634."loadinit"()
    find_lex $P636, "$/"
    unless_null $P636, vivify_269
    $P636 = root_new ['parrot';'Hash']
  vivify_269:
    set $P637, $P636["blorst"]
    unless_null $P637, vivify_270
    new $P637, "Undef"
  vivify_270:
    $P638 = $P637."ast"()
    $P635."push"($P638)
.annotate 'line', 252
    find_lex $P639, "$/"
    get_hll_global $P640, ["PAST"], "Stmts"
    find_lex $P641, "$/"
    $P642 = $P640."new"($P641 :named("node"))
    $P643 = $P639."!make"($P642)
.annotate 'line', 250
    .return ($P643)
  control_630:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P644, exception, "payload"
    .return ($P644)
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<try>"  :subid("43_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_648
.annotate 'line', 255
    new $P647, 'ExceptionHandler'
    set_addr $P647, control_646
    $P647."handle_types"(57)
    push_eh $P647
    .lex "self", self
    .lex "$/", param_648
.annotate 'line', 256
    new $P649, "Undef"
    .lex "$past", $P649
    find_lex $P650, "$/"
    unless_null $P650, vivify_271
    $P650 = root_new ['parrot';'Hash']
  vivify_271:
    set $P651, $P650["blorst"]
    unless_null $P651, vivify_272
    new $P651, "Undef"
  vivify_272:
    $P652 = $P651."ast"()
    store_lex "$past", $P652
.annotate 'line', 257
    find_lex $P654, "$past"
    $S655 = $P654."WHAT"()
    isne $I656, $S655, "PAST::Block()"
    unless $I656, if_653_end
.annotate 'line', 258
    get_hll_global $P657, ["PAST"], "Block"
    find_lex $P658, "$past"
    find_lex $P659, "$/"
    $P660 = $P657."new"($P658, "immediate" :named("blocktype"), $P659 :named("node"))
    store_lex "$past", $P660
  if_653_end:
.annotate 'line', 260
    find_lex $P662, "$past"
    $P663 = $P662."handlers"()
    if $P663, unless_661_end
.annotate 'line', 261
    find_lex $P664, "$past"
    get_hll_global $P665, ["PAST"], "Control"
.annotate 'line', 263
    get_hll_global $P666, ["PAST"], "Stmts"
.annotate 'line', 264
    get_hll_global $P667, ["PAST"], "Op"
.annotate 'line', 265
    get_hll_global $P668, ["PAST"], "Var"
.annotate 'line', 266
    get_hll_global $P669, ["PAST"], "Var"
    $P670 = $P669."new"("register" :named("scope"), "exception" :named("name"))
    $P671 = $P668."new"($P670, "handled", "keyed" :named("scope"))
.annotate 'line', 265
    $P672 = $P667."new"($P671, 1, "bind" :named("pasttype"))
.annotate 'line', 264
    $P673 = $P666."new"($P672)
.annotate 'line', 263
    $P674 = $P665."new"($P673, "CONTROL" :named("handle_types_except"))
.annotate 'line', 261
    new $P675, "ResizablePMCArray"
    push $P675, $P674
    $P664."handlers"($P675)
  unless_661_end:
.annotate 'line', 275
    find_lex $P676, "$/"
    find_lex $P677, "$past"
    $P678 = $P676."!make"($P677)
.annotate 'line', 255
    .return ($P678)
  control_646:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P679, exception, "payload"
    .return ($P679)
.end


.namespace ["NQP";"Actions"]
.sub "blorst"  :subid("44_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_683
.annotate 'line', 278
    new $P682, 'ExceptionHandler'
    set_addr $P682, control_681
    $P682."handle_types"(57)
    push_eh $P682
    .lex "self", self
    .lex "$/", param_683
.annotate 'line', 279
    find_lex $P684, "$/"
.annotate 'line', 280
    find_lex $P687, "$/"
    unless_null $P687, vivify_273
    $P687 = root_new ['parrot';'Hash']
  vivify_273:
    set $P688, $P687["block"]
    unless_null $P688, vivify_274
    new $P688, "Undef"
  vivify_274:
    if $P688, if_686
.annotate 'line', 281
    find_lex $P693, "$/"
    unless_null $P693, vivify_275
    $P693 = root_new ['parrot';'Hash']
  vivify_275:
    set $P694, $P693["statement"]
    unless_null $P694, vivify_276
    new $P694, "Undef"
  vivify_276:
    $P695 = $P694."ast"()
    set $P685, $P695
.annotate 'line', 280
    goto if_686_end
  if_686:
    find_lex $P689, "$/"
    unless_null $P689, vivify_277
    $P689 = root_new ['parrot';'Hash']
  vivify_277:
    set $P690, $P689["block"]
    unless_null $P690, vivify_278
    new $P690, "Undef"
  vivify_278:
    $P691 = $P690."ast"()
    $P692 = "block_immediate"($P691)
    set $P685, $P692
  if_686_end:
    $P696 = $P684."!make"($P685)
.annotate 'line', 278
    .return ($P696)
  control_681:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P697, exception, "payload"
    .return ($P697)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<if>"  :subid("45_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_701
.annotate 'line', 286
    new $P700, 'ExceptionHandler'
    set_addr $P700, control_699
    $P700."handle_types"(57)
    push_eh $P700
    .lex "self", self
    .lex "$/", param_701
    find_lex $P702, "$/"
    find_lex $P703, "$/"
    unless_null $P703, vivify_279
    $P703 = root_new ['parrot';'Hash']
  vivify_279:
    set $P704, $P703["cond"]
    unless_null $P704, vivify_280
    new $P704, "Undef"
  vivify_280:
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
.sub "statement_mod_cond:sym<unless>"  :subid("46_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_711
.annotate 'line', 287
    new $P710, 'ExceptionHandler'
    set_addr $P710, control_709
    $P710."handle_types"(57)
    push_eh $P710
    .lex "self", self
    .lex "$/", param_711
    find_lex $P712, "$/"
    find_lex $P713, "$/"
    unless_null $P713, vivify_281
    $P713 = root_new ['parrot';'Hash']
  vivify_281:
    set $P714, $P713["cond"]
    unless_null $P714, vivify_282
    new $P714, "Undef"
  vivify_282:
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
.sub "statement_mod_loop:sym<while>"  :subid("47_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_721
.annotate 'line', 289
    new $P720, 'ExceptionHandler'
    set_addr $P720, control_719
    $P720."handle_types"(57)
    push_eh $P720
    .lex "self", self
    .lex "$/", param_721
    find_lex $P722, "$/"
    find_lex $P723, "$/"
    unless_null $P723, vivify_283
    $P723 = root_new ['parrot';'Hash']
  vivify_283:
    set $P724, $P723["cond"]
    unless_null $P724, vivify_284
    new $P724, "Undef"
  vivify_284:
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
.sub "statement_mod_loop:sym<until>"  :subid("48_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_731
.annotate 'line', 290
    new $P730, 'ExceptionHandler'
    set_addr $P730, control_729
    $P730."handle_types"(57)
    push_eh $P730
    .lex "self", self
    .lex "$/", param_731
    find_lex $P732, "$/"
    find_lex $P733, "$/"
    unless_null $P733, vivify_285
    $P733 = root_new ['parrot';'Hash']
  vivify_285:
    set $P734, $P733["cond"]
    unless_null $P734, vivify_286
    new $P734, "Undef"
  vivify_286:
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
.sub "term:sym<fatarrow>"  :subid("49_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_741
.annotate 'line', 294
    new $P740, 'ExceptionHandler'
    set_addr $P740, control_739
    $P740."handle_types"(57)
    push_eh $P740
    .lex "self", self
    .lex "$/", param_741
    find_lex $P742, "$/"
    find_lex $P743, "$/"
    unless_null $P743, vivify_287
    $P743 = root_new ['parrot';'Hash']
  vivify_287:
    set $P744, $P743["fatarrow"]
    unless_null $P744, vivify_288
    new $P744, "Undef"
  vivify_288:
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
.sub "term:sym<colonpair>"  :subid("50_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_751
.annotate 'line', 295
    new $P750, 'ExceptionHandler'
    set_addr $P750, control_749
    $P750."handle_types"(57)
    push_eh $P750
    .lex "self", self
    .lex "$/", param_751
    find_lex $P752, "$/"
    find_lex $P753, "$/"
    unless_null $P753, vivify_289
    $P753 = root_new ['parrot';'Hash']
  vivify_289:
    set $P754, $P753["colonpair"]
    unless_null $P754, vivify_290
    new $P754, "Undef"
  vivify_290:
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
.sub "term:sym<variable>"  :subid("51_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_761
.annotate 'line', 296
    new $P760, 'ExceptionHandler'
    set_addr $P760, control_759
    $P760."handle_types"(57)
    push_eh $P760
    .lex "self", self
    .lex "$/", param_761
    find_lex $P762, "$/"
    find_lex $P763, "$/"
    unless_null $P763, vivify_291
    $P763 = root_new ['parrot';'Hash']
  vivify_291:
    set $P764, $P763["variable"]
    unless_null $P764, vivify_292
    new $P764, "Undef"
  vivify_292:
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
.sub "term:sym<package_declarator>"  :subid("52_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_771
.annotate 'line', 297
    new $P770, 'ExceptionHandler'
    set_addr $P770, control_769
    $P770."handle_types"(57)
    push_eh $P770
    .lex "self", self
    .lex "$/", param_771
    find_lex $P772, "$/"
    find_lex $P773, "$/"
    unless_null $P773, vivify_293
    $P773 = root_new ['parrot';'Hash']
  vivify_293:
    set $P774, $P773["package_declarator"]
    unless_null $P774, vivify_294
    new $P774, "Undef"
  vivify_294:
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
.sub "term:sym<scope_declarator>"  :subid("53_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_781
.annotate 'line', 298
    new $P780, 'ExceptionHandler'
    set_addr $P780, control_779
    $P780."handle_types"(57)
    push_eh $P780
    .lex "self", self
    .lex "$/", param_781
    find_lex $P782, "$/"
    find_lex $P783, "$/"
    unless_null $P783, vivify_295
    $P783 = root_new ['parrot';'Hash']
  vivify_295:
    set $P784, $P783["scope_declarator"]
    unless_null $P784, vivify_296
    new $P784, "Undef"
  vivify_296:
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
.sub "term:sym<routine_declarator>"  :subid("54_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_791
.annotate 'line', 299
    new $P790, 'ExceptionHandler'
    set_addr $P790, control_789
    $P790."handle_types"(57)
    push_eh $P790
    .lex "self", self
    .lex "$/", param_791
    find_lex $P792, "$/"
    find_lex $P793, "$/"
    unless_null $P793, vivify_297
    $P793 = root_new ['parrot';'Hash']
  vivify_297:
    set $P794, $P793["routine_declarator"]
    unless_null $P794, vivify_298
    new $P794, "Undef"
  vivify_298:
    $P795 = $P794."ast"()
    $P796 = $P792."!make"($P795)
    .return ($P796)
  control_789:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P797, exception, "payload"
    .return ($P797)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<regex_declarator>"  :subid("55_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_801
.annotate 'line', 300
    new $P800, 'ExceptionHandler'
    set_addr $P800, control_799
    $P800."handle_types"(57)
    push_eh $P800
    .lex "self", self
    .lex "$/", param_801
    find_lex $P802, "$/"
    find_lex $P803, "$/"
    unless_null $P803, vivify_299
    $P803 = root_new ['parrot';'Hash']
  vivify_299:
    set $P804, $P803["regex_declarator"]
    unless_null $P804, vivify_300
    new $P804, "Undef"
  vivify_300:
    $P805 = $P804."ast"()
    $P806 = $P802."!make"($P805)
    .return ($P806)
  control_799:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P807, exception, "payload"
    .return ($P807)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<statement_prefix>"  :subid("56_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_811
.annotate 'line', 301
    new $P810, 'ExceptionHandler'
    set_addr $P810, control_809
    $P810."handle_types"(57)
    push_eh $P810
    .lex "self", self
    .lex "$/", param_811
    find_lex $P812, "$/"
    find_lex $P813, "$/"
    unless_null $P813, vivify_301
    $P813 = root_new ['parrot';'Hash']
  vivify_301:
    set $P814, $P813["statement_prefix"]
    unless_null $P814, vivify_302
    new $P814, "Undef"
  vivify_302:
    $P815 = $P814."ast"()
    $P816 = $P812."!make"($P815)
    .return ($P816)
  control_809:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P817, exception, "payload"
    .return ($P817)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<lambda>"  :subid("57_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_821
.annotate 'line', 302
    new $P820, 'ExceptionHandler'
    set_addr $P820, control_819
    $P820."handle_types"(57)
    push_eh $P820
    .lex "self", self
    .lex "$/", param_821
    find_lex $P822, "$/"
    find_lex $P823, "$/"
    unless_null $P823, vivify_303
    $P823 = root_new ['parrot';'Hash']
  vivify_303:
    set $P824, $P823["pblock"]
    unless_null $P824, vivify_304
    new $P824, "Undef"
  vivify_304:
    $P825 = $P824."ast"()
    $P826 = $P822."!make"($P825)
    .return ($P826)
  control_819:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P827, exception, "payload"
    .return ($P827)
.end


.namespace ["NQP";"Actions"]
.sub "fatarrow"  :subid("58_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_831
.annotate 'line', 304
    new $P830, 'ExceptionHandler'
    set_addr $P830, control_829
    $P830."handle_types"(57)
    push_eh $P830
    .lex "self", self
    .lex "$/", param_831
.annotate 'line', 305
    new $P832, "Undef"
    .lex "$past", $P832
    find_lex $P833, "$/"
    unless_null $P833, vivify_305
    $P833 = root_new ['parrot';'Hash']
  vivify_305:
    set $P834, $P833["val"]
    unless_null $P834, vivify_306
    new $P834, "Undef"
  vivify_306:
    $P835 = $P834."ast"()
    store_lex "$past", $P835
.annotate 'line', 306
    find_lex $P836, "$past"
    find_lex $P837, "$/"
    unless_null $P837, vivify_307
    $P837 = root_new ['parrot';'Hash']
  vivify_307:
    set $P838, $P837["key"]
    unless_null $P838, vivify_308
    new $P838, "Undef"
  vivify_308:
    $P839 = $P838."Str"()
    $P836."named"($P839)
.annotate 'line', 307
    find_lex $P840, "$/"
    find_lex $P841, "$past"
    $P842 = $P840."!make"($P841)
.annotate 'line', 304
    .return ($P842)
  control_829:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P843, exception, "payload"
    .return ($P843)
.end


.namespace ["NQP";"Actions"]
.sub "colonpair"  :subid("59_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_847
.annotate 'line', 310
    new $P846, 'ExceptionHandler'
    set_addr $P846, control_845
    $P846."handle_types"(57)
    push_eh $P846
    .lex "self", self
    .lex "$/", param_847
.annotate 'line', 311
    new $P848, "Undef"
    .lex "$past", $P848
.annotate 'line', 312
    find_lex $P851, "$/"
    unless_null $P851, vivify_309
    $P851 = root_new ['parrot';'Hash']
  vivify_309:
    set $P852, $P851["circumfix"]
    unless_null $P852, vivify_310
    new $P852, "Undef"
  vivify_310:
    if $P852, if_850
.annotate 'line', 313
    get_hll_global $P857, ["PAST"], "Val"
    find_lex $P858, "$/"
    unless_null $P858, vivify_311
    $P858 = root_new ['parrot';'Hash']
  vivify_311:
    set $P859, $P858["not"]
    unless_null $P859, vivify_312
    new $P859, "Undef"
  vivify_312:
    isfalse $I860, $P859
    $P861 = $P857."new"($I860 :named("value"))
    set $P849, $P861
.annotate 'line', 312
    goto if_850_end
  if_850:
    find_lex $P853, "$/"
    unless_null $P853, vivify_313
    $P853 = root_new ['parrot';'Hash']
  vivify_313:
    set $P854, $P853["circumfix"]
    unless_null $P854, vivify_314
    $P854 = root_new ['parrot';'ResizablePMCArray']
  vivify_314:
    set $P855, $P854[0]
    unless_null $P855, vivify_315
    new $P855, "Undef"
  vivify_315:
    $P856 = $P855."ast"()
    set $P849, $P856
  if_850_end:
    store_lex "$past", $P849
.annotate 'line', 314
    find_lex $P862, "$past"
    find_lex $P863, "$/"
    unless_null $P863, vivify_316
    $P863 = root_new ['parrot';'Hash']
  vivify_316:
    set $P864, $P863["identifier"]
    unless_null $P864, vivify_317
    new $P864, "Undef"
  vivify_317:
    set $S865, $P864
    $P862."named"($S865)
.annotate 'line', 315
    find_lex $P866, "$/"
    find_lex $P867, "$past"
    $P868 = $P866."!make"($P867)
.annotate 'line', 310
    .return ($P868)
  control_845:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P869, exception, "payload"
    .return ($P869)
.end


.namespace ["NQP";"Actions"]
.sub "variable"  :subid("60_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_873
.annotate 'line', 318
    .const 'Sub' $P886 = "61_1275600017.58296" 
    capture_lex $P886
    new $P872, 'ExceptionHandler'
    set_addr $P872, control_871
    $P872."handle_types"(57)
    push_eh $P872
    .lex "self", self
    .lex "$/", param_873
.annotate 'line', 319
    new $P874, "Undef"
    .lex "$past", $P874
.annotate 'line', 318
    find_lex $P875, "$past"
.annotate 'line', 320
    find_lex $P877, "$/"
    unless_null $P877, vivify_318
    $P877 = root_new ['parrot';'Hash']
  vivify_318:
    set $P878, $P877["postcircumfix"]
    unless_null $P878, vivify_319
    new $P878, "Undef"
  vivify_319:
    if $P878, if_876
.annotate 'line', 324
    .const 'Sub' $P886 = "61_1275600017.58296" 
    capture_lex $P886
    $P886()
    goto if_876_end
  if_876:
.annotate 'line', 321
    find_lex $P879, "$/"
    unless_null $P879, vivify_336
    $P879 = root_new ['parrot';'Hash']
  vivify_336:
    set $P880, $P879["postcircumfix"]
    unless_null $P880, vivify_337
    new $P880, "Undef"
  vivify_337:
    $P881 = $P880."ast"()
    store_lex "$past", $P881
.annotate 'line', 322
    find_lex $P882, "$past"
    get_hll_global $P883, ["PAST"], "Var"
    $P884 = $P883."new"("$/" :named("name"))
    $P882."unshift"($P884)
  if_876_end:
.annotate 'line', 353
    find_lex $P955, "$/"
    find_lex $P956, "$past"
    $P957 = $P955."!make"($P956)
.annotate 'line', 318
    .return ($P957)
  control_871:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P958, exception, "payload"
    .return ($P958)
.end


.namespace ["NQP";"Actions"]
.sub "_block885"  :anon :subid("61_1275600017.58296") :outer("60_1275600017.58296")
.annotate 'line', 325
    $P887 = root_new ['parrot';'ResizablePMCArray']
    .lex "@name", $P887
    get_hll_global $P888, ["NQP"], "Compiler"
    find_lex $P889, "$/"
    set $S890, $P889
    $P891 = $P888."parse_name"($S890)
    store_lex "@name", $P891
.annotate 'line', 326
    get_hll_global $P892, ["PAST"], "Var"
    find_lex $P893, "@name"
    $P894 = $P893."pop"()
    set $S895, $P894
    $P896 = $P892."new"($S895 :named("name"))
    store_lex "$past", $P896
.annotate 'line', 327
    find_lex $P898, "@name"
    unless $P898, if_897_end
.annotate 'line', 328
    find_lex $P900, "@name"
    unless_null $P900, vivify_320
    $P900 = root_new ['parrot';'ResizablePMCArray']
  vivify_320:
    set $P901, $P900[0]
    unless_null $P901, vivify_321
    new $P901, "Undef"
  vivify_321:
    set $S902, $P901
    iseq $I903, $S902, "GLOBAL"
    unless $I903, if_899_end
    find_lex $P904, "@name"
    $P904."shift"()
  if_899_end:
.annotate 'line', 329
    find_lex $P905, "$past"
    find_lex $P906, "@name"
    $P905."namespace"($P906)
.annotate 'line', 330
    find_lex $P907, "$past"
    $P907."scope"("package")
.annotate 'line', 331
    find_lex $P908, "$past"
    find_lex $P909, "$/"
    unless_null $P909, vivify_322
    $P909 = root_new ['parrot';'Hash']
  vivify_322:
    set $P910, $P909["sigil"]
    unless_null $P910, vivify_323
    new $P910, "Undef"
  vivify_323:
    $P911 = "vivitype"($P910)
    $P908."viviself"($P911)
.annotate 'line', 332
    find_lex $P912, "$past"
    $P912."lvalue"(1)
  if_897_end:
.annotate 'line', 334
    find_lex $P915, "$/"
    unless_null $P915, vivify_324
    $P915 = root_new ['parrot';'Hash']
  vivify_324:
    set $P916, $P915["twigil"]
    unless_null $P916, vivify_325
    $P916 = root_new ['parrot';'ResizablePMCArray']
  vivify_325:
    set $P917, $P916[0]
    unless_null $P917, vivify_326
    new $P917, "Undef"
  vivify_326:
    set $S918, $P917
    iseq $I919, $S918, "*"
    if $I919, if_914
.annotate 'line', 347
    find_lex $P941, "$/"
    unless_null $P941, vivify_327
    $P941 = root_new ['parrot';'Hash']
  vivify_327:
    set $P942, $P941["twigil"]
    unless_null $P942, vivify_328
    $P942 = root_new ['parrot';'ResizablePMCArray']
  vivify_328:
    set $P943, $P942[0]
    unless_null $P943, vivify_329
    new $P943, "Undef"
  vivify_329:
    set $S944, $P943
    iseq $I945, $S944, "!"
    if $I945, if_940
    new $P939, 'Integer'
    set $P939, $I945
    goto if_940_end
  if_940:
.annotate 'line', 348
    find_lex $P946, "$past"
    get_hll_global $P947, ["PAST"], "Var"
    $P948 = $P947."new"("self" :named("name"))
    $P946."push"($P948)
.annotate 'line', 349
    find_lex $P949, "$past"
    $P949."scope"("attribute")
.annotate 'line', 350
    find_lex $P950, "$past"
    find_lex $P951, "$/"
    unless_null $P951, vivify_330
    $P951 = root_new ['parrot';'Hash']
  vivify_330:
    set $P952, $P951["sigil"]
    unless_null $P952, vivify_331
    new $P952, "Undef"
  vivify_331:
    $P953 = "vivitype"($P952)
    $P954 = $P950."viviself"($P953)
.annotate 'line', 347
    set $P939, $P954
  if_940_end:
    set $P913, $P939
.annotate 'line', 334
    goto if_914_end
  if_914:
.annotate 'line', 335
    find_lex $P920, "$past"
    $P920."scope"("contextual")
.annotate 'line', 336
    find_lex $P921, "$past"
.annotate 'line', 337
    get_hll_global $P922, ["PAST"], "Var"
.annotate 'line', 339
    find_lex $P923, "$/"
    unless_null $P923, vivify_332
    $P923 = root_new ['parrot';'Hash']
  vivify_332:
    set $P924, $P923["sigil"]
    unless_null $P924, vivify_333
    new $P924, "Undef"
  vivify_333:
    set $S925, $P924
    new $P926, 'String'
    set $P926, $S925
    find_lex $P927, "$/"
    unless_null $P927, vivify_334
    $P927 = root_new ['parrot';'Hash']
  vivify_334:
    set $P928, $P927["desigilname"]
    unless_null $P928, vivify_335
    new $P928, "Undef"
  vivify_335:
    concat $P929, $P926, $P928
.annotate 'line', 341
    get_hll_global $P930, ["PAST"], "Op"
    new $P931, "String"
    assign $P931, "Contextual "
    find_lex $P932, "$/"
    set $S933, $P932
    concat $P934, $P931, $S933
    concat $P935, $P934, " not found"
    $P936 = $P930."new"($P935, "die" :named("pirop"))
    $P937 = $P922."new"("package" :named("scope"), "" :named("namespace"), $P929 :named("name"), $P936 :named("viviself"))
.annotate 'line', 337
    $P938 = $P921."viviself"($P937)
.annotate 'line', 334
    set $P913, $P938
  if_914_end:
.annotate 'line', 324
    .return ($P913)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<module>"  :subid("62_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_962
.annotate 'line', 356
    new $P961, 'ExceptionHandler'
    set_addr $P961, control_960
    $P961."handle_types"(57)
    push_eh $P961
    .lex "self", self
    .lex "$/", param_962
    find_lex $P963, "$/"
    find_lex $P964, "$/"
    unless_null $P964, vivify_338
    $P964 = root_new ['parrot';'Hash']
  vivify_338:
    set $P965, $P964["package_def"]
    unless_null $P965, vivify_339
    new $P965, "Undef"
  vivify_339:
    $P966 = $P965."ast"()
    $P967 = $P963."!make"($P966)
    .return ($P967)
  control_960:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P968, exception, "payload"
    .return ($P968)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<class>"  :subid("63_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_972
.annotate 'line', 357
    new $P971, 'ExceptionHandler'
    set_addr $P971, control_970
    $P971."handle_types"(57)
    push_eh $P971
    .lex "self", self
    .lex "$/", param_972
.annotate 'line', 358
    new $P973, "Undef"
    .lex "$past", $P973
.annotate 'line', 359
    new $P974, "Undef"
    .lex "$classinit", $P974
.annotate 'line', 368
    new $P975, "Undef"
    .lex "$parent", $P975
.annotate 'line', 358
    find_lex $P976, "$/"
    unless_null $P976, vivify_340
    $P976 = root_new ['parrot';'Hash']
  vivify_340:
    set $P977, $P976["package_def"]
    unless_null $P977, vivify_341
    new $P977, "Undef"
  vivify_341:
    $P978 = $P977."ast"()
    store_lex "$past", $P978
.annotate 'line', 360
    get_hll_global $P979, ["PAST"], "Op"
.annotate 'line', 361
    get_hll_global $P980, ["PAST"], "Op"
    $P981 = $P980."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate 'line', 364
    find_lex $P982, "$/"
    unless_null $P982, vivify_342
    $P982 = root_new ['parrot';'Hash']
  vivify_342:
    set $P983, $P982["package_def"]
    unless_null $P983, vivify_343
    $P983 = root_new ['parrot';'Hash']
  vivify_343:
    set $P984, $P983["name"]
    unless_null $P984, vivify_344
    new $P984, "Undef"
  vivify_344:
    set $S985, $P984
    $P986 = $P979."new"($P981, $S985, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 360
    store_lex "$classinit", $P986
.annotate 'line', 368
    find_lex $P989, "$/"
    unless_null $P989, vivify_345
    $P989 = root_new ['parrot';'Hash']
  vivify_345:
    set $P990, $P989["package_def"]
    unless_null $P990, vivify_346
    $P990 = root_new ['parrot';'Hash']
  vivify_346:
    set $P991, $P990["parent"]
    unless_null $P991, vivify_347
    $P991 = root_new ['parrot';'ResizablePMCArray']
  vivify_347:
    set $P992, $P991[0]
    unless_null $P992, vivify_348
    new $P992, "Undef"
  vivify_348:
    set $S993, $P992
    unless $S993, unless_988
    new $P987, 'String'
    set $P987, $S993
    goto unless_988_end
  unless_988:
.annotate 'line', 369
    find_lex $P996, "$/"
    unless_null $P996, vivify_349
    $P996 = root_new ['parrot';'Hash']
  vivify_349:
    set $P997, $P996["sym"]
    unless_null $P997, vivify_350
    new $P997, "Undef"
  vivify_350:
    set $S998, $P997
    iseq $I999, $S998, "grammar"
    if $I999, if_995
    new $P1001, "String"
    assign $P1001, ""
    set $P994, $P1001
    goto if_995_end
  if_995:
    new $P1000, "String"
    assign $P1000, "Regex::Cursor"
    set $P994, $P1000
  if_995_end:
    set $P987, $P994
  unless_988_end:
    store_lex "$parent", $P987
.annotate 'line', 370
    find_lex $P1003, "$parent"
    unless $P1003, if_1002_end
.annotate 'line', 371
    find_lex $P1004, "$classinit"
    get_hll_global $P1005, ["PAST"], "Val"
    find_lex $P1006, "$parent"
    $P1007 = $P1005."new"($P1006 :named("value"), "parent" :named("named"))
    $P1004."push"($P1007)
  if_1002_end:
.annotate 'line', 373
    find_lex $P1009, "$past"
    unless_null $P1009, vivify_351
    $P1009 = root_new ['parrot';'Hash']
  vivify_351:
    set $P1010, $P1009["attributes"]
    unless_null $P1010, vivify_352
    new $P1010, "Undef"
  vivify_352:
    unless $P1010, if_1008_end
.annotate 'line', 374
    find_lex $P1011, "$classinit"
    find_lex $P1012, "$past"
    unless_null $P1012, vivify_353
    $P1012 = root_new ['parrot';'Hash']
  vivify_353:
    set $P1013, $P1012["attributes"]
    unless_null $P1013, vivify_354
    new $P1013, "Undef"
  vivify_354:
    $P1011."push"($P1013)
  if_1008_end:
.annotate 'line', 376
    get_global $P1014, "@BLOCK"
    unless_null $P1014, vivify_355
    $P1014 = root_new ['parrot';'ResizablePMCArray']
  vivify_355:
    set $P1015, $P1014[0]
    unless_null $P1015, vivify_356
    new $P1015, "Undef"
  vivify_356:
    $P1016 = $P1015."loadinit"()
    find_lex $P1017, "$classinit"
    $P1016."push"($P1017)
.annotate 'line', 377
    find_lex $P1018, "$/"
    find_lex $P1019, "$past"
    $P1020 = $P1018."!make"($P1019)
.annotate 'line', 357
    .return ($P1020)
  control_970:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1021, exception, "payload"
    .return ($P1021)
.end


.namespace ["NQP";"Actions"]
.sub "package_def"  :subid("64_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1025
.annotate 'line', 380
    new $P1024, 'ExceptionHandler'
    set_addr $P1024, control_1023
    $P1024."handle_types"(57)
    push_eh $P1024
    .lex "self", self
    .lex "$/", param_1025
.annotate 'line', 381
    new $P1026, "Undef"
    .lex "$past", $P1026
    find_lex $P1029, "$/"
    unless_null $P1029, vivify_357
    $P1029 = root_new ['parrot';'Hash']
  vivify_357:
    set $P1030, $P1029["block"]
    unless_null $P1030, vivify_358
    new $P1030, "Undef"
  vivify_358:
    if $P1030, if_1028
    find_lex $P1034, "$/"
    unless_null $P1034, vivify_359
    $P1034 = root_new ['parrot';'Hash']
  vivify_359:
    set $P1035, $P1034["comp_unit"]
    unless_null $P1035, vivify_360
    new $P1035, "Undef"
  vivify_360:
    $P1036 = $P1035."ast"()
    set $P1027, $P1036
    goto if_1028_end
  if_1028:
    find_lex $P1031, "$/"
    unless_null $P1031, vivify_361
    $P1031 = root_new ['parrot';'Hash']
  vivify_361:
    set $P1032, $P1031["block"]
    unless_null $P1032, vivify_362
    new $P1032, "Undef"
  vivify_362:
    $P1033 = $P1032."ast"()
    set $P1027, $P1033
  if_1028_end:
    store_lex "$past", $P1027
.annotate 'line', 382
    find_lex $P1037, "$past"
    find_lex $P1038, "$/"
    unless_null $P1038, vivify_363
    $P1038 = root_new ['parrot';'Hash']
  vivify_363:
    set $P1039, $P1038["name"]
    unless_null $P1039, vivify_364
    $P1039 = root_new ['parrot';'Hash']
  vivify_364:
    set $P1040, $P1039["identifier"]
    unless_null $P1040, vivify_365
    new $P1040, "Undef"
  vivify_365:
    $P1037."namespace"($P1040)
.annotate 'line', 383
    find_lex $P1041, "$past"
    $P1041."blocktype"("immediate")
.annotate 'line', 384
    find_lex $P1042, "$/"
    find_lex $P1043, "$past"
    $P1044 = $P1042."!make"($P1043)
.annotate 'line', 380
    .return ($P1044)
  control_1023:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1045, exception, "payload"
    .return ($P1045)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<my>"  :subid("65_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1049
.annotate 'line', 387
    new $P1048, 'ExceptionHandler'
    set_addr $P1048, control_1047
    $P1048."handle_types"(57)
    push_eh $P1048
    .lex "self", self
    .lex "$/", param_1049
    find_lex $P1050, "$/"
    find_lex $P1051, "$/"
    unless_null $P1051, vivify_366
    $P1051 = root_new ['parrot';'Hash']
  vivify_366:
    set $P1052, $P1051["scoped"]
    unless_null $P1052, vivify_367
    new $P1052, "Undef"
  vivify_367:
    $P1053 = $P1052."ast"()
    $P1054 = $P1050."!make"($P1053)
    .return ($P1054)
  control_1047:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1055, exception, "payload"
    .return ($P1055)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<our>"  :subid("66_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1059
.annotate 'line', 388
    new $P1058, 'ExceptionHandler'
    set_addr $P1058, control_1057
    $P1058."handle_types"(57)
    push_eh $P1058
    .lex "self", self
    .lex "$/", param_1059
    find_lex $P1060, "$/"
    find_lex $P1061, "$/"
    unless_null $P1061, vivify_368
    $P1061 = root_new ['parrot';'Hash']
  vivify_368:
    set $P1062, $P1061["scoped"]
    unless_null $P1062, vivify_369
    new $P1062, "Undef"
  vivify_369:
    $P1063 = $P1062."ast"()
    $P1064 = $P1060."!make"($P1063)
    .return ($P1064)
  control_1057:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1065, exception, "payload"
    .return ($P1065)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<has>"  :subid("67_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1069
.annotate 'line', 389
    new $P1068, 'ExceptionHandler'
    set_addr $P1068, control_1067
    $P1068."handle_types"(57)
    push_eh $P1068
    .lex "self", self
    .lex "$/", param_1069
    find_lex $P1070, "$/"
    find_lex $P1071, "$/"
    unless_null $P1071, vivify_370
    $P1071 = root_new ['parrot';'Hash']
  vivify_370:
    set $P1072, $P1071["scoped"]
    unless_null $P1072, vivify_371
    new $P1072, "Undef"
  vivify_371:
    $P1073 = $P1072."ast"()
    $P1074 = $P1070."!make"($P1073)
    .return ($P1074)
  control_1067:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1075, exception, "payload"
    .return ($P1075)
.end


.namespace ["NQP";"Actions"]
.sub "scoped"  :subid("68_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1079
.annotate 'line', 391
    new $P1078, 'ExceptionHandler'
    set_addr $P1078, control_1077
    $P1078."handle_types"(57)
    push_eh $P1078
    .lex "self", self
    .lex "$/", param_1079
.annotate 'line', 392
    find_lex $P1080, "$/"
.annotate 'line', 393
    find_lex $P1083, "$/"
    unless_null $P1083, vivify_372
    $P1083 = root_new ['parrot';'Hash']
  vivify_372:
    set $P1084, $P1083["declarator"]
    unless_null $P1084, vivify_373
    new $P1084, "Undef"
  vivify_373:
    if $P1084, if_1082
.annotate 'line', 394
    find_lex $P1088, "$/"
    unless_null $P1088, vivify_374
    $P1088 = root_new ['parrot';'Hash']
  vivify_374:
    set $P1089, $P1088["multi_declarator"]
    unless_null $P1089, vivify_375
    new $P1089, "Undef"
  vivify_375:
    $P1090 = $P1089."ast"()
    set $P1081, $P1090
.annotate 'line', 393
    goto if_1082_end
  if_1082:
    find_lex $P1085, "$/"
    unless_null $P1085, vivify_376
    $P1085 = root_new ['parrot';'Hash']
  vivify_376:
    set $P1086, $P1085["declarator"]
    unless_null $P1086, vivify_377
    new $P1086, "Undef"
  vivify_377:
    $P1087 = $P1086."ast"()
    set $P1081, $P1087
  if_1082_end:
    $P1091 = $P1080."!make"($P1081)
.annotate 'line', 391
    .return ($P1091)
  control_1077:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1092, exception, "payload"
    .return ($P1092)
.end


.namespace ["NQP";"Actions"]
.sub "declarator"  :subid("69_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1096
.annotate 'line', 397
    new $P1095, 'ExceptionHandler'
    set_addr $P1095, control_1094
    $P1095."handle_types"(57)
    push_eh $P1095
    .lex "self", self
    .lex "$/", param_1096
.annotate 'line', 398
    find_lex $P1097, "$/"
.annotate 'line', 399
    find_lex $P1100, "$/"
    unless_null $P1100, vivify_378
    $P1100 = root_new ['parrot';'Hash']
  vivify_378:
    set $P1101, $P1100["routine_declarator"]
    unless_null $P1101, vivify_379
    new $P1101, "Undef"
  vivify_379:
    if $P1101, if_1099
.annotate 'line', 400
    find_lex $P1105, "$/"
    unless_null $P1105, vivify_380
    $P1105 = root_new ['parrot';'Hash']
  vivify_380:
    set $P1106, $P1105["variable_declarator"]
    unless_null $P1106, vivify_381
    new $P1106, "Undef"
  vivify_381:
    $P1107 = $P1106."ast"()
    set $P1098, $P1107
.annotate 'line', 399
    goto if_1099_end
  if_1099:
    find_lex $P1102, "$/"
    unless_null $P1102, vivify_382
    $P1102 = root_new ['parrot';'Hash']
  vivify_382:
    set $P1103, $P1102["routine_declarator"]
    unless_null $P1103, vivify_383
    new $P1103, "Undef"
  vivify_383:
    $P1104 = $P1103."ast"()
    set $P1098, $P1104
  if_1099_end:
    $P1108 = $P1097."!make"($P1098)
.annotate 'line', 397
    .return ($P1108)
  control_1094:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1109, exception, "payload"
    .return ($P1109)
.end


.namespace ["NQP";"Actions"]
.sub "multi_declarator:sym<multi>"  :subid("70_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1113
.annotate 'line', 403
    new $P1112, 'ExceptionHandler'
    set_addr $P1112, control_1111
    $P1112."handle_types"(57)
    push_eh $P1112
    .lex "self", self
    .lex "$/", param_1113
    find_lex $P1114, "$/"
    find_lex $P1117, "$/"
    unless_null $P1117, vivify_384
    $P1117 = root_new ['parrot';'Hash']
  vivify_384:
    set $P1118, $P1117["declarator"]
    unless_null $P1118, vivify_385
    new $P1118, "Undef"
  vivify_385:
    if $P1118, if_1116
    find_lex $P1122, "$/"
    unless_null $P1122, vivify_386
    $P1122 = root_new ['parrot';'Hash']
  vivify_386:
    set $P1123, $P1122["routine_def"]
    unless_null $P1123, vivify_387
    new $P1123, "Undef"
  vivify_387:
    $P1124 = $P1123."ast"()
    set $P1115, $P1124
    goto if_1116_end
  if_1116:
    find_lex $P1119, "$/"
    unless_null $P1119, vivify_388
    $P1119 = root_new ['parrot';'Hash']
  vivify_388:
    set $P1120, $P1119["declarator"]
    unless_null $P1120, vivify_389
    new $P1120, "Undef"
  vivify_389:
    $P1121 = $P1120."ast"()
    set $P1115, $P1121
  if_1116_end:
    $P1125 = $P1114."!make"($P1115)
    .return ($P1125)
  control_1111:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1126, exception, "payload"
    .return ($P1126)
.end


.namespace ["NQP";"Actions"]
.sub "multi_declarator:sym<null>"  :subid("71_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1130
.annotate 'line', 404
    new $P1129, 'ExceptionHandler'
    set_addr $P1129, control_1128
    $P1129."handle_types"(57)
    push_eh $P1129
    .lex "self", self
    .lex "$/", param_1130
    find_lex $P1131, "$/"
    find_lex $P1132, "$/"
    unless_null $P1132, vivify_390
    $P1132 = root_new ['parrot';'Hash']
  vivify_390:
    set $P1133, $P1132["declarator"]
    unless_null $P1133, vivify_391
    new $P1133, "Undef"
  vivify_391:
    $P1134 = $P1133."ast"()
    $P1135 = $P1131."!make"($P1134)
    .return ($P1135)
  control_1128:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1136, exception, "payload"
    .return ($P1136)
.end


.namespace ["NQP";"Actions"]
.sub "variable_declarator"  :subid("72_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1140
.annotate 'line', 407
    .const 'Sub' $P1180 = "73_1275600017.58296" 
    capture_lex $P1180
    new $P1139, 'ExceptionHandler'
    set_addr $P1139, control_1138
    $P1139."handle_types"(57)
    push_eh $P1139
    .lex "self", self
    .lex "$/", param_1140
.annotate 'line', 408
    new $P1141, "Undef"
    .lex "$past", $P1141
.annotate 'line', 409
    new $P1142, "Undef"
    .lex "$sigil", $P1142
.annotate 'line', 410
    new $P1143, "Undef"
    .lex "$name", $P1143
.annotate 'line', 411
    new $P1144, "Undef"
    .lex "$BLOCK", $P1144
.annotate 'line', 408
    find_lex $P1145, "$/"
    unless_null $P1145, vivify_392
    $P1145 = root_new ['parrot';'Hash']
  vivify_392:
    set $P1146, $P1145["variable"]
    unless_null $P1146, vivify_393
    new $P1146, "Undef"
  vivify_393:
    $P1147 = $P1146."ast"()
    store_lex "$past", $P1147
.annotate 'line', 409
    find_lex $P1148, "$/"
    unless_null $P1148, vivify_394
    $P1148 = root_new ['parrot';'Hash']
  vivify_394:
    set $P1149, $P1148["variable"]
    unless_null $P1149, vivify_395
    $P1149 = root_new ['parrot';'Hash']
  vivify_395:
    set $P1150, $P1149["sigil"]
    unless_null $P1150, vivify_396
    new $P1150, "Undef"
  vivify_396:
    store_lex "$sigil", $P1150
.annotate 'line', 410
    find_lex $P1151, "$past"
    $P1152 = $P1151."name"()
    store_lex "$name", $P1152
.annotate 'line', 411
    get_global $P1153, "@BLOCK"
    unless_null $P1153, vivify_397
    $P1153 = root_new ['parrot';'ResizablePMCArray']
  vivify_397:
    set $P1154, $P1153[0]
    unless_null $P1154, vivify_398
    new $P1154, "Undef"
  vivify_398:
    store_lex "$BLOCK", $P1154
.annotate 'line', 412
    find_lex $P1156, "$BLOCK"
    find_lex $P1157, "$name"
    $P1158 = $P1156."symbol"($P1157)
    unless $P1158, if_1155_end
.annotate 'line', 413
    find_lex $P1159, "$/"
    $P1160 = $P1159."CURSOR"()
    find_lex $P1161, "$name"
    $P1160."panic"("Redeclaration of symbol ", $P1161)
  if_1155_end:
.annotate 'line', 415
    find_dynamic_lex $P1163, "$*SCOPE"
    unless_null $P1163, vivify_399
    get_hll_global $P1163, "$SCOPE"
    unless_null $P1163, vivify_400
    die "Contextual $*SCOPE not found"
  vivify_400:
  vivify_399:
    set $S1164, $P1163
    iseq $I1165, $S1164, "has"
    if $I1165, if_1162
.annotate 'line', 424
    .const 'Sub' $P1180 = "73_1275600017.58296" 
    capture_lex $P1180
    $P1180()
    goto if_1162_end
  if_1162:
.annotate 'line', 416
    find_lex $P1166, "$BLOCK"
    find_lex $P1167, "$name"
    $P1166."symbol"($P1167, "attribute" :named("scope"))
.annotate 'line', 417
    find_lex $P1169, "$BLOCK"
    unless_null $P1169, vivify_405
    $P1169 = root_new ['parrot';'Hash']
  vivify_405:
    set $P1170, $P1169["attributes"]
    unless_null $P1170, vivify_406
    new $P1170, "Undef"
  vivify_406:
    if $P1170, unless_1168_end
.annotate 'line', 419
    get_hll_global $P1171, ["PAST"], "Op"
    $P1172 = $P1171."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P1173, "$BLOCK"
    unless_null $P1173, vivify_407
    $P1173 = root_new ['parrot';'Hash']
    store_lex "$BLOCK", $P1173
  vivify_407:
    set $P1173["attributes"], $P1172
  unless_1168_end:
.annotate 'line', 421
    find_lex $P1174, "$BLOCK"
    unless_null $P1174, vivify_408
    $P1174 = root_new ['parrot';'Hash']
  vivify_408:
    set $P1175, $P1174["attributes"]
    unless_null $P1175, vivify_409
    new $P1175, "Undef"
  vivify_409:
    find_lex $P1176, "$name"
    $P1175."push"($P1176)
.annotate 'line', 422
    get_hll_global $P1177, ["PAST"], "Stmts"
    $P1178 = $P1177."new"()
    store_lex "$past", $P1178
  if_1162_end:
.annotate 'line', 432
    find_lex $P1204, "$/"
    find_lex $P1205, "$past"
    $P1206 = $P1204."!make"($P1205)
.annotate 'line', 407
    .return ($P1206)
  control_1138:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1207, exception, "payload"
    .return ($P1207)
.end


.namespace ["NQP";"Actions"]
.sub "_block1179"  :anon :subid("73_1275600017.58296") :outer("72_1275600017.58296")
.annotate 'line', 425
    new $P1181, "Undef"
    .lex "$scope", $P1181
.annotate 'line', 426
    new $P1182, "Undef"
    .lex "$decl", $P1182
.annotate 'line', 425
    find_dynamic_lex $P1185, "$*SCOPE"
    unless_null $P1185, vivify_401
    get_hll_global $P1185, "$SCOPE"
    unless_null $P1185, vivify_402
    die "Contextual $*SCOPE not found"
  vivify_402:
  vivify_401:
    set $S1186, $P1185
    iseq $I1187, $S1186, "our"
    if $I1187, if_1184
    new $P1189, "String"
    assign $P1189, "lexical"
    set $P1183, $P1189
    goto if_1184_end
  if_1184:
    new $P1188, "String"
    assign $P1188, "package"
    set $P1183, $P1188
  if_1184_end:
    store_lex "$scope", $P1183
.annotate 'line', 426
    get_hll_global $P1190, ["PAST"], "Var"
    find_lex $P1191, "$name"
    find_lex $P1192, "$scope"
.annotate 'line', 427
    find_lex $P1193, "$sigil"
    $P1194 = "vivitype"($P1193)
    find_lex $P1195, "$/"
    $P1196 = $P1190."new"($P1191 :named("name"), $P1192 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P1194 :named("viviself"), $P1195 :named("node"))
.annotate 'line', 426
    store_lex "$decl", $P1196
.annotate 'line', 429
    find_lex $P1197, "$BLOCK"
    find_lex $P1198, "$name"
    find_lex $P1199, "$scope"
    $P1197."symbol"($P1198, $P1199 :named("scope"))
.annotate 'line', 430
    find_lex $P1200, "$BLOCK"
    unless_null $P1200, vivify_403
    $P1200 = root_new ['parrot';'ResizablePMCArray']
  vivify_403:
    set $P1201, $P1200[0]
    unless_null $P1201, vivify_404
    new $P1201, "Undef"
  vivify_404:
    find_lex $P1202, "$decl"
    $P1203 = $P1201."push"($P1202)
.annotate 'line', 424
    .return ($P1203)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<sub>"  :subid("74_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1211
.annotate 'line', 435
    new $P1210, 'ExceptionHandler'
    set_addr $P1210, control_1209
    $P1210."handle_types"(57)
    push_eh $P1210
    .lex "self", self
    .lex "$/", param_1211
    find_lex $P1212, "$/"
    find_lex $P1213, "$/"
    unless_null $P1213, vivify_410
    $P1213 = root_new ['parrot';'Hash']
  vivify_410:
    set $P1214, $P1213["routine_def"]
    unless_null $P1214, vivify_411
    new $P1214, "Undef"
  vivify_411:
    $P1215 = $P1214."ast"()
    $P1216 = $P1212."!make"($P1215)
    .return ($P1216)
  control_1209:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1217, exception, "payload"
    .return ($P1217)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<method>"  :subid("75_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1221
.annotate 'line', 436
    new $P1220, 'ExceptionHandler'
    set_addr $P1220, control_1219
    $P1220."handle_types"(57)
    push_eh $P1220
    .lex "self", self
    .lex "$/", param_1221
    find_lex $P1222, "$/"
    find_lex $P1223, "$/"
    unless_null $P1223, vivify_412
    $P1223 = root_new ['parrot';'Hash']
  vivify_412:
    set $P1224, $P1223["method_def"]
    unless_null $P1224, vivify_413
    new $P1224, "Undef"
  vivify_413:
    $P1225 = $P1224."ast"()
    $P1226 = $P1222."!make"($P1225)
    .return ($P1226)
  control_1219:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1227, exception, "payload"
    .return ($P1227)
.end


.namespace ["NQP";"Actions"]
.sub "routine_def"  :subid("76_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1231
.annotate 'line', 438
    .const 'Sub' $P1242 = "77_1275600017.58296" 
    capture_lex $P1242
    new $P1230, 'ExceptionHandler'
    set_addr $P1230, control_1229
    $P1230."handle_types"(57)
    push_eh $P1230
    .lex "self", self
    .lex "$/", param_1231
.annotate 'line', 439
    new $P1232, "Undef"
    .lex "$past", $P1232
    find_lex $P1233, "$/"
    unless_null $P1233, vivify_414
    $P1233 = root_new ['parrot';'Hash']
  vivify_414:
    set $P1234, $P1233["blockoid"]
    unless_null $P1234, vivify_415
    new $P1234, "Undef"
  vivify_415:
    $P1235 = $P1234."ast"()
    store_lex "$past", $P1235
.annotate 'line', 440
    find_lex $P1236, "$past"
    $P1236."blocktype"("declaration")
.annotate 'line', 441
    find_lex $P1237, "$past"
    $P1237."control"("return_pir")
.annotate 'line', 442
    find_lex $P1239, "$/"
    unless_null $P1239, vivify_416
    $P1239 = root_new ['parrot';'Hash']
  vivify_416:
    set $P1240, $P1239["deflongname"]
    unless_null $P1240, vivify_417
    new $P1240, "Undef"
  vivify_417:
    unless $P1240, if_1238_end
    .const 'Sub' $P1242 = "77_1275600017.58296" 
    capture_lex $P1242
    $P1242()
  if_1238_end:
.annotate 'line', 452
    find_lex $P1274, "$/"
    find_lex $P1275, "$past"
    $P1276 = $P1274."!make"($P1275)
.annotate 'line', 438
    .return ($P1276)
  control_1229:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1277, exception, "payload"
    .return ($P1277)
.end


.namespace ["NQP";"Actions"]
.sub "_block1241"  :anon :subid("77_1275600017.58296") :outer("76_1275600017.58296")
.annotate 'line', 443
    new $P1243, "Undef"
    .lex "$name", $P1243
    find_lex $P1244, "$/"
    unless_null $P1244, vivify_418
    $P1244 = root_new ['parrot';'Hash']
  vivify_418:
    set $P1245, $P1244["sigil"]
    unless_null $P1245, vivify_419
    $P1245 = root_new ['parrot';'ResizablePMCArray']
  vivify_419:
    set $P1246, $P1245[0]
    unless_null $P1246, vivify_420
    new $P1246, "Undef"
  vivify_420:
    set $S1247, $P1246
    new $P1248, 'String'
    set $P1248, $S1247
    find_lex $P1249, "$/"
    unless_null $P1249, vivify_421
    $P1249 = root_new ['parrot';'Hash']
  vivify_421:
    set $P1250, $P1249["deflongname"]
    unless_null $P1250, vivify_422
    $P1250 = root_new ['parrot';'ResizablePMCArray']
  vivify_422:
    set $P1251, $P1250[0]
    unless_null $P1251, vivify_423
    new $P1251, "Undef"
  vivify_423:
    $S1252 = $P1251."ast"()
    concat $P1253, $P1248, $S1252
    store_lex "$name", $P1253
.annotate 'line', 444
    find_lex $P1254, "$past"
    find_lex $P1255, "$name"
    $P1254."name"($P1255)
.annotate 'line', 445
    find_dynamic_lex $P1258, "$*SCOPE"
    unless_null $P1258, vivify_424
    get_hll_global $P1258, "$SCOPE"
    unless_null $P1258, vivify_425
    die "Contextual $*SCOPE not found"
  vivify_425:
  vivify_424:
    set $S1259, $P1258
    isne $I1260, $S1259, "our"
    if $I1260, if_1257
    new $P1256, 'Integer'
    set $P1256, $I1260
    goto if_1257_end
  if_1257:
.annotate 'line', 446
    get_global $P1261, "@BLOCK"
    unless_null $P1261, vivify_426
    $P1261 = root_new ['parrot';'ResizablePMCArray']
  vivify_426:
    set $P1262, $P1261[0]
    unless_null $P1262, vivify_427
    $P1262 = root_new ['parrot';'ResizablePMCArray']
  vivify_427:
    set $P1263, $P1262[0]
    unless_null $P1263, vivify_428
    new $P1263, "Undef"
  vivify_428:
    get_hll_global $P1264, ["PAST"], "Var"
    find_lex $P1265, "$name"
    find_lex $P1266, "$past"
    $P1267 = $P1264."new"($P1265 :named("name"), 1 :named("isdecl"), $P1266 :named("viviself"), "lexical" :named("scope"))
    $P1263."push"($P1267)
.annotate 'line', 448
    get_global $P1268, "@BLOCK"
    unless_null $P1268, vivify_429
    $P1268 = root_new ['parrot';'ResizablePMCArray']
  vivify_429:
    set $P1269, $P1268[0]
    unless_null $P1269, vivify_430
    new $P1269, "Undef"
  vivify_430:
    find_lex $P1270, "$name"
    $P1269."symbol"($P1270, "lexical" :named("scope"))
.annotate 'line', 449
    get_hll_global $P1271, ["PAST"], "Var"
    find_lex $P1272, "$name"
    $P1273 = $P1271."new"($P1272 :named("name"))
    store_lex "$past", $P1273
.annotate 'line', 445
    set $P1256, $P1273
  if_1257_end:
.annotate 'line', 442
    .return ($P1256)
.end


.namespace ["NQP";"Actions"]
.sub "method_def"  :subid("78_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1281
.annotate 'line', 456
    .const 'Sub' $P1297 = "79_1275600017.58296" 
    capture_lex $P1297
    new $P1280, 'ExceptionHandler'
    set_addr $P1280, control_1279
    $P1280."handle_types"(57)
    push_eh $P1280
    .lex "self", self
    .lex "$/", param_1281
.annotate 'line', 457
    new $P1282, "Undef"
    .lex "$past", $P1282
    find_lex $P1283, "$/"
    unless_null $P1283, vivify_431
    $P1283 = root_new ['parrot';'Hash']
  vivify_431:
    set $P1284, $P1283["blockoid"]
    unless_null $P1284, vivify_432
    new $P1284, "Undef"
  vivify_432:
    $P1285 = $P1284."ast"()
    store_lex "$past", $P1285
.annotate 'line', 458
    find_lex $P1286, "$past"
    $P1286."blocktype"("method")
.annotate 'line', 459
    find_lex $P1287, "$past"
    $P1287."control"("return_pir")
.annotate 'line', 460
    find_lex $P1288, "$past"
    unless_null $P1288, vivify_433
    $P1288 = root_new ['parrot';'ResizablePMCArray']
  vivify_433:
    set $P1289, $P1288[0]
    unless_null $P1289, vivify_434
    new $P1289, "Undef"
  vivify_434:
    get_hll_global $P1290, ["PAST"], "Op"
    $P1291 = $P1290."new"("    .lex \"self\", self" :named("inline"))
    $P1289."unshift"($P1291)
.annotate 'line', 461
    find_lex $P1292, "$past"
    $P1292."symbol"("self", "lexical" :named("scope"))
.annotate 'line', 462
    find_lex $P1294, "$/"
    unless_null $P1294, vivify_435
    $P1294 = root_new ['parrot';'Hash']
  vivify_435:
    set $P1295, $P1294["deflongname"]
    unless_null $P1295, vivify_436
    new $P1295, "Undef"
  vivify_436:
    unless $P1295, if_1293_end
    .const 'Sub' $P1297 = "79_1275600017.58296" 
    capture_lex $P1297
    $P1297()
  if_1293_end:
.annotate 'line', 466
    find_dynamic_lex $P1309, "$*MULTINESS"
    unless_null $P1309, vivify_440
    get_hll_global $P1309, "$MULTINESS"
    unless_null $P1309, vivify_441
    die "Contextual $*MULTINESS not found"
  vivify_441:
  vivify_440:
    set $S1310, $P1309
    iseq $I1311, $S1310, "multi"
    unless $I1311, if_1308_end
    find_lex $P1312, "$past"
    $P1313 = $P1312."multi"()
    $P1313."unshift"("_")
  if_1308_end:
.annotate 'line', 467
    find_lex $P1314, "$/"
    find_lex $P1315, "$past"
    $P1316 = $P1314."!make"($P1315)
.annotate 'line', 456
    .return ($P1316)
  control_1279:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1317, exception, "payload"
    .return ($P1317)
.end


.namespace ["NQP";"Actions"]
.sub "_block1296"  :anon :subid("79_1275600017.58296") :outer("78_1275600017.58296")
.annotate 'line', 463
    new $P1298, "Undef"
    .lex "$name", $P1298
    find_lex $P1299, "$/"
    unless_null $P1299, vivify_437
    $P1299 = root_new ['parrot';'Hash']
  vivify_437:
    set $P1300, $P1299["deflongname"]
    unless_null $P1300, vivify_438
    $P1300 = root_new ['parrot';'ResizablePMCArray']
  vivify_438:
    set $P1301, $P1300[0]
    unless_null $P1301, vivify_439
    new $P1301, "Undef"
  vivify_439:
    $P1302 = $P1301."ast"()
    set $S1303, $P1302
    new $P1304, 'String'
    set $P1304, $S1303
    store_lex "$name", $P1304
.annotate 'line', 464
    find_lex $P1305, "$past"
    find_lex $P1306, "$name"
    $P1307 = $P1305."name"($P1306)
.annotate 'line', 462
    .return ($P1307)
.end


.namespace ["NQP";"Actions"]
.sub "signature"  :subid("80_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1321
.annotate 'line', 471
    .const 'Sub' $P1347 = "82_1275600017.58296" 
    capture_lex $P1347
    .const 'Sub' $P1332 = "81_1275600017.58296" 
    capture_lex $P1332
    new $P1320, 'ExceptionHandler'
    set_addr $P1320, control_1319
    $P1320."handle_types"(57)
    push_eh $P1320
    .lex "self", self
    .lex "$/", param_1321
.annotate 'line', 472
    new $P1322, "Undef"
    .lex "$BLOCKINIT", $P1322
    get_global $P1323, "@BLOCK"
    unless_null $P1323, vivify_442
    $P1323 = root_new ['parrot';'ResizablePMCArray']
  vivify_442:
    set $P1324, $P1323[0]
    unless_null $P1324, vivify_443
    $P1324 = root_new ['parrot';'ResizablePMCArray']
  vivify_443:
    set $P1325, $P1324[0]
    unless_null $P1325, vivify_444
    new $P1325, "Undef"
  vivify_444:
    store_lex "$BLOCKINIT", $P1325
.annotate 'line', 474
    find_lex $P1327, "$/"
    unless_null $P1327, vivify_445
    $P1327 = root_new ['parrot';'Hash']
  vivify_445:
    set $P1328, $P1327["parameter"]
    unless_null $P1328, vivify_446
    new $P1328, "Undef"
  vivify_446:
    defined $I1329, $P1328
    unless $I1329, for_undef_447
    iter $P1326, $P1328
    new $P1339, 'ExceptionHandler'
    set_addr $P1339, loop1338_handler
    $P1339."handle_types"(64, 66, 65)
    push_eh $P1339
  loop1338_test:
    unless $P1326, loop1338_done
    shift $P1330, $P1326
  loop1338_redo:
    .const 'Sub' $P1332 = "81_1275600017.58296" 
    capture_lex $P1332
    $P1332($P1330)
  loop1338_next:
    goto loop1338_test
  loop1338_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1340, exception, 'type'
    eq $P1340, 64, loop1338_next
    eq $P1340, 66, loop1338_redo
  loop1338_done:
    pop_eh 
  for_undef_447:
.annotate 'line', 477
    find_dynamic_lex $P1343, "$*MULTINESS"
    unless_null $P1343, vivify_448
    get_hll_global $P1343, "$MULTINESS"
    unless_null $P1343, vivify_449
    die "Contextual $*MULTINESS not found"
  vivify_449:
  vivify_448:
    set $S1344, $P1343
    iseq $I1345, $S1344, "multi"
    if $I1345, if_1342
    new $P1341, 'Integer'
    set $P1341, $I1345
    goto if_1342_end
  if_1342:
    .const 'Sub' $P1347 = "82_1275600017.58296" 
    capture_lex $P1347
    $P1373 = $P1347()
    set $P1341, $P1373
  if_1342_end:
.annotate 'line', 471
    .return ($P1341)
  control_1319:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1374, exception, "payload"
    .return ($P1374)
.end


.namespace ["NQP";"Actions"]
.sub "_block1331"  :anon :subid("81_1275600017.58296") :outer("80_1275600017.58296")
    .param pmc param_1333
.annotate 'line', 474
    .lex "$_", param_1333
    find_lex $P1334, "$BLOCKINIT"
    find_lex $P1335, "$_"
    $P1336 = $P1335."ast"()
    $P1337 = $P1334."push"($P1336)
    .return ($P1337)
.end


.namespace ["NQP";"Actions"]
.sub "_block1346"  :anon :subid("82_1275600017.58296") :outer("80_1275600017.58296")
.annotate 'line', 477
    .const 'Sub' $P1356 = "83_1275600017.58296" 
    capture_lex $P1356
.annotate 'line', 478
    $P1348 = root_new ['parrot';'ResizablePMCArray']
    .lex "@params", $P1348
.annotate 'line', 477
    find_lex $P1349, "@params"
.annotate 'line', 479
    find_lex $P1351, "$BLOCKINIT"
    $P1352 = $P1351."list"()
    defined $I1353, $P1352
    unless $I1353, for_undef_450
    iter $P1350, $P1352
    new $P1367, 'ExceptionHandler'
    set_addr $P1367, loop1366_handler
    $P1367."handle_types"(64, 66, 65)
    push_eh $P1367
  loop1366_test:
    unless $P1350, loop1366_done
    shift $P1354, $P1350
  loop1366_redo:
    .const 'Sub' $P1356 = "83_1275600017.58296" 
    capture_lex $P1356
    $P1356($P1354)
  loop1366_next:
    goto loop1366_test
  loop1366_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1368, exception, 'type'
    eq $P1368, 64, loop1366_next
    eq $P1368, 66, loop1366_redo
  loop1366_done:
    pop_eh 
  for_undef_450:
.annotate 'line', 482
    get_global $P1369, "@BLOCK"
    unless_null $P1369, vivify_451
    $P1369 = root_new ['parrot';'ResizablePMCArray']
  vivify_451:
    set $P1370, $P1369[0]
    unless_null $P1370, vivify_452
    new $P1370, "Undef"
  vivify_452:
    find_lex $P1371, "@params"
    $P1372 = $P1370."multi"($P1371)
.annotate 'line', 477
    .return ($P1372)
.end


.namespace ["NQP";"Actions"]
.sub "_block1355"  :anon :subid("83_1275600017.58296") :outer("82_1275600017.58296")
    .param pmc param_1357
.annotate 'line', 479
    .lex "$_", param_1357
.annotate 'line', 480
    find_lex $P1358, "@params"
    find_lex $P1360, "$_"
    $P1361 = $P1360."multitype"()
    set $P1359, $P1361
    defined $I1363, $P1359
    if $I1363, default_1362
    new $P1364, "String"
    assign $P1364, "_"
    set $P1359, $P1364
  default_1362:
    $P1365 = $P1358."push"($P1359)
.annotate 'line', 479
    .return ($P1365)
.end


.namespace ["NQP";"Actions"]
.sub "parameter"  :subid("84_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1378
.annotate 'line', 486
    .const 'Sub' $P1459 = "85_1275600017.58296" 
    capture_lex $P1459
    new $P1377, 'ExceptionHandler'
    set_addr $P1377, control_1376
    $P1377."handle_types"(57)
    push_eh $P1377
    .lex "self", self
    .lex "$/", param_1378
.annotate 'line', 487
    new $P1379, "Undef"
    .lex "$quant", $P1379
.annotate 'line', 488
    new $P1380, "Undef"
    .lex "$past", $P1380
.annotate 'line', 487
    find_lex $P1381, "$/"
    unless_null $P1381, vivify_453
    $P1381 = root_new ['parrot';'Hash']
  vivify_453:
    set $P1382, $P1381["quant"]
    unless_null $P1382, vivify_454
    new $P1382, "Undef"
  vivify_454:
    store_lex "$quant", $P1382
    find_lex $P1383, "$past"
.annotate 'line', 489
    find_lex $P1385, "$/"
    unless_null $P1385, vivify_455
    $P1385 = root_new ['parrot';'Hash']
  vivify_455:
    set $P1386, $P1385["named_param"]
    unless_null $P1386, vivify_456
    new $P1386, "Undef"
  vivify_456:
    if $P1386, if_1384
.annotate 'line', 496
    find_lex $P1400, "$/"
    unless_null $P1400, vivify_457
    $P1400 = root_new ['parrot';'Hash']
  vivify_457:
    set $P1401, $P1400["param_var"]
    unless_null $P1401, vivify_458
    new $P1401, "Undef"
  vivify_458:
    $P1402 = $P1401."ast"()
    store_lex "$past", $P1402
.annotate 'line', 497
    find_lex $P1404, "$quant"
    set $S1405, $P1404
    iseq $I1406, $S1405, "*"
    if $I1406, if_1403
.annotate 'line', 501
    find_lex $P1415, "$quant"
    set $S1416, $P1415
    iseq $I1417, $S1416, "?"
    unless $I1417, if_1414_end
.annotate 'line', 502
    find_lex $P1418, "$past"
    find_lex $P1419, "$/"
    unless_null $P1419, vivify_459
    $P1419 = root_new ['parrot';'Hash']
  vivify_459:
    set $P1420, $P1419["param_var"]
    unless_null $P1420, vivify_460
    $P1420 = root_new ['parrot';'Hash']
  vivify_460:
    set $P1421, $P1420["sigil"]
    unless_null $P1421, vivify_461
    new $P1421, "Undef"
  vivify_461:
    $P1422 = "vivitype"($P1421)
    $P1418."viviself"($P1422)
  if_1414_end:
.annotate 'line', 501
    goto if_1403_end
  if_1403:
.annotate 'line', 498
    find_lex $P1407, "$past"
    $P1407."slurpy"(1)
.annotate 'line', 499
    find_lex $P1408, "$past"
    find_lex $P1409, "$/"
    unless_null $P1409, vivify_462
    $P1409 = root_new ['parrot';'Hash']
  vivify_462:
    set $P1410, $P1409["param_var"]
    unless_null $P1410, vivify_463
    $P1410 = root_new ['parrot';'Hash']
  vivify_463:
    set $P1411, $P1410["sigil"]
    unless_null $P1411, vivify_464
    new $P1411, "Undef"
  vivify_464:
    set $S1412, $P1411
    iseq $I1413, $S1412, "%"
    $P1408."named"($I1413)
  if_1403_end:
.annotate 'line', 495
    goto if_1384_end
  if_1384:
.annotate 'line', 490
    find_lex $P1387, "$/"
    unless_null $P1387, vivify_465
    $P1387 = root_new ['parrot';'Hash']
  vivify_465:
    set $P1388, $P1387["named_param"]
    unless_null $P1388, vivify_466
    new $P1388, "Undef"
  vivify_466:
    $P1389 = $P1388."ast"()
    store_lex "$past", $P1389
.annotate 'line', 491
    find_lex $P1391, "$quant"
    set $S1392, $P1391
    isne $I1393, $S1392, "!"
    unless $I1393, if_1390_end
.annotate 'line', 492
    find_lex $P1394, "$past"
    find_lex $P1395, "$/"
    unless_null $P1395, vivify_467
    $P1395 = root_new ['parrot';'Hash']
  vivify_467:
    set $P1396, $P1395["named_param"]
    unless_null $P1396, vivify_468
    $P1396 = root_new ['parrot';'Hash']
  vivify_468:
    set $P1397, $P1396["param_var"]
    unless_null $P1397, vivify_469
    $P1397 = root_new ['parrot';'Hash']
  vivify_469:
    set $P1398, $P1397["sigil"]
    unless_null $P1398, vivify_470
    new $P1398, "Undef"
  vivify_470:
    $P1399 = "vivitype"($P1398)
    $P1394."viviself"($P1399)
  if_1390_end:
  if_1384_end:
.annotate 'line', 505
    find_lex $P1424, "$/"
    unless_null $P1424, vivify_471
    $P1424 = root_new ['parrot';'Hash']
  vivify_471:
    set $P1425, $P1424["default_value"]
    unless_null $P1425, vivify_472
    new $P1425, "Undef"
  vivify_472:
    unless $P1425, if_1423_end
.annotate 'line', 506
    find_lex $P1427, "$quant"
    set $S1428, $P1427
    iseq $I1429, $S1428, "*"
    unless $I1429, if_1426_end
.annotate 'line', 507
    find_lex $P1430, "$/"
    $P1431 = $P1430."CURSOR"()
    $P1431."panic"("Can't put default on slurpy parameter")
  if_1426_end:
.annotate 'line', 509
    find_lex $P1433, "$quant"
    set $S1434, $P1433
    iseq $I1435, $S1434, "!"
    unless $I1435, if_1432_end
.annotate 'line', 510
    find_lex $P1436, "$/"
    $P1437 = $P1436."CURSOR"()
    $P1437."panic"("Can't put default on required parameter")
  if_1432_end:
.annotate 'line', 512
    find_lex $P1438, "$past"
    find_lex $P1439, "$/"
    unless_null $P1439, vivify_473
    $P1439 = root_new ['parrot';'Hash']
  vivify_473:
    set $P1440, $P1439["default_value"]
    unless_null $P1440, vivify_474
    $P1440 = root_new ['parrot';'ResizablePMCArray']
  vivify_474:
    set $P1441, $P1440[0]
    unless_null $P1441, vivify_475
    $P1441 = root_new ['parrot';'Hash']
  vivify_475:
    set $P1442, $P1441["EXPR"]
    unless_null $P1442, vivify_476
    new $P1442, "Undef"
  vivify_476:
    $P1443 = $P1442."ast"()
    $P1438."viviself"($P1443)
  if_1423_end:
.annotate 'line', 514
    find_lex $P1445, "$past"
    $P1446 = $P1445."viviself"()
    if $P1446, unless_1444_end
    get_global $P1447, "@BLOCK"
    unless_null $P1447, vivify_477
    $P1447 = root_new ['parrot';'ResizablePMCArray']
  vivify_477:
    set $P1448, $P1447[0]
    unless_null $P1448, vivify_478
    new $P1448, "Undef"
  vivify_478:
    get_global $P1449, "@BLOCK"
    unless_null $P1449, vivify_479
    $P1449 = root_new ['parrot';'ResizablePMCArray']
  vivify_479:
    set $P1450, $P1449[0]
    unless_null $P1450, vivify_480
    new $P1450, "Undef"
  vivify_480:
    $P1451 = $P1450."arity"()
    set $N1452, $P1451
    new $P1453, 'Float'
    set $P1453, $N1452
    add $P1454, $P1453, 1
    $P1448."arity"($P1454)
  unless_1444_end:
.annotate 'line', 517
    find_lex $P1456, "$/"
    unless_null $P1456, vivify_481
    $P1456 = root_new ['parrot';'Hash']
  vivify_481:
    set $P1457, $P1456["typename"]
    unless_null $P1457, vivify_482
    new $P1457, "Undef"
  vivify_482:
    unless $P1457, if_1455_end
    .const 'Sub' $P1459 = "85_1275600017.58296" 
    capture_lex $P1459
    $P1459()
  if_1455_end:
.annotate 'line', 523
    find_lex $P1483, "$/"
    find_lex $P1484, "$past"
    $P1485 = $P1483."!make"($P1484)
.annotate 'line', 486
    .return ($P1485)
  control_1376:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1486, exception, "payload"
    .return ($P1486)
.end


.namespace ["NQP";"Actions"]
.sub "_block1458"  :anon :subid("85_1275600017.58296") :outer("84_1275600017.58296")
.annotate 'line', 517
    .const 'Sub' $P1471 = "86_1275600017.58296" 
    capture_lex $P1471
.annotate 'line', 518
    $P1460 = root_new ['parrot';'ResizablePMCArray']
    .lex "@multitype", $P1460
.annotate 'line', 517
    find_lex $P1461, "@multitype"
.annotate 'line', 519
    find_lex $P1463, "$/"
    unless_null $P1463, vivify_483
    $P1463 = root_new ['parrot';'Hash']
  vivify_483:
    set $P1464, $P1463["typename"]
    unless_null $P1464, vivify_484
    $P1464 = root_new ['parrot';'ResizablePMCArray']
  vivify_484:
    set $P1465, $P1464[0]
    unless_null $P1465, vivify_485
    $P1465 = root_new ['parrot';'Hash']
  vivify_485:
    set $P1466, $P1465["name"]
    unless_null $P1466, vivify_486
    $P1466 = root_new ['parrot';'Hash']
  vivify_486:
    set $P1467, $P1466["identifier"]
    unless_null $P1467, vivify_487
    new $P1467, "Undef"
  vivify_487:
    defined $I1468, $P1467
    unless $I1468, for_undef_488
    iter $P1462, $P1467
    new $P1478, 'ExceptionHandler'
    set_addr $P1478, loop1477_handler
    $P1478."handle_types"(64, 66, 65)
    push_eh $P1478
  loop1477_test:
    unless $P1462, loop1477_done
    shift $P1469, $P1462
  loop1477_redo:
    .const 'Sub' $P1471 = "86_1275600017.58296" 
    capture_lex $P1471
    $P1471($P1469)
  loop1477_next:
    goto loop1477_test
  loop1477_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1479, exception, 'type'
    eq $P1479, 64, loop1477_next
    eq $P1479, 66, loop1477_redo
  loop1477_done:
    pop_eh 
  for_undef_488:
.annotate 'line', 520
    find_lex $P1480, "$past"
    find_lex $P1481, "@multitype"
    $P1482 = $P1480."multitype"($P1481)
.annotate 'line', 517
    .return ($P1482)
.end


.namespace ["NQP";"Actions"]
.sub "_block1470"  :anon :subid("86_1275600017.58296") :outer("85_1275600017.58296")
    .param pmc param_1472
.annotate 'line', 519
    .lex "$_", param_1472
    find_lex $P1473, "@multitype"
    find_lex $P1474, "$_"
    set $S1475, $P1474
    $P1476 = $P1473."push"($S1475)
    .return ($P1476)
.end


.namespace ["NQP";"Actions"]
.sub "param_var"  :subid("87_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1490
.annotate 'line', 526
    new $P1489, 'ExceptionHandler'
    set_addr $P1489, control_1488
    $P1489."handle_types"(57)
    push_eh $P1489
    .lex "self", self
    .lex "$/", param_1490
.annotate 'line', 527
    new $P1491, "Undef"
    .lex "$name", $P1491
.annotate 'line', 528
    new $P1492, "Undef"
    .lex "$past", $P1492
.annotate 'line', 527
    find_lex $P1493, "$/"
    set $S1494, $P1493
    new $P1495, 'String'
    set $P1495, $S1494
    store_lex "$name", $P1495
.annotate 'line', 528
    get_hll_global $P1496, ["PAST"], "Var"
    find_lex $P1497, "$name"
    find_lex $P1498, "$/"
    $P1499 = $P1496."new"($P1497 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1498 :named("node"))
    store_lex "$past", $P1499
.annotate 'line', 530
    get_global $P1500, "@BLOCK"
    unless_null $P1500, vivify_489
    $P1500 = root_new ['parrot';'ResizablePMCArray']
  vivify_489:
    set $P1501, $P1500[0]
    unless_null $P1501, vivify_490
    new $P1501, "Undef"
  vivify_490:
    find_lex $P1502, "$name"
    $P1501."symbol"($P1502, "lexical" :named("scope"))
.annotate 'line', 531
    find_lex $P1503, "$/"
    find_lex $P1504, "$past"
    $P1505 = $P1503."!make"($P1504)
.annotate 'line', 526
    .return ($P1505)
  control_1488:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1506, exception, "payload"
    .return ($P1506)
.end


.namespace ["NQP";"Actions"]
.sub "named_param"  :subid("88_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1510
.annotate 'line', 534
    new $P1509, 'ExceptionHandler'
    set_addr $P1509, control_1508
    $P1509."handle_types"(57)
    push_eh $P1509
    .lex "self", self
    .lex "$/", param_1510
.annotate 'line', 535
    new $P1511, "Undef"
    .lex "$past", $P1511
    find_lex $P1512, "$/"
    unless_null $P1512, vivify_491
    $P1512 = root_new ['parrot';'Hash']
  vivify_491:
    set $P1513, $P1512["param_var"]
    unless_null $P1513, vivify_492
    new $P1513, "Undef"
  vivify_492:
    $P1514 = $P1513."ast"()
    store_lex "$past", $P1514
.annotate 'line', 536
    find_lex $P1515, "$past"
    find_lex $P1516, "$/"
    unless_null $P1516, vivify_493
    $P1516 = root_new ['parrot';'Hash']
  vivify_493:
    set $P1517, $P1516["param_var"]
    unless_null $P1517, vivify_494
    $P1517 = root_new ['parrot';'Hash']
  vivify_494:
    set $P1518, $P1517["name"]
    unless_null $P1518, vivify_495
    new $P1518, "Undef"
  vivify_495:
    set $S1519, $P1518
    $P1515."named"($S1519)
.annotate 'line', 537
    find_lex $P1520, "$/"
    find_lex $P1521, "$past"
    $P1522 = $P1520."!make"($P1521)
.annotate 'line', 534
    .return ($P1522)
  control_1508:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1523, exception, "payload"
    .return ($P1523)
.end


.namespace ["NQP";"Actions"]
.sub "regex_declarator"  :subid("89_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1527
    .param pmc param_1528 :optional
    .param int has_param_1528 :opt_flag
.annotate 'line', 540
    .const 'Sub' $P1598 = "91_1275600017.58296" 
    capture_lex $P1598
    .const 'Sub' $P1570 = "90_1275600017.58296" 
    capture_lex $P1570
    new $P1526, 'ExceptionHandler'
    set_addr $P1526, control_1525
    $P1526."handle_types"(57)
    push_eh $P1526
    .lex "self", self
    .lex "$/", param_1527
    if has_param_1528, optparam_496
    new $P1529, "Undef"
    set param_1528, $P1529
  optparam_496:
    .lex "$key", param_1528
.annotate 'line', 541
    $P1530 = root_new ['parrot';'ResizablePMCArray']
    .lex "@MODIFIERS", $P1530
.annotate 'line', 544
    new $P1531, "Undef"
    .lex "$name", $P1531
.annotate 'line', 545
    new $P1532, "Undef"
    .lex "$past", $P1532
.annotate 'line', 541

        $P1533 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1533
.annotate 'line', 544
    find_lex $P1534, "$/"
    unless_null $P1534, vivify_497
    $P1534 = root_new ['parrot';'Hash']
  vivify_497:
    set $P1535, $P1534["deflongname"]
    unless_null $P1535, vivify_498
    new $P1535, "Undef"
  vivify_498:
    $P1536 = $P1535."ast"()
    set $S1537, $P1536
    new $P1538, 'String'
    set $P1538, $S1537
    store_lex "$name", $P1538
    find_lex $P1539, "$past"
.annotate 'line', 546
    find_lex $P1541, "$/"
    unless_null $P1541, vivify_499
    $P1541 = root_new ['parrot';'Hash']
  vivify_499:
    set $P1542, $P1541["proto"]
    unless_null $P1542, vivify_500
    new $P1542, "Undef"
  vivify_500:
    if $P1542, if_1540
.annotate 'line', 573
    find_lex $P1566, "$key"
    set $S1567, $P1566
    iseq $I1568, $S1567, "open"
    if $I1568, if_1565
.annotate 'line', 586
    .const 'Sub' $P1598 = "91_1275600017.58296" 
    capture_lex $P1598
    $P1598()
    goto if_1565_end
  if_1565:
.annotate 'line', 573
    .const 'Sub' $P1570 = "90_1275600017.58296" 
    capture_lex $P1570
    $P1570()
  if_1565_end:
    goto if_1540_end
  if_1540:
.annotate 'line', 548
    get_hll_global $P1543, ["PAST"], "Stmts"
.annotate 'line', 549
    get_hll_global $P1544, ["PAST"], "Block"
    find_lex $P1545, "$name"
.annotate 'line', 550
    get_hll_global $P1546, ["PAST"], "Op"
.annotate 'line', 551
    get_hll_global $P1547, ["PAST"], "Var"
    $P1548 = $P1547."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1549, "$name"
    $P1550 = $P1546."new"($P1548, $P1549, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 550
    find_lex $P1551, "$/"
    $P1552 = $P1544."new"($P1550, $P1545 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1551 :named("node"))
.annotate 'line', 560
    get_hll_global $P1553, ["PAST"], "Block"
    new $P1554, "String"
    assign $P1554, "!PREFIX__"
    find_lex $P1555, "$name"
    concat $P1556, $P1554, $P1555
.annotate 'line', 561
    get_hll_global $P1557, ["PAST"], "Op"
.annotate 'line', 562
    get_hll_global $P1558, ["PAST"], "Var"
    $P1559 = $P1558."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1560, "$name"
    $P1561 = $P1557."new"($P1559, $P1560, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 561
    find_lex $P1562, "$/"
    $P1563 = $P1553."new"($P1561, $P1556 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1562 :named("node"))
.annotate 'line', 560
    $P1564 = $P1543."new"($P1552, $P1563)
.annotate 'line', 548
    store_lex "$past", $P1564
  if_1540_end:
.annotate 'line', 600
    find_lex $P1619, "$/"
    find_lex $P1620, "$past"
    $P1621 = $P1619."!make"($P1620)
.annotate 'line', 540
    .return ($P1621)
  control_1525:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1622, exception, "payload"
    .return ($P1622)
.end


.namespace ["NQP";"Actions"]
.sub "_block1597"  :anon :subid("91_1275600017.58296") :outer("89_1275600017.58296")
.annotate 'line', 587
    new $P1599, "Undef"
    .lex "$regex", $P1599
.annotate 'line', 588
    get_hll_global $P1600, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1601, "$/"
    unless_null $P1601, vivify_501
    $P1601 = root_new ['parrot';'Hash']
  vivify_501:
    set $P1602, $P1601["p6regex"]
    unless_null $P1602, vivify_502
    new $P1602, "Undef"
  vivify_502:
    $P1603 = $P1602."ast"()
    get_global $P1604, "@BLOCK"
    $P1605 = $P1604."shift"()
    $P1606 = $P1600($P1603, $P1605)
    store_lex "$regex", $P1606
.annotate 'line', 589
    find_lex $P1607, "$regex"
    find_lex $P1608, "$name"
    $P1607."name"($P1608)
.annotate 'line', 591
    get_hll_global $P1609, ["PAST"], "Op"
.annotate 'line', 593
    get_hll_global $P1610, ["PAST"], "Var"
    new $P1611, "ResizablePMCArray"
    push $P1611, "Regex"
    $P1612 = $P1610."new"("Method" :named("name"), $P1611 :named("namespace"), "package" :named("scope"))
    find_lex $P1613, "$regex"
    $P1614 = $P1609."new"($P1612, $P1613, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate 'line', 591
    store_lex "$past", $P1614
.annotate 'line', 597
    find_lex $P1615, "$regex"
    find_lex $P1616, "$past"
    unless_null $P1616, vivify_503
    $P1616 = root_new ['parrot';'Hash']
    store_lex "$past", $P1616
  vivify_503:
    set $P1616["sink"], $P1615
.annotate 'line', 598
    find_lex $P1617, "@MODIFIERS"
    $P1618 = $P1617."shift"()
.annotate 'line', 586
    .return ($P1618)
.end


.namespace ["NQP";"Actions"]
.sub "_block1569"  :anon :subid("90_1275600017.58296") :outer("89_1275600017.58296")
.annotate 'line', 574
    $P1571 = root_new ['parrot';'Hash']
    .lex "%h", $P1571
.annotate 'line', 573
    find_lex $P1572, "%h"
.annotate 'line', 575
    find_lex $P1574, "$/"
    unless_null $P1574, vivify_504
    $P1574 = root_new ['parrot';'Hash']
  vivify_504:
    set $P1575, $P1574["sym"]
    unless_null $P1575, vivify_505
    new $P1575, "Undef"
  vivify_505:
    set $S1576, $P1575
    iseq $I1577, $S1576, "token"
    unless $I1577, if_1573_end
    new $P1578, "Integer"
    assign $P1578, 1
    find_lex $P1579, "%h"
    unless_null $P1579, vivify_506
    $P1579 = root_new ['parrot';'Hash']
    store_lex "%h", $P1579
  vivify_506:
    set $P1579["r"], $P1578
  if_1573_end:
.annotate 'line', 576
    find_lex $P1581, "$/"
    unless_null $P1581, vivify_507
    $P1581 = root_new ['parrot';'Hash']
  vivify_507:
    set $P1582, $P1581["sym"]
    unless_null $P1582, vivify_508
    new $P1582, "Undef"
  vivify_508:
    set $S1583, $P1582
    iseq $I1584, $S1583, "rule"
    unless $I1584, if_1580_end
    new $P1585, "Integer"
    assign $P1585, 1
    find_lex $P1586, "%h"
    unless_null $P1586, vivify_509
    $P1586 = root_new ['parrot';'Hash']
    store_lex "%h", $P1586
  vivify_509:
    set $P1586["r"], $P1585
    new $P1587, "Integer"
    assign $P1587, 1
    find_lex $P1588, "%h"
    unless_null $P1588, vivify_510
    $P1588 = root_new ['parrot';'Hash']
    store_lex "%h", $P1588
  vivify_510:
    set $P1588["s"], $P1587
  if_1580_end:
.annotate 'line', 577
    find_lex $P1589, "@MODIFIERS"
    find_lex $P1590, "%h"
    $P1589."unshift"($P1590)
.annotate 'line', 578

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate 'line', 582
    get_global $P1591, "@BLOCK"
    unless_null $P1591, vivify_511
    $P1591 = root_new ['parrot';'ResizablePMCArray']
  vivify_511:
    set $P1592, $P1591[0]
    unless_null $P1592, vivify_512
    new $P1592, "Undef"
  vivify_512:
    $P1592."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate 'line', 583
    get_global $P1593, "@BLOCK"
    unless_null $P1593, vivify_513
    $P1593 = root_new ['parrot';'ResizablePMCArray']
  vivify_513:
    set $P1594, $P1593[0]
    unless_null $P1594, vivify_514
    new $P1594, "Undef"
  vivify_514:
    $P1594."symbol"("$/", "lexical" :named("scope"))
.annotate 'line', 584
    new $P1595, "Exception"
    set $P1595['type'], 57
    new $P1596, "Integer"
    assign $P1596, 0
    setattribute $P1595, 'payload', $P1596
    throw $P1595
.annotate 'line', 573
    .return ()
.end


.namespace ["NQP";"Actions"]
.sub "dotty"  :subid("92_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1626
.annotate 'line', 604
    new $P1625, 'ExceptionHandler'
    set_addr $P1625, control_1624
    $P1625."handle_types"(57)
    push_eh $P1625
    .lex "self", self
    .lex "$/", param_1626
.annotate 'line', 605
    new $P1627, "Undef"
    .lex "$past", $P1627
    find_lex $P1630, "$/"
    unless_null $P1630, vivify_515
    $P1630 = root_new ['parrot';'Hash']
  vivify_515:
    set $P1631, $P1630["args"]
    unless_null $P1631, vivify_516
    new $P1631, "Undef"
  vivify_516:
    if $P1631, if_1629
    get_hll_global $P1636, ["PAST"], "Op"
    find_lex $P1637, "$/"
    $P1638 = $P1636."new"($P1637 :named("node"))
    set $P1628, $P1638
    goto if_1629_end
  if_1629:
    find_lex $P1632, "$/"
    unless_null $P1632, vivify_517
    $P1632 = root_new ['parrot';'Hash']
  vivify_517:
    set $P1633, $P1632["args"]
    unless_null $P1633, vivify_518
    $P1633 = root_new ['parrot';'ResizablePMCArray']
  vivify_518:
    set $P1634, $P1633[0]
    unless_null $P1634, vivify_519
    new $P1634, "Undef"
  vivify_519:
    $P1635 = $P1634."ast"()
    set $P1628, $P1635
  if_1629_end:
    store_lex "$past", $P1628
.annotate 'line', 606
    find_lex $P1639, "$past"
    find_lex $P1642, "$/"
    unless_null $P1642, vivify_520
    $P1642 = root_new ['parrot';'Hash']
  vivify_520:
    set $P1643, $P1642["quote"]
    unless_null $P1643, vivify_521
    new $P1643, "Undef"
  vivify_521:
    if $P1643, if_1641
    find_lex $P1647, "$/"
    unless_null $P1647, vivify_522
    $P1647 = root_new ['parrot';'Hash']
  vivify_522:
    set $P1648, $P1647["longname"]
    unless_null $P1648, vivify_523
    new $P1648, "Undef"
  vivify_523:
    set $S1649, $P1648
    new $P1640, 'String'
    set $P1640, $S1649
    goto if_1641_end
  if_1641:
    find_lex $P1644, "$/"
    unless_null $P1644, vivify_524
    $P1644 = root_new ['parrot';'Hash']
  vivify_524:
    set $P1645, $P1644["quote"]
    unless_null $P1645, vivify_525
    new $P1645, "Undef"
  vivify_525:
    $P1646 = $P1645."ast"()
    set $P1640, $P1646
  if_1641_end:
    $P1639."name"($P1640)
.annotate 'line', 607
    find_lex $P1650, "$past"
    $P1650."pasttype"("callmethod")
.annotate 'line', 608
    find_lex $P1651, "$/"
    find_lex $P1652, "$past"
    $P1653 = $P1651."!make"($P1652)
.annotate 'line', 604
    .return ($P1653)
  control_1624:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1654, exception, "payload"
    .return ($P1654)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<self>"  :subid("93_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1658
.annotate 'line', 613
    new $P1657, 'ExceptionHandler'
    set_addr $P1657, control_1656
    $P1657."handle_types"(57)
    push_eh $P1657
    .lex "self", self
    .lex "$/", param_1658
.annotate 'line', 614
    find_lex $P1659, "$/"
    get_hll_global $P1660, ["PAST"], "Var"
    $P1661 = $P1660."new"("self" :named("name"))
    $P1662 = $P1659."!make"($P1661)
.annotate 'line', 613
    .return ($P1662)
  control_1656:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1663, exception, "payload"
    .return ($P1663)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<identifier>"  :subid("94_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1667
.annotate 'line', 617
    new $P1666, 'ExceptionHandler'
    set_addr $P1666, control_1665
    $P1666."handle_types"(57)
    push_eh $P1666
    .lex "self", self
    .lex "$/", param_1667
.annotate 'line', 618
    new $P1668, "Undef"
    .lex "$past", $P1668
    find_lex $P1669, "$/"
    unless_null $P1669, vivify_526
    $P1669 = root_new ['parrot';'Hash']
  vivify_526:
    set $P1670, $P1669["args"]
    unless_null $P1670, vivify_527
    new $P1670, "Undef"
  vivify_527:
    $P1671 = $P1670."ast"()
    store_lex "$past", $P1671
.annotate 'line', 619
    find_lex $P1672, "$past"
    find_lex $P1673, "$/"
    unless_null $P1673, vivify_528
    $P1673 = root_new ['parrot';'Hash']
  vivify_528:
    set $P1674, $P1673["identifier"]
    unless_null $P1674, vivify_529
    new $P1674, "Undef"
  vivify_529:
    set $S1675, $P1674
    $P1672."name"($S1675)
.annotate 'line', 620
    find_lex $P1676, "$/"
    find_lex $P1677, "$past"
    $P1678 = $P1676."!make"($P1677)
.annotate 'line', 617
    .return ($P1678)
  control_1665:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1679, exception, "payload"
    .return ($P1679)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<name>"  :subid("95_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1683
.annotate 'line', 623
    new $P1682, 'ExceptionHandler'
    set_addr $P1682, control_1681
    $P1682."handle_types"(57)
    push_eh $P1682
    .lex "self", self
    .lex "$/", param_1683
.annotate 'line', 624
    $P1684 = root_new ['parrot';'ResizablePMCArray']
    .lex "@ns", $P1684
.annotate 'line', 625
    new $P1685, "Undef"
    .lex "$name", $P1685
.annotate 'line', 627
    new $P1686, "Undef"
    .lex "$var", $P1686
.annotate 'line', 629
    new $P1687, "Undef"
    .lex "$past", $P1687
.annotate 'line', 624
    find_lex $P1688, "$/"
    unless_null $P1688, vivify_530
    $P1688 = root_new ['parrot';'Hash']
  vivify_530:
    set $P1689, $P1688["name"]
    unless_null $P1689, vivify_531
    $P1689 = root_new ['parrot';'Hash']
  vivify_531:
    set $P1690, $P1689["identifier"]
    unless_null $P1690, vivify_532
    new $P1690, "Undef"
  vivify_532:
    clone $P1691, $P1690
    store_lex "@ns", $P1691
.annotate 'line', 625
    find_lex $P1692, "@ns"
    $P1693 = $P1692."pop"()
    store_lex "$name", $P1693
.annotate 'line', 626
    find_lex $P1697, "@ns"
    if $P1697, if_1696
    set $P1695, $P1697
    goto if_1696_end
  if_1696:
    find_lex $P1698, "@ns"
    unless_null $P1698, vivify_533
    $P1698 = root_new ['parrot';'ResizablePMCArray']
  vivify_533:
    set $P1699, $P1698[0]
    unless_null $P1699, vivify_534
    new $P1699, "Undef"
  vivify_534:
    set $S1700, $P1699
    iseq $I1701, $S1700, "GLOBAL"
    new $P1695, 'Integer'
    set $P1695, $I1701
  if_1696_end:
    unless $P1695, if_1694_end
    find_lex $P1702, "@ns"
    $P1702."shift"()
  if_1694_end:
.annotate 'line', 628
    get_hll_global $P1703, ["PAST"], "Var"
    find_lex $P1704, "$name"
    set $S1705, $P1704
    find_lex $P1706, "@ns"
    $P1707 = $P1703."new"($S1705 :named("name"), $P1706 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1707
.annotate 'line', 629
    find_lex $P1708, "$var"
    store_lex "$past", $P1708
.annotate 'line', 630
    find_lex $P1710, "$/"
    unless_null $P1710, vivify_535
    $P1710 = root_new ['parrot';'Hash']
  vivify_535:
    set $P1711, $P1710["args"]
    unless_null $P1711, vivify_536
    new $P1711, "Undef"
  vivify_536:
    unless $P1711, if_1709_end
.annotate 'line', 631
    find_lex $P1712, "$/"
    unless_null $P1712, vivify_537
    $P1712 = root_new ['parrot';'Hash']
  vivify_537:
    set $P1713, $P1712["args"]
    unless_null $P1713, vivify_538
    $P1713 = root_new ['parrot';'ResizablePMCArray']
  vivify_538:
    set $P1714, $P1713[0]
    unless_null $P1714, vivify_539
    new $P1714, "Undef"
  vivify_539:
    $P1715 = $P1714."ast"()
    store_lex "$past", $P1715
.annotate 'line', 632
    find_lex $P1716, "$past"
    find_lex $P1717, "$var"
    $P1716."unshift"($P1717)
  if_1709_end:
.annotate 'line', 634
    find_lex $P1718, "$/"
    find_lex $P1719, "$past"
    $P1720 = $P1718."!make"($P1719)
.annotate 'line', 623
    .return ($P1720)
  control_1681:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1721, exception, "payload"
    .return ($P1721)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<pir::op>"  :subid("96_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1725
.annotate 'line', 637
    new $P1724, 'ExceptionHandler'
    set_addr $P1724, control_1723
    $P1724."handle_types"(57)
    push_eh $P1724
    .lex "self", self
    .lex "$/", param_1725
.annotate 'line', 638
    new $P1726, "Undef"
    .lex "$past", $P1726
.annotate 'line', 639
    new $P1727, "Undef"
    .lex "$pirop", $P1727
.annotate 'line', 638
    find_lex $P1730, "$/"
    unless_null $P1730, vivify_540
    $P1730 = root_new ['parrot';'Hash']
  vivify_540:
    set $P1731, $P1730["args"]
    unless_null $P1731, vivify_541
    new $P1731, "Undef"
  vivify_541:
    if $P1731, if_1729
    get_hll_global $P1736, ["PAST"], "Op"
    find_lex $P1737, "$/"
    $P1738 = $P1736."new"($P1737 :named("node"))
    set $P1728, $P1738
    goto if_1729_end
  if_1729:
    find_lex $P1732, "$/"
    unless_null $P1732, vivify_542
    $P1732 = root_new ['parrot';'Hash']
  vivify_542:
    set $P1733, $P1732["args"]
    unless_null $P1733, vivify_543
    $P1733 = root_new ['parrot';'ResizablePMCArray']
  vivify_543:
    set $P1734, $P1733[0]
    unless_null $P1734, vivify_544
    new $P1734, "Undef"
  vivify_544:
    $P1735 = $P1734."ast"()
    set $P1728, $P1735
  if_1729_end:
    store_lex "$past", $P1728
.annotate 'line', 639
    find_lex $P1739, "$/"
    unless_null $P1739, vivify_545
    $P1739 = root_new ['parrot';'Hash']
  vivify_545:
    set $P1740, $P1739["op"]
    unless_null $P1740, vivify_546
    new $P1740, "Undef"
  vivify_546:
    set $S1741, $P1740
    new $P1742, 'String'
    set $P1742, $S1741
    store_lex "$pirop", $P1742
.annotate 'line', 640

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1743 = box $S0
    
    store_lex "$pirop", $P1743
.annotate 'line', 647
    find_lex $P1744, "$past"
    find_lex $P1745, "$pirop"
    $P1744."pirop"($P1745)
.annotate 'line', 648
    find_lex $P1746, "$past"
    $P1746."pasttype"("pirop")
.annotate 'line', 649
    find_lex $P1747, "$/"
    find_lex $P1748, "$past"
    $P1749 = $P1747."!make"($P1748)
.annotate 'line', 637
    .return ($P1749)
  control_1723:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1750, exception, "payload"
    .return ($P1750)
.end


.namespace ["NQP";"Actions"]
.sub "args"  :subid("97_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1754
.annotate 'line', 652
    new $P1753, 'ExceptionHandler'
    set_addr $P1753, control_1752
    $P1753."handle_types"(57)
    push_eh $P1753
    .lex "self", self
    .lex "$/", param_1754
    find_lex $P1755, "$/"
    find_lex $P1756, "$/"
    unless_null $P1756, vivify_547
    $P1756 = root_new ['parrot';'Hash']
  vivify_547:
    set $P1757, $P1756["arglist"]
    unless_null $P1757, vivify_548
    new $P1757, "Undef"
  vivify_548:
    $P1758 = $P1757."ast"()
    $P1759 = $P1755."!make"($P1758)
    .return ($P1759)
  control_1752:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1760, exception, "payload"
    .return ($P1760)
.end


.namespace ["NQP";"Actions"]
.sub "arglist"  :subid("98_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1764
.annotate 'line', 654
    .const 'Sub' $P1775 = "99_1275600017.58296" 
    capture_lex $P1775
    new $P1763, 'ExceptionHandler'
    set_addr $P1763, control_1762
    $P1763."handle_types"(57)
    push_eh $P1763
    .lex "self", self
    .lex "$/", param_1764
.annotate 'line', 655
    new $P1765, "Undef"
    .lex "$past", $P1765
.annotate 'line', 663
    new $P1766, "Undef"
    .lex "$i", $P1766
.annotate 'line', 664
    new $P1767, "Undef"
    .lex "$n", $P1767
.annotate 'line', 655
    get_hll_global $P1768, ["PAST"], "Op"
    find_lex $P1769, "$/"
    $P1770 = $P1768."new"("call" :named("pasttype"), $P1769 :named("node"))
    store_lex "$past", $P1770
.annotate 'line', 656
    find_lex $P1772, "$/"
    unless_null $P1772, vivify_549
    $P1772 = root_new ['parrot';'Hash']
  vivify_549:
    set $P1773, $P1772["EXPR"]
    unless_null $P1773, vivify_550
    new $P1773, "Undef"
  vivify_550:
    unless $P1773, if_1771_end
    .const 'Sub' $P1775 = "99_1275600017.58296" 
    capture_lex $P1775
    $P1775()
  if_1771_end:
.annotate 'line', 663
    new $P1807, "Integer"
    assign $P1807, 0
    store_lex "$i", $P1807
.annotate 'line', 664
    find_lex $P1808, "$past"
    $P1809 = $P1808."list"()
    set $N1810, $P1809
    new $P1811, 'Float'
    set $P1811, $N1810
    store_lex "$n", $P1811
.annotate 'line', 665
    new $P1859, 'ExceptionHandler'
    set_addr $P1859, loop1858_handler
    $P1859."handle_types"(64, 66, 65)
    push_eh $P1859
  loop1858_test:
    find_lex $P1812, "$i"
    set $N1813, $P1812
    find_lex $P1814, "$n"
    set $N1815, $P1814
    islt $I1816, $N1813, $N1815
    unless $I1816, loop1858_done
  loop1858_redo:
.annotate 'line', 666
    find_lex $P1818, "$i"
    set $I1819, $P1818
    find_lex $P1820, "$past"
    unless_null $P1820, vivify_554
    $P1820 = root_new ['parrot';'ResizablePMCArray']
  vivify_554:
    set $P1821, $P1820[$I1819]
    unless_null $P1821, vivify_555
    new $P1821, "Undef"
  vivify_555:
    $S1822 = $P1821."name"()
    iseq $I1823, $S1822, "&prefix:<|>"
    unless $I1823, if_1817_end
.annotate 'line', 667
    find_lex $P1824, "$i"
    set $I1825, $P1824
    find_lex $P1826, "$past"
    unless_null $P1826, vivify_556
    $P1826 = root_new ['parrot';'ResizablePMCArray']
  vivify_556:
    set $P1827, $P1826[$I1825]
    unless_null $P1827, vivify_557
    $P1827 = root_new ['parrot';'ResizablePMCArray']
  vivify_557:
    set $P1828, $P1827[0]
    unless_null $P1828, vivify_558
    new $P1828, "Undef"
  vivify_558:
    find_lex $P1829, "$i"
    set $I1830, $P1829
    find_lex $P1831, "$past"
    unless_null $P1831, vivify_559
    $P1831 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$past", $P1831
  vivify_559:
    set $P1831[$I1830], $P1828
.annotate 'line', 668
    find_lex $P1832, "$i"
    set $I1833, $P1832
    find_lex $P1834, "$past"
    unless_null $P1834, vivify_560
    $P1834 = root_new ['parrot';'ResizablePMCArray']
  vivify_560:
    set $P1835, $P1834[$I1833]
    unless_null $P1835, vivify_561
    new $P1835, "Undef"
  vivify_561:
    $P1835."flat"(1)
.annotate 'line', 669
    find_lex $P1839, "$i"
    set $I1840, $P1839
    find_lex $P1841, "$past"
    unless_null $P1841, vivify_562
    $P1841 = root_new ['parrot';'ResizablePMCArray']
  vivify_562:
    set $P1842, $P1841[$I1840]
    unless_null $P1842, vivify_563
    new $P1842, "Undef"
  vivify_563:
    get_hll_global $P1843, ["PAST"], "Val"
    $P1844 = $P1842."isa"($P1843)
    if $P1844, if_1838
    set $P1837, $P1844
    goto if_1838_end
  if_1838:
.annotate 'line', 670
    find_lex $P1845, "$i"
    set $I1846, $P1845
    find_lex $P1847, "$past"
    unless_null $P1847, vivify_564
    $P1847 = root_new ['parrot';'ResizablePMCArray']
  vivify_564:
    set $P1848, $P1847[$I1846]
    unless_null $P1848, vivify_565
    new $P1848, "Undef"
  vivify_565:
    $S1849 = $P1848."name"()
    substr $S1850, $S1849, 0, 1
    iseq $I1851, $S1850, "%"
    new $P1837, 'Integer'
    set $P1837, $I1851
  if_1838_end:
    unless $P1837, if_1836_end
.annotate 'line', 671
    find_lex $P1852, "$i"
    set $I1853, $P1852
    find_lex $P1854, "$past"
    unless_null $P1854, vivify_566
    $P1854 = root_new ['parrot';'ResizablePMCArray']
  vivify_566:
    set $P1855, $P1854[$I1853]
    unless_null $P1855, vivify_567
    new $P1855, "Undef"
  vivify_567:
    $P1855."named"(1)
  if_1836_end:
  if_1817_end:
.annotate 'line', 666
    find_lex $P1856, "$i"
    clone $P1857, $P1856
    inc $P1856
  loop1858_next:
.annotate 'line', 665
    goto loop1858_test
  loop1858_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1860, exception, 'type'
    eq $P1860, 64, loop1858_next
    eq $P1860, 66, loop1858_redo
  loop1858_done:
    pop_eh 
.annotate 'line', 676
    find_lex $P1861, "$/"
    find_lex $P1862, "$past"
    $P1863 = $P1861."!make"($P1862)
.annotate 'line', 654
    .return ($P1863)
  control_1762:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1864, exception, "payload"
    .return ($P1864)
.end


.namespace ["NQP";"Actions"]
.sub "_block1774"  :anon :subid("99_1275600017.58296") :outer("98_1275600017.58296")
.annotate 'line', 656
    .const 'Sub' $P1796 = "100_1275600017.58296" 
    capture_lex $P1796
.annotate 'line', 657
    new $P1776, "Undef"
    .lex "$expr", $P1776
    find_lex $P1777, "$/"
    unless_null $P1777, vivify_551
    $P1777 = root_new ['parrot';'Hash']
  vivify_551:
    set $P1778, $P1777["EXPR"]
    unless_null $P1778, vivify_552
    new $P1778, "Undef"
  vivify_552:
    $P1779 = $P1778."ast"()
    store_lex "$expr", $P1779
.annotate 'line', 658
    find_lex $P1784, "$expr"
    $S1785 = $P1784."name"()
    iseq $I1786, $S1785, "&infix:<,>"
    if $I1786, if_1783
    new $P1782, 'Integer'
    set $P1782, $I1786
    goto if_1783_end
  if_1783:
    find_lex $P1787, "$expr"
    $P1788 = $P1787."named"()
    isfalse $I1789, $P1788
    new $P1782, 'Integer'
    set $P1782, $I1789
  if_1783_end:
    if $P1782, if_1781
.annotate 'line', 661
    find_lex $P1804, "$past"
    find_lex $P1805, "$expr"
    $P1806 = $P1804."push"($P1805)
    set $P1780, $P1806
.annotate 'line', 658
    goto if_1781_end
  if_1781:
.annotate 'line', 659
    find_lex $P1791, "$expr"
    $P1792 = $P1791."list"()
    defined $I1793, $P1792
    unless $I1793, for_undef_553
    iter $P1790, $P1792
    new $P1802, 'ExceptionHandler'
    set_addr $P1802, loop1801_handler
    $P1802."handle_types"(64, 66, 65)
    push_eh $P1802
  loop1801_test:
    unless $P1790, loop1801_done
    shift $P1794, $P1790
  loop1801_redo:
    .const 'Sub' $P1796 = "100_1275600017.58296" 
    capture_lex $P1796
    $P1796($P1794)
  loop1801_next:
    goto loop1801_test
  loop1801_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1803, exception, 'type'
    eq $P1803, 64, loop1801_next
    eq $P1803, 66, loop1801_redo
  loop1801_done:
    pop_eh 
  for_undef_553:
.annotate 'line', 658
    set $P1780, $P1790
  if_1781_end:
.annotate 'line', 656
    .return ($P1780)
.end


.namespace ["NQP";"Actions"]
.sub "_block1795"  :anon :subid("100_1275600017.58296") :outer("99_1275600017.58296")
    .param pmc param_1797
.annotate 'line', 659
    .lex "$_", param_1797
    find_lex $P1798, "$past"
    find_lex $P1799, "$_"
    $P1800 = $P1798."push"($P1799)
    .return ($P1800)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<value>"  :subid("101_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1868
.annotate 'line', 680
    new $P1867, 'ExceptionHandler'
    set_addr $P1867, control_1866
    $P1867."handle_types"(57)
    push_eh $P1867
    .lex "self", self
    .lex "$/", param_1868
    find_lex $P1869, "$/"
    find_lex $P1870, "$/"
    unless_null $P1870, vivify_568
    $P1870 = root_new ['parrot';'Hash']
  vivify_568:
    set $P1871, $P1870["value"]
    unless_null $P1871, vivify_569
    new $P1871, "Undef"
  vivify_569:
    $P1872 = $P1871."ast"()
    $P1873 = $P1869."!make"($P1872)
    .return ($P1873)
  control_1866:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1874, exception, "payload"
    .return ($P1874)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<( )>"  :subid("102_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1878
.annotate 'line', 682
    new $P1877, 'ExceptionHandler'
    set_addr $P1877, control_1876
    $P1877."handle_types"(57)
    push_eh $P1877
    .lex "self", self
    .lex "$/", param_1878
.annotate 'line', 683
    find_lex $P1879, "$/"
.annotate 'line', 684
    find_lex $P1882, "$/"
    unless_null $P1882, vivify_570
    $P1882 = root_new ['parrot';'Hash']
  vivify_570:
    set $P1883, $P1882["EXPR"]
    unless_null $P1883, vivify_571
    new $P1883, "Undef"
  vivify_571:
    if $P1883, if_1881
.annotate 'line', 685
    get_hll_global $P1888, ["PAST"], "Op"
    find_lex $P1889, "$/"
    $P1890 = $P1888."new"("list" :named("pasttype"), $P1889 :named("node"))
    set $P1880, $P1890
.annotate 'line', 684
    goto if_1881_end
  if_1881:
    find_lex $P1884, "$/"
    unless_null $P1884, vivify_572
    $P1884 = root_new ['parrot';'Hash']
  vivify_572:
    set $P1885, $P1884["EXPR"]
    unless_null $P1885, vivify_573
    $P1885 = root_new ['parrot';'ResizablePMCArray']
  vivify_573:
    set $P1886, $P1885[0]
    unless_null $P1886, vivify_574
    new $P1886, "Undef"
  vivify_574:
    $P1887 = $P1886."ast"()
    set $P1880, $P1887
  if_1881_end:
    $P1891 = $P1879."!make"($P1880)
.annotate 'line', 682
    .return ($P1891)
  control_1876:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1892, exception, "payload"
    .return ($P1892)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<[ ]>"  :subid("103_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1896
.annotate 'line', 688
    new $P1895, 'ExceptionHandler'
    set_addr $P1895, control_1894
    $P1895."handle_types"(57)
    push_eh $P1895
    .lex "self", self
    .lex "$/", param_1896
.annotate 'line', 689
    new $P1897, "Undef"
    .lex "$past", $P1897
.annotate 'line', 688
    find_lex $P1898, "$past"
.annotate 'line', 690
    find_lex $P1900, "$/"
    unless_null $P1900, vivify_575
    $P1900 = root_new ['parrot';'Hash']
  vivify_575:
    set $P1901, $P1900["EXPR"]
    unless_null $P1901, vivify_576
    new $P1901, "Undef"
  vivify_576:
    if $P1901, if_1899
.annotate 'line', 697
    get_hll_global $P1913, ["PAST"], "Op"
    $P1914 = $P1913."new"("list" :named("pasttype"))
    store_lex "$past", $P1914
.annotate 'line', 696
    goto if_1899_end
  if_1899:
.annotate 'line', 691
    find_lex $P1902, "$/"
    unless_null $P1902, vivify_577
    $P1902 = root_new ['parrot';'Hash']
  vivify_577:
    set $P1903, $P1902["EXPR"]
    unless_null $P1903, vivify_578
    $P1903 = root_new ['parrot';'ResizablePMCArray']
  vivify_578:
    set $P1904, $P1903[0]
    unless_null $P1904, vivify_579
    new $P1904, "Undef"
  vivify_579:
    $P1905 = $P1904."ast"()
    store_lex "$past", $P1905
.annotate 'line', 692
    find_lex $P1907, "$past"
    $S1908 = $P1907."name"()
    isne $I1909, $S1908, "&infix:<,>"
    unless $I1909, if_1906_end
.annotate 'line', 693
    get_hll_global $P1910, ["PAST"], "Op"
    find_lex $P1911, "$past"
    $P1912 = $P1910."new"($P1911, "list" :named("pasttype"))
    store_lex "$past", $P1912
  if_1906_end:
  if_1899_end:
.annotate 'line', 699
    find_lex $P1915, "$past"
    $P1915."name"("&circumfix:<[ ]>")
.annotate 'line', 700
    find_lex $P1916, "$/"
    find_lex $P1917, "$past"
    $P1918 = $P1916."!make"($P1917)
.annotate 'line', 688
    .return ($P1918)
  control_1894:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1919, exception, "payload"
    .return ($P1919)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<ang>"  :subid("104_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1923
.annotate 'line', 703
    new $P1922, 'ExceptionHandler'
    set_addr $P1922, control_1921
    $P1922."handle_types"(57)
    push_eh $P1922
    .lex "self", self
    .lex "$/", param_1923
    find_lex $P1924, "$/"
    find_lex $P1925, "$/"
    unless_null $P1925, vivify_580
    $P1925 = root_new ['parrot';'Hash']
  vivify_580:
    set $P1926, $P1925["quote_EXPR"]
    unless_null $P1926, vivify_581
    new $P1926, "Undef"
  vivify_581:
    $P1927 = $P1926."ast"()
    $P1928 = $P1924."!make"($P1927)
    .return ($P1928)
  control_1921:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1929, exception, "payload"
    .return ($P1929)
.end


.namespace ["NQP";"Actions"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("105_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1933
.annotate 'line', 704
    new $P1932, 'ExceptionHandler'
    set_addr $P1932, control_1931
    $P1932."handle_types"(57)
    push_eh $P1932
    .lex "self", self
    .lex "$/", param_1933
    find_lex $P1934, "$/"
    find_lex $P1935, "$/"
    unless_null $P1935, vivify_582
    $P1935 = root_new ['parrot';'Hash']
  vivify_582:
    set $P1936, $P1935["quote_EXPR"]
    unless_null $P1936, vivify_583
    new $P1936, "Undef"
  vivify_583:
    $P1937 = $P1936."ast"()
    $P1938 = $P1934."!make"($P1937)
    .return ($P1938)
  control_1931:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1939, exception, "payload"
    .return ($P1939)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<{ }>"  :subid("106_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1943
.annotate 'line', 706
    new $P1942, 'ExceptionHandler'
    set_addr $P1942, control_1941
    $P1942."handle_types"(57)
    push_eh $P1942
    .lex "self", self
    .lex "$/", param_1943
.annotate 'line', 707
    new $P1944, "Undef"
    .lex "$past", $P1944
    find_lex $P1947, "$/"
    unless_null $P1947, vivify_584
    $P1947 = root_new ['parrot';'Hash']
  vivify_584:
    set $P1948, $P1947["pblock"]
    unless_null $P1948, vivify_585
    $P1948 = root_new ['parrot';'Hash']
  vivify_585:
    set $P1949, $P1948["blockoid"]
    unless_null $P1949, vivify_586
    $P1949 = root_new ['parrot';'Hash']
  vivify_586:
    set $P1950, $P1949["statementlist"]
    unless_null $P1950, vivify_587
    $P1950 = root_new ['parrot';'Hash']
  vivify_587:
    set $P1951, $P1950["statement"]
    unless_null $P1951, vivify_588
    new $P1951, "Undef"
  vivify_588:
    set $N1952, $P1951
    isgt $I1953, $N1952, 0.0
    if $I1953, if_1946
.annotate 'line', 709
    $P1957 = "vivitype"("%")
    set $P1945, $P1957
.annotate 'line', 707
    goto if_1946_end
  if_1946:
.annotate 'line', 708
    find_lex $P1954, "$/"
    unless_null $P1954, vivify_589
    $P1954 = root_new ['parrot';'Hash']
  vivify_589:
    set $P1955, $P1954["pblock"]
    unless_null $P1955, vivify_590
    new $P1955, "Undef"
  vivify_590:
    $P1956 = $P1955."ast"()
    set $P1945, $P1956
  if_1946_end:
    store_lex "$past", $P1945
.annotate 'line', 710
    new $P1958, "Integer"
    assign $P1958, 1
    find_lex $P1959, "$past"
    unless_null $P1959, vivify_591
    $P1959 = root_new ['parrot';'Hash']
    store_lex "$past", $P1959
  vivify_591:
    set $P1959["bareblock"], $P1958
.annotate 'line', 711
    find_lex $P1960, "$/"
    find_lex $P1961, "$past"
    $P1962 = $P1960."!make"($P1961)
.annotate 'line', 706
    .return ($P1962)
  control_1941:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1963, exception, "payload"
    .return ($P1963)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<sigil>"  :subid("107_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1967
.annotate 'line', 714
    new $P1966, 'ExceptionHandler'
    set_addr $P1966, control_1965
    $P1966."handle_types"(57)
    push_eh $P1966
    .lex "self", self
    .lex "$/", param_1967
.annotate 'line', 715
    new $P1968, "Undef"
    .lex "$name", $P1968
    find_lex $P1971, "$/"
    unless_null $P1971, vivify_592
    $P1971 = root_new ['parrot';'Hash']
  vivify_592:
    set $P1972, $P1971["sigil"]
    unless_null $P1972, vivify_593
    new $P1972, "Undef"
  vivify_593:
    set $S1973, $P1972
    iseq $I1974, $S1973, "@"
    if $I1974, if_1970
.annotate 'line', 716
    find_lex $P1978, "$/"
    unless_null $P1978, vivify_594
    $P1978 = root_new ['parrot';'Hash']
  vivify_594:
    set $P1979, $P1978["sigil"]
    unless_null $P1979, vivify_595
    new $P1979, "Undef"
  vivify_595:
    set $S1980, $P1979
    iseq $I1981, $S1980, "%"
    if $I1981, if_1977
    new $P1983, "String"
    assign $P1983, "item"
    set $P1976, $P1983
    goto if_1977_end
  if_1977:
    new $P1982, "String"
    assign $P1982, "hash"
    set $P1976, $P1982
  if_1977_end:
    set $P1969, $P1976
.annotate 'line', 715
    goto if_1970_end
  if_1970:
    new $P1975, "String"
    assign $P1975, "list"
    set $P1969, $P1975
  if_1970_end:
    store_lex "$name", $P1969
.annotate 'line', 718
    find_lex $P1984, "$/"
    get_hll_global $P1985, ["PAST"], "Op"
    find_lex $P1986, "$name"
    find_lex $P1987, "$/"
    unless_null $P1987, vivify_596
    $P1987 = root_new ['parrot';'Hash']
  vivify_596:
    set $P1988, $P1987["semilist"]
    unless_null $P1988, vivify_597
    new $P1988, "Undef"
  vivify_597:
    $P1989 = $P1988."ast"()
    $P1990 = $P1985."new"($P1989, "callmethod" :named("pasttype"), $P1986 :named("name"))
    $P1991 = $P1984."!make"($P1990)
.annotate 'line', 714
    .return ($P1991)
  control_1965:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1992, exception, "payload"
    .return ($P1992)
.end


.namespace ["NQP";"Actions"]
.sub "semilist"  :subid("108_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_1996
.annotate 'line', 721
    new $P1995, 'ExceptionHandler'
    set_addr $P1995, control_1994
    $P1995."handle_types"(57)
    push_eh $P1995
    .lex "self", self
    .lex "$/", param_1996
    find_lex $P1997, "$/"
    find_lex $P1998, "$/"
    unless_null $P1998, vivify_598
    $P1998 = root_new ['parrot';'Hash']
  vivify_598:
    set $P1999, $P1998["statement"]
    unless_null $P1999, vivify_599
    new $P1999, "Undef"
  vivify_599:
    $P2000 = $P1999."ast"()
    $P2001 = $P1997."!make"($P2000)
    .return ($P2001)
  control_1994:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2002, exception, "payload"
    .return ($P2002)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<[ ]>"  :subid("109_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2006
.annotate 'line', 723
    new $P2005, 'ExceptionHandler'
    set_addr $P2005, control_2004
    $P2005."handle_types"(57)
    push_eh $P2005
    .lex "self", self
    .lex "$/", param_2006
.annotate 'line', 724
    find_lex $P2007, "$/"
    get_hll_global $P2008, ["PAST"], "Var"
    find_lex $P2009, "$/"
    unless_null $P2009, vivify_600
    $P2009 = root_new ['parrot';'Hash']
  vivify_600:
    set $P2010, $P2009["EXPR"]
    unless_null $P2010, vivify_601
    new $P2010, "Undef"
  vivify_601:
    $P2011 = $P2010."ast"()
.annotate 'line', 726
    $P2012 = "vivitype"("@")
    $P2013 = $P2008."new"($P2011, "keyed_int" :named("scope"), "Undef" :named("viviself"), $P2012 :named("vivibase"))
.annotate 'line', 724
    $P2014 = $P2007."!make"($P2013)
.annotate 'line', 723
    .return ($P2014)
  control_2004:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2015, exception, "payload"
    .return ($P2015)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<{ }>"  :subid("110_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2019
.annotate 'line', 729
    new $P2018, 'ExceptionHandler'
    set_addr $P2018, control_2017
    $P2018."handle_types"(57)
    push_eh $P2018
    .lex "self", self
    .lex "$/", param_2019
.annotate 'line', 730
    find_lex $P2020, "$/"
    get_hll_global $P2021, ["PAST"], "Var"
    find_lex $P2022, "$/"
    unless_null $P2022, vivify_602
    $P2022 = root_new ['parrot';'Hash']
  vivify_602:
    set $P2023, $P2022["EXPR"]
    unless_null $P2023, vivify_603
    new $P2023, "Undef"
  vivify_603:
    $P2024 = $P2023."ast"()
.annotate 'line', 732
    $P2025 = "vivitype"("%")
    $P2026 = $P2021."new"($P2024, "keyed" :named("scope"), "Undef" :named("viviself"), $P2025 :named("vivibase"))
.annotate 'line', 730
    $P2027 = $P2020."!make"($P2026)
.annotate 'line', 729
    .return ($P2027)
  control_2017:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2028, exception, "payload"
    .return ($P2028)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<ang>"  :subid("111_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2032
.annotate 'line', 735
    new $P2031, 'ExceptionHandler'
    set_addr $P2031, control_2030
    $P2031."handle_types"(57)
    push_eh $P2031
    .lex "self", self
    .lex "$/", param_2032
.annotate 'line', 736
    find_lex $P2033, "$/"
    get_hll_global $P2034, ["PAST"], "Var"
    find_lex $P2035, "$/"
    unless_null $P2035, vivify_604
    $P2035 = root_new ['parrot';'Hash']
  vivify_604:
    set $P2036, $P2035["quote_EXPR"]
    unless_null $P2036, vivify_605
    new $P2036, "Undef"
  vivify_605:
    $P2037 = $P2036."ast"()
.annotate 'line', 738
    $P2038 = "vivitype"("%")
    $P2039 = $P2034."new"($P2037, "keyed" :named("scope"), "Undef" :named("viviself"), $P2038 :named("vivibase"))
.annotate 'line', 736
    $P2040 = $P2033."!make"($P2039)
.annotate 'line', 735
    .return ($P2040)
  control_2030:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2041, exception, "payload"
    .return ($P2041)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<( )>"  :subid("112_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2045
.annotate 'line', 741
    new $P2044, 'ExceptionHandler'
    set_addr $P2044, control_2043
    $P2044."handle_types"(57)
    push_eh $P2044
    .lex "self", self
    .lex "$/", param_2045
.annotate 'line', 742
    find_lex $P2046, "$/"
    find_lex $P2047, "$/"
    unless_null $P2047, vivify_606
    $P2047 = root_new ['parrot';'Hash']
  vivify_606:
    set $P2048, $P2047["arglist"]
    unless_null $P2048, vivify_607
    new $P2048, "Undef"
  vivify_607:
    $P2049 = $P2048."ast"()
    $P2050 = $P2046."!make"($P2049)
.annotate 'line', 741
    .return ($P2050)
  control_2043:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2051, exception, "payload"
    .return ($P2051)
.end


.namespace ["NQP";"Actions"]
.sub "value"  :subid("113_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2055
.annotate 'line', 745
    new $P2054, 'ExceptionHandler'
    set_addr $P2054, control_2053
    $P2054."handle_types"(57)
    push_eh $P2054
    .lex "self", self
    .lex "$/", param_2055
.annotate 'line', 746
    find_lex $P2056, "$/"
    find_lex $P2059, "$/"
    unless_null $P2059, vivify_608
    $P2059 = root_new ['parrot';'Hash']
  vivify_608:
    set $P2060, $P2059["quote"]
    unless_null $P2060, vivify_609
    new $P2060, "Undef"
  vivify_609:
    if $P2060, if_2058
    find_lex $P2064, "$/"
    unless_null $P2064, vivify_610
    $P2064 = root_new ['parrot';'Hash']
  vivify_610:
    set $P2065, $P2064["number"]
    unless_null $P2065, vivify_611
    new $P2065, "Undef"
  vivify_611:
    $P2066 = $P2065."ast"()
    set $P2057, $P2066
    goto if_2058_end
  if_2058:
    find_lex $P2061, "$/"
    unless_null $P2061, vivify_612
    $P2061 = root_new ['parrot';'Hash']
  vivify_612:
    set $P2062, $P2061["quote"]
    unless_null $P2062, vivify_613
    new $P2062, "Undef"
  vivify_613:
    $P2063 = $P2062."ast"()
    set $P2057, $P2063
  if_2058_end:
    $P2067 = $P2056."!make"($P2057)
.annotate 'line', 745
    .return ($P2067)
  control_2053:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2068, exception, "payload"
    .return ($P2068)
.end


.namespace ["NQP";"Actions"]
.sub "number"  :subid("114_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2072
.annotate 'line', 749
    new $P2071, 'ExceptionHandler'
    set_addr $P2071, control_2070
    $P2071."handle_types"(57)
    push_eh $P2071
    .lex "self", self
    .lex "$/", param_2072
.annotate 'line', 750
    new $P2073, "Undef"
    .lex "$value", $P2073
    find_lex $P2076, "$/"
    unless_null $P2076, vivify_614
    $P2076 = root_new ['parrot';'Hash']
  vivify_614:
    set $P2077, $P2076["dec_number"]
    unless_null $P2077, vivify_615
    new $P2077, "Undef"
  vivify_615:
    if $P2077, if_2075
    find_lex $P2081, "$/"
    unless_null $P2081, vivify_616
    $P2081 = root_new ['parrot';'Hash']
  vivify_616:
    set $P2082, $P2081["integer"]
    unless_null $P2082, vivify_617
    new $P2082, "Undef"
  vivify_617:
    $P2083 = $P2082."ast"()
    set $P2074, $P2083
    goto if_2075_end
  if_2075:
    find_lex $P2078, "$/"
    unless_null $P2078, vivify_618
    $P2078 = root_new ['parrot';'Hash']
  vivify_618:
    set $P2079, $P2078["dec_number"]
    unless_null $P2079, vivify_619
    new $P2079, "Undef"
  vivify_619:
    $P2080 = $P2079."ast"()
    set $P2074, $P2080
  if_2075_end:
    store_lex "$value", $P2074
.annotate 'line', 751
    find_lex $P2085, "$/"
    unless_null $P2085, vivify_620
    $P2085 = root_new ['parrot';'Hash']
  vivify_620:
    set $P2086, $P2085["sign"]
    unless_null $P2086, vivify_621
    new $P2086, "Undef"
  vivify_621:
    set $S2087, $P2086
    iseq $I2088, $S2087, "-"
    unless $I2088, if_2084_end
    find_lex $P2089, "$value"
    neg $P2090, $P2089
    store_lex "$value", $P2090
  if_2084_end:
.annotate 'line', 752
    find_lex $P2091, "$/"
    get_hll_global $P2092, ["PAST"], "Val"
    find_lex $P2093, "$value"
    $P2094 = $P2092."new"($P2093 :named("value"))
    $P2095 = $P2091."!make"($P2094)
.annotate 'line', 749
    .return ($P2095)
  control_2070:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2096, exception, "payload"
    .return ($P2096)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<apos>"  :subid("115_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2100
.annotate 'line', 755
    new $P2099, 'ExceptionHandler'
    set_addr $P2099, control_2098
    $P2099."handle_types"(57)
    push_eh $P2099
    .lex "self", self
    .lex "$/", param_2100
    find_lex $P2101, "$/"
    find_lex $P2102, "$/"
    unless_null $P2102, vivify_622
    $P2102 = root_new ['parrot';'Hash']
  vivify_622:
    set $P2103, $P2102["quote_EXPR"]
    unless_null $P2103, vivify_623
    new $P2103, "Undef"
  vivify_623:
    $P2104 = $P2103."ast"()
    $P2105 = $P2101."!make"($P2104)
    .return ($P2105)
  control_2098:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2106, exception, "payload"
    .return ($P2106)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<dblq>"  :subid("116_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2110
.annotate 'line', 756
    new $P2109, 'ExceptionHandler'
    set_addr $P2109, control_2108
    $P2109."handle_types"(57)
    push_eh $P2109
    .lex "self", self
    .lex "$/", param_2110
    find_lex $P2111, "$/"
    find_lex $P2112, "$/"
    unless_null $P2112, vivify_624
    $P2112 = root_new ['parrot';'Hash']
  vivify_624:
    set $P2113, $P2112["quote_EXPR"]
    unless_null $P2113, vivify_625
    new $P2113, "Undef"
  vivify_625:
    $P2114 = $P2113."ast"()
    $P2115 = $P2111."!make"($P2114)
    .return ($P2115)
  control_2108:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2116, exception, "payload"
    .return ($P2116)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<qq>"  :subid("117_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2120
.annotate 'line', 757
    new $P2119, 'ExceptionHandler'
    set_addr $P2119, control_2118
    $P2119."handle_types"(57)
    push_eh $P2119
    .lex "self", self
    .lex "$/", param_2120
    find_lex $P2121, "$/"
    find_lex $P2122, "$/"
    unless_null $P2122, vivify_626
    $P2122 = root_new ['parrot';'Hash']
  vivify_626:
    set $P2123, $P2122["quote_EXPR"]
    unless_null $P2123, vivify_627
    new $P2123, "Undef"
  vivify_627:
    $P2124 = $P2123."ast"()
    $P2125 = $P2121."!make"($P2124)
    .return ($P2125)
  control_2118:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2126, exception, "payload"
    .return ($P2126)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<q>"  :subid("118_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2130
.annotate 'line', 758
    new $P2129, 'ExceptionHandler'
    set_addr $P2129, control_2128
    $P2129."handle_types"(57)
    push_eh $P2129
    .lex "self", self
    .lex "$/", param_2130
    find_lex $P2131, "$/"
    find_lex $P2132, "$/"
    unless_null $P2132, vivify_628
    $P2132 = root_new ['parrot';'Hash']
  vivify_628:
    set $P2133, $P2132["quote_EXPR"]
    unless_null $P2133, vivify_629
    new $P2133, "Undef"
  vivify_629:
    $P2134 = $P2133."ast"()
    $P2135 = $P2131."!make"($P2134)
    .return ($P2135)
  control_2128:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2136, exception, "payload"
    .return ($P2136)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q>"  :subid("119_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2140
.annotate 'line', 759
    new $P2139, 'ExceptionHandler'
    set_addr $P2139, control_2138
    $P2139."handle_types"(57)
    push_eh $P2139
    .lex "self", self
    .lex "$/", param_2140
    find_lex $P2141, "$/"
    find_lex $P2142, "$/"
    unless_null $P2142, vivify_630
    $P2142 = root_new ['parrot';'Hash']
  vivify_630:
    set $P2143, $P2142["quote_EXPR"]
    unless_null $P2143, vivify_631
    new $P2143, "Undef"
  vivify_631:
    $P2144 = $P2143."ast"()
    $P2145 = $P2141."!make"($P2144)
    .return ($P2145)
  control_2138:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2146, exception, "payload"
    .return ($P2146)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q:PIR>"  :subid("120_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2150
.annotate 'line', 760
    new $P2149, 'ExceptionHandler'
    set_addr $P2149, control_2148
    $P2149."handle_types"(57)
    push_eh $P2149
    .lex "self", self
    .lex "$/", param_2150
.annotate 'line', 761
    find_lex $P2151, "$/"
    get_hll_global $P2152, ["PAST"], "Op"
    find_lex $P2153, "$/"
    unless_null $P2153, vivify_632
    $P2153 = root_new ['parrot';'Hash']
  vivify_632:
    set $P2154, $P2153["quote_EXPR"]
    unless_null $P2154, vivify_633
    new $P2154, "Undef"
  vivify_633:
    $P2155 = $P2154."ast"()
    $P2156 = $P2155."value"()
    find_lex $P2157, "$/"
    $P2158 = $P2152."new"($P2156 :named("inline"), "inline" :named("pasttype"), $P2157 :named("node"))
    $P2159 = $P2151."!make"($P2158)
.annotate 'line', 760
    .return ($P2159)
  control_2148:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2160, exception, "payload"
    .return ($P2160)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym</ />"  :subid("121_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2164
    .param pmc param_2165 :optional
    .param int has_param_2165 :opt_flag
.annotate 'line', 766
    new $P2163, 'ExceptionHandler'
    set_addr $P2163, control_2162
    $P2163."handle_types"(57)
    push_eh $P2163
    .lex "self", self
    .lex "$/", param_2164
    if has_param_2165, optparam_634
    new $P2166, "Undef"
    set param_2165, $P2166
  optparam_634:
    .lex "$key", param_2165
.annotate 'line', 776
    new $P2167, "Undef"
    .lex "$regex", $P2167
.annotate 'line', 778
    new $P2168, "Undef"
    .lex "$past", $P2168
.annotate 'line', 767
    find_lex $P2170, "$key"
    set $S2171, $P2170
    iseq $I2172, $S2171, "open"
    unless $I2172, if_2169_end
.annotate 'line', 768

            null $P0
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate 'line', 772
    get_global $P2173, "@BLOCK"
    unless_null $P2173, vivify_635
    $P2173 = root_new ['parrot';'ResizablePMCArray']
  vivify_635:
    set $P2174, $P2173[0]
    unless_null $P2174, vivify_636
    new $P2174, "Undef"
  vivify_636:
    $P2174."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate 'line', 773
    get_global $P2175, "@BLOCK"
    unless_null $P2175, vivify_637
    $P2175 = root_new ['parrot';'ResizablePMCArray']
  vivify_637:
    set $P2176, $P2175[0]
    unless_null $P2176, vivify_638
    new $P2176, "Undef"
  vivify_638:
    $P2176."symbol"("$/", "lexical" :named("scope"))
.annotate 'line', 774
    new $P2177, "Exception"
    set $P2177['type'], 57
    new $P2178, "Integer"
    assign $P2178, 0
    setattribute $P2177, 'payload', $P2178
    throw $P2177
  if_2169_end:
.annotate 'line', 777
    get_hll_global $P2179, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P2180, "$/"
    unless_null $P2180, vivify_639
    $P2180 = root_new ['parrot';'Hash']
  vivify_639:
    set $P2181, $P2180["p6regex"]
    unless_null $P2181, vivify_640
    new $P2181, "Undef"
  vivify_640:
    $P2182 = $P2181."ast"()
    get_global $P2183, "@BLOCK"
    $P2184 = $P2183."shift"()
    $P2185 = $P2179($P2182, $P2184)
    store_lex "$regex", $P2185
.annotate 'line', 779
    get_hll_global $P2186, ["PAST"], "Op"
.annotate 'line', 781
    get_hll_global $P2187, ["PAST"], "Var"
    new $P2188, "ResizablePMCArray"
    push $P2188, "Regex"
    $P2189 = $P2187."new"("Regex" :named("name"), $P2188 :named("namespace"), "package" :named("scope"))
    find_lex $P2190, "$regex"
    $P2191 = $P2186."new"($P2189, $P2190, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate 'line', 779
    store_lex "$past", $P2191
.annotate 'line', 785
    find_lex $P2192, "$regex"
    find_lex $P2193, "$past"
    unless_null $P2193, vivify_641
    $P2193 = root_new ['parrot';'Hash']
    store_lex "$past", $P2193
  vivify_641:
    set $P2193["sink"], $P2192
.annotate 'line', 786
    find_lex $P2194, "$/"
    find_lex $P2195, "$past"
    $P2196 = $P2194."!make"($P2195)
.annotate 'line', 766
    .return ($P2196)
  control_2162:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2197, exception, "payload"
    .return ($P2197)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<$>"  :subid("122_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2201
.annotate 'line', 789
    new $P2200, 'ExceptionHandler'
    set_addr $P2200, control_2199
    $P2200."handle_types"(57)
    push_eh $P2200
    .lex "self", self
    .lex "$/", param_2201
    find_lex $P2202, "$/"
    find_lex $P2203, "$/"
    unless_null $P2203, vivify_642
    $P2203 = root_new ['parrot';'Hash']
  vivify_642:
    set $P2204, $P2203["variable"]
    unless_null $P2204, vivify_643
    new $P2204, "Undef"
  vivify_643:
    $P2205 = $P2204."ast"()
    $P2206 = $P2202."!make"($P2205)
    .return ($P2206)
  control_2199:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2207, exception, "payload"
    .return ($P2207)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<{ }>"  :subid("123_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2211
.annotate 'line', 790
    new $P2210, 'ExceptionHandler'
    set_addr $P2210, control_2209
    $P2210."handle_types"(57)
    push_eh $P2210
    .lex "self", self
    .lex "$/", param_2211
.annotate 'line', 791
    find_lex $P2212, "$/"
    get_hll_global $P2213, ["PAST"], "Op"
.annotate 'line', 792
    find_lex $P2214, "$/"
    unless_null $P2214, vivify_644
    $P2214 = root_new ['parrot';'Hash']
  vivify_644:
    set $P2215, $P2214["block"]
    unless_null $P2215, vivify_645
    new $P2215, "Undef"
  vivify_645:
    $P2216 = $P2215."ast"()
    $P2217 = "block_immediate"($P2216)
    find_lex $P2218, "$/"
    $P2219 = $P2213."new"($P2217, "set S*" :named("pirop"), $P2218 :named("node"))
.annotate 'line', 791
    $P2220 = $P2212."!make"($P2219)
.annotate 'line', 790
    .return ($P2220)
  control_2209:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2221, exception, "payload"
    .return ($P2221)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<esc>"  :subid("124_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2225
.annotate 'line', 795
    new $P2224, 'ExceptionHandler'
    set_addr $P2224, control_2223
    $P2224."handle_types"(57)
    push_eh $P2224
    .lex "self", self
    .lex "$/", param_2225
    find_lex $P2226, "$/"
    $P2227 = $P2226."!make"("\e")
    .return ($P2227)
  control_2223:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2228, exception, "payload"
    .return ($P2228)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<.>"  :subid("125_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2232
.annotate 'line', 799
    new $P2231, 'ExceptionHandler'
    set_addr $P2231, control_2230
    $P2231."handle_types"(57)
    push_eh $P2231
    .lex "self", self
    .lex "$/", param_2232
    find_lex $P2233, "$/"
    find_lex $P2234, "$/"
    unless_null $P2234, vivify_646
    $P2234 = root_new ['parrot';'Hash']
  vivify_646:
    set $P2235, $P2234["dotty"]
    unless_null $P2235, vivify_647
    new $P2235, "Undef"
  vivify_647:
    $P2236 = $P2235."ast"()
    $P2237 = $P2233."!make"($P2236)
    .return ($P2237)
  control_2230:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2238, exception, "payload"
    .return ($P2238)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<++>"  :subid("126_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2242
.annotate 'line', 801
    new $P2241, 'ExceptionHandler'
    set_addr $P2241, control_2240
    $P2241."handle_types"(57)
    push_eh $P2241
    .lex "self", self
    .lex "$/", param_2242
.annotate 'line', 802
    find_lex $P2243, "$/"
    get_hll_global $P2244, ["PAST"], "Op"
.annotate 'line', 803
    new $P2245, "ResizablePMCArray"
    push $P2245, "    clone %r, %0"
    push $P2245, "    inc %0"
    $P2246 = $P2244."new"("postfix:<++>" :named("name"), $P2245 :named("inline"), "inline" :named("pasttype"))
.annotate 'line', 802
    $P2247 = $P2243."!make"($P2246)
.annotate 'line', 801
    .return ($P2247)
  control_2240:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2248, exception, "payload"
    .return ($P2248)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<-->"  :subid("127_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2252
.annotate 'line', 807
    new $P2251, 'ExceptionHandler'
    set_addr $P2251, control_2250
    $P2251."handle_types"(57)
    push_eh $P2251
    .lex "self", self
    .lex "$/", param_2252
.annotate 'line', 808
    find_lex $P2253, "$/"
    get_hll_global $P2254, ["PAST"], "Op"
.annotate 'line', 809
    new $P2255, "ResizablePMCArray"
    push $P2255, "    clone %r, %0"
    push $P2255, "    dec %0"
    $P2256 = $P2254."new"("postfix:<-->" :named("name"), $P2255 :named("inline"), "inline" :named("pasttype"))
.annotate 'line', 808
    $P2257 = $P2253."!make"($P2256)
.annotate 'line', 807
    .return ($P2257)
  control_2250:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2258, exception, "payload"
    .return ($P2258)
.end


.namespace ["NQP";"Actions"]
.sub "prefix:sym<make>"  :subid("128_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2262
.annotate 'line', 813
    new $P2261, 'ExceptionHandler'
    set_addr $P2261, control_2260
    $P2261."handle_types"(57)
    push_eh $P2261
    .lex "self", self
    .lex "$/", param_2262
.annotate 'line', 814
    find_lex $P2263, "$/"
    get_hll_global $P2264, ["PAST"], "Op"
.annotate 'line', 815
    get_hll_global $P2265, ["PAST"], "Var"
    $P2266 = $P2265."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P2267, "$/"
    $P2268 = $P2264."new"($P2266, "callmethod" :named("pasttype"), "!make" :named("name"), $P2267 :named("node"))
.annotate 'line', 814
    $P2269 = $P2263."!make"($P2268)
.annotate 'line', 813
    .return ($P2269)
  control_2260:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2270, exception, "payload"
    .return ($P2270)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<next>"  :subid("129_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2275
.annotate 'line', 835
    new $P2274, 'ExceptionHandler'
    set_addr $P2274, control_2273
    $P2274."handle_types"(57)
    push_eh $P2274
    .lex "self", self
    .lex "$/", param_2275
    find_lex $P2276, "$/"
    $P2277 = "control"($P2276, ".CONTROL_LOOP_NEXT")
    .return ($P2277)
  control_2273:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2278, exception, "payload"
    .return ($P2278)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<last>"  :subid("130_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2282
.annotate 'line', 836
    new $P2281, 'ExceptionHandler'
    set_addr $P2281, control_2280
    $P2281."handle_types"(57)
    push_eh $P2281
    .lex "self", self
    .lex "$/", param_2282
    find_lex $P2283, "$/"
    $P2284 = "control"($P2283, ".CONTROL_LOOP_LAST")
    .return ($P2284)
  control_2280:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2285, exception, "payload"
    .return ($P2285)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<redo>"  :subid("131_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2289
.annotate 'line', 837
    new $P2288, 'ExceptionHandler'
    set_addr $P2288, control_2287
    $P2288."handle_types"(57)
    push_eh $P2288
    .lex "self", self
    .lex "$/", param_2289
    find_lex $P2290, "$/"
    $P2291 = "control"($P2290, ".CONTROL_LOOP_REDO")
    .return ($P2291)
  control_2287:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2292, exception, "payload"
    .return ($P2292)
.end


.namespace ["NQP";"Actions"]
.sub "infix:sym<~~>"  :subid("132_1275600017.58296") :method :outer("11_1275600017.58296")
    .param pmc param_2296
.annotate 'line', 839
    new $P2295, 'ExceptionHandler'
    set_addr $P2295, control_2294
    $P2295."handle_types"(57)
    push_eh $P2295
    .lex "self", self
    .lex "$/", param_2296
.annotate 'line', 840
    find_lex $P2297, "$/"
    get_hll_global $P2298, ["PAST"], "Op"
    find_lex $P2299, "$/"
    $P2300 = $P2298."new"("callmethod" :named("pasttype"), "ACCEPTS" :named("name"), $P2299 :named("node"))
    $P2301 = $P2297."!make"($P2300)
.annotate 'line', 839
    .return ($P2301)
  control_2294:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2302, exception, "payload"
    .return ($P2302)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block2303"  :subid("133_1275600017.58296") :outer("11_1275600017.58296")
.annotate 'line', 844
    .const 'Sub' $P2388 = "140_1275600017.58296" 
    capture_lex $P2388
    .const 'Sub' $P2375 = "139_1275600017.58296" 
    capture_lex $P2375
    .const 'Sub' $P2358 = "138_1275600017.58296" 
    capture_lex $P2358
    .const 'Sub' $P2345 = "137_1275600017.58296" 
    capture_lex $P2345
    .const 'Sub' $P2332 = "136_1275600017.58296" 
    capture_lex $P2332
    .const 'Sub' $P2319 = "135_1275600017.58296" 
    capture_lex $P2319
    .const 'Sub' $P2305 = "134_1275600017.58296" 
    capture_lex $P2305
.annotate 'line', 877
    .const 'Sub' $P2388 = "140_1275600017.58296" 
    newclosure $P2413, $P2388
.annotate 'line', 844
    .return ($P2413)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<:my>"  :subid("134_1275600017.58296") :method :outer("133_1275600017.58296")
    .param pmc param_2308
.annotate 'line', 846
    new $P2307, 'ExceptionHandler'
    set_addr $P2307, control_2306
    $P2307."handle_types"(57)
    push_eh $P2307
    .lex "self", self
    .lex "$/", param_2308
.annotate 'line', 847
    new $P2309, "Undef"
    .lex "$past", $P2309
    find_lex $P2310, "$/"
    unless_null $P2310, vivify_648
    $P2310 = root_new ['parrot';'Hash']
  vivify_648:
    set $P2311, $P2310["statement"]
    unless_null $P2311, vivify_649
    new $P2311, "Undef"
  vivify_649:
    $P2312 = $P2311."ast"()
    store_lex "$past", $P2312
.annotate 'line', 848
    find_lex $P2313, "$/"
    get_hll_global $P2314, ["PAST"], "Regex"
    find_lex $P2315, "$past"
    $P2316 = $P2314."new"($P2315, "pastnode" :named("pasttype"))
    $P2317 = $P2313."!make"($P2316)
.annotate 'line', 846
    .return ($P2317)
  control_2306:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2318, exception, "payload"
    .return ($P2318)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<{ }>"  :subid("135_1275600017.58296") :method :outer("133_1275600017.58296")
    .param pmc param_2322
.annotate 'line', 851
    new $P2321, 'ExceptionHandler'
    set_addr $P2321, control_2320
    $P2321."handle_types"(57)
    push_eh $P2321
    .lex "self", self
    .lex "$/", param_2322
.annotate 'line', 852
    find_lex $P2323, "$/"
    get_hll_global $P2324, ["PAST"], "Regex"
    find_lex $P2325, "$/"
    unless_null $P2325, vivify_650
    $P2325 = root_new ['parrot';'Hash']
  vivify_650:
    set $P2326, $P2325["codeblock"]
    unless_null $P2326, vivify_651
    new $P2326, "Undef"
  vivify_651:
    $P2327 = $P2326."ast"()
    find_lex $P2328, "$/"
    $P2329 = $P2324."new"($P2327, "pastnode" :named("pasttype"), $P2328 :named("node"))
    $P2330 = $P2323."!make"($P2329)
.annotate 'line', 851
    .return ($P2330)
  control_2320:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2331, exception, "payload"
    .return ($P2331)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<nqpvar>"  :subid("136_1275600017.58296") :method :outer("133_1275600017.58296")
    .param pmc param_2335
.annotate 'line', 856
    new $P2334, 'ExceptionHandler'
    set_addr $P2334, control_2333
    $P2334."handle_types"(57)
    push_eh $P2334
    .lex "self", self
    .lex "$/", param_2335
.annotate 'line', 857
    find_lex $P2336, "$/"
    get_hll_global $P2337, ["PAST"], "Regex"
    find_lex $P2338, "$/"
    unless_null $P2338, vivify_652
    $P2338 = root_new ['parrot';'Hash']
  vivify_652:
    set $P2339, $P2338["var"]
    unless_null $P2339, vivify_653
    new $P2339, "Undef"
  vivify_653:
    $P2340 = $P2339."ast"()
    find_lex $P2341, "$/"
    $P2342 = $P2337."new"("!INTERPOLATE", $P2340, "subrule" :named("pasttype"), "method" :named("subtype"), $P2341 :named("node"))
    $P2343 = $P2336."!make"($P2342)
.annotate 'line', 856
    .return ($P2343)
  control_2333:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2344, exception, "payload"
    .return ($P2344)
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<{ }>"  :subid("137_1275600017.58296") :method :outer("133_1275600017.58296")
    .param pmc param_2348
.annotate 'line', 861
    new $P2347, 'ExceptionHandler'
    set_addr $P2347, control_2346
    $P2347."handle_types"(57)
    push_eh $P2347
    .lex "self", self
    .lex "$/", param_2348
.annotate 'line', 862
    find_lex $P2349, "$/"
    get_hll_global $P2350, ["PAST"], "Regex"
    find_lex $P2351, "$/"
    unless_null $P2351, vivify_654
    $P2351 = root_new ['parrot';'Hash']
  vivify_654:
    set $P2352, $P2351["codeblock"]
    unless_null $P2352, vivify_655
    new $P2352, "Undef"
  vivify_655:
    $P2353 = $P2352."ast"()
    find_lex $P2354, "$/"
    $P2355 = $P2350."new"("!INTERPOLATE_REGEX", $P2353, "subrule" :named("pasttype"), "method" :named("subtype"), $P2354 :named("node"))
    $P2356 = $P2349."!make"($P2355)
.annotate 'line', 861
    .return ($P2356)
  control_2346:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2357, exception, "payload"
    .return ($P2357)
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<?{ }>"  :subid("138_1275600017.58296") :method :outer("133_1275600017.58296")
    .param pmc param_2361
.annotate 'line', 866
    new $P2360, 'ExceptionHandler'
    set_addr $P2360, control_2359
    $P2360."handle_types"(57)
    push_eh $P2360
    .lex "self", self
    .lex "$/", param_2361
.annotate 'line', 867
    find_lex $P2362, "$/"
    get_hll_global $P2363, ["PAST"], "Regex"
    find_lex $P2364, "$/"
    unless_null $P2364, vivify_656
    $P2364 = root_new ['parrot';'Hash']
  vivify_656:
    set $P2365, $P2364["codeblock"]
    unless_null $P2365, vivify_657
    new $P2365, "Undef"
  vivify_657:
    $P2366 = $P2365."ast"()
.annotate 'line', 868
    find_lex $P2367, "$/"
    unless_null $P2367, vivify_658
    $P2367 = root_new ['parrot';'Hash']
  vivify_658:
    set $P2368, $P2367["zw"]
    unless_null $P2368, vivify_659
    new $P2368, "Undef"
  vivify_659:
    set $S2369, $P2368
    iseq $I2370, $S2369, "!"
    find_lex $P2371, "$/"
    $P2372 = $P2363."new"($P2366, "zerowidth" :named("subtype"), $I2370 :named("negate"), "pastnode" :named("pasttype"), $P2371 :named("node"))
.annotate 'line', 867
    $P2373 = $P2362."!make"($P2372)
.annotate 'line', 866
    .return ($P2373)
  control_2359:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2374, exception, "payload"
    .return ($P2374)
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<var>"  :subid("139_1275600017.58296") :method :outer("133_1275600017.58296")
    .param pmc param_2378
.annotate 'line', 872
    new $P2377, 'ExceptionHandler'
    set_addr $P2377, control_2376
    $P2377."handle_types"(57)
    push_eh $P2377
    .lex "self", self
    .lex "$/", param_2378
.annotate 'line', 873
    find_lex $P2379, "$/"
    get_hll_global $P2380, ["PAST"], "Regex"
    find_lex $P2381, "$/"
    unless_null $P2381, vivify_660
    $P2381 = root_new ['parrot';'Hash']
  vivify_660:
    set $P2382, $P2381["var"]
    unless_null $P2382, vivify_661
    new $P2382, "Undef"
  vivify_661:
    $P2383 = $P2382."ast"()
    find_lex $P2384, "$/"
    $P2385 = $P2380."new"("!INTERPOLATE_REGEX", $P2383, "subrule" :named("pasttype"), "method" :named("subtype"), $P2384 :named("node"))
    $P2386 = $P2379."!make"($P2385)
.annotate 'line', 872
    .return ($P2386)
  control_2376:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2387, exception, "payload"
    .return ($P2387)
.end


.namespace ["NQP";"RegexActions"]
.sub "codeblock"  :subid("140_1275600017.58296") :method :outer("133_1275600017.58296")
    .param pmc param_2391
.annotate 'line', 877
    new $P2390, 'ExceptionHandler'
    set_addr $P2390, control_2389
    $P2390."handle_types"(57)
    push_eh $P2390
    .lex "self", self
    .lex "$/", param_2391
.annotate 'line', 878
    new $P2392, "Undef"
    .lex "$block", $P2392
.annotate 'line', 880
    new $P2393, "Undef"
    .lex "$past", $P2393
.annotate 'line', 878
    find_lex $P2394, "$/"
    unless_null $P2394, vivify_662
    $P2394 = root_new ['parrot';'Hash']
  vivify_662:
    set $P2395, $P2394["block"]
    unless_null $P2395, vivify_663
    new $P2395, "Undef"
  vivify_663:
    $P2396 = $P2395."ast"()
    store_lex "$block", $P2396
.annotate 'line', 879
    find_lex $P2397, "$block"
    $P2397."blocktype"("immediate")
.annotate 'line', 881
    get_hll_global $P2398, ["PAST"], "Stmts"
.annotate 'line', 882
    get_hll_global $P2399, ["PAST"], "Op"
.annotate 'line', 883
    get_hll_global $P2400, ["PAST"], "Var"
    $P2401 = $P2400."new"("$/" :named("name"))
.annotate 'line', 884
    get_hll_global $P2402, ["PAST"], "Op"
.annotate 'line', 885
    get_hll_global $P2403, ["PAST"], "Var"
    $P2404 = $P2403."new"(unicode:"$\x{a2}" :named("name"))
    $P2405 = $P2402."new"($P2404, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 884
    $P2406 = $P2399."new"($P2401, $P2405, "bind" :named("pasttype"))
.annotate 'line', 882
    find_lex $P2407, "$block"
    $P2408 = $P2398."new"($P2406, $P2407)
.annotate 'line', 881
    store_lex "$past", $P2408
.annotate 'line', 893
    find_lex $P2409, "$/"
    find_lex $P2410, "$past"
    $P2411 = $P2409."!make"($P2410)
.annotate 'line', 877
    .return ($P2411)
  control_2389:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2412, exception, "payload"
    .return ($P2412)
.end


.namespace ["NQP";"Actions"]
.sub "_block2415" :load :anon :subid("141_1275600017.58296")
.annotate 'line', 3
    .const 'Sub' $P2417 = "11_1275600017.58296" 
    $P2418 = $P2417()
    .return ($P2418)
.end


.namespace []
.sub "_block2425" :load :anon :subid("143_1275600017.58296")
.annotate 'line', 1
    .const 'Sub' $P2427 = "10_1275600017.58296" 
    $P2428 = $P2427()
    .return ($P2428)
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
