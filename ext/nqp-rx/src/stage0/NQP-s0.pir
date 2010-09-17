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
.sub "_block11"  :anon :subid("10_1284728478.15265")
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
    $P1452 = $P14()
.annotate 'line', 1
    .return ($P1452)
    .const 'Sub' $P1454 = "377_1284728478.15265" 
    .return ($P1454)
.end


.namespace []
.sub "" :load :init :subid("post378") :outer("10_1284728478.15265")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1284728478.15265" 
    .local pmc block
    set block, $P12
    $P1457 = get_root_global ["parrot"], "P6metaclass"
    $P1457."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1284728478.15265") :outer("10_1284728478.15265")
.annotate 'line', 4
    get_hll_global $P1369, ["NQP";"Regex"], "_block1368" 
    capture_lex $P1369
    .const 'Sub' $P1355 = "354_1284728478.15265" 
    capture_lex $P1355
    .const 'Sub' $P1349 = "352_1284728478.15265" 
    capture_lex $P1349
    .const 'Sub' $P1343 = "350_1284728478.15265" 
    capture_lex $P1343
    .const 'Sub' $P1337 = "348_1284728478.15265" 
    capture_lex $P1337
    .const 'Sub' $P1331 = "346_1284728478.15265" 
    capture_lex $P1331
    .const 'Sub' $P1325 = "344_1284728478.15265" 
    capture_lex $P1325
    .const 'Sub' $P1318 = "342_1284728478.15265" 
    capture_lex $P1318
    .const 'Sub' $P1311 = "340_1284728478.15265" 
    capture_lex $P1311
    .const 'Sub' $P1304 = "338_1284728478.15265" 
    capture_lex $P1304
    .const 'Sub' $P1297 = "336_1284728478.15265" 
    capture_lex $P1297
    .const 'Sub' $P1291 = "334_1284728478.15265" 
    capture_lex $P1291
    .const 'Sub' $P1284 = "332_1284728478.15265" 
    capture_lex $P1284
    .const 'Sub' $P1277 = "330_1284728478.15265" 
    capture_lex $P1277
    .const 'Sub' $P1270 = "328_1284728478.15265" 
    capture_lex $P1270
    .const 'Sub' $P1263 = "326_1284728478.15265" 
    capture_lex $P1263
    .const 'Sub' $P1256 = "324_1284728478.15265" 
    capture_lex $P1256
    .const 'Sub' $P1249 = "322_1284728478.15265" 
    capture_lex $P1249
    .const 'Sub' $P1242 = "320_1284728478.15265" 
    capture_lex $P1242
    .const 'Sub' $P1235 = "318_1284728478.15265" 
    capture_lex $P1235
    .const 'Sub' $P1228 = "316_1284728478.15265" 
    capture_lex $P1228
    .const 'Sub' $P1221 = "314_1284728478.15265" 
    capture_lex $P1221
    .const 'Sub' $P1214 = "312_1284728478.15265" 
    capture_lex $P1214
    .const 'Sub' $P1207 = "310_1284728478.15265" 
    capture_lex $P1207
    .const 'Sub' $P1200 = "308_1284728478.15265" 
    capture_lex $P1200
    .const 'Sub' $P1193 = "306_1284728478.15265" 
    capture_lex $P1193
    .const 'Sub' $P1186 = "304_1284728478.15265" 
    capture_lex $P1186
    .const 'Sub' $P1179 = "302_1284728478.15265" 
    capture_lex $P1179
    .const 'Sub' $P1172 = "300_1284728478.15265" 
    capture_lex $P1172
    .const 'Sub' $P1165 = "298_1284728478.15265" 
    capture_lex $P1165
    .const 'Sub' $P1158 = "296_1284728478.15265" 
    capture_lex $P1158
    .const 'Sub' $P1151 = "294_1284728478.15265" 
    capture_lex $P1151
    .const 'Sub' $P1144 = "292_1284728478.15265" 
    capture_lex $P1144
    .const 'Sub' $P1137 = "290_1284728478.15265" 
    capture_lex $P1137
    .const 'Sub' $P1130 = "288_1284728478.15265" 
    capture_lex $P1130
    .const 'Sub' $P1123 = "286_1284728478.15265" 
    capture_lex $P1123
    .const 'Sub' $P1116 = "284_1284728478.15265" 
    capture_lex $P1116
    .const 'Sub' $P1109 = "282_1284728478.15265" 
    capture_lex $P1109
    .const 'Sub' $P1102 = "280_1284728478.15265" 
    capture_lex $P1102
    .const 'Sub' $P1095 = "278_1284728478.15265" 
    capture_lex $P1095
    .const 'Sub' $P1088 = "276_1284728478.15265" 
    capture_lex $P1088
    .const 'Sub' $P1082 = "274_1284728478.15265" 
    capture_lex $P1082
    .const 'Sub' $P1075 = "272_1284728478.15265" 
    capture_lex $P1075
    .const 'Sub' $P1068 = "270_1284728478.15265" 
    capture_lex $P1068
    .const 'Sub' $P1061 = "268_1284728478.15265" 
    capture_lex $P1061
    .const 'Sub' $P1054 = "266_1284728478.15265" 
    capture_lex $P1054
    .const 'Sub' $P1047 = "264_1284728478.15265" 
    capture_lex $P1047
    .const 'Sub' $P1040 = "262_1284728478.15265" 
    capture_lex $P1040
    .const 'Sub' $P1033 = "260_1284728478.15265" 
    capture_lex $P1033
    .const 'Sub' $P1027 = "258_1284728478.15265" 
    capture_lex $P1027
    .const 'Sub' $P1021 = "256_1284728478.15265" 
    capture_lex $P1021
    .const 'Sub' $P1016 = "254_1284728478.15265" 
    capture_lex $P1016
    .const 'Sub' $P1010 = "252_1284728478.15265" 
    capture_lex $P1010
    .const 'Sub' $P1004 = "250_1284728478.15265" 
    capture_lex $P1004
    .const 'Sub' $P999 = "248_1284728478.15265" 
    capture_lex $P999
    .const 'Sub' $P994 = "246_1284728478.15265" 
    capture_lex $P994
    .const 'Sub' $P986 = "244_1284728478.15265" 
    capture_lex $P986
    .const 'Sub' $P977 = "242_1284728478.15265" 
    capture_lex $P977
    .const 'Sub' $P972 = "240_1284728478.15265" 
    capture_lex $P972
    .const 'Sub' $P967 = "238_1284728478.15265" 
    capture_lex $P967
    .const 'Sub' $P962 = "236_1284728478.15265" 
    capture_lex $P962
    .const 'Sub' $P954 = "234_1284728478.15265" 
    capture_lex $P954
    .const 'Sub' $P946 = "232_1284728478.15265" 
    capture_lex $P946
    .const 'Sub' $P941 = "230_1284728478.15265" 
    capture_lex $P941
    .const 'Sub' $P936 = "228_1284728478.15265" 
    capture_lex $P936
    .const 'Sub' $P931 = "226_1284728478.15265" 
    capture_lex $P931
    .const 'Sub' $P925 = "224_1284728478.15265" 
    capture_lex $P925
    .const 'Sub' $P919 = "222_1284728478.15265" 
    capture_lex $P919
    .const 'Sub' $P913 = "220_1284728478.15265" 
    capture_lex $P913
    .const 'Sub' $P907 = "218_1284728478.15265" 
    capture_lex $P907
    .const 'Sub' $P901 = "216_1284728478.15265" 
    capture_lex $P901
    .const 'Sub' $P896 = "214_1284728478.15265" 
    capture_lex $P896
    .const 'Sub' $P891 = "212_1284728478.15265" 
    capture_lex $P891
    .const 'Sub' $P879 = "208_1284728478.15265" 
    capture_lex $P879
    .const 'Sub' $P871 = "206_1284728478.15265" 
    capture_lex $P871
    .const 'Sub' $P865 = "204_1284728478.15265" 
    capture_lex $P865
    .const 'Sub' $P858 = "202_1284728478.15265" 
    capture_lex $P858
    .const 'Sub' $P852 = "200_1284728478.15265" 
    capture_lex $P852
    .const 'Sub' $P844 = "198_1284728478.15265" 
    capture_lex $P844
    .const 'Sub' $P836 = "196_1284728478.15265" 
    capture_lex $P836
    .const 'Sub' $P830 = "194_1284728478.15265" 
    capture_lex $P830
    .const 'Sub' $P824 = "192_1284728478.15265" 
    capture_lex $P824
    .const 'Sub' $P810 = "188_1284728478.15265" 
    capture_lex $P810
    .const 'Sub' $P773 = "186_1284728478.15265" 
    capture_lex $P773
    .const 'Sub' $P762 = "184_1284728478.15265" 
    capture_lex $P762
    .const 'Sub' $P750 = "180_1284728478.15265" 
    capture_lex $P750
    .const 'Sub' $P741 = "178_1284728478.15265" 
    capture_lex $P741
    .const 'Sub' $P735 = "176_1284728478.15265" 
    capture_lex $P735
    .const 'Sub' $P725 = "174_1284728478.15265" 
    capture_lex $P725
    .const 'Sub' $P712 = "172_1284728478.15265" 
    capture_lex $P712
    .const 'Sub' $P705 = "170_1284728478.15265" 
    capture_lex $P705
    .const 'Sub' $P697 = "168_1284728478.15265" 
    capture_lex $P697
    .const 'Sub' $P687 = "166_1284728478.15265" 
    capture_lex $P687
    .const 'Sub' $P660 = "162_1284728478.15265" 
    capture_lex $P660
    .const 'Sub' $P634 = "160_1284728478.15265" 
    capture_lex $P634
    .const 'Sub' $P627 = "158_1284728478.15265" 
    capture_lex $P627
    .const 'Sub' $P620 = "156_1284728478.15265" 
    capture_lex $P620
    .const 'Sub' $P610 = "152_1284728478.15265" 
    capture_lex $P610
    .const 'Sub' $P602 = "150_1284728478.15265" 
    capture_lex $P602
    .const 'Sub' $P596 = "148_1284728478.15265" 
    capture_lex $P596
    .const 'Sub' $P583 = "146_1284728478.15265" 
    capture_lex $P583
    .const 'Sub' $P576 = "144_1284728478.15265" 
    capture_lex $P576
    .const 'Sub' $P569 = "142_1284728478.15265" 
    capture_lex $P569
    .const 'Sub' $P562 = "140_1284728478.15265" 
    capture_lex $P562
    .const 'Sub' $P535 = "136_1284728478.15265" 
    capture_lex $P535
    .const 'Sub' $P526 = "134_1284728478.15265" 
    capture_lex $P526
    .const 'Sub' $P519 = "132_1284728478.15265" 
    capture_lex $P519
    .const 'Sub' $P510 = "128_1284728478.15265" 
    capture_lex $P510
    .const 'Sub' $P505 = "126_1284728478.15265" 
    capture_lex $P505
    .const 'Sub' $P493 = "124_1284728478.15265" 
    capture_lex $P493
    .const 'Sub' $P481 = "122_1284728478.15265" 
    capture_lex $P481
    .const 'Sub' $P474 = "120_1284728478.15265" 
    capture_lex $P474
    .const 'Sub' $P469 = "118_1284728478.15265" 
    capture_lex $P469
    .const 'Sub' $P463 = "116_1284728478.15265" 
    capture_lex $P463
    .const 'Sub' $P457 = "114_1284728478.15265" 
    capture_lex $P457
    .const 'Sub' $P447 = "111_1284728478.15265" 
    capture_lex $P447
    .const 'Sub' $P441 = "109_1284728478.15265" 
    capture_lex $P441
    .const 'Sub' $P435 = "107_1284728478.15265" 
    capture_lex $P435
    .const 'Sub' $P429 = "105_1284728478.15265" 
    capture_lex $P429
    .const 'Sub' $P423 = "103_1284728478.15265" 
    capture_lex $P423
    .const 'Sub' $P417 = "101_1284728478.15265" 
    capture_lex $P417
    .const 'Sub' $P411 = "99_1284728478.15265" 
    capture_lex $P411
    .const 'Sub' $P402 = "97_1284728478.15265" 
    capture_lex $P402
    .const 'Sub' $P393 = "95_1284728478.15265" 
    capture_lex $P393
    .const 'Sub' $P384 = "93_1284728478.15265" 
    capture_lex $P384
    .const 'Sub' $P371 = "89_1284728478.15265" 
    capture_lex $P371
    .const 'Sub' $P362 = "87_1284728478.15265" 
    capture_lex $P362
    .const 'Sub' $P352 = "83_1284728478.15265" 
    capture_lex $P352
    .const 'Sub' $P345 = "81_1284728478.15265" 
    capture_lex $P345
    .const 'Sub' $P338 = "79_1284728478.15265" 
    capture_lex $P338
    .const 'Sub' $P326 = "75_1284728478.15265" 
    capture_lex $P326
    .const 'Sub' $P318 = "73_1284728478.15265" 
    capture_lex $P318
    .const 'Sub' $P310 = "71_1284728478.15265" 
    capture_lex $P310
    .const 'Sub' $P290 = "69_1284728478.15265" 
    capture_lex $P290
    .const 'Sub' $P281 = "67_1284728478.15265" 
    capture_lex $P281
    .const 'Sub' $P263 = "64_1284728478.15265" 
    capture_lex $P263
    .const 'Sub' $P245 = "62_1284728478.15265" 
    capture_lex $P245
    .const 'Sub' $P236 = "58_1284728478.15265" 
    capture_lex $P236
    .const 'Sub' $P231 = "56_1284728478.15265" 
    capture_lex $P231
    .const 'Sub' $P222 = "52_1284728478.15265" 
    capture_lex $P222
    .const 'Sub' $P217 = "50_1284728478.15265" 
    capture_lex $P217
    .const 'Sub' $P212 = "48_1284728478.15265" 
    capture_lex $P212
    .const 'Sub' $P203 = "46_1284728478.15265" 
    capture_lex $P203
    .const 'Sub' $P196 = "44_1284728478.15265" 
    capture_lex $P196
    .const 'Sub' $P190 = "42_1284728478.15265" 
    capture_lex $P190
    .const 'Sub' $P182 = "40_1284728478.15265" 
    capture_lex $P182
    .const 'Sub' $P176 = "38_1284728478.15265" 
    capture_lex $P176
    .const 'Sub' $P170 = "36_1284728478.15265" 
    capture_lex $P170
    .const 'Sub' $P155 = "33_1284728478.15265" 
    capture_lex $P155
    .const 'Sub' $P141 = "31_1284728478.15265" 
    capture_lex $P141
    .const 'Sub' $P134 = "29_1284728478.15265" 
    capture_lex $P134
    .const 'Sub' $P95 = "26_1284728478.15265" 
    capture_lex $P95
    .const 'Sub' $P80 = "23_1284728478.15265" 
    capture_lex $P80
    .const 'Sub' $P69 = "21_1284728478.15265" 
    capture_lex $P69
    .const 'Sub' $P57 = "19_1284728478.15265" 
    capture_lex $P57
    .const 'Sub' $P49 = "17_1284728478.15265" 
    capture_lex $P49
    .const 'Sub' $P42 = "15_1284728478.15265" 
    capture_lex $P42
    .const 'Sub' $P35 = "13_1284728478.15265" 
    capture_lex $P35
    .const 'Sub' $P15 = "12_1284728478.15265" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 574
    get_hll_global $P1369, ["NQP";"Regex"], "_block1368" 
    capture_lex $P1369
    $P1431 = $P1369()
.annotate 'line', 4
    .return ($P1431)
    .const 'Sub' $P1433 = "376_1284728478.15265" 
    .return ($P1433)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post379") :outer("11_1284728478.15265")
.annotate 'line', 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 455
    get_hll_global $P1436, ["NQP"], "Grammar"
    $P1436."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate 'line', 456
    get_hll_global $P1437, ["NQP"], "Grammar"
    $P1437."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate 'line', 457
    get_hll_global $P1438, ["NQP"], "Grammar"
    $P1438."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate 'line', 458
    get_hll_global $P1439, ["NQP"], "Grammar"
    $P1439."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate 'line', 459
    get_hll_global $P1440, ["NQP"], "Grammar"
    $P1440."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate 'line', 460
    get_hll_global $P1441, ["NQP"], "Grammar"
    $P1441."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate 'line', 461
    get_hll_global $P1442, ["NQP"], "Grammar"
    $P1442."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate 'line', 462
    get_hll_global $P1443, ["NQP"], "Grammar"
    $P1443."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate 'line', 463
    get_hll_global $P1444, ["NQP"], "Grammar"
    $P1444."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate 'line', 464
    get_hll_global $P1445, ["NQP"], "Grammar"
    $P1445."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate 'line', 465
    get_hll_global $P1446, ["NQP"], "Grammar"
    $P1446."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate 'line', 466
    get_hll_global $P1447, ["NQP"], "Grammar"
    $P1447."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate 'line', 467
    get_hll_global $P1448, ["NQP"], "Grammar"
    $P1448."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate 'line', 468
    get_hll_global $P1449, ["NQP"], "Grammar"
    $P1449."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate 'line', 469
    get_hll_global $P1450, ["NQP"], "Grammar"
    $P1450."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate 'line', 454
    $P1451 = get_root_global ["parrot"], "P6metaclass"
    $P1451."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.include "except_types.pasm"
.sub "TOP"  :subid("12_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(.CONTROL_RETURN)
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
    unless_null $P21, vivify_380
    get_hll_global $P21, "%LANG"
    unless_null $P21, vivify_381
    die "Contextual %*LANG not found"
  vivify_381:
  vivify_380:
.annotate 'line', 6
    get_hll_global $P22, ["NQP"], "Regex"
    find_lex $P23, "%*LANG"
    unless_null $P23, vivify_382
    get_hll_global $P23, "%LANG"
    unless_null $P23, vivify_383
    die "Contextual %*LANG not found"
  vivify_383:
    store_lex "%*LANG", $P23
  vivify_382:
    set $P23["Regex"], $P22
.annotate 'line', 7
    get_hll_global $P24, ["NQP"], "RegexActions"
    find_lex $P25, "%*LANG"
    unless_null $P25, vivify_384
    get_hll_global $P25, "%LANG"
    unless_null $P25, vivify_385
    die "Contextual %*LANG not found"
  vivify_385:
    store_lex "%*LANG", $P25
  vivify_384:
    set $P25["Regex-actions"], $P24
.annotate 'line', 8
    get_hll_global $P26, ["NQP"], "Grammar"
    find_lex $P27, "%*LANG"
    unless_null $P27, vivify_386
    get_hll_global $P27, "%LANG"
    unless_null $P27, vivify_387
    die "Contextual %*LANG not found"
  vivify_387:
    store_lex "%*LANG", $P27
  vivify_386:
    set $P27["MAIN"], $P26
.annotate 'line', 9
    get_hll_global $P28, ["NQP"], "Actions"
    find_lex $P29, "%*LANG"
    unless_null $P29, vivify_388
    get_hll_global $P29, "%LANG"
    unless_null $P29, vivify_389
    die "Contextual %*LANG not found"
  vivify_389:
    store_lex "%*LANG", $P29
  vivify_388:
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
.sub "identifier"  :subid("13_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx36_tgt
    .local int rx36_pos
    .local int rx36_off
    .local int rx36_eos
    .local int rx36_rep
    .local pmc rx36_cur
    .local pmc rx36_debug
    (rx36_cur, rx36_pos, rx36_tgt, $I10) = self."!cursor_start"()
    getattribute rx36_debug, rx36_cur, "$!debug"
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
    eq $I10, 1, rx36_restart
    if_null rx36_debug, debug_390
    rx36_cur."!cursor_debug"("START", "identifier")
  debug_390:
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
  # rx subrule "ident" subtype=method negate=
    rx36_cur."!cursor_pos"(rx36_pos)
    $P10 = rx36_cur."ident"()
    unless $P10, rx36_fail
    rx36_pos = $P10."pos"()
  # rx rxquantr41 ** 0..*
    set_addr $I10, rxquantr41_done
    rx36_cur."!mark_push"(0, rx36_pos, $I10)
  rxquantr41_loop:
  # rx enumcharlist negate=0 
    ge rx36_pos, rx36_eos, rx36_fail
    sub $I10, rx36_pos, rx36_off
    substr $S10, rx36_tgt, $I10, 1
    index $I11, "-'", $S10
    lt $I11, 0, rx36_fail
    inc rx36_pos
  # rx subrule "ident" subtype=method negate=
    rx36_cur."!cursor_pos"(rx36_pos)
    $P10 = rx36_cur."ident"()
    unless $P10, rx36_fail
    rx36_pos = $P10."pos"()
    set_addr $I10, rxquantr41_done
    (rx36_rep) = rx36_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr41_done
    rx36_cur."!mark_push"(rx36_rep, rx36_pos, $I10)
    goto rxquantr41_loop
  rxquantr41_done:
  # rx pass
    rx36_cur."!cursor_pass"(rx36_pos, "identifier")
    if_null rx36_debug, debug_391
    rx36_cur."!cursor_debug"("PASS", "identifier", " at pos=", rx36_pos)
  debug_391:
    .return (rx36_cur)
  rx36_restart:
.annotate 'line', 4
    if_null rx36_debug, debug_392
    rx36_cur."!cursor_debug"("NEXT", "identifier")
  debug_392:
  rx36_fail:
    (rx36_rep, rx36_pos, $I10, $P10) = rx36_cur."!mark_fail"(0)
    lt rx36_pos, -1, rx36_done
    eq rx36_pos, -1, rx36_fail
    jump $I10
  rx36_done:
    rx36_cur."!cursor_fail"()
    if_null rx36_debug, debug_393
    rx36_cur."!cursor_debug"("FAIL", "identifier")
  debug_393:
    .return (rx36_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__identifier"  :subid("14_1284728478.15265") :method
.annotate 'line', 4
    $P38 = self."!PREFIX__!subrule"("ident", "")
    new $P39, "ResizablePMCArray"
    push $P39, $P38
    .return ($P39)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx43_tgt
    .local int rx43_pos
    .local int rx43_off
    .local int rx43_eos
    .local int rx43_rep
    .local pmc rx43_cur
    .local pmc rx43_debug
    (rx43_cur, rx43_pos, rx43_tgt, $I10) = self."!cursor_start"()
    rx43_cur."!cursor_caparray"("identifier")
    getattribute rx43_debug, rx43_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx43_cur
    .local pmc match
    .lex "$/", match
    length rx43_eos, rx43_tgt
    gt rx43_pos, rx43_eos, rx43_done
    set rx43_off, 0
    lt rx43_pos, 2, rx43_start
    sub rx43_off, rx43_pos, 1
    substr rx43_tgt, rx43_tgt, rx43_off
  rx43_start:
    eq $I10, 1, rx43_restart
    if_null rx43_debug, debug_394
    rx43_cur."!cursor_debug"("START", "name")
  debug_394:
    $I10 = self.'from'()
    ne $I10, -1, rxscan46_done
    goto rxscan46_scan
  rxscan46_loop:
    ($P10) = rx43_cur."from"()
    inc $P10
    set rx43_pos, $P10
    ge rx43_pos, rx43_eos, rxscan46_done
  rxscan46_scan:
    set_addr $I10, rxscan46_loop
    rx43_cur."!mark_push"(0, rx43_pos, $I10)
  rxscan46_done:
.annotate 'line', 19
  # rx rxquantr47 ** 1..*
    set_addr $I10, rxquantr47_done
    rx43_cur."!mark_push"(0, -1, $I10)
  rxquantr47_loop:
  # rx subrule "identifier" subtype=capture negate=
    rx43_cur."!cursor_pos"(rx43_pos)
    $P10 = rx43_cur."identifier"()
    unless $P10, rx43_fail
    goto rxsubrule48_pass
  rxsubrule48_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx43_fail
  rxsubrule48_pass:
    set_addr $I10, rxsubrule48_back
    rx43_cur."!mark_push"(0, rx43_pos, $I10, $P10)
    $P10."!cursor_names"("identifier")
    rx43_pos = $P10."pos"()
    set_addr $I10, rxquantr47_done
    (rx43_rep) = rx43_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr47_done
    rx43_cur."!mark_push"(rx43_rep, rx43_pos, $I10)
  # rx literal  "::"
    add $I11, rx43_pos, 2
    gt $I11, rx43_eos, rx43_fail
    sub $I11, rx43_pos, rx43_off
    substr $S10, rx43_tgt, $I11, 2
    ne $S10, "::", rx43_fail
    add rx43_pos, 2
    goto rxquantr47_loop
  rxquantr47_done:
  # rx pass
    rx43_cur."!cursor_pass"(rx43_pos, "name")
    if_null rx43_debug, debug_395
    rx43_cur."!cursor_debug"("PASS", "name", " at pos=", rx43_pos)
  debug_395:
    .return (rx43_cur)
  rx43_restart:
.annotate 'line', 4
    if_null rx43_debug, debug_396
    rx43_cur."!cursor_debug"("NEXT", "name")
  debug_396:
  rx43_fail:
    (rx43_rep, rx43_pos, $I10, $P10) = rx43_cur."!mark_fail"(0)
    lt rx43_pos, -1, rx43_done
    eq rx43_pos, -1, rx43_fail
    jump $I10
  rx43_done:
    rx43_cur."!cursor_fail"()
    if_null rx43_debug, debug_397
    rx43_cur."!cursor_debug"("FAIL", "name")
  debug_397:
    .return (rx43_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__name"  :subid("16_1284728478.15265") :method
.annotate 'line', 4
    new $P45, "ResizablePMCArray"
    push $P45, ""
    .return ($P45)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx50_tgt
    .local int rx50_pos
    .local int rx50_off
    .local int rx50_eos
    .local int rx50_rep
    .local pmc rx50_cur
    .local pmc rx50_debug
    (rx50_cur, rx50_pos, rx50_tgt, $I10) = self."!cursor_start"()
    rx50_cur."!cursor_caparray"("colonpair")
    getattribute rx50_debug, rx50_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx50_cur
    .local pmc match
    .lex "$/", match
    length rx50_eos, rx50_tgt
    gt rx50_pos, rx50_eos, rx50_done
    set rx50_off, 0
    lt rx50_pos, 2, rx50_start
    sub rx50_off, rx50_pos, 1
    substr rx50_tgt, rx50_tgt, rx50_off
  rx50_start:
    eq $I10, 1, rx50_restart
    if_null rx50_debug, debug_398
    rx50_cur."!cursor_debug"("START", "deflongname")
  debug_398:
    $I10 = self.'from'()
    ne $I10, -1, rxscan54_done
    goto rxscan54_scan
  rxscan54_loop:
    ($P10) = rx50_cur."from"()
    inc $P10
    set rx50_pos, $P10
    ge rx50_pos, rx50_eos, rxscan54_done
  rxscan54_scan:
    set_addr $I10, rxscan54_loop
    rx50_cur."!mark_push"(0, rx50_pos, $I10)
  rxscan54_done:
.annotate 'line', 22
  # rx subrule "identifier" subtype=capture negate=
    rx50_cur."!cursor_pos"(rx50_pos)
    $P10 = rx50_cur."identifier"()
    unless $P10, rx50_fail
    rx50_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx50_pos = $P10."pos"()
  # rx rxquantr55 ** 0..1
    set_addr $I10, rxquantr55_done
    rx50_cur."!mark_push"(0, rx50_pos, $I10)
  rxquantr55_loop:
  # rx subrule "colonpair" subtype=capture negate=
    rx50_cur."!cursor_pos"(rx50_pos)
    $P10 = rx50_cur."colonpair"()
    unless $P10, rx50_fail
    goto rxsubrule56_pass
  rxsubrule56_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx50_fail
  rxsubrule56_pass:
    set_addr $I10, rxsubrule56_back
    rx50_cur."!mark_push"(0, rx50_pos, $I10, $P10)
    $P10."!cursor_names"("colonpair")
    rx50_pos = $P10."pos"()
    set_addr $I10, rxquantr55_done
    (rx50_rep) = rx50_cur."!mark_commit"($I10)
  rxquantr55_done:
.annotate 'line', 21
  # rx pass
    rx50_cur."!cursor_pass"(rx50_pos, "deflongname")
    if_null rx50_debug, debug_399
    rx50_cur."!cursor_debug"("PASS", "deflongname", " at pos=", rx50_pos)
  debug_399:
    .return (rx50_cur)
  rx50_restart:
.annotate 'line', 4
    if_null rx50_debug, debug_400
    rx50_cur."!cursor_debug"("NEXT", "deflongname")
  debug_400:
  rx50_fail:
    (rx50_rep, rx50_pos, $I10, $P10) = rx50_cur."!mark_fail"(0)
    lt rx50_pos, -1, rx50_done
    eq rx50_pos, -1, rx50_fail
    jump $I10
  rx50_done:
    rx50_cur."!cursor_fail"()
    if_null rx50_debug, debug_401
    rx50_cur."!cursor_debug"("FAIL", "deflongname")
  debug_401:
    .return (rx50_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__deflongname"  :subid("18_1284728478.15265") :method
.annotate 'line', 4
    $P52 = self."!PREFIX__!subrule"("identifier", "")
    new $P53, "ResizablePMCArray"
    push $P53, $P52
    .return ($P53)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx58_tgt
    .local int rx58_pos
    .local int rx58_off
    .local int rx58_eos
    .local int rx58_rep
    .local pmc rx58_cur
    .local pmc rx58_debug
    (rx58_cur, rx58_pos, rx58_tgt, $I10) = self."!cursor_start"()
    getattribute rx58_debug, rx58_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx58_cur
    .local pmc match
    .lex "$/", match
    length rx58_eos, rx58_tgt
    gt rx58_pos, rx58_eos, rx58_done
    set rx58_off, 0
    lt rx58_pos, 2, rx58_start
    sub rx58_off, rx58_pos, 1
    substr rx58_tgt, rx58_tgt, rx58_off
  rx58_start:
    eq $I10, 1, rx58_restart
    if_null rx58_debug, debug_402
    rx58_cur."!cursor_debug"("START", "ENDSTMT")
  debug_402:
    $I10 = self.'from'()
    ne $I10, -1, rxscan61_done
    goto rxscan61_scan
  rxscan61_loop:
    ($P10) = rx58_cur."from"()
    inc $P10
    set rx58_pos, $P10
    ge rx58_pos, rx58_eos, rxscan61_done
  rxscan61_scan:
    set_addr $I10, rxscan61_loop
    rx58_cur."!mark_push"(0, rx58_pos, $I10)
  rxscan61_done:
.annotate 'line', 29
  # rx rxquantr62 ** 0..1
    set_addr $I10, rxquantr62_done
    rx58_cur."!mark_push"(0, rx58_pos, $I10)
  rxquantr62_loop:
  alt63_0:
.annotate 'line', 26
    set_addr $I10, alt63_1
    rx58_cur."!mark_push"(0, rx58_pos, $I10)
.annotate 'line', 27
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx58_pos, rx58_off
    set rx58_rep, 0
    sub $I12, rx58_eos, rx58_pos
  rxenumcharlistq64_loop:
    le $I12, 0, rxenumcharlistq64_done
    substr $S10, rx58_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq64_done
    inc rx58_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq64_loop
  rxenumcharlistq64_done:
    add rx58_pos, rx58_pos, rx58_rep
  # rxanchor eol
    sub $I10, rx58_pos, rx58_off
    is_cclass $I11, 4096, rx58_tgt, $I10
    if $I11, rxanchor65_done
    ne rx58_pos, rx58_eos, rx58_fail
    eq rx58_pos, 0, rxanchor65_done
    dec $I10
    is_cclass $I11, 4096, rx58_tgt, $I10
    if $I11, rx58_fail
  rxanchor65_done:
  # rx subrule "ws" subtype=method negate=
    rx58_cur."!cursor_pos"(rx58_pos)
    $P10 = rx58_cur."ws"()
    unless $P10, rx58_fail
    rx58_pos = $P10."pos"()
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx58_cur."!cursor_pos"(rx58_pos)
    $P10 = rx58_cur."MARKER"("endstmt")
    unless $P10, rx58_fail
    goto alt63_end
  alt63_1:
.annotate 'line', 28
  # rx rxquantr66 ** 0..1
    set_addr $I10, rxquantr66_done
    rx58_cur."!mark_push"(0, rx58_pos, $I10)
  rxquantr66_loop:
  # rx subrule "unv" subtype=method negate=
    rx58_cur."!cursor_pos"(rx58_pos)
    $P10 = rx58_cur."unv"()
    unless $P10, rx58_fail
    goto rxsubrule67_pass
  rxsubrule67_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx58_fail
  rxsubrule67_pass:
    set_addr $I10, rxsubrule67_back
    rx58_cur."!mark_push"(0, rx58_pos, $I10, $P10)
    rx58_pos = $P10."pos"()
    set_addr $I10, rxquantr66_done
    (rx58_rep) = rx58_cur."!mark_commit"($I10)
  rxquantr66_done:
  # rxanchor eol
    sub $I10, rx58_pos, rx58_off
    is_cclass $I11, 4096, rx58_tgt, $I10
    if $I11, rxanchor68_done
    ne rx58_pos, rx58_eos, rx58_fail
    eq rx58_pos, 0, rxanchor68_done
    dec $I10
    is_cclass $I11, 4096, rx58_tgt, $I10
    if $I11, rx58_fail
  rxanchor68_done:
  # rx subrule "ws" subtype=method negate=
    rx58_cur."!cursor_pos"(rx58_pos)
    $P10 = rx58_cur."ws"()
    unless $P10, rx58_fail
    rx58_pos = $P10."pos"()
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx58_cur."!cursor_pos"(rx58_pos)
    $P10 = rx58_cur."MARKER"("endstmt")
    unless $P10, rx58_fail
  alt63_end:
.annotate 'line', 29
    set_addr $I10, rxquantr62_done
    (rx58_rep) = rx58_cur."!mark_commit"($I10)
  rxquantr62_done:
.annotate 'line', 25
  # rx pass
    rx58_cur."!cursor_pass"(rx58_pos, "ENDSTMT")
    if_null rx58_debug, debug_403
    rx58_cur."!cursor_debug"("PASS", "ENDSTMT", " at pos=", rx58_pos)
  debug_403:
    .return (rx58_cur)
  rx58_restart:
.annotate 'line', 4
    if_null rx58_debug, debug_404
    rx58_cur."!cursor_debug"("NEXT", "ENDSTMT")
  debug_404:
  rx58_fail:
    (rx58_rep, rx58_pos, $I10, $P10) = rx58_cur."!mark_fail"(0)
    lt rx58_pos, -1, rx58_done
    eq rx58_pos, -1, rx58_fail
    jump $I10
  rx58_done:
    rx58_cur."!cursor_fail"()
    if_null rx58_debug, debug_405
    rx58_cur."!cursor_debug"("FAIL", "ENDSTMT")
  debug_405:
    .return (rx58_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__ENDSTMT"  :subid("20_1284728478.15265") :method
.annotate 'line', 4
    new $P60, "ResizablePMCArray"
    push $P60, ""
    .return ($P60)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx70_tgt
    .local int rx70_pos
    .local int rx70_off
    .local int rx70_eos
    .local int rx70_rep
    .local pmc rx70_cur
    .local pmc rx70_debug
    (rx70_cur, rx70_pos, rx70_tgt, $I10) = self."!cursor_start"()
    getattribute rx70_debug, rx70_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx70_cur
    .local pmc match
    .lex "$/", match
    length rx70_eos, rx70_tgt
    gt rx70_pos, rx70_eos, rx70_done
    set rx70_off, 0
    lt rx70_pos, 2, rx70_start
    sub rx70_off, rx70_pos, 1
    substr rx70_tgt, rx70_tgt, rx70_off
  rx70_start:
    eq $I10, 1, rx70_restart
    if_null rx70_debug, debug_406
    rx70_cur."!cursor_debug"("START", "ws")
  debug_406:
    $I10 = self.'from'()
    ne $I10, -1, rxscan73_done
    goto rxscan73_scan
  rxscan73_loop:
    ($P10) = rx70_cur."from"()
    inc $P10
    set rx70_pos, $P10
    ge rx70_pos, rx70_eos, rxscan73_done
  rxscan73_scan:
    set_addr $I10, rxscan73_loop
    rx70_cur."!mark_push"(0, rx70_pos, $I10)
  rxscan73_done:
  alt74_0:
.annotate 'line', 32
    set_addr $I10, alt74_1
    rx70_cur."!mark_push"(0, rx70_pos, $I10)
.annotate 'line', 33
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx70_cur."!cursor_pos"(rx70_pos)
    $P10 = rx70_cur."MARKED"("ws")
    unless $P10, rx70_fail
    goto alt74_end
  alt74_1:
.annotate 'line', 34
  # rx subrule "ww" subtype=zerowidth negate=1
    rx70_cur."!cursor_pos"(rx70_pos)
    $P10 = rx70_cur."ww"()
    if $P10, rx70_fail
.annotate 'line', 39
  # rx rxquantr75 ** 0..*
    set_addr $I10, rxquantr75_done
    rx70_cur."!mark_push"(0, rx70_pos, $I10)
  rxquantr75_loop:
  alt76_0:
.annotate 'line', 35
    set_addr $I10, alt76_1
    rx70_cur."!mark_push"(0, rx70_pos, $I10)
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx70_pos, rx70_off
    set rx70_rep, 0
    sub $I12, rx70_eos, rx70_pos
  rxenumcharlistq77_loop:
    le $I12, 0, rxenumcharlistq77_done
    substr $S10, rx70_tgt, $I10, 1
    index $I11, unicode:"\n\x{b}\f\r\x{85}\u2028\u2029", $S10
    lt $I11, 0, rxenumcharlistq77_done
    inc rx70_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq77_loop
  rxenumcharlistq77_done:
    lt rx70_rep, 1, rx70_fail
    add rx70_pos, rx70_pos, rx70_rep
    goto alt76_end
  alt76_1:
    set_addr $I10, alt76_2
    rx70_cur."!mark_push"(0, rx70_pos, $I10)
.annotate 'line', 36
  # rx literal  "#"
    add $I11, rx70_pos, 1
    gt $I11, rx70_eos, rx70_fail
    sub $I11, rx70_pos, rx70_off
    ord $I11, rx70_tgt, $I11
    ne $I11, 35, rx70_fail
    add rx70_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx70_pos, rx70_off
    find_cclass $I11, 4096, rx70_tgt, $I10, rx70_eos
    add rx70_pos, rx70_off, $I11
    goto alt76_end
  alt76_2:
    set_addr $I10, alt76_3
    rx70_cur."!mark_push"(0, rx70_pos, $I10)
.annotate 'line', 37
  # rxanchor bol
    eq rx70_pos, 0, rxanchor78_done
    ge rx70_pos, rx70_eos, rx70_fail
    sub $I10, rx70_pos, rx70_off
    dec $I10
    is_cclass $I11, 4096, rx70_tgt, $I10
    unless $I11, rx70_fail
  rxanchor78_done:
  # rx subrule "pod_comment" subtype=method negate=
    rx70_cur."!cursor_pos"(rx70_pos)
    $P10 = rx70_cur."pod_comment"()
    unless $P10, rx70_fail
    rx70_pos = $P10."pos"()
    goto alt76_end
  alt76_3:
.annotate 'line', 38
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx70_pos, rx70_off
    set rx70_rep, 0
    sub $I12, rx70_eos, rx70_pos
  rxenumcharlistq79_loop:
    le $I12, 0, rxenumcharlistq79_done
    substr $S10, rx70_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq79_done
    inc rx70_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq79_loop
  rxenumcharlistq79_done:
    lt rx70_rep, 1, rx70_fail
    add rx70_pos, rx70_pos, rx70_rep
  alt76_end:
.annotate 'line', 39
    set_addr $I10, rxquantr75_done
    (rx70_rep) = rx70_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr75_done
    rx70_cur."!mark_push"(rx70_rep, rx70_pos, $I10)
    goto rxquantr75_loop
  rxquantr75_done:
.annotate 'line', 40
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx70_cur."!cursor_pos"(rx70_pos)
    $P10 = rx70_cur."MARKER"("ws")
    unless $P10, rx70_fail
  alt74_end:
.annotate 'line', 32
  # rx pass
    rx70_cur."!cursor_pass"(rx70_pos, "ws")
    if_null rx70_debug, debug_407
    rx70_cur."!cursor_debug"("PASS", "ws", " at pos=", rx70_pos)
  debug_407:
    .return (rx70_cur)
  rx70_restart:
.annotate 'line', 4
    if_null rx70_debug, debug_408
    rx70_cur."!cursor_debug"("NEXT", "ws")
  debug_408:
  rx70_fail:
    (rx70_rep, rx70_pos, $I10, $P10) = rx70_cur."!mark_fail"(0)
    lt rx70_pos, -1, rx70_done
    eq rx70_pos, -1, rx70_fail
    jump $I10
  rx70_done:
    rx70_cur."!cursor_fail"()
    if_null rx70_debug, debug_409
    rx70_cur."!cursor_debug"("FAIL", "ws")
  debug_409:
    .return (rx70_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__ws"  :subid("22_1284728478.15265") :method
.annotate 'line', 4
    new $P72, "ResizablePMCArray"
    push $P72, ""
    push $P72, ""
    .return ($P72)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .const 'Sub' $P88 = "25_1284728478.15265" 
    capture_lex $P88
    .local string rx81_tgt
    .local int rx81_pos
    .local int rx81_off
    .local int rx81_eos
    .local int rx81_rep
    .local pmc rx81_cur
    .local pmc rx81_debug
    (rx81_cur, rx81_pos, rx81_tgt, $I10) = self."!cursor_start"()
    getattribute rx81_debug, rx81_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx81_cur
    .local pmc match
    .lex "$/", match
    length rx81_eos, rx81_tgt
    gt rx81_pos, rx81_eos, rx81_done
    set rx81_off, 0
    lt rx81_pos, 2, rx81_start
    sub rx81_off, rx81_pos, 1
    substr rx81_tgt, rx81_tgt, rx81_off
  rx81_start:
    eq $I10, 1, rx81_restart
    if_null rx81_debug, debug_410
    rx81_cur."!cursor_debug"("START", "unv")
  debug_410:
    $I10 = self.'from'()
    ne $I10, -1, rxscan84_done
    goto rxscan84_scan
  rxscan84_loop:
    ($P10) = rx81_cur."from"()
    inc $P10
    set rx81_pos, $P10
    ge rx81_pos, rx81_eos, rxscan84_done
  rxscan84_scan:
    set_addr $I10, rxscan84_loop
    rx81_cur."!mark_push"(0, rx81_pos, $I10)
  rxscan84_done:
  alt85_0:
.annotate 'line', 45
    set_addr $I10, alt85_1
    rx81_cur."!mark_push"(0, rx81_pos, $I10)
.annotate 'line', 46
  # rxanchor bol
    eq rx81_pos, 0, rxanchor86_done
    ge rx81_pos, rx81_eos, rx81_fail
    sub $I10, rx81_pos, rx81_off
    dec $I10
    is_cclass $I11, 4096, rx81_tgt, $I10
    unless $I11, rx81_fail
  rxanchor86_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx81_cur."!cursor_pos"(rx81_pos)
    .const 'Sub' $P88 = "25_1284728478.15265" 
    capture_lex $P88
    $P10 = rx81_cur."before"($P88)
    unless $P10, rx81_fail
  # rx subrule "pod_comment" subtype=method negate=
    rx81_cur."!cursor_pos"(rx81_pos)
    $P10 = rx81_cur."pod_comment"()
    unless $P10, rx81_fail
    rx81_pos = $P10."pos"()
    goto alt85_end
  alt85_1:
    set_addr $I10, alt85_2
    rx81_cur."!mark_push"(0, rx81_pos, $I10)
.annotate 'line', 47
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx81_pos, rx81_off
    set rx81_rep, 0
    sub $I12, rx81_eos, rx81_pos
  rxenumcharlistq93_loop:
    le $I12, 0, rxenumcharlistq93_done
    substr $S10, rx81_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq93_done
    inc rx81_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq93_loop
  rxenumcharlistq93_done:
    add rx81_pos, rx81_pos, rx81_rep
  # rx literal  "#"
    add $I11, rx81_pos, 1
    gt $I11, rx81_eos, rx81_fail
    sub $I11, rx81_pos, rx81_off
    ord $I11, rx81_tgt, $I11
    ne $I11, 35, rx81_fail
    add rx81_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx81_pos, rx81_off
    find_cclass $I11, 4096, rx81_tgt, $I10, rx81_eos
    add rx81_pos, rx81_off, $I11
    goto alt85_end
  alt85_2:
.annotate 'line', 48
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx81_pos, rx81_off
    set rx81_rep, 0
    sub $I12, rx81_eos, rx81_pos
  rxenumcharlistq94_loop:
    le $I12, 0, rxenumcharlistq94_done
    substr $S10, rx81_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq94_done
    inc rx81_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq94_loop
  rxenumcharlistq94_done:
    lt rx81_rep, 1, rx81_fail
    add rx81_pos, rx81_pos, rx81_rep
  alt85_end:
.annotate 'line', 43
  # rx pass
    rx81_cur."!cursor_pass"(rx81_pos, "unv")
    if_null rx81_debug, debug_415
    rx81_cur."!cursor_debug"("PASS", "unv", " at pos=", rx81_pos)
  debug_415:
    .return (rx81_cur)
  rx81_restart:
.annotate 'line', 4
    if_null rx81_debug, debug_416
    rx81_cur."!cursor_debug"("NEXT", "unv")
  debug_416:
  rx81_fail:
    (rx81_rep, rx81_pos, $I10, $P10) = rx81_cur."!mark_fail"(0)
    lt rx81_pos, -1, rx81_done
    eq rx81_pos, -1, rx81_fail
    jump $I10
  rx81_done:
    rx81_cur."!cursor_fail"()
    if_null rx81_debug, debug_417
    rx81_cur."!cursor_debug"("FAIL", "unv")
  debug_417:
    .return (rx81_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__unv"  :subid("24_1284728478.15265") :method
.annotate 'line', 4
    new $P83, "ResizablePMCArray"
    push $P83, ""
    push $P83, ""
    push $P83, ""
    .return ($P83)
.end


.namespace ["NQP";"Grammar"]
.sub "_block87"  :anon :subid("25_1284728478.15265") :method :outer("23_1284728478.15265")
.annotate 'line', 46
    .local string rx89_tgt
    .local int rx89_pos
    .local int rx89_off
    .local int rx89_eos
    .local int rx89_rep
    .local pmc rx89_cur
    .local pmc rx89_debug
    (rx89_cur, rx89_pos, rx89_tgt, $I10) = self."!cursor_start"()
    getattribute rx89_debug, rx89_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx89_cur
    .local pmc match
    .lex "$/", match
    length rx89_eos, rx89_tgt
    gt rx89_pos, rx89_eos, rx89_done
    set rx89_off, 0
    lt rx89_pos, 2, rx89_start
    sub rx89_off, rx89_pos, 1
    substr rx89_tgt, rx89_tgt, rx89_off
  rx89_start:
    eq $I10, 1, rx89_restart
    if_null rx89_debug, debug_411
    rx89_cur."!cursor_debug"("START", "")
  debug_411:
    $I10 = self.'from'()
    ne $I10, -1, rxscan90_done
    goto rxscan90_scan
  rxscan90_loop:
    ($P10) = rx89_cur."from"()
    inc $P10
    set rx89_pos, $P10
    ge rx89_pos, rx89_eos, rxscan90_done
  rxscan90_scan:
    set_addr $I10, rxscan90_loop
    rx89_cur."!mark_push"(0, rx89_pos, $I10)
  rxscan90_done:
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx89_pos, rx89_off
    set rx89_rep, 0
    sub $I12, rx89_eos, rx89_pos
  rxenumcharlistq91_loop:
    le $I12, 0, rxenumcharlistq91_done
    substr $S10, rx89_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq91_done
    inc rx89_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq91_loop
  rxenumcharlistq91_done:
    add rx89_pos, rx89_pos, rx89_rep
  # rx literal  "="
    add $I11, rx89_pos, 1
    gt $I11, rx89_eos, rx89_fail
    sub $I11, rx89_pos, rx89_off
    ord $I11, rx89_tgt, $I11
    ne $I11, 61, rx89_fail
    add rx89_pos, 1
  alt92_0:
    set_addr $I10, alt92_1
    rx89_cur."!mark_push"(0, rx89_pos, $I10)
  # rx charclass w
    ge rx89_pos, rx89_eos, rx89_fail
    sub $I10, rx89_pos, rx89_off
    is_cclass $I11, 8192, rx89_tgt, $I10
    unless $I11, rx89_fail
    inc rx89_pos
    goto alt92_end
  alt92_1:
  # rx literal  "\\"
    add $I11, rx89_pos, 1
    gt $I11, rx89_eos, rx89_fail
    sub $I11, rx89_pos, rx89_off
    ord $I11, rx89_tgt, $I11
    ne $I11, 92, rx89_fail
    add rx89_pos, 1
  alt92_end:
  # rx pass
    rx89_cur."!cursor_pass"(rx89_pos, "")
    if_null rx89_debug, debug_412
    rx89_cur."!cursor_debug"("PASS", "", " at pos=", rx89_pos)
  debug_412:
    .return (rx89_cur)
  rx89_restart:
    if_null rx89_debug, debug_413
    rx89_cur."!cursor_debug"("NEXT", "")
  debug_413:
  rx89_fail:
    (rx89_rep, rx89_pos, $I10, $P10) = rx89_cur."!mark_fail"(0)
    lt rx89_pos, -1, rx89_done
    eq rx89_pos, -1, rx89_fail
    jump $I10
  rx89_done:
    rx89_cur."!cursor_fail"()
    if_null rx89_debug, debug_414
    rx89_cur."!cursor_debug"("FAIL", "")
  debug_414:
    .return (rx89_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "pod_comment"  :subid("26_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .const 'Sub' $P127 = "28_1284728478.15265" 
    capture_lex $P127
    .local string rx96_tgt
    .local int rx96_pos
    .local int rx96_off
    .local int rx96_eos
    .local int rx96_rep
    .local pmc rx96_cur
    .local pmc rx96_debug
    (rx96_cur, rx96_pos, rx96_tgt, $I10) = self."!cursor_start"()
    getattribute rx96_debug, rx96_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx96_cur
    .local pmc match
    .lex "$/", match
    length rx96_eos, rx96_tgt
    gt rx96_pos, rx96_eos, rx96_done
    set rx96_off, 0
    lt rx96_pos, 2, rx96_start
    sub rx96_off, rx96_pos, 1
    substr rx96_tgt, rx96_tgt, rx96_off
  rx96_start:
    eq $I10, 1, rx96_restart
    if_null rx96_debug, debug_418
    rx96_cur."!cursor_debug"("START", "pod_comment")
  debug_418:
    $I10 = self.'from'()
    ne $I10, -1, rxscan99_done
    goto rxscan99_scan
  rxscan99_loop:
    ($P10) = rx96_cur."from"()
    inc $P10
    set rx96_pos, $P10
    ge rx96_pos, rx96_eos, rxscan99_done
  rxscan99_scan:
    set_addr $I10, rxscan99_loop
    rx96_cur."!mark_push"(0, rx96_pos, $I10)
  rxscan99_done:
.annotate 'line', 53
  # rxanchor bol
    eq rx96_pos, 0, rxanchor100_done
    ge rx96_pos, rx96_eos, rx96_fail
    sub $I10, rx96_pos, rx96_off
    dec $I10
    is_cclass $I11, 4096, rx96_tgt, $I10
    unless $I11, rx96_fail
  rxanchor100_done:
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx96_pos, rx96_off
    set rx96_rep, 0
    sub $I12, rx96_eos, rx96_pos
  rxenumcharlistq101_loop:
    le $I12, 0, rxenumcharlistq101_done
    substr $S10, rx96_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq101_done
    inc rx96_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq101_loop
  rxenumcharlistq101_done:
    add rx96_pos, rx96_pos, rx96_rep
  # rx literal  "="
    add $I11, rx96_pos, 1
    gt $I11, rx96_eos, rx96_fail
    sub $I11, rx96_pos, rx96_off
    ord $I11, rx96_tgt, $I11
    ne $I11, 61, rx96_fail
    add rx96_pos, 1
  alt102_0:
.annotate 'line', 54
    set_addr $I10, alt102_1
    rx96_cur."!mark_push"(0, rx96_pos, $I10)
.annotate 'line', 55
  # rx literal  "begin"
    add $I11, rx96_pos, 5
    gt $I11, rx96_eos, rx96_fail
    sub $I11, rx96_pos, rx96_off
    substr $S10, rx96_tgt, $I11, 5
    ne $S10, "begin", rx96_fail
    add rx96_pos, 5
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx96_pos, rx96_off
    set rx96_rep, 0
    sub $I12, rx96_eos, rx96_pos
  rxenumcharlistq103_loop:
    le $I12, 0, rxenumcharlistq103_done
    substr $S10, rx96_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq103_done
    inc rx96_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq103_loop
  rxenumcharlistq103_done:
    lt rx96_rep, 1, rx96_fail
    add rx96_pos, rx96_pos, rx96_rep
  # rx literal  "END"
    add $I11, rx96_pos, 3
    gt $I11, rx96_eos, rx96_fail
    sub $I11, rx96_pos, rx96_off
    substr $S10, rx96_tgt, $I11, 3
    ne $S10, "END", rx96_fail
    add rx96_pos, 3
  # rxanchor rwb
    le rx96_pos, 0, rx96_fail
    sub $I10, rx96_pos, rx96_off
    is_cclass $I11, 8192, rx96_tgt, $I10
    if $I11, rx96_fail
    dec $I10
    is_cclass $I11, 8192, rx96_tgt, $I10
    unless $I11, rx96_fail
  alt104_0:
.annotate 'line', 56
    set_addr $I10, alt104_1
    rx96_cur."!mark_push"(0, rx96_pos, $I10)
  # rx rxquantf105 ** 0..*
    set_addr $I10, rxquantf105_loop
    rx96_cur."!mark_push"(0, rx96_pos, $I10)
    goto rxquantf105_done
  rxquantf105_loop:
  # rx charclass .
    ge rx96_pos, rx96_eos, rx96_fail
    inc rx96_pos
    set_addr $I10, rxquantf105_loop
    rx96_cur."!mark_push"(rx96_rep, rx96_pos, $I10)
  rxquantf105_done:
  # rx charclass nl
    ge rx96_pos, rx96_eos, rx96_fail
    sub $I10, rx96_pos, rx96_off
    is_cclass $I11, 4096, rx96_tgt, $I10
    unless $I11, rx96_fail
    substr $S10, rx96_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx96_pos, $I11
    inc rx96_pos
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx96_pos, rx96_off
    set rx96_rep, 0
    sub $I12, rx96_eos, rx96_pos
  rxenumcharlistq107_loop:
    le $I12, 0, rxenumcharlistq107_done
    substr $S10, rx96_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq107_done
    inc rx96_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq107_loop
  rxenumcharlistq107_done:
    add rx96_pos, rx96_pos, rx96_rep
  # rx literal  "=end"
    add $I11, rx96_pos, 4
    gt $I11, rx96_eos, rx96_fail
    sub $I11, rx96_pos, rx96_off
    substr $S10, rx96_tgt, $I11, 4
    ne $S10, "=end", rx96_fail
    add rx96_pos, 4
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx96_pos, rx96_off
    set rx96_rep, 0
    sub $I12, rx96_eos, rx96_pos
  rxenumcharlistq108_loop:
    le $I12, 0, rxenumcharlistq108_done
    substr $S10, rx96_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq108_done
    inc rx96_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq108_loop
  rxenumcharlistq108_done:
    lt rx96_rep, 1, rx96_fail
    add rx96_pos, rx96_pos, rx96_rep
  # rx literal  "END"
    add $I11, rx96_pos, 3
    gt $I11, rx96_eos, rx96_fail
    sub $I11, rx96_pos, rx96_off
    substr $S10, rx96_tgt, $I11, 3
    ne $S10, "END", rx96_fail
    add rx96_pos, 3
  # rxanchor rwb
    le rx96_pos, 0, rx96_fail
    sub $I10, rx96_pos, rx96_off
    is_cclass $I11, 8192, rx96_tgt, $I10
    if $I11, rx96_fail
    dec $I10
    is_cclass $I11, 8192, rx96_tgt, $I10
    unless $I11, rx96_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx96_pos, rx96_off
    find_cclass $I11, 4096, rx96_tgt, $I10, rx96_eos
    add rx96_pos, rx96_off, $I11
    goto alt104_end
  alt104_1:
  # rx charclass_q . r 0..-1
    sub $I10, rx96_pos, rx96_off
    find_not_cclass $I11, 65535, rx96_tgt, $I10, rx96_eos
    add rx96_pos, rx96_off, $I11
  alt104_end:
.annotate 'line', 55
    goto alt102_end
  alt102_1:
    set_addr $I10, alt102_2
    rx96_cur."!mark_push"(0, rx96_pos, $I10)
.annotate 'line', 57
  # rx literal  "begin"
    add $I11, rx96_pos, 5
    gt $I11, rx96_eos, rx96_fail
    sub $I11, rx96_pos, rx96_off
    substr $S10, rx96_tgt, $I11, 5
    ne $S10, "begin", rx96_fail
    add rx96_pos, 5
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx96_pos, rx96_off
    set rx96_rep, 0
    sub $I12, rx96_eos, rx96_pos
  rxenumcharlistq109_loop:
    le $I12, 0, rxenumcharlistq109_done
    substr $S10, rx96_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq109_done
    inc rx96_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq109_loop
  rxenumcharlistq109_done:
    lt rx96_rep, 1, rx96_fail
    add rx96_pos, rx96_pos, rx96_rep
  # rx subrule "identifier" subtype=capture negate=
    rx96_cur."!cursor_pos"(rx96_pos)
    $P10 = rx96_cur."identifier"()
    unless $P10, rx96_fail
    rx96_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx96_pos = $P10."pos"()
  alt110_0:
.annotate 'line', 58
    set_addr $I10, alt110_1
    rx96_cur."!mark_push"(0, rx96_pos, $I10)
.annotate 'line', 59
  # rx rxquantf111 ** 0..*
    set_addr $I10, rxquantf111_loop
    rx96_cur."!mark_push"(0, rx96_pos, $I10)
    goto rxquantf111_done
  rxquantf111_loop:
  # rx charclass .
    ge rx96_pos, rx96_eos, rx96_fail
    inc rx96_pos
    set_addr $I10, rxquantf111_loop
    rx96_cur."!mark_push"(rx96_rep, rx96_pos, $I10)
  rxquantf111_done:
  # rx charclass nl
    ge rx96_pos, rx96_eos, rx96_fail
    sub $I10, rx96_pos, rx96_off
    is_cclass $I11, 4096, rx96_tgt, $I10
    unless $I11, rx96_fail
    substr $S10, rx96_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx96_pos, $I11
    inc rx96_pos
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx96_pos, rx96_off
    set rx96_rep, 0
    sub $I12, rx96_eos, rx96_pos
  rxenumcharlistq113_loop:
    le $I12, 0, rxenumcharlistq113_done
    substr $S10, rx96_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq113_done
    inc rx96_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq113_loop
  rxenumcharlistq113_done:
    add rx96_pos, rx96_pos, rx96_rep
  # rx literal  "=end"
    add $I11, rx96_pos, 4
    gt $I11, rx96_eos, rx96_fail
    sub $I11, rx96_pos, rx96_off
    substr $S10, rx96_tgt, $I11, 4
    ne $S10, "=end", rx96_fail
    add rx96_pos, 4
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx96_pos, rx96_off
    set rx96_rep, 0
    sub $I12, rx96_eos, rx96_pos
  rxenumcharlistq114_loop:
    le $I12, 0, rxenumcharlistq114_done
    substr $S10, rx96_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq114_done
    inc rx96_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq114_loop
  rxenumcharlistq114_done:
    lt rx96_rep, 1, rx96_fail
    add rx96_pos, rx96_pos, rx96_rep
  # rx subrule "!BACKREF" subtype=method negate=
    rx96_cur."!cursor_pos"(rx96_pos)
    $P10 = rx96_cur."!BACKREF"("identifier")
    unless $P10, rx96_fail
    rx96_pos = $P10."pos"()
  # rxanchor rwb
    le rx96_pos, 0, rx96_fail
    sub $I10, rx96_pos, rx96_off
    is_cclass $I11, 8192, rx96_tgt, $I10
    if $I11, rx96_fail
    dec $I10
    is_cclass $I11, 8192, rx96_tgt, $I10
    unless $I11, rx96_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx96_pos, rx96_off
    find_cclass $I11, 4096, rx96_tgt, $I10, rx96_eos
    add rx96_pos, rx96_off, $I11
    goto alt110_end
  alt110_1:
.annotate 'line', 60
  # rx subrule "panic" subtype=method negate=
    rx96_cur."!cursor_pos"(rx96_pos)
    $P10 = rx96_cur."panic"("=begin without matching =end")
    unless $P10, rx96_fail
    rx96_pos = $P10."pos"()
  alt110_end:
.annotate 'line', 57
    goto alt102_end
  alt102_2:
    set_addr $I10, alt102_3
    rx96_cur."!mark_push"(0, rx96_pos, $I10)
.annotate 'line', 62
  # rx literal  "begin"
    add $I11, rx96_pos, 5
    gt $I11, rx96_eos, rx96_fail
    sub $I11, rx96_pos, rx96_off
    substr $S10, rx96_tgt, $I11, 5
    ne $S10, "begin", rx96_fail
    add rx96_pos, 5
  # rxanchor rwb
    le rx96_pos, 0, rx96_fail
    sub $I10, rx96_pos, rx96_off
    is_cclass $I11, 8192, rx96_tgt, $I10
    if $I11, rx96_fail
    dec $I10
    is_cclass $I11, 8192, rx96_tgt, $I10
    unless $I11, rx96_fail
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx96_pos, rx96_off
    set rx96_rep, 0
    sub $I12, rx96_eos, rx96_pos
  rxenumcharlistq116_loop:
    le $I12, 0, rxenumcharlistq116_done
    substr $S10, rx96_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq116_done
    inc rx96_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq116_loop
  rxenumcharlistq116_done:
    add rx96_pos, rx96_pos, rx96_rep
  alt117_0:
.annotate 'line', 63
    set_addr $I10, alt117_1
    rx96_cur."!mark_push"(0, rx96_pos, $I10)
  # rxanchor eol
    sub $I10, rx96_pos, rx96_off
    is_cclass $I11, 4096, rx96_tgt, $I10
    if $I11, rxanchor118_done
    ne rx96_pos, rx96_eos, rx96_fail
    eq rx96_pos, 0, rxanchor118_done
    dec $I10
    is_cclass $I11, 4096, rx96_tgt, $I10
    if $I11, rx96_fail
  rxanchor118_done:
    goto alt117_end
  alt117_1:
    set_addr $I10, alt117_2
    rx96_cur."!mark_push"(0, rx96_pos, $I10)
  # rx literal  "#"
    add $I11, rx96_pos, 1
    gt $I11, rx96_eos, rx96_fail
    sub $I11, rx96_pos, rx96_off
    ord $I11, rx96_tgt, $I11
    ne $I11, 35, rx96_fail
    add rx96_pos, 1
    goto alt117_end
  alt117_2:
  # rx subrule "panic" subtype=method negate=
    rx96_cur."!cursor_pos"(rx96_pos)
    $P10 = rx96_cur."panic"("Unrecognized token after =begin")
    unless $P10, rx96_fail
    rx96_pos = $P10."pos"()
  alt117_end:
  alt119_0:
.annotate 'line', 64
    set_addr $I10, alt119_1
    rx96_cur."!mark_push"(0, rx96_pos, $I10)
.annotate 'line', 65
  # rx rxquantf120 ** 0..*
    set_addr $I10, rxquantf120_loop
    rx96_cur."!mark_push"(0, rx96_pos, $I10)
    goto rxquantf120_done
  rxquantf120_loop:
  # rx charclass .
    ge rx96_pos, rx96_eos, rx96_fail
    inc rx96_pos
    set_addr $I10, rxquantf120_loop
    rx96_cur."!mark_push"(rx96_rep, rx96_pos, $I10)
  rxquantf120_done:
  # rx charclass nl
    ge rx96_pos, rx96_eos, rx96_fail
    sub $I10, rx96_pos, rx96_off
    is_cclass $I11, 4096, rx96_tgt, $I10
    unless $I11, rx96_fail
    substr $S10, rx96_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx96_pos, $I11
    inc rx96_pos
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx96_pos, rx96_off
    set rx96_rep, 0
    sub $I12, rx96_eos, rx96_pos
  rxenumcharlistq122_loop:
    le $I12, 0, rxenumcharlistq122_done
    substr $S10, rx96_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq122_done
    inc rx96_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq122_loop
  rxenumcharlistq122_done:
    add rx96_pos, rx96_pos, rx96_rep
  # rx literal  "=end"
    add $I11, rx96_pos, 4
    gt $I11, rx96_eos, rx96_fail
    sub $I11, rx96_pos, rx96_off
    substr $S10, rx96_tgt, $I11, 4
    ne $S10, "=end", rx96_fail
    add rx96_pos, 4
  # rxanchor rwb
    le rx96_pos, 0, rx96_fail
    sub $I10, rx96_pos, rx96_off
    is_cclass $I11, 8192, rx96_tgt, $I10
    if $I11, rx96_fail
    dec $I10
    is_cclass $I11, 8192, rx96_tgt, $I10
    unless $I11, rx96_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx96_pos, rx96_off
    find_cclass $I11, 4096, rx96_tgt, $I10, rx96_eos
    add rx96_pos, rx96_off, $I11
    goto alt119_end
  alt119_1:
.annotate 'line', 66
  # rx subrule "panic" subtype=method negate=
    rx96_cur."!cursor_pos"(rx96_pos)
    $P10 = rx96_cur."panic"("=begin without matching =end")
    unless $P10, rx96_fail
    rx96_pos = $P10."pos"()
  alt119_end:
.annotate 'line', 62
    goto alt102_end
  alt102_3:
    set_addr $I10, alt102_4
    rx96_cur."!mark_push"(0, rx96_pos, $I10)
.annotate 'line', 68
  # rx subrule "identifier" subtype=capture negate=
    rx96_cur."!cursor_pos"(rx96_pos)
    $P10 = rx96_cur."identifier"()
    unless $P10, rx96_fail
    rx96_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx96_pos = $P10."pos"()
.annotate 'line', 69
  # rx rxquantf123 ** 0..*
    set_addr $I10, rxquantf123_loop
    rx96_cur."!mark_push"(0, rx96_pos, $I10)
    goto rxquantf123_done
  rxquantf123_loop:
  # rx charclass .
    ge rx96_pos, rx96_eos, rx96_fail
    inc rx96_pos
    set_addr $I10, rxquantf123_loop
    rx96_cur."!mark_push"(rx96_rep, rx96_pos, $I10)
  rxquantf123_done:
  # rxanchor bol
    eq rx96_pos, 0, rxanchor125_done
    ge rx96_pos, rx96_eos, rx96_fail
    sub $I10, rx96_pos, rx96_off
    dec $I10
    is_cclass $I11, 4096, rx96_tgt, $I10
    unless $I11, rx96_fail
  rxanchor125_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx96_cur."!cursor_pos"(rx96_pos)
    .const 'Sub' $P127 = "28_1284728478.15265" 
    capture_lex $P127
    $P10 = rx96_cur."before"($P127)
    unless $P10, rx96_fail
.annotate 'line', 68
    goto alt102_end
  alt102_4:
  alt133_0:
.annotate 'line', 75
    set_addr $I10, alt133_1
    rx96_cur."!mark_push"(0, rx96_pos, $I10)
  # rx charclass s
    ge rx96_pos, rx96_eos, rx96_fail
    sub $I10, rx96_pos, rx96_off
    is_cclass $I11, 32, rx96_tgt, $I10
    unless $I11, rx96_fail
    inc rx96_pos
    goto alt133_end
  alt133_1:
  # rx subrule "panic" subtype=method negate=
    rx96_cur."!cursor_pos"(rx96_pos)
    $P10 = rx96_cur."panic"("Illegal pod directive")
    unless $P10, rx96_fail
    rx96_pos = $P10."pos"()
  alt133_end:
.annotate 'line', 76
  # rx charclass_q N r 0..-1
    sub $I10, rx96_pos, rx96_off
    find_cclass $I11, 4096, rx96_tgt, $I10, rx96_eos
    add rx96_pos, rx96_off, $I11
  alt102_end:
.annotate 'line', 52
  # rx pass
    rx96_cur."!cursor_pass"(rx96_pos, "pod_comment")
    if_null rx96_debug, debug_423
    rx96_cur."!cursor_debug"("PASS", "pod_comment", " at pos=", rx96_pos)
  debug_423:
    .return (rx96_cur)
  rx96_restart:
.annotate 'line', 4
    if_null rx96_debug, debug_424
    rx96_cur."!cursor_debug"("NEXT", "pod_comment")
  debug_424:
  rx96_fail:
    (rx96_rep, rx96_pos, $I10, $P10) = rx96_cur."!mark_fail"(0)
    lt rx96_pos, -1, rx96_done
    eq rx96_pos, -1, rx96_fail
    jump $I10
  rx96_done:
    rx96_cur."!cursor_fail"()
    if_null rx96_debug, debug_425
    rx96_cur."!cursor_debug"("FAIL", "pod_comment")
  debug_425:
    .return (rx96_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pod_comment"  :subid("27_1284728478.15265") :method
.annotate 'line', 4
    new $P98, "ResizablePMCArray"
    push $P98, ""
    .return ($P98)
.end


.namespace ["NQP";"Grammar"]
.sub "_block126"  :anon :subid("28_1284728478.15265") :method :outer("26_1284728478.15265")
.annotate 'line', 69
    .local string rx128_tgt
    .local int rx128_pos
    .local int rx128_off
    .local int rx128_eos
    .local int rx128_rep
    .local pmc rx128_cur
    .local pmc rx128_debug
    (rx128_cur, rx128_pos, rx128_tgt, $I10) = self."!cursor_start"()
    getattribute rx128_debug, rx128_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx128_cur
    .local pmc match
    .lex "$/", match
    length rx128_eos, rx128_tgt
    gt rx128_pos, rx128_eos, rx128_done
    set rx128_off, 0
    lt rx128_pos, 2, rx128_start
    sub rx128_off, rx128_pos, 1
    substr rx128_tgt, rx128_tgt, rx128_off
  rx128_start:
    eq $I10, 1, rx128_restart
    if_null rx128_debug, debug_419
    rx128_cur."!cursor_debug"("START", "")
  debug_419:
    $I10 = self.'from'()
    ne $I10, -1, rxscan129_done
    goto rxscan129_scan
  rxscan129_loop:
    ($P10) = rx128_cur."from"()
    inc $P10
    set rx128_pos, $P10
    ge rx128_pos, rx128_eos, rxscan129_done
  rxscan129_scan:
    set_addr $I10, rxscan129_loop
    rx128_cur."!mark_push"(0, rx128_pos, $I10)
  rxscan129_done:
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx128_pos, rx128_off
    set rx128_rep, 0
    sub $I12, rx128_eos, rx128_pos
  rxenumcharlistq130_loop:
    le $I12, 0, rxenumcharlistq130_done
    substr $S10, rx128_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq130_done
    inc rx128_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq130_loop
  rxenumcharlistq130_done:
    add rx128_pos, rx128_pos, rx128_rep
  alt131_0:
    set_addr $I10, alt131_1
    rx128_cur."!mark_push"(0, rx128_pos, $I10)
.annotate 'line', 70
  # rx literal  "="
    add $I11, rx128_pos, 1
    gt $I11, rx128_eos, rx128_fail
    sub $I11, rx128_pos, rx128_off
    ord $I11, rx128_tgt, $I11
    ne $I11, 61, rx128_fail
    add rx128_pos, 1
.annotate 'line', 72
  # rx rxquantr132 ** 0..1
    set_addr $I10, rxquantr132_done
    rx128_cur."!mark_push"(0, rx128_pos, $I10)
  rxquantr132_loop:
.annotate 'line', 71
  # rx literal  "cut"
    add $I11, rx128_pos, 3
    gt $I11, rx128_eos, rx128_fail
    sub $I11, rx128_pos, rx128_off
    substr $S10, rx128_tgt, $I11, 3
    ne $S10, "cut", rx128_fail
    add rx128_pos, 3
  # rxanchor rwb
    le rx128_pos, 0, rx128_fail
    sub $I10, rx128_pos, rx128_off
    is_cclass $I11, 8192, rx128_tgt, $I10
    if $I11, rx128_fail
    dec $I10
    is_cclass $I11, 8192, rx128_tgt, $I10
    unless $I11, rx128_fail
.annotate 'line', 72
  # rx subrule "panic" subtype=method negate=
    rx128_cur."!cursor_pos"(rx128_pos)
    $P10 = rx128_cur."panic"("Obsolete pod format, please use =begin/=end instead")
    unless $P10, rx128_fail
    rx128_pos = $P10."pos"()
    set_addr $I10, rxquantr132_done
    (rx128_rep) = rx128_cur."!mark_commit"($I10)
  rxquantr132_done:
.annotate 'line', 69
    goto alt131_end
  alt131_1:
.annotate 'line', 73
  # rx charclass nl
    ge rx128_pos, rx128_eos, rx128_fail
    sub $I10, rx128_pos, rx128_off
    is_cclass $I11, 4096, rx128_tgt, $I10
    unless $I11, rx128_fail
    substr $S10, rx128_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx128_pos, $I11
    inc rx128_pos
  alt131_end:
.annotate 'line', 69
  # rx pass
    rx128_cur."!cursor_pass"(rx128_pos, "")
    if_null rx128_debug, debug_420
    rx128_cur."!cursor_debug"("PASS", "", " at pos=", rx128_pos)
  debug_420:
    .return (rx128_cur)
  rx128_restart:
    if_null rx128_debug, debug_421
    rx128_cur."!cursor_debug"("NEXT", "")
  debug_421:
  rx128_fail:
    (rx128_rep, rx128_pos, $I10, $P10) = rx128_cur."!mark_fail"(0)
    lt rx128_pos, -1, rx128_done
    eq rx128_pos, -1, rx128_fail
    jump $I10
  rx128_done:
    rx128_cur."!cursor_fail"()
    if_null rx128_debug, debug_422
    rx128_cur."!cursor_debug"("FAIL", "")
  debug_422:
    .return (rx128_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "comp_unit"  :subid("29_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx135_tgt
    .local int rx135_pos
    .local int rx135_off
    .local int rx135_eos
    .local int rx135_rep
    .local pmc rx135_cur
    .local pmc rx135_debug
    (rx135_cur, rx135_pos, rx135_tgt, $I10) = self."!cursor_start"()
    getattribute rx135_debug, rx135_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx135_cur
    .local pmc match
    .lex "$/", match
    length rx135_eos, rx135_tgt
    gt rx135_pos, rx135_eos, rx135_done
    set rx135_off, 0
    lt rx135_pos, 2, rx135_start
    sub rx135_off, rx135_pos, 1
    substr rx135_tgt, rx135_tgt, rx135_off
  rx135_start:
    eq $I10, 1, rx135_restart
    if_null rx135_debug, debug_426
    rx135_cur."!cursor_debug"("START", "comp_unit")
  debug_426:
    $I10 = self.'from'()
    ne $I10, -1, rxscan139_done
    goto rxscan139_scan
  rxscan139_loop:
    ($P10) = rx135_cur."from"()
    inc $P10
    set rx135_pos, $P10
    ge rx135_pos, rx135_eos, rxscan139_done
  rxscan139_scan:
    set_addr $I10, rxscan139_loop
    rx135_cur."!mark_push"(0, rx135_pos, $I10)
  rxscan139_done:
.annotate 'line', 84
  # rx subrule "newpad" subtype=method negate=
    rx135_cur."!cursor_pos"(rx135_pos)
    $P10 = rx135_cur."newpad"()
    unless $P10, rx135_fail
    rx135_pos = $P10."pos"()
.annotate 'line', 85
  # rx subrule "outerctx" subtype=method negate=
    rx135_cur."!cursor_pos"(rx135_pos)
    $P10 = rx135_cur."outerctx"()
    unless $P10, rx135_fail
    rx135_pos = $P10."pos"()
.annotate 'line', 86
  # rx subrule "statementlist" subtype=capture negate=
    rx135_cur."!cursor_pos"(rx135_pos)
    $P10 = rx135_cur."statementlist"()
    unless $P10, rx135_fail
    rx135_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx135_pos = $P10."pos"()
  alt140_0:
.annotate 'line', 87
    set_addr $I10, alt140_1
    rx135_cur."!mark_push"(0, rx135_pos, $I10)
  # rxanchor eos
    ne rx135_pos, rx135_eos, rx135_fail
    goto alt140_end
  alt140_1:
  # rx subrule "panic" subtype=method negate=
    rx135_cur."!cursor_pos"(rx135_pos)
    $P10 = rx135_cur."panic"("Confused")
    unless $P10, rx135_fail
    rx135_pos = $P10."pos"()
  alt140_end:
.annotate 'line', 83
  # rx pass
    rx135_cur."!cursor_pass"(rx135_pos, "comp_unit")
    if_null rx135_debug, debug_427
    rx135_cur."!cursor_debug"("PASS", "comp_unit", " at pos=", rx135_pos)
  debug_427:
    .return (rx135_cur)
  rx135_restart:
.annotate 'line', 4
    if_null rx135_debug, debug_428
    rx135_cur."!cursor_debug"("NEXT", "comp_unit")
  debug_428:
  rx135_fail:
    (rx135_rep, rx135_pos, $I10, $P10) = rx135_cur."!mark_fail"(0)
    lt rx135_pos, -1, rx135_done
    eq rx135_pos, -1, rx135_fail
    jump $I10
  rx135_done:
    rx135_cur."!cursor_fail"()
    if_null rx135_debug, debug_429
    rx135_cur."!cursor_debug"("FAIL", "comp_unit")
  debug_429:
    .return (rx135_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__comp_unit"  :subid("30_1284728478.15265") :method
.annotate 'line', 4
    $P137 = self."!PREFIX__!subrule"("newpad", "")
    new $P138, "ResizablePMCArray"
    push $P138, $P137
    .return ($P138)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx142_tgt
    .local int rx142_pos
    .local int rx142_off
    .local int rx142_eos
    .local int rx142_rep
    .local pmc rx142_cur
    .local pmc rx142_debug
    (rx142_cur, rx142_pos, rx142_tgt, $I10) = self."!cursor_start"()
    rx142_cur."!cursor_caparray"("statement")
    getattribute rx142_debug, rx142_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx142_cur
    .local pmc match
    .lex "$/", match
    length rx142_eos, rx142_tgt
    gt rx142_pos, rx142_eos, rx142_done
    set rx142_off, 0
    lt rx142_pos, 2, rx142_start
    sub rx142_off, rx142_pos, 1
    substr rx142_tgt, rx142_tgt, rx142_off
  rx142_start:
    eq $I10, 1, rx142_restart
    if_null rx142_debug, debug_430
    rx142_cur."!cursor_debug"("START", "statementlist")
  debug_430:
    $I10 = self.'from'()
    ne $I10, -1, rxscan147_done
    goto rxscan147_scan
  rxscan147_loop:
    ($P10) = rx142_cur."from"()
    inc $P10
    set rx142_pos, $P10
    ge rx142_pos, rx142_eos, rxscan147_done
  rxscan147_scan:
    set_addr $I10, rxscan147_loop
    rx142_cur."!mark_push"(0, rx142_pos, $I10)
  rxscan147_done:
  alt148_0:
.annotate 'line', 90
    set_addr $I10, alt148_1
    rx142_cur."!mark_push"(0, rx142_pos, $I10)
.annotate 'line', 91
  # rx subrule "ws" subtype=method negate=
    rx142_cur."!cursor_pos"(rx142_pos)
    $P10 = rx142_cur."ws"()
    unless $P10, rx142_fail
    rx142_pos = $P10."pos"()
  # rxanchor eos
    ne rx142_pos, rx142_eos, rx142_fail
  # rx subrule "ws" subtype=method negate=
    rx142_cur."!cursor_pos"(rx142_pos)
    $P10 = rx142_cur."ws"()
    unless $P10, rx142_fail
    rx142_pos = $P10."pos"()
    goto alt148_end
  alt148_1:
.annotate 'line', 92
  # rx subrule "ws" subtype=method negate=
    rx142_cur."!cursor_pos"(rx142_pos)
    $P10 = rx142_cur."ws"()
    unless $P10, rx142_fail
    rx142_pos = $P10."pos"()
  # rx rxquantr152 ** 0..*
    set_addr $I10, rxquantr152_done
    rx142_cur."!mark_push"(0, rx142_pos, $I10)
  rxquantr152_loop:
  # rx subrule "statement" subtype=capture negate=
    rx142_cur."!cursor_pos"(rx142_pos)
    $P10 = rx142_cur."statement"()
    unless $P10, rx142_fail
    rx142_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx142_pos = $P10."pos"()
  # rx subrule "eat_terminator" subtype=method negate=
    rx142_cur."!cursor_pos"(rx142_pos)
    $P10 = rx142_cur."eat_terminator"()
    unless $P10, rx142_fail
    rx142_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx142_cur."!cursor_pos"(rx142_pos)
    $P10 = rx142_cur."ws"()
    unless $P10, rx142_fail
    rx142_pos = $P10."pos"()
    set_addr $I10, rxquantr152_done
    (rx142_rep) = rx142_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr152_done
    rx142_cur."!mark_push"(rx142_rep, rx142_pos, $I10)
    goto rxquantr152_loop
  rxquantr152_done:
  # rx subrule "ws" subtype=method negate=
    rx142_cur."!cursor_pos"(rx142_pos)
    $P10 = rx142_cur."ws"()
    unless $P10, rx142_fail
    rx142_pos = $P10."pos"()
  alt148_end:
.annotate 'line', 90
  # rx pass
    rx142_cur."!cursor_pass"(rx142_pos, "statementlist")
    if_null rx142_debug, debug_431
    rx142_cur."!cursor_debug"("PASS", "statementlist", " at pos=", rx142_pos)
  debug_431:
    .return (rx142_cur)
  rx142_restart:
.annotate 'line', 4
    if_null rx142_debug, debug_432
    rx142_cur."!cursor_debug"("NEXT", "statementlist")
  debug_432:
  rx142_fail:
    (rx142_rep, rx142_pos, $I10, $P10) = rx142_cur."!mark_fail"(0)
    lt rx142_pos, -1, rx142_done
    eq rx142_pos, -1, rx142_fail
    jump $I10
  rx142_done:
    rx142_cur."!cursor_fail"()
    if_null rx142_debug, debug_433
    rx142_cur."!cursor_debug"("FAIL", "statementlist")
  debug_433:
    .return (rx142_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statementlist"  :subid("32_1284728478.15265") :method
.annotate 'line', 4
    $P144 = self."!PREFIX__!subrule"("ws", "")
    $P145 = self."!PREFIX__!subrule"("ws", "")
    new $P146, "ResizablePMCArray"
    push $P146, $P144
    push $P146, $P145
    .return ($P146)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .const 'Sub' $P161 = "35_1284728478.15265" 
    capture_lex $P161
    .local string rx156_tgt
    .local int rx156_pos
    .local int rx156_off
    .local int rx156_eos
    .local int rx156_rep
    .local pmc rx156_cur
    .local pmc rx156_debug
    (rx156_cur, rx156_pos, rx156_tgt, $I10) = self."!cursor_start"()
    rx156_cur."!cursor_caparray"("statement_mod_loop", "statement_mod_cond")
    getattribute rx156_debug, rx156_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx156_cur
    .local pmc match
    .lex "$/", match
    length rx156_eos, rx156_tgt
    gt rx156_pos, rx156_eos, rx156_done
    set rx156_off, 0
    lt rx156_pos, 2, rx156_start
    sub rx156_off, rx156_pos, 1
    substr rx156_tgt, rx156_tgt, rx156_off
  rx156_start:
    eq $I10, 1, rx156_restart
    if_null rx156_debug, debug_434
    rx156_cur."!cursor_debug"("START", "statement")
  debug_434:
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
.annotate 'line', 96
  # rx subrule "before" subtype=zerowidth negate=1
    rx156_cur."!cursor_pos"(rx156_pos)
    .const 'Sub' $P161 = "35_1284728478.15265" 
    capture_lex $P161
    $P10 = rx156_cur."before"($P161)
    if $P10, rx156_fail
  alt165_0:
.annotate 'line', 97
    set_addr $I10, alt165_1
    rx156_cur."!mark_push"(0, rx156_pos, $I10)
.annotate 'line', 98
  # rx subrule "statement_control" subtype=capture negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."statement_control"()
    unless $P10, rx156_fail
    rx156_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_control")
    rx156_pos = $P10."pos"()
    goto alt165_end
  alt165_1:
.annotate 'line', 99
  # rx subrule "EXPR" subtype=capture negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."EXPR"()
    unless $P10, rx156_fail
    rx156_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx156_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."ws"()
    unless $P10, rx156_fail
    rx156_pos = $P10."pos"()
.annotate 'line', 104
  # rx rxquantr166 ** 0..1
    set_addr $I10, rxquantr166_done
    rx156_cur."!mark_push"(0, rx156_pos, $I10)
  rxquantr166_loop:
  alt167_0:
.annotate 'line', 100
    set_addr $I10, alt167_1
    rx156_cur."!mark_push"(0, rx156_pos, $I10)
.annotate 'line', 101
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."MARKED"("endstmt")
    unless $P10, rx156_fail
    goto alt167_end
  alt167_1:
    set_addr $I10, alt167_2
    rx156_cur."!mark_push"(0, rx156_pos, $I10)
.annotate 'line', 102
  # rx subrule "statement_mod_cond" subtype=capture negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."statement_mod_cond"()
    unless $P10, rx156_fail
    rx156_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_cond")
    rx156_pos = $P10."pos"()
  # rx rxquantr168 ** 0..1
    set_addr $I10, rxquantr168_done
    rx156_cur."!mark_push"(0, rx156_pos, $I10)
  rxquantr168_loop:
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."statement_mod_loop"()
    unless $P10, rx156_fail
    goto rxsubrule169_pass
  rxsubrule169_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx156_fail
  rxsubrule169_pass:
    set_addr $I10, rxsubrule169_back
    rx156_cur."!mark_push"(0, rx156_pos, $I10, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx156_pos = $P10."pos"()
    set_addr $I10, rxquantr168_done
    (rx156_rep) = rx156_cur."!mark_commit"($I10)
  rxquantr168_done:
    goto alt167_end
  alt167_2:
.annotate 'line', 103
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."statement_mod_loop"()
    unless $P10, rx156_fail
    rx156_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx156_pos = $P10."pos"()
  alt167_end:
.annotate 'line', 104
    set_addr $I10, rxquantr166_done
    (rx156_rep) = rx156_cur."!mark_commit"($I10)
  rxquantr166_done:
  alt165_end:
.annotate 'line', 95
  # rx pass
    rx156_cur."!cursor_pass"(rx156_pos, "statement")
    if_null rx156_debug, debug_439
    rx156_cur."!cursor_debug"("PASS", "statement", " at pos=", rx156_pos)
  debug_439:
    .return (rx156_cur)
  rx156_restart:
.annotate 'line', 4
    if_null rx156_debug, debug_440
    rx156_cur."!cursor_debug"("NEXT", "statement")
  debug_440:
  rx156_fail:
    (rx156_rep, rx156_pos, $I10, $P10) = rx156_cur."!mark_fail"(0)
    lt rx156_pos, -1, rx156_done
    eq rx156_pos, -1, rx156_fail
    jump $I10
  rx156_done:
    rx156_cur."!cursor_fail"()
    if_null rx156_debug, debug_441
    rx156_cur."!cursor_debug"("FAIL", "statement")
  debug_441:
    .return (rx156_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement"  :subid("34_1284728478.15265") :method
.annotate 'line', 4
    new $P158, "ResizablePMCArray"
    push $P158, ""
    .return ($P158)
.end


.namespace ["NQP";"Grammar"]
.sub "_block160"  :anon :subid("35_1284728478.15265") :method :outer("33_1284728478.15265")
.annotate 'line', 96
    .local string rx162_tgt
    .local int rx162_pos
    .local int rx162_off
    .local int rx162_eos
    .local int rx162_rep
    .local pmc rx162_cur
    .local pmc rx162_debug
    (rx162_cur, rx162_pos, rx162_tgt, $I10) = self."!cursor_start"()
    getattribute rx162_debug, rx162_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx162_cur
    .local pmc match
    .lex "$/", match
    length rx162_eos, rx162_tgt
    gt rx162_pos, rx162_eos, rx162_done
    set rx162_off, 0
    lt rx162_pos, 2, rx162_start
    sub rx162_off, rx162_pos, 1
    substr rx162_tgt, rx162_tgt, rx162_off
  rx162_start:
    eq $I10, 1, rx162_restart
    if_null rx162_debug, debug_435
    rx162_cur."!cursor_debug"("START", "")
  debug_435:
    $I10 = self.'from'()
    ne $I10, -1, rxscan163_done
    goto rxscan163_scan
  rxscan163_loop:
    ($P10) = rx162_cur."from"()
    inc $P10
    set rx162_pos, $P10
    ge rx162_pos, rx162_eos, rxscan163_done
  rxscan163_scan:
    set_addr $I10, rxscan163_loop
    rx162_cur."!mark_push"(0, rx162_pos, $I10)
  rxscan163_done:
  alt164_0:
    set_addr $I10, alt164_1
    rx162_cur."!mark_push"(0, rx162_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx162_pos, rx162_eos, rx162_fail
    sub $I10, rx162_pos, rx162_off
    substr $S10, rx162_tgt, $I10, 1
    index $I11, "])}", $S10
    lt $I11, 0, rx162_fail
    inc rx162_pos
    goto alt164_end
  alt164_1:
  # rxanchor eos
    ne rx162_pos, rx162_eos, rx162_fail
  alt164_end:
  # rx pass
    rx162_cur."!cursor_pass"(rx162_pos, "")
    if_null rx162_debug, debug_436
    rx162_cur."!cursor_debug"("PASS", "", " at pos=", rx162_pos)
  debug_436:
    .return (rx162_cur)
  rx162_restart:
    if_null rx162_debug, debug_437
    rx162_cur."!cursor_debug"("NEXT", "")
  debug_437:
  rx162_fail:
    (rx162_rep, rx162_pos, $I10, $P10) = rx162_cur."!mark_fail"(0)
    lt rx162_pos, -1, rx162_done
    eq rx162_pos, -1, rx162_fail
    jump $I10
  rx162_done:
    rx162_cur."!cursor_fail"()
    if_null rx162_debug, debug_438
    rx162_cur."!cursor_debug"("FAIL", "")
  debug_438:
    .return (rx162_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "eat_terminator"  :subid("36_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx171_tgt
    .local int rx171_pos
    .local int rx171_off
    .local int rx171_eos
    .local int rx171_rep
    .local pmc rx171_cur
    .local pmc rx171_debug
    (rx171_cur, rx171_pos, rx171_tgt, $I10) = self."!cursor_start"()
    getattribute rx171_debug, rx171_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx171_cur
    .local pmc match
    .lex "$/", match
    length rx171_eos, rx171_tgt
    gt rx171_pos, rx171_eos, rx171_done
    set rx171_off, 0
    lt rx171_pos, 2, rx171_start
    sub rx171_off, rx171_pos, 1
    substr rx171_tgt, rx171_tgt, rx171_off
  rx171_start:
    eq $I10, 1, rx171_restart
    if_null rx171_debug, debug_442
    rx171_cur."!cursor_debug"("START", "eat_terminator")
  debug_442:
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
  alt175_0:
.annotate 'line', 108
    set_addr $I10, alt175_1
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
.annotate 'line', 109
  # rx literal  ";"
    add $I11, rx171_pos, 1
    gt $I11, rx171_eos, rx171_fail
    sub $I11, rx171_pos, rx171_off
    ord $I11, rx171_tgt, $I11
    ne $I11, 59, rx171_fail
    add rx171_pos, 1
    goto alt175_end
  alt175_1:
    set_addr $I10, alt175_2
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
.annotate 'line', 110
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx171_cur."!cursor_pos"(rx171_pos)
    $P10 = rx171_cur."MARKED"("endstmt")
    unless $P10, rx171_fail
    goto alt175_end
  alt175_2:
    set_addr $I10, alt175_3
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
.annotate 'line', 111
  # rx subrule "terminator" subtype=zerowidth negate=
    rx171_cur."!cursor_pos"(rx171_pos)
    $P10 = rx171_cur."terminator"()
    unless $P10, rx171_fail
    goto alt175_end
  alt175_3:
.annotate 'line', 112
  # rxanchor eos
    ne rx171_pos, rx171_eos, rx171_fail
  alt175_end:
.annotate 'line', 108
  # rx pass
    rx171_cur."!cursor_pass"(rx171_pos, "eat_terminator")
    if_null rx171_debug, debug_443
    rx171_cur."!cursor_debug"("PASS", "eat_terminator", " at pos=", rx171_pos)
  debug_443:
    .return (rx171_cur)
  rx171_restart:
.annotate 'line', 4
    if_null rx171_debug, debug_444
    rx171_cur."!cursor_debug"("NEXT", "eat_terminator")
  debug_444:
  rx171_fail:
    (rx171_rep, rx171_pos, $I10, $P10) = rx171_cur."!mark_fail"(0)
    lt rx171_pos, -1, rx171_done
    eq rx171_pos, -1, rx171_fail
    jump $I10
  rx171_done:
    rx171_cur."!cursor_fail"()
    if_null rx171_debug, debug_445
    rx171_cur."!cursor_debug"("FAIL", "eat_terminator")
  debug_445:
    .return (rx171_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__eat_terminator"  :subid("37_1284728478.15265") :method
.annotate 'line', 4
    new $P173, "ResizablePMCArray"
    push $P173, ""
    push $P173, ""
    push $P173, ""
    push $P173, ";"
    .return ($P173)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx177_tgt
    .local int rx177_pos
    .local int rx177_off
    .local int rx177_eos
    .local int rx177_rep
    .local pmc rx177_cur
    .local pmc rx177_debug
    (rx177_cur, rx177_pos, rx177_tgt, $I10) = self."!cursor_start"()
    getattribute rx177_debug, rx177_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx177_cur
    .local pmc match
    .lex "$/", match
    length rx177_eos, rx177_tgt
    gt rx177_pos, rx177_eos, rx177_done
    set rx177_off, 0
    lt rx177_pos, 2, rx177_start
    sub rx177_off, rx177_pos, 1
    substr rx177_tgt, rx177_tgt, rx177_off
  rx177_start:
    eq $I10, 1, rx177_restart
    if_null rx177_debug, debug_446
    rx177_cur."!cursor_debug"("START", "xblock")
  debug_446:
    $I10 = self.'from'()
    ne $I10, -1, rxscan181_done
    goto rxscan181_scan
  rxscan181_loop:
    ($P10) = rx177_cur."from"()
    inc $P10
    set rx177_pos, $P10
    ge rx177_pos, rx177_eos, rxscan181_done
  rxscan181_scan:
    set_addr $I10, rxscan181_loop
    rx177_cur."!mark_push"(0, rx177_pos, $I10)
  rxscan181_done:
.annotate 'line', 116
  # rx subrule "EXPR" subtype=capture negate=
    rx177_cur."!cursor_pos"(rx177_pos)
    $P10 = rx177_cur."EXPR"()
    unless $P10, rx177_fail
    rx177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx177_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx177_cur."!cursor_pos"(rx177_pos)
    $P10 = rx177_cur."ws"()
    unless $P10, rx177_fail
    rx177_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx177_cur."!cursor_pos"(rx177_pos)
    $P10 = rx177_cur."pblock"()
    unless $P10, rx177_fail
    rx177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx177_pos = $P10."pos"()
.annotate 'line', 115
  # rx pass
    rx177_cur."!cursor_pass"(rx177_pos, "xblock")
    if_null rx177_debug, debug_447
    rx177_cur."!cursor_debug"("PASS", "xblock", " at pos=", rx177_pos)
  debug_447:
    .return (rx177_cur)
  rx177_restart:
.annotate 'line', 4
    if_null rx177_debug, debug_448
    rx177_cur."!cursor_debug"("NEXT", "xblock")
  debug_448:
  rx177_fail:
    (rx177_rep, rx177_pos, $I10, $P10) = rx177_cur."!mark_fail"(0)
    lt rx177_pos, -1, rx177_done
    eq rx177_pos, -1, rx177_fail
    jump $I10
  rx177_done:
    rx177_cur."!cursor_fail"()
    if_null rx177_debug, debug_449
    rx177_cur."!cursor_debug"("FAIL", "xblock")
  debug_449:
    .return (rx177_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__xblock"  :subid("39_1284728478.15265") :method
.annotate 'line', 4
    $P179 = self."!PREFIX__!subrule"("EXPR", "")
    new $P180, "ResizablePMCArray"
    push $P180, $P179
    .return ($P180)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx183_tgt
    .local int rx183_pos
    .local int rx183_off
    .local int rx183_eos
    .local int rx183_rep
    .local pmc rx183_cur
    .local pmc rx183_debug
    (rx183_cur, rx183_pos, rx183_tgt, $I10) = self."!cursor_start"()
    getattribute rx183_debug, rx183_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx183_cur
    .local pmc match
    .lex "$/", match
    length rx183_eos, rx183_tgt
    gt rx183_pos, rx183_eos, rx183_done
    set rx183_off, 0
    lt rx183_pos, 2, rx183_start
    sub rx183_off, rx183_pos, 1
    substr rx183_tgt, rx183_tgt, rx183_off
  rx183_start:
    eq $I10, 1, rx183_restart
    if_null rx183_debug, debug_450
    rx183_cur."!cursor_debug"("START", "pblock")
  debug_450:
    $I10 = self.'from'()
    ne $I10, -1, rxscan188_done
    goto rxscan188_scan
  rxscan188_loop:
    ($P10) = rx183_cur."from"()
    inc $P10
    set rx183_pos, $P10
    ge rx183_pos, rx183_eos, rxscan188_done
  rxscan188_scan:
    set_addr $I10, rxscan188_loop
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
  rxscan188_done:
  alt189_0:
.annotate 'line', 119
    set_addr $I10, alt189_1
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
.annotate 'line', 120
  # rx subrule "lambda" subtype=method negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."lambda"()
    unless $P10, rx183_fail
    rx183_pos = $P10."pos"()
.annotate 'line', 121
  # rx subrule "newpad" subtype=method negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."newpad"()
    unless $P10, rx183_fail
    rx183_pos = $P10."pos"()
.annotate 'line', 122
  # rx subrule "signature" subtype=capture negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."signature"()
    unless $P10, rx183_fail
    rx183_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx183_pos = $P10."pos"()
.annotate 'line', 123
  # rx subrule "blockoid" subtype=capture negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."blockoid"()
    unless $P10, rx183_fail
    rx183_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx183_pos = $P10."pos"()
.annotate 'line', 120
    goto alt189_end
  alt189_1:
    set_addr $I10, alt189_2
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
.annotate 'line', 124
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx183_pos, rx183_off
    substr $S10, rx183_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx183_fail
.annotate 'line', 125
  # rx subrule "newpad" subtype=method negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."newpad"()
    unless $P10, rx183_fail
    rx183_pos = $P10."pos"()
.annotate 'line', 126
  # rx subrule "blockoid" subtype=capture negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."blockoid"()
    unless $P10, rx183_fail
    rx183_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx183_pos = $P10."pos"()
.annotate 'line', 124
    goto alt189_end
  alt189_2:
.annotate 'line', 127
  # rx subrule "panic" subtype=method negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."panic"("Missing block")
    unless $P10, rx183_fail
    rx183_pos = $P10."pos"()
  alt189_end:
.annotate 'line', 119
  # rx pass
    rx183_cur."!cursor_pass"(rx183_pos, "pblock")
    if_null rx183_debug, debug_451
    rx183_cur."!cursor_debug"("PASS", "pblock", " at pos=", rx183_pos)
  debug_451:
    .return (rx183_cur)
  rx183_restart:
.annotate 'line', 4
    if_null rx183_debug, debug_452
    rx183_cur."!cursor_debug"("NEXT", "pblock")
  debug_452:
  rx183_fail:
    (rx183_rep, rx183_pos, $I10, $P10) = rx183_cur."!mark_fail"(0)
    lt rx183_pos, -1, rx183_done
    eq rx183_pos, -1, rx183_fail
    jump $I10
  rx183_done:
    rx183_cur."!cursor_fail"()
    if_null rx183_debug, debug_453
    rx183_cur."!cursor_debug"("FAIL", "pblock")
  debug_453:
    .return (rx183_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pblock"  :subid("41_1284728478.15265") :method
.annotate 'line', 4
    $P185 = self."!PREFIX__!subrule"("panic", "")
    $P186 = self."!PREFIX__!subrule"("lambda", "")
    new $P187, "ResizablePMCArray"
    push $P187, $P185
    push $P187, "{"
    push $P187, $P186
    .return ($P187)
.end


.namespace ["NQP";"Grammar"]
.sub "lambda"  :subid("42_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx191_tgt
    .local int rx191_pos
    .local int rx191_off
    .local int rx191_eos
    .local int rx191_rep
    .local pmc rx191_cur
    .local pmc rx191_debug
    (rx191_cur, rx191_pos, rx191_tgt, $I10) = self."!cursor_start"()
    getattribute rx191_debug, rx191_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx191_cur
    .local pmc match
    .lex "$/", match
    length rx191_eos, rx191_tgt
    gt rx191_pos, rx191_eos, rx191_done
    set rx191_off, 0
    lt rx191_pos, 2, rx191_start
    sub rx191_off, rx191_pos, 1
    substr rx191_tgt, rx191_tgt, rx191_off
  rx191_start:
    eq $I10, 1, rx191_restart
    if_null rx191_debug, debug_454
    rx191_cur."!cursor_debug"("START", "lambda")
  debug_454:
    $I10 = self.'from'()
    ne $I10, -1, rxscan194_done
    goto rxscan194_scan
  rxscan194_loop:
    ($P10) = rx191_cur."from"()
    inc $P10
    set rx191_pos, $P10
    ge rx191_pos, rx191_eos, rxscan194_done
  rxscan194_scan:
    set_addr $I10, rxscan194_loop
    rx191_cur."!mark_push"(0, rx191_pos, $I10)
  rxscan194_done:
  alt195_0:
.annotate 'line', 130
    set_addr $I10, alt195_1
    rx191_cur."!mark_push"(0, rx191_pos, $I10)
  # rx literal  "->"
    add $I11, rx191_pos, 2
    gt $I11, rx191_eos, rx191_fail
    sub $I11, rx191_pos, rx191_off
    substr $S10, rx191_tgt, $I11, 2
    ne $S10, "->", rx191_fail
    add rx191_pos, 2
    goto alt195_end
  alt195_1:
  # rx literal  "<->"
    add $I11, rx191_pos, 3
    gt $I11, rx191_eos, rx191_fail
    sub $I11, rx191_pos, rx191_off
    substr $S10, rx191_tgt, $I11, 3
    ne $S10, "<->", rx191_fail
    add rx191_pos, 3
  alt195_end:
  # rx pass
    rx191_cur."!cursor_pass"(rx191_pos, "lambda")
    if_null rx191_debug, debug_455
    rx191_cur."!cursor_debug"("PASS", "lambda", " at pos=", rx191_pos)
  debug_455:
    .return (rx191_cur)
  rx191_restart:
.annotate 'line', 4
    if_null rx191_debug, debug_456
    rx191_cur."!cursor_debug"("NEXT", "lambda")
  debug_456:
  rx191_fail:
    (rx191_rep, rx191_pos, $I10, $P10) = rx191_cur."!mark_fail"(0)
    lt rx191_pos, -1, rx191_done
    eq rx191_pos, -1, rx191_fail
    jump $I10
  rx191_done:
    rx191_cur."!cursor_fail"()
    if_null rx191_debug, debug_457
    rx191_cur."!cursor_debug"("FAIL", "lambda")
  debug_457:
    .return (rx191_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__lambda"  :subid("43_1284728478.15265") :method
.annotate 'line', 4
    new $P193, "ResizablePMCArray"
    push $P193, "<->"
    push $P193, "->"
    .return ($P193)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx197_tgt
    .local int rx197_pos
    .local int rx197_off
    .local int rx197_eos
    .local int rx197_rep
    .local pmc rx197_cur
    .local pmc rx197_debug
    (rx197_cur, rx197_pos, rx197_tgt, $I10) = self."!cursor_start"()
    getattribute rx197_debug, rx197_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx197_cur
    .local pmc match
    .lex "$/", match
    length rx197_eos, rx197_tgt
    gt rx197_pos, rx197_eos, rx197_done
    set rx197_off, 0
    lt rx197_pos, 2, rx197_start
    sub rx197_off, rx197_pos, 1
    substr rx197_tgt, rx197_tgt, rx197_off
  rx197_start:
    eq $I10, 1, rx197_restart
    if_null rx197_debug, debug_458
    rx197_cur."!cursor_debug"("START", "block")
  debug_458:
    $I10 = self.'from'()
    ne $I10, -1, rxscan201_done
    goto rxscan201_scan
  rxscan201_loop:
    ($P10) = rx197_cur."from"()
    inc $P10
    set rx197_pos, $P10
    ge rx197_pos, rx197_eos, rxscan201_done
  rxscan201_scan:
    set_addr $I10, rxscan201_loop
    rx197_cur."!mark_push"(0, rx197_pos, $I10)
  rxscan201_done:
  alt202_0:
.annotate 'line', 133
    set_addr $I10, alt202_1
    rx197_cur."!mark_push"(0, rx197_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx197_pos, rx197_off
    substr $S10, rx197_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx197_fail
    goto alt202_end
  alt202_1:
  # rx subrule "panic" subtype=method negate=
    rx197_cur."!cursor_pos"(rx197_pos)
    $P10 = rx197_cur."panic"("Missing block")
    unless $P10, rx197_fail
    rx197_pos = $P10."pos"()
  alt202_end:
.annotate 'line', 134
  # rx subrule "newpad" subtype=method negate=
    rx197_cur."!cursor_pos"(rx197_pos)
    $P10 = rx197_cur."newpad"()
    unless $P10, rx197_fail
    rx197_pos = $P10."pos"()
.annotate 'line', 135
  # rx subrule "blockoid" subtype=capture negate=
    rx197_cur."!cursor_pos"(rx197_pos)
    $P10 = rx197_cur."blockoid"()
    unless $P10, rx197_fail
    rx197_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx197_pos = $P10."pos"()
.annotate 'line', 132
  # rx pass
    rx197_cur."!cursor_pass"(rx197_pos, "block")
    if_null rx197_debug, debug_459
    rx197_cur."!cursor_debug"("PASS", "block", " at pos=", rx197_pos)
  debug_459:
    .return (rx197_cur)
  rx197_restart:
.annotate 'line', 4
    if_null rx197_debug, debug_460
    rx197_cur."!cursor_debug"("NEXT", "block")
  debug_460:
  rx197_fail:
    (rx197_rep, rx197_pos, $I10, $P10) = rx197_cur."!mark_fail"(0)
    lt rx197_pos, -1, rx197_done
    eq rx197_pos, -1, rx197_fail
    jump $I10
  rx197_done:
    rx197_cur."!cursor_fail"()
    if_null rx197_debug, debug_461
    rx197_cur."!cursor_debug"("FAIL", "block")
  debug_461:
    .return (rx197_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__block"  :subid("45_1284728478.15265") :method
.annotate 'line', 4
    $P199 = self."!PREFIX__!subrule"("panic", "")
    new $P200, "ResizablePMCArray"
    push $P200, $P199
    push $P200, "{"
    .return ($P200)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx204_tgt
    .local int rx204_pos
    .local int rx204_off
    .local int rx204_eos
    .local int rx204_rep
    .local pmc rx204_cur
    .local pmc rx204_debug
    (rx204_cur, rx204_pos, rx204_tgt, $I10) = self."!cursor_start"()
    getattribute rx204_debug, rx204_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx204_cur
    .local pmc match
    .lex "$/", match
    length rx204_eos, rx204_tgt
    gt rx204_pos, rx204_eos, rx204_done
    set rx204_off, 0
    lt rx204_pos, 2, rx204_start
    sub rx204_off, rx204_pos, 1
    substr rx204_tgt, rx204_tgt, rx204_off
  rx204_start:
    eq $I10, 1, rx204_restart
    if_null rx204_debug, debug_462
    rx204_cur."!cursor_debug"("START", "blockoid")
  debug_462:
    $I10 = self.'from'()
    ne $I10, -1, rxscan208_done
    goto rxscan208_scan
  rxscan208_loop:
    ($P10) = rx204_cur."from"()
    inc $P10
    set rx204_pos, $P10
    ge rx204_pos, rx204_eos, rxscan208_done
  rxscan208_scan:
    set_addr $I10, rxscan208_loop
    rx204_cur."!mark_push"(0, rx204_pos, $I10)
  rxscan208_done:
.annotate 'line', 139
  # rx subrule "finishpad" subtype=method negate=
    rx204_cur."!cursor_pos"(rx204_pos)
    $P10 = rx204_cur."finishpad"()
    unless $P10, rx204_fail
    rx204_pos = $P10."pos"()
.annotate 'line', 140
  # rx literal  "{"
    add $I11, rx204_pos, 1
    gt $I11, rx204_eos, rx204_fail
    sub $I11, rx204_pos, rx204_off
    ord $I11, rx204_tgt, $I11
    ne $I11, 123, rx204_fail
    add rx204_pos, 1
  # rx subrule "statementlist" subtype=capture negate=
    rx204_cur."!cursor_pos"(rx204_pos)
    $P10 = rx204_cur."statementlist"()
    unless $P10, rx204_fail
    rx204_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx204_pos = $P10."pos"()
  alt209_0:
    set_addr $I10, alt209_1
    rx204_cur."!mark_push"(0, rx204_pos, $I10)
  # rx literal  "}"
    add $I11, rx204_pos, 1
    gt $I11, rx204_eos, rx204_fail
    sub $I11, rx204_pos, rx204_off
    ord $I11, rx204_tgt, $I11
    ne $I11, 125, rx204_fail
    add rx204_pos, 1
    goto alt209_end
  alt209_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx204_cur."!cursor_pos"(rx204_pos)
    $P10 = rx204_cur."FAILGOAL"("'}'")
    unless $P10, rx204_fail
    goto rxsubrule211_pass
  rxsubrule211_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx204_fail
  rxsubrule211_pass:
    set_addr $I10, rxsubrule211_back
    rx204_cur."!mark_push"(0, rx204_pos, $I10, $P10)
    rx204_pos = $P10."pos"()
  alt209_end:
.annotate 'line', 141
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx204_cur."!cursor_pos"(rx204_pos)
    $P10 = rx204_cur."ENDSTMT"()
    unless $P10, rx204_fail
.annotate 'line', 138
  # rx pass
    rx204_cur."!cursor_pass"(rx204_pos, "blockoid")
    if_null rx204_debug, debug_463
    rx204_cur."!cursor_debug"("PASS", "blockoid", " at pos=", rx204_pos)
  debug_463:
    .return (rx204_cur)
  rx204_restart:
.annotate 'line', 4
    if_null rx204_debug, debug_464
    rx204_cur."!cursor_debug"("NEXT", "blockoid")
  debug_464:
  rx204_fail:
    (rx204_rep, rx204_pos, $I10, $P10) = rx204_cur."!mark_fail"(0)
    lt rx204_pos, -1, rx204_done
    eq rx204_pos, -1, rx204_fail
    jump $I10
  rx204_done:
    rx204_cur."!cursor_fail"()
    if_null rx204_debug, debug_465
    rx204_cur."!cursor_debug"("FAIL", "blockoid")
  debug_465:
    .return (rx204_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blockoid"  :subid("47_1284728478.15265") :method
.annotate 'line', 4
    $P206 = self."!PREFIX__!subrule"("finishpad", "")
    new $P207, "ResizablePMCArray"
    push $P207, $P206
    .return ($P207)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx213_tgt
    .local int rx213_pos
    .local int rx213_off
    .local int rx213_eos
    .local int rx213_rep
    .local pmc rx213_cur
    .local pmc rx213_debug
    (rx213_cur, rx213_pos, rx213_tgt, $I10) = self."!cursor_start"()
    getattribute rx213_debug, rx213_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx213_cur
    .local pmc match
    .lex "$/", match
    length rx213_eos, rx213_tgt
    gt rx213_pos, rx213_eos, rx213_done
    set rx213_off, 0
    lt rx213_pos, 2, rx213_start
    sub rx213_off, rx213_pos, 1
    substr rx213_tgt, rx213_tgt, rx213_off
  rx213_start:
    eq $I10, 1, rx213_restart
    if_null rx213_debug, debug_466
    rx213_cur."!cursor_debug"("START", "newpad")
  debug_466:
    $I10 = self.'from'()
    ne $I10, -1, rxscan216_done
    goto rxscan216_scan
  rxscan216_loop:
    ($P10) = rx213_cur."from"()
    inc $P10
    set rx213_pos, $P10
    ge rx213_pos, rx213_eos, rxscan216_done
  rxscan216_scan:
    set_addr $I10, rxscan216_loop
    rx213_cur."!mark_push"(0, rx213_pos, $I10)
  rxscan216_done:
.annotate 'line', 144
  # rx pass
    rx213_cur."!cursor_pass"(rx213_pos, "newpad")
    if_null rx213_debug, debug_467
    rx213_cur."!cursor_debug"("PASS", "newpad", " at pos=", rx213_pos)
  debug_467:
    .return (rx213_cur)
  rx213_restart:
.annotate 'line', 4
    if_null rx213_debug, debug_468
    rx213_cur."!cursor_debug"("NEXT", "newpad")
  debug_468:
  rx213_fail:
    (rx213_rep, rx213_pos, $I10, $P10) = rx213_cur."!mark_fail"(0)
    lt rx213_pos, -1, rx213_done
    eq rx213_pos, -1, rx213_fail
    jump $I10
  rx213_done:
    rx213_cur."!cursor_fail"()
    if_null rx213_debug, debug_469
    rx213_cur."!cursor_debug"("FAIL", "newpad")
  debug_469:
    .return (rx213_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__newpad"  :subid("49_1284728478.15265") :method
.annotate 'line', 4
    new $P215, "ResizablePMCArray"
    push $P215, ""
    .return ($P215)
.end


.namespace ["NQP";"Grammar"]
.sub "outerctx"  :subid("50_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx218_tgt
    .local int rx218_pos
    .local int rx218_off
    .local int rx218_eos
    .local int rx218_rep
    .local pmc rx218_cur
    .local pmc rx218_debug
    (rx218_cur, rx218_pos, rx218_tgt, $I10) = self."!cursor_start"()
    getattribute rx218_debug, rx218_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx218_cur
    .local pmc match
    .lex "$/", match
    length rx218_eos, rx218_tgt
    gt rx218_pos, rx218_eos, rx218_done
    set rx218_off, 0
    lt rx218_pos, 2, rx218_start
    sub rx218_off, rx218_pos, 1
    substr rx218_tgt, rx218_tgt, rx218_off
  rx218_start:
    eq $I10, 1, rx218_restart
    if_null rx218_debug, debug_470
    rx218_cur."!cursor_debug"("START", "outerctx")
  debug_470:
    $I10 = self.'from'()
    ne $I10, -1, rxscan221_done
    goto rxscan221_scan
  rxscan221_loop:
    ($P10) = rx218_cur."from"()
    inc $P10
    set rx218_pos, $P10
    ge rx218_pos, rx218_eos, rxscan221_done
  rxscan221_scan:
    set_addr $I10, rxscan221_loop
    rx218_cur."!mark_push"(0, rx218_pos, $I10)
  rxscan221_done:
.annotate 'line', 145
  # rx pass
    rx218_cur."!cursor_pass"(rx218_pos, "outerctx")
    if_null rx218_debug, debug_471
    rx218_cur."!cursor_debug"("PASS", "outerctx", " at pos=", rx218_pos)
  debug_471:
    .return (rx218_cur)
  rx218_restart:
.annotate 'line', 4
    if_null rx218_debug, debug_472
    rx218_cur."!cursor_debug"("NEXT", "outerctx")
  debug_472:
  rx218_fail:
    (rx218_rep, rx218_pos, $I10, $P10) = rx218_cur."!mark_fail"(0)
    lt rx218_pos, -1, rx218_done
    eq rx218_pos, -1, rx218_fail
    jump $I10
  rx218_done:
    rx218_cur."!cursor_fail"()
    if_null rx218_debug, debug_473
    rx218_cur."!cursor_debug"("FAIL", "outerctx")
  debug_473:
    .return (rx218_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__outerctx"  :subid("51_1284728478.15265") :method
.annotate 'line', 4
    new $P220, "ResizablePMCArray"
    push $P220, ""
    .return ($P220)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("52_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx223_tgt
    .local int rx223_pos
    .local int rx223_off
    .local int rx223_eos
    .local int rx223_rep
    .local pmc rx223_cur
    .local pmc rx223_debug
    (rx223_cur, rx223_pos, rx223_tgt, $I10) = self."!cursor_start"()
    getattribute rx223_debug, rx223_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx223_cur
    .local pmc match
    .lex "$/", match
    length rx223_eos, rx223_tgt
    gt rx223_pos, rx223_eos, rx223_done
    set rx223_off, 0
    lt rx223_pos, 2, rx223_start
    sub rx223_off, rx223_pos, 1
    substr rx223_tgt, rx223_tgt, rx223_off
  rx223_start:
    eq $I10, 1, rx223_restart
    if_null rx223_debug, debug_474
    rx223_cur."!cursor_debug"("START", "finishpad")
  debug_474:
    $I10 = self.'from'()
    ne $I10, -1, rxscan226_done
    goto rxscan226_scan
  rxscan226_loop:
    ($P10) = rx223_cur."from"()
    inc $P10
    set rx223_pos, $P10
    ge rx223_pos, rx223_eos, rxscan226_done
  rxscan226_scan:
    set_addr $I10, rxscan226_loop
    rx223_cur."!mark_push"(0, rx223_pos, $I10)
  rxscan226_done:
.annotate 'line', 146
  # rx pass
    rx223_cur."!cursor_pass"(rx223_pos, "finishpad")
    if_null rx223_debug, debug_475
    rx223_cur."!cursor_debug"("PASS", "finishpad", " at pos=", rx223_pos)
  debug_475:
    .return (rx223_cur)
  rx223_restart:
.annotate 'line', 4
    if_null rx223_debug, debug_476
    rx223_cur."!cursor_debug"("NEXT", "finishpad")
  debug_476:
  rx223_fail:
    (rx223_rep, rx223_pos, $I10, $P10) = rx223_cur."!mark_fail"(0)
    lt rx223_pos, -1, rx223_done
    eq rx223_pos, -1, rx223_fail
    jump $I10
  rx223_done:
    rx223_cur."!cursor_fail"()
    if_null rx223_debug, debug_477
    rx223_cur."!cursor_debug"("FAIL", "finishpad")
  debug_477:
    .return (rx223_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__finishpad"  :subid("53_1284728478.15265") :method
.annotate 'line', 4
    new $P225, "ResizablePMCArray"
    push $P225, ""
    .return ($P225)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("54_1284728478.15265") :method
.annotate 'line', 148
    $P228 = self."!protoregex"("terminator")
    .return ($P228)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("55_1284728478.15265") :method
.annotate 'line', 148
    $P230 = self."!PREFIX__!protoregex"("terminator")
    .return ($P230)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("56_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx232_tgt
    .local int rx232_pos
    .local int rx232_off
    .local int rx232_eos
    .local int rx232_rep
    .local pmc rx232_cur
    .local pmc rx232_debug
    (rx232_cur, rx232_pos, rx232_tgt, $I10) = self."!cursor_start"()
    getattribute rx232_debug, rx232_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx232_cur
    .local pmc match
    .lex "$/", match
    length rx232_eos, rx232_tgt
    gt rx232_pos, rx232_eos, rx232_done
    set rx232_off, 0
    lt rx232_pos, 2, rx232_start
    sub rx232_off, rx232_pos, 1
    substr rx232_tgt, rx232_tgt, rx232_off
  rx232_start:
    eq $I10, 1, rx232_restart
    if_null rx232_debug, debug_478
    rx232_cur."!cursor_debug"("START", "terminator:sym<;>")
  debug_478:
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
.annotate 'line', 150
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx232_pos, rx232_off
    substr $S10, rx232_tgt, $I10, 1
    index $I11, ";", $S10
    lt $I11, 0, rx232_fail
  # rx pass
    rx232_cur."!cursor_pass"(rx232_pos, "terminator:sym<;>")
    if_null rx232_debug, debug_479
    rx232_cur."!cursor_debug"("PASS", "terminator:sym<;>", " at pos=", rx232_pos)
  debug_479:
    .return (rx232_cur)
  rx232_restart:
.annotate 'line', 4
    if_null rx232_debug, debug_480
    rx232_cur."!cursor_debug"("NEXT", "terminator:sym<;>")
  debug_480:
  rx232_fail:
    (rx232_rep, rx232_pos, $I10, $P10) = rx232_cur."!mark_fail"(0)
    lt rx232_pos, -1, rx232_done
    eq rx232_pos, -1, rx232_fail
    jump $I10
  rx232_done:
    rx232_cur."!cursor_fail"()
    if_null rx232_debug, debug_481
    rx232_cur."!cursor_debug"("FAIL", "terminator:sym<;>")
  debug_481:
    .return (rx232_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<;>"  :subid("57_1284728478.15265") :method
.annotate 'line', 4
    new $P234, "ResizablePMCArray"
    push $P234, ";"
    .return ($P234)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("58_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx237_tgt
    .local int rx237_pos
    .local int rx237_off
    .local int rx237_eos
    .local int rx237_rep
    .local pmc rx237_cur
    .local pmc rx237_debug
    (rx237_cur, rx237_pos, rx237_tgt, $I10) = self."!cursor_start"()
    getattribute rx237_debug, rx237_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx237_cur
    .local pmc match
    .lex "$/", match
    length rx237_eos, rx237_tgt
    gt rx237_pos, rx237_eos, rx237_done
    set rx237_off, 0
    lt rx237_pos, 2, rx237_start
    sub rx237_off, rx237_pos, 1
    substr rx237_tgt, rx237_tgt, rx237_off
  rx237_start:
    eq $I10, 1, rx237_restart
    if_null rx237_debug, debug_482
    rx237_cur."!cursor_debug"("START", "terminator:sym<}>")
  debug_482:
    $I10 = self.'from'()
    ne $I10, -1, rxscan240_done
    goto rxscan240_scan
  rxscan240_loop:
    ($P10) = rx237_cur."from"()
    inc $P10
    set rx237_pos, $P10
    ge rx237_pos, rx237_eos, rxscan240_done
  rxscan240_scan:
    set_addr $I10, rxscan240_loop
    rx237_cur."!mark_push"(0, rx237_pos, $I10)
  rxscan240_done:
.annotate 'line', 151
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx237_pos, rx237_off
    substr $S10, rx237_tgt, $I10, 1
    index $I11, "}", $S10
    lt $I11, 0, rx237_fail
  # rx pass
    rx237_cur."!cursor_pass"(rx237_pos, "terminator:sym<}>")
    if_null rx237_debug, debug_483
    rx237_cur."!cursor_debug"("PASS", "terminator:sym<}>", " at pos=", rx237_pos)
  debug_483:
    .return (rx237_cur)
  rx237_restart:
.annotate 'line', 4
    if_null rx237_debug, debug_484
    rx237_cur."!cursor_debug"("NEXT", "terminator:sym<}>")
  debug_484:
  rx237_fail:
    (rx237_rep, rx237_pos, $I10, $P10) = rx237_cur."!mark_fail"(0)
    lt rx237_pos, -1, rx237_done
    eq rx237_pos, -1, rx237_fail
    jump $I10
  rx237_done:
    rx237_cur."!cursor_fail"()
    if_null rx237_debug, debug_485
    rx237_cur."!cursor_debug"("FAIL", "terminator:sym<}>")
  debug_485:
    .return (rx237_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<}>"  :subid("59_1284728478.15265") :method
.annotate 'line', 4
    new $P239, "ResizablePMCArray"
    push $P239, "}"
    .return ($P239)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("60_1284728478.15265") :method
.annotate 'line', 155
    $P242 = self."!protoregex"("statement_control")
    .return ($P242)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("61_1284728478.15265") :method
.annotate 'line', 155
    $P244 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P244)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("62_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx246_tgt
    .local int rx246_pos
    .local int rx246_off
    .local int rx246_eos
    .local int rx246_rep
    .local pmc rx246_cur
    .local pmc rx246_debug
    (rx246_cur, rx246_pos, rx246_tgt, $I10) = self."!cursor_start"()
    rx246_cur."!cursor_caparray"("else", "xblock")
    getattribute rx246_debug, rx246_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx246_cur
    .local pmc match
    .lex "$/", match
    length rx246_eos, rx246_tgt
    gt rx246_pos, rx246_eos, rx246_done
    set rx246_off, 0
    lt rx246_pos, 2, rx246_start
    sub rx246_off, rx246_pos, 1
    substr rx246_tgt, rx246_tgt, rx246_off
  rx246_start:
    eq $I10, 1, rx246_restart
    if_null rx246_debug, debug_486
    rx246_cur."!cursor_debug"("START", "statement_control:sym<if>")
  debug_486:
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
.annotate 'line', 158
  # rx subcapture "sym"
    set_addr $I10, rxcap_250_fail
    rx246_cur."!mark_push"(0, rx246_pos, $I10)
  # rx literal  "if"
    add $I11, rx246_pos, 2
    gt $I11, rx246_eos, rx246_fail
    sub $I11, rx246_pos, rx246_off
    substr $S10, rx246_tgt, $I11, 2
    ne $S10, "if", rx246_fail
    add rx246_pos, 2
    set_addr $I10, rxcap_250_fail
    ($I12, $I11) = rx246_cur."!mark_peek"($I10)
    rx246_cur."!cursor_pos"($I11)
    ($P10) = rx246_cur."!cursor_start"()
    $P10."!cursor_pass"(rx246_pos, "")
    rx246_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_250_done
  rxcap_250_fail:
    goto rx246_fail
  rxcap_250_done:
  # rx charclass s
    ge rx246_pos, rx246_eos, rx246_fail
    sub $I10, rx246_pos, rx246_off
    is_cclass $I11, 32, rx246_tgt, $I10
    unless $I11, rx246_fail
    inc rx246_pos
  # rx subrule "ws" subtype=method negate=
    rx246_cur."!cursor_pos"(rx246_pos)
    $P10 = rx246_cur."ws"()
    unless $P10, rx246_fail
    rx246_pos = $P10."pos"()
.annotate 'line', 159
  # rx subrule "xblock" subtype=capture negate=
    rx246_cur."!cursor_pos"(rx246_pos)
    $P10 = rx246_cur."xblock"()
    unless $P10, rx246_fail
    rx246_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx246_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx246_cur."!cursor_pos"(rx246_pos)
    $P10 = rx246_cur."ws"()
    unless $P10, rx246_fail
    rx246_pos = $P10."pos"()
.annotate 'line', 160
  # rx rxquantr253 ** 0..*
    set_addr $I10, rxquantr253_done
    rx246_cur."!mark_push"(0, rx246_pos, $I10)
  rxquantr253_loop:
  # rx subrule "ws" subtype=method negate=
    rx246_cur."!cursor_pos"(rx246_pos)
    $P10 = rx246_cur."ws"()
    unless $P10, rx246_fail
    rx246_pos = $P10."pos"()
  # rx literal  "elsif"
    add $I11, rx246_pos, 5
    gt $I11, rx246_eos, rx246_fail
    sub $I11, rx246_pos, rx246_off
    substr $S10, rx246_tgt, $I11, 5
    ne $S10, "elsif", rx246_fail
    add rx246_pos, 5
  # rx charclass s
    ge rx246_pos, rx246_eos, rx246_fail
    sub $I10, rx246_pos, rx246_off
    is_cclass $I11, 32, rx246_tgt, $I10
    unless $I11, rx246_fail
    inc rx246_pos
  # rx subrule "ws" subtype=method negate=
    rx246_cur."!cursor_pos"(rx246_pos)
    $P10 = rx246_cur."ws"()
    unless $P10, rx246_fail
    rx246_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx246_cur."!cursor_pos"(rx246_pos)
    $P10 = rx246_cur."xblock"()
    unless $P10, rx246_fail
    rx246_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx246_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx246_cur."!cursor_pos"(rx246_pos)
    $P10 = rx246_cur."ws"()
    unless $P10, rx246_fail
    rx246_pos = $P10."pos"()
    set_addr $I10, rxquantr253_done
    (rx246_rep) = rx246_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr253_done
    rx246_cur."!mark_push"(rx246_rep, rx246_pos, $I10)
    goto rxquantr253_loop
  rxquantr253_done:
  # rx subrule "ws" subtype=method negate=
    rx246_cur."!cursor_pos"(rx246_pos)
    $P10 = rx246_cur."ws"()
    unless $P10, rx246_fail
    rx246_pos = $P10."pos"()
.annotate 'line', 161
  # rx rxquantr258 ** 0..1
    set_addr $I10, rxquantr258_done
    rx246_cur."!mark_push"(0, rx246_pos, $I10)
  rxquantr258_loop:
  # rx subrule "ws" subtype=method negate=
    rx246_cur."!cursor_pos"(rx246_pos)
    $P10 = rx246_cur."ws"()
    unless $P10, rx246_fail
    rx246_pos = $P10."pos"()
  # rx literal  "else"
    add $I11, rx246_pos, 4
    gt $I11, rx246_eos, rx246_fail
    sub $I11, rx246_pos, rx246_off
    substr $S10, rx246_tgt, $I11, 4
    ne $S10, "else", rx246_fail
    add rx246_pos, 4
  # rx charclass s
    ge rx246_pos, rx246_eos, rx246_fail
    sub $I10, rx246_pos, rx246_off
    is_cclass $I11, 32, rx246_tgt, $I10
    unless $I11, rx246_fail
    inc rx246_pos
  # rx subrule "ws" subtype=method negate=
    rx246_cur."!cursor_pos"(rx246_pos)
    $P10 = rx246_cur."ws"()
    unless $P10, rx246_fail
    rx246_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx246_cur."!cursor_pos"(rx246_pos)
    $P10 = rx246_cur."pblock"()
    unless $P10, rx246_fail
    rx246_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("else")
    rx246_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx246_cur."!cursor_pos"(rx246_pos)
    $P10 = rx246_cur."ws"()
    unless $P10, rx246_fail
    rx246_pos = $P10."pos"()
    set_addr $I10, rxquantr258_done
    (rx246_rep) = rx246_cur."!mark_commit"($I10)
  rxquantr258_done:
  # rx subrule "ws" subtype=method negate=
    rx246_cur."!cursor_pos"(rx246_pos)
    $P10 = rx246_cur."ws"()
    unless $P10, rx246_fail
    rx246_pos = $P10."pos"()
.annotate 'line', 157
  # rx pass
    rx246_cur."!cursor_pass"(rx246_pos, "statement_control:sym<if>")
    if_null rx246_debug, debug_487
    rx246_cur."!cursor_debug"("PASS", "statement_control:sym<if>", " at pos=", rx246_pos)
  debug_487:
    .return (rx246_cur)
  rx246_restart:
.annotate 'line', 4
    if_null rx246_debug, debug_488
    rx246_cur."!cursor_debug"("NEXT", "statement_control:sym<if>")
  debug_488:
  rx246_fail:
    (rx246_rep, rx246_pos, $I10, $P10) = rx246_cur."!mark_fail"(0)
    lt rx246_pos, -1, rx246_done
    eq rx246_pos, -1, rx246_fail
    jump $I10
  rx246_done:
    rx246_cur."!cursor_fail"()
    if_null rx246_debug, debug_489
    rx246_cur."!cursor_debug"("FAIL", "statement_control:sym<if>")
  debug_489:
    .return (rx246_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<if>"  :subid("63_1284728478.15265") :method
.annotate 'line', 4
    new $P248, "ResizablePMCArray"
    push $P248, "if"
    .return ($P248)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("64_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .const 'Sub' $P274 = "66_1284728478.15265" 
    capture_lex $P274
    .local string rx264_tgt
    .local int rx264_pos
    .local int rx264_off
    .local int rx264_eos
    .local int rx264_rep
    .local pmc rx264_cur
    .local pmc rx264_debug
    (rx264_cur, rx264_pos, rx264_tgt, $I10) = self."!cursor_start"()
    getattribute rx264_debug, rx264_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx264_cur
    .local pmc match
    .lex "$/", match
    length rx264_eos, rx264_tgt
    gt rx264_pos, rx264_eos, rx264_done
    set rx264_off, 0
    lt rx264_pos, 2, rx264_start
    sub rx264_off, rx264_pos, 1
    substr rx264_tgt, rx264_tgt, rx264_off
  rx264_start:
    eq $I10, 1, rx264_restart
    if_null rx264_debug, debug_490
    rx264_cur."!cursor_debug"("START", "statement_control:sym<unless>")
  debug_490:
    $I10 = self.'from'()
    ne $I10, -1, rxscan267_done
    goto rxscan267_scan
  rxscan267_loop:
    ($P10) = rx264_cur."from"()
    inc $P10
    set rx264_pos, $P10
    ge rx264_pos, rx264_eos, rxscan267_done
  rxscan267_scan:
    set_addr $I10, rxscan267_loop
    rx264_cur."!mark_push"(0, rx264_pos, $I10)
  rxscan267_done:
.annotate 'line', 165
  # rx subcapture "sym"
    set_addr $I10, rxcap_268_fail
    rx264_cur."!mark_push"(0, rx264_pos, $I10)
  # rx literal  "unless"
    add $I11, rx264_pos, 6
    gt $I11, rx264_eos, rx264_fail
    sub $I11, rx264_pos, rx264_off
    substr $S10, rx264_tgt, $I11, 6
    ne $S10, "unless", rx264_fail
    add rx264_pos, 6
    set_addr $I10, rxcap_268_fail
    ($I12, $I11) = rx264_cur."!mark_peek"($I10)
    rx264_cur."!cursor_pos"($I11)
    ($P10) = rx264_cur."!cursor_start"()
    $P10."!cursor_pass"(rx264_pos, "")
    rx264_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_268_done
  rxcap_268_fail:
    goto rx264_fail
  rxcap_268_done:
  # rx charclass s
    ge rx264_pos, rx264_eos, rx264_fail
    sub $I10, rx264_pos, rx264_off
    is_cclass $I11, 32, rx264_tgt, $I10
    unless $I11, rx264_fail
    inc rx264_pos
  # rx subrule "ws" subtype=method negate=
    rx264_cur."!cursor_pos"(rx264_pos)
    $P10 = rx264_cur."ws"()
    unless $P10, rx264_fail
    rx264_pos = $P10."pos"()
.annotate 'line', 166
  # rx subrule "xblock" subtype=capture negate=
    rx264_cur."!cursor_pos"(rx264_pos)
    $P10 = rx264_cur."xblock"()
    unless $P10, rx264_fail
    rx264_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx264_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx264_cur."!cursor_pos"(rx264_pos)
    $P10 = rx264_cur."ws"()
    unless $P10, rx264_fail
    rx264_pos = $P10."pos"()
  alt271_0:
.annotate 'line', 167
    set_addr $I10, alt271_1
    rx264_cur."!mark_push"(0, rx264_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx264_cur."!cursor_pos"(rx264_pos)
    $P10 = rx264_cur."ws"()
    unless $P10, rx264_fail
    rx264_pos = $P10."pos"()
  # rx subrule "before" subtype=zerowidth negate=1
    rx264_cur."!cursor_pos"(rx264_pos)
    .const 'Sub' $P274 = "66_1284728478.15265" 
    capture_lex $P274
    $P10 = rx264_cur."before"($P274)
    if $P10, rx264_fail
  # rx subrule "ws" subtype=method negate=
    rx264_cur."!cursor_pos"(rx264_pos)
    $P10 = rx264_cur."ws"()
    unless $P10, rx264_fail
    rx264_pos = $P10."pos"()
    goto alt271_end
  alt271_1:
  # rx subrule "ws" subtype=method negate=
    rx264_cur."!cursor_pos"(rx264_pos)
    $P10 = rx264_cur."ws"()
    unless $P10, rx264_fail
    rx264_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx264_cur."!cursor_pos"(rx264_pos)
    $P10 = rx264_cur."panic"("unless does not take \"else\", please rewrite using \"if\"")
    unless $P10, rx264_fail
    rx264_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx264_cur."!cursor_pos"(rx264_pos)
    $P10 = rx264_cur."ws"()
    unless $P10, rx264_fail
    rx264_pos = $P10."pos"()
  alt271_end:
  # rx subrule "ws" subtype=method negate=
    rx264_cur."!cursor_pos"(rx264_pos)
    $P10 = rx264_cur."ws"()
    unless $P10, rx264_fail
    rx264_pos = $P10."pos"()
.annotate 'line', 164
  # rx pass
    rx264_cur."!cursor_pass"(rx264_pos, "statement_control:sym<unless>")
    if_null rx264_debug, debug_495
    rx264_cur."!cursor_debug"("PASS", "statement_control:sym<unless>", " at pos=", rx264_pos)
  debug_495:
    .return (rx264_cur)
  rx264_restart:
.annotate 'line', 4
    if_null rx264_debug, debug_496
    rx264_cur."!cursor_debug"("NEXT", "statement_control:sym<unless>")
  debug_496:
  rx264_fail:
    (rx264_rep, rx264_pos, $I10, $P10) = rx264_cur."!mark_fail"(0)
    lt rx264_pos, -1, rx264_done
    eq rx264_pos, -1, rx264_fail
    jump $I10
  rx264_done:
    rx264_cur."!cursor_fail"()
    if_null rx264_debug, debug_497
    rx264_cur."!cursor_debug"("FAIL", "statement_control:sym<unless>")
  debug_497:
    .return (rx264_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<unless>"  :subid("65_1284728478.15265") :method
.annotate 'line', 4
    new $P266, "ResizablePMCArray"
    push $P266, "unless"
    .return ($P266)
.end


.namespace ["NQP";"Grammar"]
.sub "_block273"  :anon :subid("66_1284728478.15265") :method :outer("64_1284728478.15265")
.annotate 'line', 167
    .local string rx275_tgt
    .local int rx275_pos
    .local int rx275_off
    .local int rx275_eos
    .local int rx275_rep
    .local pmc rx275_cur
    .local pmc rx275_debug
    (rx275_cur, rx275_pos, rx275_tgt, $I10) = self."!cursor_start"()
    getattribute rx275_debug, rx275_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx275_cur
    .local pmc match
    .lex "$/", match
    length rx275_eos, rx275_tgt
    gt rx275_pos, rx275_eos, rx275_done
    set rx275_off, 0
    lt rx275_pos, 2, rx275_start
    sub rx275_off, rx275_pos, 1
    substr rx275_tgt, rx275_tgt, rx275_off
  rx275_start:
    eq $I10, 1, rx275_restart
    if_null rx275_debug, debug_491
    rx275_cur."!cursor_debug"("START", "")
  debug_491:
    $I10 = self.'from'()
    ne $I10, -1, rxscan276_done
    goto rxscan276_scan
  rxscan276_loop:
    ($P10) = rx275_cur."from"()
    inc $P10
    set rx275_pos, $P10
    ge rx275_pos, rx275_eos, rxscan276_done
  rxscan276_scan:
    set_addr $I10, rxscan276_loop
    rx275_cur."!mark_push"(0, rx275_pos, $I10)
  rxscan276_done:
  # rx literal  "else"
    add $I11, rx275_pos, 4
    gt $I11, rx275_eos, rx275_fail
    sub $I11, rx275_pos, rx275_off
    substr $S10, rx275_tgt, $I11, 4
    ne $S10, "else", rx275_fail
    add rx275_pos, 4
  # rx pass
    rx275_cur."!cursor_pass"(rx275_pos, "")
    if_null rx275_debug, debug_492
    rx275_cur."!cursor_debug"("PASS", "", " at pos=", rx275_pos)
  debug_492:
    .return (rx275_cur)
  rx275_restart:
    if_null rx275_debug, debug_493
    rx275_cur."!cursor_debug"("NEXT", "")
  debug_493:
  rx275_fail:
    (rx275_rep, rx275_pos, $I10, $P10) = rx275_cur."!mark_fail"(0)
    lt rx275_pos, -1, rx275_done
    eq rx275_pos, -1, rx275_fail
    jump $I10
  rx275_done:
    rx275_cur."!cursor_fail"()
    if_null rx275_debug, debug_494
    rx275_cur."!cursor_debug"("FAIL", "")
  debug_494:
    .return (rx275_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<while>"  :subid("67_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx282_tgt
    .local int rx282_pos
    .local int rx282_off
    .local int rx282_eos
    .local int rx282_rep
    .local pmc rx282_cur
    .local pmc rx282_debug
    (rx282_cur, rx282_pos, rx282_tgt, $I10) = self."!cursor_start"()
    getattribute rx282_debug, rx282_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx282_cur
    .local pmc match
    .lex "$/", match
    length rx282_eos, rx282_tgt
    gt rx282_pos, rx282_eos, rx282_done
    set rx282_off, 0
    lt rx282_pos, 2, rx282_start
    sub rx282_off, rx282_pos, 1
    substr rx282_tgt, rx282_tgt, rx282_off
  rx282_start:
    eq $I10, 1, rx282_restart
    if_null rx282_debug, debug_498
    rx282_cur."!cursor_debug"("START", "statement_control:sym<while>")
  debug_498:
    $I10 = self.'from'()
    ne $I10, -1, rxscan285_done
    goto rxscan285_scan
  rxscan285_loop:
    ($P10) = rx282_cur."from"()
    inc $P10
    set rx282_pos, $P10
    ge rx282_pos, rx282_eos, rxscan285_done
  rxscan285_scan:
    set_addr $I10, rxscan285_loop
    rx282_cur."!mark_push"(0, rx282_pos, $I10)
  rxscan285_done:
.annotate 'line', 171
  # rx subcapture "sym"
    set_addr $I10, rxcap_287_fail
    rx282_cur."!mark_push"(0, rx282_pos, $I10)
  alt286_0:
    set_addr $I10, alt286_1
    rx282_cur."!mark_push"(0, rx282_pos, $I10)
  # rx literal  "while"
    add $I11, rx282_pos, 5
    gt $I11, rx282_eos, rx282_fail
    sub $I11, rx282_pos, rx282_off
    substr $S10, rx282_tgt, $I11, 5
    ne $S10, "while", rx282_fail
    add rx282_pos, 5
    goto alt286_end
  alt286_1:
  # rx literal  "until"
    add $I11, rx282_pos, 5
    gt $I11, rx282_eos, rx282_fail
    sub $I11, rx282_pos, rx282_off
    substr $S10, rx282_tgt, $I11, 5
    ne $S10, "until", rx282_fail
    add rx282_pos, 5
  alt286_end:
    set_addr $I10, rxcap_287_fail
    ($I12, $I11) = rx282_cur."!mark_peek"($I10)
    rx282_cur."!cursor_pos"($I11)
    ($P10) = rx282_cur."!cursor_start"()
    $P10."!cursor_pass"(rx282_pos, "")
    rx282_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_287_done
  rxcap_287_fail:
    goto rx282_fail
  rxcap_287_done:
  # rx charclass s
    ge rx282_pos, rx282_eos, rx282_fail
    sub $I10, rx282_pos, rx282_off
    is_cclass $I11, 32, rx282_tgt, $I10
    unless $I11, rx282_fail
    inc rx282_pos
  # rx subrule "ws" subtype=method negate=
    rx282_cur."!cursor_pos"(rx282_pos)
    $P10 = rx282_cur."ws"()
    unless $P10, rx282_fail
    rx282_pos = $P10."pos"()
.annotate 'line', 172
  # rx subrule "xblock" subtype=capture negate=
    rx282_cur."!cursor_pos"(rx282_pos)
    $P10 = rx282_cur."xblock"()
    unless $P10, rx282_fail
    rx282_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx282_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx282_cur."!cursor_pos"(rx282_pos)
    $P10 = rx282_cur."ws"()
    unless $P10, rx282_fail
    rx282_pos = $P10."pos"()
.annotate 'line', 170
  # rx pass
    rx282_cur."!cursor_pass"(rx282_pos, "statement_control:sym<while>")
    if_null rx282_debug, debug_499
    rx282_cur."!cursor_debug"("PASS", "statement_control:sym<while>", " at pos=", rx282_pos)
  debug_499:
    .return (rx282_cur)
  rx282_restart:
.annotate 'line', 4
    if_null rx282_debug, debug_500
    rx282_cur."!cursor_debug"("NEXT", "statement_control:sym<while>")
  debug_500:
  rx282_fail:
    (rx282_rep, rx282_pos, $I10, $P10) = rx282_cur."!mark_fail"(0)
    lt rx282_pos, -1, rx282_done
    eq rx282_pos, -1, rx282_fail
    jump $I10
  rx282_done:
    rx282_cur."!cursor_fail"()
    if_null rx282_debug, debug_501
    rx282_cur."!cursor_debug"("FAIL", "statement_control:sym<while>")
  debug_501:
    .return (rx282_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<while>"  :subid("68_1284728478.15265") :method
.annotate 'line', 4
    new $P284, "ResizablePMCArray"
    push $P284, "until"
    push $P284, "while"
    .return ($P284)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("69_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx291_tgt
    .local int rx291_pos
    .local int rx291_off
    .local int rx291_eos
    .local int rx291_rep
    .local pmc rx291_cur
    .local pmc rx291_debug
    (rx291_cur, rx291_pos, rx291_tgt, $I10) = self."!cursor_start"()
    getattribute rx291_debug, rx291_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx291_cur
    .local pmc match
    .lex "$/", match
    length rx291_eos, rx291_tgt
    gt rx291_pos, rx291_eos, rx291_done
    set rx291_off, 0
    lt rx291_pos, 2, rx291_start
    sub rx291_off, rx291_pos, 1
    substr rx291_tgt, rx291_tgt, rx291_off
  rx291_start:
    eq $I10, 1, rx291_restart
    if_null rx291_debug, debug_502
    rx291_cur."!cursor_debug"("START", "statement_control:sym<repeat>")
  debug_502:
    $I10 = self.'from'()
    ne $I10, -1, rxscan294_done
    goto rxscan294_scan
  rxscan294_loop:
    ($P10) = rx291_cur."from"()
    inc $P10
    set rx291_pos, $P10
    ge rx291_pos, rx291_eos, rxscan294_done
  rxscan294_scan:
    set_addr $I10, rxscan294_loop
    rx291_cur."!mark_push"(0, rx291_pos, $I10)
  rxscan294_done:
.annotate 'line', 176
  # rx subcapture "sym"
    set_addr $I10, rxcap_295_fail
    rx291_cur."!mark_push"(0, rx291_pos, $I10)
  # rx literal  "repeat"
    add $I11, rx291_pos, 6
    gt $I11, rx291_eos, rx291_fail
    sub $I11, rx291_pos, rx291_off
    substr $S10, rx291_tgt, $I11, 6
    ne $S10, "repeat", rx291_fail
    add rx291_pos, 6
    set_addr $I10, rxcap_295_fail
    ($I12, $I11) = rx291_cur."!mark_peek"($I10)
    rx291_cur."!cursor_pos"($I11)
    ($P10) = rx291_cur."!cursor_start"()
    $P10."!cursor_pass"(rx291_pos, "")
    rx291_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_295_done
  rxcap_295_fail:
    goto rx291_fail
  rxcap_295_done:
  # rx charclass s
    ge rx291_pos, rx291_eos, rx291_fail
    sub $I10, rx291_pos, rx291_off
    is_cclass $I11, 32, rx291_tgt, $I10
    unless $I11, rx291_fail
    inc rx291_pos
  # rx subrule "ws" subtype=method negate=
    rx291_cur."!cursor_pos"(rx291_pos)
    $P10 = rx291_cur."ws"()
    unless $P10, rx291_fail
    rx291_pos = $P10."pos"()
  alt297_0:
.annotate 'line', 177
    set_addr $I10, alt297_1
    rx291_cur."!mark_push"(0, rx291_pos, $I10)
.annotate 'line', 178
  # rx subrule "ws" subtype=method negate=
    rx291_cur."!cursor_pos"(rx291_pos)
    $P10 = rx291_cur."ws"()
    unless $P10, rx291_fail
    rx291_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_300_fail
    rx291_cur."!mark_push"(0, rx291_pos, $I10)
  alt299_0:
    set_addr $I10, alt299_1
    rx291_cur."!mark_push"(0, rx291_pos, $I10)
  # rx literal  "while"
    add $I11, rx291_pos, 5
    gt $I11, rx291_eos, rx291_fail
    sub $I11, rx291_pos, rx291_off
    substr $S10, rx291_tgt, $I11, 5
    ne $S10, "while", rx291_fail
    add rx291_pos, 5
    goto alt299_end
  alt299_1:
  # rx literal  "until"
    add $I11, rx291_pos, 5
    gt $I11, rx291_eos, rx291_fail
    sub $I11, rx291_pos, rx291_off
    substr $S10, rx291_tgt, $I11, 5
    ne $S10, "until", rx291_fail
    add rx291_pos, 5
  alt299_end:
    set_addr $I10, rxcap_300_fail
    ($I12, $I11) = rx291_cur."!mark_peek"($I10)
    rx291_cur."!cursor_pos"($I11)
    ($P10) = rx291_cur."!cursor_start"()
    $P10."!cursor_pass"(rx291_pos, "")
    rx291_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_300_done
  rxcap_300_fail:
    goto rx291_fail
  rxcap_300_done:
  # rx charclass s
    ge rx291_pos, rx291_eos, rx291_fail
    sub $I10, rx291_pos, rx291_off
    is_cclass $I11, 32, rx291_tgt, $I10
    unless $I11, rx291_fail
    inc rx291_pos
  # rx subrule "ws" subtype=method negate=
    rx291_cur."!cursor_pos"(rx291_pos)
    $P10 = rx291_cur."ws"()
    unless $P10, rx291_fail
    rx291_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx291_cur."!cursor_pos"(rx291_pos)
    $P10 = rx291_cur."xblock"()
    unless $P10, rx291_fail
    rx291_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx291_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx291_cur."!cursor_pos"(rx291_pos)
    $P10 = rx291_cur."ws"()
    unless $P10, rx291_fail
    rx291_pos = $P10."pos"()
    goto alt297_end
  alt297_1:
.annotate 'line', 179
  # rx subrule "ws" subtype=method negate=
    rx291_cur."!cursor_pos"(rx291_pos)
    $P10 = rx291_cur."ws"()
    unless $P10, rx291_fail
    rx291_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx291_cur."!cursor_pos"(rx291_pos)
    $P10 = rx291_cur."pblock"()
    unless $P10, rx291_fail
    rx291_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx291_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx291_cur."!cursor_pos"(rx291_pos)
    $P10 = rx291_cur."ws"()
    unless $P10, rx291_fail
    rx291_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_306_fail
    rx291_cur."!mark_push"(0, rx291_pos, $I10)
  alt305_0:
    set_addr $I10, alt305_1
    rx291_cur."!mark_push"(0, rx291_pos, $I10)
  # rx literal  "while"
    add $I11, rx291_pos, 5
    gt $I11, rx291_eos, rx291_fail
    sub $I11, rx291_pos, rx291_off
    substr $S10, rx291_tgt, $I11, 5
    ne $S10, "while", rx291_fail
    add rx291_pos, 5
    goto alt305_end
  alt305_1:
  # rx literal  "until"
    add $I11, rx291_pos, 5
    gt $I11, rx291_eos, rx291_fail
    sub $I11, rx291_pos, rx291_off
    substr $S10, rx291_tgt, $I11, 5
    ne $S10, "until", rx291_fail
    add rx291_pos, 5
  alt305_end:
    set_addr $I10, rxcap_306_fail
    ($I12, $I11) = rx291_cur."!mark_peek"($I10)
    rx291_cur."!cursor_pos"($I11)
    ($P10) = rx291_cur."!cursor_start"()
    $P10."!cursor_pass"(rx291_pos, "")
    rx291_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_306_done
  rxcap_306_fail:
    goto rx291_fail
  rxcap_306_done:
  # rx charclass s
    ge rx291_pos, rx291_eos, rx291_fail
    sub $I10, rx291_pos, rx291_off
    is_cclass $I11, 32, rx291_tgt, $I10
    unless $I11, rx291_fail
    inc rx291_pos
  # rx subrule "ws" subtype=method negate=
    rx291_cur."!cursor_pos"(rx291_pos)
    $P10 = rx291_cur."ws"()
    unless $P10, rx291_fail
    rx291_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx291_cur."!cursor_pos"(rx291_pos)
    $P10 = rx291_cur."EXPR"()
    unless $P10, rx291_fail
    rx291_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx291_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx291_cur."!cursor_pos"(rx291_pos)
    $P10 = rx291_cur."ws"()
    unless $P10, rx291_fail
    rx291_pos = $P10."pos"()
  alt297_end:
.annotate 'line', 180
  # rx subrule "ws" subtype=method negate=
    rx291_cur."!cursor_pos"(rx291_pos)
    $P10 = rx291_cur."ws"()
    unless $P10, rx291_fail
    rx291_pos = $P10."pos"()
.annotate 'line', 175
  # rx pass
    rx291_cur."!cursor_pass"(rx291_pos, "statement_control:sym<repeat>")
    if_null rx291_debug, debug_503
    rx291_cur."!cursor_debug"("PASS", "statement_control:sym<repeat>", " at pos=", rx291_pos)
  debug_503:
    .return (rx291_cur)
  rx291_restart:
.annotate 'line', 4
    if_null rx291_debug, debug_504
    rx291_cur."!cursor_debug"("NEXT", "statement_control:sym<repeat>")
  debug_504:
  rx291_fail:
    (rx291_rep, rx291_pos, $I10, $P10) = rx291_cur."!mark_fail"(0)
    lt rx291_pos, -1, rx291_done
    eq rx291_pos, -1, rx291_fail
    jump $I10
  rx291_done:
    rx291_cur."!cursor_fail"()
    if_null rx291_debug, debug_505
    rx291_cur."!cursor_debug"("FAIL", "statement_control:sym<repeat>")
  debug_505:
    .return (rx291_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("70_1284728478.15265") :method
.annotate 'line', 4
    new $P293, "ResizablePMCArray"
    push $P293, "repeat"
    .return ($P293)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("71_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx311_tgt
    .local int rx311_pos
    .local int rx311_off
    .local int rx311_eos
    .local int rx311_rep
    .local pmc rx311_cur
    .local pmc rx311_debug
    (rx311_cur, rx311_pos, rx311_tgt, $I10) = self."!cursor_start"()
    getattribute rx311_debug, rx311_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx311_cur
    .local pmc match
    .lex "$/", match
    length rx311_eos, rx311_tgt
    gt rx311_pos, rx311_eos, rx311_done
    set rx311_off, 0
    lt rx311_pos, 2, rx311_start
    sub rx311_off, rx311_pos, 1
    substr rx311_tgt, rx311_tgt, rx311_off
  rx311_start:
    eq $I10, 1, rx311_restart
    if_null rx311_debug, debug_506
    rx311_cur."!cursor_debug"("START", "statement_control:sym<for>")
  debug_506:
    $I10 = self.'from'()
    ne $I10, -1, rxscan314_done
    goto rxscan314_scan
  rxscan314_loop:
    ($P10) = rx311_cur."from"()
    inc $P10
    set rx311_pos, $P10
    ge rx311_pos, rx311_eos, rxscan314_done
  rxscan314_scan:
    set_addr $I10, rxscan314_loop
    rx311_cur."!mark_push"(0, rx311_pos, $I10)
  rxscan314_done:
.annotate 'line', 184
  # rx subcapture "sym"
    set_addr $I10, rxcap_315_fail
    rx311_cur."!mark_push"(0, rx311_pos, $I10)
  # rx literal  "for"
    add $I11, rx311_pos, 3
    gt $I11, rx311_eos, rx311_fail
    sub $I11, rx311_pos, rx311_off
    substr $S10, rx311_tgt, $I11, 3
    ne $S10, "for", rx311_fail
    add rx311_pos, 3
    set_addr $I10, rxcap_315_fail
    ($I12, $I11) = rx311_cur."!mark_peek"($I10)
    rx311_cur."!cursor_pos"($I11)
    ($P10) = rx311_cur."!cursor_start"()
    $P10."!cursor_pass"(rx311_pos, "")
    rx311_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_315_done
  rxcap_315_fail:
    goto rx311_fail
  rxcap_315_done:
  # rx charclass s
    ge rx311_pos, rx311_eos, rx311_fail
    sub $I10, rx311_pos, rx311_off
    is_cclass $I11, 32, rx311_tgt, $I10
    unless $I11, rx311_fail
    inc rx311_pos
  # rx subrule "ws" subtype=method negate=
    rx311_cur."!cursor_pos"(rx311_pos)
    $P10 = rx311_cur."ws"()
    unless $P10, rx311_fail
    rx311_pos = $P10."pos"()
.annotate 'line', 185
  # rx subrule "xblock" subtype=capture negate=
    rx311_cur."!cursor_pos"(rx311_pos)
    $P10 = rx311_cur."xblock"()
    unless $P10, rx311_fail
    rx311_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx311_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx311_cur."!cursor_pos"(rx311_pos)
    $P10 = rx311_cur."ws"()
    unless $P10, rx311_fail
    rx311_pos = $P10."pos"()
.annotate 'line', 183
  # rx pass
    rx311_cur."!cursor_pass"(rx311_pos, "statement_control:sym<for>")
    if_null rx311_debug, debug_507
    rx311_cur."!cursor_debug"("PASS", "statement_control:sym<for>", " at pos=", rx311_pos)
  debug_507:
    .return (rx311_cur)
  rx311_restart:
.annotate 'line', 4
    if_null rx311_debug, debug_508
    rx311_cur."!cursor_debug"("NEXT", "statement_control:sym<for>")
  debug_508:
  rx311_fail:
    (rx311_rep, rx311_pos, $I10, $P10) = rx311_cur."!mark_fail"(0)
    lt rx311_pos, -1, rx311_done
    eq rx311_pos, -1, rx311_fail
    jump $I10
  rx311_done:
    rx311_cur."!cursor_fail"()
    if_null rx311_debug, debug_509
    rx311_cur."!cursor_debug"("FAIL", "statement_control:sym<for>")
  debug_509:
    .return (rx311_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<for>"  :subid("72_1284728478.15265") :method
.annotate 'line', 4
    new $P313, "ResizablePMCArray"
    push $P313, "for"
    .return ($P313)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CATCH>"  :subid("73_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx319_tgt
    .local int rx319_pos
    .local int rx319_off
    .local int rx319_eos
    .local int rx319_rep
    .local pmc rx319_cur
    .local pmc rx319_debug
    (rx319_cur, rx319_pos, rx319_tgt, $I10) = self."!cursor_start"()
    getattribute rx319_debug, rx319_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx319_cur
    .local pmc match
    .lex "$/", match
    length rx319_eos, rx319_tgt
    gt rx319_pos, rx319_eos, rx319_done
    set rx319_off, 0
    lt rx319_pos, 2, rx319_start
    sub rx319_off, rx319_pos, 1
    substr rx319_tgt, rx319_tgt, rx319_off
  rx319_start:
    eq $I10, 1, rx319_restart
    if_null rx319_debug, debug_510
    rx319_cur."!cursor_debug"("START", "statement_control:sym<CATCH>")
  debug_510:
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
.annotate 'line', 189
  # rx subcapture "sym"
    set_addr $I10, rxcap_323_fail
    rx319_cur."!mark_push"(0, rx319_pos, $I10)
  # rx literal  "CATCH"
    add $I11, rx319_pos, 5
    gt $I11, rx319_eos, rx319_fail
    sub $I11, rx319_pos, rx319_off
    substr $S10, rx319_tgt, $I11, 5
    ne $S10, "CATCH", rx319_fail
    add rx319_pos, 5
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
.annotate 'line', 190
  # rx subrule "block" subtype=capture negate=
    rx319_cur."!cursor_pos"(rx319_pos)
    $P10 = rx319_cur."block"()
    unless $P10, rx319_fail
    rx319_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx319_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx319_cur."!cursor_pos"(rx319_pos)
    $P10 = rx319_cur."ws"()
    unless $P10, rx319_fail
    rx319_pos = $P10."pos"()
.annotate 'line', 188
  # rx pass
    rx319_cur."!cursor_pass"(rx319_pos, "statement_control:sym<CATCH>")
    if_null rx319_debug, debug_511
    rx319_cur."!cursor_debug"("PASS", "statement_control:sym<CATCH>", " at pos=", rx319_pos)
  debug_511:
    .return (rx319_cur)
  rx319_restart:
.annotate 'line', 4
    if_null rx319_debug, debug_512
    rx319_cur."!cursor_debug"("NEXT", "statement_control:sym<CATCH>")
  debug_512:
  rx319_fail:
    (rx319_rep, rx319_pos, $I10, $P10) = rx319_cur."!mark_fail"(0)
    lt rx319_pos, -1, rx319_done
    eq rx319_pos, -1, rx319_fail
    jump $I10
  rx319_done:
    rx319_cur."!cursor_fail"()
    if_null rx319_debug, debug_513
    rx319_cur."!cursor_debug"("FAIL", "statement_control:sym<CATCH>")
  debug_513:
    .return (rx319_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CATCH>"  :subid("74_1284728478.15265") :method
.annotate 'line', 4
    new $P321, "ResizablePMCArray"
    push $P321, "CATCH"
    .return ($P321)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CONTROL>"  :subid("75_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx327_tgt
    .local int rx327_pos
    .local int rx327_off
    .local int rx327_eos
    .local int rx327_rep
    .local pmc rx327_cur
    .local pmc rx327_debug
    (rx327_cur, rx327_pos, rx327_tgt, $I10) = self."!cursor_start"()
    getattribute rx327_debug, rx327_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx327_cur
    .local pmc match
    .lex "$/", match
    length rx327_eos, rx327_tgt
    gt rx327_pos, rx327_eos, rx327_done
    set rx327_off, 0
    lt rx327_pos, 2, rx327_start
    sub rx327_off, rx327_pos, 1
    substr rx327_tgt, rx327_tgt, rx327_off
  rx327_start:
    eq $I10, 1, rx327_restart
    if_null rx327_debug, debug_514
    rx327_cur."!cursor_debug"("START", "statement_control:sym<CONTROL>")
  debug_514:
    $I10 = self.'from'()
    ne $I10, -1, rxscan330_done
    goto rxscan330_scan
  rxscan330_loop:
    ($P10) = rx327_cur."from"()
    inc $P10
    set rx327_pos, $P10
    ge rx327_pos, rx327_eos, rxscan330_done
  rxscan330_scan:
    set_addr $I10, rxscan330_loop
    rx327_cur."!mark_push"(0, rx327_pos, $I10)
  rxscan330_done:
.annotate 'line', 194
  # rx subcapture "sym"
    set_addr $I10, rxcap_331_fail
    rx327_cur."!mark_push"(0, rx327_pos, $I10)
  # rx literal  "CONTROL"
    add $I11, rx327_pos, 7
    gt $I11, rx327_eos, rx327_fail
    sub $I11, rx327_pos, rx327_off
    substr $S10, rx327_tgt, $I11, 7
    ne $S10, "CONTROL", rx327_fail
    add rx327_pos, 7
    set_addr $I10, rxcap_331_fail
    ($I12, $I11) = rx327_cur."!mark_peek"($I10)
    rx327_cur."!cursor_pos"($I11)
    ($P10) = rx327_cur."!cursor_start"()
    $P10."!cursor_pass"(rx327_pos, "")
    rx327_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_331_done
  rxcap_331_fail:
    goto rx327_fail
  rxcap_331_done:
  # rx charclass s
    ge rx327_pos, rx327_eos, rx327_fail
    sub $I10, rx327_pos, rx327_off
    is_cclass $I11, 32, rx327_tgt, $I10
    unless $I11, rx327_fail
    inc rx327_pos
  # rx subrule "ws" subtype=method negate=
    rx327_cur."!cursor_pos"(rx327_pos)
    $P10 = rx327_cur."ws"()
    unless $P10, rx327_fail
    rx327_pos = $P10."pos"()
.annotate 'line', 195
  # rx subrule "block" subtype=capture negate=
    rx327_cur."!cursor_pos"(rx327_pos)
    $P10 = rx327_cur."block"()
    unless $P10, rx327_fail
    rx327_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx327_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx327_cur."!cursor_pos"(rx327_pos)
    $P10 = rx327_cur."ws"()
    unless $P10, rx327_fail
    rx327_pos = $P10."pos"()
.annotate 'line', 193
  # rx pass
    rx327_cur."!cursor_pass"(rx327_pos, "statement_control:sym<CONTROL>")
    if_null rx327_debug, debug_515
    rx327_cur."!cursor_debug"("PASS", "statement_control:sym<CONTROL>", " at pos=", rx327_pos)
  debug_515:
    .return (rx327_cur)
  rx327_restart:
.annotate 'line', 4
    if_null rx327_debug, debug_516
    rx327_cur."!cursor_debug"("NEXT", "statement_control:sym<CONTROL>")
  debug_516:
  rx327_fail:
    (rx327_rep, rx327_pos, $I10, $P10) = rx327_cur."!mark_fail"(0)
    lt rx327_pos, -1, rx327_done
    eq rx327_pos, -1, rx327_fail
    jump $I10
  rx327_done:
    rx327_cur."!cursor_fail"()
    if_null rx327_debug, debug_517
    rx327_cur."!cursor_debug"("FAIL", "statement_control:sym<CONTROL>")
  debug_517:
    .return (rx327_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CONTROL>"  :subid("76_1284728478.15265") :method
.annotate 'line', 4
    new $P329, "ResizablePMCArray"
    push $P329, "CONTROL"
    .return ($P329)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("77_1284728478.15265") :method
.annotate 'line', 198
    $P335 = self."!protoregex"("statement_prefix")
    .return ($P335)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("78_1284728478.15265") :method
.annotate 'line', 198
    $P337 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P337)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("79_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx339_tgt
    .local int rx339_pos
    .local int rx339_off
    .local int rx339_eos
    .local int rx339_rep
    .local pmc rx339_cur
    .local pmc rx339_debug
    (rx339_cur, rx339_pos, rx339_tgt, $I10) = self."!cursor_start"()
    getattribute rx339_debug, rx339_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx339_cur
    .local pmc match
    .lex "$/", match
    length rx339_eos, rx339_tgt
    gt rx339_pos, rx339_eos, rx339_done
    set rx339_off, 0
    lt rx339_pos, 2, rx339_start
    sub rx339_off, rx339_pos, 1
    substr rx339_tgt, rx339_tgt, rx339_off
  rx339_start:
    eq $I10, 1, rx339_restart
    if_null rx339_debug, debug_518
    rx339_cur."!cursor_debug"("START", "statement_prefix:sym<INIT>")
  debug_518:
    $I10 = self.'from'()
    ne $I10, -1, rxscan343_done
    goto rxscan343_scan
  rxscan343_loop:
    ($P10) = rx339_cur."from"()
    inc $P10
    set rx339_pos, $P10
    ge rx339_pos, rx339_eos, rxscan343_done
  rxscan343_scan:
    set_addr $I10, rxscan343_loop
    rx339_cur."!mark_push"(0, rx339_pos, $I10)
  rxscan343_done:
.annotate 'line', 199
  # rx subcapture "sym"
    set_addr $I10, rxcap_344_fail
    rx339_cur."!mark_push"(0, rx339_pos, $I10)
  # rx literal  "INIT"
    add $I11, rx339_pos, 4
    gt $I11, rx339_eos, rx339_fail
    sub $I11, rx339_pos, rx339_off
    substr $S10, rx339_tgt, $I11, 4
    ne $S10, "INIT", rx339_fail
    add rx339_pos, 4
    set_addr $I10, rxcap_344_fail
    ($I12, $I11) = rx339_cur."!mark_peek"($I10)
    rx339_cur."!cursor_pos"($I11)
    ($P10) = rx339_cur."!cursor_start"()
    $P10."!cursor_pass"(rx339_pos, "")
    rx339_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_344_done
  rxcap_344_fail:
    goto rx339_fail
  rxcap_344_done:
  # rx subrule "blorst" subtype=capture negate=
    rx339_cur."!cursor_pos"(rx339_pos)
    $P10 = rx339_cur."blorst"()
    unless $P10, rx339_fail
    rx339_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx339_pos = $P10."pos"()
  # rx pass
    rx339_cur."!cursor_pass"(rx339_pos, "statement_prefix:sym<INIT>")
    if_null rx339_debug, debug_519
    rx339_cur."!cursor_debug"("PASS", "statement_prefix:sym<INIT>", " at pos=", rx339_pos)
  debug_519:
    .return (rx339_cur)
  rx339_restart:
.annotate 'line', 4
    if_null rx339_debug, debug_520
    rx339_cur."!cursor_debug"("NEXT", "statement_prefix:sym<INIT>")
  debug_520:
  rx339_fail:
    (rx339_rep, rx339_pos, $I10, $P10) = rx339_cur."!mark_fail"(0)
    lt rx339_pos, -1, rx339_done
    eq rx339_pos, -1, rx339_fail
    jump $I10
  rx339_done:
    rx339_cur."!cursor_fail"()
    if_null rx339_debug, debug_521
    rx339_cur."!cursor_debug"("FAIL", "statement_prefix:sym<INIT>")
  debug_521:
    .return (rx339_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("80_1284728478.15265") :method
.annotate 'line', 4
    $P341 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P342, "ResizablePMCArray"
    push $P342, $P341
    .return ($P342)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<try>"  :subid("81_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx346_tgt
    .local int rx346_pos
    .local int rx346_off
    .local int rx346_eos
    .local int rx346_rep
    .local pmc rx346_cur
    .local pmc rx346_debug
    (rx346_cur, rx346_pos, rx346_tgt, $I10) = self."!cursor_start"()
    getattribute rx346_debug, rx346_cur, "$!debug"
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
    eq $I10, 1, rx346_restart
    if_null rx346_debug, debug_522
    rx346_cur."!cursor_debug"("START", "statement_prefix:sym<try>")
  debug_522:
    $I10 = self.'from'()
    ne $I10, -1, rxscan350_done
    goto rxscan350_scan
  rxscan350_loop:
    ($P10) = rx346_cur."from"()
    inc $P10
    set rx346_pos, $P10
    ge rx346_pos, rx346_eos, rxscan350_done
  rxscan350_scan:
    set_addr $I10, rxscan350_loop
    rx346_cur."!mark_push"(0, rx346_pos, $I10)
  rxscan350_done:
.annotate 'line', 202
  # rx subcapture "sym"
    set_addr $I10, rxcap_351_fail
    rx346_cur."!mark_push"(0, rx346_pos, $I10)
  # rx literal  "try"
    add $I11, rx346_pos, 3
    gt $I11, rx346_eos, rx346_fail
    sub $I11, rx346_pos, rx346_off
    substr $S10, rx346_tgt, $I11, 3
    ne $S10, "try", rx346_fail
    add rx346_pos, 3
    set_addr $I10, rxcap_351_fail
    ($I12, $I11) = rx346_cur."!mark_peek"($I10)
    rx346_cur."!cursor_pos"($I11)
    ($P10) = rx346_cur."!cursor_start"()
    $P10."!cursor_pass"(rx346_pos, "")
    rx346_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_351_done
  rxcap_351_fail:
    goto rx346_fail
  rxcap_351_done:
.annotate 'line', 203
  # rx subrule "blorst" subtype=capture negate=
    rx346_cur."!cursor_pos"(rx346_pos)
    $P10 = rx346_cur."blorst"()
    unless $P10, rx346_fail
    rx346_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx346_pos = $P10."pos"()
.annotate 'line', 201
  # rx pass
    rx346_cur."!cursor_pass"(rx346_pos, "statement_prefix:sym<try>")
    if_null rx346_debug, debug_523
    rx346_cur."!cursor_debug"("PASS", "statement_prefix:sym<try>", " at pos=", rx346_pos)
  debug_523:
    .return (rx346_cur)
  rx346_restart:
.annotate 'line', 4
    if_null rx346_debug, debug_524
    rx346_cur."!cursor_debug"("NEXT", "statement_prefix:sym<try>")
  debug_524:
  rx346_fail:
    (rx346_rep, rx346_pos, $I10, $P10) = rx346_cur."!mark_fail"(0)
    lt rx346_pos, -1, rx346_done
    eq rx346_pos, -1, rx346_fail
    jump $I10
  rx346_done:
    rx346_cur."!cursor_fail"()
    if_null rx346_debug, debug_525
    rx346_cur."!cursor_debug"("FAIL", "statement_prefix:sym<try>")
  debug_525:
    .return (rx346_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<try>"  :subid("82_1284728478.15265") :method
.annotate 'line', 4
    $P348 = self."!PREFIX__!subrule"("blorst", "try")
    new $P349, "ResizablePMCArray"
    push $P349, $P348
    .return ($P349)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("83_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx353_tgt
    .local int rx353_pos
    .local int rx353_off
    .local int rx353_eos
    .local int rx353_rep
    .local pmc rx353_cur
    .local pmc rx353_debug
    (rx353_cur, rx353_pos, rx353_tgt, $I10) = self."!cursor_start"()
    getattribute rx353_debug, rx353_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx353_cur
    .local pmc match
    .lex "$/", match
    length rx353_eos, rx353_tgt
    gt rx353_pos, rx353_eos, rx353_done
    set rx353_off, 0
    lt rx353_pos, 2, rx353_start
    sub rx353_off, rx353_pos, 1
    substr rx353_tgt, rx353_tgt, rx353_off
  rx353_start:
    eq $I10, 1, rx353_restart
    if_null rx353_debug, debug_526
    rx353_cur."!cursor_debug"("START", "blorst")
  debug_526:
    $I10 = self.'from'()
    ne $I10, -1, rxscan356_done
    goto rxscan356_scan
  rxscan356_loop:
    ($P10) = rx353_cur."from"()
    inc $P10
    set rx353_pos, $P10
    ge rx353_pos, rx353_eos, rxscan356_done
  rxscan356_scan:
    set_addr $I10, rxscan356_loop
    rx353_cur."!mark_push"(0, rx353_pos, $I10)
  rxscan356_done:
.annotate 'line', 207
  # rx charclass s
    ge rx353_pos, rx353_eos, rx353_fail
    sub $I10, rx353_pos, rx353_off
    is_cclass $I11, 32, rx353_tgt, $I10
    unless $I11, rx353_fail
    inc rx353_pos
  # rx subrule "ws" subtype=method negate=
    rx353_cur."!cursor_pos"(rx353_pos)
    $P10 = rx353_cur."ws"()
    unless $P10, rx353_fail
    rx353_pos = $P10."pos"()
  alt357_0:
    set_addr $I10, alt357_1
    rx353_cur."!mark_push"(0, rx353_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx353_pos, rx353_off
    substr $S10, rx353_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx353_fail
  # rx subrule "block" subtype=capture negate=
    rx353_cur."!cursor_pos"(rx353_pos)
    $P10 = rx353_cur."block"()
    unless $P10, rx353_fail
    rx353_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx353_pos = $P10."pos"()
    goto alt357_end
  alt357_1:
  # rx subrule "statement" subtype=capture negate=
    rx353_cur."!cursor_pos"(rx353_pos)
    $P10 = rx353_cur."statement"()
    unless $P10, rx353_fail
    rx353_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx353_pos = $P10."pos"()
  alt357_end:
.annotate 'line', 206
  # rx pass
    rx353_cur."!cursor_pass"(rx353_pos, "blorst")
    if_null rx353_debug, debug_527
    rx353_cur."!cursor_debug"("PASS", "blorst", " at pos=", rx353_pos)
  debug_527:
    .return (rx353_cur)
  rx353_restart:
.annotate 'line', 4
    if_null rx353_debug, debug_528
    rx353_cur."!cursor_debug"("NEXT", "blorst")
  debug_528:
  rx353_fail:
    (rx353_rep, rx353_pos, $I10, $P10) = rx353_cur."!mark_fail"(0)
    lt rx353_pos, -1, rx353_done
    eq rx353_pos, -1, rx353_fail
    jump $I10
  rx353_done:
    rx353_cur."!cursor_fail"()
    if_null rx353_debug, debug_529
    rx353_cur."!cursor_debug"("FAIL", "blorst")
  debug_529:
    .return (rx353_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blorst"  :subid("84_1284728478.15265") :method
.annotate 'line', 4
    new $P355, "ResizablePMCArray"
    push $P355, ""
    .return ($P355)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("85_1284728478.15265") :method
.annotate 'line', 212
    $P359 = self."!protoregex"("statement_mod_cond")
    .return ($P359)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("86_1284728478.15265") :method
.annotate 'line', 212
    $P361 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P361)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("87_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx363_tgt
    .local int rx363_pos
    .local int rx363_off
    .local int rx363_eos
    .local int rx363_rep
    .local pmc rx363_cur
    .local pmc rx363_debug
    (rx363_cur, rx363_pos, rx363_tgt, $I10) = self."!cursor_start"()
    getattribute rx363_debug, rx363_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx363_cur
    .local pmc match
    .lex "$/", match
    length rx363_eos, rx363_tgt
    gt rx363_pos, rx363_eos, rx363_done
    set rx363_off, 0
    lt rx363_pos, 2, rx363_start
    sub rx363_off, rx363_pos, 1
    substr rx363_tgt, rx363_tgt, rx363_off
  rx363_start:
    eq $I10, 1, rx363_restart
    if_null rx363_debug, debug_530
    rx363_cur."!cursor_debug"("START", "statement_mod_cond:sym<if>")
  debug_530:
    $I10 = self.'from'()
    ne $I10, -1, rxscan367_done
    goto rxscan367_scan
  rxscan367_loop:
    ($P10) = rx363_cur."from"()
    inc $P10
    set rx363_pos, $P10
    ge rx363_pos, rx363_eos, rxscan367_done
  rxscan367_scan:
    set_addr $I10, rxscan367_loop
    rx363_cur."!mark_push"(0, rx363_pos, $I10)
  rxscan367_done:
.annotate 'line', 214
  # rx subcapture "sym"
    set_addr $I10, rxcap_368_fail
    rx363_cur."!mark_push"(0, rx363_pos, $I10)
  # rx literal  "if"
    add $I11, rx363_pos, 2
    gt $I11, rx363_eos, rx363_fail
    sub $I11, rx363_pos, rx363_off
    substr $S10, rx363_tgt, $I11, 2
    ne $S10, "if", rx363_fail
    add rx363_pos, 2
    set_addr $I10, rxcap_368_fail
    ($I12, $I11) = rx363_cur."!mark_peek"($I10)
    rx363_cur."!cursor_pos"($I11)
    ($P10) = rx363_cur."!cursor_start"()
    $P10."!cursor_pass"(rx363_pos, "")
    rx363_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_368_done
  rxcap_368_fail:
    goto rx363_fail
  rxcap_368_done:
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
    rx363_cur."!cursor_pass"(rx363_pos, "statement_mod_cond:sym<if>")
    if_null rx363_debug, debug_531
    rx363_cur."!cursor_debug"("PASS", "statement_mod_cond:sym<if>", " at pos=", rx363_pos)
  debug_531:
    .return (rx363_cur)
  rx363_restart:
.annotate 'line', 4
    if_null rx363_debug, debug_532
    rx363_cur."!cursor_debug"("NEXT", "statement_mod_cond:sym<if>")
  debug_532:
  rx363_fail:
    (rx363_rep, rx363_pos, $I10, $P10) = rx363_cur."!mark_fail"(0)
    lt rx363_pos, -1, rx363_done
    eq rx363_pos, -1, rx363_fail
    jump $I10
  rx363_done:
    rx363_cur."!cursor_fail"()
    if_null rx363_debug, debug_533
    rx363_cur."!cursor_debug"("FAIL", "statement_mod_cond:sym<if>")
  debug_533:
    .return (rx363_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("88_1284728478.15265") :method
.annotate 'line', 4
    $P365 = self."!PREFIX__!subrule"("ws", "if")
    new $P366, "ResizablePMCArray"
    push $P366, $P365
    .return ($P366)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("89_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx372_tgt
    .local int rx372_pos
    .local int rx372_off
    .local int rx372_eos
    .local int rx372_rep
    .local pmc rx372_cur
    .local pmc rx372_debug
    (rx372_cur, rx372_pos, rx372_tgt, $I10) = self."!cursor_start"()
    getattribute rx372_debug, rx372_cur, "$!debug"
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
    eq $I10, 1, rx372_restart
    if_null rx372_debug, debug_534
    rx372_cur."!cursor_debug"("START", "statement_mod_cond:sym<unless>")
  debug_534:
    $I10 = self.'from'()
    ne $I10, -1, rxscan376_done
    goto rxscan376_scan
  rxscan376_loop:
    ($P10) = rx372_cur."from"()
    inc $P10
    set rx372_pos, $P10
    ge rx372_pos, rx372_eos, rxscan376_done
  rxscan376_scan:
    set_addr $I10, rxscan376_loop
    rx372_cur."!mark_push"(0, rx372_pos, $I10)
  rxscan376_done:
.annotate 'line', 215
  # rx subcapture "sym"
    set_addr $I10, rxcap_377_fail
    rx372_cur."!mark_push"(0, rx372_pos, $I10)
  # rx literal  "unless"
    add $I11, rx372_pos, 6
    gt $I11, rx372_eos, rx372_fail
    sub $I11, rx372_pos, rx372_off
    substr $S10, rx372_tgt, $I11, 6
    ne $S10, "unless", rx372_fail
    add rx372_pos, 6
    set_addr $I10, rxcap_377_fail
    ($I12, $I11) = rx372_cur."!mark_peek"($I10)
    rx372_cur."!cursor_pos"($I11)
    ($P10) = rx372_cur."!cursor_start"()
    $P10."!cursor_pass"(rx372_pos, "")
    rx372_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_377_done
  rxcap_377_fail:
    goto rx372_fail
  rxcap_377_done:
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
    if_null rx372_debug, debug_535
    rx372_cur."!cursor_debug"("PASS", "statement_mod_cond:sym<unless>", " at pos=", rx372_pos)
  debug_535:
    .return (rx372_cur)
  rx372_restart:
.annotate 'line', 4
    if_null rx372_debug, debug_536
    rx372_cur."!cursor_debug"("NEXT", "statement_mod_cond:sym<unless>")
  debug_536:
  rx372_fail:
    (rx372_rep, rx372_pos, $I10, $P10) = rx372_cur."!mark_fail"(0)
    lt rx372_pos, -1, rx372_done
    eq rx372_pos, -1, rx372_fail
    jump $I10
  rx372_done:
    rx372_cur."!cursor_fail"()
    if_null rx372_debug, debug_537
    rx372_cur."!cursor_debug"("FAIL", "statement_mod_cond:sym<unless>")
  debug_537:
    .return (rx372_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("90_1284728478.15265") :method
.annotate 'line', 4
    $P374 = self."!PREFIX__!subrule"("ws", "unless")
    new $P375, "ResizablePMCArray"
    push $P375, $P374
    .return ($P375)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("91_1284728478.15265") :method
.annotate 'line', 217
    $P381 = self."!protoregex"("statement_mod_loop")
    .return ($P381)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("92_1284728478.15265") :method
.annotate 'line', 217
    $P383 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P383)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("93_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx385_tgt
    .local int rx385_pos
    .local int rx385_off
    .local int rx385_eos
    .local int rx385_rep
    .local pmc rx385_cur
    .local pmc rx385_debug
    (rx385_cur, rx385_pos, rx385_tgt, $I10) = self."!cursor_start"()
    getattribute rx385_debug, rx385_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx385_cur
    .local pmc match
    .lex "$/", match
    length rx385_eos, rx385_tgt
    gt rx385_pos, rx385_eos, rx385_done
    set rx385_off, 0
    lt rx385_pos, 2, rx385_start
    sub rx385_off, rx385_pos, 1
    substr rx385_tgt, rx385_tgt, rx385_off
  rx385_start:
    eq $I10, 1, rx385_restart
    if_null rx385_debug, debug_538
    rx385_cur."!cursor_debug"("START", "statement_mod_loop:sym<while>")
  debug_538:
    $I10 = self.'from'()
    ne $I10, -1, rxscan389_done
    goto rxscan389_scan
  rxscan389_loop:
    ($P10) = rx385_cur."from"()
    inc $P10
    set rx385_pos, $P10
    ge rx385_pos, rx385_eos, rxscan389_done
  rxscan389_scan:
    set_addr $I10, rxscan389_loop
    rx385_cur."!mark_push"(0, rx385_pos, $I10)
  rxscan389_done:
.annotate 'line', 219
  # rx subcapture "sym"
    set_addr $I10, rxcap_390_fail
    rx385_cur."!mark_push"(0, rx385_pos, $I10)
  # rx literal  "while"
    add $I11, rx385_pos, 5
    gt $I11, rx385_eos, rx385_fail
    sub $I11, rx385_pos, rx385_off
    substr $S10, rx385_tgt, $I11, 5
    ne $S10, "while", rx385_fail
    add rx385_pos, 5
    set_addr $I10, rxcap_390_fail
    ($I12, $I11) = rx385_cur."!mark_peek"($I10)
    rx385_cur."!cursor_pos"($I11)
    ($P10) = rx385_cur."!cursor_start"()
    $P10."!cursor_pass"(rx385_pos, "")
    rx385_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_390_done
  rxcap_390_fail:
    goto rx385_fail
  rxcap_390_done:
  # rx subrule "ws" subtype=method negate=
    rx385_cur."!cursor_pos"(rx385_pos)
    $P10 = rx385_cur."ws"()
    unless $P10, rx385_fail
    rx385_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx385_cur."!cursor_pos"(rx385_pos)
    $P10 = rx385_cur."EXPR"()
    unless $P10, rx385_fail
    rx385_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx385_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx385_cur."!cursor_pos"(rx385_pos)
    $P10 = rx385_cur."ws"()
    unless $P10, rx385_fail
    rx385_pos = $P10."pos"()
  # rx pass
    rx385_cur."!cursor_pass"(rx385_pos, "statement_mod_loop:sym<while>")
    if_null rx385_debug, debug_539
    rx385_cur."!cursor_debug"("PASS", "statement_mod_loop:sym<while>", " at pos=", rx385_pos)
  debug_539:
    .return (rx385_cur)
  rx385_restart:
.annotate 'line', 4
    if_null rx385_debug, debug_540
    rx385_cur."!cursor_debug"("NEXT", "statement_mod_loop:sym<while>")
  debug_540:
  rx385_fail:
    (rx385_rep, rx385_pos, $I10, $P10) = rx385_cur."!mark_fail"(0)
    lt rx385_pos, -1, rx385_done
    eq rx385_pos, -1, rx385_fail
    jump $I10
  rx385_done:
    rx385_cur."!cursor_fail"()
    if_null rx385_debug, debug_541
    rx385_cur."!cursor_debug"("FAIL", "statement_mod_loop:sym<while>")
  debug_541:
    .return (rx385_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("94_1284728478.15265") :method
.annotate 'line', 4
    $P387 = self."!PREFIX__!subrule"("ws", "while")
    new $P388, "ResizablePMCArray"
    push $P388, $P387
    .return ($P388)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("95_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx394_tgt
    .local int rx394_pos
    .local int rx394_off
    .local int rx394_eos
    .local int rx394_rep
    .local pmc rx394_cur
    .local pmc rx394_debug
    (rx394_cur, rx394_pos, rx394_tgt, $I10) = self."!cursor_start"()
    getattribute rx394_debug, rx394_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx394_cur
    .local pmc match
    .lex "$/", match
    length rx394_eos, rx394_tgt
    gt rx394_pos, rx394_eos, rx394_done
    set rx394_off, 0
    lt rx394_pos, 2, rx394_start
    sub rx394_off, rx394_pos, 1
    substr rx394_tgt, rx394_tgt, rx394_off
  rx394_start:
    eq $I10, 1, rx394_restart
    if_null rx394_debug, debug_542
    rx394_cur."!cursor_debug"("START", "statement_mod_loop:sym<until>")
  debug_542:
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
.annotate 'line', 220
  # rx subcapture "sym"
    set_addr $I10, rxcap_399_fail
    rx394_cur."!mark_push"(0, rx394_pos, $I10)
  # rx literal  "until"
    add $I11, rx394_pos, 5
    gt $I11, rx394_eos, rx394_fail
    sub $I11, rx394_pos, rx394_off
    substr $S10, rx394_tgt, $I11, 5
    ne $S10, "until", rx394_fail
    add rx394_pos, 5
    set_addr $I10, rxcap_399_fail
    ($I12, $I11) = rx394_cur."!mark_peek"($I10)
    rx394_cur."!cursor_pos"($I11)
    ($P10) = rx394_cur."!cursor_start"()
    $P10."!cursor_pass"(rx394_pos, "")
    rx394_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_399_done
  rxcap_399_fail:
    goto rx394_fail
  rxcap_399_done:
  # rx subrule "ws" subtype=method negate=
    rx394_cur."!cursor_pos"(rx394_pos)
    $P10 = rx394_cur."ws"()
    unless $P10, rx394_fail
    rx394_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx394_cur."!cursor_pos"(rx394_pos)
    $P10 = rx394_cur."EXPR"()
    unless $P10, rx394_fail
    rx394_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx394_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx394_cur."!cursor_pos"(rx394_pos)
    $P10 = rx394_cur."ws"()
    unless $P10, rx394_fail
    rx394_pos = $P10."pos"()
  # rx pass
    rx394_cur."!cursor_pass"(rx394_pos, "statement_mod_loop:sym<until>")
    if_null rx394_debug, debug_543
    rx394_cur."!cursor_debug"("PASS", "statement_mod_loop:sym<until>", " at pos=", rx394_pos)
  debug_543:
    .return (rx394_cur)
  rx394_restart:
.annotate 'line', 4
    if_null rx394_debug, debug_544
    rx394_cur."!cursor_debug"("NEXT", "statement_mod_loop:sym<until>")
  debug_544:
  rx394_fail:
    (rx394_rep, rx394_pos, $I10, $P10) = rx394_cur."!mark_fail"(0)
    lt rx394_pos, -1, rx394_done
    eq rx394_pos, -1, rx394_fail
    jump $I10
  rx394_done:
    rx394_cur."!cursor_fail"()
    if_null rx394_debug, debug_545
    rx394_cur."!cursor_debug"("FAIL", "statement_mod_loop:sym<until>")
  debug_545:
    .return (rx394_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("96_1284728478.15265") :method
.annotate 'line', 4
    $P396 = self."!PREFIX__!subrule"("ws", "until")
    new $P397, "ResizablePMCArray"
    push $P397, $P396
    .return ($P397)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<for>"  :subid("97_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx403_tgt
    .local int rx403_pos
    .local int rx403_off
    .local int rx403_eos
    .local int rx403_rep
    .local pmc rx403_cur
    .local pmc rx403_debug
    (rx403_cur, rx403_pos, rx403_tgt, $I10) = self."!cursor_start"()
    getattribute rx403_debug, rx403_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx403_cur
    .local pmc match
    .lex "$/", match
    length rx403_eos, rx403_tgt
    gt rx403_pos, rx403_eos, rx403_done
    set rx403_off, 0
    lt rx403_pos, 2, rx403_start
    sub rx403_off, rx403_pos, 1
    substr rx403_tgt, rx403_tgt, rx403_off
  rx403_start:
    eq $I10, 1, rx403_restart
    if_null rx403_debug, debug_546
    rx403_cur."!cursor_debug"("START", "statement_mod_loop:sym<for>")
  debug_546:
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
.annotate 'line', 221
  # rx subcapture "sym"
    set_addr $I10, rxcap_408_fail
    rx403_cur."!mark_push"(0, rx403_pos, $I10)
  # rx literal  "for"
    add $I11, rx403_pos, 3
    gt $I11, rx403_eos, rx403_fail
    sub $I11, rx403_pos, rx403_off
    substr $S10, rx403_tgt, $I11, 3
    ne $S10, "for", rx403_fail
    add rx403_pos, 3
    set_addr $I10, rxcap_408_fail
    ($I12, $I11) = rx403_cur."!mark_peek"($I10)
    rx403_cur."!cursor_pos"($I11)
    ($P10) = rx403_cur."!cursor_start"()
    $P10."!cursor_pass"(rx403_pos, "")
    rx403_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_408_done
  rxcap_408_fail:
    goto rx403_fail
  rxcap_408_done:
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
    rx403_cur."!cursor_pass"(rx403_pos, "statement_mod_loop:sym<for>")
    if_null rx403_debug, debug_547
    rx403_cur."!cursor_debug"("PASS", "statement_mod_loop:sym<for>", " at pos=", rx403_pos)
  debug_547:
    .return (rx403_cur)
  rx403_restart:
.annotate 'line', 4
    if_null rx403_debug, debug_548
    rx403_cur."!cursor_debug"("NEXT", "statement_mod_loop:sym<for>")
  debug_548:
  rx403_fail:
    (rx403_rep, rx403_pos, $I10, $P10) = rx403_cur."!mark_fail"(0)
    lt rx403_pos, -1, rx403_done
    eq rx403_pos, -1, rx403_fail
    jump $I10
  rx403_done:
    rx403_cur."!cursor_fail"()
    if_null rx403_debug, debug_549
    rx403_cur."!cursor_debug"("FAIL", "statement_mod_loop:sym<for>")
  debug_549:
    .return (rx403_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<for>"  :subid("98_1284728478.15265") :method
.annotate 'line', 4
    $P405 = self."!PREFIX__!subrule"("ws", "for")
    new $P406, "ResizablePMCArray"
    push $P406, $P405
    .return ($P406)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<fatarrow>"  :subid("99_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx412_tgt
    .local int rx412_pos
    .local int rx412_off
    .local int rx412_eos
    .local int rx412_rep
    .local pmc rx412_cur
    .local pmc rx412_debug
    (rx412_cur, rx412_pos, rx412_tgt, $I10) = self."!cursor_start"()
    getattribute rx412_debug, rx412_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx412_cur
    .local pmc match
    .lex "$/", match
    length rx412_eos, rx412_tgt
    gt rx412_pos, rx412_eos, rx412_done
    set rx412_off, 0
    lt rx412_pos, 2, rx412_start
    sub rx412_off, rx412_pos, 1
    substr rx412_tgt, rx412_tgt, rx412_off
  rx412_start:
    eq $I10, 1, rx412_restart
    if_null rx412_debug, debug_550
    rx412_cur."!cursor_debug"("START", "term:sym<fatarrow>")
  debug_550:
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
.annotate 'line', 225
  # rx subrule "fatarrow" subtype=capture negate=
    rx412_cur."!cursor_pos"(rx412_pos)
    $P10 = rx412_cur."fatarrow"()
    unless $P10, rx412_fail
    rx412_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("fatarrow")
    rx412_pos = $P10."pos"()
  # rx pass
    rx412_cur."!cursor_pass"(rx412_pos, "term:sym<fatarrow>")
    if_null rx412_debug, debug_551
    rx412_cur."!cursor_debug"("PASS", "term:sym<fatarrow>", " at pos=", rx412_pos)
  debug_551:
    .return (rx412_cur)
  rx412_restart:
.annotate 'line', 4
    if_null rx412_debug, debug_552
    rx412_cur."!cursor_debug"("NEXT", "term:sym<fatarrow>")
  debug_552:
  rx412_fail:
    (rx412_rep, rx412_pos, $I10, $P10) = rx412_cur."!mark_fail"(0)
    lt rx412_pos, -1, rx412_done
    eq rx412_pos, -1, rx412_fail
    jump $I10
  rx412_done:
    rx412_cur."!cursor_fail"()
    if_null rx412_debug, debug_553
    rx412_cur."!cursor_debug"("FAIL", "term:sym<fatarrow>")
  debug_553:
    .return (rx412_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<fatarrow>"  :subid("100_1284728478.15265") :method
.annotate 'line', 4
    $P414 = self."!PREFIX__!subrule"("fatarrow", "")
    new $P415, "ResizablePMCArray"
    push $P415, $P414
    .return ($P415)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("101_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx418_tgt
    .local int rx418_pos
    .local int rx418_off
    .local int rx418_eos
    .local int rx418_rep
    .local pmc rx418_cur
    .local pmc rx418_debug
    (rx418_cur, rx418_pos, rx418_tgt, $I10) = self."!cursor_start"()
    getattribute rx418_debug, rx418_cur, "$!debug"
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
    eq $I10, 1, rx418_restart
    if_null rx418_debug, debug_554
    rx418_cur."!cursor_debug"("START", "term:sym<colonpair>")
  debug_554:
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
.annotate 'line', 226
  # rx subrule "colonpair" subtype=capture negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."colonpair"()
    unless $P10, rx418_fail
    rx418_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx418_pos = $P10."pos"()
  # rx pass
    rx418_cur."!cursor_pass"(rx418_pos, "term:sym<colonpair>")
    if_null rx418_debug, debug_555
    rx418_cur."!cursor_debug"("PASS", "term:sym<colonpair>", " at pos=", rx418_pos)
  debug_555:
    .return (rx418_cur)
  rx418_restart:
.annotate 'line', 4
    if_null rx418_debug, debug_556
    rx418_cur."!cursor_debug"("NEXT", "term:sym<colonpair>")
  debug_556:
  rx418_fail:
    (rx418_rep, rx418_pos, $I10, $P10) = rx418_cur."!mark_fail"(0)
    lt rx418_pos, -1, rx418_done
    eq rx418_pos, -1, rx418_fail
    jump $I10
  rx418_done:
    rx418_cur."!cursor_fail"()
    if_null rx418_debug, debug_557
    rx418_cur."!cursor_debug"("FAIL", "term:sym<colonpair>")
  debug_557:
    .return (rx418_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("102_1284728478.15265") :method
.annotate 'line', 4
    $P420 = self."!PREFIX__!subrule"("colonpair", "")
    new $P421, "ResizablePMCArray"
    push $P421, $P420
    .return ($P421)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("103_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx424_tgt
    .local int rx424_pos
    .local int rx424_off
    .local int rx424_eos
    .local int rx424_rep
    .local pmc rx424_cur
    .local pmc rx424_debug
    (rx424_cur, rx424_pos, rx424_tgt, $I10) = self."!cursor_start"()
    getattribute rx424_debug, rx424_cur, "$!debug"
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
    eq $I10, 1, rx424_restart
    if_null rx424_debug, debug_558
    rx424_cur."!cursor_debug"("START", "term:sym<variable>")
  debug_558:
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
.annotate 'line', 227
  # rx subrule "variable" subtype=capture negate=
    rx424_cur."!cursor_pos"(rx424_pos)
    $P10 = rx424_cur."variable"()
    unless $P10, rx424_fail
    rx424_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx424_pos = $P10."pos"()
  # rx pass
    rx424_cur."!cursor_pass"(rx424_pos, "term:sym<variable>")
    if_null rx424_debug, debug_559
    rx424_cur."!cursor_debug"("PASS", "term:sym<variable>", " at pos=", rx424_pos)
  debug_559:
    .return (rx424_cur)
  rx424_restart:
.annotate 'line', 4
    if_null rx424_debug, debug_560
    rx424_cur."!cursor_debug"("NEXT", "term:sym<variable>")
  debug_560:
  rx424_fail:
    (rx424_rep, rx424_pos, $I10, $P10) = rx424_cur."!mark_fail"(0)
    lt rx424_pos, -1, rx424_done
    eq rx424_pos, -1, rx424_fail
    jump $I10
  rx424_done:
    rx424_cur."!cursor_fail"()
    if_null rx424_debug, debug_561
    rx424_cur."!cursor_debug"("FAIL", "term:sym<variable>")
  debug_561:
    .return (rx424_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("104_1284728478.15265") :method
.annotate 'line', 4
    $P426 = self."!PREFIX__!subrule"("variable", "")
    new $P427, "ResizablePMCArray"
    push $P427, $P426
    .return ($P427)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("105_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx430_tgt
    .local int rx430_pos
    .local int rx430_off
    .local int rx430_eos
    .local int rx430_rep
    .local pmc rx430_cur
    .local pmc rx430_debug
    (rx430_cur, rx430_pos, rx430_tgt, $I10) = self."!cursor_start"()
    getattribute rx430_debug, rx430_cur, "$!debug"
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
    eq $I10, 1, rx430_restart
    if_null rx430_debug, debug_562
    rx430_cur."!cursor_debug"("START", "term:sym<package_declarator>")
  debug_562:
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
.annotate 'line', 228
  # rx subrule "package_declarator" subtype=capture negate=
    rx430_cur."!cursor_pos"(rx430_pos)
    $P10 = rx430_cur."package_declarator"()
    unless $P10, rx430_fail
    rx430_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx430_pos = $P10."pos"()
  # rx pass
    rx430_cur."!cursor_pass"(rx430_pos, "term:sym<package_declarator>")
    if_null rx430_debug, debug_563
    rx430_cur."!cursor_debug"("PASS", "term:sym<package_declarator>", " at pos=", rx430_pos)
  debug_563:
    .return (rx430_cur)
  rx430_restart:
.annotate 'line', 4
    if_null rx430_debug, debug_564
    rx430_cur."!cursor_debug"("NEXT", "term:sym<package_declarator>")
  debug_564:
  rx430_fail:
    (rx430_rep, rx430_pos, $I10, $P10) = rx430_cur."!mark_fail"(0)
    lt rx430_pos, -1, rx430_done
    eq rx430_pos, -1, rx430_fail
    jump $I10
  rx430_done:
    rx430_cur."!cursor_fail"()
    if_null rx430_debug, debug_565
    rx430_cur."!cursor_debug"("FAIL", "term:sym<package_declarator>")
  debug_565:
    .return (rx430_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("106_1284728478.15265") :method
.annotate 'line', 4
    $P432 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P433, "ResizablePMCArray"
    push $P433, $P432
    .return ($P433)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("107_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx436_tgt
    .local int rx436_pos
    .local int rx436_off
    .local int rx436_eos
    .local int rx436_rep
    .local pmc rx436_cur
    .local pmc rx436_debug
    (rx436_cur, rx436_pos, rx436_tgt, $I10) = self."!cursor_start"()
    getattribute rx436_debug, rx436_cur, "$!debug"
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
    eq $I10, 1, rx436_restart
    if_null rx436_debug, debug_566
    rx436_cur."!cursor_debug"("START", "term:sym<scope_declarator>")
  debug_566:
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
.annotate 'line', 229
  # rx subrule "scope_declarator" subtype=capture negate=
    rx436_cur."!cursor_pos"(rx436_pos)
    $P10 = rx436_cur."scope_declarator"()
    unless $P10, rx436_fail
    rx436_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx436_pos = $P10."pos"()
  # rx pass
    rx436_cur."!cursor_pass"(rx436_pos, "term:sym<scope_declarator>")
    if_null rx436_debug, debug_567
    rx436_cur."!cursor_debug"("PASS", "term:sym<scope_declarator>", " at pos=", rx436_pos)
  debug_567:
    .return (rx436_cur)
  rx436_restart:
.annotate 'line', 4
    if_null rx436_debug, debug_568
    rx436_cur."!cursor_debug"("NEXT", "term:sym<scope_declarator>")
  debug_568:
  rx436_fail:
    (rx436_rep, rx436_pos, $I10, $P10) = rx436_cur."!mark_fail"(0)
    lt rx436_pos, -1, rx436_done
    eq rx436_pos, -1, rx436_fail
    jump $I10
  rx436_done:
    rx436_cur."!cursor_fail"()
    if_null rx436_debug, debug_569
    rx436_cur."!cursor_debug"("FAIL", "term:sym<scope_declarator>")
  debug_569:
    .return (rx436_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("108_1284728478.15265") :method
.annotate 'line', 4
    $P438 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P439, "ResizablePMCArray"
    push $P439, $P438
    .return ($P439)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("109_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx442_tgt
    .local int rx442_pos
    .local int rx442_off
    .local int rx442_eos
    .local int rx442_rep
    .local pmc rx442_cur
    .local pmc rx442_debug
    (rx442_cur, rx442_pos, rx442_tgt, $I10) = self."!cursor_start"()
    getattribute rx442_debug, rx442_cur, "$!debug"
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
    eq $I10, 1, rx442_restart
    if_null rx442_debug, debug_570
    rx442_cur."!cursor_debug"("START", "term:sym<routine_declarator>")
  debug_570:
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
.annotate 'line', 230
  # rx subrule "routine_declarator" subtype=capture negate=
    rx442_cur."!cursor_pos"(rx442_pos)
    $P10 = rx442_cur."routine_declarator"()
    unless $P10, rx442_fail
    rx442_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx442_pos = $P10."pos"()
  # rx pass
    rx442_cur."!cursor_pass"(rx442_pos, "term:sym<routine_declarator>")
    if_null rx442_debug, debug_571
    rx442_cur."!cursor_debug"("PASS", "term:sym<routine_declarator>", " at pos=", rx442_pos)
  debug_571:
    .return (rx442_cur)
  rx442_restart:
.annotate 'line', 4
    if_null rx442_debug, debug_572
    rx442_cur."!cursor_debug"("NEXT", "term:sym<routine_declarator>")
  debug_572:
  rx442_fail:
    (rx442_rep, rx442_pos, $I10, $P10) = rx442_cur."!mark_fail"(0)
    lt rx442_pos, -1, rx442_done
    eq rx442_pos, -1, rx442_fail
    jump $I10
  rx442_done:
    rx442_cur."!cursor_fail"()
    if_null rx442_debug, debug_573
    rx442_cur."!cursor_debug"("FAIL", "term:sym<routine_declarator>")
  debug_573:
    .return (rx442_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("110_1284728478.15265") :method
.annotate 'line', 4
    $P444 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P445, "ResizablePMCArray"
    push $P445, $P444
    .return ($P445)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<multi_declarator>"  :subid("111_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .const 'Sub' $P453 = "113_1284728478.15265" 
    capture_lex $P453
    .local string rx448_tgt
    .local int rx448_pos
    .local int rx448_off
    .local int rx448_eos
    .local int rx448_rep
    .local pmc rx448_cur
    .local pmc rx448_debug
    (rx448_cur, rx448_pos, rx448_tgt, $I10) = self."!cursor_start"()
    getattribute rx448_debug, rx448_cur, "$!debug"
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
    eq $I10, 1, rx448_restart
    if_null rx448_debug, debug_574
    rx448_cur."!cursor_debug"("START", "term:sym<multi_declarator>")
  debug_574:
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
.annotate 'line', 231
  # rx subrule "before" subtype=zerowidth negate=
    rx448_cur."!cursor_pos"(rx448_pos)
    .const 'Sub' $P453 = "113_1284728478.15265" 
    capture_lex $P453
    $P10 = rx448_cur."before"($P453)
    unless $P10, rx448_fail
  # rx subrule "multi_declarator" subtype=capture negate=
    rx448_cur."!cursor_pos"(rx448_pos)
    $P10 = rx448_cur."multi_declarator"()
    unless $P10, rx448_fail
    rx448_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("multi_declarator")
    rx448_pos = $P10."pos"()
  # rx pass
    rx448_cur."!cursor_pass"(rx448_pos, "term:sym<multi_declarator>")
    if_null rx448_debug, debug_579
    rx448_cur."!cursor_debug"("PASS", "term:sym<multi_declarator>", " at pos=", rx448_pos)
  debug_579:
    .return (rx448_cur)
  rx448_restart:
.annotate 'line', 4
    if_null rx448_debug, debug_580
    rx448_cur."!cursor_debug"("NEXT", "term:sym<multi_declarator>")
  debug_580:
  rx448_fail:
    (rx448_rep, rx448_pos, $I10, $P10) = rx448_cur."!mark_fail"(0)
    lt rx448_pos, -1, rx448_done
    eq rx448_pos, -1, rx448_fail
    jump $I10
  rx448_done:
    rx448_cur."!cursor_fail"()
    if_null rx448_debug, debug_581
    rx448_cur."!cursor_debug"("FAIL", "term:sym<multi_declarator>")
  debug_581:
    .return (rx448_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<multi_declarator>"  :subid("112_1284728478.15265") :method
.annotate 'line', 4
    new $P450, "ResizablePMCArray"
    push $P450, ""
    .return ($P450)
.end


.namespace ["NQP";"Grammar"]
.sub "_block452"  :anon :subid("113_1284728478.15265") :method :outer("111_1284728478.15265")
.annotate 'line', 231
    .local string rx454_tgt
    .local int rx454_pos
    .local int rx454_off
    .local int rx454_eos
    .local int rx454_rep
    .local pmc rx454_cur
    .local pmc rx454_debug
    (rx454_cur, rx454_pos, rx454_tgt, $I10) = self."!cursor_start"()
    getattribute rx454_debug, rx454_cur, "$!debug"
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
    eq $I10, 1, rx454_restart
    if_null rx454_debug, debug_575
    rx454_cur."!cursor_debug"("START", "")
  debug_575:
    $I10 = self.'from'()
    ne $I10, -1, rxscan455_done
    goto rxscan455_scan
  rxscan455_loop:
    ($P10) = rx454_cur."from"()
    inc $P10
    set rx454_pos, $P10
    ge rx454_pos, rx454_eos, rxscan455_done
  rxscan455_scan:
    set_addr $I10, rxscan455_loop
    rx454_cur."!mark_push"(0, rx454_pos, $I10)
  rxscan455_done:
  alt456_0:
    set_addr $I10, alt456_1
    rx454_cur."!mark_push"(0, rx454_pos, $I10)
  # rx literal  "multi"
    add $I11, rx454_pos, 5
    gt $I11, rx454_eos, rx454_fail
    sub $I11, rx454_pos, rx454_off
    substr $S10, rx454_tgt, $I11, 5
    ne $S10, "multi", rx454_fail
    add rx454_pos, 5
    goto alt456_end
  alt456_1:
    set_addr $I10, alt456_2
    rx454_cur."!mark_push"(0, rx454_pos, $I10)
  # rx literal  "proto"
    add $I11, rx454_pos, 5
    gt $I11, rx454_eos, rx454_fail
    sub $I11, rx454_pos, rx454_off
    substr $S10, rx454_tgt, $I11, 5
    ne $S10, "proto", rx454_fail
    add rx454_pos, 5
    goto alt456_end
  alt456_2:
  # rx literal  "only"
    add $I11, rx454_pos, 4
    gt $I11, rx454_eos, rx454_fail
    sub $I11, rx454_pos, rx454_off
    substr $S10, rx454_tgt, $I11, 4
    ne $S10, "only", rx454_fail
    add rx454_pos, 4
  alt456_end:
  # rx pass
    rx454_cur."!cursor_pass"(rx454_pos, "")
    if_null rx454_debug, debug_576
    rx454_cur."!cursor_debug"("PASS", "", " at pos=", rx454_pos)
  debug_576:
    .return (rx454_cur)
  rx454_restart:
    if_null rx454_debug, debug_577
    rx454_cur."!cursor_debug"("NEXT", "")
  debug_577:
  rx454_fail:
    (rx454_rep, rx454_pos, $I10, $P10) = rx454_cur."!mark_fail"(0)
    lt rx454_pos, -1, rx454_done
    eq rx454_pos, -1, rx454_fail
    jump $I10
  rx454_done:
    rx454_cur."!cursor_fail"()
    if_null rx454_debug, debug_578
    rx454_cur."!cursor_debug"("FAIL", "")
  debug_578:
    .return (rx454_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("114_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx458_tgt
    .local int rx458_pos
    .local int rx458_off
    .local int rx458_eos
    .local int rx458_rep
    .local pmc rx458_cur
    .local pmc rx458_debug
    (rx458_cur, rx458_pos, rx458_tgt, $I10) = self."!cursor_start"()
    getattribute rx458_debug, rx458_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx458_cur
    .local pmc match
    .lex "$/", match
    length rx458_eos, rx458_tgt
    gt rx458_pos, rx458_eos, rx458_done
    set rx458_off, 0
    lt rx458_pos, 2, rx458_start
    sub rx458_off, rx458_pos, 1
    substr rx458_tgt, rx458_tgt, rx458_off
  rx458_start:
    eq $I10, 1, rx458_restart
    if_null rx458_debug, debug_582
    rx458_cur."!cursor_debug"("START", "term:sym<regex_declarator>")
  debug_582:
    $I10 = self.'from'()
    ne $I10, -1, rxscan462_done
    goto rxscan462_scan
  rxscan462_loop:
    ($P10) = rx458_cur."from"()
    inc $P10
    set rx458_pos, $P10
    ge rx458_pos, rx458_eos, rxscan462_done
  rxscan462_scan:
    set_addr $I10, rxscan462_loop
    rx458_cur."!mark_push"(0, rx458_pos, $I10)
  rxscan462_done:
.annotate 'line', 232
  # rx subrule "regex_declarator" subtype=capture negate=
    rx458_cur."!cursor_pos"(rx458_pos)
    $P10 = rx458_cur."regex_declarator"()
    unless $P10, rx458_fail
    rx458_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx458_pos = $P10."pos"()
  # rx pass
    rx458_cur."!cursor_pass"(rx458_pos, "term:sym<regex_declarator>")
    if_null rx458_debug, debug_583
    rx458_cur."!cursor_debug"("PASS", "term:sym<regex_declarator>", " at pos=", rx458_pos)
  debug_583:
    .return (rx458_cur)
  rx458_restart:
.annotate 'line', 4
    if_null rx458_debug, debug_584
    rx458_cur."!cursor_debug"("NEXT", "term:sym<regex_declarator>")
  debug_584:
  rx458_fail:
    (rx458_rep, rx458_pos, $I10, $P10) = rx458_cur."!mark_fail"(0)
    lt rx458_pos, -1, rx458_done
    eq rx458_pos, -1, rx458_fail
    jump $I10
  rx458_done:
    rx458_cur."!cursor_fail"()
    if_null rx458_debug, debug_585
    rx458_cur."!cursor_debug"("FAIL", "term:sym<regex_declarator>")
  debug_585:
    .return (rx458_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("115_1284728478.15265") :method
.annotate 'line', 4
    $P460 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P461, "ResizablePMCArray"
    push $P461, $P460
    .return ($P461)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("116_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx464_tgt
    .local int rx464_pos
    .local int rx464_off
    .local int rx464_eos
    .local int rx464_rep
    .local pmc rx464_cur
    .local pmc rx464_debug
    (rx464_cur, rx464_pos, rx464_tgt, $I10) = self."!cursor_start"()
    getattribute rx464_debug, rx464_cur, "$!debug"
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
    eq $I10, 1, rx464_restart
    if_null rx464_debug, debug_586
    rx464_cur."!cursor_debug"("START", "term:sym<statement_prefix>")
  debug_586:
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
.annotate 'line', 233
  # rx subrule "statement_prefix" subtype=capture negate=
    rx464_cur."!cursor_pos"(rx464_pos)
    $P10 = rx464_cur."statement_prefix"()
    unless $P10, rx464_fail
    rx464_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx464_pos = $P10."pos"()
  # rx pass
    rx464_cur."!cursor_pass"(rx464_pos, "term:sym<statement_prefix>")
    if_null rx464_debug, debug_587
    rx464_cur."!cursor_debug"("PASS", "term:sym<statement_prefix>", " at pos=", rx464_pos)
  debug_587:
    .return (rx464_cur)
  rx464_restart:
.annotate 'line', 4
    if_null rx464_debug, debug_588
    rx464_cur."!cursor_debug"("NEXT", "term:sym<statement_prefix>")
  debug_588:
  rx464_fail:
    (rx464_rep, rx464_pos, $I10, $P10) = rx464_cur."!mark_fail"(0)
    lt rx464_pos, -1, rx464_done
    eq rx464_pos, -1, rx464_fail
    jump $I10
  rx464_done:
    rx464_cur."!cursor_fail"()
    if_null rx464_debug, debug_589
    rx464_cur."!cursor_debug"("FAIL", "term:sym<statement_prefix>")
  debug_589:
    .return (rx464_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("117_1284728478.15265") :method
.annotate 'line', 4
    $P466 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P467, "ResizablePMCArray"
    push $P467, $P466
    .return ($P467)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("118_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx470_tgt
    .local int rx470_pos
    .local int rx470_off
    .local int rx470_eos
    .local int rx470_rep
    .local pmc rx470_cur
    .local pmc rx470_debug
    (rx470_cur, rx470_pos, rx470_tgt, $I10) = self."!cursor_start"()
    getattribute rx470_debug, rx470_cur, "$!debug"
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
    eq $I10, 1, rx470_restart
    if_null rx470_debug, debug_590
    rx470_cur."!cursor_debug"("START", "term:sym<lambda>")
  debug_590:
    $I10 = self.'from'()
    ne $I10, -1, rxscan473_done
    goto rxscan473_scan
  rxscan473_loop:
    ($P10) = rx470_cur."from"()
    inc $P10
    set rx470_pos, $P10
    ge rx470_pos, rx470_eos, rxscan473_done
  rxscan473_scan:
    set_addr $I10, rxscan473_loop
    rx470_cur."!mark_push"(0, rx470_pos, $I10)
  rxscan473_done:
.annotate 'line', 234
  # rx subrule "lambda" subtype=zerowidth negate=
    rx470_cur."!cursor_pos"(rx470_pos)
    $P10 = rx470_cur."lambda"()
    unless $P10, rx470_fail
  # rx subrule "pblock" subtype=capture negate=
    rx470_cur."!cursor_pos"(rx470_pos)
    $P10 = rx470_cur."pblock"()
    unless $P10, rx470_fail
    rx470_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx470_pos = $P10."pos"()
  # rx pass
    rx470_cur."!cursor_pass"(rx470_pos, "term:sym<lambda>")
    if_null rx470_debug, debug_591
    rx470_cur."!cursor_debug"("PASS", "term:sym<lambda>", " at pos=", rx470_pos)
  debug_591:
    .return (rx470_cur)
  rx470_restart:
.annotate 'line', 4
    if_null rx470_debug, debug_592
    rx470_cur."!cursor_debug"("NEXT", "term:sym<lambda>")
  debug_592:
  rx470_fail:
    (rx470_rep, rx470_pos, $I10, $P10) = rx470_cur."!mark_fail"(0)
    lt rx470_pos, -1, rx470_done
    eq rx470_pos, -1, rx470_fail
    jump $I10
  rx470_done:
    rx470_cur."!cursor_fail"()
    if_null rx470_debug, debug_593
    rx470_cur."!cursor_debug"("FAIL", "term:sym<lambda>")
  debug_593:
    .return (rx470_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("119_1284728478.15265") :method
.annotate 'line', 4
    new $P472, "ResizablePMCArray"
    push $P472, ""
    .return ($P472)
.end


.namespace ["NQP";"Grammar"]
.sub "fatarrow"  :subid("120_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx475_tgt
    .local int rx475_pos
    .local int rx475_off
    .local int rx475_eos
    .local int rx475_rep
    .local pmc rx475_cur
    .local pmc rx475_debug
    (rx475_cur, rx475_pos, rx475_tgt, $I10) = self."!cursor_start"()
    getattribute rx475_debug, rx475_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx475_cur
    .local pmc match
    .lex "$/", match
    length rx475_eos, rx475_tgt
    gt rx475_pos, rx475_eos, rx475_done
    set rx475_off, 0
    lt rx475_pos, 2, rx475_start
    sub rx475_off, rx475_pos, 1
    substr rx475_tgt, rx475_tgt, rx475_off
  rx475_start:
    eq $I10, 1, rx475_restart
    if_null rx475_debug, debug_594
    rx475_cur."!cursor_debug"("START", "fatarrow")
  debug_594:
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
.annotate 'line', 237
  # rx subrule "identifier" subtype=capture negate=
    rx475_cur."!cursor_pos"(rx475_pos)
    $P10 = rx475_cur."identifier"()
    unless $P10, rx475_fail
    rx475_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    rx475_pos = $P10."pos"()
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx475_pos, rx475_off
    set rx475_rep, 0
    sub $I12, rx475_eos, rx475_pos
  rxenumcharlistq480_loop:
    le $I12, 0, rxenumcharlistq480_done
    substr $S10, rx475_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq480_done
    inc rx475_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq480_loop
  rxenumcharlistq480_done:
    add rx475_pos, rx475_pos, rx475_rep
  # rx literal  "=>"
    add $I11, rx475_pos, 2
    gt $I11, rx475_eos, rx475_fail
    sub $I11, rx475_pos, rx475_off
    substr $S10, rx475_tgt, $I11, 2
    ne $S10, "=>", rx475_fail
    add rx475_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx475_cur."!cursor_pos"(rx475_pos)
    $P10 = rx475_cur."ws"()
    unless $P10, rx475_fail
    rx475_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx475_cur."!cursor_pos"(rx475_pos)
    $P10 = rx475_cur."EXPR"("i=")
    unless $P10, rx475_fail
    rx475_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("val")
    rx475_pos = $P10."pos"()
.annotate 'line', 236
  # rx pass
    rx475_cur."!cursor_pass"(rx475_pos, "fatarrow")
    if_null rx475_debug, debug_595
    rx475_cur."!cursor_debug"("PASS", "fatarrow", " at pos=", rx475_pos)
  debug_595:
    .return (rx475_cur)
  rx475_restart:
.annotate 'line', 4
    if_null rx475_debug, debug_596
    rx475_cur."!cursor_debug"("NEXT", "fatarrow")
  debug_596:
  rx475_fail:
    (rx475_rep, rx475_pos, $I10, $P10) = rx475_cur."!mark_fail"(0)
    lt rx475_pos, -1, rx475_done
    eq rx475_pos, -1, rx475_fail
    jump $I10
  rx475_done:
    rx475_cur."!cursor_fail"()
    if_null rx475_debug, debug_597
    rx475_cur."!cursor_debug"("FAIL", "fatarrow")
  debug_597:
    .return (rx475_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__fatarrow"  :subid("121_1284728478.15265") :method
.annotate 'line', 4
    $P477 = self."!PREFIX__!subrule"("identifier", "")
    new $P478, "ResizablePMCArray"
    push $P478, $P477
    .return ($P478)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("122_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx482_tgt
    .local int rx482_pos
    .local int rx482_off
    .local int rx482_eos
    .local int rx482_rep
    .local pmc rx482_cur
    .local pmc rx482_debug
    (rx482_cur, rx482_pos, rx482_tgt, $I10) = self."!cursor_start"()
    rx482_cur."!cursor_caparray"("circumfix")
    getattribute rx482_debug, rx482_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx482_cur
    .local pmc match
    .lex "$/", match
    length rx482_eos, rx482_tgt
    gt rx482_pos, rx482_eos, rx482_done
    set rx482_off, 0
    lt rx482_pos, 2, rx482_start
    sub rx482_off, rx482_pos, 1
    substr rx482_tgt, rx482_tgt, rx482_off
  rx482_start:
    eq $I10, 1, rx482_restart
    if_null rx482_debug, debug_598
    rx482_cur."!cursor_debug"("START", "colonpair")
  debug_598:
    $I10 = self.'from'()
    ne $I10, -1, rxscan488_done
    goto rxscan488_scan
  rxscan488_loop:
    ($P10) = rx482_cur."from"()
    inc $P10
    set rx482_pos, $P10
    ge rx482_pos, rx482_eos, rxscan488_done
  rxscan488_scan:
    set_addr $I10, rxscan488_loop
    rx482_cur."!mark_push"(0, rx482_pos, $I10)
  rxscan488_done:
.annotate 'line', 241
  # rx literal  ":"
    add $I11, rx482_pos, 1
    gt $I11, rx482_eos, rx482_fail
    sub $I11, rx482_pos, rx482_off
    ord $I11, rx482_tgt, $I11
    ne $I11, 58, rx482_fail
    add rx482_pos, 1
  alt489_0:
.annotate 'line', 242
    set_addr $I10, alt489_1
    rx482_cur."!mark_push"(0, rx482_pos, $I10)
.annotate 'line', 243
  # rx subcapture "not"
    set_addr $I10, rxcap_490_fail
    rx482_cur."!mark_push"(0, rx482_pos, $I10)
  # rx literal  "!"
    add $I11, rx482_pos, 1
    gt $I11, rx482_eos, rx482_fail
    sub $I11, rx482_pos, rx482_off
    ord $I11, rx482_tgt, $I11
    ne $I11, 33, rx482_fail
    add rx482_pos, 1
    set_addr $I10, rxcap_490_fail
    ($I12, $I11) = rx482_cur."!mark_peek"($I10)
    rx482_cur."!cursor_pos"($I11)
    ($P10) = rx482_cur."!cursor_start"()
    $P10."!cursor_pass"(rx482_pos, "")
    rx482_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_490_done
  rxcap_490_fail:
    goto rx482_fail
  rxcap_490_done:
  # rx subrule "identifier" subtype=capture negate=
    rx482_cur."!cursor_pos"(rx482_pos)
    $P10 = rx482_cur."identifier"()
    unless $P10, rx482_fail
    rx482_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx482_pos = $P10."pos"()
    goto alt489_end
  alt489_1:
    set_addr $I10, alt489_2
    rx482_cur."!mark_push"(0, rx482_pos, $I10)
.annotate 'line', 244
  # rx subrule "identifier" subtype=capture negate=
    rx482_cur."!cursor_pos"(rx482_pos)
    $P10 = rx482_cur."identifier"()
    unless $P10, rx482_fail
    rx482_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx482_pos = $P10."pos"()
  # rx rxquantr491 ** 0..1
    set_addr $I10, rxquantr491_done
    rx482_cur."!mark_push"(0, rx482_pos, $I10)
  rxquantr491_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx482_cur."!cursor_pos"(rx482_pos)
    $P10 = rx482_cur."circumfix"()
    unless $P10, rx482_fail
    goto rxsubrule492_pass
  rxsubrule492_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx482_fail
  rxsubrule492_pass:
    set_addr $I10, rxsubrule492_back
    rx482_cur."!mark_push"(0, rx482_pos, $I10, $P10)
    $P10."!cursor_names"("circumfix")
    rx482_pos = $P10."pos"()
    set_addr $I10, rxquantr491_done
    (rx482_rep) = rx482_cur."!mark_commit"($I10)
  rxquantr491_done:
    goto alt489_end
  alt489_2:
.annotate 'line', 245
  # rx subrule "circumfix" subtype=capture negate=
    rx482_cur."!cursor_pos"(rx482_pos)
    $P10 = rx482_cur."circumfix"()
    unless $P10, rx482_fail
    rx482_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx482_pos = $P10."pos"()
  alt489_end:
.annotate 'line', 240
  # rx pass
    rx482_cur."!cursor_pass"(rx482_pos, "colonpair")
    if_null rx482_debug, debug_599
    rx482_cur."!cursor_debug"("PASS", "colonpair", " at pos=", rx482_pos)
  debug_599:
    .return (rx482_cur)
  rx482_restart:
.annotate 'line', 4
    if_null rx482_debug, debug_600
    rx482_cur."!cursor_debug"("NEXT", "colonpair")
  debug_600:
  rx482_fail:
    (rx482_rep, rx482_pos, $I10, $P10) = rx482_cur."!mark_fail"(0)
    lt rx482_pos, -1, rx482_done
    eq rx482_pos, -1, rx482_fail
    jump $I10
  rx482_done:
    rx482_cur."!cursor_fail"()
    if_null rx482_debug, debug_601
    rx482_cur."!cursor_debug"("FAIL", "colonpair")
  debug_601:
    .return (rx482_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("123_1284728478.15265") :method
.annotate 'line', 4
    $P484 = self."!PREFIX__!subrule"("circumfix", ":")
    $P485 = self."!PREFIX__!subrule"("identifier", ":")
    $P486 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P487, "ResizablePMCArray"
    push $P487, $P484
    push $P487, $P485
    push $P487, $P486
    .return ($P487)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("124_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx494_tgt
    .local int rx494_pos
    .local int rx494_off
    .local int rx494_eos
    .local int rx494_rep
    .local pmc rx494_cur
    .local pmc rx494_debug
    (rx494_cur, rx494_pos, rx494_tgt, $I10) = self."!cursor_start"()
    rx494_cur."!cursor_caparray"("twigil")
    getattribute rx494_debug, rx494_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx494_cur
    .local pmc match
    .lex "$/", match
    length rx494_eos, rx494_tgt
    gt rx494_pos, rx494_eos, rx494_done
    set rx494_off, 0
    lt rx494_pos, 2, rx494_start
    sub rx494_off, rx494_pos, 1
    substr rx494_tgt, rx494_tgt, rx494_off
  rx494_start:
    eq $I10, 1, rx494_restart
    if_null rx494_debug, debug_602
    rx494_cur."!cursor_debug"("START", "variable")
  debug_602:
    $I10 = self.'from'()
    ne $I10, -1, rxscan499_done
    goto rxscan499_scan
  rxscan499_loop:
    ($P10) = rx494_cur."from"()
    inc $P10
    set rx494_pos, $P10
    ge rx494_pos, rx494_eos, rxscan499_done
  rxscan499_scan:
    set_addr $I10, rxscan499_loop
    rx494_cur."!mark_push"(0, rx494_pos, $I10)
  rxscan499_done:
  alt500_0:
.annotate 'line', 249
    set_addr $I10, alt500_1
    rx494_cur."!mark_push"(0, rx494_pos, $I10)
.annotate 'line', 250
  # rx subrule "sigil" subtype=capture negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."sigil"()
    unless $P10, rx494_fail
    rx494_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx494_pos = $P10."pos"()
  # rx rxquantr501 ** 0..1
    set_addr $I10, rxquantr501_done
    rx494_cur."!mark_push"(0, rx494_pos, $I10)
  rxquantr501_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."twigil"()
    unless $P10, rx494_fail
    goto rxsubrule502_pass
  rxsubrule502_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx494_fail
  rxsubrule502_pass:
    set_addr $I10, rxsubrule502_back
    rx494_cur."!mark_push"(0, rx494_pos, $I10, $P10)
    $P10."!cursor_names"("twigil")
    rx494_pos = $P10."pos"()
    set_addr $I10, rxquantr501_done
    (rx494_rep) = rx494_cur."!mark_commit"($I10)
  rxquantr501_done:
  # rx subrule "name" subtype=capture negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."name"()
    unless $P10, rx494_fail
    rx494_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx494_pos = $P10."pos"()
    goto alt500_end
  alt500_1:
    set_addr $I10, alt500_2
    rx494_cur."!mark_push"(0, rx494_pos, $I10)
.annotate 'line', 251
  # rx subrule "sigil" subtype=capture negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."sigil"()
    unless $P10, rx494_fail
    rx494_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx494_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx494_pos, rx494_off
    substr $S10, rx494_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx494_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."postcircumfix"()
    unless $P10, rx494_fail
    rx494_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx494_pos = $P10."pos"()
    goto alt500_end
  alt500_2:
.annotate 'line', 252
  # rx subcapture "sigil"
    set_addr $I10, rxcap_503_fail
    rx494_cur."!mark_push"(0, rx494_pos, $I10)
  # rx literal  "$"
    add $I11, rx494_pos, 1
    gt $I11, rx494_eos, rx494_fail
    sub $I11, rx494_pos, rx494_off
    ord $I11, rx494_tgt, $I11
    ne $I11, 36, rx494_fail
    add rx494_pos, 1
    set_addr $I10, rxcap_503_fail
    ($I12, $I11) = rx494_cur."!mark_peek"($I10)
    rx494_cur."!cursor_pos"($I11)
    ($P10) = rx494_cur."!cursor_start"()
    $P10."!cursor_pass"(rx494_pos, "")
    rx494_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_503_done
  rxcap_503_fail:
    goto rx494_fail
  rxcap_503_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_504_fail
    rx494_cur."!mark_push"(0, rx494_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx494_pos, rx494_eos, rx494_fail
    sub $I10, rx494_pos, rx494_off
    substr $S10, rx494_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx494_fail
    inc rx494_pos
    set_addr $I10, rxcap_504_fail
    ($I12, $I11) = rx494_cur."!mark_peek"($I10)
    rx494_cur."!cursor_pos"($I11)
    ($P10) = rx494_cur."!cursor_start"()
    $P10."!cursor_pass"(rx494_pos, "")
    rx494_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_504_done
  rxcap_504_fail:
    goto rx494_fail
  rxcap_504_done:
  alt500_end:
.annotate 'line', 249
  # rx pass
    rx494_cur."!cursor_pass"(rx494_pos, "variable")
    if_null rx494_debug, debug_603
    rx494_cur."!cursor_debug"("PASS", "variable", " at pos=", rx494_pos)
  debug_603:
    .return (rx494_cur)
  rx494_restart:
.annotate 'line', 4
    if_null rx494_debug, debug_604
    rx494_cur."!cursor_debug"("NEXT", "variable")
  debug_604:
  rx494_fail:
    (rx494_rep, rx494_pos, $I10, $P10) = rx494_cur."!mark_fail"(0)
    lt rx494_pos, -1, rx494_done
    eq rx494_pos, -1, rx494_fail
    jump $I10
  rx494_done:
    rx494_cur."!cursor_fail"()
    if_null rx494_debug, debug_605
    rx494_cur."!cursor_debug"("FAIL", "variable")
  debug_605:
    .return (rx494_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("125_1284728478.15265") :method
.annotate 'line', 4
    $P496 = self."!PREFIX__!subrule"("sigil", "")
    $P497 = self."!PREFIX__!subrule"("sigil", "")
    new $P498, "ResizablePMCArray"
    push $P498, "$!"
    push $P498, "$_"
    push $P498, "$/"
    push $P498, $P496
    push $P498, $P497
    .return ($P498)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("126_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx506_tgt
    .local int rx506_pos
    .local int rx506_off
    .local int rx506_eos
    .local int rx506_rep
    .local pmc rx506_cur
    .local pmc rx506_debug
    (rx506_cur, rx506_pos, rx506_tgt, $I10) = self."!cursor_start"()
    getattribute rx506_debug, rx506_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx506_cur
    .local pmc match
    .lex "$/", match
    length rx506_eos, rx506_tgt
    gt rx506_pos, rx506_eos, rx506_done
    set rx506_off, 0
    lt rx506_pos, 2, rx506_start
    sub rx506_off, rx506_pos, 1
    substr rx506_tgt, rx506_tgt, rx506_off
  rx506_start:
    eq $I10, 1, rx506_restart
    if_null rx506_debug, debug_606
    rx506_cur."!cursor_debug"("START", "sigil")
  debug_606:
    $I10 = self.'from'()
    ne $I10, -1, rxscan509_done
    goto rxscan509_scan
  rxscan509_loop:
    ($P10) = rx506_cur."from"()
    inc $P10
    set rx506_pos, $P10
    ge rx506_pos, rx506_eos, rxscan509_done
  rxscan509_scan:
    set_addr $I10, rxscan509_loop
    rx506_cur."!mark_push"(0, rx506_pos, $I10)
  rxscan509_done:
.annotate 'line', 255
  # rx enumcharlist negate=0 
    ge rx506_pos, rx506_eos, rx506_fail
    sub $I10, rx506_pos, rx506_off
    substr $S10, rx506_tgt, $I10, 1
    index $I11, "$@%&", $S10
    lt $I11, 0, rx506_fail
    inc rx506_pos
  # rx pass
    rx506_cur."!cursor_pass"(rx506_pos, "sigil")
    if_null rx506_debug, debug_607
    rx506_cur."!cursor_debug"("PASS", "sigil", " at pos=", rx506_pos)
  debug_607:
    .return (rx506_cur)
  rx506_restart:
.annotate 'line', 4
    if_null rx506_debug, debug_608
    rx506_cur."!cursor_debug"("NEXT", "sigil")
  debug_608:
  rx506_fail:
    (rx506_rep, rx506_pos, $I10, $P10) = rx506_cur."!mark_fail"(0)
    lt rx506_pos, -1, rx506_done
    eq rx506_pos, -1, rx506_fail
    jump $I10
  rx506_done:
    rx506_cur."!cursor_fail"()
    if_null rx506_debug, debug_609
    rx506_cur."!cursor_debug"("FAIL", "sigil")
  debug_609:
    .return (rx506_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("127_1284728478.15265") :method
.annotate 'line', 4
    new $P508, "ResizablePMCArray"
    push $P508, "&"
    push $P508, "%"
    push $P508, "@"
    push $P508, "$"
    .return ($P508)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("128_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx511_tgt
    .local int rx511_pos
    .local int rx511_off
    .local int rx511_eos
    .local int rx511_rep
    .local pmc rx511_cur
    .local pmc rx511_debug
    (rx511_cur, rx511_pos, rx511_tgt, $I10) = self."!cursor_start"()
    getattribute rx511_debug, rx511_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx511_cur
    .local pmc match
    .lex "$/", match
    length rx511_eos, rx511_tgt
    gt rx511_pos, rx511_eos, rx511_done
    set rx511_off, 0
    lt rx511_pos, 2, rx511_start
    sub rx511_off, rx511_pos, 1
    substr rx511_tgt, rx511_tgt, rx511_off
  rx511_start:
    eq $I10, 1, rx511_restart
    if_null rx511_debug, debug_610
    rx511_cur."!cursor_debug"("START", "twigil")
  debug_610:
    $I10 = self.'from'()
    ne $I10, -1, rxscan514_done
    goto rxscan514_scan
  rxscan514_loop:
    ($P10) = rx511_cur."from"()
    inc $P10
    set rx511_pos, $P10
    ge rx511_pos, rx511_eos, rxscan514_done
  rxscan514_scan:
    set_addr $I10, rxscan514_loop
    rx511_cur."!mark_push"(0, rx511_pos, $I10)
  rxscan514_done:
.annotate 'line', 257
  # rx enumcharlist negate=0 
    ge rx511_pos, rx511_eos, rx511_fail
    sub $I10, rx511_pos, rx511_off
    substr $S10, rx511_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx511_fail
    inc rx511_pos
  # rx pass
    rx511_cur."!cursor_pass"(rx511_pos, "twigil")
    if_null rx511_debug, debug_611
    rx511_cur."!cursor_debug"("PASS", "twigil", " at pos=", rx511_pos)
  debug_611:
    .return (rx511_cur)
  rx511_restart:
.annotate 'line', 4
    if_null rx511_debug, debug_612
    rx511_cur."!cursor_debug"("NEXT", "twigil")
  debug_612:
  rx511_fail:
    (rx511_rep, rx511_pos, $I10, $P10) = rx511_cur."!mark_fail"(0)
    lt rx511_pos, -1, rx511_done
    eq rx511_pos, -1, rx511_fail
    jump $I10
  rx511_done:
    rx511_cur."!cursor_fail"()
    if_null rx511_debug, debug_613
    rx511_cur."!cursor_debug"("FAIL", "twigil")
  debug_613:
    .return (rx511_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("129_1284728478.15265") :method
.annotate 'line', 4
    new $P513, "ResizablePMCArray"
    push $P513, "?"
    push $P513, "!"
    push $P513, "*"
    .return ($P513)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("130_1284728478.15265") :method
.annotate 'line', 259
    $P516 = self."!protoregex"("package_declarator")
    .return ($P516)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("131_1284728478.15265") :method
.annotate 'line', 259
    $P518 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P518)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("132_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx520_tgt
    .local int rx520_pos
    .local int rx520_off
    .local int rx520_eos
    .local int rx520_rep
    .local pmc rx520_cur
    .local pmc rx520_debug
    (rx520_cur, rx520_pos, rx520_tgt, $I10) = self."!cursor_start"()
    getattribute rx520_debug, rx520_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx520_cur
    .local pmc match
    .lex "$/", match
    length rx520_eos, rx520_tgt
    gt rx520_pos, rx520_eos, rx520_done
    set rx520_off, 0
    lt rx520_pos, 2, rx520_start
    sub rx520_off, rx520_pos, 1
    substr rx520_tgt, rx520_tgt, rx520_off
  rx520_start:
    eq $I10, 1, rx520_restart
    if_null rx520_debug, debug_614
    rx520_cur."!cursor_debug"("START", "package_declarator:sym<module>")
  debug_614:
    $I10 = self.'from'()
    ne $I10, -1, rxscan524_done
    goto rxscan524_scan
  rxscan524_loop:
    ($P10) = rx520_cur."from"()
    inc $P10
    set rx520_pos, $P10
    ge rx520_pos, rx520_eos, rxscan524_done
  rxscan524_scan:
    set_addr $I10, rxscan524_loop
    rx520_cur."!mark_push"(0, rx520_pos, $I10)
  rxscan524_done:
.annotate 'line', 260
  # rx subcapture "sym"
    set_addr $I10, rxcap_525_fail
    rx520_cur."!mark_push"(0, rx520_pos, $I10)
  # rx literal  "module"
    add $I11, rx520_pos, 6
    gt $I11, rx520_eos, rx520_fail
    sub $I11, rx520_pos, rx520_off
    substr $S10, rx520_tgt, $I11, 6
    ne $S10, "module", rx520_fail
    add rx520_pos, 6
    set_addr $I10, rxcap_525_fail
    ($I12, $I11) = rx520_cur."!mark_peek"($I10)
    rx520_cur."!cursor_pos"($I11)
    ($P10) = rx520_cur."!cursor_start"()
    $P10."!cursor_pass"(rx520_pos, "")
    rx520_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_525_done
  rxcap_525_fail:
    goto rx520_fail
  rxcap_525_done:
  # rx subrule "package_def" subtype=capture negate=
    rx520_cur."!cursor_pos"(rx520_pos)
    $P10 = rx520_cur."package_def"()
    unless $P10, rx520_fail
    rx520_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx520_pos = $P10."pos"()
  # rx pass
    rx520_cur."!cursor_pass"(rx520_pos, "package_declarator:sym<module>")
    if_null rx520_debug, debug_615
    rx520_cur."!cursor_debug"("PASS", "package_declarator:sym<module>", " at pos=", rx520_pos)
  debug_615:
    .return (rx520_cur)
  rx520_restart:
.annotate 'line', 4
    if_null rx520_debug, debug_616
    rx520_cur."!cursor_debug"("NEXT", "package_declarator:sym<module>")
  debug_616:
  rx520_fail:
    (rx520_rep, rx520_pos, $I10, $P10) = rx520_cur."!mark_fail"(0)
    lt rx520_pos, -1, rx520_done
    eq rx520_pos, -1, rx520_fail
    jump $I10
  rx520_done:
    rx520_cur."!cursor_fail"()
    if_null rx520_debug, debug_617
    rx520_cur."!cursor_debug"("FAIL", "package_declarator:sym<module>")
  debug_617:
    .return (rx520_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("133_1284728478.15265") :method
.annotate 'line', 4
    $P522 = self."!PREFIX__!subrule"("package_def", "module")
    new $P523, "ResizablePMCArray"
    push $P523, $P522
    .return ($P523)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("134_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx527_tgt
    .local int rx527_pos
    .local int rx527_off
    .local int rx527_eos
    .local int rx527_rep
    .local pmc rx527_cur
    .local pmc rx527_debug
    (rx527_cur, rx527_pos, rx527_tgt, $I10) = self."!cursor_start"()
    getattribute rx527_debug, rx527_cur, "$!debug"
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
    eq $I10, 1, rx527_restart
    if_null rx527_debug, debug_618
    rx527_cur."!cursor_debug"("START", "package_declarator:sym<class>")
  debug_618:
    $I10 = self.'from'()
    ne $I10, -1, rxscan532_done
    goto rxscan532_scan
  rxscan532_loop:
    ($P10) = rx527_cur."from"()
    inc $P10
    set rx527_pos, $P10
    ge rx527_pos, rx527_eos, rxscan532_done
  rxscan532_scan:
    set_addr $I10, rxscan532_loop
    rx527_cur."!mark_push"(0, rx527_pos, $I10)
  rxscan532_done:
.annotate 'line', 261
  # rx subcapture "sym"
    set_addr $I10, rxcap_534_fail
    rx527_cur."!mark_push"(0, rx527_pos, $I10)
  alt533_0:
    set_addr $I10, alt533_1
    rx527_cur."!mark_push"(0, rx527_pos, $I10)
  # rx literal  "class"
    add $I11, rx527_pos, 5
    gt $I11, rx527_eos, rx527_fail
    sub $I11, rx527_pos, rx527_off
    substr $S10, rx527_tgt, $I11, 5
    ne $S10, "class", rx527_fail
    add rx527_pos, 5
    goto alt533_end
  alt533_1:
  # rx literal  "grammar"
    add $I11, rx527_pos, 7
    gt $I11, rx527_eos, rx527_fail
    sub $I11, rx527_pos, rx527_off
    substr $S10, rx527_tgt, $I11, 7
    ne $S10, "grammar", rx527_fail
    add rx527_pos, 7
  alt533_end:
    set_addr $I10, rxcap_534_fail
    ($I12, $I11) = rx527_cur."!mark_peek"($I10)
    rx527_cur."!cursor_pos"($I11)
    ($P10) = rx527_cur."!cursor_start"()
    $P10."!cursor_pass"(rx527_pos, "")
    rx527_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_534_done
  rxcap_534_fail:
    goto rx527_fail
  rxcap_534_done:
  # rx subrule "package_def" subtype=capture negate=
    rx527_cur."!cursor_pos"(rx527_pos)
    $P10 = rx527_cur."package_def"()
    unless $P10, rx527_fail
    rx527_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx527_pos = $P10."pos"()
  # rx pass
    rx527_cur."!cursor_pass"(rx527_pos, "package_declarator:sym<class>")
    if_null rx527_debug, debug_619
    rx527_cur."!cursor_debug"("PASS", "package_declarator:sym<class>", " at pos=", rx527_pos)
  debug_619:
    .return (rx527_cur)
  rx527_restart:
.annotate 'line', 4
    if_null rx527_debug, debug_620
    rx527_cur."!cursor_debug"("NEXT", "package_declarator:sym<class>")
  debug_620:
  rx527_fail:
    (rx527_rep, rx527_pos, $I10, $P10) = rx527_cur."!mark_fail"(0)
    lt rx527_pos, -1, rx527_done
    eq rx527_pos, -1, rx527_fail
    jump $I10
  rx527_done:
    rx527_cur."!cursor_fail"()
    if_null rx527_debug, debug_621
    rx527_cur."!cursor_debug"("FAIL", "package_declarator:sym<class>")
  debug_621:
    .return (rx527_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("135_1284728478.15265") :method
.annotate 'line', 4
    $P529 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P530 = self."!PREFIX__!subrule"("package_def", "class")
    new $P531, "ResizablePMCArray"
    push $P531, $P529
    push $P531, $P530
    .return ($P531)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("136_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx536_tgt
    .local int rx536_pos
    .local int rx536_off
    .local int rx536_eos
    .local int rx536_rep
    .local pmc rx536_cur
    .local pmc rx536_debug
    (rx536_cur, rx536_pos, rx536_tgt, $I10) = self."!cursor_start"()
    rx536_cur."!cursor_caparray"("parent")
    getattribute rx536_debug, rx536_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx536_cur
    .local pmc match
    .lex "$/", match
    length rx536_eos, rx536_tgt
    gt rx536_pos, rx536_eos, rx536_done
    set rx536_off, 0
    lt rx536_pos, 2, rx536_start
    sub rx536_off, rx536_pos, 1
    substr rx536_tgt, rx536_tgt, rx536_off
  rx536_start:
    eq $I10, 1, rx536_restart
    if_null rx536_debug, debug_622
    rx536_cur."!cursor_debug"("START", "package_def")
  debug_622:
    $I10 = self.'from'()
    ne $I10, -1, rxscan540_done
    goto rxscan540_scan
  rxscan540_loop:
    ($P10) = rx536_cur."from"()
    inc $P10
    set rx536_pos, $P10
    ge rx536_pos, rx536_eos, rxscan540_done
  rxscan540_scan:
    set_addr $I10, rxscan540_loop
    rx536_cur."!mark_push"(0, rx536_pos, $I10)
  rxscan540_done:
.annotate 'line', 263
  # rx subrule "ws" subtype=method negate=
    rx536_cur."!cursor_pos"(rx536_pos)
    $P10 = rx536_cur."ws"()
    unless $P10, rx536_fail
    rx536_pos = $P10."pos"()
.annotate 'line', 264
  # rx subrule "name" subtype=capture negate=
    rx536_cur."!cursor_pos"(rx536_pos)
    $P10 = rx536_cur."name"()
    unless $P10, rx536_fail
    rx536_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx536_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx536_cur."!cursor_pos"(rx536_pos)
    $P10 = rx536_cur."ws"()
    unless $P10, rx536_fail
    rx536_pos = $P10."pos"()
.annotate 'line', 265
  # rx rxquantr543 ** 0..1
    set_addr $I10, rxquantr543_done
    rx536_cur."!mark_push"(0, rx536_pos, $I10)
  rxquantr543_loop:
  # rx subrule "ws" subtype=method negate=
    rx536_cur."!cursor_pos"(rx536_pos)
    $P10 = rx536_cur."ws"()
    unless $P10, rx536_fail
    rx536_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx536_pos, 2
    gt $I11, rx536_eos, rx536_fail
    sub $I11, rx536_pos, rx536_off
    substr $S10, rx536_tgt, $I11, 2
    ne $S10, "is", rx536_fail
    add rx536_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx536_cur."!cursor_pos"(rx536_pos)
    $P10 = rx536_cur."ws"()
    unless $P10, rx536_fail
    rx536_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx536_cur."!cursor_pos"(rx536_pos)
    $P10 = rx536_cur."name"()
    unless $P10, rx536_fail
    rx536_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx536_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx536_cur."!cursor_pos"(rx536_pos)
    $P10 = rx536_cur."ws"()
    unless $P10, rx536_fail
    rx536_pos = $P10."pos"()
    set_addr $I10, rxquantr543_done
    (rx536_rep) = rx536_cur."!mark_commit"($I10)
  rxquantr543_done:
  # rx subrule "ws" subtype=method negate=
    rx536_cur."!cursor_pos"(rx536_pos)
    $P10 = rx536_cur."ws"()
    unless $P10, rx536_fail
    rx536_pos = $P10."pos"()
  alt548_0:
.annotate 'line', 266
    set_addr $I10, alt548_1
    rx536_cur."!mark_push"(0, rx536_pos, $I10)
.annotate 'line', 267
  # rx subrule "ws" subtype=method negate=
    rx536_cur."!cursor_pos"(rx536_pos)
    $P10 = rx536_cur."ws"()
    unless $P10, rx536_fail
    rx536_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx536_pos, 1
    gt $I11, rx536_eos, rx536_fail
    sub $I11, rx536_pos, rx536_off
    ord $I11, rx536_tgt, $I11
    ne $I11, 59, rx536_fail
    add rx536_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx536_cur."!cursor_pos"(rx536_pos)
    $P10 = rx536_cur."ws"()
    unless $P10, rx536_fail
    rx536_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx536_cur."!cursor_pos"(rx536_pos)
    $P10 = rx536_cur."comp_unit"()
    unless $P10, rx536_fail
    rx536_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx536_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx536_cur."!cursor_pos"(rx536_pos)
    $P10 = rx536_cur."ws"()
    unless $P10, rx536_fail
    rx536_pos = $P10."pos"()
    goto alt548_end
  alt548_1:
    set_addr $I10, alt548_2
    rx536_cur."!mark_push"(0, rx536_pos, $I10)
.annotate 'line', 268
  # rx subrule "ws" subtype=method negate=
    rx536_cur."!cursor_pos"(rx536_pos)
    $P10 = rx536_cur."ws"()
    unless $P10, rx536_fail
    rx536_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx536_pos, rx536_off
    substr $S10, rx536_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx536_fail
  # rx subrule "ws" subtype=method negate=
    rx536_cur."!cursor_pos"(rx536_pos)
    $P10 = rx536_cur."ws"()
    unless $P10, rx536_fail
    rx536_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx536_cur."!cursor_pos"(rx536_pos)
    $P10 = rx536_cur."block"()
    unless $P10, rx536_fail
    rx536_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx536_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx536_cur."!cursor_pos"(rx536_pos)
    $P10 = rx536_cur."ws"()
    unless $P10, rx536_fail
    rx536_pos = $P10."pos"()
    goto alt548_end
  alt548_2:
.annotate 'line', 269
  # rx subrule "ws" subtype=method negate=
    rx536_cur."!cursor_pos"(rx536_pos)
    $P10 = rx536_cur."ws"()
    unless $P10, rx536_fail
    rx536_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx536_cur."!cursor_pos"(rx536_pos)
    $P10 = rx536_cur."panic"("Malformed package declaration")
    unless $P10, rx536_fail
    rx536_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx536_cur."!cursor_pos"(rx536_pos)
    $P10 = rx536_cur."ws"()
    unless $P10, rx536_fail
    rx536_pos = $P10."pos"()
  alt548_end:
.annotate 'line', 270
  # rx subrule "ws" subtype=method negate=
    rx536_cur."!cursor_pos"(rx536_pos)
    $P10 = rx536_cur."ws"()
    unless $P10, rx536_fail
    rx536_pos = $P10."pos"()
.annotate 'line', 263
  # rx pass
    rx536_cur."!cursor_pass"(rx536_pos, "package_def")
    if_null rx536_debug, debug_623
    rx536_cur."!cursor_debug"("PASS", "package_def", " at pos=", rx536_pos)
  debug_623:
    .return (rx536_cur)
  rx536_restart:
.annotate 'line', 4
    if_null rx536_debug, debug_624
    rx536_cur."!cursor_debug"("NEXT", "package_def")
  debug_624:
  rx536_fail:
    (rx536_rep, rx536_pos, $I10, $P10) = rx536_cur."!mark_fail"(0)
    lt rx536_pos, -1, rx536_done
    eq rx536_pos, -1, rx536_fail
    jump $I10
  rx536_done:
    rx536_cur."!cursor_fail"()
    if_null rx536_debug, debug_625
    rx536_cur."!cursor_debug"("FAIL", "package_def")
  debug_625:
    .return (rx536_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("137_1284728478.15265") :method
.annotate 'line', 4
    $P538 = self."!PREFIX__!subrule"("ws", "")
    new $P539, "ResizablePMCArray"
    push $P539, $P538
    .return ($P539)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("138_1284728478.15265") :method
.annotate 'line', 273
    $P559 = self."!protoregex"("scope_declarator")
    .return ($P559)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("139_1284728478.15265") :method
.annotate 'line', 273
    $P561 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P561)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("140_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx563_tgt
    .local int rx563_pos
    .local int rx563_off
    .local int rx563_eos
    .local int rx563_rep
    .local pmc rx563_cur
    .local pmc rx563_debug
    (rx563_cur, rx563_pos, rx563_tgt, $I10) = self."!cursor_start"()
    getattribute rx563_debug, rx563_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx563_cur
    .local pmc match
    .lex "$/", match
    length rx563_eos, rx563_tgt
    gt rx563_pos, rx563_eos, rx563_done
    set rx563_off, 0
    lt rx563_pos, 2, rx563_start
    sub rx563_off, rx563_pos, 1
    substr rx563_tgt, rx563_tgt, rx563_off
  rx563_start:
    eq $I10, 1, rx563_restart
    if_null rx563_debug, debug_626
    rx563_cur."!cursor_debug"("START", "scope_declarator:sym<my>")
  debug_626:
    $I10 = self.'from'()
    ne $I10, -1, rxscan567_done
    goto rxscan567_scan
  rxscan567_loop:
    ($P10) = rx563_cur."from"()
    inc $P10
    set rx563_pos, $P10
    ge rx563_pos, rx563_eos, rxscan567_done
  rxscan567_scan:
    set_addr $I10, rxscan567_loop
    rx563_cur."!mark_push"(0, rx563_pos, $I10)
  rxscan567_done:
.annotate 'line', 274
  # rx subcapture "sym"
    set_addr $I10, rxcap_568_fail
    rx563_cur."!mark_push"(0, rx563_pos, $I10)
  # rx literal  "my"
    add $I11, rx563_pos, 2
    gt $I11, rx563_eos, rx563_fail
    sub $I11, rx563_pos, rx563_off
    substr $S10, rx563_tgt, $I11, 2
    ne $S10, "my", rx563_fail
    add rx563_pos, 2
    set_addr $I10, rxcap_568_fail
    ($I12, $I11) = rx563_cur."!mark_peek"($I10)
    rx563_cur."!cursor_pos"($I11)
    ($P10) = rx563_cur."!cursor_start"()
    $P10."!cursor_pass"(rx563_pos, "")
    rx563_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_568_done
  rxcap_568_fail:
    goto rx563_fail
  rxcap_568_done:
  # rx subrule "scoped" subtype=capture negate=
    rx563_cur."!cursor_pos"(rx563_pos)
    $P10 = rx563_cur."scoped"("my")
    unless $P10, rx563_fail
    rx563_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx563_pos = $P10."pos"()
  # rx pass
    rx563_cur."!cursor_pass"(rx563_pos, "scope_declarator:sym<my>")
    if_null rx563_debug, debug_627
    rx563_cur."!cursor_debug"("PASS", "scope_declarator:sym<my>", " at pos=", rx563_pos)
  debug_627:
    .return (rx563_cur)
  rx563_restart:
.annotate 'line', 4
    if_null rx563_debug, debug_628
    rx563_cur."!cursor_debug"("NEXT", "scope_declarator:sym<my>")
  debug_628:
  rx563_fail:
    (rx563_rep, rx563_pos, $I10, $P10) = rx563_cur."!mark_fail"(0)
    lt rx563_pos, -1, rx563_done
    eq rx563_pos, -1, rx563_fail
    jump $I10
  rx563_done:
    rx563_cur."!cursor_fail"()
    if_null rx563_debug, debug_629
    rx563_cur."!cursor_debug"("FAIL", "scope_declarator:sym<my>")
  debug_629:
    .return (rx563_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("141_1284728478.15265") :method
.annotate 'line', 4
    $P565 = self."!PREFIX__!subrule"("scoped", "my")
    new $P566, "ResizablePMCArray"
    push $P566, $P565
    .return ($P566)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("142_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx570_tgt
    .local int rx570_pos
    .local int rx570_off
    .local int rx570_eos
    .local int rx570_rep
    .local pmc rx570_cur
    .local pmc rx570_debug
    (rx570_cur, rx570_pos, rx570_tgt, $I10) = self."!cursor_start"()
    getattribute rx570_debug, rx570_cur, "$!debug"
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
    eq $I10, 1, rx570_restart
    if_null rx570_debug, debug_630
    rx570_cur."!cursor_debug"("START", "scope_declarator:sym<our>")
  debug_630:
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
.annotate 'line', 275
  # rx subcapture "sym"
    set_addr $I10, rxcap_575_fail
    rx570_cur."!mark_push"(0, rx570_pos, $I10)
  # rx literal  "our"
    add $I11, rx570_pos, 3
    gt $I11, rx570_eos, rx570_fail
    sub $I11, rx570_pos, rx570_off
    substr $S10, rx570_tgt, $I11, 3
    ne $S10, "our", rx570_fail
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
  # rx subrule "scoped" subtype=capture negate=
    rx570_cur."!cursor_pos"(rx570_pos)
    $P10 = rx570_cur."scoped"("our")
    unless $P10, rx570_fail
    rx570_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx570_pos = $P10."pos"()
  # rx pass
    rx570_cur."!cursor_pass"(rx570_pos, "scope_declarator:sym<our>")
    if_null rx570_debug, debug_631
    rx570_cur."!cursor_debug"("PASS", "scope_declarator:sym<our>", " at pos=", rx570_pos)
  debug_631:
    .return (rx570_cur)
  rx570_restart:
.annotate 'line', 4
    if_null rx570_debug, debug_632
    rx570_cur."!cursor_debug"("NEXT", "scope_declarator:sym<our>")
  debug_632:
  rx570_fail:
    (rx570_rep, rx570_pos, $I10, $P10) = rx570_cur."!mark_fail"(0)
    lt rx570_pos, -1, rx570_done
    eq rx570_pos, -1, rx570_fail
    jump $I10
  rx570_done:
    rx570_cur."!cursor_fail"()
    if_null rx570_debug, debug_633
    rx570_cur."!cursor_debug"("FAIL", "scope_declarator:sym<our>")
  debug_633:
    .return (rx570_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("143_1284728478.15265") :method
.annotate 'line', 4
    $P572 = self."!PREFIX__!subrule"("scoped", "our")
    new $P573, "ResizablePMCArray"
    push $P573, $P572
    .return ($P573)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("144_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx577_tgt
    .local int rx577_pos
    .local int rx577_off
    .local int rx577_eos
    .local int rx577_rep
    .local pmc rx577_cur
    .local pmc rx577_debug
    (rx577_cur, rx577_pos, rx577_tgt, $I10) = self."!cursor_start"()
    getattribute rx577_debug, rx577_cur, "$!debug"
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
    eq $I10, 1, rx577_restart
    if_null rx577_debug, debug_634
    rx577_cur."!cursor_debug"("START", "scope_declarator:sym<has>")
  debug_634:
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
.annotate 'line', 276
  # rx subcapture "sym"
    set_addr $I10, rxcap_582_fail
    rx577_cur."!mark_push"(0, rx577_pos, $I10)
  # rx literal  "has"
    add $I11, rx577_pos, 3
    gt $I11, rx577_eos, rx577_fail
    sub $I11, rx577_pos, rx577_off
    substr $S10, rx577_tgt, $I11, 3
    ne $S10, "has", rx577_fail
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
    $P10 = rx577_cur."scoped"("has")
    unless $P10, rx577_fail
    rx577_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx577_pos = $P10."pos"()
  # rx pass
    rx577_cur."!cursor_pass"(rx577_pos, "scope_declarator:sym<has>")
    if_null rx577_debug, debug_635
    rx577_cur."!cursor_debug"("PASS", "scope_declarator:sym<has>", " at pos=", rx577_pos)
  debug_635:
    .return (rx577_cur)
  rx577_restart:
.annotate 'line', 4
    if_null rx577_debug, debug_636
    rx577_cur."!cursor_debug"("NEXT", "scope_declarator:sym<has>")
  debug_636:
  rx577_fail:
    (rx577_rep, rx577_pos, $I10, $P10) = rx577_cur."!mark_fail"(0)
    lt rx577_pos, -1, rx577_done
    eq rx577_pos, -1, rx577_fail
    jump $I10
  rx577_done:
    rx577_cur."!cursor_fail"()
    if_null rx577_debug, debug_637
    rx577_cur."!cursor_debug"("FAIL", "scope_declarator:sym<has>")
  debug_637:
    .return (rx577_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("145_1284728478.15265") :method
.annotate 'line', 4
    $P579 = self."!PREFIX__!subrule"("scoped", "has")
    new $P580, "ResizablePMCArray"
    push $P580, $P579
    .return ($P580)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("146_1284728478.15265") :method :outer("11_1284728478.15265")
    .param pmc param_584
.annotate 'line', 278
    .lex "$*SCOPE", param_584
.annotate 'line', 4
    .local string rx585_tgt
    .local int rx585_pos
    .local int rx585_off
    .local int rx585_eos
    .local int rx585_rep
    .local pmc rx585_cur
    .local pmc rx585_debug
    (rx585_cur, rx585_pos, rx585_tgt, $I10) = self."!cursor_start"()
    getattribute rx585_debug, rx585_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx585_cur
    .local pmc match
    .lex "$/", match
    length rx585_eos, rx585_tgt
    gt rx585_pos, rx585_eos, rx585_done
    set rx585_off, 0
    lt rx585_pos, 2, rx585_start
    sub rx585_off, rx585_pos, 1
    substr rx585_tgt, rx585_tgt, rx585_off
  rx585_start:
    eq $I10, 1, rx585_restart
    if_null rx585_debug, debug_638
    rx585_cur."!cursor_debug"("START", "scoped")
  debug_638:
    $I10 = self.'from'()
    ne $I10, -1, rxscan590_done
    goto rxscan590_scan
  rxscan590_loop:
    ($P10) = rx585_cur."from"()
    inc $P10
    set rx585_pos, $P10
    ge rx585_pos, rx585_eos, rxscan590_done
  rxscan590_scan:
    set_addr $I10, rxscan590_loop
    rx585_cur."!mark_push"(0, rx585_pos, $I10)
  rxscan590_done:
  alt591_0:
.annotate 'line', 278
    set_addr $I10, alt591_1
    rx585_cur."!mark_push"(0, rx585_pos, $I10)
.annotate 'line', 279
  # rx subrule "ws" subtype=method negate=
    rx585_cur."!cursor_pos"(rx585_pos)
    $P10 = rx585_cur."ws"()
    unless $P10, rx585_fail
    rx585_pos = $P10."pos"()
  # rx subrule "declarator" subtype=capture negate=
    rx585_cur."!cursor_pos"(rx585_pos)
    $P10 = rx585_cur."declarator"()
    unless $P10, rx585_fail
    rx585_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx585_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx585_cur."!cursor_pos"(rx585_pos)
    $P10 = rx585_cur."ws"()
    unless $P10, rx585_fail
    rx585_pos = $P10."pos"()
    goto alt591_end
  alt591_1:
.annotate 'line', 280
  # rx subrule "ws" subtype=method negate=
    rx585_cur."!cursor_pos"(rx585_pos)
    $P10 = rx585_cur."ws"()
    unless $P10, rx585_fail
    rx585_pos = $P10."pos"()
  # rx subrule "multi_declarator" subtype=capture negate=
    rx585_cur."!cursor_pos"(rx585_pos)
    $P10 = rx585_cur."multi_declarator"()
    unless $P10, rx585_fail
    rx585_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("multi_declarator")
    rx585_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx585_cur."!cursor_pos"(rx585_pos)
    $P10 = rx585_cur."ws"()
    unless $P10, rx585_fail
    rx585_pos = $P10."pos"()
  alt591_end:
.annotate 'line', 278
  # rx pass
    rx585_cur."!cursor_pass"(rx585_pos, "scoped")
    if_null rx585_debug, debug_639
    rx585_cur."!cursor_debug"("PASS", "scoped", " at pos=", rx585_pos)
  debug_639:
    .return (rx585_cur)
  rx585_restart:
.annotate 'line', 4
    if_null rx585_debug, debug_640
    rx585_cur."!cursor_debug"("NEXT", "scoped")
  debug_640:
  rx585_fail:
    (rx585_rep, rx585_pos, $I10, $P10) = rx585_cur."!mark_fail"(0)
    lt rx585_pos, -1, rx585_done
    eq rx585_pos, -1, rx585_fail
    jump $I10
  rx585_done:
    rx585_cur."!cursor_fail"()
    if_null rx585_debug, debug_641
    rx585_cur."!cursor_debug"("FAIL", "scoped")
  debug_641:
    .return (rx585_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("147_1284728478.15265") :method
.annotate 'line', 4
    $P587 = self."!PREFIX__!subrule"("ws", "")
    $P588 = self."!PREFIX__!subrule"("ws", "")
    new $P589, "ResizablePMCArray"
    push $P589, $P587
    push $P589, $P588
    .return ($P589)
.end


.namespace ["NQP";"Grammar"]
.sub "typename"  :subid("148_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx597_tgt
    .local int rx597_pos
    .local int rx597_off
    .local int rx597_eos
    .local int rx597_rep
    .local pmc rx597_cur
    .local pmc rx597_debug
    (rx597_cur, rx597_pos, rx597_tgt, $I10) = self."!cursor_start"()
    getattribute rx597_debug, rx597_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx597_cur
    .local pmc match
    .lex "$/", match
    length rx597_eos, rx597_tgt
    gt rx597_pos, rx597_eos, rx597_done
    set rx597_off, 0
    lt rx597_pos, 2, rx597_start
    sub rx597_off, rx597_pos, 1
    substr rx597_tgt, rx597_tgt, rx597_off
  rx597_start:
    eq $I10, 1, rx597_restart
    if_null rx597_debug, debug_642
    rx597_cur."!cursor_debug"("START", "typename")
  debug_642:
    $I10 = self.'from'()
    ne $I10, -1, rxscan601_done
    goto rxscan601_scan
  rxscan601_loop:
    ($P10) = rx597_cur."from"()
    inc $P10
    set rx597_pos, $P10
    ge rx597_pos, rx597_eos, rxscan601_done
  rxscan601_scan:
    set_addr $I10, rxscan601_loop
    rx597_cur."!mark_push"(0, rx597_pos, $I10)
  rxscan601_done:
.annotate 'line', 283
  # rx subrule "name" subtype=capture negate=
    rx597_cur."!cursor_pos"(rx597_pos)
    $P10 = rx597_cur."name"()
    unless $P10, rx597_fail
    rx597_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx597_pos = $P10."pos"()
  # rx pass
    rx597_cur."!cursor_pass"(rx597_pos, "typename")
    if_null rx597_debug, debug_643
    rx597_cur."!cursor_debug"("PASS", "typename", " at pos=", rx597_pos)
  debug_643:
    .return (rx597_cur)
  rx597_restart:
.annotate 'line', 4
    if_null rx597_debug, debug_644
    rx597_cur."!cursor_debug"("NEXT", "typename")
  debug_644:
  rx597_fail:
    (rx597_rep, rx597_pos, $I10, $P10) = rx597_cur."!mark_fail"(0)
    lt rx597_pos, -1, rx597_done
    eq rx597_pos, -1, rx597_fail
    jump $I10
  rx597_done:
    rx597_cur."!cursor_fail"()
    if_null rx597_debug, debug_645
    rx597_cur."!cursor_debug"("FAIL", "typename")
  debug_645:
    .return (rx597_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__typename"  :subid("149_1284728478.15265") :method
.annotate 'line', 4
    $P599 = self."!PREFIX__!subrule"("name", "")
    new $P600, "ResizablePMCArray"
    push $P600, $P599
    .return ($P600)
.end


.namespace ["NQP";"Grammar"]
.sub "declarator"  :subid("150_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx603_tgt
    .local int rx603_pos
    .local int rx603_off
    .local int rx603_eos
    .local int rx603_rep
    .local pmc rx603_cur
    .local pmc rx603_debug
    (rx603_cur, rx603_pos, rx603_tgt, $I10) = self."!cursor_start"()
    getattribute rx603_debug, rx603_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx603_cur
    .local pmc match
    .lex "$/", match
    length rx603_eos, rx603_tgt
    gt rx603_pos, rx603_eos, rx603_done
    set rx603_off, 0
    lt rx603_pos, 2, rx603_start
    sub rx603_off, rx603_pos, 1
    substr rx603_tgt, rx603_tgt, rx603_off
  rx603_start:
    eq $I10, 1, rx603_restart
    if_null rx603_debug, debug_646
    rx603_cur."!cursor_debug"("START", "declarator")
  debug_646:
    $I10 = self.'from'()
    ne $I10, -1, rxscan608_done
    goto rxscan608_scan
  rxscan608_loop:
    ($P10) = rx603_cur."from"()
    inc $P10
    set rx603_pos, $P10
    ge rx603_pos, rx603_eos, rxscan608_done
  rxscan608_scan:
    set_addr $I10, rxscan608_loop
    rx603_cur."!mark_push"(0, rx603_pos, $I10)
  rxscan608_done:
  alt609_0:
.annotate 'line', 285
    set_addr $I10, alt609_1
    rx603_cur."!mark_push"(0, rx603_pos, $I10)
.annotate 'line', 286
  # rx subrule "variable_declarator" subtype=capture negate=
    rx603_cur."!cursor_pos"(rx603_pos)
    $P10 = rx603_cur."variable_declarator"()
    unless $P10, rx603_fail
    rx603_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx603_pos = $P10."pos"()
    goto alt609_end
  alt609_1:
.annotate 'line', 287
  # rx subrule "routine_declarator" subtype=capture negate=
    rx603_cur."!cursor_pos"(rx603_pos)
    $P10 = rx603_cur."routine_declarator"()
    unless $P10, rx603_fail
    rx603_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx603_pos = $P10."pos"()
  alt609_end:
.annotate 'line', 285
  # rx pass
    rx603_cur."!cursor_pass"(rx603_pos, "declarator")
    if_null rx603_debug, debug_647
    rx603_cur."!cursor_debug"("PASS", "declarator", " at pos=", rx603_pos)
  debug_647:
    .return (rx603_cur)
  rx603_restart:
.annotate 'line', 4
    if_null rx603_debug, debug_648
    rx603_cur."!cursor_debug"("NEXT", "declarator")
  debug_648:
  rx603_fail:
    (rx603_rep, rx603_pos, $I10, $P10) = rx603_cur."!mark_fail"(0)
    lt rx603_pos, -1, rx603_done
    eq rx603_pos, -1, rx603_fail
    jump $I10
  rx603_done:
    rx603_cur."!cursor_fail"()
    if_null rx603_debug, debug_649
    rx603_cur."!cursor_debug"("FAIL", "declarator")
  debug_649:
    .return (rx603_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__declarator"  :subid("151_1284728478.15265") :method
.annotate 'line', 4
    $P605 = self."!PREFIX__!subrule"("routine_declarator", "")
    $P606 = self."!PREFIX__!subrule"("variable_declarator", "")
    new $P607, "ResizablePMCArray"
    push $P607, $P605
    push $P607, $P606
    .return ($P607)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("152_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx611_tgt
    .local int rx611_pos
    .local int rx611_off
    .local int rx611_eos
    .local int rx611_rep
    .local pmc rx611_cur
    .local pmc rx611_debug
    (rx611_cur, rx611_pos, rx611_tgt, $I10) = self."!cursor_start"()
    getattribute rx611_debug, rx611_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx611_cur
    .local pmc match
    .lex "$/", match
    length rx611_eos, rx611_tgt
    gt rx611_pos, rx611_eos, rx611_done
    set rx611_off, 0
    lt rx611_pos, 2, rx611_start
    sub rx611_off, rx611_pos, 1
    substr rx611_tgt, rx611_tgt, rx611_off
  rx611_start:
    eq $I10, 1, rx611_restart
    if_null rx611_debug, debug_650
    rx611_cur."!cursor_debug"("START", "variable_declarator")
  debug_650:
    $I10 = self.'from'()
    ne $I10, -1, rxscan615_done
    goto rxscan615_scan
  rxscan615_loop:
    ($P10) = rx611_cur."from"()
    inc $P10
    set rx611_pos, $P10
    ge rx611_pos, rx611_eos, rxscan615_done
  rxscan615_scan:
    set_addr $I10, rxscan615_loop
    rx611_cur."!mark_push"(0, rx611_pos, $I10)
  rxscan615_done:
.annotate 'line', 290
  # rx subrule "variable" subtype=capture negate=
    rx611_cur."!cursor_pos"(rx611_pos)
    $P10 = rx611_cur."variable"()
    unless $P10, rx611_fail
    rx611_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx611_pos = $P10."pos"()
  # rx pass
    rx611_cur."!cursor_pass"(rx611_pos, "variable_declarator")
    if_null rx611_debug, debug_651
    rx611_cur."!cursor_debug"("PASS", "variable_declarator", " at pos=", rx611_pos)
  debug_651:
    .return (rx611_cur)
  rx611_restart:
.annotate 'line', 4
    if_null rx611_debug, debug_652
    rx611_cur."!cursor_debug"("NEXT", "variable_declarator")
  debug_652:
  rx611_fail:
    (rx611_rep, rx611_pos, $I10, $P10) = rx611_cur."!mark_fail"(0)
    lt rx611_pos, -1, rx611_done
    eq rx611_pos, -1, rx611_fail
    jump $I10
  rx611_done:
    rx611_cur."!cursor_fail"()
    if_null rx611_debug, debug_653
    rx611_cur."!cursor_debug"("FAIL", "variable_declarator")
  debug_653:
    .return (rx611_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("153_1284728478.15265") :method
.annotate 'line', 4
    $P613 = self."!PREFIX__!subrule"("variable", "")
    new $P614, "ResizablePMCArray"
    push $P614, $P613
    .return ($P614)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("154_1284728478.15265") :method
.annotate 'line', 292
    $P617 = self."!protoregex"("routine_declarator")
    .return ($P617)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("155_1284728478.15265") :method
.annotate 'line', 292
    $P619 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P619)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("156_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx621_tgt
    .local int rx621_pos
    .local int rx621_off
    .local int rx621_eos
    .local int rx621_rep
    .local pmc rx621_cur
    .local pmc rx621_debug
    (rx621_cur, rx621_pos, rx621_tgt, $I10) = self."!cursor_start"()
    getattribute rx621_debug, rx621_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx621_cur
    .local pmc match
    .lex "$/", match
    length rx621_eos, rx621_tgt
    gt rx621_pos, rx621_eos, rx621_done
    set rx621_off, 0
    lt rx621_pos, 2, rx621_start
    sub rx621_off, rx621_pos, 1
    substr rx621_tgt, rx621_tgt, rx621_off
  rx621_start:
    eq $I10, 1, rx621_restart
    if_null rx621_debug, debug_654
    rx621_cur."!cursor_debug"("START", "routine_declarator:sym<sub>")
  debug_654:
    $I10 = self.'from'()
    ne $I10, -1, rxscan625_done
    goto rxscan625_scan
  rxscan625_loop:
    ($P10) = rx621_cur."from"()
    inc $P10
    set rx621_pos, $P10
    ge rx621_pos, rx621_eos, rxscan625_done
  rxscan625_scan:
    set_addr $I10, rxscan625_loop
    rx621_cur."!mark_push"(0, rx621_pos, $I10)
  rxscan625_done:
.annotate 'line', 293
  # rx subcapture "sym"
    set_addr $I10, rxcap_626_fail
    rx621_cur."!mark_push"(0, rx621_pos, $I10)
  # rx literal  "sub"
    add $I11, rx621_pos, 3
    gt $I11, rx621_eos, rx621_fail
    sub $I11, rx621_pos, rx621_off
    substr $S10, rx621_tgt, $I11, 3
    ne $S10, "sub", rx621_fail
    add rx621_pos, 3
    set_addr $I10, rxcap_626_fail
    ($I12, $I11) = rx621_cur."!mark_peek"($I10)
    rx621_cur."!cursor_pos"($I11)
    ($P10) = rx621_cur."!cursor_start"()
    $P10."!cursor_pass"(rx621_pos, "")
    rx621_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_626_done
  rxcap_626_fail:
    goto rx621_fail
  rxcap_626_done:
  # rx subrule "routine_def" subtype=capture negate=
    rx621_cur."!cursor_pos"(rx621_pos)
    $P10 = rx621_cur."routine_def"()
    unless $P10, rx621_fail
    rx621_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx621_pos = $P10."pos"()
  # rx pass
    rx621_cur."!cursor_pass"(rx621_pos, "routine_declarator:sym<sub>")
    if_null rx621_debug, debug_655
    rx621_cur."!cursor_debug"("PASS", "routine_declarator:sym<sub>", " at pos=", rx621_pos)
  debug_655:
    .return (rx621_cur)
  rx621_restart:
.annotate 'line', 4
    if_null rx621_debug, debug_656
    rx621_cur."!cursor_debug"("NEXT", "routine_declarator:sym<sub>")
  debug_656:
  rx621_fail:
    (rx621_rep, rx621_pos, $I10, $P10) = rx621_cur."!mark_fail"(0)
    lt rx621_pos, -1, rx621_done
    eq rx621_pos, -1, rx621_fail
    jump $I10
  rx621_done:
    rx621_cur."!cursor_fail"()
    if_null rx621_debug, debug_657
    rx621_cur."!cursor_debug"("FAIL", "routine_declarator:sym<sub>")
  debug_657:
    .return (rx621_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("157_1284728478.15265") :method
.annotate 'line', 4
    $P623 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P624, "ResizablePMCArray"
    push $P624, $P623
    .return ($P624)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("158_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx628_tgt
    .local int rx628_pos
    .local int rx628_off
    .local int rx628_eos
    .local int rx628_rep
    .local pmc rx628_cur
    .local pmc rx628_debug
    (rx628_cur, rx628_pos, rx628_tgt, $I10) = self."!cursor_start"()
    getattribute rx628_debug, rx628_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx628_cur
    .local pmc match
    .lex "$/", match
    length rx628_eos, rx628_tgt
    gt rx628_pos, rx628_eos, rx628_done
    set rx628_off, 0
    lt rx628_pos, 2, rx628_start
    sub rx628_off, rx628_pos, 1
    substr rx628_tgt, rx628_tgt, rx628_off
  rx628_start:
    eq $I10, 1, rx628_restart
    if_null rx628_debug, debug_658
    rx628_cur."!cursor_debug"("START", "routine_declarator:sym<method>")
  debug_658:
    $I10 = self.'from'()
    ne $I10, -1, rxscan632_done
    goto rxscan632_scan
  rxscan632_loop:
    ($P10) = rx628_cur."from"()
    inc $P10
    set rx628_pos, $P10
    ge rx628_pos, rx628_eos, rxscan632_done
  rxscan632_scan:
    set_addr $I10, rxscan632_loop
    rx628_cur."!mark_push"(0, rx628_pos, $I10)
  rxscan632_done:
.annotate 'line', 294
  # rx subcapture "sym"
    set_addr $I10, rxcap_633_fail
    rx628_cur."!mark_push"(0, rx628_pos, $I10)
  # rx literal  "method"
    add $I11, rx628_pos, 6
    gt $I11, rx628_eos, rx628_fail
    sub $I11, rx628_pos, rx628_off
    substr $S10, rx628_tgt, $I11, 6
    ne $S10, "method", rx628_fail
    add rx628_pos, 6
    set_addr $I10, rxcap_633_fail
    ($I12, $I11) = rx628_cur."!mark_peek"($I10)
    rx628_cur."!cursor_pos"($I11)
    ($P10) = rx628_cur."!cursor_start"()
    $P10."!cursor_pass"(rx628_pos, "")
    rx628_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_633_done
  rxcap_633_fail:
    goto rx628_fail
  rxcap_633_done:
  # rx subrule "method_def" subtype=capture negate=
    rx628_cur."!cursor_pos"(rx628_pos)
    $P10 = rx628_cur."method_def"()
    unless $P10, rx628_fail
    rx628_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx628_pos = $P10."pos"()
  # rx pass
    rx628_cur."!cursor_pass"(rx628_pos, "routine_declarator:sym<method>")
    if_null rx628_debug, debug_659
    rx628_cur."!cursor_debug"("PASS", "routine_declarator:sym<method>", " at pos=", rx628_pos)
  debug_659:
    .return (rx628_cur)
  rx628_restart:
.annotate 'line', 4
    if_null rx628_debug, debug_660
    rx628_cur."!cursor_debug"("NEXT", "routine_declarator:sym<method>")
  debug_660:
  rx628_fail:
    (rx628_rep, rx628_pos, $I10, $P10) = rx628_cur."!mark_fail"(0)
    lt rx628_pos, -1, rx628_done
    eq rx628_pos, -1, rx628_fail
    jump $I10
  rx628_done:
    rx628_cur."!cursor_fail"()
    if_null rx628_debug, debug_661
    rx628_cur."!cursor_debug"("FAIL", "routine_declarator:sym<method>")
  debug_661:
    .return (rx628_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("159_1284728478.15265") :method
.annotate 'line', 4
    $P630 = self."!PREFIX__!subrule"("method_def", "method")
    new $P631, "ResizablePMCArray"
    push $P631, $P630
    .return ($P631)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("160_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx635_tgt
    .local int rx635_pos
    .local int rx635_off
    .local int rx635_eos
    .local int rx635_rep
    .local pmc rx635_cur
    .local pmc rx635_debug
    (rx635_cur, rx635_pos, rx635_tgt, $I10) = self."!cursor_start"()
    rx635_cur."!cursor_caparray"("deflongname", "sigil", "trait")
    getattribute rx635_debug, rx635_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx635_cur
    .local pmc match
    .lex "$/", match
    length rx635_eos, rx635_tgt
    gt rx635_pos, rx635_eos, rx635_done
    set rx635_off, 0
    lt rx635_pos, 2, rx635_start
    sub rx635_off, rx635_pos, 1
    substr rx635_tgt, rx635_tgt, rx635_off
  rx635_start:
    eq $I10, 1, rx635_restart
    if_null rx635_debug, debug_662
    rx635_cur."!cursor_debug"("START", "routine_def")
  debug_662:
    $I10 = self.'from'()
    ne $I10, -1, rxscan639_done
    goto rxscan639_scan
  rxscan639_loop:
    ($P10) = rx635_cur."from"()
    inc $P10
    set rx635_pos, $P10
    ge rx635_pos, rx635_eos, rxscan639_done
  rxscan639_scan:
    set_addr $I10, rxscan639_loop
    rx635_cur."!mark_push"(0, rx635_pos, $I10)
  rxscan639_done:
.annotate 'line', 296
  # rx subrule "ws" subtype=method negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."ws"()
    unless $P10, rx635_fail
    rx635_pos = $P10."pos"()
.annotate 'line', 297
  # rx rxquantr641 ** 0..1
    set_addr $I10, rxquantr641_done
    rx635_cur."!mark_push"(0, rx635_pos, $I10)
  rxquantr641_loop:
  # rx subrule "ws" subtype=method negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."ws"()
    unless $P10, rx635_fail
    rx635_pos = $P10."pos"()
  # rx subcapture "sigil"
    set_addr $I10, rxcap_644_fail
    rx635_cur."!mark_push"(0, rx635_pos, $I10)
  # rx rxquantr643 ** 0..1
    set_addr $I10, rxquantr643_done
    rx635_cur."!mark_push"(0, rx635_pos, $I10)
  rxquantr643_loop:
  # rx literal  "&"
    add $I11, rx635_pos, 1
    gt $I11, rx635_eos, rx635_fail
    sub $I11, rx635_pos, rx635_off
    ord $I11, rx635_tgt, $I11
    ne $I11, 38, rx635_fail
    add rx635_pos, 1
    set_addr $I10, rxquantr643_done
    (rx635_rep) = rx635_cur."!mark_commit"($I10)
  rxquantr643_done:
    set_addr $I10, rxcap_644_fail
    ($I12, $I11) = rx635_cur."!mark_peek"($I10)
    rx635_cur."!cursor_pos"($I11)
    ($P10) = rx635_cur."!cursor_start"()
    $P10."!cursor_pass"(rx635_pos, "")
    rx635_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_644_done
  rxcap_644_fail:
    goto rx635_fail
  rxcap_644_done:
  # rx subrule "deflongname" subtype=capture negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."deflongname"()
    unless $P10, rx635_fail
    rx635_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx635_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."ws"()
    unless $P10, rx635_fail
    rx635_pos = $P10."pos"()
    set_addr $I10, rxquantr641_done
    (rx635_rep) = rx635_cur."!mark_commit"($I10)
  rxquantr641_done:
  # rx subrule "ws" subtype=method negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."ws"()
    unless $P10, rx635_fail
    rx635_pos = $P10."pos"()
.annotate 'line', 298
  # rx subrule "newpad" subtype=method negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."newpad"()
    unless $P10, rx635_fail
    rx635_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."ws"()
    unless $P10, rx635_fail
    rx635_pos = $P10."pos"()
  alt648_0:
.annotate 'line', 299
    set_addr $I10, alt648_1
    rx635_cur."!mark_push"(0, rx635_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."ws"()
    unless $P10, rx635_fail
    rx635_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx635_pos, 1
    gt $I11, rx635_eos, rx635_fail
    sub $I11, rx635_pos, rx635_off
    ord $I11, rx635_tgt, $I11
    ne $I11, 40, rx635_fail
    add rx635_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."ws"()
    unless $P10, rx635_fail
    rx635_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."signature"()
    unless $P10, rx635_fail
    rx635_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx635_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."ws"()
    unless $P10, rx635_fail
    rx635_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx635_pos, 1
    gt $I11, rx635_eos, rx635_fail
    sub $I11, rx635_pos, rx635_off
    ord $I11, rx635_tgt, $I11
    ne $I11, 41, rx635_fail
    add rx635_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."ws"()
    unless $P10, rx635_fail
    rx635_pos = $P10."pos"()
    goto alt648_end
  alt648_1:
.annotate 'line', 300
  # rx subrule "ws" subtype=method negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."ws"()
    unless $P10, rx635_fail
    rx635_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx635_fail
    rx635_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."ws"()
    unless $P10, rx635_fail
    rx635_pos = $P10."pos"()
  alt648_end:
  # rx subrule "ws" subtype=method negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."ws"()
    unless $P10, rx635_fail
    rx635_pos = $P10."pos"()
.annotate 'line', 301
  # rx rxquantr656 ** 0..*
    set_addr $I10, rxquantr656_done
    rx635_cur."!mark_push"(0, rx635_pos, $I10)
  rxquantr656_loop:
  # rx subrule "trait" subtype=capture negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."trait"()
    unless $P10, rx635_fail
    goto rxsubrule657_pass
  rxsubrule657_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx635_fail
  rxsubrule657_pass:
    set_addr $I10, rxsubrule657_back
    rx635_cur."!mark_push"(0, rx635_pos, $I10, $P10)
    $P10."!cursor_names"("trait")
    rx635_pos = $P10."pos"()
    set_addr $I10, rxquantr656_done
    (rx635_rep) = rx635_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr656_done
    rx635_cur."!mark_push"(rx635_rep, rx635_pos, $I10)
    goto rxquantr656_loop
  rxquantr656_done:
  # rx subrule "ws" subtype=method negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."ws"()
    unless $P10, rx635_fail
    rx635_pos = $P10."pos"()
.annotate 'line', 302
  # rx subrule "blockoid" subtype=capture negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."blockoid"()
    unless $P10, rx635_fail
    rx635_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx635_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."ws"()
    unless $P10, rx635_fail
    rx635_pos = $P10."pos"()
.annotate 'line', 296
  # rx pass
    rx635_cur."!cursor_pass"(rx635_pos, "routine_def")
    if_null rx635_debug, debug_663
    rx635_cur."!cursor_debug"("PASS", "routine_def", " at pos=", rx635_pos)
  debug_663:
    .return (rx635_cur)
  rx635_restart:
.annotate 'line', 4
    if_null rx635_debug, debug_664
    rx635_cur."!cursor_debug"("NEXT", "routine_def")
  debug_664:
  rx635_fail:
    (rx635_rep, rx635_pos, $I10, $P10) = rx635_cur."!mark_fail"(0)
    lt rx635_pos, -1, rx635_done
    eq rx635_pos, -1, rx635_fail
    jump $I10
  rx635_done:
    rx635_cur."!cursor_fail"()
    if_null rx635_debug, debug_665
    rx635_cur."!cursor_debug"("FAIL", "routine_def")
  debug_665:
    .return (rx635_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("161_1284728478.15265") :method
.annotate 'line', 4
    $P637 = self."!PREFIX__!subrule"("ws", "")
    new $P638, "ResizablePMCArray"
    push $P638, $P637
    .return ($P638)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("162_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx661_tgt
    .local int rx661_pos
    .local int rx661_off
    .local int rx661_eos
    .local int rx661_rep
    .local pmc rx661_cur
    .local pmc rx661_debug
    (rx661_cur, rx661_pos, rx661_tgt, $I10) = self."!cursor_start"()
    rx661_cur."!cursor_caparray"("deflongname", "trait")
    getattribute rx661_debug, rx661_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx661_cur
    .local pmc match
    .lex "$/", match
    length rx661_eos, rx661_tgt
    gt rx661_pos, rx661_eos, rx661_done
    set rx661_off, 0
    lt rx661_pos, 2, rx661_start
    sub rx661_off, rx661_pos, 1
    substr rx661_tgt, rx661_tgt, rx661_off
  rx661_start:
    eq $I10, 1, rx661_restart
    if_null rx661_debug, debug_666
    rx661_cur."!cursor_debug"("START", "method_def")
  debug_666:
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
.annotate 'line', 305
  # rx subrule "ws" subtype=method negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."ws"()
    unless $P10, rx661_fail
    rx661_pos = $P10."pos"()
.annotate 'line', 306
  # rx rxquantr667 ** 0..1
    set_addr $I10, rxquantr667_done
    rx661_cur."!mark_push"(0, rx661_pos, $I10)
  rxquantr667_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."deflongname"()
    unless $P10, rx661_fail
    goto rxsubrule668_pass
  rxsubrule668_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx661_fail
  rxsubrule668_pass:
    set_addr $I10, rxsubrule668_back
    rx661_cur."!mark_push"(0, rx661_pos, $I10, $P10)
    $P10."!cursor_names"("deflongname")
    rx661_pos = $P10."pos"()
    set_addr $I10, rxquantr667_done
    (rx661_rep) = rx661_cur."!mark_commit"($I10)
  rxquantr667_done:
  # rx subrule "ws" subtype=method negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."ws"()
    unless $P10, rx661_fail
    rx661_pos = $P10."pos"()
.annotate 'line', 307
  # rx subrule "newpad" subtype=method negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."newpad"()
    unless $P10, rx661_fail
    rx661_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."ws"()
    unless $P10, rx661_fail
    rx661_pos = $P10."pos"()
  alt671_0:
.annotate 'line', 308
    set_addr $I10, alt671_1
    rx661_cur."!mark_push"(0, rx661_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."ws"()
    unless $P10, rx661_fail
    rx661_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx661_pos, 1
    gt $I11, rx661_eos, rx661_fail
    sub $I11, rx661_pos, rx661_off
    ord $I11, rx661_tgt, $I11
    ne $I11, 40, rx661_fail
    add rx661_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."ws"()
    unless $P10, rx661_fail
    rx661_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."signature"()
    unless $P10, rx661_fail
    rx661_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx661_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."ws"()
    unless $P10, rx661_fail
    rx661_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx661_pos, 1
    gt $I11, rx661_eos, rx661_fail
    sub $I11, rx661_pos, rx661_off
    ord $I11, rx661_tgt, $I11
    ne $I11, 41, rx661_fail
    add rx661_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."ws"()
    unless $P10, rx661_fail
    rx661_pos = $P10."pos"()
    goto alt671_end
  alt671_1:
.annotate 'line', 309
  # rx subrule "ws" subtype=method negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."ws"()
    unless $P10, rx661_fail
    rx661_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx661_fail
    rx661_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."ws"()
    unless $P10, rx661_fail
    rx661_pos = $P10."pos"()
  alt671_end:
  # rx subrule "ws" subtype=method negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."ws"()
    unless $P10, rx661_fail
    rx661_pos = $P10."pos"()
.annotate 'line', 310
  # rx rxquantr679 ** 0..*
    set_addr $I10, rxquantr679_done
    rx661_cur."!mark_push"(0, rx661_pos, $I10)
  rxquantr679_loop:
  # rx subrule "trait" subtype=capture negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."trait"()
    unless $P10, rx661_fail
    goto rxsubrule680_pass
  rxsubrule680_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx661_fail
  rxsubrule680_pass:
    set_addr $I10, rxsubrule680_back
    rx661_cur."!mark_push"(0, rx661_pos, $I10, $P10)
    $P10."!cursor_names"("trait")
    rx661_pos = $P10."pos"()
    set_addr $I10, rxquantr679_done
    (rx661_rep) = rx661_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr679_done
    rx661_cur."!mark_push"(rx661_rep, rx661_pos, $I10)
    goto rxquantr679_loop
  rxquantr679_done:
  # rx subrule "ws" subtype=method negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."ws"()
    unless $P10, rx661_fail
    rx661_pos = $P10."pos"()
.annotate 'line', 311
  # rx subrule "blockoid" subtype=capture negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."blockoid"()
    unless $P10, rx661_fail
    rx661_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx661_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."ws"()
    unless $P10, rx661_fail
    rx661_pos = $P10."pos"()
.annotate 'line', 305
  # rx pass
    rx661_cur."!cursor_pass"(rx661_pos, "method_def")
    if_null rx661_debug, debug_667
    rx661_cur."!cursor_debug"("PASS", "method_def", " at pos=", rx661_pos)
  debug_667:
    .return (rx661_cur)
  rx661_restart:
.annotate 'line', 4
    if_null rx661_debug, debug_668
    rx661_cur."!cursor_debug"("NEXT", "method_def")
  debug_668:
  rx661_fail:
    (rx661_rep, rx661_pos, $I10, $P10) = rx661_cur."!mark_fail"(0)
    lt rx661_pos, -1, rx661_done
    eq rx661_pos, -1, rx661_fail
    jump $I10
  rx661_done:
    rx661_cur."!cursor_fail"()
    if_null rx661_debug, debug_669
    rx661_cur."!cursor_debug"("FAIL", "method_def")
  debug_669:
    .return (rx661_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("163_1284728478.15265") :method
.annotate 'line', 4
    $P663 = self."!PREFIX__!subrule"("ws", "")
    new $P664, "ResizablePMCArray"
    push $P664, $P663
    .return ($P664)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator"  :subid("164_1284728478.15265") :method
.annotate 'line', 314
    $P684 = self."!protoregex"("multi_declarator")
    .return ($P684)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator"  :subid("165_1284728478.15265") :method
.annotate 'line', 314
    $P686 = self."!PREFIX__!protoregex"("multi_declarator")
    .return ($P686)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator:sym<multi>"  :subid("166_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 316
    new $P688, "Undef"
    .lex "$*MULTINESS", $P688
.annotate 'line', 4
    .local string rx689_tgt
    .local int rx689_pos
    .local int rx689_off
    .local int rx689_eos
    .local int rx689_rep
    .local pmc rx689_cur
    .local pmc rx689_debug
    (rx689_cur, rx689_pos, rx689_tgt, $I10) = self."!cursor_start"()
    getattribute rx689_debug, rx689_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx689_cur
    .local pmc match
    .lex "$/", match
    length rx689_eos, rx689_tgt
    gt rx689_pos, rx689_eos, rx689_done
    set rx689_off, 0
    lt rx689_pos, 2, rx689_start
    sub rx689_off, rx689_pos, 1
    substr rx689_tgt, rx689_tgt, rx689_off
  rx689_start:
    eq $I10, 1, rx689_restart
    if_null rx689_debug, debug_670
    rx689_cur."!cursor_debug"("START", "multi_declarator:sym<multi>")
  debug_670:
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
.annotate 'line', 316
    rx689_cur."!cursor_pos"(rx689_pos)
    new $P694, "String"
    assign $P694, "multi"
    store_lex "$*MULTINESS", $P694
.annotate 'line', 317
  # rx subcapture "sym"
    set_addr $I10, rxcap_695_fail
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
  # rx literal  "multi"
    add $I11, rx689_pos, 5
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 5
    ne $S10, "multi", rx689_fail
    add rx689_pos, 5
    set_addr $I10, rxcap_695_fail
    ($I12, $I11) = rx689_cur."!mark_peek"($I10)
    rx689_cur."!cursor_pos"($I11)
    ($P10) = rx689_cur."!cursor_start"()
    $P10."!cursor_pass"(rx689_pos, "")
    rx689_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_695_done
  rxcap_695_fail:
    goto rx689_fail
  rxcap_695_done:
.annotate 'line', 318
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  alt696_0:
    set_addr $I10, alt696_1
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
  # rx subrule "declarator" subtype=capture negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."declarator"()
    unless $P10, rx689_fail
    rx689_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx689_pos = $P10."pos"()
    goto alt696_end
  alt696_1:
    set_addr $I10, alt696_2
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
  # rx subrule "routine_def" subtype=capture negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."routine_def"()
    unless $P10, rx689_fail
    rx689_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx689_pos = $P10."pos"()
    goto alt696_end
  alt696_2:
  # rx subrule "panic" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."panic"("Malformed multi")
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  alt696_end:
.annotate 'line', 315
  # rx pass
    rx689_cur."!cursor_pass"(rx689_pos, "multi_declarator:sym<multi>")
    if_null rx689_debug, debug_671
    rx689_cur."!cursor_debug"("PASS", "multi_declarator:sym<multi>", " at pos=", rx689_pos)
  debug_671:
    .return (rx689_cur)
  rx689_restart:
.annotate 'line', 4
    if_null rx689_debug, debug_672
    rx689_cur."!cursor_debug"("NEXT", "multi_declarator:sym<multi>")
  debug_672:
  rx689_fail:
    (rx689_rep, rx689_pos, $I10, $P10) = rx689_cur."!mark_fail"(0)
    lt rx689_pos, -1, rx689_done
    eq rx689_pos, -1, rx689_fail
    jump $I10
  rx689_done:
    rx689_cur."!cursor_fail"()
    if_null rx689_debug, debug_673
    rx689_cur."!cursor_debug"("FAIL", "multi_declarator:sym<multi>")
  debug_673:
    .return (rx689_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator:sym<multi>"  :subid("167_1284728478.15265") :method
.annotate 'line', 4
    $P691 = self."!PREFIX__!subrule"("ws", "multi")
    new $P692, "ResizablePMCArray"
    push $P692, $P691
    .return ($P692)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator:sym<null>"  :subid("168_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 321
    new $P698, "Undef"
    .lex "$*MULTINESS", $P698
.annotate 'line', 4
    .local string rx699_tgt
    .local int rx699_pos
    .local int rx699_off
    .local int rx699_eos
    .local int rx699_rep
    .local pmc rx699_cur
    .local pmc rx699_debug
    (rx699_cur, rx699_pos, rx699_tgt, $I10) = self."!cursor_start"()
    getattribute rx699_debug, rx699_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx699_cur
    .local pmc match
    .lex "$/", match
    length rx699_eos, rx699_tgt
    gt rx699_pos, rx699_eos, rx699_done
    set rx699_off, 0
    lt rx699_pos, 2, rx699_start
    sub rx699_off, rx699_pos, 1
    substr rx699_tgt, rx699_tgt, rx699_off
  rx699_start:
    eq $I10, 1, rx699_restart
    if_null rx699_debug, debug_674
    rx699_cur."!cursor_debug"("START", "multi_declarator:sym<null>")
  debug_674:
    $I10 = self.'from'()
    ne $I10, -1, rxscan703_done
    goto rxscan703_scan
  rxscan703_loop:
    ($P10) = rx699_cur."from"()
    inc $P10
    set rx699_pos, $P10
    ge rx699_pos, rx699_eos, rxscan703_done
  rxscan703_scan:
    set_addr $I10, rxscan703_loop
    rx699_cur."!mark_push"(0, rx699_pos, $I10)
  rxscan703_done:
.annotate 'line', 321
    rx699_cur."!cursor_pos"(rx699_pos)
    new $P704, "String"
    assign $P704, ""
    store_lex "$*MULTINESS", $P704
.annotate 'line', 322
  # rx subrule "declarator" subtype=capture negate=
    rx699_cur."!cursor_pos"(rx699_pos)
    $P10 = rx699_cur."declarator"()
    unless $P10, rx699_fail
    rx699_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx699_pos = $P10."pos"()
.annotate 'line', 320
  # rx pass
    rx699_cur."!cursor_pass"(rx699_pos, "multi_declarator:sym<null>")
    if_null rx699_debug, debug_675
    rx699_cur."!cursor_debug"("PASS", "multi_declarator:sym<null>", " at pos=", rx699_pos)
  debug_675:
    .return (rx699_cur)
  rx699_restart:
.annotate 'line', 4
    if_null rx699_debug, debug_676
    rx699_cur."!cursor_debug"("NEXT", "multi_declarator:sym<null>")
  debug_676:
  rx699_fail:
    (rx699_rep, rx699_pos, $I10, $P10) = rx699_cur."!mark_fail"(0)
    lt rx699_pos, -1, rx699_done
    eq rx699_pos, -1, rx699_fail
    jump $I10
  rx699_done:
    rx699_cur."!cursor_fail"()
    if_null rx699_debug, debug_677
    rx699_cur."!cursor_debug"("FAIL", "multi_declarator:sym<null>")
  debug_677:
    .return (rx699_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator:sym<null>"  :subid("169_1284728478.15265") :method
.annotate 'line', 4
    $P701 = self."!PREFIX__!subrule"("declarator", "")
    new $P702, "ResizablePMCArray"
    push $P702, $P701
    .return ($P702)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("170_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx706_tgt
    .local int rx706_pos
    .local int rx706_off
    .local int rx706_eos
    .local int rx706_rep
    .local pmc rx706_cur
    .local pmc rx706_debug
    (rx706_cur, rx706_pos, rx706_tgt, $I10) = self."!cursor_start"()
    rx706_cur."!cursor_caparray"("parameter")
    getattribute rx706_debug, rx706_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx706_cur
    .local pmc match
    .lex "$/", match
    length rx706_eos, rx706_tgt
    gt rx706_pos, rx706_eos, rx706_done
    set rx706_off, 0
    lt rx706_pos, 2, rx706_start
    sub rx706_off, rx706_pos, 1
    substr rx706_tgt, rx706_tgt, rx706_off
  rx706_start:
    eq $I10, 1, rx706_restart
    if_null rx706_debug, debug_678
    rx706_cur."!cursor_debug"("START", "signature")
  debug_678:
    $I10 = self.'from'()
    ne $I10, -1, rxscan709_done
    goto rxscan709_scan
  rxscan709_loop:
    ($P10) = rx706_cur."from"()
    inc $P10
    set rx706_pos, $P10
    ge rx706_pos, rx706_eos, rxscan709_done
  rxscan709_scan:
    set_addr $I10, rxscan709_loop
    rx706_cur."!mark_push"(0, rx706_pos, $I10)
  rxscan709_done:
.annotate 'line', 325
  # rx rxquantr710 ** 0..1
    set_addr $I10, rxquantr710_done
    rx706_cur."!mark_push"(0, rx706_pos, $I10)
  rxquantr710_loop:
  # rx rxquantr711 ** 1..*
    set_addr $I10, rxquantr711_done
    rx706_cur."!mark_push"(0, -1, $I10)
  rxquantr711_loop:
  # rx subrule "ws" subtype=method negate=
    rx706_cur."!cursor_pos"(rx706_pos)
    $P10 = rx706_cur."ws"()
    unless $P10, rx706_fail
    rx706_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx706_cur."!cursor_pos"(rx706_pos)
    $P10 = rx706_cur."parameter"()
    unless $P10, rx706_fail
    rx706_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx706_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx706_cur."!cursor_pos"(rx706_pos)
    $P10 = rx706_cur."ws"()
    unless $P10, rx706_fail
    rx706_pos = $P10."pos"()
    set_addr $I10, rxquantr711_done
    (rx706_rep) = rx706_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr711_done
    rx706_cur."!mark_push"(rx706_rep, rx706_pos, $I10)
  # rx literal  ","
    add $I11, rx706_pos, 1
    gt $I11, rx706_eos, rx706_fail
    sub $I11, rx706_pos, rx706_off
    ord $I11, rx706_tgt, $I11
    ne $I11, 44, rx706_fail
    add rx706_pos, 1
    goto rxquantr711_loop
  rxquantr711_done:
    set_addr $I10, rxquantr710_done
    (rx706_rep) = rx706_cur."!mark_commit"($I10)
  rxquantr710_done:
  # rx pass
    rx706_cur."!cursor_pass"(rx706_pos, "signature")
    if_null rx706_debug, debug_679
    rx706_cur."!cursor_debug"("PASS", "signature", " at pos=", rx706_pos)
  debug_679:
    .return (rx706_cur)
  rx706_restart:
.annotate 'line', 4
    if_null rx706_debug, debug_680
    rx706_cur."!cursor_debug"("NEXT", "signature")
  debug_680:
  rx706_fail:
    (rx706_rep, rx706_pos, $I10, $P10) = rx706_cur."!mark_fail"(0)
    lt rx706_pos, -1, rx706_done
    eq rx706_pos, -1, rx706_fail
    jump $I10
  rx706_done:
    rx706_cur."!cursor_fail"()
    if_null rx706_debug, debug_681
    rx706_cur."!cursor_debug"("FAIL", "signature")
  debug_681:
    .return (rx706_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("171_1284728478.15265") :method
.annotate 'line', 4
    new $P708, "ResizablePMCArray"
    push $P708, ""
    .return ($P708)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("172_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx713_tgt
    .local int rx713_pos
    .local int rx713_off
    .local int rx713_eos
    .local int rx713_rep
    .local pmc rx713_cur
    .local pmc rx713_debug
    (rx713_cur, rx713_pos, rx713_tgt, $I10) = self."!cursor_start"()
    rx713_cur."!cursor_caparray"("default_value", "typename")
    getattribute rx713_debug, rx713_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx713_cur
    .local pmc match
    .lex "$/", match
    length rx713_eos, rx713_tgt
    gt rx713_pos, rx713_eos, rx713_done
    set rx713_off, 0
    lt rx713_pos, 2, rx713_start
    sub rx713_off, rx713_pos, 1
    substr rx713_tgt, rx713_tgt, rx713_off
  rx713_start:
    eq $I10, 1, rx713_restart
    if_null rx713_debug, debug_682
    rx713_cur."!cursor_debug"("START", "parameter")
  debug_682:
    $I10 = self.'from'()
    ne $I10, -1, rxscan716_done
    goto rxscan716_scan
  rxscan716_loop:
    ($P10) = rx713_cur."from"()
    inc $P10
    set rx713_pos, $P10
    ge rx713_pos, rx713_eos, rxscan716_done
  rxscan716_scan:
    set_addr $I10, rxscan716_loop
    rx713_cur."!mark_push"(0, rx713_pos, $I10)
  rxscan716_done:
.annotate 'line', 328
  # rx rxquantr717 ** 0..*
    set_addr $I10, rxquantr717_done
    rx713_cur."!mark_push"(0, rx713_pos, $I10)
  rxquantr717_loop:
  # rx subrule "typename" subtype=capture negate=
    rx713_cur."!cursor_pos"(rx713_pos)
    $P10 = rx713_cur."typename"()
    unless $P10, rx713_fail
    rx713_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("typename")
    rx713_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx713_cur."!cursor_pos"(rx713_pos)
    $P10 = rx713_cur."ws"()
    unless $P10, rx713_fail
    rx713_pos = $P10."pos"()
    set_addr $I10, rxquantr717_done
    (rx713_rep) = rx713_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr717_done
    rx713_cur."!mark_push"(rx713_rep, rx713_pos, $I10)
    goto rxquantr717_loop
  rxquantr717_done:
  alt718_0:
.annotate 'line', 329
    set_addr $I10, alt718_1
    rx713_cur."!mark_push"(0, rx713_pos, $I10)
.annotate 'line', 330
  # rx subcapture "quant"
    set_addr $I10, rxcap_719_fail
    rx713_cur."!mark_push"(0, rx713_pos, $I10)
  # rx literal  "*"
    add $I11, rx713_pos, 1
    gt $I11, rx713_eos, rx713_fail
    sub $I11, rx713_pos, rx713_off
    ord $I11, rx713_tgt, $I11
    ne $I11, 42, rx713_fail
    add rx713_pos, 1
    set_addr $I10, rxcap_719_fail
    ($I12, $I11) = rx713_cur."!mark_peek"($I10)
    rx713_cur."!cursor_pos"($I11)
    ($P10) = rx713_cur."!cursor_start"()
    $P10."!cursor_pass"(rx713_pos, "")
    rx713_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_719_done
  rxcap_719_fail:
    goto rx713_fail
  rxcap_719_done:
  # rx subrule "param_var" subtype=capture negate=
    rx713_cur."!cursor_pos"(rx713_pos)
    $P10 = rx713_cur."param_var"()
    unless $P10, rx713_fail
    rx713_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx713_pos = $P10."pos"()
    goto alt718_end
  alt718_1:
  alt720_0:
.annotate 'line', 331
    set_addr $I10, alt720_1
    rx713_cur."!mark_push"(0, rx713_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx713_cur."!cursor_pos"(rx713_pos)
    $P10 = rx713_cur."param_var"()
    unless $P10, rx713_fail
    rx713_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx713_pos = $P10."pos"()
    goto alt720_end
  alt720_1:
  # rx subrule "named_param" subtype=capture negate=
    rx713_cur."!cursor_pos"(rx713_pos)
    $P10 = rx713_cur."named_param"()
    unless $P10, rx713_fail
    rx713_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx713_pos = $P10."pos"()
  alt720_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_722_fail
    rx713_cur."!mark_push"(0, rx713_pos, $I10)
  alt721_0:
    set_addr $I10, alt721_1
    rx713_cur."!mark_push"(0, rx713_pos, $I10)
  # rx literal  "?"
    add $I11, rx713_pos, 1
    gt $I11, rx713_eos, rx713_fail
    sub $I11, rx713_pos, rx713_off
    ord $I11, rx713_tgt, $I11
    ne $I11, 63, rx713_fail
    add rx713_pos, 1
    goto alt721_end
  alt721_1:
    set_addr $I10, alt721_2
    rx713_cur."!mark_push"(0, rx713_pos, $I10)
  # rx literal  "!"
    add $I11, rx713_pos, 1
    gt $I11, rx713_eos, rx713_fail
    sub $I11, rx713_pos, rx713_off
    ord $I11, rx713_tgt, $I11
    ne $I11, 33, rx713_fail
    add rx713_pos, 1
    goto alt721_end
  alt721_2:
  alt721_end:
    set_addr $I10, rxcap_722_fail
    ($I12, $I11) = rx713_cur."!mark_peek"($I10)
    rx713_cur."!cursor_pos"($I11)
    ($P10) = rx713_cur."!cursor_start"()
    $P10."!cursor_pass"(rx713_pos, "")
    rx713_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_722_done
  rxcap_722_fail:
    goto rx713_fail
  rxcap_722_done:
  alt718_end:
.annotate 'line', 333
  # rx rxquantr723 ** 0..1
    set_addr $I10, rxquantr723_done
    rx713_cur."!mark_push"(0, rx713_pos, $I10)
  rxquantr723_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx713_cur."!cursor_pos"(rx713_pos)
    $P10 = rx713_cur."default_value"()
    unless $P10, rx713_fail
    goto rxsubrule724_pass
  rxsubrule724_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx713_fail
  rxsubrule724_pass:
    set_addr $I10, rxsubrule724_back
    rx713_cur."!mark_push"(0, rx713_pos, $I10, $P10)
    $P10."!cursor_names"("default_value")
    rx713_pos = $P10."pos"()
    set_addr $I10, rxquantr723_done
    (rx713_rep) = rx713_cur."!mark_commit"($I10)
  rxquantr723_done:
.annotate 'line', 327
  # rx pass
    rx713_cur."!cursor_pass"(rx713_pos, "parameter")
    if_null rx713_debug, debug_683
    rx713_cur."!cursor_debug"("PASS", "parameter", " at pos=", rx713_pos)
  debug_683:
    .return (rx713_cur)
  rx713_restart:
.annotate 'line', 4
    if_null rx713_debug, debug_684
    rx713_cur."!cursor_debug"("NEXT", "parameter")
  debug_684:
  rx713_fail:
    (rx713_rep, rx713_pos, $I10, $P10) = rx713_cur."!mark_fail"(0)
    lt rx713_pos, -1, rx713_done
    eq rx713_pos, -1, rx713_fail
    jump $I10
  rx713_done:
    rx713_cur."!cursor_fail"()
    if_null rx713_debug, debug_685
    rx713_cur."!cursor_debug"("FAIL", "parameter")
  debug_685:
    .return (rx713_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("173_1284728478.15265") :method
.annotate 'line', 4
    new $P715, "ResizablePMCArray"
    push $P715, ""
    .return ($P715)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("174_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx726_tgt
    .local int rx726_pos
    .local int rx726_off
    .local int rx726_eos
    .local int rx726_rep
    .local pmc rx726_cur
    .local pmc rx726_debug
    (rx726_cur, rx726_pos, rx726_tgt, $I10) = self."!cursor_start"()
    rx726_cur."!cursor_caparray"("twigil")
    getattribute rx726_debug, rx726_cur, "$!debug"
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
    eq $I10, 1, rx726_restart
    if_null rx726_debug, debug_686
    rx726_cur."!cursor_debug"("START", "param_var")
  debug_686:
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
.annotate 'line', 337
  # rx subrule "sigil" subtype=capture negate=
    rx726_cur."!cursor_pos"(rx726_pos)
    $P10 = rx726_cur."sigil"()
    unless $P10, rx726_fail
    rx726_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx726_pos = $P10."pos"()
  # rx rxquantr731 ** 0..1
    set_addr $I10, rxquantr731_done
    rx726_cur."!mark_push"(0, rx726_pos, $I10)
  rxquantr731_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx726_cur."!cursor_pos"(rx726_pos)
    $P10 = rx726_cur."twigil"()
    unless $P10, rx726_fail
    goto rxsubrule732_pass
  rxsubrule732_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx726_fail
  rxsubrule732_pass:
    set_addr $I10, rxsubrule732_back
    rx726_cur."!mark_push"(0, rx726_pos, $I10, $P10)
    $P10."!cursor_names"("twigil")
    rx726_pos = $P10."pos"()
    set_addr $I10, rxquantr731_done
    (rx726_rep) = rx726_cur."!mark_commit"($I10)
  rxquantr731_done:
  alt733_0:
.annotate 'line', 338
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
.annotate 'line', 336
  # rx pass
    rx726_cur."!cursor_pass"(rx726_pos, "param_var")
    if_null rx726_debug, debug_687
    rx726_cur."!cursor_debug"("PASS", "param_var", " at pos=", rx726_pos)
  debug_687:
    .return (rx726_cur)
  rx726_restart:
.annotate 'line', 4
    if_null rx726_debug, debug_688
    rx726_cur."!cursor_debug"("NEXT", "param_var")
  debug_688:
  rx726_fail:
    (rx726_rep, rx726_pos, $I10, $P10) = rx726_cur."!mark_fail"(0)
    lt rx726_pos, -1, rx726_done
    eq rx726_pos, -1, rx726_fail
    jump $I10
  rx726_done:
    rx726_cur."!cursor_fail"()
    if_null rx726_debug, debug_689
    rx726_cur."!cursor_debug"("FAIL", "param_var")
  debug_689:
    .return (rx726_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("175_1284728478.15265") :method
.annotate 'line', 4
    $P728 = self."!PREFIX__!subrule"("sigil", "")
    new $P729, "ResizablePMCArray"
    push $P729, $P728
    .return ($P729)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("176_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx736_tgt
    .local int rx736_pos
    .local int rx736_off
    .local int rx736_eos
    .local int rx736_rep
    .local pmc rx736_cur
    .local pmc rx736_debug
    (rx736_cur, rx736_pos, rx736_tgt, $I10) = self."!cursor_start"()
    getattribute rx736_debug, rx736_cur, "$!debug"
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
    eq $I10, 1, rx736_restart
    if_null rx736_debug, debug_690
    rx736_cur."!cursor_debug"("START", "named_param")
  debug_690:
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
.annotate 'line', 342
  # rx literal  ":"
    add $I11, rx736_pos, 1
    gt $I11, rx736_eos, rx736_fail
    sub $I11, rx736_pos, rx736_off
    ord $I11, rx736_tgt, $I11
    ne $I11, 58, rx736_fail
    add rx736_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx736_cur."!cursor_pos"(rx736_pos)
    $P10 = rx736_cur."param_var"()
    unless $P10, rx736_fail
    rx736_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx736_pos = $P10."pos"()
.annotate 'line', 341
  # rx pass
    rx736_cur."!cursor_pass"(rx736_pos, "named_param")
    if_null rx736_debug, debug_691
    rx736_cur."!cursor_debug"("PASS", "named_param", " at pos=", rx736_pos)
  debug_691:
    .return (rx736_cur)
  rx736_restart:
.annotate 'line', 4
    if_null rx736_debug, debug_692
    rx736_cur."!cursor_debug"("NEXT", "named_param")
  debug_692:
  rx736_fail:
    (rx736_rep, rx736_pos, $I10, $P10) = rx736_cur."!mark_fail"(0)
    lt rx736_pos, -1, rx736_done
    eq rx736_pos, -1, rx736_fail
    jump $I10
  rx736_done:
    rx736_cur."!cursor_fail"()
    if_null rx736_debug, debug_693
    rx736_cur."!cursor_debug"("FAIL", "named_param")
  debug_693:
    .return (rx736_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("177_1284728478.15265") :method
.annotate 'line', 4
    $P738 = self."!PREFIX__!subrule"("param_var", ":")
    new $P739, "ResizablePMCArray"
    push $P739, $P738
    .return ($P739)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("178_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx742_tgt
    .local int rx742_pos
    .local int rx742_off
    .local int rx742_eos
    .local int rx742_rep
    .local pmc rx742_cur
    .local pmc rx742_debug
    (rx742_cur, rx742_pos, rx742_tgt, $I10) = self."!cursor_start"()
    getattribute rx742_debug, rx742_cur, "$!debug"
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
    eq $I10, 1, rx742_restart
    if_null rx742_debug, debug_694
    rx742_cur."!cursor_debug"("START", "default_value")
  debug_694:
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
.annotate 'line', 345
  # rx subrule "ws" subtype=method negate=
    rx742_cur."!cursor_pos"(rx742_pos)
    $P10 = rx742_cur."ws"()
    unless $P10, rx742_fail
    rx742_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx742_pos, 1
    gt $I11, rx742_eos, rx742_fail
    sub $I11, rx742_pos, rx742_off
    ord $I11, rx742_tgt, $I11
    ne $I11, 61, rx742_fail
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
    if_null rx742_debug, debug_695
    rx742_cur."!cursor_debug"("PASS", "default_value", " at pos=", rx742_pos)
  debug_695:
    .return (rx742_cur)
  rx742_restart:
.annotate 'line', 4
    if_null rx742_debug, debug_696
    rx742_cur."!cursor_debug"("NEXT", "default_value")
  debug_696:
  rx742_fail:
    (rx742_rep, rx742_pos, $I10, $P10) = rx742_cur."!mark_fail"(0)
    lt rx742_pos, -1, rx742_done
    eq rx742_pos, -1, rx742_fail
    jump $I10
  rx742_done:
    rx742_cur."!cursor_fail"()
    if_null rx742_debug, debug_697
    rx742_cur."!cursor_debug"("FAIL", "default_value")
  debug_697:
    .return (rx742_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("179_1284728478.15265") :method
.annotate 'line', 4
    $P744 = self."!PREFIX__!subrule"("ws", "")
    new $P745, "ResizablePMCArray"
    push $P745, $P744
    .return ($P745)
.end


.namespace ["NQP";"Grammar"]
.sub "trait"  :subid("180_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx751_tgt
    .local int rx751_pos
    .local int rx751_off
    .local int rx751_eos
    .local int rx751_rep
    .local pmc rx751_cur
    .local pmc rx751_debug
    (rx751_cur, rx751_pos, rx751_tgt, $I10) = self."!cursor_start"()
    getattribute rx751_debug, rx751_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx751_cur
    .local pmc match
    .lex "$/", match
    length rx751_eos, rx751_tgt
    gt rx751_pos, rx751_eos, rx751_done
    set rx751_off, 0
    lt rx751_pos, 2, rx751_start
    sub rx751_off, rx751_pos, 1
    substr rx751_tgt, rx751_tgt, rx751_off
  rx751_start:
    eq $I10, 1, rx751_restart
    if_null rx751_debug, debug_698
    rx751_cur."!cursor_debug"("START", "trait")
  debug_698:
    $I10 = self.'from'()
    ne $I10, -1, rxscan755_done
    goto rxscan755_scan
  rxscan755_loop:
    ($P10) = rx751_cur."from"()
    inc $P10
    set rx751_pos, $P10
    ge rx751_pos, rx751_eos, rxscan755_done
  rxscan755_scan:
    set_addr $I10, rxscan755_loop
    rx751_cur."!mark_push"(0, rx751_pos, $I10)
  rxscan755_done:
.annotate 'line', 347
  # rx subrule "ws" subtype=method negate=
    rx751_cur."!cursor_pos"(rx751_pos)
    $P10 = rx751_cur."ws"()
    unless $P10, rx751_fail
    rx751_pos = $P10."pos"()
  # rx subrule "trait_mod" subtype=capture negate=
    rx751_cur."!cursor_pos"(rx751_pos)
    $P10 = rx751_cur."trait_mod"()
    unless $P10, rx751_fail
    rx751_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("trait_mod")
    rx751_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx751_cur."!cursor_pos"(rx751_pos)
    $P10 = rx751_cur."ws"()
    unless $P10, rx751_fail
    rx751_pos = $P10."pos"()
  # rx pass
    rx751_cur."!cursor_pass"(rx751_pos, "trait")
    if_null rx751_debug, debug_699
    rx751_cur."!cursor_debug"("PASS", "trait", " at pos=", rx751_pos)
  debug_699:
    .return (rx751_cur)
  rx751_restart:
.annotate 'line', 4
    if_null rx751_debug, debug_700
    rx751_cur."!cursor_debug"("NEXT", "trait")
  debug_700:
  rx751_fail:
    (rx751_rep, rx751_pos, $I10, $P10) = rx751_cur."!mark_fail"(0)
    lt rx751_pos, -1, rx751_done
    eq rx751_pos, -1, rx751_fail
    jump $I10
  rx751_done:
    rx751_cur."!cursor_fail"()
    if_null rx751_debug, debug_701
    rx751_cur."!cursor_debug"("FAIL", "trait")
  debug_701:
    .return (rx751_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__trait"  :subid("181_1284728478.15265") :method
.annotate 'line', 4
    $P753 = self."!PREFIX__!subrule"("ws", "")
    new $P754, "ResizablePMCArray"
    push $P754, $P753
    .return ($P754)
.end


.namespace ["NQP";"Grammar"]
.sub "trait_mod"  :subid("182_1284728478.15265") :method
.annotate 'line', 349
    $P759 = self."!protoregex"("trait_mod")
    .return ($P759)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__trait_mod"  :subid("183_1284728478.15265") :method
.annotate 'line', 349
    $P761 = self."!PREFIX__!protoregex"("trait_mod")
    .return ($P761)
.end


.namespace ["NQP";"Grammar"]
.sub "trait_mod:sym<is>"  :subid("184_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx763_tgt
    .local int rx763_pos
    .local int rx763_off
    .local int rx763_eos
    .local int rx763_rep
    .local pmc rx763_cur
    .local pmc rx763_debug
    (rx763_cur, rx763_pos, rx763_tgt, $I10) = self."!cursor_start"()
    rx763_cur."!cursor_caparray"("circumfix")
    getattribute rx763_debug, rx763_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx763_cur
    .local pmc match
    .lex "$/", match
    length rx763_eos, rx763_tgt
    gt rx763_pos, rx763_eos, rx763_done
    set rx763_off, 0
    lt rx763_pos, 2, rx763_start
    sub rx763_off, rx763_pos, 1
    substr rx763_tgt, rx763_tgt, rx763_off
  rx763_start:
    eq $I10, 1, rx763_restart
    if_null rx763_debug, debug_702
    rx763_cur."!cursor_debug"("START", "trait_mod:sym<is>")
  debug_702:
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
.annotate 'line', 350
  # rx subcapture "sym"
    set_addr $I10, rxcap_768_fail
    rx763_cur."!mark_push"(0, rx763_pos, $I10)
  # rx literal  "is"
    add $I11, rx763_pos, 2
    gt $I11, rx763_eos, rx763_fail
    sub $I11, rx763_pos, rx763_off
    substr $S10, rx763_tgt, $I11, 2
    ne $S10, "is", rx763_fail
    add rx763_pos, 2
    set_addr $I10, rxcap_768_fail
    ($I12, $I11) = rx763_cur."!mark_peek"($I10)
    rx763_cur."!cursor_pos"($I11)
    ($P10) = rx763_cur."!cursor_start"()
    $P10."!cursor_pass"(rx763_pos, "")
    rx763_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_768_done
  rxcap_768_fail:
    goto rx763_fail
  rxcap_768_done:
  # rx subrule "ws" subtype=method negate=
    rx763_cur."!cursor_pos"(rx763_pos)
    $P10 = rx763_cur."ws"()
    unless $P10, rx763_fail
    rx763_pos = $P10."pos"()
  # rx subrule "deflongname" subtype=capture negate=
    rx763_cur."!cursor_pos"(rx763_pos)
    $P10 = rx763_cur."deflongname"()
    unless $P10, rx763_fail
    rx763_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    rx763_pos = $P10."pos"()
  # rx rxquantr770 ** 0..1
    set_addr $I10, rxquantr770_done
    rx763_cur."!mark_push"(0, rx763_pos, $I10)
  rxquantr770_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx763_cur."!cursor_pos"(rx763_pos)
    $P10 = rx763_cur."circumfix"()
    unless $P10, rx763_fail
    goto rxsubrule771_pass
  rxsubrule771_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx763_fail
  rxsubrule771_pass:
    set_addr $I10, rxsubrule771_back
    rx763_cur."!mark_push"(0, rx763_pos, $I10, $P10)
    $P10."!cursor_names"("circumfix")
    rx763_pos = $P10."pos"()
    set_addr $I10, rxquantr770_done
    (rx763_rep) = rx763_cur."!mark_commit"($I10)
  rxquantr770_done:
  # rx subrule "ws" subtype=method negate=
    rx763_cur."!cursor_pos"(rx763_pos)
    $P10 = rx763_cur."ws"()
    unless $P10, rx763_fail
    rx763_pos = $P10."pos"()
  # rx pass
    rx763_cur."!cursor_pass"(rx763_pos, "trait_mod:sym<is>")
    if_null rx763_debug, debug_703
    rx763_cur."!cursor_debug"("PASS", "trait_mod:sym<is>", " at pos=", rx763_pos)
  debug_703:
    .return (rx763_cur)
  rx763_restart:
.annotate 'line', 4
    if_null rx763_debug, debug_704
    rx763_cur."!cursor_debug"("NEXT", "trait_mod:sym<is>")
  debug_704:
  rx763_fail:
    (rx763_rep, rx763_pos, $I10, $P10) = rx763_cur."!mark_fail"(0)
    lt rx763_pos, -1, rx763_done
    eq rx763_pos, -1, rx763_fail
    jump $I10
  rx763_done:
    rx763_cur."!cursor_fail"()
    if_null rx763_debug, debug_705
    rx763_cur."!cursor_debug"("FAIL", "trait_mod:sym<is>")
  debug_705:
    .return (rx763_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__trait_mod:sym<is>"  :subid("185_1284728478.15265") :method
.annotate 'line', 4
    $P765 = self."!PREFIX__!subrule"("ws", "is")
    new $P766, "ResizablePMCArray"
    push $P766, $P765
    .return ($P766)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("186_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx774_tgt
    .local int rx774_pos
    .local int rx774_off
    .local int rx774_eos
    .local int rx774_rep
    .local pmc rx774_cur
    .local pmc rx774_debug
    (rx774_cur, rx774_pos, rx774_tgt, $I10) = self."!cursor_start"()
    rx774_cur."!cursor_caparray"("signature")
    getattribute rx774_debug, rx774_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx774_cur
    .local pmc match
    .lex "$/", match
    length rx774_eos, rx774_tgt
    gt rx774_pos, rx774_eos, rx774_done
    set rx774_off, 0
    lt rx774_pos, 2, rx774_start
    sub rx774_off, rx774_pos, 1
    substr rx774_tgt, rx774_tgt, rx774_off
  rx774_start:
    eq $I10, 1, rx774_restart
    if_null rx774_debug, debug_706
    rx774_cur."!cursor_debug"("START", "regex_declarator")
  debug_706:
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
.annotate 'line', 352
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
  alt780_0:
.annotate 'line', 353
    set_addr $I10, alt780_1
    rx774_cur."!mark_push"(0, rx774_pos, $I10)
.annotate 'line', 354
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_782_fail
    rx774_cur."!mark_push"(0, rx774_pos, $I10)
  # rx literal  "proto"
    add $I11, rx774_pos, 5
    gt $I11, rx774_eos, rx774_fail
    sub $I11, rx774_pos, rx774_off
    substr $S10, rx774_tgt, $I11, 5
    ne $S10, "proto", rx774_fail
    add rx774_pos, 5
    set_addr $I10, rxcap_782_fail
    ($I12, $I11) = rx774_cur."!mark_peek"($I10)
    rx774_cur."!cursor_pos"($I11)
    ($P10) = rx774_cur."!cursor_start"()
    $P10."!cursor_pass"(rx774_pos, "")
    rx774_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_782_done
  rxcap_782_fail:
    goto rx774_fail
  rxcap_782_done:
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
  alt784_0:
    set_addr $I10, alt784_1
    rx774_cur."!mark_push"(0, rx774_pos, $I10)
  # rx literal  "regex"
    add $I11, rx774_pos, 5
    gt $I11, rx774_eos, rx774_fail
    sub $I11, rx774_pos, rx774_off
    substr $S10, rx774_tgt, $I11, 5
    ne $S10, "regex", rx774_fail
    add rx774_pos, 5
    goto alt784_end
  alt784_1:
    set_addr $I10, alt784_2
    rx774_cur."!mark_push"(0, rx774_pos, $I10)
  # rx literal  "token"
    add $I11, rx774_pos, 5
    gt $I11, rx774_eos, rx774_fail
    sub $I11, rx774_pos, rx774_off
    substr $S10, rx774_tgt, $I11, 5
    ne $S10, "token", rx774_fail
    add rx774_pos, 5
    goto alt784_end
  alt784_2:
  # rx literal  "rule"
    add $I11, rx774_pos, 4
    gt $I11, rx774_eos, rx774_fail
    sub $I11, rx774_pos, rx774_off
    substr $S10, rx774_tgt, $I11, 4
    ne $S10, "rule", rx774_fail
    add rx774_pos, 4
  alt784_end:
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
.annotate 'line', 355
  # rx subrule "deflongname" subtype=capture negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."deflongname"()
    unless $P10, rx774_fail
    rx774_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx774_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
  alt787_0:
.annotate 'line', 356
    set_addr $I10, alt787_1
    rx774_cur."!mark_push"(0, rx774_pos, $I10)
.annotate 'line', 357
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
  # rx literal  "{"
    add $I11, rx774_pos, 1
    gt $I11, rx774_eos, rx774_fail
    sub $I11, rx774_pos, rx774_off
    ord $I11, rx774_tgt, $I11
    ne $I11, 123, rx774_fail
    add rx774_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx774_pos, 5
    gt $I11, rx774_eos, rx774_fail
    sub $I11, rx774_pos, rx774_off
    substr $S10, rx774_tgt, $I11, 5
    ne $S10, "<...>", rx774_fail
    add rx774_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx774_pos, 1
    gt $I11, rx774_eos, rx774_fail
    sub $I11, rx774_pos, rx774_off
    ord $I11, rx774_tgt, $I11
    ne $I11, 125, rx774_fail
    add rx774_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ENDSTMT"()
    unless $P10, rx774_fail
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
    goto alt787_end
  alt787_1:
.annotate 'line', 358
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."panic"("Proto regex body must be <...>")
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
  alt787_end:
.annotate 'line', 359
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
.annotate 'line', 354
    goto alt780_end
  alt780_1:
.annotate 'line', 360
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_797_fail
    rx774_cur."!mark_push"(0, rx774_pos, $I10)
  alt796_0:
    set_addr $I10, alt796_1
    rx774_cur."!mark_push"(0, rx774_pos, $I10)
  # rx literal  "regex"
    add $I11, rx774_pos, 5
    gt $I11, rx774_eos, rx774_fail
    sub $I11, rx774_pos, rx774_off
    substr $S10, rx774_tgt, $I11, 5
    ne $S10, "regex", rx774_fail
    add rx774_pos, 5
    goto alt796_end
  alt796_1:
    set_addr $I10, alt796_2
    rx774_cur."!mark_push"(0, rx774_pos, $I10)
  # rx literal  "token"
    add $I11, rx774_pos, 5
    gt $I11, rx774_eos, rx774_fail
    sub $I11, rx774_pos, rx774_off
    substr $S10, rx774_tgt, $I11, 5
    ne $S10, "token", rx774_fail
    add rx774_pos, 5
    goto alt796_end
  alt796_2:
  # rx literal  "rule"
    add $I11, rx774_pos, 4
    gt $I11, rx774_eos, rx774_fail
    sub $I11, rx774_pos, rx774_off
    substr $S10, rx774_tgt, $I11, 4
    ne $S10, "rule", rx774_fail
    add rx774_pos, 4
  alt796_end:
    set_addr $I10, rxcap_797_fail
    ($I12, $I11) = rx774_cur."!mark_peek"($I10)
    rx774_cur."!cursor_pos"($I11)
    ($P10) = rx774_cur."!cursor_start"()
    $P10."!cursor_pass"(rx774_pos, "")
    rx774_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_797_done
  rxcap_797_fail:
    goto rx774_fail
  rxcap_797_done:
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
.annotate 'line', 361
  # rx subrule "deflongname" subtype=capture negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."deflongname"()
    unless $P10, rx774_fail
    rx774_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx774_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
.annotate 'line', 362
  # rx subrule "newpad" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."newpad"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
.annotate 'line', 363
  # rx rxquantr801 ** 0..1
    set_addr $I10, rxquantr801_done
    rx774_cur."!mark_push"(0, rx774_pos, $I10)
  rxquantr801_loop:
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx774_pos, 1
    gt $I11, rx774_eos, rx774_fail
    sub $I11, rx774_pos, rx774_off
    ord $I11, rx774_tgt, $I11
    ne $I11, 40, rx774_fail
    add rx774_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."signature"()
    unless $P10, rx774_fail
    rx774_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx774_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx774_pos, 1
    gt $I11, rx774_eos, rx774_fail
    sub $I11, rx774_pos, rx774_off
    ord $I11, rx774_tgt, $I11
    ne $I11, 41, rx774_fail
    add rx774_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
    set_addr $I10, rxquantr801_done
    (rx774_rep) = rx774_cur."!mark_commit"($I10)
  rxquantr801_done:
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
.annotate 'line', 364
  # rx reduce name="regex_declarator" key="open"
    rx774_cur."!cursor_pos"(rx774_pos)
    rx774_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
.annotate 'line', 365
  # rx literal  "{"
    add $I11, rx774_pos, 1
    gt $I11, rx774_eos, rx774_fail
    sub $I11, rx774_pos, rx774_off
    ord $I11, rx774_tgt, $I11
    ne $I11, 123, rx774_fail
    add rx774_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."LANG"("Regex", "nibbler")
    unless $P10, rx774_fail
    rx774_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx774_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx774_pos, 1
    gt $I11, rx774_eos, rx774_fail
    sub $I11, rx774_pos, rx774_off
    ord $I11, rx774_tgt, $I11
    ne $I11, 125, rx774_fail
    add rx774_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ENDSTMT"()
    unless $P10, rx774_fail
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
  alt780_end:
.annotate 'line', 366
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
.annotate 'line', 352
  # rx pass
    rx774_cur."!cursor_pass"(rx774_pos, "regex_declarator")
    if_null rx774_debug, debug_707
    rx774_cur."!cursor_debug"("PASS", "regex_declarator", " at pos=", rx774_pos)
  debug_707:
    .return (rx774_cur)
  rx774_restart:
.annotate 'line', 4
    if_null rx774_debug, debug_708
    rx774_cur."!cursor_debug"("NEXT", "regex_declarator")
  debug_708:
  rx774_fail:
    (rx774_rep, rx774_pos, $I10, $P10) = rx774_cur."!mark_fail"(0)
    lt rx774_pos, -1, rx774_done
    eq rx774_pos, -1, rx774_fail
    jump $I10
  rx774_done:
    rx774_cur."!cursor_fail"()
    if_null rx774_debug, debug_709
    rx774_cur."!cursor_debug"("FAIL", "regex_declarator")
  debug_709:
    .return (rx774_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("187_1284728478.15265") :method
.annotate 'line', 4
    $P776 = self."!PREFIX__!subrule"("ws", "")
    new $P777, "ResizablePMCArray"
    push $P777, $P776
    .return ($P777)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("188_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx811_tgt
    .local int rx811_pos
    .local int rx811_off
    .local int rx811_eos
    .local int rx811_rep
    .local pmc rx811_cur
    .local pmc rx811_debug
    (rx811_cur, rx811_pos, rx811_tgt, $I10) = self."!cursor_start"()
    rx811_cur."!cursor_caparray"("args")
    getattribute rx811_debug, rx811_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx811_cur
    .local pmc match
    .lex "$/", match
    length rx811_eos, rx811_tgt
    gt rx811_pos, rx811_eos, rx811_done
    set rx811_off, 0
    lt rx811_pos, 2, rx811_start
    sub rx811_off, rx811_pos, 1
    substr rx811_tgt, rx811_tgt, rx811_off
  rx811_start:
    eq $I10, 1, rx811_restart
    if_null rx811_debug, debug_710
    rx811_cur."!cursor_debug"("START", "dotty")
  debug_710:
    $I10 = self.'from'()
    ne $I10, -1, rxscan815_done
    goto rxscan815_scan
  rxscan815_loop:
    ($P10) = rx811_cur."from"()
    inc $P10
    set rx811_pos, $P10
    ge rx811_pos, rx811_eos, rxscan815_done
  rxscan815_scan:
    set_addr $I10, rxscan815_loop
    rx811_cur."!mark_push"(0, rx811_pos, $I10)
  rxscan815_done:
.annotate 'line', 370
  # rx literal  "."
    add $I11, rx811_pos, 1
    gt $I11, rx811_eos, rx811_fail
    sub $I11, rx811_pos, rx811_off
    ord $I11, rx811_tgt, $I11
    ne $I11, 46, rx811_fail
    add rx811_pos, 1
  alt816_0:
.annotate 'line', 371
    set_addr $I10, alt816_1
    rx811_cur."!mark_push"(0, rx811_pos, $I10)
  # rx subrule "deflongname" subtype=capture negate=
    rx811_cur."!cursor_pos"(rx811_pos)
    $P10 = rx811_cur."deflongname"()
    unless $P10, rx811_fail
    rx811_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=deflongname")
    rx811_pos = $P10."pos"()
    goto alt816_end
  alt816_1:
.annotate 'line', 372
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx811_pos, rx811_off
    substr $S10, rx811_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx811_fail
  # rx subrule "quote" subtype=capture negate=
    rx811_cur."!cursor_pos"(rx811_pos)
    $P10 = rx811_cur."quote"()
    unless $P10, rx811_fail
    rx811_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx811_pos = $P10."pos"()
  alt817_0:
.annotate 'line', 373
    set_addr $I10, alt817_1
    rx811_cur."!mark_push"(0, rx811_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx811_pos, rx811_off
    substr $S10, rx811_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx811_fail
    goto alt817_end
  alt817_1:
  # rx subrule "panic" subtype=method negate=
    rx811_cur."!cursor_pos"(rx811_pos)
    $P10 = rx811_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx811_fail
    rx811_pos = $P10."pos"()
  alt817_end:
  alt816_end:
.annotate 'line', 379
  # rx rxquantr818 ** 0..1
    set_addr $I10, rxquantr818_done
    rx811_cur."!mark_push"(0, rx811_pos, $I10)
  rxquantr818_loop:
  alt819_0:
.annotate 'line', 376
    set_addr $I10, alt819_1
    rx811_cur."!mark_push"(0, rx811_pos, $I10)
.annotate 'line', 377
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx811_pos, rx811_off
    substr $S10, rx811_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx811_fail
  # rx subrule "args" subtype=capture negate=
    rx811_cur."!cursor_pos"(rx811_pos)
    $P10 = rx811_cur."args"()
    unless $P10, rx811_fail
    rx811_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx811_pos = $P10."pos"()
    goto alt819_end
  alt819_1:
.annotate 'line', 378
  # rx literal  ":"
    add $I11, rx811_pos, 1
    gt $I11, rx811_eos, rx811_fail
    sub $I11, rx811_pos, rx811_off
    ord $I11, rx811_tgt, $I11
    ne $I11, 58, rx811_fail
    add rx811_pos, 1
  # rx charclass s
    ge rx811_pos, rx811_eos, rx811_fail
    sub $I10, rx811_pos, rx811_off
    is_cclass $I11, 32, rx811_tgt, $I10
    unless $I11, rx811_fail
    inc rx811_pos
  # rx subrule "arglist" subtype=capture negate=
    rx811_cur."!cursor_pos"(rx811_pos)
    $P10 = rx811_cur."arglist"()
    unless $P10, rx811_fail
    rx811_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx811_pos = $P10."pos"()
  alt819_end:
.annotate 'line', 379
    set_addr $I10, rxquantr818_done
    (rx811_rep) = rx811_cur."!mark_commit"($I10)
  rxquantr818_done:
.annotate 'line', 369
  # rx pass
    rx811_cur."!cursor_pass"(rx811_pos, "dotty")
    if_null rx811_debug, debug_711
    rx811_cur."!cursor_debug"("PASS", "dotty", " at pos=", rx811_pos)
  debug_711:
    .return (rx811_cur)
  rx811_restart:
.annotate 'line', 4
    if_null rx811_debug, debug_712
    rx811_cur."!cursor_debug"("NEXT", "dotty")
  debug_712:
  rx811_fail:
    (rx811_rep, rx811_pos, $I10, $P10) = rx811_cur."!mark_fail"(0)
    lt rx811_pos, -1, rx811_done
    eq rx811_pos, -1, rx811_fail
    jump $I10
  rx811_done:
    rx811_cur."!cursor_fail"()
    if_null rx811_debug, debug_713
    rx811_cur."!cursor_debug"("FAIL", "dotty")
  debug_713:
    .return (rx811_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("189_1284728478.15265") :method
.annotate 'line', 4
    $P813 = self."!PREFIX__!subrule"("deflongname", ".")
    new $P814, "ResizablePMCArray"
    push $P814, "'"
    push $P814, "\""
    push $P814, $P813
    .return ($P814)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("190_1284728478.15265") :method
.annotate 'line', 383
    $P821 = self."!protoregex"("term")
    .return ($P821)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("191_1284728478.15265") :method
.annotate 'line', 383
    $P823 = self."!PREFIX__!protoregex"("term")
    .return ($P823)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("192_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx825_tgt
    .local int rx825_pos
    .local int rx825_off
    .local int rx825_eos
    .local int rx825_rep
    .local pmc rx825_cur
    .local pmc rx825_debug
    (rx825_cur, rx825_pos, rx825_tgt, $I10) = self."!cursor_start"()
    getattribute rx825_debug, rx825_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx825_cur
    .local pmc match
    .lex "$/", match
    length rx825_eos, rx825_tgt
    gt rx825_pos, rx825_eos, rx825_done
    set rx825_off, 0
    lt rx825_pos, 2, rx825_start
    sub rx825_off, rx825_pos, 1
    substr rx825_tgt, rx825_tgt, rx825_off
  rx825_start:
    eq $I10, 1, rx825_restart
    if_null rx825_debug, debug_714
    rx825_cur."!cursor_debug"("START", "term:sym<self>")
  debug_714:
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
.annotate 'line', 385
  # rx subcapture "sym"
    set_addr $I10, rxcap_829_fail
    rx825_cur."!mark_push"(0, rx825_pos, $I10)
  # rx literal  "self"
    add $I11, rx825_pos, 4
    gt $I11, rx825_eos, rx825_fail
    sub $I11, rx825_pos, rx825_off
    substr $S10, rx825_tgt, $I11, 4
    ne $S10, "self", rx825_fail
    add rx825_pos, 4
    set_addr $I10, rxcap_829_fail
    ($I12, $I11) = rx825_cur."!mark_peek"($I10)
    rx825_cur."!cursor_pos"($I11)
    ($P10) = rx825_cur."!cursor_start"()
    $P10."!cursor_pass"(rx825_pos, "")
    rx825_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_829_done
  rxcap_829_fail:
    goto rx825_fail
  rxcap_829_done:
  # rxanchor rwb
    le rx825_pos, 0, rx825_fail
    sub $I10, rx825_pos, rx825_off
    is_cclass $I11, 8192, rx825_tgt, $I10
    if $I11, rx825_fail
    dec $I10
    is_cclass $I11, 8192, rx825_tgt, $I10
    unless $I11, rx825_fail
  # rx pass
    rx825_cur."!cursor_pass"(rx825_pos, "term:sym<self>")
    if_null rx825_debug, debug_715
    rx825_cur."!cursor_debug"("PASS", "term:sym<self>", " at pos=", rx825_pos)
  debug_715:
    .return (rx825_cur)
  rx825_restart:
.annotate 'line', 4
    if_null rx825_debug, debug_716
    rx825_cur."!cursor_debug"("NEXT", "term:sym<self>")
  debug_716:
  rx825_fail:
    (rx825_rep, rx825_pos, $I10, $P10) = rx825_cur."!mark_fail"(0)
    lt rx825_pos, -1, rx825_done
    eq rx825_pos, -1, rx825_fail
    jump $I10
  rx825_done:
    rx825_cur."!cursor_fail"()
    if_null rx825_debug, debug_717
    rx825_cur."!cursor_debug"("FAIL", "term:sym<self>")
  debug_717:
    .return (rx825_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("193_1284728478.15265") :method
.annotate 'line', 4
    new $P827, "ResizablePMCArray"
    push $P827, "self"
    .return ($P827)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("194_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx831_tgt
    .local int rx831_pos
    .local int rx831_off
    .local int rx831_eos
    .local int rx831_rep
    .local pmc rx831_cur
    .local pmc rx831_debug
    (rx831_cur, rx831_pos, rx831_tgt, $I10) = self."!cursor_start"()
    getattribute rx831_debug, rx831_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx831_cur
    .local pmc match
    .lex "$/", match
    length rx831_eos, rx831_tgt
    gt rx831_pos, rx831_eos, rx831_done
    set rx831_off, 0
    lt rx831_pos, 2, rx831_start
    sub rx831_off, rx831_pos, 1
    substr rx831_tgt, rx831_tgt, rx831_off
  rx831_start:
    eq $I10, 1, rx831_restart
    if_null rx831_debug, debug_718
    rx831_cur."!cursor_debug"("START", "term:sym<identifier>")
  debug_718:
    $I10 = self.'from'()
    ne $I10, -1, rxscan835_done
    goto rxscan835_scan
  rxscan835_loop:
    ($P10) = rx831_cur."from"()
    inc $P10
    set rx831_pos, $P10
    ge rx831_pos, rx831_eos, rxscan835_done
  rxscan835_scan:
    set_addr $I10, rxscan835_loop
    rx831_cur."!mark_push"(0, rx831_pos, $I10)
  rxscan835_done:
.annotate 'line', 388
  # rx subrule "deflongname" subtype=capture negate=
    rx831_cur."!cursor_pos"(rx831_pos)
    $P10 = rx831_cur."deflongname"()
    unless $P10, rx831_fail
    rx831_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx831_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx831_pos, rx831_off
    substr $S10, rx831_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx831_fail
  # rx subrule "args" subtype=capture negate=
    rx831_cur."!cursor_pos"(rx831_pos)
    $P10 = rx831_cur."args"()
    unless $P10, rx831_fail
    rx831_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx831_pos = $P10."pos"()
.annotate 'line', 387
  # rx pass
    rx831_cur."!cursor_pass"(rx831_pos, "term:sym<identifier>")
    if_null rx831_debug, debug_719
    rx831_cur."!cursor_debug"("PASS", "term:sym<identifier>", " at pos=", rx831_pos)
  debug_719:
    .return (rx831_cur)
  rx831_restart:
.annotate 'line', 4
    if_null rx831_debug, debug_720
    rx831_cur."!cursor_debug"("NEXT", "term:sym<identifier>")
  debug_720:
  rx831_fail:
    (rx831_rep, rx831_pos, $I10, $P10) = rx831_cur."!mark_fail"(0)
    lt rx831_pos, -1, rx831_done
    eq rx831_pos, -1, rx831_fail
    jump $I10
  rx831_done:
    rx831_cur."!cursor_fail"()
    if_null rx831_debug, debug_721
    rx831_cur."!cursor_debug"("FAIL", "term:sym<identifier>")
  debug_721:
    .return (rx831_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("195_1284728478.15265") :method
.annotate 'line', 4
    $P833 = self."!PREFIX__!subrule"("deflongname", "")
    new $P834, "ResizablePMCArray"
    push $P834, $P833
    .return ($P834)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("196_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx837_tgt
    .local int rx837_pos
    .local int rx837_off
    .local int rx837_eos
    .local int rx837_rep
    .local pmc rx837_cur
    .local pmc rx837_debug
    (rx837_cur, rx837_pos, rx837_tgt, $I10) = self."!cursor_start"()
    rx837_cur."!cursor_caparray"("args")
    getattribute rx837_debug, rx837_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx837_cur
    .local pmc match
    .lex "$/", match
    length rx837_eos, rx837_tgt
    gt rx837_pos, rx837_eos, rx837_done
    set rx837_off, 0
    lt rx837_pos, 2, rx837_start
    sub rx837_off, rx837_pos, 1
    substr rx837_tgt, rx837_tgt, rx837_off
  rx837_start:
    eq $I10, 1, rx837_restart
    if_null rx837_debug, debug_722
    rx837_cur."!cursor_debug"("START", "term:sym<name>")
  debug_722:
    $I10 = self.'from'()
    ne $I10, -1, rxscan841_done
    goto rxscan841_scan
  rxscan841_loop:
    ($P10) = rx837_cur."from"()
    inc $P10
    set rx837_pos, $P10
    ge rx837_pos, rx837_eos, rxscan841_done
  rxscan841_scan:
    set_addr $I10, rxscan841_loop
    rx837_cur."!mark_push"(0, rx837_pos, $I10)
  rxscan841_done:
.annotate 'line', 392
  # rx subrule "name" subtype=capture negate=
    rx837_cur."!cursor_pos"(rx837_pos)
    $P10 = rx837_cur."name"()
    unless $P10, rx837_fail
    rx837_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx837_pos = $P10."pos"()
  # rx rxquantr842 ** 0..1
    set_addr $I10, rxquantr842_done
    rx837_cur."!mark_push"(0, rx837_pos, $I10)
  rxquantr842_loop:
  # rx subrule "args" subtype=capture negate=
    rx837_cur."!cursor_pos"(rx837_pos)
    $P10 = rx837_cur."args"()
    unless $P10, rx837_fail
    goto rxsubrule843_pass
  rxsubrule843_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx837_fail
  rxsubrule843_pass:
    set_addr $I10, rxsubrule843_back
    rx837_cur."!mark_push"(0, rx837_pos, $I10, $P10)
    $P10."!cursor_names"("args")
    rx837_pos = $P10."pos"()
    set_addr $I10, rxquantr842_done
    (rx837_rep) = rx837_cur."!mark_commit"($I10)
  rxquantr842_done:
.annotate 'line', 391
  # rx pass
    rx837_cur."!cursor_pass"(rx837_pos, "term:sym<name>")
    if_null rx837_debug, debug_723
    rx837_cur."!cursor_debug"("PASS", "term:sym<name>", " at pos=", rx837_pos)
  debug_723:
    .return (rx837_cur)
  rx837_restart:
.annotate 'line', 4
    if_null rx837_debug, debug_724
    rx837_cur."!cursor_debug"("NEXT", "term:sym<name>")
  debug_724:
  rx837_fail:
    (rx837_rep, rx837_pos, $I10, $P10) = rx837_cur."!mark_fail"(0)
    lt rx837_pos, -1, rx837_done
    eq rx837_pos, -1, rx837_fail
    jump $I10
  rx837_done:
    rx837_cur."!cursor_fail"()
    if_null rx837_debug, debug_725
    rx837_cur."!cursor_debug"("FAIL", "term:sym<name>")
  debug_725:
    .return (rx837_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("197_1284728478.15265") :method
.annotate 'line', 4
    $P839 = self."!PREFIX__!subrule"("name", "")
    new $P840, "ResizablePMCArray"
    push $P840, $P839
    .return ($P840)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("198_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx845_tgt
    .local int rx845_pos
    .local int rx845_off
    .local int rx845_eos
    .local int rx845_rep
    .local pmc rx845_cur
    .local pmc rx845_debug
    (rx845_cur, rx845_pos, rx845_tgt, $I10) = self."!cursor_start"()
    rx845_cur."!cursor_caparray"("args")
    getattribute rx845_debug, rx845_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx845_cur
    .local pmc match
    .lex "$/", match
    length rx845_eos, rx845_tgt
    gt rx845_pos, rx845_eos, rx845_done
    set rx845_off, 0
    lt rx845_pos, 2, rx845_start
    sub rx845_off, rx845_pos, 1
    substr rx845_tgt, rx845_tgt, rx845_off
  rx845_start:
    eq $I10, 1, rx845_restart
    if_null rx845_debug, debug_726
    rx845_cur."!cursor_debug"("START", "term:sym<pir::op>")
  debug_726:
    $I10 = self.'from'()
    ne $I10, -1, rxscan848_done
    goto rxscan848_scan
  rxscan848_loop:
    ($P10) = rx845_cur."from"()
    inc $P10
    set rx845_pos, $P10
    ge rx845_pos, rx845_eos, rxscan848_done
  rxscan848_scan:
    set_addr $I10, rxscan848_loop
    rx845_cur."!mark_push"(0, rx845_pos, $I10)
  rxscan848_done:
.annotate 'line', 396
  # rx literal  "pir::"
    add $I11, rx845_pos, 5
    gt $I11, rx845_eos, rx845_fail
    sub $I11, rx845_pos, rx845_off
    substr $S10, rx845_tgt, $I11, 5
    ne $S10, "pir::", rx845_fail
    add rx845_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_849_fail
    rx845_cur."!mark_push"(0, rx845_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx845_pos, rx845_off
    find_not_cclass $I11, 8192, rx845_tgt, $I10, rx845_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx845_fail
    add rx845_pos, rx845_off, $I11
    set_addr $I10, rxcap_849_fail
    ($I12, $I11) = rx845_cur."!mark_peek"($I10)
    rx845_cur."!cursor_pos"($I11)
    ($P10) = rx845_cur."!cursor_start"()
    $P10."!cursor_pass"(rx845_pos, "")
    rx845_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_849_done
  rxcap_849_fail:
    goto rx845_fail
  rxcap_849_done:
  # rx rxquantr850 ** 0..1
    set_addr $I10, rxquantr850_done
    rx845_cur."!mark_push"(0, rx845_pos, $I10)
  rxquantr850_loop:
  # rx subrule "args" subtype=capture negate=
    rx845_cur."!cursor_pos"(rx845_pos)
    $P10 = rx845_cur."args"()
    unless $P10, rx845_fail
    goto rxsubrule851_pass
  rxsubrule851_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx845_fail
  rxsubrule851_pass:
    set_addr $I10, rxsubrule851_back
    rx845_cur."!mark_push"(0, rx845_pos, $I10, $P10)
    $P10."!cursor_names"("args")
    rx845_pos = $P10."pos"()
    set_addr $I10, rxquantr850_done
    (rx845_rep) = rx845_cur."!mark_commit"($I10)
  rxquantr850_done:
.annotate 'line', 395
  # rx pass
    rx845_cur."!cursor_pass"(rx845_pos, "term:sym<pir::op>")
    if_null rx845_debug, debug_727
    rx845_cur."!cursor_debug"("PASS", "term:sym<pir::op>", " at pos=", rx845_pos)
  debug_727:
    .return (rx845_cur)
  rx845_restart:
.annotate 'line', 4
    if_null rx845_debug, debug_728
    rx845_cur."!cursor_debug"("NEXT", "term:sym<pir::op>")
  debug_728:
  rx845_fail:
    (rx845_rep, rx845_pos, $I10, $P10) = rx845_cur."!mark_fail"(0)
    lt rx845_pos, -1, rx845_done
    eq rx845_pos, -1, rx845_fail
    jump $I10
  rx845_done:
    rx845_cur."!cursor_fail"()
    if_null rx845_debug, debug_729
    rx845_cur."!cursor_debug"("FAIL", "term:sym<pir::op>")
  debug_729:
    .return (rx845_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("199_1284728478.15265") :method
.annotate 'line', 4
    new $P847, "ResizablePMCArray"
    push $P847, "pir::"
    .return ($P847)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("200_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx853_tgt
    .local int rx853_pos
    .local int rx853_off
    .local int rx853_eos
    .local int rx853_rep
    .local pmc rx853_cur
    .local pmc rx853_debug
    (rx853_cur, rx853_pos, rx853_tgt, $I10) = self."!cursor_start"()
    getattribute rx853_debug, rx853_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx853_cur
    .local pmc match
    .lex "$/", match
    length rx853_eos, rx853_tgt
    gt rx853_pos, rx853_eos, rx853_done
    set rx853_off, 0
    lt rx853_pos, 2, rx853_start
    sub rx853_off, rx853_pos, 1
    substr rx853_tgt, rx853_tgt, rx853_off
  rx853_start:
    eq $I10, 1, rx853_restart
    if_null rx853_debug, debug_730
    rx853_cur."!cursor_debug"("START", "args")
  debug_730:
    $I10 = self.'from'()
    ne $I10, -1, rxscan857_done
    goto rxscan857_scan
  rxscan857_loop:
    ($P10) = rx853_cur."from"()
    inc $P10
    set rx853_pos, $P10
    ge rx853_pos, rx853_eos, rxscan857_done
  rxscan857_scan:
    set_addr $I10, rxscan857_loop
    rx853_cur."!mark_push"(0, rx853_pos, $I10)
  rxscan857_done:
.annotate 'line', 400
  # rx literal  "("
    add $I11, rx853_pos, 1
    gt $I11, rx853_eos, rx853_fail
    sub $I11, rx853_pos, rx853_off
    ord $I11, rx853_tgt, $I11
    ne $I11, 40, rx853_fail
    add rx853_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx853_cur."!cursor_pos"(rx853_pos)
    $P10 = rx853_cur."arglist"()
    unless $P10, rx853_fail
    rx853_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx853_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx853_pos, 1
    gt $I11, rx853_eos, rx853_fail
    sub $I11, rx853_pos, rx853_off
    ord $I11, rx853_tgt, $I11
    ne $I11, 41, rx853_fail
    add rx853_pos, 1
  # rx pass
    rx853_cur."!cursor_pass"(rx853_pos, "args")
    if_null rx853_debug, debug_731
    rx853_cur."!cursor_debug"("PASS", "args", " at pos=", rx853_pos)
  debug_731:
    .return (rx853_cur)
  rx853_restart:
.annotate 'line', 4
    if_null rx853_debug, debug_732
    rx853_cur."!cursor_debug"("NEXT", "args")
  debug_732:
  rx853_fail:
    (rx853_rep, rx853_pos, $I10, $P10) = rx853_cur."!mark_fail"(0)
    lt rx853_pos, -1, rx853_done
    eq rx853_pos, -1, rx853_fail
    jump $I10
  rx853_done:
    rx853_cur."!cursor_fail"()
    if_null rx853_debug, debug_733
    rx853_cur."!cursor_debug"("FAIL", "args")
  debug_733:
    .return (rx853_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("201_1284728478.15265") :method
.annotate 'line', 4
    $P855 = self."!PREFIX__!subrule"("arglist", "(")
    new $P856, "ResizablePMCArray"
    push $P856, $P855
    .return ($P856)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("202_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx859_tgt
    .local int rx859_pos
    .local int rx859_off
    .local int rx859_eos
    .local int rx859_rep
    .local pmc rx859_cur
    .local pmc rx859_debug
    (rx859_cur, rx859_pos, rx859_tgt, $I10) = self."!cursor_start"()
    getattribute rx859_debug, rx859_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx859_cur
    .local pmc match
    .lex "$/", match
    length rx859_eos, rx859_tgt
    gt rx859_pos, rx859_eos, rx859_done
    set rx859_off, 0
    lt rx859_pos, 2, rx859_start
    sub rx859_off, rx859_pos, 1
    substr rx859_tgt, rx859_tgt, rx859_off
  rx859_start:
    eq $I10, 1, rx859_restart
    if_null rx859_debug, debug_734
    rx859_cur."!cursor_debug"("START", "arglist")
  debug_734:
    $I10 = self.'from'()
    ne $I10, -1, rxscan863_done
    goto rxscan863_scan
  rxscan863_loop:
    ($P10) = rx859_cur."from"()
    inc $P10
    set rx859_pos, $P10
    ge rx859_pos, rx859_eos, rxscan863_done
  rxscan863_scan:
    set_addr $I10, rxscan863_loop
    rx859_cur."!mark_push"(0, rx859_pos, $I10)
  rxscan863_done:
.annotate 'line', 404
  # rx subrule "ws" subtype=method negate=
    rx859_cur."!cursor_pos"(rx859_pos)
    $P10 = rx859_cur."ws"()
    unless $P10, rx859_fail
    rx859_pos = $P10."pos"()
  alt864_0:
.annotate 'line', 405
    set_addr $I10, alt864_1
    rx859_cur."!mark_push"(0, rx859_pos, $I10)
.annotate 'line', 406
  # rx subrule "EXPR" subtype=capture negate=
    rx859_cur."!cursor_pos"(rx859_pos)
    $P10 = rx859_cur."EXPR"("f=")
    unless $P10, rx859_fail
    rx859_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx859_pos = $P10."pos"()
    goto alt864_end
  alt864_1:
  alt864_end:
.annotate 'line', 403
  # rx pass
    rx859_cur."!cursor_pass"(rx859_pos, "arglist")
    if_null rx859_debug, debug_735
    rx859_cur."!cursor_debug"("PASS", "arglist", " at pos=", rx859_pos)
  debug_735:
    .return (rx859_cur)
  rx859_restart:
.annotate 'line', 4
    if_null rx859_debug, debug_736
    rx859_cur."!cursor_debug"("NEXT", "arglist")
  debug_736:
  rx859_fail:
    (rx859_rep, rx859_pos, $I10, $P10) = rx859_cur."!mark_fail"(0)
    lt rx859_pos, -1, rx859_done
    eq rx859_pos, -1, rx859_fail
    jump $I10
  rx859_done:
    rx859_cur."!cursor_fail"()
    if_null rx859_debug, debug_737
    rx859_cur."!cursor_debug"("FAIL", "arglist")
  debug_737:
    .return (rx859_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("203_1284728478.15265") :method
.annotate 'line', 4
    $P861 = self."!PREFIX__!subrule"("ws", "")
    new $P862, "ResizablePMCArray"
    push $P862, $P861
    .return ($P862)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("204_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx866_tgt
    .local int rx866_pos
    .local int rx866_off
    .local int rx866_eos
    .local int rx866_rep
    .local pmc rx866_cur
    .local pmc rx866_debug
    (rx866_cur, rx866_pos, rx866_tgt, $I10) = self."!cursor_start"()
    getattribute rx866_debug, rx866_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx866_cur
    .local pmc match
    .lex "$/", match
    length rx866_eos, rx866_tgt
    gt rx866_pos, rx866_eos, rx866_done
    set rx866_off, 0
    lt rx866_pos, 2, rx866_start
    sub rx866_off, rx866_pos, 1
    substr rx866_tgt, rx866_tgt, rx866_off
  rx866_start:
    eq $I10, 1, rx866_restart
    if_null rx866_debug, debug_738
    rx866_cur."!cursor_debug"("START", "term:sym<value>")
  debug_738:
    $I10 = self.'from'()
    ne $I10, -1, rxscan870_done
    goto rxscan870_scan
  rxscan870_loop:
    ($P10) = rx866_cur."from"()
    inc $P10
    set rx866_pos, $P10
    ge rx866_pos, rx866_eos, rxscan870_done
  rxscan870_scan:
    set_addr $I10, rxscan870_loop
    rx866_cur."!mark_push"(0, rx866_pos, $I10)
  rxscan870_done:
.annotate 'line', 412
  # rx subrule "value" subtype=capture negate=
    rx866_cur."!cursor_pos"(rx866_pos)
    $P10 = rx866_cur."value"()
    unless $P10, rx866_fail
    rx866_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx866_pos = $P10."pos"()
  # rx pass
    rx866_cur."!cursor_pass"(rx866_pos, "term:sym<value>")
    if_null rx866_debug, debug_739
    rx866_cur."!cursor_debug"("PASS", "term:sym<value>", " at pos=", rx866_pos)
  debug_739:
    .return (rx866_cur)
  rx866_restart:
.annotate 'line', 4
    if_null rx866_debug, debug_740
    rx866_cur."!cursor_debug"("NEXT", "term:sym<value>")
  debug_740:
  rx866_fail:
    (rx866_rep, rx866_pos, $I10, $P10) = rx866_cur."!mark_fail"(0)
    lt rx866_pos, -1, rx866_done
    eq rx866_pos, -1, rx866_fail
    jump $I10
  rx866_done:
    rx866_cur."!cursor_fail"()
    if_null rx866_debug, debug_741
    rx866_cur."!cursor_debug"("FAIL", "term:sym<value>")
  debug_741:
    .return (rx866_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("205_1284728478.15265") :method
.annotate 'line', 4
    $P868 = self."!PREFIX__!subrule"("value", "")
    new $P869, "ResizablePMCArray"
    push $P869, $P868
    .return ($P869)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("206_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx872_tgt
    .local int rx872_pos
    .local int rx872_off
    .local int rx872_eos
    .local int rx872_rep
    .local pmc rx872_cur
    .local pmc rx872_debug
    (rx872_cur, rx872_pos, rx872_tgt, $I10) = self."!cursor_start"()
    getattribute rx872_debug, rx872_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx872_cur
    .local pmc match
    .lex "$/", match
    length rx872_eos, rx872_tgt
    gt rx872_pos, rx872_eos, rx872_done
    set rx872_off, 0
    lt rx872_pos, 2, rx872_start
    sub rx872_off, rx872_pos, 1
    substr rx872_tgt, rx872_tgt, rx872_off
  rx872_start:
    eq $I10, 1, rx872_restart
    if_null rx872_debug, debug_742
    rx872_cur."!cursor_debug"("START", "value")
  debug_742:
    $I10 = self.'from'()
    ne $I10, -1, rxscan877_done
    goto rxscan877_scan
  rxscan877_loop:
    ($P10) = rx872_cur."from"()
    inc $P10
    set rx872_pos, $P10
    ge rx872_pos, rx872_eos, rxscan877_done
  rxscan877_scan:
    set_addr $I10, rxscan877_loop
    rx872_cur."!mark_push"(0, rx872_pos, $I10)
  rxscan877_done:
  alt878_0:
.annotate 'line', 414
    set_addr $I10, alt878_1
    rx872_cur."!mark_push"(0, rx872_pos, $I10)
.annotate 'line', 415
  # rx subrule "quote" subtype=capture negate=
    rx872_cur."!cursor_pos"(rx872_pos)
    $P10 = rx872_cur."quote"()
    unless $P10, rx872_fail
    rx872_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx872_pos = $P10."pos"()
    goto alt878_end
  alt878_1:
.annotate 'line', 416
  # rx subrule "number" subtype=capture negate=
    rx872_cur."!cursor_pos"(rx872_pos)
    $P10 = rx872_cur."number"()
    unless $P10, rx872_fail
    rx872_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("number")
    rx872_pos = $P10."pos"()
  alt878_end:
.annotate 'line', 414
  # rx pass
    rx872_cur."!cursor_pass"(rx872_pos, "value")
    if_null rx872_debug, debug_743
    rx872_cur."!cursor_debug"("PASS", "value", " at pos=", rx872_pos)
  debug_743:
    .return (rx872_cur)
  rx872_restart:
.annotate 'line', 4
    if_null rx872_debug, debug_744
    rx872_cur."!cursor_debug"("NEXT", "value")
  debug_744:
  rx872_fail:
    (rx872_rep, rx872_pos, $I10, $P10) = rx872_cur."!mark_fail"(0)
    lt rx872_pos, -1, rx872_done
    eq rx872_pos, -1, rx872_fail
    jump $I10
  rx872_done:
    rx872_cur."!cursor_fail"()
    if_null rx872_debug, debug_745
    rx872_cur."!cursor_debug"("FAIL", "value")
  debug_745:
    .return (rx872_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("207_1284728478.15265") :method
.annotate 'line', 4
    $P874 = self."!PREFIX__!subrule"("number", "")
    $P875 = self."!PREFIX__!subrule"("quote", "")
    new $P876, "ResizablePMCArray"
    push $P876, $P874
    push $P876, $P875
    .return ($P876)
.end


.namespace ["NQP";"Grammar"]
.sub "number"  :subid("208_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx880_tgt
    .local int rx880_pos
    .local int rx880_off
    .local int rx880_eos
    .local int rx880_rep
    .local pmc rx880_cur
    .local pmc rx880_debug
    (rx880_cur, rx880_pos, rx880_tgt, $I10) = self."!cursor_start"()
    getattribute rx880_debug, rx880_cur, "$!debug"
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
    eq $I10, 1, rx880_restart
    if_null rx880_debug, debug_746
    rx880_cur."!cursor_debug"("START", "number")
  debug_746:
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
.annotate 'line', 420
  # rx subcapture "sign"
    set_addr $I10, rxcap_885_fail
    rx880_cur."!mark_push"(0, rx880_pos, $I10)
  # rx enumcharlist_q negate=0  r 0..1
    sub $I10, rx880_pos, rx880_off
    set rx880_rep, 0
    sub $I12, rx880_eos, rx880_pos
    le $I12, 1, rxenumcharlistq884_loop
    set $I12, 1
  rxenumcharlistq884_loop:
    le $I12, 0, rxenumcharlistq884_done
    substr $S10, rx880_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rxenumcharlistq884_done
    inc rx880_rep
  rxenumcharlistq884_done:
    add rx880_pos, rx880_pos, rx880_rep
    set_addr $I10, rxcap_885_fail
    ($I12, $I11) = rx880_cur."!mark_peek"($I10)
    rx880_cur."!cursor_pos"($I11)
    ($P10) = rx880_cur."!cursor_start"()
    $P10."!cursor_pass"(rx880_pos, "")
    rx880_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_885_done
  rxcap_885_fail:
    goto rx880_fail
  rxcap_885_done:
  alt886_0:
.annotate 'line', 421
    set_addr $I10, alt886_1
    rx880_cur."!mark_push"(0, rx880_pos, $I10)
  # rx subrule "dec_number" subtype=capture negate=
    rx880_cur."!cursor_pos"(rx880_pos)
    $P10 = rx880_cur."dec_number"()
    unless $P10, rx880_fail
    rx880_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx880_pos = $P10."pos"()
    goto alt886_end
  alt886_1:
  # rx subrule "integer" subtype=capture negate=
    rx880_cur."!cursor_pos"(rx880_pos)
    $P10 = rx880_cur."integer"()
    unless $P10, rx880_fail
    rx880_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx880_pos = $P10."pos"()
  alt886_end:
.annotate 'line', 419
  # rx pass
    rx880_cur."!cursor_pass"(rx880_pos, "number")
    if_null rx880_debug, debug_747
    rx880_cur."!cursor_debug"("PASS", "number", " at pos=", rx880_pos)
  debug_747:
    .return (rx880_cur)
  rx880_restart:
.annotate 'line', 4
    if_null rx880_debug, debug_748
    rx880_cur."!cursor_debug"("NEXT", "number")
  debug_748:
  rx880_fail:
    (rx880_rep, rx880_pos, $I10, $P10) = rx880_cur."!mark_fail"(0)
    lt rx880_pos, -1, rx880_done
    eq rx880_pos, -1, rx880_fail
    jump $I10
  rx880_done:
    rx880_cur."!cursor_fail"()
    if_null rx880_debug, debug_749
    rx880_cur."!cursor_debug"("FAIL", "number")
  debug_749:
    .return (rx880_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__number"  :subid("209_1284728478.15265") :method
.annotate 'line', 4
    new $P882, "ResizablePMCArray"
    push $P882, ""
    .return ($P882)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("210_1284728478.15265") :method
.annotate 'line', 424
    $P888 = self."!protoregex"("quote")
    .return ($P888)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("211_1284728478.15265") :method
.annotate 'line', 424
    $P890 = self."!PREFIX__!protoregex"("quote")
    .return ($P890)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("212_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx892_tgt
    .local int rx892_pos
    .local int rx892_off
    .local int rx892_eos
    .local int rx892_rep
    .local pmc rx892_cur
    .local pmc rx892_debug
    (rx892_cur, rx892_pos, rx892_tgt, $I10) = self."!cursor_start"()
    getattribute rx892_debug, rx892_cur, "$!debug"
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
    eq $I10, 1, rx892_restart
    if_null rx892_debug, debug_750
    rx892_cur."!cursor_debug"("START", "quote:sym<apos>")
  debug_750:
    $I10 = self.'from'()
    ne $I10, -1, rxscan895_done
    goto rxscan895_scan
  rxscan895_loop:
    ($P10) = rx892_cur."from"()
    inc $P10
    set rx892_pos, $P10
    ge rx892_pos, rx892_eos, rxscan895_done
  rxscan895_scan:
    set_addr $I10, rxscan895_loop
    rx892_cur."!mark_push"(0, rx892_pos, $I10)
  rxscan895_done:
.annotate 'line', 425
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx892_pos, rx892_off
    substr $S10, rx892_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx892_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx892_cur."!cursor_pos"(rx892_pos)
    $P10 = rx892_cur."quote_EXPR"(":q")
    unless $P10, rx892_fail
    rx892_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx892_pos = $P10."pos"()
  # rx pass
    rx892_cur."!cursor_pass"(rx892_pos, "quote:sym<apos>")
    if_null rx892_debug, debug_751
    rx892_cur."!cursor_debug"("PASS", "quote:sym<apos>", " at pos=", rx892_pos)
  debug_751:
    .return (rx892_cur)
  rx892_restart:
.annotate 'line', 4
    if_null rx892_debug, debug_752
    rx892_cur."!cursor_debug"("NEXT", "quote:sym<apos>")
  debug_752:
  rx892_fail:
    (rx892_rep, rx892_pos, $I10, $P10) = rx892_cur."!mark_fail"(0)
    lt rx892_pos, -1, rx892_done
    eq rx892_pos, -1, rx892_fail
    jump $I10
  rx892_done:
    rx892_cur."!cursor_fail"()
    if_null rx892_debug, debug_753
    rx892_cur."!cursor_debug"("FAIL", "quote:sym<apos>")
  debug_753:
    .return (rx892_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("213_1284728478.15265") :method
.annotate 'line', 4
    new $P894, "ResizablePMCArray"
    push $P894, "'"
    .return ($P894)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("214_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx897_tgt
    .local int rx897_pos
    .local int rx897_off
    .local int rx897_eos
    .local int rx897_rep
    .local pmc rx897_cur
    .local pmc rx897_debug
    (rx897_cur, rx897_pos, rx897_tgt, $I10) = self."!cursor_start"()
    getattribute rx897_debug, rx897_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx897_cur
    .local pmc match
    .lex "$/", match
    length rx897_eos, rx897_tgt
    gt rx897_pos, rx897_eos, rx897_done
    set rx897_off, 0
    lt rx897_pos, 2, rx897_start
    sub rx897_off, rx897_pos, 1
    substr rx897_tgt, rx897_tgt, rx897_off
  rx897_start:
    eq $I10, 1, rx897_restart
    if_null rx897_debug, debug_754
    rx897_cur."!cursor_debug"("START", "quote:sym<dblq>")
  debug_754:
    $I10 = self.'from'()
    ne $I10, -1, rxscan900_done
    goto rxscan900_scan
  rxscan900_loop:
    ($P10) = rx897_cur."from"()
    inc $P10
    set rx897_pos, $P10
    ge rx897_pos, rx897_eos, rxscan900_done
  rxscan900_scan:
    set_addr $I10, rxscan900_loop
    rx897_cur."!mark_push"(0, rx897_pos, $I10)
  rxscan900_done:
.annotate 'line', 426
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx897_pos, rx897_off
    substr $S10, rx897_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx897_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx897_cur."!cursor_pos"(rx897_pos)
    $P10 = rx897_cur."quote_EXPR"(":qq")
    unless $P10, rx897_fail
    rx897_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx897_pos = $P10."pos"()
  # rx pass
    rx897_cur."!cursor_pass"(rx897_pos, "quote:sym<dblq>")
    if_null rx897_debug, debug_755
    rx897_cur."!cursor_debug"("PASS", "quote:sym<dblq>", " at pos=", rx897_pos)
  debug_755:
    .return (rx897_cur)
  rx897_restart:
.annotate 'line', 4
    if_null rx897_debug, debug_756
    rx897_cur."!cursor_debug"("NEXT", "quote:sym<dblq>")
  debug_756:
  rx897_fail:
    (rx897_rep, rx897_pos, $I10, $P10) = rx897_cur."!mark_fail"(0)
    lt rx897_pos, -1, rx897_done
    eq rx897_pos, -1, rx897_fail
    jump $I10
  rx897_done:
    rx897_cur."!cursor_fail"()
    if_null rx897_debug, debug_757
    rx897_cur."!cursor_debug"("FAIL", "quote:sym<dblq>")
  debug_757:
    .return (rx897_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("215_1284728478.15265") :method
.annotate 'line', 4
    new $P899, "ResizablePMCArray"
    push $P899, "\""
    .return ($P899)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("216_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx902_tgt
    .local int rx902_pos
    .local int rx902_off
    .local int rx902_eos
    .local int rx902_rep
    .local pmc rx902_cur
    .local pmc rx902_debug
    (rx902_cur, rx902_pos, rx902_tgt, $I10) = self."!cursor_start"()
    getattribute rx902_debug, rx902_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx902_cur
    .local pmc match
    .lex "$/", match
    length rx902_eos, rx902_tgt
    gt rx902_pos, rx902_eos, rx902_done
    set rx902_off, 0
    lt rx902_pos, 2, rx902_start
    sub rx902_off, rx902_pos, 1
    substr rx902_tgt, rx902_tgt, rx902_off
  rx902_start:
    eq $I10, 1, rx902_restart
    if_null rx902_debug, debug_758
    rx902_cur."!cursor_debug"("START", "quote:sym<q>")
  debug_758:
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
.annotate 'line', 427
  # rx literal  "q"
    add $I11, rx902_pos, 1
    gt $I11, rx902_eos, rx902_fail
    sub $I11, rx902_pos, rx902_off
    ord $I11, rx902_tgt, $I11
    ne $I11, 113, rx902_fail
    add rx902_pos, 1
  # rxanchor rwb
    le rx902_pos, 0, rx902_fail
    sub $I10, rx902_pos, rx902_off
    is_cclass $I11, 8192, rx902_tgt, $I10
    if $I11, rx902_fail
    dec $I10
    is_cclass $I11, 8192, rx902_tgt, $I10
    unless $I11, rx902_fail
  # rx enumcharlist negate=1 zerowidth
    sub $I10, rx902_pos, rx902_off
    substr $S10, rx902_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx902_fail
  # rx subrule "ws" subtype=method negate=
    rx902_cur."!cursor_pos"(rx902_pos)
    $P10 = rx902_cur."ws"()
    unless $P10, rx902_fail
    rx902_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx902_cur."!cursor_pos"(rx902_pos)
    $P10 = rx902_cur."quote_EXPR"(":q")
    unless $P10, rx902_fail
    rx902_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx902_pos = $P10."pos"()
  # rx pass
    rx902_cur."!cursor_pass"(rx902_pos, "quote:sym<q>")
    if_null rx902_debug, debug_759
    rx902_cur."!cursor_debug"("PASS", "quote:sym<q>", " at pos=", rx902_pos)
  debug_759:
    .return (rx902_cur)
  rx902_restart:
.annotate 'line', 4
    if_null rx902_debug, debug_760
    rx902_cur."!cursor_debug"("NEXT", "quote:sym<q>")
  debug_760:
  rx902_fail:
    (rx902_rep, rx902_pos, $I10, $P10) = rx902_cur."!mark_fail"(0)
    lt rx902_pos, -1, rx902_done
    eq rx902_pos, -1, rx902_fail
    jump $I10
  rx902_done:
    rx902_cur."!cursor_fail"()
    if_null rx902_debug, debug_761
    rx902_cur."!cursor_debug"("FAIL", "quote:sym<q>")
  debug_761:
    .return (rx902_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("217_1284728478.15265") :method
.annotate 'line', 4
    $P904 = self."!PREFIX__!subrule"("ws", "q")
    new $P905, "ResizablePMCArray"
    push $P905, $P904
    .return ($P905)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("218_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx908_tgt
    .local int rx908_pos
    .local int rx908_off
    .local int rx908_eos
    .local int rx908_rep
    .local pmc rx908_cur
    .local pmc rx908_debug
    (rx908_cur, rx908_pos, rx908_tgt, $I10) = self."!cursor_start"()
    getattribute rx908_debug, rx908_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx908_cur
    .local pmc match
    .lex "$/", match
    length rx908_eos, rx908_tgt
    gt rx908_pos, rx908_eos, rx908_done
    set rx908_off, 0
    lt rx908_pos, 2, rx908_start
    sub rx908_off, rx908_pos, 1
    substr rx908_tgt, rx908_tgt, rx908_off
  rx908_start:
    eq $I10, 1, rx908_restart
    if_null rx908_debug, debug_762
    rx908_cur."!cursor_debug"("START", "quote:sym<qq>")
  debug_762:
    $I10 = self.'from'()
    ne $I10, -1, rxscan912_done
    goto rxscan912_scan
  rxscan912_loop:
    ($P10) = rx908_cur."from"()
    inc $P10
    set rx908_pos, $P10
    ge rx908_pos, rx908_eos, rxscan912_done
  rxscan912_scan:
    set_addr $I10, rxscan912_loop
    rx908_cur."!mark_push"(0, rx908_pos, $I10)
  rxscan912_done:
.annotate 'line', 428
  # rx literal  "qq"
    add $I11, rx908_pos, 2
    gt $I11, rx908_eos, rx908_fail
    sub $I11, rx908_pos, rx908_off
    substr $S10, rx908_tgt, $I11, 2
    ne $S10, "qq", rx908_fail
    add rx908_pos, 2
  # rxanchor rwb
    le rx908_pos, 0, rx908_fail
    sub $I10, rx908_pos, rx908_off
    is_cclass $I11, 8192, rx908_tgt, $I10
    if $I11, rx908_fail
    dec $I10
    is_cclass $I11, 8192, rx908_tgt, $I10
    unless $I11, rx908_fail
  # rx enumcharlist negate=1 zerowidth
    sub $I10, rx908_pos, rx908_off
    substr $S10, rx908_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx908_fail
  # rx subrule "ws" subtype=method negate=
    rx908_cur."!cursor_pos"(rx908_pos)
    $P10 = rx908_cur."ws"()
    unless $P10, rx908_fail
    rx908_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx908_cur."!cursor_pos"(rx908_pos)
    $P10 = rx908_cur."quote_EXPR"(":qq")
    unless $P10, rx908_fail
    rx908_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx908_pos = $P10."pos"()
  # rx pass
    rx908_cur."!cursor_pass"(rx908_pos, "quote:sym<qq>")
    if_null rx908_debug, debug_763
    rx908_cur."!cursor_debug"("PASS", "quote:sym<qq>", " at pos=", rx908_pos)
  debug_763:
    .return (rx908_cur)
  rx908_restart:
.annotate 'line', 4
    if_null rx908_debug, debug_764
    rx908_cur."!cursor_debug"("NEXT", "quote:sym<qq>")
  debug_764:
  rx908_fail:
    (rx908_rep, rx908_pos, $I10, $P10) = rx908_cur."!mark_fail"(0)
    lt rx908_pos, -1, rx908_done
    eq rx908_pos, -1, rx908_fail
    jump $I10
  rx908_done:
    rx908_cur."!cursor_fail"()
    if_null rx908_debug, debug_765
    rx908_cur."!cursor_debug"("FAIL", "quote:sym<qq>")
  debug_765:
    .return (rx908_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("219_1284728478.15265") :method
.annotate 'line', 4
    $P910 = self."!PREFIX__!subrule"("ws", "qq")
    new $P911, "ResizablePMCArray"
    push $P911, $P910
    .return ($P911)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("220_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx914_tgt
    .local int rx914_pos
    .local int rx914_off
    .local int rx914_eos
    .local int rx914_rep
    .local pmc rx914_cur
    .local pmc rx914_debug
    (rx914_cur, rx914_pos, rx914_tgt, $I10) = self."!cursor_start"()
    getattribute rx914_debug, rx914_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx914_cur
    .local pmc match
    .lex "$/", match
    length rx914_eos, rx914_tgt
    gt rx914_pos, rx914_eos, rx914_done
    set rx914_off, 0
    lt rx914_pos, 2, rx914_start
    sub rx914_off, rx914_pos, 1
    substr rx914_tgt, rx914_tgt, rx914_off
  rx914_start:
    eq $I10, 1, rx914_restart
    if_null rx914_debug, debug_766
    rx914_cur."!cursor_debug"("START", "quote:sym<Q>")
  debug_766:
    $I10 = self.'from'()
    ne $I10, -1, rxscan918_done
    goto rxscan918_scan
  rxscan918_loop:
    ($P10) = rx914_cur."from"()
    inc $P10
    set rx914_pos, $P10
    ge rx914_pos, rx914_eos, rxscan918_done
  rxscan918_scan:
    set_addr $I10, rxscan918_loop
    rx914_cur."!mark_push"(0, rx914_pos, $I10)
  rxscan918_done:
.annotate 'line', 429
  # rx literal  "Q"
    add $I11, rx914_pos, 1
    gt $I11, rx914_eos, rx914_fail
    sub $I11, rx914_pos, rx914_off
    ord $I11, rx914_tgt, $I11
    ne $I11, 81, rx914_fail
    add rx914_pos, 1
  # rxanchor rwb
    le rx914_pos, 0, rx914_fail
    sub $I10, rx914_pos, rx914_off
    is_cclass $I11, 8192, rx914_tgt, $I10
    if $I11, rx914_fail
    dec $I10
    is_cclass $I11, 8192, rx914_tgt, $I10
    unless $I11, rx914_fail
  # rx enumcharlist negate=1 zerowidth
    sub $I10, rx914_pos, rx914_off
    substr $S10, rx914_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx914_fail
  # rx subrule "ws" subtype=method negate=
    rx914_cur."!cursor_pos"(rx914_pos)
    $P10 = rx914_cur."ws"()
    unless $P10, rx914_fail
    rx914_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx914_cur."!cursor_pos"(rx914_pos)
    $P10 = rx914_cur."quote_EXPR"()
    unless $P10, rx914_fail
    rx914_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx914_pos = $P10."pos"()
  # rx pass
    rx914_cur."!cursor_pass"(rx914_pos, "quote:sym<Q>")
    if_null rx914_debug, debug_767
    rx914_cur."!cursor_debug"("PASS", "quote:sym<Q>", " at pos=", rx914_pos)
  debug_767:
    .return (rx914_cur)
  rx914_restart:
.annotate 'line', 4
    if_null rx914_debug, debug_768
    rx914_cur."!cursor_debug"("NEXT", "quote:sym<Q>")
  debug_768:
  rx914_fail:
    (rx914_rep, rx914_pos, $I10, $P10) = rx914_cur."!mark_fail"(0)
    lt rx914_pos, -1, rx914_done
    eq rx914_pos, -1, rx914_fail
    jump $I10
  rx914_done:
    rx914_cur."!cursor_fail"()
    if_null rx914_debug, debug_769
    rx914_cur."!cursor_debug"("FAIL", "quote:sym<Q>")
  debug_769:
    .return (rx914_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("221_1284728478.15265") :method
.annotate 'line', 4
    $P916 = self."!PREFIX__!subrule"("ws", "Q")
    new $P917, "ResizablePMCArray"
    push $P917, $P916
    .return ($P917)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("222_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx920_tgt
    .local int rx920_pos
    .local int rx920_off
    .local int rx920_eos
    .local int rx920_rep
    .local pmc rx920_cur
    .local pmc rx920_debug
    (rx920_cur, rx920_pos, rx920_tgt, $I10) = self."!cursor_start"()
    getattribute rx920_debug, rx920_cur, "$!debug"
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
    eq $I10, 1, rx920_restart
    if_null rx920_debug, debug_770
    rx920_cur."!cursor_debug"("START", "quote:sym<Q:PIR>")
  debug_770:
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
.annotate 'line', 430
  # rx literal  "Q:PIR"
    add $I11, rx920_pos, 5
    gt $I11, rx920_eos, rx920_fail
    sub $I11, rx920_pos, rx920_off
    substr $S10, rx920_tgt, $I11, 5
    ne $S10, "Q:PIR", rx920_fail
    add rx920_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx920_cur."!cursor_pos"(rx920_pos)
    $P10 = rx920_cur."ws"()
    unless $P10, rx920_fail
    rx920_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx920_cur."!cursor_pos"(rx920_pos)
    $P10 = rx920_cur."quote_EXPR"()
    unless $P10, rx920_fail
    rx920_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx920_pos = $P10."pos"()
  # rx pass
    rx920_cur."!cursor_pass"(rx920_pos, "quote:sym<Q:PIR>")
    if_null rx920_debug, debug_771
    rx920_cur."!cursor_debug"("PASS", "quote:sym<Q:PIR>", " at pos=", rx920_pos)
  debug_771:
    .return (rx920_cur)
  rx920_restart:
.annotate 'line', 4
    if_null rx920_debug, debug_772
    rx920_cur."!cursor_debug"("NEXT", "quote:sym<Q:PIR>")
  debug_772:
  rx920_fail:
    (rx920_rep, rx920_pos, $I10, $P10) = rx920_cur."!mark_fail"(0)
    lt rx920_pos, -1, rx920_done
    eq rx920_pos, -1, rx920_fail
    jump $I10
  rx920_done:
    rx920_cur."!cursor_fail"()
    if_null rx920_debug, debug_773
    rx920_cur."!cursor_debug"("FAIL", "quote:sym<Q:PIR>")
  debug_773:
    .return (rx920_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("223_1284728478.15265") :method
.annotate 'line', 4
    $P922 = self."!PREFIX__!subrule"("ws", "Q:PIR")
    new $P923, "ResizablePMCArray"
    push $P923, $P922
    .return ($P923)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym</ />"  :subid("224_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx926_tgt
    .local int rx926_pos
    .local int rx926_off
    .local int rx926_eos
    .local int rx926_rep
    .local pmc rx926_cur
    .local pmc rx926_debug
    (rx926_cur, rx926_pos, rx926_tgt, $I10) = self."!cursor_start"()
    getattribute rx926_debug, rx926_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx926_cur
    .local pmc match
    .lex "$/", match
    length rx926_eos, rx926_tgt
    gt rx926_pos, rx926_eos, rx926_done
    set rx926_off, 0
    lt rx926_pos, 2, rx926_start
    sub rx926_off, rx926_pos, 1
    substr rx926_tgt, rx926_tgt, rx926_off
  rx926_start:
    eq $I10, 1, rx926_restart
    if_null rx926_debug, debug_774
    rx926_cur."!cursor_debug"("START", "quote:sym</ />")
  debug_774:
    $I10 = self.'from'()
    ne $I10, -1, rxscan930_done
    goto rxscan930_scan
  rxscan930_loop:
    ($P10) = rx926_cur."from"()
    inc $P10
    set rx926_pos, $P10
    ge rx926_pos, rx926_eos, rxscan930_done
  rxscan930_scan:
    set_addr $I10, rxscan930_loop
    rx926_cur."!mark_push"(0, rx926_pos, $I10)
  rxscan930_done:
.annotate 'line', 432
  # rx literal  "/"
    add $I11, rx926_pos, 1
    gt $I11, rx926_eos, rx926_fail
    sub $I11, rx926_pos, rx926_off
    ord $I11, rx926_tgt, $I11
    ne $I11, 47, rx926_fail
    add rx926_pos, 1
.annotate 'line', 433
  # rx subrule "newpad" subtype=method negate=
    rx926_cur."!cursor_pos"(rx926_pos)
    $P10 = rx926_cur."newpad"()
    unless $P10, rx926_fail
    rx926_pos = $P10."pos"()
.annotate 'line', 434
  # rx reduce name="quote:sym</ />" key="open"
    rx926_cur."!cursor_pos"(rx926_pos)
    rx926_cur."!reduce"("quote:sym</ />", "open")
.annotate 'line', 435
  # rx subrule "LANG" subtype=capture negate=
    rx926_cur."!cursor_pos"(rx926_pos)
    $P10 = rx926_cur."LANG"("Regex", "nibbler")
    unless $P10, rx926_fail
    rx926_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx926_pos = $P10."pos"()
.annotate 'line', 436
  # rx literal  "/"
    add $I11, rx926_pos, 1
    gt $I11, rx926_eos, rx926_fail
    sub $I11, rx926_pos, rx926_off
    ord $I11, rx926_tgt, $I11
    ne $I11, 47, rx926_fail
    add rx926_pos, 1
.annotate 'line', 431
  # rx pass
    rx926_cur."!cursor_pass"(rx926_pos, "quote:sym</ />")
    if_null rx926_debug, debug_775
    rx926_cur."!cursor_debug"("PASS", "quote:sym</ />", " at pos=", rx926_pos)
  debug_775:
    .return (rx926_cur)
  rx926_restart:
.annotate 'line', 4
    if_null rx926_debug, debug_776
    rx926_cur."!cursor_debug"("NEXT", "quote:sym</ />")
  debug_776:
  rx926_fail:
    (rx926_rep, rx926_pos, $I10, $P10) = rx926_cur."!mark_fail"(0)
    lt rx926_pos, -1, rx926_done
    eq rx926_pos, -1, rx926_fail
    jump $I10
  rx926_done:
    rx926_cur."!cursor_fail"()
    if_null rx926_debug, debug_777
    rx926_cur."!cursor_debug"("FAIL", "quote:sym</ />")
  debug_777:
    .return (rx926_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym</ />"  :subid("225_1284728478.15265") :method
.annotate 'line', 4
    $P928 = self."!PREFIX__!subrule"("newpad", "/")
    new $P929, "ResizablePMCArray"
    push $P929, $P928
    .return ($P929)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("226_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx932_tgt
    .local int rx932_pos
    .local int rx932_off
    .local int rx932_eos
    .local int rx932_rep
    .local pmc rx932_cur
    .local pmc rx932_debug
    (rx932_cur, rx932_pos, rx932_tgt, $I10) = self."!cursor_start"()
    getattribute rx932_debug, rx932_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx932_cur
    .local pmc match
    .lex "$/", match
    length rx932_eos, rx932_tgt
    gt rx932_pos, rx932_eos, rx932_done
    set rx932_off, 0
    lt rx932_pos, 2, rx932_start
    sub rx932_off, rx932_pos, 1
    substr rx932_tgt, rx932_tgt, rx932_off
  rx932_start:
    eq $I10, 1, rx932_restart
    if_null rx932_debug, debug_778
    rx932_cur."!cursor_debug"("START", "quote_escape:sym<$>")
  debug_778:
    $I10 = self.'from'()
    ne $I10, -1, rxscan935_done
    goto rxscan935_scan
  rxscan935_loop:
    ($P10) = rx932_cur."from"()
    inc $P10
    set rx932_pos, $P10
    ge rx932_pos, rx932_eos, rxscan935_done
  rxscan935_scan:
    set_addr $I10, rxscan935_loop
    rx932_cur."!mark_push"(0, rx932_pos, $I10)
  rxscan935_done:
.annotate 'line', 439
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx932_pos, rx932_off
    substr $S10, rx932_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx932_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx932_cur."!cursor_pos"(rx932_pos)
    $P10 = rx932_cur."quotemod_check"("s")
    unless $P10, rx932_fail
  # rx subrule "variable" subtype=capture negate=
    rx932_cur."!cursor_pos"(rx932_pos)
    $P10 = rx932_cur."variable"()
    unless $P10, rx932_fail
    rx932_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx932_pos = $P10."pos"()
  # rx pass
    rx932_cur."!cursor_pass"(rx932_pos, "quote_escape:sym<$>")
    if_null rx932_debug, debug_779
    rx932_cur."!cursor_debug"("PASS", "quote_escape:sym<$>", " at pos=", rx932_pos)
  debug_779:
    .return (rx932_cur)
  rx932_restart:
.annotate 'line', 4
    if_null rx932_debug, debug_780
    rx932_cur."!cursor_debug"("NEXT", "quote_escape:sym<$>")
  debug_780:
  rx932_fail:
    (rx932_rep, rx932_pos, $I10, $P10) = rx932_cur."!mark_fail"(0)
    lt rx932_pos, -1, rx932_done
    eq rx932_pos, -1, rx932_fail
    jump $I10
  rx932_done:
    rx932_cur."!cursor_fail"()
    if_null rx932_debug, debug_781
    rx932_cur."!cursor_debug"("FAIL", "quote_escape:sym<$>")
  debug_781:
    .return (rx932_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("227_1284728478.15265") :method
.annotate 'line', 4
    new $P934, "ResizablePMCArray"
    push $P934, "$"
    .return ($P934)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("228_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx937_tgt
    .local int rx937_pos
    .local int rx937_off
    .local int rx937_eos
    .local int rx937_rep
    .local pmc rx937_cur
    .local pmc rx937_debug
    (rx937_cur, rx937_pos, rx937_tgt, $I10) = self."!cursor_start"()
    getattribute rx937_debug, rx937_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx937_cur
    .local pmc match
    .lex "$/", match
    length rx937_eos, rx937_tgt
    gt rx937_pos, rx937_eos, rx937_done
    set rx937_off, 0
    lt rx937_pos, 2, rx937_start
    sub rx937_off, rx937_pos, 1
    substr rx937_tgt, rx937_tgt, rx937_off
  rx937_start:
    eq $I10, 1, rx937_restart
    if_null rx937_debug, debug_782
    rx937_cur."!cursor_debug"("START", "quote_escape:sym<{ }>")
  debug_782:
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
.annotate 'line', 440
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx937_pos, rx937_off
    substr $S10, rx937_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx937_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx937_cur."!cursor_pos"(rx937_pos)
    $P10 = rx937_cur."quotemod_check"("c")
    unless $P10, rx937_fail
  # rx subrule "block" subtype=capture negate=
    rx937_cur."!cursor_pos"(rx937_pos)
    $P10 = rx937_cur."block"()
    unless $P10, rx937_fail
    rx937_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx937_pos = $P10."pos"()
  # rx pass
    rx937_cur."!cursor_pass"(rx937_pos, "quote_escape:sym<{ }>")
    if_null rx937_debug, debug_783
    rx937_cur."!cursor_debug"("PASS", "quote_escape:sym<{ }>", " at pos=", rx937_pos)
  debug_783:
    .return (rx937_cur)
  rx937_restart:
.annotate 'line', 4
    if_null rx937_debug, debug_784
    rx937_cur."!cursor_debug"("NEXT", "quote_escape:sym<{ }>")
  debug_784:
  rx937_fail:
    (rx937_rep, rx937_pos, $I10, $P10) = rx937_cur."!mark_fail"(0)
    lt rx937_pos, -1, rx937_done
    eq rx937_pos, -1, rx937_fail
    jump $I10
  rx937_done:
    rx937_cur."!cursor_fail"()
    if_null rx937_debug, debug_785
    rx937_cur."!cursor_debug"("FAIL", "quote_escape:sym<{ }>")
  debug_785:
    .return (rx937_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("229_1284728478.15265") :method
.annotate 'line', 4
    new $P939, "ResizablePMCArray"
    push $P939, "{"
    .return ($P939)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<esc>"  :subid("230_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx942_tgt
    .local int rx942_pos
    .local int rx942_off
    .local int rx942_eos
    .local int rx942_rep
    .local pmc rx942_cur
    .local pmc rx942_debug
    (rx942_cur, rx942_pos, rx942_tgt, $I10) = self."!cursor_start"()
    getattribute rx942_debug, rx942_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx942_cur
    .local pmc match
    .lex "$/", match
    length rx942_eos, rx942_tgt
    gt rx942_pos, rx942_eos, rx942_done
    set rx942_off, 0
    lt rx942_pos, 2, rx942_start
    sub rx942_off, rx942_pos, 1
    substr rx942_tgt, rx942_tgt, rx942_off
  rx942_start:
    eq $I10, 1, rx942_restart
    if_null rx942_debug, debug_786
    rx942_cur."!cursor_debug"("START", "quote_escape:sym<esc>")
  debug_786:
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
.annotate 'line', 441
  # rx literal  "\\e"
    add $I11, rx942_pos, 2
    gt $I11, rx942_eos, rx942_fail
    sub $I11, rx942_pos, rx942_off
    substr $S10, rx942_tgt, $I11, 2
    ne $S10, "\\e", rx942_fail
    add rx942_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx942_cur."!cursor_pos"(rx942_pos)
    $P10 = rx942_cur."quotemod_check"("b")
    unless $P10, rx942_fail
  # rx pass
    rx942_cur."!cursor_pass"(rx942_pos, "quote_escape:sym<esc>")
    if_null rx942_debug, debug_787
    rx942_cur."!cursor_debug"("PASS", "quote_escape:sym<esc>", " at pos=", rx942_pos)
  debug_787:
    .return (rx942_cur)
  rx942_restart:
.annotate 'line', 4
    if_null rx942_debug, debug_788
    rx942_cur."!cursor_debug"("NEXT", "quote_escape:sym<esc>")
  debug_788:
  rx942_fail:
    (rx942_rep, rx942_pos, $I10, $P10) = rx942_cur."!mark_fail"(0)
    lt rx942_pos, -1, rx942_done
    eq rx942_pos, -1, rx942_fail
    jump $I10
  rx942_done:
    rx942_cur."!cursor_fail"()
    if_null rx942_debug, debug_789
    rx942_cur."!cursor_debug"("FAIL", "quote_escape:sym<esc>")
  debug_789:
    .return (rx942_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<esc>"  :subid("231_1284728478.15265") :method
.annotate 'line', 4
    new $P944, "ResizablePMCArray"
    push $P944, "\\e"
    .return ($P944)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("232_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx947_tgt
    .local int rx947_pos
    .local int rx947_off
    .local int rx947_eos
    .local int rx947_rep
    .local pmc rx947_cur
    .local pmc rx947_debug
    (rx947_cur, rx947_pos, rx947_tgt, $I10) = self."!cursor_start"()
    rx947_cur."!cursor_caparray"("EXPR")
    getattribute rx947_debug, rx947_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx947_cur
    .local pmc match
    .lex "$/", match
    length rx947_eos, rx947_tgt
    gt rx947_pos, rx947_eos, rx947_done
    set rx947_off, 0
    lt rx947_pos, 2, rx947_start
    sub rx947_off, rx947_pos, 1
    substr rx947_tgt, rx947_tgt, rx947_off
  rx947_start:
    eq $I10, 1, rx947_restart
    if_null rx947_debug, debug_790
    rx947_cur."!cursor_debug"("START", "circumfix:sym<( )>")
  debug_790:
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
.annotate 'line', 443
  # rx literal  "("
    add $I11, rx947_pos, 1
    gt $I11, rx947_eos, rx947_fail
    sub $I11, rx947_pos, rx947_off
    ord $I11, rx947_tgt, $I11
    ne $I11, 40, rx947_fail
    add rx947_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx947_cur."!cursor_pos"(rx947_pos)
    $P10 = rx947_cur."ws"()
    unless $P10, rx947_fail
    rx947_pos = $P10."pos"()
  # rx rxquantr952 ** 0..1
    set_addr $I10, rxquantr952_done
    rx947_cur."!mark_push"(0, rx947_pos, $I10)
  rxquantr952_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx947_cur."!cursor_pos"(rx947_pos)
    $P10 = rx947_cur."EXPR"()
    unless $P10, rx947_fail
    goto rxsubrule953_pass
  rxsubrule953_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx947_fail
  rxsubrule953_pass:
    set_addr $I10, rxsubrule953_back
    rx947_cur."!mark_push"(0, rx947_pos, $I10, $P10)
    $P10."!cursor_names"("EXPR")
    rx947_pos = $P10."pos"()
    set_addr $I10, rxquantr952_done
    (rx947_rep) = rx947_cur."!mark_commit"($I10)
  rxquantr952_done:
  # rx literal  ")"
    add $I11, rx947_pos, 1
    gt $I11, rx947_eos, rx947_fail
    sub $I11, rx947_pos, rx947_off
    ord $I11, rx947_tgt, $I11
    ne $I11, 41, rx947_fail
    add rx947_pos, 1
  # rx pass
    rx947_cur."!cursor_pass"(rx947_pos, "circumfix:sym<( )>")
    if_null rx947_debug, debug_791
    rx947_cur."!cursor_debug"("PASS", "circumfix:sym<( )>", " at pos=", rx947_pos)
  debug_791:
    .return (rx947_cur)
  rx947_restart:
.annotate 'line', 4
    if_null rx947_debug, debug_792
    rx947_cur."!cursor_debug"("NEXT", "circumfix:sym<( )>")
  debug_792:
  rx947_fail:
    (rx947_rep, rx947_pos, $I10, $P10) = rx947_cur."!mark_fail"(0)
    lt rx947_pos, -1, rx947_done
    eq rx947_pos, -1, rx947_fail
    jump $I10
  rx947_done:
    rx947_cur."!cursor_fail"()
    if_null rx947_debug, debug_793
    rx947_cur."!cursor_debug"("FAIL", "circumfix:sym<( )>")
  debug_793:
    .return (rx947_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("233_1284728478.15265") :method
.annotate 'line', 4
    $P949 = self."!PREFIX__!subrule"("ws", "(")
    new $P950, "ResizablePMCArray"
    push $P950, $P949
    .return ($P950)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("234_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx955_tgt
    .local int rx955_pos
    .local int rx955_off
    .local int rx955_eos
    .local int rx955_rep
    .local pmc rx955_cur
    .local pmc rx955_debug
    (rx955_cur, rx955_pos, rx955_tgt, $I10) = self."!cursor_start"()
    rx955_cur."!cursor_caparray"("EXPR")
    getattribute rx955_debug, rx955_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx955_cur
    .local pmc match
    .lex "$/", match
    length rx955_eos, rx955_tgt
    gt rx955_pos, rx955_eos, rx955_done
    set rx955_off, 0
    lt rx955_pos, 2, rx955_start
    sub rx955_off, rx955_pos, 1
    substr rx955_tgt, rx955_tgt, rx955_off
  rx955_start:
    eq $I10, 1, rx955_restart
    if_null rx955_debug, debug_794
    rx955_cur."!cursor_debug"("START", "circumfix:sym<[ ]>")
  debug_794:
    $I10 = self.'from'()
    ne $I10, -1, rxscan959_done
    goto rxscan959_scan
  rxscan959_loop:
    ($P10) = rx955_cur."from"()
    inc $P10
    set rx955_pos, $P10
    ge rx955_pos, rx955_eos, rxscan959_done
  rxscan959_scan:
    set_addr $I10, rxscan959_loop
    rx955_cur."!mark_push"(0, rx955_pos, $I10)
  rxscan959_done:
.annotate 'line', 444
  # rx literal  "["
    add $I11, rx955_pos, 1
    gt $I11, rx955_eos, rx955_fail
    sub $I11, rx955_pos, rx955_off
    ord $I11, rx955_tgt, $I11
    ne $I11, 91, rx955_fail
    add rx955_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx955_cur."!cursor_pos"(rx955_pos)
    $P10 = rx955_cur."ws"()
    unless $P10, rx955_fail
    rx955_pos = $P10."pos"()
  # rx rxquantr960 ** 0..1
    set_addr $I10, rxquantr960_done
    rx955_cur."!mark_push"(0, rx955_pos, $I10)
  rxquantr960_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx955_cur."!cursor_pos"(rx955_pos)
    $P10 = rx955_cur."EXPR"()
    unless $P10, rx955_fail
    goto rxsubrule961_pass
  rxsubrule961_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx955_fail
  rxsubrule961_pass:
    set_addr $I10, rxsubrule961_back
    rx955_cur."!mark_push"(0, rx955_pos, $I10, $P10)
    $P10."!cursor_names"("EXPR")
    rx955_pos = $P10."pos"()
    set_addr $I10, rxquantr960_done
    (rx955_rep) = rx955_cur."!mark_commit"($I10)
  rxquantr960_done:
  # rx literal  "]"
    add $I11, rx955_pos, 1
    gt $I11, rx955_eos, rx955_fail
    sub $I11, rx955_pos, rx955_off
    ord $I11, rx955_tgt, $I11
    ne $I11, 93, rx955_fail
    add rx955_pos, 1
  # rx pass
    rx955_cur."!cursor_pass"(rx955_pos, "circumfix:sym<[ ]>")
    if_null rx955_debug, debug_795
    rx955_cur."!cursor_debug"("PASS", "circumfix:sym<[ ]>", " at pos=", rx955_pos)
  debug_795:
    .return (rx955_cur)
  rx955_restart:
.annotate 'line', 4
    if_null rx955_debug, debug_796
    rx955_cur."!cursor_debug"("NEXT", "circumfix:sym<[ ]>")
  debug_796:
  rx955_fail:
    (rx955_rep, rx955_pos, $I10, $P10) = rx955_cur."!mark_fail"(0)
    lt rx955_pos, -1, rx955_done
    eq rx955_pos, -1, rx955_fail
    jump $I10
  rx955_done:
    rx955_cur."!cursor_fail"()
    if_null rx955_debug, debug_797
    rx955_cur."!cursor_debug"("FAIL", "circumfix:sym<[ ]>")
  debug_797:
    .return (rx955_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("235_1284728478.15265") :method
.annotate 'line', 4
    $P957 = self."!PREFIX__!subrule"("ws", "[")
    new $P958, "ResizablePMCArray"
    push $P958, $P957
    .return ($P958)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("236_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx963_tgt
    .local int rx963_pos
    .local int rx963_off
    .local int rx963_eos
    .local int rx963_rep
    .local pmc rx963_cur
    .local pmc rx963_debug
    (rx963_cur, rx963_pos, rx963_tgt, $I10) = self."!cursor_start"()
    getattribute rx963_debug, rx963_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx963_cur
    .local pmc match
    .lex "$/", match
    length rx963_eos, rx963_tgt
    gt rx963_pos, rx963_eos, rx963_done
    set rx963_off, 0
    lt rx963_pos, 2, rx963_start
    sub rx963_off, rx963_pos, 1
    substr rx963_tgt, rx963_tgt, rx963_off
  rx963_start:
    eq $I10, 1, rx963_restart
    if_null rx963_debug, debug_798
    rx963_cur."!cursor_debug"("START", "circumfix:sym<ang>")
  debug_798:
    $I10 = self.'from'()
    ne $I10, -1, rxscan966_done
    goto rxscan966_scan
  rxscan966_loop:
    ($P10) = rx963_cur."from"()
    inc $P10
    set rx963_pos, $P10
    ge rx963_pos, rx963_eos, rxscan966_done
  rxscan966_scan:
    set_addr $I10, rxscan966_loop
    rx963_cur."!mark_push"(0, rx963_pos, $I10)
  rxscan966_done:
.annotate 'line', 445
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx963_pos, rx963_off
    substr $S10, rx963_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx963_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx963_cur."!cursor_pos"(rx963_pos)
    $P10 = rx963_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx963_fail
    rx963_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx963_pos = $P10."pos"()
  # rx pass
    rx963_cur."!cursor_pass"(rx963_pos, "circumfix:sym<ang>")
    if_null rx963_debug, debug_799
    rx963_cur."!cursor_debug"("PASS", "circumfix:sym<ang>", " at pos=", rx963_pos)
  debug_799:
    .return (rx963_cur)
  rx963_restart:
.annotate 'line', 4
    if_null rx963_debug, debug_800
    rx963_cur."!cursor_debug"("NEXT", "circumfix:sym<ang>")
  debug_800:
  rx963_fail:
    (rx963_rep, rx963_pos, $I10, $P10) = rx963_cur."!mark_fail"(0)
    lt rx963_pos, -1, rx963_done
    eq rx963_pos, -1, rx963_fail
    jump $I10
  rx963_done:
    rx963_cur."!cursor_fail"()
    if_null rx963_debug, debug_801
    rx963_cur."!cursor_debug"("FAIL", "circumfix:sym<ang>")
  debug_801:
    .return (rx963_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("237_1284728478.15265") :method
.annotate 'line', 4
    new $P965, "ResizablePMCArray"
    push $P965, "<"
    .return ($P965)
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("238_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx968_tgt
    .local int rx968_pos
    .local int rx968_off
    .local int rx968_eos
    .local int rx968_rep
    .local pmc rx968_cur
    .local pmc rx968_debug
    (rx968_cur, rx968_pos, rx968_tgt, $I10) = self."!cursor_start"()
    getattribute rx968_debug, rx968_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx968_cur
    .local pmc match
    .lex "$/", match
    length rx968_eos, rx968_tgt
    gt rx968_pos, rx968_eos, rx968_done
    set rx968_off, 0
    lt rx968_pos, 2, rx968_start
    sub rx968_off, rx968_pos, 1
    substr rx968_tgt, rx968_tgt, rx968_off
  rx968_start:
    eq $I10, 1, rx968_restart
    if_null rx968_debug, debug_802
    rx968_cur."!cursor_debug"("START", unicode:"circumfix:sym<\x{ab} \x{bb}>")
  debug_802:
    $I10 = self.'from'()
    ne $I10, -1, rxscan971_done
    goto rxscan971_scan
  rxscan971_loop:
    ($P10) = rx968_cur."from"()
    inc $P10
    set rx968_pos, $P10
    ge rx968_pos, rx968_eos, rxscan971_done
  rxscan971_scan:
    set_addr $I10, rxscan971_loop
    rx968_cur."!mark_push"(0, rx968_pos, $I10)
  rxscan971_done:
.annotate 'line', 446
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx968_pos, rx968_off
    substr $S10, rx968_tgt, $I10, 1
    index $I11, unicode:"\x{ab}", $S10
    lt $I11, 0, rx968_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx968_cur."!cursor_pos"(rx968_pos)
    $P10 = rx968_cur."quote_EXPR"(":qq", ":w")
    unless $P10, rx968_fail
    rx968_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx968_pos = $P10."pos"()
  # rx pass
    rx968_cur."!cursor_pass"(rx968_pos, unicode:"circumfix:sym<\x{ab} \x{bb}>")
    if_null rx968_debug, debug_803
    rx968_cur."!cursor_debug"("PASS", unicode:"circumfix:sym<\x{ab} \x{bb}>", " at pos=", rx968_pos)
  debug_803:
    .return (rx968_cur)
  rx968_restart:
.annotate 'line', 4
    if_null rx968_debug, debug_804
    rx968_cur."!cursor_debug"("NEXT", unicode:"circumfix:sym<\x{ab} \x{bb}>")
  debug_804:
  rx968_fail:
    (rx968_rep, rx968_pos, $I10, $P10) = rx968_cur."!mark_fail"(0)
    lt rx968_pos, -1, rx968_done
    eq rx968_pos, -1, rx968_fail
    jump $I10
  rx968_done:
    rx968_cur."!cursor_fail"()
    if_null rx968_debug, debug_805
    rx968_cur."!cursor_debug"("FAIL", unicode:"circumfix:sym<\x{ab} \x{bb}>")
  debug_805:
    .return (rx968_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"!PREFIX__circumfix:sym<\x{ab} \x{bb}>"  :subid("239_1284728478.15265") :method
.annotate 'line', 4
    new $P970, "ResizablePMCArray"
    push $P970, unicode:"\x{ab}"
    .return ($P970)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("240_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx973_tgt
    .local int rx973_pos
    .local int rx973_off
    .local int rx973_eos
    .local int rx973_rep
    .local pmc rx973_cur
    .local pmc rx973_debug
    (rx973_cur, rx973_pos, rx973_tgt, $I10) = self."!cursor_start"()
    getattribute rx973_debug, rx973_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx973_cur
    .local pmc match
    .lex "$/", match
    length rx973_eos, rx973_tgt
    gt rx973_pos, rx973_eos, rx973_done
    set rx973_off, 0
    lt rx973_pos, 2, rx973_start
    sub rx973_off, rx973_pos, 1
    substr rx973_tgt, rx973_tgt, rx973_off
  rx973_start:
    eq $I10, 1, rx973_restart
    if_null rx973_debug, debug_806
    rx973_cur."!cursor_debug"("START", "circumfix:sym<{ }>")
  debug_806:
    $I10 = self.'from'()
    ne $I10, -1, rxscan976_done
    goto rxscan976_scan
  rxscan976_loop:
    ($P10) = rx973_cur."from"()
    inc $P10
    set rx973_pos, $P10
    ge rx973_pos, rx973_eos, rxscan976_done
  rxscan976_scan:
    set_addr $I10, rxscan976_loop
    rx973_cur."!mark_push"(0, rx973_pos, $I10)
  rxscan976_done:
.annotate 'line', 447
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx973_pos, rx973_off
    substr $S10, rx973_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx973_fail
  # rx subrule "pblock" subtype=capture negate=
    rx973_cur."!cursor_pos"(rx973_pos)
    $P10 = rx973_cur."pblock"()
    unless $P10, rx973_fail
    rx973_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx973_pos = $P10."pos"()
  # rx pass
    rx973_cur."!cursor_pass"(rx973_pos, "circumfix:sym<{ }>")
    if_null rx973_debug, debug_807
    rx973_cur."!cursor_debug"("PASS", "circumfix:sym<{ }>", " at pos=", rx973_pos)
  debug_807:
    .return (rx973_cur)
  rx973_restart:
.annotate 'line', 4
    if_null rx973_debug, debug_808
    rx973_cur."!cursor_debug"("NEXT", "circumfix:sym<{ }>")
  debug_808:
  rx973_fail:
    (rx973_rep, rx973_pos, $I10, $P10) = rx973_cur."!mark_fail"(0)
    lt rx973_pos, -1, rx973_done
    eq rx973_pos, -1, rx973_fail
    jump $I10
  rx973_done:
    rx973_cur."!cursor_fail"()
    if_null rx973_debug, debug_809
    rx973_cur."!cursor_debug"("FAIL", "circumfix:sym<{ }>")
  debug_809:
    .return (rx973_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("241_1284728478.15265") :method
.annotate 'line', 4
    new $P975, "ResizablePMCArray"
    push $P975, "{"
    .return ($P975)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("242_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx978_tgt
    .local int rx978_pos
    .local int rx978_off
    .local int rx978_eos
    .local int rx978_rep
    .local pmc rx978_cur
    .local pmc rx978_debug
    (rx978_cur, rx978_pos, rx978_tgt, $I10) = self."!cursor_start"()
    getattribute rx978_debug, rx978_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx978_cur
    .local pmc match
    .lex "$/", match
    length rx978_eos, rx978_tgt
    gt rx978_pos, rx978_eos, rx978_done
    set rx978_off, 0
    lt rx978_pos, 2, rx978_start
    sub rx978_off, rx978_pos, 1
    substr rx978_tgt, rx978_tgt, rx978_off
  rx978_start:
    eq $I10, 1, rx978_restart
    if_null rx978_debug, debug_810
    rx978_cur."!cursor_debug"("START", "circumfix:sym<sigil>")
  debug_810:
    $I10 = self.'from'()
    ne $I10, -1, rxscan982_done
    goto rxscan982_scan
  rxscan982_loop:
    ($P10) = rx978_cur."from"()
    inc $P10
    set rx978_pos, $P10
    ge rx978_pos, rx978_eos, rxscan982_done
  rxscan982_scan:
    set_addr $I10, rxscan982_loop
    rx978_cur."!mark_push"(0, rx978_pos, $I10)
  rxscan982_done:
.annotate 'line', 448
  # rx subrule "sigil" subtype=capture negate=
    rx978_cur."!cursor_pos"(rx978_pos)
    $P10 = rx978_cur."sigil"()
    unless $P10, rx978_fail
    rx978_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx978_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx978_pos, 1
    gt $I11, rx978_eos, rx978_fail
    sub $I11, rx978_pos, rx978_off
    ord $I11, rx978_tgt, $I11
    ne $I11, 40, rx978_fail
    add rx978_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx978_cur."!cursor_pos"(rx978_pos)
    $P10 = rx978_cur."semilist"()
    unless $P10, rx978_fail
    rx978_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx978_pos = $P10."pos"()
  alt983_0:
    set_addr $I10, alt983_1
    rx978_cur."!mark_push"(0, rx978_pos, $I10)
  # rx literal  ")"
    add $I11, rx978_pos, 1
    gt $I11, rx978_eos, rx978_fail
    sub $I11, rx978_pos, rx978_off
    ord $I11, rx978_tgt, $I11
    ne $I11, 41, rx978_fail
    add rx978_pos, 1
    goto alt983_end
  alt983_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx978_cur."!cursor_pos"(rx978_pos)
    $P10 = rx978_cur."FAILGOAL"("')'")
    unless $P10, rx978_fail
    goto rxsubrule985_pass
  rxsubrule985_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx978_fail
  rxsubrule985_pass:
    set_addr $I10, rxsubrule985_back
    rx978_cur."!mark_push"(0, rx978_pos, $I10, $P10)
    rx978_pos = $P10."pos"()
  alt983_end:
  # rx pass
    rx978_cur."!cursor_pass"(rx978_pos, "circumfix:sym<sigil>")
    if_null rx978_debug, debug_811
    rx978_cur."!cursor_debug"("PASS", "circumfix:sym<sigil>", " at pos=", rx978_pos)
  debug_811:
    .return (rx978_cur)
  rx978_restart:
.annotate 'line', 4
    if_null rx978_debug, debug_812
    rx978_cur."!cursor_debug"("NEXT", "circumfix:sym<sigil>")
  debug_812:
  rx978_fail:
    (rx978_rep, rx978_pos, $I10, $P10) = rx978_cur."!mark_fail"(0)
    lt rx978_pos, -1, rx978_done
    eq rx978_pos, -1, rx978_fail
    jump $I10
  rx978_done:
    rx978_cur."!cursor_fail"()
    if_null rx978_debug, debug_813
    rx978_cur."!cursor_debug"("FAIL", "circumfix:sym<sigil>")
  debug_813:
    .return (rx978_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("243_1284728478.15265") :method
.annotate 'line', 4
    $P980 = self."!PREFIX__!subrule"("sigil", "")
    new $P981, "ResizablePMCArray"
    push $P981, $P980
    .return ($P981)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("244_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 4
    .local string rx987_tgt
    .local int rx987_pos
    .local int rx987_off
    .local int rx987_eos
    .local int rx987_rep
    .local pmc rx987_cur
    .local pmc rx987_debug
    (rx987_cur, rx987_pos, rx987_tgt, $I10) = self."!cursor_start"()
    getattribute rx987_debug, rx987_cur, "$!debug"
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
    eq $I10, 1, rx987_restart
    if_null rx987_debug, debug_814
    rx987_cur."!cursor_debug"("START", "semilist")
  debug_814:
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
.annotate 'line', 450
  # rx subrule "ws" subtype=method negate=
    rx987_cur."!cursor_pos"(rx987_pos)
    $P10 = rx987_cur."ws"()
    unless $P10, rx987_fail
    rx987_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx987_cur."!cursor_pos"(rx987_pos)
    $P10 = rx987_cur."statement"()
    unless $P10, rx987_fail
    rx987_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx987_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx987_cur."!cursor_pos"(rx987_pos)
    $P10 = rx987_cur."ws"()
    unless $P10, rx987_fail
    rx987_pos = $P10."pos"()
  # rx pass
    rx987_cur."!cursor_pass"(rx987_pos, "semilist")
    if_null rx987_debug, debug_815
    rx987_cur."!cursor_debug"("PASS", "semilist", " at pos=", rx987_pos)
  debug_815:
    .return (rx987_cur)
  rx987_restart:
.annotate 'line', 4
    if_null rx987_debug, debug_816
    rx987_cur."!cursor_debug"("NEXT", "semilist")
  debug_816:
  rx987_fail:
    (rx987_rep, rx987_pos, $I10, $P10) = rx987_cur."!mark_fail"(0)
    lt rx987_pos, -1, rx987_done
    eq rx987_pos, -1, rx987_fail
    jump $I10
  rx987_done:
    rx987_cur."!cursor_fail"()
    if_null rx987_debug, debug_817
    rx987_cur."!cursor_debug"("FAIL", "semilist")
  debug_817:
    .return (rx987_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("245_1284728478.15265") :method
.annotate 'line', 4
    $P989 = self."!PREFIX__!subrule"("ws", "")
    new $P990, "ResizablePMCArray"
    push $P990, $P989
    .return ($P990)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("246_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx995_tgt
    .local int rx995_pos
    .local int rx995_off
    .local int rx995_eos
    .local int rx995_rep
    .local pmc rx995_cur
    .local pmc rx995_debug
    (rx995_cur, rx995_pos, rx995_tgt, $I10) = self."!cursor_start"()
    getattribute rx995_debug, rx995_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx995_cur
    .local pmc match
    .lex "$/", match
    length rx995_eos, rx995_tgt
    gt rx995_pos, rx995_eos, rx995_done
    set rx995_off, 0
    lt rx995_pos, 2, rx995_start
    sub rx995_off, rx995_pos, 1
    substr rx995_tgt, rx995_tgt, rx995_off
  rx995_start:
    eq $I10, 1, rx995_restart
    if_null rx995_debug, debug_818
    rx995_cur."!cursor_debug"("START", "infixish")
  debug_818:
    $I10 = self.'from'()
    ne $I10, -1, rxscan998_done
    goto rxscan998_scan
  rxscan998_loop:
    ($P10) = rx995_cur."from"()
    inc $P10
    set rx995_pos, $P10
    ge rx995_pos, rx995_eos, rxscan998_done
  rxscan998_scan:
    set_addr $I10, rxscan998_loop
    rx995_cur."!mark_push"(0, rx995_pos, $I10)
  rxscan998_done:
.annotate 'line', 473
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx995_cur."!cursor_pos"(rx995_pos)
    $P10 = rx995_cur."infixstopper"()
    if $P10, rx995_fail
  # rx subrule "infix" subtype=capture negate=
    rx995_cur."!cursor_pos"(rx995_pos)
    $P10 = rx995_cur."infix"()
    unless $P10, rx995_fail
    rx995_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx995_pos = $P10."pos"()
  # rx pass
    rx995_cur."!cursor_pass"(rx995_pos, "infixish")
    if_null rx995_debug, debug_819
    rx995_cur."!cursor_debug"("PASS", "infixish", " at pos=", rx995_pos)
  debug_819:
    .return (rx995_cur)
  rx995_restart:
.annotate 'line', 454
    if_null rx995_debug, debug_820
    rx995_cur."!cursor_debug"("NEXT", "infixish")
  debug_820:
  rx995_fail:
    (rx995_rep, rx995_pos, $I10, $P10) = rx995_cur."!mark_fail"(0)
    lt rx995_pos, -1, rx995_done
    eq rx995_pos, -1, rx995_fail
    jump $I10
  rx995_done:
    rx995_cur."!cursor_fail"()
    if_null rx995_debug, debug_821
    rx995_cur."!cursor_debug"("FAIL", "infixish")
  debug_821:
    .return (rx995_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("247_1284728478.15265") :method
.annotate 'line', 454
    new $P997, "ResizablePMCArray"
    push $P997, ""
    .return ($P997)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("248_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1000_tgt
    .local int rx1000_pos
    .local int rx1000_off
    .local int rx1000_eos
    .local int rx1000_rep
    .local pmc rx1000_cur
    .local pmc rx1000_debug
    (rx1000_cur, rx1000_pos, rx1000_tgt, $I10) = self."!cursor_start"()
    getattribute rx1000_debug, rx1000_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1000_cur
    .local pmc match
    .lex "$/", match
    length rx1000_eos, rx1000_tgt
    gt rx1000_pos, rx1000_eos, rx1000_done
    set rx1000_off, 0
    lt rx1000_pos, 2, rx1000_start
    sub rx1000_off, rx1000_pos, 1
    substr rx1000_tgt, rx1000_tgt, rx1000_off
  rx1000_start:
    eq $I10, 1, rx1000_restart
    if_null rx1000_debug, debug_822
    rx1000_cur."!cursor_debug"("START", "infixstopper")
  debug_822:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1003_done
    goto rxscan1003_scan
  rxscan1003_loop:
    ($P10) = rx1000_cur."from"()
    inc $P10
    set rx1000_pos, $P10
    ge rx1000_pos, rx1000_eos, rxscan1003_done
  rxscan1003_scan:
    set_addr $I10, rxscan1003_loop
    rx1000_cur."!mark_push"(0, rx1000_pos, $I10)
  rxscan1003_done:
.annotate 'line', 474
  # rx subrule "lambda" subtype=zerowidth negate=
    rx1000_cur."!cursor_pos"(rx1000_pos)
    $P10 = rx1000_cur."lambda"()
    unless $P10, rx1000_fail
  # rx pass
    rx1000_cur."!cursor_pass"(rx1000_pos, "infixstopper")
    if_null rx1000_debug, debug_823
    rx1000_cur."!cursor_debug"("PASS", "infixstopper", " at pos=", rx1000_pos)
  debug_823:
    .return (rx1000_cur)
  rx1000_restart:
.annotate 'line', 454
    if_null rx1000_debug, debug_824
    rx1000_cur."!cursor_debug"("NEXT", "infixstopper")
  debug_824:
  rx1000_fail:
    (rx1000_rep, rx1000_pos, $I10, $P10) = rx1000_cur."!mark_fail"(0)
    lt rx1000_pos, -1, rx1000_done
    eq rx1000_pos, -1, rx1000_fail
    jump $I10
  rx1000_done:
    rx1000_cur."!cursor_fail"()
    if_null rx1000_debug, debug_825
    rx1000_cur."!cursor_debug"("FAIL", "infixstopper")
  debug_825:
    .return (rx1000_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("249_1284728478.15265") :method
.annotate 'line', 454
    new $P1002, "ResizablePMCArray"
    push $P1002, ""
    .return ($P1002)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("250_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1005_tgt
    .local int rx1005_pos
    .local int rx1005_off
    .local int rx1005_eos
    .local int rx1005_rep
    .local pmc rx1005_cur
    .local pmc rx1005_debug
    (rx1005_cur, rx1005_pos, rx1005_tgt, $I10) = self."!cursor_start"()
    getattribute rx1005_debug, rx1005_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1005_cur
    .local pmc match
    .lex "$/", match
    length rx1005_eos, rx1005_tgt
    gt rx1005_pos, rx1005_eos, rx1005_done
    set rx1005_off, 0
    lt rx1005_pos, 2, rx1005_start
    sub rx1005_off, rx1005_pos, 1
    substr rx1005_tgt, rx1005_tgt, rx1005_off
  rx1005_start:
    eq $I10, 1, rx1005_restart
    if_null rx1005_debug, debug_826
    rx1005_cur."!cursor_debug"("START", "postcircumfix:sym<[ ]>")
  debug_826:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1009_done
    goto rxscan1009_scan
  rxscan1009_loop:
    ($P10) = rx1005_cur."from"()
    inc $P10
    set rx1005_pos, $P10
    ge rx1005_pos, rx1005_eos, rxscan1009_done
  rxscan1009_scan:
    set_addr $I10, rxscan1009_loop
    rx1005_cur."!mark_push"(0, rx1005_pos, $I10)
  rxscan1009_done:
.annotate 'line', 477
  # rx literal  "["
    add $I11, rx1005_pos, 1
    gt $I11, rx1005_eos, rx1005_fail
    sub $I11, rx1005_pos, rx1005_off
    ord $I11, rx1005_tgt, $I11
    ne $I11, 91, rx1005_fail
    add rx1005_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1005_cur."!cursor_pos"(rx1005_pos)
    $P10 = rx1005_cur."ws"()
    unless $P10, rx1005_fail
    rx1005_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx1005_cur."!cursor_pos"(rx1005_pos)
    $P10 = rx1005_cur."EXPR"()
    unless $P10, rx1005_fail
    rx1005_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1005_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx1005_pos, 1
    gt $I11, rx1005_eos, rx1005_fail
    sub $I11, rx1005_pos, rx1005_off
    ord $I11, rx1005_tgt, $I11
    ne $I11, 93, rx1005_fail
    add rx1005_pos, 1
.annotate 'line', 478
  # rx subrule "O" subtype=capture negate=
    rx1005_cur."!cursor_pos"(rx1005_pos)
    $P10 = rx1005_cur."O"("%methodop")
    unless $P10, rx1005_fail
    rx1005_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1005_pos = $P10."pos"()
.annotate 'line', 476
  # rx pass
    rx1005_cur."!cursor_pass"(rx1005_pos, "postcircumfix:sym<[ ]>")
    if_null rx1005_debug, debug_827
    rx1005_cur."!cursor_debug"("PASS", "postcircumfix:sym<[ ]>", " at pos=", rx1005_pos)
  debug_827:
    .return (rx1005_cur)
  rx1005_restart:
.annotate 'line', 454
    if_null rx1005_debug, debug_828
    rx1005_cur."!cursor_debug"("NEXT", "postcircumfix:sym<[ ]>")
  debug_828:
  rx1005_fail:
    (rx1005_rep, rx1005_pos, $I10, $P10) = rx1005_cur."!mark_fail"(0)
    lt rx1005_pos, -1, rx1005_done
    eq rx1005_pos, -1, rx1005_fail
    jump $I10
  rx1005_done:
    rx1005_cur."!cursor_fail"()
    if_null rx1005_debug, debug_829
    rx1005_cur."!cursor_debug"("FAIL", "postcircumfix:sym<[ ]>")
  debug_829:
    .return (rx1005_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("251_1284728478.15265") :method
.annotate 'line', 454
    $P1007 = self."!PREFIX__!subrule"("ws", "[")
    new $P1008, "ResizablePMCArray"
    push $P1008, $P1007
    .return ($P1008)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("252_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1011_tgt
    .local int rx1011_pos
    .local int rx1011_off
    .local int rx1011_eos
    .local int rx1011_rep
    .local pmc rx1011_cur
    .local pmc rx1011_debug
    (rx1011_cur, rx1011_pos, rx1011_tgt, $I10) = self."!cursor_start"()
    getattribute rx1011_debug, rx1011_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1011_cur
    .local pmc match
    .lex "$/", match
    length rx1011_eos, rx1011_tgt
    gt rx1011_pos, rx1011_eos, rx1011_done
    set rx1011_off, 0
    lt rx1011_pos, 2, rx1011_start
    sub rx1011_off, rx1011_pos, 1
    substr rx1011_tgt, rx1011_tgt, rx1011_off
  rx1011_start:
    eq $I10, 1, rx1011_restart
    if_null rx1011_debug, debug_830
    rx1011_cur."!cursor_debug"("START", "postcircumfix:sym<{ }>")
  debug_830:
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
.annotate 'line', 482
  # rx literal  "{"
    add $I11, rx1011_pos, 1
    gt $I11, rx1011_eos, rx1011_fail
    sub $I11, rx1011_pos, rx1011_off
    ord $I11, rx1011_tgt, $I11
    ne $I11, 123, rx1011_fail
    add rx1011_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1011_cur."!cursor_pos"(rx1011_pos)
    $P10 = rx1011_cur."ws"()
    unless $P10, rx1011_fail
    rx1011_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx1011_cur."!cursor_pos"(rx1011_pos)
    $P10 = rx1011_cur."EXPR"()
    unless $P10, rx1011_fail
    rx1011_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1011_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx1011_pos, 1
    gt $I11, rx1011_eos, rx1011_fail
    sub $I11, rx1011_pos, rx1011_off
    ord $I11, rx1011_tgt, $I11
    ne $I11, 125, rx1011_fail
    add rx1011_pos, 1
.annotate 'line', 483
  # rx subrule "O" subtype=capture negate=
    rx1011_cur."!cursor_pos"(rx1011_pos)
    $P10 = rx1011_cur."O"("%methodop")
    unless $P10, rx1011_fail
    rx1011_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1011_pos = $P10."pos"()
.annotate 'line', 481
  # rx pass
    rx1011_cur."!cursor_pass"(rx1011_pos, "postcircumfix:sym<{ }>")
    if_null rx1011_debug, debug_831
    rx1011_cur."!cursor_debug"("PASS", "postcircumfix:sym<{ }>", " at pos=", rx1011_pos)
  debug_831:
    .return (rx1011_cur)
  rx1011_restart:
.annotate 'line', 454
    if_null rx1011_debug, debug_832
    rx1011_cur."!cursor_debug"("NEXT", "postcircumfix:sym<{ }>")
  debug_832:
  rx1011_fail:
    (rx1011_rep, rx1011_pos, $I10, $P10) = rx1011_cur."!mark_fail"(0)
    lt rx1011_pos, -1, rx1011_done
    eq rx1011_pos, -1, rx1011_fail
    jump $I10
  rx1011_done:
    rx1011_cur."!cursor_fail"()
    if_null rx1011_debug, debug_833
    rx1011_cur."!cursor_debug"("FAIL", "postcircumfix:sym<{ }>")
  debug_833:
    .return (rx1011_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("253_1284728478.15265") :method
.annotate 'line', 454
    $P1013 = self."!PREFIX__!subrule"("ws", "{")
    new $P1014, "ResizablePMCArray"
    push $P1014, $P1013
    .return ($P1014)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("254_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1017_tgt
    .local int rx1017_pos
    .local int rx1017_off
    .local int rx1017_eos
    .local int rx1017_rep
    .local pmc rx1017_cur
    .local pmc rx1017_debug
    (rx1017_cur, rx1017_pos, rx1017_tgt, $I10) = self."!cursor_start"()
    getattribute rx1017_debug, rx1017_cur, "$!debug"
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
    eq $I10, 1, rx1017_restart
    if_null rx1017_debug, debug_834
    rx1017_cur."!cursor_debug"("START", "postcircumfix:sym<ang>")
  debug_834:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1020_done
    goto rxscan1020_scan
  rxscan1020_loop:
    ($P10) = rx1017_cur."from"()
    inc $P10
    set rx1017_pos, $P10
    ge rx1017_pos, rx1017_eos, rxscan1020_done
  rxscan1020_scan:
    set_addr $I10, rxscan1020_loop
    rx1017_cur."!mark_push"(0, rx1017_pos, $I10)
  rxscan1020_done:
.annotate 'line', 487
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1017_pos, rx1017_off
    substr $S10, rx1017_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx1017_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx1017_cur."!cursor_pos"(rx1017_pos)
    $P10 = rx1017_cur."quote_EXPR"(":q")
    unless $P10, rx1017_fail
    rx1017_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx1017_pos = $P10."pos"()
.annotate 'line', 488
  # rx subrule "O" subtype=capture negate=
    rx1017_cur."!cursor_pos"(rx1017_pos)
    $P10 = rx1017_cur."O"("%methodop")
    unless $P10, rx1017_fail
    rx1017_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1017_pos = $P10."pos"()
.annotate 'line', 486
  # rx pass
    rx1017_cur."!cursor_pass"(rx1017_pos, "postcircumfix:sym<ang>")
    if_null rx1017_debug, debug_835
    rx1017_cur."!cursor_debug"("PASS", "postcircumfix:sym<ang>", " at pos=", rx1017_pos)
  debug_835:
    .return (rx1017_cur)
  rx1017_restart:
.annotate 'line', 454
    if_null rx1017_debug, debug_836
    rx1017_cur."!cursor_debug"("NEXT", "postcircumfix:sym<ang>")
  debug_836:
  rx1017_fail:
    (rx1017_rep, rx1017_pos, $I10, $P10) = rx1017_cur."!mark_fail"(0)
    lt rx1017_pos, -1, rx1017_done
    eq rx1017_pos, -1, rx1017_fail
    jump $I10
  rx1017_done:
    rx1017_cur."!cursor_fail"()
    if_null rx1017_debug, debug_837
    rx1017_cur."!cursor_debug"("FAIL", "postcircumfix:sym<ang>")
  debug_837:
    .return (rx1017_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("255_1284728478.15265") :method
.annotate 'line', 454
    new $P1019, "ResizablePMCArray"
    push $P1019, "<"
    .return ($P1019)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("256_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1022_tgt
    .local int rx1022_pos
    .local int rx1022_off
    .local int rx1022_eos
    .local int rx1022_rep
    .local pmc rx1022_cur
    .local pmc rx1022_debug
    (rx1022_cur, rx1022_pos, rx1022_tgt, $I10) = self."!cursor_start"()
    getattribute rx1022_debug, rx1022_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1022_cur
    .local pmc match
    .lex "$/", match
    length rx1022_eos, rx1022_tgt
    gt rx1022_pos, rx1022_eos, rx1022_done
    set rx1022_off, 0
    lt rx1022_pos, 2, rx1022_start
    sub rx1022_off, rx1022_pos, 1
    substr rx1022_tgt, rx1022_tgt, rx1022_off
  rx1022_start:
    eq $I10, 1, rx1022_restart
    if_null rx1022_debug, debug_838
    rx1022_cur."!cursor_debug"("START", "postcircumfix:sym<( )>")
  debug_838:
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
.annotate 'line', 492
  # rx literal  "("
    add $I11, rx1022_pos, 1
    gt $I11, rx1022_eos, rx1022_fail
    sub $I11, rx1022_pos, rx1022_off
    ord $I11, rx1022_tgt, $I11
    ne $I11, 40, rx1022_fail
    add rx1022_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1022_cur."!cursor_pos"(rx1022_pos)
    $P10 = rx1022_cur."ws"()
    unless $P10, rx1022_fail
    rx1022_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx1022_cur."!cursor_pos"(rx1022_pos)
    $P10 = rx1022_cur."arglist"()
    unless $P10, rx1022_fail
    rx1022_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1022_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1022_pos, 1
    gt $I11, rx1022_eos, rx1022_fail
    sub $I11, rx1022_pos, rx1022_off
    ord $I11, rx1022_tgt, $I11
    ne $I11, 41, rx1022_fail
    add rx1022_pos, 1
.annotate 'line', 493
  # rx subrule "O" subtype=capture negate=
    rx1022_cur."!cursor_pos"(rx1022_pos)
    $P10 = rx1022_cur."O"("%methodop")
    unless $P10, rx1022_fail
    rx1022_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1022_pos = $P10."pos"()
.annotate 'line', 491
  # rx pass
    rx1022_cur."!cursor_pass"(rx1022_pos, "postcircumfix:sym<( )>")
    if_null rx1022_debug, debug_839
    rx1022_cur."!cursor_debug"("PASS", "postcircumfix:sym<( )>", " at pos=", rx1022_pos)
  debug_839:
    .return (rx1022_cur)
  rx1022_restart:
.annotate 'line', 454
    if_null rx1022_debug, debug_840
    rx1022_cur."!cursor_debug"("NEXT", "postcircumfix:sym<( )>")
  debug_840:
  rx1022_fail:
    (rx1022_rep, rx1022_pos, $I10, $P10) = rx1022_cur."!mark_fail"(0)
    lt rx1022_pos, -1, rx1022_done
    eq rx1022_pos, -1, rx1022_fail
    jump $I10
  rx1022_done:
    rx1022_cur."!cursor_fail"()
    if_null rx1022_debug, debug_841
    rx1022_cur."!cursor_debug"("FAIL", "postcircumfix:sym<( )>")
  debug_841:
    .return (rx1022_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("257_1284728478.15265") :method
.annotate 'line', 454
    $P1024 = self."!PREFIX__!subrule"("ws", "(")
    new $P1025, "ResizablePMCArray"
    push $P1025, $P1024
    .return ($P1025)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("258_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1028_tgt
    .local int rx1028_pos
    .local int rx1028_off
    .local int rx1028_eos
    .local int rx1028_rep
    .local pmc rx1028_cur
    .local pmc rx1028_debug
    (rx1028_cur, rx1028_pos, rx1028_tgt, $I10) = self."!cursor_start"()
    getattribute rx1028_debug, rx1028_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1028_cur
    .local pmc match
    .lex "$/", match
    length rx1028_eos, rx1028_tgt
    gt rx1028_pos, rx1028_eos, rx1028_done
    set rx1028_off, 0
    lt rx1028_pos, 2, rx1028_start
    sub rx1028_off, rx1028_pos, 1
    substr rx1028_tgt, rx1028_tgt, rx1028_off
  rx1028_start:
    eq $I10, 1, rx1028_restart
    if_null rx1028_debug, debug_842
    rx1028_cur."!cursor_debug"("START", "postfix:sym<.>")
  debug_842:
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
.annotate 'line', 496
  # rx subrule "dotty" subtype=capture negate=
    rx1028_cur."!cursor_pos"(rx1028_pos)
    $P10 = rx1028_cur."dotty"()
    unless $P10, rx1028_fail
    rx1028_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx1028_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx1028_cur."!cursor_pos"(rx1028_pos)
    $P10 = rx1028_cur."O"("%methodop")
    unless $P10, rx1028_fail
    rx1028_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1028_pos = $P10."pos"()
  # rx pass
    rx1028_cur."!cursor_pass"(rx1028_pos, "postfix:sym<.>")
    if_null rx1028_debug, debug_843
    rx1028_cur."!cursor_debug"("PASS", "postfix:sym<.>", " at pos=", rx1028_pos)
  debug_843:
    .return (rx1028_cur)
  rx1028_restart:
.annotate 'line', 454
    if_null rx1028_debug, debug_844
    rx1028_cur."!cursor_debug"("NEXT", "postfix:sym<.>")
  debug_844:
  rx1028_fail:
    (rx1028_rep, rx1028_pos, $I10, $P10) = rx1028_cur."!mark_fail"(0)
    lt rx1028_pos, -1, rx1028_done
    eq rx1028_pos, -1, rx1028_fail
    jump $I10
  rx1028_done:
    rx1028_cur."!cursor_fail"()
    if_null rx1028_debug, debug_845
    rx1028_cur."!cursor_debug"("FAIL", "postfix:sym<.>")
  debug_845:
    .return (rx1028_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("259_1284728478.15265") :method
.annotate 'line', 454
    $P1030 = self."!PREFIX__!subrule"("dotty", "")
    new $P1031, "ResizablePMCArray"
    push $P1031, $P1030
    .return ($P1031)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("260_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1034_tgt
    .local int rx1034_pos
    .local int rx1034_off
    .local int rx1034_eos
    .local int rx1034_rep
    .local pmc rx1034_cur
    .local pmc rx1034_debug
    (rx1034_cur, rx1034_pos, rx1034_tgt, $I10) = self."!cursor_start"()
    getattribute rx1034_debug, rx1034_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1034_cur
    .local pmc match
    .lex "$/", match
    length rx1034_eos, rx1034_tgt
    gt rx1034_pos, rx1034_eos, rx1034_done
    set rx1034_off, 0
    lt rx1034_pos, 2, rx1034_start
    sub rx1034_off, rx1034_pos, 1
    substr rx1034_tgt, rx1034_tgt, rx1034_off
  rx1034_start:
    eq $I10, 1, rx1034_restart
    if_null rx1034_debug, debug_846
    rx1034_cur."!cursor_debug"("START", "prefix:sym<++>")
  debug_846:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1038_done
    goto rxscan1038_scan
  rxscan1038_loop:
    ($P10) = rx1034_cur."from"()
    inc $P10
    set rx1034_pos, $P10
    ge rx1034_pos, rx1034_eos, rxscan1038_done
  rxscan1038_scan:
    set_addr $I10, rxscan1038_loop
    rx1034_cur."!mark_push"(0, rx1034_pos, $I10)
  rxscan1038_done:
.annotate 'line', 498
  # rx subcapture "sym"
    set_addr $I10, rxcap_1039_fail
    rx1034_cur."!mark_push"(0, rx1034_pos, $I10)
  # rx literal  "++"
    add $I11, rx1034_pos, 2
    gt $I11, rx1034_eos, rx1034_fail
    sub $I11, rx1034_pos, rx1034_off
    substr $S10, rx1034_tgt, $I11, 2
    ne $S10, "++", rx1034_fail
    add rx1034_pos, 2
    set_addr $I10, rxcap_1039_fail
    ($I12, $I11) = rx1034_cur."!mark_peek"($I10)
    rx1034_cur."!cursor_pos"($I11)
    ($P10) = rx1034_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1034_pos, "")
    rx1034_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1039_done
  rxcap_1039_fail:
    goto rx1034_fail
  rxcap_1039_done:
  # rx subrule "O" subtype=capture negate=
    rx1034_cur."!cursor_pos"(rx1034_pos)
    $P10 = rx1034_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx1034_fail
    rx1034_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1034_pos = $P10."pos"()
  # rx pass
    rx1034_cur."!cursor_pass"(rx1034_pos, "prefix:sym<++>")
    if_null rx1034_debug, debug_847
    rx1034_cur."!cursor_debug"("PASS", "prefix:sym<++>", " at pos=", rx1034_pos)
  debug_847:
    .return (rx1034_cur)
  rx1034_restart:
.annotate 'line', 454
    if_null rx1034_debug, debug_848
    rx1034_cur."!cursor_debug"("NEXT", "prefix:sym<++>")
  debug_848:
  rx1034_fail:
    (rx1034_rep, rx1034_pos, $I10, $P10) = rx1034_cur."!mark_fail"(0)
    lt rx1034_pos, -1, rx1034_done
    eq rx1034_pos, -1, rx1034_fail
    jump $I10
  rx1034_done:
    rx1034_cur."!cursor_fail"()
    if_null rx1034_debug, debug_849
    rx1034_cur."!cursor_debug"("FAIL", "prefix:sym<++>")
  debug_849:
    .return (rx1034_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("261_1284728478.15265") :method
.annotate 'line', 454
    $P1036 = self."!PREFIX__!subrule"("O", "++")
    new $P1037, "ResizablePMCArray"
    push $P1037, $P1036
    .return ($P1037)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("262_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1041_tgt
    .local int rx1041_pos
    .local int rx1041_off
    .local int rx1041_eos
    .local int rx1041_rep
    .local pmc rx1041_cur
    .local pmc rx1041_debug
    (rx1041_cur, rx1041_pos, rx1041_tgt, $I10) = self."!cursor_start"()
    getattribute rx1041_debug, rx1041_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1041_cur
    .local pmc match
    .lex "$/", match
    length rx1041_eos, rx1041_tgt
    gt rx1041_pos, rx1041_eos, rx1041_done
    set rx1041_off, 0
    lt rx1041_pos, 2, rx1041_start
    sub rx1041_off, rx1041_pos, 1
    substr rx1041_tgt, rx1041_tgt, rx1041_off
  rx1041_start:
    eq $I10, 1, rx1041_restart
    if_null rx1041_debug, debug_850
    rx1041_cur."!cursor_debug"("START", "prefix:sym<-->")
  debug_850:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1045_done
    goto rxscan1045_scan
  rxscan1045_loop:
    ($P10) = rx1041_cur."from"()
    inc $P10
    set rx1041_pos, $P10
    ge rx1041_pos, rx1041_eos, rxscan1045_done
  rxscan1045_scan:
    set_addr $I10, rxscan1045_loop
    rx1041_cur."!mark_push"(0, rx1041_pos, $I10)
  rxscan1045_done:
.annotate 'line', 499
  # rx subcapture "sym"
    set_addr $I10, rxcap_1046_fail
    rx1041_cur."!mark_push"(0, rx1041_pos, $I10)
  # rx literal  "--"
    add $I11, rx1041_pos, 2
    gt $I11, rx1041_eos, rx1041_fail
    sub $I11, rx1041_pos, rx1041_off
    substr $S10, rx1041_tgt, $I11, 2
    ne $S10, "--", rx1041_fail
    add rx1041_pos, 2
    set_addr $I10, rxcap_1046_fail
    ($I12, $I11) = rx1041_cur."!mark_peek"($I10)
    rx1041_cur."!cursor_pos"($I11)
    ($P10) = rx1041_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1041_pos, "")
    rx1041_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1046_done
  rxcap_1046_fail:
    goto rx1041_fail
  rxcap_1046_done:
  # rx subrule "O" subtype=capture negate=
    rx1041_cur."!cursor_pos"(rx1041_pos)
    $P10 = rx1041_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx1041_fail
    rx1041_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1041_pos = $P10."pos"()
  # rx pass
    rx1041_cur."!cursor_pass"(rx1041_pos, "prefix:sym<-->")
    if_null rx1041_debug, debug_851
    rx1041_cur."!cursor_debug"("PASS", "prefix:sym<-->", " at pos=", rx1041_pos)
  debug_851:
    .return (rx1041_cur)
  rx1041_restart:
.annotate 'line', 454
    if_null rx1041_debug, debug_852
    rx1041_cur."!cursor_debug"("NEXT", "prefix:sym<-->")
  debug_852:
  rx1041_fail:
    (rx1041_rep, rx1041_pos, $I10, $P10) = rx1041_cur."!mark_fail"(0)
    lt rx1041_pos, -1, rx1041_done
    eq rx1041_pos, -1, rx1041_fail
    jump $I10
  rx1041_done:
    rx1041_cur."!cursor_fail"()
    if_null rx1041_debug, debug_853
    rx1041_cur."!cursor_debug"("FAIL", "prefix:sym<-->")
  debug_853:
    .return (rx1041_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("263_1284728478.15265") :method
.annotate 'line', 454
    $P1043 = self."!PREFIX__!subrule"("O", "--")
    new $P1044, "ResizablePMCArray"
    push $P1044, $P1043
    .return ($P1044)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("264_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1048_tgt
    .local int rx1048_pos
    .local int rx1048_off
    .local int rx1048_eos
    .local int rx1048_rep
    .local pmc rx1048_cur
    .local pmc rx1048_debug
    (rx1048_cur, rx1048_pos, rx1048_tgt, $I10) = self."!cursor_start"()
    getattribute rx1048_debug, rx1048_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1048_cur
    .local pmc match
    .lex "$/", match
    length rx1048_eos, rx1048_tgt
    gt rx1048_pos, rx1048_eos, rx1048_done
    set rx1048_off, 0
    lt rx1048_pos, 2, rx1048_start
    sub rx1048_off, rx1048_pos, 1
    substr rx1048_tgt, rx1048_tgt, rx1048_off
  rx1048_start:
    eq $I10, 1, rx1048_restart
    if_null rx1048_debug, debug_854
    rx1048_cur."!cursor_debug"("START", "postfix:sym<++>")
  debug_854:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1052_done
    goto rxscan1052_scan
  rxscan1052_loop:
    ($P10) = rx1048_cur."from"()
    inc $P10
    set rx1048_pos, $P10
    ge rx1048_pos, rx1048_eos, rxscan1052_done
  rxscan1052_scan:
    set_addr $I10, rxscan1052_loop
    rx1048_cur."!mark_push"(0, rx1048_pos, $I10)
  rxscan1052_done:
.annotate 'line', 502
  # rx subcapture "sym"
    set_addr $I10, rxcap_1053_fail
    rx1048_cur."!mark_push"(0, rx1048_pos, $I10)
  # rx literal  "++"
    add $I11, rx1048_pos, 2
    gt $I11, rx1048_eos, rx1048_fail
    sub $I11, rx1048_pos, rx1048_off
    substr $S10, rx1048_tgt, $I11, 2
    ne $S10, "++", rx1048_fail
    add rx1048_pos, 2
    set_addr $I10, rxcap_1053_fail
    ($I12, $I11) = rx1048_cur."!mark_peek"($I10)
    rx1048_cur."!cursor_pos"($I11)
    ($P10) = rx1048_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1048_pos, "")
    rx1048_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1053_done
  rxcap_1053_fail:
    goto rx1048_fail
  rxcap_1053_done:
  # rx subrule "O" subtype=capture negate=
    rx1048_cur."!cursor_pos"(rx1048_pos)
    $P10 = rx1048_cur."O"("%autoincrement")
    unless $P10, rx1048_fail
    rx1048_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1048_pos = $P10."pos"()
  # rx pass
    rx1048_cur."!cursor_pass"(rx1048_pos, "postfix:sym<++>")
    if_null rx1048_debug, debug_855
    rx1048_cur."!cursor_debug"("PASS", "postfix:sym<++>", " at pos=", rx1048_pos)
  debug_855:
    .return (rx1048_cur)
  rx1048_restart:
.annotate 'line', 454
    if_null rx1048_debug, debug_856
    rx1048_cur."!cursor_debug"("NEXT", "postfix:sym<++>")
  debug_856:
  rx1048_fail:
    (rx1048_rep, rx1048_pos, $I10, $P10) = rx1048_cur."!mark_fail"(0)
    lt rx1048_pos, -1, rx1048_done
    eq rx1048_pos, -1, rx1048_fail
    jump $I10
  rx1048_done:
    rx1048_cur."!cursor_fail"()
    if_null rx1048_debug, debug_857
    rx1048_cur."!cursor_debug"("FAIL", "postfix:sym<++>")
  debug_857:
    .return (rx1048_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("265_1284728478.15265") :method
.annotate 'line', 454
    $P1050 = self."!PREFIX__!subrule"("O", "++")
    new $P1051, "ResizablePMCArray"
    push $P1051, $P1050
    .return ($P1051)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("266_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1055_tgt
    .local int rx1055_pos
    .local int rx1055_off
    .local int rx1055_eos
    .local int rx1055_rep
    .local pmc rx1055_cur
    .local pmc rx1055_debug
    (rx1055_cur, rx1055_pos, rx1055_tgt, $I10) = self."!cursor_start"()
    getattribute rx1055_debug, rx1055_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1055_cur
    .local pmc match
    .lex "$/", match
    length rx1055_eos, rx1055_tgt
    gt rx1055_pos, rx1055_eos, rx1055_done
    set rx1055_off, 0
    lt rx1055_pos, 2, rx1055_start
    sub rx1055_off, rx1055_pos, 1
    substr rx1055_tgt, rx1055_tgt, rx1055_off
  rx1055_start:
    eq $I10, 1, rx1055_restart
    if_null rx1055_debug, debug_858
    rx1055_cur."!cursor_debug"("START", "postfix:sym<-->")
  debug_858:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1059_done
    goto rxscan1059_scan
  rxscan1059_loop:
    ($P10) = rx1055_cur."from"()
    inc $P10
    set rx1055_pos, $P10
    ge rx1055_pos, rx1055_eos, rxscan1059_done
  rxscan1059_scan:
    set_addr $I10, rxscan1059_loop
    rx1055_cur."!mark_push"(0, rx1055_pos, $I10)
  rxscan1059_done:
.annotate 'line', 503
  # rx subcapture "sym"
    set_addr $I10, rxcap_1060_fail
    rx1055_cur."!mark_push"(0, rx1055_pos, $I10)
  # rx literal  "--"
    add $I11, rx1055_pos, 2
    gt $I11, rx1055_eos, rx1055_fail
    sub $I11, rx1055_pos, rx1055_off
    substr $S10, rx1055_tgt, $I11, 2
    ne $S10, "--", rx1055_fail
    add rx1055_pos, 2
    set_addr $I10, rxcap_1060_fail
    ($I12, $I11) = rx1055_cur."!mark_peek"($I10)
    rx1055_cur."!cursor_pos"($I11)
    ($P10) = rx1055_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1055_pos, "")
    rx1055_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1060_done
  rxcap_1060_fail:
    goto rx1055_fail
  rxcap_1060_done:
  # rx subrule "O" subtype=capture negate=
    rx1055_cur."!cursor_pos"(rx1055_pos)
    $P10 = rx1055_cur."O"("%autoincrement")
    unless $P10, rx1055_fail
    rx1055_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1055_pos = $P10."pos"()
  # rx pass
    rx1055_cur."!cursor_pass"(rx1055_pos, "postfix:sym<-->")
    if_null rx1055_debug, debug_859
    rx1055_cur."!cursor_debug"("PASS", "postfix:sym<-->", " at pos=", rx1055_pos)
  debug_859:
    .return (rx1055_cur)
  rx1055_restart:
.annotate 'line', 454
    if_null rx1055_debug, debug_860
    rx1055_cur."!cursor_debug"("NEXT", "postfix:sym<-->")
  debug_860:
  rx1055_fail:
    (rx1055_rep, rx1055_pos, $I10, $P10) = rx1055_cur."!mark_fail"(0)
    lt rx1055_pos, -1, rx1055_done
    eq rx1055_pos, -1, rx1055_fail
    jump $I10
  rx1055_done:
    rx1055_cur."!cursor_fail"()
    if_null rx1055_debug, debug_861
    rx1055_cur."!cursor_debug"("FAIL", "postfix:sym<-->")
  debug_861:
    .return (rx1055_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("267_1284728478.15265") :method
.annotate 'line', 454
    $P1057 = self."!PREFIX__!subrule"("O", "--")
    new $P1058, "ResizablePMCArray"
    push $P1058, $P1057
    .return ($P1058)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("268_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1062_tgt
    .local int rx1062_pos
    .local int rx1062_off
    .local int rx1062_eos
    .local int rx1062_rep
    .local pmc rx1062_cur
    .local pmc rx1062_debug
    (rx1062_cur, rx1062_pos, rx1062_tgt, $I10) = self."!cursor_start"()
    getattribute rx1062_debug, rx1062_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1062_cur
    .local pmc match
    .lex "$/", match
    length rx1062_eos, rx1062_tgt
    gt rx1062_pos, rx1062_eos, rx1062_done
    set rx1062_off, 0
    lt rx1062_pos, 2, rx1062_start
    sub rx1062_off, rx1062_pos, 1
    substr rx1062_tgt, rx1062_tgt, rx1062_off
  rx1062_start:
    eq $I10, 1, rx1062_restart
    if_null rx1062_debug, debug_862
    rx1062_cur."!cursor_debug"("START", "infix:sym<**>")
  debug_862:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1066_done
    goto rxscan1066_scan
  rxscan1066_loop:
    ($P10) = rx1062_cur."from"()
    inc $P10
    set rx1062_pos, $P10
    ge rx1062_pos, rx1062_eos, rxscan1066_done
  rxscan1066_scan:
    set_addr $I10, rxscan1066_loop
    rx1062_cur."!mark_push"(0, rx1062_pos, $I10)
  rxscan1066_done:
.annotate 'line', 505
  # rx subcapture "sym"
    set_addr $I10, rxcap_1067_fail
    rx1062_cur."!mark_push"(0, rx1062_pos, $I10)
  # rx literal  "**"
    add $I11, rx1062_pos, 2
    gt $I11, rx1062_eos, rx1062_fail
    sub $I11, rx1062_pos, rx1062_off
    substr $S10, rx1062_tgt, $I11, 2
    ne $S10, "**", rx1062_fail
    add rx1062_pos, 2
    set_addr $I10, rxcap_1067_fail
    ($I12, $I11) = rx1062_cur."!mark_peek"($I10)
    rx1062_cur."!cursor_pos"($I11)
    ($P10) = rx1062_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1062_pos, "")
    rx1062_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1067_done
  rxcap_1067_fail:
    goto rx1062_fail
  rxcap_1067_done:
  # rx subrule "O" subtype=capture negate=
    rx1062_cur."!cursor_pos"(rx1062_pos)
    $P10 = rx1062_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx1062_fail
    rx1062_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1062_pos = $P10."pos"()
  # rx pass
    rx1062_cur."!cursor_pass"(rx1062_pos, "infix:sym<**>")
    if_null rx1062_debug, debug_863
    rx1062_cur."!cursor_debug"("PASS", "infix:sym<**>", " at pos=", rx1062_pos)
  debug_863:
    .return (rx1062_cur)
  rx1062_restart:
.annotate 'line', 454
    if_null rx1062_debug, debug_864
    rx1062_cur."!cursor_debug"("NEXT", "infix:sym<**>")
  debug_864:
  rx1062_fail:
    (rx1062_rep, rx1062_pos, $I10, $P10) = rx1062_cur."!mark_fail"(0)
    lt rx1062_pos, -1, rx1062_done
    eq rx1062_pos, -1, rx1062_fail
    jump $I10
  rx1062_done:
    rx1062_cur."!cursor_fail"()
    if_null rx1062_debug, debug_865
    rx1062_cur."!cursor_debug"("FAIL", "infix:sym<**>")
  debug_865:
    .return (rx1062_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("269_1284728478.15265") :method
.annotate 'line', 454
    $P1064 = self."!PREFIX__!subrule"("O", "**")
    new $P1065, "ResizablePMCArray"
    push $P1065, $P1064
    .return ($P1065)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("270_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1069_tgt
    .local int rx1069_pos
    .local int rx1069_off
    .local int rx1069_eos
    .local int rx1069_rep
    .local pmc rx1069_cur
    .local pmc rx1069_debug
    (rx1069_cur, rx1069_pos, rx1069_tgt, $I10) = self."!cursor_start"()
    getattribute rx1069_debug, rx1069_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1069_cur
    .local pmc match
    .lex "$/", match
    length rx1069_eos, rx1069_tgt
    gt rx1069_pos, rx1069_eos, rx1069_done
    set rx1069_off, 0
    lt rx1069_pos, 2, rx1069_start
    sub rx1069_off, rx1069_pos, 1
    substr rx1069_tgt, rx1069_tgt, rx1069_off
  rx1069_start:
    eq $I10, 1, rx1069_restart
    if_null rx1069_debug, debug_866
    rx1069_cur."!cursor_debug"("START", "prefix:sym<+>")
  debug_866:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1073_done
    goto rxscan1073_scan
  rxscan1073_loop:
    ($P10) = rx1069_cur."from"()
    inc $P10
    set rx1069_pos, $P10
    ge rx1069_pos, rx1069_eos, rxscan1073_done
  rxscan1073_scan:
    set_addr $I10, rxscan1073_loop
    rx1069_cur."!mark_push"(0, rx1069_pos, $I10)
  rxscan1073_done:
.annotate 'line', 507
  # rx subcapture "sym"
    set_addr $I10, rxcap_1074_fail
    rx1069_cur."!mark_push"(0, rx1069_pos, $I10)
  # rx literal  "+"
    add $I11, rx1069_pos, 1
    gt $I11, rx1069_eos, rx1069_fail
    sub $I11, rx1069_pos, rx1069_off
    ord $I11, rx1069_tgt, $I11
    ne $I11, 43, rx1069_fail
    add rx1069_pos, 1
    set_addr $I10, rxcap_1074_fail
    ($I12, $I11) = rx1069_cur."!mark_peek"($I10)
    rx1069_cur."!cursor_pos"($I11)
    ($P10) = rx1069_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1069_pos, "")
    rx1069_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1074_done
  rxcap_1074_fail:
    goto rx1069_fail
  rxcap_1074_done:
  # rx subrule "O" subtype=capture negate=
    rx1069_cur."!cursor_pos"(rx1069_pos)
    $P10 = rx1069_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx1069_fail
    rx1069_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1069_pos = $P10."pos"()
  # rx pass
    rx1069_cur."!cursor_pass"(rx1069_pos, "prefix:sym<+>")
    if_null rx1069_debug, debug_867
    rx1069_cur."!cursor_debug"("PASS", "prefix:sym<+>", " at pos=", rx1069_pos)
  debug_867:
    .return (rx1069_cur)
  rx1069_restart:
.annotate 'line', 454
    if_null rx1069_debug, debug_868
    rx1069_cur."!cursor_debug"("NEXT", "prefix:sym<+>")
  debug_868:
  rx1069_fail:
    (rx1069_rep, rx1069_pos, $I10, $P10) = rx1069_cur."!mark_fail"(0)
    lt rx1069_pos, -1, rx1069_done
    eq rx1069_pos, -1, rx1069_fail
    jump $I10
  rx1069_done:
    rx1069_cur."!cursor_fail"()
    if_null rx1069_debug, debug_869
    rx1069_cur."!cursor_debug"("FAIL", "prefix:sym<+>")
  debug_869:
    .return (rx1069_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("271_1284728478.15265") :method
.annotate 'line', 454
    $P1071 = self."!PREFIX__!subrule"("O", "+")
    new $P1072, "ResizablePMCArray"
    push $P1072, $P1071
    .return ($P1072)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("272_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1076_tgt
    .local int rx1076_pos
    .local int rx1076_off
    .local int rx1076_eos
    .local int rx1076_rep
    .local pmc rx1076_cur
    .local pmc rx1076_debug
    (rx1076_cur, rx1076_pos, rx1076_tgt, $I10) = self."!cursor_start"()
    getattribute rx1076_debug, rx1076_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1076_cur
    .local pmc match
    .lex "$/", match
    length rx1076_eos, rx1076_tgt
    gt rx1076_pos, rx1076_eos, rx1076_done
    set rx1076_off, 0
    lt rx1076_pos, 2, rx1076_start
    sub rx1076_off, rx1076_pos, 1
    substr rx1076_tgt, rx1076_tgt, rx1076_off
  rx1076_start:
    eq $I10, 1, rx1076_restart
    if_null rx1076_debug, debug_870
    rx1076_cur."!cursor_debug"("START", "prefix:sym<~>")
  debug_870:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1080_done
    goto rxscan1080_scan
  rxscan1080_loop:
    ($P10) = rx1076_cur."from"()
    inc $P10
    set rx1076_pos, $P10
    ge rx1076_pos, rx1076_eos, rxscan1080_done
  rxscan1080_scan:
    set_addr $I10, rxscan1080_loop
    rx1076_cur."!mark_push"(0, rx1076_pos, $I10)
  rxscan1080_done:
.annotate 'line', 508
  # rx subcapture "sym"
    set_addr $I10, rxcap_1081_fail
    rx1076_cur."!mark_push"(0, rx1076_pos, $I10)
  # rx literal  "~"
    add $I11, rx1076_pos, 1
    gt $I11, rx1076_eos, rx1076_fail
    sub $I11, rx1076_pos, rx1076_off
    ord $I11, rx1076_tgt, $I11
    ne $I11, 126, rx1076_fail
    add rx1076_pos, 1
    set_addr $I10, rxcap_1081_fail
    ($I12, $I11) = rx1076_cur."!mark_peek"($I10)
    rx1076_cur."!cursor_pos"($I11)
    ($P10) = rx1076_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1076_pos, "")
    rx1076_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1081_done
  rxcap_1081_fail:
    goto rx1076_fail
  rxcap_1081_done:
  # rx subrule "O" subtype=capture negate=
    rx1076_cur."!cursor_pos"(rx1076_pos)
    $P10 = rx1076_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx1076_fail
    rx1076_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1076_pos = $P10."pos"()
  # rx pass
    rx1076_cur."!cursor_pass"(rx1076_pos, "prefix:sym<~>")
    if_null rx1076_debug, debug_871
    rx1076_cur."!cursor_debug"("PASS", "prefix:sym<~>", " at pos=", rx1076_pos)
  debug_871:
    .return (rx1076_cur)
  rx1076_restart:
.annotate 'line', 454
    if_null rx1076_debug, debug_872
    rx1076_cur."!cursor_debug"("NEXT", "prefix:sym<~>")
  debug_872:
  rx1076_fail:
    (rx1076_rep, rx1076_pos, $I10, $P10) = rx1076_cur."!mark_fail"(0)
    lt rx1076_pos, -1, rx1076_done
    eq rx1076_pos, -1, rx1076_fail
    jump $I10
  rx1076_done:
    rx1076_cur."!cursor_fail"()
    if_null rx1076_debug, debug_873
    rx1076_cur."!cursor_debug"("FAIL", "prefix:sym<~>")
  debug_873:
    .return (rx1076_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("273_1284728478.15265") :method
.annotate 'line', 454
    $P1078 = self."!PREFIX__!subrule"("O", "~")
    new $P1079, "ResizablePMCArray"
    push $P1079, $P1078
    .return ($P1079)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("274_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1083_tgt
    .local int rx1083_pos
    .local int rx1083_off
    .local int rx1083_eos
    .local int rx1083_rep
    .local pmc rx1083_cur
    .local pmc rx1083_debug
    (rx1083_cur, rx1083_pos, rx1083_tgt, $I10) = self."!cursor_start"()
    getattribute rx1083_debug, rx1083_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1083_cur
    .local pmc match
    .lex "$/", match
    length rx1083_eos, rx1083_tgt
    gt rx1083_pos, rx1083_eos, rx1083_done
    set rx1083_off, 0
    lt rx1083_pos, 2, rx1083_start
    sub rx1083_off, rx1083_pos, 1
    substr rx1083_tgt, rx1083_tgt, rx1083_off
  rx1083_start:
    eq $I10, 1, rx1083_restart
    if_null rx1083_debug, debug_874
    rx1083_cur."!cursor_debug"("START", "prefix:sym<->")
  debug_874:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1086_done
    goto rxscan1086_scan
  rxscan1086_loop:
    ($P10) = rx1083_cur."from"()
    inc $P10
    set rx1083_pos, $P10
    ge rx1083_pos, rx1083_eos, rxscan1086_done
  rxscan1086_scan:
    set_addr $I10, rxscan1086_loop
    rx1083_cur."!mark_push"(0, rx1083_pos, $I10)
  rxscan1086_done:
.annotate 'line', 509
  # rx subcapture "sym"
    set_addr $I10, rxcap_1087_fail
    rx1083_cur."!mark_push"(0, rx1083_pos, $I10)
  # rx literal  "-"
    add $I11, rx1083_pos, 1
    gt $I11, rx1083_eos, rx1083_fail
    sub $I11, rx1083_pos, rx1083_off
    ord $I11, rx1083_tgt, $I11
    ne $I11, 45, rx1083_fail
    add rx1083_pos, 1
    set_addr $I10, rxcap_1087_fail
    ($I12, $I11) = rx1083_cur."!mark_peek"($I10)
    rx1083_cur."!cursor_pos"($I11)
    ($P10) = rx1083_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1083_pos, "")
    rx1083_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1087_done
  rxcap_1087_fail:
    goto rx1083_fail
  rxcap_1087_done:
  # rx enumcharlist negate=1 zerowidth
    sub $I10, rx1083_pos, rx1083_off
    substr $S10, rx1083_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx1083_fail
  # rx subrule "number" subtype=zerowidth negate=1
    rx1083_cur."!cursor_pos"(rx1083_pos)
    $P10 = rx1083_cur."number"()
    if $P10, rx1083_fail
  # rx subrule "O" subtype=capture negate=
    rx1083_cur."!cursor_pos"(rx1083_pos)
    $P10 = rx1083_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx1083_fail
    rx1083_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1083_pos = $P10."pos"()
  # rx pass
    rx1083_cur."!cursor_pass"(rx1083_pos, "prefix:sym<->")
    if_null rx1083_debug, debug_875
    rx1083_cur."!cursor_debug"("PASS", "prefix:sym<->", " at pos=", rx1083_pos)
  debug_875:
    .return (rx1083_cur)
  rx1083_restart:
.annotate 'line', 454
    if_null rx1083_debug, debug_876
    rx1083_cur."!cursor_debug"("NEXT", "prefix:sym<->")
  debug_876:
  rx1083_fail:
    (rx1083_rep, rx1083_pos, $I10, $P10) = rx1083_cur."!mark_fail"(0)
    lt rx1083_pos, -1, rx1083_done
    eq rx1083_pos, -1, rx1083_fail
    jump $I10
  rx1083_done:
    rx1083_cur."!cursor_fail"()
    if_null rx1083_debug, debug_877
    rx1083_cur."!cursor_debug"("FAIL", "prefix:sym<->")
  debug_877:
    .return (rx1083_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("275_1284728478.15265") :method
.annotate 'line', 454
    new $P1085, "ResizablePMCArray"
    push $P1085, "-"
    .return ($P1085)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("276_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1089_tgt
    .local int rx1089_pos
    .local int rx1089_off
    .local int rx1089_eos
    .local int rx1089_rep
    .local pmc rx1089_cur
    .local pmc rx1089_debug
    (rx1089_cur, rx1089_pos, rx1089_tgt, $I10) = self."!cursor_start"()
    getattribute rx1089_debug, rx1089_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1089_cur
    .local pmc match
    .lex "$/", match
    length rx1089_eos, rx1089_tgt
    gt rx1089_pos, rx1089_eos, rx1089_done
    set rx1089_off, 0
    lt rx1089_pos, 2, rx1089_start
    sub rx1089_off, rx1089_pos, 1
    substr rx1089_tgt, rx1089_tgt, rx1089_off
  rx1089_start:
    eq $I10, 1, rx1089_restart
    if_null rx1089_debug, debug_878
    rx1089_cur."!cursor_debug"("START", "prefix:sym<?>")
  debug_878:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1093_done
    goto rxscan1093_scan
  rxscan1093_loop:
    ($P10) = rx1089_cur."from"()
    inc $P10
    set rx1089_pos, $P10
    ge rx1089_pos, rx1089_eos, rxscan1093_done
  rxscan1093_scan:
    set_addr $I10, rxscan1093_loop
    rx1089_cur."!mark_push"(0, rx1089_pos, $I10)
  rxscan1093_done:
.annotate 'line', 510
  # rx subcapture "sym"
    set_addr $I10, rxcap_1094_fail
    rx1089_cur."!mark_push"(0, rx1089_pos, $I10)
  # rx literal  "?"
    add $I11, rx1089_pos, 1
    gt $I11, rx1089_eos, rx1089_fail
    sub $I11, rx1089_pos, rx1089_off
    ord $I11, rx1089_tgt, $I11
    ne $I11, 63, rx1089_fail
    add rx1089_pos, 1
    set_addr $I10, rxcap_1094_fail
    ($I12, $I11) = rx1089_cur."!mark_peek"($I10)
    rx1089_cur."!cursor_pos"($I11)
    ($P10) = rx1089_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1089_pos, "")
    rx1089_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1094_done
  rxcap_1094_fail:
    goto rx1089_fail
  rxcap_1094_done:
  # rx subrule "O" subtype=capture negate=
    rx1089_cur."!cursor_pos"(rx1089_pos)
    $P10 = rx1089_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx1089_fail
    rx1089_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1089_pos = $P10."pos"()
  # rx pass
    rx1089_cur."!cursor_pass"(rx1089_pos, "prefix:sym<?>")
    if_null rx1089_debug, debug_879
    rx1089_cur."!cursor_debug"("PASS", "prefix:sym<?>", " at pos=", rx1089_pos)
  debug_879:
    .return (rx1089_cur)
  rx1089_restart:
.annotate 'line', 454
    if_null rx1089_debug, debug_880
    rx1089_cur."!cursor_debug"("NEXT", "prefix:sym<?>")
  debug_880:
  rx1089_fail:
    (rx1089_rep, rx1089_pos, $I10, $P10) = rx1089_cur."!mark_fail"(0)
    lt rx1089_pos, -1, rx1089_done
    eq rx1089_pos, -1, rx1089_fail
    jump $I10
  rx1089_done:
    rx1089_cur."!cursor_fail"()
    if_null rx1089_debug, debug_881
    rx1089_cur."!cursor_debug"("FAIL", "prefix:sym<?>")
  debug_881:
    .return (rx1089_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("277_1284728478.15265") :method
.annotate 'line', 454
    $P1091 = self."!PREFIX__!subrule"("O", "?")
    new $P1092, "ResizablePMCArray"
    push $P1092, $P1091
    .return ($P1092)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("278_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1096_tgt
    .local int rx1096_pos
    .local int rx1096_off
    .local int rx1096_eos
    .local int rx1096_rep
    .local pmc rx1096_cur
    .local pmc rx1096_debug
    (rx1096_cur, rx1096_pos, rx1096_tgt, $I10) = self."!cursor_start"()
    getattribute rx1096_debug, rx1096_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1096_cur
    .local pmc match
    .lex "$/", match
    length rx1096_eos, rx1096_tgt
    gt rx1096_pos, rx1096_eos, rx1096_done
    set rx1096_off, 0
    lt rx1096_pos, 2, rx1096_start
    sub rx1096_off, rx1096_pos, 1
    substr rx1096_tgt, rx1096_tgt, rx1096_off
  rx1096_start:
    eq $I10, 1, rx1096_restart
    if_null rx1096_debug, debug_882
    rx1096_cur."!cursor_debug"("START", "prefix:sym<!>")
  debug_882:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1100_done
    goto rxscan1100_scan
  rxscan1100_loop:
    ($P10) = rx1096_cur."from"()
    inc $P10
    set rx1096_pos, $P10
    ge rx1096_pos, rx1096_eos, rxscan1100_done
  rxscan1100_scan:
    set_addr $I10, rxscan1100_loop
    rx1096_cur."!mark_push"(0, rx1096_pos, $I10)
  rxscan1100_done:
.annotate 'line', 511
  # rx subcapture "sym"
    set_addr $I10, rxcap_1101_fail
    rx1096_cur."!mark_push"(0, rx1096_pos, $I10)
  # rx literal  "!"
    add $I11, rx1096_pos, 1
    gt $I11, rx1096_eos, rx1096_fail
    sub $I11, rx1096_pos, rx1096_off
    ord $I11, rx1096_tgt, $I11
    ne $I11, 33, rx1096_fail
    add rx1096_pos, 1
    set_addr $I10, rxcap_1101_fail
    ($I12, $I11) = rx1096_cur."!mark_peek"($I10)
    rx1096_cur."!cursor_pos"($I11)
    ($P10) = rx1096_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1096_pos, "")
    rx1096_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1101_done
  rxcap_1101_fail:
    goto rx1096_fail
  rxcap_1101_done:
  # rx subrule "O" subtype=capture negate=
    rx1096_cur."!cursor_pos"(rx1096_pos)
    $P10 = rx1096_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx1096_fail
    rx1096_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1096_pos = $P10."pos"()
  # rx pass
    rx1096_cur."!cursor_pass"(rx1096_pos, "prefix:sym<!>")
    if_null rx1096_debug, debug_883
    rx1096_cur."!cursor_debug"("PASS", "prefix:sym<!>", " at pos=", rx1096_pos)
  debug_883:
    .return (rx1096_cur)
  rx1096_restart:
.annotate 'line', 454
    if_null rx1096_debug, debug_884
    rx1096_cur."!cursor_debug"("NEXT", "prefix:sym<!>")
  debug_884:
  rx1096_fail:
    (rx1096_rep, rx1096_pos, $I10, $P10) = rx1096_cur."!mark_fail"(0)
    lt rx1096_pos, -1, rx1096_done
    eq rx1096_pos, -1, rx1096_fail
    jump $I10
  rx1096_done:
    rx1096_cur."!cursor_fail"()
    if_null rx1096_debug, debug_885
    rx1096_cur."!cursor_debug"("FAIL", "prefix:sym<!>")
  debug_885:
    .return (rx1096_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("279_1284728478.15265") :method
.annotate 'line', 454
    $P1098 = self."!PREFIX__!subrule"("O", "!")
    new $P1099, "ResizablePMCArray"
    push $P1099, $P1098
    .return ($P1099)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("280_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1103_tgt
    .local int rx1103_pos
    .local int rx1103_off
    .local int rx1103_eos
    .local int rx1103_rep
    .local pmc rx1103_cur
    .local pmc rx1103_debug
    (rx1103_cur, rx1103_pos, rx1103_tgt, $I10) = self."!cursor_start"()
    getattribute rx1103_debug, rx1103_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1103_cur
    .local pmc match
    .lex "$/", match
    length rx1103_eos, rx1103_tgt
    gt rx1103_pos, rx1103_eos, rx1103_done
    set rx1103_off, 0
    lt rx1103_pos, 2, rx1103_start
    sub rx1103_off, rx1103_pos, 1
    substr rx1103_tgt, rx1103_tgt, rx1103_off
  rx1103_start:
    eq $I10, 1, rx1103_restart
    if_null rx1103_debug, debug_886
    rx1103_cur."!cursor_debug"("START", "prefix:sym<|>")
  debug_886:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1107_done
    goto rxscan1107_scan
  rxscan1107_loop:
    ($P10) = rx1103_cur."from"()
    inc $P10
    set rx1103_pos, $P10
    ge rx1103_pos, rx1103_eos, rxscan1107_done
  rxscan1107_scan:
    set_addr $I10, rxscan1107_loop
    rx1103_cur."!mark_push"(0, rx1103_pos, $I10)
  rxscan1107_done:
.annotate 'line', 512
  # rx subcapture "sym"
    set_addr $I10, rxcap_1108_fail
    rx1103_cur."!mark_push"(0, rx1103_pos, $I10)
  # rx literal  "|"
    add $I11, rx1103_pos, 1
    gt $I11, rx1103_eos, rx1103_fail
    sub $I11, rx1103_pos, rx1103_off
    ord $I11, rx1103_tgt, $I11
    ne $I11, 124, rx1103_fail
    add rx1103_pos, 1
    set_addr $I10, rxcap_1108_fail
    ($I12, $I11) = rx1103_cur."!mark_peek"($I10)
    rx1103_cur."!cursor_pos"($I11)
    ($P10) = rx1103_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1103_pos, "")
    rx1103_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1108_done
  rxcap_1108_fail:
    goto rx1103_fail
  rxcap_1108_done:
  # rx subrule "O" subtype=capture negate=
    rx1103_cur."!cursor_pos"(rx1103_pos)
    $P10 = rx1103_cur."O"("%symbolic_unary")
    unless $P10, rx1103_fail
    rx1103_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1103_pos = $P10."pos"()
  # rx pass
    rx1103_cur."!cursor_pass"(rx1103_pos, "prefix:sym<|>")
    if_null rx1103_debug, debug_887
    rx1103_cur."!cursor_debug"("PASS", "prefix:sym<|>", " at pos=", rx1103_pos)
  debug_887:
    .return (rx1103_cur)
  rx1103_restart:
.annotate 'line', 454
    if_null rx1103_debug, debug_888
    rx1103_cur."!cursor_debug"("NEXT", "prefix:sym<|>")
  debug_888:
  rx1103_fail:
    (rx1103_rep, rx1103_pos, $I10, $P10) = rx1103_cur."!mark_fail"(0)
    lt rx1103_pos, -1, rx1103_done
    eq rx1103_pos, -1, rx1103_fail
    jump $I10
  rx1103_done:
    rx1103_cur."!cursor_fail"()
    if_null rx1103_debug, debug_889
    rx1103_cur."!cursor_debug"("FAIL", "prefix:sym<|>")
  debug_889:
    .return (rx1103_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("281_1284728478.15265") :method
.annotate 'line', 454
    $P1105 = self."!PREFIX__!subrule"("O", "|")
    new $P1106, "ResizablePMCArray"
    push $P1106, $P1105
    .return ($P1106)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("282_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1110_tgt
    .local int rx1110_pos
    .local int rx1110_off
    .local int rx1110_eos
    .local int rx1110_rep
    .local pmc rx1110_cur
    .local pmc rx1110_debug
    (rx1110_cur, rx1110_pos, rx1110_tgt, $I10) = self."!cursor_start"()
    getattribute rx1110_debug, rx1110_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1110_cur
    .local pmc match
    .lex "$/", match
    length rx1110_eos, rx1110_tgt
    gt rx1110_pos, rx1110_eos, rx1110_done
    set rx1110_off, 0
    lt rx1110_pos, 2, rx1110_start
    sub rx1110_off, rx1110_pos, 1
    substr rx1110_tgt, rx1110_tgt, rx1110_off
  rx1110_start:
    eq $I10, 1, rx1110_restart
    if_null rx1110_debug, debug_890
    rx1110_cur."!cursor_debug"("START", "infix:sym<*>")
  debug_890:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1114_done
    goto rxscan1114_scan
  rxscan1114_loop:
    ($P10) = rx1110_cur."from"()
    inc $P10
    set rx1110_pos, $P10
    ge rx1110_pos, rx1110_eos, rxscan1114_done
  rxscan1114_scan:
    set_addr $I10, rxscan1114_loop
    rx1110_cur."!mark_push"(0, rx1110_pos, $I10)
  rxscan1114_done:
.annotate 'line', 514
  # rx subcapture "sym"
    set_addr $I10, rxcap_1115_fail
    rx1110_cur."!mark_push"(0, rx1110_pos, $I10)
  # rx literal  "*"
    add $I11, rx1110_pos, 1
    gt $I11, rx1110_eos, rx1110_fail
    sub $I11, rx1110_pos, rx1110_off
    ord $I11, rx1110_tgt, $I11
    ne $I11, 42, rx1110_fail
    add rx1110_pos, 1
    set_addr $I10, rxcap_1115_fail
    ($I12, $I11) = rx1110_cur."!mark_peek"($I10)
    rx1110_cur."!cursor_pos"($I11)
    ($P10) = rx1110_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1110_pos, "")
    rx1110_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1115_done
  rxcap_1115_fail:
    goto rx1110_fail
  rxcap_1115_done:
  # rx subrule "O" subtype=capture negate=
    rx1110_cur."!cursor_pos"(rx1110_pos)
    $P10 = rx1110_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx1110_fail
    rx1110_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1110_pos = $P10."pos"()
  # rx pass
    rx1110_cur."!cursor_pass"(rx1110_pos, "infix:sym<*>")
    if_null rx1110_debug, debug_891
    rx1110_cur."!cursor_debug"("PASS", "infix:sym<*>", " at pos=", rx1110_pos)
  debug_891:
    .return (rx1110_cur)
  rx1110_restart:
.annotate 'line', 454
    if_null rx1110_debug, debug_892
    rx1110_cur."!cursor_debug"("NEXT", "infix:sym<*>")
  debug_892:
  rx1110_fail:
    (rx1110_rep, rx1110_pos, $I10, $P10) = rx1110_cur."!mark_fail"(0)
    lt rx1110_pos, -1, rx1110_done
    eq rx1110_pos, -1, rx1110_fail
    jump $I10
  rx1110_done:
    rx1110_cur."!cursor_fail"()
    if_null rx1110_debug, debug_893
    rx1110_cur."!cursor_debug"("FAIL", "infix:sym<*>")
  debug_893:
    .return (rx1110_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("283_1284728478.15265") :method
.annotate 'line', 454
    $P1112 = self."!PREFIX__!subrule"("O", "*")
    new $P1113, "ResizablePMCArray"
    push $P1113, $P1112
    .return ($P1113)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("284_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1117_tgt
    .local int rx1117_pos
    .local int rx1117_off
    .local int rx1117_eos
    .local int rx1117_rep
    .local pmc rx1117_cur
    .local pmc rx1117_debug
    (rx1117_cur, rx1117_pos, rx1117_tgt, $I10) = self."!cursor_start"()
    getattribute rx1117_debug, rx1117_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1117_cur
    .local pmc match
    .lex "$/", match
    length rx1117_eos, rx1117_tgt
    gt rx1117_pos, rx1117_eos, rx1117_done
    set rx1117_off, 0
    lt rx1117_pos, 2, rx1117_start
    sub rx1117_off, rx1117_pos, 1
    substr rx1117_tgt, rx1117_tgt, rx1117_off
  rx1117_start:
    eq $I10, 1, rx1117_restart
    if_null rx1117_debug, debug_894
    rx1117_cur."!cursor_debug"("START", "infix:sym</>")
  debug_894:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1121_done
    goto rxscan1121_scan
  rxscan1121_loop:
    ($P10) = rx1117_cur."from"()
    inc $P10
    set rx1117_pos, $P10
    ge rx1117_pos, rx1117_eos, rxscan1121_done
  rxscan1121_scan:
    set_addr $I10, rxscan1121_loop
    rx1117_cur."!mark_push"(0, rx1117_pos, $I10)
  rxscan1121_done:
.annotate 'line', 515
  # rx subcapture "sym"
    set_addr $I10, rxcap_1122_fail
    rx1117_cur."!mark_push"(0, rx1117_pos, $I10)
  # rx literal  "/"
    add $I11, rx1117_pos, 1
    gt $I11, rx1117_eos, rx1117_fail
    sub $I11, rx1117_pos, rx1117_off
    ord $I11, rx1117_tgt, $I11
    ne $I11, 47, rx1117_fail
    add rx1117_pos, 1
    set_addr $I10, rxcap_1122_fail
    ($I12, $I11) = rx1117_cur."!mark_peek"($I10)
    rx1117_cur."!cursor_pos"($I11)
    ($P10) = rx1117_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1117_pos, "")
    rx1117_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1122_done
  rxcap_1122_fail:
    goto rx1117_fail
  rxcap_1122_done:
  # rx subrule "O" subtype=capture negate=
    rx1117_cur."!cursor_pos"(rx1117_pos)
    $P10 = rx1117_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx1117_fail
    rx1117_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1117_pos = $P10."pos"()
  # rx pass
    rx1117_cur."!cursor_pass"(rx1117_pos, "infix:sym</>")
    if_null rx1117_debug, debug_895
    rx1117_cur."!cursor_debug"("PASS", "infix:sym</>", " at pos=", rx1117_pos)
  debug_895:
    .return (rx1117_cur)
  rx1117_restart:
.annotate 'line', 454
    if_null rx1117_debug, debug_896
    rx1117_cur."!cursor_debug"("NEXT", "infix:sym</>")
  debug_896:
  rx1117_fail:
    (rx1117_rep, rx1117_pos, $I10, $P10) = rx1117_cur."!mark_fail"(0)
    lt rx1117_pos, -1, rx1117_done
    eq rx1117_pos, -1, rx1117_fail
    jump $I10
  rx1117_done:
    rx1117_cur."!cursor_fail"()
    if_null rx1117_debug, debug_897
    rx1117_cur."!cursor_debug"("FAIL", "infix:sym</>")
  debug_897:
    .return (rx1117_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("285_1284728478.15265") :method
.annotate 'line', 454
    $P1119 = self."!PREFIX__!subrule"("O", "/")
    new $P1120, "ResizablePMCArray"
    push $P1120, $P1119
    .return ($P1120)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("286_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1124_tgt
    .local int rx1124_pos
    .local int rx1124_off
    .local int rx1124_eos
    .local int rx1124_rep
    .local pmc rx1124_cur
    .local pmc rx1124_debug
    (rx1124_cur, rx1124_pos, rx1124_tgt, $I10) = self."!cursor_start"()
    getattribute rx1124_debug, rx1124_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1124_cur
    .local pmc match
    .lex "$/", match
    length rx1124_eos, rx1124_tgt
    gt rx1124_pos, rx1124_eos, rx1124_done
    set rx1124_off, 0
    lt rx1124_pos, 2, rx1124_start
    sub rx1124_off, rx1124_pos, 1
    substr rx1124_tgt, rx1124_tgt, rx1124_off
  rx1124_start:
    eq $I10, 1, rx1124_restart
    if_null rx1124_debug, debug_898
    rx1124_cur."!cursor_debug"("START", "infix:sym<%>")
  debug_898:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1128_done
    goto rxscan1128_scan
  rxscan1128_loop:
    ($P10) = rx1124_cur."from"()
    inc $P10
    set rx1124_pos, $P10
    ge rx1124_pos, rx1124_eos, rxscan1128_done
  rxscan1128_scan:
    set_addr $I10, rxscan1128_loop
    rx1124_cur."!mark_push"(0, rx1124_pos, $I10)
  rxscan1128_done:
.annotate 'line', 516
  # rx subcapture "sym"
    set_addr $I10, rxcap_1129_fail
    rx1124_cur."!mark_push"(0, rx1124_pos, $I10)
  # rx literal  "%"
    add $I11, rx1124_pos, 1
    gt $I11, rx1124_eos, rx1124_fail
    sub $I11, rx1124_pos, rx1124_off
    ord $I11, rx1124_tgt, $I11
    ne $I11, 37, rx1124_fail
    add rx1124_pos, 1
    set_addr $I10, rxcap_1129_fail
    ($I12, $I11) = rx1124_cur."!mark_peek"($I10)
    rx1124_cur."!cursor_pos"($I11)
    ($P10) = rx1124_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1124_pos, "")
    rx1124_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1129_done
  rxcap_1129_fail:
    goto rx1124_fail
  rxcap_1129_done:
  # rx subrule "O" subtype=capture negate=
    rx1124_cur."!cursor_pos"(rx1124_pos)
    $P10 = rx1124_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx1124_fail
    rx1124_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1124_pos = $P10."pos"()
  # rx pass
    rx1124_cur."!cursor_pass"(rx1124_pos, "infix:sym<%>")
    if_null rx1124_debug, debug_899
    rx1124_cur."!cursor_debug"("PASS", "infix:sym<%>", " at pos=", rx1124_pos)
  debug_899:
    .return (rx1124_cur)
  rx1124_restart:
.annotate 'line', 454
    if_null rx1124_debug, debug_900
    rx1124_cur."!cursor_debug"("NEXT", "infix:sym<%>")
  debug_900:
  rx1124_fail:
    (rx1124_rep, rx1124_pos, $I10, $P10) = rx1124_cur."!mark_fail"(0)
    lt rx1124_pos, -1, rx1124_done
    eq rx1124_pos, -1, rx1124_fail
    jump $I10
  rx1124_done:
    rx1124_cur."!cursor_fail"()
    if_null rx1124_debug, debug_901
    rx1124_cur."!cursor_debug"("FAIL", "infix:sym<%>")
  debug_901:
    .return (rx1124_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("287_1284728478.15265") :method
.annotate 'line', 454
    $P1126 = self."!PREFIX__!subrule"("O", "%")
    new $P1127, "ResizablePMCArray"
    push $P1127, $P1126
    .return ($P1127)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+&>"  :subid("288_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1131_tgt
    .local int rx1131_pos
    .local int rx1131_off
    .local int rx1131_eos
    .local int rx1131_rep
    .local pmc rx1131_cur
    .local pmc rx1131_debug
    (rx1131_cur, rx1131_pos, rx1131_tgt, $I10) = self."!cursor_start"()
    getattribute rx1131_debug, rx1131_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1131_cur
    .local pmc match
    .lex "$/", match
    length rx1131_eos, rx1131_tgt
    gt rx1131_pos, rx1131_eos, rx1131_done
    set rx1131_off, 0
    lt rx1131_pos, 2, rx1131_start
    sub rx1131_off, rx1131_pos, 1
    substr rx1131_tgt, rx1131_tgt, rx1131_off
  rx1131_start:
    eq $I10, 1, rx1131_restart
    if_null rx1131_debug, debug_902
    rx1131_cur."!cursor_debug"("START", "infix:sym<+&>")
  debug_902:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1135_done
    goto rxscan1135_scan
  rxscan1135_loop:
    ($P10) = rx1131_cur."from"()
    inc $P10
    set rx1131_pos, $P10
    ge rx1131_pos, rx1131_eos, rxscan1135_done
  rxscan1135_scan:
    set_addr $I10, rxscan1135_loop
    rx1131_cur."!mark_push"(0, rx1131_pos, $I10)
  rxscan1135_done:
.annotate 'line', 517
  # rx subcapture "sym"
    set_addr $I10, rxcap_1136_fail
    rx1131_cur."!mark_push"(0, rx1131_pos, $I10)
  # rx literal  "+&"
    add $I11, rx1131_pos, 2
    gt $I11, rx1131_eos, rx1131_fail
    sub $I11, rx1131_pos, rx1131_off
    substr $S10, rx1131_tgt, $I11, 2
    ne $S10, "+&", rx1131_fail
    add rx1131_pos, 2
    set_addr $I10, rxcap_1136_fail
    ($I12, $I11) = rx1131_cur."!mark_peek"($I10)
    rx1131_cur."!cursor_pos"($I11)
    ($P10) = rx1131_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1131_pos, "")
    rx1131_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1136_done
  rxcap_1136_fail:
    goto rx1131_fail
  rxcap_1136_done:
  # rx subrule "O" subtype=capture negate=
    rx1131_cur."!cursor_pos"(rx1131_pos)
    $P10 = rx1131_cur."O"("%multiplicative, :pirop<band III>")
    unless $P10, rx1131_fail
    rx1131_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1131_pos = $P10."pos"()
  # rx pass
    rx1131_cur."!cursor_pass"(rx1131_pos, "infix:sym<+&>")
    if_null rx1131_debug, debug_903
    rx1131_cur."!cursor_debug"("PASS", "infix:sym<+&>", " at pos=", rx1131_pos)
  debug_903:
    .return (rx1131_cur)
  rx1131_restart:
.annotate 'line', 454
    if_null rx1131_debug, debug_904
    rx1131_cur."!cursor_debug"("NEXT", "infix:sym<+&>")
  debug_904:
  rx1131_fail:
    (rx1131_rep, rx1131_pos, $I10, $P10) = rx1131_cur."!mark_fail"(0)
    lt rx1131_pos, -1, rx1131_done
    eq rx1131_pos, -1, rx1131_fail
    jump $I10
  rx1131_done:
    rx1131_cur."!cursor_fail"()
    if_null rx1131_debug, debug_905
    rx1131_cur."!cursor_debug"("FAIL", "infix:sym<+&>")
  debug_905:
    .return (rx1131_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+&>"  :subid("289_1284728478.15265") :method
.annotate 'line', 454
    $P1133 = self."!PREFIX__!subrule"("O", "+&")
    new $P1134, "ResizablePMCArray"
    push $P1134, $P1133
    .return ($P1134)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("290_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1138_tgt
    .local int rx1138_pos
    .local int rx1138_off
    .local int rx1138_eos
    .local int rx1138_rep
    .local pmc rx1138_cur
    .local pmc rx1138_debug
    (rx1138_cur, rx1138_pos, rx1138_tgt, $I10) = self."!cursor_start"()
    getattribute rx1138_debug, rx1138_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1138_cur
    .local pmc match
    .lex "$/", match
    length rx1138_eos, rx1138_tgt
    gt rx1138_pos, rx1138_eos, rx1138_done
    set rx1138_off, 0
    lt rx1138_pos, 2, rx1138_start
    sub rx1138_off, rx1138_pos, 1
    substr rx1138_tgt, rx1138_tgt, rx1138_off
  rx1138_start:
    eq $I10, 1, rx1138_restart
    if_null rx1138_debug, debug_906
    rx1138_cur."!cursor_debug"("START", "infix:sym<+>")
  debug_906:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1142_done
    goto rxscan1142_scan
  rxscan1142_loop:
    ($P10) = rx1138_cur."from"()
    inc $P10
    set rx1138_pos, $P10
    ge rx1138_pos, rx1138_eos, rxscan1142_done
  rxscan1142_scan:
    set_addr $I10, rxscan1142_loop
    rx1138_cur."!mark_push"(0, rx1138_pos, $I10)
  rxscan1142_done:
.annotate 'line', 519
  # rx subcapture "sym"
    set_addr $I10, rxcap_1143_fail
    rx1138_cur."!mark_push"(0, rx1138_pos, $I10)
  # rx literal  "+"
    add $I11, rx1138_pos, 1
    gt $I11, rx1138_eos, rx1138_fail
    sub $I11, rx1138_pos, rx1138_off
    ord $I11, rx1138_tgt, $I11
    ne $I11, 43, rx1138_fail
    add rx1138_pos, 1
    set_addr $I10, rxcap_1143_fail
    ($I12, $I11) = rx1138_cur."!mark_peek"($I10)
    rx1138_cur."!cursor_pos"($I11)
    ($P10) = rx1138_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1138_pos, "")
    rx1138_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1143_done
  rxcap_1143_fail:
    goto rx1138_fail
  rxcap_1143_done:
  # rx subrule "O" subtype=capture negate=
    rx1138_cur."!cursor_pos"(rx1138_pos)
    $P10 = rx1138_cur."O"("%additive, :pirop<add>")
    unless $P10, rx1138_fail
    rx1138_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1138_pos = $P10."pos"()
  # rx pass
    rx1138_cur."!cursor_pass"(rx1138_pos, "infix:sym<+>")
    if_null rx1138_debug, debug_907
    rx1138_cur."!cursor_debug"("PASS", "infix:sym<+>", " at pos=", rx1138_pos)
  debug_907:
    .return (rx1138_cur)
  rx1138_restart:
.annotate 'line', 454
    if_null rx1138_debug, debug_908
    rx1138_cur."!cursor_debug"("NEXT", "infix:sym<+>")
  debug_908:
  rx1138_fail:
    (rx1138_rep, rx1138_pos, $I10, $P10) = rx1138_cur."!mark_fail"(0)
    lt rx1138_pos, -1, rx1138_done
    eq rx1138_pos, -1, rx1138_fail
    jump $I10
  rx1138_done:
    rx1138_cur."!cursor_fail"()
    if_null rx1138_debug, debug_909
    rx1138_cur."!cursor_debug"("FAIL", "infix:sym<+>")
  debug_909:
    .return (rx1138_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("291_1284728478.15265") :method
.annotate 'line', 454
    $P1140 = self."!PREFIX__!subrule"("O", "+")
    new $P1141, "ResizablePMCArray"
    push $P1141, $P1140
    .return ($P1141)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("292_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1145_tgt
    .local int rx1145_pos
    .local int rx1145_off
    .local int rx1145_eos
    .local int rx1145_rep
    .local pmc rx1145_cur
    .local pmc rx1145_debug
    (rx1145_cur, rx1145_pos, rx1145_tgt, $I10) = self."!cursor_start"()
    getattribute rx1145_debug, rx1145_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1145_cur
    .local pmc match
    .lex "$/", match
    length rx1145_eos, rx1145_tgt
    gt rx1145_pos, rx1145_eos, rx1145_done
    set rx1145_off, 0
    lt rx1145_pos, 2, rx1145_start
    sub rx1145_off, rx1145_pos, 1
    substr rx1145_tgt, rx1145_tgt, rx1145_off
  rx1145_start:
    eq $I10, 1, rx1145_restart
    if_null rx1145_debug, debug_910
    rx1145_cur."!cursor_debug"("START", "infix:sym<->")
  debug_910:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1149_done
    goto rxscan1149_scan
  rxscan1149_loop:
    ($P10) = rx1145_cur."from"()
    inc $P10
    set rx1145_pos, $P10
    ge rx1145_pos, rx1145_eos, rxscan1149_done
  rxscan1149_scan:
    set_addr $I10, rxscan1149_loop
    rx1145_cur."!mark_push"(0, rx1145_pos, $I10)
  rxscan1149_done:
.annotate 'line', 520
  # rx subcapture "sym"
    set_addr $I10, rxcap_1150_fail
    rx1145_cur."!mark_push"(0, rx1145_pos, $I10)
  # rx literal  "-"
    add $I11, rx1145_pos, 1
    gt $I11, rx1145_eos, rx1145_fail
    sub $I11, rx1145_pos, rx1145_off
    ord $I11, rx1145_tgt, $I11
    ne $I11, 45, rx1145_fail
    add rx1145_pos, 1
    set_addr $I10, rxcap_1150_fail
    ($I12, $I11) = rx1145_cur."!mark_peek"($I10)
    rx1145_cur."!cursor_pos"($I11)
    ($P10) = rx1145_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1145_pos, "")
    rx1145_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1150_done
  rxcap_1150_fail:
    goto rx1145_fail
  rxcap_1150_done:
  # rx subrule "O" subtype=capture negate=
    rx1145_cur."!cursor_pos"(rx1145_pos)
    $P10 = rx1145_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx1145_fail
    rx1145_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1145_pos = $P10."pos"()
  # rx pass
    rx1145_cur."!cursor_pass"(rx1145_pos, "infix:sym<->")
    if_null rx1145_debug, debug_911
    rx1145_cur."!cursor_debug"("PASS", "infix:sym<->", " at pos=", rx1145_pos)
  debug_911:
    .return (rx1145_cur)
  rx1145_restart:
.annotate 'line', 454
    if_null rx1145_debug, debug_912
    rx1145_cur."!cursor_debug"("NEXT", "infix:sym<->")
  debug_912:
  rx1145_fail:
    (rx1145_rep, rx1145_pos, $I10, $P10) = rx1145_cur."!mark_fail"(0)
    lt rx1145_pos, -1, rx1145_done
    eq rx1145_pos, -1, rx1145_fail
    jump $I10
  rx1145_done:
    rx1145_cur."!cursor_fail"()
    if_null rx1145_debug, debug_913
    rx1145_cur."!cursor_debug"("FAIL", "infix:sym<->")
  debug_913:
    .return (rx1145_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("293_1284728478.15265") :method
.annotate 'line', 454
    $P1147 = self."!PREFIX__!subrule"("O", "-")
    new $P1148, "ResizablePMCArray"
    push $P1148, $P1147
    .return ($P1148)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+|>"  :subid("294_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1152_tgt
    .local int rx1152_pos
    .local int rx1152_off
    .local int rx1152_eos
    .local int rx1152_rep
    .local pmc rx1152_cur
    .local pmc rx1152_debug
    (rx1152_cur, rx1152_pos, rx1152_tgt, $I10) = self."!cursor_start"()
    getattribute rx1152_debug, rx1152_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1152_cur
    .local pmc match
    .lex "$/", match
    length rx1152_eos, rx1152_tgt
    gt rx1152_pos, rx1152_eos, rx1152_done
    set rx1152_off, 0
    lt rx1152_pos, 2, rx1152_start
    sub rx1152_off, rx1152_pos, 1
    substr rx1152_tgt, rx1152_tgt, rx1152_off
  rx1152_start:
    eq $I10, 1, rx1152_restart
    if_null rx1152_debug, debug_914
    rx1152_cur."!cursor_debug"("START", "infix:sym<+|>")
  debug_914:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1156_done
    goto rxscan1156_scan
  rxscan1156_loop:
    ($P10) = rx1152_cur."from"()
    inc $P10
    set rx1152_pos, $P10
    ge rx1152_pos, rx1152_eos, rxscan1156_done
  rxscan1156_scan:
    set_addr $I10, rxscan1156_loop
    rx1152_cur."!mark_push"(0, rx1152_pos, $I10)
  rxscan1156_done:
.annotate 'line', 521
  # rx subcapture "sym"
    set_addr $I10, rxcap_1157_fail
    rx1152_cur."!mark_push"(0, rx1152_pos, $I10)
  # rx literal  "+|"
    add $I11, rx1152_pos, 2
    gt $I11, rx1152_eos, rx1152_fail
    sub $I11, rx1152_pos, rx1152_off
    substr $S10, rx1152_tgt, $I11, 2
    ne $S10, "+|", rx1152_fail
    add rx1152_pos, 2
    set_addr $I10, rxcap_1157_fail
    ($I12, $I11) = rx1152_cur."!mark_peek"($I10)
    rx1152_cur."!cursor_pos"($I11)
    ($P10) = rx1152_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1152_pos, "")
    rx1152_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1157_done
  rxcap_1157_fail:
    goto rx1152_fail
  rxcap_1157_done:
  # rx subrule "O" subtype=capture negate=
    rx1152_cur."!cursor_pos"(rx1152_pos)
    $P10 = rx1152_cur."O"("%additive, :pirop<bor III>")
    unless $P10, rx1152_fail
    rx1152_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1152_pos = $P10."pos"()
  # rx pass
    rx1152_cur."!cursor_pass"(rx1152_pos, "infix:sym<+|>")
    if_null rx1152_debug, debug_915
    rx1152_cur."!cursor_debug"("PASS", "infix:sym<+|>", " at pos=", rx1152_pos)
  debug_915:
    .return (rx1152_cur)
  rx1152_restart:
.annotate 'line', 454
    if_null rx1152_debug, debug_916
    rx1152_cur."!cursor_debug"("NEXT", "infix:sym<+|>")
  debug_916:
  rx1152_fail:
    (rx1152_rep, rx1152_pos, $I10, $P10) = rx1152_cur."!mark_fail"(0)
    lt rx1152_pos, -1, rx1152_done
    eq rx1152_pos, -1, rx1152_fail
    jump $I10
  rx1152_done:
    rx1152_cur."!cursor_fail"()
    if_null rx1152_debug, debug_917
    rx1152_cur."!cursor_debug"("FAIL", "infix:sym<+|>")
  debug_917:
    .return (rx1152_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+|>"  :subid("295_1284728478.15265") :method
.annotate 'line', 454
    $P1154 = self."!PREFIX__!subrule"("O", "+|")
    new $P1155, "ResizablePMCArray"
    push $P1155, $P1154
    .return ($P1155)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+^>"  :subid("296_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1159_tgt
    .local int rx1159_pos
    .local int rx1159_off
    .local int rx1159_eos
    .local int rx1159_rep
    .local pmc rx1159_cur
    .local pmc rx1159_debug
    (rx1159_cur, rx1159_pos, rx1159_tgt, $I10) = self."!cursor_start"()
    getattribute rx1159_debug, rx1159_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1159_cur
    .local pmc match
    .lex "$/", match
    length rx1159_eos, rx1159_tgt
    gt rx1159_pos, rx1159_eos, rx1159_done
    set rx1159_off, 0
    lt rx1159_pos, 2, rx1159_start
    sub rx1159_off, rx1159_pos, 1
    substr rx1159_tgt, rx1159_tgt, rx1159_off
  rx1159_start:
    eq $I10, 1, rx1159_restart
    if_null rx1159_debug, debug_918
    rx1159_cur."!cursor_debug"("START", "infix:sym<+^>")
  debug_918:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1163_done
    goto rxscan1163_scan
  rxscan1163_loop:
    ($P10) = rx1159_cur."from"()
    inc $P10
    set rx1159_pos, $P10
    ge rx1159_pos, rx1159_eos, rxscan1163_done
  rxscan1163_scan:
    set_addr $I10, rxscan1163_loop
    rx1159_cur."!mark_push"(0, rx1159_pos, $I10)
  rxscan1163_done:
.annotate 'line', 522
  # rx subcapture "sym"
    set_addr $I10, rxcap_1164_fail
    rx1159_cur."!mark_push"(0, rx1159_pos, $I10)
  # rx literal  "+^"
    add $I11, rx1159_pos, 2
    gt $I11, rx1159_eos, rx1159_fail
    sub $I11, rx1159_pos, rx1159_off
    substr $S10, rx1159_tgt, $I11, 2
    ne $S10, "+^", rx1159_fail
    add rx1159_pos, 2
    set_addr $I10, rxcap_1164_fail
    ($I12, $I11) = rx1159_cur."!mark_peek"($I10)
    rx1159_cur."!cursor_pos"($I11)
    ($P10) = rx1159_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1159_pos, "")
    rx1159_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1164_done
  rxcap_1164_fail:
    goto rx1159_fail
  rxcap_1164_done:
  # rx subrule "O" subtype=capture negate=
    rx1159_cur."!cursor_pos"(rx1159_pos)
    $P10 = rx1159_cur."O"("%additive, :pirop<bxor III>")
    unless $P10, rx1159_fail
    rx1159_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1159_pos = $P10."pos"()
  # rx pass
    rx1159_cur."!cursor_pass"(rx1159_pos, "infix:sym<+^>")
    if_null rx1159_debug, debug_919
    rx1159_cur."!cursor_debug"("PASS", "infix:sym<+^>", " at pos=", rx1159_pos)
  debug_919:
    .return (rx1159_cur)
  rx1159_restart:
.annotate 'line', 454
    if_null rx1159_debug, debug_920
    rx1159_cur."!cursor_debug"("NEXT", "infix:sym<+^>")
  debug_920:
  rx1159_fail:
    (rx1159_rep, rx1159_pos, $I10, $P10) = rx1159_cur."!mark_fail"(0)
    lt rx1159_pos, -1, rx1159_done
    eq rx1159_pos, -1, rx1159_fail
    jump $I10
  rx1159_done:
    rx1159_cur."!cursor_fail"()
    if_null rx1159_debug, debug_921
    rx1159_cur."!cursor_debug"("FAIL", "infix:sym<+^>")
  debug_921:
    .return (rx1159_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+^>"  :subid("297_1284728478.15265") :method
.annotate 'line', 454
    $P1161 = self."!PREFIX__!subrule"("O", "+^")
    new $P1162, "ResizablePMCArray"
    push $P1162, $P1161
    .return ($P1162)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("298_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1166_tgt
    .local int rx1166_pos
    .local int rx1166_off
    .local int rx1166_eos
    .local int rx1166_rep
    .local pmc rx1166_cur
    .local pmc rx1166_debug
    (rx1166_cur, rx1166_pos, rx1166_tgt, $I10) = self."!cursor_start"()
    getattribute rx1166_debug, rx1166_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1166_cur
    .local pmc match
    .lex "$/", match
    length rx1166_eos, rx1166_tgt
    gt rx1166_pos, rx1166_eos, rx1166_done
    set rx1166_off, 0
    lt rx1166_pos, 2, rx1166_start
    sub rx1166_off, rx1166_pos, 1
    substr rx1166_tgt, rx1166_tgt, rx1166_off
  rx1166_start:
    eq $I10, 1, rx1166_restart
    if_null rx1166_debug, debug_922
    rx1166_cur."!cursor_debug"("START", "infix:sym<~>")
  debug_922:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1170_done
    goto rxscan1170_scan
  rxscan1170_loop:
    ($P10) = rx1166_cur."from"()
    inc $P10
    set rx1166_pos, $P10
    ge rx1166_pos, rx1166_eos, rxscan1170_done
  rxscan1170_scan:
    set_addr $I10, rxscan1170_loop
    rx1166_cur."!mark_push"(0, rx1166_pos, $I10)
  rxscan1170_done:
.annotate 'line', 524
  # rx subcapture "sym"
    set_addr $I10, rxcap_1171_fail
    rx1166_cur."!mark_push"(0, rx1166_pos, $I10)
  # rx literal  "~"
    add $I11, rx1166_pos, 1
    gt $I11, rx1166_eos, rx1166_fail
    sub $I11, rx1166_pos, rx1166_off
    ord $I11, rx1166_tgt, $I11
    ne $I11, 126, rx1166_fail
    add rx1166_pos, 1
    set_addr $I10, rxcap_1171_fail
    ($I12, $I11) = rx1166_cur."!mark_peek"($I10)
    rx1166_cur."!cursor_pos"($I11)
    ($P10) = rx1166_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1166_pos, "")
    rx1166_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1171_done
  rxcap_1171_fail:
    goto rx1166_fail
  rxcap_1171_done:
  # rx subrule "O" subtype=capture negate=
    rx1166_cur."!cursor_pos"(rx1166_pos)
    $P10 = rx1166_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx1166_fail
    rx1166_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1166_pos = $P10."pos"()
  # rx pass
    rx1166_cur."!cursor_pass"(rx1166_pos, "infix:sym<~>")
    if_null rx1166_debug, debug_923
    rx1166_cur."!cursor_debug"("PASS", "infix:sym<~>", " at pos=", rx1166_pos)
  debug_923:
    .return (rx1166_cur)
  rx1166_restart:
.annotate 'line', 454
    if_null rx1166_debug, debug_924
    rx1166_cur."!cursor_debug"("NEXT", "infix:sym<~>")
  debug_924:
  rx1166_fail:
    (rx1166_rep, rx1166_pos, $I10, $P10) = rx1166_cur."!mark_fail"(0)
    lt rx1166_pos, -1, rx1166_done
    eq rx1166_pos, -1, rx1166_fail
    jump $I10
  rx1166_done:
    rx1166_cur."!cursor_fail"()
    if_null rx1166_debug, debug_925
    rx1166_cur."!cursor_debug"("FAIL", "infix:sym<~>")
  debug_925:
    .return (rx1166_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("299_1284728478.15265") :method
.annotate 'line', 454
    $P1168 = self."!PREFIX__!subrule"("O", "~")
    new $P1169, "ResizablePMCArray"
    push $P1169, $P1168
    .return ($P1169)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("300_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1173_tgt
    .local int rx1173_pos
    .local int rx1173_off
    .local int rx1173_eos
    .local int rx1173_rep
    .local pmc rx1173_cur
    .local pmc rx1173_debug
    (rx1173_cur, rx1173_pos, rx1173_tgt, $I10) = self."!cursor_start"()
    getattribute rx1173_debug, rx1173_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1173_cur
    .local pmc match
    .lex "$/", match
    length rx1173_eos, rx1173_tgt
    gt rx1173_pos, rx1173_eos, rx1173_done
    set rx1173_off, 0
    lt rx1173_pos, 2, rx1173_start
    sub rx1173_off, rx1173_pos, 1
    substr rx1173_tgt, rx1173_tgt, rx1173_off
  rx1173_start:
    eq $I10, 1, rx1173_restart
    if_null rx1173_debug, debug_926
    rx1173_cur."!cursor_debug"("START", "infix:sym<==>")
  debug_926:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1177_done
    goto rxscan1177_scan
  rxscan1177_loop:
    ($P10) = rx1173_cur."from"()
    inc $P10
    set rx1173_pos, $P10
    ge rx1173_pos, rx1173_eos, rxscan1177_done
  rxscan1177_scan:
    set_addr $I10, rxscan1177_loop
    rx1173_cur."!mark_push"(0, rx1173_pos, $I10)
  rxscan1177_done:
.annotate 'line', 526
  # rx subcapture "sym"
    set_addr $I10, rxcap_1178_fail
    rx1173_cur."!mark_push"(0, rx1173_pos, $I10)
  # rx literal  "=="
    add $I11, rx1173_pos, 2
    gt $I11, rx1173_eos, rx1173_fail
    sub $I11, rx1173_pos, rx1173_off
    substr $S10, rx1173_tgt, $I11, 2
    ne $S10, "==", rx1173_fail
    add rx1173_pos, 2
    set_addr $I10, rxcap_1178_fail
    ($I12, $I11) = rx1173_cur."!mark_peek"($I10)
    rx1173_cur."!cursor_pos"($I11)
    ($P10) = rx1173_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1173_pos, "")
    rx1173_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1178_done
  rxcap_1178_fail:
    goto rx1173_fail
  rxcap_1178_done:
  # rx subrule "O" subtype=capture negate=
    rx1173_cur."!cursor_pos"(rx1173_pos)
    $P10 = rx1173_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx1173_fail
    rx1173_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1173_pos = $P10."pos"()
  # rx pass
    rx1173_cur."!cursor_pass"(rx1173_pos, "infix:sym<==>")
    if_null rx1173_debug, debug_927
    rx1173_cur."!cursor_debug"("PASS", "infix:sym<==>", " at pos=", rx1173_pos)
  debug_927:
    .return (rx1173_cur)
  rx1173_restart:
.annotate 'line', 454
    if_null rx1173_debug, debug_928
    rx1173_cur."!cursor_debug"("NEXT", "infix:sym<==>")
  debug_928:
  rx1173_fail:
    (rx1173_rep, rx1173_pos, $I10, $P10) = rx1173_cur."!mark_fail"(0)
    lt rx1173_pos, -1, rx1173_done
    eq rx1173_pos, -1, rx1173_fail
    jump $I10
  rx1173_done:
    rx1173_cur."!cursor_fail"()
    if_null rx1173_debug, debug_929
    rx1173_cur."!cursor_debug"("FAIL", "infix:sym<==>")
  debug_929:
    .return (rx1173_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("301_1284728478.15265") :method
.annotate 'line', 454
    $P1175 = self."!PREFIX__!subrule"("O", "==")
    new $P1176, "ResizablePMCArray"
    push $P1176, $P1175
    .return ($P1176)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("302_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1180_tgt
    .local int rx1180_pos
    .local int rx1180_off
    .local int rx1180_eos
    .local int rx1180_rep
    .local pmc rx1180_cur
    .local pmc rx1180_debug
    (rx1180_cur, rx1180_pos, rx1180_tgt, $I10) = self."!cursor_start"()
    getattribute rx1180_debug, rx1180_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1180_cur
    .local pmc match
    .lex "$/", match
    length rx1180_eos, rx1180_tgt
    gt rx1180_pos, rx1180_eos, rx1180_done
    set rx1180_off, 0
    lt rx1180_pos, 2, rx1180_start
    sub rx1180_off, rx1180_pos, 1
    substr rx1180_tgt, rx1180_tgt, rx1180_off
  rx1180_start:
    eq $I10, 1, rx1180_restart
    if_null rx1180_debug, debug_930
    rx1180_cur."!cursor_debug"("START", "infix:sym<!=>")
  debug_930:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1184_done
    goto rxscan1184_scan
  rxscan1184_loop:
    ($P10) = rx1180_cur."from"()
    inc $P10
    set rx1180_pos, $P10
    ge rx1180_pos, rx1180_eos, rxscan1184_done
  rxscan1184_scan:
    set_addr $I10, rxscan1184_loop
    rx1180_cur."!mark_push"(0, rx1180_pos, $I10)
  rxscan1184_done:
.annotate 'line', 527
  # rx subcapture "sym"
    set_addr $I10, rxcap_1185_fail
    rx1180_cur."!mark_push"(0, rx1180_pos, $I10)
  # rx literal  "!="
    add $I11, rx1180_pos, 2
    gt $I11, rx1180_eos, rx1180_fail
    sub $I11, rx1180_pos, rx1180_off
    substr $S10, rx1180_tgt, $I11, 2
    ne $S10, "!=", rx1180_fail
    add rx1180_pos, 2
    set_addr $I10, rxcap_1185_fail
    ($I12, $I11) = rx1180_cur."!mark_peek"($I10)
    rx1180_cur."!cursor_pos"($I11)
    ($P10) = rx1180_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1180_pos, "")
    rx1180_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1185_done
  rxcap_1185_fail:
    goto rx1180_fail
  rxcap_1185_done:
  # rx subrule "O" subtype=capture negate=
    rx1180_cur."!cursor_pos"(rx1180_pos)
    $P10 = rx1180_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx1180_fail
    rx1180_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1180_pos = $P10."pos"()
  # rx pass
    rx1180_cur."!cursor_pass"(rx1180_pos, "infix:sym<!=>")
    if_null rx1180_debug, debug_931
    rx1180_cur."!cursor_debug"("PASS", "infix:sym<!=>", " at pos=", rx1180_pos)
  debug_931:
    .return (rx1180_cur)
  rx1180_restart:
.annotate 'line', 454
    if_null rx1180_debug, debug_932
    rx1180_cur."!cursor_debug"("NEXT", "infix:sym<!=>")
  debug_932:
  rx1180_fail:
    (rx1180_rep, rx1180_pos, $I10, $P10) = rx1180_cur."!mark_fail"(0)
    lt rx1180_pos, -1, rx1180_done
    eq rx1180_pos, -1, rx1180_fail
    jump $I10
  rx1180_done:
    rx1180_cur."!cursor_fail"()
    if_null rx1180_debug, debug_933
    rx1180_cur."!cursor_debug"("FAIL", "infix:sym<!=>")
  debug_933:
    .return (rx1180_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("303_1284728478.15265") :method
.annotate 'line', 454
    $P1182 = self."!PREFIX__!subrule"("O", "!=")
    new $P1183, "ResizablePMCArray"
    push $P1183, $P1182
    .return ($P1183)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("304_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1187_tgt
    .local int rx1187_pos
    .local int rx1187_off
    .local int rx1187_eos
    .local int rx1187_rep
    .local pmc rx1187_cur
    .local pmc rx1187_debug
    (rx1187_cur, rx1187_pos, rx1187_tgt, $I10) = self."!cursor_start"()
    getattribute rx1187_debug, rx1187_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1187_cur
    .local pmc match
    .lex "$/", match
    length rx1187_eos, rx1187_tgt
    gt rx1187_pos, rx1187_eos, rx1187_done
    set rx1187_off, 0
    lt rx1187_pos, 2, rx1187_start
    sub rx1187_off, rx1187_pos, 1
    substr rx1187_tgt, rx1187_tgt, rx1187_off
  rx1187_start:
    eq $I10, 1, rx1187_restart
    if_null rx1187_debug, debug_934
    rx1187_cur."!cursor_debug"("START", "infix:sym<<=>")
  debug_934:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1191_done
    goto rxscan1191_scan
  rxscan1191_loop:
    ($P10) = rx1187_cur."from"()
    inc $P10
    set rx1187_pos, $P10
    ge rx1187_pos, rx1187_eos, rxscan1191_done
  rxscan1191_scan:
    set_addr $I10, rxscan1191_loop
    rx1187_cur."!mark_push"(0, rx1187_pos, $I10)
  rxscan1191_done:
.annotate 'line', 528
  # rx subcapture "sym"
    set_addr $I10, rxcap_1192_fail
    rx1187_cur."!mark_push"(0, rx1187_pos, $I10)
  # rx literal  "<="
    add $I11, rx1187_pos, 2
    gt $I11, rx1187_eos, rx1187_fail
    sub $I11, rx1187_pos, rx1187_off
    substr $S10, rx1187_tgt, $I11, 2
    ne $S10, "<=", rx1187_fail
    add rx1187_pos, 2
    set_addr $I10, rxcap_1192_fail
    ($I12, $I11) = rx1187_cur."!mark_peek"($I10)
    rx1187_cur."!cursor_pos"($I11)
    ($P10) = rx1187_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1187_pos, "")
    rx1187_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1192_done
  rxcap_1192_fail:
    goto rx1187_fail
  rxcap_1192_done:
  # rx subrule "O" subtype=capture negate=
    rx1187_cur."!cursor_pos"(rx1187_pos)
    $P10 = rx1187_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx1187_fail
    rx1187_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1187_pos = $P10."pos"()
  # rx pass
    rx1187_cur."!cursor_pass"(rx1187_pos, "infix:sym<<=>")
    if_null rx1187_debug, debug_935
    rx1187_cur."!cursor_debug"("PASS", "infix:sym<<=>", " at pos=", rx1187_pos)
  debug_935:
    .return (rx1187_cur)
  rx1187_restart:
.annotate 'line', 454
    if_null rx1187_debug, debug_936
    rx1187_cur."!cursor_debug"("NEXT", "infix:sym<<=>")
  debug_936:
  rx1187_fail:
    (rx1187_rep, rx1187_pos, $I10, $P10) = rx1187_cur."!mark_fail"(0)
    lt rx1187_pos, -1, rx1187_done
    eq rx1187_pos, -1, rx1187_fail
    jump $I10
  rx1187_done:
    rx1187_cur."!cursor_fail"()
    if_null rx1187_debug, debug_937
    rx1187_cur."!cursor_debug"("FAIL", "infix:sym<<=>")
  debug_937:
    .return (rx1187_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("305_1284728478.15265") :method
.annotate 'line', 454
    $P1189 = self."!PREFIX__!subrule"("O", "<=")
    new $P1190, "ResizablePMCArray"
    push $P1190, $P1189
    .return ($P1190)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("306_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1194_tgt
    .local int rx1194_pos
    .local int rx1194_off
    .local int rx1194_eos
    .local int rx1194_rep
    .local pmc rx1194_cur
    .local pmc rx1194_debug
    (rx1194_cur, rx1194_pos, rx1194_tgt, $I10) = self."!cursor_start"()
    getattribute rx1194_debug, rx1194_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1194_cur
    .local pmc match
    .lex "$/", match
    length rx1194_eos, rx1194_tgt
    gt rx1194_pos, rx1194_eos, rx1194_done
    set rx1194_off, 0
    lt rx1194_pos, 2, rx1194_start
    sub rx1194_off, rx1194_pos, 1
    substr rx1194_tgt, rx1194_tgt, rx1194_off
  rx1194_start:
    eq $I10, 1, rx1194_restart
    if_null rx1194_debug, debug_938
    rx1194_cur."!cursor_debug"("START", "infix:sym<>=>")
  debug_938:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1198_done
    goto rxscan1198_scan
  rxscan1198_loop:
    ($P10) = rx1194_cur."from"()
    inc $P10
    set rx1194_pos, $P10
    ge rx1194_pos, rx1194_eos, rxscan1198_done
  rxscan1198_scan:
    set_addr $I10, rxscan1198_loop
    rx1194_cur."!mark_push"(0, rx1194_pos, $I10)
  rxscan1198_done:
.annotate 'line', 529
  # rx subcapture "sym"
    set_addr $I10, rxcap_1199_fail
    rx1194_cur."!mark_push"(0, rx1194_pos, $I10)
  # rx literal  ">="
    add $I11, rx1194_pos, 2
    gt $I11, rx1194_eos, rx1194_fail
    sub $I11, rx1194_pos, rx1194_off
    substr $S10, rx1194_tgt, $I11, 2
    ne $S10, ">=", rx1194_fail
    add rx1194_pos, 2
    set_addr $I10, rxcap_1199_fail
    ($I12, $I11) = rx1194_cur."!mark_peek"($I10)
    rx1194_cur."!cursor_pos"($I11)
    ($P10) = rx1194_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1194_pos, "")
    rx1194_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1199_done
  rxcap_1199_fail:
    goto rx1194_fail
  rxcap_1199_done:
  # rx subrule "O" subtype=capture negate=
    rx1194_cur."!cursor_pos"(rx1194_pos)
    $P10 = rx1194_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx1194_fail
    rx1194_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1194_pos = $P10."pos"()
  # rx pass
    rx1194_cur."!cursor_pass"(rx1194_pos, "infix:sym<>=>")
    if_null rx1194_debug, debug_939
    rx1194_cur."!cursor_debug"("PASS", "infix:sym<>=>", " at pos=", rx1194_pos)
  debug_939:
    .return (rx1194_cur)
  rx1194_restart:
.annotate 'line', 454
    if_null rx1194_debug, debug_940
    rx1194_cur."!cursor_debug"("NEXT", "infix:sym<>=>")
  debug_940:
  rx1194_fail:
    (rx1194_rep, rx1194_pos, $I10, $P10) = rx1194_cur."!mark_fail"(0)
    lt rx1194_pos, -1, rx1194_done
    eq rx1194_pos, -1, rx1194_fail
    jump $I10
  rx1194_done:
    rx1194_cur."!cursor_fail"()
    if_null rx1194_debug, debug_941
    rx1194_cur."!cursor_debug"("FAIL", "infix:sym<>=>")
  debug_941:
    .return (rx1194_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("307_1284728478.15265") :method
.annotate 'line', 454
    $P1196 = self."!PREFIX__!subrule"("O", ">=")
    new $P1197, "ResizablePMCArray"
    push $P1197, $P1196
    .return ($P1197)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("308_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1201_tgt
    .local int rx1201_pos
    .local int rx1201_off
    .local int rx1201_eos
    .local int rx1201_rep
    .local pmc rx1201_cur
    .local pmc rx1201_debug
    (rx1201_cur, rx1201_pos, rx1201_tgt, $I10) = self."!cursor_start"()
    getattribute rx1201_debug, rx1201_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1201_cur
    .local pmc match
    .lex "$/", match
    length rx1201_eos, rx1201_tgt
    gt rx1201_pos, rx1201_eos, rx1201_done
    set rx1201_off, 0
    lt rx1201_pos, 2, rx1201_start
    sub rx1201_off, rx1201_pos, 1
    substr rx1201_tgt, rx1201_tgt, rx1201_off
  rx1201_start:
    eq $I10, 1, rx1201_restart
    if_null rx1201_debug, debug_942
    rx1201_cur."!cursor_debug"("START", "infix:sym<<>")
  debug_942:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1205_done
    goto rxscan1205_scan
  rxscan1205_loop:
    ($P10) = rx1201_cur."from"()
    inc $P10
    set rx1201_pos, $P10
    ge rx1201_pos, rx1201_eos, rxscan1205_done
  rxscan1205_scan:
    set_addr $I10, rxscan1205_loop
    rx1201_cur."!mark_push"(0, rx1201_pos, $I10)
  rxscan1205_done:
.annotate 'line', 530
  # rx subcapture "sym"
    set_addr $I10, rxcap_1206_fail
    rx1201_cur."!mark_push"(0, rx1201_pos, $I10)
  # rx literal  "<"
    add $I11, rx1201_pos, 1
    gt $I11, rx1201_eos, rx1201_fail
    sub $I11, rx1201_pos, rx1201_off
    ord $I11, rx1201_tgt, $I11
    ne $I11, 60, rx1201_fail
    add rx1201_pos, 1
    set_addr $I10, rxcap_1206_fail
    ($I12, $I11) = rx1201_cur."!mark_peek"($I10)
    rx1201_cur."!cursor_pos"($I11)
    ($P10) = rx1201_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1201_pos, "")
    rx1201_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1206_done
  rxcap_1206_fail:
    goto rx1201_fail
  rxcap_1206_done:
  # rx subrule "O" subtype=capture negate=
    rx1201_cur."!cursor_pos"(rx1201_pos)
    $P10 = rx1201_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx1201_fail
    rx1201_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1201_pos = $P10."pos"()
  # rx pass
    rx1201_cur."!cursor_pass"(rx1201_pos, "infix:sym<<>")
    if_null rx1201_debug, debug_943
    rx1201_cur."!cursor_debug"("PASS", "infix:sym<<>", " at pos=", rx1201_pos)
  debug_943:
    .return (rx1201_cur)
  rx1201_restart:
.annotate 'line', 454
    if_null rx1201_debug, debug_944
    rx1201_cur."!cursor_debug"("NEXT", "infix:sym<<>")
  debug_944:
  rx1201_fail:
    (rx1201_rep, rx1201_pos, $I10, $P10) = rx1201_cur."!mark_fail"(0)
    lt rx1201_pos, -1, rx1201_done
    eq rx1201_pos, -1, rx1201_fail
    jump $I10
  rx1201_done:
    rx1201_cur."!cursor_fail"()
    if_null rx1201_debug, debug_945
    rx1201_cur."!cursor_debug"("FAIL", "infix:sym<<>")
  debug_945:
    .return (rx1201_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("309_1284728478.15265") :method
.annotate 'line', 454
    $P1203 = self."!PREFIX__!subrule"("O", "<")
    new $P1204, "ResizablePMCArray"
    push $P1204, $P1203
    .return ($P1204)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("310_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1208_tgt
    .local int rx1208_pos
    .local int rx1208_off
    .local int rx1208_eos
    .local int rx1208_rep
    .local pmc rx1208_cur
    .local pmc rx1208_debug
    (rx1208_cur, rx1208_pos, rx1208_tgt, $I10) = self."!cursor_start"()
    getattribute rx1208_debug, rx1208_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1208_cur
    .local pmc match
    .lex "$/", match
    length rx1208_eos, rx1208_tgt
    gt rx1208_pos, rx1208_eos, rx1208_done
    set rx1208_off, 0
    lt rx1208_pos, 2, rx1208_start
    sub rx1208_off, rx1208_pos, 1
    substr rx1208_tgt, rx1208_tgt, rx1208_off
  rx1208_start:
    eq $I10, 1, rx1208_restart
    if_null rx1208_debug, debug_946
    rx1208_cur."!cursor_debug"("START", "infix:sym<>>")
  debug_946:
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
.annotate 'line', 531
  # rx subcapture "sym"
    set_addr $I10, rxcap_1213_fail
    rx1208_cur."!mark_push"(0, rx1208_pos, $I10)
  # rx literal  ">"
    add $I11, rx1208_pos, 1
    gt $I11, rx1208_eos, rx1208_fail
    sub $I11, rx1208_pos, rx1208_off
    ord $I11, rx1208_tgt, $I11
    ne $I11, 62, rx1208_fail
    add rx1208_pos, 1
    set_addr $I10, rxcap_1213_fail
    ($I12, $I11) = rx1208_cur."!mark_peek"($I10)
    rx1208_cur."!cursor_pos"($I11)
    ($P10) = rx1208_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1208_pos, "")
    rx1208_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1213_done
  rxcap_1213_fail:
    goto rx1208_fail
  rxcap_1213_done:
  # rx subrule "O" subtype=capture negate=
    rx1208_cur."!cursor_pos"(rx1208_pos)
    $P10 = rx1208_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx1208_fail
    rx1208_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1208_pos = $P10."pos"()
  # rx pass
    rx1208_cur."!cursor_pass"(rx1208_pos, "infix:sym<>>")
    if_null rx1208_debug, debug_947
    rx1208_cur."!cursor_debug"("PASS", "infix:sym<>>", " at pos=", rx1208_pos)
  debug_947:
    .return (rx1208_cur)
  rx1208_restart:
.annotate 'line', 454
    if_null rx1208_debug, debug_948
    rx1208_cur."!cursor_debug"("NEXT", "infix:sym<>>")
  debug_948:
  rx1208_fail:
    (rx1208_rep, rx1208_pos, $I10, $P10) = rx1208_cur."!mark_fail"(0)
    lt rx1208_pos, -1, rx1208_done
    eq rx1208_pos, -1, rx1208_fail
    jump $I10
  rx1208_done:
    rx1208_cur."!cursor_fail"()
    if_null rx1208_debug, debug_949
    rx1208_cur."!cursor_debug"("FAIL", "infix:sym<>>")
  debug_949:
    .return (rx1208_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("311_1284728478.15265") :method
.annotate 'line', 454
    $P1210 = self."!PREFIX__!subrule"("O", ">")
    new $P1211, "ResizablePMCArray"
    push $P1211, $P1210
    .return ($P1211)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("312_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1215_tgt
    .local int rx1215_pos
    .local int rx1215_off
    .local int rx1215_eos
    .local int rx1215_rep
    .local pmc rx1215_cur
    .local pmc rx1215_debug
    (rx1215_cur, rx1215_pos, rx1215_tgt, $I10) = self."!cursor_start"()
    getattribute rx1215_debug, rx1215_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1215_cur
    .local pmc match
    .lex "$/", match
    length rx1215_eos, rx1215_tgt
    gt rx1215_pos, rx1215_eos, rx1215_done
    set rx1215_off, 0
    lt rx1215_pos, 2, rx1215_start
    sub rx1215_off, rx1215_pos, 1
    substr rx1215_tgt, rx1215_tgt, rx1215_off
  rx1215_start:
    eq $I10, 1, rx1215_restart
    if_null rx1215_debug, debug_950
    rx1215_cur."!cursor_debug"("START", "infix:sym<eq>")
  debug_950:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1219_done
    goto rxscan1219_scan
  rxscan1219_loop:
    ($P10) = rx1215_cur."from"()
    inc $P10
    set rx1215_pos, $P10
    ge rx1215_pos, rx1215_eos, rxscan1219_done
  rxscan1219_scan:
    set_addr $I10, rxscan1219_loop
    rx1215_cur."!mark_push"(0, rx1215_pos, $I10)
  rxscan1219_done:
.annotate 'line', 532
  # rx subcapture "sym"
    set_addr $I10, rxcap_1220_fail
    rx1215_cur."!mark_push"(0, rx1215_pos, $I10)
  # rx literal  "eq"
    add $I11, rx1215_pos, 2
    gt $I11, rx1215_eos, rx1215_fail
    sub $I11, rx1215_pos, rx1215_off
    substr $S10, rx1215_tgt, $I11, 2
    ne $S10, "eq", rx1215_fail
    add rx1215_pos, 2
    set_addr $I10, rxcap_1220_fail
    ($I12, $I11) = rx1215_cur."!mark_peek"($I10)
    rx1215_cur."!cursor_pos"($I11)
    ($P10) = rx1215_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1215_pos, "")
    rx1215_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1220_done
  rxcap_1220_fail:
    goto rx1215_fail
  rxcap_1220_done:
  # rx subrule "O" subtype=capture negate=
    rx1215_cur."!cursor_pos"(rx1215_pos)
    $P10 = rx1215_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx1215_fail
    rx1215_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1215_pos = $P10."pos"()
  # rx pass
    rx1215_cur."!cursor_pass"(rx1215_pos, "infix:sym<eq>")
    if_null rx1215_debug, debug_951
    rx1215_cur."!cursor_debug"("PASS", "infix:sym<eq>", " at pos=", rx1215_pos)
  debug_951:
    .return (rx1215_cur)
  rx1215_restart:
.annotate 'line', 454
    if_null rx1215_debug, debug_952
    rx1215_cur."!cursor_debug"("NEXT", "infix:sym<eq>")
  debug_952:
  rx1215_fail:
    (rx1215_rep, rx1215_pos, $I10, $P10) = rx1215_cur."!mark_fail"(0)
    lt rx1215_pos, -1, rx1215_done
    eq rx1215_pos, -1, rx1215_fail
    jump $I10
  rx1215_done:
    rx1215_cur."!cursor_fail"()
    if_null rx1215_debug, debug_953
    rx1215_cur."!cursor_debug"("FAIL", "infix:sym<eq>")
  debug_953:
    .return (rx1215_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("313_1284728478.15265") :method
.annotate 'line', 454
    $P1217 = self."!PREFIX__!subrule"("O", "eq")
    new $P1218, "ResizablePMCArray"
    push $P1218, $P1217
    .return ($P1218)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("314_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1222_tgt
    .local int rx1222_pos
    .local int rx1222_off
    .local int rx1222_eos
    .local int rx1222_rep
    .local pmc rx1222_cur
    .local pmc rx1222_debug
    (rx1222_cur, rx1222_pos, rx1222_tgt, $I10) = self."!cursor_start"()
    getattribute rx1222_debug, rx1222_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1222_cur
    .local pmc match
    .lex "$/", match
    length rx1222_eos, rx1222_tgt
    gt rx1222_pos, rx1222_eos, rx1222_done
    set rx1222_off, 0
    lt rx1222_pos, 2, rx1222_start
    sub rx1222_off, rx1222_pos, 1
    substr rx1222_tgt, rx1222_tgt, rx1222_off
  rx1222_start:
    eq $I10, 1, rx1222_restart
    if_null rx1222_debug, debug_954
    rx1222_cur."!cursor_debug"("START", "infix:sym<ne>")
  debug_954:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1226_done
    goto rxscan1226_scan
  rxscan1226_loop:
    ($P10) = rx1222_cur."from"()
    inc $P10
    set rx1222_pos, $P10
    ge rx1222_pos, rx1222_eos, rxscan1226_done
  rxscan1226_scan:
    set_addr $I10, rxscan1226_loop
    rx1222_cur."!mark_push"(0, rx1222_pos, $I10)
  rxscan1226_done:
.annotate 'line', 533
  # rx subcapture "sym"
    set_addr $I10, rxcap_1227_fail
    rx1222_cur."!mark_push"(0, rx1222_pos, $I10)
  # rx literal  "ne"
    add $I11, rx1222_pos, 2
    gt $I11, rx1222_eos, rx1222_fail
    sub $I11, rx1222_pos, rx1222_off
    substr $S10, rx1222_tgt, $I11, 2
    ne $S10, "ne", rx1222_fail
    add rx1222_pos, 2
    set_addr $I10, rxcap_1227_fail
    ($I12, $I11) = rx1222_cur."!mark_peek"($I10)
    rx1222_cur."!cursor_pos"($I11)
    ($P10) = rx1222_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1222_pos, "")
    rx1222_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1227_done
  rxcap_1227_fail:
    goto rx1222_fail
  rxcap_1227_done:
  # rx subrule "O" subtype=capture negate=
    rx1222_cur."!cursor_pos"(rx1222_pos)
    $P10 = rx1222_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx1222_fail
    rx1222_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1222_pos = $P10."pos"()
  # rx pass
    rx1222_cur."!cursor_pass"(rx1222_pos, "infix:sym<ne>")
    if_null rx1222_debug, debug_955
    rx1222_cur."!cursor_debug"("PASS", "infix:sym<ne>", " at pos=", rx1222_pos)
  debug_955:
    .return (rx1222_cur)
  rx1222_restart:
.annotate 'line', 454
    if_null rx1222_debug, debug_956
    rx1222_cur."!cursor_debug"("NEXT", "infix:sym<ne>")
  debug_956:
  rx1222_fail:
    (rx1222_rep, rx1222_pos, $I10, $P10) = rx1222_cur."!mark_fail"(0)
    lt rx1222_pos, -1, rx1222_done
    eq rx1222_pos, -1, rx1222_fail
    jump $I10
  rx1222_done:
    rx1222_cur."!cursor_fail"()
    if_null rx1222_debug, debug_957
    rx1222_cur."!cursor_debug"("FAIL", "infix:sym<ne>")
  debug_957:
    .return (rx1222_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("315_1284728478.15265") :method
.annotate 'line', 454
    $P1224 = self."!PREFIX__!subrule"("O", "ne")
    new $P1225, "ResizablePMCArray"
    push $P1225, $P1224
    .return ($P1225)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("316_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1229_tgt
    .local int rx1229_pos
    .local int rx1229_off
    .local int rx1229_eos
    .local int rx1229_rep
    .local pmc rx1229_cur
    .local pmc rx1229_debug
    (rx1229_cur, rx1229_pos, rx1229_tgt, $I10) = self."!cursor_start"()
    getattribute rx1229_debug, rx1229_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1229_cur
    .local pmc match
    .lex "$/", match
    length rx1229_eos, rx1229_tgt
    gt rx1229_pos, rx1229_eos, rx1229_done
    set rx1229_off, 0
    lt rx1229_pos, 2, rx1229_start
    sub rx1229_off, rx1229_pos, 1
    substr rx1229_tgt, rx1229_tgt, rx1229_off
  rx1229_start:
    eq $I10, 1, rx1229_restart
    if_null rx1229_debug, debug_958
    rx1229_cur."!cursor_debug"("START", "infix:sym<le>")
  debug_958:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1233_done
    goto rxscan1233_scan
  rxscan1233_loop:
    ($P10) = rx1229_cur."from"()
    inc $P10
    set rx1229_pos, $P10
    ge rx1229_pos, rx1229_eos, rxscan1233_done
  rxscan1233_scan:
    set_addr $I10, rxscan1233_loop
    rx1229_cur."!mark_push"(0, rx1229_pos, $I10)
  rxscan1233_done:
.annotate 'line', 534
  # rx subcapture "sym"
    set_addr $I10, rxcap_1234_fail
    rx1229_cur."!mark_push"(0, rx1229_pos, $I10)
  # rx literal  "le"
    add $I11, rx1229_pos, 2
    gt $I11, rx1229_eos, rx1229_fail
    sub $I11, rx1229_pos, rx1229_off
    substr $S10, rx1229_tgt, $I11, 2
    ne $S10, "le", rx1229_fail
    add rx1229_pos, 2
    set_addr $I10, rxcap_1234_fail
    ($I12, $I11) = rx1229_cur."!mark_peek"($I10)
    rx1229_cur."!cursor_pos"($I11)
    ($P10) = rx1229_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1229_pos, "")
    rx1229_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1234_done
  rxcap_1234_fail:
    goto rx1229_fail
  rxcap_1234_done:
  # rx subrule "O" subtype=capture negate=
    rx1229_cur."!cursor_pos"(rx1229_pos)
    $P10 = rx1229_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx1229_fail
    rx1229_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1229_pos = $P10."pos"()
  # rx pass
    rx1229_cur."!cursor_pass"(rx1229_pos, "infix:sym<le>")
    if_null rx1229_debug, debug_959
    rx1229_cur."!cursor_debug"("PASS", "infix:sym<le>", " at pos=", rx1229_pos)
  debug_959:
    .return (rx1229_cur)
  rx1229_restart:
.annotate 'line', 454
    if_null rx1229_debug, debug_960
    rx1229_cur."!cursor_debug"("NEXT", "infix:sym<le>")
  debug_960:
  rx1229_fail:
    (rx1229_rep, rx1229_pos, $I10, $P10) = rx1229_cur."!mark_fail"(0)
    lt rx1229_pos, -1, rx1229_done
    eq rx1229_pos, -1, rx1229_fail
    jump $I10
  rx1229_done:
    rx1229_cur."!cursor_fail"()
    if_null rx1229_debug, debug_961
    rx1229_cur."!cursor_debug"("FAIL", "infix:sym<le>")
  debug_961:
    .return (rx1229_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("317_1284728478.15265") :method
.annotate 'line', 454
    $P1231 = self."!PREFIX__!subrule"("O", "le")
    new $P1232, "ResizablePMCArray"
    push $P1232, $P1231
    .return ($P1232)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("318_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1236_tgt
    .local int rx1236_pos
    .local int rx1236_off
    .local int rx1236_eos
    .local int rx1236_rep
    .local pmc rx1236_cur
    .local pmc rx1236_debug
    (rx1236_cur, rx1236_pos, rx1236_tgt, $I10) = self."!cursor_start"()
    getattribute rx1236_debug, rx1236_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1236_cur
    .local pmc match
    .lex "$/", match
    length rx1236_eos, rx1236_tgt
    gt rx1236_pos, rx1236_eos, rx1236_done
    set rx1236_off, 0
    lt rx1236_pos, 2, rx1236_start
    sub rx1236_off, rx1236_pos, 1
    substr rx1236_tgt, rx1236_tgt, rx1236_off
  rx1236_start:
    eq $I10, 1, rx1236_restart
    if_null rx1236_debug, debug_962
    rx1236_cur."!cursor_debug"("START", "infix:sym<ge>")
  debug_962:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1240_done
    goto rxscan1240_scan
  rxscan1240_loop:
    ($P10) = rx1236_cur."from"()
    inc $P10
    set rx1236_pos, $P10
    ge rx1236_pos, rx1236_eos, rxscan1240_done
  rxscan1240_scan:
    set_addr $I10, rxscan1240_loop
    rx1236_cur."!mark_push"(0, rx1236_pos, $I10)
  rxscan1240_done:
.annotate 'line', 535
  # rx subcapture "sym"
    set_addr $I10, rxcap_1241_fail
    rx1236_cur."!mark_push"(0, rx1236_pos, $I10)
  # rx literal  "ge"
    add $I11, rx1236_pos, 2
    gt $I11, rx1236_eos, rx1236_fail
    sub $I11, rx1236_pos, rx1236_off
    substr $S10, rx1236_tgt, $I11, 2
    ne $S10, "ge", rx1236_fail
    add rx1236_pos, 2
    set_addr $I10, rxcap_1241_fail
    ($I12, $I11) = rx1236_cur."!mark_peek"($I10)
    rx1236_cur."!cursor_pos"($I11)
    ($P10) = rx1236_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1236_pos, "")
    rx1236_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1241_done
  rxcap_1241_fail:
    goto rx1236_fail
  rxcap_1241_done:
  # rx subrule "O" subtype=capture negate=
    rx1236_cur."!cursor_pos"(rx1236_pos)
    $P10 = rx1236_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx1236_fail
    rx1236_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1236_pos = $P10."pos"()
  # rx pass
    rx1236_cur."!cursor_pass"(rx1236_pos, "infix:sym<ge>")
    if_null rx1236_debug, debug_963
    rx1236_cur."!cursor_debug"("PASS", "infix:sym<ge>", " at pos=", rx1236_pos)
  debug_963:
    .return (rx1236_cur)
  rx1236_restart:
.annotate 'line', 454
    if_null rx1236_debug, debug_964
    rx1236_cur."!cursor_debug"("NEXT", "infix:sym<ge>")
  debug_964:
  rx1236_fail:
    (rx1236_rep, rx1236_pos, $I10, $P10) = rx1236_cur."!mark_fail"(0)
    lt rx1236_pos, -1, rx1236_done
    eq rx1236_pos, -1, rx1236_fail
    jump $I10
  rx1236_done:
    rx1236_cur."!cursor_fail"()
    if_null rx1236_debug, debug_965
    rx1236_cur."!cursor_debug"("FAIL", "infix:sym<ge>")
  debug_965:
    .return (rx1236_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("319_1284728478.15265") :method
.annotate 'line', 454
    $P1238 = self."!PREFIX__!subrule"("O", "ge")
    new $P1239, "ResizablePMCArray"
    push $P1239, $P1238
    .return ($P1239)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("320_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1243_tgt
    .local int rx1243_pos
    .local int rx1243_off
    .local int rx1243_eos
    .local int rx1243_rep
    .local pmc rx1243_cur
    .local pmc rx1243_debug
    (rx1243_cur, rx1243_pos, rx1243_tgt, $I10) = self."!cursor_start"()
    getattribute rx1243_debug, rx1243_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1243_cur
    .local pmc match
    .lex "$/", match
    length rx1243_eos, rx1243_tgt
    gt rx1243_pos, rx1243_eos, rx1243_done
    set rx1243_off, 0
    lt rx1243_pos, 2, rx1243_start
    sub rx1243_off, rx1243_pos, 1
    substr rx1243_tgt, rx1243_tgt, rx1243_off
  rx1243_start:
    eq $I10, 1, rx1243_restart
    if_null rx1243_debug, debug_966
    rx1243_cur."!cursor_debug"("START", "infix:sym<lt>")
  debug_966:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1247_done
    goto rxscan1247_scan
  rxscan1247_loop:
    ($P10) = rx1243_cur."from"()
    inc $P10
    set rx1243_pos, $P10
    ge rx1243_pos, rx1243_eos, rxscan1247_done
  rxscan1247_scan:
    set_addr $I10, rxscan1247_loop
    rx1243_cur."!mark_push"(0, rx1243_pos, $I10)
  rxscan1247_done:
.annotate 'line', 536
  # rx subcapture "sym"
    set_addr $I10, rxcap_1248_fail
    rx1243_cur."!mark_push"(0, rx1243_pos, $I10)
  # rx literal  "lt"
    add $I11, rx1243_pos, 2
    gt $I11, rx1243_eos, rx1243_fail
    sub $I11, rx1243_pos, rx1243_off
    substr $S10, rx1243_tgt, $I11, 2
    ne $S10, "lt", rx1243_fail
    add rx1243_pos, 2
    set_addr $I10, rxcap_1248_fail
    ($I12, $I11) = rx1243_cur."!mark_peek"($I10)
    rx1243_cur."!cursor_pos"($I11)
    ($P10) = rx1243_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1243_pos, "")
    rx1243_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1248_done
  rxcap_1248_fail:
    goto rx1243_fail
  rxcap_1248_done:
  # rx subrule "O" subtype=capture negate=
    rx1243_cur."!cursor_pos"(rx1243_pos)
    $P10 = rx1243_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx1243_fail
    rx1243_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1243_pos = $P10."pos"()
  # rx pass
    rx1243_cur."!cursor_pass"(rx1243_pos, "infix:sym<lt>")
    if_null rx1243_debug, debug_967
    rx1243_cur."!cursor_debug"("PASS", "infix:sym<lt>", " at pos=", rx1243_pos)
  debug_967:
    .return (rx1243_cur)
  rx1243_restart:
.annotate 'line', 454
    if_null rx1243_debug, debug_968
    rx1243_cur."!cursor_debug"("NEXT", "infix:sym<lt>")
  debug_968:
  rx1243_fail:
    (rx1243_rep, rx1243_pos, $I10, $P10) = rx1243_cur."!mark_fail"(0)
    lt rx1243_pos, -1, rx1243_done
    eq rx1243_pos, -1, rx1243_fail
    jump $I10
  rx1243_done:
    rx1243_cur."!cursor_fail"()
    if_null rx1243_debug, debug_969
    rx1243_cur."!cursor_debug"("FAIL", "infix:sym<lt>")
  debug_969:
    .return (rx1243_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("321_1284728478.15265") :method
.annotate 'line', 454
    $P1245 = self."!PREFIX__!subrule"("O", "lt")
    new $P1246, "ResizablePMCArray"
    push $P1246, $P1245
    .return ($P1246)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("322_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1250_tgt
    .local int rx1250_pos
    .local int rx1250_off
    .local int rx1250_eos
    .local int rx1250_rep
    .local pmc rx1250_cur
    .local pmc rx1250_debug
    (rx1250_cur, rx1250_pos, rx1250_tgt, $I10) = self."!cursor_start"()
    getattribute rx1250_debug, rx1250_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1250_cur
    .local pmc match
    .lex "$/", match
    length rx1250_eos, rx1250_tgt
    gt rx1250_pos, rx1250_eos, rx1250_done
    set rx1250_off, 0
    lt rx1250_pos, 2, rx1250_start
    sub rx1250_off, rx1250_pos, 1
    substr rx1250_tgt, rx1250_tgt, rx1250_off
  rx1250_start:
    eq $I10, 1, rx1250_restart
    if_null rx1250_debug, debug_970
    rx1250_cur."!cursor_debug"("START", "infix:sym<gt>")
  debug_970:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1254_done
    goto rxscan1254_scan
  rxscan1254_loop:
    ($P10) = rx1250_cur."from"()
    inc $P10
    set rx1250_pos, $P10
    ge rx1250_pos, rx1250_eos, rxscan1254_done
  rxscan1254_scan:
    set_addr $I10, rxscan1254_loop
    rx1250_cur."!mark_push"(0, rx1250_pos, $I10)
  rxscan1254_done:
.annotate 'line', 537
  # rx subcapture "sym"
    set_addr $I10, rxcap_1255_fail
    rx1250_cur."!mark_push"(0, rx1250_pos, $I10)
  # rx literal  "gt"
    add $I11, rx1250_pos, 2
    gt $I11, rx1250_eos, rx1250_fail
    sub $I11, rx1250_pos, rx1250_off
    substr $S10, rx1250_tgt, $I11, 2
    ne $S10, "gt", rx1250_fail
    add rx1250_pos, 2
    set_addr $I10, rxcap_1255_fail
    ($I12, $I11) = rx1250_cur."!mark_peek"($I10)
    rx1250_cur."!cursor_pos"($I11)
    ($P10) = rx1250_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1250_pos, "")
    rx1250_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1255_done
  rxcap_1255_fail:
    goto rx1250_fail
  rxcap_1255_done:
  # rx subrule "O" subtype=capture negate=
    rx1250_cur."!cursor_pos"(rx1250_pos)
    $P10 = rx1250_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx1250_fail
    rx1250_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1250_pos = $P10."pos"()
  # rx pass
    rx1250_cur."!cursor_pass"(rx1250_pos, "infix:sym<gt>")
    if_null rx1250_debug, debug_971
    rx1250_cur."!cursor_debug"("PASS", "infix:sym<gt>", " at pos=", rx1250_pos)
  debug_971:
    .return (rx1250_cur)
  rx1250_restart:
.annotate 'line', 454
    if_null rx1250_debug, debug_972
    rx1250_cur."!cursor_debug"("NEXT", "infix:sym<gt>")
  debug_972:
  rx1250_fail:
    (rx1250_rep, rx1250_pos, $I10, $P10) = rx1250_cur."!mark_fail"(0)
    lt rx1250_pos, -1, rx1250_done
    eq rx1250_pos, -1, rx1250_fail
    jump $I10
  rx1250_done:
    rx1250_cur."!cursor_fail"()
    if_null rx1250_debug, debug_973
    rx1250_cur."!cursor_debug"("FAIL", "infix:sym<gt>")
  debug_973:
    .return (rx1250_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("323_1284728478.15265") :method
.annotate 'line', 454
    $P1252 = self."!PREFIX__!subrule"("O", "gt")
    new $P1253, "ResizablePMCArray"
    push $P1253, $P1252
    .return ($P1253)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("324_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1257_tgt
    .local int rx1257_pos
    .local int rx1257_off
    .local int rx1257_eos
    .local int rx1257_rep
    .local pmc rx1257_cur
    .local pmc rx1257_debug
    (rx1257_cur, rx1257_pos, rx1257_tgt, $I10) = self."!cursor_start"()
    getattribute rx1257_debug, rx1257_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1257_cur
    .local pmc match
    .lex "$/", match
    length rx1257_eos, rx1257_tgt
    gt rx1257_pos, rx1257_eos, rx1257_done
    set rx1257_off, 0
    lt rx1257_pos, 2, rx1257_start
    sub rx1257_off, rx1257_pos, 1
    substr rx1257_tgt, rx1257_tgt, rx1257_off
  rx1257_start:
    eq $I10, 1, rx1257_restart
    if_null rx1257_debug, debug_974
    rx1257_cur."!cursor_debug"("START", "infix:sym<=:=>")
  debug_974:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1261_done
    goto rxscan1261_scan
  rxscan1261_loop:
    ($P10) = rx1257_cur."from"()
    inc $P10
    set rx1257_pos, $P10
    ge rx1257_pos, rx1257_eos, rxscan1261_done
  rxscan1261_scan:
    set_addr $I10, rxscan1261_loop
    rx1257_cur."!mark_push"(0, rx1257_pos, $I10)
  rxscan1261_done:
.annotate 'line', 538
  # rx subcapture "sym"
    set_addr $I10, rxcap_1262_fail
    rx1257_cur."!mark_push"(0, rx1257_pos, $I10)
  # rx literal  "=:="
    add $I11, rx1257_pos, 3
    gt $I11, rx1257_eos, rx1257_fail
    sub $I11, rx1257_pos, rx1257_off
    substr $S10, rx1257_tgt, $I11, 3
    ne $S10, "=:=", rx1257_fail
    add rx1257_pos, 3
    set_addr $I10, rxcap_1262_fail
    ($I12, $I11) = rx1257_cur."!mark_peek"($I10)
    rx1257_cur."!cursor_pos"($I11)
    ($P10) = rx1257_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1257_pos, "")
    rx1257_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1262_done
  rxcap_1262_fail:
    goto rx1257_fail
  rxcap_1262_done:
  # rx subrule "O" subtype=capture negate=
    rx1257_cur."!cursor_pos"(rx1257_pos)
    $P10 = rx1257_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx1257_fail
    rx1257_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1257_pos = $P10."pos"()
  # rx pass
    rx1257_cur."!cursor_pass"(rx1257_pos, "infix:sym<=:=>")
    if_null rx1257_debug, debug_975
    rx1257_cur."!cursor_debug"("PASS", "infix:sym<=:=>", " at pos=", rx1257_pos)
  debug_975:
    .return (rx1257_cur)
  rx1257_restart:
.annotate 'line', 454
    if_null rx1257_debug, debug_976
    rx1257_cur."!cursor_debug"("NEXT", "infix:sym<=:=>")
  debug_976:
  rx1257_fail:
    (rx1257_rep, rx1257_pos, $I10, $P10) = rx1257_cur."!mark_fail"(0)
    lt rx1257_pos, -1, rx1257_done
    eq rx1257_pos, -1, rx1257_fail
    jump $I10
  rx1257_done:
    rx1257_cur."!cursor_fail"()
    if_null rx1257_debug, debug_977
    rx1257_cur."!cursor_debug"("FAIL", "infix:sym<=:=>")
  debug_977:
    .return (rx1257_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("325_1284728478.15265") :method
.annotate 'line', 454
    $P1259 = self."!PREFIX__!subrule"("O", "=:=")
    new $P1260, "ResizablePMCArray"
    push $P1260, $P1259
    .return ($P1260)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~~>"  :subid("326_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1264_tgt
    .local int rx1264_pos
    .local int rx1264_off
    .local int rx1264_eos
    .local int rx1264_rep
    .local pmc rx1264_cur
    .local pmc rx1264_debug
    (rx1264_cur, rx1264_pos, rx1264_tgt, $I10) = self."!cursor_start"()
    getattribute rx1264_debug, rx1264_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1264_cur
    .local pmc match
    .lex "$/", match
    length rx1264_eos, rx1264_tgt
    gt rx1264_pos, rx1264_eos, rx1264_done
    set rx1264_off, 0
    lt rx1264_pos, 2, rx1264_start
    sub rx1264_off, rx1264_pos, 1
    substr rx1264_tgt, rx1264_tgt, rx1264_off
  rx1264_start:
    eq $I10, 1, rx1264_restart
    if_null rx1264_debug, debug_978
    rx1264_cur."!cursor_debug"("START", "infix:sym<~~>")
  debug_978:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1268_done
    goto rxscan1268_scan
  rxscan1268_loop:
    ($P10) = rx1264_cur."from"()
    inc $P10
    set rx1264_pos, $P10
    ge rx1264_pos, rx1264_eos, rxscan1268_done
  rxscan1268_scan:
    set_addr $I10, rxscan1268_loop
    rx1264_cur."!mark_push"(0, rx1264_pos, $I10)
  rxscan1268_done:
.annotate 'line', 539
  # rx subcapture "sym"
    set_addr $I10, rxcap_1269_fail
    rx1264_cur."!mark_push"(0, rx1264_pos, $I10)
  # rx literal  "~~"
    add $I11, rx1264_pos, 2
    gt $I11, rx1264_eos, rx1264_fail
    sub $I11, rx1264_pos, rx1264_off
    substr $S10, rx1264_tgt, $I11, 2
    ne $S10, "~~", rx1264_fail
    add rx1264_pos, 2
    set_addr $I10, rxcap_1269_fail
    ($I12, $I11) = rx1264_cur."!mark_peek"($I10)
    rx1264_cur."!cursor_pos"($I11)
    ($P10) = rx1264_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1264_pos, "")
    rx1264_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1269_done
  rxcap_1269_fail:
    goto rx1264_fail
  rxcap_1269_done:
  # rx subrule "O" subtype=capture negate=
    rx1264_cur."!cursor_pos"(rx1264_pos)
    $P10 = rx1264_cur."O"("%relational, :reducecheck<smartmatch>")
    unless $P10, rx1264_fail
    rx1264_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1264_pos = $P10."pos"()
  # rx pass
    rx1264_cur."!cursor_pass"(rx1264_pos, "infix:sym<~~>")
    if_null rx1264_debug, debug_979
    rx1264_cur."!cursor_debug"("PASS", "infix:sym<~~>", " at pos=", rx1264_pos)
  debug_979:
    .return (rx1264_cur)
  rx1264_restart:
.annotate 'line', 454
    if_null rx1264_debug, debug_980
    rx1264_cur."!cursor_debug"("NEXT", "infix:sym<~~>")
  debug_980:
  rx1264_fail:
    (rx1264_rep, rx1264_pos, $I10, $P10) = rx1264_cur."!mark_fail"(0)
    lt rx1264_pos, -1, rx1264_done
    eq rx1264_pos, -1, rx1264_fail
    jump $I10
  rx1264_done:
    rx1264_cur."!cursor_fail"()
    if_null rx1264_debug, debug_981
    rx1264_cur."!cursor_debug"("FAIL", "infix:sym<~~>")
  debug_981:
    .return (rx1264_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~~>"  :subid("327_1284728478.15265") :method
.annotate 'line', 454
    $P1266 = self."!PREFIX__!subrule"("O", "~~")
    new $P1267, "ResizablePMCArray"
    push $P1267, $P1266
    .return ($P1267)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("328_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1271_tgt
    .local int rx1271_pos
    .local int rx1271_off
    .local int rx1271_eos
    .local int rx1271_rep
    .local pmc rx1271_cur
    .local pmc rx1271_debug
    (rx1271_cur, rx1271_pos, rx1271_tgt, $I10) = self."!cursor_start"()
    getattribute rx1271_debug, rx1271_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1271_cur
    .local pmc match
    .lex "$/", match
    length rx1271_eos, rx1271_tgt
    gt rx1271_pos, rx1271_eos, rx1271_done
    set rx1271_off, 0
    lt rx1271_pos, 2, rx1271_start
    sub rx1271_off, rx1271_pos, 1
    substr rx1271_tgt, rx1271_tgt, rx1271_off
  rx1271_start:
    eq $I10, 1, rx1271_restart
    if_null rx1271_debug, debug_982
    rx1271_cur."!cursor_debug"("START", "infix:sym<&&>")
  debug_982:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1275_done
    goto rxscan1275_scan
  rxscan1275_loop:
    ($P10) = rx1271_cur."from"()
    inc $P10
    set rx1271_pos, $P10
    ge rx1271_pos, rx1271_eos, rxscan1275_done
  rxscan1275_scan:
    set_addr $I10, rxscan1275_loop
    rx1271_cur."!mark_push"(0, rx1271_pos, $I10)
  rxscan1275_done:
.annotate 'line', 541
  # rx subcapture "sym"
    set_addr $I10, rxcap_1276_fail
    rx1271_cur."!mark_push"(0, rx1271_pos, $I10)
  # rx literal  "&&"
    add $I11, rx1271_pos, 2
    gt $I11, rx1271_eos, rx1271_fail
    sub $I11, rx1271_pos, rx1271_off
    substr $S10, rx1271_tgt, $I11, 2
    ne $S10, "&&", rx1271_fail
    add rx1271_pos, 2
    set_addr $I10, rxcap_1276_fail
    ($I12, $I11) = rx1271_cur."!mark_peek"($I10)
    rx1271_cur."!cursor_pos"($I11)
    ($P10) = rx1271_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1271_pos, "")
    rx1271_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1276_done
  rxcap_1276_fail:
    goto rx1271_fail
  rxcap_1276_done:
  # rx subrule "O" subtype=capture negate=
    rx1271_cur."!cursor_pos"(rx1271_pos)
    $P10 = rx1271_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx1271_fail
    rx1271_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1271_pos = $P10."pos"()
  # rx pass
    rx1271_cur."!cursor_pass"(rx1271_pos, "infix:sym<&&>")
    if_null rx1271_debug, debug_983
    rx1271_cur."!cursor_debug"("PASS", "infix:sym<&&>", " at pos=", rx1271_pos)
  debug_983:
    .return (rx1271_cur)
  rx1271_restart:
.annotate 'line', 454
    if_null rx1271_debug, debug_984
    rx1271_cur."!cursor_debug"("NEXT", "infix:sym<&&>")
  debug_984:
  rx1271_fail:
    (rx1271_rep, rx1271_pos, $I10, $P10) = rx1271_cur."!mark_fail"(0)
    lt rx1271_pos, -1, rx1271_done
    eq rx1271_pos, -1, rx1271_fail
    jump $I10
  rx1271_done:
    rx1271_cur."!cursor_fail"()
    if_null rx1271_debug, debug_985
    rx1271_cur."!cursor_debug"("FAIL", "infix:sym<&&>")
  debug_985:
    .return (rx1271_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("329_1284728478.15265") :method
.annotate 'line', 454
    $P1273 = self."!PREFIX__!subrule"("O", "&&")
    new $P1274, "ResizablePMCArray"
    push $P1274, $P1273
    .return ($P1274)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("330_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1278_tgt
    .local int rx1278_pos
    .local int rx1278_off
    .local int rx1278_eos
    .local int rx1278_rep
    .local pmc rx1278_cur
    .local pmc rx1278_debug
    (rx1278_cur, rx1278_pos, rx1278_tgt, $I10) = self."!cursor_start"()
    getattribute rx1278_debug, rx1278_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1278_cur
    .local pmc match
    .lex "$/", match
    length rx1278_eos, rx1278_tgt
    gt rx1278_pos, rx1278_eos, rx1278_done
    set rx1278_off, 0
    lt rx1278_pos, 2, rx1278_start
    sub rx1278_off, rx1278_pos, 1
    substr rx1278_tgt, rx1278_tgt, rx1278_off
  rx1278_start:
    eq $I10, 1, rx1278_restart
    if_null rx1278_debug, debug_986
    rx1278_cur."!cursor_debug"("START", "infix:sym<||>")
  debug_986:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1282_done
    goto rxscan1282_scan
  rxscan1282_loop:
    ($P10) = rx1278_cur."from"()
    inc $P10
    set rx1278_pos, $P10
    ge rx1278_pos, rx1278_eos, rxscan1282_done
  rxscan1282_scan:
    set_addr $I10, rxscan1282_loop
    rx1278_cur."!mark_push"(0, rx1278_pos, $I10)
  rxscan1282_done:
.annotate 'line', 543
  # rx subcapture "sym"
    set_addr $I10, rxcap_1283_fail
    rx1278_cur."!mark_push"(0, rx1278_pos, $I10)
  # rx literal  "||"
    add $I11, rx1278_pos, 2
    gt $I11, rx1278_eos, rx1278_fail
    sub $I11, rx1278_pos, rx1278_off
    substr $S10, rx1278_tgt, $I11, 2
    ne $S10, "||", rx1278_fail
    add rx1278_pos, 2
    set_addr $I10, rxcap_1283_fail
    ($I12, $I11) = rx1278_cur."!mark_peek"($I10)
    rx1278_cur."!cursor_pos"($I11)
    ($P10) = rx1278_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1278_pos, "")
    rx1278_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1283_done
  rxcap_1283_fail:
    goto rx1278_fail
  rxcap_1283_done:
  # rx subrule "O" subtype=capture negate=
    rx1278_cur."!cursor_pos"(rx1278_pos)
    $P10 = rx1278_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx1278_fail
    rx1278_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1278_pos = $P10."pos"()
  # rx pass
    rx1278_cur."!cursor_pass"(rx1278_pos, "infix:sym<||>")
    if_null rx1278_debug, debug_987
    rx1278_cur."!cursor_debug"("PASS", "infix:sym<||>", " at pos=", rx1278_pos)
  debug_987:
    .return (rx1278_cur)
  rx1278_restart:
.annotate 'line', 454
    if_null rx1278_debug, debug_988
    rx1278_cur."!cursor_debug"("NEXT", "infix:sym<||>")
  debug_988:
  rx1278_fail:
    (rx1278_rep, rx1278_pos, $I10, $P10) = rx1278_cur."!mark_fail"(0)
    lt rx1278_pos, -1, rx1278_done
    eq rx1278_pos, -1, rx1278_fail
    jump $I10
  rx1278_done:
    rx1278_cur."!cursor_fail"()
    if_null rx1278_debug, debug_989
    rx1278_cur."!cursor_debug"("FAIL", "infix:sym<||>")
  debug_989:
    .return (rx1278_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("331_1284728478.15265") :method
.annotate 'line', 454
    $P1280 = self."!PREFIX__!subrule"("O", "||")
    new $P1281, "ResizablePMCArray"
    push $P1281, $P1280
    .return ($P1281)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("332_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1285_tgt
    .local int rx1285_pos
    .local int rx1285_off
    .local int rx1285_eos
    .local int rx1285_rep
    .local pmc rx1285_cur
    .local pmc rx1285_debug
    (rx1285_cur, rx1285_pos, rx1285_tgt, $I10) = self."!cursor_start"()
    getattribute rx1285_debug, rx1285_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1285_cur
    .local pmc match
    .lex "$/", match
    length rx1285_eos, rx1285_tgt
    gt rx1285_pos, rx1285_eos, rx1285_done
    set rx1285_off, 0
    lt rx1285_pos, 2, rx1285_start
    sub rx1285_off, rx1285_pos, 1
    substr rx1285_tgt, rx1285_tgt, rx1285_off
  rx1285_start:
    eq $I10, 1, rx1285_restart
    if_null rx1285_debug, debug_990
    rx1285_cur."!cursor_debug"("START", "infix:sym<//>")
  debug_990:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1289_done
    goto rxscan1289_scan
  rxscan1289_loop:
    ($P10) = rx1285_cur."from"()
    inc $P10
    set rx1285_pos, $P10
    ge rx1285_pos, rx1285_eos, rxscan1289_done
  rxscan1289_scan:
    set_addr $I10, rxscan1289_loop
    rx1285_cur."!mark_push"(0, rx1285_pos, $I10)
  rxscan1289_done:
.annotate 'line', 544
  # rx subcapture "sym"
    set_addr $I10, rxcap_1290_fail
    rx1285_cur."!mark_push"(0, rx1285_pos, $I10)
  # rx literal  "//"
    add $I11, rx1285_pos, 2
    gt $I11, rx1285_eos, rx1285_fail
    sub $I11, rx1285_pos, rx1285_off
    substr $S10, rx1285_tgt, $I11, 2
    ne $S10, "//", rx1285_fail
    add rx1285_pos, 2
    set_addr $I10, rxcap_1290_fail
    ($I12, $I11) = rx1285_cur."!mark_peek"($I10)
    rx1285_cur."!cursor_pos"($I11)
    ($P10) = rx1285_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1285_pos, "")
    rx1285_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1290_done
  rxcap_1290_fail:
    goto rx1285_fail
  rxcap_1290_done:
  # rx subrule "O" subtype=capture negate=
    rx1285_cur."!cursor_pos"(rx1285_pos)
    $P10 = rx1285_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx1285_fail
    rx1285_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1285_pos = $P10."pos"()
  # rx pass
    rx1285_cur."!cursor_pass"(rx1285_pos, "infix:sym<//>")
    if_null rx1285_debug, debug_991
    rx1285_cur."!cursor_debug"("PASS", "infix:sym<//>", " at pos=", rx1285_pos)
  debug_991:
    .return (rx1285_cur)
  rx1285_restart:
.annotate 'line', 454
    if_null rx1285_debug, debug_992
    rx1285_cur."!cursor_debug"("NEXT", "infix:sym<//>")
  debug_992:
  rx1285_fail:
    (rx1285_rep, rx1285_pos, $I10, $P10) = rx1285_cur."!mark_fail"(0)
    lt rx1285_pos, -1, rx1285_done
    eq rx1285_pos, -1, rx1285_fail
    jump $I10
  rx1285_done:
    rx1285_cur."!cursor_fail"()
    if_null rx1285_debug, debug_993
    rx1285_cur."!cursor_debug"("FAIL", "infix:sym<//>")
  debug_993:
    .return (rx1285_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("333_1284728478.15265") :method
.annotate 'line', 454
    $P1287 = self."!PREFIX__!subrule"("O", "//")
    new $P1288, "ResizablePMCArray"
    push $P1288, $P1287
    .return ($P1288)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("334_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1292_tgt
    .local int rx1292_pos
    .local int rx1292_off
    .local int rx1292_eos
    .local int rx1292_rep
    .local pmc rx1292_cur
    .local pmc rx1292_debug
    (rx1292_cur, rx1292_pos, rx1292_tgt, $I10) = self."!cursor_start"()
    getattribute rx1292_debug, rx1292_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1292_cur
    .local pmc match
    .lex "$/", match
    length rx1292_eos, rx1292_tgt
    gt rx1292_pos, rx1292_eos, rx1292_done
    set rx1292_off, 0
    lt rx1292_pos, 2, rx1292_start
    sub rx1292_off, rx1292_pos, 1
    substr rx1292_tgt, rx1292_tgt, rx1292_off
  rx1292_start:
    eq $I10, 1, rx1292_restart
    if_null rx1292_debug, debug_994
    rx1292_cur."!cursor_debug"("START", "infix:sym<?? !!>")
  debug_994:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1296_done
    goto rxscan1296_scan
  rxscan1296_loop:
    ($P10) = rx1292_cur."from"()
    inc $P10
    set rx1292_pos, $P10
    ge rx1292_pos, rx1292_eos, rxscan1296_done
  rxscan1296_scan:
    set_addr $I10, rxscan1296_loop
    rx1292_cur."!mark_push"(0, rx1292_pos, $I10)
  rxscan1296_done:
.annotate 'line', 547
  # rx literal  "??"
    add $I11, rx1292_pos, 2
    gt $I11, rx1292_eos, rx1292_fail
    sub $I11, rx1292_pos, rx1292_off
    substr $S10, rx1292_tgt, $I11, 2
    ne $S10, "??", rx1292_fail
    add rx1292_pos, 2
.annotate 'line', 548
  # rx subrule "ws" subtype=method negate=
    rx1292_cur."!cursor_pos"(rx1292_pos)
    $P10 = rx1292_cur."ws"()
    unless $P10, rx1292_fail
    rx1292_pos = $P10."pos"()
.annotate 'line', 549
  # rx subrule "EXPR" subtype=capture negate=
    rx1292_cur."!cursor_pos"(rx1292_pos)
    $P10 = rx1292_cur."EXPR"("i=")
    unless $P10, rx1292_fail
    rx1292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1292_pos = $P10."pos"()
.annotate 'line', 550
  # rx literal  "!!"
    add $I11, rx1292_pos, 2
    gt $I11, rx1292_eos, rx1292_fail
    sub $I11, rx1292_pos, rx1292_off
    substr $S10, rx1292_tgt, $I11, 2
    ne $S10, "!!", rx1292_fail
    add rx1292_pos, 2
.annotate 'line', 551
  # rx subrule "O" subtype=capture negate=
    rx1292_cur."!cursor_pos"(rx1292_pos)
    $P10 = rx1292_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx1292_fail
    rx1292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1292_pos = $P10."pos"()
.annotate 'line', 546
  # rx pass
    rx1292_cur."!cursor_pass"(rx1292_pos, "infix:sym<?? !!>")
    if_null rx1292_debug, debug_995
    rx1292_cur."!cursor_debug"("PASS", "infix:sym<?? !!>", " at pos=", rx1292_pos)
  debug_995:
    .return (rx1292_cur)
  rx1292_restart:
.annotate 'line', 454
    if_null rx1292_debug, debug_996
    rx1292_cur."!cursor_debug"("NEXT", "infix:sym<?? !!>")
  debug_996:
  rx1292_fail:
    (rx1292_rep, rx1292_pos, $I10, $P10) = rx1292_cur."!mark_fail"(0)
    lt rx1292_pos, -1, rx1292_done
    eq rx1292_pos, -1, rx1292_fail
    jump $I10
  rx1292_done:
    rx1292_cur."!cursor_fail"()
    if_null rx1292_debug, debug_997
    rx1292_cur."!cursor_debug"("FAIL", "infix:sym<?? !!>")
  debug_997:
    .return (rx1292_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("335_1284728478.15265") :method
.annotate 'line', 454
    $P1294 = self."!PREFIX__!subrule"("ws", "??")
    new $P1295, "ResizablePMCArray"
    push $P1295, $P1294
    .return ($P1295)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("336_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1298_tgt
    .local int rx1298_pos
    .local int rx1298_off
    .local int rx1298_eos
    .local int rx1298_rep
    .local pmc rx1298_cur
    .local pmc rx1298_debug
    (rx1298_cur, rx1298_pos, rx1298_tgt, $I10) = self."!cursor_start"()
    getattribute rx1298_debug, rx1298_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1298_cur
    .local pmc match
    .lex "$/", match
    length rx1298_eos, rx1298_tgt
    gt rx1298_pos, rx1298_eos, rx1298_done
    set rx1298_off, 0
    lt rx1298_pos, 2, rx1298_start
    sub rx1298_off, rx1298_pos, 1
    substr rx1298_tgt, rx1298_tgt, rx1298_off
  rx1298_start:
    eq $I10, 1, rx1298_restart
    if_null rx1298_debug, debug_998
    rx1298_cur."!cursor_debug"("START", "infix:sym<=>")
  debug_998:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1302_done
    goto rxscan1302_scan
  rxscan1302_loop:
    ($P10) = rx1298_cur."from"()
    inc $P10
    set rx1298_pos, $P10
    ge rx1298_pos, rx1298_eos, rxscan1302_done
  rxscan1302_scan:
    set_addr $I10, rxscan1302_loop
    rx1298_cur."!mark_push"(0, rx1298_pos, $I10)
  rxscan1302_done:
.annotate 'line', 555
  # rx subcapture "sym"
    set_addr $I10, rxcap_1303_fail
    rx1298_cur."!mark_push"(0, rx1298_pos, $I10)
  # rx literal  "="
    add $I11, rx1298_pos, 1
    gt $I11, rx1298_eos, rx1298_fail
    sub $I11, rx1298_pos, rx1298_off
    ord $I11, rx1298_tgt, $I11
    ne $I11, 61, rx1298_fail
    add rx1298_pos, 1
    set_addr $I10, rxcap_1303_fail
    ($I12, $I11) = rx1298_cur."!mark_peek"($I10)
    rx1298_cur."!cursor_pos"($I11)
    ($P10) = rx1298_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1298_pos, "")
    rx1298_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1303_done
  rxcap_1303_fail:
    goto rx1298_fail
  rxcap_1303_done:
  # rx subrule "panic" subtype=method negate=
    rx1298_cur."!cursor_pos"(rx1298_pos)
    $P10 = rx1298_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx1298_fail
    rx1298_pos = $P10."pos"()
.annotate 'line', 554
  # rx pass
    rx1298_cur."!cursor_pass"(rx1298_pos, "infix:sym<=>")
    if_null rx1298_debug, debug_999
    rx1298_cur."!cursor_debug"("PASS", "infix:sym<=>", " at pos=", rx1298_pos)
  debug_999:
    .return (rx1298_cur)
  rx1298_restart:
.annotate 'line', 454
    if_null rx1298_debug, debug_1000
    rx1298_cur."!cursor_debug"("NEXT", "infix:sym<=>")
  debug_1000:
  rx1298_fail:
    (rx1298_rep, rx1298_pos, $I10, $P10) = rx1298_cur."!mark_fail"(0)
    lt rx1298_pos, -1, rx1298_done
    eq rx1298_pos, -1, rx1298_fail
    jump $I10
  rx1298_done:
    rx1298_cur."!cursor_fail"()
    if_null rx1298_debug, debug_1001
    rx1298_cur."!cursor_debug"("FAIL", "infix:sym<=>")
  debug_1001:
    .return (rx1298_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("337_1284728478.15265") :method
.annotate 'line', 454
    $P1300 = self."!PREFIX__!subrule"("panic", "=")
    new $P1301, "ResizablePMCArray"
    push $P1301, $P1300
    .return ($P1301)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("338_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1305_tgt
    .local int rx1305_pos
    .local int rx1305_off
    .local int rx1305_eos
    .local int rx1305_rep
    .local pmc rx1305_cur
    .local pmc rx1305_debug
    (rx1305_cur, rx1305_pos, rx1305_tgt, $I10) = self."!cursor_start"()
    getattribute rx1305_debug, rx1305_cur, "$!debug"
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
    eq $I10, 1, rx1305_restart
    if_null rx1305_debug, debug_1002
    rx1305_cur."!cursor_debug"("START", "infix:sym<:=>")
  debug_1002:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1309_done
    goto rxscan1309_scan
  rxscan1309_loop:
    ($P10) = rx1305_cur."from"()
    inc $P10
    set rx1305_pos, $P10
    ge rx1305_pos, rx1305_eos, rxscan1309_done
  rxscan1309_scan:
    set_addr $I10, rxscan1309_loop
    rx1305_cur."!mark_push"(0, rx1305_pos, $I10)
  rxscan1309_done:
.annotate 'line', 557
  # rx subcapture "sym"
    set_addr $I10, rxcap_1310_fail
    rx1305_cur."!mark_push"(0, rx1305_pos, $I10)
  # rx literal  ":="
    add $I11, rx1305_pos, 2
    gt $I11, rx1305_eos, rx1305_fail
    sub $I11, rx1305_pos, rx1305_off
    substr $S10, rx1305_tgt, $I11, 2
    ne $S10, ":=", rx1305_fail
    add rx1305_pos, 2
    set_addr $I10, rxcap_1310_fail
    ($I12, $I11) = rx1305_cur."!mark_peek"($I10)
    rx1305_cur."!cursor_pos"($I11)
    ($P10) = rx1305_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1305_pos, "")
    rx1305_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1310_done
  rxcap_1310_fail:
    goto rx1305_fail
  rxcap_1310_done:
  # rx subrule "O" subtype=capture negate=
    rx1305_cur."!cursor_pos"(rx1305_pos)
    $P10 = rx1305_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1305_fail
    rx1305_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1305_pos = $P10."pos"()
  # rx pass
    rx1305_cur."!cursor_pass"(rx1305_pos, "infix:sym<:=>")
    if_null rx1305_debug, debug_1003
    rx1305_cur."!cursor_debug"("PASS", "infix:sym<:=>", " at pos=", rx1305_pos)
  debug_1003:
    .return (rx1305_cur)
  rx1305_restart:
.annotate 'line', 454
    if_null rx1305_debug, debug_1004
    rx1305_cur."!cursor_debug"("NEXT", "infix:sym<:=>")
  debug_1004:
  rx1305_fail:
    (rx1305_rep, rx1305_pos, $I10, $P10) = rx1305_cur."!mark_fail"(0)
    lt rx1305_pos, -1, rx1305_done
    eq rx1305_pos, -1, rx1305_fail
    jump $I10
  rx1305_done:
    rx1305_cur."!cursor_fail"()
    if_null rx1305_debug, debug_1005
    rx1305_cur."!cursor_debug"("FAIL", "infix:sym<:=>")
  debug_1005:
    .return (rx1305_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("339_1284728478.15265") :method
.annotate 'line', 454
    $P1307 = self."!PREFIX__!subrule"("O", ":=")
    new $P1308, "ResizablePMCArray"
    push $P1308, $P1307
    .return ($P1308)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("340_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1312_tgt
    .local int rx1312_pos
    .local int rx1312_off
    .local int rx1312_eos
    .local int rx1312_rep
    .local pmc rx1312_cur
    .local pmc rx1312_debug
    (rx1312_cur, rx1312_pos, rx1312_tgt, $I10) = self."!cursor_start"()
    getattribute rx1312_debug, rx1312_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1312_cur
    .local pmc match
    .lex "$/", match
    length rx1312_eos, rx1312_tgt
    gt rx1312_pos, rx1312_eos, rx1312_done
    set rx1312_off, 0
    lt rx1312_pos, 2, rx1312_start
    sub rx1312_off, rx1312_pos, 1
    substr rx1312_tgt, rx1312_tgt, rx1312_off
  rx1312_start:
    eq $I10, 1, rx1312_restart
    if_null rx1312_debug, debug_1006
    rx1312_cur."!cursor_debug"("START", "infix:sym<::=>")
  debug_1006:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1316_done
    goto rxscan1316_scan
  rxscan1316_loop:
    ($P10) = rx1312_cur."from"()
    inc $P10
    set rx1312_pos, $P10
    ge rx1312_pos, rx1312_eos, rxscan1316_done
  rxscan1316_scan:
    set_addr $I10, rxscan1316_loop
    rx1312_cur."!mark_push"(0, rx1312_pos, $I10)
  rxscan1316_done:
.annotate 'line', 558
  # rx subcapture "sym"
    set_addr $I10, rxcap_1317_fail
    rx1312_cur."!mark_push"(0, rx1312_pos, $I10)
  # rx literal  "::="
    add $I11, rx1312_pos, 3
    gt $I11, rx1312_eos, rx1312_fail
    sub $I11, rx1312_pos, rx1312_off
    substr $S10, rx1312_tgt, $I11, 3
    ne $S10, "::=", rx1312_fail
    add rx1312_pos, 3
    set_addr $I10, rxcap_1317_fail
    ($I12, $I11) = rx1312_cur."!mark_peek"($I10)
    rx1312_cur."!cursor_pos"($I11)
    ($P10) = rx1312_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1312_pos, "")
    rx1312_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1317_done
  rxcap_1317_fail:
    goto rx1312_fail
  rxcap_1317_done:
  # rx subrule "O" subtype=capture negate=
    rx1312_cur."!cursor_pos"(rx1312_pos)
    $P10 = rx1312_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1312_fail
    rx1312_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1312_pos = $P10."pos"()
  # rx pass
    rx1312_cur."!cursor_pass"(rx1312_pos, "infix:sym<::=>")
    if_null rx1312_debug, debug_1007
    rx1312_cur."!cursor_debug"("PASS", "infix:sym<::=>", " at pos=", rx1312_pos)
  debug_1007:
    .return (rx1312_cur)
  rx1312_restart:
.annotate 'line', 454
    if_null rx1312_debug, debug_1008
    rx1312_cur."!cursor_debug"("NEXT", "infix:sym<::=>")
  debug_1008:
  rx1312_fail:
    (rx1312_rep, rx1312_pos, $I10, $P10) = rx1312_cur."!mark_fail"(0)
    lt rx1312_pos, -1, rx1312_done
    eq rx1312_pos, -1, rx1312_fail
    jump $I10
  rx1312_done:
    rx1312_cur."!cursor_fail"()
    if_null rx1312_debug, debug_1009
    rx1312_cur."!cursor_debug"("FAIL", "infix:sym<::=>")
  debug_1009:
    .return (rx1312_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("341_1284728478.15265") :method
.annotate 'line', 454
    $P1314 = self."!PREFIX__!subrule"("O", "::=")
    new $P1315, "ResizablePMCArray"
    push $P1315, $P1314
    .return ($P1315)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("342_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1319_tgt
    .local int rx1319_pos
    .local int rx1319_off
    .local int rx1319_eos
    .local int rx1319_rep
    .local pmc rx1319_cur
    .local pmc rx1319_debug
    (rx1319_cur, rx1319_pos, rx1319_tgt, $I10) = self."!cursor_start"()
    getattribute rx1319_debug, rx1319_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1319_cur
    .local pmc match
    .lex "$/", match
    length rx1319_eos, rx1319_tgt
    gt rx1319_pos, rx1319_eos, rx1319_done
    set rx1319_off, 0
    lt rx1319_pos, 2, rx1319_start
    sub rx1319_off, rx1319_pos, 1
    substr rx1319_tgt, rx1319_tgt, rx1319_off
  rx1319_start:
    eq $I10, 1, rx1319_restart
    if_null rx1319_debug, debug_1010
    rx1319_cur."!cursor_debug"("START", "infix:sym<,>")
  debug_1010:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1323_done
    goto rxscan1323_scan
  rxscan1323_loop:
    ($P10) = rx1319_cur."from"()
    inc $P10
    set rx1319_pos, $P10
    ge rx1319_pos, rx1319_eos, rxscan1323_done
  rxscan1323_scan:
    set_addr $I10, rxscan1323_loop
    rx1319_cur."!mark_push"(0, rx1319_pos, $I10)
  rxscan1323_done:
.annotate 'line', 560
  # rx subcapture "sym"
    set_addr $I10, rxcap_1324_fail
    rx1319_cur."!mark_push"(0, rx1319_pos, $I10)
  # rx literal  ","
    add $I11, rx1319_pos, 1
    gt $I11, rx1319_eos, rx1319_fail
    sub $I11, rx1319_pos, rx1319_off
    ord $I11, rx1319_tgt, $I11
    ne $I11, 44, rx1319_fail
    add rx1319_pos, 1
    set_addr $I10, rxcap_1324_fail
    ($I12, $I11) = rx1319_cur."!mark_peek"($I10)
    rx1319_cur."!cursor_pos"($I11)
    ($P10) = rx1319_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1319_pos, "")
    rx1319_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1324_done
  rxcap_1324_fail:
    goto rx1319_fail
  rxcap_1324_done:
  # rx subrule "O" subtype=capture negate=
    rx1319_cur."!cursor_pos"(rx1319_pos)
    $P10 = rx1319_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1319_fail
    rx1319_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1319_pos = $P10."pos"()
  # rx pass
    rx1319_cur."!cursor_pass"(rx1319_pos, "infix:sym<,>")
    if_null rx1319_debug, debug_1011
    rx1319_cur."!cursor_debug"("PASS", "infix:sym<,>", " at pos=", rx1319_pos)
  debug_1011:
    .return (rx1319_cur)
  rx1319_restart:
.annotate 'line', 454
    if_null rx1319_debug, debug_1012
    rx1319_cur."!cursor_debug"("NEXT", "infix:sym<,>")
  debug_1012:
  rx1319_fail:
    (rx1319_rep, rx1319_pos, $I10, $P10) = rx1319_cur."!mark_fail"(0)
    lt rx1319_pos, -1, rx1319_done
    eq rx1319_pos, -1, rx1319_fail
    jump $I10
  rx1319_done:
    rx1319_cur."!cursor_fail"()
    if_null rx1319_debug, debug_1013
    rx1319_cur."!cursor_debug"("FAIL", "infix:sym<,>")
  debug_1013:
    .return (rx1319_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("343_1284728478.15265") :method
.annotate 'line', 454
    $P1321 = self."!PREFIX__!subrule"("O", ",")
    new $P1322, "ResizablePMCArray"
    push $P1322, $P1321
    .return ($P1322)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("344_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1326_tgt
    .local int rx1326_pos
    .local int rx1326_off
    .local int rx1326_eos
    .local int rx1326_rep
    .local pmc rx1326_cur
    .local pmc rx1326_debug
    (rx1326_cur, rx1326_pos, rx1326_tgt, $I10) = self."!cursor_start"()
    getattribute rx1326_debug, rx1326_cur, "$!debug"
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
    eq $I10, 1, rx1326_restart
    if_null rx1326_debug, debug_1014
    rx1326_cur."!cursor_debug"("START", "prefix:sym<return>")
  debug_1014:
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
.annotate 'line', 562
  # rx subcapture "sym"
    set_addr $I10, rxcap_1330_fail
    rx1326_cur."!mark_push"(0, rx1326_pos, $I10)
  # rx literal  "return"
    add $I11, rx1326_pos, 6
    gt $I11, rx1326_eos, rx1326_fail
    sub $I11, rx1326_pos, rx1326_off
    substr $S10, rx1326_tgt, $I11, 6
    ne $S10, "return", rx1326_fail
    add rx1326_pos, 6
    set_addr $I10, rxcap_1330_fail
    ($I12, $I11) = rx1326_cur."!mark_peek"($I10)
    rx1326_cur."!cursor_pos"($I11)
    ($P10) = rx1326_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1326_pos, "")
    rx1326_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1330_done
  rxcap_1330_fail:
    goto rx1326_fail
  rxcap_1330_done:
  # rx charclass s
    ge rx1326_pos, rx1326_eos, rx1326_fail
    sub $I10, rx1326_pos, rx1326_off
    is_cclass $I11, 32, rx1326_tgt, $I10
    unless $I11, rx1326_fail
    inc rx1326_pos
  # rx subrule "O" subtype=capture negate=
    rx1326_cur."!cursor_pos"(rx1326_pos)
    $P10 = rx1326_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1326_fail
    rx1326_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1326_pos = $P10."pos"()
  # rx pass
    rx1326_cur."!cursor_pass"(rx1326_pos, "prefix:sym<return>")
    if_null rx1326_debug, debug_1015
    rx1326_cur."!cursor_debug"("PASS", "prefix:sym<return>", " at pos=", rx1326_pos)
  debug_1015:
    .return (rx1326_cur)
  rx1326_restart:
.annotate 'line', 454
    if_null rx1326_debug, debug_1016
    rx1326_cur."!cursor_debug"("NEXT", "prefix:sym<return>")
  debug_1016:
  rx1326_fail:
    (rx1326_rep, rx1326_pos, $I10, $P10) = rx1326_cur."!mark_fail"(0)
    lt rx1326_pos, -1, rx1326_done
    eq rx1326_pos, -1, rx1326_fail
    jump $I10
  rx1326_done:
    rx1326_cur."!cursor_fail"()
    if_null rx1326_debug, debug_1017
    rx1326_cur."!cursor_debug"("FAIL", "prefix:sym<return>")
  debug_1017:
    .return (rx1326_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("345_1284728478.15265") :method
.annotate 'line', 454
    new $P1328, "ResizablePMCArray"
    push $P1328, "return"
    .return ($P1328)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("346_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1332_tgt
    .local int rx1332_pos
    .local int rx1332_off
    .local int rx1332_eos
    .local int rx1332_rep
    .local pmc rx1332_cur
    .local pmc rx1332_debug
    (rx1332_cur, rx1332_pos, rx1332_tgt, $I10) = self."!cursor_start"()
    getattribute rx1332_debug, rx1332_cur, "$!debug"
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
    eq $I10, 1, rx1332_restart
    if_null rx1332_debug, debug_1018
    rx1332_cur."!cursor_debug"("START", "prefix:sym<make>")
  debug_1018:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1335_done
    goto rxscan1335_scan
  rxscan1335_loop:
    ($P10) = rx1332_cur."from"()
    inc $P10
    set rx1332_pos, $P10
    ge rx1332_pos, rx1332_eos, rxscan1335_done
  rxscan1335_scan:
    set_addr $I10, rxscan1335_loop
    rx1332_cur."!mark_push"(0, rx1332_pos, $I10)
  rxscan1335_done:
.annotate 'line', 563
  # rx subcapture "sym"
    set_addr $I10, rxcap_1336_fail
    rx1332_cur."!mark_push"(0, rx1332_pos, $I10)
  # rx literal  "make"
    add $I11, rx1332_pos, 4
    gt $I11, rx1332_eos, rx1332_fail
    sub $I11, rx1332_pos, rx1332_off
    substr $S10, rx1332_tgt, $I11, 4
    ne $S10, "make", rx1332_fail
    add rx1332_pos, 4
    set_addr $I10, rxcap_1336_fail
    ($I12, $I11) = rx1332_cur."!mark_peek"($I10)
    rx1332_cur."!cursor_pos"($I11)
    ($P10) = rx1332_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1332_pos, "")
    rx1332_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1336_done
  rxcap_1336_fail:
    goto rx1332_fail
  rxcap_1336_done:
  # rx charclass s
    ge rx1332_pos, rx1332_eos, rx1332_fail
    sub $I10, rx1332_pos, rx1332_off
    is_cclass $I11, 32, rx1332_tgt, $I10
    unless $I11, rx1332_fail
    inc rx1332_pos
  # rx subrule "O" subtype=capture negate=
    rx1332_cur."!cursor_pos"(rx1332_pos)
    $P10 = rx1332_cur."O"("%list_prefix")
    unless $P10, rx1332_fail
    rx1332_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1332_pos = $P10."pos"()
  # rx pass
    rx1332_cur."!cursor_pass"(rx1332_pos, "prefix:sym<make>")
    if_null rx1332_debug, debug_1019
    rx1332_cur."!cursor_debug"("PASS", "prefix:sym<make>", " at pos=", rx1332_pos)
  debug_1019:
    .return (rx1332_cur)
  rx1332_restart:
.annotate 'line', 454
    if_null rx1332_debug, debug_1020
    rx1332_cur."!cursor_debug"("NEXT", "prefix:sym<make>")
  debug_1020:
  rx1332_fail:
    (rx1332_rep, rx1332_pos, $I10, $P10) = rx1332_cur."!mark_fail"(0)
    lt rx1332_pos, -1, rx1332_done
    eq rx1332_pos, -1, rx1332_fail
    jump $I10
  rx1332_done:
    rx1332_cur."!cursor_fail"()
    if_null rx1332_debug, debug_1021
    rx1332_cur."!cursor_debug"("FAIL", "prefix:sym<make>")
  debug_1021:
    .return (rx1332_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("347_1284728478.15265") :method
.annotate 'line', 454
    new $P1334, "ResizablePMCArray"
    push $P1334, "make"
    .return ($P1334)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<last>"  :subid("348_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1338_tgt
    .local int rx1338_pos
    .local int rx1338_off
    .local int rx1338_eos
    .local int rx1338_rep
    .local pmc rx1338_cur
    .local pmc rx1338_debug
    (rx1338_cur, rx1338_pos, rx1338_tgt, $I10) = self."!cursor_start"()
    getattribute rx1338_debug, rx1338_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1338_cur
    .local pmc match
    .lex "$/", match
    length rx1338_eos, rx1338_tgt
    gt rx1338_pos, rx1338_eos, rx1338_done
    set rx1338_off, 0
    lt rx1338_pos, 2, rx1338_start
    sub rx1338_off, rx1338_pos, 1
    substr rx1338_tgt, rx1338_tgt, rx1338_off
  rx1338_start:
    eq $I10, 1, rx1338_restart
    if_null rx1338_debug, debug_1022
    rx1338_cur."!cursor_debug"("START", "term:sym<last>")
  debug_1022:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1341_done
    goto rxscan1341_scan
  rxscan1341_loop:
    ($P10) = rx1338_cur."from"()
    inc $P10
    set rx1338_pos, $P10
    ge rx1338_pos, rx1338_eos, rxscan1341_done
  rxscan1341_scan:
    set_addr $I10, rxscan1341_loop
    rx1338_cur."!mark_push"(0, rx1338_pos, $I10)
  rxscan1341_done:
.annotate 'line', 564
  # rx subcapture "sym"
    set_addr $I10, rxcap_1342_fail
    rx1338_cur."!mark_push"(0, rx1338_pos, $I10)
  # rx literal  "last"
    add $I11, rx1338_pos, 4
    gt $I11, rx1338_eos, rx1338_fail
    sub $I11, rx1338_pos, rx1338_off
    substr $S10, rx1338_tgt, $I11, 4
    ne $S10, "last", rx1338_fail
    add rx1338_pos, 4
    set_addr $I10, rxcap_1342_fail
    ($I12, $I11) = rx1338_cur."!mark_peek"($I10)
    rx1338_cur."!cursor_pos"($I11)
    ($P10) = rx1338_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1338_pos, "")
    rx1338_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1342_done
  rxcap_1342_fail:
    goto rx1338_fail
  rxcap_1342_done:
  # rx pass
    rx1338_cur."!cursor_pass"(rx1338_pos, "term:sym<last>")
    if_null rx1338_debug, debug_1023
    rx1338_cur."!cursor_debug"("PASS", "term:sym<last>", " at pos=", rx1338_pos)
  debug_1023:
    .return (rx1338_cur)
  rx1338_restart:
.annotate 'line', 454
    if_null rx1338_debug, debug_1024
    rx1338_cur."!cursor_debug"("NEXT", "term:sym<last>")
  debug_1024:
  rx1338_fail:
    (rx1338_rep, rx1338_pos, $I10, $P10) = rx1338_cur."!mark_fail"(0)
    lt rx1338_pos, -1, rx1338_done
    eq rx1338_pos, -1, rx1338_fail
    jump $I10
  rx1338_done:
    rx1338_cur."!cursor_fail"()
    if_null rx1338_debug, debug_1025
    rx1338_cur."!cursor_debug"("FAIL", "term:sym<last>")
  debug_1025:
    .return (rx1338_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<last>"  :subid("349_1284728478.15265") :method
.annotate 'line', 454
    new $P1340, "ResizablePMCArray"
    push $P1340, "last"
    .return ($P1340)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<next>"  :subid("350_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1344_tgt
    .local int rx1344_pos
    .local int rx1344_off
    .local int rx1344_eos
    .local int rx1344_rep
    .local pmc rx1344_cur
    .local pmc rx1344_debug
    (rx1344_cur, rx1344_pos, rx1344_tgt, $I10) = self."!cursor_start"()
    getattribute rx1344_debug, rx1344_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1344_cur
    .local pmc match
    .lex "$/", match
    length rx1344_eos, rx1344_tgt
    gt rx1344_pos, rx1344_eos, rx1344_done
    set rx1344_off, 0
    lt rx1344_pos, 2, rx1344_start
    sub rx1344_off, rx1344_pos, 1
    substr rx1344_tgt, rx1344_tgt, rx1344_off
  rx1344_start:
    eq $I10, 1, rx1344_restart
    if_null rx1344_debug, debug_1026
    rx1344_cur."!cursor_debug"("START", "term:sym<next>")
  debug_1026:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1347_done
    goto rxscan1347_scan
  rxscan1347_loop:
    ($P10) = rx1344_cur."from"()
    inc $P10
    set rx1344_pos, $P10
    ge rx1344_pos, rx1344_eos, rxscan1347_done
  rxscan1347_scan:
    set_addr $I10, rxscan1347_loop
    rx1344_cur."!mark_push"(0, rx1344_pos, $I10)
  rxscan1347_done:
.annotate 'line', 565
  # rx subcapture "sym"
    set_addr $I10, rxcap_1348_fail
    rx1344_cur."!mark_push"(0, rx1344_pos, $I10)
  # rx literal  "next"
    add $I11, rx1344_pos, 4
    gt $I11, rx1344_eos, rx1344_fail
    sub $I11, rx1344_pos, rx1344_off
    substr $S10, rx1344_tgt, $I11, 4
    ne $S10, "next", rx1344_fail
    add rx1344_pos, 4
    set_addr $I10, rxcap_1348_fail
    ($I12, $I11) = rx1344_cur."!mark_peek"($I10)
    rx1344_cur."!cursor_pos"($I11)
    ($P10) = rx1344_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1344_pos, "")
    rx1344_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1348_done
  rxcap_1348_fail:
    goto rx1344_fail
  rxcap_1348_done:
  # rx pass
    rx1344_cur."!cursor_pass"(rx1344_pos, "term:sym<next>")
    if_null rx1344_debug, debug_1027
    rx1344_cur."!cursor_debug"("PASS", "term:sym<next>", " at pos=", rx1344_pos)
  debug_1027:
    .return (rx1344_cur)
  rx1344_restart:
.annotate 'line', 454
    if_null rx1344_debug, debug_1028
    rx1344_cur."!cursor_debug"("NEXT", "term:sym<next>")
  debug_1028:
  rx1344_fail:
    (rx1344_rep, rx1344_pos, $I10, $P10) = rx1344_cur."!mark_fail"(0)
    lt rx1344_pos, -1, rx1344_done
    eq rx1344_pos, -1, rx1344_fail
    jump $I10
  rx1344_done:
    rx1344_cur."!cursor_fail"()
    if_null rx1344_debug, debug_1029
    rx1344_cur."!cursor_debug"("FAIL", "term:sym<next>")
  debug_1029:
    .return (rx1344_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<next>"  :subid("351_1284728478.15265") :method
.annotate 'line', 454
    new $P1346, "ResizablePMCArray"
    push $P1346, "next"
    .return ($P1346)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<redo>"  :subid("352_1284728478.15265") :method :outer("11_1284728478.15265")
.annotate 'line', 454
    .local string rx1350_tgt
    .local int rx1350_pos
    .local int rx1350_off
    .local int rx1350_eos
    .local int rx1350_rep
    .local pmc rx1350_cur
    .local pmc rx1350_debug
    (rx1350_cur, rx1350_pos, rx1350_tgt, $I10) = self."!cursor_start"()
    getattribute rx1350_debug, rx1350_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1350_cur
    .local pmc match
    .lex "$/", match
    length rx1350_eos, rx1350_tgt
    gt rx1350_pos, rx1350_eos, rx1350_done
    set rx1350_off, 0
    lt rx1350_pos, 2, rx1350_start
    sub rx1350_off, rx1350_pos, 1
    substr rx1350_tgt, rx1350_tgt, rx1350_off
  rx1350_start:
    eq $I10, 1, rx1350_restart
    if_null rx1350_debug, debug_1030
    rx1350_cur."!cursor_debug"("START", "term:sym<redo>")
  debug_1030:
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
.annotate 'line', 566
  # rx subcapture "sym"
    set_addr $I10, rxcap_1354_fail
    rx1350_cur."!mark_push"(0, rx1350_pos, $I10)
  # rx literal  "redo"
    add $I11, rx1350_pos, 4
    gt $I11, rx1350_eos, rx1350_fail
    sub $I11, rx1350_pos, rx1350_off
    substr $S10, rx1350_tgt, $I11, 4
    ne $S10, "redo", rx1350_fail
    add rx1350_pos, 4
    set_addr $I10, rxcap_1354_fail
    ($I12, $I11) = rx1350_cur."!mark_peek"($I10)
    rx1350_cur."!cursor_pos"($I11)
    ($P10) = rx1350_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1350_pos, "")
    rx1350_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1354_done
  rxcap_1354_fail:
    goto rx1350_fail
  rxcap_1354_done:
  # rx pass
    rx1350_cur."!cursor_pass"(rx1350_pos, "term:sym<redo>")
    if_null rx1350_debug, debug_1031
    rx1350_cur."!cursor_debug"("PASS", "term:sym<redo>", " at pos=", rx1350_pos)
  debug_1031:
    .return (rx1350_cur)
  rx1350_restart:
.annotate 'line', 454
    if_null rx1350_debug, debug_1032
    rx1350_cur."!cursor_debug"("NEXT", "term:sym<redo>")
  debug_1032:
  rx1350_fail:
    (rx1350_rep, rx1350_pos, $I10, $P10) = rx1350_cur."!mark_fail"(0)
    lt rx1350_pos, -1, rx1350_done
    eq rx1350_pos, -1, rx1350_fail
    jump $I10
  rx1350_done:
    rx1350_cur."!cursor_fail"()
    if_null rx1350_debug, debug_1033
    rx1350_cur."!cursor_debug"("FAIL", "term:sym<redo>")
  debug_1033:
    .return (rx1350_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<redo>"  :subid("353_1284728478.15265") :method
.annotate 'line', 454
    new $P1352, "ResizablePMCArray"
    push $P1352, "redo"
    .return ($P1352)
.end


.namespace ["NQP";"Grammar"]
.include "except_types.pasm"
.sub "smartmatch"  :subid("354_1284728478.15265") :method :outer("11_1284728478.15265")
    .param pmc param_1358
.annotate 'line', 568
    new $P1357, 'ExceptionHandler'
    set_addr $P1357, control_1356
    $P1357."handle_types"(.CONTROL_RETURN)
    push_eh $P1357
    .lex "self", self
    .lex "$/", param_1358
.annotate 'line', 570
    new $P1359, "Undef"
    .lex "$t", $P1359
    find_lex $P1360, "$/"
    unless_null $P1360, vivify_1034
    $P1360 = root_new ['parrot';'ResizablePMCArray']
  vivify_1034:
    set $P1361, $P1360[0]
    unless_null $P1361, vivify_1035
    new $P1361, "Undef"
  vivify_1035:
    store_lex "$t", $P1361
    find_lex $P1362, "$/"
    unless_null $P1362, vivify_1036
    $P1362 = root_new ['parrot';'ResizablePMCArray']
  vivify_1036:
    set $P1363, $P1362[1]
    unless_null $P1363, vivify_1037
    new $P1363, "Undef"
  vivify_1037:
    find_lex $P1364, "$/"
    unless_null $P1364, vivify_1038
    $P1364 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1364
  vivify_1038:
    set $P1364[0], $P1363
    find_lex $P1365, "$t"
    find_lex $P1366, "$/"
    unless_null $P1366, vivify_1039
    $P1366 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1366
  vivify_1039:
    set $P1366[1], $P1365
.annotate 'line', 568
    .return ($P1365)
  control_1356:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1367, exception, "payload"
    .return ($P1367)
.end


.namespace ["NQP";"Regex"]
.sub "_block1368"  :subid("355_1284728478.15265") :outer("11_1284728478.15265")
.annotate 'line', 574
    .const 'Sub' $P1425 = "374_1284728478.15265" 
    capture_lex $P1425
    .const 'Sub' $P1420 = "372_1284728478.15265" 
    capture_lex $P1420
    .const 'Sub' $P1408 = "369_1284728478.15265" 
    capture_lex $P1408
    .const 'Sub' $P1398 = "366_1284728478.15265" 
    capture_lex $P1398
    .const 'Sub' $P1393 = "364_1284728478.15265" 
    capture_lex $P1393
    .const 'Sub' $P1384 = "361_1284728478.15265" 
    capture_lex $P1384
    .const 'Sub' $P1379 = "359_1284728478.15265" 
    capture_lex $P1379
    .const 'Sub' $P1370 = "356_1284728478.15265" 
    capture_lex $P1370
    .const 'Sub' $P1425 = "374_1284728478.15265" 
    capture_lex $P1425
    .return ($P1425)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("356_1284728478.15265") :method :outer("355_1284728478.15265")
.annotate 'line', 574
    .const 'Sub' $P1376 = "358_1284728478.15265" 
    capture_lex $P1376
    .local string rx1371_tgt
    .local int rx1371_pos
    .local int rx1371_off
    .local int rx1371_eos
    .local int rx1371_rep
    .local pmc rx1371_cur
    .local pmc rx1371_debug
    (rx1371_cur, rx1371_pos, rx1371_tgt, $I10) = self."!cursor_start"()
    getattribute rx1371_debug, rx1371_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1371_cur
    .local pmc match
    .lex "$/", match
    length rx1371_eos, rx1371_tgt
    gt rx1371_pos, rx1371_eos, rx1371_done
    set rx1371_off, 0
    lt rx1371_pos, 2, rx1371_start
    sub rx1371_off, rx1371_pos, 1
    substr rx1371_tgt, rx1371_tgt, rx1371_off
  rx1371_start:
    eq $I10, 1, rx1371_restart
    if_null rx1371_debug, debug_1040
    rx1371_cur."!cursor_debug"("START", "metachar:sym<:my>")
  debug_1040:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1374_done
    goto rxscan1374_scan
  rxscan1374_loop:
    ($P10) = rx1371_cur."from"()
    inc $P10
    set rx1371_pos, $P10
    ge rx1371_pos, rx1371_eos, rxscan1374_done
  rxscan1374_scan:
    set_addr $I10, rxscan1374_loop
    rx1371_cur."!mark_push"(0, rx1371_pos, $I10)
  rxscan1374_done:
.annotate 'line', 576
  # rx literal  ":"
    add $I11, rx1371_pos, 1
    gt $I11, rx1371_eos, rx1371_fail
    sub $I11, rx1371_pos, rx1371_off
    ord $I11, rx1371_tgt, $I11
    ne $I11, 58, rx1371_fail
    add rx1371_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1371_cur."!cursor_pos"(rx1371_pos)
    .const 'Sub' $P1376 = "358_1284728478.15265" 
    capture_lex $P1376
    $P10 = rx1371_cur."before"($P1376)
    unless $P10, rx1371_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1371_cur."!cursor_pos"(rx1371_pos)
    $P10 = rx1371_cur."LANG"("MAIN", "statement")
    unless $P10, rx1371_fail
    rx1371_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1371_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1371_cur."!cursor_pos"(rx1371_pos)
    $P10 = rx1371_cur."ws"()
    unless $P10, rx1371_fail
    rx1371_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1371_pos, 1
    gt $I11, rx1371_eos, rx1371_fail
    sub $I11, rx1371_pos, rx1371_off
    ord $I11, rx1371_tgt, $I11
    ne $I11, 59, rx1371_fail
    add rx1371_pos, 1
.annotate 'line', 575
  # rx pass
    rx1371_cur."!cursor_pass"(rx1371_pos, "metachar:sym<:my>")
    if_null rx1371_debug, debug_1045
    rx1371_cur."!cursor_debug"("PASS", "metachar:sym<:my>", " at pos=", rx1371_pos)
  debug_1045:
    .return (rx1371_cur)
  rx1371_restart:
.annotate 'line', 574
    if_null rx1371_debug, debug_1046
    rx1371_cur."!cursor_debug"("NEXT", "metachar:sym<:my>")
  debug_1046:
  rx1371_fail:
    (rx1371_rep, rx1371_pos, $I10, $P10) = rx1371_cur."!mark_fail"(0)
    lt rx1371_pos, -1, rx1371_done
    eq rx1371_pos, -1, rx1371_fail
    jump $I10
  rx1371_done:
    rx1371_cur."!cursor_fail"()
    if_null rx1371_debug, debug_1047
    rx1371_cur."!cursor_debug"("FAIL", "metachar:sym<:my>")
  debug_1047:
    .return (rx1371_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("357_1284728478.15265") :method
.annotate 'line', 574
    new $P1373, "ResizablePMCArray"
    push $P1373, ":"
    .return ($P1373)
.end


.namespace ["NQP";"Regex"]
.sub "_block1375"  :anon :subid("358_1284728478.15265") :method :outer("356_1284728478.15265")
.annotate 'line', 576
    .local string rx1377_tgt
    .local int rx1377_pos
    .local int rx1377_off
    .local int rx1377_eos
    .local int rx1377_rep
    .local pmc rx1377_cur
    .local pmc rx1377_debug
    (rx1377_cur, rx1377_pos, rx1377_tgt, $I10) = self."!cursor_start"()
    getattribute rx1377_debug, rx1377_cur, "$!debug"
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
    eq $I10, 1, rx1377_restart
    if_null rx1377_debug, debug_1041
    rx1377_cur."!cursor_debug"("START", "")
  debug_1041:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1378_done
    goto rxscan1378_scan
  rxscan1378_loop:
    ($P10) = rx1377_cur."from"()
    inc $P10
    set rx1377_pos, $P10
    ge rx1377_pos, rx1377_eos, rxscan1378_done
  rxscan1378_scan:
    set_addr $I10, rxscan1378_loop
    rx1377_cur."!mark_push"(0, rx1377_pos, $I10)
  rxscan1378_done:
  # rx literal  "my"
    add $I11, rx1377_pos, 2
    gt $I11, rx1377_eos, rx1377_fail
    sub $I11, rx1377_pos, rx1377_off
    substr $S10, rx1377_tgt, $I11, 2
    ne $S10, "my", rx1377_fail
    add rx1377_pos, 2
  # rx pass
    rx1377_cur."!cursor_pass"(rx1377_pos, "")
    if_null rx1377_debug, debug_1042
    rx1377_cur."!cursor_debug"("PASS", "", " at pos=", rx1377_pos)
  debug_1042:
    .return (rx1377_cur)
  rx1377_restart:
    if_null rx1377_debug, debug_1043
    rx1377_cur."!cursor_debug"("NEXT", "")
  debug_1043:
  rx1377_fail:
    (rx1377_rep, rx1377_pos, $I10, $P10) = rx1377_cur."!mark_fail"(0)
    lt rx1377_pos, -1, rx1377_done
    eq rx1377_pos, -1, rx1377_fail
    jump $I10
  rx1377_done:
    rx1377_cur."!cursor_fail"()
    if_null rx1377_debug, debug_1044
    rx1377_cur."!cursor_debug"("FAIL", "")
  debug_1044:
    .return (rx1377_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("359_1284728478.15265") :method :outer("355_1284728478.15265")
.annotate 'line', 574
    .local string rx1380_tgt
    .local int rx1380_pos
    .local int rx1380_off
    .local int rx1380_eos
    .local int rx1380_rep
    .local pmc rx1380_cur
    .local pmc rx1380_debug
    (rx1380_cur, rx1380_pos, rx1380_tgt, $I10) = self."!cursor_start"()
    getattribute rx1380_debug, rx1380_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1380_cur
    .local pmc match
    .lex "$/", match
    length rx1380_eos, rx1380_tgt
    gt rx1380_pos, rx1380_eos, rx1380_done
    set rx1380_off, 0
    lt rx1380_pos, 2, rx1380_start
    sub rx1380_off, rx1380_pos, 1
    substr rx1380_tgt, rx1380_tgt, rx1380_off
  rx1380_start:
    eq $I10, 1, rx1380_restart
    if_null rx1380_debug, debug_1048
    rx1380_cur."!cursor_debug"("START", "metachar:sym<{ }>")
  debug_1048:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1383_done
    goto rxscan1383_scan
  rxscan1383_loop:
    ($P10) = rx1380_cur."from"()
    inc $P10
    set rx1380_pos, $P10
    ge rx1380_pos, rx1380_eos, rxscan1383_done
  rxscan1383_scan:
    set_addr $I10, rxscan1383_loop
    rx1380_cur."!mark_push"(0, rx1380_pos, $I10)
  rxscan1383_done:
.annotate 'line', 580
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1380_pos, rx1380_off
    substr $S10, rx1380_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1380_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1380_cur."!cursor_pos"(rx1380_pos)
    $P10 = rx1380_cur."codeblock"()
    unless $P10, rx1380_fail
    rx1380_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1380_pos = $P10."pos"()
.annotate 'line', 579
  # rx pass
    rx1380_cur."!cursor_pass"(rx1380_pos, "metachar:sym<{ }>")
    if_null rx1380_debug, debug_1049
    rx1380_cur."!cursor_debug"("PASS", "metachar:sym<{ }>", " at pos=", rx1380_pos)
  debug_1049:
    .return (rx1380_cur)
  rx1380_restart:
.annotate 'line', 574
    if_null rx1380_debug, debug_1050
    rx1380_cur."!cursor_debug"("NEXT", "metachar:sym<{ }>")
  debug_1050:
  rx1380_fail:
    (rx1380_rep, rx1380_pos, $I10, $P10) = rx1380_cur."!mark_fail"(0)
    lt rx1380_pos, -1, rx1380_done
    eq rx1380_pos, -1, rx1380_fail
    jump $I10
  rx1380_done:
    rx1380_cur."!cursor_fail"()
    if_null rx1380_debug, debug_1051
    rx1380_cur."!cursor_debug"("FAIL", "metachar:sym<{ }>")
  debug_1051:
    .return (rx1380_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("360_1284728478.15265") :method
.annotate 'line', 574
    new $P1382, "ResizablePMCArray"
    push $P1382, "{"
    .return ($P1382)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<nqpvar>"  :subid("361_1284728478.15265") :method :outer("355_1284728478.15265")
.annotate 'line', 574
    .const 'Sub' $P1390 = "363_1284728478.15265" 
    capture_lex $P1390
    .local string rx1385_tgt
    .local int rx1385_pos
    .local int rx1385_off
    .local int rx1385_eos
    .local int rx1385_rep
    .local pmc rx1385_cur
    .local pmc rx1385_debug
    (rx1385_cur, rx1385_pos, rx1385_tgt, $I10) = self."!cursor_start"()
    getattribute rx1385_debug, rx1385_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1385_cur
    .local pmc match
    .lex "$/", match
    length rx1385_eos, rx1385_tgt
    gt rx1385_pos, rx1385_eos, rx1385_done
    set rx1385_off, 0
    lt rx1385_pos, 2, rx1385_start
    sub rx1385_off, rx1385_pos, 1
    substr rx1385_tgt, rx1385_tgt, rx1385_off
  rx1385_start:
    eq $I10, 1, rx1385_restart
    if_null rx1385_debug, debug_1052
    rx1385_cur."!cursor_debug"("START", "metachar:sym<nqpvar>")
  debug_1052:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1388_done
    goto rxscan1388_scan
  rxscan1388_loop:
    ($P10) = rx1385_cur."from"()
    inc $P10
    set rx1385_pos, $P10
    ge rx1385_pos, rx1385_eos, rxscan1388_done
  rxscan1388_scan:
    set_addr $I10, rxscan1388_loop
    rx1385_cur."!mark_push"(0, rx1385_pos, $I10)
  rxscan1388_done:
.annotate 'line', 584
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1385_pos, rx1385_off
    substr $S10, rx1385_tgt, $I10, 1
    index $I11, "$@", $S10
    lt $I11, 0, rx1385_fail
  # rx subrule "before" subtype=zerowidth negate=
    rx1385_cur."!cursor_pos"(rx1385_pos)
    .const 'Sub' $P1390 = "363_1284728478.15265" 
    capture_lex $P1390
    $P10 = rx1385_cur."before"($P1390)
    unless $P10, rx1385_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1385_cur."!cursor_pos"(rx1385_pos)
    $P10 = rx1385_cur."LANG"("MAIN", "variable")
    unless $P10, rx1385_fail
    rx1385_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("var")
    rx1385_pos = $P10."pos"()
.annotate 'line', 583
  # rx pass
    rx1385_cur."!cursor_pass"(rx1385_pos, "metachar:sym<nqpvar>")
    if_null rx1385_debug, debug_1057
    rx1385_cur."!cursor_debug"("PASS", "metachar:sym<nqpvar>", " at pos=", rx1385_pos)
  debug_1057:
    .return (rx1385_cur)
  rx1385_restart:
.annotate 'line', 574
    if_null rx1385_debug, debug_1058
    rx1385_cur."!cursor_debug"("NEXT", "metachar:sym<nqpvar>")
  debug_1058:
  rx1385_fail:
    (rx1385_rep, rx1385_pos, $I10, $P10) = rx1385_cur."!mark_fail"(0)
    lt rx1385_pos, -1, rx1385_done
    eq rx1385_pos, -1, rx1385_fail
    jump $I10
  rx1385_done:
    rx1385_cur."!cursor_fail"()
    if_null rx1385_debug, debug_1059
    rx1385_cur."!cursor_debug"("FAIL", "metachar:sym<nqpvar>")
  debug_1059:
    .return (rx1385_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<nqpvar>"  :subid("362_1284728478.15265") :method
.annotate 'line', 574
    new $P1387, "ResizablePMCArray"
    push $P1387, "$"
    push $P1387, "@"
    .return ($P1387)
.end


.namespace ["NQP";"Regex"]
.sub "_block1389"  :anon :subid("363_1284728478.15265") :method :outer("361_1284728478.15265")
.annotate 'line', 584
    .local string rx1391_tgt
    .local int rx1391_pos
    .local int rx1391_off
    .local int rx1391_eos
    .local int rx1391_rep
    .local pmc rx1391_cur
    .local pmc rx1391_debug
    (rx1391_cur, rx1391_pos, rx1391_tgt, $I10) = self."!cursor_start"()
    getattribute rx1391_debug, rx1391_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1391_cur
    .local pmc match
    .lex "$/", match
    length rx1391_eos, rx1391_tgt
    gt rx1391_pos, rx1391_eos, rx1391_done
    set rx1391_off, 0
    lt rx1391_pos, 2, rx1391_start
    sub rx1391_off, rx1391_pos, 1
    substr rx1391_tgt, rx1391_tgt, rx1391_off
  rx1391_start:
    eq $I10, 1, rx1391_restart
    if_null rx1391_debug, debug_1053
    rx1391_cur."!cursor_debug"("START", "")
  debug_1053:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1392_done
    goto rxscan1392_scan
  rxscan1392_loop:
    ($P10) = rx1391_cur."from"()
    inc $P10
    set rx1391_pos, $P10
    ge rx1391_pos, rx1391_eos, rxscan1392_done
  rxscan1392_scan:
    set_addr $I10, rxscan1392_loop
    rx1391_cur."!mark_push"(0, rx1391_pos, $I10)
  rxscan1392_done:
  # rx charclass .
    ge rx1391_pos, rx1391_eos, rx1391_fail
    inc rx1391_pos
  # rx charclass w
    ge rx1391_pos, rx1391_eos, rx1391_fail
    sub $I10, rx1391_pos, rx1391_off
    is_cclass $I11, 8192, rx1391_tgt, $I10
    unless $I11, rx1391_fail
    inc rx1391_pos
  # rx pass
    rx1391_cur."!cursor_pass"(rx1391_pos, "")
    if_null rx1391_debug, debug_1054
    rx1391_cur."!cursor_debug"("PASS", "", " at pos=", rx1391_pos)
  debug_1054:
    .return (rx1391_cur)
  rx1391_restart:
    if_null rx1391_debug, debug_1055
    rx1391_cur."!cursor_debug"("NEXT", "")
  debug_1055:
  rx1391_fail:
    (rx1391_rep, rx1391_pos, $I10, $P10) = rx1391_cur."!mark_fail"(0)
    lt rx1391_pos, -1, rx1391_done
    eq rx1391_pos, -1, rx1391_fail
    jump $I10
  rx1391_done:
    rx1391_cur."!cursor_fail"()
    if_null rx1391_debug, debug_1056
    rx1391_cur."!cursor_debug"("FAIL", "")
  debug_1056:
    .return (rx1391_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("364_1284728478.15265") :method :outer("355_1284728478.15265")
.annotate 'line', 574
    .local string rx1394_tgt
    .local int rx1394_pos
    .local int rx1394_off
    .local int rx1394_eos
    .local int rx1394_rep
    .local pmc rx1394_cur
    .local pmc rx1394_debug
    (rx1394_cur, rx1394_pos, rx1394_tgt, $I10) = self."!cursor_start"()
    getattribute rx1394_debug, rx1394_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1394_cur
    .local pmc match
    .lex "$/", match
    length rx1394_eos, rx1394_tgt
    gt rx1394_pos, rx1394_eos, rx1394_done
    set rx1394_off, 0
    lt rx1394_pos, 2, rx1394_start
    sub rx1394_off, rx1394_pos, 1
    substr rx1394_tgt, rx1394_tgt, rx1394_off
  rx1394_start:
    eq $I10, 1, rx1394_restart
    if_null rx1394_debug, debug_1060
    rx1394_cur."!cursor_debug"("START", "assertion:sym<{ }>")
  debug_1060:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1397_done
    goto rxscan1397_scan
  rxscan1397_loop:
    ($P10) = rx1394_cur."from"()
    inc $P10
    set rx1394_pos, $P10
    ge rx1394_pos, rx1394_eos, rxscan1397_done
  rxscan1397_scan:
    set_addr $I10, rxscan1397_loop
    rx1394_cur."!mark_push"(0, rx1394_pos, $I10)
  rxscan1397_done:
.annotate 'line', 588
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1394_pos, rx1394_off
    substr $S10, rx1394_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1394_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1394_cur."!cursor_pos"(rx1394_pos)
    $P10 = rx1394_cur."codeblock"()
    unless $P10, rx1394_fail
    rx1394_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1394_pos = $P10."pos"()
.annotate 'line', 587
  # rx pass
    rx1394_cur."!cursor_pass"(rx1394_pos, "assertion:sym<{ }>")
    if_null rx1394_debug, debug_1061
    rx1394_cur."!cursor_debug"("PASS", "assertion:sym<{ }>", " at pos=", rx1394_pos)
  debug_1061:
    .return (rx1394_cur)
  rx1394_restart:
.annotate 'line', 574
    if_null rx1394_debug, debug_1062
    rx1394_cur."!cursor_debug"("NEXT", "assertion:sym<{ }>")
  debug_1062:
  rx1394_fail:
    (rx1394_rep, rx1394_pos, $I10, $P10) = rx1394_cur."!mark_fail"(0)
    lt rx1394_pos, -1, rx1394_done
    eq rx1394_pos, -1, rx1394_fail
    jump $I10
  rx1394_done:
    rx1394_cur."!cursor_fail"()
    if_null rx1394_debug, debug_1063
    rx1394_cur."!cursor_debug"("FAIL", "assertion:sym<{ }>")
  debug_1063:
    .return (rx1394_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("365_1284728478.15265") :method
.annotate 'line', 574
    new $P1396, "ResizablePMCArray"
    push $P1396, "{"
    .return ($P1396)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<?{ }>"  :subid("366_1284728478.15265") :method :outer("355_1284728478.15265")
.annotate 'line', 574
    .const 'Sub' $P1404 = "368_1284728478.15265" 
    capture_lex $P1404
    .local string rx1399_tgt
    .local int rx1399_pos
    .local int rx1399_off
    .local int rx1399_eos
    .local int rx1399_rep
    .local pmc rx1399_cur
    .local pmc rx1399_debug
    (rx1399_cur, rx1399_pos, rx1399_tgt, $I10) = self."!cursor_start"()
    getattribute rx1399_debug, rx1399_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1399_cur
    .local pmc match
    .lex "$/", match
    length rx1399_eos, rx1399_tgt
    gt rx1399_pos, rx1399_eos, rx1399_done
    set rx1399_off, 0
    lt rx1399_pos, 2, rx1399_start
    sub rx1399_off, rx1399_pos, 1
    substr rx1399_tgt, rx1399_tgt, rx1399_off
  rx1399_start:
    eq $I10, 1, rx1399_restart
    if_null rx1399_debug, debug_1064
    rx1399_cur."!cursor_debug"("START", "assertion:sym<?{ }>")
  debug_1064:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1402_done
    goto rxscan1402_scan
  rxscan1402_loop:
    ($P10) = rx1399_cur."from"()
    inc $P10
    set rx1399_pos, $P10
    ge rx1399_pos, rx1399_eos, rxscan1402_done
  rxscan1402_scan:
    set_addr $I10, rxscan1402_loop
    rx1399_cur."!mark_push"(0, rx1399_pos, $I10)
  rxscan1402_done:
.annotate 'line', 592
  # rx subcapture "zw"
    set_addr $I10, rxcap_1407_fail
    rx1399_cur."!mark_push"(0, rx1399_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx1399_pos, rx1399_eos, rx1399_fail
    sub $I10, rx1399_pos, rx1399_off
    substr $S10, rx1399_tgt, $I10, 1
    index $I11, "?!", $S10
    lt $I11, 0, rx1399_fail
    inc rx1399_pos
  # rx subrule "before" subtype=zerowidth negate=
    rx1399_cur."!cursor_pos"(rx1399_pos)
    .const 'Sub' $P1404 = "368_1284728478.15265" 
    capture_lex $P1404
    $P10 = rx1399_cur."before"($P1404)
    unless $P10, rx1399_fail
    set_addr $I10, rxcap_1407_fail
    ($I12, $I11) = rx1399_cur."!mark_peek"($I10)
    rx1399_cur."!cursor_pos"($I11)
    ($P10) = rx1399_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1399_pos, "")
    rx1399_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("zw")
    goto rxcap_1407_done
  rxcap_1407_fail:
    goto rx1399_fail
  rxcap_1407_done:
  # rx subrule "codeblock" subtype=capture negate=
    rx1399_cur."!cursor_pos"(rx1399_pos)
    $P10 = rx1399_cur."codeblock"()
    unless $P10, rx1399_fail
    rx1399_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1399_pos = $P10."pos"()
.annotate 'line', 591
  # rx pass
    rx1399_cur."!cursor_pass"(rx1399_pos, "assertion:sym<?{ }>")
    if_null rx1399_debug, debug_1069
    rx1399_cur."!cursor_debug"("PASS", "assertion:sym<?{ }>", " at pos=", rx1399_pos)
  debug_1069:
    .return (rx1399_cur)
  rx1399_restart:
.annotate 'line', 574
    if_null rx1399_debug, debug_1070
    rx1399_cur."!cursor_debug"("NEXT", "assertion:sym<?{ }>")
  debug_1070:
  rx1399_fail:
    (rx1399_rep, rx1399_pos, $I10, $P10) = rx1399_cur."!mark_fail"(0)
    lt rx1399_pos, -1, rx1399_done
    eq rx1399_pos, -1, rx1399_fail
    jump $I10
  rx1399_done:
    rx1399_cur."!cursor_fail"()
    if_null rx1399_debug, debug_1071
    rx1399_cur."!cursor_debug"("FAIL", "assertion:sym<?{ }>")
  debug_1071:
    .return (rx1399_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<?{ }>"  :subid("367_1284728478.15265") :method
.annotate 'line', 574
    new $P1401, "ResizablePMCArray"
    push $P1401, "!"
    push $P1401, "?"
    .return ($P1401)
.end


.namespace ["NQP";"Regex"]
.sub "_block1403"  :anon :subid("368_1284728478.15265") :method :outer("366_1284728478.15265")
.annotate 'line', 592
    .local string rx1405_tgt
    .local int rx1405_pos
    .local int rx1405_off
    .local int rx1405_eos
    .local int rx1405_rep
    .local pmc rx1405_cur
    .local pmc rx1405_debug
    (rx1405_cur, rx1405_pos, rx1405_tgt, $I10) = self."!cursor_start"()
    getattribute rx1405_debug, rx1405_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1405_cur
    .local pmc match
    .lex "$/", match
    length rx1405_eos, rx1405_tgt
    gt rx1405_pos, rx1405_eos, rx1405_done
    set rx1405_off, 0
    lt rx1405_pos, 2, rx1405_start
    sub rx1405_off, rx1405_pos, 1
    substr rx1405_tgt, rx1405_tgt, rx1405_off
  rx1405_start:
    eq $I10, 1, rx1405_restart
    if_null rx1405_debug, debug_1065
    rx1405_cur."!cursor_debug"("START", "")
  debug_1065:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1406_done
    goto rxscan1406_scan
  rxscan1406_loop:
    ($P10) = rx1405_cur."from"()
    inc $P10
    set rx1405_pos, $P10
    ge rx1405_pos, rx1405_eos, rxscan1406_done
  rxscan1406_scan:
    set_addr $I10, rxscan1406_loop
    rx1405_cur."!mark_push"(0, rx1405_pos, $I10)
  rxscan1406_done:
  # rx literal  "{"
    add $I11, rx1405_pos, 1
    gt $I11, rx1405_eos, rx1405_fail
    sub $I11, rx1405_pos, rx1405_off
    ord $I11, rx1405_tgt, $I11
    ne $I11, 123, rx1405_fail
    add rx1405_pos, 1
  # rx pass
    rx1405_cur."!cursor_pass"(rx1405_pos, "")
    if_null rx1405_debug, debug_1066
    rx1405_cur."!cursor_debug"("PASS", "", " at pos=", rx1405_pos)
  debug_1066:
    .return (rx1405_cur)
  rx1405_restart:
    if_null rx1405_debug, debug_1067
    rx1405_cur."!cursor_debug"("NEXT", "")
  debug_1067:
  rx1405_fail:
    (rx1405_rep, rx1405_pos, $I10, $P10) = rx1405_cur."!mark_fail"(0)
    lt rx1405_pos, -1, rx1405_done
    eq rx1405_pos, -1, rx1405_fail
    jump $I10
  rx1405_done:
    rx1405_cur."!cursor_fail"()
    if_null rx1405_debug, debug_1068
    rx1405_cur."!cursor_debug"("FAIL", "")
  debug_1068:
    .return (rx1405_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("369_1284728478.15265") :method :outer("355_1284728478.15265")
.annotate 'line', 574
    .const 'Sub' $P1417 = "371_1284728478.15265" 
    capture_lex $P1417
    .local string rx1409_tgt
    .local int rx1409_pos
    .local int rx1409_off
    .local int rx1409_eos
    .local int rx1409_rep
    .local pmc rx1409_cur
    .local pmc rx1409_debug
    (rx1409_cur, rx1409_pos, rx1409_tgt, $I10) = self."!cursor_start"()
    rx1409_cur."!cursor_caparray"("nibbler", "arglist", "assertion")
    getattribute rx1409_debug, rx1409_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1409_cur
    .local pmc match
    .lex "$/", match
    length rx1409_eos, rx1409_tgt
    gt rx1409_pos, rx1409_eos, rx1409_done
    set rx1409_off, 0
    lt rx1409_pos, 2, rx1409_start
    sub rx1409_off, rx1409_pos, 1
    substr rx1409_tgt, rx1409_tgt, rx1409_off
  rx1409_start:
    eq $I10, 1, rx1409_restart
    if_null rx1409_debug, debug_1072
    rx1409_cur."!cursor_debug"("START", "assertion:sym<name>")
  debug_1072:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1413_done
    goto rxscan1413_scan
  rxscan1413_loop:
    ($P10) = rx1409_cur."from"()
    inc $P10
    set rx1409_pos, $P10
    ge rx1409_pos, rx1409_eos, rxscan1413_done
  rxscan1413_scan:
    set_addr $I10, rxscan1413_loop
    rx1409_cur."!mark_push"(0, rx1409_pos, $I10)
  rxscan1413_done:
.annotate 'line', 596
  # rx subrule "identifier" subtype=capture negate=
    rx1409_cur."!cursor_pos"(rx1409_pos)
    $P10 = rx1409_cur."identifier"()
    unless $P10, rx1409_fail
    rx1409_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    rx1409_pos = $P10."pos"()
.annotate 'line', 603
  # rx rxquantr1414 ** 0..1
    set_addr $I10, rxquantr1414_done
    rx1409_cur."!mark_push"(0, rx1409_pos, $I10)
  rxquantr1414_loop:
  alt1415_0:
.annotate 'line', 597
    set_addr $I10, alt1415_1
    rx1409_cur."!mark_push"(0, rx1409_pos, $I10)
.annotate 'line', 598
  # rx subrule "before" subtype=zerowidth negate=
    rx1409_cur."!cursor_pos"(rx1409_pos)
    .const 'Sub' $P1417 = "371_1284728478.15265" 
    capture_lex $P1417
    $P10 = rx1409_cur."before"($P1417)
    unless $P10, rx1409_fail
    goto alt1415_end
  alt1415_1:
    set_addr $I10, alt1415_2
    rx1409_cur."!mark_push"(0, rx1409_pos, $I10)
.annotate 'line', 599
  # rx literal  "="
    add $I11, rx1409_pos, 1
    gt $I11, rx1409_eos, rx1409_fail
    sub $I11, rx1409_pos, rx1409_off
    ord $I11, rx1409_tgt, $I11
    ne $I11, 61, rx1409_fail
    add rx1409_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1409_cur."!cursor_pos"(rx1409_pos)
    $P10 = rx1409_cur."assertion"()
    unless $P10, rx1409_fail
    rx1409_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1409_pos = $P10."pos"()
    goto alt1415_end
  alt1415_2:
    set_addr $I10, alt1415_3
    rx1409_cur."!mark_push"(0, rx1409_pos, $I10)
.annotate 'line', 600
  # rx literal  ":"
    add $I11, rx1409_pos, 1
    gt $I11, rx1409_eos, rx1409_fail
    sub $I11, rx1409_pos, rx1409_off
    ord $I11, rx1409_tgt, $I11
    ne $I11, 58, rx1409_fail
    add rx1409_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1409_cur."!cursor_pos"(rx1409_pos)
    $P10 = rx1409_cur."arglist"()
    unless $P10, rx1409_fail
    rx1409_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1409_pos = $P10."pos"()
    goto alt1415_end
  alt1415_3:
    set_addr $I10, alt1415_4
    rx1409_cur."!mark_push"(0, rx1409_pos, $I10)
.annotate 'line', 601
  # rx literal  "("
    add $I11, rx1409_pos, 1
    gt $I11, rx1409_eos, rx1409_fail
    sub $I11, rx1409_pos, rx1409_off
    ord $I11, rx1409_tgt, $I11
    ne $I11, 40, rx1409_fail
    add rx1409_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1409_cur."!cursor_pos"(rx1409_pos)
    $P10 = rx1409_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1409_fail
    rx1409_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1409_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1409_pos, 1
    gt $I11, rx1409_eos, rx1409_fail
    sub $I11, rx1409_pos, rx1409_off
    ord $I11, rx1409_tgt, $I11
    ne $I11, 41, rx1409_fail
    add rx1409_pos, 1
    goto alt1415_end
  alt1415_4:
.annotate 'line', 602
  # rx subrule "normspace" subtype=method negate=
    rx1409_cur."!cursor_pos"(rx1409_pos)
    $P10 = rx1409_cur."normspace"()
    unless $P10, rx1409_fail
    rx1409_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1409_cur."!cursor_pos"(rx1409_pos)
    $P10 = rx1409_cur."nibbler"()
    unless $P10, rx1409_fail
    rx1409_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1409_pos = $P10."pos"()
  alt1415_end:
.annotate 'line', 603
    set_addr $I10, rxquantr1414_done
    (rx1409_rep) = rx1409_cur."!mark_commit"($I10)
  rxquantr1414_done:
.annotate 'line', 595
  # rx pass
    rx1409_cur."!cursor_pass"(rx1409_pos, "assertion:sym<name>")
    if_null rx1409_debug, debug_1077
    rx1409_cur."!cursor_debug"("PASS", "assertion:sym<name>", " at pos=", rx1409_pos)
  debug_1077:
    .return (rx1409_cur)
  rx1409_restart:
.annotate 'line', 574
    if_null rx1409_debug, debug_1078
    rx1409_cur."!cursor_debug"("NEXT", "assertion:sym<name>")
  debug_1078:
  rx1409_fail:
    (rx1409_rep, rx1409_pos, $I10, $P10) = rx1409_cur."!mark_fail"(0)
    lt rx1409_pos, -1, rx1409_done
    eq rx1409_pos, -1, rx1409_fail
    jump $I10
  rx1409_done:
    rx1409_cur."!cursor_fail"()
    if_null rx1409_debug, debug_1079
    rx1409_cur."!cursor_debug"("FAIL", "assertion:sym<name>")
  debug_1079:
    .return (rx1409_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("370_1284728478.15265") :method
.annotate 'line', 574
    $P1411 = self."!PREFIX__!subrule"("identifier", "")
    new $P1412, "ResizablePMCArray"
    push $P1412, $P1411
    .return ($P1412)
.end


.namespace ["NQP";"Regex"]
.sub "_block1416"  :anon :subid("371_1284728478.15265") :method :outer("369_1284728478.15265")
.annotate 'line', 598
    .local string rx1418_tgt
    .local int rx1418_pos
    .local int rx1418_off
    .local int rx1418_eos
    .local int rx1418_rep
    .local pmc rx1418_cur
    .local pmc rx1418_debug
    (rx1418_cur, rx1418_pos, rx1418_tgt, $I10) = self."!cursor_start"()
    getattribute rx1418_debug, rx1418_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1418_cur
    .local pmc match
    .lex "$/", match
    length rx1418_eos, rx1418_tgt
    gt rx1418_pos, rx1418_eos, rx1418_done
    set rx1418_off, 0
    lt rx1418_pos, 2, rx1418_start
    sub rx1418_off, rx1418_pos, 1
    substr rx1418_tgt, rx1418_tgt, rx1418_off
  rx1418_start:
    eq $I10, 1, rx1418_restart
    if_null rx1418_debug, debug_1073
    rx1418_cur."!cursor_debug"("START", "")
  debug_1073:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1419_done
    goto rxscan1419_scan
  rxscan1419_loop:
    ($P10) = rx1418_cur."from"()
    inc $P10
    set rx1418_pos, $P10
    ge rx1418_pos, rx1418_eos, rxscan1419_done
  rxscan1419_scan:
    set_addr $I10, rxscan1419_loop
    rx1418_cur."!mark_push"(0, rx1418_pos, $I10)
  rxscan1419_done:
  # rx literal  ">"
    add $I11, rx1418_pos, 1
    gt $I11, rx1418_eos, rx1418_fail
    sub $I11, rx1418_pos, rx1418_off
    ord $I11, rx1418_tgt, $I11
    ne $I11, 62, rx1418_fail
    add rx1418_pos, 1
  # rx pass
    rx1418_cur."!cursor_pass"(rx1418_pos, "")
    if_null rx1418_debug, debug_1074
    rx1418_cur."!cursor_debug"("PASS", "", " at pos=", rx1418_pos)
  debug_1074:
    .return (rx1418_cur)
  rx1418_restart:
    if_null rx1418_debug, debug_1075
    rx1418_cur."!cursor_debug"("NEXT", "")
  debug_1075:
  rx1418_fail:
    (rx1418_rep, rx1418_pos, $I10, $P10) = rx1418_cur."!mark_fail"(0)
    lt rx1418_pos, -1, rx1418_done
    eq rx1418_pos, -1, rx1418_fail
    jump $I10
  rx1418_done:
    rx1418_cur."!cursor_fail"()
    if_null rx1418_debug, debug_1076
    rx1418_cur."!cursor_debug"("FAIL", "")
  debug_1076:
    .return (rx1418_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<var>"  :subid("372_1284728478.15265") :method :outer("355_1284728478.15265")
.annotate 'line', 574
    .local string rx1421_tgt
    .local int rx1421_pos
    .local int rx1421_off
    .local int rx1421_eos
    .local int rx1421_rep
    .local pmc rx1421_cur
    .local pmc rx1421_debug
    (rx1421_cur, rx1421_pos, rx1421_tgt, $I10) = self."!cursor_start"()
    getattribute rx1421_debug, rx1421_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1421_cur
    .local pmc match
    .lex "$/", match
    length rx1421_eos, rx1421_tgt
    gt rx1421_pos, rx1421_eos, rx1421_done
    set rx1421_off, 0
    lt rx1421_pos, 2, rx1421_start
    sub rx1421_off, rx1421_pos, 1
    substr rx1421_tgt, rx1421_tgt, rx1421_off
  rx1421_start:
    eq $I10, 1, rx1421_restart
    if_null rx1421_debug, debug_1080
    rx1421_cur."!cursor_debug"("START", "assertion:sym<var>")
  debug_1080:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1424_done
    goto rxscan1424_scan
  rxscan1424_loop:
    ($P10) = rx1421_cur."from"()
    inc $P10
    set rx1421_pos, $P10
    ge rx1421_pos, rx1421_eos, rxscan1424_done
  rxscan1424_scan:
    set_addr $I10, rxscan1424_loop
    rx1421_cur."!mark_push"(0, rx1421_pos, $I10)
  rxscan1424_done:
.annotate 'line', 607
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1421_pos, rx1421_off
    substr $S10, rx1421_tgt, $I10, 1
    index $I11, "$@", $S10
    lt $I11, 0, rx1421_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1421_cur."!cursor_pos"(rx1421_pos)
    $P10 = rx1421_cur."LANG"("MAIN", "variable")
    unless $P10, rx1421_fail
    rx1421_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("var")
    rx1421_pos = $P10."pos"()
.annotate 'line', 606
  # rx pass
    rx1421_cur."!cursor_pass"(rx1421_pos, "assertion:sym<var>")
    if_null rx1421_debug, debug_1081
    rx1421_cur."!cursor_debug"("PASS", "assertion:sym<var>", " at pos=", rx1421_pos)
  debug_1081:
    .return (rx1421_cur)
  rx1421_restart:
.annotate 'line', 574
    if_null rx1421_debug, debug_1082
    rx1421_cur."!cursor_debug"("NEXT", "assertion:sym<var>")
  debug_1082:
  rx1421_fail:
    (rx1421_rep, rx1421_pos, $I10, $P10) = rx1421_cur."!mark_fail"(0)
    lt rx1421_pos, -1, rx1421_done
    eq rx1421_pos, -1, rx1421_fail
    jump $I10
  rx1421_done:
    rx1421_cur."!cursor_fail"()
    if_null rx1421_debug, debug_1083
    rx1421_cur."!cursor_debug"("FAIL", "assertion:sym<var>")
  debug_1083:
    .return (rx1421_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<var>"  :subid("373_1284728478.15265") :method
.annotate 'line', 574
    new $P1423, "ResizablePMCArray"
    push $P1423, "$"
    push $P1423, "@"
    .return ($P1423)
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("374_1284728478.15265") :method :outer("355_1284728478.15265")
.annotate 'line', 574
    .local string rx1426_tgt
    .local int rx1426_pos
    .local int rx1426_off
    .local int rx1426_eos
    .local int rx1426_rep
    .local pmc rx1426_cur
    .local pmc rx1426_debug
    (rx1426_cur, rx1426_pos, rx1426_tgt, $I10) = self."!cursor_start"()
    getattribute rx1426_debug, rx1426_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1426_cur
    .local pmc match
    .lex "$/", match
    length rx1426_eos, rx1426_tgt
    gt rx1426_pos, rx1426_eos, rx1426_done
    set rx1426_off, 0
    lt rx1426_pos, 2, rx1426_start
    sub rx1426_off, rx1426_pos, 1
    substr rx1426_tgt, rx1426_tgt, rx1426_off
  rx1426_start:
    eq $I10, 1, rx1426_restart
    if_null rx1426_debug, debug_1084
    rx1426_cur."!cursor_debug"("START", "codeblock")
  debug_1084:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1430_done
    goto rxscan1430_scan
  rxscan1430_loop:
    ($P10) = rx1426_cur."from"()
    inc $P10
    set rx1426_pos, $P10
    ge rx1426_pos, rx1426_eos, rxscan1430_done
  rxscan1430_scan:
    set_addr $I10, rxscan1430_loop
    rx1426_cur."!mark_push"(0, rx1426_pos, $I10)
  rxscan1430_done:
.annotate 'line', 611
  # rx subrule "LANG" subtype=capture negate=
    rx1426_cur."!cursor_pos"(rx1426_pos)
    $P10 = rx1426_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1426_fail
    rx1426_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1426_pos = $P10."pos"()
.annotate 'line', 610
  # rx pass
    rx1426_cur."!cursor_pass"(rx1426_pos, "codeblock")
    if_null rx1426_debug, debug_1085
    rx1426_cur."!cursor_debug"("PASS", "codeblock", " at pos=", rx1426_pos)
  debug_1085:
    .return (rx1426_cur)
  rx1426_restart:
.annotate 'line', 574
    if_null rx1426_debug, debug_1086
    rx1426_cur."!cursor_debug"("NEXT", "codeblock")
  debug_1086:
  rx1426_fail:
    (rx1426_rep, rx1426_pos, $I10, $P10) = rx1426_cur."!mark_fail"(0)
    lt rx1426_pos, -1, rx1426_done
    eq rx1426_pos, -1, rx1426_fail
    jump $I10
  rx1426_done:
    rx1426_cur."!cursor_fail"()
    if_null rx1426_debug, debug_1087
    rx1426_cur."!cursor_debug"("FAIL", "codeblock")
  debug_1087:
    .return (rx1426_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("375_1284728478.15265") :method
.annotate 'line', 574
    $P1428 = self."!PREFIX__!subrule"("LANG", "")
    new $P1429, "ResizablePMCArray"
    push $P1429, $P1428
    .return ($P1429)
.end


.namespace ["NQP";"Grammar"]
.sub "_block1432" :load :anon :subid("376_1284728478.15265")
.annotate 'line', 4
    .const 'Sub' $P1434 = "11_1284728478.15265" 
    $P1435 = $P1434()
    .return ($P1435)
.end


.namespace []
.sub "_block1453" :load :anon :subid("377_1284728478.15265")
.annotate 'line', 1
    .const 'Sub' $P1455 = "10_1284728478.15265" 
    $P1456 = $P1455()
    .return ($P1456)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1284728484.24945")
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
    $P2558 = $P14()
.annotate 'line', 1
    .return ($P2558)
    .const 'Sub' $P2560 = "148_1284728484.24945" 
    .return ($P2560)
.end


.namespace []
.sub "" :load :init :subid("post149") :outer("10_1284728484.24945")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1284728484.24945" 
    .local pmc block
    set block, $P12
    $P2563 = get_root_global ["parrot"], "P6metaclass"
    $P2563."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1284728484.24945") :outer("10_1284728484.24945")
.annotate 'line', 3
    .const 'Sub' $P2554 = "147_1284728484.24945" 
    capture_lex $P2554
    get_hll_global $P2437, ["NQP";"RegexActions"], "_block2436" 
    capture_lex $P2437
    .const 'Sub' $P2426 = "137_1284728484.24945" 
    capture_lex $P2426
    .const 'Sub' $P2419 = "136_1284728484.24945" 
    capture_lex $P2419
    .const 'Sub' $P2412 = "135_1284728484.24945" 
    capture_lex $P2412
    .const 'Sub' $P2405 = "134_1284728484.24945" 
    capture_lex $P2405
    .const 'Sub' $P2392 = "133_1284728484.24945" 
    capture_lex $P2392
    .const 'Sub' $P2382 = "132_1284728484.24945" 
    capture_lex $P2382
    .const 'Sub' $P2372 = "131_1284728484.24945" 
    capture_lex $P2372
    .const 'Sub' $P2362 = "130_1284728484.24945" 
    capture_lex $P2362
    .const 'Sub' $P2355 = "129_1284728484.24945" 
    capture_lex $P2355
    .const 'Sub' $P2341 = "128_1284728484.24945" 
    capture_lex $P2341
    .const 'Sub' $P2331 = "127_1284728484.24945" 
    capture_lex $P2331
    .const 'Sub' $P2294 = "126_1284728484.24945" 
    capture_lex $P2294
    .const 'Sub' $P2280 = "125_1284728484.24945" 
    capture_lex $P2280
    .const 'Sub' $P2270 = "124_1284728484.24945" 
    capture_lex $P2270
    .const 'Sub' $P2260 = "123_1284728484.24945" 
    capture_lex $P2260
    .const 'Sub' $P2250 = "122_1284728484.24945" 
    capture_lex $P2250
    .const 'Sub' $P2240 = "121_1284728484.24945" 
    capture_lex $P2240
    .const 'Sub' $P2230 = "120_1284728484.24945" 
    capture_lex $P2230
    .const 'Sub' $P2202 = "119_1284728484.24945" 
    capture_lex $P2202
    .const 'Sub' $P2185 = "118_1284728484.24945" 
    capture_lex $P2185
    .const 'Sub' $P2175 = "117_1284728484.24945" 
    capture_lex $P2175
    .const 'Sub' $P2162 = "116_1284728484.24945" 
    capture_lex $P2162
    .const 'Sub' $P2149 = "115_1284728484.24945" 
    capture_lex $P2149
    .const 'Sub' $P2136 = "114_1284728484.24945" 
    capture_lex $P2136
    .const 'Sub' $P2126 = "113_1284728484.24945" 
    capture_lex $P2126
    .const 'Sub' $P2097 = "112_1284728484.24945" 
    capture_lex $P2097
    .const 'Sub' $P2073 = "111_1284728484.24945" 
    capture_lex $P2073
    .const 'Sub' $P2063 = "110_1284728484.24945" 
    capture_lex $P2063
    .const 'Sub' $P2053 = "109_1284728484.24945" 
    capture_lex $P2053
    .const 'Sub' $P2026 = "108_1284728484.24945" 
    capture_lex $P2026
    .const 'Sub' $P2008 = "107_1284728484.24945" 
    capture_lex $P2008
    .const 'Sub' $P1998 = "106_1284728484.24945" 
    capture_lex $P1998
    .const 'Sub' $P1894 = "103_1284728484.24945" 
    capture_lex $P1894
    .const 'Sub' $P1884 = "102_1284728484.24945" 
    capture_lex $P1884
    .const 'Sub' $P1855 = "101_1284728484.24945" 
    capture_lex $P1855
    .const 'Sub' $P1813 = "100_1284728484.24945" 
    capture_lex $P1813
    .const 'Sub' $P1797 = "99_1284728484.24945" 
    capture_lex $P1797
    .const 'Sub' $P1788 = "98_1284728484.24945" 
    capture_lex $P1788
    .const 'Sub' $P1756 = "97_1284728484.24945" 
    capture_lex $P1756
    .const 'Sub' $P1657 = "94_1284728484.24945" 
    capture_lex $P1657
    .const 'Sub' $P1615 = "92_1284728484.24945" 
    capture_lex $P1615
    .const 'Sub' $P1605 = "91_1284728484.24945" 
    capture_lex $P1605
    .const 'Sub' $P1588 = "90_1284728484.24945" 
    capture_lex $P1588
    .const 'Sub' $P1568 = "89_1284728484.24945" 
    capture_lex $P1568
    .const 'Sub' $P1456 = "86_1284728484.24945" 
    capture_lex $P1456
    .const 'Sub' $P1387 = "82_1284728484.24945" 
    capture_lex $P1387
    .const 'Sub' $P1322 = "79_1284728484.24945" 
    capture_lex $P1322
    .const 'Sub' $P1250 = "76_1284728484.24945" 
    capture_lex $P1250
    .const 'Sub' $P1240 = "75_1284728484.24945" 
    capture_lex $P1240
    .const 'Sub' $P1230 = "74_1284728484.24945" 
    capture_lex $P1230
    .const 'Sub' $P1159 = "72_1284728484.24945" 
    capture_lex $P1159
    .const 'Sub' $P1149 = "71_1284728484.24945" 
    capture_lex $P1149
    .const 'Sub' $P1132 = "70_1284728484.24945" 
    capture_lex $P1132
    .const 'Sub' $P1115 = "69_1284728484.24945" 
    capture_lex $P1115
    .const 'Sub' $P1098 = "68_1284728484.24945" 
    capture_lex $P1098
    .const 'Sub' $P1088 = "67_1284728484.24945" 
    capture_lex $P1088
    .const 'Sub' $P1078 = "66_1284728484.24945" 
    capture_lex $P1078
    .const 'Sub' $P1068 = "65_1284728484.24945" 
    capture_lex $P1068
    .const 'Sub' $P1044 = "64_1284728484.24945" 
    capture_lex $P1044
    .const 'Sub' $P991 = "63_1284728484.24945" 
    capture_lex $P991
    .const 'Sub' $P981 = "62_1284728484.24945" 
    capture_lex $P981
    .const 'Sub' $P892 = "60_1284728484.24945" 
    capture_lex $P892
    .const 'Sub' $P866 = "59_1284728484.24945" 
    capture_lex $P866
    .const 'Sub' $P850 = "58_1284728484.24945" 
    capture_lex $P850
    .const 'Sub' $P840 = "57_1284728484.24945" 
    capture_lex $P840
    .const 'Sub' $P830 = "56_1284728484.24945" 
    capture_lex $P830
    .const 'Sub' $P820 = "55_1284728484.24945" 
    capture_lex $P820
    .const 'Sub' $P810 = "54_1284728484.24945" 
    capture_lex $P810
    .const 'Sub' $P800 = "53_1284728484.24945" 
    capture_lex $P800
    .const 'Sub' $P790 = "52_1284728484.24945" 
    capture_lex $P790
    .const 'Sub' $P780 = "51_1284728484.24945" 
    capture_lex $P780
    .const 'Sub' $P770 = "50_1284728484.24945" 
    capture_lex $P770
    .const 'Sub' $P760 = "49_1284728484.24945" 
    capture_lex $P760
    .const 'Sub' $P750 = "48_1284728484.24945" 
    capture_lex $P750
    .const 'Sub' $P740 = "47_1284728484.24945" 
    capture_lex $P740
    .const 'Sub' $P730 = "46_1284728484.24945" 
    capture_lex $P730
    .const 'Sub' $P720 = "45_1284728484.24945" 
    capture_lex $P720
    .const 'Sub' $P702 = "44_1284728484.24945" 
    capture_lex $P702
    .const 'Sub' $P667 = "43_1284728484.24945" 
    capture_lex $P667
    .const 'Sub' $P651 = "42_1284728484.24945" 
    capture_lex $P651
    .const 'Sub' $P630 = "41_1284728484.24945" 
    capture_lex $P630
    .const 'Sub' $P610 = "40_1284728484.24945" 
    capture_lex $P610
    .const 'Sub' $P597 = "39_1284728484.24945" 
    capture_lex $P597
    .const 'Sub' $P571 = "38_1284728484.24945" 
    capture_lex $P571
    .const 'Sub' $P535 = "37_1284728484.24945" 
    capture_lex $P535
    .const 'Sub' $P518 = "36_1284728484.24945" 
    capture_lex $P518
    .const 'Sub' $P504 = "35_1284728484.24945" 
    capture_lex $P504
    .const 'Sub' $P451 = "33_1284728484.24945" 
    capture_lex $P451
    .const 'Sub' $P440 = "32_1284728484.24945" 
    capture_lex $P440
    .const 'Sub' $P427 = "31_1284728484.24945" 
    capture_lex $P427
    .const 'Sub' $P407 = "30_1284728484.24945" 
    capture_lex $P407
    .const 'Sub' $P397 = "29_1284728484.24945" 
    capture_lex $P397
    .const 'Sub' $P387 = "28_1284728484.24945" 
    capture_lex $P387
    .const 'Sub' $P371 = "27_1284728484.24945" 
    capture_lex $P371
    .const 'Sub' $P288 = "25_1284728484.24945" 
    capture_lex $P288
    .const 'Sub' $P245 = "23_1284728484.24945" 
    capture_lex $P245
    .const 'Sub' $P213 = "22_1284728484.24945" 
    capture_lex $P213
    .const 'Sub' $P180 = "21_1284728484.24945" 
    capture_lex $P180
    .const 'Sub' $P170 = "20_1284728484.24945" 
    capture_lex $P170
    .const 'Sub' $P151 = "19_1284728484.24945" 
    capture_lex $P151
    .const 'Sub' $P100 = "18_1284728484.24945" 
    capture_lex $P100
    .const 'Sub' $P84 = "17_1284728484.24945" 
    capture_lex $P84
    .const 'Sub' $P63 = "16_1284728484.24945" 
    capture_lex $P63
    .const 'Sub' $P27 = "13_1284728484.24945" 
    capture_lex $P27
    .const 'Sub' $P16 = "12_1284728484.24945" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_152
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P15
  vivify_152:
.annotate 'line', 9
    .const 'Sub' $P16 = "12_1284728484.24945" 
    newclosure $P26, $P16
    .lex "xblock_immediate", $P26
.annotate 'line', 14
    .const 'Sub' $P27 = "13_1284728484.24945" 
    newclosure $P62, $P27
    .lex "block_immediate", $P62
.annotate 'line', 24
    .const 'Sub' $P63 = "16_1284728484.24945" 
    newclosure $P83, $P63
    .lex "vivitype", $P83
.annotate 'line', 43
    .const 'Sub' $P84 = "17_1284728484.24945" 
    newclosure $P99, $P84
    .lex "colonpair_str", $P99
.annotate 'line', 223
    .const 'Sub' $P100 = "18_1284728484.24945" 
    newclosure $P150, $P100
    .lex "push_block_handler", $P150
.annotate 'line', 861
    .const 'Sub' $P151 = "19_1284728484.24945" 
    newclosure $P165, $P151
    .lex "control", $P165
.annotate 'line', 3
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    get_global $P166, "@BLOCK"
.annotate 'line', 5
    find_lex $P167, "xblock_immediate"
    find_lex $P168, "block_immediate"
    find_lex $P169, "vivitype"
.annotate 'line', 35
    find_lex $P212, "colonpair_str"
.annotate 'line', 216
    find_lex $P650, "push_block_handler"
.annotate 'line', 852
    find_lex $P2404, "control"
.annotate 'line', 879
    get_hll_global $P2437, ["NQP";"RegexActions"], "_block2436" 
    capture_lex $P2437
    $P2548 = $P2437()
.annotate 'line', 3
    .return ($P2548)
    .const 'Sub' $P2550 = "146_1284728484.24945" 
    .return ($P2550)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post150") :outer("11_1284728484.24945")
.annotate 'line', 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 5
    .const 'Sub' $P2554 = "147_1284728484.24945" 
    capture_lex $P2554
    $P2554()
    $P2557 = get_root_global ["parrot"], "P6metaclass"
    $P2557."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block2553"  :anon :subid("147_1284728484.24945") :outer("11_1284728484.24945")
.annotate 'line', 6
    get_global $P2555, "@BLOCK"
    unless_null $P2555, vivify_151
    $P2555 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P2555
  vivify_151:
 $P2556 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P2556
.annotate 'line', 5
    .return ($P2556)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "xblock_immediate"  :subid("12_1284728484.24945") :outer("11_1284728484.24945")
    .param pmc param_19
.annotate 'line', 9
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(.CONTROL_RETURN)
    push_eh $P18
    .lex "$xblock", param_19
.annotate 'line', 10
    find_lex $P20, "$xblock"
    unless_null $P20, vivify_153
    $P20 = root_new ['parrot';'ResizablePMCArray']
  vivify_153:
    set $P21, $P20[1]
    unless_null $P21, vivify_154
    new $P21, "Undef"
  vivify_154:
    $P22 = "block_immediate"($P21)
    find_lex $P23, "$xblock"
    unless_null $P23, vivify_155
    $P23 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$xblock", $P23
  vivify_155:
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
.include "except_types.pasm"
.sub "block_immediate"  :subid("13_1284728484.24945") :outer("11_1284728484.24945")
    .param pmc param_30
.annotate 'line', 14
    .const 'Sub' $P40 = "14_1284728484.24945" 
    capture_lex $P40
    new $P29, 'ExceptionHandler'
    set_addr $P29, control_28
    $P29."handle_types"(.CONTROL_RETURN)
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
    .const 'Sub' $P40 = "14_1284728484.24945" 
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
.include "except_types.pasm"
.sub "_block39"  :anon :subid("14_1284728484.24945") :outer("13_1284728484.24945")
.annotate 'line', 16
    .const 'Sub' $P51 = "15_1284728484.24945" 
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
    unless $I48, for_undef_156
    iter $P45, $P47
    new $P57, 'ExceptionHandler'
    set_addr $P57, loop56_handler
    $P57."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P57
  loop56_test:
    unless $P45, loop56_done
    shift $P49, $P45
  loop56_redo:
    .const 'Sub' $P51 = "15_1284728484.24945" 
    capture_lex $P51
    $P51($P49)
  loop56_next:
    goto loop56_test
  loop56_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P58, exception, 'type'
    eq $P58, .CONTROL_LOOP_NEXT, loop56_next
    eq $P58, .CONTROL_LOOP_REDO, loop56_redo
  loop56_done:
    pop_eh 
  for_undef_156:
.annotate 'line', 19
    find_lex $P59, "$stmts"
    store_lex "$block", $P59
.annotate 'line', 16
    .return ($P59)
.end


.namespace ["NQP";"Actions"]
.sub "_block50"  :anon :subid("15_1284728484.24945") :outer("14_1284728484.24945")
    .param pmc param_52
.annotate 'line', 18
    .lex "$_", param_52
    find_lex $P53, "$stmts"
    find_lex $P54, "$_"
    $P55 = $P53."push"($P54)
    .return ($P55)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "vivitype"  :subid("16_1284728484.24945") :outer("11_1284728484.24945")
    .param pmc param_66
.annotate 'line', 24
    new $P65, 'ExceptionHandler'
    set_addr $P65, control_64
    $P65."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "colonpair_str"  :subid("17_1284728484.24945") :outer("11_1284728484.24945")
    .param pmc param_87
.annotate 'line', 43
    new $P86, 'ExceptionHandler'
    set_addr $P86, control_85
    $P86."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "push_block_handler"  :subid("18_1284728484.24945") :outer("11_1284728484.24945")
    .param pmc param_103
    .param pmc param_104
.annotate 'line', 223
    new $P102, 'ExceptionHandler'
    set_addr $P102, control_101
    $P102."handle_types"(.CONTROL_RETURN)
    push_eh $P102
    .lex "$/", param_103
    .lex "$block", param_104
.annotate 'line', 224
    get_global $P106, "@BLOCK"
    unless_null $P106, vivify_157
    $P106 = root_new ['parrot';'ResizablePMCArray']
  vivify_157:
    set $P107, $P106[0]
    unless_null $P107, vivify_158
    new $P107, "Undef"
  vivify_158:
    $P108 = $P107."handlers"()
    if $P108, unless_105_end
.annotate 'line', 225
    get_global $P109, "@BLOCK"
    unless_null $P109, vivify_159
    $P109 = root_new ['parrot';'ResizablePMCArray']
  vivify_159:
    set $P110, $P109[0]
    unless_null $P110, vivify_160
    new $P110, "Undef"
  vivify_160:
    new $P111, "ResizablePMCArray"
    $P110."handlers"($P111)
  unless_105_end:
.annotate 'line', 227
    find_lex $P113, "$block"
    $P114 = $P113."arity"()
    if $P114, unless_112_end
.annotate 'line', 228
    find_lex $P115, "$block"
.annotate 'line', 229
    get_hll_global $P116, ["PAST"], "Op"
.annotate 'line', 230
    get_hll_global $P117, ["PAST"], "Var"
    $P118 = $P117."new"("lexical" :named("scope"), "$!" :named("name"), 1 :named("isdecl"))
.annotate 'line', 231
    get_hll_global $P119, ["PAST"], "Var"
    $P120 = $P119."new"("lexical" :named("scope"), "$_" :named("name"))
    $P121 = $P116."new"($P118, $P120, "bind" :named("pasttype"))
.annotate 'line', 229
    $P115."unshift"($P121)
.annotate 'line', 234
    find_lex $P122, "$block"
    get_hll_global $P123, ["PAST"], "Var"
    $P124 = $P123."new"("$_" :named("name"), "parameter" :named("scope"))
    $P122."unshift"($P124)
.annotate 'line', 235
    find_lex $P125, "$block"
    $P125."symbol"("$_", "lexical" :named("scope"))
.annotate 'line', 236
    find_lex $P126, "$block"
    $P126."symbol"("$!", "lexical" :named("scope"))
.annotate 'line', 237
    find_lex $P127, "$block"
    $P127."arity"(1)
  unless_112_end:
.annotate 'line', 239
    find_lex $P128, "$block"
    $P128."blocktype"("declaration")
.annotate 'line', 240
    get_global $P129, "@BLOCK"
    unless_null $P129, vivify_161
    $P129 = root_new ['parrot';'ResizablePMCArray']
  vivify_161:
    set $P130, $P129[0]
    unless_null $P130, vivify_162
    new $P130, "Undef"
  vivify_162:
    $P131 = $P130."handlers"()
.annotate 'line', 241
    get_hll_global $P132, ["PAST"], "Control"
    find_lex $P133, "$/"
.annotate 'line', 243
    get_hll_global $P134, ["PAST"], "Stmts"
.annotate 'line', 244
    get_hll_global $P135, ["PAST"], "Op"
    find_lex $P136, "$block"
.annotate 'line', 246
    get_hll_global $P137, ["PAST"], "Var"
    $P138 = $P137."new"("register" :named("scope"), "exception" :named("name"))
    $P139 = $P135."new"($P136, $P138, "call" :named("pasttype"))
.annotate 'line', 248
    get_hll_global $P140, ["PAST"], "Op"
.annotate 'line', 249
    get_hll_global $P141, ["PAST"], "Var"
.annotate 'line', 250
    get_hll_global $P142, ["PAST"], "Var"
    $P143 = $P142."new"("register" :named("scope"), "exception" :named("name"))
    $P144 = $P141."new"($P143, "handled", "keyed" :named("scope"))
.annotate 'line', 249
    $P145 = $P140."new"($P144, 1, "bind" :named("pasttype"))
.annotate 'line', 248
    $P146 = $P134."new"($P139, $P145)
.annotate 'line', 243
    $P147 = $P132."new"($P146, $P133 :named("node"))
.annotate 'line', 241
    $P148 = $P131."unshift"($P147)
.annotate 'line', 223
    .return ($P148)
  control_101:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P149, exception, "payload"
    .return ($P149)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "control"  :subid("19_1284728484.24945") :outer("11_1284728484.24945")
    .param pmc param_154
    .param pmc param_155
.annotate 'line', 861
    new $P153, 'ExceptionHandler'
    set_addr $P153, control_152
    $P153."handle_types"(.CONTROL_RETURN)
    push_eh $P153
    .lex "$/", param_154
    .lex "$type", param_155
.annotate 'line', 862
    find_lex $P156, "$/"
    get_hll_global $P157, ["PAST"], "Op"
    find_lex $P158, "$/"
.annotate 'line', 866
    get_hll_global $P159, ["PAST"], "Val"
    find_lex $P160, "$type"
    $P161 = $P159."new"($P160 :named("value"), "!except_types" :named("returns"))
    $P162 = $P157."new"(0, $P161, $P158 :named("node"), "die__vii" :named("pirop"))
.annotate 'line', 862
    $P163 = $P156."!make"($P162)
.annotate 'line', 861
    .return ($P163)
  control_152:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P164, exception, "payload"
    .return ($P164)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "TOP"  :subid("20_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_173
.annotate 'line', 33
    new $P172, 'ExceptionHandler'
    set_addr $P172, control_171
    $P172."handle_types"(.CONTROL_RETURN)
    push_eh $P172
    .lex "self", self
    .lex "$/", param_173
    find_lex $P174, "$/"
    find_lex $P175, "$/"
    unless_null $P175, vivify_163
    $P175 = root_new ['parrot';'Hash']
  vivify_163:
    set $P176, $P175["comp_unit"]
    unless_null $P176, vivify_164
    new $P176, "Undef"
  vivify_164:
    $P177 = $P176."ast"()
    $P178 = $P174."!make"($P177)
    .return ($P178)
  control_171:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P179, exception, "payload"
    .return ($P179)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "deflongname"  :subid("21_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_183
.annotate 'line', 35
    new $P182, 'ExceptionHandler'
    set_addr $P182, control_181
    $P182."handle_types"(.CONTROL_RETURN)
    push_eh $P182
    .lex "self", self
    .lex "$/", param_183
.annotate 'line', 36
    find_lex $P184, "$/"
.annotate 'line', 37
    find_lex $P187, "$/"
    unless_null $P187, vivify_165
    $P187 = root_new ['parrot';'Hash']
  vivify_165:
    set $P188, $P187["colonpair"]
    unless_null $P188, vivify_166
    new $P188, "Undef"
  vivify_166:
    if $P188, if_186
.annotate 'line', 39
    find_lex $P208, "$/"
    set $S209, $P208
    new $P185, 'String'
    set $P185, $S209
.annotate 'line', 37
    goto if_186_end
  if_186:
    find_lex $P189, "$/"
    unless_null $P189, vivify_167
    $P189 = root_new ['parrot';'Hash']
  vivify_167:
    set $P190, $P189["identifier"]
    unless_null $P190, vivify_168
    new $P190, "Undef"
  vivify_168:
    set $S191, $P190
    new $P192, 'String'
    set $P192, $S191
    concat $P193, $P192, ":"
    find_lex $P194, "$/"
    unless_null $P194, vivify_169
    $P194 = root_new ['parrot';'Hash']
  vivify_169:
    set $P195, $P194["colonpair"]
    unless_null $P195, vivify_170
    $P195 = root_new ['parrot';'ResizablePMCArray']
  vivify_170:
    set $P196, $P195[0]
    unless_null $P196, vivify_171
    new $P196, "Undef"
  vivify_171:
    $P197 = $P196."ast"()
    $S198 = $P197."named"()
    concat $P199, $P193, $S198
    concat $P200, $P199, "<"
.annotate 'line', 38
    find_lex $P201, "$/"
    unless_null $P201, vivify_172
    $P201 = root_new ['parrot';'Hash']
  vivify_172:
    set $P202, $P201["colonpair"]
    unless_null $P202, vivify_173
    $P202 = root_new ['parrot';'ResizablePMCArray']
  vivify_173:
    set $P203, $P202[0]
    unless_null $P203, vivify_174
    new $P203, "Undef"
  vivify_174:
    $P204 = $P203."ast"()
    $S205 = "colonpair_str"($P204)
    concat $P206, $P200, $S205
    concat $P207, $P206, ">"
    set $P185, $P207
  if_186_end:
.annotate 'line', 37
    $P210 = $P184."!make"($P185)
.annotate 'line', 35
    .return ($P210)
  control_181:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P211, exception, "payload"
    .return ($P211)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "comp_unit"  :subid("22_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_216
.annotate 'line', 49
    new $P215, 'ExceptionHandler'
    set_addr $P215, control_214
    $P215."handle_types"(.CONTROL_RETURN)
    push_eh $P215
    .lex "self", self
    .lex "$/", param_216
.annotate 'line', 50
    new $P217, "Undef"
    .lex "$mainline", $P217
.annotate 'line', 51
    new $P218, "Undef"
    .lex "$unit", $P218
.annotate 'line', 50
    find_lex $P219, "$/"
    unless_null $P219, vivify_175
    $P219 = root_new ['parrot';'Hash']
  vivify_175:
    set $P220, $P219["statementlist"]
    unless_null $P220, vivify_176
    new $P220, "Undef"
  vivify_176:
    $P221 = $P220."ast"()
    store_lex "$mainline", $P221
.annotate 'line', 51
    get_global $P222, "@BLOCK"
    $P223 = $P222."shift"()
    store_lex "$unit", $P223
.annotate 'line', 55
    find_lex $P224, "$unit"
    find_lex $P225, "self"
    $P226 = $P225."CTXSAVE"()
    $P224."push"($P226)
.annotate 'line', 60
    find_lex $P227, "$unit"
.annotate 'line', 61
    get_hll_global $P228, ["PAST"], "Op"
    find_lex $P229, "$mainline"
    $P230 = $P228."new"($P229, "return" :named("pirop"))
    $P227."push"($P230)
.annotate 'line', 66
    find_lex $P231, "$unit"
.annotate 'line', 67
    get_hll_global $P232, ["PAST"], "Block"
.annotate 'line', 69
    get_hll_global $P233, ["PAST"], "Op"
    get_hll_global $P234, ["PAST"], "Val"
    find_lex $P235, "$unit"
    $P236 = $P234."new"($P235 :named("value"))
    $P237 = $P233."new"($P236, "call" :named("pasttype"))
    $P238 = $P232."new"($P237, ":load" :named("pirflags"), 0 :named("lexical"), "" :named("namespace"))
.annotate 'line', 67
    $P231."push"($P238)
.annotate 'line', 72
    find_lex $P239, "$unit"
    find_lex $P240, "$/"
    $P239."node"($P240)
.annotate 'line', 73
    find_lex $P241, "$/"
    find_lex $P242, "$unit"
    $P243 = $P241."!make"($P242)
.annotate 'line', 49
    .return ($P243)
  control_214:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P244, exception, "payload"
    .return ($P244)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statementlist"  :subid("23_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_248
.annotate 'line', 76
    .const 'Sub' $P262 = "24_1284728484.24945" 
    capture_lex $P262
    new $P247, 'ExceptionHandler'
    set_addr $P247, control_246
    $P247."handle_types"(.CONTROL_RETURN)
    push_eh $P247
    .lex "self", self
    .lex "$/", param_248
.annotate 'line', 77
    new $P249, "Undef"
    .lex "$past", $P249
    get_hll_global $P250, ["PAST"], "Stmts"
    find_lex $P251, "$/"
    $P252 = $P250."new"($P251 :named("node"))
    store_lex "$past", $P252
.annotate 'line', 78
    find_lex $P254, "$/"
    unless_null $P254, vivify_177
    $P254 = root_new ['parrot';'Hash']
  vivify_177:
    set $P255, $P254["statement"]
    unless_null $P255, vivify_178
    new $P255, "Undef"
  vivify_178:
    unless $P255, if_253_end
.annotate 'line', 79
    find_lex $P257, "$/"
    unless_null $P257, vivify_179
    $P257 = root_new ['parrot';'Hash']
  vivify_179:
    set $P258, $P257["statement"]
    unless_null $P258, vivify_180
    new $P258, "Undef"
  vivify_180:
    defined $I259, $P258
    unless $I259, for_undef_181
    iter $P256, $P258
    new $P282, 'ExceptionHandler'
    set_addr $P282, loop281_handler
    $P282."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P282
  loop281_test:
    unless $P256, loop281_done
    shift $P260, $P256
  loop281_redo:
    .const 'Sub' $P262 = "24_1284728484.24945" 
    capture_lex $P262
    $P262($P260)
  loop281_next:
    goto loop281_test
  loop281_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P283, exception, 'type'
    eq $P283, .CONTROL_LOOP_NEXT, loop281_next
    eq $P283, .CONTROL_LOOP_REDO, loop281_redo
  loop281_done:
    pop_eh 
  for_undef_181:
  if_253_end:
.annotate 'line', 86
    find_lex $P284, "$/"
    find_lex $P285, "$past"
    $P286 = $P284."!make"($P285)
.annotate 'line', 76
    .return ($P286)
  control_246:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P287, exception, "payload"
    .return ($P287)
.end


.namespace ["NQP";"Actions"]
.sub "_block261"  :anon :subid("24_1284728484.24945") :outer("23_1284728484.24945")
    .param pmc param_264
.annotate 'line', 80
    new $P263, "Undef"
    .lex "$ast", $P263
    .lex "$_", param_264
    find_lex $P265, "$_"
    $P266 = $P265."ast"()
    store_lex "$ast", $P266
.annotate 'line', 81
    find_lex $P268, "$ast"
    unless_null $P268, vivify_182
    $P268 = root_new ['parrot';'Hash']
  vivify_182:
    set $P269, $P268["sink"]
    unless_null $P269, vivify_183
    new $P269, "Undef"
  vivify_183:
    defined $I270, $P269
    unless $I270, if_267_end
    find_lex $P271, "$ast"
    unless_null $P271, vivify_184
    $P271 = root_new ['parrot';'Hash']
  vivify_184:
    set $P272, $P271["sink"]
    unless_null $P272, vivify_185
    new $P272, "Undef"
  vivify_185:
    store_lex "$ast", $P272
  if_267_end:
.annotate 'line', 82
    find_lex $P274, "$ast"
    unless_null $P274, vivify_186
    $P274 = root_new ['parrot';'Hash']
  vivify_186:
    set $P275, $P274["bareblock"]
    unless_null $P275, vivify_187
    new $P275, "Undef"
  vivify_187:
    unless $P275, if_273_end
    find_lex $P276, "$ast"
    $P277 = "block_immediate"($P276)
    store_lex "$ast", $P277
  if_273_end:
.annotate 'line', 83
    find_lex $P278, "$past"
    find_lex $P279, "$ast"
    $P280 = $P278."push"($P279)
.annotate 'line', 79
    .return ($P280)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement"  :subid("25_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_291
    .param pmc param_292 :optional
    .param int has_param_292 :opt_flag
.annotate 'line', 89
    .const 'Sub' $P300 = "26_1284728484.24945" 
    capture_lex $P300
    new $P290, 'ExceptionHandler'
    set_addr $P290, control_289
    $P290."handle_types"(.CONTROL_RETURN)
    push_eh $P290
    .lex "self", self
    .lex "$/", param_291
    if has_param_292, optparam_188
    new $P293, "Undef"
    set param_292, $P293
  optparam_188:
    .lex "$key", param_292
.annotate 'line', 90
    new $P294, "Undef"
    .lex "$past", $P294
.annotate 'line', 89
    find_lex $P295, "$past"
.annotate 'line', 91
    find_lex $P297, "$/"
    unless_null $P297, vivify_189
    $P297 = root_new ['parrot';'Hash']
  vivify_189:
    set $P298, $P297["EXPR"]
    unless_null $P298, vivify_190
    new $P298, "Undef"
  vivify_190:
    if $P298, if_296
.annotate 'line', 112
    find_lex $P361, "$/"
    unless_null $P361, vivify_191
    $P361 = root_new ['parrot';'Hash']
  vivify_191:
    set $P362, $P361["statement_control"]
    unless_null $P362, vivify_192
    new $P362, "Undef"
  vivify_192:
    if $P362, if_360
.annotate 'line', 113
    new $P366, "Integer"
    assign $P366, 0
    store_lex "$past", $P366
    goto if_360_end
  if_360:
.annotate 'line', 112
    find_lex $P363, "$/"
    unless_null $P363, vivify_193
    $P363 = root_new ['parrot';'Hash']
  vivify_193:
    set $P364, $P363["statement_control"]
    unless_null $P364, vivify_194
    new $P364, "Undef"
  vivify_194:
    $P365 = $P364."ast"()
    store_lex "$past", $P365
  if_360_end:
    goto if_296_end
  if_296:
.annotate 'line', 91
    .const 'Sub' $P300 = "26_1284728484.24945" 
    capture_lex $P300
    $P300()
  if_296_end:
.annotate 'line', 114
    find_lex $P367, "$/"
    find_lex $P368, "$past"
    $P369 = $P367."!make"($P368)
.annotate 'line', 89
    .return ($P369)
  control_289:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P370, exception, "payload"
    .return ($P370)
.end


.namespace ["NQP";"Actions"]
.sub "_block299"  :anon :subid("26_1284728484.24945") :outer("25_1284728484.24945")
.annotate 'line', 92
    new $P301, "Undef"
    .lex "$mc", $P301
.annotate 'line', 93
    new $P302, "Undef"
    .lex "$ml", $P302
.annotate 'line', 92
    find_lex $P303, "$/"
    unless_null $P303, vivify_195
    $P303 = root_new ['parrot';'Hash']
  vivify_195:
    set $P304, $P303["statement_mod_cond"]
    unless_null $P304, vivify_196
    $P304 = root_new ['parrot';'ResizablePMCArray']
  vivify_196:
    set $P305, $P304[0]
    unless_null $P305, vivify_197
    new $P305, "Undef"
  vivify_197:
    store_lex "$mc", $P305
.annotate 'line', 93
    find_lex $P306, "$/"
    unless_null $P306, vivify_198
    $P306 = root_new ['parrot';'Hash']
  vivify_198:
    set $P307, $P306["statement_mod_loop"]
    unless_null $P307, vivify_199
    $P307 = root_new ['parrot';'ResizablePMCArray']
  vivify_199:
    set $P308, $P307[0]
    unless_null $P308, vivify_200
    new $P308, "Undef"
  vivify_200:
    store_lex "$ml", $P308
.annotate 'line', 94
    find_lex $P309, "$/"
    unless_null $P309, vivify_201
    $P309 = root_new ['parrot';'Hash']
  vivify_201:
    set $P310, $P309["EXPR"]
    unless_null $P310, vivify_202
    new $P310, "Undef"
  vivify_202:
    $P311 = $P310."ast"()
    store_lex "$past", $P311
.annotate 'line', 95
    find_lex $P313, "$mc"
    unless $P313, if_312_end
.annotate 'line', 96
    get_hll_global $P314, ["PAST"], "Op"
    find_lex $P315, "$mc"
    unless_null $P315, vivify_203
    $P315 = root_new ['parrot';'Hash']
  vivify_203:
    set $P316, $P315["cond"]
    unless_null $P316, vivify_204
    new $P316, "Undef"
  vivify_204:
    $P317 = $P316."ast"()
    find_lex $P318, "$past"
    find_lex $P319, "$mc"
    unless_null $P319, vivify_205
    $P319 = root_new ['parrot';'Hash']
  vivify_205:
    set $P320, $P319["sym"]
    unless_null $P320, vivify_206
    new $P320, "Undef"
  vivify_206:
    set $S321, $P320
    find_lex $P322, "$/"
    $P323 = $P314."new"($P317, $P318, $S321 :named("pasttype"), $P322 :named("node"))
    store_lex "$past", $P323
  if_312_end:
.annotate 'line', 98
    find_lex $P326, "$ml"
    if $P326, if_325
    set $P324, $P326
    goto if_325_end
  if_325:
.annotate 'line', 99
    find_lex $P329, "$ml"
    unless_null $P329, vivify_207
    $P329 = root_new ['parrot';'Hash']
  vivify_207:
    set $P330, $P329["sym"]
    unless_null $P330, vivify_208
    new $P330, "Undef"
  vivify_208:
    set $S331, $P330
    iseq $I332, $S331, "for"
    if $I332, if_328
.annotate 'line', 108
    get_hll_global $P350, ["PAST"], "Op"
    find_lex $P351, "$ml"
    unless_null $P351, vivify_209
    $P351 = root_new ['parrot';'Hash']
  vivify_209:
    set $P352, $P351["cond"]
    unless_null $P352, vivify_210
    new $P352, "Undef"
  vivify_210:
    $P353 = $P352."ast"()
    find_lex $P354, "$past"
    find_lex $P355, "$ml"
    unless_null $P355, vivify_211
    $P355 = root_new ['parrot';'Hash']
  vivify_211:
    set $P356, $P355["sym"]
    unless_null $P356, vivify_212
    new $P356, "Undef"
  vivify_212:
    set $S357, $P356
    find_lex $P358, "$/"
    $P359 = $P350."new"($P353, $P354, $S357 :named("pasttype"), $P358 :named("node"))
    store_lex "$past", $P359
.annotate 'line', 107
    set $P327, $P359
.annotate 'line', 99
    goto if_328_end
  if_328:
.annotate 'line', 100
    get_hll_global $P333, ["PAST"], "Block"
.annotate 'line', 101
    get_hll_global $P334, ["PAST"], "Var"
    $P335 = $P334."new"("$_" :named("name"), "parameter" :named("scope"), 1 :named("isdecl"))
    find_lex $P336, "$past"
    $P337 = $P333."new"($P335, $P336, "immediate" :named("blocktype"))
.annotate 'line', 100
    store_lex "$past", $P337
.annotate 'line', 103
    find_lex $P338, "$past"
    $P338."symbol"("$_", "lexical" :named("scope"))
.annotate 'line', 104
    find_lex $P339, "$past"
    $P339."arity"(1)
.annotate 'line', 105
    get_hll_global $P340, ["PAST"], "Op"
    find_lex $P341, "$ml"
    unless_null $P341, vivify_213
    $P341 = root_new ['parrot';'Hash']
  vivify_213:
    set $P342, $P341["cond"]
    unless_null $P342, vivify_214
    new $P342, "Undef"
  vivify_214:
    $P343 = $P342."ast"()
    find_lex $P344, "$past"
    find_lex $P345, "$ml"
    unless_null $P345, vivify_215
    $P345 = root_new ['parrot';'Hash']
  vivify_215:
    set $P346, $P345["sym"]
    unless_null $P346, vivify_216
    new $P346, "Undef"
  vivify_216:
    set $S347, $P346
    find_lex $P348, "$/"
    $P349 = $P340."new"($P343, $P344, $S347 :named("pasttype"), $P348 :named("node"))
    store_lex "$past", $P349
.annotate 'line', 99
    set $P327, $P349
  if_328_end:
.annotate 'line', 98
    set $P324, $P327
  if_325_end:
.annotate 'line', 91
    .return ($P324)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "xblock"  :subid("27_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_374
.annotate 'line', 117
    new $P373, 'ExceptionHandler'
    set_addr $P373, control_372
    $P373."handle_types"(.CONTROL_RETURN)
    push_eh $P373
    .lex "self", self
    .lex "$/", param_374
.annotate 'line', 118
    find_lex $P375, "$/"
    get_hll_global $P376, ["PAST"], "Op"
    find_lex $P377, "$/"
    unless_null $P377, vivify_217
    $P377 = root_new ['parrot';'Hash']
  vivify_217:
    set $P378, $P377["EXPR"]
    unless_null $P378, vivify_218
    new $P378, "Undef"
  vivify_218:
    $P379 = $P378."ast"()
    find_lex $P380, "$/"
    unless_null $P380, vivify_219
    $P380 = root_new ['parrot';'Hash']
  vivify_219:
    set $P381, $P380["pblock"]
    unless_null $P381, vivify_220
    new $P381, "Undef"
  vivify_220:
    $P382 = $P381."ast"()
    find_lex $P383, "$/"
    $P384 = $P376."new"($P379, $P382, "if" :named("pasttype"), $P383 :named("node"))
    $P385 = $P375."!make"($P384)
.annotate 'line', 117
    .return ($P385)
  control_372:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P386, exception, "payload"
    .return ($P386)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "pblock"  :subid("28_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_390
.annotate 'line', 121
    new $P389, 'ExceptionHandler'
    set_addr $P389, control_388
    $P389."handle_types"(.CONTROL_RETURN)
    push_eh $P389
    .lex "self", self
    .lex "$/", param_390
.annotate 'line', 122
    find_lex $P391, "$/"
    find_lex $P392, "$/"
    unless_null $P392, vivify_221
    $P392 = root_new ['parrot';'Hash']
  vivify_221:
    set $P393, $P392["blockoid"]
    unless_null $P393, vivify_222
    new $P393, "Undef"
  vivify_222:
    $P394 = $P393."ast"()
    $P395 = $P391."!make"($P394)
.annotate 'line', 121
    .return ($P395)
  control_388:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P396, exception, "payload"
    .return ($P396)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "block"  :subid("29_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_400
.annotate 'line', 125
    new $P399, 'ExceptionHandler'
    set_addr $P399, control_398
    $P399."handle_types"(.CONTROL_RETURN)
    push_eh $P399
    .lex "self", self
    .lex "$/", param_400
.annotate 'line', 126
    find_lex $P401, "$/"
    find_lex $P402, "$/"
    unless_null $P402, vivify_223
    $P402 = root_new ['parrot';'Hash']
  vivify_223:
    set $P403, $P402["blockoid"]
    unless_null $P403, vivify_224
    new $P403, "Undef"
  vivify_224:
    $P404 = $P403."ast"()
    $P405 = $P401."!make"($P404)
.annotate 'line', 125
    .return ($P405)
  control_398:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P406, exception, "payload"
    .return ($P406)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "blockoid"  :subid("30_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_410
.annotate 'line', 129
    new $P409, 'ExceptionHandler'
    set_addr $P409, control_408
    $P409."handle_types"(.CONTROL_RETURN)
    push_eh $P409
    .lex "self", self
    .lex "$/", param_410
.annotate 'line', 130
    new $P411, "Undef"
    .lex "$past", $P411
.annotate 'line', 131
    new $P412, "Undef"
    .lex "$BLOCK", $P412
.annotate 'line', 130
    find_lex $P413, "$/"
    unless_null $P413, vivify_225
    $P413 = root_new ['parrot';'Hash']
  vivify_225:
    set $P414, $P413["statementlist"]
    unless_null $P414, vivify_226
    new $P414, "Undef"
  vivify_226:
    $P415 = $P414."ast"()
    store_lex "$past", $P415
.annotate 'line', 131
    get_global $P416, "@BLOCK"
    $P417 = $P416."shift"()
    store_lex "$BLOCK", $P417
.annotate 'line', 132
    find_lex $P418, "$BLOCK"
    find_lex $P419, "$past"
    $P418."push"($P419)
.annotate 'line', 133
    find_lex $P420, "$BLOCK"
    find_lex $P421, "$/"
    $P420."node"($P421)
.annotate 'line', 134
    find_lex $P422, "$BLOCK"
    $P422."closure"(1)
.annotate 'line', 135
    find_lex $P423, "$/"
    find_lex $P424, "$BLOCK"
    $P425 = $P423."!make"($P424)
.annotate 'line', 129
    .return ($P425)
  control_408:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P426, exception, "payload"
    .return ($P426)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "newpad"  :subid("31_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_430
.annotate 'line', 138
    new $P429, 'ExceptionHandler'
    set_addr $P429, control_428
    $P429."handle_types"(.CONTROL_RETURN)
    push_eh $P429
    .lex "self", self
    .lex "$/", param_430
.annotate 'line', 139
    get_global $P431, "@BLOCK"
    unless_null $P431, vivify_227
    $P431 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P431
  vivify_227:
.annotate 'line', 138
    get_global $P432, "@BLOCK"
.annotate 'line', 140
    get_global $P433, "@BLOCK"
    get_hll_global $P434, ["PAST"], "Block"
    get_hll_global $P435, ["PAST"], "Stmts"
    $P436 = $P435."new"()
    $P437 = $P434."new"($P436)
    $P438 = $P433."unshift"($P437)
.annotate 'line', 138
    .return ($P438)
  control_428:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P439, exception, "payload"
    .return ($P439)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "outerctx"  :subid("32_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_443
.annotate 'line', 143
    new $P442, 'ExceptionHandler'
    set_addr $P442, control_441
    $P442."handle_types"(.CONTROL_RETURN)
    push_eh $P442
    .lex "self", self
    .lex "$/", param_443
.annotate 'line', 144
    get_global $P444, "@BLOCK"
    unless_null $P444, vivify_228
    $P444 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P444
  vivify_228:
.annotate 'line', 143
    get_global $P445, "@BLOCK"
.annotate 'line', 145
    find_lex $P446, "self"
    get_global $P447, "@BLOCK"
    unless_null $P447, vivify_229
    $P447 = root_new ['parrot';'ResizablePMCArray']
  vivify_229:
    set $P448, $P447[0]
    unless_null $P448, vivify_230
    new $P448, "Undef"
  vivify_230:
    $P449 = $P446."SET_BLOCK_OUTER_CTX"($P448)
.annotate 'line', 143
    .return ($P449)
  control_441:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P450, exception, "payload"
    .return ($P450)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<if>"  :subid("33_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_454
.annotate 'line', 150
    .const 'Sub' $P482 = "34_1284728484.24945" 
    capture_lex $P482
    new $P453, 'ExceptionHandler'
    set_addr $P453, control_452
    $P453."handle_types"(.CONTROL_RETURN)
    push_eh $P453
    .lex "self", self
    .lex "$/", param_454
.annotate 'line', 151
    new $P455, "Undef"
    .lex "$count", $P455
.annotate 'line', 152
    new $P456, "Undef"
    .lex "$past", $P456
.annotate 'line', 151
    find_lex $P457, "$/"
    unless_null $P457, vivify_231
    $P457 = root_new ['parrot';'Hash']
  vivify_231:
    set $P458, $P457["xblock"]
    unless_null $P458, vivify_232
    new $P458, "Undef"
  vivify_232:
    set $N459, $P458
    new $P460, 'Float'
    set $P460, $N459
    sub $P461, $P460, 1
    store_lex "$count", $P461
.annotate 'line', 152
    find_lex $P462, "$count"
    set $I463, $P462
    find_lex $P464, "$/"
    unless_null $P464, vivify_233
    $P464 = root_new ['parrot';'Hash']
  vivify_233:
    set $P465, $P464["xblock"]
    unless_null $P465, vivify_234
    $P465 = root_new ['parrot';'ResizablePMCArray']
  vivify_234:
    set $P466, $P465[$I463]
    unless_null $P466, vivify_235
    new $P466, "Undef"
  vivify_235:
    $P467 = $P466."ast"()
    $P468 = "xblock_immediate"($P467)
    store_lex "$past", $P468
.annotate 'line', 153
    find_lex $P470, "$/"
    unless_null $P470, vivify_236
    $P470 = root_new ['parrot';'Hash']
  vivify_236:
    set $P471, $P470["else"]
    unless_null $P471, vivify_237
    new $P471, "Undef"
  vivify_237:
    unless $P471, if_469_end
.annotate 'line', 154
    find_lex $P472, "$past"
    find_lex $P473, "$/"
    unless_null $P473, vivify_238
    $P473 = root_new ['parrot';'Hash']
  vivify_238:
    set $P474, $P473["else"]
    unless_null $P474, vivify_239
    $P474 = root_new ['parrot';'ResizablePMCArray']
  vivify_239:
    set $P475, $P474[0]
    unless_null $P475, vivify_240
    new $P475, "Undef"
  vivify_240:
    $P476 = $P475."ast"()
    $P477 = "block_immediate"($P476)
    $P472."push"($P477)
  if_469_end:
.annotate 'line', 157
    new $P498, 'ExceptionHandler'
    set_addr $P498, loop497_handler
    $P498."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P498
  loop497_test:
    find_lex $P478, "$count"
    set $N479, $P478
    isgt $I480, $N479, 0.0
    unless $I480, loop497_done
  loop497_redo:
    .const 'Sub' $P482 = "34_1284728484.24945" 
    capture_lex $P482
    $P482()
  loop497_next:
    goto loop497_test
  loop497_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P499, exception, 'type'
    eq $P499, .CONTROL_LOOP_NEXT, loop497_next
    eq $P499, .CONTROL_LOOP_REDO, loop497_redo
  loop497_done:
    pop_eh 
.annotate 'line', 163
    find_lex $P500, "$/"
    find_lex $P501, "$past"
    $P502 = $P500."!make"($P501)
.annotate 'line', 150
    .return ($P502)
  control_452:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P503, exception, "payload"
    .return ($P503)
.end


.namespace ["NQP";"Actions"]
.sub "_block481"  :anon :subid("34_1284728484.24945") :outer("33_1284728484.24945")
.annotate 'line', 159
    new $P483, "Undef"
    .lex "$else", $P483
.annotate 'line', 157
    find_lex $P484, "$count"
    clone $P485, $P484
    dec $P484
.annotate 'line', 159
    find_lex $P486, "$past"
    store_lex "$else", $P486
.annotate 'line', 160
    find_lex $P487, "$count"
    set $I488, $P487
    find_lex $P489, "$/"
    unless_null $P489, vivify_241
    $P489 = root_new ['parrot';'Hash']
  vivify_241:
    set $P490, $P489["xblock"]
    unless_null $P490, vivify_242
    $P490 = root_new ['parrot';'ResizablePMCArray']
  vivify_242:
    set $P491, $P490[$I488]
    unless_null $P491, vivify_243
    new $P491, "Undef"
  vivify_243:
    $P492 = $P491."ast"()
    $P493 = "xblock_immediate"($P492)
    store_lex "$past", $P493
.annotate 'line', 161
    find_lex $P494, "$past"
    find_lex $P495, "$else"
    $P496 = $P494."push"($P495)
.annotate 'line', 157
    .return ($P496)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<unless>"  :subid("35_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_507
.annotate 'line', 166
    new $P506, 'ExceptionHandler'
    set_addr $P506, control_505
    $P506."handle_types"(.CONTROL_RETURN)
    push_eh $P506
    .lex "self", self
    .lex "$/", param_507
.annotate 'line', 167
    new $P508, "Undef"
    .lex "$past", $P508
    find_lex $P509, "$/"
    unless_null $P509, vivify_244
    $P509 = root_new ['parrot';'Hash']
  vivify_244:
    set $P510, $P509["xblock"]
    unless_null $P510, vivify_245
    new $P510, "Undef"
  vivify_245:
    $P511 = $P510."ast"()
    $P512 = "xblock_immediate"($P511)
    store_lex "$past", $P512
.annotate 'line', 168
    find_lex $P513, "$past"
    $P513."pasttype"("unless")
.annotate 'line', 169
    find_lex $P514, "$/"
    find_lex $P515, "$past"
    $P516 = $P514."!make"($P515)
.annotate 'line', 166
    .return ($P516)
  control_505:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P517, exception, "payload"
    .return ($P517)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<while>"  :subid("36_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_521
.annotate 'line', 172
    new $P520, 'ExceptionHandler'
    set_addr $P520, control_519
    $P520."handle_types"(.CONTROL_RETURN)
    push_eh $P520
    .lex "self", self
    .lex "$/", param_521
.annotate 'line', 173
    new $P522, "Undef"
    .lex "$past", $P522
    find_lex $P523, "$/"
    unless_null $P523, vivify_246
    $P523 = root_new ['parrot';'Hash']
  vivify_246:
    set $P524, $P523["xblock"]
    unless_null $P524, vivify_247
    new $P524, "Undef"
  vivify_247:
    $P525 = $P524."ast"()
    $P526 = "xblock_immediate"($P525)
    store_lex "$past", $P526
.annotate 'line', 174
    find_lex $P527, "$past"
    find_lex $P528, "$/"
    unless_null $P528, vivify_248
    $P528 = root_new ['parrot';'Hash']
  vivify_248:
    set $P529, $P528["sym"]
    unless_null $P529, vivify_249
    new $P529, "Undef"
  vivify_249:
    set $S530, $P529
    $P527."pasttype"($S530)
.annotate 'line', 175
    find_lex $P531, "$/"
    find_lex $P532, "$past"
    $P533 = $P531."!make"($P532)
.annotate 'line', 172
    .return ($P533)
  control_519:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P534, exception, "payload"
    .return ($P534)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<repeat>"  :subid("37_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_538
.annotate 'line', 178
    new $P537, 'ExceptionHandler'
    set_addr $P537, control_536
    $P537."handle_types"(.CONTROL_RETURN)
    push_eh $P537
    .lex "self", self
    .lex "$/", param_538
.annotate 'line', 179
    new $P539, "Undef"
    .lex "$pasttype", $P539
.annotate 'line', 180
    new $P540, "Undef"
    .lex "$past", $P540
.annotate 'line', 179
    new $P541, "String"
    assign $P541, "repeat_"
    find_lex $P542, "$/"
    unless_null $P542, vivify_250
    $P542 = root_new ['parrot';'Hash']
  vivify_250:
    set $P543, $P542["wu"]
    unless_null $P543, vivify_251
    new $P543, "Undef"
  vivify_251:
    set $S544, $P543
    concat $P545, $P541, $S544
    store_lex "$pasttype", $P545
    find_lex $P546, "$past"
.annotate 'line', 181
    find_lex $P548, "$/"
    unless_null $P548, vivify_252
    $P548 = root_new ['parrot';'Hash']
  vivify_252:
    set $P549, $P548["xblock"]
    unless_null $P549, vivify_253
    new $P549, "Undef"
  vivify_253:
    if $P549, if_547
.annotate 'line', 186
    get_hll_global $P556, ["PAST"], "Op"
    find_lex $P557, "$/"
    unless_null $P557, vivify_254
    $P557 = root_new ['parrot';'Hash']
  vivify_254:
    set $P558, $P557["EXPR"]
    unless_null $P558, vivify_255
    new $P558, "Undef"
  vivify_255:
    $P559 = $P558."ast"()
    find_lex $P560, "$/"
    unless_null $P560, vivify_256
    $P560 = root_new ['parrot';'Hash']
  vivify_256:
    set $P561, $P560["pblock"]
    unless_null $P561, vivify_257
    new $P561, "Undef"
  vivify_257:
    $P562 = $P561."ast"()
    $P563 = "block_immediate"($P562)
    find_lex $P564, "$pasttype"
    find_lex $P565, "$/"
    $P566 = $P556."new"($P559, $P563, $P564 :named("pasttype"), $P565 :named("node"))
    store_lex "$past", $P566
.annotate 'line', 185
    goto if_547_end
  if_547:
.annotate 'line', 182
    find_lex $P550, "$/"
    unless_null $P550, vivify_258
    $P550 = root_new ['parrot';'Hash']
  vivify_258:
    set $P551, $P550["xblock"]
    unless_null $P551, vivify_259
    new $P551, "Undef"
  vivify_259:
    $P552 = $P551."ast"()
    $P553 = "xblock_immediate"($P552)
    store_lex "$past", $P553
.annotate 'line', 183
    find_lex $P554, "$past"
    find_lex $P555, "$pasttype"
    $P554."pasttype"($P555)
  if_547_end:
.annotate 'line', 189
    find_lex $P567, "$/"
    find_lex $P568, "$past"
    $P569 = $P567."!make"($P568)
.annotate 'line', 178
    .return ($P569)
  control_536:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P570, exception, "payload"
    .return ($P570)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<for>"  :subid("38_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_574
.annotate 'line', 192
    new $P573, 'ExceptionHandler'
    set_addr $P573, control_572
    $P573."handle_types"(.CONTROL_RETURN)
    push_eh $P573
    .lex "self", self
    .lex "$/", param_574
.annotate 'line', 193
    new $P575, "Undef"
    .lex "$past", $P575
.annotate 'line', 195
    new $P576, "Undef"
    .lex "$block", $P576
.annotate 'line', 193
    find_lex $P577, "$/"
    unless_null $P577, vivify_260
    $P577 = root_new ['parrot';'Hash']
  vivify_260:
    set $P578, $P577["xblock"]
    unless_null $P578, vivify_261
    new $P578, "Undef"
  vivify_261:
    $P579 = $P578."ast"()
    store_lex "$past", $P579
.annotate 'line', 194
    find_lex $P580, "$past"
    $P580."pasttype"("for")
.annotate 'line', 195
    find_lex $P581, "$past"
    unless_null $P581, vivify_262
    $P581 = root_new ['parrot';'ResizablePMCArray']
  vivify_262:
    set $P582, $P581[1]
    unless_null $P582, vivify_263
    new $P582, "Undef"
  vivify_263:
    store_lex "$block", $P582
.annotate 'line', 196
    find_lex $P584, "$block"
    $P585 = $P584."arity"()
    if $P585, unless_583_end
.annotate 'line', 197
    find_lex $P586, "$block"
    unless_null $P586, vivify_264
    $P586 = root_new ['parrot';'ResizablePMCArray']
  vivify_264:
    set $P587, $P586[0]
    unless_null $P587, vivify_265
    new $P587, "Undef"
  vivify_265:
    get_hll_global $P588, ["PAST"], "Var"
    $P589 = $P588."new"("$_" :named("name"), "parameter" :named("scope"))
    $P587."push"($P589)
.annotate 'line', 198
    find_lex $P590, "$block"
    $P590."symbol"("$_", "lexical" :named("scope"))
.annotate 'line', 199
    find_lex $P591, "$block"
    $P591."arity"(1)
  unless_583_end:
.annotate 'line', 201
    find_lex $P592, "$block"
    $P592."blocktype"("immediate")
.annotate 'line', 202
    find_lex $P593, "$/"
    find_lex $P594, "$past"
    $P595 = $P593."!make"($P594)
.annotate 'line', 192
    .return ($P595)
  control_572:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P596, exception, "payload"
    .return ($P596)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<return>"  :subid("39_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_600
.annotate 'line', 205
    new $P599, 'ExceptionHandler'
    set_addr $P599, control_598
    $P599."handle_types"(.CONTROL_RETURN)
    push_eh $P599
    .lex "self", self
    .lex "$/", param_600
.annotate 'line', 206
    find_lex $P601, "$/"
    get_hll_global $P602, ["PAST"], "Op"
    find_lex $P603, "$/"
    unless_null $P603, vivify_266
    $P603 = root_new ['parrot';'Hash']
  vivify_266:
    set $P604, $P603["EXPR"]
    unless_null $P604, vivify_267
    new $P604, "Undef"
  vivify_267:
    $P605 = $P604."ast"()
    find_lex $P606, "$/"
    $P607 = $P602."new"($P605, "return" :named("pasttype"), $P606 :named("node"))
    $P608 = $P601."!make"($P607)
.annotate 'line', 205
    .return ($P608)
  control_598:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P609, exception, "payload"
    .return ($P609)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<CATCH>"  :subid("40_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_613
.annotate 'line', 209
    new $P612, 'ExceptionHandler'
    set_addr $P612, control_611
    $P612."handle_types"(.CONTROL_RETURN)
    push_eh $P612
    .lex "self", self
    .lex "$/", param_613
.annotate 'line', 210
    new $P614, "Undef"
    .lex "$block", $P614
    find_lex $P615, "$/"
    unless_null $P615, vivify_268
    $P615 = root_new ['parrot';'Hash']
  vivify_268:
    set $P616, $P615["block"]
    unless_null $P616, vivify_269
    new $P616, "Undef"
  vivify_269:
    $P617 = $P616."ast"()
    store_lex "$block", $P617
.annotate 'line', 211
    find_lex $P618, "$/"
    find_lex $P619, "$block"
    "push_block_handler"($P618, $P619)
.annotate 'line', 212
    get_global $P620, "@BLOCK"
    unless_null $P620, vivify_270
    $P620 = root_new ['parrot';'ResizablePMCArray']
  vivify_270:
    set $P621, $P620[0]
    unless_null $P621, vivify_271
    new $P621, "Undef"
  vivify_271:
    $P622 = $P621."handlers"()
    set $P623, $P622[0]
    unless_null $P623, vivify_272
    new $P623, "Undef"
  vivify_272:
    $P623."handle_types_except"("CONTROL")
.annotate 'line', 213
    find_lex $P624, "$/"
    get_hll_global $P625, ["PAST"], "Stmts"
    find_lex $P626, "$/"
    $P627 = $P625."new"($P626 :named("node"))
    $P628 = $P624."!make"($P627)
.annotate 'line', 209
    .return ($P628)
  control_611:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P629, exception, "payload"
    .return ($P629)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<CONTROL>"  :subid("41_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_633
.annotate 'line', 216
    new $P632, 'ExceptionHandler'
    set_addr $P632, control_631
    $P632."handle_types"(.CONTROL_RETURN)
    push_eh $P632
    .lex "self", self
    .lex "$/", param_633
.annotate 'line', 217
    new $P634, "Undef"
    .lex "$block", $P634
    find_lex $P635, "$/"
    unless_null $P635, vivify_273
    $P635 = root_new ['parrot';'Hash']
  vivify_273:
    set $P636, $P635["block"]
    unless_null $P636, vivify_274
    new $P636, "Undef"
  vivify_274:
    $P637 = $P636."ast"()
    store_lex "$block", $P637
.annotate 'line', 218
    find_lex $P638, "$/"
    find_lex $P639, "$block"
    "push_block_handler"($P638, $P639)
.annotate 'line', 219
    get_global $P640, "@BLOCK"
    unless_null $P640, vivify_275
    $P640 = root_new ['parrot';'ResizablePMCArray']
  vivify_275:
    set $P641, $P640[0]
    unless_null $P641, vivify_276
    new $P641, "Undef"
  vivify_276:
    $P642 = $P641."handlers"()
    set $P643, $P642[0]
    unless_null $P643, vivify_277
    new $P643, "Undef"
  vivify_277:
    $P643."handle_types"("CONTROL")
.annotate 'line', 220
    find_lex $P644, "$/"
    get_hll_global $P645, ["PAST"], "Stmts"
    find_lex $P646, "$/"
    $P647 = $P645."new"($P646 :named("node"))
    $P648 = $P644."!make"($P647)
.annotate 'line', 216
    .return ($P648)
  control_631:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P649, exception, "payload"
    .return ($P649)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_prefix:sym<INIT>"  :subid("42_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_654
.annotate 'line', 260
    new $P653, 'ExceptionHandler'
    set_addr $P653, control_652
    $P653."handle_types"(.CONTROL_RETURN)
    push_eh $P653
    .lex "self", self
    .lex "$/", param_654
.annotate 'line', 261
    get_global $P655, "@BLOCK"
    unless_null $P655, vivify_278
    $P655 = root_new ['parrot';'ResizablePMCArray']
  vivify_278:
    set $P656, $P655[0]
    unless_null $P656, vivify_279
    new $P656, "Undef"
  vivify_279:
    $P657 = $P656."loadinit"()
    find_lex $P658, "$/"
    unless_null $P658, vivify_280
    $P658 = root_new ['parrot';'Hash']
  vivify_280:
    set $P659, $P658["blorst"]
    unless_null $P659, vivify_281
    new $P659, "Undef"
  vivify_281:
    $P660 = $P659."ast"()
    $P657."push"($P660)
.annotate 'line', 262
    find_lex $P661, "$/"
    get_hll_global $P662, ["PAST"], "Stmts"
    find_lex $P663, "$/"
    $P664 = $P662."new"($P663 :named("node"))
    $P665 = $P661."!make"($P664)
.annotate 'line', 260
    .return ($P665)
  control_652:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P666, exception, "payload"
    .return ($P666)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_prefix:sym<try>"  :subid("43_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_670
.annotate 'line', 265
    new $P669, 'ExceptionHandler'
    set_addr $P669, control_668
    $P669."handle_types"(.CONTROL_RETURN)
    push_eh $P669
    .lex "self", self
    .lex "$/", param_670
.annotate 'line', 266
    new $P671, "Undef"
    .lex "$past", $P671
    find_lex $P672, "$/"
    unless_null $P672, vivify_282
    $P672 = root_new ['parrot';'Hash']
  vivify_282:
    set $P673, $P672["blorst"]
    unless_null $P673, vivify_283
    new $P673, "Undef"
  vivify_283:
    $P674 = $P673."ast"()
    store_lex "$past", $P674
.annotate 'line', 267
    find_lex $P676, "$past"
    $S677 = $P676."WHAT"()
    isne $I678, $S677, "PAST::Block()"
    unless $I678, if_675_end
.annotate 'line', 268
    get_hll_global $P679, ["PAST"], "Block"
    find_lex $P680, "$past"
    find_lex $P681, "$/"
    $P682 = $P679."new"($P680, "immediate" :named("blocktype"), $P681 :named("node"))
    store_lex "$past", $P682
  if_675_end:
.annotate 'line', 270
    find_lex $P684, "$past"
    $P685 = $P684."handlers"()
    if $P685, unless_683_end
.annotate 'line', 271
    find_lex $P686, "$past"
    get_hll_global $P687, ["PAST"], "Control"
.annotate 'line', 273
    get_hll_global $P688, ["PAST"], "Stmts"
.annotate 'line', 274
    get_hll_global $P689, ["PAST"], "Op"
.annotate 'line', 275
    get_hll_global $P690, ["PAST"], "Var"
.annotate 'line', 276
    get_hll_global $P691, ["PAST"], "Var"
    $P692 = $P691."new"("register" :named("scope"), "exception" :named("name"))
    $P693 = $P690."new"($P692, "handled", "keyed" :named("scope"))
.annotate 'line', 275
    $P694 = $P689."new"($P693, 1, "bind" :named("pasttype"))
.annotate 'line', 274
    $P695 = $P688."new"($P694)
.annotate 'line', 273
    $P696 = $P687."new"($P695, "CONTROL" :named("handle_types_except"))
.annotate 'line', 271
    new $P697, "ResizablePMCArray"
    push $P697, $P696
    $P686."handlers"($P697)
  unless_683_end:
.annotate 'line', 285
    find_lex $P698, "$/"
    find_lex $P699, "$past"
    $P700 = $P698."!make"($P699)
.annotate 'line', 265
    .return ($P700)
  control_668:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P701, exception, "payload"
    .return ($P701)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "blorst"  :subid("44_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_705
.annotate 'line', 288
    new $P704, 'ExceptionHandler'
    set_addr $P704, control_703
    $P704."handle_types"(.CONTROL_RETURN)
    push_eh $P704
    .lex "self", self
    .lex "$/", param_705
.annotate 'line', 289
    find_lex $P706, "$/"
.annotate 'line', 290
    find_lex $P709, "$/"
    unless_null $P709, vivify_284
    $P709 = root_new ['parrot';'Hash']
  vivify_284:
    set $P710, $P709["block"]
    unless_null $P710, vivify_285
    new $P710, "Undef"
  vivify_285:
    if $P710, if_708
.annotate 'line', 291
    find_lex $P715, "$/"
    unless_null $P715, vivify_286
    $P715 = root_new ['parrot';'Hash']
  vivify_286:
    set $P716, $P715["statement"]
    unless_null $P716, vivify_287
    new $P716, "Undef"
  vivify_287:
    $P717 = $P716."ast"()
    set $P707, $P717
.annotate 'line', 290
    goto if_708_end
  if_708:
    find_lex $P711, "$/"
    unless_null $P711, vivify_288
    $P711 = root_new ['parrot';'Hash']
  vivify_288:
    set $P712, $P711["block"]
    unless_null $P712, vivify_289
    new $P712, "Undef"
  vivify_289:
    $P713 = $P712."ast"()
    $P714 = "block_immediate"($P713)
    set $P707, $P714
  if_708_end:
    $P718 = $P706."!make"($P707)
.annotate 'line', 288
    .return ($P718)
  control_703:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P719, exception, "payload"
    .return ($P719)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_mod_cond:sym<if>"  :subid("45_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_723
.annotate 'line', 296
    new $P722, 'ExceptionHandler'
    set_addr $P722, control_721
    $P722."handle_types"(.CONTROL_RETURN)
    push_eh $P722
    .lex "self", self
    .lex "$/", param_723
    find_lex $P724, "$/"
    find_lex $P725, "$/"
    unless_null $P725, vivify_290
    $P725 = root_new ['parrot';'Hash']
  vivify_290:
    set $P726, $P725["cond"]
    unless_null $P726, vivify_291
    new $P726, "Undef"
  vivify_291:
    $P727 = $P726."ast"()
    $P728 = $P724."!make"($P727)
    .return ($P728)
  control_721:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P729, exception, "payload"
    .return ($P729)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_mod_cond:sym<unless>"  :subid("46_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_733
.annotate 'line', 297
    new $P732, 'ExceptionHandler'
    set_addr $P732, control_731
    $P732."handle_types"(.CONTROL_RETURN)
    push_eh $P732
    .lex "self", self
    .lex "$/", param_733
    find_lex $P734, "$/"
    find_lex $P735, "$/"
    unless_null $P735, vivify_292
    $P735 = root_new ['parrot';'Hash']
  vivify_292:
    set $P736, $P735["cond"]
    unless_null $P736, vivify_293
    new $P736, "Undef"
  vivify_293:
    $P737 = $P736."ast"()
    $P738 = $P734."!make"($P737)
    .return ($P738)
  control_731:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P739, exception, "payload"
    .return ($P739)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_mod_loop:sym<while>"  :subid("47_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_743
.annotate 'line', 299
    new $P742, 'ExceptionHandler'
    set_addr $P742, control_741
    $P742."handle_types"(.CONTROL_RETURN)
    push_eh $P742
    .lex "self", self
    .lex "$/", param_743
    find_lex $P744, "$/"
    find_lex $P745, "$/"
    unless_null $P745, vivify_294
    $P745 = root_new ['parrot';'Hash']
  vivify_294:
    set $P746, $P745["cond"]
    unless_null $P746, vivify_295
    new $P746, "Undef"
  vivify_295:
    $P747 = $P746."ast"()
    $P748 = $P744."!make"($P747)
    .return ($P748)
  control_741:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P749, exception, "payload"
    .return ($P749)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_mod_loop:sym<until>"  :subid("48_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_753
.annotate 'line', 300
    new $P752, 'ExceptionHandler'
    set_addr $P752, control_751
    $P752."handle_types"(.CONTROL_RETURN)
    push_eh $P752
    .lex "self", self
    .lex "$/", param_753
    find_lex $P754, "$/"
    find_lex $P755, "$/"
    unless_null $P755, vivify_296
    $P755 = root_new ['parrot';'Hash']
  vivify_296:
    set $P756, $P755["cond"]
    unless_null $P756, vivify_297
    new $P756, "Undef"
  vivify_297:
    $P757 = $P756."ast"()
    $P758 = $P754."!make"($P757)
    .return ($P758)
  control_751:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P759, exception, "payload"
    .return ($P759)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<fatarrow>"  :subid("49_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_763
.annotate 'line', 304
    new $P762, 'ExceptionHandler'
    set_addr $P762, control_761
    $P762."handle_types"(.CONTROL_RETURN)
    push_eh $P762
    .lex "self", self
    .lex "$/", param_763
    find_lex $P764, "$/"
    find_lex $P765, "$/"
    unless_null $P765, vivify_298
    $P765 = root_new ['parrot';'Hash']
  vivify_298:
    set $P766, $P765["fatarrow"]
    unless_null $P766, vivify_299
    new $P766, "Undef"
  vivify_299:
    $P767 = $P766."ast"()
    $P768 = $P764."!make"($P767)
    .return ($P768)
  control_761:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P769, exception, "payload"
    .return ($P769)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<colonpair>"  :subid("50_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_773
.annotate 'line', 305
    new $P772, 'ExceptionHandler'
    set_addr $P772, control_771
    $P772."handle_types"(.CONTROL_RETURN)
    push_eh $P772
    .lex "self", self
    .lex "$/", param_773
    find_lex $P774, "$/"
    find_lex $P775, "$/"
    unless_null $P775, vivify_300
    $P775 = root_new ['parrot';'Hash']
  vivify_300:
    set $P776, $P775["colonpair"]
    unless_null $P776, vivify_301
    new $P776, "Undef"
  vivify_301:
    $P777 = $P776."ast"()
    $P778 = $P774."!make"($P777)
    .return ($P778)
  control_771:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P779, exception, "payload"
    .return ($P779)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<variable>"  :subid("51_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_783
.annotate 'line', 306
    new $P782, 'ExceptionHandler'
    set_addr $P782, control_781
    $P782."handle_types"(.CONTROL_RETURN)
    push_eh $P782
    .lex "self", self
    .lex "$/", param_783
    find_lex $P784, "$/"
    find_lex $P785, "$/"
    unless_null $P785, vivify_302
    $P785 = root_new ['parrot';'Hash']
  vivify_302:
    set $P786, $P785["variable"]
    unless_null $P786, vivify_303
    new $P786, "Undef"
  vivify_303:
    $P787 = $P786."ast"()
    $P788 = $P784."!make"($P787)
    .return ($P788)
  control_781:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P789, exception, "payload"
    .return ($P789)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<package_declarator>"  :subid("52_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_793
.annotate 'line', 307
    new $P792, 'ExceptionHandler'
    set_addr $P792, control_791
    $P792."handle_types"(.CONTROL_RETURN)
    push_eh $P792
    .lex "self", self
    .lex "$/", param_793
    find_lex $P794, "$/"
    find_lex $P795, "$/"
    unless_null $P795, vivify_304
    $P795 = root_new ['parrot';'Hash']
  vivify_304:
    set $P796, $P795["package_declarator"]
    unless_null $P796, vivify_305
    new $P796, "Undef"
  vivify_305:
    $P797 = $P796."ast"()
    $P798 = $P794."!make"($P797)
    .return ($P798)
  control_791:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P799, exception, "payload"
    .return ($P799)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<scope_declarator>"  :subid("53_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_803
.annotate 'line', 308
    new $P802, 'ExceptionHandler'
    set_addr $P802, control_801
    $P802."handle_types"(.CONTROL_RETURN)
    push_eh $P802
    .lex "self", self
    .lex "$/", param_803
    find_lex $P804, "$/"
    find_lex $P805, "$/"
    unless_null $P805, vivify_306
    $P805 = root_new ['parrot';'Hash']
  vivify_306:
    set $P806, $P805["scope_declarator"]
    unless_null $P806, vivify_307
    new $P806, "Undef"
  vivify_307:
    $P807 = $P806."ast"()
    $P808 = $P804."!make"($P807)
    .return ($P808)
  control_801:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P809, exception, "payload"
    .return ($P809)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<routine_declarator>"  :subid("54_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_813
.annotate 'line', 309
    new $P812, 'ExceptionHandler'
    set_addr $P812, control_811
    $P812."handle_types"(.CONTROL_RETURN)
    push_eh $P812
    .lex "self", self
    .lex "$/", param_813
    find_lex $P814, "$/"
    find_lex $P815, "$/"
    unless_null $P815, vivify_308
    $P815 = root_new ['parrot';'Hash']
  vivify_308:
    set $P816, $P815["routine_declarator"]
    unless_null $P816, vivify_309
    new $P816, "Undef"
  vivify_309:
    $P817 = $P816."ast"()
    $P818 = $P814."!make"($P817)
    .return ($P818)
  control_811:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P819, exception, "payload"
    .return ($P819)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<regex_declarator>"  :subid("55_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_823
.annotate 'line', 310
    new $P822, 'ExceptionHandler'
    set_addr $P822, control_821
    $P822."handle_types"(.CONTROL_RETURN)
    push_eh $P822
    .lex "self", self
    .lex "$/", param_823
    find_lex $P824, "$/"
    find_lex $P825, "$/"
    unless_null $P825, vivify_310
    $P825 = root_new ['parrot';'Hash']
  vivify_310:
    set $P826, $P825["regex_declarator"]
    unless_null $P826, vivify_311
    new $P826, "Undef"
  vivify_311:
    $P827 = $P826."ast"()
    $P828 = $P824."!make"($P827)
    .return ($P828)
  control_821:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P829, exception, "payload"
    .return ($P829)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<statement_prefix>"  :subid("56_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_833
.annotate 'line', 311
    new $P832, 'ExceptionHandler'
    set_addr $P832, control_831
    $P832."handle_types"(.CONTROL_RETURN)
    push_eh $P832
    .lex "self", self
    .lex "$/", param_833
    find_lex $P834, "$/"
    find_lex $P835, "$/"
    unless_null $P835, vivify_312
    $P835 = root_new ['parrot';'Hash']
  vivify_312:
    set $P836, $P835["statement_prefix"]
    unless_null $P836, vivify_313
    new $P836, "Undef"
  vivify_313:
    $P837 = $P836."ast"()
    $P838 = $P834."!make"($P837)
    .return ($P838)
  control_831:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P839, exception, "payload"
    .return ($P839)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<lambda>"  :subid("57_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_843
.annotate 'line', 312
    new $P842, 'ExceptionHandler'
    set_addr $P842, control_841
    $P842."handle_types"(.CONTROL_RETURN)
    push_eh $P842
    .lex "self", self
    .lex "$/", param_843
    find_lex $P844, "$/"
    find_lex $P845, "$/"
    unless_null $P845, vivify_314
    $P845 = root_new ['parrot';'Hash']
  vivify_314:
    set $P846, $P845["pblock"]
    unless_null $P846, vivify_315
    new $P846, "Undef"
  vivify_315:
    $P847 = $P846."ast"()
    $P848 = $P844."!make"($P847)
    .return ($P848)
  control_841:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P849, exception, "payload"
    .return ($P849)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "fatarrow"  :subid("58_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_853
.annotate 'line', 314
    new $P852, 'ExceptionHandler'
    set_addr $P852, control_851
    $P852."handle_types"(.CONTROL_RETURN)
    push_eh $P852
    .lex "self", self
    .lex "$/", param_853
.annotate 'line', 315
    new $P854, "Undef"
    .lex "$past", $P854
    find_lex $P855, "$/"
    unless_null $P855, vivify_316
    $P855 = root_new ['parrot';'Hash']
  vivify_316:
    set $P856, $P855["val"]
    unless_null $P856, vivify_317
    new $P856, "Undef"
  vivify_317:
    $P857 = $P856."ast"()
    store_lex "$past", $P857
.annotate 'line', 316
    find_lex $P858, "$past"
    find_lex $P859, "$/"
    unless_null $P859, vivify_318
    $P859 = root_new ['parrot';'Hash']
  vivify_318:
    set $P860, $P859["key"]
    unless_null $P860, vivify_319
    new $P860, "Undef"
  vivify_319:
    $P861 = $P860."Str"()
    $P858."named"($P861)
.annotate 'line', 317
    find_lex $P862, "$/"
    find_lex $P863, "$past"
    $P864 = $P862."!make"($P863)
.annotate 'line', 314
    .return ($P864)
  control_851:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P865, exception, "payload"
    .return ($P865)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "colonpair"  :subid("59_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_869
.annotate 'line', 320
    new $P868, 'ExceptionHandler'
    set_addr $P868, control_867
    $P868."handle_types"(.CONTROL_RETURN)
    push_eh $P868
    .lex "self", self
    .lex "$/", param_869
.annotate 'line', 321
    new $P870, "Undef"
    .lex "$past", $P870
.annotate 'line', 322
    find_lex $P873, "$/"
    unless_null $P873, vivify_320
    $P873 = root_new ['parrot';'Hash']
  vivify_320:
    set $P874, $P873["circumfix"]
    unless_null $P874, vivify_321
    new $P874, "Undef"
  vivify_321:
    if $P874, if_872
.annotate 'line', 323
    get_hll_global $P879, ["PAST"], "Val"
    find_lex $P880, "$/"
    unless_null $P880, vivify_322
    $P880 = root_new ['parrot';'Hash']
  vivify_322:
    set $P881, $P880["not"]
    unless_null $P881, vivify_323
    new $P881, "Undef"
  vivify_323:
    isfalse $I882, $P881
    $P883 = $P879."new"($I882 :named("value"))
    set $P871, $P883
.annotate 'line', 322
    goto if_872_end
  if_872:
    find_lex $P875, "$/"
    unless_null $P875, vivify_324
    $P875 = root_new ['parrot';'Hash']
  vivify_324:
    set $P876, $P875["circumfix"]
    unless_null $P876, vivify_325
    $P876 = root_new ['parrot';'ResizablePMCArray']
  vivify_325:
    set $P877, $P876[0]
    unless_null $P877, vivify_326
    new $P877, "Undef"
  vivify_326:
    $P878 = $P877."ast"()
    set $P871, $P878
  if_872_end:
    store_lex "$past", $P871
.annotate 'line', 324
    find_lex $P884, "$past"
    find_lex $P885, "$/"
    unless_null $P885, vivify_327
    $P885 = root_new ['parrot';'Hash']
  vivify_327:
    set $P886, $P885["identifier"]
    unless_null $P886, vivify_328
    new $P886, "Undef"
  vivify_328:
    set $S887, $P886
    $P884."named"($S887)
.annotate 'line', 325
    find_lex $P888, "$/"
    find_lex $P889, "$past"
    $P890 = $P888."!make"($P889)
.annotate 'line', 320
    .return ($P890)
  control_867:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P891, exception, "payload"
    .return ($P891)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "variable"  :subid("60_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_895
.annotate 'line', 328
    .const 'Sub' $P908 = "61_1284728484.24945" 
    capture_lex $P908
    new $P894, 'ExceptionHandler'
    set_addr $P894, control_893
    $P894."handle_types"(.CONTROL_RETURN)
    push_eh $P894
    .lex "self", self
    .lex "$/", param_895
.annotate 'line', 329
    new $P896, "Undef"
    .lex "$past", $P896
.annotate 'line', 328
    find_lex $P897, "$past"
.annotate 'line', 330
    find_lex $P899, "$/"
    unless_null $P899, vivify_329
    $P899 = root_new ['parrot';'Hash']
  vivify_329:
    set $P900, $P899["postcircumfix"]
    unless_null $P900, vivify_330
    new $P900, "Undef"
  vivify_330:
    if $P900, if_898
.annotate 'line', 334
    .const 'Sub' $P908 = "61_1284728484.24945" 
    capture_lex $P908
    $P908()
    goto if_898_end
  if_898:
.annotate 'line', 331
    find_lex $P901, "$/"
    unless_null $P901, vivify_347
    $P901 = root_new ['parrot';'Hash']
  vivify_347:
    set $P902, $P901["postcircumfix"]
    unless_null $P902, vivify_348
    new $P902, "Undef"
  vivify_348:
    $P903 = $P902."ast"()
    store_lex "$past", $P903
.annotate 'line', 332
    find_lex $P904, "$past"
    get_hll_global $P905, ["PAST"], "Var"
    $P906 = $P905."new"("$/" :named("name"))
    $P904."unshift"($P906)
  if_898_end:
.annotate 'line', 363
    find_lex $P977, "$/"
    find_lex $P978, "$past"
    $P979 = $P977."!make"($P978)
.annotate 'line', 328
    .return ($P979)
  control_893:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P980, exception, "payload"
    .return ($P980)
.end


.namespace ["NQP";"Actions"]
.sub "_block907"  :anon :subid("61_1284728484.24945") :outer("60_1284728484.24945")
.annotate 'line', 335
    $P909 = root_new ['parrot';'ResizablePMCArray']
    .lex "@name", $P909
    get_hll_global $P910, ["NQP"], "Compiler"
    find_lex $P911, "$/"
    set $S912, $P911
    $P913 = $P910."parse_name"($S912)
    store_lex "@name", $P913
.annotate 'line', 336
    get_hll_global $P914, ["PAST"], "Var"
    find_lex $P915, "@name"
    $P916 = $P915."pop"()
    set $S917, $P916
    $P918 = $P914."new"($S917 :named("name"))
    store_lex "$past", $P918
.annotate 'line', 337
    find_lex $P920, "@name"
    unless $P920, if_919_end
.annotate 'line', 338
    find_lex $P922, "@name"
    unless_null $P922, vivify_331
    $P922 = root_new ['parrot';'ResizablePMCArray']
  vivify_331:
    set $P923, $P922[0]
    unless_null $P923, vivify_332
    new $P923, "Undef"
  vivify_332:
    set $S924, $P923
    iseq $I925, $S924, "GLOBAL"
    unless $I925, if_921_end
    find_lex $P926, "@name"
    $P926."shift"()
  if_921_end:
.annotate 'line', 339
    find_lex $P927, "$past"
    find_lex $P928, "@name"
    $P927."namespace"($P928)
.annotate 'line', 340
    find_lex $P929, "$past"
    $P929."scope"("package")
.annotate 'line', 341
    find_lex $P930, "$past"
    find_lex $P931, "$/"
    unless_null $P931, vivify_333
    $P931 = root_new ['parrot';'Hash']
  vivify_333:
    set $P932, $P931["sigil"]
    unless_null $P932, vivify_334
    new $P932, "Undef"
  vivify_334:
    $P933 = "vivitype"($P932)
    $P930."viviself"($P933)
.annotate 'line', 342
    find_lex $P934, "$past"
    $P934."lvalue"(1)
  if_919_end:
.annotate 'line', 344
    find_lex $P937, "$/"
    unless_null $P937, vivify_335
    $P937 = root_new ['parrot';'Hash']
  vivify_335:
    set $P938, $P937["twigil"]
    unless_null $P938, vivify_336
    $P938 = root_new ['parrot';'ResizablePMCArray']
  vivify_336:
    set $P939, $P938[0]
    unless_null $P939, vivify_337
    new $P939, "Undef"
  vivify_337:
    set $S940, $P939
    iseq $I941, $S940, "*"
    if $I941, if_936
.annotate 'line', 357
    find_lex $P963, "$/"
    unless_null $P963, vivify_338
    $P963 = root_new ['parrot';'Hash']
  vivify_338:
    set $P964, $P963["twigil"]
    unless_null $P964, vivify_339
    $P964 = root_new ['parrot';'ResizablePMCArray']
  vivify_339:
    set $P965, $P964[0]
    unless_null $P965, vivify_340
    new $P965, "Undef"
  vivify_340:
    set $S966, $P965
    iseq $I967, $S966, "!"
    if $I967, if_962
    new $P961, 'Integer'
    set $P961, $I967
    goto if_962_end
  if_962:
.annotate 'line', 358
    find_lex $P968, "$past"
    get_hll_global $P969, ["PAST"], "Var"
    $P970 = $P969."new"("self" :named("name"))
    $P968."push"($P970)
.annotate 'line', 359
    find_lex $P971, "$past"
    $P971."scope"("attribute")
.annotate 'line', 360
    find_lex $P972, "$past"
    find_lex $P973, "$/"
    unless_null $P973, vivify_341
    $P973 = root_new ['parrot';'Hash']
  vivify_341:
    set $P974, $P973["sigil"]
    unless_null $P974, vivify_342
    new $P974, "Undef"
  vivify_342:
    $P975 = "vivitype"($P974)
    $P976 = $P972."viviself"($P975)
.annotate 'line', 357
    set $P961, $P976
  if_962_end:
    set $P935, $P961
.annotate 'line', 344
    goto if_936_end
  if_936:
.annotate 'line', 345
    find_lex $P942, "$past"
    $P942."scope"("contextual")
.annotate 'line', 346
    find_lex $P943, "$past"
.annotate 'line', 347
    get_hll_global $P944, ["PAST"], "Var"
.annotate 'line', 349
    find_lex $P945, "$/"
    unless_null $P945, vivify_343
    $P945 = root_new ['parrot';'Hash']
  vivify_343:
    set $P946, $P945["sigil"]
    unless_null $P946, vivify_344
    new $P946, "Undef"
  vivify_344:
    set $S947, $P946
    new $P948, 'String'
    set $P948, $S947
    find_lex $P949, "$/"
    unless_null $P949, vivify_345
    $P949 = root_new ['parrot';'Hash']
  vivify_345:
    set $P950, $P949["desigilname"]
    unless_null $P950, vivify_346
    new $P950, "Undef"
  vivify_346:
    concat $P951, $P948, $P950
.annotate 'line', 351
    get_hll_global $P952, ["PAST"], "Op"
    new $P953, "String"
    assign $P953, "Contextual "
    find_lex $P954, "$/"
    set $S955, $P954
    concat $P956, $P953, $S955
    concat $P957, $P956, " not found"
    $P958 = $P952."new"($P957, "die" :named("pirop"))
    $P959 = $P944."new"("package" :named("scope"), "" :named("namespace"), $P951 :named("name"), $P958 :named("viviself"))
.annotate 'line', 347
    $P960 = $P943."viviself"($P959)
.annotate 'line', 344
    set $P935, $P960
  if_936_end:
.annotate 'line', 334
    .return ($P935)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "package_declarator:sym<module>"  :subid("62_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_984
.annotate 'line', 366
    new $P983, 'ExceptionHandler'
    set_addr $P983, control_982
    $P983."handle_types"(.CONTROL_RETURN)
    push_eh $P983
    .lex "self", self
    .lex "$/", param_984
    find_lex $P985, "$/"
    find_lex $P986, "$/"
    unless_null $P986, vivify_349
    $P986 = root_new ['parrot';'Hash']
  vivify_349:
    set $P987, $P986["package_def"]
    unless_null $P987, vivify_350
    new $P987, "Undef"
  vivify_350:
    $P988 = $P987."ast"()
    $P989 = $P985."!make"($P988)
    .return ($P989)
  control_982:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P990, exception, "payload"
    .return ($P990)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "package_declarator:sym<class>"  :subid("63_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_994
.annotate 'line', 367
    new $P993, 'ExceptionHandler'
    set_addr $P993, control_992
    $P993."handle_types"(.CONTROL_RETURN)
    push_eh $P993
    .lex "self", self
    .lex "$/", param_994
.annotate 'line', 368
    new $P995, "Undef"
    .lex "$past", $P995
.annotate 'line', 369
    new $P996, "Undef"
    .lex "$classinit", $P996
.annotate 'line', 378
    new $P997, "Undef"
    .lex "$parent", $P997
.annotate 'line', 368
    find_lex $P998, "$/"
    unless_null $P998, vivify_351
    $P998 = root_new ['parrot';'Hash']
  vivify_351:
    set $P999, $P998["package_def"]
    unless_null $P999, vivify_352
    new $P999, "Undef"
  vivify_352:
    $P1000 = $P999."ast"()
    store_lex "$past", $P1000
.annotate 'line', 370
    get_hll_global $P1001, ["PAST"], "Op"
.annotate 'line', 371
    get_hll_global $P1002, ["PAST"], "Op"
    $P1003 = $P1002."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate 'line', 374
    find_lex $P1004, "$/"
    unless_null $P1004, vivify_353
    $P1004 = root_new ['parrot';'Hash']
  vivify_353:
    set $P1005, $P1004["package_def"]
    unless_null $P1005, vivify_354
    $P1005 = root_new ['parrot';'Hash']
  vivify_354:
    set $P1006, $P1005["name"]
    unless_null $P1006, vivify_355
    new $P1006, "Undef"
  vivify_355:
    set $S1007, $P1006
    $P1008 = $P1001."new"($P1003, $S1007, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 370
    store_lex "$classinit", $P1008
.annotate 'line', 378
    find_lex $P1011, "$/"
    unless_null $P1011, vivify_356
    $P1011 = root_new ['parrot';'Hash']
  vivify_356:
    set $P1012, $P1011["package_def"]
    unless_null $P1012, vivify_357
    $P1012 = root_new ['parrot';'Hash']
  vivify_357:
    set $P1013, $P1012["parent"]
    unless_null $P1013, vivify_358
    $P1013 = root_new ['parrot';'ResizablePMCArray']
  vivify_358:
    set $P1014, $P1013[0]
    unless_null $P1014, vivify_359
    new $P1014, "Undef"
  vivify_359:
    set $S1015, $P1014
    unless $S1015, unless_1010
    new $P1009, 'String'
    set $P1009, $S1015
    goto unless_1010_end
  unless_1010:
.annotate 'line', 379
    find_lex $P1018, "$/"
    unless_null $P1018, vivify_360
    $P1018 = root_new ['parrot';'Hash']
  vivify_360:
    set $P1019, $P1018["sym"]
    unless_null $P1019, vivify_361
    new $P1019, "Undef"
  vivify_361:
    set $S1020, $P1019
    iseq $I1021, $S1020, "grammar"
    if $I1021, if_1017
    new $P1023, "String"
    assign $P1023, ""
    set $P1016, $P1023
    goto if_1017_end
  if_1017:
    new $P1022, "String"
    assign $P1022, "Regex::Cursor"
    set $P1016, $P1022
  if_1017_end:
    set $P1009, $P1016
  unless_1010_end:
    store_lex "$parent", $P1009
.annotate 'line', 380
    find_lex $P1025, "$parent"
    unless $P1025, if_1024_end
.annotate 'line', 381
    find_lex $P1026, "$classinit"
    get_hll_global $P1027, ["PAST"], "Val"
    find_lex $P1028, "$parent"
    $P1029 = $P1027."new"($P1028 :named("value"), "parent" :named("named"))
    $P1026."push"($P1029)
  if_1024_end:
.annotate 'line', 383
    find_lex $P1031, "$past"
    unless_null $P1031, vivify_362
    $P1031 = root_new ['parrot';'Hash']
  vivify_362:
    set $P1032, $P1031["attributes"]
    unless_null $P1032, vivify_363
    new $P1032, "Undef"
  vivify_363:
    unless $P1032, if_1030_end
.annotate 'line', 384
    find_lex $P1033, "$classinit"
    find_lex $P1034, "$past"
    unless_null $P1034, vivify_364
    $P1034 = root_new ['parrot';'Hash']
  vivify_364:
    set $P1035, $P1034["attributes"]
    unless_null $P1035, vivify_365
    new $P1035, "Undef"
  vivify_365:
    $P1033."push"($P1035)
  if_1030_end:
.annotate 'line', 386
    get_global $P1036, "@BLOCK"
    unless_null $P1036, vivify_366
    $P1036 = root_new ['parrot';'ResizablePMCArray']
  vivify_366:
    set $P1037, $P1036[0]
    unless_null $P1037, vivify_367
    new $P1037, "Undef"
  vivify_367:
    $P1038 = $P1037."loadinit"()
    find_lex $P1039, "$classinit"
    $P1038."push"($P1039)
.annotate 'line', 387
    find_lex $P1040, "$/"
    find_lex $P1041, "$past"
    $P1042 = $P1040."!make"($P1041)
.annotate 'line', 367
    .return ($P1042)
  control_992:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1043, exception, "payload"
    .return ($P1043)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "package_def"  :subid("64_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1047
.annotate 'line', 390
    new $P1046, 'ExceptionHandler'
    set_addr $P1046, control_1045
    $P1046."handle_types"(.CONTROL_RETURN)
    push_eh $P1046
    .lex "self", self
    .lex "$/", param_1047
.annotate 'line', 391
    new $P1048, "Undef"
    .lex "$past", $P1048
    find_lex $P1051, "$/"
    unless_null $P1051, vivify_368
    $P1051 = root_new ['parrot';'Hash']
  vivify_368:
    set $P1052, $P1051["block"]
    unless_null $P1052, vivify_369
    new $P1052, "Undef"
  vivify_369:
    if $P1052, if_1050
    find_lex $P1056, "$/"
    unless_null $P1056, vivify_370
    $P1056 = root_new ['parrot';'Hash']
  vivify_370:
    set $P1057, $P1056["comp_unit"]
    unless_null $P1057, vivify_371
    new $P1057, "Undef"
  vivify_371:
    $P1058 = $P1057."ast"()
    set $P1049, $P1058
    goto if_1050_end
  if_1050:
    find_lex $P1053, "$/"
    unless_null $P1053, vivify_372
    $P1053 = root_new ['parrot';'Hash']
  vivify_372:
    set $P1054, $P1053["block"]
    unless_null $P1054, vivify_373
    new $P1054, "Undef"
  vivify_373:
    $P1055 = $P1054."ast"()
    set $P1049, $P1055
  if_1050_end:
    store_lex "$past", $P1049
.annotate 'line', 392
    find_lex $P1059, "$past"
    find_lex $P1060, "$/"
    unless_null $P1060, vivify_374
    $P1060 = root_new ['parrot';'Hash']
  vivify_374:
    set $P1061, $P1060["name"]
    unless_null $P1061, vivify_375
    $P1061 = root_new ['parrot';'Hash']
  vivify_375:
    set $P1062, $P1061["identifier"]
    unless_null $P1062, vivify_376
    new $P1062, "Undef"
  vivify_376:
    $P1059."namespace"($P1062)
.annotate 'line', 393
    find_lex $P1063, "$past"
    $P1063."blocktype"("immediate")
.annotate 'line', 394
    find_lex $P1064, "$/"
    find_lex $P1065, "$past"
    $P1066 = $P1064."!make"($P1065)
.annotate 'line', 390
    .return ($P1066)
  control_1045:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1067, exception, "payload"
    .return ($P1067)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "scope_declarator:sym<my>"  :subid("65_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1071
.annotate 'line', 397
    new $P1070, 'ExceptionHandler'
    set_addr $P1070, control_1069
    $P1070."handle_types"(.CONTROL_RETURN)
    push_eh $P1070
    .lex "self", self
    .lex "$/", param_1071
    find_lex $P1072, "$/"
    find_lex $P1073, "$/"
    unless_null $P1073, vivify_377
    $P1073 = root_new ['parrot';'Hash']
  vivify_377:
    set $P1074, $P1073["scoped"]
    unless_null $P1074, vivify_378
    new $P1074, "Undef"
  vivify_378:
    $P1075 = $P1074."ast"()
    $P1076 = $P1072."!make"($P1075)
    .return ($P1076)
  control_1069:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1077, exception, "payload"
    .return ($P1077)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "scope_declarator:sym<our>"  :subid("66_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1081
.annotate 'line', 398
    new $P1080, 'ExceptionHandler'
    set_addr $P1080, control_1079
    $P1080."handle_types"(.CONTROL_RETURN)
    push_eh $P1080
    .lex "self", self
    .lex "$/", param_1081
    find_lex $P1082, "$/"
    find_lex $P1083, "$/"
    unless_null $P1083, vivify_379
    $P1083 = root_new ['parrot';'Hash']
  vivify_379:
    set $P1084, $P1083["scoped"]
    unless_null $P1084, vivify_380
    new $P1084, "Undef"
  vivify_380:
    $P1085 = $P1084."ast"()
    $P1086 = $P1082."!make"($P1085)
    .return ($P1086)
  control_1079:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1087, exception, "payload"
    .return ($P1087)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "scope_declarator:sym<has>"  :subid("67_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1091
.annotate 'line', 399
    new $P1090, 'ExceptionHandler'
    set_addr $P1090, control_1089
    $P1090."handle_types"(.CONTROL_RETURN)
    push_eh $P1090
    .lex "self", self
    .lex "$/", param_1091
    find_lex $P1092, "$/"
    find_lex $P1093, "$/"
    unless_null $P1093, vivify_381
    $P1093 = root_new ['parrot';'Hash']
  vivify_381:
    set $P1094, $P1093["scoped"]
    unless_null $P1094, vivify_382
    new $P1094, "Undef"
  vivify_382:
    $P1095 = $P1094."ast"()
    $P1096 = $P1092."!make"($P1095)
    .return ($P1096)
  control_1089:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1097, exception, "payload"
    .return ($P1097)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "scoped"  :subid("68_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1101
.annotate 'line', 401
    new $P1100, 'ExceptionHandler'
    set_addr $P1100, control_1099
    $P1100."handle_types"(.CONTROL_RETURN)
    push_eh $P1100
    .lex "self", self
    .lex "$/", param_1101
.annotate 'line', 402
    find_lex $P1102, "$/"
.annotate 'line', 403
    find_lex $P1105, "$/"
    unless_null $P1105, vivify_383
    $P1105 = root_new ['parrot';'Hash']
  vivify_383:
    set $P1106, $P1105["declarator"]
    unless_null $P1106, vivify_384
    new $P1106, "Undef"
  vivify_384:
    if $P1106, if_1104
.annotate 'line', 404
    find_lex $P1110, "$/"
    unless_null $P1110, vivify_385
    $P1110 = root_new ['parrot';'Hash']
  vivify_385:
    set $P1111, $P1110["multi_declarator"]
    unless_null $P1111, vivify_386
    new $P1111, "Undef"
  vivify_386:
    $P1112 = $P1111."ast"()
    set $P1103, $P1112
.annotate 'line', 403
    goto if_1104_end
  if_1104:
    find_lex $P1107, "$/"
    unless_null $P1107, vivify_387
    $P1107 = root_new ['parrot';'Hash']
  vivify_387:
    set $P1108, $P1107["declarator"]
    unless_null $P1108, vivify_388
    new $P1108, "Undef"
  vivify_388:
    $P1109 = $P1108."ast"()
    set $P1103, $P1109
  if_1104_end:
    $P1113 = $P1102."!make"($P1103)
.annotate 'line', 401
    .return ($P1113)
  control_1099:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1114, exception, "payload"
    .return ($P1114)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "declarator"  :subid("69_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1118
.annotate 'line', 407
    new $P1117, 'ExceptionHandler'
    set_addr $P1117, control_1116
    $P1117."handle_types"(.CONTROL_RETURN)
    push_eh $P1117
    .lex "self", self
    .lex "$/", param_1118
.annotate 'line', 408
    find_lex $P1119, "$/"
.annotate 'line', 409
    find_lex $P1122, "$/"
    unless_null $P1122, vivify_389
    $P1122 = root_new ['parrot';'Hash']
  vivify_389:
    set $P1123, $P1122["routine_declarator"]
    unless_null $P1123, vivify_390
    new $P1123, "Undef"
  vivify_390:
    if $P1123, if_1121
.annotate 'line', 410
    find_lex $P1127, "$/"
    unless_null $P1127, vivify_391
    $P1127 = root_new ['parrot';'Hash']
  vivify_391:
    set $P1128, $P1127["variable_declarator"]
    unless_null $P1128, vivify_392
    new $P1128, "Undef"
  vivify_392:
    $P1129 = $P1128."ast"()
    set $P1120, $P1129
.annotate 'line', 409
    goto if_1121_end
  if_1121:
    find_lex $P1124, "$/"
    unless_null $P1124, vivify_393
    $P1124 = root_new ['parrot';'Hash']
  vivify_393:
    set $P1125, $P1124["routine_declarator"]
    unless_null $P1125, vivify_394
    new $P1125, "Undef"
  vivify_394:
    $P1126 = $P1125."ast"()
    set $P1120, $P1126
  if_1121_end:
    $P1130 = $P1119."!make"($P1120)
.annotate 'line', 407
    .return ($P1130)
  control_1116:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1131, exception, "payload"
    .return ($P1131)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "multi_declarator:sym<multi>"  :subid("70_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1135
.annotate 'line', 413
    new $P1134, 'ExceptionHandler'
    set_addr $P1134, control_1133
    $P1134."handle_types"(.CONTROL_RETURN)
    push_eh $P1134
    .lex "self", self
    .lex "$/", param_1135
    find_lex $P1136, "$/"
    find_lex $P1139, "$/"
    unless_null $P1139, vivify_395
    $P1139 = root_new ['parrot';'Hash']
  vivify_395:
    set $P1140, $P1139["declarator"]
    unless_null $P1140, vivify_396
    new $P1140, "Undef"
  vivify_396:
    if $P1140, if_1138
    find_lex $P1144, "$/"
    unless_null $P1144, vivify_397
    $P1144 = root_new ['parrot';'Hash']
  vivify_397:
    set $P1145, $P1144["routine_def"]
    unless_null $P1145, vivify_398
    new $P1145, "Undef"
  vivify_398:
    $P1146 = $P1145."ast"()
    set $P1137, $P1146
    goto if_1138_end
  if_1138:
    find_lex $P1141, "$/"
    unless_null $P1141, vivify_399
    $P1141 = root_new ['parrot';'Hash']
  vivify_399:
    set $P1142, $P1141["declarator"]
    unless_null $P1142, vivify_400
    new $P1142, "Undef"
  vivify_400:
    $P1143 = $P1142."ast"()
    set $P1137, $P1143
  if_1138_end:
    $P1147 = $P1136."!make"($P1137)
    .return ($P1147)
  control_1133:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1148, exception, "payload"
    .return ($P1148)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "multi_declarator:sym<null>"  :subid("71_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1152
.annotate 'line', 414
    new $P1151, 'ExceptionHandler'
    set_addr $P1151, control_1150
    $P1151."handle_types"(.CONTROL_RETURN)
    push_eh $P1151
    .lex "self", self
    .lex "$/", param_1152
    find_lex $P1153, "$/"
    find_lex $P1154, "$/"
    unless_null $P1154, vivify_401
    $P1154 = root_new ['parrot';'Hash']
  vivify_401:
    set $P1155, $P1154["declarator"]
    unless_null $P1155, vivify_402
    new $P1155, "Undef"
  vivify_402:
    $P1156 = $P1155."ast"()
    $P1157 = $P1153."!make"($P1156)
    .return ($P1157)
  control_1150:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1158, exception, "payload"
    .return ($P1158)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "variable_declarator"  :subid("72_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1162
.annotate 'line', 417
    .const 'Sub' $P1202 = "73_1284728484.24945" 
    capture_lex $P1202
    new $P1161, 'ExceptionHandler'
    set_addr $P1161, control_1160
    $P1161."handle_types"(.CONTROL_RETURN)
    push_eh $P1161
    .lex "self", self
    .lex "$/", param_1162
.annotate 'line', 418
    new $P1163, "Undef"
    .lex "$past", $P1163
.annotate 'line', 419
    new $P1164, "Undef"
    .lex "$sigil", $P1164
.annotate 'line', 420
    new $P1165, "Undef"
    .lex "$name", $P1165
.annotate 'line', 421
    new $P1166, "Undef"
    .lex "$BLOCK", $P1166
.annotate 'line', 418
    find_lex $P1167, "$/"
    unless_null $P1167, vivify_403
    $P1167 = root_new ['parrot';'Hash']
  vivify_403:
    set $P1168, $P1167["variable"]
    unless_null $P1168, vivify_404
    new $P1168, "Undef"
  vivify_404:
    $P1169 = $P1168."ast"()
    store_lex "$past", $P1169
.annotate 'line', 419
    find_lex $P1170, "$/"
    unless_null $P1170, vivify_405
    $P1170 = root_new ['parrot';'Hash']
  vivify_405:
    set $P1171, $P1170["variable"]
    unless_null $P1171, vivify_406
    $P1171 = root_new ['parrot';'Hash']
  vivify_406:
    set $P1172, $P1171["sigil"]
    unless_null $P1172, vivify_407
    new $P1172, "Undef"
  vivify_407:
    store_lex "$sigil", $P1172
.annotate 'line', 420
    find_lex $P1173, "$past"
    $P1174 = $P1173."name"()
    store_lex "$name", $P1174
.annotate 'line', 421
    get_global $P1175, "@BLOCK"
    unless_null $P1175, vivify_408
    $P1175 = root_new ['parrot';'ResizablePMCArray']
  vivify_408:
    set $P1176, $P1175[0]
    unless_null $P1176, vivify_409
    new $P1176, "Undef"
  vivify_409:
    store_lex "$BLOCK", $P1176
.annotate 'line', 422
    find_lex $P1178, "$BLOCK"
    find_lex $P1179, "$name"
    $P1180 = $P1178."symbol"($P1179)
    unless $P1180, if_1177_end
.annotate 'line', 423
    find_lex $P1181, "$/"
    $P1182 = $P1181."CURSOR"()
    find_lex $P1183, "$name"
    $P1182."panic"("Redeclaration of symbol ", $P1183)
  if_1177_end:
.annotate 'line', 425
    find_dynamic_lex $P1185, "$*SCOPE"
    unless_null $P1185, vivify_410
    get_hll_global $P1185, "$SCOPE"
    unless_null $P1185, vivify_411
    die "Contextual $*SCOPE not found"
  vivify_411:
  vivify_410:
    set $S1186, $P1185
    iseq $I1187, $S1186, "has"
    if $I1187, if_1184
.annotate 'line', 434
    .const 'Sub' $P1202 = "73_1284728484.24945" 
    capture_lex $P1202
    $P1202()
    goto if_1184_end
  if_1184:
.annotate 'line', 426
    find_lex $P1188, "$BLOCK"
    find_lex $P1189, "$name"
    $P1188."symbol"($P1189, "attribute" :named("scope"))
.annotate 'line', 427
    find_lex $P1191, "$BLOCK"
    unless_null $P1191, vivify_416
    $P1191 = root_new ['parrot';'Hash']
  vivify_416:
    set $P1192, $P1191["attributes"]
    unless_null $P1192, vivify_417
    new $P1192, "Undef"
  vivify_417:
    if $P1192, unless_1190_end
.annotate 'line', 429
    get_hll_global $P1193, ["PAST"], "Op"
    $P1194 = $P1193."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P1195, "$BLOCK"
    unless_null $P1195, vivify_418
    $P1195 = root_new ['parrot';'Hash']
    store_lex "$BLOCK", $P1195
  vivify_418:
    set $P1195["attributes"], $P1194
  unless_1190_end:
.annotate 'line', 431
    find_lex $P1196, "$BLOCK"
    unless_null $P1196, vivify_419
    $P1196 = root_new ['parrot';'Hash']
  vivify_419:
    set $P1197, $P1196["attributes"]
    unless_null $P1197, vivify_420
    new $P1197, "Undef"
  vivify_420:
    find_lex $P1198, "$name"
    $P1197."push"($P1198)
.annotate 'line', 432
    get_hll_global $P1199, ["PAST"], "Stmts"
    $P1200 = $P1199."new"()
    store_lex "$past", $P1200
  if_1184_end:
.annotate 'line', 442
    find_lex $P1226, "$/"
    find_lex $P1227, "$past"
    $P1228 = $P1226."!make"($P1227)
.annotate 'line', 417
    .return ($P1228)
  control_1160:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1229, exception, "payload"
    .return ($P1229)
.end


.namespace ["NQP";"Actions"]
.sub "_block1201"  :anon :subid("73_1284728484.24945") :outer("72_1284728484.24945")
.annotate 'line', 435
    new $P1203, "Undef"
    .lex "$scope", $P1203
.annotate 'line', 436
    new $P1204, "Undef"
    .lex "$decl", $P1204
.annotate 'line', 435
    find_dynamic_lex $P1207, "$*SCOPE"
    unless_null $P1207, vivify_412
    get_hll_global $P1207, "$SCOPE"
    unless_null $P1207, vivify_413
    die "Contextual $*SCOPE not found"
  vivify_413:
  vivify_412:
    set $S1208, $P1207
    iseq $I1209, $S1208, "our"
    if $I1209, if_1206
    new $P1211, "String"
    assign $P1211, "lexical"
    set $P1205, $P1211
    goto if_1206_end
  if_1206:
    new $P1210, "String"
    assign $P1210, "package"
    set $P1205, $P1210
  if_1206_end:
    store_lex "$scope", $P1205
.annotate 'line', 436
    get_hll_global $P1212, ["PAST"], "Var"
    find_lex $P1213, "$name"
    find_lex $P1214, "$scope"
.annotate 'line', 437
    find_lex $P1215, "$sigil"
    $P1216 = "vivitype"($P1215)
    find_lex $P1217, "$/"
    $P1218 = $P1212."new"($P1213 :named("name"), $P1214 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P1216 :named("viviself"), $P1217 :named("node"))
.annotate 'line', 436
    store_lex "$decl", $P1218
.annotate 'line', 439
    find_lex $P1219, "$BLOCK"
    find_lex $P1220, "$name"
    find_lex $P1221, "$scope"
    $P1219."symbol"($P1220, $P1221 :named("scope"))
.annotate 'line', 440
    find_lex $P1222, "$BLOCK"
    unless_null $P1222, vivify_414
    $P1222 = root_new ['parrot';'ResizablePMCArray']
  vivify_414:
    set $P1223, $P1222[0]
    unless_null $P1223, vivify_415
    new $P1223, "Undef"
  vivify_415:
    find_lex $P1224, "$decl"
    $P1225 = $P1223."push"($P1224)
.annotate 'line', 434
    .return ($P1225)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "routine_declarator:sym<sub>"  :subid("74_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1233
.annotate 'line', 445
    new $P1232, 'ExceptionHandler'
    set_addr $P1232, control_1231
    $P1232."handle_types"(.CONTROL_RETURN)
    push_eh $P1232
    .lex "self", self
    .lex "$/", param_1233
    find_lex $P1234, "$/"
    find_lex $P1235, "$/"
    unless_null $P1235, vivify_421
    $P1235 = root_new ['parrot';'Hash']
  vivify_421:
    set $P1236, $P1235["routine_def"]
    unless_null $P1236, vivify_422
    new $P1236, "Undef"
  vivify_422:
    $P1237 = $P1236."ast"()
    $P1238 = $P1234."!make"($P1237)
    .return ($P1238)
  control_1231:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1239, exception, "payload"
    .return ($P1239)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "routine_declarator:sym<method>"  :subid("75_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1243
.annotate 'line', 446
    new $P1242, 'ExceptionHandler'
    set_addr $P1242, control_1241
    $P1242."handle_types"(.CONTROL_RETURN)
    push_eh $P1242
    .lex "self", self
    .lex "$/", param_1243
    find_lex $P1244, "$/"
    find_lex $P1245, "$/"
    unless_null $P1245, vivify_423
    $P1245 = root_new ['parrot';'Hash']
  vivify_423:
    set $P1246, $P1245["method_def"]
    unless_null $P1246, vivify_424
    new $P1246, "Undef"
  vivify_424:
    $P1247 = $P1246."ast"()
    $P1248 = $P1244."!make"($P1247)
    .return ($P1248)
  control_1241:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1249, exception, "payload"
    .return ($P1249)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "routine_def"  :subid("76_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1253
.annotate 'line', 448
    .const 'Sub' $P1312 = "78_1284728484.24945" 
    capture_lex $P1312
    .const 'Sub' $P1266 = "77_1284728484.24945" 
    capture_lex $P1266
    new $P1252, 'ExceptionHandler'
    set_addr $P1252, control_1251
    $P1252."handle_types"(.CONTROL_RETURN)
    push_eh $P1252
    .lex "self", self
    .lex "$/", param_1253
.annotate 'line', 449
    new $P1254, "Undef"
    .lex "$block", $P1254
.annotate 'line', 452
    new $P1255, "Undef"
    .lex "$past", $P1255
.annotate 'line', 449
    find_lex $P1256, "$/"
    unless_null $P1256, vivify_425
    $P1256 = root_new ['parrot';'Hash']
  vivify_425:
    set $P1257, $P1256["blockoid"]
    unless_null $P1257, vivify_426
    new $P1257, "Undef"
  vivify_426:
    $P1258 = $P1257."ast"()
    store_lex "$block", $P1258
.annotate 'line', 450
    find_lex $P1259, "$block"
    $P1259."blocktype"("declaration")
.annotate 'line', 451
    find_lex $P1260, "$block"
    $P1260."control"("return_pir")
.annotate 'line', 452
    find_lex $P1261, "$block"
    store_lex "$past", $P1261
.annotate 'line', 453
    find_lex $P1263, "$/"
    unless_null $P1263, vivify_427
    $P1263 = root_new ['parrot';'Hash']
  vivify_427:
    set $P1264, $P1263["deflongname"]
    unless_null $P1264, vivify_428
    new $P1264, "Undef"
  vivify_428:
    unless $P1264, if_1262_end
    .const 'Sub' $P1266 = "77_1284728484.24945" 
    capture_lex $P1266
    $P1266()
  if_1262_end:
.annotate 'line', 463
    find_lex $P1298, "$block"
    find_lex $P1299, "$past"
    unless_null $P1299, vivify_442
    $P1299 = root_new ['parrot';'Hash']
    store_lex "$past", $P1299
  vivify_442:
    set $P1299["block_past"], $P1298
.annotate 'line', 464
    find_lex $P1300, "$/"
    find_lex $P1301, "$past"
    $P1300."!make"($P1301)
.annotate 'line', 465
    find_lex $P1304, "$/"
    unless_null $P1304, vivify_443
    $P1304 = root_new ['parrot';'Hash']
  vivify_443:
    set $P1305, $P1304["trait"]
    unless_null $P1305, vivify_444
    new $P1305, "Undef"
  vivify_444:
    if $P1305, if_1303
    set $P1302, $P1305
    goto if_1303_end
  if_1303:
.annotate 'line', 466
    find_lex $P1307, "$/"
    unless_null $P1307, vivify_445
    $P1307 = root_new ['parrot';'Hash']
  vivify_445:
    set $P1308, $P1307["trait"]
    unless_null $P1308, vivify_446
    new $P1308, "Undef"
  vivify_446:
    defined $I1309, $P1308
    unless $I1309, for_undef_447
    iter $P1306, $P1308
    new $P1319, 'ExceptionHandler'
    set_addr $P1319, loop1318_handler
    $P1319."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1319
  loop1318_test:
    unless $P1306, loop1318_done
    shift $P1310, $P1306
  loop1318_redo:
    .const 'Sub' $P1312 = "78_1284728484.24945" 
    capture_lex $P1312
    $P1312($P1310)
  loop1318_next:
    goto loop1318_test
  loop1318_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1320, exception, 'type'
    eq $P1320, .CONTROL_LOOP_NEXT, loop1318_next
    eq $P1320, .CONTROL_LOOP_REDO, loop1318_redo
  loop1318_done:
    pop_eh 
  for_undef_447:
.annotate 'line', 465
    set $P1302, $P1306
  if_1303_end:
.annotate 'line', 448
    .return ($P1302)
  control_1251:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1321, exception, "payload"
    .return ($P1321)
.end


.namespace ["NQP";"Actions"]
.sub "_block1265"  :anon :subid("77_1284728484.24945") :outer("76_1284728484.24945")
.annotate 'line', 454
    new $P1267, "Undef"
    .lex "$name", $P1267
    find_lex $P1268, "$/"
    unless_null $P1268, vivify_429
    $P1268 = root_new ['parrot';'Hash']
  vivify_429:
    set $P1269, $P1268["sigil"]
    unless_null $P1269, vivify_430
    $P1269 = root_new ['parrot';'ResizablePMCArray']
  vivify_430:
    set $P1270, $P1269[0]
    unless_null $P1270, vivify_431
    new $P1270, "Undef"
  vivify_431:
    set $S1271, $P1270
    new $P1272, 'String'
    set $P1272, $S1271
    find_lex $P1273, "$/"
    unless_null $P1273, vivify_432
    $P1273 = root_new ['parrot';'Hash']
  vivify_432:
    set $P1274, $P1273["deflongname"]
    unless_null $P1274, vivify_433
    $P1274 = root_new ['parrot';'ResizablePMCArray']
  vivify_433:
    set $P1275, $P1274[0]
    unless_null $P1275, vivify_434
    new $P1275, "Undef"
  vivify_434:
    $S1276 = $P1275."ast"()
    concat $P1277, $P1272, $S1276
    store_lex "$name", $P1277
.annotate 'line', 455
    find_lex $P1278, "$past"
    find_lex $P1279, "$name"
    $P1278."name"($P1279)
.annotate 'line', 456
    find_dynamic_lex $P1282, "$*SCOPE"
    unless_null $P1282, vivify_435
    get_hll_global $P1282, "$SCOPE"
    unless_null $P1282, vivify_436
    die "Contextual $*SCOPE not found"
  vivify_436:
  vivify_435:
    set $S1283, $P1282
    isne $I1284, $S1283, "our"
    if $I1284, if_1281
    new $P1280, 'Integer'
    set $P1280, $I1284
    goto if_1281_end
  if_1281:
.annotate 'line', 457
    get_global $P1285, "@BLOCK"
    unless_null $P1285, vivify_437
    $P1285 = root_new ['parrot';'ResizablePMCArray']
  vivify_437:
    set $P1286, $P1285[0]
    unless_null $P1286, vivify_438
    $P1286 = root_new ['parrot';'ResizablePMCArray']
  vivify_438:
    set $P1287, $P1286[0]
    unless_null $P1287, vivify_439
    new $P1287, "Undef"
  vivify_439:
    get_hll_global $P1288, ["PAST"], "Var"
    find_lex $P1289, "$name"
    find_lex $P1290, "$past"
    $P1291 = $P1288."new"($P1289 :named("name"), 1 :named("isdecl"), $P1290 :named("viviself"), "lexical" :named("scope"))
    $P1287."push"($P1291)
.annotate 'line', 459
    get_global $P1292, "@BLOCK"
    unless_null $P1292, vivify_440
    $P1292 = root_new ['parrot';'ResizablePMCArray']
  vivify_440:
    set $P1293, $P1292[0]
    unless_null $P1293, vivify_441
    new $P1293, "Undef"
  vivify_441:
    find_lex $P1294, "$name"
    $P1293."symbol"($P1294, "lexical" :named("scope"))
.annotate 'line', 460
    get_hll_global $P1295, ["PAST"], "Var"
    find_lex $P1296, "$name"
    $P1297 = $P1295."new"($P1296 :named("name"))
    store_lex "$past", $P1297
.annotate 'line', 456
    set $P1280, $P1297
  if_1281_end:
.annotate 'line', 453
    .return ($P1280)
.end


.namespace ["NQP";"Actions"]
.sub "_block1311"  :anon :subid("78_1284728484.24945") :outer("76_1284728484.24945")
    .param pmc param_1313
.annotate 'line', 466
    .lex "$_", param_1313
    find_lex $P1314, "$_"
    $P1315 = $P1314."ast"()
    find_lex $P1316, "$/"
    $P1317 = $P1315($P1316)
    .return ($P1317)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "method_def"  :subid("79_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1325
.annotate 'line', 471
    .const 'Sub' $P1377 = "81_1284728484.24945" 
    capture_lex $P1377
    .const 'Sub' $P1346 = "80_1284728484.24945" 
    capture_lex $P1346
    new $P1324, 'ExceptionHandler'
    set_addr $P1324, control_1323
    $P1324."handle_types"(.CONTROL_RETURN)
    push_eh $P1324
    .lex "self", self
    .lex "$/", param_1325
.annotate 'line', 472
    new $P1326, "Undef"
    .lex "$past", $P1326
    find_lex $P1327, "$/"
    unless_null $P1327, vivify_448
    $P1327 = root_new ['parrot';'Hash']
  vivify_448:
    set $P1328, $P1327["blockoid"]
    unless_null $P1328, vivify_449
    new $P1328, "Undef"
  vivify_449:
    $P1329 = $P1328."ast"()
    store_lex "$past", $P1329
.annotate 'line', 473
    find_lex $P1330, "$past"
    $P1330."blocktype"("method")
.annotate 'line', 474
    find_dynamic_lex $P1332, "$*SCOPE"
    unless_null $P1332, vivify_450
    get_hll_global $P1332, "$SCOPE"
    unless_null $P1332, vivify_451
    die "Contextual $*SCOPE not found"
  vivify_451:
  vivify_450:
    set $S1333, $P1332
    iseq $I1334, $S1333, "our"
    unless $I1334, if_1331_end
.annotate 'line', 475
    find_lex $P1335, "$past"
    $P1335."pirflags"(":nsentry")
  if_1331_end:
.annotate 'line', 477
    find_lex $P1336, "$past"
    $P1336."control"("return_pir")
.annotate 'line', 478
    find_lex $P1337, "$past"
    unless_null $P1337, vivify_452
    $P1337 = root_new ['parrot';'ResizablePMCArray']
  vivify_452:
    set $P1338, $P1337[0]
    unless_null $P1338, vivify_453
    new $P1338, "Undef"
  vivify_453:
    get_hll_global $P1339, ["PAST"], "Op"
    $P1340 = $P1339."new"("    .lex \"self\", self" :named("inline"))
    $P1338."unshift"($P1340)
.annotate 'line', 479
    find_lex $P1341, "$past"
    $P1341."symbol"("self", "lexical" :named("scope"))
.annotate 'line', 480
    find_lex $P1343, "$/"
    unless_null $P1343, vivify_454
    $P1343 = root_new ['parrot';'Hash']
  vivify_454:
    set $P1344, $P1343["deflongname"]
    unless_null $P1344, vivify_455
    new $P1344, "Undef"
  vivify_455:
    unless $P1344, if_1342_end
    .const 'Sub' $P1346 = "80_1284728484.24945" 
    capture_lex $P1346
    $P1346()
  if_1342_end:
.annotate 'line', 484
    find_dynamic_lex $P1358, "$*MULTINESS"
    unless_null $P1358, vivify_459
    get_hll_global $P1358, "$MULTINESS"
    unless_null $P1358, vivify_460
    die "Contextual $*MULTINESS not found"
  vivify_460:
  vivify_459:
    set $S1359, $P1358
    iseq $I1360, $S1359, "multi"
    unless $I1360, if_1357_end
    find_lex $P1361, "$past"
    $P1362 = $P1361."multi"()
    $P1362."unshift"("_")
  if_1357_end:
.annotate 'line', 485
    find_lex $P1363, "$past"
    find_lex $P1364, "$past"
    unless_null $P1364, vivify_461
    $P1364 = root_new ['parrot';'Hash']
    store_lex "$past", $P1364
  vivify_461:
    set $P1364["block_past"], $P1363
.annotate 'line', 486
    find_lex $P1365, "$/"
    find_lex $P1366, "$past"
    $P1365."!make"($P1366)
.annotate 'line', 487
    find_lex $P1369, "$/"
    unless_null $P1369, vivify_462
    $P1369 = root_new ['parrot';'Hash']
  vivify_462:
    set $P1370, $P1369["trait"]
    unless_null $P1370, vivify_463
    new $P1370, "Undef"
  vivify_463:
    if $P1370, if_1368
    set $P1367, $P1370
    goto if_1368_end
  if_1368:
.annotate 'line', 488
    find_lex $P1372, "$/"
    unless_null $P1372, vivify_464
    $P1372 = root_new ['parrot';'Hash']
  vivify_464:
    set $P1373, $P1372["trait"]
    unless_null $P1373, vivify_465
    new $P1373, "Undef"
  vivify_465:
    defined $I1374, $P1373
    unless $I1374, for_undef_466
    iter $P1371, $P1373
    new $P1384, 'ExceptionHandler'
    set_addr $P1384, loop1383_handler
    $P1384."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1384
  loop1383_test:
    unless $P1371, loop1383_done
    shift $P1375, $P1371
  loop1383_redo:
    .const 'Sub' $P1377 = "81_1284728484.24945" 
    capture_lex $P1377
    $P1377($P1375)
  loop1383_next:
    goto loop1383_test
  loop1383_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1385, exception, 'type'
    eq $P1385, .CONTROL_LOOP_NEXT, loop1383_next
    eq $P1385, .CONTROL_LOOP_REDO, loop1383_redo
  loop1383_done:
    pop_eh 
  for_undef_466:
.annotate 'line', 487
    set $P1367, $P1371
  if_1368_end:
.annotate 'line', 471
    .return ($P1367)
  control_1323:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1386, exception, "payload"
    .return ($P1386)
.end


.namespace ["NQP";"Actions"]
.sub "_block1345"  :anon :subid("80_1284728484.24945") :outer("79_1284728484.24945")
.annotate 'line', 481
    new $P1347, "Undef"
    .lex "$name", $P1347
    find_lex $P1348, "$/"
    unless_null $P1348, vivify_456
    $P1348 = root_new ['parrot';'Hash']
  vivify_456:
    set $P1349, $P1348["deflongname"]
    unless_null $P1349, vivify_457
    $P1349 = root_new ['parrot';'ResizablePMCArray']
  vivify_457:
    set $P1350, $P1349[0]
    unless_null $P1350, vivify_458
    new $P1350, "Undef"
  vivify_458:
    $P1351 = $P1350."ast"()
    set $S1352, $P1351
    new $P1353, 'String'
    set $P1353, $S1352
    store_lex "$name", $P1353
.annotate 'line', 482
    find_lex $P1354, "$past"
    find_lex $P1355, "$name"
    $P1356 = $P1354."name"($P1355)
.annotate 'line', 480
    .return ($P1356)
.end


.namespace ["NQP";"Actions"]
.sub "_block1376"  :anon :subid("81_1284728484.24945") :outer("79_1284728484.24945")
    .param pmc param_1378
.annotate 'line', 488
    .lex "$_", param_1378
    find_lex $P1379, "$_"
    $P1380 = $P1379."ast"()
    find_lex $P1381, "$/"
    $P1382 = $P1380($P1381)
    .return ($P1382)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "signature"  :subid("82_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1390
.annotate 'line', 493
    .const 'Sub' $P1416 = "84_1284728484.24945" 
    capture_lex $P1416
    .const 'Sub' $P1401 = "83_1284728484.24945" 
    capture_lex $P1401
    new $P1389, 'ExceptionHandler'
    set_addr $P1389, control_1388
    $P1389."handle_types"(.CONTROL_RETURN)
    push_eh $P1389
    .lex "self", self
    .lex "$/", param_1390
.annotate 'line', 494
    new $P1391, "Undef"
    .lex "$BLOCKINIT", $P1391
    get_global $P1392, "@BLOCK"
    unless_null $P1392, vivify_467
    $P1392 = root_new ['parrot';'ResizablePMCArray']
  vivify_467:
    set $P1393, $P1392[0]
    unless_null $P1393, vivify_468
    $P1393 = root_new ['parrot';'ResizablePMCArray']
  vivify_468:
    set $P1394, $P1393[0]
    unless_null $P1394, vivify_469
    new $P1394, "Undef"
  vivify_469:
    store_lex "$BLOCKINIT", $P1394
.annotate 'line', 496
    find_lex $P1396, "$/"
    unless_null $P1396, vivify_470
    $P1396 = root_new ['parrot';'Hash']
  vivify_470:
    set $P1397, $P1396["parameter"]
    unless_null $P1397, vivify_471
    new $P1397, "Undef"
  vivify_471:
    defined $I1398, $P1397
    unless $I1398, for_undef_472
    iter $P1395, $P1397
    new $P1408, 'ExceptionHandler'
    set_addr $P1408, loop1407_handler
    $P1408."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1408
  loop1407_test:
    unless $P1395, loop1407_done
    shift $P1399, $P1395
  loop1407_redo:
    .const 'Sub' $P1401 = "83_1284728484.24945" 
    capture_lex $P1401
    $P1401($P1399)
  loop1407_next:
    goto loop1407_test
  loop1407_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1409, exception, 'type'
    eq $P1409, .CONTROL_LOOP_NEXT, loop1407_next
    eq $P1409, .CONTROL_LOOP_REDO, loop1407_redo
  loop1407_done:
    pop_eh 
  for_undef_472:
.annotate 'line', 499
    find_dynamic_lex $P1412, "$*MULTINESS"
    unless_null $P1412, vivify_473
    get_hll_global $P1412, "$MULTINESS"
    unless_null $P1412, vivify_474
    die "Contextual $*MULTINESS not found"
  vivify_474:
  vivify_473:
    set $S1413, $P1412
    iseq $I1414, $S1413, "multi"
    if $I1414, if_1411
    new $P1410, 'Integer'
    set $P1410, $I1414
    goto if_1411_end
  if_1411:
    .const 'Sub' $P1416 = "84_1284728484.24945" 
    capture_lex $P1416
    $P1454 = $P1416()
    set $P1410, $P1454
  if_1411_end:
.annotate 'line', 493
    .return ($P1410)
  control_1388:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1455, exception, "payload"
    .return ($P1455)
.end


.namespace ["NQP";"Actions"]
.sub "_block1400"  :anon :subid("83_1284728484.24945") :outer("82_1284728484.24945")
    .param pmc param_1402
.annotate 'line', 496
    .lex "$_", param_1402
    find_lex $P1403, "$BLOCKINIT"
    find_lex $P1404, "$_"
    $P1405 = $P1404."ast"()
    $P1406 = $P1403."push"($P1405)
    .return ($P1406)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1415"  :anon :subid("84_1284728484.24945") :outer("82_1284728484.24945")
.annotate 'line', 499
    .const 'Sub' $P1425 = "85_1284728484.24945" 
    capture_lex $P1425
.annotate 'line', 500
    $P1417 = root_new ['parrot';'ResizablePMCArray']
    .lex "@params", $P1417
.annotate 'line', 499
    find_lex $P1418, "@params"
.annotate 'line', 501
    find_lex $P1420, "$BLOCKINIT"
    $P1421 = $P1420."list"()
    defined $I1422, $P1421
    unless $I1422, for_undef_475
    iter $P1419, $P1421
    new $P1448, 'ExceptionHandler'
    set_addr $P1448, loop1447_handler
    $P1448."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1448
  loop1447_test:
    unless $P1419, loop1447_done
    shift $P1423, $P1419
  loop1447_redo:
    .const 'Sub' $P1425 = "85_1284728484.24945" 
    capture_lex $P1425
    $P1425($P1423)
  loop1447_next:
    goto loop1447_test
  loop1447_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1449, exception, 'type'
    eq $P1449, .CONTROL_LOOP_NEXT, loop1447_next
    eq $P1449, .CONTROL_LOOP_REDO, loop1447_redo
  loop1447_done:
    pop_eh 
  for_undef_475:
.annotate 'line', 505
    get_global $P1450, "@BLOCK"
    unless_null $P1450, vivify_476
    $P1450 = root_new ['parrot';'ResizablePMCArray']
  vivify_476:
    set $P1451, $P1450[0]
    unless_null $P1451, vivify_477
    new $P1451, "Undef"
  vivify_477:
    find_lex $P1452, "@params"
    $P1453 = $P1451."multi"($P1452)
.annotate 'line', 499
    .return ($P1453)
.end


.namespace ["NQP";"Actions"]
.sub "_block1424"  :anon :subid("85_1284728484.24945") :outer("84_1284728484.24945")
    .param pmc param_1426
.annotate 'line', 501
    .lex "$_", param_1426
.annotate 'line', 503
    find_lex $P1433, "$_"
    $P1434 = $P1433."slurpy"()
    unless $P1434, unless_1432
    set $P1431, $P1434
    goto unless_1432_end
  unless_1432:
    find_lex $P1435, "$_"
    $P1436 = $P1435."named"()
    set $P1431, $P1436
  unless_1432_end:
    unless $P1431, unless_1430
    set $P1429, $P1431
    goto unless_1430_end
  unless_1430:
    find_lex $P1437, "$_"
    $P1438 = $P1437."viviself"()
    set $P1429, $P1438
  unless_1430_end:
    unless $P1429, unless_1428
    set $P1427, $P1429
    goto unless_1428_end
  unless_1428:
.annotate 'line', 502
    find_lex $P1439, "@params"
    find_lex $P1441, "$_"
    $P1442 = $P1441."multitype"()
    set $P1440, $P1442
    defined $I1444, $P1440
    if $I1444, default_1443
    new $P1445, "String"
    assign $P1445, "_"
    set $P1440, $P1445
  default_1443:
    $P1446 = $P1439."push"($P1440)
    set $P1427, $P1446
  unless_1428_end:
.annotate 'line', 501
    .return ($P1427)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "parameter"  :subid("86_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1459
.annotate 'line', 509
    .const 'Sub' $P1540 = "87_1284728484.24945" 
    capture_lex $P1540
    new $P1458, 'ExceptionHandler'
    set_addr $P1458, control_1457
    $P1458."handle_types"(.CONTROL_RETURN)
    push_eh $P1458
    .lex "self", self
    .lex "$/", param_1459
.annotate 'line', 510
    new $P1460, "Undef"
    .lex "$quant", $P1460
.annotate 'line', 511
    new $P1461, "Undef"
    .lex "$past", $P1461
.annotate 'line', 510
    find_lex $P1462, "$/"
    unless_null $P1462, vivify_478
    $P1462 = root_new ['parrot';'Hash']
  vivify_478:
    set $P1463, $P1462["quant"]
    unless_null $P1463, vivify_479
    new $P1463, "Undef"
  vivify_479:
    store_lex "$quant", $P1463
    find_lex $P1464, "$past"
.annotate 'line', 512
    find_lex $P1466, "$/"
    unless_null $P1466, vivify_480
    $P1466 = root_new ['parrot';'Hash']
  vivify_480:
    set $P1467, $P1466["named_param"]
    unless_null $P1467, vivify_481
    new $P1467, "Undef"
  vivify_481:
    if $P1467, if_1465
.annotate 'line', 519
    find_lex $P1481, "$/"
    unless_null $P1481, vivify_482
    $P1481 = root_new ['parrot';'Hash']
  vivify_482:
    set $P1482, $P1481["param_var"]
    unless_null $P1482, vivify_483
    new $P1482, "Undef"
  vivify_483:
    $P1483 = $P1482."ast"()
    store_lex "$past", $P1483
.annotate 'line', 520
    find_lex $P1485, "$quant"
    set $S1486, $P1485
    iseq $I1487, $S1486, "*"
    if $I1487, if_1484
.annotate 'line', 524
    find_lex $P1496, "$quant"
    set $S1497, $P1496
    iseq $I1498, $S1497, "?"
    unless $I1498, if_1495_end
.annotate 'line', 525
    find_lex $P1499, "$past"
    find_lex $P1500, "$/"
    unless_null $P1500, vivify_484
    $P1500 = root_new ['parrot';'Hash']
  vivify_484:
    set $P1501, $P1500["param_var"]
    unless_null $P1501, vivify_485
    $P1501 = root_new ['parrot';'Hash']
  vivify_485:
    set $P1502, $P1501["sigil"]
    unless_null $P1502, vivify_486
    new $P1502, "Undef"
  vivify_486:
    $P1503 = "vivitype"($P1502)
    $P1499."viviself"($P1503)
  if_1495_end:
.annotate 'line', 524
    goto if_1484_end
  if_1484:
.annotate 'line', 521
    find_lex $P1488, "$past"
    $P1488."slurpy"(1)
.annotate 'line', 522
    find_lex $P1489, "$past"
    find_lex $P1490, "$/"
    unless_null $P1490, vivify_487
    $P1490 = root_new ['parrot';'Hash']
  vivify_487:
    set $P1491, $P1490["param_var"]
    unless_null $P1491, vivify_488
    $P1491 = root_new ['parrot';'Hash']
  vivify_488:
    set $P1492, $P1491["sigil"]
    unless_null $P1492, vivify_489
    new $P1492, "Undef"
  vivify_489:
    set $S1493, $P1492
    iseq $I1494, $S1493, "%"
    $P1489."named"($I1494)
  if_1484_end:
.annotate 'line', 518
    goto if_1465_end
  if_1465:
.annotate 'line', 513
    find_lex $P1468, "$/"
    unless_null $P1468, vivify_490
    $P1468 = root_new ['parrot';'Hash']
  vivify_490:
    set $P1469, $P1468["named_param"]
    unless_null $P1469, vivify_491
    new $P1469, "Undef"
  vivify_491:
    $P1470 = $P1469."ast"()
    store_lex "$past", $P1470
.annotate 'line', 514
    find_lex $P1472, "$quant"
    set $S1473, $P1472
    isne $I1474, $S1473, "!"
    unless $I1474, if_1471_end
.annotate 'line', 515
    find_lex $P1475, "$past"
    find_lex $P1476, "$/"
    unless_null $P1476, vivify_492
    $P1476 = root_new ['parrot';'Hash']
  vivify_492:
    set $P1477, $P1476["named_param"]
    unless_null $P1477, vivify_493
    $P1477 = root_new ['parrot';'Hash']
  vivify_493:
    set $P1478, $P1477["param_var"]
    unless_null $P1478, vivify_494
    $P1478 = root_new ['parrot';'Hash']
  vivify_494:
    set $P1479, $P1478["sigil"]
    unless_null $P1479, vivify_495
    new $P1479, "Undef"
  vivify_495:
    $P1480 = "vivitype"($P1479)
    $P1475."viviself"($P1480)
  if_1471_end:
  if_1465_end:
.annotate 'line', 528
    find_lex $P1505, "$/"
    unless_null $P1505, vivify_496
    $P1505 = root_new ['parrot';'Hash']
  vivify_496:
    set $P1506, $P1505["default_value"]
    unless_null $P1506, vivify_497
    new $P1506, "Undef"
  vivify_497:
    unless $P1506, if_1504_end
.annotate 'line', 529
    find_lex $P1508, "$quant"
    set $S1509, $P1508
    iseq $I1510, $S1509, "*"
    unless $I1510, if_1507_end
.annotate 'line', 530
    find_lex $P1511, "$/"
    $P1512 = $P1511."CURSOR"()
    $P1512."panic"("Can't put default on slurpy parameter")
  if_1507_end:
.annotate 'line', 532
    find_lex $P1514, "$quant"
    set $S1515, $P1514
    iseq $I1516, $S1515, "!"
    unless $I1516, if_1513_end
.annotate 'line', 533
    find_lex $P1517, "$/"
    $P1518 = $P1517."CURSOR"()
    $P1518."panic"("Can't put default on required parameter")
  if_1513_end:
.annotate 'line', 535
    find_lex $P1519, "$past"
    find_lex $P1520, "$/"
    unless_null $P1520, vivify_498
    $P1520 = root_new ['parrot';'Hash']
  vivify_498:
    set $P1521, $P1520["default_value"]
    unless_null $P1521, vivify_499
    $P1521 = root_new ['parrot';'ResizablePMCArray']
  vivify_499:
    set $P1522, $P1521[0]
    unless_null $P1522, vivify_500
    $P1522 = root_new ['parrot';'Hash']
  vivify_500:
    set $P1523, $P1522["EXPR"]
    unless_null $P1523, vivify_501
    new $P1523, "Undef"
  vivify_501:
    $P1524 = $P1523."ast"()
    $P1519."viviself"($P1524)
  if_1504_end:
.annotate 'line', 537
    find_lex $P1526, "$past"
    $P1527 = $P1526."viviself"()
    if $P1527, unless_1525_end
    get_global $P1528, "@BLOCK"
    unless_null $P1528, vivify_502
    $P1528 = root_new ['parrot';'ResizablePMCArray']
  vivify_502:
    set $P1529, $P1528[0]
    unless_null $P1529, vivify_503
    new $P1529, "Undef"
  vivify_503:
    get_global $P1530, "@BLOCK"
    unless_null $P1530, vivify_504
    $P1530 = root_new ['parrot';'ResizablePMCArray']
  vivify_504:
    set $P1531, $P1530[0]
    unless_null $P1531, vivify_505
    new $P1531, "Undef"
  vivify_505:
    $P1532 = $P1531."arity"()
    set $N1533, $P1532
    new $P1534, 'Float'
    set $P1534, $N1533
    add $P1535, $P1534, 1
    $P1529."arity"($P1535)
  unless_1525_end:
.annotate 'line', 540
    find_lex $P1537, "$/"
    unless_null $P1537, vivify_506
    $P1537 = root_new ['parrot';'Hash']
  vivify_506:
    set $P1538, $P1537["typename"]
    unless_null $P1538, vivify_507
    new $P1538, "Undef"
  vivify_507:
    unless $P1538, if_1536_end
    .const 'Sub' $P1540 = "87_1284728484.24945" 
    capture_lex $P1540
    $P1540()
  if_1536_end:
.annotate 'line', 546
    find_lex $P1564, "$/"
    find_lex $P1565, "$past"
    $P1566 = $P1564."!make"($P1565)
.annotate 'line', 509
    .return ($P1566)
  control_1457:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1567, exception, "payload"
    .return ($P1567)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1539"  :anon :subid("87_1284728484.24945") :outer("86_1284728484.24945")
.annotate 'line', 540
    .const 'Sub' $P1552 = "88_1284728484.24945" 
    capture_lex $P1552
.annotate 'line', 541
    $P1541 = root_new ['parrot';'ResizablePMCArray']
    .lex "@multitype", $P1541
.annotate 'line', 540
    find_lex $P1542, "@multitype"
.annotate 'line', 542
    find_lex $P1544, "$/"
    unless_null $P1544, vivify_508
    $P1544 = root_new ['parrot';'Hash']
  vivify_508:
    set $P1545, $P1544["typename"]
    unless_null $P1545, vivify_509
    $P1545 = root_new ['parrot';'ResizablePMCArray']
  vivify_509:
    set $P1546, $P1545[0]
    unless_null $P1546, vivify_510
    $P1546 = root_new ['parrot';'Hash']
  vivify_510:
    set $P1547, $P1546["name"]
    unless_null $P1547, vivify_511
    $P1547 = root_new ['parrot';'Hash']
  vivify_511:
    set $P1548, $P1547["identifier"]
    unless_null $P1548, vivify_512
    new $P1548, "Undef"
  vivify_512:
    defined $I1549, $P1548
    unless $I1549, for_undef_513
    iter $P1543, $P1548
    new $P1559, 'ExceptionHandler'
    set_addr $P1559, loop1558_handler
    $P1559."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1559
  loop1558_test:
    unless $P1543, loop1558_done
    shift $P1550, $P1543
  loop1558_redo:
    .const 'Sub' $P1552 = "88_1284728484.24945" 
    capture_lex $P1552
    $P1552($P1550)
  loop1558_next:
    goto loop1558_test
  loop1558_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1560, exception, 'type'
    eq $P1560, .CONTROL_LOOP_NEXT, loop1558_next
    eq $P1560, .CONTROL_LOOP_REDO, loop1558_redo
  loop1558_done:
    pop_eh 
  for_undef_513:
.annotate 'line', 543
    find_lex $P1561, "$past"
    find_lex $P1562, "@multitype"
    $P1563 = $P1561."multitype"($P1562)
.annotate 'line', 540
    .return ($P1563)
.end


.namespace ["NQP";"Actions"]
.sub "_block1551"  :anon :subid("88_1284728484.24945") :outer("87_1284728484.24945")
    .param pmc param_1553
.annotate 'line', 542
    .lex "$_", param_1553
    find_lex $P1554, "@multitype"
    find_lex $P1555, "$_"
    set $S1556, $P1555
    $P1557 = $P1554."push"($S1556)
    .return ($P1557)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "param_var"  :subid("89_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1571
.annotate 'line', 549
    new $P1570, 'ExceptionHandler'
    set_addr $P1570, control_1569
    $P1570."handle_types"(.CONTROL_RETURN)
    push_eh $P1570
    .lex "self", self
    .lex "$/", param_1571
.annotate 'line', 550
    new $P1572, "Undef"
    .lex "$name", $P1572
.annotate 'line', 551
    new $P1573, "Undef"
    .lex "$past", $P1573
.annotate 'line', 550
    find_lex $P1574, "$/"
    set $S1575, $P1574
    new $P1576, 'String'
    set $P1576, $S1575
    store_lex "$name", $P1576
.annotate 'line', 551
    get_hll_global $P1577, ["PAST"], "Var"
    find_lex $P1578, "$name"
    find_lex $P1579, "$/"
    $P1580 = $P1577."new"($P1578 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1579 :named("node"))
    store_lex "$past", $P1580
.annotate 'line', 553
    get_global $P1581, "@BLOCK"
    unless_null $P1581, vivify_514
    $P1581 = root_new ['parrot';'ResizablePMCArray']
  vivify_514:
    set $P1582, $P1581[0]
    unless_null $P1582, vivify_515
    new $P1582, "Undef"
  vivify_515:
    find_lex $P1583, "$name"
    $P1582."symbol"($P1583, "lexical" :named("scope"))
.annotate 'line', 554
    find_lex $P1584, "$/"
    find_lex $P1585, "$past"
    $P1586 = $P1584."!make"($P1585)
.annotate 'line', 549
    .return ($P1586)
  control_1569:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1587, exception, "payload"
    .return ($P1587)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "named_param"  :subid("90_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1591
.annotate 'line', 557
    new $P1590, 'ExceptionHandler'
    set_addr $P1590, control_1589
    $P1590."handle_types"(.CONTROL_RETURN)
    push_eh $P1590
    .lex "self", self
    .lex "$/", param_1591
.annotate 'line', 558
    new $P1592, "Undef"
    .lex "$past", $P1592
    find_lex $P1593, "$/"
    unless_null $P1593, vivify_516
    $P1593 = root_new ['parrot';'Hash']
  vivify_516:
    set $P1594, $P1593["param_var"]
    unless_null $P1594, vivify_517
    new $P1594, "Undef"
  vivify_517:
    $P1595 = $P1594."ast"()
    store_lex "$past", $P1595
.annotate 'line', 559
    find_lex $P1596, "$past"
    find_lex $P1597, "$/"
    unless_null $P1597, vivify_518
    $P1597 = root_new ['parrot';'Hash']
  vivify_518:
    set $P1598, $P1597["param_var"]
    unless_null $P1598, vivify_519
    $P1598 = root_new ['parrot';'Hash']
  vivify_519:
    set $P1599, $P1598["name"]
    unless_null $P1599, vivify_520
    new $P1599, "Undef"
  vivify_520:
    set $S1600, $P1599
    $P1596."named"($S1600)
.annotate 'line', 560
    find_lex $P1601, "$/"
    find_lex $P1602, "$past"
    $P1603 = $P1601."!make"($P1602)
.annotate 'line', 557
    .return ($P1603)
  control_1589:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1604, exception, "payload"
    .return ($P1604)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "trait"  :subid("91_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1608
.annotate 'line', 563
    new $P1607, 'ExceptionHandler'
    set_addr $P1607, control_1606
    $P1607."handle_types"(.CONTROL_RETURN)
    push_eh $P1607
    .lex "self", self
    .lex "$/", param_1608
.annotate 'line', 564
    find_lex $P1609, "$/"
    find_lex $P1610, "$/"
    unless_null $P1610, vivify_521
    $P1610 = root_new ['parrot';'Hash']
  vivify_521:
    set $P1611, $P1610["trait_mod"]
    unless_null $P1611, vivify_522
    new $P1611, "Undef"
  vivify_522:
    $P1612 = $P1611."ast"()
    $P1613 = $P1609."!make"($P1612)
.annotate 'line', 563
    .return ($P1613)
  control_1606:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1614, exception, "payload"
    .return ($P1614)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "trait_mod:sym<is>"  :subid("92_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1618
.annotate 'line', 567
    .const 'Sub' $P1638 = "93_1284728484.24945" 
    capture_lex $P1638
    new $P1617, 'ExceptionHandler'
    set_addr $P1617, control_1616
    $P1617."handle_types"(.CONTROL_RETURN)
    push_eh $P1617
    .lex "self", self
    .lex "$/", param_1618
.annotate 'line', 568
    new $P1619, "Undef"
    .lex "$cpast", $P1619
    find_lex $P1620, "$/"
    unless_null $P1620, vivify_523
    $P1620 = root_new ['parrot';'Hash']
  vivify_523:
    set $P1621, $P1620["circumfix"]
    unless_null $P1621, vivify_524
    $P1621 = root_new ['parrot';'ResizablePMCArray']
  vivify_524:
    set $P1622, $P1621[0]
    unless_null $P1622, vivify_525
    new $P1622, "Undef"
  vivify_525:
    $P1623 = $P1622."ast"()
    store_lex "$cpast", $P1623
.annotate 'line', 569
    find_lex $P1626, "$/"
    unless_null $P1626, vivify_526
    $P1626 = root_new ['parrot';'Hash']
  vivify_526:
    set $P1627, $P1626["longname"]
    unless_null $P1627, vivify_527
    new $P1627, "Undef"
  vivify_527:
    set $S1628, $P1627
    iseq $I1629, $S1628, "pirflags"
    if $I1629, if_1625
.annotate 'line', 575
    find_lex $P1648, "$/"
    $P1649 = $P1648."CURSOR"()
    new $P1650, 'String'
    set $P1650, "Trait '"
    find_lex $P1651, "$/"
    unless_null $P1651, vivify_528
    $P1651 = root_new ['parrot';'Hash']
  vivify_528:
    set $P1652, $P1651["longname"]
    unless_null $P1652, vivify_529
    new $P1652, "Undef"
  vivify_529:
    concat $P1653, $P1650, $P1652
    concat $P1654, $P1653, "' not implemented"
    $P1655 = $P1649."panic"($P1654)
.annotate 'line', 574
    set $P1624, $P1655
.annotate 'line', 569
    goto if_1625_end
  if_1625:
.annotate 'line', 571
    get_hll_global $P1631, ["PAST"], "Val"
    find_lex $P1632, "$cpast"
    $P1633 = $P1631."ACCEPTS"($P1632)
    if $P1633, unless_1630_end
.annotate 'line', 570
    find_lex $P1634, "$/"
    $P1635 = $P1634."CURSOR"()
    $P1635."panic"("Trait 'pirflags' requires constant scalar argument")
  unless_1630_end:
.annotate 'line', 572
    find_lex $P1636, "$/"
    .const 'Sub' $P1638 = "93_1284728484.24945" 
    newclosure $P1646, $P1638
    $P1647 = $P1636."!make"($P1646)
.annotate 'line', 569
    set $P1624, $P1647
  if_1625_end:
.annotate 'line', 567
    .return ($P1624)
  control_1616:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1656, exception, "payload"
    .return ($P1656)
.end


.namespace ["NQP";"Actions"]
.sub "_block1637"  :anon :subid("93_1284728484.24945") :outer("92_1284728484.24945")
    .param pmc param_1639
.annotate 'line', 572
    .lex "$match", param_1639
    find_lex $P1640, "$match"
    $P1641 = $P1640."ast"()
    set $P1642, $P1641["block_past"]
    unless_null $P1642, vivify_530
    new $P1642, "Undef"
  vivify_530:
    find_lex $P1643, "$cpast"
    $P1644 = $P1643."value"()
    $P1645 = $P1642."pirflags"($P1644)
    .return ($P1645)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "regex_declarator"  :subid("94_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1660
    .param pmc param_1661 :optional
    .param int has_param_1661 :opt_flag
.annotate 'line', 579
    .const 'Sub' $P1731 = "96_1284728484.24945" 
    capture_lex $P1731
    .const 'Sub' $P1703 = "95_1284728484.24945" 
    capture_lex $P1703
    new $P1659, 'ExceptionHandler'
    set_addr $P1659, control_1658
    $P1659."handle_types"(.CONTROL_RETURN)
    push_eh $P1659
    .lex "self", self
    .lex "$/", param_1660
    if has_param_1661, optparam_531
    new $P1662, "Undef"
    set param_1661, $P1662
  optparam_531:
    .lex "$key", param_1661
.annotate 'line', 580
    $P1663 = root_new ['parrot';'ResizablePMCArray']
    .lex "@MODIFIERS", $P1663
.annotate 'line', 583
    new $P1664, "Undef"
    .lex "$name", $P1664
.annotate 'line', 584
    new $P1665, "Undef"
    .lex "$past", $P1665
.annotate 'line', 580

        $P1666 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1666
.annotate 'line', 583
    find_lex $P1667, "$/"
    unless_null $P1667, vivify_532
    $P1667 = root_new ['parrot';'Hash']
  vivify_532:
    set $P1668, $P1667["deflongname"]
    unless_null $P1668, vivify_533
    new $P1668, "Undef"
  vivify_533:
    $P1669 = $P1668."ast"()
    set $S1670, $P1669
    new $P1671, 'String'
    set $P1671, $S1670
    store_lex "$name", $P1671
    find_lex $P1672, "$past"
.annotate 'line', 585
    find_lex $P1674, "$/"
    unless_null $P1674, vivify_534
    $P1674 = root_new ['parrot';'Hash']
  vivify_534:
    set $P1675, $P1674["proto"]
    unless_null $P1675, vivify_535
    new $P1675, "Undef"
  vivify_535:
    if $P1675, if_1673
.annotate 'line', 612
    find_lex $P1699, "$key"
    set $S1700, $P1699
    iseq $I1701, $S1700, "open"
    if $I1701, if_1698
.annotate 'line', 625
    .const 'Sub' $P1731 = "96_1284728484.24945" 
    capture_lex $P1731
    $P1731()
    goto if_1698_end
  if_1698:
.annotate 'line', 612
    .const 'Sub' $P1703 = "95_1284728484.24945" 
    capture_lex $P1703
    $P1703()
  if_1698_end:
    goto if_1673_end
  if_1673:
.annotate 'line', 587
    get_hll_global $P1676, ["PAST"], "Stmts"
.annotate 'line', 588
    get_hll_global $P1677, ["PAST"], "Block"
    find_lex $P1678, "$name"
.annotate 'line', 589
    get_hll_global $P1679, ["PAST"], "Op"
.annotate 'line', 590
    get_hll_global $P1680, ["PAST"], "Var"
    $P1681 = $P1680."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1682, "$name"
    $P1683 = $P1679."new"($P1681, $P1682, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 589
    find_lex $P1684, "$/"
    $P1685 = $P1677."new"($P1683, $P1678 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1684 :named("node"))
.annotate 'line', 599
    get_hll_global $P1686, ["PAST"], "Block"
    new $P1687, "String"
    assign $P1687, "!PREFIX__"
    find_lex $P1688, "$name"
    concat $P1689, $P1687, $P1688
.annotate 'line', 600
    get_hll_global $P1690, ["PAST"], "Op"
.annotate 'line', 601
    get_hll_global $P1691, ["PAST"], "Var"
    $P1692 = $P1691."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1693, "$name"
    $P1694 = $P1690."new"($P1692, $P1693, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 600
    find_lex $P1695, "$/"
    $P1696 = $P1686."new"($P1694, $P1689 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1695 :named("node"))
.annotate 'line', 599
    $P1697 = $P1676."new"($P1685, $P1696)
.annotate 'line', 587
    store_lex "$past", $P1697
  if_1673_end:
.annotate 'line', 639
    find_lex $P1752, "$/"
    find_lex $P1753, "$past"
    $P1754 = $P1752."!make"($P1753)
.annotate 'line', 579
    .return ($P1754)
  control_1658:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1755, exception, "payload"
    .return ($P1755)
.end


.namespace ["NQP";"Actions"]
.sub "_block1730"  :anon :subid("96_1284728484.24945") :outer("94_1284728484.24945")
.annotate 'line', 626
    new $P1732, "Undef"
    .lex "$regex", $P1732
.annotate 'line', 627
    get_hll_global $P1733, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1734, "$/"
    unless_null $P1734, vivify_536
    $P1734 = root_new ['parrot';'Hash']
  vivify_536:
    set $P1735, $P1734["p6regex"]
    unless_null $P1735, vivify_537
    new $P1735, "Undef"
  vivify_537:
    $P1736 = $P1735."ast"()
    get_global $P1737, "@BLOCK"
    $P1738 = $P1737."shift"()
    $P1739 = $P1733($P1736, $P1738)
    store_lex "$regex", $P1739
.annotate 'line', 628
    find_lex $P1740, "$regex"
    find_lex $P1741, "$name"
    $P1740."name"($P1741)
.annotate 'line', 630
    get_hll_global $P1742, ["PAST"], "Op"
.annotate 'line', 632
    get_hll_global $P1743, ["PAST"], "Var"
    new $P1744, "ResizablePMCArray"
    push $P1744, "Regex"
    $P1745 = $P1743."new"("Method" :named("name"), $P1744 :named("namespace"), "package" :named("scope"))
    find_lex $P1746, "$regex"
    $P1747 = $P1742."new"($P1745, $P1746, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate 'line', 630
    store_lex "$past", $P1747
.annotate 'line', 636
    find_lex $P1748, "$regex"
    find_lex $P1749, "$past"
    unless_null $P1749, vivify_538
    $P1749 = root_new ['parrot';'Hash']
    store_lex "$past", $P1749
  vivify_538:
    set $P1749["sink"], $P1748
.annotate 'line', 637
    find_lex $P1750, "@MODIFIERS"
    $P1751 = $P1750."shift"()
.annotate 'line', 625
    .return ($P1751)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1702"  :anon :subid("95_1284728484.24945") :outer("94_1284728484.24945")
.annotate 'line', 613
    $P1704 = root_new ['parrot';'Hash']
    .lex "%h", $P1704
.annotate 'line', 612
    find_lex $P1705, "%h"
.annotate 'line', 614
    find_lex $P1707, "$/"
    unless_null $P1707, vivify_539
    $P1707 = root_new ['parrot';'Hash']
  vivify_539:
    set $P1708, $P1707["sym"]
    unless_null $P1708, vivify_540
    new $P1708, "Undef"
  vivify_540:
    set $S1709, $P1708
    iseq $I1710, $S1709, "token"
    unless $I1710, if_1706_end
    new $P1711, "Integer"
    assign $P1711, 1
    find_lex $P1712, "%h"
    unless_null $P1712, vivify_541
    $P1712 = root_new ['parrot';'Hash']
    store_lex "%h", $P1712
  vivify_541:
    set $P1712["r"], $P1711
  if_1706_end:
.annotate 'line', 615
    find_lex $P1714, "$/"
    unless_null $P1714, vivify_542
    $P1714 = root_new ['parrot';'Hash']
  vivify_542:
    set $P1715, $P1714["sym"]
    unless_null $P1715, vivify_543
    new $P1715, "Undef"
  vivify_543:
    set $S1716, $P1715
    iseq $I1717, $S1716, "rule"
    unless $I1717, if_1713_end
    new $P1718, "Integer"
    assign $P1718, 1
    find_lex $P1719, "%h"
    unless_null $P1719, vivify_544
    $P1719 = root_new ['parrot';'Hash']
    store_lex "%h", $P1719
  vivify_544:
    set $P1719["r"], $P1718
    new $P1720, "Integer"
    assign $P1720, 1
    find_lex $P1721, "%h"
    unless_null $P1721, vivify_545
    $P1721 = root_new ['parrot';'Hash']
    store_lex "%h", $P1721
  vivify_545:
    set $P1721["s"], $P1720
  if_1713_end:
.annotate 'line', 616
    find_lex $P1722, "@MODIFIERS"
    find_lex $P1723, "%h"
    $P1722."unshift"($P1723)
.annotate 'line', 617

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate 'line', 621
    get_global $P1724, "@BLOCK"
    unless_null $P1724, vivify_546
    $P1724 = root_new ['parrot';'ResizablePMCArray']
  vivify_546:
    set $P1725, $P1724[0]
    unless_null $P1725, vivify_547
    new $P1725, "Undef"
  vivify_547:
    $P1725."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate 'line', 622
    get_global $P1726, "@BLOCK"
    unless_null $P1726, vivify_548
    $P1726 = root_new ['parrot';'ResizablePMCArray']
  vivify_548:
    set $P1727, $P1726[0]
    unless_null $P1727, vivify_549
    new $P1727, "Undef"
  vivify_549:
    $P1727."symbol"("$/", "lexical" :named("scope"))
.annotate 'line', 623
    new $P1728, "Exception"
    set $P1728['type'], .CONTROL_RETURN
    new $P1729, "Integer"
    assign $P1729, 0
    setattribute $P1728, 'payload', $P1729
    throw $P1728
.annotate 'line', 612
    .return ()
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "dotty"  :subid("97_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1759
.annotate 'line', 643
    new $P1758, 'ExceptionHandler'
    set_addr $P1758, control_1757
    $P1758."handle_types"(.CONTROL_RETURN)
    push_eh $P1758
    .lex "self", self
    .lex "$/", param_1759
.annotate 'line', 644
    new $P1760, "Undef"
    .lex "$past", $P1760
    find_lex $P1763, "$/"
    unless_null $P1763, vivify_550
    $P1763 = root_new ['parrot';'Hash']
  vivify_550:
    set $P1764, $P1763["args"]
    unless_null $P1764, vivify_551
    new $P1764, "Undef"
  vivify_551:
    if $P1764, if_1762
    get_hll_global $P1769, ["PAST"], "Op"
    find_lex $P1770, "$/"
    $P1771 = $P1769."new"($P1770 :named("node"))
    set $P1761, $P1771
    goto if_1762_end
  if_1762:
    find_lex $P1765, "$/"
    unless_null $P1765, vivify_552
    $P1765 = root_new ['parrot';'Hash']
  vivify_552:
    set $P1766, $P1765["args"]
    unless_null $P1766, vivify_553
    $P1766 = root_new ['parrot';'ResizablePMCArray']
  vivify_553:
    set $P1767, $P1766[0]
    unless_null $P1767, vivify_554
    new $P1767, "Undef"
  vivify_554:
    $P1768 = $P1767."ast"()
    set $P1761, $P1768
  if_1762_end:
    store_lex "$past", $P1761
.annotate 'line', 645
    find_lex $P1772, "$past"
    find_lex $P1775, "$/"
    unless_null $P1775, vivify_555
    $P1775 = root_new ['parrot';'Hash']
  vivify_555:
    set $P1776, $P1775["quote"]
    unless_null $P1776, vivify_556
    new $P1776, "Undef"
  vivify_556:
    if $P1776, if_1774
    find_lex $P1780, "$/"
    unless_null $P1780, vivify_557
    $P1780 = root_new ['parrot';'Hash']
  vivify_557:
    set $P1781, $P1780["longname"]
    unless_null $P1781, vivify_558
    new $P1781, "Undef"
  vivify_558:
    set $S1782, $P1781
    new $P1773, 'String'
    set $P1773, $S1782
    goto if_1774_end
  if_1774:
    find_lex $P1777, "$/"
    unless_null $P1777, vivify_559
    $P1777 = root_new ['parrot';'Hash']
  vivify_559:
    set $P1778, $P1777["quote"]
    unless_null $P1778, vivify_560
    new $P1778, "Undef"
  vivify_560:
    $P1779 = $P1778."ast"()
    set $P1773, $P1779
  if_1774_end:
    $P1772."name"($P1773)
.annotate 'line', 646
    find_lex $P1783, "$past"
    $P1783."pasttype"("callmethod")
.annotate 'line', 647
    find_lex $P1784, "$/"
    find_lex $P1785, "$past"
    $P1786 = $P1784."!make"($P1785)
.annotate 'line', 643
    .return ($P1786)
  control_1757:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1787, exception, "payload"
    .return ($P1787)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<self>"  :subid("98_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1791
.annotate 'line', 652
    new $P1790, 'ExceptionHandler'
    set_addr $P1790, control_1789
    $P1790."handle_types"(.CONTROL_RETURN)
    push_eh $P1790
    .lex "self", self
    .lex "$/", param_1791
.annotate 'line', 653
    find_lex $P1792, "$/"
    get_hll_global $P1793, ["PAST"], "Var"
    $P1794 = $P1793."new"("self" :named("name"))
    $P1795 = $P1792."!make"($P1794)
.annotate 'line', 652
    .return ($P1795)
  control_1789:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1796, exception, "payload"
    .return ($P1796)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<identifier>"  :subid("99_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1800
.annotate 'line', 656
    new $P1799, 'ExceptionHandler'
    set_addr $P1799, control_1798
    $P1799."handle_types"(.CONTROL_RETURN)
    push_eh $P1799
    .lex "self", self
    .lex "$/", param_1800
.annotate 'line', 657
    new $P1801, "Undef"
    .lex "$past", $P1801
    find_lex $P1802, "$/"
    unless_null $P1802, vivify_561
    $P1802 = root_new ['parrot';'Hash']
  vivify_561:
    set $P1803, $P1802["args"]
    unless_null $P1803, vivify_562
    new $P1803, "Undef"
  vivify_562:
    $P1804 = $P1803."ast"()
    store_lex "$past", $P1804
.annotate 'line', 658
    find_lex $P1805, "$past"
    find_lex $P1806, "$/"
    unless_null $P1806, vivify_563
    $P1806 = root_new ['parrot';'Hash']
  vivify_563:
    set $P1807, $P1806["deflongname"]
    unless_null $P1807, vivify_564
    new $P1807, "Undef"
  vivify_564:
    set $S1808, $P1807
    $P1805."name"($S1808)
.annotate 'line', 659
    find_lex $P1809, "$/"
    find_lex $P1810, "$past"
    $P1811 = $P1809."!make"($P1810)
.annotate 'line', 656
    .return ($P1811)
  control_1798:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1812, exception, "payload"
    .return ($P1812)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<name>"  :subid("100_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1816
.annotate 'line', 662
    new $P1815, 'ExceptionHandler'
    set_addr $P1815, control_1814
    $P1815."handle_types"(.CONTROL_RETURN)
    push_eh $P1815
    .lex "self", self
    .lex "$/", param_1816
.annotate 'line', 663
    $P1817 = root_new ['parrot';'ResizablePMCArray']
    .lex "@ns", $P1817
.annotate 'line', 664
    new $P1818, "Undef"
    .lex "$name", $P1818
.annotate 'line', 666
    new $P1819, "Undef"
    .lex "$var", $P1819
.annotate 'line', 668
    new $P1820, "Undef"
    .lex "$past", $P1820
.annotate 'line', 663
    find_lex $P1821, "$/"
    unless_null $P1821, vivify_565
    $P1821 = root_new ['parrot';'Hash']
  vivify_565:
    set $P1822, $P1821["name"]
    unless_null $P1822, vivify_566
    $P1822 = root_new ['parrot';'Hash']
  vivify_566:
    set $P1823, $P1822["identifier"]
    unless_null $P1823, vivify_567
    new $P1823, "Undef"
  vivify_567:
    clone $P1824, $P1823
    store_lex "@ns", $P1824
.annotate 'line', 664
    find_lex $P1825, "@ns"
    $P1826 = $P1825."pop"()
    store_lex "$name", $P1826
.annotate 'line', 665
    find_lex $P1830, "@ns"
    if $P1830, if_1829
    set $P1828, $P1830
    goto if_1829_end
  if_1829:
    find_lex $P1831, "@ns"
    unless_null $P1831, vivify_568
    $P1831 = root_new ['parrot';'ResizablePMCArray']
  vivify_568:
    set $P1832, $P1831[0]
    unless_null $P1832, vivify_569
    new $P1832, "Undef"
  vivify_569:
    set $S1833, $P1832
    iseq $I1834, $S1833, "GLOBAL"
    new $P1828, 'Integer'
    set $P1828, $I1834
  if_1829_end:
    unless $P1828, if_1827_end
    find_lex $P1835, "@ns"
    $P1835."shift"()
  if_1827_end:
.annotate 'line', 667
    get_hll_global $P1836, ["PAST"], "Var"
    find_lex $P1837, "$name"
    set $S1838, $P1837
    find_lex $P1839, "@ns"
    $P1840 = $P1836."new"($S1838 :named("name"), $P1839 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1840
.annotate 'line', 668
    find_lex $P1841, "$var"
    store_lex "$past", $P1841
.annotate 'line', 669
    find_lex $P1843, "$/"
    unless_null $P1843, vivify_570
    $P1843 = root_new ['parrot';'Hash']
  vivify_570:
    set $P1844, $P1843["args"]
    unless_null $P1844, vivify_571
    new $P1844, "Undef"
  vivify_571:
    unless $P1844, if_1842_end
.annotate 'line', 670
    find_lex $P1845, "$/"
    unless_null $P1845, vivify_572
    $P1845 = root_new ['parrot';'Hash']
  vivify_572:
    set $P1846, $P1845["args"]
    unless_null $P1846, vivify_573
    $P1846 = root_new ['parrot';'ResizablePMCArray']
  vivify_573:
    set $P1847, $P1846[0]
    unless_null $P1847, vivify_574
    new $P1847, "Undef"
  vivify_574:
    $P1848 = $P1847."ast"()
    store_lex "$past", $P1848
.annotate 'line', 671
    find_lex $P1849, "$past"
    find_lex $P1850, "$var"
    $P1849."unshift"($P1850)
  if_1842_end:
.annotate 'line', 673
    find_lex $P1851, "$/"
    find_lex $P1852, "$past"
    $P1853 = $P1851."!make"($P1852)
.annotate 'line', 662
    .return ($P1853)
  control_1814:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1854, exception, "payload"
    .return ($P1854)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<pir::op>"  :subid("101_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1858
.annotate 'line', 676
    new $P1857, 'ExceptionHandler'
    set_addr $P1857, control_1856
    $P1857."handle_types"(.CONTROL_RETURN)
    push_eh $P1857
    .lex "self", self
    .lex "$/", param_1858
.annotate 'line', 677
    new $P1859, "Undef"
    .lex "$past", $P1859
.annotate 'line', 678
    new $P1860, "Undef"
    .lex "$pirop", $P1860
.annotate 'line', 677
    find_lex $P1863, "$/"
    unless_null $P1863, vivify_575
    $P1863 = root_new ['parrot';'Hash']
  vivify_575:
    set $P1864, $P1863["args"]
    unless_null $P1864, vivify_576
    new $P1864, "Undef"
  vivify_576:
    if $P1864, if_1862
    get_hll_global $P1869, ["PAST"], "Op"
    find_lex $P1870, "$/"
    $P1871 = $P1869."new"($P1870 :named("node"))
    set $P1861, $P1871
    goto if_1862_end
  if_1862:
    find_lex $P1865, "$/"
    unless_null $P1865, vivify_577
    $P1865 = root_new ['parrot';'Hash']
  vivify_577:
    set $P1866, $P1865["args"]
    unless_null $P1866, vivify_578
    $P1866 = root_new ['parrot';'ResizablePMCArray']
  vivify_578:
    set $P1867, $P1866[0]
    unless_null $P1867, vivify_579
    new $P1867, "Undef"
  vivify_579:
    $P1868 = $P1867."ast"()
    set $P1861, $P1868
  if_1862_end:
    store_lex "$past", $P1861
.annotate 'line', 678
    find_lex $P1872, "$/"
    unless_null $P1872, vivify_580
    $P1872 = root_new ['parrot';'Hash']
  vivify_580:
    set $P1873, $P1872["op"]
    unless_null $P1873, vivify_581
    new $P1873, "Undef"
  vivify_581:
    set $S1874, $P1873
    new $P1875, 'String'
    set $P1875, $S1874
    store_lex "$pirop", $P1875
.annotate 'line', 679

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1876 = box $S0
    
    store_lex "$pirop", $P1876
.annotate 'line', 686
    find_lex $P1877, "$past"
    find_lex $P1878, "$pirop"
    $P1877."pirop"($P1878)
.annotate 'line', 687
    find_lex $P1879, "$past"
    $P1879."pasttype"("pirop")
.annotate 'line', 688
    find_lex $P1880, "$/"
    find_lex $P1881, "$past"
    $P1882 = $P1880."!make"($P1881)
.annotate 'line', 676
    .return ($P1882)
  control_1856:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1883, exception, "payload"
    .return ($P1883)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "args"  :subid("102_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1887
.annotate 'line', 691
    new $P1886, 'ExceptionHandler'
    set_addr $P1886, control_1885
    $P1886."handle_types"(.CONTROL_RETURN)
    push_eh $P1886
    .lex "self", self
    .lex "$/", param_1887
    find_lex $P1888, "$/"
    find_lex $P1889, "$/"
    unless_null $P1889, vivify_582
    $P1889 = root_new ['parrot';'Hash']
  vivify_582:
    set $P1890, $P1889["arglist"]
    unless_null $P1890, vivify_583
    new $P1890, "Undef"
  vivify_583:
    $P1891 = $P1890."ast"()
    $P1892 = $P1888."!make"($P1891)
    .return ($P1892)
  control_1885:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1893, exception, "payload"
    .return ($P1893)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "arglist"  :subid("103_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_1897
.annotate 'line', 693
    .const 'Sub' $P1908 = "104_1284728484.24945" 
    capture_lex $P1908
    new $P1896, 'ExceptionHandler'
    set_addr $P1896, control_1895
    $P1896."handle_types"(.CONTROL_RETURN)
    push_eh $P1896
    .lex "self", self
    .lex "$/", param_1897
.annotate 'line', 694
    new $P1898, "Undef"
    .lex "$past", $P1898
.annotate 'line', 702
    new $P1899, "Undef"
    .lex "$i", $P1899
.annotate 'line', 703
    new $P1900, "Undef"
    .lex "$n", $P1900
.annotate 'line', 694
    get_hll_global $P1901, ["PAST"], "Op"
    find_lex $P1902, "$/"
    $P1903 = $P1901."new"("call" :named("pasttype"), $P1902 :named("node"))
    store_lex "$past", $P1903
.annotate 'line', 695
    find_lex $P1905, "$/"
    unless_null $P1905, vivify_584
    $P1905 = root_new ['parrot';'Hash']
  vivify_584:
    set $P1906, $P1905["EXPR"]
    unless_null $P1906, vivify_585
    new $P1906, "Undef"
  vivify_585:
    unless $P1906, if_1904_end
    .const 'Sub' $P1908 = "104_1284728484.24945" 
    capture_lex $P1908
    $P1908()
  if_1904_end:
.annotate 'line', 702
    new $P1940, "Integer"
    assign $P1940, 0
    store_lex "$i", $P1940
.annotate 'line', 703
    find_lex $P1941, "$past"
    $P1942 = $P1941."list"()
    set $N1943, $P1942
    new $P1944, 'Float'
    set $P1944, $N1943
    store_lex "$n", $P1944
.annotate 'line', 704
    new $P1992, 'ExceptionHandler'
    set_addr $P1992, loop1991_handler
    $P1992."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1992
  loop1991_test:
    find_lex $P1945, "$i"
    set $N1946, $P1945
    find_lex $P1947, "$n"
    set $N1948, $P1947
    islt $I1949, $N1946, $N1948
    unless $I1949, loop1991_done
  loop1991_redo:
.annotate 'line', 705
    find_lex $P1951, "$i"
    set $I1952, $P1951
    find_lex $P1953, "$past"
    unless_null $P1953, vivify_589
    $P1953 = root_new ['parrot';'ResizablePMCArray']
  vivify_589:
    set $P1954, $P1953[$I1952]
    unless_null $P1954, vivify_590
    new $P1954, "Undef"
  vivify_590:
    $S1955 = $P1954."name"()
    iseq $I1956, $S1955, "&prefix:<|>"
    unless $I1956, if_1950_end
.annotate 'line', 706
    find_lex $P1957, "$i"
    set $I1958, $P1957
    find_lex $P1959, "$past"
    unless_null $P1959, vivify_591
    $P1959 = root_new ['parrot';'ResizablePMCArray']
  vivify_591:
    set $P1960, $P1959[$I1958]
    unless_null $P1960, vivify_592
    $P1960 = root_new ['parrot';'ResizablePMCArray']
  vivify_592:
    set $P1961, $P1960[0]
    unless_null $P1961, vivify_593
    new $P1961, "Undef"
  vivify_593:
    find_lex $P1962, "$i"
    set $I1963, $P1962
    find_lex $P1964, "$past"
    unless_null $P1964, vivify_594
    $P1964 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$past", $P1964
  vivify_594:
    set $P1964[$I1963], $P1961
.annotate 'line', 707
    find_lex $P1965, "$i"
    set $I1966, $P1965
    find_lex $P1967, "$past"
    unless_null $P1967, vivify_595
    $P1967 = root_new ['parrot';'ResizablePMCArray']
  vivify_595:
    set $P1968, $P1967[$I1966]
    unless_null $P1968, vivify_596
    new $P1968, "Undef"
  vivify_596:
    $P1968."flat"(1)
.annotate 'line', 708
    find_lex $P1972, "$i"
    set $I1973, $P1972
    find_lex $P1974, "$past"
    unless_null $P1974, vivify_597
    $P1974 = root_new ['parrot';'ResizablePMCArray']
  vivify_597:
    set $P1975, $P1974[$I1973]
    unless_null $P1975, vivify_598
    new $P1975, "Undef"
  vivify_598:
    get_hll_global $P1976, ["PAST"], "Val"
    $P1977 = $P1975."isa"($P1976)
    if $P1977, if_1971
    set $P1970, $P1977
    goto if_1971_end
  if_1971:
.annotate 'line', 709
    find_lex $P1978, "$i"
    set $I1979, $P1978
    find_lex $P1980, "$past"
    unless_null $P1980, vivify_599
    $P1980 = root_new ['parrot';'ResizablePMCArray']
  vivify_599:
    set $P1981, $P1980[$I1979]
    unless_null $P1981, vivify_600
    new $P1981, "Undef"
  vivify_600:
    $S1982 = $P1981."name"()
    substr $S1983, $S1982, 0, 1
    iseq $I1984, $S1983, "%"
    new $P1970, 'Integer'
    set $P1970, $I1984
  if_1971_end:
    unless $P1970, if_1969_end
.annotate 'line', 710
    find_lex $P1985, "$i"
    set $I1986, $P1985
    find_lex $P1987, "$past"
    unless_null $P1987, vivify_601
    $P1987 = root_new ['parrot';'ResizablePMCArray']
  vivify_601:
    set $P1988, $P1987[$I1986]
    unless_null $P1988, vivify_602
    new $P1988, "Undef"
  vivify_602:
    $P1988."named"(1)
  if_1969_end:
  if_1950_end:
.annotate 'line', 705
    find_lex $P1989, "$i"
    clone $P1990, $P1989
    inc $P1989
  loop1991_next:
.annotate 'line', 704
    goto loop1991_test
  loop1991_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1993, exception, 'type'
    eq $P1993, .CONTROL_LOOP_NEXT, loop1991_next
    eq $P1993, .CONTROL_LOOP_REDO, loop1991_redo
  loop1991_done:
    pop_eh 
.annotate 'line', 715
    find_lex $P1994, "$/"
    find_lex $P1995, "$past"
    $P1996 = $P1994."!make"($P1995)
.annotate 'line', 693
    .return ($P1996)
  control_1895:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1997, exception, "payload"
    .return ($P1997)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1907"  :anon :subid("104_1284728484.24945") :outer("103_1284728484.24945")
.annotate 'line', 695
    .const 'Sub' $P1929 = "105_1284728484.24945" 
    capture_lex $P1929
.annotate 'line', 696
    new $P1909, "Undef"
    .lex "$expr", $P1909
    find_lex $P1910, "$/"
    unless_null $P1910, vivify_586
    $P1910 = root_new ['parrot';'Hash']
  vivify_586:
    set $P1911, $P1910["EXPR"]
    unless_null $P1911, vivify_587
    new $P1911, "Undef"
  vivify_587:
    $P1912 = $P1911."ast"()
    store_lex "$expr", $P1912
.annotate 'line', 697
    find_lex $P1917, "$expr"
    $S1918 = $P1917."name"()
    iseq $I1919, $S1918, "&infix:<,>"
    if $I1919, if_1916
    new $P1915, 'Integer'
    set $P1915, $I1919
    goto if_1916_end
  if_1916:
    find_lex $P1920, "$expr"
    $P1921 = $P1920."named"()
    isfalse $I1922, $P1921
    new $P1915, 'Integer'
    set $P1915, $I1922
  if_1916_end:
    if $P1915, if_1914
.annotate 'line', 700
    find_lex $P1937, "$past"
    find_lex $P1938, "$expr"
    $P1939 = $P1937."push"($P1938)
    set $P1913, $P1939
.annotate 'line', 697
    goto if_1914_end
  if_1914:
.annotate 'line', 698
    find_lex $P1924, "$expr"
    $P1925 = $P1924."list"()
    defined $I1926, $P1925
    unless $I1926, for_undef_588
    iter $P1923, $P1925
    new $P1935, 'ExceptionHandler'
    set_addr $P1935, loop1934_handler
    $P1935."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1935
  loop1934_test:
    unless $P1923, loop1934_done
    shift $P1927, $P1923
  loop1934_redo:
    .const 'Sub' $P1929 = "105_1284728484.24945" 
    capture_lex $P1929
    $P1929($P1927)
  loop1934_next:
    goto loop1934_test
  loop1934_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1936, exception, 'type'
    eq $P1936, .CONTROL_LOOP_NEXT, loop1934_next
    eq $P1936, .CONTROL_LOOP_REDO, loop1934_redo
  loop1934_done:
    pop_eh 
  for_undef_588:
.annotate 'line', 697
    set $P1913, $P1923
  if_1914_end:
.annotate 'line', 695
    .return ($P1913)
.end


.namespace ["NQP";"Actions"]
.sub "_block1928"  :anon :subid("105_1284728484.24945") :outer("104_1284728484.24945")
    .param pmc param_1930
.annotate 'line', 698
    .lex "$_", param_1930
    find_lex $P1931, "$past"
    find_lex $P1932, "$_"
    $P1933 = $P1931."push"($P1932)
    .return ($P1933)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<value>"  :subid("106_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2001
.annotate 'line', 719
    new $P2000, 'ExceptionHandler'
    set_addr $P2000, control_1999
    $P2000."handle_types"(.CONTROL_RETURN)
    push_eh $P2000
    .lex "self", self
    .lex "$/", param_2001
    find_lex $P2002, "$/"
    find_lex $P2003, "$/"
    unless_null $P2003, vivify_603
    $P2003 = root_new ['parrot';'Hash']
  vivify_603:
    set $P2004, $P2003["value"]
    unless_null $P2004, vivify_604
    new $P2004, "Undef"
  vivify_604:
    $P2005 = $P2004."ast"()
    $P2006 = $P2002."!make"($P2005)
    .return ($P2006)
  control_1999:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2007, exception, "payload"
    .return ($P2007)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<( )>"  :subid("107_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2011
.annotate 'line', 721
    new $P2010, 'ExceptionHandler'
    set_addr $P2010, control_2009
    $P2010."handle_types"(.CONTROL_RETURN)
    push_eh $P2010
    .lex "self", self
    .lex "$/", param_2011
.annotate 'line', 722
    find_lex $P2012, "$/"
.annotate 'line', 723
    find_lex $P2015, "$/"
    unless_null $P2015, vivify_605
    $P2015 = root_new ['parrot';'Hash']
  vivify_605:
    set $P2016, $P2015["EXPR"]
    unless_null $P2016, vivify_606
    new $P2016, "Undef"
  vivify_606:
    if $P2016, if_2014
.annotate 'line', 724
    get_hll_global $P2021, ["PAST"], "Op"
    find_lex $P2022, "$/"
    $P2023 = $P2021."new"("list" :named("pasttype"), $P2022 :named("node"))
    set $P2013, $P2023
.annotate 'line', 723
    goto if_2014_end
  if_2014:
    find_lex $P2017, "$/"
    unless_null $P2017, vivify_607
    $P2017 = root_new ['parrot';'Hash']
  vivify_607:
    set $P2018, $P2017["EXPR"]
    unless_null $P2018, vivify_608
    $P2018 = root_new ['parrot';'ResizablePMCArray']
  vivify_608:
    set $P2019, $P2018[0]
    unless_null $P2019, vivify_609
    new $P2019, "Undef"
  vivify_609:
    $P2020 = $P2019."ast"()
    set $P2013, $P2020
  if_2014_end:
    $P2024 = $P2012."!make"($P2013)
.annotate 'line', 721
    .return ($P2024)
  control_2009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2025, exception, "payload"
    .return ($P2025)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<[ ]>"  :subid("108_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2029
.annotate 'line', 727
    new $P2028, 'ExceptionHandler'
    set_addr $P2028, control_2027
    $P2028."handle_types"(.CONTROL_RETURN)
    push_eh $P2028
    .lex "self", self
    .lex "$/", param_2029
.annotate 'line', 728
    new $P2030, "Undef"
    .lex "$past", $P2030
.annotate 'line', 727
    find_lex $P2031, "$past"
.annotate 'line', 729
    find_lex $P2033, "$/"
    unless_null $P2033, vivify_610
    $P2033 = root_new ['parrot';'Hash']
  vivify_610:
    set $P2034, $P2033["EXPR"]
    unless_null $P2034, vivify_611
    new $P2034, "Undef"
  vivify_611:
    if $P2034, if_2032
.annotate 'line', 736
    get_hll_global $P2046, ["PAST"], "Op"
    $P2047 = $P2046."new"("list" :named("pasttype"))
    store_lex "$past", $P2047
.annotate 'line', 735
    goto if_2032_end
  if_2032:
.annotate 'line', 730
    find_lex $P2035, "$/"
    unless_null $P2035, vivify_612
    $P2035 = root_new ['parrot';'Hash']
  vivify_612:
    set $P2036, $P2035["EXPR"]
    unless_null $P2036, vivify_613
    $P2036 = root_new ['parrot';'ResizablePMCArray']
  vivify_613:
    set $P2037, $P2036[0]
    unless_null $P2037, vivify_614
    new $P2037, "Undef"
  vivify_614:
    $P2038 = $P2037."ast"()
    store_lex "$past", $P2038
.annotate 'line', 731
    find_lex $P2040, "$past"
    $S2041 = $P2040."name"()
    isne $I2042, $S2041, "&infix:<,>"
    unless $I2042, if_2039_end
.annotate 'line', 732
    get_hll_global $P2043, ["PAST"], "Op"
    find_lex $P2044, "$past"
    $P2045 = $P2043."new"($P2044, "list" :named("pasttype"))
    store_lex "$past", $P2045
  if_2039_end:
  if_2032_end:
.annotate 'line', 738
    find_lex $P2048, "$past"
    $P2048."name"("&circumfix:<[ ]>")
.annotate 'line', 739
    find_lex $P2049, "$/"
    find_lex $P2050, "$past"
    $P2051 = $P2049."!make"($P2050)
.annotate 'line', 727
    .return ($P2051)
  control_2027:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2052, exception, "payload"
    .return ($P2052)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<ang>"  :subid("109_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2056
.annotate 'line', 742
    new $P2055, 'ExceptionHandler'
    set_addr $P2055, control_2054
    $P2055."handle_types"(.CONTROL_RETURN)
    push_eh $P2055
    .lex "self", self
    .lex "$/", param_2056
    find_lex $P2057, "$/"
    find_lex $P2058, "$/"
    unless_null $P2058, vivify_615
    $P2058 = root_new ['parrot';'Hash']
  vivify_615:
    set $P2059, $P2058["quote_EXPR"]
    unless_null $P2059, vivify_616
    new $P2059, "Undef"
  vivify_616:
    $P2060 = $P2059."ast"()
    $P2061 = $P2057."!make"($P2060)
    .return ($P2061)
  control_2054:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2062, exception, "payload"
    .return ($P2062)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("110_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2066
.annotate 'line', 743
    new $P2065, 'ExceptionHandler'
    set_addr $P2065, control_2064
    $P2065."handle_types"(.CONTROL_RETURN)
    push_eh $P2065
    .lex "self", self
    .lex "$/", param_2066
    find_lex $P2067, "$/"
    find_lex $P2068, "$/"
    unless_null $P2068, vivify_617
    $P2068 = root_new ['parrot';'Hash']
  vivify_617:
    set $P2069, $P2068["quote_EXPR"]
    unless_null $P2069, vivify_618
    new $P2069, "Undef"
  vivify_618:
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
.include "except_types.pasm"
.sub "circumfix:sym<{ }>"  :subid("111_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2076
.annotate 'line', 745
    new $P2075, 'ExceptionHandler'
    set_addr $P2075, control_2074
    $P2075."handle_types"(.CONTROL_RETURN)
    push_eh $P2075
    .lex "self", self
    .lex "$/", param_2076
.annotate 'line', 746
    new $P2077, "Undef"
    .lex "$past", $P2077
    find_lex $P2080, "$/"
    unless_null $P2080, vivify_619
    $P2080 = root_new ['parrot';'Hash']
  vivify_619:
    set $P2081, $P2080["pblock"]
    unless_null $P2081, vivify_620
    $P2081 = root_new ['parrot';'Hash']
  vivify_620:
    set $P2082, $P2081["blockoid"]
    unless_null $P2082, vivify_621
    $P2082 = root_new ['parrot';'Hash']
  vivify_621:
    set $P2083, $P2082["statementlist"]
    unless_null $P2083, vivify_622
    $P2083 = root_new ['parrot';'Hash']
  vivify_622:
    set $P2084, $P2083["statement"]
    unless_null $P2084, vivify_623
    new $P2084, "Undef"
  vivify_623:
    set $N2085, $P2084
    isgt $I2086, $N2085, 0.0
    if $I2086, if_2079
.annotate 'line', 748
    $P2090 = "vivitype"("%")
    set $P2078, $P2090
.annotate 'line', 746
    goto if_2079_end
  if_2079:
.annotate 'line', 747
    find_lex $P2087, "$/"
    unless_null $P2087, vivify_624
    $P2087 = root_new ['parrot';'Hash']
  vivify_624:
    set $P2088, $P2087["pblock"]
    unless_null $P2088, vivify_625
    new $P2088, "Undef"
  vivify_625:
    $P2089 = $P2088."ast"()
    set $P2078, $P2089
  if_2079_end:
    store_lex "$past", $P2078
.annotate 'line', 749
    new $P2091, "Integer"
    assign $P2091, 1
    find_lex $P2092, "$past"
    unless_null $P2092, vivify_626
    $P2092 = root_new ['parrot';'Hash']
    store_lex "$past", $P2092
  vivify_626:
    set $P2092["bareblock"], $P2091
.annotate 'line', 750
    find_lex $P2093, "$/"
    find_lex $P2094, "$past"
    $P2095 = $P2093."!make"($P2094)
.annotate 'line', 745
    .return ($P2095)
  control_2074:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2096, exception, "payload"
    .return ($P2096)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<sigil>"  :subid("112_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2100
.annotate 'line', 753
    new $P2099, 'ExceptionHandler'
    set_addr $P2099, control_2098
    $P2099."handle_types"(.CONTROL_RETURN)
    push_eh $P2099
    .lex "self", self
    .lex "$/", param_2100
.annotate 'line', 754
    new $P2101, "Undef"
    .lex "$name", $P2101
    find_lex $P2104, "$/"
    unless_null $P2104, vivify_627
    $P2104 = root_new ['parrot';'Hash']
  vivify_627:
    set $P2105, $P2104["sigil"]
    unless_null $P2105, vivify_628
    new $P2105, "Undef"
  vivify_628:
    set $S2106, $P2105
    iseq $I2107, $S2106, "@"
    if $I2107, if_2103
.annotate 'line', 755
    find_lex $P2111, "$/"
    unless_null $P2111, vivify_629
    $P2111 = root_new ['parrot';'Hash']
  vivify_629:
    set $P2112, $P2111["sigil"]
    unless_null $P2112, vivify_630
    new $P2112, "Undef"
  vivify_630:
    set $S2113, $P2112
    iseq $I2114, $S2113, "%"
    if $I2114, if_2110
    new $P2116, "String"
    assign $P2116, "item"
    set $P2109, $P2116
    goto if_2110_end
  if_2110:
    new $P2115, "String"
    assign $P2115, "hash"
    set $P2109, $P2115
  if_2110_end:
    set $P2102, $P2109
.annotate 'line', 754
    goto if_2103_end
  if_2103:
    new $P2108, "String"
    assign $P2108, "list"
    set $P2102, $P2108
  if_2103_end:
    store_lex "$name", $P2102
.annotate 'line', 757
    find_lex $P2117, "$/"
    get_hll_global $P2118, ["PAST"], "Op"
    find_lex $P2119, "$name"
    find_lex $P2120, "$/"
    unless_null $P2120, vivify_631
    $P2120 = root_new ['parrot';'Hash']
  vivify_631:
    set $P2121, $P2120["semilist"]
    unless_null $P2121, vivify_632
    new $P2121, "Undef"
  vivify_632:
    $P2122 = $P2121."ast"()
    $P2123 = $P2118."new"($P2122, "callmethod" :named("pasttype"), $P2119 :named("name"))
    $P2124 = $P2117."!make"($P2123)
.annotate 'line', 753
    .return ($P2124)
  control_2098:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2125, exception, "payload"
    .return ($P2125)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "semilist"  :subid("113_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2129
.annotate 'line', 760
    new $P2128, 'ExceptionHandler'
    set_addr $P2128, control_2127
    $P2128."handle_types"(.CONTROL_RETURN)
    push_eh $P2128
    .lex "self", self
    .lex "$/", param_2129
    find_lex $P2130, "$/"
    find_lex $P2131, "$/"
    unless_null $P2131, vivify_633
    $P2131 = root_new ['parrot';'Hash']
  vivify_633:
    set $P2132, $P2131["statement"]
    unless_null $P2132, vivify_634
    new $P2132, "Undef"
  vivify_634:
    $P2133 = $P2132."ast"()
    $P2134 = $P2130."!make"($P2133)
    .return ($P2134)
  control_2127:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2135, exception, "payload"
    .return ($P2135)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<[ ]>"  :subid("114_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2139
.annotate 'line', 762
    new $P2138, 'ExceptionHandler'
    set_addr $P2138, control_2137
    $P2138."handle_types"(.CONTROL_RETURN)
    push_eh $P2138
    .lex "self", self
    .lex "$/", param_2139
.annotate 'line', 763
    find_lex $P2140, "$/"
    get_hll_global $P2141, ["PAST"], "Var"
    find_lex $P2142, "$/"
    unless_null $P2142, vivify_635
    $P2142 = root_new ['parrot';'Hash']
  vivify_635:
    set $P2143, $P2142["EXPR"]
    unless_null $P2143, vivify_636
    new $P2143, "Undef"
  vivify_636:
    $P2144 = $P2143."ast"()
.annotate 'line', 765
    $P2145 = "vivitype"("@")
    $P2146 = $P2141."new"($P2144, "keyed_int" :named("scope"), "Undef" :named("viviself"), $P2145 :named("vivibase"))
.annotate 'line', 763
    $P2147 = $P2140."!make"($P2146)
.annotate 'line', 762
    .return ($P2147)
  control_2137:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2148, exception, "payload"
    .return ($P2148)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<{ }>"  :subid("115_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2152
.annotate 'line', 768
    new $P2151, 'ExceptionHandler'
    set_addr $P2151, control_2150
    $P2151."handle_types"(.CONTROL_RETURN)
    push_eh $P2151
    .lex "self", self
    .lex "$/", param_2152
.annotate 'line', 769
    find_lex $P2153, "$/"
    get_hll_global $P2154, ["PAST"], "Var"
    find_lex $P2155, "$/"
    unless_null $P2155, vivify_637
    $P2155 = root_new ['parrot';'Hash']
  vivify_637:
    set $P2156, $P2155["EXPR"]
    unless_null $P2156, vivify_638
    new $P2156, "Undef"
  vivify_638:
    $P2157 = $P2156."ast"()
.annotate 'line', 771
    $P2158 = "vivitype"("%")
    $P2159 = $P2154."new"($P2157, "keyed" :named("scope"), "Undef" :named("viviself"), $P2158 :named("vivibase"))
.annotate 'line', 769
    $P2160 = $P2153."!make"($P2159)
.annotate 'line', 768
    .return ($P2160)
  control_2150:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2161, exception, "payload"
    .return ($P2161)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<ang>"  :subid("116_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2165
.annotate 'line', 774
    new $P2164, 'ExceptionHandler'
    set_addr $P2164, control_2163
    $P2164."handle_types"(.CONTROL_RETURN)
    push_eh $P2164
    .lex "self", self
    .lex "$/", param_2165
.annotate 'line', 775
    find_lex $P2166, "$/"
    get_hll_global $P2167, ["PAST"], "Var"
    find_lex $P2168, "$/"
    unless_null $P2168, vivify_639
    $P2168 = root_new ['parrot';'Hash']
  vivify_639:
    set $P2169, $P2168["quote_EXPR"]
    unless_null $P2169, vivify_640
    new $P2169, "Undef"
  vivify_640:
    $P2170 = $P2169."ast"()
.annotate 'line', 777
    $P2171 = "vivitype"("%")
    $P2172 = $P2167."new"($P2170, "keyed" :named("scope"), "Undef" :named("viviself"), $P2171 :named("vivibase"))
.annotate 'line', 775
    $P2173 = $P2166."!make"($P2172)
.annotate 'line', 774
    .return ($P2173)
  control_2163:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2174, exception, "payload"
    .return ($P2174)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<( )>"  :subid("117_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2178
.annotate 'line', 780
    new $P2177, 'ExceptionHandler'
    set_addr $P2177, control_2176
    $P2177."handle_types"(.CONTROL_RETURN)
    push_eh $P2177
    .lex "self", self
    .lex "$/", param_2178
.annotate 'line', 781
    find_lex $P2179, "$/"
    find_lex $P2180, "$/"
    unless_null $P2180, vivify_641
    $P2180 = root_new ['parrot';'Hash']
  vivify_641:
    set $P2181, $P2180["arglist"]
    unless_null $P2181, vivify_642
    new $P2181, "Undef"
  vivify_642:
    $P2182 = $P2181."ast"()
    $P2183 = $P2179."!make"($P2182)
.annotate 'line', 780
    .return ($P2183)
  control_2176:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2184, exception, "payload"
    .return ($P2184)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "value"  :subid("118_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2188
.annotate 'line', 784
    new $P2187, 'ExceptionHandler'
    set_addr $P2187, control_2186
    $P2187."handle_types"(.CONTROL_RETURN)
    push_eh $P2187
    .lex "self", self
    .lex "$/", param_2188
.annotate 'line', 785
    find_lex $P2189, "$/"
    find_lex $P2192, "$/"
    unless_null $P2192, vivify_643
    $P2192 = root_new ['parrot';'Hash']
  vivify_643:
    set $P2193, $P2192["quote"]
    unless_null $P2193, vivify_644
    new $P2193, "Undef"
  vivify_644:
    if $P2193, if_2191
    find_lex $P2197, "$/"
    unless_null $P2197, vivify_645
    $P2197 = root_new ['parrot';'Hash']
  vivify_645:
    set $P2198, $P2197["number"]
    unless_null $P2198, vivify_646
    new $P2198, "Undef"
  vivify_646:
    $P2199 = $P2198."ast"()
    set $P2190, $P2199
    goto if_2191_end
  if_2191:
    find_lex $P2194, "$/"
    unless_null $P2194, vivify_647
    $P2194 = root_new ['parrot';'Hash']
  vivify_647:
    set $P2195, $P2194["quote"]
    unless_null $P2195, vivify_648
    new $P2195, "Undef"
  vivify_648:
    $P2196 = $P2195."ast"()
    set $P2190, $P2196
  if_2191_end:
    $P2200 = $P2189."!make"($P2190)
.annotate 'line', 784
    .return ($P2200)
  control_2186:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2201, exception, "payload"
    .return ($P2201)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "number"  :subid("119_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2205
.annotate 'line', 788
    new $P2204, 'ExceptionHandler'
    set_addr $P2204, control_2203
    $P2204."handle_types"(.CONTROL_RETURN)
    push_eh $P2204
    .lex "self", self
    .lex "$/", param_2205
.annotate 'line', 789
    new $P2206, "Undef"
    .lex "$value", $P2206
    find_lex $P2209, "$/"
    unless_null $P2209, vivify_649
    $P2209 = root_new ['parrot';'Hash']
  vivify_649:
    set $P2210, $P2209["dec_number"]
    unless_null $P2210, vivify_650
    new $P2210, "Undef"
  vivify_650:
    if $P2210, if_2208
    find_lex $P2214, "$/"
    unless_null $P2214, vivify_651
    $P2214 = root_new ['parrot';'Hash']
  vivify_651:
    set $P2215, $P2214["integer"]
    unless_null $P2215, vivify_652
    new $P2215, "Undef"
  vivify_652:
    $P2216 = $P2215."ast"()
    set $P2207, $P2216
    goto if_2208_end
  if_2208:
    find_lex $P2211, "$/"
    unless_null $P2211, vivify_653
    $P2211 = root_new ['parrot';'Hash']
  vivify_653:
    set $P2212, $P2211["dec_number"]
    unless_null $P2212, vivify_654
    new $P2212, "Undef"
  vivify_654:
    $P2213 = $P2212."ast"()
    set $P2207, $P2213
  if_2208_end:
    store_lex "$value", $P2207
.annotate 'line', 790
    find_lex $P2218, "$/"
    unless_null $P2218, vivify_655
    $P2218 = root_new ['parrot';'Hash']
  vivify_655:
    set $P2219, $P2218["sign"]
    unless_null $P2219, vivify_656
    new $P2219, "Undef"
  vivify_656:
    set $S2220, $P2219
    iseq $I2221, $S2220, "-"
    unless $I2221, if_2217_end
    find_lex $P2222, "$value"
    neg $P2223, $P2222
    store_lex "$value", $P2223
  if_2217_end:
.annotate 'line', 791
    find_lex $P2224, "$/"
    get_hll_global $P2225, ["PAST"], "Val"
    find_lex $P2226, "$value"
    $P2227 = $P2225."new"($P2226 :named("value"))
    $P2228 = $P2224."!make"($P2227)
.annotate 'line', 788
    .return ($P2228)
  control_2203:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2229, exception, "payload"
    .return ($P2229)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<apos>"  :subid("120_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2233
.annotate 'line', 794
    new $P2232, 'ExceptionHandler'
    set_addr $P2232, control_2231
    $P2232."handle_types"(.CONTROL_RETURN)
    push_eh $P2232
    .lex "self", self
    .lex "$/", param_2233
    find_lex $P2234, "$/"
    find_lex $P2235, "$/"
    unless_null $P2235, vivify_657
    $P2235 = root_new ['parrot';'Hash']
  vivify_657:
    set $P2236, $P2235["quote_EXPR"]
    unless_null $P2236, vivify_658
    new $P2236, "Undef"
  vivify_658:
    $P2237 = $P2236."ast"()
    $P2238 = $P2234."!make"($P2237)
    .return ($P2238)
  control_2231:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2239, exception, "payload"
    .return ($P2239)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<dblq>"  :subid("121_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2243
.annotate 'line', 795
    new $P2242, 'ExceptionHandler'
    set_addr $P2242, control_2241
    $P2242."handle_types"(.CONTROL_RETURN)
    push_eh $P2242
    .lex "self", self
    .lex "$/", param_2243
    find_lex $P2244, "$/"
    find_lex $P2245, "$/"
    unless_null $P2245, vivify_659
    $P2245 = root_new ['parrot';'Hash']
  vivify_659:
    set $P2246, $P2245["quote_EXPR"]
    unless_null $P2246, vivify_660
    new $P2246, "Undef"
  vivify_660:
    $P2247 = $P2246."ast"()
    $P2248 = $P2244."!make"($P2247)
    .return ($P2248)
  control_2241:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2249, exception, "payload"
    .return ($P2249)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<qq>"  :subid("122_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2253
.annotate 'line', 796
    new $P2252, 'ExceptionHandler'
    set_addr $P2252, control_2251
    $P2252."handle_types"(.CONTROL_RETURN)
    push_eh $P2252
    .lex "self", self
    .lex "$/", param_2253
    find_lex $P2254, "$/"
    find_lex $P2255, "$/"
    unless_null $P2255, vivify_661
    $P2255 = root_new ['parrot';'Hash']
  vivify_661:
    set $P2256, $P2255["quote_EXPR"]
    unless_null $P2256, vivify_662
    new $P2256, "Undef"
  vivify_662:
    $P2257 = $P2256."ast"()
    $P2258 = $P2254."!make"($P2257)
    .return ($P2258)
  control_2251:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2259, exception, "payload"
    .return ($P2259)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<q>"  :subid("123_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2263
.annotate 'line', 797
    new $P2262, 'ExceptionHandler'
    set_addr $P2262, control_2261
    $P2262."handle_types"(.CONTROL_RETURN)
    push_eh $P2262
    .lex "self", self
    .lex "$/", param_2263
    find_lex $P2264, "$/"
    find_lex $P2265, "$/"
    unless_null $P2265, vivify_663
    $P2265 = root_new ['parrot';'Hash']
  vivify_663:
    set $P2266, $P2265["quote_EXPR"]
    unless_null $P2266, vivify_664
    new $P2266, "Undef"
  vivify_664:
    $P2267 = $P2266."ast"()
    $P2268 = $P2264."!make"($P2267)
    .return ($P2268)
  control_2261:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2269, exception, "payload"
    .return ($P2269)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<Q>"  :subid("124_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2273
.annotate 'line', 798
    new $P2272, 'ExceptionHandler'
    set_addr $P2272, control_2271
    $P2272."handle_types"(.CONTROL_RETURN)
    push_eh $P2272
    .lex "self", self
    .lex "$/", param_2273
    find_lex $P2274, "$/"
    find_lex $P2275, "$/"
    unless_null $P2275, vivify_665
    $P2275 = root_new ['parrot';'Hash']
  vivify_665:
    set $P2276, $P2275["quote_EXPR"]
    unless_null $P2276, vivify_666
    new $P2276, "Undef"
  vivify_666:
    $P2277 = $P2276."ast"()
    $P2278 = $P2274."!make"($P2277)
    .return ($P2278)
  control_2271:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2279, exception, "payload"
    .return ($P2279)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<Q:PIR>"  :subid("125_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2283
.annotate 'line', 799
    new $P2282, 'ExceptionHandler'
    set_addr $P2282, control_2281
    $P2282."handle_types"(.CONTROL_RETURN)
    push_eh $P2282
    .lex "self", self
    .lex "$/", param_2283
.annotate 'line', 800
    find_lex $P2284, "$/"
    get_hll_global $P2285, ["PAST"], "Op"
    find_lex $P2286, "$/"
    unless_null $P2286, vivify_667
    $P2286 = root_new ['parrot';'Hash']
  vivify_667:
    set $P2287, $P2286["quote_EXPR"]
    unless_null $P2287, vivify_668
    new $P2287, "Undef"
  vivify_668:
    $P2288 = $P2287."ast"()
    $P2289 = $P2288."value"()
    find_lex $P2290, "$/"
    $P2291 = $P2285."new"($P2289 :named("inline"), "inline" :named("pasttype"), $P2290 :named("node"))
    $P2292 = $P2284."!make"($P2291)
.annotate 'line', 799
    .return ($P2292)
  control_2281:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2293, exception, "payload"
    .return ($P2293)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym</ />"  :subid("126_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2297
    .param pmc param_2298 :optional
    .param int has_param_2298 :opt_flag
.annotate 'line', 805
    new $P2296, 'ExceptionHandler'
    set_addr $P2296, control_2295
    $P2296."handle_types"(.CONTROL_RETURN)
    push_eh $P2296
    .lex "self", self
    .lex "$/", param_2297
    if has_param_2298, optparam_669
    new $P2299, "Undef"
    set param_2298, $P2299
  optparam_669:
    .lex "$key", param_2298
.annotate 'line', 815
    new $P2300, "Undef"
    .lex "$regex", $P2300
.annotate 'line', 817
    new $P2301, "Undef"
    .lex "$past", $P2301
.annotate 'line', 806
    find_lex $P2303, "$key"
    set $S2304, $P2303
    iseq $I2305, $S2304, "open"
    unless $I2305, if_2302_end
.annotate 'line', 807

            null $P0
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate 'line', 811
    get_global $P2306, "@BLOCK"
    unless_null $P2306, vivify_670
    $P2306 = root_new ['parrot';'ResizablePMCArray']
  vivify_670:
    set $P2307, $P2306[0]
    unless_null $P2307, vivify_671
    new $P2307, "Undef"
  vivify_671:
    $P2307."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate 'line', 812
    get_global $P2308, "@BLOCK"
    unless_null $P2308, vivify_672
    $P2308 = root_new ['parrot';'ResizablePMCArray']
  vivify_672:
    set $P2309, $P2308[0]
    unless_null $P2309, vivify_673
    new $P2309, "Undef"
  vivify_673:
    $P2309."symbol"("$/", "lexical" :named("scope"))
.annotate 'line', 813
    new $P2310, "Exception"
    set $P2310['type'], .CONTROL_RETURN
    new $P2311, "Integer"
    assign $P2311, 0
    setattribute $P2310, 'payload', $P2311
    throw $P2310
  if_2302_end:
.annotate 'line', 816
    get_hll_global $P2312, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P2313, "$/"
    unless_null $P2313, vivify_674
    $P2313 = root_new ['parrot';'Hash']
  vivify_674:
    set $P2314, $P2313["p6regex"]
    unless_null $P2314, vivify_675
    new $P2314, "Undef"
  vivify_675:
    $P2315 = $P2314."ast"()
    get_global $P2316, "@BLOCK"
    $P2317 = $P2316."shift"()
    $P2318 = $P2312($P2315, $P2317)
    store_lex "$regex", $P2318
.annotate 'line', 818
    get_hll_global $P2319, ["PAST"], "Op"
.annotate 'line', 820
    get_hll_global $P2320, ["PAST"], "Var"
    new $P2321, "ResizablePMCArray"
    push $P2321, "Regex"
    $P2322 = $P2320."new"("Regex" :named("name"), $P2321 :named("namespace"), "package" :named("scope"))
    find_lex $P2323, "$regex"
    $P2324 = $P2319."new"($P2322, $P2323, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate 'line', 818
    store_lex "$past", $P2324
.annotate 'line', 824
    find_lex $P2325, "$regex"
    find_lex $P2326, "$past"
    unless_null $P2326, vivify_676
    $P2326 = root_new ['parrot';'Hash']
    store_lex "$past", $P2326
  vivify_676:
    set $P2326["sink"], $P2325
.annotate 'line', 825
    find_lex $P2327, "$/"
    find_lex $P2328, "$past"
    $P2329 = $P2327."!make"($P2328)
.annotate 'line', 805
    .return ($P2329)
  control_2295:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2330, exception, "payload"
    .return ($P2330)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<$>"  :subid("127_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2334
.annotate 'line', 828
    new $P2333, 'ExceptionHandler'
    set_addr $P2333, control_2332
    $P2333."handle_types"(.CONTROL_RETURN)
    push_eh $P2333
    .lex "self", self
    .lex "$/", param_2334
    find_lex $P2335, "$/"
    find_lex $P2336, "$/"
    unless_null $P2336, vivify_677
    $P2336 = root_new ['parrot';'Hash']
  vivify_677:
    set $P2337, $P2336["variable"]
    unless_null $P2337, vivify_678
    new $P2337, "Undef"
  vivify_678:
    $P2338 = $P2337."ast"()
    $P2339 = $P2335."!make"($P2338)
    .return ($P2339)
  control_2332:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2340, exception, "payload"
    .return ($P2340)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<{ }>"  :subid("128_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2344
.annotate 'line', 829
    new $P2343, 'ExceptionHandler'
    set_addr $P2343, control_2342
    $P2343."handle_types"(.CONTROL_RETURN)
    push_eh $P2343
    .lex "self", self
    .lex "$/", param_2344
.annotate 'line', 830
    find_lex $P2345, "$/"
    get_hll_global $P2346, ["PAST"], "Op"
.annotate 'line', 831
    find_lex $P2347, "$/"
    unless_null $P2347, vivify_679
    $P2347 = root_new ['parrot';'Hash']
  vivify_679:
    set $P2348, $P2347["block"]
    unless_null $P2348, vivify_680
    new $P2348, "Undef"
  vivify_680:
    $P2349 = $P2348."ast"()
    $P2350 = "block_immediate"($P2349)
    find_lex $P2351, "$/"
    $P2352 = $P2346."new"($P2350, "set S*" :named("pirop"), $P2351 :named("node"))
.annotate 'line', 830
    $P2353 = $P2345."!make"($P2352)
.annotate 'line', 829
    .return ($P2353)
  control_2342:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2354, exception, "payload"
    .return ($P2354)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<esc>"  :subid("129_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2358
.annotate 'line', 834
    new $P2357, 'ExceptionHandler'
    set_addr $P2357, control_2356
    $P2357."handle_types"(.CONTROL_RETURN)
    push_eh $P2357
    .lex "self", self
    .lex "$/", param_2358
    find_lex $P2359, "$/"
    $P2360 = $P2359."!make"("\e")
    .return ($P2360)
  control_2356:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2361, exception, "payload"
    .return ($P2361)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postfix:sym<.>"  :subid("130_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2365
.annotate 'line', 838
    new $P2364, 'ExceptionHandler'
    set_addr $P2364, control_2363
    $P2364."handle_types"(.CONTROL_RETURN)
    push_eh $P2364
    .lex "self", self
    .lex "$/", param_2365
    find_lex $P2366, "$/"
    find_lex $P2367, "$/"
    unless_null $P2367, vivify_681
    $P2367 = root_new ['parrot';'Hash']
  vivify_681:
    set $P2368, $P2367["dotty"]
    unless_null $P2368, vivify_682
    new $P2368, "Undef"
  vivify_682:
    $P2369 = $P2368."ast"()
    $P2370 = $P2366."!make"($P2369)
    .return ($P2370)
  control_2363:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2371, exception, "payload"
    .return ($P2371)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postfix:sym<++>"  :subid("131_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2375
.annotate 'line', 840
    new $P2374, 'ExceptionHandler'
    set_addr $P2374, control_2373
    $P2374."handle_types"(.CONTROL_RETURN)
    push_eh $P2374
    .lex "self", self
    .lex "$/", param_2375
.annotate 'line', 841
    find_lex $P2376, "$/"
    get_hll_global $P2377, ["PAST"], "Op"
.annotate 'line', 842
    new $P2378, "ResizablePMCArray"
    push $P2378, "    clone %r, %0"
    push $P2378, "    inc %0"
    $P2379 = $P2377."new"("postfix:<++>" :named("name"), $P2378 :named("inline"), "inline" :named("pasttype"))
.annotate 'line', 841
    $P2380 = $P2376."!make"($P2379)
.annotate 'line', 840
    .return ($P2380)
  control_2373:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2381, exception, "payload"
    .return ($P2381)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postfix:sym<-->"  :subid("132_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2385
.annotate 'line', 846
    new $P2384, 'ExceptionHandler'
    set_addr $P2384, control_2383
    $P2384."handle_types"(.CONTROL_RETURN)
    push_eh $P2384
    .lex "self", self
    .lex "$/", param_2385
.annotate 'line', 847
    find_lex $P2386, "$/"
    get_hll_global $P2387, ["PAST"], "Op"
.annotate 'line', 848
    new $P2388, "ResizablePMCArray"
    push $P2388, "    clone %r, %0"
    push $P2388, "    dec %0"
    $P2389 = $P2387."new"("postfix:<-->" :named("name"), $P2388 :named("inline"), "inline" :named("pasttype"))
.annotate 'line', 847
    $P2390 = $P2386."!make"($P2389)
.annotate 'line', 846
    .return ($P2390)
  control_2383:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2391, exception, "payload"
    .return ($P2391)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "prefix:sym<make>"  :subid("133_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2395
.annotate 'line', 852
    new $P2394, 'ExceptionHandler'
    set_addr $P2394, control_2393
    $P2394."handle_types"(.CONTROL_RETURN)
    push_eh $P2394
    .lex "self", self
    .lex "$/", param_2395
.annotate 'line', 853
    find_lex $P2396, "$/"
    get_hll_global $P2397, ["PAST"], "Op"
.annotate 'line', 854
    get_hll_global $P2398, ["PAST"], "Var"
    $P2399 = $P2398."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P2400, "$/"
    $P2401 = $P2397."new"($P2399, "callmethod" :named("pasttype"), "!make" :named("name"), $P2400 :named("node"))
.annotate 'line', 853
    $P2402 = $P2396."!make"($P2401)
.annotate 'line', 852
    .return ($P2402)
  control_2393:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2403, exception, "payload"
    .return ($P2403)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<next>"  :subid("134_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2408
.annotate 'line', 870
    new $P2407, 'ExceptionHandler'
    set_addr $P2407, control_2406
    $P2407."handle_types"(.CONTROL_RETURN)
    push_eh $P2407
    .lex "self", self
    .lex "$/", param_2408
    find_lex $P2409, "$/"
    $P2410 = "control"($P2409, "CONTROL_LOOP_NEXT")
    .return ($P2410)
  control_2406:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2411, exception, "payload"
    .return ($P2411)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<last>"  :subid("135_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2415
.annotate 'line', 871
    new $P2414, 'ExceptionHandler'
    set_addr $P2414, control_2413
    $P2414."handle_types"(.CONTROL_RETURN)
    push_eh $P2414
    .lex "self", self
    .lex "$/", param_2415
    find_lex $P2416, "$/"
    $P2417 = "control"($P2416, "CONTROL_LOOP_LAST")
    .return ($P2417)
  control_2413:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2418, exception, "payload"
    .return ($P2418)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<redo>"  :subid("136_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2422
.annotate 'line', 872
    new $P2421, 'ExceptionHandler'
    set_addr $P2421, control_2420
    $P2421."handle_types"(.CONTROL_RETURN)
    push_eh $P2421
    .lex "self", self
    .lex "$/", param_2422
    find_lex $P2423, "$/"
    $P2424 = "control"($P2423, "CONTROL_LOOP_REDO")
    .return ($P2424)
  control_2420:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2425, exception, "payload"
    .return ($P2425)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "infix:sym<~~>"  :subid("137_1284728484.24945") :method :outer("11_1284728484.24945")
    .param pmc param_2429
.annotate 'line', 874
    new $P2428, 'ExceptionHandler'
    set_addr $P2428, control_2427
    $P2428."handle_types"(.CONTROL_RETURN)
    push_eh $P2428
    .lex "self", self
    .lex "$/", param_2429
.annotate 'line', 875
    find_lex $P2430, "$/"
    get_hll_global $P2431, ["PAST"], "Op"
    find_lex $P2432, "$/"
    $P2433 = $P2431."new"("callmethod" :named("pasttype"), "ACCEPTS" :named("name"), $P2432 :named("node"))
    $P2434 = $P2430."!make"($P2433)
.annotate 'line', 874
    .return ($P2434)
  control_2427:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2435, exception, "payload"
    .return ($P2435)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block2436"  :subid("138_1284728484.24945") :outer("11_1284728484.24945")
.annotate 'line', 879
    .const 'Sub' $P2522 = "145_1284728484.24945" 
    capture_lex $P2522
    .const 'Sub' $P2509 = "144_1284728484.24945" 
    capture_lex $P2509
    .const 'Sub' $P2492 = "143_1284728484.24945" 
    capture_lex $P2492
    .const 'Sub' $P2479 = "142_1284728484.24945" 
    capture_lex $P2479
    .const 'Sub' $P2466 = "141_1284728484.24945" 
    capture_lex $P2466
    .const 'Sub' $P2453 = "140_1284728484.24945" 
    capture_lex $P2453
    .const 'Sub' $P2438 = "139_1284728484.24945" 
    capture_lex $P2438
.annotate 'line', 913
    .const 'Sub' $P2522 = "145_1284728484.24945" 
    newclosure $P2547, $P2522
.annotate 'line', 879
    .return ($P2547)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "metachar:sym<:my>"  :subid("139_1284728484.24945") :method :outer("138_1284728484.24945")
    .param pmc param_2441
.annotate 'line', 881
    new $P2440, 'ExceptionHandler'
    set_addr $P2440, control_2439
    $P2440."handle_types"(.CONTROL_RETURN)
    push_eh $P2440
    .lex "self", self
    .lex "$/", param_2441
.annotate 'line', 882
    new $P2442, "Undef"
    .lex "$past", $P2442
    find_lex $P2443, "$/"
    unless_null $P2443, vivify_683
    $P2443 = root_new ['parrot';'Hash']
  vivify_683:
    set $P2444, $P2443["statement"]
    unless_null $P2444, vivify_684
    new $P2444, "Undef"
  vivify_684:
    $P2445 = $P2444."ast"()
    store_lex "$past", $P2445
.annotate 'line', 883
    find_lex $P2446, "$/"
    get_hll_global $P2447, ["PAST"], "Regex"
    find_lex $P2448, "$past"
    find_lex $P2449, "$/"
    $P2450 = $P2447."new"($P2448, "pastnode" :named("pasttype"), "declarative" :named("subtype"), $P2449 :named("node"))
    $P2451 = $P2446."!make"($P2450)
.annotate 'line', 881
    .return ($P2451)
  control_2439:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2452, exception, "payload"
    .return ($P2452)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "metachar:sym<{ }>"  :subid("140_1284728484.24945") :method :outer("138_1284728484.24945")
    .param pmc param_2456
.annotate 'line', 887
    new $P2455, 'ExceptionHandler'
    set_addr $P2455, control_2454
    $P2455."handle_types"(.CONTROL_RETURN)
    push_eh $P2455
    .lex "self", self
    .lex "$/", param_2456
.annotate 'line', 888
    find_lex $P2457, "$/"
    get_hll_global $P2458, ["PAST"], "Regex"
    find_lex $P2459, "$/"
    unless_null $P2459, vivify_685
    $P2459 = root_new ['parrot';'Hash']
  vivify_685:
    set $P2460, $P2459["codeblock"]
    unless_null $P2460, vivify_686
    new $P2460, "Undef"
  vivify_686:
    $P2461 = $P2460."ast"()
    find_lex $P2462, "$/"
    $P2463 = $P2458."new"($P2461, "pastnode" :named("pasttype"), $P2462 :named("node"))
    $P2464 = $P2457."!make"($P2463)
.annotate 'line', 887
    .return ($P2464)
  control_2454:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2465, exception, "payload"
    .return ($P2465)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "metachar:sym<nqpvar>"  :subid("141_1284728484.24945") :method :outer("138_1284728484.24945")
    .param pmc param_2469
.annotate 'line', 892
    new $P2468, 'ExceptionHandler'
    set_addr $P2468, control_2467
    $P2468."handle_types"(.CONTROL_RETURN)
    push_eh $P2468
    .lex "self", self
    .lex "$/", param_2469
.annotate 'line', 893
    find_lex $P2470, "$/"
    get_hll_global $P2471, ["PAST"], "Regex"
    find_lex $P2472, "$/"
    unless_null $P2472, vivify_687
    $P2472 = root_new ['parrot';'Hash']
  vivify_687:
    set $P2473, $P2472["var"]
    unless_null $P2473, vivify_688
    new $P2473, "Undef"
  vivify_688:
    $P2474 = $P2473."ast"()
    find_lex $P2475, "$/"
    $P2476 = $P2471."new"("!INTERPOLATE", $P2474, "subrule" :named("pasttype"), "method" :named("subtype"), $P2475 :named("node"))
    $P2477 = $P2470."!make"($P2476)
.annotate 'line', 892
    .return ($P2477)
  control_2467:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2478, exception, "payload"
    .return ($P2478)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "assertion:sym<{ }>"  :subid("142_1284728484.24945") :method :outer("138_1284728484.24945")
    .param pmc param_2482
.annotate 'line', 897
    new $P2481, 'ExceptionHandler'
    set_addr $P2481, control_2480
    $P2481."handle_types"(.CONTROL_RETURN)
    push_eh $P2481
    .lex "self", self
    .lex "$/", param_2482
.annotate 'line', 898
    find_lex $P2483, "$/"
    get_hll_global $P2484, ["PAST"], "Regex"
    find_lex $P2485, "$/"
    unless_null $P2485, vivify_689
    $P2485 = root_new ['parrot';'Hash']
  vivify_689:
    set $P2486, $P2485["codeblock"]
    unless_null $P2486, vivify_690
    new $P2486, "Undef"
  vivify_690:
    $P2487 = $P2486."ast"()
    find_lex $P2488, "$/"
    $P2489 = $P2484."new"("!INTERPOLATE_REGEX", $P2487, "subrule" :named("pasttype"), "method" :named("subtype"), $P2488 :named("node"))
    $P2490 = $P2483."!make"($P2489)
.annotate 'line', 897
    .return ($P2490)
  control_2480:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2491, exception, "payload"
    .return ($P2491)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "assertion:sym<?{ }>"  :subid("143_1284728484.24945") :method :outer("138_1284728484.24945")
    .param pmc param_2495
.annotate 'line', 902
    new $P2494, 'ExceptionHandler'
    set_addr $P2494, control_2493
    $P2494."handle_types"(.CONTROL_RETURN)
    push_eh $P2494
    .lex "self", self
    .lex "$/", param_2495
.annotate 'line', 903
    find_lex $P2496, "$/"
    get_hll_global $P2497, ["PAST"], "Regex"
    find_lex $P2498, "$/"
    unless_null $P2498, vivify_691
    $P2498 = root_new ['parrot';'Hash']
  vivify_691:
    set $P2499, $P2498["codeblock"]
    unless_null $P2499, vivify_692
    new $P2499, "Undef"
  vivify_692:
    $P2500 = $P2499."ast"()
.annotate 'line', 904
    find_lex $P2501, "$/"
    unless_null $P2501, vivify_693
    $P2501 = root_new ['parrot';'Hash']
  vivify_693:
    set $P2502, $P2501["zw"]
    unless_null $P2502, vivify_694
    new $P2502, "Undef"
  vivify_694:
    set $S2503, $P2502
    iseq $I2504, $S2503, "!"
    find_lex $P2505, "$/"
    $P2506 = $P2497."new"($P2500, "zerowidth" :named("subtype"), $I2504 :named("negate"), "pastnode" :named("pasttype"), $P2505 :named("node"))
.annotate 'line', 903
    $P2507 = $P2496."!make"($P2506)
.annotate 'line', 902
    .return ($P2507)
  control_2493:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2508, exception, "payload"
    .return ($P2508)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "assertion:sym<var>"  :subid("144_1284728484.24945") :method :outer("138_1284728484.24945")
    .param pmc param_2512
.annotate 'line', 908
    new $P2511, 'ExceptionHandler'
    set_addr $P2511, control_2510
    $P2511."handle_types"(.CONTROL_RETURN)
    push_eh $P2511
    .lex "self", self
    .lex "$/", param_2512
.annotate 'line', 909
    find_lex $P2513, "$/"
    get_hll_global $P2514, ["PAST"], "Regex"
    find_lex $P2515, "$/"
    unless_null $P2515, vivify_695
    $P2515 = root_new ['parrot';'Hash']
  vivify_695:
    set $P2516, $P2515["var"]
    unless_null $P2516, vivify_696
    new $P2516, "Undef"
  vivify_696:
    $P2517 = $P2516."ast"()
    find_lex $P2518, "$/"
    $P2519 = $P2514."new"("!INTERPOLATE_REGEX", $P2517, "subrule" :named("pasttype"), "method" :named("subtype"), $P2518 :named("node"))
    $P2520 = $P2513."!make"($P2519)
.annotate 'line', 908
    .return ($P2520)
  control_2510:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2521, exception, "payload"
    .return ($P2521)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "codeblock"  :subid("145_1284728484.24945") :method :outer("138_1284728484.24945")
    .param pmc param_2525
.annotate 'line', 913
    new $P2524, 'ExceptionHandler'
    set_addr $P2524, control_2523
    $P2524."handle_types"(.CONTROL_RETURN)
    push_eh $P2524
    .lex "self", self
    .lex "$/", param_2525
.annotate 'line', 914
    new $P2526, "Undef"
    .lex "$block", $P2526
.annotate 'line', 916
    new $P2527, "Undef"
    .lex "$past", $P2527
.annotate 'line', 914
    find_lex $P2528, "$/"
    unless_null $P2528, vivify_697
    $P2528 = root_new ['parrot';'Hash']
  vivify_697:
    set $P2529, $P2528["block"]
    unless_null $P2529, vivify_698
    new $P2529, "Undef"
  vivify_698:
    $P2530 = $P2529."ast"()
    store_lex "$block", $P2530
.annotate 'line', 915
    find_lex $P2531, "$block"
    $P2531."blocktype"("immediate")
.annotate 'line', 917
    get_hll_global $P2532, ["PAST"], "Stmts"
.annotate 'line', 918
    get_hll_global $P2533, ["PAST"], "Op"
.annotate 'line', 919
    get_hll_global $P2534, ["PAST"], "Var"
    $P2535 = $P2534."new"("$/" :named("name"))
.annotate 'line', 920
    get_hll_global $P2536, ["PAST"], "Op"
.annotate 'line', 921
    get_hll_global $P2537, ["PAST"], "Var"
    $P2538 = $P2537."new"(unicode:"$\x{a2}" :named("name"))
    $P2539 = $P2536."new"($P2538, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 920
    $P2540 = $P2533."new"($P2535, $P2539, "bind" :named("pasttype"))
.annotate 'line', 918
    find_lex $P2541, "$block"
    $P2542 = $P2532."new"($P2540, $P2541)
.annotate 'line', 917
    store_lex "$past", $P2542
.annotate 'line', 929
    find_lex $P2543, "$/"
    find_lex $P2544, "$past"
    $P2545 = $P2543."!make"($P2544)
.annotate 'line', 913
    .return ($P2545)
  control_2523:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2546, exception, "payload"
    .return ($P2546)
.end


.namespace ["NQP";"Actions"]
.sub "_block2549" :load :anon :subid("146_1284728484.24945")
.annotate 'line', 3
    .const 'Sub' $P2551 = "11_1284728484.24945" 
    $P2552 = $P2551()
    .return ($P2552)
.end


.namespace []
.sub "_block2559" :load :anon :subid("148_1284728484.24945")
.annotate 'line', 1
    .const 'Sub' $P2561 = "10_1284728484.24945" 
    $P2562 = $P2561()
    .return ($P2562)
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
